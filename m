Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056304CCAEB
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 01:47:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B21F18EC;
	Fri,  4 Mar 2022 01:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B21F18EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646354825;
	bh=ekPKyag5s4QlryZoQYHVV61iChFU24mQQPzWP7R3uw0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n6zzT1waSNjdOXrel+8jq0EIk5b7lmfOM2eMR+y7Wv3HBowgPmkfags+EJN+jY3IM
	 wH4bC8Xmyfc/yUr9HT4hgi2St8G/llDGVP58Qsb4qqZrV/SBC4h2f3u0gdau940TEW
	 u9rNKEDV21v6ZsxJbFHurqxmM7ePGJg/JoyaRfS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFD6F80166;
	Fri,  4 Mar 2022 01:45:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9041F80152; Fri,  4 Mar 2022 01:45:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DE2DF8013D
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 01:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DE2DF8013D
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=9; SR=0; TI=SMTPD_---0V69clCD_1646354745; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V69clCD_1646354745) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 04 Mar 2022 08:45:45 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: broonie@kernel.org
Subject: [PATCH -next v2] ASoC: amd: Fix an ignored error return from
 platform_get_irq_byname()
Date: Fri,  4 Mar 2022 08:45:43 +0800
Message-Id: <20220304004543.11797-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tangmeng@uniontech.com,
 Abaci Robot <abaci@linux.alibaba.com>, tiwai@suse.com, lgirdwood@gmail.com,
 Yang Li <yang.lee@linux.alibaba.com>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The return from the call to platform_get_irq_byname() is int, it can be
a negative error code, however this is being assigned to an unsigned
int variable 'adata->i2s_irq', so assign the value to 'ret' concurrently
to solve this problem without affecting other functions.

Eliminate the following coccicheck warning:
./sound/soc/amd/acp/acp-renoir.c:286:5-19: WARNING: Unsigned expression
compared with zero: adata -> i2s_irq < 0

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 3304a242f45a ("ASoC: amd: Use platform_get_irq_byname() to get the interrupt")
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---

--Changes in v2:
Report the error code is being returned rather than squashing it down to -ENODEV.

 sound/soc/amd/acp/acp-renoir.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 738cf2e2b973..21e5c9744784 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -282,9 +282,9 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	if (!adata->acp_base)
 		return -ENOMEM;
 
-	adata->i2s_irq = platform_get_irq_byname(pdev, "acp_dai_irq");
-	if (adata->i2s_irq < 0)
-		return -ENODEV;
+	adata->i2s_irq = ret = platform_get_irq_byname(pdev, "acp_dai_irq");
+	if (ret < 0)
+		return ret;
 
 	adata->dev = dev;
 	adata->dai_driver = acp_renoir_dai;
-- 
2.20.1.7.g153144c


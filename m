Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 004854C20DE
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 02:12:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F5D218CF;
	Thu, 24 Feb 2022 02:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F5D218CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645665127;
	bh=3Z3mVM18M6JOrmfqdQj3m+YNidxucnp6BgFG6TwNLdI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lHjCbLGDJnuwDSGxs/Tlq1uP0XA6GSXmasuPFV4w0Ry6bnVzsvNRPHU8bCnvNB0PI
	 xJvxsVhSv6FErspHzGezXJd/JliIbWjTqy/1omFvshodyTe52YuWbrShXYHUInWkXs
	 gmkGb7HHWwEH1brnJVSTLpqRt3qU8zY5UnUiFy7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB37F800B6;
	Thu, 24 Feb 2022 02:11:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1C48F80237; Thu, 24 Feb 2022 02:10:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF785F80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 02:10:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF785F80118
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=11; SR=0; TI=SMTPD_---0V5LP5GJ_1645665047; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V5LP5GJ_1645665047) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 24 Feb 2022 09:10:48 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: matthias.bgg@gmail.com
Subject: [PATCH -next] ASoC: mediatek: mt8195: Remove unnecessary print
 function dev_err()
Date: Thu, 24 Feb 2022 09:10:46 +0800
Message-Id: <20220224011046.76904-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 Yang Li <yang.lee@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org
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

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

Eliminate the follow coccicheck warning:
./sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:3126:2-9: line 3126 is
redundant because platform_get_irq() already prints an error

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index b77c2ba5a629..550636500949 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3122,10 +3122,8 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id < 0) {
-		dev_err(dev, "%s no irq found\n", dev->of_node->name);
+	if (irq_id < 0)
 		return -ENXIO;
-	}
 
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.20.1.7.g153144c


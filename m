Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E93074B7D0C
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 03:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C15174D;
	Wed, 16 Feb 2022 03:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C15174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644977555;
	bh=3mW+K2DoVM3p73yamKYhLBRUF5y2Wz/jULL9EmpcsUY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LG3lTCJ0NT6AWvJSkjze3JnvFqUg96C9mllseDhsvtb86KwZ2LUZ8DmIJsKm6wnXf
	 1vnAbMDMCTItz8cRXsh4Ccja1DhAuHtnf0r2r5MXKzj9ELPR5O1OMaM4y/e/OsOiU2
	 nuypZtywu0/KQvz9FfQCfG0VeA5PpQ4tTi3vsSp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A082F80159;
	Wed, 16 Feb 2022 03:11:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EF48F80132; Wed, 16 Feb 2022 03:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out199-11.us.a.mail.aliyun.com (out199-11.us.a.mail.aliyun.com
 [47.90.199.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CFEBF800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 03:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CFEBF800C0
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=9; SR=0; TI=SMTPD_---0V4b3tCJ_1644977477; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V4b3tCJ_1644977477) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Feb 2022 10:11:18 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: perex@perex.cz
Subject: [PATCH -next] ASoC: codec: wcd938x: Fix NULL but dereferenced
 coccicheck error
Date: Wed, 16 Feb 2022 10:11:16 +0800
Message-Id: <20220216021116.94384-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 quic_srivasam@quicinc.com
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

Eliminate the following coccicheck warning:
./sound/soc/codecs/wcd938x.c:4210:21-24: ERROR: component is NULL but
dereferenced.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 013cc2aea0f6 ("ASoC: codec: wcd938x: Add switch control for selecting CTIA/OMTP Headset")
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 2663fe0bf64f..c46c4bfd84f2 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4207,7 +4207,7 @@ static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool activ
 	struct wcd938x_priv *wcd938x;
 
 	if (!component) {
-		dev_err(component->dev, "%s component is NULL\n", __func__);
+		pr_err("The snd_soc_component is NULL\n");
 		return false;
 	}
 
-- 
2.20.1.7.g153144c


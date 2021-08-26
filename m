Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1703F8177
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 06:05:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F0B3167A;
	Thu, 26 Aug 2021 06:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F0B3167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629950758;
	bh=CZmvqVnq6ZgmJn0DrQjH+BprXPjX/BCC/HHewQCBIF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+kBb9rEqBvojA0P9wVfIW36ok8J4EUX7OzfkREsWqgQEEfk7CzaXMKKzws+mrwHl
	 6rKQhN0uLSUNWdCNcgwXoZB+xMfJ9uIkbpbsd8Bbvuv/iybVxAuBzey8JbKla+0VwL
	 IrDVOHJXPz5gtbYx1S+DIRfnsSFbpM7DhoapbWgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E32DF80506;
	Thu, 26 Aug 2021 06:03:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B9CDF804E7; Thu, 26 Aug 2021 06:03:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40D0CF8032D
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 06:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D0CF8032D
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 72474B2F75;
 Thu, 26 Aug 2021 12:03:18 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P32763T139760853055232S1629950596113927_; 
 Thu, 26 Aug 2021 12:03:18 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4957e4f85885b405531a778e34ab48ec>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 7
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH v3 13/14] ASoC: rockchip: i2s: Add support for TRCM property
Date: Thu, 26 Aug 2021 12:03:13 +0800
Message-Id: <1629950594-14345-3-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Xing Zheng <zhengxing@rock-chips.com>, devicetree@vger.kernel.org
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

From: Xing Zheng <zhengxing@rock-chips.com>

If there is only one lrck (tx or rx) by hardware, we need to
use 'rockchip,trcm-sync-tx-only/rx-only' to specify which lrck
can be used.

Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v3: None
Changes in v2:
- split property trcm into single 'trcm-sync-tx-only' and
  'trcm-sync-rx-only' suggested by Nicolas.

 sound/soc/rockchip/rockchip_i2s.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 801fc60..3e8b96e 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -25,6 +25,10 @@
 
 #define DRV_NAME "rockchip-i2s"
 
+#define TRCM_TXRX	0
+#define TRCM_TX		1
+#define TRCM_RX		2
+
 struct rk_i2s_pins {
 	u32 reg_offset;
 	u32 shift;
@@ -324,7 +328,6 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct rk_i2s_dev *i2s = to_info(dai);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	unsigned int val = 0;
 	unsigned int mclk_rate, bclk_rate, div_bclk, div_lrck;
 
@@ -424,13 +427,6 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(i2s->regmap, I2S_DMACR, I2S_DMACR_RDL_MASK,
 			   I2S_DMACR_RDL(16));
 
-	val = I2S_CKR_TRCM_TXRX;
-	if (dai->driver->symmetric_rate && rtd->dai_link->symmetric_rate)
-		val = I2S_CKR_TRCM_TXONLY;
-
-	regmap_update_bits(i2s->regmap, I2S_CKR,
-			   I2S_CKR_TRCM_MASK,
-			   val);
 	return 0;
 }
 
@@ -513,7 +509,6 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
 static struct snd_soc_dai_driver rockchip_i2s_dai = {
 	.probe = rockchip_i2s_dai_probe,
 	.ops = &rockchip_i2s_dai_ops,
-	.symmetric_rate = 1,
 };
 
 static const struct snd_soc_component_driver rockchip_i2s_component = {
@@ -689,6 +684,22 @@ static int rockchip_i2s_init_dai(struct rk_i2s_dev *i2s, struct resource *res,
 		}
 	}
 
+	val = TRCM_TXRX;
+	if (of_property_read_bool(node, "rockchip,trcm-sync-tx-only"))
+		val = TRCM_TX;
+	if (of_property_read_bool(node, "rockchip,trcm-sync-rx-only")) {
+		if (val) {
+			dev_err(i2s->dev, "invalid trcm-sync configuration\n");
+			return -EINVAL;
+		}
+		val = TRCM_RX;
+	}
+	if (val != TRCM_TXRX)
+		dai->symmetric_rate = 1;
+
+	regmap_update_bits(i2s->regmap, I2S_CKR,
+			   I2S_CKR_TRCM_MASK, I2S_CKR_TRCM(val));
+
 	if (dp)
 		*dp = dai;
 
-- 
2.7.4




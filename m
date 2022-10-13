Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 803365FD9B0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 14:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235DA5ADC;
	Thu, 13 Oct 2022 14:57:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235DA5ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665665874;
	bh=3tE8MvKn++O3yKnIGIxo0pOWUaMlycQva2nyPNKfeec=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cu8sRyZdRJ/LE3wsfV4SK3Dqb8fHFx0oJ6uavv0TMdNgZBuhizmg04Y6jxr7r8TNB
	 CIJaH+nebmma9JaqKdElu3c6YXxjX9x2WRSaiFDIiGXJX8xuohjS/8B866/9m4TBQu
	 62sR6a0fPI4iy6SGxwu1ahhhZ/+I9iv0Lf8rVgUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 887B4F80431;
	Thu, 13 Oct 2022 14:56:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B61BF800C0; Thu, 13 Oct 2022 14:56:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 378C2F800C0
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 14:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 378C2F800C0
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 97F821B45BA;
 Thu, 13 Oct 2022 14:56:45 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 60F4E1B45BC;
 Thu, 13 Oct 2022 14:56:45 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 09EF31802204;
 Thu, 13 Oct 2022 20:56:43 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, viorel.suman@nxp.com
Subject: [PATCH] ASoC: ak4458: add optional reset control to instead of gpio
Date: Thu, 13 Oct 2022 20:36:51 +0800
Message-Id: <1665664611-21350-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: shengjiu.wang@gmail.com
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

From: Viorel Suman <viorel.suman@nxp.com>

Add optional reset control instead of GPIO to manage codec
PDN pin.

As there is reference counter for reset control, so need
to remove one ak4458_reset in runtime resume to make the
reference counter balance.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak4458.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 626310859814..ac328d598291 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -13,6 +13,7 @@
 #include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/initval.h>
 #include <sound/pcm_params.h>
@@ -46,6 +47,7 @@ struct ak4458_priv {
 	struct device *dev;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpiod;
+	struct reset_control *reset;
 	struct gpio_desc *mute_gpiod;
 	int digfil;	/* SSLOW, SD, SLOW bits */
 	int fs;		/* sampling rate */
@@ -633,6 +635,12 @@ static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
 	if (ak4458->reset_gpiod) {
 		gpiod_set_value_cansleep(ak4458->reset_gpiod, active);
 		usleep_range(1000, 2000);
+	} else if (!IS_ERR_OR_NULL(ak4458->reset)) {
+		if (active)
+			reset_control_assert(ak4458->reset);
+		else
+			reset_control_deassert(ak4458->reset);
+		usleep_range(1000, 2000);
 	}
 }
 
@@ -668,7 +676,6 @@ static int __maybe_unused ak4458_runtime_resume(struct device *dev)
 	if (ak4458->mute_gpiod)
 		gpiod_set_value_cansleep(ak4458->mute_gpiod, 1);
 
-	ak4458_reset(ak4458, true);
 	ak4458_reset(ak4458, false);
 
 	regcache_cache_only(ak4458->regmap, false);
@@ -748,6 +755,10 @@ static int ak4458_i2c_probe(struct i2c_client *i2c)
 
 	ak4458->drvdata = of_device_get_match_data(&i2c->dev);
 
+	ak4458->reset = devm_reset_control_get_optional_shared(ak4458->dev, NULL);
+	if (IS_ERR(ak4458->reset))
+		return PTR_ERR(ak4458->reset);
+
 	ak4458->reset_gpiod = devm_gpiod_get_optional(ak4458->dev, "reset",
 						      GPIOD_OUT_LOW);
 	if (IS_ERR(ak4458->reset_gpiod))
-- 
2.34.1


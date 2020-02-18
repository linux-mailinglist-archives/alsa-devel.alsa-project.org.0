Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470B163522
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 22:35:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6EF81690;
	Tue, 18 Feb 2020 22:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6EF81690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582061711;
	bh=irPq74ZgK/8aN/L8bU2KRpJJqlQKIvPuvJumkuCmZqA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FHenRrxLFv4Y8iKlTfNE1xvD3T7TWp+js9EOI//cHzV2P/icqHsSsXp/fwyMGuB/S
	 H4NRiqiDj0T+fTS181XOO64uYYVormoPIYy8R0UUxjXcvikjbz/8m6NAFmA1nzUUla
	 X8vmCJp+1pIDbRlQkgUpf+j7yPx3XTvqCnaVxVro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69948F80135;
	Tue, 18 Feb 2020 22:32:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F435F8014A; Tue, 18 Feb 2020 22:32:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2F99BF80145
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 22:32:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F99BF80145
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A4EF101E;
 Tue, 18 Feb 2020 13:32:18 -0800 (PST)
Received: from DESKTOP-VLO843J.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 613A83F68F;
 Tue, 18 Feb 2020 13:32:17 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH v2 2/3] ASoC: rockchip: Make RK3328 GPIO_MUTE control explicit
Date: Tue, 18 Feb 2020 21:31:59 +0000
Message-Id: <5bc383ed1832f0f5d1dcb3c97ad92fd68e5217e3.1581376744.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581376744.git.robin.murphy@arm.com>
References: <cover.1581376744.git.robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pgwipeout@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
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

The RK3328 reference design uses an external line driver IC as a buffer
on the analog codec output, enabled by the GPIO_MUTE pin, and such a
configuration is currently assumed in the codec driver's direct poking
of GRF_SOC_CON10 to control the GPIO_MUTE output value. However, some
boards wire up analog audio yet use that pin for some other purpose, so
that assumption doesn't always hold. Update this functionality to rely
on an explicit GPIO descriptor, such that it can be managed at the
board level.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2:
 - add fallback case to avoid possible Rock64 regressions
 - propagate GPIO errors; "optional" doesn't really mean "ignore
   brokenness if present"

 sound/soc/codecs/rk3328_codec.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 287c962ba00d..115706a55577 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -31,7 +32,7 @@
 
 struct rk3328_codec_priv {
 	struct regmap *regmap;
-	struct regmap *grf;
+	struct gpio_desc *mute;
 	struct clk *mclk;
 	struct clk *pclk;
 	unsigned int sclk;
@@ -106,16 +107,6 @@ static int rk3328_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static void rk3328_analog_output(struct rk3328_codec_priv *rk3328, int mute)
-{
-	unsigned int val = BIT(17);
-
-	if (mute)
-		val |= BIT(1);
-
-	regmap_write(rk3328->grf, RK3328_GRF_SOC_CON10, val);
-}
-
 static int rk3328_digital_mute(struct snd_soc_dai *dai, int mute)
 {
 	struct rk3328_codec_priv *rk3328 =
@@ -205,7 +196,7 @@ static int rk3328_codec_open_playback(struct rk3328_codec_priv *rk3328)
 	}
 
 	msleep(rk3328->spk_depop_time);
-	rk3328_analog_output(rk3328, 1);
+	gpiod_set_value(rk3328->mute, 0);
 
 	regmap_update_bits(rk3328->regmap, HPOUTL_GAIN_CTRL,
 			   HPOUTL_GAIN_MASK, OUT_VOLUME);
@@ -246,7 +237,7 @@ static int rk3328_codec_close_playback(struct rk3328_codec_priv *rk3328)
 {
 	size_t i;
 
-	rk3328_analog_output(rk3328, 0);
+	gpiod_set_value(rk3328->mute, 1);
 
 	regmap_update_bits(rk3328->regmap, HPOUTL_GAIN_CTRL,
 			   HPOUTL_GAIN_MASK, 0);
@@ -446,7 +437,6 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "missing 'rockchip,grf'\n");
 		return PTR_ERR(grf);
 	}
-	rk3328->grf = grf;
 	/* enable i2s_acodec_en */
 	regmap_write(grf, RK3328_GRF_SOC_CON2,
 		     (BIT(14) << 16 | BIT(14)));
@@ -458,7 +448,18 @@ static int rk3328_platform_probe(struct platform_device *pdev)
 		rk3328->spk_depop_time = 200;
 	}
 
-	rk3328_analog_output(rk3328, 0);
+	rk3328->mute = gpiod_get_optional(&pdev->dev, "mute", GPIOD_OUT_HIGH);
+	if (IS_ERR(rk3328->mute))
+		return PTR_ERR(rk3328->mute);
+	/*
+	 * Rock64 is the only supported platform to have widely relied on
+	 * this; if we do happen to come across an old DTB, just leave the
+	 * external mute forced off.
+	 */
+	if (!rk3328->mute && of_machine_is_compatible("pine64,rock64")) {
+		dev_warn(&pdev->dev, "assuming implicit control of GPIO_MUTE; update devicetree if possible\n");
+		regmap_write(grf, RK3328_GRF_SOC_CON10, BIT(17) | BIT(1));
+	}
 
 	rk3328->mclk = devm_clk_get(&pdev->dev, "mclk");
 	if (IS_ERR(rk3328->mclk))
-- 
2.17.1


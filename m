Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9555A100AD6
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 18:51:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226B51691;
	Mon, 18 Nov 2019 18:50:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226B51691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574099480;
	bh=fhYYcOypPYW2C89bJGiacVFPhFqPJ/JPjNSwP3Qgc2o=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=b4wp68cGcWJDiz4PC/avnR7qCgAzCHioyA9fo71F7Ro++RTQTmycdbHM6s7jLkuaO
	 tHgvBlstSfOeuu21lR7WiwBaIM+4hsNEMQEXnHLy1oXVzSWbAK0n80NzRKe4xOW6NU
	 blB3vSZ/nkQoEetrRS0jywEmePucoLXM9Q8F/ZU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD39EF800F1;
	Mon, 18 Nov 2019 18:48:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0B0CF800FF; Mon, 18 Nov 2019 18:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C9B23F800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 18:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9B23F800FF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68BF0DA7;
 Mon, 18 Nov 2019 09:48:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB6143F703;
 Mon, 18 Nov 2019 09:48:44 -0800 (PST)
Date: Mon, 18 Nov 2019 17:48:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20191118151207.28576-1-l.stach@pengutronix.de>
Message-Id: <applied-20191118151207.28576-1-l.stach@pengutronix.de>
X-Patchwork-Hint: ignore
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, "Andrew F . Davis" <afd@ti.com>,
 Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de, Chris Healy <cphealy@gmail.com>
Subject: [alsa-devel] Applied "ASoC: tlv320aic31xx: configure output
	common-mode voltage" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: tlv320aic31xx: configure output common-mode voltage

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From e48fdb53bd1fa50796b5a050e6e31fde3891a2c8 Mon Sep 17 00:00:00 2001
From: Lucas Stach <l.stach@pengutronix.de>
Date: Mon, 18 Nov 2019 16:12:06 +0100
Subject: [PATCH] ASoC: tlv320aic31xx: configure output common-mode voltage

The tlv320aic31xx devices allow to adjust the output common-mode voltage
for best analog performance. The datasheet states that the common mode
voltage should be set to be <= AVDD/2.

This changes allows to configure the output common-mode voltage via a DT
property. If the property is absent the voltage is automatically chosen
as the highest voltage below/equal to AVDD/2.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Link: https://lore.kernel.org/r/20191118151207.28576-1-l.stach@pengutronix.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/tlv320aic31xx.txt          |  5 +++
 sound/soc/codecs/tlv320aic31xx.c              | 45 +++++++++++++++++++
 sound/soc/codecs/tlv320aic31xx.h              |  8 ++++
 3 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt b/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
index 5b3c33bb99e5..e372303697dc 100644
--- a/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
+++ b/Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
@@ -29,6 +29,11 @@ Optional properties:
         3 or MICBIAS_AVDD - MICBIAS output is connected to AVDD
 	If this node is not mentioned or if the value is unknown, then
 	micbias	is set to 2.0V.
+- ai31xx-ocmv - output common-mode voltage setting
+        0 - 1.35V,
+        1 - 1.5V,
+        2 - 1.65V,
+        3 - 1.8V
 
 Deprecated properties:
 
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index df627a08def9..f6f19fdc72f5 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -171,6 +171,7 @@ struct aic31xx_priv {
 	int rate_div_line;
 	bool master_dapm_route_applied;
 	int irq;
+	u8 ocmv; /* output common-mode voltage */
 };
 
 struct aic31xx_rate_divs {
@@ -1312,6 +1313,11 @@ static int aic31xx_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
+	/* set output common-mode voltage */
+	snd_soc_component_update_bits(component, AIC31XX_HPDRIVER,
+				      AIC31XX_HPD_OCMV_MASK,
+				      aic31xx->ocmv << AIC31XX_HPD_OCMV_SHIFT);
+
 	return 0;
 }
 
@@ -1501,6 +1507,43 @@ static irqreturn_t aic31xx_irq(int irq, void *data)
 		return IRQ_NONE;
 }
 
+static void aic31xx_configure_ocmv(struct aic31xx_priv *priv)
+{
+	struct device *dev = priv->dev;
+	int dvdd, avdd;
+	u32 value;
+
+	if (dev->fwnode &&
+	    fwnode_property_read_u32(dev->fwnode, "ai31xx-ocmv", &value)) {
+		/* OCMV setting is forced by DT */
+		if (value <= 3) {
+			priv->ocmv = value;
+			return;
+		}
+	}
+
+	avdd = regulator_get_voltage(priv->supplies[3].consumer);
+	dvdd = regulator_get_voltage(priv->supplies[5].consumer);
+
+	if (avdd > 3600000 || dvdd > 1950000) {
+		dev_warn(dev,
+			 "Too high supply voltage(s) AVDD: %d, DVDD: %d\n",
+			 avdd, dvdd);
+	} else if (avdd == 3600000 && dvdd == 1950000) {
+		priv->ocmv = AIC31XX_HPD_OCMV_1_8V;
+	} else if (avdd >= 3300000 && dvdd >= 1800000) {
+		priv->ocmv = AIC31XX_HPD_OCMV_1_65V;
+	} else if (avdd >= 3000000 && dvdd >= 1650000) {
+		priv->ocmv = AIC31XX_HPD_OCMV_1_5V;
+	} else if (avdd >= 2700000 && dvdd >= 1525000) {
+		priv->ocmv = AIC31XX_HPD_OCMV_1_35V;
+	} else {
+		dev_warn(dev,
+			 "Invalid supply voltage(s) AVDD: %d, DVDD: %d\n",
+			 avdd, dvdd);
+	}
+}
+
 static int aic31xx_i2c_probe(struct i2c_client *i2c,
 			     const struct i2c_device_id *id)
 {
@@ -1570,6 +1613,8 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	aic31xx_configure_ocmv(aic31xx);
+
 	if (aic31xx->irq > 0) {
 		regmap_update_bits(aic31xx->regmap, AIC31XX_GPIO1,
 				   AIC31XX_GPIO1_FUNC_MASK,
diff --git a/sound/soc/codecs/tlv320aic31xx.h b/sound/soc/codecs/tlv320aic31xx.h
index cb024955c978..83a8c7604cc3 100644
--- a/sound/soc/codecs/tlv320aic31xx.h
+++ b/sound/soc/codecs/tlv320aic31xx.h
@@ -232,6 +232,14 @@ struct aic31xx_pdata {
 #define AIC31XX_HSD_HP			0x01
 #define AIC31XX_HSD_HS			0x03
 
+/* AIC31XX_HPDRIVER */
+#define AIC31XX_HPD_OCMV_MASK		GENMASK(4, 3)
+#define AIC31XX_HPD_OCMV_SHIFT		3
+#define AIC31XX_HPD_OCMV_1_35V		0x0
+#define AIC31XX_HPD_OCMV_1_5V		0x1
+#define AIC31XX_HPD_OCMV_1_65V		0x2
+#define AIC31XX_HPD_OCMV_1_8V		0x3
+
 /* AIC31XX_MICBIAS */
 #define AIC31XX_MICBIAS_MASK		GENMASK(1, 0)
 #define AIC31XX_MICBIAS_SHIFT		0
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D97981007EE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 16:14:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE13168E;
	Mon, 18 Nov 2019 16:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE13168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574090042;
	bh=/LDyArCimkIS2bjvFw6MEbrmf3b+9pBz9LMyr7KYmsY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H40EXU3WLwT0BuVjuu59gZ/8CbyH4s3rT1vV9QleOdIduQ6aCQGzSFXtHCofeZ+8+
	 qWKscHPMGvdXxk1uXuQd80VA3aSfRWVn2sP4hU4RcXmemuDFw7mTkET3GzOgyfk0rt
	 qccqoxr/AfWEUfy0J9MwDf/q4CF8ydLRABySHW/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC439F8013D;
	Mon, 18 Nov 2019 16:12:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC7AFF8013B; Mon, 18 Nov 2019 16:12:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04A64F800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 16:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04A64F800FF
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iWihD-0008FH-TD; Mon, 18 Nov 2019 16:12:07 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 18 Nov 2019 16:12:06 +0100
Message-Id: <20191118151207.28576-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 "Andrew F . Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 Chris Healy <cphealy@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: tlv320aic31xx: configure output
	common-mode voltage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The tlv320aic31xx devices allow to adjust the output common-mode voltage
for best analog performance. The datasheet states that the common mode
voltage should be set to be <= AVDD/2.

This changes allows to configure the output common-mode voltage via a DT
property. If the property is absent the voltage is automatically chosen
as the highest voltage below/equal to AVDD/2.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
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

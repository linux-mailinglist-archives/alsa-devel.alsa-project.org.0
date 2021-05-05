Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AED373592
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 09:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0881C16BA;
	Wed,  5 May 2021 09:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0881C16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620199690;
	bh=IS7VQAZplLZAUlYiGlwAAm2UwYTlDxjPZOZ/84jUom8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgUYBA06Kl/rxL8zJY5sjRvNCiJVzeruQk3cr/CYD7+icXvbnMfLiO7tojimJ697f
	 yA9tsYsZ45esxU1OGz9+3KmUll/JTQc2NTBlFwhn/8cKN0ufLE/XGhixLD0qqN/vo3
	 qSJ9SHQ83TSVA6EbrWEesMXJH55XJC4WK1ptY3V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FFF7F80257;
	Wed,  5 May 2021 09:26:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 665A1F800F2; Wed,  5 May 2021 09:26:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 292D4F800F2
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 09:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 292D4F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="1PGfjong"
Received: by mail-wm1-x329.google.com with SMTP id g65so779856wmg.2
 for <alsa-devel@alsa-project.org>; Wed, 05 May 2021 00:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCrW3/5AvHEnhbzTyyrYlllXK49rm8kLoKILH5tN+Gs=;
 b=1PGfjongXusORlnDBJw2N9MSMZmSSL/5X/FxB60TKStLfHWuWxIm+5xSYySpn618g9
 99P0DzcQZ6oseXj/vPjUa/gpDI3KFfj/iwHg4l/LVf8g/03qz0OyVPWBVHyI8LqmUzZK
 J0b3cEpMJLy+nkdwad19OSVjuUU6ZAMqN/bMXdA6lRFgtYjyFHjKw8S6+cKrfUnNmBCe
 ZCpflGl8MuutFUvloFQc8RWwO4HIn5r4YWS+6J9E8YnbLmnqzkLQ2DLdMlEA1yokRM0K
 23LjoBKg3/emNP5uqjdX69K8AH7aYwQtVIjTfaZ0yln7TVoFOpGveZkGRTBxiHQzwsVo
 /HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YCrW3/5AvHEnhbzTyyrYlllXK49rm8kLoKILH5tN+Gs=;
 b=WjaNIa5GkxPyErBD3vZzo2aJ5kVX1QcF91hJtruxmL/u2rsHAhcIWe5JazirdkDdPo
 w5eohM6lEAt3omXyqziZtiPV4nXO3jU1ClYm4HFuDmLx4Bsn3Awsurd/k7yUJGnl8Vjv
 yfTm/RyytN8Njyo+KW6zNBSYt85MBH60KoeUwDCMc9ol4H35p+72tCihq6yh+G4PXapx
 pNYhnvmNZ725h2NOmk7r+A/9zR71gmq3RL/y9g5Pian64JcAbS1tvDICdbZ722S0Nlvc
 Eqm083AFWptMfXPWmiZGKjeyPiFpa5L0fO2MKx+pTgHVdcaifcgejsxiS1holTj6OYQS
 5x/A==
X-Gm-Message-State: AOAM532FecpJWI9zLKpkKLYOEf6J3QidFtZWpMOdtBRoIXdG3P6ytr+y
 ycD9BTCwKOVMZVQ6KBbAeFM0GQ==
X-Google-Smtp-Source: ABdhPJwWtjXc8BsVPfIc+B+/4I749a+blCfYThzhnf6vVq6wIU0T5qSxxSmSRm7u4kSAwcfVQAugug==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr31469968wmc.41.1620199573415; 
 Wed, 05 May 2021 00:26:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id
 f25sm19008991wrd.67.2021.05.05.00.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 00:26:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Subject: [PATCH v2 1/2] ASoC: meson: g12a-toacodec: use regmap fields to
 prepare SM1 support
Date: Wed,  5 May 2021 09:26:05 +0200
Message-Id: <20210505072607.3815442-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505072607.3815442-1-narmstrong@baylibre.com>
References: <20210505072607.3815442-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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

Switch usage to regmap field for bits handled by the g12a_toacodec_mux_put_enum()
function to avoid uselesss code duplication when adding SM1 variant support.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 sound/soc/meson/g12a-toacodec.c | 80 +++++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 18 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 9339fabccb79..2084c9542c9c 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -21,17 +21,31 @@
 
 #define TOACODEC_CTRL0			0x0
 #define  CTRL0_ENABLE_SHIFT		31
-#define  CTRL0_DAT_SEL_SHIFT		14
-#define  CTRL0_DAT_SEL			(0x3 << CTRL0_DAT_SEL_SHIFT)
+#define  CTRL0_DAT_SEL_MSB		15
+#define  CTRL0_DAT_SEL_LSB		14
 #define  CTRL0_LANE_SEL			12
-#define  CTRL0_LRCLK_SEL		GENMASK(9, 8)
+#define  CTRL0_LRCLK_SEL_MSB		9
+#define  CTRL0_LRCLK_SEL_LSB		8
 #define  CTRL0_BLK_CAP_INV		BIT(7)
 #define  CTRL0_BCLK_O_INV		BIT(6)
-#define  CTRL0_BCLK_SEL			GENMASK(5, 4)
+#define  CTRL0_BCLK_SEL_MSB		5
+#define  CTRL0_BCLK_SEL_LSB		4
 #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
 
 #define TOACODEC_OUT_CHMAX		2
 
+struct g12a_toacodec {
+	struct regmap_field *field_dat_sel;
+	struct regmap_field *field_lrclk_sel;
+	struct regmap_field *field_bclk_sel;
+};
+
+struct g12a_toacodec_match_data {
+	struct reg_field field_dat_sel;
+	struct reg_field field_lrclk_sel;
+	struct reg_field field_bclk_sel;
+};
+
 static const char * const g12a_toacodec_mux_texts[] = {
 	"I2S A", "I2S B", "I2S C",
 };
@@ -41,29 +55,24 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct g12a_toacodec *priv = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_dapm_kcontrol_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	unsigned int mux, changed;
+	unsigned int mux, reg;
 
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
-	changed = snd_soc_component_test_bits(component, e->reg,
-					      CTRL0_DAT_SEL,
-					      FIELD_PREP(CTRL0_DAT_SEL, mux));
+	regmap_field_read(priv->field_dat_sel, &reg);
 
-	if (!changed)
+	if (mux == reg)
 		return 0;
 
 	/* Force disconnect of the mux while updating */
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
 
-	snd_soc_component_update_bits(component, e->reg,
-				      CTRL0_DAT_SEL |
-				      CTRL0_LRCLK_SEL |
-				      CTRL0_BCLK_SEL,
-				      FIELD_PREP(CTRL0_DAT_SEL, mux) |
-				      FIELD_PREP(CTRL0_LRCLK_SEL, mux) |
-				      FIELD_PREP(CTRL0_BCLK_SEL, mux));
+	regmap_field_write(priv->field_dat_sel, mux);
+	regmap_field_write(priv->field_lrclk_sel, mux);
+	regmap_field_write(priv->field_bclk_sel, mux);
 
 	/*
 	 * FIXME:
@@ -86,7 +95,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
-			    CTRL0_DAT_SEL_SHIFT,
+			    CTRL0_DAT_SEL_LSB,
 			    g12a_toacodec_mux_texts);
 
 static const struct snd_kcontrol_new g12a_toacodec_mux =
@@ -205,19 +214,42 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
 	.reg_stride	= 4,
 };
 
+static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_LSB, CTRL0_DAT_SEL_MSB),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_LSB, CTRL0_LRCLK_SEL_MSB),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_MSB),
+};
+
 static const struct of_device_id g12a_toacodec_of_match[] = {
-	{ .compatible = "amlogic,g12a-toacodec", },
+	{
+		.compatible = "amlogic,g12a-toacodec",
+		.data = &g12a_toacodec_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
 
 static int g12a_toacodec_probe(struct platform_device *pdev)
 {
+	const struct g12a_toacodec_match_data *data;
 	struct device *dev = &pdev->dev;
+	struct g12a_toacodec *priv;
 	void __iomem *regs;
 	struct regmap *map;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data) {
+		dev_err(dev, "failed to match device\n");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
 	ret = device_reset(dev);
 	if (ret)
 		return ret;
@@ -233,6 +265,18 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
 		return PTR_ERR(map);
 	}
 
+	priv->field_dat_sel = devm_regmap_field_alloc(dev, map, data->field_dat_sel);
+	if (IS_ERR(priv->field_dat_sel))
+		return PTR_ERR(priv->field_dat_sel);
+
+	priv->field_lrclk_sel = devm_regmap_field_alloc(dev, map, data->field_lrclk_sel);
+	if (IS_ERR(priv->field_lrclk_sel))
+		return PTR_ERR(priv->field_lrclk_sel);
+
+	priv->field_bclk_sel = devm_regmap_field_alloc(dev, map, data->field_bclk_sel);
+	if (IS_ERR(priv->field_bclk_sel))
+		return PTR_ERR(priv->field_bclk_sel);
+
 	return devm_snd_soc_register_component(dev,
 			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
 			ARRAY_SIZE(g12a_toacodec_dai_drv));
-- 
2.25.1


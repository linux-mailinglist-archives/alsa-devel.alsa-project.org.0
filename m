Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C9D373594
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 09:28:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6730416AF;
	Wed,  5 May 2021 09:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6730416AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620199723;
	bh=VyMlacarxlbYlXc3Bo2MmbDmjcjODpL3r5p3HEZBj6k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fCmNIiLQIatSF+mv+F0X0NMFPx0ik7jNFZyE40MDa4typ/qIUKNIk+PlDhmld1ngw
	 jrNfqRQrHO/aW+THFMMbj0JiF3wzGypr3POZAcqVbCy4aSJWUYGUIPSWhZDmxqXZzt
	 xwEpxR+K12VR7SrPyrr5cnoC8HAAoi/ceiKUsBYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 141E8F8049C;
	Wed,  5 May 2021 09:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2330F80431; Wed,  5 May 2021 09:26:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65F96F80257
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 09:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65F96F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="AOFwLbrj"
Received: by mail-wm1-x332.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so480951wmh.4
 for <alsa-devel@alsa-project.org>; Wed, 05 May 2021 00:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ryLo2gccvYnJFf6uz5T1OlY0Lzzgw8rSJB9vsnUHoqE=;
 b=AOFwLbrj3UIWYKYMglM59levWs0CwBGCnzJKEGYBCMCmOvaXco0gfVgtLRgLDombiC
 WJrCu+k6+ppreNXIyWyjmKwGpLmvBGtLHdbxnThZb4wItpi11kJ39FiSXpAf/i/jswfj
 V0ZruldhB7fqIOrnoxHToqmyeIE1UCWYt6R7bZG152zqzEqwxFc1AQjBI5nla808RSmT
 LbfGxht8gAg0PE+cndhUQRToHy0LgmpQgPkNqCFYgsa7Is8oRpj+UxgzycYC2OHpCt7y
 evoKP6qs5pj2aIrWdoqzmtllm5KIzf1m/U8yaLG2DiMrLVuzRQdYm2vQ1c7ZrGMXuYYG
 7YhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ryLo2gccvYnJFf6uz5T1OlY0Lzzgw8rSJB9vsnUHoqE=;
 b=Xhh+7IESEqQEGEEu0QgnT0uHDw6eh6pWQ02o5aH9c6AYJS+MS3geExUyeK1NyU//7X
 XHA6Ode6Mel5lkbtRj40+1K9fnJ2gbIBz7KeO2pBz7aHsdMGtiMssxq29kUD7NbUOVd0
 dfKb0B2cbD5NjEKw7pxy4yBzE9AB1VagvF8tnDXq7QEXZC6C7lhiGnC2K4Yc8Gc4RC7O
 yy0EXEddMSqs476tMykdeVEx2vrRBF/HR2fGDDm+2YRU/so5QAaL3Cjv9t2BzcasRCPj
 GWdo4xrThQz6LE44sfzdxNAlZ1fxWia4QPv1+rUnVRw1RJGeNru/Q4a03OmVj3Ywdhg/
 37cA==
X-Gm-Message-State: AOAM53310AHD1ToO3dfq9Gz7X9uYiuJQJMAy9UxkvxPF7wl41lRYMuxq
 uBxIj8J1UrCE+9K8bzjt+W8iSA==
X-Google-Smtp-Source: ABdhPJzDCygRvwK/+nSocWqj6oDcXCUudZHXcgd967/zopD+CaCbwXcFQU6Bi/gkEZYx5oLhj/niig==
X-Received: by 2002:a1c:c206:: with SMTP id s6mr8703239wmf.47.1620199574593;
 Wed, 05 May 2021 00:26:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id
 f25sm19008991wrd.67.2021.05.05.00.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 00:26:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: meson: g12a-toacodec: add support for SM1
 TOACODEC
Date: Wed,  5 May 2021 09:26:06 +0200
Message-Id: <20210505072607.3815442-3-narmstrong@baylibre.com>
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

This adds support for the TOACODEC found in Amlogic SM1 SoCs.

The bits are shifted for more selection of clock sources, so this only
maps the same support for G12A to the SM1 bits.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 sound/soc/meson/g12a-toacodec.c | 64 ++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 2084c9542c9c..5437ecba9c47 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -21,13 +21,22 @@
 
 #define TOACODEC_CTRL0			0x0
 #define  CTRL0_ENABLE_SHIFT		31
+#define  CTRL0_DAT_SEL_SM1_MSB		19
+#define  CTRL0_DAT_SEL_SM1_LSB		18
 #define  CTRL0_DAT_SEL_MSB		15
 #define  CTRL0_DAT_SEL_LSB		14
+#define  CTRL0_LANE_SEL_SM1		16
 #define  CTRL0_LANE_SEL			12
+#define  CTRL0_LRCLK_SEL_SM1_MSB	14
+#define  CTRL0_LRCLK_SEL_SM1_LSB	12
 #define  CTRL0_LRCLK_SEL_MSB		9
 #define  CTRL0_LRCLK_SEL_LSB		8
+#define  CTRL0_LRCLK_INV_SM1		BIT(10)
+#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
 #define  CTRL0_BLK_CAP_INV		BIT(7)
+#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
 #define  CTRL0_BCLK_O_INV		BIT(6)
+#define  CTRL0_BCLK_SEL_SM1_MSB		6
 #define  CTRL0_BCLK_SEL_MSB		5
 #define  CTRL0_BCLK_SEL_LSB		4
 #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
@@ -41,6 +50,7 @@ struct g12a_toacodec {
 };
 
 struct g12a_toacodec_match_data {
+	const struct snd_soc_component_driver *component_drv;
 	struct reg_field field_dat_sel;
 	struct reg_field field_lrclk_sel;
 	struct reg_field field_bclk_sel;
@@ -98,11 +108,20 @@ static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
 			    CTRL0_DAT_SEL_LSB,
 			    g12a_toacodec_mux_texts);
 
+static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
+			    CTRL0_DAT_SEL_SM1_LSB,
+			    g12a_toacodec_mux_texts);
+
 static const struct snd_kcontrol_new g12a_toacodec_mux =
 	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
 			  snd_soc_dapm_get_enum_double,
 			  g12a_toacodec_mux_put_enum);
 
+static const struct snd_kcontrol_new sm1_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", sm1_toacodec_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  g12a_toacodec_mux_put_enum);
+
 static const struct snd_kcontrol_new g12a_toacodec_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
 				    CTRL0_ENABLE_SHIFT, 1, 0);
@@ -114,6 +133,13 @@ static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
 			    &g12a_toacodec_out_enable),
 };
 
+static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
+	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
+			 &sm1_toacodec_mux),
+	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_toacodec_out_enable),
+};
+
 static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
 					 struct snd_pcm_hw_params *params,
 					 struct snd_soc_dai *dai)
@@ -184,6 +210,13 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
 				       CTRL0_BLK_CAP_INV);
 }
 
+static int sm1_toacodec_component_probe(struct snd_soc_component *c)
+{
+	/* Initialize the static clock parameters */
+	return snd_soc_component_write(c, TOACODEC_CTRL0,
+				       CTRL0_BLK_CAP_INV_SM1);
+}
+
 static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 	{ "SRC", "I2S A", "IN A Playback" },
 	{ "SRC", "I2S B", "IN B Playback" },
@@ -196,6 +229,10 @@ static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
 };
 
+static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
+};
+
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.probe			= g12a_toacodec_component_probe,
 	.controls		= g12a_toacodec_controls,
@@ -208,6 +245,18 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.non_legacy_dai_naming	= 1,
 };
 
+static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
+	.probe			= sm1_toacodec_component_probe,
+	.controls		= sm1_toacodec_controls,
+	.num_controls		= ARRAY_SIZE(sm1_toacodec_controls),
+	.dapm_widgets		= sm1_toacodec_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(sm1_toacodec_widgets),
+	.dapm_routes		= g12a_toacodec_routes,
+	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -215,16 +264,29 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
 };
 
 static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
+	.component_drv	= &g12a_toacodec_component_drv,
 	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_LSB, CTRL0_DAT_SEL_MSB),
 	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_LSB, CTRL0_LRCLK_SEL_MSB),
 	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_MSB),
 };
 
+static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
+	.component_drv	= &sm1_toacodec_component_drv,
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB, CTRL0_DAT_SEL_SM1_MSB),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
+				     CTRL0_LRCLK_SEL_SM1_MSB),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_SM1_MSB),
+};
+
 static const struct of_device_id g12a_toacodec_of_match[] = {
 	{
 		.compatible = "amlogic,g12a-toacodec",
 		.data = &g12a_toacodec_match_data,
 	},
+	{
+		.compatible = "amlogic,sm1-toacodec",
+		.data = &sm1_toacodec_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
@@ -278,7 +340,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->field_bclk_sel);
 
 	return devm_snd_soc_register_component(dev,
-			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
+			data->component_drv, g12a_toacodec_dai_drv,
 			ARRAY_SIZE(g12a_toacodec_dai_drv));
 }
 
-- 
2.25.1


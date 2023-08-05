Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B737739A7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6BA2BC0;
	Tue,  8 Aug 2023 12:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6BA2BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491109;
	bh=4O+AovqzHu/xgZKN2NEl0Tr/pgKFUcDa4hdbNa72GKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ld8kw0QhQKbzu/WoHS9wMtZDY1k6uGtsZfDe8lRM3QoamkPCi8RU4M6HbCJuB4r21
	 e4uMsE7H5y14gPSjbe1SdCi9y7rU+PkexmoKNXdqopdDXLkSfnXKp1IHqNBj9iGJwT
	 PJ8N3AMrMvOvd8ISpTP/dstdIzcVi308QvgIMXTc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71366F805BD; Tue,  8 Aug 2023 12:35:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2423F805BD;
	Tue,  8 Aug 2023 12:35:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1988AF8025A; Sat,  5 Aug 2023 20:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2012CF802BE
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 20:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2012CF802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VLxBlaI8
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-313e742a787so1846538f8f.1
        for <alsa-devel@alsa-project.org>;
 Sat, 05 Aug 2023 11:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258753; x=1691863553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ho00aTSR6Nd9ZGhlL2/Ex6KOk4DJ3h9NtPcio400hoM=;
        b=VLxBlaI8OMxLcTfutZ+0EfaTTw8wCx3/tYk1MbmhoMTyKb5KLY63SI+rpGmulbi4/P
         9Mp5rFEGSyq8vigwARVKAhhKJ8QEouwEbCKn5EJidI0mzGQLqwmwhenQ57d9Gb5hsUIY
         3l+rcXOp1ne9gbzHU9GqbvzIX1hju1hW7RA9LNHHxJIQ0TptHx+JbEtVWRAJw54wSXS+
         BIaXdz76P4K1zLflOleE/QEM/G9TUIx2gPledE5R0YqB9CPzso1egFaFVZ/H6VAmAWxh
         NNPRqowJH5nE8RK1eZtfwwnEF8b1kLGmT31vmbzRQwIFvQWLpWdtUeKs+5iCED5p75x9
         b8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258753; x=1691863553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ho00aTSR6Nd9ZGhlL2/Ex6KOk4DJ3h9NtPcio400hoM=;
        b=MLKW6i1V8NZpPOAyqF7UccaFHf3hybj6h+kMnBzqRBsMSZ22NVwYMiNB7K8sUK+x8Y
         fGiJBCJwUR0P4xz0H5yx/vHD+AXENFXW8x0zGbw6DWyr+0KEIuqT+4o101uneu0LPRPf
         869X84N6ZNUEQXZO5OJMOFWck4+HJc0YXmK1oRdgi6lPXMmsGiejDYsmfmenXhJzHLgg
         EPHdX0dn2uLF/RHslvkfAdxavfdSF/qe1tyREfRGHirm4VgTJp59p8OoJHvxZT8sFe5U
         jZB69U7d/epHNSlwXu3ztswMSXkDnFZGBOJc0pstiX4nAgR03TyN9J4Q8oEacWqcS1pc
         Uusw==
X-Gm-Message-State: AOJu0YwBxAUDBulEGNIOSt9ZlFIYMdDxraWi8WTX8VN+lz0IiWrHQN5m
	rDglvINuMgjheEunSShazSI=
X-Google-Smtp-Source: 
 AGHT+IH9HhmtHMoM4vrXGnrK2R/jHU6vhHKZeu67GsZoQ2e8dcjlsXq+5hVc3u2LGqYnCflZERbX7w==
X-Received: by 2002:a5d:6ac5:0:b0:317:6570:afec with SMTP id
 u5-20020a5d6ac5000000b003176570afecmr2366516wrw.3.1691258753198;
        Sat, 05 Aug 2023 11:05:53 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id
 v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:53 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 4/5] ASoC: sunxi: Add new driver for Allwinner D1/T113s
 codec's analog path controls
Date: Sat,  5 Aug 2023 21:05:04 +0300
Message-Id: <20230805180506.718364-5-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bigunclemax@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FY7XQYECPTXZZYLHE43L25NHD6HCECXJ
X-Message-ID-Hash: FY7XQYECPTXZZYLHE43L25NHD6HCECXJ
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:35:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FY7XQYECPTXZZYLHE43L25NHD6HCECXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The internal codec on D1/T113s is split into 2 parts like the previous
ones. But now analog path controls registers are mapped directly
on the bus, right after the registers of the digital part.

Add an ASoC component driver for it. This should be tied to the codec
audio card as an auxiliary device.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 sound/soc/sunxi/Kconfig                  |  11 ++
 sound/soc/sunxi/Makefile                 |   1 +
 sound/soc/sunxi/sun20i-d1-codec-analog.c | 220 +++++++++++++++++++++++
 3 files changed, 232 insertions(+)
 create mode 100644 sound/soc/sunxi/sun20i-d1-codec-analog.c

diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index 1f18f016acbb..c67895d08079 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -38,6 +38,17 @@ config SND_SUN50I_CODEC_ANALOG
 	  Say Y or M if you want to add support for the analog controls for
 	  the codec embedded in Allwinner A64 SoC.
 
+config SND_SUN20I_D1_CODEC_ANALOG
+	tristate "Allwinner D1 Codec Analog Controls Support"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  This option enables the analog controls part of the internal audio
+	  codec for Allwinner D1/T113s SoCs family.
+
+	  Say Y or M if you want to add support for the analog part of
+	  the D1/T113s audio codec.
+
 config SND_SUN4I_I2S
 	tristate "Allwinner A10 I2S Support"
 	select SND_SOC_GENERIC_DMAENGINE_PCM
diff --git a/sound/soc/sunxi/Makefile b/sound/soc/sunxi/Makefile
index 4483fe9c94ef..ba6a5ed334a0 100644
--- a/sound/soc/sunxi/Makefile
+++ b/sound/soc/sunxi/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_SND_SUN4I_I2S) += sun4i-i2s.o
 obj-$(CONFIG_SND_SUN4I_SPDIF) += sun4i-spdif.o
 obj-$(CONFIG_SND_SUN8I_CODEC_ANALOG) += sun8i-codec-analog.o
 obj-$(CONFIG_SND_SUN50I_CODEC_ANALOG) += sun50i-codec-analog.o
+obj-$(CONFIG_SND_SUN20I_D1_CODEC_ANALOG) += sun20i-d1-codec-analog.o
 obj-$(CONFIG_SND_SUN8I_CODEC) += sun8i-codec.o
 obj-$(CONFIG_SND_SUN8I_ADDA_PR_REGMAP) += sun8i-adda-pr-regmap.o
 obj-$(CONFIG_SND_SUN50I_DMIC) += sun50i-dmic.o
diff --git a/sound/soc/sunxi/sun20i-d1-codec-analog.c b/sound/soc/sunxi/sun20i-d1-codec-analog.c
new file mode 100644
index 000000000000..5c269d56cd2f
--- /dev/null
+++ b/sound/soc/sunxi/sun20i-d1-codec-analog.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * This driver supports the analog controls for the internal codec
+ * found in Allwinner's D1/T113s SoCs family.
+ *
+ * Based on sun50i-codec-analog.c
+ */
+
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+
+/* Codec analog control register offsets and bit fields */
+#define SUN20I_D1_ADDA_ADC1			(0x00)
+#define SUN20I_D1_ADDA_ADC2			(0x04)
+#define SUN20I_D1_ADDA_ADC3			(0x08)
+#define SUN20I_D1_ADDA_ADC_EN				(31)
+#define SUN20I_D1_ADDA_ADC_PGA_EN			(30)
+#define SUN20I_D1_ADDA_ADC_MIC_SIN_EN			(28)
+#define SUN20I_D1_ADDA_ADC_LINEINLEN			(23)
+#define SUN20I_D1_ADDA_ADC_PGA_GAIN			(8)
+
+#define SUN20I_D1_ADDA_DAC			(0x10)
+#define SUN20I_D1_ADDA_DAC_DACL_EN			(15)
+#define SUN20I_D1_ADDA_DAC_DACR_EN			(14)
+
+#define SUN20I_D1_ADDA_MICBIAS			(0x18)
+#define SUN20I_D1_ADDA_MICBIAS_MMICBIASEN		(7)
+
+#define SUN20I_D1_ADDA_RAMP			(0x1C)
+#define SUN20I_D1_ADDA_RAMP_RD_EN			(0)
+
+#define SUN20I_D1_ADDA_HP2			(0x40)
+#define SUN20I_D1_ADDA_HP2_HEADPHONE_GAIN		(28)
+
+#define SUN20I_D1_ADDA_ADC_CUR_REG		(0x4C)
+
+static const DECLARE_TLV_DB_RANGE(sun20i_d1_codec_adc_gain_scale,
+	0, 0, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, 0, 1),
+	1, 3, TLV_DB_SCALE_ITEM(600, 0, 0),
+	4, 4, TLV_DB_SCALE_ITEM(900, 0, 0),
+	5, 31, TLV_DB_SCALE_ITEM(1000, 100, 0),
+);
+
+static const DECLARE_TLV_DB_SCALE(sun20i_d1_codec_hp_vol_scale, -4200, 600, 0);
+
+/* volume controls */
+static const struct snd_kcontrol_new sun20i_d1_codec_controls[] = {
+	SOC_SINGLE_TLV("Headphone Playback Volume",
+		       SUN20I_D1_ADDA_HP2,
+		       SUN20I_D1_ADDA_HP2_HEADPHONE_GAIN, 0x7, 1,
+		       sun20i_d1_codec_hp_vol_scale),
+	SOC_SINGLE_TLV("ADC1 Gain Capture Volume",
+		       SUN20I_D1_ADDA_ADC1,
+		       SUN20I_D1_ADDA_ADC_PGA_GAIN, 0x1f, 0,
+		       sun20i_d1_codec_adc_gain_scale),
+	SOC_SINGLE_TLV("ADC2 Gain Capture Volume",
+		       SUN20I_D1_ADDA_ADC2,
+		       SUN20I_D1_ADDA_ADC_PGA_GAIN, 0x1f, 0,
+		       sun20i_d1_codec_adc_gain_scale),
+	SOC_SINGLE_TLV("ADC3 Gain Capture Volume",
+		       SUN20I_D1_ADDA_ADC3,
+		       SUN20I_D1_ADDA_ADC_PGA_GAIN, 0x1f, 0,
+		       sun20i_d1_codec_adc_gain_scale),
+};
+
+/* ADC mixer controls */
+static const struct snd_kcontrol_new sun20i_d1_codec_mixer_controls[] = {
+	SOC_DAPM_DOUBLE_R("Line In Switch",
+			  SUN20I_D1_ADDA_ADC1,
+			  SUN20I_D1_ADDA_ADC2,
+			  SUN20I_D1_ADDA_ADC_LINEINLEN, 1, 0),
+};
+
+static const char * const sun20i_d1_codec_mic3_src_enum_text[] = {
+	"Differential", "Single",
+};
+
+static SOC_ENUM_SINGLE_DECL(sun20i_d1_codec_mic3_src_enum,
+			    SUN20I_D1_ADDA_ADC3,
+			    SUN20I_D1_ADDA_ADC_MIC_SIN_EN,
+			    sun20i_d1_codec_mic3_src_enum_text);
+
+static const struct snd_kcontrol_new sun20i_d1_codec_mic3_input_src[] = {
+	SOC_DAPM_ENUM("MIC3 Source Capture Route",
+		      sun20i_d1_codec_mic3_src_enum),
+};
+
+static const struct snd_soc_dapm_widget sun20i_d1_codec_widgets[] = {
+	/* DAC */
+	SND_SOC_DAPM_DAC("Left DAC", NULL, SUN20I_D1_ADDA_DAC,
+			 SUN20I_D1_ADDA_DAC_DACL_EN, 0),
+	SND_SOC_DAPM_DAC("Right DAC", NULL, SUN20I_D1_ADDA_DAC,
+			 SUN20I_D1_ADDA_DAC_DACR_EN, 0),
+	/* ADC */
+	SND_SOC_DAPM_ADC("ADC1", NULL, SUN20I_D1_ADDA_ADC1,
+			 SUN20I_D1_ADDA_ADC_EN, 0),
+	SND_SOC_DAPM_ADC("ADC2", NULL, SUN20I_D1_ADDA_ADC2,
+			 SUN20I_D1_ADDA_ADC_EN, 0),
+	SND_SOC_DAPM_ADC("ADC3", NULL, SUN20I_D1_ADDA_ADC3,
+			 SUN20I_D1_ADDA_ADC_EN, 0),
+
+	/* ADC Mixers */
+	SND_SOC_DAPM_MIXER("ADC1 Mixer", SND_SOC_NOPM, 0, 0,
+			   sun20i_d1_codec_mixer_controls,
+			   ARRAY_SIZE(sun20i_d1_codec_mixer_controls)),
+	SND_SOC_DAPM_MIXER("ADC2 Mixer", SND_SOC_NOPM, 0, 0,
+			   sun20i_d1_codec_mixer_controls,
+			   ARRAY_SIZE(sun20i_d1_codec_mixer_controls)),
+
+	/* Headphone */
+	SND_SOC_DAPM_OUTPUT("HP"),
+	SND_SOC_DAPM_SUPPLY("RAMP Enable", SUN20I_D1_ADDA_RAMP,
+			    SUN20I_D1_ADDA_RAMP_RD_EN, 0, NULL, 0),
+
+	/* Line input */
+	SND_SOC_DAPM_INPUT("LINEIN"),
+
+	/* Microphone input */
+	SND_SOC_DAPM_INPUT("MIC3"),
+
+	/* Microphone input path */
+	SND_SOC_DAPM_MUX("MIC3 Source Capture Route", SND_SOC_NOPM, 0, 0,
+			 sun20i_d1_codec_mic3_input_src),
+
+	SND_SOC_DAPM_PGA("Mic3 Amplifier", SUN20I_D1_ADDA_ADC3,
+			 SUN20I_D1_ADDA_ADC_PGA_EN, 0, NULL, 0),
+
+	/* Microphone Bias */
+	SND_SOC_DAPM_SUPPLY("MBIAS", SUN20I_D1_ADDA_MICBIAS,
+			    SUN20I_D1_ADDA_MICBIAS_MMICBIASEN, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_route sun20i_d1_codec_routes[] = {
+	/* Headphone Routes */
+	{ "HP", NULL, "Left DAC" },
+	{ "HP", NULL, "Right DAC" },
+	{ "HP", NULL, "RAMP Enable" },
+
+	/* Line input Routes */
+	{ "ADC1", NULL, "ADC1 Mixer" },
+	{ "ADC2", NULL, "ADC2 Mixer" },
+	{ "ADC1 Mixer", "Line In Switch", "LINEIN" },
+	{ "ADC2 Mixer", "Line In Switch", "LINEIN" },
+
+	/* Microphone Routes */
+	{ "MIC3 Source Capture Route", "Differential", "MIC3" },
+	{ "MIC3 Source Capture Route", "Single", "MIC3" },
+	{ "Mic3 Amplifier", NULL, "MIC3 Source Capture Route" },
+	{ "ADC3", NULL, "Mic3 Amplifier" },
+};
+
+static const struct snd_soc_component_driver sun20i_d1_codec_analog_cmpnt_drv = {
+	.controls		= sun20i_d1_codec_controls,
+	.num_controls		= ARRAY_SIZE(sun20i_d1_codec_controls),
+	.dapm_widgets		= sun20i_d1_codec_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(sun20i_d1_codec_widgets),
+	.dapm_routes		= sun20i_d1_codec_routes,
+	.num_dapm_routes	= ARRAY_SIZE(sun20i_d1_codec_routes),
+};
+
+static const struct of_device_id sun20i_d1_codec_analog_of_match[] = {
+	{
+		.compatible = "allwinner,sun20i-d1-codec-analog",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, sun20i_d1_codec_analog_of_match);
+
+static const struct regmap_config sun20i_d1_codec_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= SUN20I_D1_ADDA_ADC_CUR_REG,
+};
+
+static int sun20i_d1_codec_analog_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(&pdev->dev, "Failed to map the registers\n");
+		return PTR_ERR(base);
+	}
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base,
+				       &sun20i_d1_codec_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(&pdev->dev, "Failed to create regmap\n");
+		return PTR_ERR(regmap);
+	}
+
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &sun20i_d1_codec_analog_cmpnt_drv,
+					       NULL, 0);
+}
+
+static struct platform_driver sun20i_d1_codec_analog_driver = {
+	.driver = {
+		.name = "sun20i-d1-codec-analog",
+		.of_match_table = sun20i_d1_codec_analog_of_match,
+	},
+	.probe = sun20i_d1_codec_analog_probe,
+};
+module_platform_driver(sun20i_d1_codec_analog_driver);
+
+MODULE_DESCRIPTION("Allwinner internal codec analog controls driver for D1");
+MODULE_AUTHOR("Maksim Kiselev <bigunclemax@gmail.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:sun20i-d1-codec-analog");
-- 
2.39.2


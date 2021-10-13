Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F9342B245
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 03:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F24167D;
	Wed, 13 Oct 2021 03:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F24167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634088711;
	bh=OjHp65Ur3L+KqekmJFWCclCNMsEYWGpqtAqH/YZSdt0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tflqpFZ0g7TRfOnc3ldc20oy6GbHDNY5Eyv/lgqx+dk45o5S3tiILkM29BKwOKbfj
	 7Uk+VNOH+HV8V+IxYpV1qgRlCTrVinvTUuqzzQ4z51ET3ywnsNPcmJ+n+lD2j0LXjZ
	 fTzfJenEjthyBw+mfaM5qmtp8WbCXG+ZfISIVDH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AE7BF804E5;
	Wed, 13 Oct 2021 03:29:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B836EF80290; Wed, 13 Oct 2021 03:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F2B6F80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 03:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F2B6F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PkhP762D"
Received: by mail-pg1-x52a.google.com with SMTP id e7so753795pgk.2
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 18:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0iM2u6zX+bRhoClzLr262hnaXAUyjyumgwc0f0AIBNw=;
 b=PkhP762D/oJwEtenjuSOTnQRDKbHGA1+a9waG8E1WsUrXqx5FaJTI+yfccLFIOWmWp
 iT1QhVuBfmIvO1yziSKCvqH7xlEqd5oycgfok8OQ5cg+Cd0RAQWf+d1osNCy4KmoYVrt
 RPuJziSkV22/fUReGXLbcRL2ekbi5eX/a7kEqGGKXVHVBwlWQ7JMtQ3KwI2VfA8csPRu
 CI3UeZn/0g5+qsJHABoOVfB0WwnFqyqMk5ghmsis5GwvBu1ryxrcaL7N0wFH+jANv8kJ
 cqtAKHToS4SqVs+FW+4btC8LeVrNsAQ42Ztd7p4j7yt43IP3ZjK5PidOAxnCSrEGjhdq
 ABCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0iM2u6zX+bRhoClzLr262hnaXAUyjyumgwc0f0AIBNw=;
 b=v2vA2cO+maiVeD7rs/E1nVgbcZ7hVnZJUAeV8x2e5SIKjupGUgCExy3XrPBQHMMH8O
 7iWf1NVPXoMCgLT7ln+6LSfJRG0iEp9bSokg5Eu21IXl26ccQv2jkJOPB/74QMbGuVrI
 RhZ6UiWLutRfnUdChcFN7vJ5aadVkg9cO6534PTrhEyIQfJOCDx1DvwEOz80tpAC8hB5
 Cq11Hyks1x7R3Bc5xmqBbWwzXLNRnRFl+0ajzsY1ZpL2jmMxNWLnCN4IKtsZA6bb6wne
 lJXAR/qRy0aplaGrhTiOTje3OvPvTGaD5SrzwgKX2Be3ZqKdyNVrh8FkAf0L1+vYgosS
 XTdA==
X-Gm-Message-State: AOAM533/5DrpLKmG8Tq05daJ21/sWGe2r0LYY+xHlUdYTZMLWXGSlQeR
 WL/Yp0P5H/cvndJr4rNaEcY=
X-Google-Smtp-Source: ABdhPJwk4Pi9nKxDBNGbatLlFGlVxQVkoQQNUKVmGocNncOblT9w4WEbU0Oq0h3/Tf1wmT1KBU/jew==
X-Received: by 2002:a05:6a00:2385:b0:44d:efc:a6c7 with SMTP id
 f5-20020a056a00238500b0044d0efca6c7mr17112695pfc.26.1634088562654; 
 Tue, 12 Oct 2021 18:29:22 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:578:7fd7:52a:ae77:5bec:efe9])
 by smtp.gmail.com with ESMTPSA id
 b11sm12144788pge.57.2021.10.12.18.29.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 18:29:22 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: oder_chiou@realtek.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
Subject: [PATCH v4 2/2] ASoC: rt9120: Add rt9210 audio amplifier support
Date: Wed, 13 Oct 2021 09:28:39 +0800
Message-Id: <1634088519-995-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634088519-995-1-git-send-email-u0084500@gmail.com>
References: <1634088519-995-1-git-send-email-u0084500@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add Richtek rt9120 audio amplifier support.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/Kconfig  |  10 +
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/rt9120.c | 495 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 507 insertions(+)
 create mode 100644 sound/soc/codecs/rt9120.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 82ee233..155050d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -187,6 +187,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT715_SDCA_SDW
 	imply SND_SOC_RT1308_SDW
 	imply SND_SOC_RT1316_SDW
+	imply SND_SOC_RT9120
 	imply SND_SOC_SDW_MOCKUP
 	imply SND_SOC_SGTL5000
 	imply SND_SOC_SI476X
@@ -1288,6 +1289,15 @@ config SND_SOC_RT715_SDCA_SDW
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
 
+config SND_SOC_RT9120
+	tristate "Richtek RT9120 Stereo Class-D Amplifier"
+	depends on I2C
+	select REGMAP_I2C
+	select GPIOLIB
+	help
+	  Enable support for Richtek RT9120 20W, stereo, inductor-less,
+	  high-efficiency Class-D audio amplifier.
+
 config SND_SOC_SDW_MOCKUP
 	tristate "SoundWire mockup codec"
 	depends on EXPERT
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 8dcea2c..5ba164d 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -203,6 +203,7 @@ snd-soc-rt711-objs := rt711.o rt711-sdw.o
 snd-soc-rt711-sdca-objs := rt711-sdca.o rt711-sdca-sdw.o
 snd-soc-rt715-objs := rt715.o rt715-sdw.o
 snd-soc-rt715-sdca-objs := rt715-sdca.o rt715-sdca-sdw.o
+snd-soc-rt9120-objs := rt9120.o
 snd-soc-sdw-mockup-objs := sdw-mockup.o
 snd-soc-sgtl5000-objs := sgtl5000.o
 snd-soc-alc5623-objs := alc5623.o
@@ -531,6 +532,7 @@ obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
 obj-$(CONFIG_SND_SOC_RT711_SDCA_SDW)     += snd-soc-rt711-sdca.o
 obj-$(CONFIG_SND_SOC_RT715)     += snd-soc-rt715.o
 obj-$(CONFIG_SND_SOC_RT715_SDCA_SDW)     += snd-soc-rt715-sdca.o
+obj-$(CONFIG_SND_SOC_RT9120)	+= snd-soc-rt9120.o
 obj-$(CONFIG_SND_SOC_SDW_MOCKUP)     += snd-soc-sdw-mockup.o
 obj-$(CONFIG_SND_SOC_SGTL5000)  += snd-soc-sgtl5000.o
 obj-$(CONFIG_SND_SOC_SIGMADSP)	+= snd-soc-sigmadsp.o
diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
new file mode 100644
index 00000000..f957498
--- /dev/null
+++ b/sound/soc/codecs/rt9120.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#define RT9120_REG_DEVID	0x00
+#define RT9120_REG_I2SFMT	0x02
+#define RT9120_REG_I2SWL	0x03
+#define RT9120_REG_SDIOSEL	0x04
+#define RT9120_REG_SYSCTL	0x05
+#define RT9120_REG_SPKGAIN	0x07
+#define RT9120_REG_VOLRAMP	0x0A
+#define RT9120_REG_ERRRPT	0x10
+#define RT9120_REG_MSVOL	0x20
+#define RT9120_REG_SWRESET	0x40
+#define RT9120_REG_INTERNAL0	0x65
+#define RT9120_REG_INTERNAL1	0x69
+#define RT9120_REG_UVPOPT	0x6C
+
+#define RT9120_VID_MASK		GENMASK(15, 8)
+#define RT9120_SWRST_MASK	BIT(7)
+#define RT9120_MUTE_MASK	GENMASK(5, 4)
+#define RT9120_I2SFMT_MASK	GENMASK(4, 2)
+#define RT9120_I2SFMT_SHIFT	2
+#define RT9120_CFG_FMT_I2S	0
+#define RT9120_CFG_FMT_LEFTJ	1
+#define RT9120_CFG_FMT_RIGHTJ	2
+#define RT9120_CFG_FMT_DSPA	3
+#define RT9120_CFG_FMT_DSPB	7
+#define RT9120_AUDBIT_MASK	GENMASK(1, 0)
+#define RT9120_CFG_AUDBIT_16	0
+#define RT9120_CFG_AUDBIT_20	1
+#define RT9120_CFG_AUDBIT_24	2
+#define RT9120_AUDWL_MASK	GENMASK(5, 0)
+#define RT9120_CFG_WORDLEN_16	16
+#define RT9120_CFG_WORDLEN_24	24
+#define RT9120_CFG_WORDLEN_32	32
+#define RT9120_DVDD_UVSEL_MASK	GENMASK(5, 4)
+
+#define RT9120_VENDOR_ID	0x4200
+#define RT9120_RESET_WAITMS	20
+#define RT9120_CHIPON_WAITMS	20
+#define RT9120_AMPON_WAITMS	50
+#define RT9120_AMPOFF_WAITMS	100
+#define RT9120_LVAPP_THRESUV	2000000
+
+/* 8000 to 192000 supported , only 176400 not support */
+#define RT9120_RATES_MASK	(SNDRV_PCM_RATE_8000_192000 &\
+				 ~SNDRV_PCM_RATE_176400)
+#define RT9120_FMTS_MASK	(SNDRV_PCM_FMTBIT_S16_LE |\
+				 SNDRV_PCM_FMTBIT_S24_LE |\
+				 SNDRV_PCM_FMTBIT_S32_LE)
+
+struct rt9120_data {
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+/* 11bit [min,max,step] = [-103.9375dB, 24dB, 0.0625dB] */
+static const DECLARE_TLV_DB_SCALE(digital_tlv, -1039375, 625, 1);
+
+/* {6, 8, 10, 12, 13, 14, 15, 16}dB */
+static const DECLARE_TLV_DB_RANGE(classd_tlv,
+	0, 3, TLV_DB_SCALE_ITEM(600, 200, 0),
+	4, 7, TLV_DB_SCALE_ITEM(1300, 100, 0)
+);
+
+static const char * const sdo_select_text[] = {
+	"None", "INTF", "Final", "RMS Detect"
+};
+
+static const struct soc_enum sdo_select_enum =
+	SOC_ENUM_SINGLE(RT9120_REG_SDIOSEL, 4, ARRAY_SIZE(sdo_select_text),
+			sdo_select_text);
+
+static const struct snd_kcontrol_new rt9120_snd_controls[] = {
+	SOC_SINGLE_TLV("MS Volume", RT9120_REG_MSVOL, 0, 2047, 1, digital_tlv),
+	SOC_SINGLE_TLV("SPK Gain Volume", RT9120_REG_SPKGAIN, 0, 7, 0, classd_tlv),
+	SOC_SINGLE("PBTL Switch", RT9120_REG_SYSCTL, 3, 1, 0),
+	SOC_ENUM("SDO Select", sdo_select_enum),
+};
+
+static int internal_power_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_write(comp, RT9120_REG_ERRRPT, 0);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		msleep(RT9120_AMPON_WAITMS);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		msleep(RT9120_AMPOFF_WAITMS);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rt9120_dapm_widgets[] = {
+	SND_SOC_DAPM_MIXER("DMIX", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_DAC("LDAC", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC("RDAC", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SUPPLY("PWND", RT9120_REG_SYSCTL, 6, 1,
+			    internal_power_event, SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA("SPKL PA", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("SPKR PA", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_OUTPUT("SPKL"),
+	SND_SOC_DAPM_OUTPUT("SPKR"),
+};
+
+static const struct snd_soc_dapm_route rt9120_dapm_routes[] = {
+	{ "DMIX", NULL, "AIF Playback" },
+	/* SPKL */
+	{ "LDAC", NULL, "PWND" },
+	{ "LDAC", NULL, "DMIX" },
+	{ "SPKL PA", NULL, "LDAC" },
+	{ "SPKL", NULL, "SPKL PA" },
+	/* SPKR */
+	{ "RDAC", NULL, "PWND" },
+	{ "RDAC", NULL, "DMIX" },
+	{ "SPKR PA", NULL, "RDAC" },
+	{ "SPKR", NULL, "SPKR PA" },
+	/* Cap */
+	{ "AIF Capture", NULL, "LDAC" },
+	{ "AIF Capture", NULL, "RDAC" },
+};
+
+static int rt9120_codec_probe(struct snd_soc_component *comp)
+{
+	struct rt9120_data *data = snd_soc_component_get_drvdata(comp);
+
+	snd_soc_component_init_regmap(comp, data->regmap);
+
+	/* Internal setting */
+	snd_soc_component_write(comp, RT9120_REG_INTERNAL1, 0x03);
+	snd_soc_component_write(comp, RT9120_REG_INTERNAL0, 0x69);
+	return 0;
+}
+
+static const struct snd_soc_component_driver rt9120_component_driver = {
+	.probe = rt9120_codec_probe,
+	.controls = rt9120_snd_controls,
+	.num_controls = ARRAY_SIZE(rt9120_snd_controls),
+	.dapm_widgets = rt9120_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt9120_dapm_widgets),
+	.dapm_routes = rt9120_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(rt9120_dapm_routes),
+};
+
+static int rt9120_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *comp = dai->component;
+	unsigned int format;
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		format = RT9120_CFG_FMT_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		format = RT9120_CFG_FMT_LEFTJ;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		format = RT9120_CFG_FMT_RIGHTJ;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		format = RT9120_CFG_FMT_DSPA;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		format = RT9120_CFG_FMT_DSPB;
+		break;
+	default:
+		dev_err(dai->dev, "Unknown dai format\n");
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(comp, RT9120_REG_I2SFMT,
+				      RT9120_I2SFMT_MASK,
+				      format << RT9120_I2SFMT_SHIFT);
+	return 0;
+}
+
+static int rt9120_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *param,
+			    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *comp = dai->component;
+	unsigned int param_width, param_slot_width;
+	int width;
+
+	switch (width = params_width(param)) {
+	case 16:
+		param_width = RT9120_CFG_AUDBIT_16;
+		break;
+	case 20:
+		param_width = RT9120_CFG_AUDBIT_20;
+		break;
+	case 24:
+	case 32:
+		param_width = RT9120_CFG_AUDBIT_24;
+		break;
+	default:
+		dev_err(dai->dev, "Unsupported data width [%d]\n", width);
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(comp, RT9120_REG_I2SFMT,
+				      RT9120_AUDBIT_MASK, param_width);
+
+	switch (width = params_physical_width(param)) {
+	case 16:
+		param_slot_width = RT9120_CFG_WORDLEN_16;
+		break;
+	case 24:
+		param_slot_width = RT9120_CFG_WORDLEN_24;
+		break;
+	case 32:
+		param_slot_width = RT9120_CFG_WORDLEN_32;
+		break;
+	default:
+		dev_err(dai->dev, "Unsupported slot width [%d]\n", width);
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(comp, RT9120_REG_I2SWL,
+				      RT9120_AUDWL_MASK, param_slot_width);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops rt9120_dai_ops = {
+	.set_fmt = rt9120_set_fmt,
+	.hw_params = rt9120_hw_params,
+};
+
+static struct snd_soc_dai_driver rt9120_dai = {
+	.name = "rt9120_aif",
+	.playback = {
+		.stream_name = "AIF Playback",
+		.rates = RT9120_RATES_MASK,
+		.formats = RT9120_FMTS_MASK,
+		.rate_max = 192000,
+		.rate_min = 8000,
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+	.capture = {
+		.stream_name = "AIF Capture",
+		.rates = RT9120_RATES_MASK,
+		.formats = RT9120_FMTS_MASK,
+		.rate_max = 192000,
+		.rate_min = 8000,
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+	.ops = &rt9120_dai_ops,
+	.symmetric_rate = 1,
+	.symmetric_sample_bits = 1,
+};
+
+static const struct regmap_range rt9120_rd_yes_ranges[] = {
+	regmap_reg_range(0x00, 0x0C),
+	regmap_reg_range(0x10, 0x15),
+	regmap_reg_range(0x20, 0x27),
+	regmap_reg_range(0x30, 0x38),
+	regmap_reg_range(0x3A, 0x40),
+	regmap_reg_range(0x65, 0x65),
+	regmap_reg_range(0x69, 0x69),
+	regmap_reg_range(0x6C, 0x6C)
+};
+
+static const struct regmap_access_table rt9120_rd_table = {
+	.yes_ranges = rt9120_rd_yes_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rt9120_rd_yes_ranges),
+};
+
+static const struct regmap_range rt9120_wr_yes_ranges[] = {
+	regmap_reg_range(0x00, 0x00),
+	regmap_reg_range(0x02, 0x0A),
+	regmap_reg_range(0x10, 0x15),
+	regmap_reg_range(0x20, 0x27),
+	regmap_reg_range(0x30, 0x38),
+	regmap_reg_range(0x3A, 0x3D),
+	regmap_reg_range(0x40, 0x40),
+	regmap_reg_range(0x65, 0x65),
+	regmap_reg_range(0x69, 0x69),
+	regmap_reg_range(0x6C, 0x6C)
+};
+
+static const struct regmap_access_table rt9120_wr_table = {
+	.yes_ranges = rt9120_wr_yes_ranges,
+	.n_yes_ranges = ARRAY_SIZE(rt9120_wr_yes_ranges),
+};
+
+static int rt9120_get_reg_size(unsigned int reg)
+{
+	switch (reg) {
+	case 0x00:
+	case 0x09:
+	case 0x20 ... 0x27:
+		return 2;
+	case 0x30 ... 0x3D:
+		return 3;
+	case 0x3E ... 0x3F:
+		return 4;
+	default:
+		return 1;
+	}
+}
+
+static int rt9120_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct rt9120_data *data = context;
+	struct i2c_client *i2c = to_i2c_client(data->dev);
+	int size = rt9120_get_reg_size(reg);
+	u8 raw[4] = {0};
+	int ret;
+
+	ret = i2c_smbus_read_i2c_block_data(i2c, reg, size, raw);
+	if (ret < 0)
+		return ret;
+	else if (ret != size)
+		return -EIO;
+
+	switch (size) {
+	case 4:
+		*val = be32_to_cpup((__be32 *)raw);
+		break;
+	case 3:
+		*val = raw[0] << 16 | raw[1] << 8 | raw[0];
+		break;
+	case 2:
+		*val = be16_to_cpup((__be16 *)raw);
+		break;
+	default:
+		*val = raw[0];
+	}
+
+	return 0;
+}
+
+static int rt9120_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct rt9120_data *data = context;
+	struct i2c_client *i2c = to_i2c_client(data->dev);
+	int size = rt9120_get_reg_size(reg);
+	__be32 be32_val;
+	u8 *rawp = (u8 *)&be32_val;
+	int offs = 4 - size;
+
+	be32_val = cpu_to_be32(val);
+	return i2c_smbus_write_i2c_block_data(i2c, reg, size, rawp + offs);
+}
+
+static const struct regmap_config rt9120_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.max_register = RT9120_REG_UVPOPT,
+
+	.reg_read = rt9120_reg_read,
+	.reg_write = rt9120_reg_write,
+
+	.wr_table = &rt9120_wr_table,
+	.rd_table = &rt9120_rd_table,
+};
+
+static int rt9120_check_vendor_info(struct rt9120_data *data)
+{
+	unsigned int devid;
+	int ret;
+
+	ret = regmap_read(data->regmap, RT9120_REG_DEVID, &devid);
+	if (ret)
+		return ret;
+
+	if ((devid & RT9120_VID_MASK) != RT9120_VENDOR_ID) {
+		dev_err(data->dev, "DEVID not correct [0x%04x]\n", devid);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int rt9120_do_register_reset(struct rt9120_data *data)
+{
+	int ret;
+
+	ret = regmap_write(data->regmap, RT9120_REG_SWRESET,
+			   RT9120_SWRST_MASK);
+	if (ret)
+		return ret;
+
+	msleep(RT9120_RESET_WAITMS);
+	return 0;
+}
+
+static int rt9120_probe(struct i2c_client *i2c)
+{
+	struct rt9120_data *data;
+	struct gpio_desc *pwdnn_gpio;
+	struct regulator *dvdd_supply;
+	int dvdd_supply_volt, ret;
+
+	data = devm_kzalloc(&i2c->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &i2c->dev;
+	i2c_set_clientdata(i2c, data);
+
+	pwdnn_gpio = devm_gpiod_get_optional(&i2c->dev, "pwdnn",
+					     GPIOD_OUT_HIGH);
+	if (IS_ERR(pwdnn_gpio)) {
+		dev_err(&i2c->dev, "Failed to initialize 'pwdnn' gpio\n");
+		return PTR_ERR(pwdnn_gpio);
+	} else if (pwdnn_gpio) {
+		dev_dbg(&i2c->dev, "'pwdnn' from low to high, wait chip on\n");
+		msleep(RT9120_CHIPON_WAITMS);
+	}
+
+	data->regmap = devm_regmap_init(&i2c->dev, NULL, data,
+					&rt9120_regmap_config);
+	if (IS_ERR(data->regmap)) {
+		ret = PTR_ERR(data->regmap);
+		dev_err(&i2c->dev, "Failed to init regmap [%d]\n", ret);
+		return ret;
+	}
+
+	ret = rt9120_check_vendor_info(data);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to check vendor info\n");
+		return ret;
+	}
+
+	ret = rt9120_do_register_reset(data);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to do register reset\n");
+		return ret;
+	}
+
+	dvdd_supply = devm_regulator_get(&i2c->dev, "dvdd");
+	if (IS_ERR(dvdd_supply)) {
+		dev_err(&i2c->dev, "No dvdd regulator found\n");
+		return PTR_ERR(dvdd_supply);
+	}
+
+	dvdd_supply_volt = regulator_get_voltage(dvdd_supply);
+	if (dvdd_supply_volt <= RT9120_LVAPP_THRESUV) {
+		dev_dbg(&i2c->dev, "dvdd low voltage design\n");
+		ret = regmap_update_bits(data->regmap, RT9120_REG_UVPOPT,
+					 RT9120_DVDD_UVSEL_MASK, 0);
+		if (ret) {
+			dev_err(&i2c->dev, "Failed to config dvdd uvsel\n");
+			return ret;
+		}
+	}
+
+	return devm_snd_soc_register_component(&i2c->dev,
+					       &rt9120_component_driver,
+					       &rt9120_dai, 1);
+}
+
+static const struct of_device_id __maybe_unused rt9120_device_table[] = {
+	{ .compatible = "richtek,rt9120", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rt9120_device_table);
+
+static struct i2c_driver rt9120_driver = {
+	.driver = {
+		.name = "rt9120",
+		.of_match_table = rt9120_device_table,
+	},
+	.probe_new = rt9120_probe,
+};
+module_i2c_driver(rt9120_driver);
+
+MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("RT9120 Audio Amplifier Driver");
+MODULE_LICENSE("GPL");
-- 
2.7.4


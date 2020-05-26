Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 501821CC95C
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 10:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D68CD15E2;
	Sun, 10 May 2020 10:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D68CD15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589099031;
	bh=dQGLOzM3QtXeD/bSwNogug1xmePK0t8pGS1sU/Dx6mw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gq7YAj6QFiKg4J+n/D6gYfAPeC1tdnOPurkvaprQgddTj2K2JrbCQrY12htXINC1S
	 e2kFvLXpTqDyov2syyAouuC/zr3AXUmqc+qC8p4dRUfszHTZf+OXMZtK2OQVaSOb1N
	 1Vpg1/CLR8R/a2TvyFfv9m+p5Zo21k4HFsgxMEcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25382F8028F;
	Sun, 10 May 2020 10:21:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9420F8015F; Sat,  9 May 2020 05:19:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D962F800BF
 for <alsa-devel@alsa-project.org>; Sat,  9 May 2020 05:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D962F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YOmlYGAp"
Received: by mail-pg1-x541.google.com with SMTP id t11so1812974pgg.2
 for <alsa-devel@alsa-project.org>; Fri, 08 May 2020 20:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=N2dgD+eU6gFroW2KEzgzLkH4+FNxhNL66cpRYB9Oqc8=;
 b=YOmlYGApGPZ79/+0Re3KsrtudKSNBWvVdb5j75pehKwy1PNOuzEKnOmX5o9M2QaNSj
 EZgbuicknlHwmEX8QIVXKoxOPl5SK4GEpWfczoW+n03bme7zrnTBcpmLEd0ebbSS30iP
 fmAK5noy1YFfMr2D03iYyVXoAhiHN26Rx6daNSjhjpMW/0QAecijKZEuvmfhunShzhI9
 4z6fdYigJmLnoDuykN/uN6B4h2FeWl7bGI6aFZPGZYsaDr8SxbWG5Be9XOpT4OxTyRFB
 02HCl61OK2a7CV/sfGrE2N8DlLomx9cxF9lMikmRDB60YfN03kWAbGvyMSggOGya8tFg
 FyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=N2dgD+eU6gFroW2KEzgzLkH4+FNxhNL66cpRYB9Oqc8=;
 b=l8pbQnodSp+eaIctNZQar70raT404EYGZqjHYvLTnQ1Ok5rXREYzbz20F1u11ExjSu
 BkF3z0IJ0okJ2UuM/jtARKe978RHIizRtYumaUTEeCwMk8JpugXNuUAQelL/6zxOM5k/
 JPD5G4Cu3deMNw5SHDTCrX+hHgUlTtu5wetOzxVCcFXAwPPQm+ciAa2Afn2k/Q6a6v1p
 TlnyzBx6OhqwymYpQYcFu18L9i6u+z1ht+kB1i8PBx/rtlxMoNOnX6HdNG1ek7pxn1oL
 dvO3++MMz/0AgQvIiSW5K6POBOHsh2mSAnns6W9nD2LUNEDfZ4eeH+bE4B0fioEaT+ly
 1Z7A==
X-Gm-Message-State: AGi0Pub/lB0Mr3/LhuyQEsB/oYKImDhfc4jKn5MIIbgRD/ygKM8EC5E0
 +964W+fTa6gb9C+NiBgJINs=
X-Google-Smtp-Source: APiQypJ73ebcFW9YcWgKbo+iR111Etemg0UTJ8KsNXoLTuIrz8y8TBwAUJbtBc86MZoIHcofrSFhjQ==
X-Received: by 2002:a63:2943:: with SMTP id p64mr4781825pgp.36.1588994382502; 
 Fri, 08 May 2020 20:19:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:2d8:eb61:15a8:d5fe:3ea6:5791:c8e8])
 by smtp.gmail.com with ESMTPSA id q23sm2591008pgn.90.2020.05.08.20.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 20:19:42 -0700 (PDT)
From: Steve Lee <steves.lee.maxim@gmail.com>
X-Google-Original-From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: max98390: Added Amplifier Driver
Date: Sat,  9 May 2020 12:19:19 +0900
Message-Id: <20200509031919.9006-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 10 May 2020 10:21:01 +0200
Cc: ryan.lee.maxim@gmail.com, steves.lee.maxim@gmail.com
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

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/Kconfig    |    5 +
 sound/soc/codecs/Makefile   |    2 +
 sound/soc/codecs/max98390.c | 1039 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98390.h |  661 ++++++++++++++++++++++
 4 files changed, 1707 insertions(+)
 create mode 100644 sound/soc/codecs/max98390.c
 create mode 100644 sound/soc/codecs/max98390.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e60e0b6a689c..bb0c73422163 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -116,6 +116,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_MAX98926
 	imply SND_SOC_MAX98927
 	imply SND_SOC_MAX98373
+	imply SND_SOC_MAX98390 if I2C
 	imply SND_SOC_MAX9850
 	imply SND_SOC_MAX9860
 	imply SND_SOC_MAX9759
@@ -867,6 +868,10 @@ config SND_SOC_MAX98373
 	tristate "Maxim Integrated MAX98373 Speaker Amplifier"
 	depends on I2C
 
+config SND_SOC_MAX98390
+	tristate "Maxim Integrated MAX98390 Speaker Amplifier"
+	depends on I2C
+
 config SND_SOC_MAX9850
 	tristate
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 03533157cda6..e7c17f701529 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -115,6 +115,7 @@ snd-soc-max98925-objs := max98925.o
 snd-soc-max98926-objs := max98926.o
 snd-soc-max98927-objs := max98927.o
 snd-soc-max98373-objs := max98373.o
+snd-soc-max98390-objs := max98390.o
 snd-soc-max9850-objs := max9850.o
 snd-soc-max9860-objs := max9860.o
 snd-soc-mc13783-objs := mc13783.o
@@ -415,6 +416,7 @@ obj-$(CONFIG_SND_SOC_MAX98925)	+= snd-soc-max98925.o
 obj-$(CONFIG_SND_SOC_MAX98926)	+= snd-soc-max98926.o
 obj-$(CONFIG_SND_SOC_MAX98927)	+= snd-soc-max98927.o
 obj-$(CONFIG_SND_SOC_MAX98373)	+= snd-soc-max98373.o
+obj-$(CONFIG_SND_SOC_MAX98390)	+= snd-soc-max98390.o
 obj-$(CONFIG_SND_SOC_MAX9850)	+= snd-soc-max9850.o
 obj-$(CONFIG_SND_SOC_MAX9860)	+= snd-soc-max9860.o
 obj-$(CONFIG_SND_SOC_MC13783)	+= snd-soc-mc13783.o
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
new file mode 100644
index 000000000000..625219b7517c
--- /dev/null
+++ b/sound/soc/codecs/max98390.c
@@ -0,0 +1,1039 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020, Maxim Integrated.
+ */
+
+#include <linux/acpi.h>
+#include <linux/cdev.h>
+#include <linux/firmware.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/time.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#include "max98390.h"
+
+static struct reg_default max98390_reg_defaults[] = {
+	{MAX98390_INT_EN1, 0xf0},
+	{MAX98390_INT_EN2, 0x00},
+	{MAX98390_INT_EN3, 0x00},
+	{MAX98390_INT_FLAG_CLR1, 0x00},
+	{MAX98390_INT_FLAG_CLR2, 0x00},
+	{MAX98390_INT_FLAG_CLR3, 0x00},
+	{MAX98390_IRQ_CTRL, 0x01},
+	{MAX98390_CLK_MON, 0x6d},
+	{MAX98390_DAT_MON, 0x03},
+	{MAX98390_WDOG_CTRL, 0x00},
+	{MAX98390_WDOG_RST, 0x00},
+	{MAX98390_MEAS_ADC_THERM_WARN_THRESH, 0x75},
+	{MAX98390_MEAS_ADC_THERM_SHDN_THRESH, 0x8c},
+	{MAX98390_MEAS_ADC_THERM_HYSTERESIS, 0x08},
+	{MAX98390_PIN_CFG, 0x55},
+	{MAX98390_PCM_RX_EN_A, 0x00},
+	{MAX98390_PCM_RX_EN_B, 0x00},
+	{MAX98390_PCM_TX_EN_A, 0x00},
+	{MAX98390_PCM_TX_EN_B, 0x00},
+	{MAX98390_PCM_TX_HIZ_CTRL_A, 0xff},
+	{MAX98390_PCM_TX_HIZ_CTRL_B, 0xff},
+	{MAX98390_PCM_CH_SRC_1, 0x00},
+	{MAX98390_PCM_CH_SRC_2, 0x00},
+	{MAX98390_PCM_CH_SRC_3, 0x00},
+	{MAX98390_PCM_MODE_CFG, 0xc0},
+	{MAX98390_PCM_MASTER_MODE, 0x1c},
+	{MAX98390_PCM_CLK_SETUP, 0x44},
+	{MAX98390_PCM_SR_SETUP, 0x08},
+	{MAX98390_ICC_RX_EN_A, 0x00},
+	{MAX98390_ICC_RX_EN_B, 0x00},
+	{MAX98390_ICC_TX_EN_A, 0x00},
+	{MAX98390_ICC_TX_EN_B, 0x00},
+	{MAX98390_ICC_HIZ_MANUAL_MODE, 0x00},
+	{MAX98390_ICC_TX_HIZ_EN_A, 0x00},
+	{MAX98390_ICC_TX_HIZ_EN_B, 0x00},
+	{MAX98390_ICC_LNK_EN, 0x00},
+	{MAX98390_R2039_AMP_DSP_CFG, 0x0f},
+	{MAX98390_R203A_AMP_EN, 0x81},
+	{MAX98390_TONE_GEN_DC_CFG, 0x00},
+	{MAX98390_SPK_SRC_SEL, 0x00},
+	{MAX98390_SSM_CFG, 0x85},
+	{MAX98390_MEAS_EN, 0x03},
+	{MAX98390_MEAS_DSP_CFG, 0x0f},
+	{MAX98390_BOOST_CTRL0, 0x1c},
+	{MAX98390_BOOST_CTRL3, 0x01},
+	{MAX98390_BOOST_CTRL1, 0x40},
+	{MAX98390_MEAS_ADC_CFG, 0x07},
+	{MAX98390_MEAS_ADC_BASE_MSB, 0x00},
+	{MAX98390_MEAS_ADC_BASE_LSB, 0x23},
+	{MAX98390_ADC_CH0_DIVIDE, 0x00},
+	{MAX98390_ADC_CH1_DIVIDE, 0x00},
+	{MAX98390_ADC_CH2_DIVIDE, 0x00},
+	{MAX98390_ADC_CH0_FILT_CFG, 0x00},
+	{MAX98390_ADC_CH1_FILT_CFG, 0x00},
+	{MAX98390_ADC_CH2_FILT_CFG, 0x00},
+	{MAX98390_PWR_GATE_CTL, 0x2c},
+	{MAX98390_BROWNOUT_EN, 0x00},
+	{MAX98390_BROWNOUT_INFINITE_HOLD, 0x00},
+	{MAX98390_BROWNOUT_INFINITE_HOLD_CLR, 0x00},
+	{MAX98390_BROWNOUT_LVL_HOLD, 0x00},
+	{MAX98390_BROWNOUT_LVL1_THRESH, 0x00},
+	{MAX98390_BROWNOUT_LVL2_THRESH, 0x00},
+	{MAX98390_BROWNOUT_LVL3_THRESH, 0x00},
+	{MAX98390_BROWNOUT_LVL4_THRESH, 0x00},
+	{MAX98390_BROWNOUT_THRESH_HYSTERYSIS, 0x00},
+	{MAX98390_BROWNOUT_AMP_LIMITER_ATK_REL, 0x1f},
+	{MAX98390_BROWNOUT_AMP_GAIN_ATK_REL, 0x00},
+	{MAX98390_BROWNOUT_AMP1_CLIP_MODE, 0x00},
+	{MAX98390_BROWNOUT_LVL1_CUR_LIMIT, 0x00},
+	{MAX98390_BROWNOUT_LVL1_AMP1_CTRL1, 0x00},
+	{MAX98390_BROWNOUT_LVL1_AMP1_CTRL2, 0x00},
+	{MAX98390_BROWNOUT_LVL1_AMP1_CTRL3, 0x00},
+	{MAX98390_BROWNOUT_LVL2_CUR_LIMIT, 0x00},
+	{MAX98390_BROWNOUT_LVL2_AMP1_CTRL1, 0x00},
+	{MAX98390_BROWNOUT_LVL2_AMP1_CTRL2, 0x00},
+	{MAX98390_BROWNOUT_LVL2_AMP1_CTRL3, 0x00},
+	{MAX98390_BROWNOUT_LVL3_CUR_LIMIT, 0x00},
+	{MAX98390_BROWNOUT_LVL3_AMP1_CTRL1, 0x00},
+	{MAX98390_BROWNOUT_LVL3_AMP1_CTRL2, 0x00},
+	{MAX98390_BROWNOUT_LVL3_AMP1_CTRL3, 0x00},
+	{MAX98390_BROWNOUT_LVL4_CUR_LIMIT, 0x00},
+	{MAX98390_BROWNOUT_LVL4_AMP1_CTRL1, 0x00},
+	{MAX98390_BROWNOUT_LVL4_AMP1_CTRL2, 0x00},
+	{MAX98390_BROWNOUT_LVL4_AMP1_CTRL3, 0x00},
+	{MAX98390_BROWNOUT_ILIM_HLD, 0x00},
+	{MAX98390_BROWNOUT_LIM_HLD, 0x00},
+	{MAX98390_BROWNOUT_CLIP_HLD, 0x00},
+	{MAX98390_BROWNOUT_GAIN_HLD, 0x00},
+	{MAX98390_ENV_TRACK_VOUT_HEADROOM, 0x0f},
+	{MAX98390_ENV_TRACK_BOOST_VOUT_DELAY, 0x80},
+	{MAX98390_ENV_TRACK_REL_RATE, 0x07},
+	{MAX98390_ENV_TRACK_HOLD_RATE, 0x07},
+	{MAX98390_ENV_TRACK_CTRL, 0x01},
+	{MAX98390_BOOST_BYPASS1, 0x49},
+	{MAX98390_BOOST_BYPASS2, 0x2b},
+	{MAX98390_BOOST_BYPASS3, 0x08},
+	{MAX98390_FET_SCALING1, 0x00},
+	{MAX98390_FET_SCALING2, 0x03},
+	{MAX98390_FET_SCALING3, 0x00},
+	{MAX98390_FET_SCALING4, 0x07},
+	{MAX98390_SPK_SPEEDUP, 0x00},
+	{DSMIG_WB_DRC_RELEASE_TIME_1, 0x00},
+	{DSMIG_WB_DRC_RELEASE_TIME_2, 0x00},
+	{DSMIG_WB_DRC_ATTACK_TIME_1, 0x00},
+	{DSMIG_WB_DRC_ATTACK_TIME_2, 0x00},
+	{DSMIG_WB_DRC_COMPRESSION_RATIO, 0x00},
+	{DSMIG_WB_DRC_COMPRESSION_THRESHOLD, 0x00},
+	{DSMIG_WB_DRC_MAKEUPGAIN, 0x00},
+	{DSMIG_WB_DRC_NOISE_GATE_THRESHOLD, 0x00},
+	{DSMIG_WBDRC_HPF_ENABLE, 0x00},
+	{DSMIG_WB_DRC_TEST_SMOOTHER_OUT_EN, 0x00},
+	{DSMIG_PPR_THRESHOLD, 0x00},
+	{DSM_STEREO_BASS_CHANNEL_SELECT, 0x00},
+	{DSM_TPROT_THRESHOLD_BYTE0, 0x00},
+	{DSM_TPROT_THRESHOLD_BYTE1, 0x00},
+	{DSM_TPROT_ROOM_TEMPERATURE_BYTE0, 0x00},
+	{DSM_TPROT_ROOM_TEMPERATURE_BYTE1, 0x00},
+	{DSM_TPROT_RECIP_RDC_ROOM_BYTE0, 0x00},
+	{DSM_TPROT_RECIP_RDC_ROOM_BYTE1, 0x00},
+	{DSM_TPROT_RECIP_RDC_ROOM_BYTE2, 0x00},
+	{DSM_TPROT_RECIP_TCONST_BYTE0, 0x00},
+	{DSM_TPROT_RECIP_TCONST_BYTE1, 0x00},
+	{DSM_TPROT_RECIP_TCONST_BYTE2, 0x00},
+	{DSM_THERMAL_ATTENUATION_SETTINGS, 0x00},
+	{DSM_THERMAL_PILOT_TONE_ATTENUATION, 0x00},
+	{DSM_TPROT_PG_TEMP_THRESH_BYTE0, 0x00},
+	{DSM_TPROT_PG_TEMP_THRESH_BYTE1, 0x00},
+	{DSMIG_DEBUZZER_THRESHOLD, 0x00},
+	{DSMIG_DEBUZZER_ALPHA_COEF_TEST_ONLY, 0x08},
+	{DSM_VOL_ENA, 0x20},
+	{DSM_VOL_CTRL, 0xa0},
+	{DSMIG_EN, 0x00},
+	{MAX98390_R23E1_DSP_GLOBAL_EN, 0x00},
+	{MAX98390_R23FF_GLOBAL_EN, 0x00},
+};
+
+static int max98390_dsm_calibrate(struct snd_soc_component *component);
+
+static int max98390_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+	unsigned int mode;
+	unsigned int format;
+	unsigned int invert;
+
+	dev_dbg(component->dev, "%s: fmt 0x%08X\n", __func__, fmt);
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		mode = MAX98390_PCM_MASTER_MODE_SLAVE;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFM:
+		max98390->master = true;
+		mode = MAX98390_PCM_MASTER_MODE_MASTER;
+		break;
+	default:
+		dev_err(component->dev, "DAI clock mode unsupported\n");
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98390->regmap,
+		MAX98390_PCM_MASTER_MODE,
+		MAX98390_PCM_MASTER_MODE_MASK,
+		mode);
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		invert = MAX98390_PCM_MODE_CFG_PCM_BCLKEDGE;
+		break;
+	default:
+		dev_err(component->dev, "DAI invert mode unsupported\n");
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98390->regmap,
+		MAX98390_PCM_MODE_CFG,
+		MAX98390_PCM_MODE_CFG_PCM_BCLKEDGE,
+		invert);
+
+	/* interface format */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		format = MAX98390_PCM_FORMAT_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		format = MAX98390_PCM_FORMAT_LJ;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		format = MAX98390_PCM_FORMAT_TDM_MODE1;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		format = MAX98390_PCM_FORMAT_TDM_MODE0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98390->regmap,
+		MAX98390_PCM_MODE_CFG,
+		MAX98390_PCM_MODE_CFG_FORMAT_MASK,
+		format << MAX98390_PCM_MODE_CFG_FORMAT_SHIFT);
+
+	return 0;
+}
+
+static int max98390_get_bclk_sel(int bclk)
+{
+	int i;
+	/* BCLKs per LRCLK */
+	static int bclk_sel_table[] = {
+		32, 48, 64, 96, 128, 192, 256, 320, 384, 512,
+	};
+	/* match BCLKs per LRCLK */
+	for (i = 0; i < ARRAY_SIZE(bclk_sel_table); i++) {
+		if (bclk_sel_table[i] == bclk)
+			return i + 2;
+	}
+	return 0;
+}
+
+static int max98390_set_clock(struct snd_soc_component *component,
+		struct snd_pcm_hw_params *params)
+{
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+	/* codec MCLK rate in master mode */
+	static int rate_table[] = {
+		5644800, 6000000, 6144000, 6500000,
+		9600000, 11289600, 12000000, 12288000,
+		13000000, 19200000,
+	};
+	/* BCLK/LRCLK ratio calculation */
+	int blr_clk_ratio = params_channels(params)
+		* snd_pcm_format_width(params_format(params));
+	int value;
+
+	if (max98390->master) {
+		int i;
+		/* match rate to closest value */
+		for (i = 0; i < ARRAY_SIZE(rate_table); i++) {
+			if (rate_table[i] >= max98390->sysclk)
+				break;
+		}
+		if (i == ARRAY_SIZE(rate_table)) {
+			dev_err(component->dev, "failed to find proper clock rate.\n");
+			return -EINVAL;
+		}
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_MASTER_MODE,
+			MAX98390_PCM_MASTER_MODE_MCLK_MASK,
+			i << MAX98390_PCM_MASTER_MODE_MCLK_RATE_SHIFT);
+	}
+
+	if (!max98390->tdm_mode) {
+		/* BCLK configuration */
+		value = max98390_get_bclk_sel(blr_clk_ratio);
+		if (!value) {
+			dev_err(component->dev, "format unsupported %d\n",
+				params_format(params));
+			return -EINVAL;
+		}
+
+		regmap_update_bits(max98390->regmap,
+			MAX98390_PCM_CLK_SETUP,
+			MAX98390_PCM_CLK_SETUP_BSEL_MASK,
+			value);
+	}
+	return 0;
+}
+
+static int max98390_dai_hw_params(struct snd_pcm_substream *substream,
+		struct snd_pcm_hw_params *params,
+	struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component =
+		dai->component;
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	unsigned int sampling_rate;
+	unsigned int chan_sz;
+
+	/* pcm mode configuration */
+	switch (snd_pcm_format_width(params_format(params))) {
+	case 16:
+		chan_sz = MAX98390_PCM_MODE_CFG_CHANSZ_16;
+		break;
+	case 24:
+		chan_sz = MAX98390_PCM_MODE_CFG_CHANSZ_24;
+		break;
+	case 32:
+		chan_sz = MAX98390_PCM_MODE_CFG_CHANSZ_32;
+		break;
+	default:
+		dev_err(component->dev, "format unsupported %d\n",
+			params_format(params));
+		goto err;
+	}
+
+	regmap_update_bits(max98390->regmap,
+		MAX98390_PCM_MODE_CFG,
+		MAX98390_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+
+	dev_dbg(component->dev, "format supported %d",
+		params_format(params));
+
+	/* sampling rate configuration */
+	switch (params_rate(params)) {
+	case 8000:
+		sampling_rate = MAX98390_PCM_SR_SET1_SR_8000;
+		break;
+	case 11025:
+		sampling_rate = MAX98390_PCM_SR_SET1_SR_11025;
+		break;
+	case 12000:
+		sampling_rate = MAX98390_PCM_SR_SET1_SR_12000;
+		break;
+	case 16000:
+		sampling_rate = MAX98390_PCM_SR_SET1_SR_16000;
+		break;
+	case 22050:
+		sampling_rate = MAX98390_PCM_SR_SET1_SR_22050;
+		break;
+	case 24000:
+		sampling_rate = MAX98390_PCM_SR_SET1_SR_24000;
+		break;
+	case 32000:
+		sampling_rate = MAX98390_PCM_SR_SET1_SR_32000;
+		break;
+	case 44100:
+		sampling_rate = MAX98390_PCM_SR_SET1_SR_44100;
+		break;
+	case 48000:
+		sampling_rate = MAX98390_PCM_SR_SET1_SR_48000;
+		break;
+	default:
+		dev_err(component->dev, "rate %d not supported\n",
+			params_rate(params));
+		goto err;
+	}
+
+	/* set DAI_SR to correct LRCLK frequency */
+	regmap_update_bits(max98390->regmap,
+		MAX98390_PCM_SR_SETUP,
+		MAX98390_PCM_SR_SET1_SR_MASK,
+		sampling_rate);
+
+	return max98390_set_clock(component, params);
+err:
+	return -EINVAL;
+}
+
+static int max98390_dai_tdm_slot(struct snd_soc_dai *dai,
+		unsigned int tx_mask, unsigned int rx_mask,
+		int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	int bsel;
+	unsigned int chan_sz;
+
+	if (!tx_mask && !rx_mask && !slots && !slot_width)
+		max98390->tdm_mode = false;
+	else
+		max98390->tdm_mode = true;
+
+	dev_info(component->dev, "Tdm mode : %d\n",
+			max98390->tdm_mode);
+
+	/* BCLK configuration */
+	bsel = max98390_get_bclk_sel(slots * slot_width);
+	if (!bsel) {
+		dev_err(component->dev, "BCLK %d not supported\n",
+			slots * slot_width);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98390->regmap,
+		MAX98390_PCM_CLK_SETUP,
+		MAX98390_PCM_CLK_SETUP_BSEL_MASK,
+		bsel);
+
+	/* Channel size configuration */
+	switch (slot_width) {
+	case 16:
+		chan_sz = MAX98390_PCM_MODE_CFG_CHANSZ_16;
+		break;
+	case 24:
+		chan_sz = MAX98390_PCM_MODE_CFG_CHANSZ_24;
+		break;
+	case 32:
+		chan_sz = MAX98390_PCM_MODE_CFG_CHANSZ_32;
+		break;
+	default:
+		dev_err(component->dev, "format unsupported %d\n",
+			slot_width);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98390->regmap,
+		MAX98390_PCM_MODE_CFG,
+		MAX98390_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+
+	/* Rx slot configuration */
+	regmap_write(max98390->regmap,
+		MAX98390_PCM_RX_EN_A,
+		rx_mask & 0xFF);
+	regmap_write(max98390->regmap,
+		MAX98390_PCM_RX_EN_B,
+		(rx_mask & 0xFF00) >> 8);
+
+	/* Tx slot Hi-Z configuration */
+	regmap_write(max98390->regmap,
+		MAX98390_PCM_TX_HIZ_CTRL_A,
+		~tx_mask & 0xFF);
+	regmap_write(max98390->regmap,
+		MAX98390_PCM_TX_HIZ_CTRL_B,
+		(~tx_mask & 0xFF00) >> 8);
+
+	return 0;
+}
+
+static int max98390_dai_set_sysclk(struct snd_soc_dai *dai,
+		int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	max98390->sysclk = freq;
+	return 0;
+}
+
+static const struct snd_soc_dai_ops max98390_dai_ops = {
+	.set_sysclk = max98390_dai_set_sysclk,
+	.set_fmt = max98390_dai_set_fmt,
+	.hw_params = max98390_dai_hw_params,
+	.set_tdm_slot = max98390_dai_tdm_slot,
+};
+
+static int max98390_dac_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_update_bits(max98390->regmap,
+			MAX98390_R203A_AMP_EN,
+			MAX98390_AMP_EN_MASK, 1);
+		regmap_update_bits(max98390->regmap,
+			MAX98390_R23FF_GLOBAL_EN,
+			MAX98390_GLOBAL_EN_MASK, 1);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		regmap_update_bits(max98390->regmap,
+			MAX98390_R23FF_GLOBAL_EN,
+			MAX98390_GLOBAL_EN_MASK, 0);
+		regmap_update_bits(max98390->regmap,
+			MAX98390_R203A_AMP_EN,
+			MAX98390_AMP_EN_MASK, 0);
+		break;
+	}
+	return 0;
+}
+
+static const char * const max98390_switch_text[] = {
+	"Left", "Right", "LeftRight"};
+
+static const char * const max98390_analog_gain_text[] = {
+	"Mute", "3dB", "6dB", "9dB", "12dB", "15dB", "18dB"};
+
+static const char * const max98390_boost_voltage_text[] = {
+	"6.5V", "6.625V", "6.75V", "6.875V", "7V", "7.125V", "7.25V", "7.375V",
+	"7.5V", "7.625V", "7.75V", "7.875V", "8V", "8.125V", "8.25V", "8.375V",
+	"8.5V", "8.625V", "8.75V", "8.875V", "9V", "9.125V", "9.25V", "9.375V",
+	"9.5V", "9.625V", "9.75V", "9.875V", "10V"
+};
+
+static DECLARE_TLV_DB_SCALE(max98390_digital_tlv, -8000, 50, 0);
+
+static SOC_ENUM_SINGLE_DECL(max98390_boost_voltage,
+		MAX98390_BOOST_CTRL0, 0,
+		max98390_boost_voltage_text);
+
+static const char * const max98390_current_limit_text[] = {
+	"0.00A", "0.50A", "1.00A", "1.05A", "1.10A", "1.15A", "1.20A", "1.25A",
+	"1.30A", "1.35A", "1.40A", "1.45A", "1.50A", "1.55A", "1.60A", "1.65A",
+	"1.70A", "1.75A", "1.80A", "1.85A", "1.90A", "1.95A", "2.00A", "2.05A",
+	"2.10A", "2.15A", "2.20A", "2.25A", "2.30A", "2.35A", "2.40A", "2.45A",
+	"2.50A", "2.55A", "2.60A", "2.65A", "2.70A", "2.75A", "2.80A", "2.85A",
+	"2.90A", "2.95A", "3.00A", "3.05A", "3.10A", "3.15A", "3.20A", "3.25A",
+	"3.30A", "3.35A", "3.40A", "3.45A", "3.50A", "3.55A", "3.60A", "3.65A",
+	"3.70A", "3.75A", "3.80A", "3.85A", "3.90A", "3.95A", "4.00A", "4.05A",
+	"4.10A"
+};
+
+static SOC_ENUM_SINGLE_DECL(max98390_spk_gain,
+		MAX98390_R203D_SPK_GAIN, 0,
+		max98390_analog_gain_text);
+
+static SOC_ENUM_SINGLE_DECL(max98390_current_limit,
+		MAX98390_BOOST_CTRL1, 0,
+		max98390_current_limit_text);
+
+static int max98390_ref_rdc_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	max98390->ref_rdc_value = ucontrol->value.integer.value[0];
+
+	regmap_write(max98390->regmap, DSM_TPROT_RECIP_RDC_ROOM_BYTE0,
+		max98390->ref_rdc_value & 0x000000ff);
+	regmap_write(max98390->regmap, DSM_TPROT_RECIP_RDC_ROOM_BYTE1,
+		(max98390->ref_rdc_value >> 8) & 0x000000ff);
+	regmap_write(max98390->regmap, DSM_TPROT_RECIP_RDC_ROOM_BYTE2,
+		(max98390->ref_rdc_value >> 16) & 0x000000ff);
+
+	return 0;
+}
+
+static int max98390_ref_rdc_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = max98390->ref_rdc_value;
+
+	return 0;
+}
+
+static int max98390_ambient_temp_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	max98390->ambient_temp_value = ucontrol->value.integer.value[0];
+
+	regmap_write(max98390->regmap, DSM_TPROT_ROOM_TEMPERATURE_BYTE1,
+		(max98390->ambient_temp_value >> 8) & 0x000000ff);
+	regmap_write(max98390->regmap, DSM_TPROT_ROOM_TEMPERATURE_BYTE0,
+		(max98390->ambient_temp_value) & 0x000000ff);
+
+	return 0;
+}
+
+static int max98390_ambient_temp_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = max98390->ambient_temp_value;
+
+	return 0;
+}
+
+static int max98390_adaptive_rdc_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+
+	dev_warn(component->dev, "Put adaptive rdc not supported\n");
+
+	return 0;
+}
+
+static int max98390_adaptive_rdc_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	int rdc, rdc0;
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	regmap_read(max98390->regmap, THERMAL_RDC_RD_BACK_BYTE1, &rdc);
+	regmap_read(max98390->regmap, THERMAL_RDC_RD_BACK_BYTE0, &rdc0);
+	rdc0 |= rdc << 8;
+	ucontrol->value.integer.value[0] = rdc0;
+
+	return 0;
+}
+
+static int max98390_dsm_calib_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+
+	dev_warn(component->dev, "Get dsm_calib_get not supported\n");
+
+	return 0;
+}
+
+static int max98390_dsm_calib_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+
+	max98390_dsm_calibrate(component);
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new max98390_snd_controls[] = {
+	SOC_SINGLE_TLV("Digital Volume", DSM_VOL_CTRL,
+		0, 184, 0,
+		max98390_digital_tlv),
+	SOC_ENUM("Spk Gain", max98390_spk_gain),
+	SOC_SINGLE("Ramp Up Bypass Switch", MAX98390_R2039_AMP_DSP_CFG,
+		MAX98390_AMP_DSP_CFG_RMP_UP_SHIFT, 1, 0),
+	SOC_SINGLE("Ramp Down Bypass Switch", MAX98390_R2039_AMP_DSP_CFG,
+		MAX98390_AMP_DSP_CFG_RMP_DN_SHIFT, 1, 0),
+	SOC_SINGLE("Boost Clock Phase", MAX98390_BOOST_CTRL3,
+		MAX98390_BOOST_CLK_PHASE_CFG_SHIFT, 3, 0),
+	SOC_ENUM("Boost Output Voltage", max98390_boost_voltage),
+	SOC_ENUM("Current Limit", max98390_current_limit),
+	SOC_SINGLE_EXT("DSM Rdc", SND_SOC_NOPM, 0, 0xffffff, 0,
+		max98390_ref_rdc_get, max98390_ref_rdc_put),
+	SOC_SINGLE_EXT("DSM Ambient Temp", SND_SOC_NOPM, 0, 0xffff, 0,
+		max98390_ambient_temp_get, max98390_ambient_temp_put),
+	SOC_SINGLE_EXT("DSM Adaptive Rdc", SND_SOC_NOPM, 0, 0xffff, 0,
+		max98390_adaptive_rdc_get, max98390_adaptive_rdc_put),
+	SOC_SINGLE_EXT("DSM Calibration", SND_SOC_NOPM, 0, 1, 0,
+		max98390_dsm_calib_get, max98390_dsm_calib_put),
+};
+
+static const struct soc_enum dai_sel_enum =
+	SOC_ENUM_SINGLE(MAX98390_PCM_CH_SRC_1,
+		MAX98390_PCM_RX_CH_SRC_SHIFT,
+		3, max98390_switch_text);
+
+static const struct snd_kcontrol_new max98390_dai_controls =
+	SOC_DAPM_ENUM("DAI Sel", dai_sel_enum);
+
+static const struct snd_soc_dapm_widget max98390_dapm_widgets[] = {
+	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
+		MAX98390_R203A_AMP_EN, 0, 0, max98390_dac_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("DAI Sel Mux", SND_SOC_NOPM, 0, 0,
+		&max98390_dai_controls),
+	SND_SOC_DAPM_OUTPUT("BE_OUT"),
+};
+
+static const struct snd_soc_dapm_route max98390_audio_map[] = {
+	/* Plabyack */
+	{"DAI Sel Mux", "Left", "Amp Enable"},
+	{"DAI Sel Mux", "Right", "Amp Enable"},
+	{"DAI Sel Mux", "LeftRight", "Amp Enable"},
+	{"BE_OUT", NULL, "DAI Sel Mux"},
+};
+
+static bool max98390_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98390_SOFTWARE_RESET ... MAX98390_INT_EN3:
+	case MAX98390_IRQ_CTRL ... MAX98390_WDOG_CTRL:
+	case MAX98390_MEAS_ADC_THERM_WARN_THRESH
+		... MAX98390_BROWNOUT_INFINITE_HOLD:
+	case MAX98390_BROWNOUT_LVL_HOLD ... THERMAL_COILTEMP_RD_BACK_BYTE0:
+	case DSMIG_DEBUZZER_THRESHOLD ... MAX98390_R24FF_REV_ID:
+		return true;
+	default:
+		return false;
+	}
+};
+
+static bool max98390_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98390_SOFTWARE_RESET ... MAX98390_INT_EN3:
+	case MAX98390_MEAS_ADC_CH0_READ ... MAX98390_MEAS_ADC_CH2_READ:
+	case MAX98390_PWR_GATE_STATUS ... MAX98390_BROWNOUT_STATUS:
+	case MAX98390_BROWNOUT_LOWEST_STATUS:
+	case MAX98390_ENV_TRACK_BOOST_VOUT_READ:
+	case DSM_STBASS_HPF_B0_BYTE0 ... DSM_DEBUZZER_ATTACK_TIME_BYTE2:
+	case THERMAL_RDC_RD_BACK_BYTE1 ... THERMAL_COILTEMP_RD_BACK_BYTE0:
+	case DSM_THERMAL_GAIN ... DSM_WBDRC_GAIN:
+		return true;
+	default:
+		return false;
+	}
+}
+
+#define MAX98390_RATES SNDRV_PCM_RATE_8000_48000
+
+#define MAX98390_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
+	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver max98390_dai[] = {
+	{
+		.name = "max98390-aif1",
+		.playback = {
+			.stream_name = "HiFi Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MAX98390_RATES,
+			.formats = MAX98390_FORMATS,
+		},
+		.capture = {
+			.stream_name = "HiFi Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MAX98390_RATES,
+			.formats = MAX98390_FORMATS,
+		},
+		.ops = &max98390_dai_ops,
+	}
+};
+
+static int max98390_dsm_init(struct snd_soc_component *component)
+{
+	int ret;
+	const char *filename;
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+	const struct firmware *fw = NULL;
+	char *dsm_param = NULL;
+
+	filename = "dsm_param.bin";
+	ret = request_firmware(&fw, filename, component->dev);
+	if (ret) {
+		dev_err(component->dev,
+			"Failed to acquire dsm params: %d\n", ret);
+		goto err;
+	}
+
+	dev_info(component->dev,
+		"max98390: param fw size %d\n",
+		fw->size);
+	dsm_param = (char *)fw->data;
+	dsm_param += MAX98390_DSM_PAYLOAD_OFFSET;
+	regmap_bulk_write(max98390->regmap, DSM_EQ_BQ1_B0_BYTE0,
+		dsm_param,
+		fw->size - MAX98390_DSM_PAYLOAD_OFFSET);
+	release_firmware(fw);
+	regmap_write(max98390->regmap, MAX98390_R23E1_DSP_GLOBAL_EN, 0x01);
+
+err:
+	return ret;
+}
+
+static int max98390_dsm_calibrate(struct snd_soc_component *component)
+{
+	unsigned int rdc, rdc_cal_result, temp;
+	unsigned int rdc_integer, rdc_factor;
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x81);
+	regmap_write(max98390->regmap, MAX98390_R23FF_GLOBAL_EN, 0x01);
+
+	regmap_read(max98390->regmap,
+		THERMAL_RDC_RD_BACK_BYTE1, &rdc);
+	regmap_read(max98390->regmap,
+		THERMAL_RDC_RD_BACK_BYTE0, &rdc_cal_result);
+	rdc_cal_result |= (rdc << 8) & 0x0000FFFF;
+	if (rdc_cal_result)
+		max98390->ref_rdc_value = 268435456U / rdc_cal_result;
+
+	regmap_read(max98390->regmap, MAX98390_MEAS_ADC_CH2_READ, &temp);
+	max98390->ambient_temp_value = temp * 52 - 1188;
+
+	rdc_integer =  rdc_cal_result * 937  / 65536;
+	rdc_factor = ((rdc_cal_result * 937 * 100) / 65536)
+					- (rdc_integer * 100);
+
+	dev_info(component->dev, "rdc resistance about %d.%02d ohm, reg=0x%X temp reg=0x%X\n",
+		 rdc_integer, rdc_factor, rdc_cal_result, temp);
+
+	regmap_write(max98390->regmap, MAX98390_R23FF_GLOBAL_EN, 0x00);
+	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x80);
+
+	return 0;
+}
+
+static int max98390_probe(struct snd_soc_component *component)
+{
+	struct max98390_priv *max98390 =
+		snd_soc_component_get_drvdata(component);
+
+	/* Update dsm bin param */
+	regmap_write(max98390->regmap, MAX98390_SOFTWARE_RESET, 0x01);
+	/* Sleep reset settle time */
+	msleep(20);
+	max98390_dsm_init(component);
+
+	/* Amp Setting */
+	regmap_write(max98390->regmap, MAX98390_CLK_MON, 0x6f);
+	regmap_write(max98390->regmap, MAX98390_PCM_RX_EN_A, 0x03);
+	regmap_write(max98390->regmap, MAX98390_R203D_SPK_GAIN, 0x05);
+	regmap_write(max98390->regmap, MAX98390_MEAS_EN, 0x03);
+	regmap_write(max98390->regmap, MAX98390_PWR_GATE_CTL, 0x2d);
+	regmap_write(max98390->regmap, MAX98390_ENV_TRACK_VOUT_HEADROOM, 0x0e);
+	regmap_write(max98390->regmap, MAX98390_BOOST_BYPASS1, 0x46);
+	regmap_write(max98390->regmap, MAX98390_FET_SCALING3, 0x03);
+
+	/* Dsm Setting */
+	regmap_write(max98390->regmap, DSM_VOL_CTRL, 0x94);
+	regmap_write(max98390->regmap, DSMIG_EN, 0x19);
+	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x80);
+	if (max98390->ref_rdc_value) {
+		regmap_write(max98390->regmap, DSM_TPROT_RECIP_RDC_ROOM_BYTE0,
+			max98390->ref_rdc_value & 0x000000ff);
+		regmap_write(max98390->regmap, DSM_TPROT_RECIP_RDC_ROOM_BYTE1,
+			(max98390->ref_rdc_value >> 8) & 0x000000ff);
+		regmap_write(max98390->regmap, DSM_TPROT_RECIP_RDC_ROOM_BYTE2,
+			(max98390->ref_rdc_value >> 16) & 0x000000ff);
+	}
+	if (max98390->ambient_temp_value) {
+		regmap_write(max98390->regmap, DSM_TPROT_ROOM_TEMPERATURE_BYTE1,
+			(max98390->ambient_temp_value >> 8) & 0x000000ff);
+		regmap_write(max98390->regmap, DSM_TPROT_ROOM_TEMPERATURE_BYTE0,
+			(max98390->ambient_temp_value) & 0x000000ff);
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int max98390_suspend(struct device *dev)
+{
+	struct max98390_priv *max98390 = dev_get_drvdata(dev);
+
+	dev_info(dev, "%s:Enter\n", __func__);
+
+	regcache_cache_only(max98390->regmap, true);
+	regcache_mark_dirty(max98390->regmap);
+
+	return 0;
+}
+
+static int max98390_resume(struct device *dev)
+{
+	struct max98390_priv *max98390 = dev_get_drvdata(dev);
+
+	dev_info(dev, "%s:Enter\n", __func__);
+
+	regcache_cache_only(max98390->regmap, false);
+	regcache_sync(max98390->regmap);
+
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops max98390_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(max98390_suspend, max98390_resume)
+};
+
+static const struct snd_soc_component_driver soc_codec_dev_max98390 = {
+	.probe			= max98390_probe,
+	.controls		= max98390_snd_controls,
+	.num_controls		= ARRAY_SIZE(max98390_snd_controls),
+	.dapm_widgets		= max98390_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(max98390_dapm_widgets),
+	.dapm_routes		= max98390_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(max98390_audio_map),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct regmap_config max98390_regmap = {
+	.reg_bits         = 16,
+	.val_bits         = 8,
+	.max_register     = MAX98390_R24FF_REV_ID,
+	.reg_defaults     = max98390_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(max98390_reg_defaults),
+	.readable_reg	  = max98390_readable_register,
+	.volatile_reg	  = max98390_volatile_reg,
+	.cache_type       = REGCACHE_RBTREE,
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id max98390_dt_ids[] = {
+	{ .compatible = "maxim,max98390", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max98390_dt_ids);
+#endif
+
+static int max98390_i2c_probe(struct i2c_client *i2c,
+		const struct i2c_device_id *id)
+{
+	int ret = 0;
+	int reg = 0;
+
+	struct max98390_priv *max98390 = NULL;
+	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
+
+	dev_info(&i2c->dev, "ASoC: MAX98390 i2c probe\n");
+
+	ret = i2c_check_functionality(adapter,
+		I2C_FUNC_SMBUS_BYTE
+		| I2C_FUNC_SMBUS_BYTE_DATA);
+	if (!ret) {
+		dev_err(&i2c->dev, "I2C check functionality failed\n");
+		return -ENXIO;
+	}
+
+	max98390 = devm_kzalloc(&i2c->dev, sizeof(*max98390), GFP_KERNEL);
+	if (!max98390) {
+		ret = -ENOMEM;
+		return ret;
+	}
+	i2c_set_clientdata(i2c, max98390);
+
+	ret = device_property_read_u32(&i2c->dev, "maxim,temperature_calib",
+				       &max98390->ambient_temp_value);
+	if (ret) {
+		dev_info(&i2c->dev,
+			 "no optional property 'temperature_calib' found, default:\n");
+	}
+	ret = device_property_read_u32(&i2c->dev, "maxim,r0_calib",
+				       &max98390->ref_rdc_value);
+	if (ret) {
+		dev_info(&i2c->dev,
+			 "no optional property 'r0_calib' found, default:\n");
+	}
+
+	dev_info(&i2c->dev,
+		"%s: r0_calib: 0x%x,temperature_calib: 0x%x",
+		__func__, max98390->ref_rdc_value,
+		max98390->ambient_temp_value);
+
+	/* regmap initialization */
+	max98390->regmap = devm_regmap_init_i2c(i2c, &max98390_regmap);
+	if (IS_ERR(max98390->regmap)) {
+		ret = PTR_ERR(max98390->regmap);
+		dev_err(&i2c->dev,
+			"Failed to allocate regmap: %d\n", ret);
+		return ret;
+	}
+
+	/* Check Revision ID */
+	ret = regmap_read(max98390->regmap,
+		MAX98390_R24FF_REV_ID, &reg);
+	if (ret < 0) {
+		dev_err(&i2c->dev,
+			"ret=%d, Failed to read: 0x%02X\n",
+			ret, MAX98390_R24FF_REV_ID);
+		return ret;
+	}
+	dev_info(&i2c->dev, "MAX98390 revisionID: 0x%02X\n", reg);
+
+	ret = devm_snd_soc_register_component(&i2c->dev,
+			&soc_codec_dev_max98390,
+			max98390_dai, ARRAY_SIZE(max98390_dai));
+
+	return ret;
+}
+
+static const struct i2c_device_id max98390_i2c_id[] = {
+	{ "max98390", 0},
+	{},
+};
+
+MODULE_DEVICE_TABLE(i2c, max98390_i2c_id);
+
+#if defined(CONFIG_OF)
+static const struct of_device_id max98390_of_match[] = {
+	{ .compatible = "maxim,max98390", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, max98390_of_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id max98390_acpi_match[] = {
+	{ "MX98390", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, max98390_acpi_match);
+#endif
+
+static struct i2c_driver max98390_i2c_driver = {
+	.driver = {
+		.name = "max98390",
+		.of_match_table = of_match_ptr(max98390_of_match),
+		.acpi_match_table = ACPI_PTR(max98390_acpi_match),
+		.pm = &max98390_pm,
+	},
+	.probe = max98390_i2c_probe,
+	.id_table = max98390_i2c_id,
+};
+
+module_i2c_driver(max98390_i2c_driver)
+
+MODULE_DESCRIPTION("ALSA SoC MAX98390 driver");
+MODULE_AUTHOR("Steve Lee <steves.lee@maximintegrated.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/max98390.h b/sound/soc/codecs/max98390.h
new file mode 100644
index 000000000000..34af8646187f
--- /dev/null
+++ b/sound/soc/codecs/max98390.h
@@ -0,0 +1,661 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020, Maxim Integrated.
+ */
+
+#ifndef _MAX98390_H
+#define _MAX98390_H
+
+/* MAX98390 Register Address */
+#define MAX98390_SOFTWARE_RESET 0x2000
+#define MAX98390_INT_RAW1 0x2002
+#define MAX98390_INT_RAW2 0x2003
+#define MAX98390_INT_RAW3 0x2004
+#define MAX98390_INT_STATE1 0x2005
+#define MAX98390_INT_STATE2 0x2006
+#define MAX98390_INT_STATE3 0x2007
+#define MAX98390_INT_FLAG1 0x2008
+#define MAX98390_INT_FLAG2 0x2009
+#define MAX98390_INT_FLAG3 0x200a
+#define MAX98390_INT_EN1 0x200b
+#define MAX98390_INT_EN2 0x200c
+#define MAX98390_INT_EN3 0x200d
+#define MAX98390_INT_FLAG_CLR1 0x200e
+#define MAX98390_INT_FLAG_CLR2 0x200f
+#define MAX98390_INT_FLAG_CLR3 0x2010
+#define MAX98390_IRQ_CTRL 0x2011
+#define MAX98390_CLK_MON 0x2012
+#define MAX98390_DAT_MON 0x2014
+#define MAX98390_WDOG_CTRL 0x2015
+#define MAX98390_WDOG_RST 0x2016
+#define MAX98390_MEAS_ADC_THERM_WARN_THRESH 0x2017
+#define MAX98390_MEAS_ADC_THERM_SHDN_THRESH 0x2018
+#define MAX98390_MEAS_ADC_THERM_HYSTERESIS 0x2019
+#define MAX98390_PIN_CFG 0x201a
+#define MAX98390_PCM_RX_EN_A 0x201b
+#define MAX98390_PCM_RX_EN_B 0x201c
+#define MAX98390_PCM_TX_EN_A 0x201d
+#define MAX98390_PCM_TX_EN_B 0x201e
+#define MAX98390_PCM_TX_HIZ_CTRL_A 0x201f
+#define MAX98390_PCM_TX_HIZ_CTRL_B 0x2020
+#define MAX98390_PCM_CH_SRC_1 0x2021
+#define MAX98390_PCM_CH_SRC_2 0x2022
+#define MAX98390_PCM_CH_SRC_3 0x2023
+#define MAX98390_PCM_MODE_CFG 0x2024
+#define MAX98390_PCM_MASTER_MODE 0x2025
+#define MAX98390_PCM_CLK_SETUP 0x2026
+#define MAX98390_PCM_SR_SETUP 0x2027
+#define MAX98390_ICC_RX_EN_A 0x202c
+#define MAX98390_ICC_RX_EN_B 0x202d
+#define MAX98390_ICC_TX_EN_A 0x202e
+#define MAX98390_ICC_TX_EN_B 0x202f
+#define MAX98390_ICC_HIZ_MANUAL_MODE 0x2030
+#define MAX98390_ICC_TX_HIZ_EN_A 0x2031
+#define MAX98390_ICC_TX_HIZ_EN_B 0x2032
+#define MAX98390_ICC_LNK_EN 0x2033
+#define MAX98390_R2039_AMP_DSP_CFG 0x2039
+#define MAX98390_R203A_AMP_EN 0x203a
+#define MAX98390_TONE_GEN_DC_CFG 0x203b
+#define MAX98390_SPK_SRC_SEL 0x203c
+#define MAX98390_R203D_SPK_GAIN 0x203d
+#define MAX98390_SSM_CFG 0x203e
+#define MAX98390_MEAS_EN 0x203f
+#define MAX98390_MEAS_DSP_CFG 0x2040
+#define MAX98390_BOOST_CTRL0 0x2041
+#define MAX98390_BOOST_CTRL3 0x2042
+#define MAX98390_BOOST_CTRL1 0x2043
+#define MAX98390_MEAS_ADC_CFG 0x2044
+#define MAX98390_MEAS_ADC_BASE_MSB 0x2045
+#define MAX98390_MEAS_ADC_BASE_LSB 0x2046
+#define MAX98390_ADC_CH0_DIVIDE 0x2047
+#define MAX98390_ADC_CH1_DIVIDE 0x2048
+#define MAX98390_ADC_CH2_DIVIDE 0x2049
+#define MAX98390_ADC_CH0_FILT_CFG 0x204a
+#define MAX98390_ADC_CH1_FILT_CFG 0x204b
+#define MAX98390_ADC_CH2_FILT_CFG 0x204c
+#define MAX98390_MEAS_ADC_CH0_READ 0x204d
+#define MAX98390_MEAS_ADC_CH1_READ 0x204e
+#define MAX98390_MEAS_ADC_CH2_READ 0x204f
+#define MAX98390_PWR_GATE_CTL 0x2050
+#define MAX98390_PWR_GATE_STATUS 0x2051
+#define MAX98390_VBAT_LOW_STATUS 0x2052
+#define MAX98390_PVDD_LOW_STATUS 0x2053
+#define MAX98390_BROWNOUT_STATUS 0x2054
+#define MAX98390_BROWNOUT_EN 0x2055
+#define MAX98390_BROWNOUT_INFINITE_HOLD 0x2056
+#define MAX98390_BROWNOUT_INFINITE_HOLD_CLR 0x2057
+#define MAX98390_BROWNOUT_LVL_HOLD 0x2058
+#define MAX98390_BROWNOUT_LVL1_THRESH 0x2059
+#define MAX98390_BROWNOUT_LVL2_THRESH 0x205a
+#define MAX98390_BROWNOUT_LVL3_THRESH 0x205b
+#define MAX98390_BROWNOUT_LVL4_THRESH 0x205c
+#define MAX98390_BROWNOUT_THRESH_HYSTERYSIS 0x205d
+#define MAX98390_BROWNOUT_AMP_LIMITER_ATK_REL 0x205e
+#define MAX98390_BROWNOUT_AMP_GAIN_ATK_REL 0x205f
+#define MAX98390_BROWNOUT_AMP1_CLIP_MODE 0x2060
+#define MAX98390_BROWNOUT_LVL1_CUR_LIMIT 0x2061
+#define MAX98390_BROWNOUT_LVL1_AMP1_CTRL1 0x2062
+#define MAX98390_BROWNOUT_LVL1_AMP1_CTRL2 0x2063
+#define MAX98390_BROWNOUT_LVL1_AMP1_CTRL3 0x2064
+#define MAX98390_BROWNOUT_LVL2_CUR_LIMIT 0x2065
+#define MAX98390_BROWNOUT_LVL2_AMP1_CTRL1 0x2066
+#define MAX98390_BROWNOUT_LVL2_AMP1_CTRL2 0x2067
+#define MAX98390_BROWNOUT_LVL2_AMP1_CTRL3 0x2068
+#define MAX98390_BROWNOUT_LVL3_CUR_LIMIT 0x2069
+#define MAX98390_BROWNOUT_LVL3_AMP1_CTRL1 0x206a
+#define MAX98390_BROWNOUT_LVL3_AMP1_CTRL2 0x206b
+#define MAX98390_BROWNOUT_LVL3_AMP1_CTRL3 0x206c
+#define MAX98390_BROWNOUT_LVL4_CUR_LIMIT 0x206d
+#define MAX98390_BROWNOUT_LVL4_AMP1_CTRL1 0x206e
+#define MAX98390_BROWNOUT_LVL4_AMP1_CTRL2 0x206f
+#define MAX98390_BROWNOUT_LVL4_AMP1_CTRL3 0x2070
+#define MAX98390_BROWNOUT_LOWEST_STATUS 0x2071
+#define MAX98390_BROWNOUT_ILIM_HLD 0x2072
+#define MAX98390_BROWNOUT_LIM_HLD 0x2073
+#define MAX98390_BROWNOUT_CLIP_HLD 0x2074
+#define MAX98390_BROWNOUT_GAIN_HLD 0x2075
+#define MAX98390_ENV_TRACK_VOUT_HEADROOM 0x2076
+#define MAX98390_ENV_TRACK_BOOST_VOUT_DELAY 0x2077
+#define MAX98390_ENV_TRACK_REL_RATE 0x2078
+#define MAX98390_ENV_TRACK_HOLD_RATE 0x2079
+#define MAX98390_ENV_TRACK_CTRL 0x207a
+#define MAX98390_ENV_TRACK_BOOST_VOUT_READ 0x207b
+#define MAX98390_BOOST_BYPASS1 0x207c
+#define MAX98390_BOOST_BYPASS2 0x207d
+#define MAX98390_BOOST_BYPASS3 0x207e
+#define MAX98390_FET_SCALING1 0x207f
+#define MAX98390_FET_SCALING2 0x2080
+#define MAX98390_FET_SCALING3 0x2081
+#define MAX98390_FET_SCALING4 0x2082
+#define MAX98390_SPK_SPEEDUP 0x2084
+
+#define DSM_STBASS_HPF_B0_BYTE0 0x2101
+#define DSM_STBASS_HPF_B0_BYTE1 0x2102
+#define DSM_STBASS_HPF_B0_BYTE2 0x2103
+#define DSM_STBASS_HPF_B1_BYTE0 0x2105
+#define DSM_STBASS_HPF_B1_BYTE1 0x2106
+#define DSM_STBASS_HPF_B1_BYTE2 0x2107
+#define DSM_STBASS_HPF_B2_BYTE0 0x2109
+#define DSM_STBASS_HPF_B2_BYTE1 0x210a
+#define DSM_STBASS_HPF_B2_BYTE2 0x210b
+#define DSM_STBASS_HPF_A1_BYTE0 0x210d
+#define DSM_STBASS_HPF_A1_BYTE1 0x210e
+#define DSM_STBASS_HPF_A1_BYTE2 0x210f
+#define DSM_STBASS_HPF_A2_BYTE0 0x2111
+#define DSM_STBASS_HPF_A2_BYTE1 0x2112
+#define DSM_STBASS_HPF_A2_BYTE2 0x2113
+#define DSM_STBASS_LPF_B0_BYTE0 0x2115
+#define DSM_STBASS_LPF_B0_BYTE1 0x2116
+#define DSM_STBASS_LPF_B0_BYTE2 0x2117
+#define DSM_STBASS_LPF_B1_BYTE0 0x2119
+#define DSM_STBASS_LPF_B1_BYTE1 0x211a
+#define DSM_STBASS_LPF_B1_BYTE2 0x211b
+#define DSM_STBASS_LPF_B2_BYTE0 0x211d
+#define DSM_STBASS_LPF_B2_BYTE1 0x211e
+#define DSM_STBASS_LPF_B2_BYTE2 0x211f
+#define DSM_STBASS_LPF_A1_BYTE0 0x2121
+#define DSM_STBASS_LPF_A1_BYTE1 0x2122
+#define DSM_STBASS_LPF_A1_BYTE2 0x2123
+#define DSM_STBASS_LPF_A2_BYTE0 0x2125
+#define DSM_STBASS_LPF_A2_BYTE1 0x2126
+#define DSM_STBASS_LPF_A2_BYTE2 0x2127
+#define DSM_EQ_BQ1_B0_BYTE0 0x2129
+#define DSM_EQ_BQ1_B0_BYTE1 0x212a
+#define DSM_EQ_BQ1_B0_BYTE2 0x212b
+#define DSM_EQ_BQ1_B1_BYTE0 0x212d
+#define DSM_EQ_BQ1_B1_BYTE1 0x212e
+#define DSM_EQ_BQ1_B1_BYTE2 0x212f
+#define DSM_EQ_BQ1_B2_BYTE0 0x2131
+#define DSM_EQ_BQ1_B2_BYTE1 0x2132
+#define DSM_EQ_BQ1_B2_BYTE2 0x2133
+#define DSM_EQ_BQ1_A1_BYTE0 0x2135
+#define DSM_EQ_BQ1_A1_BYTE1 0x2136
+#define DSM_EQ_BQ1_A1_BYTE2 0x2137
+#define DSM_EQ_BQ1_A2_BYTE0 0x2139
+#define DSM_EQ_BQ1_A2_BYTE1 0x213a
+#define DSM_EQ_BQ1_A2_BYTE2 0x213b
+#define DSM_EQ_BQ2_B0_BYTE0 0x213d
+#define DSM_EQ_BQ2_B0_BYTE1 0x213e
+#define DSM_EQ_BQ2_B0_BYTE2 0x213f
+#define DSM_EQ_BQ2_B1_BYTE0 0x2141
+#define DSM_EQ_BQ2_B1_BYTE1 0x2142
+#define DSM_EQ_BQ2_B1_BYTE2 0x2143
+#define DSM_EQ_BQ2_B2_BYTE0 0x2145
+#define DSM_EQ_BQ2_B2_BYTE1 0x2146
+#define DSM_EQ_BQ2_B2_BYTE2 0x2147
+#define DSM_EQ_BQ2_A1_BYTE0 0x2149
+#define DSM_EQ_BQ2_A1_BYTE1 0x214a
+#define DSM_EQ_BQ2_A1_BYTE2 0x214b
+#define DSM_EQ_BQ2_A2_BYTE0 0x214d
+#define DSM_EQ_BQ2_A2_BYTE1 0x214e
+#define DSM_EQ_BQ2_A2_BYTE2 0x214f
+#define DSM_EQ_BQ3_B0_BYTE0 0x2151
+#define DSM_EQ_BQ3_B0_BYTE1 0x2152
+#define DSM_EQ_BQ3_B0_BYTE2 0x2153
+#define DSM_EQ_BQ3_B1_BYTE0 0x2155
+#define DSM_EQ_BQ3_B1_BYTE1 0x2156
+#define DSM_EQ_BQ3_B1_BYTE2 0x2157
+#define DSM_EQ_BQ3_B2_BYTE0 0x2159
+#define DSM_EQ_BQ3_B2_BYTE1 0x215a
+#define DSM_EQ_BQ3_B2_BYTE2 0x215b
+#define DSM_EQ_BQ3_A1_BYTE0 0x215d
+#define DSM_EQ_BQ3_A1_BYTE1 0x215e
+#define DSM_EQ_BQ3_A1_BYTE2 0x215f
+#define DSM_EQ_BQ3_A2_BYTE0 0x2161
+#define DSM_EQ_BQ3_A2_BYTE1 0x2162
+#define DSM_EQ_BQ3_A2_BYTE2 0x2163
+#define DSM_EQ_BQ4_B0_BYTE0 0x2165
+#define DSM_EQ_BQ4_B0_BYTE1 0x2166
+#define DSM_EQ_BQ4_B0_BYTE2 0x2167
+#define DSM_EQ_BQ4_B1_BYTE0 0x2169
+#define DSM_EQ_BQ4_B1_BYTE1 0x216a
+#define DSM_EQ_BQ4_B1_BYTE2 0x216b
+#define DSM_EQ_BQ4_B2_BYTE0 0x216d
+#define DSM_EQ_BQ4_B2_BYTE1 0x216e
+#define DSM_EQ_BQ4_B2_BYTE2 0x216f
+#define DSM_EQ_BQ4_A1_BYTE0 0x2171
+#define DSM_EQ_BQ4_A1_BYTE1 0x2172
+#define DSM_EQ_BQ4_A1_BYTE2 0x2173
+#define DSM_EQ_BQ4_A2_BYTE0 0x2175
+#define DSM_EQ_BQ4_A2_BYTE1 0x2176
+#define DSM_EQ_BQ4_A2_BYTE2 0x2177
+#define DSM_EQ_BQ5_B0_BYTE0 0x2179
+#define DSM_EQ_BQ5_B0_BYTE1 0x217a
+#define DSM_EQ_BQ5_B0_BYTE2 0x217b
+#define DSM_EQ_BQ5_B1_BYTE0 0x217d
+#define DSM_EQ_BQ5_B1_BYTE1 0x217e
+#define DSM_EQ_BQ5_B1_BYTE2 0x217f
+#define DSM_EQ_BQ5_B2_BYTE0 0x2181
+#define DSM_EQ_BQ5_B2_BYTE1 0x2182
+#define DSM_EQ_BQ5_B2_BYTE2 0x2183
+#define DSM_EQ_BQ5_A1_BYTE0 0x2185
+#define DSM_EQ_BQ5_A1_BYTE1 0x2186
+#define DSM_EQ_BQ5_A1_BYTE2 0x2187
+#define DSM_EQ_BQ5_A2_BYTE0 0x2189
+#define DSM_EQ_BQ5_A2_BYTE1 0x218a
+#define DSM_EQ_BQ5_A2_BYTE2 0x218b
+#define DSM_EQ_BQ6_B0_BYTE0 0x218d
+#define DSM_EQ_BQ6_B0_BYTE1 0x218e
+#define DSM_EQ_BQ6_B0_BYTE2 0x218f
+#define DSM_EQ_BQ6_B1_BYTE0 0x2191
+#define DSM_EQ_BQ6_B1_BYTE1 0x2192
+#define DSM_EQ_BQ6_B1_BYTE2 0x2193
+#define DSM_EQ_BQ6_B2_BYTE0 0x2195
+#define DSM_EQ_BQ6_B2_BYTE1 0x2196
+#define DSM_EQ_BQ6_B2_BYTE2 0x2197
+#define DSM_EQ_BQ6_A1_BYTE0 0x2199
+#define DSM_EQ_BQ6_A1_BYTE1 0x219a
+#define DSM_EQ_BQ6_A1_BYTE2 0x219b
+#define DSM_EQ_BQ6_A2_BYTE0 0x219d
+#define DSM_EQ_BQ6_A2_BYTE1 0x219e
+#define DSM_EQ_BQ6_A2_BYTE2 0x219f
+#define DSM_EQ_BQ7_B0_BYTE0 0x21a1
+#define DSM_EQ_BQ7_B0_BYTE1 0x21a2
+#define DSM_EQ_BQ7_B0_BYTE2 0x21a3
+#define DSM_EQ_BQ7_B1_BYTE0 0x21a5
+#define DSM_EQ_BQ7_B1_BYTE1 0x21a6
+#define DSM_EQ_BQ7_B1_BYTE2 0x21a7
+#define DSM_EQ_BQ7_B2_BYTE0 0x21a9
+#define DSM_EQ_BQ7_B2_BYTE1 0x21aa
+#define DSM_EQ_BQ7_B2_BYTE2 0x21ab
+#define DSM_EQ_BQ7_A1_BYTE0 0x21ad
+#define DSM_EQ_BQ7_A1_BYTE1 0x21ae
+#define DSM_EQ_BQ7_A1_BYTE2 0x21af
+#define DSM_EQ_BQ7_A2_BYTE0 0x21b1
+#define DSM_EQ_BQ7_A2_BYTE1 0x21b2
+#define DSM_EQ_BQ7_A2_BYTE2 0x21b3
+#define DSM_EQ_BQ8_B0_BYTE0 0x21b5
+#define DSM_EQ_BQ8_B0_BYTE1 0x21b6
+#define DSM_EQ_BQ8_B0_BYTE2 0x21b7
+#define DSM_EQ_BQ8_B1_BYTE0 0x21b9
+#define DSM_EQ_BQ8_B1_BYTE1 0x21ba
+#define DSM_EQ_BQ8_B1_BYTE2 0x21bb
+#define DSM_EQ_BQ8_B2_BYTE0 0x21bd
+#define DSM_EQ_BQ8_B2_BYTE1 0x21be
+#define DSM_EQ_BQ8_B2_BYTE2 0x21bf
+#define DSM_EQ_BQ8_A1_BYTE0 0x21c1
+#define DSM_EQ_BQ8_A1_BYTE1 0x21c2
+#define DSM_EQ_BQ8_A1_BYTE2 0x21c3
+#define DSM_EQ_BQ8_A2_BYTE0 0x21c5
+#define DSM_EQ_BQ8_A2_BYTE1 0x21c6
+#define DSM_EQ_BQ8_A2_BYTE2 0x21c7
+#define DSM_LFX_BQ_B0_BYTE0 0x21c9
+#define DSM_LFX_BQ_B0_BYTE1 0x21ca
+#define DSM_LFX_BQ_B0_BYTE2 0x21cb
+#define DSM_LFX_BQ_B1_BYTE0 0x21cd
+#define DSM_LFX_BQ_B1_BYTE1 0x21ce
+#define DSM_LFX_BQ_B1_BYTE2 0x21cf
+#define DSM_LFX_BQ_B2_BYTE0 0x21d1
+#define DSM_LFX_BQ_B2_BYTE1 0x21d2
+#define DSM_LFX_BQ_B2_BYTE2 0x21d3
+#define DSM_LFX_BQ_A1_BYTE0 0x21d5
+#define DSM_LFX_BQ_A1_BYTE1 0x21d6
+#define DSM_LFX_BQ_A1_BYTE2 0x21d7
+#define DSM_LFX_BQ_A2_BYTE0 0x21d9
+#define DSM_LFX_BQ_A2_BYTE1 0x21da
+#define DSM_LFX_BQ_A2_BYTE2 0x21db
+#define DSM_PPR_HPF_B0_BYTE0 0x21dd
+#define DSM_PPR_HPF_B0_BYTE1 0x21de
+#define DSM_PPR_HPF_B0_BYTE2 0x21df
+#define DSM_PPR_HPF_B1_BYTE0 0x21e1
+#define DSM_PPR_HPF_B1_BYTE1 0x21e2
+#define DSM_PPR_HPF_B1_BYTE2 0x21e3
+#define DSM_PPR_HPF_B2_BYTE0 0x21e5
+#define DSM_PPR_HPF_B2_BYTE1 0x21e6
+#define DSM_PPR_HPF_B2_BYTE2 0x21e7
+#define DSM_PPR_HPF_A1_BYTE0 0x21e9
+#define DSM_PPR_HPF_A1_BYTE1 0x21ea
+#define DSM_PPR_HPF_A1_BYTE2 0x21eb
+#define DSM_PPR_HPF_A2_BYTE0 0x21ed
+#define DSM_PPR_HPF_A2_BYTE1 0x21ee
+#define DSM_PPR_HPF_A2_BYTE2 0x21ef
+#define DSM_PPR_LPF_B0_BYTE0 0x21f1
+#define DSM_PPR_LPF_B0_BYTE1 0x21f2
+#define DSM_PPR_LPF_B0_BYTE2 0x21f3
+#define DSM_PPR_LPF_B1_BYTE0 0x21f5
+#define DSM_PPR_LPF_B1_BYTE1 0x21f6
+#define DSM_PPR_LPF_B1_BYTE2 0x21f7
+#define DSM_PPR_LPF_B2_BYTE0 0x21f9
+#define DSM_PPR_LPF_B2_BYTE1 0x21fa
+#define DSM_PPR_LPF_B2_BYTE2 0x21fb
+#define DSM_PPR_LPF_A1_BYTE0 0x21fd
+#define DSM_PPR_LPF_A1_BYTE1 0x21fe
+#define DSM_PPR_LPF_A1_BYTE2 0x21ff
+#define DSM_PPR_LPF_A2_BYTE0 0x2201
+#define DSM_PPR_LPF_A2_BYTE1 0x2202
+#define DSM_PPR_LPF_A2_BYTE2 0x2203
+#define DSM_SPL_BQ_B0_BYTE0 0x2205
+#define DSM_SPL_BQ_B0_BYTE1 0x2206
+#define DSM_SPL_BQ_B0_BYTE2 0x2207
+#define DSM_SPL_BQ_B1_BYTE0 0x2209
+#define DSM_SPL_BQ_B1_BYTE1 0x220a
+#define DSM_SPL_BQ_B1_BYTE2 0x220b
+#define DSM_SPL_BQ_B2_BYTE0 0x220d
+#define DSM_SPL_BQ_B2_BYTE1 0x220e
+#define DSM_SPL_BQ_B2_BYTE2 0x220f
+#define DSM_SPL_BQ_A1_BYTE0 0x2211
+#define DSM_SPL_BQ_A1_BYTE1 0x2212
+#define DSM_SPL_BQ_A1_BYTE2 0x2213
+#define DSM_SPL_BQ_A2_BYTE0 0x2215
+#define DSM_SPL_BQ_A2_BYTE1 0x2216
+#define DSM_SPL_BQ_A2_BYTE2 0x2217
+#define DSM_EXCUR_BQ_B0_BYTE0 0x2219
+#define DSM_EXCUR_BQ_B0_BYTE1 0x221a
+#define DSM_EXCUR_BQ_B0_BYTE2 0x221b
+#define DSM_EXCUR_BQ_B1_BYTE0 0x221d
+#define DSM_EXCUR_BQ_B1_BYTE1 0x221e
+#define DSM_EXCUR_BQ_B1_BYTE2 0x221f
+#define DSM_EXCUR_BQ_B2_BYTE0 0x2221
+#define DSM_EXCUR_BQ_B2_BYTE1 0x2222
+#define DSM_EXCUR_BQ_B2_BYTE2 0x2223
+#define DSM_EXCUR_BQ_A1_BYTE0 0x2225
+#define DSM_EXCUR_BQ_A1_BYTE1 0x2226
+#define DSM_EXCUR_BQ_A1_BYTE2 0x2227
+#define DSM_EXCUR_BQ_A2_BYTE0 0x2229
+#define DSM_EXCUR_BQ_A2_BYTE1 0x222a
+#define DSM_EXCUR_BQ_A2_BYTE2 0x222b
+#define DSM_EXCPROT_HPF1_B0_BYTE0 0x222d
+#define DSM_EXCPROT_HPF1_B0_BYTE1 0x222e
+#define DSM_EXCPROT_HPF1_B0_BYTE2 0x222f
+#define DSM_EXCPROT_HPF1_B1_BYTE0 0x2231
+#define DSM_EXCPROT_HPF1_B1_BYTE1 0x2232
+#define DSM_EXCPROT_HPF1_B1_BYTE2 0x2233
+#define DSM_EXCPROT_HPF1_B2_BYTE0 0x2235
+#define DSM_EXCPROT_HPF1_B2_BYTE1 0x2236
+#define DSM_EXCPROT_HPF1_B2_BYTE2 0x2237
+#define DSM_EXCPROT_HPF1_A1_BYTE0 0x2239
+#define DSM_EXCPROT_HPF1_A1_BYTE1 0x223a
+#define DSM_EXCPROT_HPF1_A1_BYTE2 0x223b
+#define DSM_EXCPROT_HPF1_A2_BYTE0 0x223d
+#define DSM_EXCPROT_HPF1_A2_BYTE1 0x223e
+#define DSM_EXCPROT_HPF1_A2_BYTE2 0x223f
+#define DSM_EXCPROT_HPF2_B0_BYTE0 0x2241
+#define DSM_EXCPROT_HPF2_B0_BYTE1 0x2242
+#define DSM_EXCPROT_HPF2_B0_BYTE2 0x2243
+#define DSM_EXCPROT_HPF2_B1_BYTE0 0x2245
+#define DSM_EXCPROT_HPF2_B1_BYTE1 0x2246
+#define DSM_EXCPROT_HPF2_B1_BYTE2 0x2247
+#define DSM_EXCPROT_HPF2_B2_BYTE0 0x2249
+#define DSM_EXCPROT_HPF2_B2_BYTE1 0x224a
+#define DSM_EXCPROT_HPF2_B2_BYTE2 0x224b
+#define DSM_EXCPROT_HPF2_A1_BYTE0 0x224d
+#define DSM_EXCPROT_HPF2_A1_BYTE1 0x224e
+#define DSM_EXCPROT_HPF2_A1_BYTE2 0x224f
+#define DSM_EXCPROT_HPF2_A2_BYTE0 0x2251
+#define DSM_EXCPROT_HPF2_A2_BYTE1 0x2252
+#define DSM_EXCPROT_HPF2_A2_BYTE2 0x2253
+#define DSM_EXCPROT_HPF3_B0_BYTE0 0x2255
+#define DSM_EXCPROT_HPF3_B0_BYTE1 0x2256
+#define DSM_EXCPROT_HPF3_B0_BYTE2 0x2257
+#define DSM_EXCPROT_HPF3_B1_BYTE0 0x2259
+#define DSM_EXCPROT_HPF3_B1_BYTE1 0x225a
+#define DSM_EXCPROT_HPF3_B1_BYTE2 0x225b
+#define DSM_EXCPROT_HPF3_B2_BYTE0 0x225d
+#define DSM_EXCPROT_HPF3_B2_BYTE1 0x225e
+#define DSM_EXCPROT_HPF3_B2_BYTE2 0x225f
+#define DSM_EXCPROT_HPF3_A1_BYTE0 0x2261
+#define DSM_EXCPROT_HPF3_A1_BYTE1 0x2262
+#define DSM_EXCPROT_HPF3_A1_BYTE2 0x2263
+#define DSM_EXCPROT_HPF3_A2_BYTE0 0x2265
+#define DSM_EXCPROT_HPF3_A2_BYTE1 0x2266
+#define DSM_EXCPROT_HPF3_A2_BYTE2 0x2267
+#define DSM_EXCPROT_HPF4_B0_BYTE0 0x2269
+#define DSM_EXCPROT_HPF4_B0_BYTE1 0x226a
+#define DSM_EXCPROT_HPF4_B0_BYTE2 0x226b
+#define DSM_EXCPROT_HPF4_B1_BYTE0 0x226d
+#define DSM_EXCPROT_HPF4_B1_BYTE1 0x226e
+#define DSM_EXCPROT_HPF4_B1_BYTE2 0x226f
+#define DSM_EXCPROT_HPF4_B2_BYTE0 0x2271
+#define DSM_EXCPROT_HPF4_B2_BYTE1 0x2272
+#define DSM_EXCPROT_HPF4_B2_BYTE2 0x2273
+#define DSM_EXCPROT_HPF4_A1_BYTE0 0x2275
+#define DSM_EXCPROT_HPF4_A1_BYTE1 0x2276
+#define DSM_EXCPROT_HPF4_A1_BYTE2 0x2277
+#define DSM_EXCPROT_HPF4_A2_BYTE0 0x2279
+#define DSM_EXCPROT_HPF4_A2_BYTE1 0x227a
+#define DSM_EXCPROT_HPF4_A2_BYTE2 0x227b
+#define DSM_EXCPROT_HPF5_B0_BYTE0 0x227d
+#define DSM_EXCPROT_HPF5_B0_BYTE1 0x227e
+#define DSM_EXCPROT_HPF5_B0_BYTE2 0x227f
+#define DSM_EXCPROT_HPF5_B1_BYTE0 0x2281
+#define DSM_EXCPROT_HPF5_B1_BYTE1 0x2282
+#define DSM_EXCPROT_HPF5_B1_BYTE2 0x2283
+#define DSM_EXCPROT_HPF5_B2_BYTE0 0x2285
+#define DSM_EXCPROT_HPF5_B2_BYTE1 0x2286
+#define DSM_EXCPROT_HPF5_B2_BYTE2 0x2287
+#define DSM_EXCPROT_HPF5_A1_BYTE0 0x2289
+#define DSM_EXCPROT_HPF5_A1_BYTE1 0x228a
+#define DSM_EXCPROT_HPF5_A1_BYTE2 0x228b
+#define DSM_EXCPROT_HPF5_A2_BYTE0 0x228d
+#define DSM_EXCPROT_HPF5_A2_BYTE1 0x228e
+#define DSM_EXCPROT_HPF5_A2_BYTE2 0x228f
+#define DSM_DEBUZZ_BPF_B0_BYTE0 0x2291
+#define DSM_DEBUZZ_BPF_B0_BYTE1 0x2292
+#define DSM_DEBUZZ_BPF_B0_BYTE2 0x2293
+#define DSM_DEBUZZ_BPF_B1_BYTE0 0x2295
+#define DSM_DEBUZZ_BPF_B1_BYTE1 0x2296
+#define DSM_DEBUZZ_BPF_B1_BYTE2 0x2297
+#define DSM_DEBUZZ_BPF_B2_BYTE0 0x2299
+#define DSM_DEBUZZ_BPF_B2_BYTE1 0x229a
+#define DSM_DEBUZZ_BPF_B2_BYTE2 0x229b
+#define DSM_DEBUZZ_BPF_A1_BYTE0 0x229d
+#define DSM_DEBUZZ_BPF_A1_BYTE1 0x229e
+#define DSM_DEBUZZ_BPF_A1_BYTE2 0x229f
+#define DSM_DEBUZZ_BPF_A2_BYTE0 0x22a1
+#define DSM_DEBUZZ_BPF_A2_BYTE1 0x22a2
+#define DSM_DEBUZZ_BPF_A2_BYTE2 0x22a3
+#define DSM_DEBUZZ_PORT_B0_BYTE0 0x22a5
+#define DSM_DEBUZZ_PORT_B0_BYTE1 0x22a6
+#define DSM_DEBUZZ_PORT_B0_BYTE2 0x22a7
+#define DSM_DEBUZZ_PORT_B1_BYTE0 0x22a9
+#define DSM_DEBUZZ_PORT_B1_BYTE1 0x22aa
+#define DSM_DEBUZZ_PORT_B1_BYTE2 0x22ab
+#define DSM_DEBUZZ_PORT_B2_BYTE0 0x22ad
+#define DSM_DEBUZZ_PORT_B2_BYTE1 0x22ae
+#define DSM_DEBUZZ_PORT_B2_BYTE2 0x22af
+#define DSM_DEBUZZ_PORT_A1_BYTE0 0x22b1
+#define DSM_DEBUZZ_PORT_A1_BYTE1 0x22b2
+#define DSM_DEBUZZ_PORT_A1_BYTE2 0x22b3
+#define DSM_DEBUZZ_PORT_A2_BYTE0 0x22b5
+#define DSM_DEBUZZ_PORT_A2_BYTE1 0x22b6
+#define DSM_DEBUZZ_PORT_A2_BYTE2 0x22b7
+#define DSM_DEBUZZ_NOTCH_B0_BYTE0 0x22b9
+#define DSM_DEBUZZ_NOTCH_B0_BYTE1 0x22ba
+#define DSM_DEBUZZ_NOTCH_B0_BYTE2 0x22bb
+#define DSM_DEBUZZ_NOTCH_B1_BYTE0 0x22bd
+#define DSM_DEBUZZ_NOTCH_B1_BYTE1 0x22be
+#define DSM_DEBUZZ_NOTCH_B1_BYTE2 0x22bf
+#define DSM_DEBUZZ_NOTCH_B2_BYTE0 0x22c1
+#define DSM_DEBUZZ_NOTCH_B2_BYTE1 0x22c2
+#define DSM_DEBUZZ_NOTCH_B2_BYTE2 0x22c3
+#define DSM_DEBUZZ_NOTCH_A1_BYTE0 0x22c5
+#define DSM_DEBUZZ_NOTCH_A1_BYTE1 0x22c6
+#define DSM_DEBUZZ_NOTCH_A1_BYTE2 0x22c7
+#define DSM_DEBUZZ_NOTCH_A2_BYTE0 0x22c9
+#define DSM_DEBUZZ_NOTCH_A2_BYTE1 0x22ca
+#define DSM_DEBUZZ_NOTCH_A2_BYTE2 0x22cb
+#define DSM_THERMAL_BQ_B0_BYTE0 0x22cd
+#define DSM_THERMAL_BQ_B0_BYTE1 0x22ce
+#define DSM_THERMAL_BQ_B0_BYTE2 0x22cf
+#define DSM_THERMAL_BQ_B1_BYTE0 0x22d1
+#define DSM_THERMAL_BQ_B1_BYTE1 0x22d2
+#define DSM_THERMAL_BQ_B1_BYTE2 0x22d3
+#define DSM_THERMAL_BQ_B2_BYTE0 0x22d5
+#define DSM_THERMAL_BQ_B2_BYTE1 0x22d6
+#define DSM_THERMAL_BQ_B2_BYTE2 0x22d7
+#define DSM_THERMAL_BQ_A1_BYTE0 0x22d9
+#define DSM_THERMAL_BQ_A1_BYTE1 0x22da
+#define DSM_THERMAL_BQ_A1_BYTE2 0x22db
+#define DSM_THERMAL_BQ_A2_BYTE0 0x22dd
+#define DSM_THERMAL_BQ_A2_BYTE1 0x22de
+#define DSM_THERMAL_BQ_A2_BYTE2 0x22df
+#define DSM_WBDRC_FILT1_B0_BYTE0 0x22e1
+#define DSM_WBDRC_FILT1_B0_BYTE1 0x22e2
+#define DSM_WBDRC_FILT1_B0_BYTE2 0x22e3
+#define DSM_WBDRC_FILT1_B1_BYTE0 0x22e5
+#define DSM_WBDRC_FILT1_B1_BYTE1 0x22e6
+#define DSM_WBDRC_FILT1_B1_BYTE2 0x22e7
+#define DSM_WBDRC_FILT1_B2_BYTE0 0x22e9
+#define DSM_WBDRC_FILT1_B2_BYTE1 0x22ea
+#define DSM_WBDRC_FILT1_B2_BYTE2 0x22eb
+#define DSM_WBDRC_FILT1_A1_BYTE0 0x22ed
+#define DSM_WBDRC_FILT1_A1_BYTE1 0x22ee
+#define DSM_WBDRC_FILT1_A1_BYTE2 0x22ef
+#define DSM_WBDRC_FILT1_A2_BYTE0 0x22f1
+#define DSM_WBDRC_FILT1_A2_BYTE1 0x22f2
+#define DSM_WBDRC_FILT1_A2_BYTE2 0x22f3
+#define DSM_WBDRC_FILT2_B0_BYTE0 0x22f5
+#define DSM_WBDRC_FILT2_B0_BYTE1 0x22f6
+#define DSM_WBDRC_FILT2_B0_BYTE2 0x22f7
+#define DSM_WBDRC_FILT2_B1_BYTE0 0x22f9
+#define DSM_WBDRC_FILT2_B1_BYTE1 0x22fa
+#define DSM_WBDRC_FILT2_B1_BYTE2 0x22fb
+#define DSM_WBDRC_FILT2_B2_BYTE0 0x22fd
+#define DSM_WBDRC_FILT2_B2_BYTE1 0x22fe
+#define DSM_WBDRC_FILT2_B2_BYTE2 0x22ff
+#define DSM_WBDRC_FILT2_A1_BYTE0 0x2301
+#define DSM_WBDRC_FILT2_A1_BYTE1 0x2302
+#define DSM_WBDRC_FILT2_A1_BYTE2 0x2303
+#define DSM_WBDRC_FILT2_A2_BYTE0 0x2305
+#define DSM_WBDRC_FILT2_A2_BYTE1 0x2306
+#define DSM_WBDRC_FILT2_A2_BYTE2 0x2307
+#define DSM_PPR_RELEASE_TIME_BYTE0 0x2309
+#define DSM_PPR_RELEASE_TIME_BYTE1 0x230a
+#define DSM_PPR_RELEASE_TIME_BYTE2 0x230b
+#define DSM_PPR_ATTACK_TIME_BYTE0 0x230d
+#define DSM_PPR_ATTACK_TIME_BYTE1 0x230e
+#define DSM_PPR_ATTACK_TIME_BYTE2 0x230f
+#define DSM_DEBUZZER_RELEASE_TIME_BYTE0 0x2311
+#define DSM_DEBUZZER_RELEASE_TIME_BYTE1 0x2312
+#define DSM_DEBUZZER_RELEASE_TIME_BYTE2 0x2313
+#define DSM_DEBUZZER_ATTACK_TIME_BYTE0 0x2315
+#define DSM_DEBUZZER_ATTACK_TIME_BYTE1 0x2316
+#define DSM_DEBUZZER_ATTACK_TIME_BYTE2 0x2317
+
+#define DSMIG_WB_DRC_RELEASE_TIME_1 0x2380
+#define DSMIG_WB_DRC_RELEASE_TIME_2 0x2381
+#define DSMIG_WB_DRC_ATTACK_TIME_1 0x2382
+#define DSMIG_WB_DRC_ATTACK_TIME_2 0x2383
+#define DSMIG_WB_DRC_COMPRESSION_RATIO 0x2384
+#define DSMIG_WB_DRC_COMPRESSION_THRESHOLD 0x2385
+#define DSMIG_WB_DRC_MAKEUPGAIN 0x2386
+#define DSMIG_WB_DRC_NOISE_GATE_THRESHOLD 0x2387
+#define DSMIG_WBDRC_HPF_ENABLE 0x2388
+#define DSMIG_WB_DRC_TEST_SMOOTHER_OUT_EN 0x2389
+#define DSMIG_PPR_THRESHOLD 0x238b
+#define DSM_STEREO_BASS_CHANNEL_SELECT 0x238d
+#define DSM_TPROT_THRESHOLD_BYTE0 0x238e
+#define DSM_TPROT_THRESHOLD_BYTE1 0x238f
+#define DSM_TPROT_ROOM_TEMPERATURE_BYTE0 0x2390
+#define DSM_TPROT_ROOM_TEMPERATURE_BYTE1 0x2391
+#define DSM_TPROT_RECIP_RDC_ROOM_BYTE0 0x2392
+#define DSM_TPROT_RECIP_RDC_ROOM_BYTE1 0x2393
+#define DSM_TPROT_RECIP_RDC_ROOM_BYTE2 0x2394
+#define DSM_TPROT_RECIP_TCONST_BYTE0 0x2395
+#define DSM_TPROT_RECIP_TCONST_BYTE1 0x2396
+#define DSM_TPROT_RECIP_TCONST_BYTE2 0x2397
+#define DSM_THERMAL_ATTENUATION_SETTINGS 0x2398
+#define DSM_THERMAL_PILOT_TONE_ATTENUATION 0x2399
+#define DSM_TPROT_PG_TEMP_THRESH_BYTE0 0x239a
+#define DSM_TPROT_PG_TEMP_THRESH_BYTE1 0x239b
+
+#define THERMAL_RDC_RD_BACK_BYTE1 0x239c
+#define THERMAL_RDC_RD_BACK_BYTE0 0x239d
+
+#define DSMIG_DEBUZZER_THRESHOLD 0x23b5
+#define DSMIG_DEBUZZER_ALPHA_COEF_TEST_ONLY 0x23b6
+#define DSM_VOL_ENA 0x23b9
+#define DSM_VOL_CTRL 0x23ba
+
+#define DSMIG_EN 0x23e0
+#define MAX98390_R23E1_DSP_GLOBAL_EN 0x23e1
+
+#define DSM_THERMAL_GAIN 0x23f0
+#define DSM_PPR_GAIN 0x23f1
+#define DSM_DBZ_GAIN 0x23f2
+#define DSM_WBDRC_GAIN 0x23f3
+
+#define MAX98390_R23FF_GLOBAL_EN 0x23FF
+#define MAX98390_R24FF_REV_ID 0x24FF
+
+/* MAX98390_R2021_PCM_RX_SRC_1 */
+#define MAX98390_PCM_RX_CH_SRC_SHIFT (0)
+#define MAX98390_PCM_RX_CH_SRC_BASS_SHIFT (4)
+
+/* MAX98390_R2022_PCM_TX_SRC_1 */
+#define MAX98390_PCM_TX_CH_SRC_A_V_SHIFT (0)
+#define MAX98390_PCM_TX_CH_SRC_A_I_SHIFT (4)
+
+/* MAX98390_R2024_PCM_DATA_FMT_CFG */
+#define MAX98390_PCM_MODE_CFG_FORMAT_MASK (0x7 << 3)
+#define MAX98390_PCM_MODE_CFG_FORMAT_SHIFT (3)
+#define MAX98390_PCM_TX_CH_INTERLEAVE_MASK (0x1 << 2)
+#define MAX98390_PCM_FORMAT_I2S (0x0 << 0)
+#define MAX98390_PCM_FORMAT_LJ (0x1 << 0)
+#define MAX98390_PCM_FORMAT_TDM_MODE0 (0x3 << 0)
+#define MAX98390_PCM_FORMAT_TDM_MODE1 (0x4 << 0)
+#define MAX98390_PCM_FORMAT_TDM_MODE2 (0x5 << 0)
+#define MAX98390_PCM_MODE_CFG_CHANSZ_MASK (0x3 << 6)
+#define MAX98390_PCM_MODE_CFG_CHANSZ_16 (0x1 << 6)
+#define MAX98390_PCM_MODE_CFG_CHANSZ_24 (0x2 << 6)
+#define MAX98390_PCM_MODE_CFG_CHANSZ_32 (0x3 << 6)
+
+/* MAX98390_R2039_AMP_DSP_CFG */
+#define MAX98390_AMP_DSP_CFG_RMP_UP_SHIFT (4)
+#define MAX98390_AMP_DSP_CFG_RMP_DN_SHIFT (5)
+
+/* MAX98390_R203A_AMP_EN */
+#define MAX98390_R203A_AMP_EN_SHIFT (0)
+
+/* MAX98390_PCM_MASTER_MODE */
+#define MAX98390_PCM_MASTER_MODE_MASK (0x3 << 0)
+#define MAX98390_PCM_MASTER_MODE_SLAVE (0x0 << 0)
+#define MAX98390_PCM_MASTER_MODE_MASTER (0x3 << 0)
+
+#define MAX98390_PCM_MASTER_MODE_MCLK_MASK (0xF << 2)
+#define MAX98390_PCM_MASTER_MODE_MCLK_RATE_SHIFT (2)
+
+/* PCM_CLK_SETUP */
+#define MAX98390_PCM_MODE_CFG_PCM_BCLKEDGE (0x1 << 2)
+#define MAX98390_PCM_CLK_SETUP_BSEL_MASK (0xF << 0)
+
+/* PCM_SR_SETUP */
+#define MAX98390_PCM_SR_SET1_SR_MASK (0xF << 0)
+#define MAX98390_PCM_SR_SET1_SR_8000 (0x0 << 0)
+#define MAX98390_PCM_SR_SET1_SR_11025 (0x1 << 0)
+#define MAX98390_PCM_SR_SET1_SR_12000 (0x2 << 0)
+#define MAX98390_PCM_SR_SET1_SR_16000 (0x3 << 0)
+#define MAX98390_PCM_SR_SET1_SR_22050 (0x4 << 0)
+#define MAX98390_PCM_SR_SET1_SR_24000 (0x5 << 0)
+#define MAX98390_PCM_SR_SET1_SR_32000 (0x6 << 0)
+#define MAX98390_PCM_SR_SET1_SR_44100 (0x7 << 0)
+#define MAX98390_PCM_SR_SET1_SR_48000 (0x8 << 0)
+
+/* PCM_TO_SPK_MONO_MIX_1 */
+#define MAX98390_PCM_TO_SPK_MONOMIX_CFG_MASK (0x3 << 6)
+#define MAX98390_PCM_TO_SPK_MONOMIX_CFG_SHIFT (6)
+#define MAX98390_PCM_TO_SPK_CH0_SRC_MASK (0xF << 0)
+#define MAX98390_PCM_TO_SPK_CH1_SRC_MASK (0xF << 4)
+
+/* MAX98390_BOOST_CTRL3 */
+#define MAX98390_BOOST_CLK_PHASE_CFG_SHIFT (2)
+
+/* SOFT_RESET */
+#define MAX98390_SOFT_RESET_MASK (0x1 << 0)
+
+#define MAX98390_GLOBAL_EN_MASK (0x1 << 0)
+#define MAX98390_AMP_EN_MASK (0x1 << 0)
+
+/* DSM register offset */
+#define MAX98390_DSM_PAYLOAD_OFFSET 16
+#define MAX98390_DSM_PAYLOAD_OFFSET_2 495
+
+struct max98390_priv {
+	struct regmap *regmap;
+	unsigned int sysclk;
+	unsigned int master;
+	unsigned int tdm_mode;
+	unsigned int ref_rdc_value;
+	unsigned int ambient_temp_value;
+};
+#endif
-- 
2.17.1


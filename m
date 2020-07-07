Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0292179EB
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 23:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDDFA1684;
	Tue,  7 Jul 2020 23:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDDFA1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594155672;
	bh=Zb4zD5SH5v980yppaClN3MQA9RKf6jSI/TLzIvXSMyw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DRy6qNsNOxu6ZADu5u96AQTgBqhcCrFUzPfBoApt2Id0HyagFFa0P+LpQs0CmgFQm
	 pHku+yJN2KRZQHW/E6luSwckYRAOzmqQz4XtSO+Wx5n5oz63Hg/bN9BZDLn4UAE/IV
	 ijtCYe7x9y3gaA3cViEVGPrmkQtzzaE7hXZd0SO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D590F802DB;
	Tue,  7 Jul 2020 22:58:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3191F802BE; Tue,  7 Jul 2020 22:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2C8BF801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C8BF801F9
IronPort-SDR: rF+NvDUx15ECxxf0yR3xAh17opHO1iTCyBcgrc6WFW4hJo0ftqsL0UmPBZ9Qnego+txd0xk5i1
 IGm9rXy0yzqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146762910"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="146762910"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:52 -0700
IronPort-SDR: TeuZjEC5je9x2pfH8nbrK4riWaBXWM1ODpVZZMbpeTN0sM7dApRl5jwZi0WJTio5ckEjZQxplX
 o2EMcJBT+y+w==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="305796643"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/6] ASoC: codecs: max98373: split I2C and common parts
Date: Tue,  7 Jul 2020 15:57:35 -0500
Message-Id: <20200707205740.114927-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

To prepare support for SoundWire, let's first split the I2C and common
parts. No new functionality, just indents and formatting to make
checkpatch happy.

Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/Kconfig        |   6 +-
 sound/soc/codecs/Makefile       |   2 +
 sound/soc/codecs/max98373-i2c.c | 612 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98373.c     | 601 +------------------------------
 sound/soc/codecs/max98373.h     |  10 +-
 sound/soc/intel/boards/Kconfig  |   6 +-
 6 files changed, 637 insertions(+), 600 deletions(-)
 create mode 100644 sound/soc/codecs/max98373-i2c.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 986a6308818b..ebefb343f7ef 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -115,7 +115,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_MAX98925
 	imply SND_SOC_MAX98926
 	imply SND_SOC_MAX98927
-	imply SND_SOC_MAX98373
+	imply SND_SOC_MAX98373_I2C
 	imply SND_SOC_MAX98390
 	imply SND_SOC_MAX9850
 	imply SND_SOC_MAX9860
@@ -868,8 +868,12 @@ config SND_SOC_MAX98927
 	depends on I2C
 
 config SND_SOC_MAX98373
+	tristate
+
+config SND_SOC_MAX98373_I2C
 	tristate "Maxim Integrated MAX98373 Speaker Amplifier"
 	depends on I2C
+	select SND_SOC_MAX98373
 
 config SND_SOC_MAX98390
 	tristate "Maxim Integrated MAX98390 Speaker Amplifier"
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 47ae3cebb61e..3ac82c3b6fc3 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -115,6 +115,7 @@ snd-soc-max98925-objs := max98925.o
 snd-soc-max98926-objs := max98926.o
 snd-soc-max98927-objs := max98927.o
 snd-soc-max98373-objs := max98373.o
+snd-soc-max98373-i2c-objs := max98373-i2c.o
 snd-soc-max98390-objs := max98390.o
 snd-soc-max9850-objs := max9850.o
 snd-soc-max9860-objs := max9860.o
@@ -418,6 +419,7 @@ obj-$(CONFIG_SND_SOC_MAX98925)	+= snd-soc-max98925.o
 obj-$(CONFIG_SND_SOC_MAX98926)	+= snd-soc-max98926.o
 obj-$(CONFIG_SND_SOC_MAX98927)	+= snd-soc-max98927.o
 obj-$(CONFIG_SND_SOC_MAX98373)	+= snd-soc-max98373.o
+obj-$(CONFIG_SND_SOC_MAX98373_I2C)   += snd-soc-max98373-i2c.o
 obj-$(CONFIG_SND_SOC_MAX98390)	+= snd-soc-max98390.o
 obj-$(CONFIG_SND_SOC_MAX9850)	+= snd-soc-max9850.o
 obj-$(CONFIG_SND_SOC_MAX9860)	+= snd-soc-max9860.o
diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
new file mode 100644
index 000000000000..92921e34f948
--- /dev/null
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -0,0 +1,612 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2017, Maxim Integrated
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/cdev.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include "max98373.h"
+
+static struct reg_default max98373_reg[] = {
+	{MAX98373_R2000_SW_RESET, 0x00},
+	{MAX98373_R2001_INT_RAW1, 0x00},
+	{MAX98373_R2002_INT_RAW2, 0x00},
+	{MAX98373_R2003_INT_RAW3, 0x00},
+	{MAX98373_R2004_INT_STATE1, 0x00},
+	{MAX98373_R2005_INT_STATE2, 0x00},
+	{MAX98373_R2006_INT_STATE3, 0x00},
+	{MAX98373_R2007_INT_FLAG1, 0x00},
+	{MAX98373_R2008_INT_FLAG2, 0x00},
+	{MAX98373_R2009_INT_FLAG3, 0x00},
+	{MAX98373_R200A_INT_EN1, 0x00},
+	{MAX98373_R200B_INT_EN2, 0x00},
+	{MAX98373_R200C_INT_EN3, 0x00},
+	{MAX98373_R200D_INT_FLAG_CLR1, 0x00},
+	{MAX98373_R200E_INT_FLAG_CLR2, 0x00},
+	{MAX98373_R200F_INT_FLAG_CLR3, 0x00},
+	{MAX98373_R2010_IRQ_CTRL, 0x00},
+	{MAX98373_R2014_THERM_WARN_THRESH, 0x10},
+	{MAX98373_R2015_THERM_SHDN_THRESH, 0x27},
+	{MAX98373_R2016_THERM_HYSTERESIS, 0x01},
+	{MAX98373_R2017_THERM_FOLDBACK_SET, 0xC0},
+	{MAX98373_R2018_THERM_FOLDBACK_EN, 0x00},
+	{MAX98373_R201E_PIN_DRIVE_STRENGTH, 0x55},
+	{MAX98373_R2020_PCM_TX_HIZ_EN_1, 0xFE},
+	{MAX98373_R2021_PCM_TX_HIZ_EN_2, 0xFF},
+	{MAX98373_R2022_PCM_TX_SRC_1, 0x00},
+	{MAX98373_R2023_PCM_TX_SRC_2, 0x00},
+	{MAX98373_R2024_PCM_DATA_FMT_CFG, 0xC0},
+	{MAX98373_R2025_AUDIO_IF_MODE, 0x00},
+	{MAX98373_R2026_PCM_CLOCK_RATIO, 0x04},
+	{MAX98373_R2027_PCM_SR_SETUP_1, 0x08},
+	{MAX98373_R2028_PCM_SR_SETUP_2, 0x88},
+	{MAX98373_R2029_PCM_TO_SPK_MONO_MIX_1, 0x00},
+	{MAX98373_R202A_PCM_TO_SPK_MONO_MIX_2, 0x00},
+	{MAX98373_R202B_PCM_RX_EN, 0x00},
+	{MAX98373_R202C_PCM_TX_EN, 0x00},
+	{MAX98373_R202E_ICC_RX_CH_EN_1, 0x00},
+	{MAX98373_R202F_ICC_RX_CH_EN_2, 0x00},
+	{MAX98373_R2030_ICC_TX_HIZ_EN_1, 0xFF},
+	{MAX98373_R2031_ICC_TX_HIZ_EN_2, 0xFF},
+	{MAX98373_R2032_ICC_LINK_EN_CFG, 0x30},
+	{MAX98373_R2034_ICC_TX_CNTL, 0x00},
+	{MAX98373_R2035_ICC_TX_EN, 0x00},
+	{MAX98373_R2036_SOUNDWIRE_CTRL, 0x05},
+	{MAX98373_R203D_AMP_DIG_VOL_CTRL, 0x00},
+	{MAX98373_R203E_AMP_PATH_GAIN, 0x08},
+	{MAX98373_R203F_AMP_DSP_CFG, 0x02},
+	{MAX98373_R2040_TONE_GEN_CFG, 0x00},
+	{MAX98373_R2041_AMP_CFG, 0x03},
+	{MAX98373_R2042_AMP_EDGE_RATE_CFG, 0x00},
+	{MAX98373_R2043_AMP_EN, 0x00},
+	{MAX98373_R2046_IV_SENSE_ADC_DSP_CFG, 0x04},
+	{MAX98373_R2047_IV_SENSE_ADC_EN, 0x00},
+	{MAX98373_R2051_MEAS_ADC_SAMPLING_RATE, 0x00},
+	{MAX98373_R2052_MEAS_ADC_PVDD_FLT_CFG, 0x00},
+	{MAX98373_R2053_MEAS_ADC_THERM_FLT_CFG, 0x00},
+	{MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK, 0x00},
+	{MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK, 0x00},
+	{MAX98373_R2056_MEAS_ADC_PVDD_CH_EN, 0x00},
+	{MAX98373_R2090_BDE_LVL_HOLD, 0x00},
+	{MAX98373_R2091_BDE_GAIN_ATK_REL_RATE, 0x00},
+	{MAX98373_R2092_BDE_CLIPPER_MODE, 0x00},
+	{MAX98373_R2097_BDE_L1_THRESH, 0x00},
+	{MAX98373_R2098_BDE_L2_THRESH, 0x00},
+	{MAX98373_R2099_BDE_L3_THRESH, 0x00},
+	{MAX98373_R209A_BDE_L4_THRESH, 0x00},
+	{MAX98373_R209B_BDE_THRESH_HYST, 0x00},
+	{MAX98373_R20A8_BDE_L1_CFG_1, 0x00},
+	{MAX98373_R20A9_BDE_L1_CFG_2, 0x00},
+	{MAX98373_R20AA_BDE_L1_CFG_3, 0x00},
+	{MAX98373_R20AB_BDE_L2_CFG_1, 0x00},
+	{MAX98373_R20AC_BDE_L2_CFG_2, 0x00},
+	{MAX98373_R20AD_BDE_L2_CFG_3, 0x00},
+	{MAX98373_R20AE_BDE_L3_CFG_1, 0x00},
+	{MAX98373_R20AF_BDE_L3_CFG_2, 0x00},
+	{MAX98373_R20B0_BDE_L3_CFG_3, 0x00},
+	{MAX98373_R20B1_BDE_L4_CFG_1, 0x00},
+	{MAX98373_R20B2_BDE_L4_CFG_2, 0x00},
+	{MAX98373_R20B3_BDE_L4_CFG_3, 0x00},
+	{MAX98373_R20B4_BDE_INFINITE_HOLD_RELEASE, 0x00},
+	{MAX98373_R20B5_BDE_EN, 0x00},
+	{MAX98373_R20B6_BDE_CUR_STATE_READBACK, 0x00},
+	{MAX98373_R20D1_DHT_CFG, 0x01},
+	{MAX98373_R20D2_DHT_ATTACK_CFG, 0x02},
+	{MAX98373_R20D3_DHT_RELEASE_CFG, 0x03},
+	{MAX98373_R20D4_DHT_EN, 0x00},
+	{MAX98373_R20E0_LIMITER_THRESH_CFG, 0x00},
+	{MAX98373_R20E1_LIMITER_ATK_REL_RATES, 0x00},
+	{MAX98373_R20E2_LIMITER_EN, 0x00},
+	{MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG, 0x00},
+	{MAX98373_R20FF_GLOBAL_SHDN, 0x00},
+	{MAX98373_R21FF_REV_ID, 0x42},
+};
+
+static int max98373_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
+	unsigned int format = 0;
+	unsigned int invert = 0;
+
+	dev_dbg(component->dev, "%s: fmt 0x%08X\n", __func__, fmt);
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		invert = MAX98373_PCM_MODE_CFG_PCM_BCLKEDGE;
+		break;
+	default:
+		dev_err(component->dev, "DAI invert mode unsupported\n");
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2026_PCM_CLOCK_RATIO,
+			   MAX98373_PCM_MODE_CFG_PCM_BCLKEDGE,
+			   invert);
+
+	/* interface format */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		format = MAX98373_PCM_FORMAT_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		format = MAX98373_PCM_FORMAT_LJ;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		format = MAX98373_PCM_FORMAT_TDM_MODE1;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		format = MAX98373_PCM_FORMAT_TDM_MODE0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2024_PCM_DATA_FMT_CFG,
+			   MAX98373_PCM_MODE_CFG_FORMAT_MASK,
+			   format << MAX98373_PCM_MODE_CFG_FORMAT_SHIFT);
+
+	return 0;
+}
+
+/* BCLKs per LRCLK */
+static const int bclk_sel_table[] = {
+	32, 48, 64, 96, 128, 192, 256, 384, 512, 320,
+};
+
+static int max98373_get_bclk_sel(int bclk)
+{
+	int i;
+	/* match BCLKs per LRCLK */
+	for (i = 0; i < ARRAY_SIZE(bclk_sel_table); i++) {
+		if (bclk_sel_table[i] == bclk)
+			return i + 2;
+	}
+	return 0;
+}
+
+static int max98373_set_clock(struct snd_soc_component *component,
+			      struct snd_pcm_hw_params *params)
+{
+	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
+	/* BCLK/LRCLK ratio calculation */
+	int blr_clk_ratio = params_channels(params) * max98373->ch_size;
+	int value;
+
+	if (!max98373->tdm_mode) {
+		/* BCLK configuration */
+		value = max98373_get_bclk_sel(blr_clk_ratio);
+		if (!value) {
+			dev_err(component->dev, "format unsupported %d\n",
+				params_format(params));
+			return -EINVAL;
+		}
+
+		regmap_update_bits(max98373->regmap,
+				   MAX98373_R2026_PCM_CLOCK_RATIO,
+				   MAX98373_PCM_CLK_SETUP_BSEL_MASK,
+				   value);
+	}
+	return 0;
+}
+
+static int max98373_dai_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
+	unsigned int sampling_rate = 0;
+	unsigned int chan_sz = 0;
+
+	/* pcm mode configuration */
+	switch (snd_pcm_format_width(params_format(params))) {
+	case 16:
+		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_16;
+		break;
+	case 24:
+		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_24;
+		break;
+	case 32:
+		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_32;
+		break;
+	default:
+		dev_err(component->dev, "format unsupported %d\n",
+			params_format(params));
+		goto err;
+	}
+
+	max98373->ch_size = snd_pcm_format_width(params_format(params));
+
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2024_PCM_DATA_FMT_CFG,
+			   MAX98373_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+
+	dev_dbg(component->dev, "format supported %d",
+		params_format(params));
+
+	/* sampling rate configuration */
+	switch (params_rate(params)) {
+	case 8000:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_8000;
+		break;
+	case 11025:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_11025;
+		break;
+	case 12000:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_12000;
+		break;
+	case 16000:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_16000;
+		break;
+	case 22050:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_22050;
+		break;
+	case 24000:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_24000;
+		break;
+	case 32000:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_32000;
+		break;
+	case 44100:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_44100;
+		break;
+	case 48000:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_48000;
+		break;
+	case 88200:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_88200;
+		break;
+	case 96000:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_96000;
+		break;
+	default:
+		dev_err(component->dev, "rate %d not supported\n",
+			params_rate(params));
+		goto err;
+	}
+
+	/* set DAI_SR to correct LRCLK frequency */
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2027_PCM_SR_SETUP_1,
+			   MAX98373_PCM_SR_SET1_SR_MASK,
+			   sampling_rate);
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2028_PCM_SR_SETUP_2,
+			   MAX98373_PCM_SR_SET2_SR_MASK,
+			   sampling_rate << MAX98373_PCM_SR_SET2_SR_SHIFT);
+
+	/* set sampling rate of IV */
+	if (max98373->interleave_mode &&
+	    sampling_rate > MAX98373_PCM_SR_SET1_SR_16000)
+		regmap_update_bits(max98373->regmap,
+				   MAX98373_R2028_PCM_SR_SETUP_2,
+				   MAX98373_PCM_SR_SET2_IVADC_SR_MASK,
+				   sampling_rate - 3);
+	else
+		regmap_update_bits(max98373->regmap,
+				   MAX98373_R2028_PCM_SR_SETUP_2,
+				   MAX98373_PCM_SR_SET2_IVADC_SR_MASK,
+				   sampling_rate);
+
+	return max98373_set_clock(component, params);
+err:
+	return -EINVAL;
+}
+
+static int max98373_dai_tdm_slot(struct snd_soc_dai *dai,
+				 unsigned int tx_mask, unsigned int rx_mask,
+				 int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
+	int bsel = 0;
+	unsigned int chan_sz = 0;
+	unsigned int mask;
+	int x, slot_found;
+
+	if (!tx_mask && !rx_mask && !slots && !slot_width)
+		max98373->tdm_mode = false;
+	else
+		max98373->tdm_mode = true;
+
+	/* BCLK configuration */
+	bsel = max98373_get_bclk_sel(slots * slot_width);
+	if (bsel == 0) {
+		dev_err(component->dev, "BCLK %d not supported\n",
+			slots * slot_width);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2026_PCM_CLOCK_RATIO,
+			   MAX98373_PCM_CLK_SETUP_BSEL_MASK,
+			   bsel);
+
+	/* Channel size configuration */
+	switch (slot_width) {
+	case 16:
+		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_16;
+		break;
+	case 24:
+		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_24;
+		break;
+	case 32:
+		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_32;
+		break;
+	default:
+		dev_err(component->dev, "format unsupported %d\n",
+			slot_width);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2024_PCM_DATA_FMT_CFG,
+			   MAX98373_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+
+	/* Rx slot configuration */
+	slot_found = 0;
+	mask = rx_mask;
+	for (x = 0 ; x < 16 ; x++, mask >>= 1) {
+		if (mask & 0x1) {
+			if (slot_found == 0)
+				regmap_update_bits(max98373->regmap,
+						   MAX98373_R2029_PCM_TO_SPK_MONO_MIX_1,
+						   MAX98373_PCM_TO_SPK_CH0_SRC_MASK, x);
+			else
+				regmap_write(max98373->regmap,
+					     MAX98373_R202A_PCM_TO_SPK_MONO_MIX_2,
+					     x);
+			slot_found++;
+			if (slot_found > 1)
+				break;
+		}
+	}
+
+	/* Tx slot Hi-Z configuration */
+	regmap_write(max98373->regmap,
+		     MAX98373_R2020_PCM_TX_HIZ_EN_1,
+		     ~tx_mask & 0xFF);
+	regmap_write(max98373->regmap,
+		     MAX98373_R2021_PCM_TX_HIZ_EN_2,
+		     (~tx_mask & 0xFF00) >> 8);
+
+	return 0;
+}
+
+#define MAX98373_RATES SNDRV_PCM_RATE_8000_96000
+
+#define MAX98373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
+	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+static const struct snd_soc_dai_ops max98373_dai_ops = {
+	.set_fmt = max98373_dai_set_fmt,
+	.hw_params = max98373_dai_hw_params,
+	.set_tdm_slot = max98373_dai_tdm_slot,
+};
+
+static bool max98373_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98373_R2000_SW_RESET:
+	case MAX98373_R2001_INT_RAW1 ... MAX98373_R200C_INT_EN3:
+	case MAX98373_R2010_IRQ_CTRL:
+	case MAX98373_R2014_THERM_WARN_THRESH
+		... MAX98373_R2018_THERM_FOLDBACK_EN:
+	case MAX98373_R201E_PIN_DRIVE_STRENGTH
+		... MAX98373_R2036_SOUNDWIRE_CTRL:
+	case MAX98373_R203D_AMP_DIG_VOL_CTRL ... MAX98373_R2043_AMP_EN:
+	case MAX98373_R2046_IV_SENSE_ADC_DSP_CFG
+		... MAX98373_R2047_IV_SENSE_ADC_EN:
+	case MAX98373_R2051_MEAS_ADC_SAMPLING_RATE
+		... MAX98373_R2056_MEAS_ADC_PVDD_CH_EN:
+	case MAX98373_R2090_BDE_LVL_HOLD ... MAX98373_R2092_BDE_CLIPPER_MODE:
+	case MAX98373_R2097_BDE_L1_THRESH
+		... MAX98373_R209B_BDE_THRESH_HYST:
+	case MAX98373_R20A8_BDE_L1_CFG_1 ... MAX98373_R20B3_BDE_L4_CFG_3:
+	case MAX98373_R20B5_BDE_EN ... MAX98373_R20B6_BDE_CUR_STATE_READBACK:
+	case MAX98373_R20D1_DHT_CFG ... MAX98373_R20D4_DHT_EN:
+	case MAX98373_R20E0_LIMITER_THRESH_CFG ... MAX98373_R20E2_LIMITER_EN:
+	case MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG
+		... MAX98373_R20FF_GLOBAL_SHDN:
+	case MAX98373_R21FF_REV_ID:
+		return true;
+	default:
+		return false;
+	}
+};
+
+static bool max98373_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98373_R2000_SW_RESET ... MAX98373_R2009_INT_FLAG3:
+	case MAX98373_R203E_AMP_PATH_GAIN:
+	case MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK:
+	case MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK:
+	case MAX98373_R20B6_BDE_CUR_STATE_READBACK:
+	case MAX98373_R21FF_REV_ID:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static struct snd_soc_dai_driver max98373_dai[] = {
+	{
+		.name = "max98373-aif1",
+		.playback = {
+			.stream_name = "HiFi Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MAX98373_RATES,
+			.formats = MAX98373_FORMATS,
+		},
+		.capture = {
+			.stream_name = "HiFi Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MAX98373_RATES,
+			.formats = MAX98373_FORMATS,
+		},
+		.ops = &max98373_dai_ops,
+	}
+};
+
+#ifdef CONFIG_PM_SLEEP
+static int max98373_suspend(struct device *dev)
+{
+	struct max98373_priv *max98373 = dev_get_drvdata(dev);
+
+	regcache_cache_only(max98373->regmap, true);
+	regcache_mark_dirty(max98373->regmap);
+	return 0;
+}
+
+static int max98373_resume(struct device *dev)
+{
+	struct max98373_priv *max98373 = dev_get_drvdata(dev);
+
+	regcache_cache_only(max98373->regmap, false);
+	max98373_reset(max98373, dev);
+	regcache_sync(max98373->regmap);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops max98373_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(max98373_suspend, max98373_resume)
+};
+
+static const struct regmap_config max98373_regmap = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = MAX98373_R21FF_REV_ID,
+	.reg_defaults  = max98373_reg,
+	.num_reg_defaults = ARRAY_SIZE(max98373_reg),
+	.readable_reg = max98373_readable_register,
+	.volatile_reg = max98373_volatile_reg,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static int max98373_i2c_probe(struct i2c_client *i2c,
+			      const struct i2c_device_id *id)
+{
+	int ret = 0;
+	int reg = 0;
+	struct max98373_priv *max98373 = NULL;
+
+	max98373 = devm_kzalloc(&i2c->dev, sizeof(*max98373), GFP_KERNEL);
+
+	if (!max98373) {
+		ret = -ENOMEM;
+		return ret;
+	}
+	i2c_set_clientdata(i2c, max98373);
+
+	/* update interleave mode info */
+	if (device_property_read_bool(&i2c->dev, "maxim,interleave_mode"))
+		max98373->interleave_mode = true;
+	else
+		max98373->interleave_mode = false;
+
+	/* regmap initialization */
+	max98373->regmap = devm_regmap_init_i2c(i2c, &max98373_regmap);
+	if (IS_ERR(max98373->regmap)) {
+		ret = PTR_ERR(max98373->regmap);
+		dev_err(&i2c->dev,
+			"Failed to allocate regmap: %d\n", ret);
+		return ret;
+	}
+
+	/* voltage/current slot & gpio configuration */
+	max98373_slot_config(&i2c->dev, max98373);
+
+	/* Power on device */
+	if (gpio_is_valid(max98373->reset_gpio)) {
+		ret = devm_gpio_request(&i2c->dev, max98373->reset_gpio,
+					"MAX98373_RESET");
+		if (ret) {
+			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
+				__func__, max98373->reset_gpio);
+			return -EINVAL;
+		}
+		gpio_direction_output(max98373->reset_gpio, 0);
+		msleep(50);
+		gpio_direction_output(max98373->reset_gpio, 1);
+		msleep(20);
+	}
+
+	/* Check Revision ID */
+	ret = regmap_read(max98373->regmap,
+			  MAX98373_R21FF_REV_ID, &reg);
+	if (ret < 0) {
+		dev_err(&i2c->dev,
+			"Failed to read: 0x%02X\n", MAX98373_R21FF_REV_ID);
+		return ret;
+	}
+	dev_info(&i2c->dev, "MAX98373 revisionID: 0x%02X\n", reg);
+
+	/* codec registration */
+	ret = devm_snd_soc_register_component(&i2c->dev, &soc_codec_dev_max98373,
+					      max98373_dai, ARRAY_SIZE(max98373_dai));
+	if (ret < 0)
+		dev_err(&i2c->dev, "Failed to register codec: %d\n", ret);
+
+	return ret;
+}
+
+static const struct i2c_device_id max98373_i2c_id[] = {
+	{ "max98373", 0},
+	{ },
+};
+
+MODULE_DEVICE_TABLE(i2c, max98373_i2c_id);
+
+#if defined(CONFIG_OF)
+static const struct of_device_id max98373_of_match[] = {
+	{ .compatible = "maxim,max98373", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max98373_of_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id max98373_acpi_match[] = {
+	{ "MX98373", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, max98373_acpi_match);
+#endif
+
+static struct i2c_driver max98373_i2c_driver = {
+	.driver = {
+		.name = "max98373",
+		.of_match_table = of_match_ptr(max98373_of_match),
+		.acpi_match_table = ACPI_PTR(max98373_acpi_match),
+		.pm = &max98373_pm,
+	},
+	.probe = max98373_i2c_probe,
+	.id_table = max98373_i2c_id,
+};
+
+module_i2c_driver(max98373_i2c_driver)
+
+MODULE_DESCRIPTION("ALSA SoC MAX98373 driver");
+MODULE_AUTHOR("Ryan Lee <ryans.lee@maximintegrated.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 96718e3a1ad0..a8ed9f12682b 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -17,388 +17,6 @@
 #include <sound/tlv.h>
 #include "max98373.h"
 
-static struct reg_default max98373_reg[] = {
-	{MAX98373_R2000_SW_RESET, 0x00},
-	{MAX98373_R2001_INT_RAW1, 0x00},
-	{MAX98373_R2002_INT_RAW2, 0x00},
-	{MAX98373_R2003_INT_RAW3, 0x00},
-	{MAX98373_R2004_INT_STATE1, 0x00},
-	{MAX98373_R2005_INT_STATE2, 0x00},
-	{MAX98373_R2006_INT_STATE3, 0x00},
-	{MAX98373_R2007_INT_FLAG1, 0x00},
-	{MAX98373_R2008_INT_FLAG2, 0x00},
-	{MAX98373_R2009_INT_FLAG3, 0x00},
-	{MAX98373_R200A_INT_EN1, 0x00},
-	{MAX98373_R200B_INT_EN2, 0x00},
-	{MAX98373_R200C_INT_EN3, 0x00},
-	{MAX98373_R200D_INT_FLAG_CLR1, 0x00},
-	{MAX98373_R200E_INT_FLAG_CLR2, 0x00},
-	{MAX98373_R200F_INT_FLAG_CLR3, 0x00},
-	{MAX98373_R2010_IRQ_CTRL, 0x00},
-	{MAX98373_R2014_THERM_WARN_THRESH, 0x10},
-	{MAX98373_R2015_THERM_SHDN_THRESH, 0x27},
-	{MAX98373_R2016_THERM_HYSTERESIS, 0x01},
-	{MAX98373_R2017_THERM_FOLDBACK_SET, 0xC0},
-	{MAX98373_R2018_THERM_FOLDBACK_EN, 0x00},
-	{MAX98373_R201E_PIN_DRIVE_STRENGTH, 0x55},
-	{MAX98373_R2020_PCM_TX_HIZ_EN_1, 0xFE},
-	{MAX98373_R2021_PCM_TX_HIZ_EN_2, 0xFF},
-	{MAX98373_R2022_PCM_TX_SRC_1, 0x00},
-	{MAX98373_R2023_PCM_TX_SRC_2, 0x00},
-	{MAX98373_R2024_PCM_DATA_FMT_CFG, 0xC0},
-	{MAX98373_R2025_AUDIO_IF_MODE, 0x00},
-	{MAX98373_R2026_PCM_CLOCK_RATIO, 0x04},
-	{MAX98373_R2027_PCM_SR_SETUP_1, 0x08},
-	{MAX98373_R2028_PCM_SR_SETUP_2, 0x88},
-	{MAX98373_R2029_PCM_TO_SPK_MONO_MIX_1, 0x00},
-	{MAX98373_R202A_PCM_TO_SPK_MONO_MIX_2, 0x00},
-	{MAX98373_R202B_PCM_RX_EN, 0x00},
-	{MAX98373_R202C_PCM_TX_EN, 0x00},
-	{MAX98373_R202E_ICC_RX_CH_EN_1, 0x00},
-	{MAX98373_R202F_ICC_RX_CH_EN_2, 0x00},
-	{MAX98373_R2030_ICC_TX_HIZ_EN_1, 0xFF},
-	{MAX98373_R2031_ICC_TX_HIZ_EN_2, 0xFF},
-	{MAX98373_R2032_ICC_LINK_EN_CFG, 0x30},
-	{MAX98373_R2034_ICC_TX_CNTL, 0x00},
-	{MAX98373_R2035_ICC_TX_EN, 0x00},
-	{MAX98373_R2036_SOUNDWIRE_CTRL, 0x05},
-	{MAX98373_R203D_AMP_DIG_VOL_CTRL, 0x00},
-	{MAX98373_R203E_AMP_PATH_GAIN, 0x08},
-	{MAX98373_R203F_AMP_DSP_CFG, 0x02},
-	{MAX98373_R2040_TONE_GEN_CFG, 0x00},
-	{MAX98373_R2041_AMP_CFG, 0x03},
-	{MAX98373_R2042_AMP_EDGE_RATE_CFG, 0x00},
-	{MAX98373_R2043_AMP_EN, 0x00},
-	{MAX98373_R2046_IV_SENSE_ADC_DSP_CFG, 0x04},
-	{MAX98373_R2047_IV_SENSE_ADC_EN, 0x00},
-	{MAX98373_R2051_MEAS_ADC_SAMPLING_RATE, 0x00},
-	{MAX98373_R2052_MEAS_ADC_PVDD_FLT_CFG, 0x00},
-	{MAX98373_R2053_MEAS_ADC_THERM_FLT_CFG, 0x00},
-	{MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK, 0x00},
-	{MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK, 0x00},
-	{MAX98373_R2056_MEAS_ADC_PVDD_CH_EN, 0x00},
-	{MAX98373_R2090_BDE_LVL_HOLD, 0x00},
-	{MAX98373_R2091_BDE_GAIN_ATK_REL_RATE, 0x00},
-	{MAX98373_R2092_BDE_CLIPPER_MODE, 0x00},
-	{MAX98373_R2097_BDE_L1_THRESH, 0x00},
-	{MAX98373_R2098_BDE_L2_THRESH, 0x00},
-	{MAX98373_R2099_BDE_L3_THRESH, 0x00},
-	{MAX98373_R209A_BDE_L4_THRESH, 0x00},
-	{MAX98373_R209B_BDE_THRESH_HYST, 0x00},
-	{MAX98373_R20A8_BDE_L1_CFG_1, 0x00},
-	{MAX98373_R20A9_BDE_L1_CFG_2, 0x00},
-	{MAX98373_R20AA_BDE_L1_CFG_3, 0x00},
-	{MAX98373_R20AB_BDE_L2_CFG_1, 0x00},
-	{MAX98373_R20AC_BDE_L2_CFG_2, 0x00},
-	{MAX98373_R20AD_BDE_L2_CFG_3, 0x00},
-	{MAX98373_R20AE_BDE_L3_CFG_1, 0x00},
-	{MAX98373_R20AF_BDE_L3_CFG_2, 0x00},
-	{MAX98373_R20B0_BDE_L3_CFG_3, 0x00},
-	{MAX98373_R20B1_BDE_L4_CFG_1, 0x00},
-	{MAX98373_R20B2_BDE_L4_CFG_2, 0x00},
-	{MAX98373_R20B3_BDE_L4_CFG_3, 0x00},
-	{MAX98373_R20B4_BDE_INFINITE_HOLD_RELEASE, 0x00},
-	{MAX98373_R20B5_BDE_EN, 0x00},
-	{MAX98373_R20B6_BDE_CUR_STATE_READBACK, 0x00},
-	{MAX98373_R20D1_DHT_CFG, 0x01},
-	{MAX98373_R20D2_DHT_ATTACK_CFG, 0x02},
-	{MAX98373_R20D3_DHT_RELEASE_CFG, 0x03},
-	{MAX98373_R20D4_DHT_EN, 0x00},
-	{MAX98373_R20E0_LIMITER_THRESH_CFG, 0x00},
-	{MAX98373_R20E1_LIMITER_ATK_REL_RATES, 0x00},
-	{MAX98373_R20E2_LIMITER_EN, 0x00},
-	{MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG, 0x00},
-	{MAX98373_R20FF_GLOBAL_SHDN, 0x00},
-	{MAX98373_R21FF_REV_ID, 0x42},
-};
-
-static int max98373_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
-{
-	struct snd_soc_component *component = codec_dai->component;
-	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
-	unsigned int format = 0;
-	unsigned int invert = 0;
-
-	dev_dbg(component->dev, "%s: fmt 0x%08X\n", __func__, fmt);
-
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_NB_NF:
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		invert = MAX98373_PCM_MODE_CFG_PCM_BCLKEDGE;
-		break;
-	default:
-		dev_err(component->dev, "DAI invert mode unsupported\n");
-		return -EINVAL;
-	}
-
-	regmap_update_bits(max98373->regmap,
-		MAX98373_R2026_PCM_CLOCK_RATIO,
-		MAX98373_PCM_MODE_CFG_PCM_BCLKEDGE,
-		invert);
-
-	/* interface format */
-	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-		format = MAX98373_PCM_FORMAT_I2S;
-		break;
-	case SND_SOC_DAIFMT_LEFT_J:
-		format = MAX98373_PCM_FORMAT_LJ;
-		break;
-	case SND_SOC_DAIFMT_DSP_A:
-		format = MAX98373_PCM_FORMAT_TDM_MODE1;
-		break;
-	case SND_SOC_DAIFMT_DSP_B:
-		format = MAX98373_PCM_FORMAT_TDM_MODE0;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	regmap_update_bits(max98373->regmap,
-		MAX98373_R2024_PCM_DATA_FMT_CFG,
-		MAX98373_PCM_MODE_CFG_FORMAT_MASK,
-		format << MAX98373_PCM_MODE_CFG_FORMAT_SHIFT);
-
-	return 0;
-}
-
-/* BCLKs per LRCLK */
-static const int bclk_sel_table[] = {
-	32, 48, 64, 96, 128, 192, 256, 384, 512, 320,
-};
-
-static int max98373_get_bclk_sel(int bclk)
-{
-	int i;
-	/* match BCLKs per LRCLK */
-	for (i = 0; i < ARRAY_SIZE(bclk_sel_table); i++) {
-		if (bclk_sel_table[i] == bclk)
-			return i + 2;
-	}
-	return 0;
-}
-
-static int max98373_set_clock(struct snd_soc_component *component,
-	struct snd_pcm_hw_params *params)
-{
-	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
-	/* BCLK/LRCLK ratio calculation */
-	int blr_clk_ratio = params_channels(params) * max98373->ch_size;
-	int value;
-
-	if (!max98373->tdm_mode) {
-		/* BCLK configuration */
-		value = max98373_get_bclk_sel(blr_clk_ratio);
-		if (!value) {
-			dev_err(component->dev, "format unsupported %d\n",
-				params_format(params));
-			return -EINVAL;
-		}
-
-		regmap_update_bits(max98373->regmap,
-			MAX98373_R2026_PCM_CLOCK_RATIO,
-			MAX98373_PCM_CLK_SETUP_BSEL_MASK,
-			value);
-	}
-	return 0;
-}
-
-static int max98373_dai_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params,
-	struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
-	unsigned int sampling_rate = 0;
-	unsigned int chan_sz = 0;
-
-	/* pcm mode configuration */
-	switch (snd_pcm_format_width(params_format(params))) {
-	case 16:
-		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_16;
-		break;
-	case 24:
-		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_24;
-		break;
-	case 32:
-		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_32;
-		break;
-	default:
-		dev_err(component->dev, "format unsupported %d\n",
-			params_format(params));
-		goto err;
-	}
-
-	max98373->ch_size = snd_pcm_format_width(params_format(params));
-
-	regmap_update_bits(max98373->regmap,
-		MAX98373_R2024_PCM_DATA_FMT_CFG,
-		MAX98373_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
-
-	dev_dbg(component->dev, "format supported %d",
-		params_format(params));
-
-	/* sampling rate configuration */
-	switch (params_rate(params)) {
-	case 8000:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_8000;
-		break;
-	case 11025:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_11025;
-		break;
-	case 12000:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_12000;
-		break;
-	case 16000:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_16000;
-		break;
-	case 22050:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_22050;
-		break;
-	case 24000:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_24000;
-		break;
-	case 32000:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_32000;
-		break;
-	case 44100:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_44100;
-		break;
-	case 48000:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_48000;
-		break;
-	case 88200:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_88200;
-		break;
-	case 96000:
-		sampling_rate = MAX98373_PCM_SR_SET1_SR_96000;
-		break;
-	default:
-		dev_err(component->dev, "rate %d not supported\n",
-			params_rate(params));
-		goto err;
-	}
-
-	/* set DAI_SR to correct LRCLK frequency */
-	regmap_update_bits(max98373->regmap,
-		MAX98373_R2027_PCM_SR_SETUP_1,
-		MAX98373_PCM_SR_SET1_SR_MASK,
-		sampling_rate);
-	regmap_update_bits(max98373->regmap,
-		MAX98373_R2028_PCM_SR_SETUP_2,
-		MAX98373_PCM_SR_SET2_SR_MASK,
-		sampling_rate << MAX98373_PCM_SR_SET2_SR_SHIFT);
-
-	/* set sampling rate of IV */
-	if (max98373->interleave_mode &&
-	    sampling_rate > MAX98373_PCM_SR_SET1_SR_16000)
-		regmap_update_bits(max98373->regmap,
-			MAX98373_R2028_PCM_SR_SETUP_2,
-			MAX98373_PCM_SR_SET2_IVADC_SR_MASK,
-			sampling_rate - 3);
-	else
-		regmap_update_bits(max98373->regmap,
-			MAX98373_R2028_PCM_SR_SETUP_2,
-			MAX98373_PCM_SR_SET2_IVADC_SR_MASK,
-			sampling_rate);
-
-	return max98373_set_clock(component, params);
-err:
-	return -EINVAL;
-}
-
-static int max98373_dai_tdm_slot(struct snd_soc_dai *dai,
-	unsigned int tx_mask, unsigned int rx_mask,
-	int slots, int slot_width)
-{
-	struct snd_soc_component *component = dai->component;
-	struct max98373_priv *max98373 = snd_soc_component_get_drvdata(component);
-	int bsel = 0;
-	unsigned int chan_sz = 0;
-	unsigned int mask;
-	int x, slot_found;
-
-	if (!tx_mask && !rx_mask && !slots && !slot_width)
-		max98373->tdm_mode = false;
-	else
-		max98373->tdm_mode = true;
-
-	/* BCLK configuration */
-	bsel = max98373_get_bclk_sel(slots * slot_width);
-	if (bsel == 0) {
-		dev_err(component->dev, "BCLK %d not supported\n",
-			slots * slot_width);
-		return -EINVAL;
-	}
-
-	regmap_update_bits(max98373->regmap,
-		MAX98373_R2026_PCM_CLOCK_RATIO,
-		MAX98373_PCM_CLK_SETUP_BSEL_MASK,
-		bsel);
-
-	/* Channel size configuration */
-	switch (slot_width) {
-	case 16:
-		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_16;
-		break;
-	case 24:
-		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_24;
-		break;
-	case 32:
-		chan_sz = MAX98373_PCM_MODE_CFG_CHANSZ_32;
-		break;
-	default:
-		dev_err(component->dev, "format unsupported %d\n",
-			slot_width);
-		return -EINVAL;
-	}
-
-	regmap_update_bits(max98373->regmap,
-		MAX98373_R2024_PCM_DATA_FMT_CFG,
-		MAX98373_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
-
-	/* Rx slot configuration */
-	slot_found = 0;
-	mask = rx_mask;
-	for (x = 0 ; x < 16 ; x++, mask >>= 1) {
-		if (mask & 0x1) {
-			if (slot_found == 0)
-				regmap_update_bits(max98373->regmap,
-					MAX98373_R2029_PCM_TO_SPK_MONO_MIX_1,
-					MAX98373_PCM_TO_SPK_CH0_SRC_MASK, x);
-			else
-				regmap_write(max98373->regmap,
-					MAX98373_R202A_PCM_TO_SPK_MONO_MIX_2,
-					x);
-			slot_found++;
-			if (slot_found > 1)
-				break;
-		}
-	}
-
-	/* Tx slot Hi-Z configuration */
-	regmap_write(max98373->regmap,
-		MAX98373_R2020_PCM_TX_HIZ_EN_1,
-		~tx_mask & 0xFF);
-	regmap_write(max98373->regmap,
-		MAX98373_R2021_PCM_TX_HIZ_EN_2,
-		(~tx_mask & 0xFF00) >> 8);
-
-	return 0;
-}
-
-#define MAX98373_RATES SNDRV_PCM_RATE_8000_96000
-
-#define MAX98373_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
-	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
-
-static const struct snd_soc_dai_ops max98373_dai_ops = {
-	.set_fmt = max98373_dai_set_fmt,
-	.hw_params = max98373_dai_hw_params,
-	.set_tdm_slot = max98373_dai_tdm_slot,
-};
-
 static int max98373_dac_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
@@ -493,52 +111,6 @@ static const DECLARE_TLV_DB_RANGE(max98373_bde_gain_tlv,
 	0, 60, TLV_DB_SCALE_ITEM(-1500, 25, 0),
 );
 
-static bool max98373_readable_register(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case MAX98373_R2000_SW_RESET:
-	case MAX98373_R2001_INT_RAW1 ... MAX98373_R200C_INT_EN3:
-	case MAX98373_R2010_IRQ_CTRL:
-	case MAX98373_R2014_THERM_WARN_THRESH
-		... MAX98373_R2018_THERM_FOLDBACK_EN:
-	case MAX98373_R201E_PIN_DRIVE_STRENGTH
-		... MAX98373_R2036_SOUNDWIRE_CTRL:
-	case MAX98373_R203D_AMP_DIG_VOL_CTRL ... MAX98373_R2043_AMP_EN:
-	case MAX98373_R2046_IV_SENSE_ADC_DSP_CFG
-		... MAX98373_R2047_IV_SENSE_ADC_EN:
-	case MAX98373_R2051_MEAS_ADC_SAMPLING_RATE
-		... MAX98373_R2056_MEAS_ADC_PVDD_CH_EN:
-	case MAX98373_R2090_BDE_LVL_HOLD ... MAX98373_R2092_BDE_CLIPPER_MODE:
-	case MAX98373_R2097_BDE_L1_THRESH
-		... MAX98373_R209B_BDE_THRESH_HYST:
-	case MAX98373_R20A8_BDE_L1_CFG_1 ... MAX98373_R20B3_BDE_L4_CFG_3:
-	case MAX98373_R20B5_BDE_EN ... MAX98373_R20B6_BDE_CUR_STATE_READBACK:
-	case MAX98373_R20D1_DHT_CFG ... MAX98373_R20D4_DHT_EN:
-	case MAX98373_R20E0_LIMITER_THRESH_CFG ... MAX98373_R20E2_LIMITER_EN:
-	case MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG
-		... MAX98373_R20FF_GLOBAL_SHDN:
-	case MAX98373_R21FF_REV_ID:
-		return true;
-	default:
-		return false;
-	}
-};
-
-static bool max98373_volatile_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case MAX98373_R2000_SW_RESET ... MAX98373_R2009_INT_FLAG3:
-	case MAX98373_R203E_AMP_PATH_GAIN:
-	case MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK:
-	case MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK:
-	case MAX98373_R20B6_BDE_CUR_STATE_READBACK:
-	case MAX98373_R21FF_REV_ID:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static const char * const max98373_output_voltage_lvl_text[] = {
 	"5.43V", "6.09V", "6.83V", "7.67V", "8.60V",
 	"9.65V", "10.83V", "12.15V", "13.63V", "15.29V"
@@ -710,28 +282,7 @@ static const struct snd_soc_dapm_route max98373_audio_map[] = {
 	{ "Speaker FB Sense", NULL, "SpkFB Sense" },
 };
 
-static struct snd_soc_dai_driver max98373_dai[] = {
-	{
-		.name = "max98373-aif1",
-		.playback = {
-			.stream_name = "HiFi Playback",
-			.channels_min = 1,
-			.channels_max = 2,
-			.rates = MAX98373_RATES,
-			.formats = MAX98373_FORMATS,
-		},
-		.capture = {
-			.stream_name = "HiFi Capture",
-			.channels_min = 1,
-			.channels_max = 2,
-			.rates = MAX98373_RATES,
-			.formats = MAX98373_FORMATS,
-		},
-		.ops = &max98373_dai_ops,
-	}
-};
-
-static void max98373_reset(struct max98373_priv *max98373, struct device *dev)
+void max98373_reset(struct max98373_priv *max98373, struct device *dev)
 {
 	int ret, reg, count;
 
@@ -757,6 +308,7 @@ static void max98373_reset(struct max98373_priv *max98373, struct device *dev)
 	}
 	dev_err(dev, "Reset failed. (ret:%d)\n", ret);
 }
+EXPORT_SYMBOL_GPL(max98373_reset);
 
 static int max98373_probe(struct snd_soc_component *component)
 {
@@ -837,31 +389,7 @@ static int max98373_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int max98373_suspend(struct device *dev)
-{
-	struct max98373_priv *max98373 = dev_get_drvdata(dev);
-
-	regcache_cache_only(max98373->regmap, true);
-	regcache_mark_dirty(max98373->regmap);
-	return 0;
-}
-static int max98373_resume(struct device *dev)
-{
-	struct max98373_priv *max98373 = dev_get_drvdata(dev);
-
-	regcache_cache_only(max98373->regmap, false);
-	max98373_reset(max98373, dev);
-	regcache_sync(max98373->regmap);
-	return 0;
-}
-#endif
-
-static const struct dev_pm_ops max98373_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98373_suspend, max98373_resume)
-};
-
-static const struct snd_soc_component_driver soc_codec_dev_max98373 = {
+const struct snd_soc_component_driver soc_codec_dev_max98373 = {
 	.probe			= max98373_probe,
 	.controls		= max98373_snd_controls,
 	.num_controls		= ARRAY_SIZE(max98373_snd_controls),
@@ -874,23 +402,12 @@ static const struct snd_soc_component_driver soc_codec_dev_max98373 = {
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
 };
+EXPORT_SYMBOL_GPL(soc_codec_dev_max98373);
 
-static const struct regmap_config max98373_regmap = {
-	.reg_bits = 16,
-	.val_bits = 8,
-	.max_register = MAX98373_R21FF_REV_ID,
-	.reg_defaults  = max98373_reg,
-	.num_reg_defaults = ARRAY_SIZE(max98373_reg),
-	.readable_reg = max98373_readable_register,
-	.volatile_reg = max98373_volatile_reg,
-	.cache_type = REGCACHE_RBTREE,
-};
-
-static void max98373_slot_config(struct i2c_client *i2c,
-	struct max98373_priv *max98373)
+void max98373_slot_config(struct device *dev,
+			  struct max98373_priv *max98373)
 {
 	int value;
-	struct device *dev = &i2c->dev;
 
 	if (!device_property_read_u32(dev, "maxim,vmon-slot-no", &value))
 		max98373->v_slot = value & 0xF;
@@ -922,111 +439,7 @@ static void max98373_slot_config(struct i2c_client *i2c,
 	else
 		max98373->spkfb_slot = 2;
 }
-
-static int max98373_i2c_probe(struct i2c_client *i2c,
-	const struct i2c_device_id *id)
-{
-
-	int ret = 0;
-	int reg = 0;
-	struct max98373_priv *max98373 = NULL;
-
-	max98373 = devm_kzalloc(&i2c->dev, sizeof(*max98373), GFP_KERNEL);
-
-	if (!max98373) {
-		ret = -ENOMEM;
-		return ret;
-	}
-	i2c_set_clientdata(i2c, max98373);
-
-	/* update interleave mode info */
-	if (device_property_read_bool(&i2c->dev, "maxim,interleave_mode"))
-		max98373->interleave_mode = true;
-	else
-		max98373->interleave_mode = false;
-
-	/* regmap initialization */
-	max98373->regmap
-		= devm_regmap_init_i2c(i2c, &max98373_regmap);
-	if (IS_ERR(max98373->regmap)) {
-		ret = PTR_ERR(max98373->regmap);
-		dev_err(&i2c->dev,
-			"Failed to allocate regmap: %d\n", ret);
-		return ret;
-	}
-
-	/* voltage/current slot & gpio configuration */
-	max98373_slot_config(i2c, max98373);
-
-	/* Power on device */
-	if (gpio_is_valid(max98373->reset_gpio)) {
-		ret = devm_gpio_request(&i2c->dev, max98373->reset_gpio,
-					"MAX98373_RESET");
-		if (ret) {
-			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
-				__func__, max98373->reset_gpio);
-			return -EINVAL;
-		}
-		gpio_direction_output(max98373->reset_gpio, 0);
-		msleep(50);
-		gpio_direction_output(max98373->reset_gpio, 1);
-		msleep(20);
-	}
-
-	/* Check Revision ID */
-	ret = regmap_read(max98373->regmap,
-		MAX98373_R21FF_REV_ID, &reg);
-	if (ret < 0) {
-		dev_err(&i2c->dev,
-			"Failed to read: 0x%02X\n", MAX98373_R21FF_REV_ID);
-		return ret;
-	}
-	dev_info(&i2c->dev, "MAX98373 revisionID: 0x%02X\n", reg);
-
-	/* codec registeration */
-	ret = devm_snd_soc_register_component(&i2c->dev, &soc_codec_dev_max98373,
-		max98373_dai, ARRAY_SIZE(max98373_dai));
-	if (ret < 0)
-		dev_err(&i2c->dev, "Failed to register codec: %d\n", ret);
-
-	return ret;
-}
-
-static const struct i2c_device_id max98373_i2c_id[] = {
-	{ "max98373", 0},
-	{ },
-};
-
-MODULE_DEVICE_TABLE(i2c, max98373_i2c_id);
-
-#if defined(CONFIG_OF)
-static const struct of_device_id max98373_of_match[] = {
-	{ .compatible = "maxim,max98373", },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, max98373_of_match);
-#endif
-
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id max98373_acpi_match[] = {
-	{ "MX98373", 0 },
-	{},
-};
-MODULE_DEVICE_TABLE(acpi, max98373_acpi_match);
-#endif
-
-static struct i2c_driver max98373_i2c_driver = {
-	.driver = {
-		.name = "max98373",
-		.of_match_table = of_match_ptr(max98373_of_match),
-		.acpi_match_table = ACPI_PTR(max98373_acpi_match),
-		.pm = &max98373_pm,
-	},
-	.probe = max98373_i2c_probe,
-	.id_table = max98373_i2c_id,
-};
-
-module_i2c_driver(max98373_i2c_driver)
+EXPORT_SYMBOL_GPL(max98373_slot_config);
 
 MODULE_DESCRIPTION("ALSA SoC MAX98373 driver");
 MODULE_AUTHOR("Ryan Lee <ryans.lee@maximintegrated.com>");
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
index 63dae8be7105..30e02e7afb6d 100644
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -1,5 +1,5 @@
-// SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2017, Maxim Integrated
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2017 Maxim Integrated */
 
 #ifndef _MAX98373_H
 #define _MAX98373_H
@@ -213,4 +213,10 @@ struct max98373_priv {
 	unsigned int ch_size;
 	bool tdm_mode;
 };
+
+extern const struct snd_soc_component_driver soc_codec_dev_max98373;
+
+void max98373_reset(struct max98373_priv *max98373, struct device *dev);
+void max98373_slot_config(struct device *dev,
+			  struct max98373_priv *max98373);
 #endif
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index f176df2599a5..1032f6608045 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -390,7 +390,7 @@ config SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98927
-	select SND_SOC_MAX98373
+	select SND_SOC_MAX98373_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 	help
@@ -467,7 +467,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	depends on ((SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC) &&\
 		    (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
-	select SND_SOC_MAX98373
+	select SND_SOC_MAX98373_I2C
 	select SND_SOC_RT1015
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
@@ -531,7 +531,7 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_DA7219
-	select SND_SOC_MAX98373
+	select SND_SOC_MAX98373_I2C
 	select SND_SOC_DMIC
 	help
 	  This adds support for ASoC machine driver for SOF platforms
-- 
2.25.1


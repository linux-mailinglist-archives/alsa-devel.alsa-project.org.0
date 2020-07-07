Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A62179F2
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 23:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74CA615DC;
	Tue,  7 Jul 2020 23:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74CA615DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594155794;
	bh=UUJKwQyRNj61cB3ayN5gYvjJhPhN/9Bpt/MYqtI8Op0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XimO8tZ7iaBlgay3VRpPJ2hcGX9AQSE7MsdI/VSmiZ/0FtRvBGXh81IUtvuIwoVqg
	 3nsKgeiCr2Fd7zzZy48GKJRPCnONRDDFaqfaEm++yKzBVs6c1jSd7iiWgsZyu6lYjr
	 +s4WB0IrDebnt1+0qKn30cBplcEqmPsfNJKkC6CI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A2E0F80304;
	Tue,  7 Jul 2020 22:58:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95D93F802DF; Tue,  7 Jul 2020 22:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2D85F8025A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2D85F8025A
IronPort-SDR: p+lKnRivm0oBqs8F2cIw8SdfWZmJuTUeTIRUJ22AgCnAbWQM5e2OSGEr4M0ySNR31Oy3jjEZuv
 t8fPoCdDAyRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="146762918"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="146762918"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:55 -0700
IronPort-SDR: 9AFAJVf4G++xJqRmfR1hIgWnGpIuzvIpb/iiOWSOz65dm5oigyc4Ysn4/rneKjm0xs3uTF9OJ4
 jK4Gwd1be+vw==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="305796652"
Received: from colvinch-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.3])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:57:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/6] ASoC: codecs: max98373: add SoundWire support
Date: Tue,  7 Jul 2020 15:57:38 -0500
Message-Id: <20200707205740.114927-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ryan Lee <ryans.lee@maximintegrated.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Naveen Manohar <naveen.m@intel.com>,
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

From: Ryan Lee <ryans.lee@maximintegrated.com>

Add SoundWire specific parts and extend common ones already split from
I2C.

Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/Kconfig        |  14 +
 sound/soc/codecs/Makefile       |   2 +
 sound/soc/codecs/max98373-sdw.c | 887 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98373-sdw.h |  72 +++
 sound/soc/codecs/max98373.c     |  14 +
 sound/soc/codecs/max98373.h     |   7 +
 6 files changed, 996 insertions(+)
 create mode 100644 sound/soc/codecs/max98373-sdw.c
 create mode 100644 sound/soc/codecs/max98373-sdw.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ebefb343f7ef..946a70210f49 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -116,6 +116,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_MAX98926
 	imply SND_SOC_MAX98927
 	imply SND_SOC_MAX98373_I2C
+	imply SND_SOC_MAX98373_SDW
 	imply SND_SOC_MAX98390
 	imply SND_SOC_MAX9850
 	imply SND_SOC_MAX9860
@@ -875,6 +876,19 @@ config SND_SOC_MAX98373_I2C
 	depends on I2C
 	select SND_SOC_MAX98373
 
+config SND_SOC_MAX98373_SDW
+	tristate "Maxim Integrated MAX98373 Speaker Amplifier - SDW"
+	depends on SOUNDWIRE
+	select SND_SOC_MAX98373
+	select REGMAP_SOUNDWIRE
+	help
+	  Enable support for Maxim Integrated MAX98373 Soundwire
+	  amplifier. MAX98373 supports either the MIPI SoundWire
+	  compatible interface for audio and control data, or
+	  the PCM interface for audio data and a standard I2C
+	  interface for control data. Select this if MAX98373 is
+	  connected via soundwire.
+
 config SND_SOC_MAX98390
 	tristate "Maxim Integrated MAX98390 Speaker Amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 3ac82c3b6fc3..0140c60db695 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -116,6 +116,7 @@ snd-soc-max98926-objs := max98926.o
 snd-soc-max98927-objs := max98927.o
 snd-soc-max98373-objs := max98373.o
 snd-soc-max98373-i2c-objs := max98373-i2c.o
+snd-soc-max98373-sdw-objs := max98373-sdw.o
 snd-soc-max98390-objs := max98390.o
 snd-soc-max9850-objs := max9850.o
 snd-soc-max9860-objs := max9860.o
@@ -420,6 +421,7 @@ obj-$(CONFIG_SND_SOC_MAX98926)	+= snd-soc-max98926.o
 obj-$(CONFIG_SND_SOC_MAX98927)	+= snd-soc-max98927.o
 obj-$(CONFIG_SND_SOC_MAX98373)	+= snd-soc-max98373.o
 obj-$(CONFIG_SND_SOC_MAX98373_I2C)   += snd-soc-max98373-i2c.o
+obj-$(CONFIG_SND_SOC_MAX98373_SDW)   += snd-soc-max98373-sdw.o
 obj-$(CONFIG_SND_SOC_MAX98390)	+= snd-soc-max98390.o
 obj-$(CONFIG_SND_SOC_MAX9850)	+= snd-soc-max9850.o
 obj-$(CONFIG_SND_SOC_MAX9860)	+= snd-soc-max9860.o
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
new file mode 100644
index 000000000000..5fe724728e84
--- /dev/null
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -0,0 +1,887 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2020, Maxim Integrated
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include <linux/of.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include "max98373.h"
+#include "max98373-sdw.h"
+
+struct sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+static struct reg_default max98373_reg[] = {
+	{MAX98373_R0040_SCP_INIT_STAT_1, 0x00},
+	{MAX98373_R0041_SCP_INIT_MASK_1, 0x00},
+	{MAX98373_R0042_SCP_INIT_STAT_2, 0x00},
+	{MAX98373_R0044_SCP_CTRL, 0x00},
+	{MAX98373_R0045_SCP_SYSTEM_CTRL, 0x00},
+	{MAX98373_R0046_SCP_DEV_NUMBER, 0x00},
+	{MAX98373_R0050_SCP_DEV_ID_0, 0x21},
+	{MAX98373_R0051_SCP_DEV_ID_1, 0x01},
+	{MAX98373_R0052_SCP_DEV_ID_2, 0x9F},
+	{MAX98373_R0053_SCP_DEV_ID_3, 0x87},
+	{MAX98373_R0054_SCP_DEV_ID_4, 0x08},
+	{MAX98373_R0055_SCP_DEV_ID_5, 0x00},
+	{MAX98373_R0060_SCP_FRAME_CTLR, 0x00},
+	{MAX98373_R0070_SCP_FRAME_CTLR, 0x00},
+	{MAX98373_R0100_DP1_INIT_STAT, 0x00},
+	{MAX98373_R0101_DP1_INIT_MASK, 0x00},
+	{MAX98373_R0102_DP1_PORT_CTRL, 0x00},
+	{MAX98373_R0103_DP1_BLOCK_CTRL_1, 0x00},
+	{MAX98373_R0104_DP1_PREPARE_STATUS, 0x00},
+	{MAX98373_R0105_DP1_PREPARE_CTRL, 0x00},
+	{MAX98373_R0120_DP1_CHANNEL_EN, 0x00},
+	{MAX98373_R0122_DP1_SAMPLE_CTRL1, 0x00},
+	{MAX98373_R0123_DP1_SAMPLE_CTRL2, 0x00},
+	{MAX98373_R0124_DP1_OFFSET_CTRL1, 0x00},
+	{MAX98373_R0125_DP1_OFFSET_CTRL2, 0x00},
+	{MAX98373_R0126_DP1_HCTRL, 0x00},
+	{MAX98373_R0127_DP1_BLOCK_CTRL3, 0x00},
+	{MAX98373_R0130_DP1_CHANNEL_EN, 0x00},
+	{MAX98373_R0132_DP1_SAMPLE_CTRL1, 0x00},
+	{MAX98373_R0133_DP1_SAMPLE_CTRL2, 0x00},
+	{MAX98373_R0134_DP1_OFFSET_CTRL1, 0x00},
+	{MAX98373_R0135_DP1_OFFSET_CTRL2, 0x00},
+	{MAX98373_R0136_DP1_HCTRL, 0x0136},
+	{MAX98373_R0137_DP1_BLOCK_CTRL3, 0x00},
+	{MAX98373_R0300_DP3_INIT_STAT, 0x00},
+	{MAX98373_R0301_DP3_INIT_MASK, 0x00},
+	{MAX98373_R0302_DP3_PORT_CTRL, 0x00},
+	{MAX98373_R0303_DP3_BLOCK_CTRL_1, 0x00},
+	{MAX98373_R0304_DP3_PREPARE_STATUS, 0x00},
+	{MAX98373_R0305_DP3_PREPARE_CTRL, 0x00},
+	{MAX98373_R0320_DP3_CHANNEL_EN, 0x00},
+	{MAX98373_R0322_DP3_SAMPLE_CTRL1, 0x00},
+	{MAX98373_R0323_DP3_SAMPLE_CTRL2, 0x00},
+	{MAX98373_R0324_DP3_OFFSET_CTRL1, 0x00},
+	{MAX98373_R0325_DP3_OFFSET_CTRL2, 0x00},
+	{MAX98373_R0326_DP3_HCTRL, 0x00},
+	{MAX98373_R0327_DP3_BLOCK_CTRL3, 0x00},
+	{MAX98373_R0330_DP3_CHANNEL_EN, 0x00},
+	{MAX98373_R0332_DP3_SAMPLE_CTRL1, 0x00},
+	{MAX98373_R0333_DP3_SAMPLE_CTRL2, 0x00},
+	{MAX98373_R0334_DP3_OFFSET_CTRL1, 0x00},
+	{MAX98373_R0335_DP3_OFFSET_CTRL2, 0x00},
+	{MAX98373_R0336_DP3_HCTRL, 0x00},
+	{MAX98373_R0337_DP3_BLOCK_CTRL3, 0x00},
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
+static bool max98373_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98373_R21FF_REV_ID:
+	case MAX98373_R2010_IRQ_CTRL:
+	/* SoundWire Control Port Registers */
+	case MAX98373_R0040_SCP_INIT_STAT_1 ... MAX98373_R0070_SCP_FRAME_CTLR:
+	/* Soundwire Data Port 1 Registers */
+	case MAX98373_R0100_DP1_INIT_STAT ... MAX98373_R0137_DP1_BLOCK_CTRL3:
+	/* Soundwire Data Port 3 Registers */
+	case MAX98373_R0300_DP3_INIT_STAT ... MAX98373_R0337_DP3_BLOCK_CTRL3:
+	case MAX98373_R2000_SW_RESET ... MAX98373_R200C_INT_EN3:
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
+		return true;
+	default:
+		return false;
+	}
+};
+
+static bool max98373_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK:
+	case MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK:
+	case MAX98373_R20B6_BDE_CUR_STATE_READBACK:
+	case MAX98373_R21FF_REV_ID:
+	/* SoundWire Control Port Registers */
+	case MAX98373_R0040_SCP_INIT_STAT_1 ... MAX98373_R0070_SCP_FRAME_CTLR:
+	/* Soundwire Data Port 1 Registers */
+	case MAX98373_R0100_DP1_INIT_STAT ... MAX98373_R0137_DP1_BLOCK_CTRL3:
+	/* Soundwire Data Port 3 Registers */
+	case MAX98373_R0300_DP3_INIT_STAT ... MAX98373_R0337_DP3_BLOCK_CTRL3:
+	case MAX98373_R2000_SW_RESET ... MAX98373_R2009_INT_FLAG3:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config max98373_sdw_regmap = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.max_register = MAX98373_R21FF_REV_ID,
+	.reg_defaults  = max98373_reg,
+	.num_reg_defaults = ARRAY_SIZE(max98373_reg),
+	.readable_reg = max98373_readable_register,
+	.volatile_reg = max98373_volatile_reg,
+	.cache_type = REGCACHE_RBTREE,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+/* Power management functions and structure */
+static __maybe_unused int max98373_suspend(struct device *dev)
+{
+	struct max98373_priv *max98373 = dev_get_drvdata(dev);
+
+	regcache_cache_only(max98373->regmap, true);
+	regcache_mark_dirty(max98373->regmap);
+	return 0;
+}
+
+static __maybe_unused int max98373_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct max98373_priv *max98373 = dev_get_drvdata(dev);
+	unsigned long time;
+
+	if (!slave->unattach_request)
+		goto regmap_sync;
+
+	time = wait_for_completion_timeout(&slave->initialization_complete,
+					   msecs_to_jiffies(2000));
+	if (!time) {
+		dev_err(dev, "Initialization not complete, timed out\n");
+		return -ETIMEDOUT;
+	}
+
+regmap_sync:
+	slave->unattach_request = 0;
+	regcache_cache_only(max98373->regmap, false);
+	regcache_sync(max98373->regmap);
+
+	return 0;
+}
+
+static const struct dev_pm_ops max98373_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(max98373_suspend, max98373_resume)
+	SET_RUNTIME_PM_OPS(max98373_suspend, max98373_resume, NULL)
+};
+
+static int max98373_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	int nval, i, num_of_ports;
+	u32 bit;
+	unsigned long addr;
+	struct sdw_dpn_prop *dpn;
+
+	/* BITMAP: 00001000  Dataport 3 is active */
+	prop->source_ports = BIT(3);
+	/* BITMAP: 00000010  Dataport 1 is active */
+	prop->sink_ports = BIT(1);
+	prop->paging_support = true;
+	prop->clk_stop_timeout = 20;
+
+	nval = hweight32(prop->source_ports);
+	num_of_ports = nval;
+	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					  sizeof(*prop->src_dpn_prop),
+					  GFP_KERNEL);
+	if (!prop->src_dpn_prop)
+		return -ENOMEM;
+
+	i = 0;
+	dpn = prop->src_dpn_prop;
+	addr = prop->source_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].type = SDW_DPN_FULL;
+		dpn[i].simple_ch_prep_sm = true;
+		dpn[i].ch_prep_timeout = 10;
+		i++;
+	}
+
+	/* do this again for sink now */
+	nval = hweight32(prop->sink_ports);
+	num_of_ports += nval;
+	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					   sizeof(*prop->sink_dpn_prop),
+					   GFP_KERNEL);
+	if (!prop->sink_dpn_prop)
+		return -ENOMEM;
+
+	i = 0;
+	dpn = prop->sink_dpn_prop;
+	addr = prop->sink_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].type = SDW_DPN_FULL;
+		dpn[i].simple_ch_prep_sm = true;
+		dpn[i].ch_prep_timeout = 10;
+		i++;
+	}
+
+	/* Allocate port_ready based on num_of_ports */
+	slave->port_ready = devm_kcalloc(&slave->dev, num_of_ports,
+					 sizeof(*slave->port_ready),
+					 GFP_KERNEL);
+	if (!slave->port_ready)
+		return -ENOMEM;
+
+	/* Initialize completion */
+	for (i = 0; i < num_of_ports; i++)
+		init_completion(&slave->port_ready[i]);
+
+	/* set the timeout values */
+	prop->clk_stop_timeout = 20;
+
+	return 0;
+}
+
+static int max98373_io_init(struct sdw_slave *slave)
+{
+	struct device *dev = &slave->dev;
+	struct max98373_priv *max98373 = dev_get_drvdata(dev);
+
+	if (max98373->pm_init_once) {
+		regcache_cache_only(max98373->regmap, false);
+		regcache_cache_bypass(max98373->regmap, true);
+	}
+
+	/*
+	 * PM runtime is only enabled when a Slave reports as Attached
+	 */
+	if (!max98373->pm_init_once) {
+		/* set autosuspend parameters */
+		pm_runtime_set_autosuspend_delay(dev, 3000);
+		pm_runtime_use_autosuspend(dev);
+
+		/* update count of parent 'active' children */
+		pm_runtime_set_active(dev);
+
+		/* make sure the device does not suspend immediately */
+		pm_runtime_mark_last_busy(dev);
+
+		pm_runtime_enable(dev);
+	}
+
+	pm_runtime_get_noresume(dev);
+
+	/* Software Reset */
+	max98373_reset(max98373, dev);
+
+	/* Set soundwire mode */
+	regmap_write(max98373->regmap, MAX98373_R2025_AUDIO_IF_MODE, 3);
+	/* Enable ADC */
+	regmap_write(max98373->regmap, MAX98373_R2047_IV_SENSE_ADC_EN, 3);
+	/* Set default Soundwire clock */
+	regmap_write(max98373->regmap, MAX98373_R2036_SOUNDWIRE_CTRL, 5);
+	/* Set default sampling rate for speaker and IVDAC */
+	regmap_write(max98373->regmap, MAX98373_R2028_PCM_SR_SETUP_2, 0x88);
+	/* IV default slot configuration */
+	regmap_write(max98373->regmap,
+		     MAX98373_R2020_PCM_TX_HIZ_EN_1,
+		     0xFF);
+	regmap_write(max98373->regmap,
+		     MAX98373_R2021_PCM_TX_HIZ_EN_2,
+		     0xFF);
+	/* L/R mix configuration */
+	regmap_write(max98373->regmap,
+		     MAX98373_R2029_PCM_TO_SPK_MONO_MIX_1,
+		     0x80);
+	regmap_write(max98373->regmap,
+		     MAX98373_R202A_PCM_TO_SPK_MONO_MIX_2,
+		     0x1);
+	/* Enable DC blocker */
+	regmap_write(max98373->regmap,
+		     MAX98373_R203F_AMP_DSP_CFG,
+		     0x3);
+	/* Enable IMON VMON DC blocker */
+	regmap_write(max98373->regmap,
+		     MAX98373_R2046_IV_SENSE_ADC_DSP_CFG,
+		     0x7);
+	/* voltage, current slot configuration */
+	regmap_write(max98373->regmap,
+		     MAX98373_R2022_PCM_TX_SRC_1,
+		     (max98373->i_slot << MAX98373_PCM_TX_CH_SRC_A_I_SHIFT |
+		     max98373->v_slot) & 0xFF);
+	if (max98373->v_slot < 8)
+		regmap_update_bits(max98373->regmap,
+				   MAX98373_R2020_PCM_TX_HIZ_EN_1,
+				   1 << max98373->v_slot, 0);
+	else
+		regmap_update_bits(max98373->regmap,
+				   MAX98373_R2021_PCM_TX_HIZ_EN_2,
+				   1 << (max98373->v_slot - 8), 0);
+
+	if (max98373->i_slot < 8)
+		regmap_update_bits(max98373->regmap,
+				   MAX98373_R2020_PCM_TX_HIZ_EN_1,
+				   1 << max98373->i_slot, 0);
+	else
+		regmap_update_bits(max98373->regmap,
+				   MAX98373_R2021_PCM_TX_HIZ_EN_2,
+				   1 << (max98373->i_slot - 8), 0);
+
+	/* speaker feedback slot configuration */
+	regmap_write(max98373->regmap,
+		     MAX98373_R2023_PCM_TX_SRC_2,
+		     max98373->spkfb_slot & 0xFF);
+
+	/* Set interleave mode */
+	if (max98373->interleave_mode)
+		regmap_update_bits(max98373->regmap,
+				   MAX98373_R2024_PCM_DATA_FMT_CFG,
+				   MAX98373_PCM_TX_CH_INTERLEAVE_MASK,
+				   MAX98373_PCM_TX_CH_INTERLEAVE_MASK);
+
+	/* Speaker enable */
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2043_AMP_EN,
+			   MAX98373_SPK_EN_MASK, 1);
+
+	regmap_write(max98373->regmap, MAX98373_R20B5_BDE_EN, 1);
+	regmap_write(max98373->regmap, MAX98373_R20E2_LIMITER_EN, 1);
+
+	if (max98373->pm_init_once) {
+		regcache_cache_bypass(max98373->regmap, false);
+		regcache_mark_dirty(max98373->regmap);
+	}
+
+	max98373->pm_init_once = true;
+	max98373->hw_init = true;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
+static int max98373_clock_calculate(struct sdw_slave *slave,
+				    unsigned int clk_freq)
+{
+	int x, y;
+	static const int max98373_clk_family[] = {
+		7680000, 8400000, 9600000, 11289600,
+		12000000, 12288000, 13000000
+	};
+
+	for (x = 0; x < 4; x++)
+		for (y = 0; y < ARRAY_SIZE(max98373_clk_family); y++)
+			if (clk_freq == (max98373_clk_family[y] >> x))
+				return (x << 3) + y;
+
+	/* Set default clock (12.288 Mhz) if the value is not in the list */
+	dev_err(&slave->dev, "Requested clock not found. (clk_freq = %d)\n",
+		clk_freq);
+	return 0x5;
+}
+
+static int max98373_clock_config(struct sdw_slave *slave,
+				 struct sdw_bus_params *params)
+{
+	struct device *dev = &slave->dev;
+	struct max98373_priv *max98373 = dev_get_drvdata(dev);
+	unsigned int clk_freq, value;
+
+	clk_freq = (params->curr_dr_freq >> 1);
+
+	/*
+	 *	Select the proper value for the register based on the
+	 *	requested clock. If the value is not in the list,
+	 *	use reasonable default - 12.288 Mhz
+	 */
+	value = max98373_clock_calculate(slave, clk_freq);
+
+	/* SWCLK */
+	regmap_write(max98373->regmap, MAX98373_R2036_SOUNDWIRE_CTRL, value);
+
+	/* The default Sampling Rate value for IV is 48KHz*/
+	regmap_write(max98373->regmap, MAX98373_R2028_PCM_SR_SETUP_2, 0x88);
+
+	return 0;
+}
+
+#define MAX98373_RATES SNDRV_PCM_RATE_8000_96000
+#define MAX98373_FORMATS (SNDRV_PCM_FMTBIT_S32_LE)
+
+static int max98373_sdw_dai_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98373_priv *max98373 =
+		snd_soc_component_get_drvdata(component);
+
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct sdw_stream_data *stream;
+	int ret, chan_sz, sampling_rate;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!stream)
+		return -EINVAL;
+
+	if (!max98373->slave)
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		direction = SDW_DATA_DIR_RX;
+		port_config.num = 1;
+	} else {
+		direction = SDW_DATA_DIR_TX;
+		port_config.num = 3;
+	}
+
+	stream_config.frame_rate = params_rate(params);
+	stream_config.bps = snd_pcm_format_width(params_format(params));
+	stream_config.direction = direction;
+
+	if (max98373->slot && direction == SDW_DATA_DIR_RX) {
+		stream_config.ch_count = max98373->slot;
+		port_config.ch_mask = max98373->rx_mask;
+	} else {
+		/* only IV are supported by capture */
+		if (direction == SDW_DATA_DIR_TX)
+			stream_config.ch_count = 2;
+		else
+			stream_config.ch_count = params_channels(params);
+
+		port_config.ch_mask = GENMASK((int)stream_config.ch_count - 1, 0);
+	}
+
+	ret = sdw_stream_add_slave(max98373->slave, &stream_config,
+				   &port_config, 1, stream->sdw_stream);
+	if (ret) {
+		dev_err(dai->dev, "Unable to configure port\n");
+		return ret;
+	}
+
+	if (params_channels(params) > 16) {
+		dev_err(component->dev, "Unsupported channels %d\n",
+			params_channels(params));
+		return -EINVAL;
+	}
+
+	/* Channel size configuration */
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
+		dev_err(component->dev, "Channel size unsupported %d\n",
+			params_format(params));
+		return -EINVAL;
+	}
+
+	max98373->ch_size = snd_pcm_format_width(params_format(params));
+
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2024_PCM_DATA_FMT_CFG,
+			   MAX98373_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+
+	dev_dbg(component->dev, "Format supported %d", params_format(params));
+
+	/* Sampling rate configuration */
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
+		dev_err(component->dev, "Rate %d is not supported\n",
+			params_rate(params));
+		return -EINVAL;
+	}
+
+	/* set correct sampling frequency */
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2028_PCM_SR_SETUP_2,
+			   MAX98373_PCM_SR_SET2_SR_MASK,
+			   sampling_rate << MAX98373_PCM_SR_SET2_SR_SHIFT);
+
+	/* set sampling rate of IV */
+	regmap_update_bits(max98373->regmap,
+			   MAX98373_R2028_PCM_SR_SETUP_2,
+			   MAX98373_PCM_SR_SET2_IVADC_SR_MASK,
+			   sampling_rate);
+
+	return 0;
+}
+
+static int max98373_pcm_hw_free(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98373_priv *max98373 =
+		snd_soc_component_get_drvdata(component);
+	struct sdw_stream_data *stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!max98373->slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(max98373->slave, stream->sdw_stream);
+	return 0;
+}
+
+static int max98373_set_sdw_stream(struct snd_soc_dai *dai,
+				   void *sdw_stream, int direction)
+{
+	struct sdw_stream_data *stream;
+
+	if (!sdw_stream)
+		return 0;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	stream->sdw_stream = sdw_stream;
+
+	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->playback_dma_data = stream;
+	else
+		dai->capture_dma_data = stream;
+
+	return 0;
+}
+
+static void max98373_shutdown(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int max98373_sdw_set_tdm_slot(struct snd_soc_dai *dai,
+				     unsigned int tx_mask,
+				     unsigned int rx_mask,
+				     int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98373_priv *max98373 =
+		snd_soc_component_get_drvdata(component);
+
+	/* tx_mask is unused since it's irrelevant for I/V feedback */
+	if (tx_mask)
+		return -EINVAL;
+
+	if (!rx_mask && !slots && !slot_width)
+		max98373->tdm_mode = false;
+	else
+		max98373->tdm_mode = true;
+
+	max98373->rx_mask = rx_mask;
+	max98373->slot = slots;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops max98373_dai_sdw_ops = {
+	.hw_params = max98373_sdw_dai_hw_params,
+	.hw_free = max98373_pcm_hw_free,
+	.set_sdw_stream = max98373_set_sdw_stream,
+	.shutdown = max98373_shutdown,
+	.set_tdm_slot = max98373_sdw_set_tdm_slot,
+};
+
+static struct snd_soc_dai_driver max98373_sdw_dai[] = {
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
+		.ops = &max98373_dai_sdw_ops,
+	}
+};
+
+static int max98373_init(struct sdw_slave *slave, struct regmap *regmap)
+{
+	struct max98373_priv *max98373;
+	int ret;
+	struct device *dev = &slave->dev;
+
+	/*  Allocate and assign private driver data structure  */
+	max98373 = devm_kzalloc(dev, sizeof(*max98373), GFP_KERNEL);
+	if (!max98373)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, max98373);
+	max98373->regmap = regmap;
+	max98373->slave = slave;
+
+	/* Read voltage and slot configuration */
+	max98373_slot_config(dev, max98373);
+
+	max98373->hw_init = false;
+	max98373->pm_init_once = false;
+
+	/* codec registration  */
+	ret = devm_snd_soc_register_component(dev, &soc_codec_dev_max98373_sdw,
+					      max98373_sdw_dai,
+					      ARRAY_SIZE(max98373_sdw_dai));
+	if (ret < 0)
+		dev_err(dev, "Failed to register codec: %d\n", ret);
+
+	return ret;
+}
+
+static int max98373_update_status(struct sdw_slave *slave,
+				  enum sdw_slave_status status)
+{
+	struct max98373_priv *max98373 = dev_get_drvdata(&slave->dev);
+
+	if (status == SDW_SLAVE_UNATTACHED)
+		max98373->hw_init = false;
+
+	/*
+	 * Perform initialization only if slave status is SDW_SLAVE_ATTACHED
+	 */
+	if (max98373->hw_init || status != SDW_SLAVE_ATTACHED)
+		return 0;
+
+	/* perform I/O transfers required for Slave initialization */
+	return max98373_io_init(slave);
+}
+
+static int max98373_bus_config(struct sdw_slave *slave,
+			       struct sdw_bus_params *params)
+{
+	int ret;
+
+	ret = max98373_clock_config(slave, params);
+	if (ret < 0)
+		dev_err(&slave->dev, "Invalid clk config");
+
+	return ret;
+}
+
+/*
+ * slave_ops: callbacks for get_clock_stop_mode, clock_stop and
+ * port_prep are not defined for now
+ */
+static struct sdw_slave_ops max98373_slave_ops = {
+	.read_prop = max98373_read_prop,
+	.update_status = max98373_update_status,
+	.bus_config = max98373_bus_config,
+};
+
+static int max98373_sdw_probe(struct sdw_slave *slave,
+			      const struct sdw_device_id *id)
+{
+	struct regmap *regmap;
+
+	/* Regmap Initialization */
+	regmap = devm_regmap_init_sdw(slave, &max98373_sdw_regmap);
+	if (!regmap)
+		return -EINVAL;
+
+	return max98373_init(slave, regmap);
+}
+
+#if defined(CONFIG_OF)
+static const struct of_device_id max98373_of_match[] = {
+	{ .compatible = "maxim,max98373", },
+	{},
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
+static const struct sdw_device_id max98373_id[] = {
+	SDW_SLAVE_ENTRY(0x019F, 0x8373, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, max98373_id);
+
+static struct sdw_driver max98373_sdw_driver = {
+	.driver = {
+		.name = "max98373",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(max98373_of_match),
+		.acpi_match_table = ACPI_PTR(max98373_acpi_match),
+		.pm = &max98373_pm,
+	},
+	.probe = max98373_sdw_probe,
+	.remove = NULL,
+	.ops = &max98373_slave_ops,
+	.id_table = max98373_id,
+};
+
+module_sdw_driver(max98373_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC MAX98373 driver SDW");
+MODULE_AUTHOR("Oleg Sherbakov <oleg.sherbakov@maximintegrated.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/max98373-sdw.h b/sound/soc/codecs/max98373-sdw.h
new file mode 100644
index 000000000000..2d8033515d34
--- /dev/null
+++ b/sound/soc/codecs/max98373-sdw.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2020 Maxim Integrated */
+
+#ifndef _MAX98373_SDW_H
+#define _MAX98373_SDW_H
+
+#include "max98373.h"
+
+/* SoundWire Slave Control Port (SCP)  */
+#define MAX98373_R0040_SCP_INIT_STAT_1		0x0040
+#define MAX98373_R0041_SCP_INIT_MASK_1		0x0041
+#define MAX98373_R0042_SCP_INIT_STAT_2		0x0042
+#define MAX98373_R0044_SCP_CTRL			0x0044
+#define MAX98373_R0045_SCP_SYSTEM_CTRL		0x0045
+#define MAX98373_R0046_SCP_DEV_NUMBER		0x0046
+#define MAX98373_R0050_SCP_DEV_ID_0		0x0050
+#define MAX98373_R0051_SCP_DEV_ID_1		0x0051
+#define MAX98373_R0052_SCP_DEV_ID_2		0x0052
+#define MAX98373_R0053_SCP_DEV_ID_3		0x0053
+#define MAX98373_R0054_SCP_DEV_ID_4		0x0054
+#define MAX98373_R0055_SCP_DEV_ID_5		0x0055
+#define MAX98373_R0060_SCP_FRAME_CTLR		0x0060
+#define MAX98373_R0070_SCP_FRAME_CTLR		0x0070
+
+/* SoundWire Device Data Port (DP)  */
+/* Data Port 1 Registers */
+#define MAX98373_R0100_DP1_INIT_STAT		0x0100
+#define MAX98373_R0101_DP1_INIT_MASK		0x0101
+#define MAX98373_R0102_DP1_PORT_CTRL		0x0102
+#define MAX98373_R0103_DP1_BLOCK_CTRL_1		0x0103
+#define MAX98373_R0104_DP1_PREPARE_STATUS	0x0104
+#define MAX98373_R0105_DP1_PREPARE_CTRL		0x0105
+/* Data Port 1 Bank 0 Registers */
+#define MAX98373_R0120_DP1_CHANNEL_EN		0x0120
+#define MAX98373_R0122_DP1_SAMPLE_CTRL1		0x0122
+#define MAX98373_R0123_DP1_SAMPLE_CTRL2		0x0123
+#define MAX98373_R0124_DP1_OFFSET_CTRL1		0x0124
+#define MAX98373_R0125_DP1_OFFSET_CTRL2		0x0125
+#define MAX98373_R0126_DP1_HCTRL		0x0126
+#define MAX98373_R0127_DP1_BLOCK_CTRL3		0x0127
+/* Data Port 1 Bank 1 Registers */
+#define MAX98373_R0130_DP1_CHANNEL_EN		0x0130
+#define MAX98373_R0132_DP1_SAMPLE_CTRL1		0x0132
+#define MAX98373_R0133_DP1_SAMPLE_CTRL2		0x0133
+#define MAX98373_R0134_DP1_OFFSET_CTRL1		0x0134
+#define MAX98373_R0135_DP1_OFFSET_CTRL2		0x0135
+#define MAX98373_R0136_DP1_HCTRL		0x0136
+#define MAX98373_R0137_DP1_BLOCK_CTRL3		0x0137
+/* Data Port 3 Registers */
+#define MAX98373_R0300_DP3_INIT_STAT		0x0300
+#define MAX98373_R0301_DP3_INIT_MASK		0x0301
+#define MAX98373_R0302_DP3_PORT_CTRL		0x0302
+#define MAX98373_R0303_DP3_BLOCK_CTRL_1		0x0303
+#define MAX98373_R0304_DP3_PREPARE_STATUS	0x0304
+#define MAX98373_R0305_DP3_PREPARE_CTRL		0x0305
+/* Data Port 3 Bank 0 Registers */
+#define MAX98373_R0320_DP3_CHANNEL_EN		0x0320
+#define MAX98373_R0322_DP3_SAMPLE_CTRL1		0x0322
+#define MAX98373_R0323_DP3_SAMPLE_CTRL2		0x0323
+#define MAX98373_R0324_DP3_OFFSET_CTRL1		0x0324
+#define MAX98373_R0325_DP3_OFFSET_CTRL2		0x0325
+#define MAX98373_R0326_DP3_HCTRL		0x0326
+#define MAX98373_R0327_DP3_BLOCK_CTRL3		0x0327
+/* Data Port 3 Bank 1 Registers */
+#define MAX98373_R0330_DP3_CHANNEL_EN		0x0330
+#define MAX98373_R0332_DP3_SAMPLE_CTRL1		0x0332
+#define MAX98373_R0333_DP3_SAMPLE_CTRL2		0x0333
+#define MAX98373_R0334_DP3_OFFSET_CTRL1		0x0334
+#define MAX98373_R0335_DP3_OFFSET_CTRL2		0x0335
+#define MAX98373_R0336_DP3_HCTRL		0x0336
+#define MAX98373_R0337_DP3_BLOCK_CTRL3		0x0337
+#endif
diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index bf5572fc4f66..929bb1798c43 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -396,6 +396,20 @@ const struct snd_soc_component_driver soc_codec_dev_max98373 = {
 };
 EXPORT_SYMBOL_GPL(soc_codec_dev_max98373);
 
+const struct snd_soc_component_driver soc_codec_dev_max98373_sdw = {
+	.probe			= NULL,
+	.controls		= max98373_snd_controls,
+	.num_controls		= ARRAY_SIZE(max98373_snd_controls),
+	.dapm_widgets		= max98373_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(max98373_dapm_widgets),
+	.dapm_routes		= max98373_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(max98373_audio_map),
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+EXPORT_SYMBOL_GPL(soc_codec_dev_max98373_sdw);
+
 void max98373_slot_config(struct device *dev,
 			  struct max98373_priv *max98373)
 {
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
index 30e02e7afb6d..4ab29b9d51c7 100644
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -212,9 +212,16 @@ struct max98373_priv {
 	bool interleave_mode;
 	unsigned int ch_size;
 	bool tdm_mode;
+	/* variables to support soundwire */
+	struct sdw_slave *slave;
+	bool hw_init;
+	bool pm_init_once;
+	int slot;
+	unsigned int rx_mask;
 };
 
 extern const struct snd_soc_component_driver soc_codec_dev_max98373;
+extern const struct snd_soc_component_driver soc_codec_dev_max98373_sdw;
 
 void max98373_reset(struct max98373_priv *max98373, struct device *dev);
 void max98373_slot_config(struct device *dev,
-- 
2.25.1


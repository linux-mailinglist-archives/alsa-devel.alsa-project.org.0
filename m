Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 918FC3B94BB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jul 2021 18:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1862C1697;
	Thu,  1 Jul 2021 18:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1862C1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625157410;
	bh=xxYP4H25z1t23b6SBSaC5ARqEeXzAmHORk131is89i0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t6u36dWu9wWkU7DXyhRqcaveTB64GfgueOa8UTIQVRalFdY1iP7N4ixtMKnRtLDBZ
	 THWHB5SPapB4oCnEdTh8MbR87gJlh8HHPh5uwMDkT/lfc/Z+T/XyKPRUhYJ+DaWC3U
	 8EsMn3WPTgrfF5jRfMkprGO5oB7EgRDB6qbCMiw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 732E0F804AE;
	Thu,  1 Jul 2021 18:35:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0EC5F802D2; Thu,  1 Jul 2021 18:35:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 346CAF80259
 for <alsa-devel@alsa-project.org>; Thu,  1 Jul 2021 18:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346CAF80259
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id 1F59A1C805B6;
 Fri,  2 Jul 2021 00:35:02 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 2 Jul
 2021 00:35:01 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 2 Jul 2021 00:35:01 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec chip NAU88L21.
Date: Fri, 2 Jul 2021 00:35:00 +0800
Message-ID: <20210701163500.106358-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotRedirectTo-PP: TRUE
Cc: alsa-devel@alsa-project.org, Seven Lee <wtli@nuvoton.com>,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com
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

The driver is for codec NAU88L21 of Nuvoton Technology Corporation.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 sound/soc/codecs/nau8821.c | 1781 ++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/nau8821.h |  532 +++++++++++
 2 files changed, 2313 insertions(+)
 create mode 100644 sound/soc/codecs/nau8821.c
 create mode 100644 sound/soc/codecs/nau8821.h

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
new file mode 100644
index 000000000000..d3d7c2e0aabf
--- /dev/null
+++ b/sound/soc/codecs/nau8821.c
@@ -0,0 +1,1781 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Nuvoton NAU88L21 audio codec driver
+ *
+ * Copyright 2021 Nuvoton Technology Corp.
+ * Author: John Hsu <KCHSU0@nuvoton.com>
+ * Co-author: Seven Lee <wtli@nuvoton.com>
+ * Licensed under the GPL-2.
+ */
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/clk.h>
+#include <linux/acpi.h>
+#include <linux/math64.h>
+#include <linux/semaphore.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/jack.h>
+#include "nau8821.h"
+
+#define NUVOTON_CODEC_DAI "nau8821-hifi"
+
+#define NAU_FREF_MAX 13500000
+#define NAU_FVCO_MAX 124000000
+#define NAU_FVCO_MIN 90000000
+
+/* the maximum frequency of CLK_ADC and CLK_DAC */
+#define CLK_DA_AD_MAX 6144000
+
+static int nau8821_configure_sysclk(struct nau8821 *nau8821,
+	int clk_id, unsigned int freq);
+
+struct nau8821_fll {
+	int mclk_src;
+	int ratio;
+	int fll_frac;
+	int fll_int;
+	int clk_ref_div;
+};
+
+struct nau8821_fll_attr {
+	unsigned int param;
+	unsigned int val;
+};
+
+/* scaling for mclk from sysclk_src output */
+static const struct nau8821_fll_attr mclk_src_scaling[] = {
+	{ 1, 0x0 },
+	{ 2, 0x2 },
+	{ 4, 0x3 },
+	{ 8, 0x4 },
+	{ 16, 0x5 },
+	{ 32, 0x6 },
+	{ 3, 0x7 },
+	{ 6, 0xa },
+	{ 12, 0xb },
+	{ 24, 0xc },
+	{ 48, 0xd },
+	{ 96, 0xe },
+	{ 5, 0xf },
+};
+
+/* ratio for input clk freq */
+static const struct nau8821_fll_attr fll_ratio[] = {
+	{ 512000, 0x01 },
+	{ 256000, 0x02 },
+	{ 128000, 0x04 },
+	{ 64000, 0x08 },
+	{ 32000, 0x10 },
+	{ 8000, 0x20 },
+	{ 4000, 0x40 },
+};
+
+static const struct nau8821_fll_attr fll_pre_scalar[] = {
+	{ 1, 0x0 },
+	{ 2, 0x1 },
+	{ 4, 0x2 },
+	{ 8, 0x3 },
+};
+
+/* over sampling rate */
+struct nau8821_osr_attr {
+	unsigned int osr;
+	unsigned int clk_src;
+};
+
+static const struct nau8821_osr_attr osr_dac_sel[] = {
+	{ 64, 2 },		/* OSR 64, SRC 1/4 */
+	{ 256, 0 },	/* OSR 256, SRC 1 */
+	{ 128, 1 },	/* OSR 128, SRC 1/2 */
+	{ 0, 0 },
+	{ 32, 3 },		/* OSR 32, SRC 1/8 */
+};
+
+static const struct nau8821_osr_attr osr_adc_sel[] = {
+	{ 32, 3 },		/* OSR 32, SRC 1/8 */
+	{ 64, 2 },		/* OSR 64, SRC 1/4 */
+	{ 128, 1 },	/* OSR 128, SRC 1/2 */
+	{ 256, 0 },	/* OSR 256, SRC 1 */
+};
+
+static const struct reg_default nau8821_reg_defaults[] = {
+	{ NAU8821_R01_ENA_CTRL, 0x00ff },
+	{ NAU8821_R03_CLK_DIVIDER, 0x0050 },
+	{ NAU8821_R04_FLL1, 0x0 },
+	{ NAU8821_R05_FLL2, 0x00bc },
+	{ NAU8821_R06_FLL3, 0x0008 },
+	{ NAU8821_R07_FLL4, 0x0010 },
+	{ NAU8821_R08_FLL5, 0x4000 },
+	{ NAU8821_R09_FLL6, 0x6900 },
+	{ NAU8821_R0A_FLL7, 0x0031 },
+	{ NAU8821_R0B_FLL8, 0x26e9 },
+	{ NAU8821_R0D_JACK_DET_CTRL, 0x0 },
+	{ NAU8821_R0F_INTERRUPT_MASK, 0x0 },
+	{ NAU8821_R12_INTERRUPT_DIS_CTRL, 0xffff },
+	{ NAU8821_R13_DMIC_CTRL, 0x0 },
+	{ NAU8821_R1A_GPIO12_CTRL, 0x0 },
+	{ NAU8821_R1B_TDM_CTRL, 0x0 },
+	{ NAU8821_R1C_I2S_PCM_CTRL1, 0x000a },
+	{ NAU8821_R1D_I2S_PCM_CTRL2, 0x8010 },
+	{ NAU8821_R1E_LEFT_TIME_SLOT, 0x0 },
+	{ NAU8821_R1F_RIGHT_TIME_SLOT, 0x0 },
+	{ NAU8821_R21_BIQ0_COF1, 0x0 },
+	{ NAU8821_R22_BIQ0_COF2, 0x0 },
+	{ NAU8821_R23_BIQ0_COF3, 0x0 },
+	{ NAU8821_R24_BIQ0_COF4, 0x0 },
+	{ NAU8821_R25_BIQ0_COF5, 0x0 },
+	{ NAU8821_R26_BIQ0_COF6, 0x0 },
+	{ NAU8821_R27_BIQ0_COF7, 0x0 },
+	{ NAU8821_R28_BIQ0_COF8, 0x0 },
+	{ NAU8821_R29_BIQ0_COF9, 0x0 },
+	{ NAU8821_R2A_BIQ0_COF10, 0x0 },
+	{ NAU8821_R2B_ADC_RATE, 0x0002 },
+	{ NAU8821_R2C_DAC_CTRL1, 0x0082 },
+	{ NAU8821_R2D_DAC_CTRL2, 0x0 },
+	{ NAU8821_R2F_DAC_DGAIN_CTRL, 0x0 },
+	{ NAU8821_R30_ADC_DGAIN_CTRL, 0x0 },
+	{ NAU8821_R31_MUTE_CTRL, 0x0 },
+	{ NAU8821_R32_HSVOL_CTRL, 0x0 },
+	{ NAU8821_R34_DACR_CTRL, 0xcfcf },
+	{ NAU8821_R35_ADC_DGAIN_CTRL1, 0xcfcf },
+	{ NAU8821_R36_ADC_DRC_KNEE_IP12, 0x1486 },
+	{ NAU8821_R37_ADC_DRC_KNEE_IP34, 0x0f12 },
+	{ NAU8821_R38_ADC_DRC_SLOPES, 0x25ff },
+	{ NAU8821_R39_ADC_DRC_ATKDCY, 0x3457 },
+	{ NAU8821_R3A_DAC_DRC_KNEE_IP12, 0x1486 },
+	{ NAU8821_R3B_DAC_DRC_KNEE_IP34, 0x0f12 },
+	{ NAU8821_R3C_DAC_DRC_SLOPES, 0x25f9 },
+	{ NAU8821_R3D_DAC_DRC_ATKDCY, 0x3457 },
+	{ NAU8821_R41_BIQ1_COF1, 0x0 },
+	{ NAU8821_R42_BIQ1_COF2, 0x0 },
+	{ NAU8821_R43_BIQ1_COF3, 0x0 },
+	{ NAU8821_R44_BIQ1_COF4, 0x0 },
+	{ NAU8821_R45_BIQ1_COF5, 0x0 },
+	{ NAU8821_R46_BIQ1_COF6, 0x0 },
+	{ NAU8821_R47_BIQ1_COF7, 0x0 },
+	{ NAU8821_R48_BIQ1_COF8, 0x0 },
+	{ NAU8821_R49_BIQ1_COF9, 0x0 },
+	{ NAU8821_R4A_BIQ1_COF10, 0x0 },
+	{ NAU8821_R4B_CLASSG_CTRL, 0x0 },
+	{ NAU8821_R4C_IMM_MODE_CTRL, 0x0 },
+	{ NAU8821_R4D_IMM_RMS_L, 0x0 },
+	{ NAU8821_R53_OTPDOUT_1, 0xaad8 },
+	{ NAU8821_R54_OTPDOUT_2, 0x0002 },
+	{ NAU8821_R55_MISC_CTRL, 0x0 },
+	{ NAU8821_R66_BIAS_ADJ, 0x0 },
+	{ NAU8821_R68_TRIM_SETTINGS, 0x0 },
+	{ NAU8821_R69_ANALOG_CONTROL_1, 0x0 },
+	{ NAU8821_R6A_ANALOG_CONTROL_2, 0x0 },
+	{ NAU8821_R6B_PGA_MUTE, 0x0 },
+	{ NAU8821_R71_ANALOG_ADC_1, 0x0011 },
+	{ NAU8821_R72_ANALOG_ADC_2, 0x0020 },
+	{ NAU8821_R73_RDAC, 0x0008 },
+	{ NAU8821_R74_MIC_BIAS, 0x0006 },
+	{ NAU8821_R76_BOOST, 0x0 },
+	{ NAU8821_R77_FEPGA, 0x0 },
+	{ NAU8821_R7E_PGA_GAIN, 0x0 },
+	{ NAU8821_R7F_POWER_UP_CONTROL, 0x0 },
+	{ NAU8821_R80_CHARGE_PUMP, 0x0 },
+};
+
+/**
+ * nau8821_sema_acquire - acquire the semaphore of nau8821
+ * @nau8821:  component to register the codec private data with
+ * @timeout: how long in jiffies to wait before failure or zero to wait
+ * until release
+ *
+ * Attempts to acquire the semaphore with number of jiffies. If no more
+ * tasks are allowed to acquire the semaphore, calling this function will
+ * put the task to sleep. If the semaphore is not released within the
+ * specified number of jiffies, this function returns.
+ * If the semaphore is not released within the specified number of jiffies,
+ * this function returns -ETIME. If the sleep is interrupted by a signal,
+ * this function will return -EINTR. It returns 0 if the semaphore was
+ * acquired successfully.
+ *
+ * Acquires the semaphore without jiffies. Try to acquire the semaphore
+ * atomically. Returns 0 if the semaphore has been acquired successfully
+ * or 1 if it cannot be acquired.
+ */
+static int nau8821_sema_acquire(struct nau8821 *nau8821, long timeout)
+{
+	int ret;
+
+	if (!nau8821->irq)
+		return 1;
+
+	if (timeout) {
+		ret = down_timeout(&nau8821->jd_sem, timeout);
+		if (ret < 0)
+			dev_dbg(nau8821->dev, "Acquire semaphore timeout\n");
+	} else {
+		ret = down_trylock(&nau8821->jd_sem);
+		if (ret)
+			dev_dbg(nau8821->dev, "Acquire semaphore fail\n");
+	}
+
+	return ret;
+}
+
+/**
+ * nau8821_sema_release - release the semaphore of nau8821
+ * @nau8821:  component to register the codec private data with
+ *
+ * Release the semaphore which may be called from any context and
+ * even by tasks which have never called down().
+ */
+static inline void nau8821_sema_release(struct nau8821 *nau8821)
+{
+	if (!nau8821->irq)
+		return;
+	up(&nau8821->jd_sem);
+}
+
+/**
+ * nau8821_sema_reset - reset the semaphore for nau8821
+ * @nau8821:  component to register the codec private data with
+ *
+ * Reset the counter of the semaphore. Call this function to restart
+ * a new round task management.
+ */
+static inline void nau8821_sema_reset(struct nau8821 *nau8821)
+{
+	nau8821->jd_sem.count = 1;
+}
+
+static bool nau8821_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NAU8821_R00_RESET ... NAU8821_R01_ENA_CTRL:
+	case NAU8821_R03_CLK_DIVIDER ... NAU8821_R0B_FLL8:
+	case NAU8821_R0D_JACK_DET_CTRL:
+	case NAU8821_R0F_INTERRUPT_MASK ... NAU8821_R13_DMIC_CTRL:
+	case NAU8821_R1A_GPIO12_CTRL ... NAU8821_R1F_RIGHT_TIME_SLOT:
+	case NAU8821_R21_BIQ0_COF1 ... NAU8821_R2D_DAC_CTRL2:
+	case NAU8821_R2F_DAC_DGAIN_CTRL ... NAU8821_R32_HSVOL_CTRL:
+	case NAU8821_R34_DACR_CTRL ... NAU8821_R3D_DAC_DRC_ATKDCY:
+	case NAU8821_R41_BIQ1_COF1 ... NAU8821_R4F_FUSE_CTRL3:
+	case NAU8821_R51_FUSE_CTRL1:
+	case NAU8821_R53_OTPDOUT_1 ... NAU8821_R55_MISC_CTRL:
+	case NAU8821_R58_I2C_DEVICE_ID ... NAU8821_R5A_SOFTWARE_RST:
+	case NAU8821_R66_BIAS_ADJ:
+	case NAU8821_R68_TRIM_SETTINGS ... NAU8821_R6B_PGA_MUTE:
+	case NAU8821_R71_ANALOG_ADC_1 ... NAU8821_R74_MIC_BIAS:
+	case NAU8821_R76_BOOST ... NAU8821_R77_FEPGA:
+	case NAU8821_R7E_PGA_GAIN ... NAU8821_R82_GENERAL_STATUS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool nau8821_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NAU8821_R00_RESET ... NAU8821_R01_ENA_CTRL:
+	case NAU8821_R03_CLK_DIVIDER ... NAU8821_R0B_FLL8:
+	case NAU8821_R0D_JACK_DET_CTRL:
+	case NAU8821_R0F_INTERRUPT_MASK:
+	case NAU8821_R11_INT_CLR_KEY_STATUS ... NAU8821_R13_DMIC_CTRL:
+	case NAU8821_R1A_GPIO12_CTRL ... NAU8821_R1F_RIGHT_TIME_SLOT:
+	case NAU8821_R21_BIQ0_COF1 ... NAU8821_R2D_DAC_CTRL2:
+	case NAU8821_R2F_DAC_DGAIN_CTRL ... NAU8821_R32_HSVOL_CTRL:
+	case NAU8821_R34_DACR_CTRL ... NAU8821_R3D_DAC_DRC_ATKDCY:
+	case NAU8821_R41_BIQ1_COF1 ... NAU8821_R4C_IMM_MODE_CTRL:
+	case NAU8821_R4E_FUSE_CTRL2 ... NAU8821_R4F_FUSE_CTRL3:
+	case NAU8821_R51_FUSE_CTRL1:
+	case NAU8821_R55_MISC_CTRL:
+	case NAU8821_R5A_SOFTWARE_RST:
+	case NAU8821_R66_BIAS_ADJ:
+	case NAU8821_R68_TRIM_SETTINGS ... NAU8821_R6B_PGA_MUTE:
+	case NAU8821_R71_ANALOG_ADC_1 ... NAU8821_R74_MIC_BIAS:
+	case NAU8821_R76_BOOST ... NAU8821_R77_FEPGA:
+	case NAU8821_R7E_PGA_GAIN ... NAU8821_R80_CHARGE_PUMP:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool nau8821_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case NAU8821_R00_RESET:
+	case NAU8821_R10_IRQ_STATUS ... NAU8821_R11_INT_CLR_KEY_STATUS:
+	case NAU8821_R21_BIQ0_COF1 ... NAU8821_R2A_BIQ0_COF10:
+	case NAU8821_R41_BIQ1_COF1 ... NAU8821_R4A_BIQ1_COF10:
+	case NAU8821_R4D_IMM_RMS_L:
+	case NAU8821_R53_OTPDOUT_1 ... NAU8821_R54_OTPDOUT_2:
+	case NAU8821_R58_I2C_DEVICE_ID ... NAU8821_R5A_SOFTWARE_RST:
+	case NAU8821_R81_CHARGE_PUMP_INPUT_READ ... NAU8821_R82_GENERAL_STATUS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int nau8821_biq_coeff_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
+
+	if (!component->regmap)
+		return -EINVAL;
+
+	regmap_raw_read(component->regmap, NAU8821_R41_BIQ1_COF1,
+		ucontrol->value.bytes.data, params->max);
+
+	return 0;
+}
+
+static int nau8821_biq_coeff_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
+	void *data;
+
+	if (!component->regmap)
+		return -EINVAL;
+
+	data = kmemdup(ucontrol->value.bytes.data,
+		params->max, GFP_KERNEL | GFP_DMA);
+	if (!data)
+		return -ENOMEM;
+
+	regmap_raw_write(component->regmap, NAU8821_R41_BIQ1_COF1,
+		data, params->max);
+
+	kfree(data);
+
+	return 0;
+}
+
+static const char * const nau8821_adc_decimation[] = {
+	"32", "64", "128", "256" };
+
+static const struct soc_enum nau8821_adc_decimation_enum =
+	SOC_ENUM_SINGLE(NAU8821_R2B_ADC_RATE, NAU8821_ADC_SYNC_DOWN_SFT,
+		ARRAY_SIZE(nau8821_adc_decimation), nau8821_adc_decimation);
+
+static const char * const nau8821_dac_oversampl[] = {
+	"64", "256", "128", "", "32" };
+
+static const struct soc_enum nau8821_dac_oversampl_enum =
+	SOC_ENUM_SINGLE(NAU8821_R2C_DAC_CTRL1, NAU8821_DAC_OVERSAMPLE_SFT,
+		ARRAY_SIZE(nau8821_dac_oversampl), nau8821_dac_oversampl);
+
+static const char * const nau8821_dmic_selection[] = {
+	"1", "0.5", "0.25", "0.125" };
+static const struct soc_enum nau8821_dmic_selection_enum =
+	SOC_ENUM_SINGLE(NAU8821_R13_DMIC_CTRL, NAU8821_DMIC_SRC_SFT,
+		ARRAY_SIZE(nau8821_dmic_selection), nau8821_dmic_selection);
+
+static const DECLARE_TLV_DB_MINMAX_MUTE(adc_vol_tlv, -6600, 2400);
+static const DECLARE_TLV_DB_MINMAX_MUTE(sidetone_vol_tlv, -4200, 0);
+static const DECLARE_TLV_DB_MINMAX(hp_vol_tlv, -900, 0);
+static const DECLARE_TLV_DB_SCALE(playback_vol_tlv, -6600, 50, 1);
+static const DECLARE_TLV_DB_MINMAX(fepga_gain_tlv, -100, 3600);
+static const DECLARE_TLV_DB_MINMAX_MUTE(crosstalk_vol_tlv, -9600, 2400);
+
+static const struct snd_kcontrol_new nau8821_controls[] = {
+	SOC_DOUBLE_TLV("Mic Volume", NAU8821_R35_ADC_DGAIN_CTRL1,
+		NAU8821_ADCL_CH_VOL_SFT, NAU8821_ADCR_CH_VOL_SFT,
+		0xff, 0, adc_vol_tlv),
+	SOC_DOUBLE_TLV("Headphone Bypass Volume", NAU8821_R30_ADC_DGAIN_CTRL,
+		12, 8, 0x0f, 0, sidetone_vol_tlv),
+	SOC_DOUBLE_TLV("Headphone Volume", NAU8821_R32_HSVOL_CTRL,
+		NAU8821_HPL_VOL_SFT, NAU8821_HPR_VOL_SFT, 0x3, 1, hp_vol_tlv),
+	SOC_DOUBLE_TLV("Digital Playback Volume", NAU8821_R34_DACR_CTRL,
+		NAU8821_DACL_CH_VOL_SFT, NAU8821_DACR_CH_VOL_SFT,
+		0xcf, 0, playback_vol_tlv),
+	SOC_DOUBLE_TLV("Frontend PGA Volume", NAU8821_R7E_PGA_GAIN,
+		NAU8821_PGA_GAIN_L_SFT, NAU8821_PGA_GAIN_R_SFT,
+		37, 0, fepga_gain_tlv),
+	SOC_DOUBLE_TLV("Headphone Crosstalk Volume", NAU8821_R2F_DAC_DGAIN_CTRL,
+		0, 8, 0xff, 0, crosstalk_vol_tlv),
+
+	SOC_ENUM("ADC Decimation Rate", nau8821_adc_decimation_enum),
+	SOC_ENUM("DAC Oversampling Rate", nau8821_dac_oversampl_enum),
+	SND_SOC_BYTES_EXT("BIQ Coefficients", 20,
+		  nau8821_biq_coeff_get, nau8821_biq_coeff_put),
+	SOC_ENUM("Clock Dmic Src", nau8821_dmic_selection_enum),
+};
+
+static const struct snd_kcontrol_new nau8821_adc_ch0_dmic =
+	SOC_DAPM_SINGLE("Switch", NAU8821_R13_DMIC_CTRL,
+		NAU8821_DMIC_EN_SFT, 1, 0);
+
+static int nau8821_left_adc_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		msleep(125);
+		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
+			NAU8821_EN_ADCL, NAU8821_EN_ADCL);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (!nau8821->irq)
+			regmap_update_bits(nau8821->regmap,
+				NAU8821_R01_ENA_CTRL, NAU8821_EN_ADCL, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int nau8821_right_adc_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		msleep(125);
+		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
+			NAU8821_EN_ADCR, NAU8821_EN_ADCR);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (!nau8821->irq)
+			regmap_update_bits(nau8821->regmap,
+				NAU8821_R01_ENA_CTRL, NAU8821_EN_ADCR, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int nau8821_pump_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* Prevent startup click by letting charge pump to ramp up */
+		usleep_range(0, 10000);
+		regmap_update_bits(nau8821->regmap, NAU8821_R80_CHARGE_PUMP,
+			NAU8821_JAMNODCLOW, NAU8821_JAMNODCLOW);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_update_bits(nau8821->regmap, NAU8821_R80_CHARGE_PUMP,
+			NAU8821_JAMNODCLOW, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int nau8821_output_dac_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		/* Disables the TESTDAC to let DAC signal pass through. */
+		regmap_update_bits(nau8821->regmap, NAU8821_R66_BIAS_ADJ,
+			NAU8821_BIAS_TESTDAC_EN, 0);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		regmap_update_bits(nau8821->regmap, NAU8821_R66_BIAS_ADJ,
+			NAU8821_BIAS_TESTDAC_EN, NAU8821_BIAS_TESTDAC_EN);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget nau8821_dapm_widgets[] = {
+	SND_SOC_DAPM_MICBIAS("MICBIAS", NAU8821_R74_MIC_BIAS,
+		NAU8821_MICBIAS_POWERUP_SFT, 0),
+	SND_SOC_DAPM_PGA("Frontend PGA L", NAU8821_R7F_POWER_UP_CONTROL,
+		NAU8821_PUP_PGA_L_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Frontend PGA R", NAU8821_R7F_POWER_UP_CONTROL,
+		NAU8821_PUP_PGA_R_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADCL Power", NAU8821_R72_ANALOG_ADC_2,
+		NAU8821_POWERUP_ADCL_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADCR Power", NAU8821_R72_ANALOG_ADC_2,
+		NAU8821_POWERUP_ADCR_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_ADC_E("ADCL", NULL, SND_SOC_NOPM, 0, 0,
+		nau8821_left_adc_event, SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADCR", NULL, SND_SOC_NOPM, 0, 0,
+		nau8821_right_adc_event, SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_AIF_OUT("AIFTX", "Capture", 0, NAU8821_R1D_I2S_PCM_CTRL2,
+		NAU8821_I2S_TRISTATE_SFT, 1),
+	SND_SOC_DAPM_AIF_IN("AIFRX", "Playback", 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_PGA_S("ADACL", 2, NAU8821_R73_RDAC,
+		NAU8821_DACL_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("ADACR", 2, NAU8821_R73_RDAC,
+		NAU8821_DACR_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("ADACL Clock", 3, NAU8821_R73_RDAC,
+		NAU8821_DACL_CLK_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("ADACR Clock", 3, NAU8821_R73_RDAC,
+		NAU8821_DACR_CLK_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_DAC("DDACR", NULL, NAU8821_R01_ENA_CTRL,
+		NAU8821_EN_DACR_SFT, 0),
+	SND_SOC_DAPM_DAC("DDACL", NULL, NAU8821_R01_ENA_CTRL,
+		NAU8821_EN_DACL_SFT, 0),
+	SND_SOC_DAPM_PGA_S("HP amp L", 0, NAU8821_R4B_CLASSG_CTRL,
+		NAU8821_CLASSG_LDAC_EN_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("HP amp R", 0, NAU8821_R4B_CLASSG_CTRL,
+		NAU8821_CLASSG_RDAC_EN_SFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_PGA_S("Charge Pump", 1, NAU8821_R80_CHARGE_PUMP,
+		NAU8821_CHANRGE_PUMP_EN_SFT, 0, nau8821_pump_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_PGA_S("Output Driver R Stage 1", 4,
+		NAU8821_R7F_POWER_UP_CONTROL,
+		NAU8821_PUP_INTEG_R_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("Output Driver L Stage 1", 4,
+		NAU8821_R7F_POWER_UP_CONTROL,
+		NAU8821_PUP_INTEG_L_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("Output Driver R Stage 2", 5,
+		NAU8821_R7F_POWER_UP_CONTROL,
+		NAU8821_PUP_DRV_INSTG_R_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("Output Driver L Stage 2", 5,
+		NAU8821_R7F_POWER_UP_CONTROL,
+		NAU8821_PUP_DRV_INSTG_L_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("Output Driver R Stage 3", 6,
+		NAU8821_R7F_POWER_UP_CONTROL,
+		NAU8821_PUP_MAIN_DRV_R_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("Output Driver L Stage 3", 6,
+		NAU8821_R7F_POWER_UP_CONTROL,
+		NAU8821_PUP_MAIN_DRV_L_SFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_PGA_S("Output DACL", 7,
+		NAU8821_R80_CHARGE_PUMP, NAU8821_POWER_DOWN_DACL_SFT,
+		0, nau8821_output_dac_event,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_PGA_S("Output DACR", 7,
+		NAU8821_R80_CHARGE_PUMP, NAU8821_POWER_DOWN_DACR_SFT,
+		0, nau8821_output_dac_event,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* HPOL/R are ungrounded by disabling 16 Ohm pull-downs on playback */
+	SND_SOC_DAPM_PGA_S("HPOL Pulldown", 8,
+		NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_SPKR_DWN1L_SFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_S("HPOR Pulldown", 8,
+		NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_SPKR_DWN1R_SFT, 0, NULL, 0),
+
+	/* High current HPOL/R boost driver */
+	SND_SOC_DAPM_PGA_S("HP Boost Driver", 9,
+		NAU8821_R76_BOOST, NAU8821_HP_BOOST_DIS_SFT, 1, NULL, 0),
+
+	SND_SOC_DAPM_PGA("Class G", NAU8821_R4B_CLASSG_CTRL,
+		NAU8821_CLASSG_EN_SFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_SWITCH("DMIC1 Enable", SND_SOC_NOPM,
+		0, 0, &nau8821_adc_ch0_dmic),
+
+	SND_SOC_DAPM_INPUT("MICL"),
+	SND_SOC_DAPM_INPUT("MICR"),
+	SND_SOC_DAPM_INPUT("DMIC"),
+	SND_SOC_DAPM_OUTPUT("HPOL"),
+	SND_SOC_DAPM_OUTPUT("HPOR"),
+};
+
+static const struct snd_soc_dapm_route nau8821_dapm_routes[] = {
+	{"Frontend PGA L", NULL, "MICL"},
+	{"Frontend PGA R", NULL, "MICR"},
+	{"DMIC1 Enable", "Switch", "DMIC"},
+
+	{"ADCL", NULL, "Frontend PGA L"},
+	{"ADCR", NULL, "Frontend PGA R"},
+	{"ADCL", NULL, "ADCL Power"},
+	{"ADCR", NULL, "ADCR Power"},
+
+	{"AIFTX", NULL, "ADCL"},
+	{"AIFTX", NULL, "ADCR"},
+	{"AIFTX", NULL, "DMIC1 Enable"},
+
+	{"DDACL", NULL, "AIFRX"},
+	{"DDACR", NULL, "AIFRX"},
+
+	{"HP amp L", NULL, "DDACL"},
+	{"HP amp R", NULL, "DDACR"},
+	{"Charge Pump", NULL, "HP amp L"},
+	{"Charge Pump", NULL, "HP amp R"},
+	{"ADACL", NULL, "Charge Pump"},
+	{"ADACR", NULL, "Charge Pump"},
+	{"ADACL Clock", NULL, "ADACL"},
+	{"ADACR Clock", NULL, "ADACR"},
+	{"Output Driver L Stage 1", NULL, "ADACL Clock"},
+	{"Output Driver R Stage 1", NULL, "ADACR Clock"},
+	{"Output Driver L Stage 2", NULL, "Output Driver L Stage 1"},
+	{"Output Driver R Stage 2", NULL, "Output Driver R Stage 1"},
+	{"Output Driver L Stage 3", NULL, "Output Driver L Stage 2"},
+	{"Output Driver R Stage 3", NULL, "Output Driver R Stage 2"},
+	{"Output DACL", NULL, "Output Driver L Stage 3"},
+	{"Output DACR", NULL, "Output Driver R Stage 3"},
+	{"HPOL Pulldown", NULL, "Output DACL"},
+	{"HPOR Pulldown", NULL, "Output DACR"},
+	{"HP Boost Driver", NULL, "HPOL Pulldown"},
+	{"HP Boost Driver", NULL, "HPOR Pulldown"},
+	{"Class G", NULL, "HP Boost Driver"},
+	{"HPOL", NULL, "Class G"},
+	{"HPOR", NULL, "Class G"},
+};
+
+static int nau8821_clock_check(struct nau8821 *nau8821,
+	int stream, int rate, int osr)
+{
+	int osrate = 0;
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (osr >= ARRAY_SIZE(osr_dac_sel))
+			return -EINVAL;
+		osrate = osr_dac_sel[osr].osr;
+	} else {
+		if (osr >= ARRAY_SIZE(osr_adc_sel))
+			return -EINVAL;
+		osrate = osr_adc_sel[osr].osr;
+	}
+
+	if (!osrate || rate * osrate > CLK_DA_AD_MAX) {
+		dev_err(nau8821->dev, "exceed the maximum frequency of CLK_ADC or CLK_DAC\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int nau8821_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	unsigned int val_len = 0, osr, ctrl_val, bclk_fs, bclk_div;
+
+	nau8821_sema_acquire(nau8821, HZ);
+
+	/* CLK_DAC or CLK_ADC = OSR * FS
+	 * DAC or ADC clock frequency is defined as Over Sampling Rate (OSR)
+	 * multiplied by the audio sample rate (Fs). Note that the OSR and Fs
+	 * values must be selected such that the maximum frequency is less
+	 * than 6.144 MHz.
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_read(nau8821->regmap, NAU8821_R2C_DAC_CTRL1, &osr);
+		osr &= NAU8821_DAC_OVERSAMPLE_MASK;
+		if (nau8821_clock_check(nau8821, substream->stream,
+			params_rate(params), osr)) {
+			nau8821_sema_release(nau8821);
+			return -EINVAL;
+		}
+		regmap_update_bits(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
+			NAU8821_CLK_DAC_SRC_MASK,
+			osr_dac_sel[osr].clk_src << NAU8821_CLK_DAC_SRC_SFT);
+	} else {
+		regmap_read(nau8821->regmap, NAU8821_R2B_ADC_RATE, &osr);
+		osr &= NAU8821_ADC_SYNC_DOWN_MASK;
+		if (nau8821_clock_check(nau8821, substream->stream,
+			params_rate(params), osr)) {
+			nau8821_sema_release(nau8821);
+			return -EINVAL;
+		}
+		regmap_update_bits(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
+			NAU8821_CLK_ADC_SRC_MASK,
+			osr_adc_sel[osr].clk_src << NAU8821_CLK_ADC_SRC_SFT);
+	}
+
+	/* make BCLK and LRC divde configuration if the codec as master. */
+	regmap_read(nau8821->regmap, NAU8821_R1D_I2S_PCM_CTRL2, &ctrl_val);
+	if (ctrl_val & NAU8821_I2S_MS_MASTER) {
+		/* get the bclk and fs ratio */
+		bclk_fs = snd_soc_params_to_bclk(params) / params_rate(params);
+		if (bclk_fs <= 32)
+			bclk_div = 2;
+		else if (bclk_fs <= 64)
+			bclk_div = 1;
+		else if (bclk_fs <= 128)
+			bclk_div = 0;
+		else {
+			nau8821_sema_release(nau8821);
+			return -EINVAL;
+		}
+		regmap_update_bits(nau8821->regmap, NAU8821_R1D_I2S_PCM_CTRL2,
+			NAU8821_I2S_LRC_DIV_MASK | NAU8821_I2S_BLK_DIV_MASK,
+			((bclk_div + 1) << NAU8821_I2S_LRC_DIV_SFT) | bclk_div);
+	}
+
+	switch (params_width(params)) {
+	case 16:
+		val_len |= NAU8821_I2S_DL_16;
+		break;
+	case 20:
+		val_len |= NAU8821_I2S_DL_20;
+		break;
+	case 24:
+		val_len |= NAU8821_I2S_DL_24;
+		break;
+	case 32:
+		val_len |= NAU8821_I2S_DL_32;
+		break;
+	default:
+		nau8821_sema_release(nau8821);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(nau8821->regmap, NAU8821_R1C_I2S_PCM_CTRL1,
+		NAU8821_I2S_DL_MASK, val_len);
+
+	nau8821_sema_release(nau8821);
+
+	return 0;
+}
+
+static int nau8821_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	unsigned int ctrl1_val = 0, ctrl2_val = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		ctrl2_val |= NAU8821_I2S_MS_MASTER;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		ctrl1_val |= NAU8821_I2S_BP_INV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		ctrl1_val |= NAU8821_I2S_DF_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		ctrl1_val |= NAU8821_I2S_DF_LEFT;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		ctrl1_val |= NAU8821_I2S_DF_RIGTH;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		ctrl1_val |= NAU8821_I2S_DF_PCM_AB;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		ctrl1_val |= NAU8821_I2S_DF_PCM_AB;
+		ctrl1_val |= NAU8821_I2S_PCMB_EN;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	nau8821_sema_acquire(nau8821, HZ);
+
+	regmap_update_bits(nau8821->regmap, NAU8821_R1C_I2S_PCM_CTRL1,
+		NAU8821_I2S_DL_MASK | NAU8821_I2S_DF_MASK |
+		NAU8821_I2S_BP_MASK | NAU8821_I2S_PCMB_MASK, ctrl1_val);
+	regmap_update_bits(nau8821->regmap, NAU8821_R1D_I2S_PCM_CTRL2,
+		NAU8821_I2S_MS_MASK, ctrl2_val);
+
+	nau8821_sema_release(nau8821);
+
+	return 0;
+}
+
+static int nau8821_digital_mute(struct snd_soc_dai *dai, int mute, int direction)
+{
+	struct snd_soc_component *component = dai->component;
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	unsigned int val;
+
+	val = mute ? NAU8821_DAC_SOFT_MUTE : 0;
+
+	return regmap_update_bits(nau8821->regmap,
+		NAU8821_R31_MUTE_CTRL, NAU8821_DAC_SOFT_MUTE, val);
+}
+
+static const struct snd_soc_dai_ops nau8821_dai_ops = {
+	.hw_params = nau8821_hw_params,
+	.set_fmt = nau8821_set_dai_fmt,
+	.mute_stream = nau8821_digital_mute,
+};
+
+#define NAU8821_RATES SNDRV_PCM_RATE_8000_192000
+#define NAU8821_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE \
+	| SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver nau8821_dai = {
+	.name = NUVOTON_CODEC_DAI,
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = NAU8821_RATES,
+		.formats = NAU8821_FORMATS,
+	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = NAU8821_RATES,
+		.formats = NAU8821_FORMATS,
+	},
+	.ops = &nau8821_dai_ops,
+};
+
+
+static bool nau8821_is_jack_inserted(struct regmap *regmap)
+{
+	bool active_high, is_high;
+	int status, jkdet;
+
+	regmap_read(regmap, NAU8821_R0D_JACK_DET_CTRL, &jkdet);
+	active_high = jkdet & NAU8821_JACK_POLARITY;
+	regmap_read(regmap, NAU8821_R82_GENERAL_STATUS, &status);
+	is_high = status & NAU8821_GPIO2_IN;
+	/* return jack connection status according to jack insertion logic
+	 * active high or active low.
+	 */
+	return active_high == is_high;
+}
+
+static void nau8821_restart_jack_detection(struct regmap *regmap)
+{
+	/* this will restart the entire jack detection process including MIC/GND
+	 * switching and create interrupts. We have to go from 0 to 1 and back
+	 * to 0 to restart.
+	 */
+	regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_JACK_DET_RESTART, NAU8821_JACK_DET_RESTART);
+	regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_JACK_DET_RESTART, 0);
+}
+
+static void nau8821_int_status_clear_all(struct regmap *regmap)
+{
+	int active_irq, clear_irq, i;
+
+	/* Reset the intrruption status from rightmost bit if the corres-
+	 * ponding irq event occurs.
+	 */
+	regmap_read(regmap, NAU8821_R10_IRQ_STATUS, &active_irq);
+	for (i = 0; i < NAU8821_REG_DATA_LEN; i++) {
+		clear_irq = (0x1 << i);
+		if (active_irq & clear_irq)
+			regmap_write(regmap,
+				NAU8821_R11_INT_CLR_KEY_STATUS, clear_irq);
+	}
+}
+
+static void nau8821_eject_jack(struct nau8821 *nau8821)
+{
+	struct snd_soc_dapm_context *dapm = nau8821->dapm;
+	struct regmap *regmap = nau8821->regmap;
+
+	/* Reset semaphore */
+	nau8821_sema_reset(nau8821);
+
+	/* Detach 2kOhm Resistors from MICBIAS to MICGND */
+	regmap_update_bits(regmap, NAU8821_R74_MIC_BIAS,
+		NAU8821_MICBIAS_JKR2, 0);
+	/* HPL/HPR short to ground */
+	regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_SPKR_DWN1R | NAU8821_SPKR_DWN1L, 0);
+	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
+	snd_soc_dapm_sync(dapm);
+
+	/* Clear all interruption status */
+	nau8821_int_status_clear_all(regmap);
+
+	/* Enable the insertion interruption, disable the ejection inter-
+	 * ruption, and then bypass de-bounce circuit.
+	 */
+	regmap_update_bits(regmap, NAU8821_R12_INTERRUPT_DIS_CTRL,
+		NAU8821_IRQ_EJECT_DIS | NAU8821_IRQ_INSERT_DIS,
+		NAU8821_IRQ_EJECT_DIS);
+	/* Mask unneeded IRQs: 1 - disable, 0 - enable */
+	regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
+		NAU8821_IRQ_EJECT_EN | NAU8821_IRQ_INSERT_EN,
+		NAU8821_IRQ_EJECT_EN);
+
+	regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_JACK_DET_DB_BYPASS, NAU8821_JACK_DET_DB_BYPASS);
+
+	/* Disable ADC needed for interruptions at audo mode */
+	regmap_update_bits(regmap, NAU8821_R01_ENA_CTRL,
+		NAU8821_EN_ADCR | NAU8821_EN_ADCL, 0);
+
+	/* Close clock for jack type detection at manual mode */
+	nau8821_configure_sysclk(nau8821, NAU8821_CLK_DIS, 0);
+}
+
+static void nau8821_jdet_work(struct work_struct *work)
+{
+	struct nau8821 *nau8821 = container_of(work, struct nau8821, jdet_work);
+	struct snd_soc_dapm_context *dapm = nau8821->dapm;
+	struct regmap *regmap = nau8821->regmap;
+	int jack_status_reg, mic_detected;
+	int event = 0, event_mask = 0;
+
+	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
+	snd_soc_dapm_sync(dapm);
+	msleep(100);
+
+	regmap_read(regmap, NAU8821_R58_I2C_DEVICE_ID, &jack_status_reg);
+	mic_detected = jack_status_reg & NAU8821_MICDET;
+
+	if (!mic_detected) {
+		dev_dbg(nau8821->dev, "OMTP (micgnd1) mic connected\n");
+		event |= SND_JACK_HEADSET;
+		/* 2kOhm Resistor from MICBIAS to MICGND1 */
+		regmap_update_bits(regmap, NAU8821_R74_MIC_BIAS,
+			NAU8821_MICBIAS_JKR2, NAU8821_MICBIAS_JKR2);
+		snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
+		snd_soc_dapm_sync(dapm);
+
+		regmap_update_bits(regmap, NAU8821_R2B_ADC_RATE,
+			NAU8821_ADC_R_SRC_EN, NAU8821_ADC_R_SRC_EN);
+
+		/* Not bypass de-bounce circuit */
+		regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_JACK_DET_DB_BYPASS, 0);
+	} else {
+		dev_dbg(nau8821->dev, "headphone connected\n");
+		event |= SND_JACK_HEADPHONE;
+		snd_soc_dapm_disable_pin(dapm, "MICBIAS");
+		snd_soc_dapm_sync(dapm);
+	}
+	event_mask |= SND_JACK_HEADSET;
+	snd_soc_jack_report(nau8821->jack, event, event_mask);
+	nau8821_sema_release(nau8821);
+}
+
+/* Enable audo mode interruptions with internal clock. */
+static void nau8821_setup_auto_irq(struct nau8821 *nau8821)
+{
+	struct regmap *regmap = nau8821->regmap;
+	struct snd_soc_dapm_context *dapm = nau8821->dapm;
+
+	/* Enable internal VCO needed for interruptions */
+	nau8821_configure_sysclk(nau8821, NAU8821_CLK_INTERNAL, 0);
+	/* Enable ADC needed for interruptions */
+	regmap_update_bits(regmap, NAU8821_R01_ENA_CTRL,
+		NAU8821_EN_ADCR | NAU8821_EN_ADCL,
+		NAU8821_EN_ADCR | NAU8821_EN_ADCL);
+	/* Chip needs one FSCLK cycle in order to generate interruptions,
+	 * as we cannot guarantee one will be provided by the system. Turning
+	 * master mode on then off enables us to generate that FSCLK cycle
+	 * with a minimum of contention on the clock bus.
+	 */
+	regmap_update_bits(regmap, NAU8821_R1D_I2S_PCM_CTRL2,
+		NAU8821_I2S_MS_MASK, NAU8821_I2S_MS_MASTER);
+	regmap_update_bits(regmap, NAU8821_R1D_I2S_PCM_CTRL2,
+		NAU8821_I2S_MS_MASK, NAU8821_I2S_MS_SLAVE);
+
+	/* Not bypass de-bounce circuit */
+	regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_JACK_DET_DB_BYPASS, 0);
+
+	regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
+		NAU8821_IRQ_EJECT_EN, 0);
+	regmap_update_bits(regmap, NAU8821_R12_INTERRUPT_DIS_CTRL,
+		NAU8821_IRQ_EJECT_DIS, 0);
+}
+
+#define NAU8821_BUTTON SND_JACK_BTN_0
+
+static irqreturn_t nau8821_interrupt(int irq, void *data)
+{
+	struct nau8821 *nau8821 = (struct nau8821 *)data;
+	struct regmap *regmap = nau8821->regmap;
+	int active_irq, clear_irq = 0, event = 0, event_mask = 0;
+
+	bool active_high, is_high;
+	int status, jkdet;
+
+	if (regmap_read(regmap, NAU8821_R10_IRQ_STATUS, &active_irq)) {
+		dev_err(nau8821->dev, "failed to read irq status\n");
+		return IRQ_NONE;
+	}
+	dev_dbg(nau8821->dev, "IRQ %d\n", active_irq);
+	if ((active_irq & NAU8821_JACK_EJECT_IRQ_MASK) ==
+		NAU8821_JACK_EJECT_DETECTED) {
+		nau8821_eject_jack(nau8821);
+		event_mask |= SND_JACK_HEADSET;
+		clear_irq = NAU8821_JACK_EJECT_IRQ_MASK;
+	} else if (active_irq & NAU8821_KEY_SHORT_PRESS_IRQ) {
+		event |= NAU8821_BUTTON;
+		event_mask |= NAU8821_BUTTON;
+		clear_irq = NAU8821_KEY_SHORT_PRESS_IRQ;
+	} else if (active_irq & NAU8821_KEY_RELEASE_IRQ) {
+		event_mask = NAU8821_BUTTON;
+		clear_irq = NAU8821_KEY_RELEASE_IRQ;
+	} else if ((active_irq & NAU8821_JACK_INSERT_IRQ_MASK) ==
+		NAU8821_JACK_INSERT_DETECTED) {
+		regmap_write(regmap, NAU8821_R71_ANALOG_ADC_1, 0x0010);
+	if (nau8821_is_jack_inserted(regmap)) {
+		/* detect microphone and jack type */
+		cancel_work_sync(&nau8821->jdet_work);
+		schedule_work(&nau8821->jdet_work);
+		/* Turn off insertion interruption at manual mode */
+		regmap_update_bits(regmap,
+			NAU8821_R12_INTERRUPT_DIS_CTRL,
+			NAU8821_IRQ_INSERT_DIS,
+			NAU8821_IRQ_INSERT_DIS);
+		regmap_update_bits(regmap,
+			NAU8821_R0F_INTERRUPT_MASK,
+			NAU8821_IRQ_INSERT_EN,
+			NAU8821_IRQ_INSERT_EN);
+		nau8821_setup_auto_irq(nau8821);
+	} else {
+		dev_dbg(nau8821->dev,
+			"Headset completion IRQ fired but no headset connected\n");
+			nau8821_eject_jack(nau8821);
+		}
+	}
+
+	if (!clear_irq)
+		clear_irq = active_irq;
+	/* clears the rightmost interruption */
+	regmap_write(regmap, NAU8821_R11_INT_CLR_KEY_STATUS, clear_irq);
+
+	if (event_mask)
+		snd_soc_jack_report(nau8821->jack, event, event_mask);
+
+	return IRQ_HANDLED;
+}
+
+static const struct regmap_config nau8821_regmap_config = {
+	.val_bits = NAU8821_REG_DATA_LEN,
+	.reg_bits = NAU8821_REG_ADDR_LEN,
+
+	.max_register = NAU8821_REG_MAX,
+	.readable_reg = nau8821_readable_reg,
+	.writeable_reg = nau8821_writeable_reg,
+	.volatile_reg = nau8821_volatile_reg,
+
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = nau8821_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(nau8821_reg_defaults),
+};
+
+static int nau8821_component_probe(struct snd_soc_component *component)
+{
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+
+	nau8821->dapm = dapm;
+
+	snd_soc_dapm_sync(nau8821->dapm);
+
+	return 0;
+}
+
+static void nau8821_component_remove(struct snd_soc_component *component)
+{
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	if (nau8821->irq)
+		/* Reset semaphore */
+		nau8821_sema_reset(nau8821);
+}
+
+/**
+ * nau8821_calc_fll_param - Calculate FLL parameters.
+ * @fll_in: external clock provided to codec.
+ * @fs: sampling rate.
+ * @fll_param: Pointer to structure of FLL parameters.
+ *
+ * Calculate FLL parameters to configure codec.
+ *
+ * Returns 0 for success or negative error code.
+ */
+static int nau8821_calc_fll_param(unsigned int fll_in,
+	unsigned int fs, struct nau8821_fll *fll_param)
+{
+	u64 fvco, fvco_max;
+	unsigned int fref, i, fvco_sel;
+
+	/* Ensure the reference clock frequency (FREF) is <= 13.5MHz by dividing
+	 * freq_in by 1, 2, 4, or 8 using FLL pre-scalar.
+	 * FREF = freq_in / NAU8821_FLL_REF_DIV_MASK
+	 */
+	for (i = 0; i < ARRAY_SIZE(fll_pre_scalar); i++) {
+		fref = fll_in / fll_pre_scalar[i].param;
+		if (fref <= NAU_FREF_MAX)
+			break;
+	}
+	if (i == ARRAY_SIZE(fll_pre_scalar))
+		return -EINVAL;
+	fll_param->clk_ref_div = fll_pre_scalar[i].val;
+
+	/* Choose the FLL ratio based on FREF */
+	for (i = 0; i < ARRAY_SIZE(fll_ratio); i++) {
+		if (fref >= fll_ratio[i].param)
+			break;
+	}
+	if (i == ARRAY_SIZE(fll_ratio))
+		return -EINVAL;
+	fll_param->ratio = fll_ratio[i].val;
+
+	/* Calculate the frequency of DCO (FDCO) given freq_out = 256 * Fs.
+	 * FDCO must be within the 90MHz - 124MHz or the FFL cannot be
+	 * guaranteed across the full range of operation.
+	 * FDCO = freq_out * 2 * mclk_src_scaling
+	 */
+	fvco_max = 0;
+	fvco_sel = ARRAY_SIZE(mclk_src_scaling);
+	for (i = 0; i < ARRAY_SIZE(mclk_src_scaling); i++) {
+		fvco = 256ULL * fs * 2 * mclk_src_scaling[i].param;
+		if (fvco > NAU_FVCO_MIN && fvco < NAU_FVCO_MAX &&
+			fvco_max < fvco) {
+			fvco_max = fvco;
+			fvco_sel = i;
+		}
+	}
+	if (ARRAY_SIZE(mclk_src_scaling) == fvco_sel)
+		return -EINVAL;
+	fll_param->mclk_src = mclk_src_scaling[fvco_sel].val;
+
+	/* Calculate the FLL 10-bit integer input and the FLL 24-bit fractional
+	 * input based on FDCO, FREF and FLL ratio.
+	 */
+	fvco = div_u64(fvco_max << 24, fref * fll_param->ratio);
+	fll_param->fll_int = (fvco >> 24) & 0x3ff;
+	fll_param->fll_frac = fvco & 0xffffff;
+
+	return 0;
+}
+
+static void nau8821_fll_apply(struct nau8821 *nau8821,
+		struct nau8821_fll *fll_param)
+{
+	struct regmap *regmap = nau8821->regmap;
+
+	regmap_update_bits(regmap, NAU8821_R03_CLK_DIVIDER,
+		NAU8821_CLK_SRC_MASK | NAU8821_CLK_MCLK_SRC_MASK,
+		NAU8821_CLK_SRC_MCLK | fll_param->mclk_src);
+	/* Make DSP operate at high speed for better performance. */
+	regmap_update_bits(regmap, NAU8821_R04_FLL1,
+		NAU8821_FLL_RATIO_MASK | NAU8821_ICTRL_LATCH_MASK,
+		fll_param->ratio | (0x6 << NAU8821_ICTRL_LATCH_SFT));
+	/* FLL 24-bit fractional input */
+	regmap_write(regmap, NAU8821_R0A_FLL7,
+		(fll_param->fll_frac >> 16) & 0xff);
+	regmap_write(regmap, NAU8821_R0B_FLL8, fll_param->fll_frac & 0xffff);
+	/* FLL 10-bit integer input */
+	regmap_update_bits(regmap, NAU8821_R06_FLL3,
+		NAU8821_FLL_INTEGER_MASK, fll_param->fll_int);
+	/* FLL pre-scaler */
+	regmap_update_bits(regmap, NAU8821_R07_FLL4,
+		NAU8821_HIGHBW_EN | NAU8821_FLL_REF_DIV_MASK,
+		NAU8821_HIGHBW_EN |
+		(fll_param->clk_ref_div << NAU8821_FLL_REF_DIV_SFT));
+	/* select divided VCO input */
+	regmap_update_bits(regmap, NAU8821_R08_FLL5,
+		NAU8821_FLL_CLK_SW_MASK, NAU8821_FLL_CLK_SW_REF);
+	/* Disable free-running mode */
+	regmap_update_bits(regmap,
+		NAU8821_R09_FLL6, NAU8821_DCO_EN, 0);
+	if (fll_param->fll_frac) {
+		/* set FLL loop filter enable and cutoff frequency at 500Khz */
+		regmap_update_bits(regmap, NAU8821_R08_FLL5,
+			NAU8821_FLL_PDB_DAC_EN | NAU8821_FLL_LOOP_FTR_EN |
+			NAU8821_FLL_FTR_SW_MASK,
+			NAU8821_FLL_PDB_DAC_EN | NAU8821_FLL_LOOP_FTR_EN |
+			NAU8821_FLL_FTR_SW_FILTER);
+		regmap_update_bits(regmap, NAU8821_R09_FLL6,
+			NAU8821_SDM_EN | NAU8821_CUTOFF500,
+			NAU8821_SDM_EN | NAU8821_CUTOFF500);
+	} else {
+		/* disable FLL loop filter and cutoff frequency */
+		regmap_update_bits(regmap, NAU8821_R08_FLL5,
+			NAU8821_FLL_PDB_DAC_EN | NAU8821_FLL_LOOP_FTR_EN |
+			NAU8821_FLL_FTR_SW_MASK, NAU8821_FLL_FTR_SW_ACCU);
+		regmap_update_bits(regmap, NAU8821_R09_FLL6,
+			NAU8821_SDM_EN | NAU8821_CUTOFF500, 0);
+	}
+}
+
+/**
+ * nau8821_set_fll - FLL configuration of nau8821
+ * @codec:  codec component
+ * @freq_in:  frequency of input clock source
+ * @freq_out:  must be 256*Fs in order to achieve the best performance
+ *
+ * The FLL function can select BCLK or MCLK as the input clock source.
+ *
+ * Returns 0 if the parameters have been applied successfully
+ * or negative error code.
+ */
+static int nau8821_set_fll(struct snd_soc_component *component, int pll_id, int source,
+	unsigned int freq_in, unsigned int freq_out)
+{
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	struct nau8821_fll fll_set_param, *fll_param = &fll_set_param;
+	int ret, fs;
+
+	fs = freq_out >> 8;
+	ret = nau8821_calc_fll_param(freq_in, fs, fll_param);
+	if (ret) {
+		dev_err(nau8821->dev, "Unsupported input clock %d to output clock %d\n",
+			freq_in, freq_out);
+		return ret;
+	}
+	dev_dbg(nau8821->dev, "mclk_src=%x ratio=%x fll_frac=%x fll_int=%x clk_ref_div=%x\n",
+		fll_param->mclk_src, fll_param->ratio, fll_param->fll_frac,
+		fll_param->fll_int, fll_param->clk_ref_div);
+
+	nau8821_fll_apply(nau8821, fll_param);
+	mdelay(2);
+	regmap_update_bits(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
+		NAU8821_CLK_SRC_MASK, NAU8821_CLK_SRC_VCO);
+
+	return 0;
+}
+
+static void nau8821_configure_mclk_as_sysclk(struct regmap *regmap)
+{
+	regmap_update_bits(regmap, NAU8821_R03_CLK_DIVIDER,
+		NAU8821_CLK_SRC_MASK, NAU8821_CLK_SRC_MCLK);
+	regmap_update_bits(regmap, NAU8821_R09_FLL6,
+		NAU8821_DCO_EN, 0);
+	/* Make DSP operate as default setting for power saving. */
+	regmap_update_bits(regmap, NAU8821_R04_FLL1,
+		NAU8821_ICTRL_LATCH_MASK, 0);
+}
+
+static int nau8821_configure_sysclk(struct nau8821 *nau8821,
+	int clk_id, unsigned int freq)
+{
+	struct regmap *regmap = nau8821->regmap;
+
+	switch (clk_id) {
+	case NAU8821_CLK_DIS:
+		/* Clock provided externally and disable internal VCO clock */
+		nau8821_configure_mclk_as_sysclk(regmap);
+		break;
+	case NAU8821_CLK_MCLK:
+		nau8821_sema_acquire(nau8821, HZ);
+		nau8821_configure_mclk_as_sysclk(regmap);
+		/* MCLK not changed by clock tree */
+		regmap_update_bits(regmap, NAU8821_R03_CLK_DIVIDER,
+			NAU8821_CLK_MCLK_SRC_MASK, 0);
+		nau8821_sema_release(nau8821);
+		break;
+	case NAU8821_CLK_INTERNAL:
+		if (nau8821_is_jack_inserted(regmap)) {
+			regmap_update_bits(regmap, NAU8821_R09_FLL6,
+				NAU8821_DCO_EN, NAU8821_DCO_EN);
+			regmap_update_bits(regmap, NAU8821_R03_CLK_DIVIDER,
+				NAU8821_CLK_SRC_MASK, NAU8821_CLK_SRC_VCO);
+			/* Decrease the VCO frequency and make DSP operate
+			 * as default setting for power saving.
+			 */
+			regmap_update_bits(regmap, NAU8821_R03_CLK_DIVIDER,
+				NAU8821_CLK_MCLK_SRC_MASK, 0xf);
+			regmap_update_bits(regmap, NAU8821_R04_FLL1,
+				NAU8821_ICTRL_LATCH_MASK |
+				NAU8821_FLL_RATIO_MASK, 0x10);
+			regmap_update_bits(regmap, NAU8821_R09_FLL6,
+				NAU8821_SDM_EN, NAU8821_SDM_EN);
+		} else {
+			/* The clock turns off intentionally for power saving
+			 * when no headset connected.
+			 */
+			nau8821_configure_mclk_as_sysclk(regmap);
+			dev_dbg(nau8821->dev, "Disable clock for power saving when no headset connected\n");
+		}
+		break;
+	case NAU8821_CLK_FLL_MCLK:
+		nau8821_sema_acquire(nau8821, HZ);
+		/* Higher FLL reference input frequency can only set lower
+		 * gain error, such as 0000 for input reference from MCLK
+		 * 12.288Mhz.
+		 */
+		regmap_update_bits(regmap, NAU8821_R06_FLL3,
+			NAU8821_FLL_CLK_SRC_MASK | NAU8821_GAIN_ERR_MASK,
+			NAU8821_FLL_CLK_SRC_MCLK | 0);
+		nau8821_sema_release(nau8821);
+		break;
+	case NAU8821_CLK_FLL_BLK:
+		nau8821_sema_acquire(nau8821, HZ);
+		/* If FLL reference input is from low frequency source,
+		 * higher error gain can apply such as 0xf which has
+		 * the most sensitive gain error correction threshold,
+		 * Therefore, FLL has the most accurate DCO to
+		 * target frequency.
+		 */
+		regmap_update_bits(regmap, NAU8821_R06_FLL3,
+			NAU8821_FLL_CLK_SRC_MASK | NAU8821_GAIN_ERR_MASK,
+			NAU8821_FLL_CLK_SRC_BLK |
+			(0xf << NAU8821_GAIN_ERR_SFT));
+		nau8821_sema_release(nau8821);
+		break;
+	case NAU8821_CLK_FLL_FS:
+		nau8821_sema_acquire(nau8821, HZ);
+		/* If FLL reference input is from low frequency source,
+		 * higher error gain can apply such as 0xf which has
+		 * the most sensitive gain error correction threshold,
+		 * Therefore, FLL has the most accurate DCO to
+		 * target frequency.
+		 */
+		regmap_update_bits(regmap, NAU8821_R06_FLL3,
+			NAU8821_FLL_CLK_SRC_MASK | NAU8821_GAIN_ERR_MASK,
+			NAU8821_FLL_CLK_SRC_FS |
+			(0xf << NAU8821_GAIN_ERR_SFT));
+		nau8821_sema_release(nau8821);
+		break;
+	default:
+		dev_err(nau8821->dev, "Invalid clock id (%d)\n", clk_id);
+		return -EINVAL;
+	}
+	nau8821->clk_id = clk_id;
+	dev_dbg(nau8821->dev, "Sysclk is %dHz and clock id is %d\n", freq,
+		nau8821->clk_id);
+
+	return 0;
+}
+
+static int nau8821_set_sysclk(struct snd_soc_component *component, int clk_id,
+	int source, unsigned int freq, int dir)
+{
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	return nau8821_configure_sysclk(nau8821, clk_id, freq);
+}
+
+static int nau8821_resume_setup(struct nau8821 *nau8821)
+{
+	struct regmap *regmap = nau8821->regmap;
+
+	/* Close clock when jack type detection at manual mode */
+	nau8821_configure_sysclk(nau8821, NAU8821_CLK_DIS, 0);
+	if (nau8821->irq) {
+		/* Clear all interruption status */
+		nau8821_int_status_clear_all(regmap);
+
+		/* Enable both insertion and ejection interruptions, and then
+		 * bypass de-bounce circuit.
+		 */
+		regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
+			NAU8821_IRQ_EJECT_EN | NAU8821_IRQ_INSERT_EN, 0);
+		regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+			NAU8821_JACK_DET_DB_BYPASS, NAU8821_JACK_DET_DB_BYPASS);
+		regmap_update_bits(regmap, NAU8821_R12_INTERRUPT_DIS_CTRL,
+			NAU8821_IRQ_INSERT_DIS | NAU8821_IRQ_EJECT_DIS, 0);
+	}
+
+	return 0;
+}
+
+static int nau8821_set_bias_level(struct snd_soc_component *component,
+		enum snd_soc_bias_level level)
+{
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = nau8821->regmap;
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		break;
+
+	case SND_SOC_BIAS_PREPARE:
+		break;
+
+	case SND_SOC_BIAS_STANDBY:
+		/* Setup codec configuration after resume */
+		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+			nau8821_resume_setup(nau8821);
+		break;
+
+	case SND_SOC_BIAS_OFF:
+		/* HPL/HPR short to ground */
+		regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+			NAU8821_SPKR_DWN1R | NAU8821_SPKR_DWN1L, 0);
+		if (nau8821->irq) {
+			/* Reset semaphore */
+			nau8821_sema_reset(nau8821);
+			/* Reset the configuration of jack type for detection */
+			/* Detach 2kOhm Resistors from MICBIAS to MICGND1/2 */
+			regmap_update_bits(regmap, NAU8821_R74_MIC_BIAS,
+				NAU8821_MICBIAS_JKR2, 0);
+			/* Turn off all interruptions before system shutdown. Keep the
+			 * interruption quiet before resume setup completes.
+			 */
+			regmap_write(regmap,
+				NAU8821_R12_INTERRUPT_DIS_CTRL, 0xffff);
+			regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
+				NAU8821_IRQ_EJECT_EN | NAU8821_IRQ_INSERT_EN,
+				NAU8821_IRQ_EJECT_EN | NAU8821_IRQ_INSERT_EN);
+			/* Disable ADC needed for interruptions at audo mode */
+			regmap_update_bits(regmap, NAU8821_R01_ENA_CTRL,
+				NAU8821_EN_ADCR | NAU8821_EN_ADCL, 0);
+		}
+		break;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused nau8821_suspend(struct snd_soc_component *component)
+{
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	if (nau8821->irq)
+		disable_irq(nau8821->irq);
+	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
+	/* Power down codec power; don't suppoet button wakeup */
+	snd_soc_dapm_disable_pin(nau8821->dapm, "MICBIAS");
+	snd_soc_dapm_sync(nau8821->dapm);
+	regcache_cache_only(nau8821->regmap, true);
+	regcache_mark_dirty(nau8821->regmap);
+
+	return 0;
+}
+
+static int __maybe_unused nau8821_resume(struct snd_soc_component *component)
+{
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+
+	regcache_cache_only(nau8821->regmap, false);
+	regcache_sync(nau8821->regmap);
+	if (nau8821->irq) {
+		/* Hold semaphore to postpone playback happening
+		 * until jack detection done.
+		 */
+		nau8821_sema_acquire(nau8821, 0);
+		enable_irq(nau8821->irq);
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver nau8821_component_driver = {
+	.probe = nau8821_component_probe,
+	.remove = nau8821_component_remove,
+	.set_sysclk = nau8821_set_sysclk,
+	.set_pll = nau8821_set_fll,
+	.set_bias_level = nau8821_set_bias_level,
+	.suspend = nau8821_suspend,
+	.resume = nau8821_resume,
+	.controls = nau8821_controls,
+	.num_controls = ARRAY_SIZE(nau8821_controls),
+	.dapm_widgets = nau8821_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(nau8821_dapm_widgets),
+	.dapm_routes = nau8821_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(nau8821_dapm_routes),
+	.suspend_bias_off = 1,
+	.non_legacy_dai_naming = 1,
+	.idle_bias_on = 1,
+	.use_pmdown_time = 1,
+	.endianness = 1,
+};
+
+/**
+ * nau8821_enable_jack_detect - Specify a jack for event reporting
+ *
+ * @component:  component to register the jack with
+ * @jack: jack to use to report headset and button events on
+ *
+ * After this function has been called the headset insert/remove and button
+ * events will be routed to the given jack.  Jack can be null to stop
+ * reporting.
+ */
+int nau8821_enable_jack_detect(struct snd_soc_component *component,
+	struct snd_soc_jack *jack)
+{
+	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* Initiate jack detection work queue */
+	INIT_WORK(&nau8821->jdet_work, nau8821_jdet_work);
+	ret = devm_request_threaded_irq(nau8821->dev, nau8821->irq, NULL,
+		nau8821_interrupt, IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+		"nau8821", nau8821);
+	if (ret) {
+		dev_err(nau8821->dev, "Cannot request irq %d (%d)\n",
+			nau8821->irq, ret);
+		return ret;
+	}
+
+	nau8821->jack = jack;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(nau8821_enable_jack_detect);
+
+static void nau8821_reset_chip(struct regmap *regmap)
+{
+	regmap_write(regmap, NAU8821_R00_RESET, 0xffff);
+	regmap_write(regmap, NAU8821_R00_RESET, 0xffff);
+}
+
+static void nau8821_print_device_properties(struct nau8821 *nau8821)
+{
+	struct device *dev = nau8821->dev;
+
+	dev_dbg(dev, "jkdet-enable:         %d\n", nau8821->jkdet_enable);
+	dev_dbg(dev, "jkdet-pull-enable:    %d\n", nau8821->jkdet_pull_enable);
+	dev_dbg(dev, "jkdet-pull-up:        %d\n", nau8821->jkdet_pull_up);
+	dev_dbg(dev, "jkdet-polarity:       %d\n", nau8821->jkdet_polarity);
+	dev_dbg(dev, "micbias-voltage:      %d\n", nau8821->micbias_voltage);
+	dev_dbg(dev, "vref-impedance:       %d\n", nau8821->vref_impedance);
+	dev_dbg(dev, "jack-insert-debounce: %d\n",
+		nau8821->jack_insert_debounce);
+	dev_dbg(dev, "jack-eject-debounce:  %d\n",
+		nau8821->jack_eject_debounce);
+}
+
+static int nau8821_read_device_properties(struct device *dev,
+	struct nau8821 *nau8821)
+{
+	int ret;
+
+	nau8821->jkdet_enable = device_property_read_bool(dev,
+		"nuvoton,jkdet-enable");
+	nau8821->jkdet_pull_enable = device_property_read_bool(dev,
+		"nuvoton,jkdet-pull-enable");
+	nau8821->jkdet_pull_up = device_property_read_bool(dev,
+		"nuvoton,jkdet-pull-up");
+	ret = device_property_read_u32(dev, "nuvoton,jkdet-polarity",
+		&nau8821->jkdet_polarity);
+	if (ret)
+		nau8821->jkdet_polarity = 1;
+	ret = device_property_read_u32(dev, "nuvoton,micbias-voltage",
+		&nau8821->micbias_voltage);
+	if (ret)
+		nau8821->micbias_voltage = 6;
+	ret = device_property_read_u32(dev, "nuvoton,vref-impedance",
+		&nau8821->vref_impedance);
+	if (ret)
+		nau8821->vref_impedance = 2;
+	ret = device_property_read_u32(dev, "nuvoton,jack-insert-debounce",
+		&nau8821->jack_insert_debounce);
+	if (ret)
+		nau8821->jack_insert_debounce = 7;
+	ret = device_property_read_u32(dev, "nuvoton,jack-eject-debounce",
+		&nau8821->jack_eject_debounce);
+	if (ret)
+		nau8821->jack_eject_debounce = 0;
+
+	return 0;
+}
+
+static void nau8821_init_regs(struct nau8821 *nau8821)
+{
+	struct regmap *regmap = nau8821->regmap;
+
+	/* Enable Bias/Vmid */
+	regmap_update_bits(regmap, NAU8821_R66_BIAS_ADJ,
+		NAU8821_BIAS_VMID, NAU8821_BIAS_VMID);
+	regmap_update_bits(regmap, NAU8821_R76_BOOST,
+		NAU8821_GLOBAL_BIAS_EN, NAU8821_GLOBAL_BIAS_EN);
+	/* VMID Tieoff setting and enable TESTDAC.
+	 * This sets the analog DAC inputs to a '0' input signal to avoid
+	 * any glitches due to power up transients in both the analog and
+	 * digital DAC circuit.
+	 */
+	regmap_update_bits(regmap, NAU8821_R66_BIAS_ADJ,
+		NAU8821_BIAS_VMID_SEL_MASK | NAU8821_BIAS_TESTDAC_EN,
+		(nau8821->vref_impedance << NAU8821_BIAS_VMID_SEL_SFT) |
+		NAU8821_BIAS_TESTDAC_EN);
+	/* Disable short Frame Sync detection logic */
+	regmap_update_bits(regmap, NAU8821_R1E_LEFT_TIME_SLOT,
+		NAU8821_DIS_FS_SHORT_DET, NAU8821_DIS_FS_SHORT_DET);
+	/* Disable Boost Driver, Automatic Short circuit protection enable */
+	regmap_update_bits(regmap, NAU8821_R76_BOOST,
+		NAU8821_PRECHARGE_DIS | NAU8821_HP_BOOST_DIS |
+		NAU8821_HP_BOOST_G_DIS | NAU8821_SHORT_SHUTDOWN_EN,
+		NAU8821_PRECHARGE_DIS | NAU8821_HP_BOOST_DIS |
+		NAU8821_HP_BOOST_G_DIS | NAU8821_SHORT_SHUTDOWN_EN);
+	/* Class G timer 64ms */
+	regmap_update_bits(regmap, NAU8821_R4B_CLASSG_CTRL,
+		NAU8821_CLASSG_TIMER_MASK,
+		0x20 << NAU8821_CLASSG_TIMER_SFT);
+	/* Class AB bias current to 2x, DAC Capacitor enable MSB/LSB */
+	regmap_update_bits(regmap, NAU8821_R6A_ANALOG_CONTROL_2,
+		NAU8821_HP_NON_CLASSG_CURRENT_2xADJ |
+		NAU8821_DAC_CAPACITOR_MSB | NAU8821_DAC_CAPACITOR_LSB,
+		NAU8821_HP_NON_CLASSG_CURRENT_2xADJ |
+		NAU8821_DAC_CAPACITOR_MSB | NAU8821_DAC_CAPACITOR_LSB);
+	/* Disable DACR/L power */
+	regmap_update_bits(regmap, NAU8821_R80_CHARGE_PUMP,
+		NAU8821_POWER_DOWN_DACR | NAU8821_POWER_DOWN_DACL, 0);
+	/* DAC clock delay 2ns, VREF */
+	regmap_update_bits(regmap, NAU8821_R73_RDAC,
+		NAU8821_DAC_CLK_DELAY_MASK | NAU8821_DAC_VREF_MASK,
+		(0x2 << NAU8821_DAC_CLK_DELAY_SFT) |
+		(0x3 << NAU8821_DAC_VREF_SFT));
+
+	regmap_update_bits(regmap, NAU8821_R74_MIC_BIAS,
+		NAU8821_MICBIAS_VOLTAGE_MASK, nau8821->micbias_voltage);
+	/* Default oversampling/decimations settings are unusable
+	 * (audible hiss). Set it to something better.
+	 */
+	regmap_update_bits(regmap, NAU8821_R2B_ADC_RATE,
+		NAU8821_ADC_SYNC_DOWN_MASK, NAU8821_ADC_SYNC_DOWN_64);
+	regmap_update_bits(regmap, NAU8821_R2C_DAC_CTRL1,
+		NAU8821_DAC_OVERSAMPLE_MASK, NAU8821_DAC_OVERSAMPLE_64);
+	/**/
+	regmap_update_bits(regmap, NAU8821_R13_DMIC_CTRL,
+		NAU8821_DMIC_SRC_MASK, NAU8821_CLK_DMIC_SRC);
+}
+
+static int nau8821_setup_irq(struct nau8821 *nau8821)
+{
+	struct regmap *regmap = nau8821->regmap;
+
+	sema_init(&nau8821->jd_sem, 1);
+
+	/* Jack detection */
+	regmap_update_bits(regmap, NAU8821_R1A_GPIO12_CTRL,
+		NAU8821_JKDET_OUTPUT_EN,
+		nau8821->jkdet_enable ? 0 : NAU8821_JKDET_OUTPUT_EN);
+	regmap_update_bits(regmap, NAU8821_R1A_GPIO12_CTRL,
+		NAU8821_JKDET_PULL_EN,
+		nau8821->jkdet_pull_enable ? 0 : NAU8821_JKDET_PULL_EN);
+	regmap_update_bits(regmap, NAU8821_R1A_GPIO12_CTRL,
+		NAU8821_JKDET_PULL_UP,
+		nau8821->jkdet_pull_up ? NAU8821_JKDET_PULL_UP : 0);
+	regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_JACK_POLARITY,
+		/* jkdet_polarity - 1  is for active-low */
+		nau8821->jkdet_polarity ? 0 : NAU8821_JACK_POLARITY);
+	regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_JACK_INSERT_DEBOUNCE_MASK,
+		nau8821->jack_insert_debounce <<
+		NAU8821_JACK_INSERT_DEBOUNCE_SFT);
+	regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
+		NAU8821_JACK_EJECT_DEBOUNCE_MASK,
+		nau8821->jack_eject_debounce <<
+		NAU8821_JACK_EJECT_DEBOUNCE_SFT);
+	/* Pull up IRQ pin */
+	regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
+		NAU8821_IRQ_PIN_PULL_UP | NAU8821_IRQ_PIN_PULL_EN |
+		NAU8821_IRQ_OUTPUT_EN, NAU8821_IRQ_PIN_PULL_UP |
+		NAU8821_IRQ_PIN_PULL_EN | NAU8821_IRQ_OUTPUT_EN);
+	/* Disable interruption before codec initiation done */
+	/* Mask unneeded IRQs: 1 - disable, 0 - enable */
+	regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK, 0x3f5, 0x3f5);
+
+	return 0;
+}
+
+static int nau8821_i2c_probe(struct i2c_client *i2c,
+	const struct i2c_device_id *id)
+{
+	struct device *dev = &i2c->dev;
+	struct nau8821 *nau8821 = dev_get_platdata(&i2c->dev);
+	int ret, value;
+
+	if (!nau8821) {
+		nau8821 = devm_kzalloc(dev, sizeof(*nau8821), GFP_KERNEL);
+		if (!nau8821)
+			return -ENOMEM;
+		nau8821_read_device_properties(dev, nau8821);
+	}
+	i2c_set_clientdata(i2c, nau8821);
+
+	nau8821->regmap = devm_regmap_init_i2c(i2c, &nau8821_regmap_config);
+
+	if (IS_ERR(nau8821->regmap))
+		return PTR_ERR(nau8821->regmap);
+	nau8821->dev = dev;
+	nau8821->irq = i2c->irq;
+	nau8821_print_device_properties(nau8821);
+
+	nau8821_reset_chip(nau8821->regmap);
+	ret = regmap_read(nau8821->regmap, NAU8821_R58_I2C_DEVICE_ID, &value);
+	if (ret) {
+		dev_err(dev, "Failed to read device id (%d)\n", ret);
+		return ret;
+	}
+	nau8821_init_regs(nau8821);
+
+	if (i2c->irq)
+		nau8821_setup_irq(nau8821);
+
+	ret = devm_snd_soc_register_component(&i2c->dev, &nau8821_component_driver,
+		&nau8821_dai, 1);
+	pr_err("%s exit ret:%d\n", __func__, ret);
+	return ret;
+}
+
+static int nau8821_i2c_remove(struct i2c_client *client)
+{
+	return 0;
+}
+
+static const struct i2c_device_id nau8821_i2c_ids[] = {
+	{ "nau8821", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nau8821_i2c_ids);
+
+#ifdef CONFIG_OF
+static const struct of_device_id nau8821_of_ids[] = {
+	{ .compatible = "nuvoton,nau8821", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, nau8821_of_ids);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id nau8821_acpi_match[] = {
+	{ "NVTN2020", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, nau8821_acpi_match);
+#endif
+
+static struct i2c_driver nau8821_driver = {
+	.driver = {
+		.name = "nau8821",
+		.of_match_table = of_match_ptr(nau8821_of_ids),
+		.acpi_match_table = ACPI_PTR(nau8821_acpi_match),
+	},
+	.probe = nau8821_i2c_probe,
+	.remove = nau8821_i2c_remove,
+	.id_table = nau8821_i2c_ids,
+};
+module_i2c_driver(nau8821_driver);
+
+MODULE_DESCRIPTION("ASoC nau8821 driver");
+MODULE_AUTHOR("John Hsu <KCHSU0@nuvoton.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
new file mode 100644
index 000000000000..cd01a1e97379
--- /dev/null
+++ b/sound/soc/codecs/nau8821.h
@@ -0,0 +1,532 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * NAU88L21 ALSA SoC audio driver
+ *
+ * Copyright 2020 Nuvoton Technology Corp.
+ * Author: John Hsu <KCHSU0@nuvoton.com>
+ * Co-author: Seven Lee <wtli@nuvoton.com>
+ * Licensed under the GPL-2.
+ */
+
+#ifndef __NAU8821_H__
+#define __NAU8821_H__
+
+#define NAU8821_R00_RESET			0x00
+#define NAU8821_R01_ENA_CTRL			0x01
+#define NAU8821_R03_CLK_DIVIDER		0x03
+#define NAU8821_R04_FLL1			0x04
+#define NAU8821_R05_FLL2			0x05
+#define NAU8821_R06_FLL3			0x06
+#define NAU8821_R07_FLL4			0x07
+#define NAU8821_R08_FLL5			0x08
+#define NAU8821_R09_FLL6			0x09
+#define NAU8821_R0A_FLL7			0x0a
+#define NAU8821_R0B_FLL8			0x0b
+#define NAU8821_R0D_JACK_DET_CTRL		0x0d
+#define NAU8821_R0F_INTERRUPT_MASK		0x0f
+#define NAU8821_R10_IRQ_STATUS		0x10
+#define NAU8821_R11_INT_CLR_KEY_STATUS	0x11
+#define NAU8821_R12_INTERRUPT_DIS_CTRL	0x12
+#define NAU8821_R13_DMIC_CTRL		0x13
+#define NAU8821_R1A_GPIO12_CTRL		0x1a
+#define NAU8821_R1B_TDM_CTRL			0x1b
+#define NAU8821_R1C_I2S_PCM_CTRL1		0x1c
+#define NAU8821_R1D_I2S_PCM_CTRL2		0x1d
+#define NAU8821_R1E_LEFT_TIME_SLOT		0x1e
+#define NAU8821_R1F_RIGHT_TIME_SLOT		0x1f
+#define NAU8821_R21_BIQ0_COF1		0x21
+#define NAU8821_R22_BIQ0_COF2		0x22
+#define NAU8821_R23_BIQ0_COF3		0x23
+#define NAU8821_R24_BIQ0_COF4		0x24
+#define NAU8821_R25_BIQ0_COF5		0x25
+#define NAU8821_R26_BIQ0_COF6		0x26
+#define NAU8821_R27_BIQ0_COF7		0x27
+#define NAU8821_R28_BIQ0_COF8		0x28
+#define NAU8821_R29_BIQ0_COF9		0x29
+#define NAU8821_R2A_BIQ0_COF10		0x2a
+#define NAU8821_R2B_ADC_RATE		0x2b
+#define NAU8821_R2C_DAC_CTRL1		0x2c
+#define NAU8821_R2D_DAC_CTRL2		0x2d
+#define NAU8821_R2F_DAC_DGAIN_CTRL		0x2f
+#define NAU8821_R30_ADC_DGAIN_CTRL		0x30
+#define NAU8821_R31_MUTE_CTRL		0x31
+#define NAU8821_R32_HSVOL_CTRL		0x32
+#define NAU8821_R34_DACR_CTRL		0x34
+#define NAU8821_R35_ADC_DGAIN_CTRL1		0x35
+#define NAU8821_R36_ADC_DRC_KNEE_IP12	0x36
+#define NAU8821_R37_ADC_DRC_KNEE_IP34	0x37
+#define NAU8821_R38_ADC_DRC_SLOPES		0x38
+#define NAU8821_R39_ADC_DRC_ATKDCY		0x39
+#define NAU8821_R3A_DAC_DRC_KNEE_IP12	0x3a
+#define NAU8821_R3B_DAC_DRC_KNEE_IP34	0x3b
+#define NAU8821_R3C_DAC_DRC_SLOPES		0x3c
+#define NAU8821_R3D_DAC_DRC_ATKDCY		0x3d
+#define NAU8821_R41_BIQ1_COF1		0x41
+#define NAU8821_R42_BIQ1_COF2		0x42
+#define NAU8821_R43_BIQ1_COF3		0x43
+#define NAU8821_R44_BIQ1_COF4		0x44
+#define NAU8821_R45_BIQ1_COF5		0x45
+#define NAU8821_R46_BIQ1_COF6		0x46
+#define NAU8821_R47_BIQ1_COF7		0x47
+#define NAU8821_R48_BIQ1_COF8		0x48
+#define NAU8821_R49_BIQ1_COF9		0x49
+#define NAU8821_R4A_BIQ1_COF10		0x4a
+#define NAU8821_R4B_CLASSG_CTRL		0x4b
+#define NAU8821_R4C_IMM_MODE_CTRL	0x4c
+#define NAU8821_R4D_IMM_RMS_L		0x4d
+#define NAU8821_R4E_FUSE_CTRL2		0x4e
+#define NAU8821_R4F_FUSE_CTRL3		0x4f
+#define NAU8821_R51_FUSE_CTRL1		0x51
+#define NAU8821_R53_OTPDOUT_1		0x53
+#define NAU8821_R54_OTPDOUT_2		0x54
+#define NAU8821_R55_MISC_CTRL		0x55
+#define NAU8821_R58_I2C_DEVICE_ID		0x58
+#define NAU8821_R59_SARDOUT_RAM_STATUS	0x59
+#define NAU8821_R5A_SOFTWARE_RST		0x5a
+#define NAU8821_R66_BIAS_ADJ			0x66
+#define NAU8821_R68_TRIM_SETTINGS		0x68
+#define NAU8821_R69_ANALOG_CONTROL_1	0x69
+#define NAU8821_R6A_ANALOG_CONTROL_2	0x6a
+#define NAU8821_R6B_PGA_MUTE			0x6b
+#define NAU8821_R71_ANALOG_ADC_1		0x71
+#define NAU8821_R72_ANALOG_ADC_2		0x72
+#define NAU8821_R73_RDAC			0x73
+#define NAU8821_R74_MIC_BIAS		0x74
+#define NAU8821_R76_BOOST			0x76
+#define NAU8821_R77_FEPGA			0x77
+#define NAU8821_R7E_PGA_GAIN			0x7e
+#define NAU8821_R7F_POWER_UP_CONTROL	0x7f
+#define NAU8821_R80_CHARGE_PUMP		0x80
+#define NAU8821_R81_CHARGE_PUMP_INPUT_READ	0x81
+#define NAU8821_R82_GENERAL_STATUS		0x82
+#define NAU8821_REG_MAX			NAU8821_R82_GENERAL_STATUS
+/* 16-bit control register address, and 16-bits control register data */
+#define NAU8821_REG_ADDR_LEN			16
+#define NAU8821_REG_DATA_LEN			16
+
+/* ENA_CTRL (0x01) */
+#define NAU8821_CLK_DAC_INV_SFT	14
+#define NAU8821_CLK_DAC_INV		(0x1 << NAU8821_CLK_DAC_INV)
+#define NAU8821_EN_DACR_SFT		11
+#define NAU8821_EN_DACR		(0x1 << NAU8821_EN_DACR_SFT)
+#define NAU8821_EN_DACL_SFT		10
+#define NAU8821_EN_DACL		(0x1 << NAU8821_EN_DACL_SFT)
+#define NAU8821_EN_ADCR_SFT		9
+#define NAU8821_EN_ADCR		(0x1 << NAU8821_EN_ADCR_SFT)
+#define NAU8821_EN_ADCL_SFT		8
+#define NAU8821_EN_ADCL		(0x1 << NAU8821_EN_ADCL_SFT)
+#define NAU8821_EN_ADC_CLK_SFT	7
+#define NAU8821_EN_ADC_CLK		(0x1 << NAU8821_EN_ADC_CLK_SFT)
+#define NAU8821_EN_DAC_CLK_SFT	6
+#define NAU8821_EN_DAC_CLK		(0x1 << NAU8821_EN_DAC_CLK_SFT)
+#define NAU8821_EN_I2S_CLK_SFT	4
+#define NAU8821_EN_I2S_CLK		(0x1 << NAU8821_EN_I2S_CLK_SFT)
+#define NAU8821_EN_DRC_CLK_SFT	0
+#define NAU8821_EN_DRC_CLK		(0x1 << NAU8821_EN_DRC_CLK_SFT)
+
+/* CLK_DIVIDER (0x03) */
+#define NAU8821_CLK_SRC_SFT		15
+#define NAU8821_CLK_SRC_MASK		(0x1 << NAU8821_CLK_SRC_SFT)
+#define NAU8821_CLK_SRC_VCO		(0x1 << NAU8821_CLK_SRC_SFT)
+#define NAU8821_CLK_SRC_MCLK		(0x0 << NAU8821_CLK_SRC_SFT)
+#define NAU8821_CLK_CODEC_SRC_SFT	13
+#define NAU8821_CLK_CODEC_SRC_MASK	(0x1 << NAU8821_CLK_CODEC_SRC_SFT)
+#define NAU8821_CLK_CODEC_SRC_VCO	(0x1 << NAU8821_CLK_CODEC_SRC_SFT)
+#define NAU8821_CLK_CODEC_SRC_MCLK	(0x0 << NAU8821_CLK_CODEC_SRC_SFT)
+#define NAU8821_CLK_ADC_SRC_SFT	6
+#define NAU8821_CLK_ADC_SRC_MASK	(0x3 << NAU8821_CLK_ADC_SRC_SFT)
+#define NAU8821_CLK_DAC_SRC_SFT	4
+#define NAU8821_CLK_DAC_SRC_MASK	(0x3 << NAU8821_CLK_DAC_SRC_SFT)
+#define NAU8821_CLK_MCLK_SRC_MASK	(0xf << 0)
+
+/* FLL1 (0x04) */
+#define NAU8821_ICTRL_LATCH_SFT	10
+#define NAU8821_ICTRL_LATCH_MASK	(0x7 << NAU8821_ICTRL_LATCH_SFT)
+#define NAU8821_FLL_RATIO_MASK	(0x7f << 0)
+
+/* FLL3 (0x06) */
+#define NAU8821_GAIN_ERR_SFT		12
+#define NAU8821_GAIN_ERR_MASK	(0xf << NAU8821_GAIN_ERR_SFT)
+#define NAU8821_FLL_INTEGER_MASK	(0x3ff << 0)
+#define NAU8821_FLL_CLK_SRC_SFT	10
+#define NAU8821_FLL_CLK_SRC_MASK	(0x3 << NAU8821_FLL_CLK_SRC_SFT)
+#define NAU8821_FLL_CLK_SRC_MCLK	(0x0 << NAU8821_FLL_CLK_SRC_SFT)
+#define NAU8821_FLL_CLK_SRC_BLK	(0x2 << NAU8821_FLL_CLK_SRC_SFT)
+#define NAU8821_FLL_CLK_SRC_FS	(0x3 << NAU8821_FLL_CLK_SRC_SFT)
+
+/* FLL4 (0x07) */
+#define NAU8821_HIGHBW_EN_SFT	15
+#define NAU8821_HIGHBW_EN		(0x1 << NAU8821_HIGHBW_EN_SFT)
+#define NAU8821_FLL_REF_DIV_SFT	10
+#define NAU8821_FLL_REF_DIV_MASK	(0x3 << NAU8821_FLL_REF_DIV_SFT)
+
+/* FLL5 (0x08) */
+#define NAU8821_FLL_PDB_DAC_EN	(0x1 << 15)
+#define NAU8821_FLL_LOOP_FTR_EN	(0x1 << 14)
+#define NAU8821_FLL_CLK_SW_MASK	(0x1 << 13)
+#define NAU8821_FLL_CLK_SW_N2	(0x1 << 13)
+#define NAU8821_FLL_CLK_SW_REF	(0x0 << 13)
+#define NAU8821_FLL_FTR_SW_MASK	(0x1 << 12)
+#define NAU8821_FLL_FTR_SW_ACCU	(0x1 << 12)
+#define NAU8821_FLL_FTR_SW_FILTER	(0x0 << 12)
+
+/* FLL6 (0x09) */
+#define NAU8821_DCO_EN	(0x1 << 15)
+#define NAU8821_SDM_EN	(0x1 << 14)
+#define NAU8821_CUTOFF500	(0x1 << 13)
+
+/* FLL7 (0x0a) */
+#define NAU8821_FLL_FRACH_MASK	(0xff)
+
+/* FLL8 (0x0b) */
+#define NAU8821_FLL_FRACL_MASK	(0xffff)
+
+/* JACK_DET_CTRL (0x0d) */
+/* 0 - open, 1 - short to GND */
+#define NAU8821_SPKR_DWN1R_SFT		15
+#define NAU8821_SPKR_DWN1R			(0x1 << NAU8821_SPKR_DWN1R_SFT)
+#define NAU8821_SPKR_DWN1L_SFT		14
+#define NAU8821_SPKR_DWN1L			(0x1 << NAU8821_SPKR_DWN1L_SFT)
+#define NAU8821_JACK_DET_RESTART		(0x1 << 9)
+#define NAU8821_JACK_DET_DB_BYPASS		(0x1 << 8)
+#define NAU8821_JACK_INSERT_DEBOUNCE_SFT	5
+#define NAU8821_JACK_INSERT_DEBOUNCE_MASK	(0x7 << NAU8821_JACK_INSERT_DEBOUNCE_SFT)
+#define NAU8821_JACK_EJECT_DEBOUNCE_SFT	2
+#define NAU8821_JACK_EJECT_DEBOUNCE_MASK	(0x7 << NAU8821_JACK_EJECT_DEBOUNCE_SFT)
+#define NAU8821_JACK_POLARITY			(0x1 << 1) /* 0 - active low, 1 - active high */
+
+/* INTERRUPT_MASK (0x0f) */
+#define NAU8821_IRQ_PIN_PULL_UP	(0x1 << 14)
+#define NAU8821_IRQ_PIN_PULL_EN	(0x1 << 13)
+#define NAU8821_IRQ_OUTPUT_EN	(0x1 << 11)
+#define NAU8821_IRQ_RMS_EN		(0x1 << 8)
+#define NAU8821_IRQ_KEY_RELEASE_EN	(0x1 << 7)
+#define NAU8821_IRQ_KEY_PRESS_EN	(0x1 << 6)
+#define NAU8821_IRQ_MIC_DET_EN	(0x1 << 4)
+#define NAU8821_IRQ_EJECT_EN		(0x1 << 2)
+#define NAU8821_IRQ_INSERT_EN	(0x1 << 0)
+
+/* IRQ_STATUS (0x10) */
+#define NAU8821_SHORT_CIRCUIT_IRQ		(0x1 << 9)
+#define NAU8821_IMPEDANCE_MEAS_IRQ		(0x1 << 8)
+#define NAU8821_KEY_IRQ_MASK			(0x3 << 6)
+#define NAU8821_KEY_RELEASE_IRQ		(0x1 << 7)
+#define NAU8821_KEY_SHORT_PRESS_IRQ		(0x1 << 6)
+#define NAU8821_MIC_DETECT_IRQ		(0x1 << 4)
+#define NAU8821_JACK_EJECT_IRQ_MASK		(0x3 << 2)
+#define NAU8821_JACK_EJECT_DETECTED		(0x1 << 2)
+#define NAU8821_JACK_INSERT_IRQ_MASK	0x3
+#define NAU8821_JACK_INSERT_DETECTED	0x1
+
+/* INTERRUPT_DIS_CTRL (0x12) */
+#define NAU8821_IRQ_KEY_RELEASE_DIS	(0x1 << 7)
+#define NAU8821_IRQ_KEY_PRESS_DIS	(0x1 << 6)
+#define NAU8821_IRQ_MIC_DIS		(0x1 << 4)
+#define NAU8821_IRQ_EJECT_DIS		(0x1 << 2)
+#define NAU8821_IRQ_INSERT_DIS	(0x1 << 0)
+
+/* DMIC_CTRL (0x13) */
+#define NAU8821_DMIC_DS_SFT		7
+#define NAU8821_DMIC_DS_MASK	(0x1 << NAU8821_DMIC_DS_SFT)
+#define NAU8821_DMIC_DS_HIGH		(0x1 << NAU8821_DMIC_DS_SFT)
+#define NAU8821_DMIC_DS_LOW		(0x0 << NAU8821_DMIC_DS_SFT)
+#define NAU8821_DMIC_SRC_SFT		1
+#define NAU8821_DMIC_SRC_MASK	(0x3 << NAU8821_DMIC_SRC_SFT)
+#define NAU8821_CLK_DMIC_SRC	(0x2 << NAU8821_DMIC_SRC_SFT)
+#define NAU8821_DMIC_EN_SFT		0
+#define NAU8821_DMIC_EN			(0x1 << NAU8821_DMIC_EN_SFT)
+#define NAU8821_DMIC_EN_MASK	(0x1 << NAU8821_DMIC_EN_SFT)
+#define NAU8821_DMIC_DIS	(0x0 << NAU8821_DMIC_EN_SFT)
+
+/* GPIO12_CTRL (0x1a) */
+#define NAU8821_JKDET_PULL_UP	(0x1 << 11) /* 0 - pull down, 1 - pull up */
+#define NAU8821_JKDET_PULL_EN		(0x1 << 9) /* 0 - enable pull, 1 - disable */
+#define NAU8821_JKDET_OUTPUT_EN	(0x1 << 8) /* 0 - enable input, 1 - enable output */
+
+/* TDM_CTRL (0x1b) */
+#define NAU8821_TDM_EN_SFT		15
+#define NAU8821_TDM_EN		(0x1 << NAU8821_TDM_EN_SFT)
+#define NAU8821_DACL_CH_SFT		7
+#define NAU8821_DACL_CH_MASK		(0x7 << NAU8821_DACL_CH_SFT)
+#define NAU8821_DACR_CH_SFT		4
+#define NAU8821_DACR_CH_MASK	(0x7 << NAU8821_DACR_CH_SFT)
+#define NAU8821_ADCL_CH_SFT		2
+#define NAU8821_ADCL_CH_MASK		(0x3 << NAU8821_ADCL_CH_SFT)
+#define NAU8821_ADCR_CH_SFT		0
+#define NAU8821_ADCR_CH_MASK	0x3
+
+/* I2S_PCM_CTRL1 (0x1c) */
+#define NAU8821_I2S_BP_SFT		7
+#define NAU8821_I2S_BP_MASK		(0x1 << NAU8821_I2S_BP_SFT)
+#define NAU8821_I2S_BP_INV		(0x1 << NAU8821_I2S_BP_SFT)
+#define NAU8821_I2S_PCMB_SFT		6
+#define NAU8821_I2S_PCMB_MASK	(0x1 << NAU8821_I2S_PCMB_SFT)
+#define NAU8821_I2S_PCMB_EN		(0x1 << NAU8821_I2S_PCMB_SFT)
+#define NAU8821_I2S_DL_SFT		2
+#define NAU8821_I2S_DL_MASK		(0x3 << NAU8821_I2S_DL_SFT)
+#define NAU8821_I2S_DL_16		(0x0 << NAU8821_I2S_DL_SFT)
+#define NAU8821_I2S_DL_20		(0x1 << NAU8821_I2S_DL_SFT)
+#define NAU8821_I2S_DL_24		(0x2 << NAU8821_I2S_DL_SFT)
+#define NAU8821_I2S_DL_32		(0x3 << NAU8821_I2S_DL_SFT)
+#define NAU8821_I2S_DF_SFT		0
+#define NAU8821_I2S_DF_MASK		(0x3 << NAU8821_I2S_DF_SFT)
+#define NAU8821_I2S_DF_RIGTH		(0x0 << NAU8821_I2S_DF_SFT)
+#define NAU8821_I2S_DF_LEFT		(0x1 << NAU8821_I2S_DF_SFT)
+#define NAU8821_I2S_DF_I2S		(0x2 << NAU8821_I2S_DF_SFT)
+#define NAU8821_I2S_DF_PCM_AB	(0x3 << NAU8821_I2S_DF_SFT)
+
+/* I2S_PCM_CTRL2 (0x1d) */
+#define NAU8821_I2S_TRISTATE_SFT	15
+#define NAU8821_I2S_TRISTATE		(0x1 << NAU8821_I2S_TRISTATE_SFT)
+#define NAU8821_I2S_LRC_DIV_SFT	12
+#define NAU8821_I2S_LRC_DIV_MASK	(0x3 << NAU8821_I2S_LRC_DIV_SFT)
+#define NAU8821_I2S_MS_SFT		3
+#define NAU8821_I2S_MS_MASK		(0x1 << NAU8821_I2S_MS_SFT)
+#define NAU8821_I2S_MS_MASTER	(0x1 << NAU8821_I2S_MS_SFT)
+#define NAU8821_I2S_MS_SLAVE		(0x0 << NAU8821_I2S_MS_SFT)
+#define NAU8821_I2S_BLK_DIV_MASK	0x7
+
+/* LEFT_TIME_SLOT (0x1e) */
+#define NAU8821_TSLOT_L_OFFSET_MASK	0x3ff
+#define NAU8821_DIS_FS_SHORT_DET	(0x1 << 13)
+
+/* RIGHT_TIME_SLOT (0x1f) */
+#define NAU8821_TSLOT_R_OFFSET_MASK	0x3ff
+
+/* BIQ0_COF10 (0x2a) */
+#define NAU8821_BIQ0_ADC_EN_SFT   3
+#define NAU8821_BIQ0_ADC_EN_EN     (0x1 << NAU8821_BIQ0_ADC_EN_SFT)
+
+/* ADC_RATE (0x2b) */
+#define NAU8821_ADC_SYNC_DOWN_SFT		0
+#define NAU8821_ADC_SYNC_DOWN_MASK	0x3
+#define NAU8821_ADC_SYNC_DOWN_32		0x0
+#define NAU8821_ADC_SYNC_DOWN_64		0x1
+#define NAU8821_ADC_SYNC_DOWN_128		0x2
+#define NAU8821_ADC_SYNC_DOWN_256		0x3
+#define NAU8821_ADC_L_SRC_SFT	15
+#define NAU8821_ADC_L_SRC_EN	(0x1 << NAU8821_ADC_L_SRC_SFT)
+#define NAU8821_ADC_R_SRC_SFT	14
+#define NAU8821_ADC_R_SRC_EN	(0x1 << NAU8821_ADC_R_SRC_SFT)
+
+
+
+
+/* DAC_CTRL1 (0x2c) */
+#define NAU8821_DAC_OVERSAMPLE_SFT		0
+#define NAU8821_DAC_OVERSAMPLE_MASK	0x7
+#define NAU8821_DAC_OVERSAMPLE_64		0x0
+#define NAU8821_DAC_OVERSAMPLE_256		0x1
+#define NAU8821_DAC_OVERSAMPLE_128		0x2
+#define NAU8821_DAC_OVERSAMPLE_32		0x4
+
+/* DAC_DGAIN_CTRL (0x2f) */
+#define NAU8821_DAC1_TO_DAC0_ST_SFT		8
+#define NAU8821_DAC1_TO_DAC0_ST_MASK	(0xff << NAU8821_DAC1_TO_DAC0_ST_SFT)
+#define NAU8821_DAC0_TO_DAC1_ST_SFT		0
+#define NAU8821_DAC0_TO_DAC1_ST_MASK	0xff
+
+/* MUTE_CTRL (0x31) */
+#define NAU8821_DAC_ZC_EN		(0x1 << 12)
+#define NAU8821_DAC_SOFT_MUTE	(0x1 << 9)
+#define NAU8821_ADC_ZC_EN		(0x1 << 2)
+#define NAU8821_ADC_SOFT_MUTE	(0x1 << 1)
+
+/* HSVOL_CTRL (0x32) */
+#define NAU8821_HP_MUTE	(0x1 << 15)
+#define NAU8821_HP_MUTE_AUTO	(0x1 << 14)
+#define NAU8821_HPL_MUTE	(0x1 << 13)
+#define NAU8821_HPR_MUTE	(0x1 << 12)
+#define NAU8821_HPL_VOL_SFT	4
+#define NAU8821_HPL_VOL_MASK	(0x3 << NAU8821_HPL_VOL_SFT)
+#define NAU8821_HPR_VOL_SFT	0
+#define NAU8821_HPR_VOL_MASK	(0x3 << NAU8821_HPR_VOL_SFT)
+
+/* DACR_CTRL (0x34) */
+#define NAU8821_DACR_CH_VOL_SFT	8
+#define NAU8821_DACR_CH_VOL_MASK	(0xff << NAU8821_DACR_CH_VOL_SFT)
+#define NAU8821_DACL_CH_VOL_SFT	0
+#define NAU8821_DACL_CH_VOL_MASK	0xff
+
+/* ADC_DGAIN_CTRL1 (0x35) */
+#define NAU8821_ADCR_CH_VOL_SFT	8
+#define NAU8821_ADCR_CH_VOL_MASK	(0xff << NAU8821_ADCR_CH_VOL_SFT)
+#define NAU8821_ADCL_CH_VOL_SFT	0
+#define NAU8821_ADCL_CH_VOL_MASK	0xff
+
+/* BIQ1_COF10 (0x4a) */
+#define NAU8821_BIQ1_DAC_EN_SFT   3
+#define NAU8821_BIQ1_DAC_EN_EN     (0x1 << NAU8821_BIQ1_DAC_EN_SFT)
+
+/* CLASSG_CTRL (0x4b) */
+#define NAU8821_CLASSG_TIMER_SFT	8
+#define NAU8821_CLASSG_TIMER_MASK	(0x3f << NAU8821_CLASSG_TIMER_SFT)
+#define NAU8821_CLASSG_TIMER_1ms	(0x1 << NAU8821_CLASSG_TIMER_SFT)
+#define NAU8821_CLASSG_TIMER_2ms	(0x2 << NAU8821_CLASSG_TIMER_SFT)
+#define NAU8821_CLASSG_TIMER_8ms	(0x4 << NAU8821_CLASSG_TIMER_SFT)
+#define NAU8821_CLASSG_TIMER_16ms	(0x8 << NAU8821_CLASSG_TIMER_SFT)
+#define NAU8821_CLASSG_TIMER_32ms	(0x10 << NAU8821_CLASSG_TIMER_SFT)
+#define NAU8821_CLASSG_TIMER_64ms	(0x20 << NAU8821_CLASSG_TIMER_SFT)
+#define NAU8821_CLASSG_RDAC_EN_SFT	2
+#define NAU8821_CLASSG_RDAC_EN	(0x1 << NAU8821_CLASSG_RDAC_EN_SFT)
+#define NAU8821_CLASSG_LDAC_EN_SFT	1
+#define NAU8821_CLASSG_LDAC_EN	(0x1 << NAU8821_CLASSG_LDAC_EN_SFT)
+#define NAU8821_CLASSG_EN_SFT	0
+#define NAU8821_CLASSG_EN		0x1
+
+/* IMM_MODE_CTRL (0x4C) */
+#define NAU8821_IMM_THD_SFT		8
+#define NAU8821_IMM_THD_MASK	(0x3f << NAU8821_IMM_THD_SFT)
+#define NAU8821_IMM_GEN_VOL_SFT	6
+#define NAU8821_IMM_GEN_VOL_MASK	(0x3 << NAU8821_IMM_GEN_VOL_SFT)
+#define NAU8821_IMM_CYC_SFT		4
+#define NAU8821_IMM_CYC_MASK	(0x3 << NAU8821_IMM_CYC_SFT)
+#define NAU8821_IMM_EN		(0x1 << 3)
+#define NAU8821_IMM_DAC_SRC_MASK	0x3
+
+/* I2C_DEVICE_ID (0x58) */
+#define NAU8821_MICDET		(0x1 << 7)
+#define NAU8821_SOFTWARE_ID_MASK	0x3
+
+/* BIAS_ADJ (0x66) */
+#define NAU8821_BIAS_HP_IMP		(0x1 << 15)
+#define NAU8821_BIAS_TESTDAC_SFT	8
+#define NAU8821_BIAS_TESTDAC_EN	(0x3 << NAU8821_BIAS_TESTDAC_SFT)
+#define NAU8821_BIAS_TESTDACR_EN	(0x2 << NAU8821_BIAS_TESTDAC_SFT)
+#define NAU8821_BIAS_TESTDACL_EN	(0x1 << NAU8821_BIAS_TESTDAC_SFT)
+#define NAU8821_BIAS_VMID		(0x1 << 6)
+#define NAU8821_BIAS_VMID_SEL_SFT	4
+#define NAU8821_BIAS_VMID_SEL_MASK	(0x3 << NAU8821_BIAS_VMID_SEL_SFT)
+
+/* ANALOG_CONTROL_1 (0x69) */
+#define NAU8821_JD_POL_SFT		2
+#define NAU8821_JD_POL_MASK		(0x1 << NAU8821_JD_POL_SFT)
+#define NAU8821_JD_POL_INV		(0x1 << NAU8821_JD_POL_SFT)
+#define NAU8821_JD_OUT_POL_SFT	1
+#define NAU8821_JD_OUT_POL_MASK	(0x1 << NAU8821_JD_OUT_POL_SFT)
+#define NAU8821_JD_OUT_POL_INV	(0x1 << NAU8821_JD_OUT_POL_SFT)
+#define NAU8821_JD_EN_SFT		0
+#define NAU8821_JD_EN			0x1
+
+/* ANALOG_CONTROL_2 (0x6a) */
+#define NAU8821_HP_NON_CLASSG_CURRENT_2xADJ	(0x1 << 12)
+#define NAU8821_DAC_CAPACITOR_MSB			(0x1 << 1)
+#define NAU8821_DAC_CAPACITOR_LSB			(0x1 << 0)
+
+/* ANALOG_ADC_1 (0x71) */
+#define NAU8821_MICDET_EN_SFT	0
+#define NAU8821_MICDET_DIS		0x1
+#define NAU8821_MICDET_EN		(0x0 << 0)
+
+/* ANALOG_ADC_2 (0x72) */
+#define NAU8821_ADC_VREFSEL_SFT	8
+#define NAU8821_ADC_VREFSEL_MASK	(0x3 << NAU8821_ADC_VREFSEL_SFT)
+#define NAU8821_POWERUP_ADCL_SFT	6
+#define NAU8821_POWERUP_ADCL	(0x1 << NAU8821_POWERUP_ADCL_SFT)
+#define NAU8821_POWERUP_ADCR_SFT	4
+#define NAU8821_POWERUP_ADCR	(0x1 << NAU8821_POWERUP_ADCR_SFT)
+
+/* RDAC (0x73) */
+#define NAU8821_DACR_EN_SFT		13
+#define NAU8821_DACR_EN		(0x3 << NAU8821_DACR_EN_SFT)
+#define NAU8821_DACL_EN_SFT		12
+#define NAU8821_DACL_EN		(0x3 << NAU8821_DACL_EN_SFT)
+#define NAU8821_DACR_CLK_EN_SFT	9
+#define NAU8821_DACR_CLK_EN		(0x3 << NAU8821_DACR_CLK_EN_SFT)
+#define NAU8821_DACL_CLK_EN_SFT	8
+#define NAU8821_DACL_CLK_EN		(0x3 << NAU8821_DACL_CLK_EN_SFT)
+#define NAU8821_DAC_CLK_DELAY_SFT	4
+#define NAU8821_DAC_CLK_DELAY_MASK	(0x7 << NAU8821_DAC_CLK_DELAY_SFT)
+#define NAU8821_DAC_VREF_SFT		2
+#define NAU8821_DAC_VREF_MASK	(0x3 << NAU8821_DAC_VREF_SFT)
+
+/* MIC_BIAS (0x74) */
+#define NAU8821_MICBIAS_JKR2			(0x1 << 12)
+#define NAU8821_MICBIAS_POWERUP_SFT	8
+#define NAU8821_MICBIAS_VOLTAGE_SFT		0
+#define NAU8821_MICBIAS_VOLTAGE_MASK	0x7
+
+/* BOOST (0x76) */
+#define NAU8821_PRECHARGE_DIS	(0x1 << 13)
+#define NAU8821_GLOBAL_BIAS_EN	(0x1 << 12)
+#define NAU8821_HP_BOOST_DIS_SFT	9
+#define NAU8821_HP_BOOST_DIS		(0x1 << NAU8821_HP_BOOST_DIS_SFT)
+#define NAU8821_HP_BOOST_G_DIS	(0x1 << 8)
+#define NAU8821_SHORT_SHUTDOWN_EN	(0x1 << 6)
+
+/* FEPGA (0x77) */
+#define NAU8821_FEPGA_MODEL_SFT	4
+#define NAU8821_FEPGA_MODEL_MASK	(0xf << NAU8821_FEPGA_MODEL_SFT)
+#define NAU8821_FEPGA_MODER_SFT	0
+#define NAU8821_FEPGA_MODER_MASK	0xf
+
+/* PGA_GAIN (0x7e) */
+#define NAU8821_PGA_GAIN_L_SFT	8
+#define NAU8821_PGA_GAIN_L_MASK	(0x3f << NAU8821_PGA_GAIN_L_SFT)
+#define NAU8821_PGA_GAIN_R_SFT	0
+#define NAU8821_PGA_GAIN_R_MASK	0x3f
+
+/* POWER_UP_CONTROL (0x7f) */
+#define NAU8821_PUP_PGA_L_SFT	15
+#define NAU8821_PUP_PGA_L		(0x1 << NAU8821_PUP_PGA_L_SFT)
+#define NAU8821_PUP_PGA_R_SFT	14
+#define NAU8821_PUP_PGA_R		(0x1 << NAU8821_PUP_PGA_R_SFT)
+#define NAU8821_PUP_INTEG_R_SFT	5
+#define NAU8821_PUP_INTEG_R		(0x1 << NAU8821_PUP_INTEG_R_SFT)
+#define NAU8821_PUP_INTEG_L_SFT	4
+#define NAU8821_PUP_INTEG_L		(0x1 << NAU8821_PUP_INTEG_L_SFT)
+#define NAU8821_PUP_DRV_INSTG_R_SFT	3
+#define NAU8821_PUP_DRV_INSTG_R	(0x1 << NAU8821_PUP_DRV_INSTG_R_SFT)
+#define NAU8821_PUP_DRV_INSTG_L_SFT	2
+#define NAU8821_PUP_DRV_INSTG_L	(0x1 << NAU8821_PUP_DRV_INSTG_L_SFT)
+#define NAU8821_PUP_MAIN_DRV_R_SFT	1
+#define NAU8821_PUP_MAIN_DRV_R	(0x1 << NAU8821_PUP_MAIN_DRV_R_SFT)
+#define NAU8821_PUP_MAIN_DRV_L_SFT	0
+#define NAU8821_PUP_MAIN_DRV_L	0x1
+
+/* CHARGE_PUMP (0x80) */
+#define NAU8821_JAMNODCLOW			(0x1 << 10)
+#define NAU8821_POWER_DOWN_DACR_SFT	9
+#define NAU8821_POWER_DOWN_DACR		(0x1 << NAU8821_POWER_DOWN_DACR_SFT)
+#define NAU8821_POWER_DOWN_DACL_SFT	8
+#define NAU8821_POWER_DOWN_DACL		(0x1 << NAU8821_POWER_DOWN_DACL_SFT)
+#define NAU8821_CHANRGE_PUMP_EN_SFT	5
+#define NAU8821_CHANRGE_PUMP_EN		(0x1 << NAU8821_CHANRGE_PUMP_EN_SFT)
+
+/* GENERAL_STATUS (0x82) */
+#define NAU8821_GPIO2_IN_SFT	1
+#define NAU8821_GPIO2_IN	(0x1 << NAU8821_GPIO2_IN_SFT)
+
+/* System Clock Source */
+enum {
+	NAU8821_CLK_DIS,
+	NAU8821_CLK_MCLK,
+	NAU8821_CLK_INTERNAL,
+	NAU8821_CLK_FLL_MCLK,
+	NAU8821_CLK_FLL_BLK,
+	NAU8821_CLK_FLL_FS,
+};
+
+struct nau8821 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct snd_soc_dapm_context *dapm;
+	struct snd_soc_jack *jack;
+	struct semaphore jd_sem;
+	struct work_struct jdet_work;
+	int irq;
+	int clk_id;
+	int micbias_voltage;
+	int vref_impedance;
+	bool jkdet_enable;
+	bool jkdet_pull_enable;
+	bool jkdet_pull_up;
+	int jkdet_polarity;
+	int jack_insert_debounce;
+	int jack_eject_debounce;
+};
+
+int nau8821_enable_jack_detect(struct snd_soc_component *component,
+	struct snd_soc_jack *jack);
+
+#endif  /* __NAU8821_H__ */
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9356B12791B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 11:17:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D72E91654;
	Fri, 20 Dec 2019 11:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D72E91654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576837053;
	bh=w7gOy5Gqi2aFeuGpCsCuMxdWFVqtS1eYzPJGeeMrKjU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZwiZTGmCq0ldWospyFHofRNs5Cmdbg9re8NaD7MF1unakMluFYoqmB/E6t834LhLk
	 T32Douza3tDLXd2VkJSNBcC5c6nTr82C2gXZwmNznXX4VX6EvTVPRqhbMX4gvKojkJ
	 nQAJq/jXENGDFRG9P6p3moXRgsUPYNPlH7I5YQ5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30BD2F8015A;
	Fri, 20 Dec 2019 11:15:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2AEAF8015A; Fri, 20 Dec 2019 11:15:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EC8EF80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 11:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC8EF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uv1Aodat"
Received: by mail-pl1-x644.google.com with SMTP id g6so948138plp.6
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 02:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EzjC31ShIrn4wiIsj38oH4Jno4IAIgPgwvc4leyzGdU=;
 b=uv1Aodat9UKuw2TENt1RaeyyTQbfZ9lTGss5/J96Q+SDVjnMboziNkuJZqcN2VFoTP
 rpvBrFBS4ZPUkdtCn0ZSgucB5WPCz99B3m5C2bnjgIfkLObXTLfIDBUYGcTgSR/o5WOK
 d7+LpY6JkMeOn6FPRq7U1LG2mBSH8jIaFOb7j6kaL+QV0FKsR4nDEqy0x7YMCq+bYS1f
 UCz/jOFHbXcN2hxlapYnoDuMtk9y/RfWTZNx7oTcH1zII2Y9l/JkaQFlDRJHE13awNgr
 v3IvkuY0FK4hqs564Y4bJhG9NxslHZPqTCGP8JDY5smt6VCmx+I2WSj11+hDW9zmXK86
 UK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EzjC31ShIrn4wiIsj38oH4Jno4IAIgPgwvc4leyzGdU=;
 b=Wim1EY60dIvSd3/ralCsA3421AktN+2EOPh6IDRYdd7wIhTv5SmG/OXiI3d/bTb7Jp
 6Q/IPMMa5G6G+s3UoEQ8z+tUFB5h+hCP/aD0ouzGZ2oj603zm3rAVcnYZdyCMuTaDIRa
 IeXW8Ej9G70PBcixGfUvOYAmWUMbuNjqPTwbcEZAEnGAL7/d+oL6AZS7sb2sRp75y0Jz
 EEwpVHEhaYdGvEWDrIoK0eTjPZ5qr7TzsssGgSTrvlW7Z5CuU4hErOVsV4eLYekKOODO
 db0//TAHj6qdMuYFUo8hJbqidLSDCA4TmLV7WylEmaZtqMiu/+2BPFNfJZtL/fZW1lvn
 +D8Q==
X-Gm-Message-State: APjAAAVt8eBY0NtNoeabXaf6nuFW5KJi0xMa8k6PUI1AmGMqgk/N2a7K
 JGRv7lZE9F+hc8IxBzqrT3c=
X-Google-Smtp-Source: APXvYqxUpthEWtxxxmIXf6kpI+cPd2FK3bfGhN9AzQnDckqridevQfq6vZbTcfF5FUgJ6TdyceqAmQ==
X-Received: by 2002:a17:902:700c:: with SMTP id
 y12mr13888890plk.227.1576836941200; 
 Fri, 20 Dec 2019 02:15:41 -0800 (PST)
Received: from localhost.localdomain ([115.82.5.164])
 by smtp.gmail.com with ESMTPSA id w8sm11498191pfn.186.2019.12.20.02.15.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 20 Dec 2019 02:15:40 -0800 (PST)
From: Jeff Chang <richtek.jeff.chang@gmail.com>
To: lgirdwood@gmail.com
Date: Fri, 20 Dec 2019 18:15:34 +0800
Message-Id: <1576836934-5370-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, richtek.jeff.chang@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jeff_chang@richtek.com,
 broonie@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp Driver
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

From: Jeff Chang <jeff_chang@richtek.com>

The MT6660 is a boosted BTL class-D amplifier with V/I sensing.
A built-in DC-DC step-up converter is used to provide efficient
power for class-D amplifier with multi-level class-G operation.
The digital audio interface supports I2S, left-justified,
right-justified, TDM and DSP A/B format for audio in with a data
out used for chip information like voltage sense and current
sense, which are able to be monitored via DATAO through proper

Signed-off-by: Jeff Chang <jeff_chang@richtek.com>
---
 sound/soc/codecs/Kconfig  |  11 +
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/mt6660.c | 653 ++++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/mt6660.h |  75 ++++++
 4 files changed, 741 insertions(+)
 create mode 100644 sound/soc/codecs/mt6660.c
 create mode 100644 sound/soc/codecs/mt6660.h


changelogs between v3 & v2

	- modify MT6660 Kconfig, remove unnecessary selection.
	- remove my own debug io interface. use standard regmap for debugging.
	- remove regmap volatile ops, we do not use cache.
	- remove component io read/write function, use snd_soc_component_init_regmap.
	- remove init setting write code. Using parsing dts to set them.
	- remove unnecessary pr_info log message.
	- remove mt6660_component_put_volsw. Using snd_soc_get_volsw.


diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 229cc89..f135fbb 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -122,6 +122,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_ML26124 if I2C
 	select SND_SOC_MT6351 if MTK_PMIC_WRAP
 	select SND_SOC_MT6358 if MTK_PMIC_WRAP
+	select SND_SOC_MT6660 if I2C
 	select SND_SOC_NAU8540 if I2C
 	select SND_SOC_NAU8810 if I2C
 	select SND_SOC_NAU8822 if I2C
@@ -1465,6 +1466,16 @@ config SND_SOC_MT6358
 	  Enable support for the platform which uses MT6358 as
 	  external codec device.
 
+config SND_SOC_MT6660
+	tristate "Mediatek MT6660 Speaker Amplifier"
+	depends on I2C
+	help
+	  MediaTek MT6660 is a smart power amplifier which contain
+	  speaker protection, multi-band DRC, equalizer functions.
+	  Select N if you don't have MT6660 on board.
+	  Select M to build this as module.
+
+
 config SND_SOC_NAU8540
        tristate "Nuvoton Technology Corporation NAU85L40 CODEC"
        depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index c498373..2b6814c 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -119,6 +119,7 @@ snd-soc-msm8916-analog-objs := msm8916-wcd-analog.o
 snd-soc-msm8916-digital-objs := msm8916-wcd-digital.o
 snd-soc-mt6351-objs := mt6351.o
 snd-soc-mt6358-objs := mt6358.o
+snd-soc-mt6660-objs := mt6660.o
 snd-soc-nau8540-objs := nau8540.o
 snd-soc-nau8810-objs := nau8810.o
 snd-soc-nau8822-objs := nau8822.o
@@ -403,6 +404,7 @@ obj-$(CONFIG_SND_SOC_MSM8916_WCD_ANALOG) +=snd-soc-msm8916-analog.o
 obj-$(CONFIG_SND_SOC_MSM8916_WCD_DIGITAL) +=snd-soc-msm8916-digital.o
 obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
 obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
+obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
 obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
 obj-$(CONFIG_SND_SOC_NAU8810)   += snd-soc-nau8810.o
 obj-$(CONFIG_SND_SOC_NAU8822)   += snd-soc-nau8822.o
diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
new file mode 100644
index 0000000..5f3b9262
--- /dev/null
+++ b/sound/soc/codecs/mt6660.c
@@ -0,0 +1,653 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/version.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include <sound/pcm_params.h>
+#include <linux/debugfs.h>
+
+#include "mt6660.h"
+
+struct codec_reg_val {
+	u32 addr;
+	u32 mask;
+	u32 data;
+};
+
+struct reg_size_table {
+	u32 addr;
+	u8 size;
+};
+
+static const struct reg_size_table mt6660_reg_size_table[] = {
+	{ MT6660_REG_HPF1_COEF, 4 },
+	{ MT6660_REG_HPF2_COEF, 4 },
+	{ MT6660_REG_TDM_CFG3, 2 },
+	{ MT6660_REG_RESV17, 2 },
+	{ MT6660_REG_RESV23, 2 },
+	{ MT6660_REG_SIGMAX, 2 },
+	{ MT6660_REG_DEVID, 2},
+	{ MT6660_REG_TDM_CFG3, 2},
+	{ MT6660_REG_HCLIP_CTRL, 2},
+	{ MT6660_REG_DA_GAIN, 2},
+};
+
+static int mt6660_get_reg_size(uint32_t addr)
+{
+	int i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(mt6660_reg_size_table); i++) {
+		if (mt6660_reg_size_table[i].addr == addr)
+			return mt6660_reg_size_table[i].size;
+	}
+	return 1;
+}
+
+static int mt6660_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct mt6660_chip *chip = context;
+	int size = mt6660_get_reg_size(reg);
+	u8 reg_data[4] = {0};
+	int i = 0, ret = 0;
+
+	for (i = 0; i < size; i++)
+		reg_data[size - i - 1] = (val >> (8 * i)) & 0xff;
+
+	ret = i2c_smbus_write_i2c_block_data(chip->i2c, reg, size, reg_data);
+	if (ret < 0)
+		return ret;
+	return 0;
+}
+
+static int mt6660_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct mt6660_chip *chip = context;
+	int size = mt6660_get_reg_size(reg);
+	int i = 0, ret = 0;
+	u8 data[4] = {0};
+	u32 reg_data = 0;
+
+	ret = i2c_smbus_read_i2c_block_data(chip->i2c, reg, size, data);
+	if (ret < 0)
+		return ret;
+	for (i = 0; i < size; i++) {
+		reg_data <<= 8;
+		reg_data |= data[i];
+	}
+	*val = reg_data;
+	return 0;
+}
+
+static struct regmap_config mt6660_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.reg_write = mt6660_reg_write,
+	.reg_read = mt6660_reg_read,
+};
+
+static int mt6660_codec_dac_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(1000, 1100);
+		break;
+	}
+	return 0;
+}
+
+static int mt6660_codec_classd_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dev_dbg(component->dev,
+			"%s: before classd turn on\n", __func__);
+		/* config to adaptive mode */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_BST_CTRL, 0x03, 0x03);
+		if (ret < 0) {
+			dev_err(component->dev, "config mode adaptive fail\n");
+			return ret;
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* voltage sensing enable */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_RESV7, 0x04, 0x04);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"enable voltage sensing fail\n");
+			return ret;
+		}
+		dev_dbg(component->dev, "Amp on\n");
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		dev_dbg(component->dev, "Amp off\n");
+		/* voltage sensing disable */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_RESV7, 0x04, 0x00);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"disable voltage sensing fail\n");
+			return ret;
+		}
+		/* pop-noise improvement 1 */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_RESV10, 0x10, 0x10);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"pop-noise improvement 1 fail\n");
+			return ret;
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		dev_dbg(component->dev,
+			"%s: after classd turn off\n", __func__);
+		/* pop-noise improvement 2 */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_RESV10, 0x10, 0x00);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"pop-noise improvement 2 fail\n");
+			return ret;
+		}
+		/* config to off mode */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_BST_CTRL, 0x03, 0x00);
+		if (ret < 0) {
+			dev_err(component->dev, "config mode off fail\n");
+			return ret;
+		}
+		break;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget mt6660_component_dapm_widgets[] = {
+	SND_SOC_DAPM_DAC_E("DAC", NULL, MT6660_REG_PLL_CFG1,
+		0, 1, mt6660_codec_dac_event, SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_ADC("VI ADC", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_PGA("PGA", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_OUT_DRV_E("ClassD", MT6660_REG_SYSTEM_CTRL, 2, 0,
+			       NULL, 0, mt6660_codec_classd_event,
+			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			       SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_OUTPUT("OUTP"),
+	SND_SOC_DAPM_OUTPUT("OUTN"),
+};
+
+static const struct snd_soc_dapm_route mt6660_component_dapm_routes[] = {
+	{ "DAC", NULL, "aif_playback"},
+	{ "PGA", NULL, "DAC"},
+	{ "ClassD", NULL, "PGA"},
+	{ "OUTP", NULL, "ClassD"},
+	{ "OUTN", NULL, "ClassD"},
+	{ "VI ADC", NULL, "ClassD"},
+	{ "aif_capture", NULL, "VI ADC"},
+};
+
+static int mt6660_component_get_volsw(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mt6660_chip *chip = (struct mt6660_chip *)
+		snd_soc_component_get_drvdata(component);
+	int ret = -EINVAL;
+
+	if (!strcmp(kcontrol->id.name, "Chip_Rev")) {
+		ucontrol->value.integer.value[0] = chip->chip_rev & 0x0f;
+		ret = 0;
+	}
+	return ret;
+}
+
+static const DECLARE_TLV_DB_SCALE(vol_ctl_tlv, -1155, 5, 0);
+
+static const struct snd_kcontrol_new mt6660_component_snd_controls[] = {
+	SOC_SINGLE_EXT_TLV("Digital Volume", MT6660_REG_VOL_CTRL, 0, 255,
+			   1, snd_soc_get_volsw, snd_soc_put_volsw,
+			   vol_ctl_tlv),
+	SOC_SINGLE_EXT("WDT Switch", MT6660_REG_WDT_CTRL, 7, 1, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("Hard Clip Switch", MT6660_REG_HCLIP_CTRL, 8, 1, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("Clip Switch", MT6660_REG_SPS_CTRL, 0, 1, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("BoostMode", MT6660_REG_BST_CTRL, 0, 3, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("DRE Switch", MT6660_REG_DRE_CTRL, 0, 1, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("DC_Protect Switch",
+		MT6660_REG_DC_PROTECT_CTRL, 3, 1, 0,
+		snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("audio input selection", MT6660_REG_DATAO_SEL, 6, 3, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("Data Output Left Channel Selection",
+		       MT6660_REG_DATAO_SEL, 3, 7, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("Data Output Right Channel Selection",
+		       MT6660_REG_DATAO_SEL, 0, 7, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	/* for debug purpose */
+	SOC_SINGLE_EXT("HPF AUD IN Switch", MT6660_REG_HPF_CTRL, 0, 1, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("AUD LOOP BACK Switch", MT6660_REG_PATH_BYPASS, 4, 1, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("Mute Switch", MT6660_REG_SYSTEM_CTRL, 1, 1, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("Bypass CS Comp Switch", MT6660_REG_PATH_BYPASS, 2, 1, 0,
+		       snd_soc_get_volsw, snd_soc_put_volsw),
+	SOC_SINGLE_EXT("T0 SEL", MT6660_REG_CALI_T0, 0, 7, 0,
+		       snd_soc_get_volsw, NULL),
+	SOC_SINGLE_EXT("Chip Rev", SND_SOC_NOPM, 0, 16, 0,
+		       mt6660_component_get_volsw, NULL),
+};
+
+static inline int _mt6660_chip_power_on(struct mt6660_chip *chip, int on_off)
+{
+	u8 reg_data = 0;
+	int ret = 0;
+
+	ret = i2c_smbus_read_byte_data(chip->i2c, MT6660_REG_SYSTEM_CTRL);
+	if (ret < 0)
+		return ret;
+	reg_data = (u8)ret;
+	if (on_off)
+		reg_data &= (~0x01);
+	else
+		reg_data |= 0x01;
+	return regmap_write(chip->regmap, MT6660_REG_SYSTEM_CTRL, reg_data);
+}
+
+static int mt6660_apply_plat_data(struct mt6660_chip *chip,
+		struct snd_soc_component *component)
+{
+	size_t i = 0;
+	int num = chip->plat_data.init_setting_num;
+	int ret = 0;
+
+	ret = _mt6660_chip_power_on(chip, 1);
+	if (ret < 0) {
+		dev_err(chip->dev, "%s power on failed\n", __func__);
+		return ret;
+	}
+
+	for (i = 0; i < num; i++) {
+		ret = snd_soc_component_update_bits(component,
+				chip->plat_data.init_setting_addr[i],
+				chip->plat_data.init_setting_mask[i],
+				chip->plat_data.init_setting_val[i]);
+		if (ret < 0)
+			return ret;
+	}
+	ret = _mt6660_chip_power_on(chip, 0);
+	if (ret < 0) {
+		dev_err(chip->dev, "%s power on failed\n", __func__);
+		return ret;
+	}
+	return 0;
+}
+
+static int mt6660_component_probe(struct snd_soc_component *component)
+{
+	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	dev_info(component->dev, "%s\n", __func__);
+	snd_soc_component_init_regmap(component, chip->regmap);
+
+	ret = mt6660_apply_plat_data(chip, component);
+	if (ret < 0)
+		dev_err(chip->dev, "mt6660 apply plat data failed\n");
+
+	return ret;
+}
+
+static void mt6660_component_remove(struct snd_soc_component *component)
+{
+	dev_info(component->dev, "%s\n", __func__);
+	snd_soc_component_exit_regmap(component);
+}
+
+static const struct snd_soc_component_driver mt6660_component_driver = {
+	.probe = mt6660_component_probe,
+	.remove = mt6660_component_remove,
+
+	.controls = mt6660_component_snd_controls,
+	.num_controls = ARRAY_SIZE(mt6660_component_snd_controls),
+	.dapm_widgets = mt6660_component_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt6660_component_dapm_widgets),
+	.dapm_routes = mt6660_component_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt6660_component_dapm_routes),
+
+	.idle_bias_on = false, /* idle_bias_off = true */
+};
+
+static int mt6660_component_aif_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
+{
+	int word_len = params_physical_width(hw_params);
+	int aud_bit = params_width(hw_params);
+	u16 reg_data = 0;
+	int ret = 0;
+
+	dev_dbg(dai->dev, "%s: ++\n", __func__);
+	dev_dbg(dai->dev, "format: 0x%08x\n", params_format(hw_params));
+	dev_dbg(dai->dev, "rate: 0x%08x\n", params_rate(hw_params));
+	dev_dbg(dai->dev, "word_len: %d, aud_bit: %d\n", word_len, aud_bit);
+	if (word_len > 32 || word_len < 16) {
+		dev_err(dai->dev, "not supported word length\n");
+		return -ENOTSUPP;
+	}
+	switch (aud_bit) {
+	case 16:
+		reg_data = 3;
+		break;
+	case 18:
+		reg_data = 2;
+		break;
+	case 20:
+		reg_data = 1;
+		break;
+	case 24:
+	case 32:
+		reg_data = 0;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+	ret = snd_soc_component_update_bits(dai->component,
+		MT6660_REG_SERIAL_CFG1, 0xc0, (reg_data << 6));
+	if (ret < 0) {
+		dev_err(dai->dev, "config aud bit fail\n");
+		return ret;
+	}
+	ret = snd_soc_component_update_bits(dai->component,
+		MT6660_REG_TDM_CFG3, 0x3f0, word_len << 4);
+	if (ret < 0) {
+		dev_err(dai->dev, "config word len fail\n");
+		return ret;
+	}
+	dev_dbg(dai->dev, "%s: --\n", __func__);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt6660_component_aif_ops = {
+	.hw_params = mt6660_component_aif_hw_params,
+};
+
+#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_U16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_U24_LE | \
+			SNDRV_PCM_FMTBIT_S32_LE | \
+			SNDRV_PCM_FMTBIT_U32_LE)
+
+static struct snd_soc_dai_driver mt6660_codec_dai = {
+	.name = "mt6660-aif",
+	.playback = {
+		.stream_name	= "aif_playback",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates		= STUB_RATES,
+		.formats	= STUB_FORMATS,
+	},
+	.capture = {
+		.stream_name	= "aif_capture",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates = STUB_RATES,
+		.formats = STUB_FORMATS,
+	},
+	/* dai properties */
+	.symmetric_rates = 1,
+	.symmetric_channels = 1,
+	.symmetric_samplebits = 1,
+	/* dai operations */
+	.ops = &mt6660_component_aif_ops,
+};
+
+static inline int _mt6660_chip_id_check(struct mt6660_chip *chip)
+{
+	u8 id[2] = {0};
+	int ret = 0;
+
+	ret = i2c_smbus_read_i2c_block_data(chip->i2c, MT6660_REG_DEVID, 2, id);
+	if (ret < 0)
+		return ret;
+	ret = (id[0] << 8) + id[1];
+	ret &= 0x0ff0;
+	if (ret != 0x00e0 && ret != 0x01e0)
+		return -ENODEV;
+	return ret;
+}
+
+static inline int _mt6660_chip_sw_reset(struct mt6660_chip *chip)
+{
+	int ret;
+
+	/* turn on main pll first, then trigger reset */
+	ret = regmap_write(chip->regmap, 0x03, 0x00);
+	if (ret < 0)
+		return ret;
+	ret = regmap_write(chip->regmap, MT6660_REG_SYSTEM_CTRL, 0x80);
+	msleep(30);
+	return 0;
+}
+
+static inline int _mt6660_read_chip_revision(struct mt6660_chip *chip)
+{
+	u8 reg_data[2] = {0};
+	int ret = 0;
+
+	ret = i2c_smbus_read_i2c_block_data(
+		chip->i2c, MT6660_REG_DEVID, 2, reg_data);
+	if (ret < 0) {
+		dev_err(chip->dev, "get chip revision fail\n");
+		return ret;
+	}
+	chip->chip_rev = reg_data[1];
+	return 0;
+}
+
+static int mt6660_parse_dt(struct mt6660_chip *chip, struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	u32 val;
+	size_t i = 0;
+
+	if (!np) {
+		dev_err(dev, "no device node\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(np, "rt,init_setting_num", &val)) {
+		dev_info(dev, "no init setting\n");
+		chip->plat_data.init_setting_num = 0;
+	} else {
+		chip->plat_data.init_setting_num = val;
+	}
+
+	chip->plat_data.init_setting_addr =
+		devm_kzalloc(dev, sizeof(u32) *
+				chip->plat_data.init_setting_num, GFP_KERNEL);
+	chip->plat_data.init_setting_mask =
+		devm_kzalloc(dev, sizeof(u32) *
+				chip->plat_data.init_setting_num, GFP_KERNEL);
+	chip->plat_data.init_setting_val =
+		devm_kzalloc(dev, sizeof(u32) *
+				chip->plat_data.init_setting_num, GFP_KERNEL);
+
+	if (of_property_read_u32_array(np, "rt,init_setting_addr",
+				chip->plat_data.init_setting_addr,
+				chip->plat_data.init_setting_num)) {
+		dev_info(dev, "no init setting addr\n");
+	}
+	if (of_property_read_u32_array(np, "rt,init_setting_mask",
+				chip->plat_data.init_setting_mask,
+				chip->plat_data.init_setting_num)) {
+		dev_info(dev, "no init setting addr\n");
+	}
+	if (of_property_read_u32_array(np, "rt,init_setting_val",
+				chip->plat_data.init_setting_val,
+				chip->plat_data.init_setting_num)) {
+		dev_info(dev, "no init setting addr\n");
+	}
+
+	dev_info(dev, "%s, init stting table, num = %d\n", __func__,
+		chip->plat_data.init_setting_num);
+	for (i = 0; i < chip->plat_data.init_setting_num; i++) {
+		dev_info(dev, "0x%02x, 0x%08x, 0x%08x\n",
+				chip->plat_data.init_setting_addr[i],
+				chip->plat_data.init_setting_mask[i],
+				chip->plat_data.init_setting_val[i]);
+	}
+	return 0;
+}
+
+static int mt6660_i2c_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	struct mt6660_chip *chip = NULL;
+	int ret = 0;
+
+	pr_info("%s start\n", __func__);
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+	chip->i2c = client;
+	chip->dev = &client->dev;
+	mutex_init(&chip->io_lock);
+	i2c_set_clientdata(client, chip);
+
+
+	ret = mt6660_parse_dt(chip, &client->dev);
+	if (ret < 0) {
+		dev_err(&client->dev, "parsing dts failed\n");
+		return ret;
+	}
+
+	chip->regmap = devm_regmap_init(&client->dev,
+		NULL, chip, &mt6660_regmap_config);
+	if (IS_ERR(chip->regmap)) {
+		ret = PTR_ERR(chip->regmap);
+		dev_err(&client->dev, "failed to initialise regmap: %d\n", ret);
+		return ret;
+	}
+
+	/* chip reset first */
+	ret = _mt6660_chip_sw_reset(chip);
+	if (ret < 0) {
+		dev_err(chip->dev, "chip reset fail\n");
+		goto probe_fail;
+	}
+	/* chip power on */
+	ret = _mt6660_chip_power_on(chip, 1);
+	if (ret < 0) {
+		dev_err(chip->dev, "chip power on 2 fail\n");
+		goto probe_fail;
+	}
+	/* chip devid check */
+	ret = _mt6660_chip_id_check(chip);
+	if (ret < 0) {
+		dev_err(chip->dev, "chip id check fail\n");
+		goto probe_fail;
+	}
+	/* chip revision get */
+	ret = _mt6660_read_chip_revision(chip);
+	if (ret < 0) {
+		dev_err(chip->dev, "read chip revision fail\n");
+		goto probe_fail;
+	}
+	pm_runtime_set_active(chip->dev);
+	pm_runtime_enable(chip->dev);
+
+	ret = devm_snd_soc_register_component(chip->dev,
+					       &mt6660_component_driver,
+					       &mt6660_codec_dai, 1);
+	pr_info("%s end, ret = %d\n", __func__, ret);
+	return ret;
+probe_fail:
+	_mt6660_chip_power_on(chip, 0);
+	mutex_destroy(&chip->io_lock);
+	return ret;
+}
+
+static int mt6660_i2c_remove(struct i2c_client *client)
+{
+	struct mt6660_chip *chip = i2c_get_clientdata(client);
+
+	pm_runtime_disable(chip->dev);
+	pm_runtime_set_suspended(chip->dev);
+	mutex_destroy(&chip->io_lock);
+	return 0;
+}
+
+static int __maybe_unused mt6660_i2c_runtime_suspend(struct device *dev)
+{
+	struct mt6660_chip *chip = dev_get_drvdata(dev);
+
+	dev_info(dev, "enter low power mode\n");
+	return regmap_update_bits(chip->regmap,
+		MT6660_REG_SYSTEM_CTRL, 0x01, 0x01);
+}
+
+static int __maybe_unused mt6660_i2c_runtime_resume(struct device *dev)
+{
+	struct mt6660_chip *chip = dev_get_drvdata(dev);
+
+	dev_info(dev, "exit low power mode\n");
+	return regmap_update_bits(chip->regmap,
+		MT6660_REG_SYSTEM_CTRL, 0x01, 0x00);
+}
+
+static const struct dev_pm_ops mt6660_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(mt6660_i2c_runtime_suspend,
+			   mt6660_i2c_runtime_resume, NULL)
+};
+
+static const struct of_device_id __maybe_unused mt6660_of_id[] = {
+	{ .compatible = "mediatek,mt6660",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt6660_of_id);
+
+static const struct i2c_device_id mt6660_i2c_id[] = {
+	{"mt6660", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, mt6660_i2c_id);
+
+static struct i2c_driver mt6660_i2c_driver = {
+	.driver = {
+		.name = "mt6660",
+		.of_match_table = of_match_ptr(mt6660_of_id),
+		.pm = &mt6660_dev_pm_ops,
+	},
+	.probe = mt6660_i2c_probe,
+	.remove = mt6660_i2c_remove,
+	.id_table = mt6660_i2c_id,
+};
+module_i2c_driver(mt6660_i2c_driver);
+
+MODULE_AUTHOR("Jeff Chang <jeff_chang@richtek.com>");
+MODULE_DESCRIPTION("MT6660 SPKAMP Driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("1.0.7_G");
diff --git a/sound/soc/codecs/mt6660.h b/sound/soc/codecs/mt6660.h
new file mode 100644
index 0000000..6c40b40
--- /dev/null
+++ b/sound/soc/codecs/mt6660.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __SND_SOC_MT6660_H
+#define __SND_SOC_MT6660_H
+
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+struct mt6660_platform_data {
+	u8 init_setting_num;
+	u32 *init_setting_addr;
+	u32 *init_setting_mask;
+	u32 *init_setting_val;
+};
+
+struct mt6660_chip {
+	struct i2c_client *i2c;
+	struct device *dev;
+	struct platform_device *param_dev;
+	struct mt6660_platform_data plat_data;
+	struct mutex io_lock;
+	struct regmap *regmap;
+	u16 chip_rev;
+};
+
+#define MT6660_REG_DEVID		(0x00)
+#define MT6660_REG_SYSTEM_CTRL		(0x03)
+#define MT6660_REG_IRQ_STATUS1		(0x05)
+#define MT6660_REG_ADDA_CLOCK		(0x07)
+#define MT6660_REG_SERIAL_CFG1		(0x10)
+#define MT6660_REG_DATAO_SEL		(0x12)
+#define MT6660_REG_TDM_CFG3		(0x15)
+#define MT6660_REG_HPF_CTRL		(0x18)
+#define MT6660_REG_HPF1_COEF		(0x1A)
+#define MT6660_REG_HPF2_COEF		(0x1B)
+#define MT6660_REG_PATH_BYPASS		(0x1E)
+#define MT6660_REG_WDT_CTRL		(0x20)
+#define MT6660_REG_HCLIP_CTRL		(0x24)
+#define MT6660_REG_VOL_CTRL		(0x29)
+#define MT6660_REG_SPS_CTRL		(0x30)
+#define MT6660_REG_SIGMAX		(0x33)
+#define MT6660_REG_CALI_T0		(0x3F)
+#define MT6660_REG_BST_CTRL		(0x40)
+#define MT6660_REG_PROTECTION_CFG	(0x46)
+#define MT6660_REG_DA_GAIN		(0x4c)
+#define MT6660_REG_AUDIO_IN2_SEL	(0x50)
+#define MT6660_REG_SIG_GAIN		(0x51)
+#define MT6660_REG_PLL_CFG1		(0x60)
+#define MT6660_REG_DRE_CTRL		(0x68)
+#define MT6660_REG_DRE_THDMODE		(0x69)
+#define MT6660_REG_DRE_CORASE		(0x6B)
+#define MT6660_REG_PWM_CTRL		(0x70)
+#define MT6660_REG_DC_PROTECT_CTRL	(0x74)
+#define MT6660_REG_ADC_USB_MODE		(0x7c)
+#define MT6660_REG_INTERNAL_CFG		(0x88)
+#define MT6660_REG_RESV0		(0x98)
+#define MT6660_REG_RESV1		(0x99)
+#define MT6660_REG_RESV2		(0x9A)
+#define MT6660_REG_RESV3		(0x9B)
+#define MT6660_REG_RESV6		(0xA2)
+#define MT6660_REG_RESV7		(0xA3)
+#define MT6660_REG_RESV10		(0xB0)
+#define MT6660_REG_RESV11		(0xB1)
+#define MT6660_REG_RESV16		(0xB6)
+#define MT6660_REG_RESV17		(0xB7)
+#define MT6660_REG_RESV19		(0xB9)
+#define MT6660_REG_RESV21		(0xBB)
+#define MT6660_REG_RESV23		(0xBD)
+#define MT6660_REG_RESV31		(0xD3)
+#define MT6660_REG_RESV40		(0xE0)
+
+#endif /* __SND_SOC_MT6660_H */
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

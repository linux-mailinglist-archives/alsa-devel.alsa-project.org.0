Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C53B8B50
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 09:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6AC51679;
	Fri, 20 Sep 2019 08:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6AC51679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568962840;
	bh=sJkCivohAsFGaz0fv3Xznt01/GiYlA3rvO6/sXtc9ww=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fr3/LBILl3ndx1f3/xsGY8WQXmZzvD943GNSINoig8rnrz5By5Fdth+kGVjALydpu
	 H18AnyLiziOLLH3xyly2xMjqE4juY0zbslwD50WGg2int51riDG+1UNyL5XVV/zmDf
	 PDni3/QAWfO+In2qTUHHtsylE0CJUqJccZ8AzwFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E84BF80527;
	Fri, 20 Sep 2019 08:58:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3955FF80519; Fri, 20 Sep 2019 08:58:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail2.thundersoft.com (unknown [114.242.213.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22516F80146
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 08:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22516F80146
Received: from localhost (unknown [192.168.122.240])
 by mail2.thundersoft.com (Postfix) with ESMTPA id 4B7E51520AFE;
 Fri, 20 Sep 2019 14:58:35 +0800 (CST)
From: shifu0704@thundersoft.com
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 robh+dt@kernel.org
Date: Fri, 20 Sep 2019 14:58:29 +0800
Message-Id: <1568962709-19185-2-git-send-email-shifu0704@thundersoft.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568962709-19185-1-git-send-email-shifu0704@thundersoft.com>
References: <1568962709-19185-1-git-send-email-shifu0704@thundersoft.com>
Cc: Frank Shi <shifu0704@thundersoft.com>, dmurphy@ti.com, navada@ti.com
Subject: [alsa-devel] [PATCH v7] tas2770: add tas2770 smart PA kernel driver
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

From: Frank Shi <shifu0704@thundersoft.com>

add tas2770 smart PA kernel driver

Signed-off-by: Frank Shi <shifu0704@thundersoft.com>
---
 sound/soc/codecs/Kconfig   |   5 +
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/tas2770.c | 808 +++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/tas2770.h | 164 +++++++++
 4 files changed, 979 insertions(+)
 create mode 100644 sound/soc/codecs/tas2770.c
 create mode 100644 sound/soc/codecs/tas2770.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8f3e787..cc92da3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -111,6 +111,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_STAC9766 if SND_SOC_AC97_BUS
 	select SND_SOC_STI_SAS
 	select SND_SOC_TAS2552 if I2C
+	select SND_SOC_TAS2770 if I2C
 	select SND_SOC_TAS5086 if I2C
 	select SND_SOC_TAS571X if I2C
 	select SND_SOC_TFA9879 if I2C
@@ -652,6 +653,10 @@ config SND_SOC_TAS2552
 	tristate "Texas Instruments TAS2552 Mono Audio amplifier"
 	depends on I2C
 
+config SND_SOC_TAS2770
+	tristate "Texas Instruments TAS2770 speaker amplifier"
+	depends on I2C
+
 config SND_SOC_TAS5086
 	tristate "Texas Instruments TAS5086 speaker amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 5305cc6..63b8488 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -116,6 +116,7 @@ snd-soc-stac9766-objs := stac9766.o
 snd-soc-sti-sas-objs := sti-sas.o
 snd-soc-tas5086-objs := tas5086.o
 snd-soc-tas571x-objs := tas571x.o
+snd-soc-tas2770-objs := tas2770.o
 snd-soc-tfa9879-objs := tfa9879.o
 snd-soc-tlv320aic23-objs := tlv320aic23.o
 snd-soc-tlv320aic23-i2c-objs := tlv320aic23-i2c.o
@@ -332,6 +333,7 @@ obj-$(CONFIG_SND_SOC_STI_SAS)	+= snd-soc-sti-sas.o
 obj-$(CONFIG_SND_SOC_TAS2552)	+= snd-soc-tas2552.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
+obj-$(CONFIG_SND_SOC_TAS2770) += snd-soc-tas2770.o
 obj-$(CONFIG_SND_SOC_TFA9879)	+= snd-soc-tfa9879.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23)	+= snd-soc-tlv320aic23.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23_I2C)	+= snd-soc-tlv320aic23-i2c.o
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
new file mode 100644
index 0000000..9da88cc
--- /dev/null
+++ b/sound/soc/codecs/tas2770.c
@@ -0,0 +1,808 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// ALSA SoC Texas Instruments TAS2770 20-W Digital Input Mono Class-D
+// Audio Amplifier with Speaker I/V Sense
+//
+// Copyright (C) 2016-2017 Texas Instruments Incorporated - http://www.ti.com/
+//	Author: Tracy Yi <tracy-yi@ti.com>
+//	Frank Shi <shifu0704@thundersoft.com>
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/pm.h>
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/firmware.h>
+#include <linux/regmap.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/slab.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/initval.h>
+#include <sound/tlv.h>
+
+#include "tas2770.h"
+
+#define TAS2770_MDELAY 0xFFFFFFFE
+
+static void tas2770_reset(struct tas2770_priv *tas2770)
+{
+	if (tas2770->reset_gpio) {
+		gpiod_set_value_cansleep(tas2770->reset_gpio, 0);
+		msleep(20);
+		gpiod_set_value_cansleep(tas2770->reset_gpio, 1);
+	}
+	snd_soc_component_write(tas2770->component, TAS2770_SW_RST,
+		TAS2770_RST);
+}
+
+static int tas2770_set_bias_level(struct snd_soc_component *component,
+				 enum snd_soc_bias_level level)
+{
+	struct tas2770_priv *tas2770 =
+			snd_soc_component_get_drvdata(component);
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		snd_soc_component_update_bits(component,
+			TAS2770_PWR_CTRL,
+			TAS2770_PWR_CTRL_MASK,
+			TAS2770_PWR_CTRL_ACTIVE);
+		break;
+
+	case SND_SOC_BIAS_OFF:
+		snd_soc_component_update_bits(component,
+			TAS2770_PWR_CTRL,
+			TAS2770_PWR_CTRL_MASK,
+			TAS2770_PWR_CTRL_SHUTDOWN);
+		break;
+
+	default:
+		dev_err(tas2770->dev,
+				"wrong power level setting %d\n", level);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int tas2770_codec_suspend(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = snd_soc_component_update_bits(component,
+		TAS2770_PWR_CTRL,
+		TAS2770_PWR_CTRL_MASK,
+		TAS2770_PWR_CTRL_SHUTDOWN);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int tas2770_codec_resume(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = snd_soc_component_update_bits(component,
+		TAS2770_PWR_CTRL,
+		TAS2770_PWR_CTRL_MASK,
+		TAS2770_PWR_CTRL_ACTIVE);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+#else
+#define tas2770_codec_suspend NULL
+#define tas2770_codec_resume NULL
+#endif
+
+static const char * const tas2770_ASI1_src[] = {
+	"I2C offset", "Left", "Right", "LeftRightDiv2",
+};
+
+static SOC_ENUM_SINGLE_DECL(
+	tas2770_ASI1_src_enum, TAS2770_TDM_CFG_REG2,
+	4, tas2770_ASI1_src);
+
+static const struct snd_kcontrol_new tas2770_asi1_mux =
+	SOC_DAPM_ENUM("ASI1 Source", tas2770_ASI1_src_enum);
+
+static int tas2770_dac_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+			snd_soc_dapm_to_component(w->dapm);
+	struct tas2770_priv *tas2770 =
+			snd_soc_component_get_drvdata(component);
+	int ret;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_PWR_CTRL,
+			TAS2770_PWR_CTRL_MASK,
+			TAS2770_PWR_CTRL_MUTE);
+		if (ret)
+			goto end;
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_PWR_CTRL,
+			TAS2770_PWR_CTRL_MASK,
+			TAS2770_PWR_CTRL_SHUTDOWN);
+		if (ret)
+			goto end;
+		break;
+	default:
+		dev_err(tas2770->dev, "Not supported evevt\n");
+		return -EINVAL;
+	}
+
+end:
+	return ret;
+}
+
+static const struct snd_kcontrol_new isense_switch =
+	SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 3, 1, 1);
+static const struct snd_kcontrol_new vsense_switch =
+	SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 2, 1, 1);
+
+static const struct snd_soc_dapm_widget tas2770_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0,
+				&tas2770_asi1_mux),
+	SND_SOC_DAPM_SWITCH("ISENSE", TAS2770_PWR_CTRL, 3, 1,
+			&isense_switch),
+	SND_SOC_DAPM_SWITCH("VSENSE", TAS2770_PWR_CTRL, 2, 1,
+			&vsense_switch),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2770_dac_event,
+	SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+	SND_SOC_DAPM_SIGGEN("VMON"),
+	SND_SOC_DAPM_SIGGEN("IMON")
+};
+
+static const struct snd_soc_dapm_route tas2770_audio_map[] = {
+	{"ASI1 Sel", "I2C offset", "ASI1"},
+	{"ASI1 Sel", "Left", "ASI1"},
+	{"ASI1 Sel", "Right", "ASI1"},
+	{"ASI1 Sel", "LeftRightDiv2", "ASI1"},
+	{"DAC", NULL, "ASI1 Sel"},
+	{"OUT", NULL, "DAC"},
+	{"ISENSE", "Switch", "IMON"},
+	{"VSENSE", "Switch", "VMON"},
+};
+
+static int tas2770_mute(struct snd_soc_dai *dai, int mute)
+{
+	struct snd_soc_component *component = dai->component;
+	int ret;
+
+	if (mute)
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_PWR_CTRL,
+			TAS2770_PWR_CTRL_MASK,
+			TAS2770_PWR_CTRL_MUTE);
+	else
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_PWR_CTRL,
+			TAS2770_PWR_CTRL_MASK,
+			TAS2770_PWR_CTRL_ACTIVE);
+
+	return ret;
+}
+
+static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
+{
+	int ret;
+	struct snd_soc_component *component = tas2770->component;
+
+	switch (bitwidth) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG2,
+			TAS2770_TDM_CFG_REG2_RXW_MASK,
+			TAS2770_TDM_CFG_REG2_RXW_16BITS);
+		tas2770->v_sense_slot = tas2770->i_sense_slot + 2;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG2,
+			TAS2770_TDM_CFG_REG2_RXW_MASK,
+			TAS2770_TDM_CFG_REG2_RXW_24BITS);
+		tas2770->v_sense_slot = tas2770->i_sense_slot + 4;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG2,
+			TAS2770_TDM_CFG_REG2_RXW_MASK,
+			TAS2770_TDM_CFG_REG2_RXW_32BITS);
+		tas2770->v_sense_slot = tas2770->i_sense_slot + 4;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	tas2770->channel_size = bitwidth;
+
+	ret = snd_soc_component_update_bits(component,
+		TAS2770_TDM_CFG_REG5,
+		TAS2770_TDM_CFG_REG5_VSNS_MASK |
+		TAS2770_TDM_CFG_REG5_50_MASK,
+		TAS2770_TDM_CFG_REG5_VSNS_ENABLE |
+		tas2770->v_sense_slot);
+	if (ret)
+		goto end;
+	ret = snd_soc_component_update_bits(component,
+		TAS2770_TDM_CFG_REG6,
+		TAS2770_TDM_CFG_REG6_ISNS_MASK |
+		TAS2770_TDM_CFG_REG6_50_MASK,
+		TAS2770_TDM_CFG_REG6_ISNS_ENABLE |
+		tas2770->i_sense_slot);
+
+end:
+	return ret;
+}
+
+static int tas2770_set_samplerate(struct tas2770_priv *tas2770, int samplerate)
+{
+	int ret;
+	struct snd_soc_component *component = tas2770->component;
+
+	switch (samplerate) {
+	case 48000:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_SMP_MASK,
+			TAS2770_TDM_CFG_REG0_SMP_48KHZ);
+		if (ret)
+			goto end;
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_31_MASK,
+			TAS2770_TDM_CFG_REG0_31_44_1_48KHZ);
+		if (ret)
+			goto end;
+		break;
+	case 44100:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_SMP_MASK,
+			TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
+		if (ret)
+			goto end;
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_31_MASK,
+			TAS2770_TDM_CFG_REG0_31_44_1_48KHZ);
+		if (ret)
+			goto end;
+		break;
+	case 96000:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_SMP_MASK,
+			TAS2770_TDM_CFG_REG0_SMP_48KHZ);
+		if (ret)
+			goto end;
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_31_MASK,
+			TAS2770_TDM_CFG_REG0_31_88_2_96KHZ);
+		break;
+	case 88200:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_SMP_MASK,
+			TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
+		if (ret)
+			goto end;
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_31_MASK,
+			TAS2770_TDM_CFG_REG0_31_88_2_96KHZ);
+		break;
+	case 19200:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_SMP_MASK,
+			TAS2770_TDM_CFG_REG0_SMP_48KHZ);
+		if (ret)
+			goto end;
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_31_MASK,
+			TAS2770_TDM_CFG_REG0_31_176_4_192KHZ);
+		if (ret)
+			goto end;
+		break;
+	case 17640:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_SMP_MASK,
+			TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
+		if (ret)
+			goto end;
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG0,
+			TAS2770_TDM_CFG_REG0_31_MASK,
+			TAS2770_TDM_CFG_REG0_31_176_4_192KHZ);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+end:
+	if (!ret)
+		tas2770->sampling_rate = samplerate;
+	return ret;
+}
+
+static int tas2770_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2770_priv *tas2770 =
+			snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = tas2770_set_bitwidth(tas2770, params_format(params));
+	if (ret < 0)
+		goto end;
+
+
+	ret = tas2770_set_samplerate(tas2770, params_rate(params));
+
+end:
+	return ret;
+}
+
+static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
+	int ret;
+	int value = 0;
+	struct snd_soc_component *component = dai->component;
+	struct tas2770_priv *tas2770 =
+			snd_soc_component_get_drvdata(component);
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	default:
+		dev_err(tas2770->dev, "ASI format master is not found\n");
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_RSING;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_FALING;
+		break;
+	default:
+		dev_err(tas2770->dev, "ASI format Inverse is not found\n");
+		return -EINVAL;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG1,
+		TAS2770_TDM_CFG_REG1_RX_MASK,
+		asi_cfg_1);
+	if (ret)
+		return ret;
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		tdm_rx_start_slot = 1;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		tdm_rx_start_slot = 0;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		tdm_rx_start_slot = 1;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		tdm_rx_start_slot = 0;
+		break;
+	default:
+		dev_err(tas2770->dev,
+			"DAI Format is not found, fmt=0x%x\n", fmt);
+		return -EINVAL;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG1,
+		TAS2770_TDM_CFG_REG1_MASK,
+	(tdm_rx_start_slot << TAS2770_TDM_CFG_REG1_51_SHIFT));
+	if (ret)
+		return ret;
+
+	value = snd_soc_component_read32(component, TAS2770_TDM_CFG_REG3);
+
+	tas2770->asi_format = fmt;
+
+	return 0;
+}
+
+static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
+				unsigned int tx_mask,
+				unsigned int rx_mask,
+				int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2770_priv *tas2770 =
+			snd_soc_component_get_drvdata(component);
+	int left_slot, right_slot;
+	int ret;
+
+	if (tx_mask == 0 || rx_mask != 0)
+		return -EINVAL;
+
+	if (slots == 1) {
+		if (tx_mask != 1)
+			return -EINVAL;
+		left_slot = 0;
+		right_slot = 0;
+	} else {
+		left_slot = __ffs(tx_mask);
+		tx_mask &= ~(1 << left_slot);
+		if (tx_mask == 0) {
+			right_slot = left_slot;
+		} else {
+			right_slot = __ffs(tx_mask);
+			tx_mask &= ~(1 << right_slot);
+		}
+	}
+
+	if (tx_mask != 0 || left_slot >= slots || right_slot >= slots)
+		return -EINVAL;
+
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG3,
+		TAS2770_TDM_CFG_REG3_30_MASK,
+		(left_slot << TAS2770_TDM_CFG_REG3_30_SHIFT));
+	if (ret)
+		return ret;
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG3,
+		TAS2770_TDM_CFG_REG3_RXS_MASK,
+	(right_slot << TAS2770_TDM_CFG_REG3_RXS_SHIFT));
+	if (ret)
+		return ret;
+
+	switch (slot_width) {
+	case 16:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG2,
+			TAS2770_TDM_CFG_REG2_RXS_MASK,
+			TAS2770_TDM_CFG_REG2_RXS_16BITS);
+		break;
+
+	case 24:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG2,
+			TAS2770_TDM_CFG_REG2_RXS_MASK,
+			TAS2770_TDM_CFG_REG2_RXS_24BITS);
+		break;
+
+	case 32:
+		ret = snd_soc_component_update_bits(component,
+			TAS2770_TDM_CFG_REG2,
+			TAS2770_TDM_CFG_REG2_RXS_MASK,
+			TAS2770_TDM_CFG_REG2_RXS_32BITS);
+		break;
+
+	case 0:
+		/* Do not change slot width */
+		ret = 0;
+		break;
+
+	default:
+		ret = -EINVAL;
+	}
+
+	if (!ret)
+		tas2770->slot_width = slot_width;
+
+	return ret;
+}
+
+static struct snd_soc_dai_ops tas2770_dai_ops = {
+	.digital_mute = tas2770_mute,
+	.hw_params  = tas2770_hw_params,
+	.set_fmt    = tas2770_set_fmt,
+	.set_tdm_slot = tas2770_set_dai_tdm_slot,
+};
+
+#define TAS2770_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
+		SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+#define TAS2770_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
+					   SNDRV_PCM_RATE_96000 |\
+					    SNDRV_PCM_RATE_192000\
+					  )
+
+static struct snd_soc_dai_driver tas2770_dai_driver[] = {
+	{
+		.name = "tas2770 ASI1",
+		.id = 0,
+		.playback = {
+			.stream_name    = "ASI1 Playback",
+			.channels_min   = 2,
+			.channels_max   = 2,
+			.rates      = TAS2770_RATES,
+			.formats    = TAS2770_FORMATS,
+		},
+		.capture = {
+			.stream_name    = "ASI1 Capture",
+			.channels_min   = 0,
+			.channels_max   = 2,
+			.rates          = TAS2770_RATES,
+			.formats    = TAS2770_FORMATS,
+		},
+		.ops = &tas2770_dai_ops,
+		.symmetric_rates = 1,
+	},
+};
+
+static int tas2770_codec_probe(struct snd_soc_component *component)
+{
+	struct tas2770_priv *tas2770 =
+			snd_soc_component_get_drvdata(component);
+
+	tas2770->component = component;
+
+	return 0;
+}
+
+static DECLARE_TLV_DB_SCALE(tas2770_digital_tlv, 1100, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas2770_playback_volume, -12750, 50, 0);
+
+static const struct snd_kcontrol_new tas2770_snd_controls[] = {
+	SOC_SINGLE_TLV("Speaker Playback Volume", TAS2770_PLAY_CFG_REG2,
+		0, TAS2770_PLAY_CFG_REG2_VMAX, 1,
+		tas2770_playback_volume),
+	SOC_SINGLE_TLV("Amp Gain Volume", TAS2770_PLAY_CFG_REG0,
+		0, 0x14, 0,
+		tas2770_digital_tlv),
+};
+
+static const struct snd_soc_component_driver soc_component_driver_tas2770 = {
+	.probe			= tas2770_codec_probe,
+	.suspend		= tas2770_codec_suspend,
+	.resume			= tas2770_codec_resume,
+	.set_bias_level = tas2770_set_bias_level,
+	.controls		= tas2770_snd_controls,
+	.num_controls		= ARRAY_SIZE(tas2770_snd_controls),
+	.dapm_widgets		= tas2770_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tas2770_dapm_widgets),
+	.dapm_routes		= tas2770_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(tas2770_audio_map),
+	.idle_bias_on		= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static int tas2770_register_codec(struct tas2770_priv *tas2770)
+{
+	return devm_snd_soc_register_component(tas2770->dev,
+		&soc_component_driver_tas2770,
+		tas2770_dai_driver, ARRAY_SIZE(tas2770_dai_driver));
+}
+
+static const struct reg_default tas2770_reg_defaults[] = {
+	{ TAS2770_PAGE, 0x00 },
+	{ TAS2770_SW_RST, 0x00 },
+	{ TAS2770_PWR_CTRL, 0x0e },
+	{ TAS2770_PLAY_CFG_REG0, 0x10 },
+	{ TAS2770_PLAY_CFG_REG1, 0x01 },
+	{ TAS2770_PLAY_CFG_REG2, 0x00 },
+	{ TAS2770_MSC_CFG_REG0, 0x07 },
+	{ TAS2770_TDM_CFG_REG1, 0x02 },
+	{ TAS2770_TDM_CFG_REG2, 0x0a },
+	{ TAS2770_TDM_CFG_REG3, 0x10 },
+	{ TAS2770_INT_MASK_REG0, 0xfc },
+	{ TAS2770_INT_MASK_REG1, 0xb1 },
+	{ TAS2770_INT_CFG, 0x05 },
+	{ TAS2770_MISC_IRQ, 0x81 },
+	{ TAS2770_CLK_CGF, 0x0c },
+
+};
+
+static bool tas2770_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TAS2770_PAGE: /* regmap implementation requires this */
+	case TAS2770_SW_RST: /* always clears after write */
+	case TAS2770_BO_PRV_REG0:/* has a self clearing bit */
+	case TAS2770_LVE_INT_REG0:
+	case TAS2770_LVE_INT_REG1:
+	case TAS2770_LAT_INT_REG0:/* Sticky interrupt flags */
+	case TAS2770_LAT_INT_REG1:/* Sticky interrupt flags */
+	case TAS2770_VBAT_MSB:
+	case TAS2770_VBAT_LSB:
+	case TAS2770_TEMP_MSB:
+	case TAS2770_TEMP_LSB:
+		return true;
+	}
+	return false;
+}
+
+static bool tas2770_writeable(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TAS2770_LVE_INT_REG0:
+	case TAS2770_LVE_INT_REG1:
+	case TAS2770_LAT_INT_REG0:
+	case TAS2770_LAT_INT_REG1:
+	case TAS2770_VBAT_MSB:
+	case TAS2770_VBAT_LSB:
+	case TAS2770_TEMP_MSB:
+	case TAS2770_TEMP_LSB:
+	case TAS2770_TDM_CLK_DETC:
+	case TAS2770_REV_AND_GPID:
+		return false;
+	}
+	return true;
+}
+
+static const struct regmap_range_cfg tas2770_regmap_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = 1 * 128,
+		.selector_reg = TAS2770_PAGE,
+		.selector_mask = 0xff,
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = 128,
+	},
+};
+
+static const struct regmap_config tas2770_i2c_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = tas2770_writeable,
+	.volatile_reg = tas2770_volatile,
+	.reg_defaults = tas2770_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas2770_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.ranges = tas2770_regmap_ranges,
+	.num_ranges = ARRAY_SIZE(tas2770_regmap_ranges),
+	.max_register = 1 * 128,
+};
+
+static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
+{
+	int rc = 0;
+
+	rc = fwnode_property_read_u32(dev->fwnode, "ti,asi-format",
+					&tas2770->asi_format);
+	if (rc) {
+		dev_err(tas2770->dev, "Looking up %s property failed %d\n",
+			"ti,asi-format", rc);
+		goto end;
+	}
+
+	rc = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
+			&tas2770->i_sense_slot);
+	if (rc) {
+		dev_err(tas2770->dev, "Looking up %s property failed %d\n",
+			"ti,imon-slot-no", rc);
+		goto end;
+	}
+
+	rc = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
+				&tas2770->v_sense_slot);
+	if (rc) {
+		dev_err(tas2770->dev, "Looking up %s property failed %d\n",
+			"ti,vmon-slot-no", rc);
+		goto end;
+	}
+
+end:
+	return rc;
+}
+
+static int tas2770_i2c_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct tas2770_priv *tas2770;
+	int result;
+
+	tas2770 = devm_kzalloc(&client->dev,
+		sizeof(struct tas2770_priv), GFP_KERNEL);
+	if (!tas2770)
+		return -ENOMEM;
+	tas2770->dev = &client->dev;
+
+	i2c_set_clientdata(client, tas2770);
+	dev_set_drvdata(&client->dev, tas2770);
+	tas2770->power_state = TAS2770_POWER_SHUTDOWN;
+
+	tas2770->regmap = devm_regmap_init_i2c(client, &tas2770_i2c_regmap);
+	if (IS_ERR(tas2770->regmap)) {
+		result = PTR_ERR(tas2770->regmap);
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+					result);
+		goto end;
+	}
+
+	if (client->dev.of_node) {
+		result = tas2770_parse_dt(&client->dev, tas2770);
+		if (result) {
+			dev_err(tas2770->dev, "%s: Failed to parse devicetree\n",
+				__func__);
+			goto end;
+		}
+	}
+
+	tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev,
+							  "reset-gpio",
+						      GPIOD_OUT_HIGH);
+		if (IS_ERR(tas2770->reset_gpio)) {
+			if (PTR_ERR(tas2770->reset_gpio) == -EPROBE_DEFER) {
+				tas2770->reset_gpio = NULL;
+				return -EPROBE_DEFER;
+			}
+		}
+
+	tas2770->channel_size = 0;
+	tas2770->slot_width = 0;
+
+	tas2770_reset(tas2770);
+
+	result = tas2770_register_codec(tas2770);
+	if (result)
+		dev_err(tas2770->dev, "Register codec failed.\n");
+
+end:
+	return result;
+}
+
+static int tas2770_i2c_remove(struct i2c_client *client)
+{
+	pm_runtime_disable(&client->dev);
+	return 0;
+}
+
+
+static const struct i2c_device_id tas2770_i2c_id[] = {
+	{ "tas2770", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
+
+#if defined(CONFIG_OF)
+static const struct of_device_id tas2770_of_match[] = {
+	{ .compatible = "ti,tas2770" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tas2770_of_match);
+#endif
+
+static struct i2c_driver tas2770_i2c_driver = {
+	.driver = {
+		.name   = "tas2770",
+		.owner  = THIS_MODULE,
+		.of_match_table = of_match_ptr(tas2770_of_match),
+	},
+	.probe      = tas2770_i2c_probe,
+	.remove     = tas2770_i2c_remove,
+	.id_table   = tas2770_i2c_id,
+};
+
+module_i2c_driver(tas2770_i2c_driver);
+
+MODULE_AUTHOR("Shi Fu <shifu0704@thundersoft.com>");
+MODULE_DESCRIPTION("TAS2770 I2C Smart Amplifier driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
new file mode 100644
index 0000000..d597a82
--- /dev/null
+++ b/sound/soc/codecs/tas2770.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * ALSA SoC TAS2770 codec driver
+ *
+ *  Copyright (C) 2016-2017 Texas Instruments Incorporated - http://www.ti.com/
+ */
+#ifndef __TAS2770__
+#define __TAS2770__
+
+/* Book Control Register (available in page0 of each book) */
+#define TAS2770_BOOKCTL_PAGE            0
+#define TAS2770_BOOKCTL_REG         127
+#define TAS2770_REG(page, reg)        ((page * 128) + reg)
+    /* Page */
+#define TAS2770_PAGE  TAS2770_REG(0X0, 0x00)
+#define TAS2770_PAGE_PAGE_MASK  255
+    /* Software Reset */
+#define TAS2770_SW_RST  TAS2770_REG(0X0, 0x01)
+#define TAS2770_RST  BIT(0)
+    /* Power Control */
+#define TAS2770_PWR_CTRL  TAS2770_REG(0X0, 0x02)
+#define TAS2770_PWR_CTRL_MASK  0x3
+#define TAS2770_PWR_CTRL_ACTIVE  0x0
+#define TAS2770_PWR_CTRL_MUTE  BIT(0)
+#define TAS2770_PWR_CTRL_SHUTDOWN  0x2
+    /* Playback Configuration Reg0 */
+#define TAS2770_PLAY_CFG_REG0  TAS2770_REG(0X0, 0x03)
+    /* Playback Configuration Reg1 */
+#define TAS2770_PLAY_CFG_REG1  TAS2770_REG(0X0, 0x04)
+    /* Playback Configuration Reg2 */
+#define TAS2770_PLAY_CFG_REG2  TAS2770_REG(0X0, 0x05)
+#define TAS2770_PLAY_CFG_REG2_VMAX 0xc9
+    /* Misc Configuration Reg0 */
+#define TAS2770_MSC_CFG_REG0  TAS2770_REG(0X0, 0x07)
+    /* TDM Configuration Reg0 */
+#define TAS2770_TDM_CFG_REG0  TAS2770_REG(0X0, 0x0A)
+#define TAS2770_TDM_CFG_REG0_SMP_MASK  BIT(5)
+#define TAS2770_TDM_CFG_REG0_SMP_48KHZ  0x0
+#define TAS2770_TDM_CFG_REG0_SMP_44_1KHZ  BIT(5)
+#define TAS2770_TDM_CFG_REG0_31_MASK  0xe
+#define TAS2770_TDM_CFG_REG0_31_44_1_48KHZ  0x6
+#define TAS2770_TDM_CFG_REG0_31_88_2_96KHZ  0x8
+#define TAS2770_TDM_CFG_REG0_31_176_4_192KHZ  0xa
+    /* TDM Configuration Reg1 */
+#define TAS2770_TDM_CFG_REG1  TAS2770_REG(0X0, 0x0B)
+#define TAS2770_TDM_CFG_REG1_MASK 0x3e
+#define TAS2770_TDM_CFG_REG1_51_SHIFT  1
+#define TAS2770_TDM_CFG_REG1_RX_MASK  BIT(0)
+#define TAS2770_TDM_CFG_REG1_RX_RSING  0x0
+#define TAS2770_TDM_CFG_REG1_RX_FALING  BIT(0)
+    /* TDM Configuration Reg2 */
+#define TAS2770_TDM_CFG_REG2  TAS2770_REG(0X0, 0x0C)
+#define TAS2770_TDM_CFG_REG2_RXW_MASK  0xc
+#define TAS2770_TDM_CFG_REG2_RXW_16BITS  0x0
+#define TAS2770_TDM_CFG_REG2_RXW_24BITS  0x8
+#define TAS2770_TDM_CFG_REG2_RXW_32BITS  0xc
+#define TAS2770_TDM_CFG_REG2_RXS_MASK    0x3
+#define TAS2770_TDM_CFG_REG2_RXS_16BITS  0x0
+#define TAS2770_TDM_CFG_REG2_RXS_24BITS  BIT(0)
+#define TAS2770_TDM_CFG_REG2_RXS_32BITS  0x2
+    /* TDM Configuration Reg3 */
+#define TAS2770_TDM_CFG_REG3  TAS2770_REG(0X0, 0x0D)
+#define TAS2770_TDM_CFG_REG3_RXS_MASK  0xf0
+#define TAS2770_TDM_CFG_REG3_RXS_SHIFT 0x4
+#define TAS2770_TDM_CFG_REG3_30_MASK  0xf
+#define TAS2770_TDM_CFG_REG3_30_SHIFT 0
+    /* TDM Configuration Reg5 */
+#define TAS2770_TDM_CFG_REG5  TAS2770_REG(0X0, 0x0F)
+#define TAS2770_TDM_CFG_REG5_VSNS_MASK  BIT(6)
+#define TAS2770_TDM_CFG_REG5_VSNS_ENABLE  BIT(6)
+#define TAS2770_TDM_CFG_REG5_50_MASK  0x3f
+    /* TDM Configuration Reg6 */
+#define TAS2770_TDM_CFG_REG6  TAS2770_REG(0X0, 0x10)
+#define TAS2770_TDM_CFG_REG6_ISNS_MASK  BIT(6)
+#define TAS2770_TDM_CFG_REG6_ISNS_ENABLE  BIT(6)
+#define TAS2770_TDM_CFG_REG6_50_MASK  0x3f
+    /* Brown Out Prevention Reg0 */
+#define TAS2770_BO_PRV_REG0  TAS2770_REG(0X0, 0x1B)
+    /* Interrupt MASK Reg0 */
+#define TAS2770_INT_MASK_REG0  TAS2770_REG(0X0, 0x20)
+#define TAS2770_INT_REG0_DEFAULT  0xfc
+#define TAS2770_INT_MASK_REG0_DISABLE 0xff
+    /* Interrupt MASK Reg1 */
+#define TAS2770_INT_MASK_REG1  TAS2770_REG(0X0, 0x21)
+#define TAS2770_INT_REG1_DEFAULT  0xb1
+#define TAS2770_INT_MASK_REG1_DISABLE 0xff
+    /* Live-Interrupt Reg0 */
+#define TAS2770_LVE_INT_REG0  TAS2770_REG(0X0, 0x22)
+    /* Live-Interrupt Reg1 */
+#define TAS2770_LVE_INT_REG1  TAS2770_REG(0X0, 0x23)
+    /* Latched-Interrupt Reg0 */
+#define TAS2770_LAT_INT_REG0  TAS2770_REG(0X0, 0x24)
+#define TAS2770_LAT_INT_REG0_OCE_FLG  BIT(1)
+#define TAS2770_LAT_INT_REG0_OTE_FLG  BIT(0)
+    /* Latched-Interrupt Reg1 */
+#define TAS2770_LAT_INT_REG1  TAS2770_REG(0X0, 0x25)
+#define TAS2770_LAT_INT_REG1_VBA_TOV  BIT(3)
+#define TAS2770_LAT_INT_REG1_VBA_TUV  BIT(2)
+#define TAS2770_LAT_INT_REG1_BOUT_FLG  BIT(1)
+    /* VBAT MSB */
+#define TAS2770_VBAT_MSB  TAS2770_REG(0X0, 0x27)
+    /* VBAT LSB */
+#define TAS2770_VBAT_LSB  TAS2770_REG(0X0, 0x28)
+    /* TEMP MSB */
+#define TAS2770_TEMP_MSB  TAS2770_REG(0X0, 0x29)
+    /* TEMP LSB */
+#define TAS2770_TEMP_LSB  TAS2770_REG(0X0, 0x2A)
+    /* Interrupt Configuration */
+#define TAS2770_INT_CFG  TAS2770_REG(0X0, 0x30)
+    /* Misc IRQ */
+#define TAS2770_MISC_IRQ  TAS2770_REG(0X0, 0x32)
+    /* Clock Configuration */
+#define TAS2770_CLK_CGF  TAS2770_REG(0X0, 0x3C)
+    /* TDM Clock detection monitor */
+#define TAS2770_TDM_CLK_DETC  TAS2770_REG(0X0, 0x77)
+    /* Revision and PG ID */
+#define TAS2770_REV_AND_GPID  TAS2770_REG(0X0, 0x7D)
+
+#define TAS2770_POWER_ACTIVE 0
+#define TAS2770_POWER_MUTE 1
+#define TAS2770_POWER_SHUTDOWN 2
+#define ERROR_OVER_CURRENT  0x0000001
+#define ERROR_DIE_OVERTEMP  0x0000002
+#define ERROR_OVER_VOLTAGE  0x0000004
+#define ERROR_UNDER_VOLTAGE 0x0000008
+#define ERROR_BROWNOUT      0x0000010
+#define ERROR_CLASSD_PWR    0x0000020
+#define TAS2770_SLOT_16BIT  16
+#define TAS2770_SLOT_32BIT  32
+#define TAS2770_I2C_RETRY_COUNT      3
+
+struct tas2770_register {
+	int book;
+	int page;
+	int reg;
+};
+
+struct tas2770_dai_cfg {
+	unsigned int dai_fmt;
+	unsigned int tdm_delay;
+};
+
+struct tas2770_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct snd_soc_codec *codec;
+	struct snd_soc_component *component;
+	struct mutex dev_lock;
+	struct hrtimer mtimer;
+	int power_state;
+	int asi_format;
+	struct gpio_desc *reset_gpio;
+	int sampling_rate;
+	int frame_size;
+	int channel_size;
+	int slot_width;
+	int v_sense_slot;
+	int i_sense_slot;
+	bool runtime_suspend;
+	unsigned int err_code;
+	struct mutex codec_lock;
+};
+
+#endif /* __TAS2770__ */
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A57569FD4
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 12:28:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C749E15C1;
	Thu,  7 Jul 2022 12:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C749E15C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657189701;
	bh=1mz8AVVzsDzfKjKTSE6WedrZJXxNSljzbV7vJJw8j6w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vrxoVPRF90W4fir/RlhcsWk55JFzaaUlgvFRz8aOgKYh4NGfVKbsPt8klioRRjpND
	 xUvwy/F/m/UWDa7hRleEEc19VX5bErmPo4VN+KUPanlwInEgGqXNiExudlSPrkwopi
	 Bxg+1aDqfa1I6I5JJ/qPNgAZ/gKfzRkcbH6mzLFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A9E2F8028D;
	Thu,  7 Jul 2022 12:27:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A00F5F8016A; Thu,  7 Jul 2022 12:27:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from n169-110.mail.139.com (n169-110.mail.139.com [120.232.169.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECD12F800C5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 12:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECD12F800C5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[192.163.20.102])
 by rmsmtp-lg-appmail-08-12086 (RichMail) with SMTP id 2f3662c6b4db64c-18664;
 Thu, 07 Jul 2022 18:26:59 +0800 (CST)
X-RM-TRANSID: 2f3662c6b4db64c-18664
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v3] add tas2780
Date: Thu,  7 Jul 2022 18:26:31 +0800
Message-Id: <20220707102631.2224-1-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, navada@ti.com, asyrus@ti.com,
 raphael-xu@ti.com, shenghao-ding@ti.com, Raphael-Xu <13691752556@139.com>
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

1.update Kconfig and Makefile 2.add tas2780.c and tas2780.h

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 sound/soc/codecs/Kconfig   |   8 +
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/tas2780.c | 663 +++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/tas2780.h | 101 ++++++
 4 files changed, 774 insertions(+)
 create mode 100644 sound/soc/codecs/tas2780.c
 create mode 100644 sound/soc/codecs/tas2780.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6165db92a629..198d7a0c10dc 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -219,6 +219,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TAS2562
 	imply SND_SOC_TAS2764
 	imply SND_SOC_TAS2770
+	imply SND_SOC_TAS2780
 	imply SND_SOC_TAS5086
 	imply SND_SOC_TAS571X
 	imply SND_SOC_TAS5720
@@ -1524,6 +1525,13 @@ config SND_SOC_TAS2770
 	tristate "Texas Instruments TAS2770 speaker amplifier"
 	depends on I2C
 
+config SND_SOC_TAS2780
+	tristate "Texas Instruments TAS2780 Mono Audio amplifier"
+	depends on I2C
+	help
+	  Enable support for Texas Instruments TAS2780 high-efficiency
+	  digital input mono Class-D audio power amplifiers.
+
 config SND_SOC_TAS5086
 	tristate "Texas Instruments TAS5086 speaker amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 28dc4edfd01f..14273b68a7ec 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -346,6 +346,7 @@ snd-soc-tpa6130a2-objs := tpa6130a2.o
 snd-soc-tas2552-objs := tas2552.o
 snd-soc-tas2562-objs := tas2562.o
 snd-soc-tas2764-objs := tas2764.o
+snd-soc-tas2780-objs := tas2780.o
 # Mux
 snd-soc-simple-mux-objs := simple-mux.o
 
@@ -589,6 +590,7 @@ obj-$(CONFIG_SND_SOC_STI_SAS)	+= snd-soc-sti-sas.o
 obj-$(CONFIG_SND_SOC_TAS2552)	+= snd-soc-tas2552.o
 obj-$(CONFIG_SND_SOC_TAS2562)	+= snd-soc-tas2562.o
 obj-$(CONFIG_SND_SOC_TAS2764)	+= snd-soc-tas2764.o
+obj-$(CONFIG_SND_SOC_TAS2780)	+= snd-soc-tas2780.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
new file mode 100644
index 000000000000..a6db6f0e5431
--- /dev/null
+++ b/sound/soc/codecs/tas2780.c
@@ -0,0 +1,663 @@
+// SPDX-License-Identifier: GPL-2.0
+// Driver for the Texas Instruments TAS2780 Mono
+//		Audio amplifier
+// Copyright (C) 2022 Texas Instruments Inc.
+
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/pm.h>
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regmap.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/tlv.h>
+
+#include "tas2780.h"
+
+struct tas2780_priv {
+	struct snd_soc_component *component;
+	struct gpio_desc *reset_gpio;
+	struct regmap *regmap;
+	struct device *dev;
+	int v_sense_slot;
+	int i_sense_slot;
+};
+
+static void tas2780_reset(struct tas2780_priv *tas2780)
+{
+	int ret = 0;
+
+	if (tas2780->reset_gpio) {
+		gpiod_set_value_cansleep(tas2780->reset_gpio, 0);
+		usleep_range(2000, 2050);
+		gpiod_set_value_cansleep(tas2780->reset_gpio, 1);
+		usleep_range(2000, 2050);
+	}
+
+	snd_soc_component_write(tas2780->component, TAS2780_SW_RST,
+				TAS2780_RST);
+	if (ret)
+		dev_err(tas2780->dev, "%s:errCode:0x%x Reset error!\n",
+			__func__, ret);
+}
+
+#ifdef CONFIG_PM
+static int tas2780_codec_suspend(struct snd_soc_component *component)
+{
+	struct tas2780_priv *tas2780 =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	ret = snd_soc_component_update_bits(component, TAS2780_PWR_CTRL,
+		TAS2780_PWR_CTRL_MASK, TAS2780_PWR_CTRL_SHUTDOWN);
+	if (ret < 0) {
+		dev_err(tas2780->dev, "%s:errCode:0x%0x:power down error\n",
+			__func__, ret);
+		goto err;
+	}
+	ret = 0;
+	regcache_cache_only(tas2780->regmap, true);
+	regcache_mark_dirty(tas2780->regmap);
+err:
+	return ret;
+}
+
+static int tas2780_codec_resume(struct snd_soc_component *component)
+{
+	struct tas2780_priv *tas2780 =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	ret = snd_soc_component_update_bits(component, TAS2780_PWR_CTRL,
+		TAS2780_PWR_CTRL_MASK, TAS2780_PWR_CTRL_ACTIVE);
+
+	if (ret < 0) {
+		dev_err(tas2780->dev, "%s:errCode:0x%0x:power down error\n",
+			__func__, ret);
+		goto err;
+	}
+	ret = 0;
+	regcache_cache_only(tas2780->regmap, false);
+	ret = regcache_sync(tas2780->regmap);
+err:
+	return ret;
+}
+#endif
+
+static const char * const tas2780_ASI1_src[] = {
+	"I2C offset", "Left", "Right", "LeftRightDiv2",
+};
+
+static SOC_ENUM_SINGLE_DECL(
+	tas2780_ASI1_src_enum, TAS2780_TDM_CFG2, 4, tas2780_ASI1_src);
+
+static const struct snd_kcontrol_new tas2780_asi1_mux =
+	SOC_DAPM_ENUM("ASI1 Source", tas2780_ASI1_src_enum);
+
+static const struct snd_kcontrol_new isense_switch =
+	SOC_DAPM_SINGLE("Switch", TAS2780_PWR_CTRL,
+			TAS2780_ISENSE_POWER_EN, 1, 1);
+static const struct snd_kcontrol_new vsense_switch =
+	SOC_DAPM_SINGLE("Switch", TAS2780_PWR_CTRL,
+			TAS2780_VSENSE_POWER_EN, 1, 1);
+
+static const struct snd_soc_dapm_widget tas2780_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2780_asi1_mux),
+	SND_SOC_DAPM_SWITCH("ISENSE", TAS2780_PWR_CTRL,
+		TAS2780_ISENSE_POWER_EN, 1, &isense_switch),
+	SND_SOC_DAPM_SWITCH("VSENSE", TAS2780_PWR_CTRL,
+		TAS2780_VSENSE_POWER_EN, 1, &vsense_switch),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+	SND_SOC_DAPM_SIGGEN("VMON"),
+	SND_SOC_DAPM_SIGGEN("IMON")
+};
+
+static const struct snd_soc_dapm_route tas2780_audio_map[] = {
+	{"ASI1 Sel", "I2C offset", "ASI1"},
+	{"ASI1 Sel", "Left", "ASI1"},
+	{"ASI1 Sel", "Right", "ASI1"},
+	{"ASI1 Sel", "LeftRightDiv2", "ASI1"},
+	{"OUT", NULL, "ASI1 Sel"},
+	{"ISENSE", "Switch", "IMON"},
+	{"VSENSE", "Switch", "VMON"},
+};
+
+static int tas2780_mute(struct snd_soc_dai *dai, int mute, int direction)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2780_priv *tas2780 =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	ret = snd_soc_component_update_bits(component, TAS2780_PWR_CTRL,
+		TAS2780_PWR_CTRL_MASK,
+		mute ? TAS2780_PWR_CTRL_MUTE : 0);
+	if (ret < 0) {
+		dev_err(tas2780->dev, "%s: Failed to set powercontrol\n",
+			__func__);
+		goto err;
+	}
+	ret = 0;
+err:
+	return ret;
+}
+
+static int tas2780_set_bitwidth(struct tas2780_priv *tas2780, int bitwidth)
+{
+	struct snd_soc_component *component = tas2780->component;
+	int sense_en;
+	int val;
+	int ret;
+	int slot_size;
+
+	switch (bitwidth) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2780_TDM_CFG2,
+			TAS2780_TDM_CFG2_RXW_MASK,
+			TAS2780_TDM_CFG2_RXW_16BITS);
+		slot_size = TAS2780_TDM_CFG2_RXS_16BITS;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2780_TDM_CFG2,
+			TAS2780_TDM_CFG2_RXW_MASK,
+			TAS2780_TDM_CFG2_RXW_24BITS);
+		slot_size = TAS2780_TDM_CFG2_RXS_24BITS;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2780_TDM_CFG2,
+			TAS2780_TDM_CFG2_RXW_MASK,
+			TAS2780_TDM_CFG2_RXW_32BITS);
+		slot_size = TAS2780_TDM_CFG2_RXS_32BITS;
+		break;
+
+	default:
+		ret = -EINVAL;
+	}
+
+	if (ret < 0) {
+		dev_err(tas2780->dev, "%s:errCode:0x%x set bitwidth error\n",
+			__func__, ret);
+		goto err;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2780_TDM_CFG2,
+		TAS2780_TDM_CFG2_RXS_MASK, slot_size);
+	if (ret < 0) {
+		dev_err(tas2780->dev,
+			"%s:errCode:0x%x set RX slot size error\n",
+			__func__, ret);
+		goto err;
+	}
+
+	val = snd_soc_component_read(tas2780->component, TAS2780_PWR_CTRL);
+	if (val < 0) {
+		dev_err(tas2780->dev, "%s:errCode:0x%x read PWR_CTRL error\n",
+			__func__, val);
+		ret = val;
+		goto err;
+	}
+
+	if (val & (1 << TAS2780_VSENSE_POWER_EN))
+		sense_en = 0;
+	else
+		sense_en = TAS2780_TDM_CFG5_VSNS_ENABLE;
+
+	ret = snd_soc_component_update_bits(tas2780->component,
+		TAS2780_TDM_CFG5, TAS2780_TDM_CFG5_VSNS_ENABLE, sense_en);
+	if (ret < 0) {
+		dev_err(tas2780->dev, "%s:errCode:0x%x enable vSNS error\n",
+			__func__, ret);
+		goto err;
+	}
+
+	if (val & (1 << TAS2780_ISENSE_POWER_EN))
+		sense_en = 0;
+	else
+		sense_en = TAS2780_TDM_CFG6_ISNS_ENABLE;
+
+	ret = snd_soc_component_update_bits(tas2780->component,
+		TAS2780_TDM_CFG6, TAS2780_TDM_CFG6_ISNS_ENABLE, sense_en);
+	if (ret < 0) {
+		dev_err(tas2780->dev, "%s:errCode:0x%x enable iSNS error\n",
+			__func__, ret);
+		goto err;
+	}
+	ret = 0;
+err:
+	return ret;
+}
+
+static int tas2780_set_samplerate(
+	struct tas2780_priv *tas2780, int samplerate)
+{
+	struct snd_soc_component *component = tas2780->component;
+	int ramp_rate_val;
+	int ret;
+
+	switch (samplerate) {
+	case 48000:
+		ramp_rate_val = TAS2780_TDM_CFG0_SMP_48KHZ |
+				TAS2780_TDM_CFG0_44_1_48KHZ;
+		break;
+	case 44100:
+		ramp_rate_val = TAS2780_TDM_CFG0_SMP_44_1KHZ |
+				TAS2780_TDM_CFG0_44_1_48KHZ;
+		break;
+	case 96000:
+		ramp_rate_val = TAS2780_TDM_CFG0_SMP_48KHZ |
+				TAS2780_TDM_CFG0_88_2_96KHZ;
+		break;
+	case 88200:
+		ramp_rate_val = TAS2780_TDM_CFG0_SMP_44_1KHZ |
+				TAS2780_TDM_CFG0_88_2_96KHZ;
+		break;
+	default:
+		return -EINVAL;
+	}
+	ret = snd_soc_component_update_bits(component, TAS2780_TDM_CFG0,
+		TAS2780_TDM_CFG0_SMP_MASK | TAS2780_TDM_CFG0_MASK,
+		ramp_rate_val);
+	if (ret < 0) {
+		dev_err(tas2780->dev,
+			"%s:errCode:0x%x Failed to set ramp_rate_val\n",
+			__func__, ret);
+		goto err;
+	}
+	ret = 0;
+err:
+	return ret;
+}
+
+static int tas2780_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2780_priv *tas2780 =
+		snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = tas2780_set_bitwidth(tas2780, params_format(params));
+	if (ret < 0)
+		return ret;
+
+	return tas2780_set_samplerate(tas2780, params_rate(params));
+}
+
+static int tas2780_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2780_priv *tas2780 =
+		snd_soc_component_get_drvdata(component);
+	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
+	int iface;
+	int ret = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		asi_cfg_1 = TAS2780_TDM_CFG1_RX_RISING;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		asi_cfg_1 = TAS2780_TDM_CFG1_RX_FALLING;
+		break;
+	default:
+		dev_err(tas2780->dev, "ASI format Inverse is not found\n");
+		return -EINVAL;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2780_TDM_CFG1,
+		TAS2780_TDM_CFG1_RX_MASK, asi_cfg_1);
+	if (ret < 0) {
+		dev_err(tas2780->dev,
+			"%s:errCode:0x%x Failed to set asi_cfg_1\n",
+			__func__, ret);
+		goto err;
+	}
+
+	if (((fmt & SND_SOC_DAIFMT_FORMAT_MASK) == SND_SOC_DAIFMT_I2S)
+		|| ((fmt & SND_SOC_DAIFMT_FORMAT_MASK)
+		== SND_SOC_DAIFMT_DSP_A)){
+		iface = TAS2780_TDM_CFG2_SCFG_I2S;
+		tdm_rx_start_slot = 1;
+	} else {
+		if (((fmt & SND_SOC_DAIFMT_FORMAT_MASK)
+			== SND_SOC_DAIFMT_DSP_B)
+			|| ((fmt & SND_SOC_DAIFMT_FORMAT_MASK)
+			== SND_SOC_DAIFMT_LEFT_J)) {
+			iface = TAS2780_TDM_CFG2_SCFG_LEFT_J;
+			tdm_rx_start_slot = 0;
+		} else {
+			dev_err(tas2780->dev,
+				"%s:DAI Format is not found, fmt=0x%x\n",
+				__func__, fmt);
+			ret = -EINVAL;
+			goto err;
+		}
+	}
+	ret = snd_soc_component_update_bits(component, TAS2780_TDM_CFG1,
+		TAS2780_TDM_CFG1_MASK,
+		(tdm_rx_start_slot << TAS2780_TDM_CFG1_51_SHIFT));
+	if (ret < 0) {
+		dev_err(tas2780->dev,
+			"%s:errCode:0x%x Failed to set tdm_rx_start_slot\n",
+			__func__, ret);
+		goto err;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2780_TDM_CFG2,
+		TAS2780_TDM_CFG2_SCFG_MASK, iface);
+	if (ret < 0) {
+		dev_err(tas2780->dev, "%s:errCode:0x%x Failed to set iface\n",
+			__func__, ret);
+		goto err;
+	}
+	ret = 0;
+err:
+	return ret;
+}
+
+static int tas2780_set_dai_tdm_slot(struct snd_soc_dai *dai,
+				unsigned int tx_mask,
+				unsigned int rx_mask,
+				int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2780_priv *tas2780 =
+		snd_soc_component_get_drvdata(component);
+	int left_slot, right_slot;
+	int slots_cfg;
+	int slot_size;
+	int ret = 0;
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
+	slots_cfg = (right_slot << TAS2780_TDM_CFG3_RXS_SHIFT) | left_slot;
+	ret = snd_soc_component_write(component, TAS2780_TDM_CFG3, slots_cfg);
+	if (ret) {
+		dev_err(tas2780->dev,
+			"%s:errCode:0x%x Failed to set slots_cfg\n",
+			__func__, ret);
+		goto err;
+	}
+
+	switch (slot_width) {
+	case 16:
+		slot_size = TAS2780_TDM_CFG2_RXS_16BITS;
+		break;
+	case 24:
+		slot_size = TAS2780_TDM_CFG2_RXS_24BITS;
+		break;
+	case 32:
+		slot_size = TAS2780_TDM_CFG2_RXS_32BITS;
+		break;
+	default:
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2780_TDM_CFG2,
+		TAS2780_TDM_CFG2_RXS_MASK, slot_size);
+	if (ret < 0) {
+		dev_err(tas2780->dev,
+			"%s:errCode:0x%x Failed to set slot_size\n",
+			__func__, ret);
+		goto err;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2780_TDM_CFG5,
+		TAS2780_TDM_CFG5_50_MASK, tas2780->v_sense_slot);
+	if (ret < 0) {
+		dev_err(tas2780->dev,
+			"%s:errCode:0x%x Failed to set v_sense_slot\n",
+			__func__, ret);
+		goto err;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2780_TDM_CFG6,
+		TAS2780_TDM_CFG6_50_MASK, tas2780->i_sense_slot);
+	if (ret < 0) {
+		dev_err(tas2780->dev,
+			"%s:errCode:0x%x Failed to set i_sense_slot\n",
+			__func__, ret);
+		goto err;
+	}
+	ret = 0;
+err:
+	return ret;
+}
+
+static const struct snd_soc_dai_ops tas2780_dai_ops = {
+	.mute_stream = tas2780_mute,
+	.hw_params  = tas2780_hw_params,
+	.set_fmt    = tas2780_set_fmt,
+	.set_tdm_slot = tas2780_set_dai_tdm_slot,
+	.no_capture_mute = 1,
+};
+
+#define TAS2780_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+#define TAS2780_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
+		       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
+
+static struct snd_soc_dai_driver tas2780_dai_driver[] = {
+	{
+		.name = "tas2780 ASI1",
+		.id = 0,
+		.playback = {
+			.stream_name    = "ASI1 Playback",
+			.channels_min   = 2,
+			.channels_max   = 2,
+			.rates      = TAS2780_RATES,
+			.formats    = TAS2780_FORMATS,
+		},
+		.capture = {
+			.stream_name    = "ASI1 Capture",
+			.channels_min   = 1,
+			.channels_max   = 2,
+			.rates = TAS2780_RATES,
+			.formats = TAS2780_FORMATS,
+		},
+		.ops = &tas2780_dai_ops,
+		.symmetric_rate = 1,
+	},
+};
+
+static int tas2780_codec_probe(struct snd_soc_component *component)
+{
+	struct tas2780_priv *tas2780 =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	tas2780->component = component;
+
+	tas2780_reset(tas2780);
+	ret = snd_soc_component_update_bits(component,
+			TAS2780_IC_CFG, TAS2780_IC_CFG_MASK,
+			TAS2780_IC_CFG_ENABLE);
+	if (ret < 0)
+		dev_err(tas2780->dev, "%s:errCode:0x%0x\n",
+			__func__, ret);
+
+	return ret;
+}
+
+static DECLARE_TLV_DB_SCALE(tas2780_digital_tlv, 1100, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas2780_playback_volume, -10000, 50, 0);
+
+static const struct snd_kcontrol_new tas2780_snd_controls[] = {
+	SOC_SINGLE_TLV("Speaker Volume", TAS2780_DVC, 0,
+		       TAS2780_DVC_MAX, 1, tas2780_playback_volume),
+	SOC_SINGLE_TLV("Amp Gain Volume", TAS2780_CHNL_0, 0, 0x14, 0,
+		       tas2780_digital_tlv),
+};
+
+static const struct snd_soc_component_driver soc_component_driver_tas2780 = {
+	.probe			= tas2780_codec_probe,
+#ifdef CONFIG_PM
+	.suspend		= tas2780_codec_suspend,
+	.resume			= tas2780_codec_resume,
+#endif
+	.controls		= tas2780_snd_controls,
+	.num_controls		= ARRAY_SIZE(tas2780_snd_controls),
+	.dapm_widgets		= tas2780_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tas2780_dapm_widgets),
+	.dapm_routes		= tas2780_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(tas2780_audio_map),
+	.idle_bias_on		= 1,
+	.endianness		= 1,
+};
+
+static const struct reg_default tas2780_reg_defaults[] = {
+	{ TAS2780_PAGE, 0x00 },
+	{ TAS2780_SW_RST, 0x00 },
+	{ TAS2780_PWR_CTRL, 0x1a },
+	{ TAS2780_DVC, 0x00 },
+	{ TAS2780_CHNL_0, 0x00 },
+	{ TAS2780_TDM_CFG0, 0x09 },
+	{ TAS2780_TDM_CFG1, 0x02 },
+	{ TAS2780_TDM_CFG2, 0x0a },
+	{ TAS2780_TDM_CFG3, 0x10 },
+	{ TAS2780_TDM_CFG5, 0x42 },
+};
+
+static const struct regmap_range_cfg tas2780_regmap_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = 1 * 128,
+		.selector_reg = TAS2780_PAGE,
+		.selector_mask = 0xff,
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = 128,
+	},
+};
+
+static const struct regmap_config tas2780_i2c_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_defaults = tas2780_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas2780_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.ranges = tas2780_regmap_ranges,
+	.num_ranges = ARRAY_SIZE(tas2780_regmap_ranges),
+	.max_register = 1 * 128,
+};
+
+static int tas2780_parse_dt(struct device *dev, struct tas2780_priv *tas2780)
+{
+	int ret = 0;
+
+	tas2780->reset_gpio = devm_gpiod_get_optional(tas2780->dev, "reset",
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(tas2780->reset_gpio)) {
+		if (PTR_ERR(tas2780->reset_gpio) == -EPROBE_DEFER) {
+			tas2780->reset_gpio = NULL;
+			return -EPROBE_DEFER;
+		}
+	}
+
+	ret = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
+		&tas2780->i_sense_slot);
+	if (ret)
+		tas2780->i_sense_slot = 0;
+
+	ret = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
+		&tas2780->v_sense_slot);
+	if (ret)
+		tas2780->v_sense_slot = 2;
+
+	return 0;
+}
+
+static int tas2780_i2c_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct tas2780_priv *tas2780;
+	int result;
+
+	tas2780 = devm_kzalloc(&client->dev, sizeof(struct tas2780_priv),
+		GFP_KERNEL);
+	if (!tas2780)
+		return -ENOMEM;
+	tas2780->dev = &client->dev;
+	i2c_set_clientdata(client, tas2780);
+	dev_set_drvdata(&client->dev, tas2780);
+
+	tas2780->regmap = devm_regmap_init_i2c(client, &tas2780_i2c_regmap);
+	if (IS_ERR(tas2780->regmap)) {
+		result = PTR_ERR(tas2780->regmap);
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+			result);
+		return result;
+	}
+
+	if (client->dev.of_node) {
+		result = tas2780_parse_dt(&client->dev, tas2780);
+		if (result) {
+			dev_err(tas2780->dev,
+				"%s: Failed to parse devicetree\n", __func__);
+			return result;
+		}
+	}
+
+	return devm_snd_soc_register_component(tas2780->dev,
+		&soc_component_driver_tas2780, tas2780_dai_driver,
+		ARRAY_SIZE(tas2780_dai_driver));
+}
+
+static const struct i2c_device_id tas2780_i2c_id[] = {
+	{ "tas2780", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tas2780_i2c_id);
+
+#if defined(CONFIG_OF)
+static const struct of_device_id tas2780_of_match[] = {
+	{ .compatible = "ti,tas2780" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tas2780_of_match);
+#endif
+
+static struct i2c_driver tas2780_i2c_driver = {
+	.driver = {
+		.name   = "tas2780",
+		.of_match_table = of_match_ptr(tas2780_of_match),
+	},
+	.probe  = tas2780_i2c_probe,
+	.id_table   = tas2780_i2c_id,
+};
+module_i2c_driver(tas2780_i2c_driver);
+
+MODULE_AUTHOR("Raphael Xu <raphael-xu@ti.com>");
+MODULE_DESCRIPTION("TAS2780 I2C Smart Amplifier driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tas2780.h b/sound/soc/codecs/tas2780.h
new file mode 100644
index 000000000000..661c25df4e29
--- /dev/null
+++ b/sound/soc/codecs/tas2780.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * TAS2780.h - ALSA SoC Texas Instruments TAS2780 Mono Audio Amplifier
+ *
+ * Copyright (C) 2020-2022 Texas Instruments Incorporated - https://www.ti.com
+ *
+ * Author: Raphael Xu <raphael-xu@ti.com>
+ */
+
+#ifndef __TAS2780_H__
+#define __TAS2780_H__
+
+/* Book Control Register */
+#define TAS2780_BOOKCTL_PAGE	0
+#define TAS2780_BOOKCTL_REG	127
+#define TAS2780_REG(page, reg)	((page * 128) + reg)
+
+/* Page */
+#define TAS2780_PAGE		TAS2780_REG(0X0, 0x00)
+#define TAS2780_PAGE_PAGE_MASK	255
+
+/* Software Reset */
+#define TAS2780_SW_RST	TAS2780_REG(0X0, 0x01)
+#define TAS2780_RST	BIT(0)
+
+/* Power Control */
+#define TAS2780_PWR_CTRL		TAS2780_REG(0X0, 0x02)
+#define TAS2780_PWR_CTRL_MASK		GENMASK(1, 0)
+#define TAS2780_PWR_CTRL_ACTIVE		0x0
+#define TAS2780_PWR_CTRL_MUTE		BIT(0)
+#define TAS2780_PWR_CTRL_SHUTDOWN	BIT(1)
+
+#define TAS2780_VSENSE_POWER_EN		3
+#define TAS2780_ISENSE_POWER_EN		4
+
+/* Digital Volume Control */
+#define TAS2780_DVC	TAS2780_REG(0X0, 0x1a)
+#define TAS2780_DVC_MAX	0xc9
+
+#define TAS2780_CHNL_0  TAS2780_REG(0X0, 0x03)
+
+/* TDM Configuration Reg0 */
+#define TAS2780_TDM_CFG0		TAS2780_REG(0X0, 0x08)
+#define TAS2780_TDM_CFG0_SMP_MASK	BIT(5)
+#define TAS2780_TDM_CFG0_SMP_48KHZ	0x0
+#define TAS2780_TDM_CFG0_SMP_44_1KHZ	BIT(5)
+#define TAS2780_TDM_CFG0_MASK		GENMASK(3, 1)
+#define TAS2780_TDM_CFG0_44_1_48KHZ	BIT(3)
+#define TAS2780_TDM_CFG0_88_2_96KHZ	(BIT(3) | BIT(1))
+
+/* TDM Configuration Reg1 */
+#define TAS2780_TDM_CFG1		TAS2780_REG(0X0, 0x09)
+#define TAS2780_TDM_CFG1_MASK		GENMASK(5, 1)
+#define TAS2780_TDM_CFG1_51_SHIFT	1
+#define TAS2780_TDM_CFG1_RX_MASK	BIT(0)
+#define TAS2780_TDM_CFG1_RX_RISING	0x0
+#define TAS2780_TDM_CFG1_RX_FALLING	BIT(0)
+
+/* TDM Configuration Reg2 */
+#define TAS2780_TDM_CFG2		TAS2780_REG(0X0, 0x0a)
+#define TAS2780_TDM_CFG2_RXW_MASK	GENMASK(3, 2)
+#define TAS2780_TDM_CFG2_RXW_16BITS	0x0
+#define TAS2780_TDM_CFG2_RXW_24BITS	BIT(3)
+#define TAS2780_TDM_CFG2_RXW_32BITS	(BIT(3) | BIT(2))
+#define TAS2780_TDM_CFG2_RXS_MASK	GENMASK(1, 0)
+#define TAS2780_TDM_CFG2_RXS_16BITS	0x0
+#define TAS2780_TDM_CFG2_RXS_24BITS	BIT(0)
+#define TAS2780_TDM_CFG2_RXS_32BITS	BIT(1)
+#define TAS2780_TDM_CFG2_SCFG_MASK	GENMASK(5, 4)
+#define TAS2780_TDM_CFG2_SCFG_I2S	0x0
+#define TAS2780_TDM_CFG2_SCFG_LEFT_J	BIT(4)
+#define TAS2780_TDM_CFG2_SCFG_RIGHT_J	BIT(5)
+
+/* TDM Configuration Reg3 */
+#define TAS2780_TDM_CFG3		TAS2780_REG(0X0, 0x0c)
+#define TAS2780_TDM_CFG3_RXS_MASK	GENMASK(7, 4)
+#define TAS2780_TDM_CFG3_RXS_SHIFT	0x4
+#define TAS2780_TDM_CFG3_MASK		GENMASK(3, 0)
+
+/* TDM Configuration Reg4 */
+#define TAS2780_TDM_CFG4		TAS2780_REG(0X0, 0x0d)
+#define TAS2780_TDM_CFG4_TX_OFFSET_MASK	GENMASK(3, 1)
+
+/* TDM Configuration Reg5 */
+#define TAS2780_TDM_CFG5		TAS2780_REG(0X0, 0x0e)
+#define TAS2780_TDM_CFG5_VSNS_MASK	BIT(6)
+#define TAS2780_TDM_CFG5_VSNS_ENABLE	BIT(6)
+#define TAS2780_TDM_CFG5_50_MASK	GENMASK(5, 0)
+
+/* TDM Configuration Reg6 */
+#define TAS2780_TDM_CFG6		TAS2780_REG(0X0, 0x0f)
+#define TAS2780_TDM_CFG6_ISNS_MASK	BIT(6)
+#define TAS2780_TDM_CFG6_ISNS_ENABLE	BIT(6)
+#define TAS2780_TDM_CFG6_50_MASK	GENMASK(5, 0)
+
+/* IC CFG */
+#define TAS2780_IC_CFG			TAS2780_REG(0X0, 0x5c)
+#define TAS2780_IC_CFG_MASK		GENMASK(7, 6)
+#define TAS2780_IC_CFG_ENABLE		(BIT(7) | BIT(6))
+
+#endif /* __TAS2780_H__ */
-- 
2.35.1



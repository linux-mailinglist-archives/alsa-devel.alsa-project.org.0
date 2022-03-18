Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF214E428F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:11:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE8EA1633;
	Tue, 22 Mar 2022 16:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE8EA1633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647961903;
	bh=Yi0fZs/zzlOrTiVKN2MkjIgwxjt0x6F2Byzgy1xXGGk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXGQSu4OWu6zfUXMzDb+r6SblR7XAtqbbzhBCi0rjFPPE2y9ah6tH9Z3s4SQ4Vakc
	 Jd9+wsRDUHz9l7gZBnxSPJjeXRcQa7/udknw0tqQJCBFt9esQh4OIou8eJ5naC/YGg
	 bALbEAU+wcbDmAR0jYYUvG/UoM0GfNMVgtkeMSqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D88F8049C;
	Tue, 22 Mar 2022 16:10:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45FDAF8026D; Fri, 18 Mar 2022 10:49:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61F61F80118
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 10:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61F61F80118
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[223.73.211.159])
 by rmsmtp-lg-appmail-25-12028 (RichMail) with SMTP id 2efc623455949a0-42d95;
 Fri, 18 Mar 2022 17:49:24 +0800 (CST)
X-RM-TRANSID: 2efc623455949a0-42d95
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v2 2/2] support either TAS2764 or TAS2780 device from TI
Date: Fri, 18 Mar 2022 17:49:03 +0800
Message-Id: <20220318094903.22026-2-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318094903.22026-1-13691752556@139.com>
References: <20220318094903.22026-1-13691752556@139.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Mar 2022 16:10:02 +0100
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com, Raphael-Xu <13691752556@139.com>
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

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 sound/soc/codecs/Kconfig                  |  13 +-
 sound/soc/codecs/Makefile                 |   4 +-
 sound/soc/codecs/tas2764.c                | 688 -----------------
 sound/soc/codecs/tas27xx.c                | 861 ++++++++++++++++++++++
 sound/soc/codecs/{tas2764.h => tas27xx.h} |  27 +-
 5 files changed, 890 insertions(+), 703 deletions(-)
 delete mode 100644 sound/soc/codecs/tas2764.c
 create mode 100644 sound/soc/codecs/tas27xx.c
 rename sound/soc/codecs/{tas2764.h => tas27xx.h} (81%)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d3e5ae8310ef..95f45f3b6b17 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -212,8 +212,8 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_STI_SAS
 	imply SND_SOC_TAS2552
 	imply SND_SOC_TAS2562
-	imply SND_SOC_TAS2764
 	imply SND_SOC_TAS2770
+	imply SND_SOC_TAS27XX
 	imply SND_SOC_TAS5086
 	imply SND_SOC_TAS571X
 	imply SND_SOC_TAS5720
@@ -1459,14 +1459,17 @@ config SND_SOC_TAS2562
 	tristate "Texas Instruments TAS2562 Mono Audio amplifier"
 	depends on I2C
 
-config SND_SOC_TAS2764
-	tristate "Texas Instruments TAS2764 Mono Audio amplifier"
-	depends on I2C
-
 config SND_SOC_TAS2770
 	tristate "Texas Instruments TAS2770 speaker amplifier"
 	depends on I2C
 
+config SND_SOC_TAS27XX
+	tristate "Texas Instruments TAS27xx speaker amplifier"
+	depends on I2C
+	help
+	  Enable support for Texas Instruments TAS2764 and TAS2780
+	  power amplifiers
+
 config SND_SOC_TAS5086
 	tristate "Texas Instruments TAS5086 speaker amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ac7f20972470..2cd2b2352ee7 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -334,7 +334,7 @@ snd-soc-simple-amplifier-objs := simple-amplifier.o
 snd-soc-tpa6130a2-objs := tpa6130a2.o
 snd-soc-tas2552-objs := tas2552.o
 snd-soc-tas2562-objs := tas2562.o
-snd-soc-tas2764-objs := tas2764.o
+snd-soc-tas27xx-objs := tas27xx.o
 # Mux
 snd-soc-simple-mux-objs := simple-mux.o
 
@@ -570,7 +570,7 @@ obj-$(CONFIG_SND_SOC_STAC9766)	+= snd-soc-stac9766.o
 obj-$(CONFIG_SND_SOC_STI_SAS)	+= snd-soc-sti-sas.o
 obj-$(CONFIG_SND_SOC_TAS2552)	+= snd-soc-tas2552.o
 obj-$(CONFIG_SND_SOC_TAS2562)	+= snd-soc-tas2562.o
-obj-$(CONFIG_SND_SOC_TAS2764)	+= snd-soc-tas2764.o
+obj-$(CONFIG_SND_SOC_TAS27XX)	+= snd-soc-tas27xx.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
deleted file mode 100644
index 9265af41c235..000000000000
--- a/sound/soc/codecs/tas2764.c
+++ /dev/null
@@ -1,688 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-//
-// Driver for the Texas Instruments TAS2764 CODEC
-// Copyright (C) 2020 Texas Instruments Inc.
-
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/pm.h>
-#include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
-#include <linux/regulator/consumer.h>
-#include <linux/regmap.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
-#include <linux/slab.h>
-#include <sound/soc.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/initval.h>
-#include <sound/tlv.h>
-
-#include "tas2764.h"
-
-struct tas2764_priv {
-	struct snd_soc_component *component;
-	struct gpio_desc *reset_gpio;
-	struct gpio_desc *sdz_gpio;
-	struct regmap *regmap;
-	struct device *dev;
-	
-	int v_sense_slot;
-	int i_sense_slot;
-};
-
-static void tas2764_reset(struct tas2764_priv *tas2764)
-{
-	if (tas2764->reset_gpio) {
-		gpiod_set_value_cansleep(tas2764->reset_gpio, 0);
-		msleep(20);
-		gpiod_set_value_cansleep(tas2764->reset_gpio, 1);
-	}
-
-	snd_soc_component_write(tas2764->component, TAS2764_SW_RST,
-				TAS2764_RST);
-}
-
-static int tas2764_set_bias_level(struct snd_soc_component *component,
-				 enum snd_soc_bias_level level)
-{
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_ACTIVE);
-		break;
-	case SND_SOC_BIAS_STANDBY:
-	case SND_SOC_BIAS_PREPARE:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_MUTE);
-		break;
-	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_SHUTDOWN);
-		break;
-
-	default:
-		dev_err(tas2764->dev,
-				"wrong power level setting %d\n", level);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-#ifdef CONFIG_PM
-static int tas2764_codec_suspend(struct snd_soc_component *component)
-{
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    TAS2764_PWR_CTRL_SHUTDOWN);
-
-	if (ret < 0)
-		return ret;
-
-	if (tas2764->sdz_gpio)
-		gpiod_set_value_cansleep(tas2764->sdz_gpio, 0);
-
-	regcache_cache_only(tas2764->regmap, true);
-	regcache_mark_dirty(tas2764->regmap);
-
-	return 0;
-}
-
-static int tas2764_codec_resume(struct snd_soc_component *component)
-{
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	if (tas2764->sdz_gpio)
-		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
-
-	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    TAS2764_PWR_CTRL_ACTIVE);
-
-	if (ret < 0)
-		return ret;
-
-	regcache_cache_only(tas2764->regmap, false);
-
-	return regcache_sync(tas2764->regmap);
-}
-#else
-#define tas2764_codec_suspend NULL
-#define tas2764_codec_resume NULL
-#endif
-
-static const char * const tas2764_ASI1_src[] = {
-	"I2C offset", "Left", "Right", "LeftRightDiv2",
-};
-
-static SOC_ENUM_SINGLE_DECL(
-	tas2764_ASI1_src_enum, TAS2764_TDM_CFG2, 4, tas2764_ASI1_src);
-
-static const struct snd_kcontrol_new tas2764_asi1_mux =
-	SOC_DAPM_ENUM("ASI1 Source", tas2764_ASI1_src_enum);
-
-static int tas2764_dac_event(struct snd_soc_dapm_widget *w,
-			     struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-						    TAS2764_PWR_CTRL_MASK,
-						    TAS2764_PWR_CTRL_MUTE);
-		break;
-	case SND_SOC_DAPM_PRE_PMD:
-		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-						    TAS2764_PWR_CTRL_MASK,
-						    TAS2764_PWR_CTRL_SHUTDOWN);
-		break;
-	default:
-		dev_err(tas2764->dev, "Unsupported event\n");
-		return -EINVAL;
-	}
-
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static const struct snd_kcontrol_new isense_switch =
-	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL, TAS2764_ISENSE_POWER_EN, 1, 1);
-static const struct snd_kcontrol_new vsense_switch =
-	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL, TAS2764_VSENSE_POWER_EN, 1, 1);
-
-static const struct snd_soc_dapm_widget tas2764_dapm_widgets[] = {
-	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2764_asi1_mux),
-	SND_SOC_DAPM_SWITCH("ISENSE", TAS2764_PWR_CTRL, TAS2764_ISENSE_POWER_EN,
-			    1, &isense_switch),
-	SND_SOC_DAPM_SWITCH("VSENSE", TAS2764_PWR_CTRL, TAS2764_VSENSE_POWER_EN,
-			    1, &vsense_switch),
-	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2764_dac_event,
-			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
-	SND_SOC_DAPM_OUTPUT("OUT"),
-	SND_SOC_DAPM_SIGGEN("VMON"),
-	SND_SOC_DAPM_SIGGEN("IMON")
-};
-
-static const struct snd_soc_dapm_route tas2764_audio_map[] = {
-	{"ASI1 Sel", "I2C offset", "ASI1"},
-	{"ASI1 Sel", "Left", "ASI1"},
-	{"ASI1 Sel", "Right", "ASI1"},
-	{"ASI1 Sel", "LeftRightDiv2", "ASI1"},
-	{"DAC", NULL, "ASI1 Sel"},
-	{"OUT", NULL, "DAC"},
-	{"ISENSE", "Switch", "IMON"},
-	{"VSENSE", "Switch", "VMON"},
-};
-
-static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
-{
-	struct snd_soc_component *component = dai->component;
-	int ret;
-
-	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    mute ? TAS2764_PWR_CTRL_MUTE : 0);
-
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
-{
-	struct snd_soc_component *component = tas2764->component;
-	int sense_en;
-	int val;
-	int ret;
-
-	switch (bitwidth) {
-	case SNDRV_PCM_FORMAT_S16_LE:
-		ret = snd_soc_component_update_bits(component,
-						    TAS2764_TDM_CFG2,
-						    TAS2764_TDM_CFG2_RXW_MASK,
-						    TAS2764_TDM_CFG2_RXW_16BITS);
-		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
-		ret = snd_soc_component_update_bits(component,
-						    TAS2764_TDM_CFG2,
-						    TAS2764_TDM_CFG2_RXW_MASK,
-						    TAS2764_TDM_CFG2_RXW_24BITS);
-		break;
-	case SNDRV_PCM_FORMAT_S32_LE:
-		ret = snd_soc_component_update_bits(component,
-						    TAS2764_TDM_CFG2,
-						    TAS2764_TDM_CFG2_RXW_MASK,
-						    TAS2764_TDM_CFG2_RXW_32BITS);
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	if (ret < 0)
-		return ret;
-
-	val = snd_soc_component_read(tas2764->component, TAS2764_PWR_CTRL);
-	if (val < 0)
-		return val;
-
-	if (val & (1 << TAS2764_VSENSE_POWER_EN))
-		sense_en = 0;
-	else
-		sense_en = TAS2764_TDM_CFG5_VSNS_ENABLE;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
-
-	if (val & (1 << TAS2764_ISENSE_POWER_EN))
-		sense_en = 0;
-	else
-		sense_en = TAS2764_TDM_CFG6_ISNS_ENABLE;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int tas2764_set_samplerate(struct tas2764_priv *tas2764, int samplerate)
-{
-	struct snd_soc_component *component = tas2764->component;
-	int ramp_rate_val;
-	int ret;
-
-	switch (samplerate) {
-	case 48000:
-		ramp_rate_val = TAS2764_TDM_CFG0_SMP_48KHZ |
-				TAS2764_TDM_CFG0_44_1_48KHZ;
-		break;
-	case 44100:
-		ramp_rate_val = TAS2764_TDM_CFG0_SMP_44_1KHZ |
-				TAS2764_TDM_CFG0_44_1_48KHZ;
-		break;
-	case 96000:
-		ramp_rate_val = TAS2764_TDM_CFG0_SMP_48KHZ |
-				TAS2764_TDM_CFG0_88_2_96KHZ;
-		break;
-	case 88200:
-		ramp_rate_val = TAS2764_TDM_CFG0_SMP_44_1KHZ |
-				TAS2764_TDM_CFG0_88_2_96KHZ;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG0,
-					    TAS2764_TDM_CFG0_SMP_MASK |
-					    TAS2764_TDM_CFG0_MASK,
-					    ramp_rate_val);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int tas2764_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params,
-			     struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	ret = tas2764_set_bitwidth(tas2764, params_format(params));
-	if (ret < 0)
-		return ret;
-
-	return tas2764_set_samplerate(tas2764, params_rate(params));
-}
-
-static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-{
-	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
-	int iface;
-	int ret;
-
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_NB_NF:
-		asi_cfg_1 = TAS2764_TDM_CFG1_RX_RISING;
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		asi_cfg_1 = TAS2764_TDM_CFG1_RX_FALLING;
-		break;
-	default:
-		dev_err(tas2764->dev, "ASI format Inverse is not found\n");
-		return -EINVAL;
-	}
-
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
-					    TAS2764_TDM_CFG1_RX_MASK,
-					    asi_cfg_1);
-	if (ret < 0)
-		return ret;
-
-	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-	case SND_SOC_DAIFMT_DSP_A:
-		iface = TAS2764_TDM_CFG2_SCFG_I2S;
-		tdm_rx_start_slot = 1;
-		break;
-	case SND_SOC_DAIFMT_DSP_B:
-	case SND_SOC_DAIFMT_LEFT_J:
-		iface = TAS2764_TDM_CFG2_SCFG_LEFT_J;
-		tdm_rx_start_slot = 0;
-		break;
-	default:
-		dev_err(tas2764->dev,
-			"DAI Format is not found, fmt=0x%x\n", fmt);
-		return -EINVAL;
-	}
-
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
-					    TAS2764_TDM_CFG1_MASK,
-					    (tdm_rx_start_slot << TAS2764_TDM_CFG1_51_SHIFT));
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
-					    TAS2764_TDM_CFG2_SCFG_MASK, iface);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
-				unsigned int tx_mask,
-				unsigned int rx_mask,
-				int slots, int slot_width)
-{
-	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int left_slot, right_slot;
-	int slots_cfg;
-	int slot_size;
-	int ret;
-
-	if (tx_mask == 0 || rx_mask != 0)
-		return -EINVAL;
-
-	if (slots == 1) {
-		if (tx_mask != 1)
-			return -EINVAL;
-		left_slot = 0;
-		right_slot = 0;
-	} else {
-		left_slot = __ffs(tx_mask);
-		tx_mask &= ~(1 << left_slot);
-		if (tx_mask == 0) {
-			right_slot = left_slot;
-		} else {
-			right_slot = __ffs(tx_mask);
-			tx_mask &= ~(1 << right_slot);
-		}
-	}
-
-	if (tx_mask != 0 || left_slot >= slots || right_slot >= slots)
-		return -EINVAL;
-
-	slots_cfg = (right_slot << TAS2764_TDM_CFG3_RXS_SHIFT) | left_slot;
-
-	ret = snd_soc_component_write(component, TAS2764_TDM_CFG3, slots_cfg);
-	if (ret)
-		return ret;
-
-	switch (slot_width) {
-	case 16:
-		slot_size = TAS2764_TDM_CFG2_RXS_16BITS;
-		break;
-	case 24:
-		slot_size = TAS2764_TDM_CFG2_RXS_24BITS;
-		break;
-	case 32:
-		slot_size = TAS2764_TDM_CFG2_RXS_32BITS;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
-					    TAS2764_TDM_CFG2_RXS_MASK,
-					    slot_size);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_50_MASK,
-					    tas2764->v_sense_slot);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_50_MASK,
-					    tas2764->i_sense_slot);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static const struct snd_soc_dai_ops tas2764_dai_ops = {
-	.mute_stream = tas2764_mute,
-	.hw_params  = tas2764_hw_params,
-	.set_fmt    = tas2764_set_fmt,
-	.set_tdm_slot = tas2764_set_dai_tdm_slot,
-	.no_capture_mute = 1,
-};
-
-#define TAS2764_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
-			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
-
-#define TAS2764_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
-		       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
-
-static struct snd_soc_dai_driver tas2764_dai_driver[] = {
-	{
-		.name = "tas2764 ASI1",
-		.id = 0,
-		.playback = {
-			.stream_name    = "ASI1 Playback",
-			.channels_min   = 2,
-			.channels_max   = 2,
-			.rates      = TAS2764_RATES,
-			.formats    = TAS2764_FORMATS,
-		},
-		.capture = {
-			.stream_name    = "ASI1 Capture",
-			.channels_min   = 0,
-			.channels_max   = 2,
-			.rates = TAS2764_RATES,
-			.formats = TAS2764_FORMATS,
-		},
-		.ops = &tas2764_dai_ops,
-		.symmetric_rate = 1,
-	},
-};
-
-static int tas2764_codec_probe(struct snd_soc_component *component)
-{
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	tas2764->component = component;
-
-	if (tas2764->sdz_gpio)
-		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
-
-	tas2764_reset(tas2764);
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    TAS2764_PWR_CTRL_MUTE);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static DECLARE_TLV_DB_SCALE(tas2764_digital_tlv, 1100, 50, 0);
-static DECLARE_TLV_DB_SCALE(tas2764_playback_volume, -10000, 50, 0);
-
-static const struct snd_kcontrol_new tas2764_snd_controls[] = {
-	SOC_SINGLE_TLV("Speaker Volume", TAS2764_DVC, 0,
-		       TAS2764_DVC_MAX, 1, tas2764_playback_volume),
-	SOC_SINGLE_TLV("Amp Gain Volume", TAS2764_CHNL_0, 0, 0x14, 0,
-		       tas2764_digital_tlv),
-};
-
-static const struct snd_soc_component_driver soc_component_driver_tas2764 = {
-	.probe			= tas2764_codec_probe,
-	.suspend		= tas2764_codec_suspend,
-	.resume			= tas2764_codec_resume,
-	.set_bias_level		= tas2764_set_bias_level,
-	.controls		= tas2764_snd_controls,
-	.num_controls		= ARRAY_SIZE(tas2764_snd_controls),
-	.dapm_widgets		= tas2764_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(tas2764_dapm_widgets),
-	.dapm_routes		= tas2764_audio_map,
-	.num_dapm_routes	= ARRAY_SIZE(tas2764_audio_map),
-	.idle_bias_on		= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-};
-
-static const struct reg_default tas2764_reg_defaults[] = {
-	{ TAS2764_PAGE, 0x00 },
-	{ TAS2764_SW_RST, 0x00 },
-	{ TAS2764_PWR_CTRL, 0x1a },
-	{ TAS2764_DVC, 0x00 },
-	{ TAS2764_CHNL_0, 0x00 },
-	{ TAS2764_TDM_CFG0, 0x09 },
-	{ TAS2764_TDM_CFG1, 0x02 },
-	{ TAS2764_TDM_CFG2, 0x0a },
-	{ TAS2764_TDM_CFG3, 0x10 },
-	{ TAS2764_TDM_CFG5, 0x42 },
-};
-
-static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
-	{
-		.range_min = 0,
-		.range_max = 1 * 128,
-		.selector_reg = TAS2764_PAGE,
-		.selector_mask = 0xff,
-		.selector_shift = 0,
-		.window_start = 0,
-		.window_len = 128,
-	},
-};
-
-static const struct regmap_config tas2764_i2c_regmap = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.reg_defaults = tas2764_reg_defaults,
-	.num_reg_defaults = ARRAY_SIZE(tas2764_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
-	.ranges = tas2764_regmap_ranges,
-	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
-	.max_register = 1 * 128,
-};
-
-static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)
-{
-	int ret = 0;
-
-	tas2764->reset_gpio = devm_gpiod_get_optional(tas2764->dev, "reset",
-						      GPIOD_OUT_HIGH);
-	if (IS_ERR(tas2764->reset_gpio)) {
-		if (PTR_ERR(tas2764->reset_gpio) == -EPROBE_DEFER) {
-			tas2764->reset_gpio = NULL;
-			return -EPROBE_DEFER;
-		}
-	}
-
-	tas2764->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
-	if (IS_ERR(tas2764->sdz_gpio)) {
-		if (PTR_ERR(tas2764->sdz_gpio) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		tas2764->sdz_gpio = NULL;
-	}
-
-	ret = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
-				       &tas2764->i_sense_slot);
-	if (ret)
-		tas2764->i_sense_slot = 0;
-
-	ret = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
-				       &tas2764->v_sense_slot);
-	if (ret)
-		tas2764->v_sense_slot = 2;
-
-	return 0;
-}
-
-static int tas2764_i2c_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
-{
-	struct tas2764_priv *tas2764;
-	int result;
-
-	tas2764 = devm_kzalloc(&client->dev, sizeof(struct tas2764_priv),
-			       GFP_KERNEL);
-	if (!tas2764)
-		return -ENOMEM;
-
-	tas2764->dev = &client->dev;
-	i2c_set_clientdata(client, tas2764);
-	dev_set_drvdata(&client->dev, tas2764);
-
-	tas2764->regmap = devm_regmap_init_i2c(client, &tas2764_i2c_regmap);
-	if (IS_ERR(tas2764->regmap)) {
-		result = PTR_ERR(tas2764->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-					result);
-		return result;
-	}
-
-	if (client->dev.of_node) {
-		result = tas2764_parse_dt(&client->dev, tas2764);
-		if (result) {
-			dev_err(tas2764->dev, "%s: Failed to parse devicetree\n",
-				__func__);
-			return result;
-		}
-	}
-
-	return devm_snd_soc_register_component(tas2764->dev,
-					       &soc_component_driver_tas2764,
-					       tas2764_dai_driver,
-					       ARRAY_SIZE(tas2764_dai_driver));
-}
-
-static const struct i2c_device_id tas2764_i2c_id[] = {
-	{ "tas2764", 0},
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, tas2764_i2c_id);
-
-#if defined(CONFIG_OF)
-static const struct of_device_id tas2764_of_match[] = {
-	{ .compatible = "ti,tas2764" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, tas2764_of_match);
-#endif
-
-static struct i2c_driver tas2764_i2c_driver = {
-	.driver = {
-		.name   = "tas2764",
-		.of_match_table = of_match_ptr(tas2764_of_match),
-	},
-	.probe      = tas2764_i2c_probe,
-	.id_table   = tas2764_i2c_id,
-};
-module_i2c_driver(tas2764_i2c_driver);
-
-MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
-MODULE_DESCRIPTION("TAS2764 I2C Smart Amplifier driver");
-MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/tas27xx.c b/sound/soc/codecs/tas27xx.c
new file mode 100644
index 000000000000..4a0ba32bdcdb
--- /dev/null
+++ b/sound/soc/codecs/tas27xx.c
@@ -0,0 +1,861 @@
+// SPDX-License-Identifier: GPL-2.0
+// Driver for the Texas Instruments TAS2764/TAS2780 Mono
+//		Audio amplifier
+// Copyright (C) 2022 Texas Instruments Inc.
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/delay.h>
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
+#include <sound/initval.h>
+#include <sound/tlv.h>
+#include <linux/version.h>
+
+#include "tas27xx.h"
+
+struct tas27xx_priv {
+	struct snd_soc_component *component;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *sdz_gpio;
+	struct regmap *regmap;
+	struct device *dev;
+	struct mutex codec_lock;
+	int v_sense_slot;
+	int i_sense_slot;
+	int device_id;
+	bool mbPowerUp;
+};
+
+typedef enum tas27xx {
+	TAS2764 = 0,
+	TAS2780 = 1,
+} tas27xx_t;
+
+static void tas27xx_reset(struct tas27xx_priv *tas27xx)
+{
+	if (tas27xx->reset_gpio) {
+		gpiod_set_value_cansleep(tas27xx->reset_gpio, 0);
+		msleep(20);
+		gpiod_set_value_cansleep(tas27xx->reset_gpio, 1);
+	}
+
+	snd_soc_component_write(tas27xx->component, TAS2764_SW_RST,
+				TAS2764_RST);
+}
+
+static int tas27xx_set_bias_level(
+	struct snd_soc_component *component,
+	enum snd_soc_bias_level level)
+{
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	mutex_lock(&tas27xx->codec_lock);
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_ACTIVE);
+		if (ret >= 0) {
+			tas27xx->mbPowerUp = true;
+			ret = 0;
+		}
+		break;
+	case SND_SOC_BIAS_STANDBY:
+	case SND_SOC_BIAS_PREPARE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_MUTE);
+		if (ret >= 0) {
+			tas27xx->mbPowerUp = true;
+			ret = 0;
+		}
+		break;
+	case SND_SOC_BIAS_OFF:
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_SHUTDOWN);
+		if (ret >= 0) {
+			tas27xx->mbPowerUp = false;
+			ret = 0;
+		}
+		break;
+	default:
+		dev_err(tas27xx->dev,
+			"wrong power level setting %d\n", level);
+		ret = -EINVAL;
+	}
+	if (ret < 0)
+		pr_err("%s:%u:errCode:0x%0x:set BIAS error\n",
+			__func__, __LINE__, ret);
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
+}
+
+#ifdef CONFIG_PM
+static int tas27xx_codec_suspend(
+	struct snd_soc_component *component)
+{
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	mutex_lock(&tas27xx->codec_lock);
+	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
+		TAS2764_PWR_CTRL_MASK,
+		TAS2764_PWR_CTRL_SHUTDOWN);
+
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%0x:power down error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+	ret = 0;
+	tas27xx->mbPowerUp = false;
+	if (tas27xx->sdz_gpio)
+		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 0);
+
+	regcache_cache_only(tas27xx->regmap, true);
+	regcache_mark_dirty(tas27xx->regmap);
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
+}
+
+static int tas27xx_codec_resume(
+	struct snd_soc_component *component)
+{
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	mutex_lock(&tas27xx->codec_lock);
+	if (tas27xx->sdz_gpio)
+		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
+
+	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
+		TAS2764_PWR_CTRL_MASK, TAS2764_PWR_CTRL_ACTIVE);
+
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%0x:power down error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+	ret = 0;
+	tas27xx->mbPowerUp = false;
+	regcache_cache_only(tas27xx->regmap, false);
+	ret = regcache_sync(tas27xx->regmap);
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
+}
+#endif
+
+static const char * const tas2764_ASI1_src[] = {
+	"I2C offset", "Left", "Right", "LeftRightDiv2",
+};
+
+static SOC_ENUM_SINGLE_DECL(
+	tas2764_ASI1_src_enum, TAS2764_TDM_CFG2, 4, tas2764_ASI1_src);
+
+static const struct snd_kcontrol_new tas2764_asi1_mux =
+	SOC_DAPM_ENUM("ASI1 Source", tas2764_ASI1_src_enum);
+
+static int tas27xx_dac_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	mutex_lock(&tas27xx->codec_lock);
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_MUTE);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_SHUTDOWN);
+		break;
+	default:
+		dev_err(tas27xx->dev, "Unsupported event\n");
+			ret = -EINVAL;
+	}
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%0x:PWR_CTRL error\n",
+			__func__, __LINE__, ret);
+	} else {
+		ret = 0;
+	}
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
+}
+
+static const struct snd_kcontrol_new isense_switch =
+	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL,
+					TAS2764_ISENSE_POWER_EN, 1, 1);
+static const struct snd_kcontrol_new vsense_switch =
+	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL,
+					TAS2764_VSENSE_POWER_EN, 1, 1);
+
+static const struct snd_soc_dapm_widget tas2764_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0,
+		SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0,
+		&tas2764_asi1_mux),
+	SND_SOC_DAPM_SWITCH("ISENSE", TAS2764_PWR_CTRL,
+		TAS2764_ISENSE_POWER_EN, 1, &isense_switch),
+	SND_SOC_DAPM_SWITCH("VSENSE", TAS2764_PWR_CTRL,
+		TAS2764_VSENSE_POWER_EN, 1, &vsense_switch),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0,
+		tas27xx_dac_event,
+		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+	SND_SOC_DAPM_SIGGEN("VMON"),
+	SND_SOC_DAPM_SIGGEN("IMON")
+};
+
+static const struct snd_soc_dapm_route tas2764_audio_map[] = {
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
+static int tas27xx_mute(struct snd_soc_dai *dai, int mute,
+	int direction)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	mutex_lock(&tas27xx->codec_lock);
+
+	if (mute == 0) {
+		ret = snd_soc_component_update_bits(component,
+			TAS27XX_CLK_CFG,
+			TAS27XX_CLK_CFG_MASK,
+			TAS27XX_CLK_CFG_ENABLE);
+		if (ret < 0) {
+			dev_err(tas27xx->dev,
+				"%s:%u: Failed to CLK_CFG_ENABLE\n",
+				__func__, __LINE__);
+			goto EXIT;
+		}
+		usleep_range(2000, 2000);
+	}
+	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
+		TAS2764_PWR_CTRL_MASK,
+		mute ? TAS2764_PWR_CTRL_MUTE : 0);
+	if (ret >= 0) {
+		tas27xx->mbPowerUp = mute?false:true;
+		ret = 0;
+	}
+
+	if (ret < 0) {
+		pr_err("%s:%u: Failed to set powercontrol\n",
+			__func__, __LINE__);
+	}
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
+}
+
+static int tas27xx_set_bitwidth(struct tas27xx_priv *tas27xx,
+	int bitwidth)
+{
+	struct snd_soc_component *component = tas27xx->component;
+	int sense_en, val, ret, slot_size;
+
+	mutex_lock(&tas27xx->codec_lock);
+	switch (bitwidth) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_TDM_CFG2,
+			TAS2764_TDM_CFG2_RXW_MASK,
+			TAS2764_TDM_CFG2_RXW_16BITS);
+		slot_size = TAS2764_TDM_CFG2_RXS_16BITS;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_TDM_CFG2, TAS2764_TDM_CFG2_RXW_MASK,
+			TAS2764_TDM_CFG2_RXW_24BITS);
+		slot_size = TAS2764_TDM_CFG2_RXS_24BITS;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_TDM_CFG2, TAS2764_TDM_CFG2_RXW_MASK,
+			TAS2764_TDM_CFG2_RXW_32BITS);
+		slot_size = TAS2764_TDM_CFG2_RXS_32BITS;
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x set bitwidth error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
+		TAS2764_TDM_CFG2_RXS_MASK, slot_size);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x set RX slot size error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+
+	val = snd_soc_component_read(tas27xx->component,
+		TAS2764_PWR_CTRL);
+
+	if (val < 0) {
+		pr_err("%s:%u:errCode:0x%x read PWR_CTRL error\n",
+			__func__, __LINE__, val);
+		ret = val;
+		goto EXIT;
+	}
+
+	if (val & (1 << TAS2764_VSENSE_POWER_EN))
+		sense_en = 0;
+	else
+		sense_en = TAS2764_TDM_CFG5_VSNS_ENABLE;
+
+	ret = snd_soc_component_update_bits(tas27xx->component,
+		TAS2764_TDM_CFG5, TAS2764_TDM_CFG5_VSNS_ENABLE, sense_en);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x enable vSNS error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+
+	if (val & (1 << TAS2764_ISENSE_POWER_EN))
+		sense_en = 0;
+	else
+		sense_en = TAS2764_TDM_CFG6_ISNS_ENABLE;
+
+	ret = snd_soc_component_update_bits(tas27xx->component,
+		TAS2764_TDM_CFG6, TAS2764_TDM_CFG6_ISNS_ENABLE, sense_en);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x enable iSNS error\n",
+			__func__, __LINE__, ret);
+	}
+	ret = 0;
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
+}
+
+static int tas27xx_set_samplerate(
+	struct tas27xx_priv *tas27xx, int samplerate)
+{
+	struct snd_soc_component *component = tas27xx->component;
+	int ramp_rate_val;
+	int ret;
+
+	switch (samplerate) {
+	case 48000:
+		ramp_rate_val = TAS2764_TDM_CFG0_SMP_48KHZ |
+				TAS2764_TDM_CFG0_44_1_48KHZ;
+		break;
+	case 44100:
+		ramp_rate_val = TAS2764_TDM_CFG0_SMP_44_1KHZ |
+				TAS2764_TDM_CFG0_44_1_48KHZ;
+		break;
+	case 96000:
+		ramp_rate_val = TAS2764_TDM_CFG0_SMP_48KHZ |
+				TAS2764_TDM_CFG0_88_2_96KHZ;
+		break;
+	case 88200:
+		ramp_rate_val = TAS2764_TDM_CFG0_SMP_44_1KHZ |
+				TAS2764_TDM_CFG0_88_2_96KHZ;
+		break;
+	default:
+		return -EINVAL;
+	}
+	mutex_lock(&tas27xx->codec_lock);
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG0,
+					    TAS2764_TDM_CFG0_SMP_MASK |
+					    TAS2764_TDM_CFG0_MASK,
+					    ramp_rate_val);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set ramp_rate_val\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+	ret = 0;
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
+}
+
+static int tas27xx_hw_params(
+	struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params,
+	struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = tas27xx_set_bitwidth(tas27xx, params_format(params));
+	if (ret < 0)
+		return ret;
+
+	return tas27xx_set_samplerate(tas27xx, params_rate(params));
+}
+
+static int tas27xx_set_fmt(struct snd_soc_dai *dai,
+	unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
+	int iface;
+	int ret = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		asi_cfg_1 = TAS2764_TDM_CFG1_RX_RISING;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		asi_cfg_1 = TAS2764_TDM_CFG1_RX_FALLING;
+		break;
+	default:
+		dev_err(tas27xx->dev, "ASI format Inverse is not found\n");
+		return -EINVAL;
+	}
+	mutex_lock(&tas27xx->codec_lock);
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
+		TAS2764_TDM_CFG1_RX_MASK, asi_cfg_1);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set asi_cfg_1\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+	case SND_SOC_DAIFMT_DSP_A:
+		iface = TAS2764_TDM_CFG2_SCFG_I2S;
+		tdm_rx_start_slot = 1;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+	case SND_SOC_DAIFMT_LEFT_J:
+		iface = TAS2764_TDM_CFG2_SCFG_LEFT_J;
+		tdm_rx_start_slot = 0;
+		break;
+	default:
+		pr_err("%s:%u:DAI Format is not found, fmt=0x%x\n",
+			__func__, __LINE__, fmt);
+		ret = -EINVAL;
+		goto EXIT;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
+		TAS2764_TDM_CFG1_MASK,
+		(tdm_rx_start_slot << TAS2764_TDM_CFG1_51_SHIFT));
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set tdm_rx_start_slot\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
+		TAS2764_TDM_CFG2_SCFG_MASK, iface);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set iface\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+	ret = 0;
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
+}
+
+static int tas27xx_set_dai_tdm_slot(
+	struct snd_soc_dai *dai, unsigned int tx_mask,
+	unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas27xx_priv *tas27xx =
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
+	slots_cfg = (right_slot << TAS2764_TDM_CFG3_RXS_SHIFT) |
+		left_slot;
+	mutex_lock(&tas27xx->codec_lock);
+	ret = snd_soc_component_write(component, TAS2764_TDM_CFG3,
+		slots_cfg);
+	if (ret) {
+		pr_err("%s:%u:errCode:0x%x Failed to set slots_cfg\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+
+	switch (slot_width) {
+	case 16:
+		slot_size = TAS2764_TDM_CFG2_RXS_16BITS;
+		break;
+	case 24:
+		slot_size = TAS2764_TDM_CFG2_RXS_24BITS;
+		break;
+	case 32:
+		slot_size = TAS2764_TDM_CFG2_RXS_32BITS;
+		break;
+	default:
+		ret = -EINVAL;
+		goto EXIT;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
+		TAS2764_TDM_CFG2_RXS_MASK, slot_size);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set slot_size\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
+		TAS2764_TDM_CFG5_50_MASK, tas27xx->v_sense_slot);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set v_sense_slot\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
+					    TAS2764_TDM_CFG6_50_MASK,
+					    tas27xx->i_sense_slot);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set i_sense_slot\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+	ret = 0;
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
+}
+
+static const struct snd_soc_dai_ops tas2764_dai_ops = {
+	.mute_stream = tas27xx_mute,
+	.hw_params  = tas27xx_hw_params,
+	.set_fmt    = tas27xx_set_fmt,
+	.set_tdm_slot = tas27xx_set_dai_tdm_slot,
+	.no_capture_mute = 1,
+};
+
+#define TAS2764_FORMATS \
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
+	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+#define TAS2764_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
+		       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
+
+static struct snd_soc_dai_driver tas2764_dai_driver[] = {
+	{
+		.name = "tas2764 ASI1",
+		.id = 0,
+		.playback = {
+			.stream_name    = "ASI1 Playback",
+			.channels_min   = 2,
+			.channels_max   = 2,
+			.rates      = TAS2764_RATES,
+			.formats    = TAS2764_FORMATS,
+		},
+		.capture = {
+			.stream_name    = "ASI1 Capture",
+			.channels_min   = 1,
+			.channels_max   = 2,
+			.rates = TAS2764_RATES,
+			.formats = TAS2764_FORMATS,
+		},
+		.ops = &tas2764_dai_ops,
+		.symmetric_rates = 1,
+	},
+};
+
+static int tas27xx_codec_probe(
+	struct snd_soc_component *component)
+{
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	tas27xx->component = component;
+
+	if (tas27xx->sdz_gpio)
+		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
+
+	tas27xx_reset(tas27xx);
+
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
+					    TAS2764_TDM_CFG5_VSNS_ENABLE, 0);
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to enable vSNS\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
+					    TAS2764_TDM_CFG6_ISNS_ENABLE, 0);
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to enable iSNS\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
+	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
+					    TAS2764_PWR_CTRL_MASK,
+					    TAS2764_PWR_CTRL_MUTE);
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to PWR_CTRL_MUTE\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
+
+	ret = snd_soc_component_write(component, TAS2764_PWR_CTRL, 0x02);
+
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to initial active\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
+	ret = 0;
+EXIT:
+	return ret;
+}
+
+static DECLARE_TLV_DB_SCALE(tas2764_digital_tlv, 1100, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas2764_playback_volume,
+	-10000, 50, 0);
+
+static const struct snd_kcontrol_new tas2764_snd_controls[] = {
+	SOC_SINGLE_TLV("Speaker Volume", TAS2764_DVC, 0,
+		       TAS2764_DVC_MAX, 1, tas2764_playback_volume),
+	SOC_SINGLE_TLV("Amp Gain Volume", TAS2764_CHNL_0, 0, 0x14, 0,
+		       tas2764_digital_tlv),
+};
+
+static const struct snd_soc_component_driver
+	soc_component_driver_tas2764 = {
+	.probe			= tas27xx_codec_probe,
+#ifdef CONFIG_PM
+	.suspend		= tas27xx_codec_suspend,
+	.resume			= tas27xx_codec_resume,
+#endif
+	.set_bias_level		= tas27xx_set_bias_level,
+	.controls		= tas2764_snd_controls,
+	.num_controls		= ARRAY_SIZE(tas2764_snd_controls),
+	.dapm_widgets		= tas2764_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tas2764_dapm_widgets),
+	.dapm_routes		= tas2764_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(tas2764_audio_map),
+	.idle_bias_on		= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct reg_default tas2764_reg_defaults[] = {
+	{ TAS2764_PAGE, 0x00 },
+	{ TAS2764_SW_RST, 0x00 },
+	{ TAS2764_PWR_CTRL, 0x1a },
+	{ TAS2764_DVC, 0x00 },
+	{ TAS2764_CHNL_0, 0x00 },
+	{ TAS2764_TDM_CFG0, 0x09 },
+	{ TAS2764_TDM_CFG1, 0x02 },
+	{ TAS2764_TDM_CFG2, 0x0a },
+	{ TAS2764_TDM_CFG3, 0x10 },
+	{ TAS2764_TDM_CFG5, 0x42 },
+};
+
+static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = 1 * 128,
+		.selector_reg = TAS2764_PAGE,
+		.selector_mask = 0xff,
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = 128,
+	},
+};
+
+static bool tas27xx_volatile(struct device *dev,
+	unsigned int reg)
+{
+		return true;
+}
+
+static const struct regmap_config tas2764_i2c_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_defaults = tas2764_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas2764_reg_defaults),
+	.cache_type = REGCACHE_RBTREE,
+	.ranges = tas2764_regmap_ranges,
+	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
+	.max_register = 1 * 128,
+	.volatile_reg = tas27xx_volatile,
+};
+
+static int tas27xx_parse_dt(struct device *dev,
+	struct tas27xx_priv *tas27xx)
+{
+	int ret = 0;
+
+	tas27xx->reset_gpio = devm_gpiod_get_optional(tas27xx->dev,
+		"reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(tas27xx->reset_gpio)) {
+		if (PTR_ERR(tas27xx->reset_gpio) == -EPROBE_DEFER) {
+			tas27xx->reset_gpio = NULL;
+			return -EPROBE_DEFER;
+		}
+	}
+
+	tas27xx->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown",
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(tas27xx->sdz_gpio)) {
+		if (PTR_ERR(tas27xx->sdz_gpio) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		tas27xx->sdz_gpio = NULL;
+	}
+
+	ret = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
+		&tas27xx->i_sense_slot);
+	if (ret)
+		tas27xx->i_sense_slot = 0;
+
+	ret = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
+		&tas27xx->v_sense_slot);
+	if (ret)
+		tas27xx->v_sense_slot = 2;
+
+	return 0;
+}
+
+static int tas27xx_i2c_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct tas27xx_priv *tas27xx;
+	int result;
+
+	tas27xx = devm_kzalloc(&client->dev, sizeof(struct tas27xx_priv),
+			       GFP_KERNEL);
+	if (!tas27xx)
+		return -ENOMEM;
+	mutex_init(&tas27xx->codec_lock);
+	tas27xx->dev = &client->dev;
+	i2c_set_clientdata(client, tas27xx);
+	dev_set_drvdata(&client->dev, tas27xx);
+
+	tas27xx->regmap = devm_regmap_init_i2c(client,
+		&tas2764_i2c_regmap);
+	if (IS_ERR(tas27xx->regmap)) {
+		result = PTR_ERR(tas27xx->regmap);
+		dev_err(&client->dev, "Failed to allocate register map: %d\n",
+			result);
+		return result;
+	}
+
+	if (client->dev.of_node) {
+		result = tas27xx_parse_dt(&client->dev, tas27xx);
+		if (result) {
+			dev_err(tas27xx->dev,
+				"%s: Failed to parse devicetree\n", __func__);
+			return result;
+		}
+	}
+
+	tas27xx->device_id = id->driver_data;
+	dev_info(tas27xx->dev, "chip_id: %u\n", tas27xx->device_id);
+
+	return devm_snd_soc_register_component(tas27xx->dev,
+		&soc_component_driver_tas2764, tas2764_dai_driver,
+		ARRAY_SIZE(tas2764_dai_driver));
+}
+
+static const struct i2c_device_id tas2764_i2c_id[] = {
+	{ "tas2764", TAS2764},
+	{ "tas2780", TAS2780},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tas2764_i2c_id);
+
+#if defined(CONFIG_OF)
+static const struct of_device_id tas2764_of_match[] = {
+	{ .compatible = "ti,tas2764" },
+	{ .compatible = "ti,tas2780" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tas2764_of_match);
+#endif
+
+static struct i2c_driver tas2764_i2c_driver = {
+	.driver = {
+		.name   = "tas27xx",
+		.of_match_table = of_match_ptr(tas2764_of_match),
+	},
+	.probe      = tas27xx_i2c_probe,
+	.id_table   = tas2764_i2c_id,
+};
+module_i2c_driver(tas2764_i2c_driver);
+
+MODULE_AUTHOR("Raphael Xu <raphael-xu@ti.com>");
+MODULE_DESCRIPTION("TAS27XX I2C Smart Amplifier driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas27xx.h
similarity index 81%
rename from sound/soc/codecs/tas2764.h
rename to sound/soc/codecs/tas27xx.h
index 67d6fd903c42..02b29c030d37 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas27xx.h
@@ -1,18 +1,20 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * tas2764.h - ALSA SoC Texas Instruments TAS2764 Mono Audio Amplifier
+ * tas27xx.h - ALSA SoC Texas Instruments TAS2764/TAS2780
+ *		Mono Audio Amplifier
  *
- * Copyright (C) 2020 Texas Instruments Incorporated -  https://www.ti.com
+ * Copyright (C) 2022 Texas Instruments Incorporated -
+ *		https://www.ti.com
  *
- * Author: Dan Murphy <dmurphy@ti.com>
+ * Author:
  */
 
-#ifndef __TAS2764__
-#define __TAS2764__
+#ifndef __TAS27XX__H_
+#define __TAS27XX__H_
 
 /* Book Control Register */
-#define TAS2764_BOOKCTL_PAGE	0
-#define TAS2764_BOOKCTL_REG	127
+#define TAS27XX_BOOKCTL_PAGE	0
+#define TAS27XX_BOOKCTL_REG	127
 #define TAS2764_REG(page, reg)	((page * 128) + reg)
 
 /* Page */
@@ -77,6 +79,10 @@
 #define TAS2764_TDM_CFG3_RXS_SHIFT	0x4
 #define TAS2764_TDM_CFG3_MASK		GENMASK(3, 0)
 
+/* TDM Configuration Reg4 */
+#define TAS2764_TDM_CFG4		TAS2764_REG(0X0, 0x0d)
+#define TAS2764_TDM_CFG4_TX_OFFSET_MASK	GENMASK(3, 1)
+
 /* TDM Configuration Reg5 */
 #define TAS2764_TDM_CFG5		TAS2764_REG(0X0, 0x0e)
 #define TAS2764_TDM_CFG5_VSNS_MASK	BIT(6)
@@ -89,4 +95,9 @@
 #define TAS2764_TDM_CFG6_ISNS_ENABLE	BIT(6)
 #define TAS2764_TDM_CFG6_50_MASK	GENMASK(5, 0)
 
-#endif /* __TAS2764__ */
+/* INT&CLK CFG */
+#define TAS27XX_CLK_CFG			TAS2764_REG(0X0, 0x5c)
+#define TAS27XX_CLK_CFG_MASK		GENMASK(7, 6)
+#define TAS27XX_CLK_CFG_ENABLE		(BIT(7) | BIT(6))
+
+#endif /* __TAS27XX__H_ */
\ No newline at end of file
-- 
2.35.1



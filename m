Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9264E4BE7
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 05:29:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D9516F7;
	Wed, 23 Mar 2022 05:28:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D9516F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648009745;
	bh=CcsVNEPRaljXASV97i9parkCdZkDpyjKlHPfl6D1bJM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ROD+qMldmlrl2yuWnu38xIPqV1fnev4B+g/SrNwNfjT7kIydM28Rfvq0tXv7BEqpx
	 fJr6KyyYAN1VsOW0S5I4cR9jzDM9xZ6J6ItE7Ix3NEfyDJRutUbYY84HMh+PTa/uII
	 JbgN3CT37Jos4rW6V1t6Tc6smnyNyGL8u91VqZHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 536FBF804D0;
	Wed, 23 Mar 2022 05:27:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97963F80310; Wed, 23 Mar 2022 05:27:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A13CCF80165
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 05:27:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A13CCF80165
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[192.163.20.102])
 by rmsmtp-lg-appmail-35-12049 (RichMail) with SMTP id 2f11623aa18b8b8-888f3;
 Wed, 23 Mar 2022 12:27:13 +0800 (CST)
X-RM-TRANSID: 2f11623aa18b8b8-888f3
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v4 2/3] update tas27xx.c to support either TAS2764 or TAS2780
Date: Wed, 23 Mar 2022 12:26:43 +0800
Message-Id: <20220323042644.635-2-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323042644.635-1-13691752556@139.com>
References: <20220323042644.635-1-13691752556@139.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 sound/soc/codecs/tas27xx.c | 695 +++++++++++++++++++++++--------------
 1 file changed, 434 insertions(+), 261 deletions(-)

diff --git a/sound/soc/codecs/tas27xx.c b/sound/soc/codecs/tas27xx.c
index 9265af41c235..4a0ba32bdcdb 100644
--- a/sound/soc/codecs/tas27xx.c
+++ b/sound/soc/codecs/tas27xx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
-//
-// Driver for the Texas Instruments TAS2764 CODEC
-// Copyright (C) 2020 Texas Instruments Inc.
+// Driver for the Texas Instruments TAS2764/TAS2780 Mono
+//		Audio amplifier
+// Copyright (C) 2022 Texas Instruments Inc.
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -12,118 +12,158 @@
 #include <linux/i2c.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
+#include <linux/version.h>
 
-#include "tas2764.h"
+#include "tas27xx.h"
 
-struct tas2764_priv {
+struct tas27xx_priv {
 	struct snd_soc_component *component;
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *sdz_gpio;
 	struct regmap *regmap;
 	struct device *dev;
-	
+	struct mutex codec_lock;
 	int v_sense_slot;
 	int i_sense_slot;
+	int device_id;
+	bool mbPowerUp;
 };
 
-static void tas2764_reset(struct tas2764_priv *tas2764)
+typedef enum tas27xx {
+	TAS2764 = 0,
+	TAS2780 = 1,
+} tas27xx_t;
+
+static void tas27xx_reset(struct tas27xx_priv *tas27xx)
 {
-	if (tas2764->reset_gpio) {
-		gpiod_set_value_cansleep(tas2764->reset_gpio, 0);
+	if (tas27xx->reset_gpio) {
+		gpiod_set_value_cansleep(tas27xx->reset_gpio, 0);
 		msleep(20);
-		gpiod_set_value_cansleep(tas2764->reset_gpio, 1);
+		gpiod_set_value_cansleep(tas27xx->reset_gpio, 1);
 	}
 
-	snd_soc_component_write(tas2764->component, TAS2764_SW_RST,
+	snd_soc_component_write(tas27xx->component, TAS2764_SW_RST,
 				TAS2764_RST);
 }
 
-static int tas2764_set_bias_level(struct snd_soc_component *component,
-				 enum snd_soc_bias_level level)
+static int tas27xx_set_bias_level(
+	struct snd_soc_component *component,
+	enum snd_soc_bias_level level)
 {
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
+	mutex_lock(&tas27xx->codec_lock);
 	switch (level) {
 	case SND_SOC_BIAS_ON:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_ACTIVE);
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_ACTIVE);
+		if (ret >= 0) {
+			tas27xx->mbPowerUp = true;
+			ret = 0;
+		}
 		break;
 	case SND_SOC_BIAS_STANDBY:
 	case SND_SOC_BIAS_PREPARE:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_MUTE);
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_MUTE);
+		if (ret >= 0) {
+			tas27xx->mbPowerUp = true;
+			ret = 0;
+		}
 		break;
 	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_SHUTDOWN);
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_SHUTDOWN);
+		if (ret >= 0) {
+			tas27xx->mbPowerUp = false;
+			ret = 0;
+		}
 		break;
-
 	default:
-		dev_err(tas2764->dev,
-				"wrong power level setting %d\n", level);
-		return -EINVAL;
+		dev_err(tas27xx->dev,
+			"wrong power level setting %d\n", level);
+		ret = -EINVAL;
 	}
-
-	return 0;
+	if (ret < 0)
+		pr_err("%s:%u:errCode:0x%0x:set BIAS error\n",
+			__func__, __LINE__, ret);
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
 }
 
 #ifdef CONFIG_PM
-static int tas2764_codec_suspend(struct snd_soc_component *component)
+static int tas27xx_codec_suspend(
+	struct snd_soc_component *component)
 {
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
+	mutex_lock(&tas27xx->codec_lock);
 	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
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
+		TAS2764_PWR_CTRL_MASK,
+		TAS2764_PWR_CTRL_SHUTDOWN);
 
-	return 0;
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
 }
 
-static int tas2764_codec_resume(struct snd_soc_component *component)
+static int tas27xx_codec_resume(
+	struct snd_soc_component *component)
 {
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
-	if (tas2764->sdz_gpio)
-		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
+	mutex_lock(&tas27xx->codec_lock);
+	if (tas27xx->sdz_gpio)
+		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
 
 	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    TAS2764_PWR_CTRL_ACTIVE);
-
-	if (ret < 0)
-		return ret;
-
-	regcache_cache_only(tas2764->regmap, false);
+		TAS2764_PWR_CTRL_MASK, TAS2764_PWR_CTRL_ACTIVE);
 
-	return regcache_sync(tas2764->regmap);
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
 }
-#else
-#define tas2764_codec_suspend NULL
-#define tas2764_codec_resume NULL
 #endif
 
 static const char * const tas2764_ASI1_src[] = {
@@ -136,49 +176,62 @@ static SOC_ENUM_SINGLE_DECL(
 static const struct snd_kcontrol_new tas2764_asi1_mux =
 	SOC_DAPM_ENUM("ASI1 Source", tas2764_ASI1_src_enum);
 
-static int tas2764_dac_event(struct snd_soc_dapm_widget *w,
-			     struct snd_kcontrol *kcontrol, int event)
+static int tas27xx_dac_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
+	mutex_lock(&tas27xx->codec_lock);
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-						    TAS2764_PWR_CTRL_MASK,
-						    TAS2764_PWR_CTRL_MUTE);
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_MUTE);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-						    TAS2764_PWR_CTRL_MASK,
-						    TAS2764_PWR_CTRL_SHUTDOWN);
+		ret = snd_soc_component_update_bits(component,
+			TAS2764_PWR_CTRL,
+			TAS2764_PWR_CTRL_MASK,
+			TAS2764_PWR_CTRL_SHUTDOWN);
 		break;
 	default:
-		dev_err(tas2764->dev, "Unsupported event\n");
-		return -EINVAL;
+		dev_err(tas27xx->dev, "Unsupported event\n");
+			ret = -EINVAL;
 	}
-
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%0x:PWR_CTRL error\n",
+			__func__, __LINE__, ret);
+	} else {
+		ret = 0;
+	}
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
 }
 
 static const struct snd_kcontrol_new isense_switch =
-	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL, TAS2764_ISENSE_POWER_EN, 1, 1);
+	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL,
+					TAS2764_ISENSE_POWER_EN, 1, 1);
 static const struct snd_kcontrol_new vsense_switch =
-	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL, TAS2764_VSENSE_POWER_EN, 1, 1);
+	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL,
+					TAS2764_VSENSE_POWER_EN, 1, 1);
 
 static const struct snd_soc_dapm_widget tas2764_dapm_widgets[] = {
-	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2764_asi1_mux),
-	SND_SOC_DAPM_SWITCH("ISENSE", TAS2764_PWR_CTRL, TAS2764_ISENSE_POWER_EN,
-			    1, &isense_switch),
-	SND_SOC_DAPM_SWITCH("VSENSE", TAS2764_PWR_CTRL, TAS2764_VSENSE_POWER_EN,
-			    1, &vsense_switch),
-	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2764_dac_event,
-			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
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
 	SND_SOC_DAPM_OUTPUT("OUT"),
 	SND_SOC_DAPM_SIGGEN("VMON"),
 	SND_SOC_DAPM_SIGGEN("IMON")
@@ -195,87 +248,135 @@ static const struct snd_soc_dapm_route tas2764_audio_map[] = {
 	{"VSENSE", "Switch", "VMON"},
 };
 
-static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
+static int tas27xx_mute(struct snd_soc_dai *dai, int mute,
+	int direction)
 {
 	struct snd_soc_component *component = dai->component;
-	int ret;
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    mute ? TAS2764_PWR_CTRL_MUTE : 0);
+	mutex_lock(&tas27xx->codec_lock);
 
-	if (ret < 0)
-		return ret;
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
 
-	return 0;
+	if (ret < 0) {
+		pr_err("%s:%u: Failed to set powercontrol\n",
+			__func__, __LINE__);
+	}
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
 }
 
-static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
+static int tas27xx_set_bitwidth(struct tas27xx_priv *tas27xx,
+	int bitwidth)
 {
-	struct snd_soc_component *component = tas2764->component;
-	int sense_en;
-	int val;
-	int ret;
+	struct snd_soc_component *component = tas27xx->component;
+	int sense_en, val, ret, slot_size;
 
+	mutex_lock(&tas27xx->codec_lock);
 	switch (bitwidth) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		ret = snd_soc_component_update_bits(component,
-						    TAS2764_TDM_CFG2,
-						    TAS2764_TDM_CFG2_RXW_MASK,
-						    TAS2764_TDM_CFG2_RXW_16BITS);
+			TAS2764_TDM_CFG2,
+			TAS2764_TDM_CFG2_RXW_MASK,
+			TAS2764_TDM_CFG2_RXW_16BITS);
+		slot_size = TAS2764_TDM_CFG2_RXS_16BITS;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		ret = snd_soc_component_update_bits(component,
-						    TAS2764_TDM_CFG2,
-						    TAS2764_TDM_CFG2_RXW_MASK,
-						    TAS2764_TDM_CFG2_RXW_24BITS);
+			TAS2764_TDM_CFG2, TAS2764_TDM_CFG2_RXW_MASK,
+			TAS2764_TDM_CFG2_RXW_24BITS);
+		slot_size = TAS2764_TDM_CFG2_RXS_24BITS;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		ret = snd_soc_component_update_bits(component,
-						    TAS2764_TDM_CFG2,
-						    TAS2764_TDM_CFG2_RXW_MASK,
-						    TAS2764_TDM_CFG2_RXW_32BITS);
+			TAS2764_TDM_CFG2, TAS2764_TDM_CFG2_RXW_MASK,
+			TAS2764_TDM_CFG2_RXW_32BITS);
+		slot_size = TAS2764_TDM_CFG2_RXS_32BITS;
 		break;
-
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
-	if (ret < 0)
-		return ret;
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
 
-	val = snd_soc_component_read(tas2764->component, TAS2764_PWR_CTRL);
-	if (val < 0)
-		return val;
+	val = snd_soc_component_read(tas27xx->component,
+		TAS2764_PWR_CTRL);
+
+	if (val < 0) {
+		pr_err("%s:%u:errCode:0x%x read PWR_CTRL error\n",
+			__func__, __LINE__, val);
+		ret = val;
+		goto EXIT;
+	}
 
 	if (val & (1 << TAS2764_VSENSE_POWER_EN))
 		sense_en = 0;
 	else
 		sense_en = TAS2764_TDM_CFG5_VSNS_ENABLE;
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
+	ret = snd_soc_component_update_bits(tas27xx->component,
+		TAS2764_TDM_CFG5, TAS2764_TDM_CFG5_VSNS_ENABLE, sense_en);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x enable vSNS error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	if (val & (1 << TAS2764_ISENSE_POWER_EN))
 		sense_en = 0;
 	else
 		sense_en = TAS2764_TDM_CFG6_ISNS_ENABLE;
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE,
-					    sense_en);
-	if (ret < 0)
-		return ret;
-
-	return 0;
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
 }
 
-static int tas2764_set_samplerate(struct tas2764_priv *tas2764, int samplerate)
+static int tas27xx_set_samplerate(
+	struct tas27xx_priv *tas27xx, int samplerate)
 {
-	struct snd_soc_component *component = tas2764->component;
+	struct snd_soc_component *component = tas27xx->component;
 	int ramp_rate_val;
 	int ret;
 
@@ -299,39 +400,48 @@ static int tas2764_set_samplerate(struct tas2764_priv *tas2764, int samplerate)
 	default:
 		return -EINVAL;
 	}
-
+	mutex_lock(&tas27xx->codec_lock);
 	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG0,
 					    TAS2764_TDM_CFG0_SMP_MASK |
 					    TAS2764_TDM_CFG0_MASK,
 					    ramp_rate_val);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set ramp_rate_val\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+	ret = 0;
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
 }
 
-static int tas2764_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params,
-			     struct snd_soc_dai *dai)
+static int tas27xx_hw_params(
+	struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params,
+	struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 	int ret;
 
-	ret = tas2764_set_bitwidth(tas2764, params_format(params));
+	ret = tas27xx_set_bitwidth(tas27xx, params_format(params));
 	if (ret < 0)
 		return ret;
 
-	return tas2764_set_samplerate(tas2764, params_rate(params));
+	return tas27xx_set_samplerate(tas27xx, params_rate(params));
 }
 
-static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+static int tas27xx_set_fmt(struct snd_soc_dai *dai,
+	unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
 	int iface;
-	int ret;
+	int ret = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
@@ -341,15 +451,17 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		asi_cfg_1 = TAS2764_TDM_CFG1_RX_FALLING;
 		break;
 	default:
-		dev_err(tas2764->dev, "ASI format Inverse is not found\n");
+		dev_err(tas27xx->dev, "ASI format Inverse is not found\n");
 		return -EINVAL;
 	}
-
+	mutex_lock(&tas27xx->codec_lock);
 	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
-					    TAS2764_TDM_CFG1_RX_MASK,
-					    asi_cfg_1);
-	if (ret < 0)
-		return ret;
+		TAS2764_TDM_CFG1_RX_MASK, asi_cfg_1);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set asi_cfg_1\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -363,36 +475,45 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		tdm_rx_start_slot = 0;
 		break;
 	default:
-		dev_err(tas2764->dev,
-			"DAI Format is not found, fmt=0x%x\n", fmt);
-		return -EINVAL;
+		pr_err("%s:%u:DAI Format is not found, fmt=0x%x\n",
+			__func__, __LINE__, fmt);
+		ret = -EINVAL;
+		goto EXIT;
 	}
 
 	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
-					    TAS2764_TDM_CFG1_MASK,
-					    (tdm_rx_start_slot << TAS2764_TDM_CFG1_51_SHIFT));
-	if (ret < 0)
-		return ret;
+		TAS2764_TDM_CFG1_MASK,
+		(tdm_rx_start_slot << TAS2764_TDM_CFG1_51_SHIFT));
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set tdm_rx_start_slot\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
-					    TAS2764_TDM_CFG2_SCFG_MASK, iface);
-	if (ret < 0)
-		return ret;
-
-	return 0;
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
 }
 
-static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
-				unsigned int tx_mask,
-				unsigned int rx_mask,
-				int slots, int slot_width)
+static int tas27xx_set_dai_tdm_slot(
+	struct snd_soc_dai *dai, unsigned int tx_mask,
+	unsigned int rx_mask, int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 	int left_slot, right_slot;
 	int slots_cfg;
 	int slot_size;
-	int ret;
+	int ret = 0;
 
 	if (tx_mask == 0 || rx_mask != 0)
 		return -EINVAL;
@@ -416,11 +537,16 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	if (tx_mask != 0 || left_slot >= slots || right_slot >= slots)
 		return -EINVAL;
 
-	slots_cfg = (right_slot << TAS2764_TDM_CFG3_RXS_SHIFT) | left_slot;
-
-	ret = snd_soc_component_write(component, TAS2764_TDM_CFG3, slots_cfg);
-	if (ret)
-		return ret;
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
 
 	switch (slot_width) {
 	case 16:
@@ -433,40 +559,51 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 		slot_size = TAS2764_TDM_CFG2_RXS_32BITS;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto EXIT;
 	}
 
 	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
-					    TAS2764_TDM_CFG2_RXS_MASK,
-					    slot_size);
-	if (ret < 0)
-		return ret;
+		TAS2764_TDM_CFG2_RXS_MASK, slot_size);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set slot_size\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_50_MASK,
-					    tas2764->v_sense_slot);
-	if (ret < 0)
-		return ret;
+		TAS2764_TDM_CFG5_50_MASK, tas27xx->v_sense_slot);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set v_sense_slot\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
 					    TAS2764_TDM_CFG6_50_MASK,
-					    tas2764->i_sense_slot);
-	if (ret < 0)
-		return ret;
-
-	return 0;
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
 }
 
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
-	.mute_stream = tas2764_mute,
-	.hw_params  = tas2764_hw_params,
-	.set_fmt    = tas2764_set_fmt,
-	.set_tdm_slot = tas2764_set_dai_tdm_slot,
+	.mute_stream = tas27xx_mute,
+	.hw_params  = tas27xx_hw_params,
+	.set_fmt    = tas27xx_set_fmt,
+	.set_tdm_slot = tas27xx_set_dai_tdm_slot,
 	.no_capture_mute = 1,
 };
 
-#define TAS2764_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
-			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
+#define TAS2764_FORMATS \
+	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
+	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
 #define TAS2764_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
 		       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
@@ -484,49 +621,68 @@ static struct snd_soc_dai_driver tas2764_dai_driver[] = {
 		},
 		.capture = {
 			.stream_name    = "ASI1 Capture",
-			.channels_min   = 0,
+			.channels_min   = 1,
 			.channels_max   = 2,
 			.rates = TAS2764_RATES,
 			.formats = TAS2764_FORMATS,
 		},
 		.ops = &tas2764_dai_ops,
-		.symmetric_rate = 1,
+		.symmetric_rates = 1,
 	},
 };
 
-static int tas2764_codec_probe(struct snd_soc_component *component)
+static int tas27xx_codec_probe(
+	struct snd_soc_component *component)
 {
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
-	tas2764->component = component;
+	tas27xx->component = component;
 
-	if (tas2764->sdz_gpio)
-		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
+	if (tas27xx->sdz_gpio)
+		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
 
-	tas2764_reset(tas2764);
+	tas27xx_reset(tas27xx);
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
 					    TAS2764_TDM_CFG5_VSNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to enable vSNS\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
 					    TAS2764_TDM_CFG6_ISNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
-
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to enable iSNS\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
 	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
 					    TAS2764_PWR_CTRL_MASK,
 					    TAS2764_PWR_CTRL_MUTE);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to PWR_CTRL_MUTE\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
 
-	return 0;
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
 }
 
 static DECLARE_TLV_DB_SCALE(tas2764_digital_tlv, 1100, 50, 0);
-static DECLARE_TLV_DB_SCALE(tas2764_playback_volume, -10000, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas2764_playback_volume,
+	-10000, 50, 0);
 
 static const struct snd_kcontrol_new tas2764_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Volume", TAS2764_DVC, 0,
@@ -535,11 +691,14 @@ static const struct snd_kcontrol_new tas2764_snd_controls[] = {
 		       tas2764_digital_tlv),
 };
 
-static const struct snd_soc_component_driver soc_component_driver_tas2764 = {
-	.probe			= tas2764_codec_probe,
-	.suspend		= tas2764_codec_suspend,
-	.resume			= tas2764_codec_resume,
-	.set_bias_level		= tas2764_set_bias_level,
+static const struct snd_soc_component_driver
+	soc_component_driver_tas2764 = {
+	.probe			= tas27xx_codec_probe,
+#ifdef CONFIG_PM
+	.suspend		= tas27xx_codec_suspend,
+	.resume			= tas27xx_codec_resume,
+#endif
+	.set_bias_level		= tas27xx_set_bias_level,
 	.controls		= tas2764_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas2764_snd_controls),
 	.dapm_widgets		= tas2764_dapm_widgets,
@@ -576,6 +735,12 @@ static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	},
 };
 
+static bool tas27xx_volatile(struct device *dev,
+	unsigned int reg)
+{
+		return true;
+}
+
 static const struct regmap_config tas2764_i2c_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -585,82 +750,89 @@ static const struct regmap_config tas2764_i2c_regmap = {
 	.ranges = tas2764_regmap_ranges,
 	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
 	.max_register = 1 * 128,
+	.volatile_reg = tas27xx_volatile,
 };
 
-static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)
+static int tas27xx_parse_dt(struct device *dev,
+	struct tas27xx_priv *tas27xx)
 {
 	int ret = 0;
 
-	tas2764->reset_gpio = devm_gpiod_get_optional(tas2764->dev, "reset",
-						      GPIOD_OUT_HIGH);
-	if (IS_ERR(tas2764->reset_gpio)) {
-		if (PTR_ERR(tas2764->reset_gpio) == -EPROBE_DEFER) {
-			tas2764->reset_gpio = NULL;
+	tas27xx->reset_gpio = devm_gpiod_get_optional(tas27xx->dev,
+		"reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(tas27xx->reset_gpio)) {
+		if (PTR_ERR(tas27xx->reset_gpio) == -EPROBE_DEFER) {
+			tas27xx->reset_gpio = NULL;
 			return -EPROBE_DEFER;
 		}
 	}
 
-	tas2764->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
-	if (IS_ERR(tas2764->sdz_gpio)) {
-		if (PTR_ERR(tas2764->sdz_gpio) == -EPROBE_DEFER)
+	tas27xx->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown",
+		GPIOD_OUT_HIGH);
+	if (IS_ERR(tas27xx->sdz_gpio)) {
+		if (PTR_ERR(tas27xx->sdz_gpio) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
 
-		tas2764->sdz_gpio = NULL;
+		tas27xx->sdz_gpio = NULL;
 	}
 
 	ret = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
-				       &tas2764->i_sense_slot);
+		&tas27xx->i_sense_slot);
 	if (ret)
-		tas2764->i_sense_slot = 0;
+		tas27xx->i_sense_slot = 0;
 
 	ret = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
-				       &tas2764->v_sense_slot);
+		&tas27xx->v_sense_slot);
 	if (ret)
-		tas2764->v_sense_slot = 2;
+		tas27xx->v_sense_slot = 2;
 
 	return 0;
 }
 
-static int tas2764_i2c_probe(struct i2c_client *client,
+static int tas27xx_i2c_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
-	struct tas2764_priv *tas2764;
+	struct tas27xx_priv *tas27xx;
 	int result;
 
-	tas2764 = devm_kzalloc(&client->dev, sizeof(struct tas2764_priv),
+	tas27xx = devm_kzalloc(&client->dev, sizeof(struct tas27xx_priv),
 			       GFP_KERNEL);
-	if (!tas2764)
+	if (!tas27xx)
 		return -ENOMEM;
-
-	tas2764->dev = &client->dev;
-	i2c_set_clientdata(client, tas2764);
-	dev_set_drvdata(&client->dev, tas2764);
-
-	tas2764->regmap = devm_regmap_init_i2c(client, &tas2764_i2c_regmap);
-	if (IS_ERR(tas2764->regmap)) {
-		result = PTR_ERR(tas2764->regmap);
+	mutex_init(&tas27xx->codec_lock);
+	tas27xx->dev = &client->dev;
+	i2c_set_clientdata(client, tas27xx);
+	dev_set_drvdata(&client->dev, tas27xx);
+
+	tas27xx->regmap = devm_regmap_init_i2c(client,
+		&tas2764_i2c_regmap);
+	if (IS_ERR(tas27xx->regmap)) {
+		result = PTR_ERR(tas27xx->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-					result);
+			result);
 		return result;
 	}
 
 	if (client->dev.of_node) {
-		result = tas2764_parse_dt(&client->dev, tas2764);
+		result = tas27xx_parse_dt(&client->dev, tas27xx);
 		if (result) {
-			dev_err(tas2764->dev, "%s: Failed to parse devicetree\n",
-				__func__);
+			dev_err(tas27xx->dev,
+				"%s: Failed to parse devicetree\n", __func__);
 			return result;
 		}
 	}
 
-	return devm_snd_soc_register_component(tas2764->dev,
-					       &soc_component_driver_tas2764,
-					       tas2764_dai_driver,
-					       ARRAY_SIZE(tas2764_dai_driver));
+	tas27xx->device_id = id->driver_data;
+	dev_info(tas27xx->dev, "chip_id: %u\n", tas27xx->device_id);
+
+	return devm_snd_soc_register_component(tas27xx->dev,
+		&soc_component_driver_tas2764, tas2764_dai_driver,
+		ARRAY_SIZE(tas2764_dai_driver));
 }
 
 static const struct i2c_device_id tas2764_i2c_id[] = {
-	{ "tas2764", 0},
+	{ "tas2764", TAS2764},
+	{ "tas2780", TAS2780},
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2764_i2c_id);
@@ -668,6 +840,7 @@ MODULE_DEVICE_TABLE(i2c, tas2764_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2764_of_match[] = {
 	{ .compatible = "ti,tas2764" },
+	{ .compatible = "ti,tas2780" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2764_of_match);
@@ -675,14 +848,14 @@ MODULE_DEVICE_TABLE(of, tas2764_of_match);
 
 static struct i2c_driver tas2764_i2c_driver = {
 	.driver = {
-		.name   = "tas2764",
+		.name   = "tas27xx",
 		.of_match_table = of_match_ptr(tas2764_of_match),
 	},
-	.probe      = tas2764_i2c_probe,
+	.probe      = tas27xx_i2c_probe,
 	.id_table   = tas2764_i2c_id,
 };
 module_i2c_driver(tas2764_i2c_driver);
 
-MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
-MODULE_DESCRIPTION("TAS2764 I2C Smart Amplifier driver");
+MODULE_AUTHOR("Raphael Xu <raphael-xu@ti.com>");
+MODULE_DESCRIPTION("TAS27XX I2C Smart Amplifier driver");
 MODULE_LICENSE("GPL v2");
-- 
2.35.1



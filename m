Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A124EF231
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 17:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25D71AF4;
	Fri,  1 Apr 2022 17:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25D71AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648825467;
	bh=da+sqdIXwvISO325vS9eFlgihZQmLQj59wmTRj2pPio=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l1Q8YnnNgtCpTSBd+o4EqGNko68TSlsK8Wfm/rhfLTj/3lfRDABkvkaT0OgrMyaG+
	 PwH3awHHbLlgaps6ptj+sLd0WN4RIVqUwYBe+LbhGrnoVWBql/hErvGkHjDT227Bbw
	 KNBtG/cEE/Ct+pmYQyK/tOZBzi4nN6MnDPgt/K18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D68F8051C;
	Fri,  1 Apr 2022 17:03:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5443AF8051D; Fri,  1 Apr 2022 17:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 693F7F8047D
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 17:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 693F7F8047D
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[120.231.214.8])
 by rmsmtp-lg-appmail-27-12032 (RichMail) with SMTP id 2f0062471426e32-0cae9;
 Fri, 01 Apr 2022 23:03:19 +0800 (CST)
X-RM-TRANSID: 2f0062471426e32-0cae9
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v6 3/3] update to support either TAS2764 or TAS2780
Date: Fri,  1 Apr 2022 23:03:01 +0800
Message-Id: <20220401150301.1011-3-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401150301.1011-1-13691752556@139.com>
References: <20220401150301.1011-1-13691752556@139.com>
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

fix no sound issue on some platforms

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 sound/soc/codecs/tas27xx.c | 405 +++++++++++++++++++++++++++----------
 sound/soc/codecs/tas27xx.h |   2 +-
 2 files changed, 295 insertions(+), 112 deletions(-)

diff --git a/sound/soc/codecs/tas27xx.c b/sound/soc/codecs/tas27xx.c
index 8953516b55dc..fd8000f9526a 100644
--- a/sound/soc/codecs/tas27xx.c
+++ b/sound/soc/codecs/tas27xx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-// Driver for the Texas Instruments TAS2764 Mono
+// Driver for the Texas Instruments TAS2764/TAS2780 Mono
 //		Audio amplifier
 // Copyright (C) 2020-2022 Texas Instruments Inc.
 
@@ -12,11 +12,9 @@
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
@@ -31,21 +29,25 @@ struct tas27xx_priv {
 	struct gpio_desc *sdz_gpio;
 	struct regmap *regmap;
 	struct device *dev;
-	
+	struct mutex codec_lock;
 	int v_sense_slot;
 	int i_sense_slot;
+	int device_id;
+	bool mb_power_up;
 };
 
 enum tas27xx {
 	TAS2764 = 0,
+	TAS2780 = 1,
 };
 
 static void tas27xx_reset(struct tas27xx_priv *tas27xx)
 {
 	if (tas27xx->reset_gpio) {
 		gpiod_set_value_cansleep(tas27xx->reset_gpio, 0);
-		msleep(20);
+		usleep_range(2000, 2050);
 		gpiod_set_value_cansleep(tas27xx->reset_gpio, 1);
+		usleep_range(5000, 5050);
 	}
 
 	snd_soc_component_write(tas27xx->component, TAS27XX_SW_RST,
@@ -57,32 +59,52 @@ static int tas27xx_set_bias_level(struct snd_soc_component *component,
 {
 	struct tas27xx_priv *tas27xx = 
 		snd_soc_component_get_drvdata(component);
-
+	int ret = 0;
+
+	mutex_lock(&tas27xx->codec_lock);
 	switch (level) {
 	case SND_SOC_BIAS_ON:
-		snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
-					      TAS27XX_PWR_CTRL_MASK,
-					      TAS27XX_PWR_CTRL_ACTIVE);
+		ret = snd_soc_component_update_bits(component,
+					TAS27XX_PWR_CTRL,
+					TAS27XX_PWR_CTRL_MASK,
+					TAS27XX_PWR_CTRL_ACTIVE);
+		if (ret >= 0) {
+			tas27xx->mb_power_up = true;
+			ret = 0;
+		}
 		break;
 	case SND_SOC_BIAS_STANDBY:
 	case SND_SOC_BIAS_PREPARE:
-		snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
-					      TAS27XX_PWR_CTRL_MASK,
-					      TAS27XX_PWR_CTRL_MUTE);
+		ret = snd_soc_component_update_bits(component,
+			TAS27XX_PWR_CTRL,
+			TAS27XX_PWR_CTRL_MASK,
+			TAS27XX_PWR_CTRL_MUTE);
+		if (ret >= 0) {
+			tas27xx->mb_power_up = true;
+			ret = 0;
+		}
 		break;
 	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
-					      TAS27XX_PWR_CTRL_MASK,
-					      TAS27XX_PWR_CTRL_SHUTDOWN);
+		ret = snd_soc_component_update_bits(component,
+			TAS27XX_PWR_CTRL,
+			TAS27XX_PWR_CTRL_MASK,
+			TAS27XX_PWR_CTRL_SHUTDOWN);
+		if (ret >= 0) {
+			tas27xx->mb_power_up = false;
+			ret = 0;
+		}
 		break;
 
 	default:
 		dev_err(tas27xx->dev,
-				"wrong power level setting %d\n", level);
-		return -EINVAL;
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
@@ -90,30 +112,37 @@ static int tas27xx_codec_suspend(struct snd_soc_component *component)
 {
 	struct tas27xx_priv *tas27xx = 
 		snd_soc_component_get_drvdata(component);
-	int ret;
+	int ret = 0;
 
+	mutex_lock(&tas27xx->codec_lock);
 	ret = snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
 					    TAS27XX_PWR_CTRL_MASK,
 					    TAS27XX_PWR_CTRL_SHUTDOWN);
 
-	if (ret < 0)
-		return ret;
-
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%0x:power down error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+	ret = 0;
+	tas27xx->mb_power_up = false;
 	if (tas27xx->sdz_gpio)
 		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 0);
 
 	regcache_cache_only(tas27xx->regmap, true);
 	regcache_mark_dirty(tas27xx->regmap);
-
-	return 0;
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
 }
 
 static int tas27xx_codec_resume(struct snd_soc_component *component)
 {
 	struct tas27xx_priv *tas27xx = 
 		snd_soc_component_get_drvdata(component);
-	int ret;
+	int ret = 0;
 
+	mutex_lock(&tas27xx->codec_lock);
 	if (tas27xx->sdz_gpio)
 		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
 
@@ -121,16 +150,19 @@ static int tas27xx_codec_resume(struct snd_soc_component *component)
 					    TAS27XX_PWR_CTRL_MASK,
 					    TAS27XX_PWR_CTRL_ACTIVE);
 
-	if (ret < 0)
-		return ret;
-
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%0x:power down error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
+	ret = 0;
+	tas27xx->mb_power_up = false;
 	regcache_cache_only(tas27xx->regmap, false);
-
-	return regcache_sync(tas27xx->regmap);
+	ret = regcache_sync(tas27xx->regmap);
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
 }
-#else
-#define tas27xx_codec_suspend NULL
-#define tas27xx_codec_resume NULL
 #endif
 
 static const char * const tas27xx_ASI1_src[] = {
@@ -150,8 +182,9 @@ static int tas27xx_dac_event(struct snd_soc_dapm_widget *w,
 		snd_soc_dapm_to_component(w->dapm);
 	struct tas27xx_priv *tas27xx = 
 		snd_soc_component_get_drvdata(component);
-	int ret;
+	int ret = 0;
 
+	mutex_lock(&tas27xx->codec_lock);
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		ret = snd_soc_component_update_bits(component, 
@@ -167,13 +200,16 @@ static int tas27xx_dac_event(struct snd_soc_dapm_widget *w,
 		break;
 	default:
 		dev_err(tas27xx->dev, "Unsupported event\n");
-		return -EINVAL;
+		ret = -EINVAL;
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
@@ -211,55 +247,106 @@ static const struct snd_soc_dapm_route tas27xx_audio_map[] = {
 static int tas27xx_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
-	int ret;
-
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	mutex_lock(&tas27xx->codec_lock);
+
+	if (!mute) {
+		ret = snd_soc_component_read(component,
+			TAS27XX_CLK_CFG);
+		if (ret < 0) {
+			dev_err(tas27xx->dev,
+				"%s:%u:errCode:0x%x read "
+				"TAS27XX_CLK_CFG error\n",
+				__func__, __LINE__, ret);
+			goto EXIT;
+		}
+		if ((ret & TAS27XX_CLK_CFG_MASK) != TAS27XX_CLK_CFG_ENABLE) {
+			ret = snd_soc_component_update_bits(component,
+				TAS27XX_CLK_CFG,
+				TAS27XX_CLK_CFG_MASK,
+				TAS27XX_CLK_CFG_ENABLE);
+			if (ret < 0) {
+				dev_err(tas27xx->dev,
+					"%s:%u: Failed to CLK_CFG_ENABLE\n",
+					__func__, __LINE__);
+				goto EXIT;
+			}
+			usleep_range(3000, 3050);
+		}
+	}
 	ret = snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
-					    TAS27XX_PWR_CTRL_MASK,
-					    mute ? TAS27XX_PWR_CTRL_MUTE : 0);
-
-	if (ret < 0)
-		return ret;
+		TAS27XX_PWR_CTRL_MASK,
+		mute ? TAS27XX_PWR_CTRL_MUTE : 0);
+	if (ret >= 0) {
+		tas27xx->mb_power_up = mute?false:true;
+		ret = 0;
+	} else {
+		pr_err("%s:%u: Failed to set powercontrol\n",
+			__func__, __LINE__);
+	}
 
-	return 0;
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
 }
 
 static int tas27xx_set_bitwidth(struct tas27xx_priv *tas27xx, int bitwidth)
 {
 	struct snd_soc_component *component = tas27xx->component;
-	int sense_en;
-	int val;
-	int ret;
+	int sense_en, val, ret, slot_size;
 
+	mutex_lock(&tas27xx->codec_lock);
 	switch (bitwidth) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		ret = snd_soc_component_update_bits(component,
-					TAS27XX_TDM_CFG2,
-					TAS27XX_TDM_CFG2_RXW_MASK,
-					TAS27XX_TDM_CFG2_RXW_16BITS);
+			TAS27XX_TDM_CFG2,
+			TAS27XX_TDM_CFG2_RXW_MASK,
+			TAS27XX_TDM_CFG2_RXW_16BITS);
+		slot_size = TAS27XX_TDM_CFG2_RXS_16BITS;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		ret = snd_soc_component_update_bits(component,
 					TAS27XX_TDM_CFG2,
 					TAS27XX_TDM_CFG2_RXW_MASK,
 					TAS27XX_TDM_CFG2_RXW_24BITS);
+		slot_size = TAS27XX_TDM_CFG2_RXS_24BITS;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		ret = snd_soc_component_update_bits(component,
 					TAS27XX_TDM_CFG2,
 					TAS27XX_TDM_CFG2_RXW_MASK,
 					TAS27XX_TDM_CFG2_RXW_32BITS);
+		slot_size = TAS27XX_TDM_CFG2_RXS_32BITS;
 		break;
 
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
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG2,
+		TAS27XX_TDM_CFG2_RXS_MASK, slot_size);
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x set RX slot size error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	val = snd_soc_component_read(tas27xx->component, TAS27XX_PWR_CTRL);
-	if (val < 0)
-		return val;
+	if (val < 0) {
+		pr_err("%s:%u:errCode:0x%x read PWR_CTRL error\n",
+			__func__, __LINE__, val);
+		ret = val;
+		goto EXIT;
+	}
 
 	if (val & (1 << TAS27XX_VSENSE_POWER_EN))
 		sense_en = 0;
@@ -268,8 +355,11 @@ static int tas27xx_set_bitwidth(struct tas27xx_priv *tas27xx, int bitwidth)
 
 	ret = snd_soc_component_update_bits(tas27xx->component, 
 		TAS27XX_TDM_CFG5, TAS27XX_TDM_CFG5_VSNS_ENABLE, sense_en);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x enable vSNS error\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	if (val & (1 << TAS27XX_ISENSE_POWER_EN))
 		sense_en = 0;
@@ -278,10 +368,14 @@ static int tas27xx_set_bitwidth(struct tas27xx_priv *tas27xx, int bitwidth)
 
 	ret = snd_soc_component_update_bits(tas27xx->component, 
 		TAS27XX_TDM_CFG6, TAS27XX_TDM_CFG6_ISNS_ENABLE, sense_en);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x enable iSNS error\n",
+			__func__, __LINE__, ret);
+	}
+	ret = 0;
+EXIT:
+	mutex_unlock(&tas27xx->codec_lock);
+	return ret;
 }
 
 static int tas27xx_set_samplerate(
@@ -311,15 +405,20 @@ static int tas27xx_set_samplerate(
 	default:
 		return -EINVAL;
 	}
-
+	mutex_lock(&tas27xx->codec_lock);
 	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG0,
 					    TAS27XX_TDM_CFG0_SMP_MASK |
 					    TAS27XX_TDM_CFG0_MASK,
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
 
 static int tas27xx_hw_params(struct snd_pcm_substream *substream,
@@ -345,7 +444,7 @@ static int tas27xx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		snd_soc_component_get_drvdata(component);
 	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
 	int iface;
-	int ret;
+	int ret = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
@@ -358,12 +457,15 @@ static int tas27xx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		dev_err(tas27xx->dev, "ASI format Inverse is not found\n");
 		return -EINVAL;
 	}
-
+	mutex_lock(&tas27xx->codec_lock);
 	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG1,
 					    TAS27XX_TDM_CFG1_RX_MASK,
 					    asi_cfg_1);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set asi_cfg_1\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -377,23 +479,32 @@ static int tas27xx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		tdm_rx_start_slot = 0;
 		break;
 	default:
-		dev_err(tas27xx->dev,
-			"DAI Format is not found, fmt=0x%x\n", fmt);
-		return -EINVAL;
+		pr_err("%s:%u:DAI Format is not found, fmt=0x%x\n",
+			__func__, __LINE__, fmt);
+		ret = -EINVAL;
+		goto EXIT;
 	}
 
 	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG1,
 		TAS27XX_TDM_CFG1_MASK,
 		(tdm_rx_start_slot << TAS27XX_TDM_CFG1_51_SHIFT));
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set tdm_rx_start_slot\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG2,
 		TAS27XX_TDM_CFG2_SCFG_MASK, iface);
-	if (ret < 0)
-		return ret;
-
-	return 0;
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
 
 static int tas27xx_set_dai_tdm_slot(struct snd_soc_dai *dai,
@@ -407,7 +518,7 @@ static int tas27xx_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	int left_slot, right_slot;
 	int slots_cfg;
 	int slot_size;
-	int ret;
+	int ret = 0;
 
 	if (tx_mask == 0 || rx_mask != 0)
 		return -EINVAL;
@@ -432,10 +543,13 @@ static int tas27xx_set_dai_tdm_slot(struct snd_soc_dai *dai,
 		return -EINVAL;
 
 	slots_cfg = (right_slot << TAS27XX_TDM_CFG3_RXS_SHIFT) | left_slot;
-
+	mutex_lock(&tas27xx->codec_lock);
 	ret = snd_soc_component_write(component, TAS27XX_TDM_CFG3, slots_cfg);
-	if (ret)
-		return ret;
+	if (ret) {
+		pr_err("%s:%u:errCode:0x%x Failed to set slots_cfg\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	switch (slot_width) {
 	case 16:
@@ -448,28 +562,40 @@ static int tas27xx_set_dai_tdm_slot(struct snd_soc_dai *dai,
 		slot_size = TAS27XX_TDM_CFG2_RXS_32BITS;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto EXIT;
 	}
 
 	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG2,
 					    TAS27XX_TDM_CFG2_RXS_MASK,
 					    slot_size);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set slot_size\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG5,
 					    TAS27XX_TDM_CFG5_50_MASK,
 					    tas27xx->v_sense_slot);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		pr_err("%s:%u:errCode:0x%x Failed to set v_sense_slot\n",
+			__func__, __LINE__, ret);
+		goto EXIT;
+	}
 
 	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG6,
 					    TAS27XX_TDM_CFG6_50_MASK,
 					    tas27xx->i_sense_slot);
-	if (ret < 0)
-		return ret;
-
-	return 0;
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
 
 static const struct snd_soc_dai_ops tas27xx_dai_ops = {
@@ -499,7 +625,7 @@ static struct snd_soc_dai_driver tas27xx_dai_driver[] = {
 		},
 		.capture = {
 			.stream_name    = "ASI1 Capture",
-			.channels_min   = 0,
+			.channels_min   = 1,
 			.channels_max   = 2,
 			.rates = TAS27XX_RATES,
 			.formats = TAS27XX_FORMATS,
@@ -513,7 +639,7 @@ static int tas27xx_codec_probe(struct snd_soc_component *component)
 {
 	struct tas27xx_priv *tas27xx = 
 		snd_soc_component_get_drvdata(component);
-	int ret;
+	int ret = 0;
 
 	tas27xx->component = component;
 
@@ -521,26 +647,54 @@ static int tas27xx_codec_probe(struct snd_soc_component *component)
 		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
 
 	tas27xx_reset(tas27xx);
+	usleep_range(5000, 5050);
 
-	ret = snd_soc_component_update_bits(tas27xx->component, 
-						TAS27XX_TDM_CFG5,
+	ret = snd_soc_component_update_bits(component,
+		TAS27XX_CLK_CFG,
+		TAS27XX_CLK_CFG_MASK,
+		TAS27XX_CLK_CFG_ENABLE);
+	if (ret < 0) {
+		dev_err(tas27xx->dev,
+			"%s:%u: Failed to CLK_CFG_ENABLE\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG5,
 					    TAS27XX_TDM_CFG5_VSNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to enable vSNS\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
 
-	ret = snd_soc_component_update_bits(tas27xx->component, 
-						TAS27XX_TDM_CFG6,
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG6,
 					    TAS27XX_TDM_CFG6_ISNS_ENABLE, 0);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to enable iSNS\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
 
 	ret = snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
 					    TAS27XX_PWR_CTRL_MASK,
 					    TAS27XX_PWR_CTRL_MUTE);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		dev_err(tas27xx->dev, "%s:%u: Failed to PWR_CTRL_MUTE\n",
+			__func__, __LINE__);
+		goto EXIT;
+	}
 
-	return 0;
+	ret = snd_soc_component_write(component, TAS27XX_PWR_CTRL, 0x02);
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
 
 static DECLARE_TLV_DB_SCALE(tas27xx_digital_tlv, 1100, 50, 0);
@@ -555,8 +709,10 @@ static const struct snd_kcontrol_new tas27xx_snd_controls[] = {
 
 static const struct snd_soc_component_driver soc_component_driver_tas27xx = {
 	.probe			= tas27xx_codec_probe,
+#ifdef CONFIG_PM
 	.suspend		= tas27xx_codec_suspend,
 	.resume			= tas27xx_codec_resume,
+#endif
 	.set_bias_level		= tas27xx_set_bias_level,
 	.controls		= tas27xx_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas27xx_snd_controls),
@@ -594,6 +750,27 @@ static const struct regmap_range_cfg tas27xx_regmap_ranges[] = {
 	},
 };
 
+static bool tas27xx_volatile(struct device *dev,
+	unsigned int reg)
+{
+	switch (reg) {
+	case TAS27XX_SW_RST:
+	case TAS27XX_PWR_CTRL:
+	case TAS27XX_PAGE:
+	case TAS27XX_DVC:
+	case TAS27XX_CHNL_0:
+	case TAS27XX_TDM_CFG0:
+	case TAS27XX_TDM_CFG1:
+	case TAS27XX_TDM_CFG2:
+	case TAS27XX_TDM_CFG3:
+	case TAS27XX_TDM_CFG5:
+	case TAS27XX_TDM_CFG6:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config tas27xx_i2c_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -603,6 +780,7 @@ static const struct regmap_config tas27xx_i2c_regmap = {
 	.ranges = tas27xx_regmap_ranges,
 	.num_ranges = ARRAY_SIZE(tas27xx_regmap_ranges),
 	.max_register = 1 * 128,
+	.volatile_reg = tas27xx_volatile,
 };
 
 static int tas27xx_parse_dt(struct device *dev, struct tas27xx_priv *tas27xx)
@@ -650,7 +828,7 @@ static int tas27xx_i2c_probe(struct i2c_client *client,
 			       GFP_KERNEL);
 	if (!tas27xx)
 		return -ENOMEM;
-
+	mutex_init(&tas27xx->codec_lock);
 	tas27xx->dev = &client->dev;
 	i2c_set_clientdata(client, tas27xx);
 	dev_set_drvdata(&client->dev, tas27xx);
@@ -672,6 +850,9 @@ static int tas27xx_i2c_probe(struct i2c_client *client,
 		}
 	}
 
+	tas27xx->device_id = id->driver_data;
+	dev_info(tas27xx->dev, "chip_id: %u\n", tas27xx->device_id);
+
 	return devm_snd_soc_register_component(tas27xx->dev,
 		&soc_component_driver_tas27xx, tas27xx_dai_driver,
 		ARRAY_SIZE(tas27xx_dai_driver));
@@ -679,6 +860,7 @@ static int tas27xx_i2c_probe(struct i2c_client *client,
 
 static const struct i2c_device_id tas27xx_i2c_id[] = {
 	{ "tas2764", TAS2764},
+	{ "tas2780", TAS2780},
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas27xx_i2c_id);
@@ -686,6 +868,7 @@ MODULE_DEVICE_TABLE(i2c, tas27xx_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas27xx_of_match[] = {
 	{ .compatible = "ti,tas2764" },
+	{ .compatible = "ti,tas2780" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas27xx_of_match);
diff --git a/sound/soc/codecs/tas27xx.h b/sound/soc/codecs/tas27xx.h
index 6f76645f5cd6..95923e437a38 100644
--- a/sound/soc/codecs/tas27xx.h
+++ b/sound/soc/codecs/tas27xx.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * tas27xx.h - ALSA SoC Texas Instruments TAS2764 Mono Audio Amplifier
+ * tas27xx.h - ALSA SoC Texas Instruments TAS2764/TAS2780 Mono Audio Amplifier
  *
  * Copyright (C) 2020-2022 Texas Instruments Incorporated - https://www.ti.com
  *
-- 
2.35.1



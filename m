Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A44FB575
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 09:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94DED16F8;
	Mon, 11 Apr 2022 09:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94DED16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649663933;
	bh=M8oohtviQpoSOd1IUCFY9as3K4h0rBAAYC7vn2/D4hI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i/yzIm1BsRx4lK1q1QTU2AauhdHstVzm9e8KKVpDG46V9Ru/o4J+3OhmATRjASYng
	 e0m7ub1e96yBAKD9aXFKSVC86Rvvelw6ebxvNx6SkPjpvhlKvjwnHOW+6mBkP9oWfV
	 js8UyKe3OX8pxZMMrNW6UZuuuQ++3+v0YdA8GcG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F295F804C1;
	Mon, 11 Apr 2022 09:57:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A9BF8020D; Mon, 11 Apr 2022 09:57:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from n169-112.mail.139.com (n169-112.mail.139.com [120.232.169.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29224F8020D
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 09:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29224F8020D
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[192.163.20.102])
 by rmsmtp-lg-appmail-21-12024 (RichMail) with SMTP id 2ef86253df46832-8c358;
 Mon, 11 Apr 2022 15:57:16 +0800 (CST)
X-RM-TRANSID: 2ef86253df46832-8c358
From: Raphael-Xu <13691752556@139.com>
To: broonie@kernel.org
Subject: [PATCH v8 2/3] rename variables from tas2764 to tas27xx
Date: Mon, 11 Apr 2022 15:56:51 +0800
Message-Id: <20220411075652.2346-2-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411075652.2346-1-13691752556@139.com>
References: <20220411075652.2346-1-13691752556@139.com>
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

rename variables from TAS2764 to TAS27xx in tas27xx.h

rename variables from tas2764 to tas27xx and add enum in tas27xx.c

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 sound/soc/codecs/tas27xx.c | 511 +++++++++++++++++++------------------
 sound/soc/codecs/tas27xx.h | 131 +++++-----
 2 files changed, 335 insertions(+), 307 deletions(-)

diff --git a/sound/soc/codecs/tas27xx.c b/sound/soc/codecs/tas27xx.c
index 9265af41c235..e02e99bd46be 100644
--- a/sound/soc/codecs/tas27xx.c
+++ b/sound/soc/codecs/tas27xx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
-//
-// Driver for the Texas Instruments TAS2764 CODEC
-// Copyright (C) 2020 Texas Instruments Inc.
+// Driver for the Texas Instruments TAS2764 Mono
+//		Audio amplifier
+// Copyright (C) 2020-2022 Texas Instruments Inc.
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -23,9 +23,9 @@
 #include <sound/initval.h>
 #include <sound/tlv.h>
 
-#include "tas2764.h"
+#include "tas27xx.h"
 
-struct tas2764_priv {
+struct tas27xx_priv {
 	struct snd_soc_component *component;
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *sdz_gpio;
@@ -36,43 +36,48 @@ struct tas2764_priv {
 	int i_sense_slot;
 };
 
-static void tas2764_reset(struct tas2764_priv *tas2764)
+enum tas27xx {
+	TAS2764 = 0,
+};
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
-				TAS2764_RST);
+	snd_soc_component_write(tas27xx->component, TAS27XX_SW_RST,
+				TAS27XX_RST);
 }
 
-static int tas2764_set_bias_level(struct snd_soc_component *component,
+static int tas27xx_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_ACTIVE);
+		snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
+					      TAS27XX_PWR_CTRL_MASK,
+					      TAS27XX_PWR_CTRL_ACTIVE);
 		break;
 	case SND_SOC_BIAS_STANDBY:
 	case SND_SOC_BIAS_PREPARE:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_MUTE);
+		snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
+					      TAS27XX_PWR_CTRL_MASK,
+					      TAS27XX_PWR_CTRL_MUTE);
 		break;
 	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					      TAS2764_PWR_CTRL_MASK,
-					      TAS2764_PWR_CTRL_SHUTDOWN);
+		snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
+					      TAS27XX_PWR_CTRL_MASK,
+					      TAS27XX_PWR_CTRL_SHUTDOWN);
 		break;
 
 	default:
-		dev_err(tas2764->dev,
+		dev_err(tas27xx->dev,
 				"wrong power level setting %d\n", level);
 		return -EINVAL;
 	}
@@ -81,81 +86,87 @@ static int tas2764_set_bias_level(struct snd_soc_component *component,
 }
 
 #ifdef CONFIG_PM
-static int tas2764_codec_suspend(struct snd_soc_component *component)
+static int tas27xx_codec_suspend(struct snd_soc_component *component)
 {
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 	int ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    TAS2764_PWR_CTRL_SHUTDOWN);
+	ret = snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
+					    TAS27XX_PWR_CTRL_MASK,
+					    TAS27XX_PWR_CTRL_SHUTDOWN);
 
 	if (ret < 0)
 		return ret;
 
-	if (tas2764->sdz_gpio)
-		gpiod_set_value_cansleep(tas2764->sdz_gpio, 0);
+	if (tas27xx->sdz_gpio)
+		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 0);
 
-	regcache_cache_only(tas2764->regmap, true);
-	regcache_mark_dirty(tas2764->regmap);
+	regcache_cache_only(tas27xx->regmap, true);
+	regcache_mark_dirty(tas27xx->regmap);
 
 	return 0;
 }
 
-static int tas2764_codec_resume(struct snd_soc_component *component)
+static int tas27xx_codec_resume(struct snd_soc_component *component)
 {
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 	int ret;
 
-	if (tas2764->sdz_gpio)
-		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
+	if (tas27xx->sdz_gpio)
+		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
 
-	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    TAS2764_PWR_CTRL_ACTIVE);
+	ret = snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
+					    TAS27XX_PWR_CTRL_MASK,
+					    TAS27XX_PWR_CTRL_ACTIVE);
 
 	if (ret < 0)
 		return ret;
 
-	regcache_cache_only(tas2764->regmap, false);
+	regcache_cache_only(tas27xx->regmap, false);
 
-	return regcache_sync(tas2764->regmap);
+	return regcache_sync(tas27xx->regmap);
 }
 #else
-#define tas2764_codec_suspend NULL
-#define tas2764_codec_resume NULL
+#define tas27xx_codec_suspend NULL
+#define tas27xx_codec_resume NULL
 #endif
 
-static const char * const tas2764_ASI1_src[] = {
+static const char * const tas27xx_ASI1_src[] = {
 	"I2C offset", "Left", "Right", "LeftRightDiv2",
 };
 
 static SOC_ENUM_SINGLE_DECL(
-	tas2764_ASI1_src_enum, TAS2764_TDM_CFG2, 4, tas2764_ASI1_src);
+	tas27xx_ASI1_src_enum, TAS27XX_TDM_CFG2, 4, tas27xx_ASI1_src);
 
-static const struct snd_kcontrol_new tas2764_asi1_mux =
-	SOC_DAPM_ENUM("ASI1 Source", tas2764_ASI1_src_enum);
+static const struct snd_kcontrol_new tas27xx_asi1_mux =
+	SOC_DAPM_ENUM("ASI1 Source", tas27xx_ASI1_src_enum);
 
-static int tas2764_dac_event(struct snd_soc_dapm_widget *w,
+static int tas27xx_dac_event(struct snd_soc_dapm_widget *w,
 			     struct snd_kcontrol *kcontrol, int event)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-						    TAS2764_PWR_CTRL_MASK,
-						    TAS2764_PWR_CTRL_MUTE);
+		ret = snd_soc_component_update_bits(component,
+						TAS27XX_PWR_CTRL,
+						TAS27XX_PWR_CTRL_MASK,
+						TAS27XX_PWR_CTRL_MUTE);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-						    TAS2764_PWR_CTRL_MASK,
-						    TAS2764_PWR_CTRL_SHUTDOWN);
+		ret = snd_soc_component_update_bits(component,
+						TAS27XX_PWR_CTRL,
+						TAS27XX_PWR_CTRL_MASK,
+						TAS27XX_PWR_CTRL_SHUTDOWN);
 		break;
 	default:
-		dev_err(tas2764->dev, "Unsupported event\n");
+		dev_err(tas27xx->dev, "Unsupported event\n");
 		return -EINVAL;
 	}
 
@@ -166,25 +177,27 @@ static int tas2764_dac_event(struct snd_soc_dapm_widget *w,
 }
 
 static const struct snd_kcontrol_new isense_switch =
-	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL, TAS2764_ISENSE_POWER_EN, 1, 1);
+	SOC_DAPM_SINGLE("Switch", TAS27XX_PWR_CTRL,
+			TAS27XX_ISENSE_POWER_EN, 1, 1);
 static const struct snd_kcontrol_new vsense_switch =
-	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL, TAS2764_VSENSE_POWER_EN, 1, 1);
+	SOC_DAPM_SINGLE("Switch", TAS27XX_PWR_CTRL,
+			TAS27XX_VSENSE_POWER_EN, 1, 1);
 
-static const struct snd_soc_dapm_widget tas2764_dapm_widgets[] = {
+static const struct snd_soc_dapm_widget tas27xx_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2764_asi1_mux),
-	SND_SOC_DAPM_SWITCH("ISENSE", TAS2764_PWR_CTRL, TAS2764_ISENSE_POWER_EN,
-			    1, &isense_switch),
-	SND_SOC_DAPM_SWITCH("VSENSE", TAS2764_PWR_CTRL, TAS2764_VSENSE_POWER_EN,
-			    1, &vsense_switch),
-	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2764_dac_event,
+	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas27xx_asi1_mux),
+	SND_SOC_DAPM_SWITCH("ISENSE", TAS27XX_PWR_CTRL,
+		TAS27XX_ISENSE_POWER_EN, 1, &isense_switch),
+	SND_SOC_DAPM_SWITCH("VSENSE", TAS27XX_PWR_CTRL,
+		TAS27XX_VSENSE_POWER_EN, 1, &vsense_switch),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas27xx_dac_event,
 			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_OUTPUT("OUT"),
 	SND_SOC_DAPM_SIGGEN("VMON"),
 	SND_SOC_DAPM_SIGGEN("IMON")
 };
 
-static const struct snd_soc_dapm_route tas2764_audio_map[] = {
+static const struct snd_soc_dapm_route tas27xx_audio_map[] = {
 	{"ASI1 Sel", "I2C offset", "ASI1"},
 	{"ASI1 Sel", "Left", "ASI1"},
 	{"ASI1 Sel", "Right", "ASI1"},
@@ -195,14 +208,14 @@ static const struct snd_soc_dapm_route tas2764_audio_map[] = {
 	{"VSENSE", "Switch", "VMON"},
 };
 
-static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
+static int tas27xx_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    mute ? TAS2764_PWR_CTRL_MUTE : 0);
+	ret = snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
+					    TAS27XX_PWR_CTRL_MASK,
+					    mute ? TAS27XX_PWR_CTRL_MUTE : 0);
 
 	if (ret < 0)
 		return ret;
@@ -210,9 +223,10 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return 0;
 }
 
-static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
+static int tas27xx_set_bitwidth(struct tas27xx_priv *tas27xx,
+	snd_pcm_format_t bitwidth)
 {
-	struct snd_soc_component *component = tas2764->component;
+	struct snd_soc_component *component = tas27xx->component;
 	int sense_en;
 	int val;
 	int ret;
@@ -220,21 +234,21 @@ static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
 	switch (bitwidth) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		ret = snd_soc_component_update_bits(component,
-						    TAS2764_TDM_CFG2,
-						    TAS2764_TDM_CFG2_RXW_MASK,
-						    TAS2764_TDM_CFG2_RXW_16BITS);
+					TAS27XX_TDM_CFG2,
+					TAS27XX_TDM_CFG2_RXW_MASK,
+					TAS27XX_TDM_CFG2_RXW_16BITS);
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		ret = snd_soc_component_update_bits(component,
-						    TAS2764_TDM_CFG2,
-						    TAS2764_TDM_CFG2_RXW_MASK,
-						    TAS2764_TDM_CFG2_RXW_24BITS);
+					TAS27XX_TDM_CFG2,
+					TAS27XX_TDM_CFG2_RXW_MASK,
+					TAS27XX_TDM_CFG2_RXW_24BITS);
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		ret = snd_soc_component_update_bits(component,
-						    TAS2764_TDM_CFG2,
-						    TAS2764_TDM_CFG2_RXW_MASK,
-						    TAS2764_TDM_CFG2_RXW_32BITS);
+					TAS27XX_TDM_CFG2,
+					TAS27XX_TDM_CFG2_RXW_MASK,
+					TAS27XX_TDM_CFG2_RXW_32BITS);
 		break;
 
 	default:
@@ -244,65 +258,64 @@ static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)
 	if (ret < 0)
 		return ret;
 
-	val = snd_soc_component_read(tas2764->component, TAS2764_PWR_CTRL);
+	val = snd_soc_component_read(tas27xx->component, TAS27XX_PWR_CTRL);
 	if (val < 0)
 		return val;
 
-	if (val & (1 << TAS2764_VSENSE_POWER_EN))
+	if (val & (1 << TAS27XX_VSENSE_POWER_EN))
 		sense_en = 0;
 	else
-		sense_en = TAS2764_TDM_CFG5_VSNS_ENABLE;
+		sense_en = TAS27XX_TDM_CFG5_VSNS_ENABLE;
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE,
-					    sense_en);
+	ret = snd_soc_component_update_bits(tas27xx->component,
+		TAS27XX_TDM_CFG5, TAS27XX_TDM_CFG5_VSNS_ENABLE, sense_en);
 	if (ret < 0)
 		return ret;
 
-	if (val & (1 << TAS2764_ISENSE_POWER_EN))
+	if (val & (1 << TAS27XX_ISENSE_POWER_EN))
 		sense_en = 0;
 	else
-		sense_en = TAS2764_TDM_CFG6_ISNS_ENABLE;
+		sense_en = TAS27XX_TDM_CFG6_ISNS_ENABLE;
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE,
-					    sense_en);
+	ret = snd_soc_component_update_bits(tas27xx->component,
+		TAS27XX_TDM_CFG6, TAS27XX_TDM_CFG6_ISNS_ENABLE, sense_en);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int tas2764_set_samplerate(struct tas2764_priv *tas2764, int samplerate)
+static int tas27xx_set_samplerate(
+	struct tas27xx_priv *tas27xx, unsigned int samplerate)
 {
-	struct snd_soc_component *component = tas2764->component;
+	struct snd_soc_component *component = tas27xx->component;
 	int ramp_rate_val;
 	int ret;
 
 	switch (samplerate) {
 	case 48000:
-		ramp_rate_val = TAS2764_TDM_CFG0_SMP_48KHZ |
-				TAS2764_TDM_CFG0_44_1_48KHZ;
+		ramp_rate_val = TAS27XX_TDM_CFG0_SMP_48KHZ |
+				TAS27XX_TDM_CFG0_44_1_48KHZ;
 		break;
 	case 44100:
-		ramp_rate_val = TAS2764_TDM_CFG0_SMP_44_1KHZ |
-				TAS2764_TDM_CFG0_44_1_48KHZ;
+		ramp_rate_val = TAS27XX_TDM_CFG0_SMP_44_1KHZ |
+				TAS27XX_TDM_CFG0_44_1_48KHZ;
 		break;
 	case 96000:
-		ramp_rate_val = TAS2764_TDM_CFG0_SMP_48KHZ |
-				TAS2764_TDM_CFG0_88_2_96KHZ;
+		ramp_rate_val = TAS27XX_TDM_CFG0_SMP_48KHZ |
+				TAS27XX_TDM_CFG0_88_2_96KHZ;
 		break;
 	case 88200:
-		ramp_rate_val = TAS2764_TDM_CFG0_SMP_44_1KHZ |
-				TAS2764_TDM_CFG0_88_2_96KHZ;
+		ramp_rate_val = TAS27XX_TDM_CFG0_SMP_44_1KHZ |
+				TAS27XX_TDM_CFG0_88_2_96KHZ;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG0,
-					    TAS2764_TDM_CFG0_SMP_MASK |
-					    TAS2764_TDM_CFG0_MASK,
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG0,
+					    TAS27XX_TDM_CFG0_SMP_MASK |
+					    TAS27XX_TDM_CFG0_MASK,
 					    ramp_rate_val);
 	if (ret < 0)
 		return ret;
@@ -310,43 +323,45 @@ static int tas2764_set_samplerate(struct tas2764_priv *tas2764, int samplerate)
 	return 0;
 }
 
-static int tas2764_hw_params(struct snd_pcm_substream *substream,
+static int tas27xx_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
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
+static int tas27xx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
 	int iface;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
-		asi_cfg_1 = TAS2764_TDM_CFG1_RX_RISING;
+		asi_cfg_1 = TAS27XX_TDM_CFG1_RX_RISING;
 		break;
 	case SND_SOC_DAIFMT_IB_NF:
-		asi_cfg_1 = TAS2764_TDM_CFG1_RX_FALLING;
+		asi_cfg_1 = TAS27XX_TDM_CFG1_RX_FALLING;
 		break;
 	default:
-		dev_err(tas2764->dev, "ASI format Inverse is not found\n");
+		dev_err(tas27xx->dev, "ASI format Inverse is not found\n");
 		return -EINVAL;
 	}
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
-					    TAS2764_TDM_CFG1_RX_MASK,
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG1,
+					    TAS27XX_TDM_CFG1_RX_MASK,
 					    asi_cfg_1);
 	if (ret < 0)
 		return ret;
@@ -354,41 +369,42 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 	case SND_SOC_DAIFMT_DSP_A:
-		iface = TAS2764_TDM_CFG2_SCFG_I2S;
+		iface = TAS27XX_TDM_CFG2_SCFG_I2S;
 		tdm_rx_start_slot = 1;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
 	case SND_SOC_DAIFMT_LEFT_J:
-		iface = TAS2764_TDM_CFG2_SCFG_LEFT_J;
+		iface = TAS27XX_TDM_CFG2_SCFG_LEFT_J;
 		tdm_rx_start_slot = 0;
 		break;
 	default:
-		dev_err(tas2764->dev,
+		dev_err(tas27xx->dev,
 			"DAI Format is not found, fmt=0x%x\n", fmt);
 		return -EINVAL;
 	}
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
-					    TAS2764_TDM_CFG1_MASK,
-					    (tdm_rx_start_slot << TAS2764_TDM_CFG1_51_SHIFT));
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG1,
+		TAS27XX_TDM_CFG1_MASK,
+		(tdm_rx_start_slot << TAS27XX_TDM_CFG1_51_SHIFT));
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
-					    TAS2764_TDM_CFG2_SCFG_MASK, iface);
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG2,
+		TAS27XX_TDM_CFG2_SCFG_MASK, iface);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
+static int tas27xx_set_dai_tdm_slot(struct snd_soc_dai *dai,
 				unsigned int tx_mask,
 				unsigned int rx_mask,
 				int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 	int left_slot, right_slot;
 	int slots_cfg;
 	int slot_size;
@@ -416,159 +432,162 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	if (tx_mask != 0 || left_slot >= slots || right_slot >= slots)
 		return -EINVAL;
 
-	slots_cfg = (right_slot << TAS2764_TDM_CFG3_RXS_SHIFT) | left_slot;
+	slots_cfg = (right_slot << TAS27XX_TDM_CFG3_RXS_SHIFT) | left_slot;
 
-	ret = snd_soc_component_write(component, TAS2764_TDM_CFG3, slots_cfg);
+	ret = snd_soc_component_write(component, TAS27XX_TDM_CFG3, slots_cfg);
 	if (ret)
 		return ret;
 
 	switch (slot_width) {
 	case 16:
-		slot_size = TAS2764_TDM_CFG2_RXS_16BITS;
+		slot_size = TAS27XX_TDM_CFG2_RXS_16BITS;
 		break;
 	case 24:
-		slot_size = TAS2764_TDM_CFG2_RXS_24BITS;
+		slot_size = TAS27XX_TDM_CFG2_RXS_24BITS;
 		break;
 	case 32:
-		slot_size = TAS2764_TDM_CFG2_RXS_32BITS;
+		slot_size = TAS27XX_TDM_CFG2_RXS_32BITS;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
-					    TAS2764_TDM_CFG2_RXS_MASK,
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG2,
+					    TAS27XX_TDM_CFG2_RXS_MASK,
 					    slot_size);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_50_MASK,
-					    tas2764->v_sense_slot);
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG5,
+					    TAS27XX_TDM_CFG5_50_MASK,
+					    tas27xx->v_sense_slot);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_50_MASK,
-					    tas2764->i_sense_slot);
+	ret = snd_soc_component_update_bits(component, TAS27XX_TDM_CFG6,
+					    TAS27XX_TDM_CFG6_50_MASK,
+					    tas27xx->i_sense_slot);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static const struct snd_soc_dai_ops tas2764_dai_ops = {
-	.mute_stream = tas2764_mute,
-	.hw_params  = tas2764_hw_params,
-	.set_fmt    = tas2764_set_fmt,
-	.set_tdm_slot = tas2764_set_dai_tdm_slot,
+static const struct snd_soc_dai_ops tas27xx_dai_ops = {
+	.mute_stream = tas27xx_mute,
+	.hw_params  = tas27xx_hw_params,
+	.set_fmt    = tas27xx_set_fmt,
+	.set_tdm_slot = tas27xx_set_dai_tdm_slot,
 	.no_capture_mute = 1,
 };
 
-#define TAS2764_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
+#define TAS27XX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
-#define TAS2764_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
+#define TAS27XX_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
 		       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
 
-static struct snd_soc_dai_driver tas2764_dai_driver[] = {
+static struct snd_soc_dai_driver tas27xx_dai_driver[] = {
 	{
-		.name = "tas2764 ASI1",
+		.name = "tas27xx ASI1",
 		.id = 0,
 		.playback = {
 			.stream_name    = "ASI1 Playback",
 			.channels_min   = 2,
 			.channels_max   = 2,
-			.rates      = TAS2764_RATES,
-			.formats    = TAS2764_FORMATS,
+			.rates      = TAS27XX_RATES,
+			.formats    = TAS27XX_FORMATS,
 		},
 		.capture = {
 			.stream_name    = "ASI1 Capture",
 			.channels_min   = 0,
 			.channels_max   = 2,
-			.rates = TAS2764_RATES,
-			.formats = TAS2764_FORMATS,
+			.rates = TAS27XX_RATES,
+			.formats = TAS27XX_FORMATS,
 		},
-		.ops = &tas2764_dai_ops,
+		.ops = &tas27xx_dai_ops,
 		.symmetric_rate = 1,
 	},
 };
 
-static int tas2764_codec_probe(struct snd_soc_component *component)
+static int tas27xx_codec_probe(struct snd_soc_component *component)
 {
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	struct tas27xx_priv *tas27xx =
+		snd_soc_component_get_drvdata(component);
 	int ret;
 
-	tas2764->component = component;
+	tas27xx->component = component;
 
-	if (tas2764->sdz_gpio)
-		gpiod_set_value_cansleep(tas2764->sdz_gpio, 1);
+	if (tas27xx->sdz_gpio)
+		gpiod_set_value_cansleep(tas27xx->sdz_gpio, 1);
 
-	tas2764_reset(tas2764);
+	tas27xx_reset(tas27xx);
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
-					    TAS2764_TDM_CFG5_VSNS_ENABLE, 0);
+	ret = snd_soc_component_update_bits(tas27xx->component,
+						TAS27XX_TDM_CFG5,
+					    TAS27XX_TDM_CFG5_VSNS_ENABLE, 0);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG6,
-					    TAS2764_TDM_CFG6_ISNS_ENABLE, 0);
+	ret = snd_soc_component_update_bits(tas27xx->component,
+						TAS27XX_TDM_CFG6,
+					    TAS27XX_TDM_CFG6_ISNS_ENABLE, 0);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
-					    TAS2764_PWR_CTRL_MASK,
-					    TAS2764_PWR_CTRL_MUTE);
+	ret = snd_soc_component_update_bits(component, TAS27XX_PWR_CTRL,
+					    TAS27XX_PWR_CTRL_MASK,
+					    TAS27XX_PWR_CTRL_MUTE);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static DECLARE_TLV_DB_SCALE(tas2764_digital_tlv, 1100, 50, 0);
-static DECLARE_TLV_DB_SCALE(tas2764_playback_volume, -10000, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas27xx_digital_tlv, 1100, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas27xx_playback_volume, -10000, 50, 0);
 
-static const struct snd_kcontrol_new tas2764_snd_controls[] = {
-	SOC_SINGLE_TLV("Speaker Volume", TAS2764_DVC, 0,
-		       TAS2764_DVC_MAX, 1, tas2764_playback_volume),
-	SOC_SINGLE_TLV("Amp Gain Volume", TAS2764_CHNL_0, 0, 0x14, 0,
-		       tas2764_digital_tlv),
+static const struct snd_kcontrol_new tas27xx_snd_controls[] = {
+	SOC_SINGLE_TLV("Speaker Volume", TAS27XX_DVC, 0,
+		       TAS27XX_DVC_MAX, 1, tas27xx_playback_volume),
+	SOC_SINGLE_TLV("Amp Gain Volume", TAS27XX_CHNL_0, 0, 0x14, 0,
+		       tas27xx_digital_tlv),
 };
 
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
+static const struct snd_soc_component_driver soc_component_driver_tas27xx = {
+	.probe			= tas27xx_codec_probe,
+	.suspend		= tas27xx_codec_suspend,
+	.resume			= tas27xx_codec_resume,
+	.set_bias_level		= tas27xx_set_bias_level,
+	.controls		= tas27xx_snd_controls,
+	.num_controls		= ARRAY_SIZE(tas27xx_snd_controls),
+	.dapm_widgets		= tas27xx_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tas27xx_dapm_widgets),
+	.dapm_routes		= tas27xx_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(tas27xx_audio_map),
 	.idle_bias_on		= 1,
 	.endianness		= 1,
 	.non_legacy_dai_naming	= 1,
 };
 
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
+static const struct reg_default tas27xx_reg_defaults[] = {
+	{ TAS27XX_PAGE, 0x00 },
+	{ TAS27XX_SW_RST, 0x00 },
+	{ TAS27XX_PWR_CTRL, 0x1a },
+	{ TAS27XX_DVC, 0x00 },
+	{ TAS27XX_CHNL_0, 0x00 },
+	{ TAS27XX_TDM_CFG0, 0x09 },
+	{ TAS27XX_TDM_CFG1, 0x02 },
+	{ TAS27XX_TDM_CFG2, 0x0a },
+	{ TAS27XX_TDM_CFG3, 0x10 },
+	{ TAS27XX_TDM_CFG5, 0x42 },
 };
 
-static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
+static const struct regmap_range_cfg tas27xx_regmap_ranges[] = {
 	{
 		.range_min = 0,
 		.range_max = 1 * 128,
-		.selector_reg = TAS2764_PAGE,
+		.selector_reg = TAS27XX_PAGE,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
 		.window_start = 0,
@@ -576,113 +595,113 @@ static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	},
 };
 
-static const struct regmap_config tas2764_i2c_regmap = {
+static const struct regmap_config tas27xx_i2c_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.reg_defaults = tas2764_reg_defaults,
-	.num_reg_defaults = ARRAY_SIZE(tas2764_reg_defaults),
+	.reg_defaults = tas27xx_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas27xx_reg_defaults),
 	.cache_type = REGCACHE_RBTREE,
-	.ranges = tas2764_regmap_ranges,
-	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
+	.ranges = tas27xx_regmap_ranges,
+	.num_ranges = ARRAY_SIZE(tas27xx_regmap_ranges),
 	.max_register = 1 * 128,
 };
 
-static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)
+static int tas27xx_parse_dt(struct device *dev, struct tas27xx_priv *tas27xx)
 {
 	int ret = 0;
 
-	tas2764->reset_gpio = devm_gpiod_get_optional(tas2764->dev, "reset",
+	tas27xx->reset_gpio = devm_gpiod_get_optional(tas27xx->dev, "reset",
 						      GPIOD_OUT_HIGH);
-	if (IS_ERR(tas2764->reset_gpio)) {
-		if (PTR_ERR(tas2764->reset_gpio) == -EPROBE_DEFER) {
-			tas2764->reset_gpio = NULL;
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
+				       &tas27xx->i_sense_slot);
 	if (ret)
-		tas2764->i_sense_slot = 0;
+		tas27xx->i_sense_slot = 0;
 
 	ret = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
-				       &tas2764->v_sense_slot);
+				       &tas27xx->v_sense_slot);
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
 
-	tas2764->dev = &client->dev;
-	i2c_set_clientdata(client, tas2764);
-	dev_set_drvdata(&client->dev, tas2764);
+	tas27xx->dev = &client->dev;
+	i2c_set_clientdata(client, tas27xx);
+	dev_set_drvdata(&client->dev, tas27xx);
 
-	tas2764->regmap = devm_regmap_init_i2c(client, &tas2764_i2c_regmap);
-	if (IS_ERR(tas2764->regmap)) {
-		result = PTR_ERR(tas2764->regmap);
+	tas27xx->regmap = devm_regmap_init_i2c(client, &tas27xx_i2c_regmap);
+	if (IS_ERR(tas27xx->regmap)) {
+		result = PTR_ERR(tas27xx->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
 					result);
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
+	return devm_snd_soc_register_component(tas27xx->dev,
+		&soc_component_driver_tas27xx, tas27xx_dai_driver,
+		ARRAY_SIZE(tas27xx_dai_driver));
 }
 
-static const struct i2c_device_id tas2764_i2c_id[] = {
-	{ "tas2764", 0},
+static const struct i2c_device_id tas27xx_i2c_id[] = {
+	{ "tas2764", TAS2764},
 	{ }
 };
-MODULE_DEVICE_TABLE(i2c, tas2764_i2c_id);
+MODULE_DEVICE_TABLE(i2c, tas27xx_i2c_id);
 
 #if defined(CONFIG_OF)
-static const struct of_device_id tas2764_of_match[] = {
+static const struct of_device_id tas27xx_of_match[] = {
 	{ .compatible = "ti,tas2764" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, tas2764_of_match);
+MODULE_DEVICE_TABLE(of, tas27xx_of_match);
 #endif
 
-static struct i2c_driver tas2764_i2c_driver = {
+static struct i2c_driver tas27xx_i2c_driver = {
 	.driver = {
-		.name   = "tas2764",
-		.of_match_table = of_match_ptr(tas2764_of_match),
+		.name   = "tas27xx",
+		.of_match_table = of_match_ptr(tas27xx_of_match),
 	},
-	.probe      = tas2764_i2c_probe,
-	.id_table   = tas2764_i2c_id,
+	.probe      = tas27xx_i2c_probe,
+	.id_table   = tas27xx_i2c_id,
 };
-module_i2c_driver(tas2764_i2c_driver);
+module_i2c_driver(tas27xx_i2c_driver);
 
-MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
-MODULE_DESCRIPTION("TAS2764 I2C Smart Amplifier driver");
+MODULE_AUTHOR("Raphael Xu <raphael-xu@ti.com>");
+MODULE_DESCRIPTION("TAS27XX I2C Smart Amplifier driver");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/tas27xx.h b/sound/soc/codecs/tas27xx.h
index 67d6fd903c42..6f76645f5cd6 100644
--- a/sound/soc/codecs/tas27xx.h
+++ b/sound/soc/codecs/tas27xx.h
@@ -1,92 +1,101 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * tas2764.h - ALSA SoC Texas Instruments TAS2764 Mono Audio Amplifier
+ * tas27xx.h - ALSA SoC Texas Instruments TAS2764 Mono Audio Amplifier
  *
- * Copyright (C) 2020 Texas Instruments Incorporated -  https://www.ti.com
+ * Copyright (C) 2020-2022 Texas Instruments Incorporated - https://www.ti.com
  *
- * Author: Dan Murphy <dmurphy@ti.com>
+ * Author: Raphael Xu <raphael-xu@ti.com>
  */
 
-#ifndef __TAS2764__
-#define __TAS2764__
+#ifndef __TAS27XX_H__
+#define __TAS27XX_H__
 
 /* Book Control Register */
-#define TAS2764_BOOKCTL_PAGE	0
-#define TAS2764_BOOKCTL_REG	127
-#define TAS2764_REG(page, reg)	((page * 128) + reg)
+#define TAS27XX_BOOKCTL_PAGE	0
+#define TAS27XX_BOOKCTL_REG	127
+#define TAS27XX_REG(page, reg)	((page * 128) + reg)
 
 /* Page */
-#define TAS2764_PAGE		TAS2764_REG(0X0, 0x00)
-#define TAS2764_PAGE_PAGE_MASK	255
+#define TAS27XX_PAGE		TAS27XX_REG(0X0, 0x00)
+#define TAS27XX_PAGE_PAGE_MASK	255
 
 /* Software Reset */
-#define TAS2764_SW_RST	TAS2764_REG(0X0, 0x01)
-#define TAS2764_RST	BIT(0)
+#define TAS27XX_SW_RST	TAS27XX_REG(0X0, 0x01)
+#define TAS27XX_RST	BIT(0)
 
 /* Power Control */
-#define TAS2764_PWR_CTRL		TAS2764_REG(0X0, 0x02)
-#define TAS2764_PWR_CTRL_MASK		GENMASK(1, 0)
-#define TAS2764_PWR_CTRL_ACTIVE		0x0
-#define TAS2764_PWR_CTRL_MUTE		BIT(0)
-#define TAS2764_PWR_CTRL_SHUTDOWN	BIT(1)
+#define TAS27XX_PWR_CTRL		TAS27XX_REG(0X0, 0x02)
+#define TAS27XX_PWR_CTRL_MASK		GENMASK(1, 0)
+#define TAS27XX_PWR_CTRL_ACTIVE		0x0
+#define TAS27XX_PWR_CTRL_MUTE		BIT(0)
+#define TAS27XX_PWR_CTRL_SHUTDOWN	BIT(1)
 
-#define TAS2764_VSENSE_POWER_EN		3
-#define TAS2764_ISENSE_POWER_EN		4
+#define TAS27XX_VSENSE_POWER_EN		3
+#define TAS27XX_ISENSE_POWER_EN		4
 
 /* Digital Volume Control */
-#define TAS2764_DVC	TAS2764_REG(0X0, 0x1a)
-#define TAS2764_DVC_MAX	0xc9
+#define TAS27XX_DVC	TAS27XX_REG(0X0, 0x1a)
+#define TAS27XX_DVC_MAX	0xc9
 
-#define TAS2764_CHNL_0  TAS2764_REG(0X0, 0x03)
+#define TAS27XX_CHNL_0  TAS27XX_REG(0X0, 0x03)
 
 /* TDM Configuration Reg0 */
-#define TAS2764_TDM_CFG0		TAS2764_REG(0X0, 0x08)
-#define TAS2764_TDM_CFG0_SMP_MASK	BIT(5)
-#define TAS2764_TDM_CFG0_SMP_48KHZ	0x0
-#define TAS2764_TDM_CFG0_SMP_44_1KHZ	BIT(5)
-#define TAS2764_TDM_CFG0_MASK		GENMASK(3, 1)
-#define TAS2764_TDM_CFG0_44_1_48KHZ	BIT(3)
-#define TAS2764_TDM_CFG0_88_2_96KHZ	(BIT(3) | BIT(1))
+#define TAS27XX_TDM_CFG0		TAS27XX_REG(0X0, 0x08)
+#define TAS27XX_TDM_CFG0_SMP_MASK	BIT(5)
+#define TAS27XX_TDM_CFG0_SMP_48KHZ	0x0
+#define TAS27XX_TDM_CFG0_SMP_44_1KHZ	BIT(5)
+#define TAS27XX_TDM_CFG0_MASK		GENMASK(3, 1)
+#define TAS27XX_TDM_CFG0_44_1_48KHZ	BIT(3)
+#define TAS27XX_TDM_CFG0_88_2_96KHZ	(BIT(3) | BIT(1))
 
 /* TDM Configuration Reg1 */
-#define TAS2764_TDM_CFG1		TAS2764_REG(0X0, 0x09)
-#define TAS2764_TDM_CFG1_MASK		GENMASK(5, 1)
-#define TAS2764_TDM_CFG1_51_SHIFT	1
-#define TAS2764_TDM_CFG1_RX_MASK	BIT(0)
-#define TAS2764_TDM_CFG1_RX_RISING	0x0
-#define TAS2764_TDM_CFG1_RX_FALLING	BIT(0)
+#define TAS27XX_TDM_CFG1		TAS27XX_REG(0X0, 0x09)
+#define TAS27XX_TDM_CFG1_MASK		GENMASK(5, 1)
+#define TAS27XX_TDM_CFG1_51_SHIFT	1
+#define TAS27XX_TDM_CFG1_RX_MASK	BIT(0)
+#define TAS27XX_TDM_CFG1_RX_RISING	0x0
+#define TAS27XX_TDM_CFG1_RX_FALLING	BIT(0)
 
 /* TDM Configuration Reg2 */
-#define TAS2764_TDM_CFG2		TAS2764_REG(0X0, 0x0a)
-#define TAS2764_TDM_CFG2_RXW_MASK	GENMASK(3, 2)
-#define TAS2764_TDM_CFG2_RXW_16BITS	0x0
-#define TAS2764_TDM_CFG2_RXW_24BITS	BIT(3)
-#define TAS2764_TDM_CFG2_RXW_32BITS	(BIT(3) | BIT(2))
-#define TAS2764_TDM_CFG2_RXS_MASK	GENMASK(1, 0)
-#define TAS2764_TDM_CFG2_RXS_16BITS	0x0
-#define TAS2764_TDM_CFG2_RXS_24BITS	BIT(0)
-#define TAS2764_TDM_CFG2_RXS_32BITS	BIT(1)
-#define TAS2764_TDM_CFG2_SCFG_MASK	GENMASK(5, 4)
-#define TAS2764_TDM_CFG2_SCFG_I2S	0x0
-#define TAS2764_TDM_CFG2_SCFG_LEFT_J	BIT(4)
-#define TAS2764_TDM_CFG2_SCFG_RIGHT_J	BIT(5)
+#define TAS27XX_TDM_CFG2		TAS27XX_REG(0X0, 0x0a)
+#define TAS27XX_TDM_CFG2_RXW_MASK	GENMASK(3, 2)
+#define TAS27XX_TDM_CFG2_RXW_16BITS	0x0
+#define TAS27XX_TDM_CFG2_RXW_24BITS	BIT(3)
+#define TAS27XX_TDM_CFG2_RXW_32BITS	(BIT(3) | BIT(2))
+#define TAS27XX_TDM_CFG2_RXS_MASK	GENMASK(1, 0)
+#define TAS27XX_TDM_CFG2_RXS_16BITS	0x0
+#define TAS27XX_TDM_CFG2_RXS_24BITS	BIT(0)
+#define TAS27XX_TDM_CFG2_RXS_32BITS	BIT(1)
+#define TAS27XX_TDM_CFG2_SCFG_MASK	GENMASK(5, 4)
+#define TAS27XX_TDM_CFG2_SCFG_I2S	0x0
+#define TAS27XX_TDM_CFG2_SCFG_LEFT_J	BIT(4)
+#define TAS27XX_TDM_CFG2_SCFG_RIGHT_J	BIT(5)
 
 /* TDM Configuration Reg3 */
-#define TAS2764_TDM_CFG3		TAS2764_REG(0X0, 0x0c)
-#define TAS2764_TDM_CFG3_RXS_MASK	GENMASK(7, 4)
-#define TAS2764_TDM_CFG3_RXS_SHIFT	0x4
-#define TAS2764_TDM_CFG3_MASK		GENMASK(3, 0)
+#define TAS27XX_TDM_CFG3		TAS27XX_REG(0X0, 0x0c)
+#define TAS27XX_TDM_CFG3_RXS_MASK	GENMASK(7, 4)
+#define TAS27XX_TDM_CFG3_RXS_SHIFT	0x4
+#define TAS27XX_TDM_CFG3_MASK		GENMASK(3, 0)
+
+/* TDM Configuration Reg4 */
+#define TAS27XX_TDM_CFG4		TAS27XX_REG(0X0, 0x0d)
+#define TAS27XX_TDM_CFG4_TX_OFFSET_MASK	GENMASK(3, 1)
 
 /* TDM Configuration Reg5 */
-#define TAS2764_TDM_CFG5		TAS2764_REG(0X0, 0x0e)
-#define TAS2764_TDM_CFG5_VSNS_MASK	BIT(6)
-#define TAS2764_TDM_CFG5_VSNS_ENABLE	BIT(6)
-#define TAS2764_TDM_CFG5_50_MASK	GENMASK(5, 0)
+#define TAS27XX_TDM_CFG5		TAS27XX_REG(0X0, 0x0e)
+#define TAS27XX_TDM_CFG5_VSNS_MASK	BIT(6)
+#define TAS27XX_TDM_CFG5_VSNS_ENABLE	BIT(6)
+#define TAS27XX_TDM_CFG5_50_MASK	GENMASK(5, 0)
 
 /* TDM Configuration Reg6 */
-#define TAS2764_TDM_CFG6		TAS2764_REG(0X0, 0x0f)
-#define TAS2764_TDM_CFG6_ISNS_MASK	BIT(6)
-#define TAS2764_TDM_CFG6_ISNS_ENABLE	BIT(6)
-#define TAS2764_TDM_CFG6_50_MASK	GENMASK(5, 0)
+#define TAS27XX_TDM_CFG6		TAS27XX_REG(0X0, 0x0f)
+#define TAS27XX_TDM_CFG6_ISNS_MASK	BIT(6)
+#define TAS27XX_TDM_CFG6_ISNS_ENABLE	BIT(6)
+#define TAS27XX_TDM_CFG6_50_MASK	GENMASK(5, 0)
+
+/* INT&CLK CFG */
+#define TAS27XX_CLK_CFG			TAS27XX_REG(0X0, 0x5c)
+#define TAS27XX_CLK_CFG_MASK		GENMASK(7, 6)
+#define TAS27XX_CLK_CFG_ENABLE		(BIT(7) | BIT(6))
 
-#endif /* __TAS2764__ */
+#endif /* __TAS27XX_H__ */
-- 
2.35.1



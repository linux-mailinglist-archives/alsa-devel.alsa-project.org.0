Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0597B2543B1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 12:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ECB117E2;
	Thu, 27 Aug 2020 12:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ECB117E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598524083;
	bh=cx6zqNRjvsegqTB02XWCCCm8A3izo+HOqOyqETXXCB4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qHdl6+w9o3dK/6eiMUgjQFQR8qE2c3wEi60XF689CgJ/CilH0x9+qRCYnAerfVBsV
	 JiJ7HWlY6LOKQjhEpQGl2xxqyV22sF+N56hnDt4+jOVDiWgweHTuRaCx13gTWvwdAt
	 Hej+ckI6icKOHfjJZYckCaM9I9BXb33snjQ6qay0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A05F801D9;
	Thu, 27 Aug 2020 12:26:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CEDCF800EB; Thu, 27 Aug 2020 12:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E76C4F800EB
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 12:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E76C4F800EB
IronPort-SDR: HudoWtADTPEEoJAqK65ybqOR+c+C6xcdcOcoINk64ZNyoHt5C4TE5ZSI3odXYx1WQcGZZSAIb3
 eeMqutCBDCmWbnXqR7EXxm1uhj7i4arcfWTmKxZ8qYrKseJ6EMRf1PqjqA7zXkAtqx1/j/5+7H
 Eu1k2Dr4Sts4qVYLPqj7Yc2ODzCmRyRN+oKo6mIn+fLCm4A4ix5h2mzL/4IAzIqaQjUnRVBOb3
 x1WXTGdgqindTjVqGzDd5FCgg7bTejfflUSQFkRvDvWSKQUPVJvQ/oLqzUXNGSMRT5gccOYA32
 mrw=
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; d="scan'208";a="11919597"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v3] ASoC: max9867: shutdown codec when changing filter type
Date: Thu, 27 Aug 2020 12:25:28 +0200
Message-ID: <20200827102528.29677-1-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX04.axis.com (10.0.5.18)
Cc: broonie@kernel.org, ladis@linux-mips.org, Pavel Dobias <dobias@2n.cz>
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

Changing filter type without disabling codec results in filter
malfunction. Disable codec when changing filter type.

Signed-off-by: Pavel Dobias <dobias@2n.cz>
---
Changes in v2:
- don't allow change if component active
- avoid codec shutdown in max9867_filter_set if value not changed

Changes in v3:
- don't allow change if ADC/DAC active, not whole component
- ternary operator rewritten to normal condition

 sound/soc/codecs/max9867.c | 131 +++++++++++++++++++++++++++++++++----
 sound/soc/codecs/max9867.h |   4 +-
 2 files changed, 120 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index fcb31144d69c..aef2746bfb94 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -15,6 +15,14 @@
 #include <sound/tlv.h>
 #include "max9867.h"
 
+struct max9867_priv {
+	struct regmap *regmap;
+	const struct snd_pcm_hw_constraint_list *constraints;
+	unsigned int sysclk, pclk;
+	bool master, dsp_a;
+	unsigned int adc_dac_active;
+};
+
 static const char *const max9867_spmode[] = {
 	"Stereo Diff", "Mono Diff",
 	"Stereo Cap", "Mono Cap",
@@ -32,8 +40,102 @@ static const char *const max9867_adc_dac_filter_text[] = {
 	"Butterworth/8-24"
 };
 
-static SOC_ENUM_SINGLE_DECL(max9867_filter, MAX9867_CODECFLTR, 7,
-	max9867_filter_text);
+enum max9867_adc_dac {
+	MAX9867_ADC_LEFT,
+	MAX9867_ADC_RIGHT,
+	MAX9867_DAC_LEFT,
+	MAX9867_DAC_RIGHT,
+};
+
+static int max9867_adc_dac_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
+	enum max9867_adc_dac adc_dac;
+
+	if (!strcmp(w->name, "ADCL"))
+		adc_dac = MAX9867_ADC_LEFT;
+	else if (!strcmp(w->name, "ADCR"))
+		adc_dac = MAX9867_ADC_RIGHT;
+	else if (!strcmp(w->name, "DACL"))
+		adc_dac = MAX9867_DAC_LEFT;
+	else if (!strcmp(w->name, "DACR"))
+		adc_dac = MAX9867_DAC_RIGHT;
+	else
+		return 0;
+
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		max9867->adc_dac_active |= BIT(adc_dac);
+	else if (SND_SOC_DAPM_EVENT_OFF(event))
+		max9867->adc_dac_active &= ~BIT(adc_dac);
+
+	return 0;
+}
+
+static int max9867_filter_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(max9867->regmap, MAX9867_CODECFLTR, &reg);
+	if (ret)
+		return -EINVAL;
+
+	if (reg & MAX9867_CODECFLTR_MODE)
+		ucontrol->value.enumerated.item[0] = 1;
+	else
+		ucontrol->value.enumerated.item[0] = 0;
+
+	return 0;
+}
+
+static int max9867_filter_set(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
+	unsigned int reg, mode = ucontrol->value.enumerated.item[0];
+	int ret;
+
+	if (mode > 1)
+		return -EINVAL;
+
+	/* don't allow change if ADC/DAC active */
+	if (max9867->adc_dac_active)
+		return -EBUSY;
+
+	/* read current filter mode */
+	ret = regmap_read(max9867->regmap, MAX9867_CODECFLTR, &reg);
+	if (ret)
+		return -EINVAL;
+
+	if (mode)
+		mode = MAX9867_CODECFLTR_MODE;
+
+	/* check if change is needed */
+	if ((reg & MAX9867_CODECFLTR_MODE) == mode)
+		return 0;
+
+	/* shutdown codec before switching filter mode */
+	regmap_update_bits(max9867->regmap, MAX9867_PWRMAN,
+		MAX9867_PWRMAN_SHDN, 0);
+
+	/* switch filter mode */
+	regmap_update_bits(max9867->regmap, MAX9867_CODECFLTR,
+		MAX9867_CODECFLTR_MODE, mode);
+
+	/* out of shutdown now */
+	regmap_update_bits(max9867->regmap, MAX9867_PWRMAN,
+		MAX9867_PWRMAN_SHDN, MAX9867_PWRMAN_SHDN);
+
+	return 0;
+}
+
+static SOC_ENUM_SINGLE_EXT_DECL(max9867_filter, max9867_filter_text);
 static SOC_ENUM_SINGLE_DECL(max9867_dac_filter, MAX9867_CODECFLTR, 0,
 	max9867_adc_dac_filter_text);
 static SOC_ENUM_SINGLE_DECL(max9867_adc_filter, MAX9867_CODECFLTR, 4,
@@ -76,7 +178,7 @@ static const struct snd_kcontrol_new max9867_snd_controls[] = {
 	SOC_ENUM("Speaker Mode", max9867_spkmode),
 	SOC_SINGLE("Volume Smoothing Switch", MAX9867_MODECONFIG, 6, 1, 0),
 	SOC_SINGLE("Line ZC Switch", MAX9867_MODECONFIG, 5, 1, 0),
-	SOC_ENUM("DSP Filter", max9867_filter),
+	SOC_ENUM_EXT("DSP Filter", max9867_filter, max9867_filter_get, max9867_filter_set),
 	SOC_ENUM("ADC Filter", max9867_adc_filter),
 	SOC_ENUM("DAC Filter", max9867_dac_filter),
 	SOC_SINGLE("Mono Playback Switch", MAX9867_IFC1B, 3, 1, 0),
@@ -134,8 +236,12 @@ static const struct snd_soc_dapm_widget max9867_dapm_widgets[] = {
 			 &max9867_left_dmic_mux),
 	SND_SOC_DAPM_MUX("DMICR Mux", SND_SOC_NOPM, 0, 0,
 			 &max9867_right_dmic_mux),
-	SND_SOC_DAPM_ADC("ADCL", "HiFi Capture", SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_ADC("ADCR", "HiFi Capture", SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC_E("ADCL", "HiFi Capture", SND_SOC_NOPM, 0, 0,
+			   max9867_adc_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADCR", "HiFi Capture", SND_SOC_NOPM, 0, 0,
+			   max9867_adc_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_MIXER("Digital", SND_SOC_NOPM, 0, 0,
 			   max9867_sidetone_mixer_controls,
@@ -143,8 +249,12 @@ static const struct snd_soc_dapm_widget max9867_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER_NAMED_CTL("Output Mixer", SND_SOC_NOPM, 0, 0,
 				     max9867_output_mixer_controls,
 				     ARRAY_SIZE(max9867_output_mixer_controls)),
-	SND_SOC_DAPM_DAC("DACL", "HiFi Playback", SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_DAC("DACR", "HiFi Playback", SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC_E("DACL", "HiFi Playback", SND_SOC_NOPM, 0, 0,
+			   max9867_adc_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_DAC_E("DACR", "HiFi Playback", SND_SOC_NOPM, 0, 0,
+			   max9867_adc_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_SWITCH("Master Playback", SND_SOC_NOPM, 0, 0,
 			    &max9867_line_out_control),
 	SND_SOC_DAPM_OUTPUT("LOUT"),
@@ -197,13 +307,6 @@ static const struct snd_pcm_hw_constraint_list max9867_constraints_48k = {
 	.count = ARRAY_SIZE(max9867_rates_48k),
 };
 
-struct max9867_priv {
-	struct regmap *regmap;
-	const struct snd_pcm_hw_constraint_list *constraints;
-	unsigned int sysclk, pclk;
-	bool master, dsp_a;
-};
-
 static int max9867_startup(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
diff --git a/sound/soc/codecs/max9867.h b/sound/soc/codecs/max9867.h
index 3092c3b99075..b6b880631b13 100644
--- a/sound/soc/codecs/max9867.h
+++ b/sound/soc/codecs/max9867.h
@@ -44,7 +44,8 @@
 #define MAX9867_IFC1B_PCLK_4	0x05
 #define MAX9867_IFC1B_PCLK_8	0x06
 #define MAX9867_IFC1B_PCLK_16	0x07
-#define MAX9867_CODECFLTR    0x0a
+#define MAX9867_CODECFLTR	0x0a
+#define MAX9867_CODECFLTR_MODE	(1<<7)
 #define MAX9867_SIDETONE     0x0b
 #define MAX9867_DACLEVEL     0x0c
 #define MAX9867_ADCLEVEL     0x0d
@@ -58,6 +59,7 @@
 #define MAX9867_MICCONFIG    0x15
 #define MAX9867_MODECONFIG   0x16
 #define MAX9867_PWRMAN       0x17
+#define MAX9867_PWRMAN_SHDN  (1<<7)
 #define MAX9867_REVISION     0xff
 
 #define MAX9867_CACHEREGNUM 10
-- 
2.20.1


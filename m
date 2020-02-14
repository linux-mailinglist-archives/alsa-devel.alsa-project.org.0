Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEF515D62A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 12:00:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 580F8167A;
	Fri, 14 Feb 2020 11:59:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 580F8167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581678024;
	bh=nFFFU6LAgOy2uxmHRq2p/w6nDCG1RNrv9glx2I3Owpc=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k8XMLAv/62Xm/EtdnO17KGFqYXpcJQwTlXgQcDjKuh5A7RJqpA24kN7tkO1kFQQxh
	 jPk8yjcgc513/ogp5bH49yPstByHPhZrgo3/UcmCyyXD7URAcJ6OTScCDlDEfi144N
	 QO0gFM2kSlzly3kMuFaStQ4rW8ftya3YrqyLpVTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3D37F8019B;
	Fri, 14 Feb 2020 11:58:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FCA1F8019B; Fri, 14 Feb 2020 11:58:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7983F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 11:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7983F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="UdmXCvUx"
Received: by mail-qk1-x74a.google.com with SMTP id q2so5831987qkq.19
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 02:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=JS8ENQngylkR114xjxuzMV/FIZVCnldRob4YtpY9g8k=;
 b=UdmXCvUxE/EYx8E+CXy0PcoKjLxafDSvRMBvFuZjIIN6byhnaFaSbLCjnj4DFjXiJZ
 R6gphVsdFEaqdCBGEPfELLrwuBtHgJEFeYRMIoH3vvbGdbRJGdCSLmo+RUdwtKVAfvlm
 kaj1H8m9yLmYf1VG3JSx7Pyzi71CoTDmoOgxHxCJ8MHFe5316wVwL+UrrxtKnOWcQyJw
 efn3NoSe1pVHlJk7r8R+O6UQZkbyKONqBOm7GsrMHneHfOwwY9DMqqetqFFt7+wr8pHW
 JwYHZWfflfr6+xq1AwROOcvmgZxKE3AAzhYXW8sJn+SU0h1h3W4G2fhDzGDIP4FQk6/r
 qBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=JS8ENQngylkR114xjxuzMV/FIZVCnldRob4YtpY9g8k=;
 b=FQ4HjM1FXbKuCA8O5mqhMxCt0LcXXnD6nX+khbPcOI9UbG20GE58V4MKar79+2MkQ9
 mbnxrAsiCXwoCHe1oFKvusdAGeX79JZ19kmWphi6NBDCpiGvNlHM+8IwUR9QktDFflUe
 ycJF0RvUMqyJJFA6whv0iaSSdGRO4q00D4bdA5xTz7R+oSjL2U3U2Uh8uN2sgopabimA
 idZvS4cL7bgbrUAYneIAFDBp+cl1s7Jplfe0hOLyewaqM68pm1U4vFm1Rhda/dCFanU+
 oWVi7Pxk95IjFuyTDbUY5lURJ4M+OsDY+1Un742MHM2oAdRbxnbsgUb2fRs91uYKKCP6
 EOyg==
X-Gm-Message-State: APjAAAWxwzWQxrpv8NNgoY3IXyLabjcSacsomr7UV5n0V1es/9eNe0ci
 /aGT2c2Lsa8kyOP1/B6Xgr+3w+cu0cjA
X-Google-Smtp-Source: APXvYqwMovJjusuEpCVhE2VG1QWxFnu6SzlQs1JJMgOY+AfWfHC0v6kPqPN71fVX50jOSfcu1bAooajyvv+O
X-Received: by 2002:ac8:1b18:: with SMTP id y24mr1974942qtj.158.1581677876694; 
 Fri, 14 Feb 2020 02:57:56 -0800 (PST)
Date: Fri, 14 Feb 2020 18:57:42 +0800
In-Reply-To: <20200214105744.82258-1-tzungbi@google.com>
Message-Id: <20200214105744.82258-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200214105744.82258-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 1/3] ASoC: max98090: revert invalid fix for
	handling SHDN
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Reverts commit 62d5ae4cafb7 ("ASoC: max98090: save and restore
SHDN when changing sensitive registers").

A critical side-effect was observed: when keep playing something,
the recorded sound has chance to break (clipping).

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98090.c | 434 ++++++++++--------------------------
 sound/soc/codecs/max98090.h |   3 +-
 2 files changed, 124 insertions(+), 313 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 5bc2c6411b33..032adc14562d 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -5,150 +5,24 @@
  * Copyright 2011-2012 Maxim Integrated Products
  */
 
-#include <linux/acpi.h>
-#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/acpi.h>
+#include <linux/clk.h>
 #include <sound/jack.h>
-#include <sound/max98090.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
+#include <sound/max98090.h>
 #include "max98090.h"
 
-static void max98090_shdn_save_locked(struct max98090_priv *max98090)
-{
-	int shdn = 0;
-
-	/* saved_shdn, saved_count, SHDN are protected by card->dapm_mutex */
-	regmap_read(max98090->regmap, M98090_REG_DEVICE_SHUTDOWN, &shdn);
-	max98090->saved_shdn |= shdn;
-	++max98090->saved_count;
-
-	if (shdn)
-		regmap_write(max98090->regmap, M98090_REG_DEVICE_SHUTDOWN, 0x0);
-}
-
-static void max98090_shdn_restore_locked(struct max98090_priv *max98090)
-{
-	/* saved_shdn, saved_count, SHDN are protected by card->dapm_mutex */
-	if (--max98090->saved_count == 0) {
-		if (max98090->saved_shdn) {
-			regmap_write(max98090->regmap,
-				     M98090_REG_DEVICE_SHUTDOWN,
-				     M98090_SHDNN_MASK);
-			max98090->saved_shdn = 0;
-		}
-	}
-}
-
-static void max98090_shdn_save(struct max98090_priv *max98090)
-{
-	mutex_lock_nested(&max98090->component->card->dapm_mutex,
-			  SND_SOC_DAPM_CLASS_RUNTIME);
-	max98090_shdn_save_locked(max98090);
-}
-
-static void max98090_shdn_restore(struct max98090_priv *max98090)
-{
-	max98090_shdn_restore_locked(max98090);
-	mutex_unlock(&max98090->component->card->dapm_mutex);
-}
-
-static int max98090_put_volsw(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct max98090_priv *max98090 =
-		snd_soc_component_get_drvdata(component);
-	int ret;
-
-	max98090_shdn_save(max98090);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	max98090_shdn_restore(max98090);
-
-	return ret;
-}
-
-static int max98090_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct max98090_priv *max98090 =
-		snd_soc_component_get_drvdata(component);
-	int ret;
-
-	max98090_shdn_save(max98090);
-	ret = snd_soc_dapm_put_enum_double_locked(kcontrol, ucontrol);
-	max98090_shdn_restore(max98090);
-
-	return ret;
-}
-
-static int max98090_put_enum_double(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct max98090_priv *max98090 =
-		snd_soc_component_get_drvdata(component);
-	int ret;
-
-	max98090_shdn_save(max98090);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	max98090_shdn_restore(max98090);
-
-	return ret;
-}
-
-static int max98090_bytes_put(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct max98090_priv *max98090 =
-		snd_soc_component_get_drvdata(component);
-	int ret;
-
-	max98090_shdn_save(max98090);
-	ret = snd_soc_bytes_put(kcontrol, ucontrol);
-	max98090_shdn_restore(max98090);
-
-	return ret;
-}
-
-static int max98090_dapm_event(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
-	struct max98090_priv *max98090 =
-		snd_soc_component_get_drvdata(component);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-	case SND_SOC_DAPM_PRE_PMD:
-		max98090_shdn_save_locked(max98090);
-		break;
-	case SND_SOC_DAPM_POST_PMU:
-	case SND_SOC_DAPM_POST_PMD:
-		max98090_shdn_restore_locked(max98090);
-		break;
-	}
-
-	return 0;
-}
-
 /* Allows for sparsely populated register maps */
 static const struct reg_default max98090_reg[] = {
 	{ 0x00, 0x00 }, /* 00 Software Reset */
@@ -632,13 +506,10 @@ static SOC_ENUM_SINGLE_DECL(max98090_adchp_enum,
 			    max98090_pwr_perf_text);
 
 static const struct snd_kcontrol_new max98090_snd_controls[] = {
-	SOC_ENUM_EXT("MIC Bias VCM Bandgap", max98090_vcmbandgap_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
+	SOC_ENUM("MIC Bias VCM Bandgap", max98090_vcmbandgap_enum),
 
-	SOC_SINGLE_EXT("DMIC MIC Comp Filter Config",
-		M98090_REG_DIGITAL_MIC_CONFIG,
-		M98090_DMIC_COMP_SHIFT, M98090_DMIC_COMP_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
+	SOC_SINGLE("DMIC MIC Comp Filter Config", M98090_REG_DIGITAL_MIC_CONFIG,
+		M98090_DMIC_COMP_SHIFT, M98090_DMIC_COMP_NUM - 1, 0),
 
 	SOC_SINGLE_EXT_TLV("MIC1 Boost Volume",
 		M98090_REG_MIC1_INPUT_LEVEL, M98090_MIC_PA1EN_SHIFT,
@@ -693,34 +564,24 @@ static const struct snd_kcontrol_new max98090_snd_controls[] = {
 		M98090_AVR_SHIFT, M98090_AVR_NUM - 1, 1,
 		max98090_av_tlv),
 
-	SOC_ENUM_EXT("ADC Oversampling Rate", max98090_osr128_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
-	SOC_SINGLE_EXT("ADC Quantizer Dither", M98090_REG_ADC_CONTROL,
-		M98090_ADCDITHER_SHIFT, M98090_ADCDITHER_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
-	SOC_ENUM_EXT("ADC High Performance Mode", max98090_adchp_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
-
-	SOC_SINGLE_EXT("DAC Mono Mode", M98090_REG_IO_CONFIGURATION,
-		M98090_DMONO_SHIFT, M98090_DMONO_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
-	SOC_SINGLE_EXT("SDIN Mode", M98090_REG_IO_CONFIGURATION,
-		M98090_SDIEN_SHIFT, M98090_SDIEN_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
-	SOC_SINGLE_EXT("SDOUT Mode", M98090_REG_IO_CONFIGURATION,
-		M98090_SDOEN_SHIFT, M98090_SDOEN_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
-	SOC_SINGLE_EXT("SDOUT Hi-Z Mode", M98090_REG_IO_CONFIGURATION,
-		M98090_HIZOFF_SHIFT, M98090_HIZOFF_NUM - 1, 1,
-		snd_soc_get_volsw, max98090_put_volsw),
-	SOC_ENUM_EXT("Filter Mode", max98090_mode_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
-	SOC_SINGLE_EXT("Record Path DC Blocking", M98090_REG_FILTER_CONFIG,
-		M98090_AHPF_SHIFT, M98090_AHPF_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
-	SOC_SINGLE_EXT("Playback Path DC Blocking", M98090_REG_FILTER_CONFIG,
-		M98090_DHPF_SHIFT, M98090_DHPF_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
+	SOC_ENUM("ADC Oversampling Rate", max98090_osr128_enum),
+	SOC_SINGLE("ADC Quantizer Dither", M98090_REG_ADC_CONTROL,
+		M98090_ADCDITHER_SHIFT, M98090_ADCDITHER_NUM - 1, 0),
+	SOC_ENUM("ADC High Performance Mode", max98090_adchp_enum),
+
+	SOC_SINGLE("DAC Mono Mode", M98090_REG_IO_CONFIGURATION,
+		M98090_DMONO_SHIFT, M98090_DMONO_NUM - 1, 0),
+	SOC_SINGLE("SDIN Mode", M98090_REG_IO_CONFIGURATION,
+		M98090_SDIEN_SHIFT, M98090_SDIEN_NUM - 1, 0),
+	SOC_SINGLE("SDOUT Mode", M98090_REG_IO_CONFIGURATION,
+		M98090_SDOEN_SHIFT, M98090_SDOEN_NUM - 1, 0),
+	SOC_SINGLE("SDOUT Hi-Z Mode", M98090_REG_IO_CONFIGURATION,
+		M98090_HIZOFF_SHIFT, M98090_HIZOFF_NUM - 1, 1),
+	SOC_ENUM("Filter Mode", max98090_mode_enum),
+	SOC_SINGLE("Record Path DC Blocking", M98090_REG_FILTER_CONFIG,
+		M98090_AHPF_SHIFT, M98090_AHPF_NUM - 1, 0),
+	SOC_SINGLE("Playback Path DC Blocking", M98090_REG_FILTER_CONFIG,
+		M98090_DHPF_SHIFT, M98090_DHPF_NUM - 1, 0),
 	SOC_SINGLE_TLV("Digital BQ Volume", M98090_REG_ADC_BIQUAD_LEVEL,
 		M98090_AVBQ_SHIFT, M98090_AVBQ_NUM - 1, 1, max98090_dv_tlv),
 	SOC_SINGLE_EXT_TLV("Digital Sidetone Volume",
@@ -733,17 +594,13 @@ static const struct snd_kcontrol_new max98090_snd_controls[] = {
 	SOC_SINGLE_TLV("Digital Volume", M98090_REG_DAI_PLAYBACK_LEVEL,
 		M98090_DV_SHIFT, M98090_DV_NUM - 1, 1,
 		max98090_dv_tlv),
-	SND_SOC_BYTES_E("EQ Coefficients", M98090_REG_EQUALIZER_BASE, 105,
-		snd_soc_bytes_get, max98090_bytes_put),
-	SOC_SINGLE_EXT("Digital EQ 3 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
-		M98090_EQ3BANDEN_SHIFT, M98090_EQ3BANDEN_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
-	SOC_SINGLE_EXT("Digital EQ 5 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
-		M98090_EQ5BANDEN_SHIFT, M98090_EQ5BANDEN_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
-	SOC_SINGLE_EXT("Digital EQ 7 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
-		M98090_EQ7BANDEN_SHIFT, M98090_EQ7BANDEN_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
+	SND_SOC_BYTES("EQ Coefficients", M98090_REG_EQUALIZER_BASE, 105),
+	SOC_SINGLE("Digital EQ 3 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
+		M98090_EQ3BANDEN_SHIFT, M98090_EQ3BANDEN_NUM - 1, 0),
+	SOC_SINGLE("Digital EQ 5 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
+		M98090_EQ5BANDEN_SHIFT, M98090_EQ5BANDEN_NUM - 1, 0),
+	SOC_SINGLE("Digital EQ 7 Band Switch", M98090_REG_DSP_FILTER_ENABLE,
+		M98090_EQ7BANDEN_SHIFT, M98090_EQ7BANDEN_NUM - 1, 0),
 	SOC_SINGLE("Digital EQ Clipping Detection", M98090_REG_DAI_PLAYBACK_LEVEL_EQ,
 		M98090_EQCLPN_SHIFT, M98090_EQCLPN_NUM - 1,
 		1),
@@ -751,34 +608,25 @@ static const struct snd_kcontrol_new max98090_snd_controls[] = {
 		M98090_DVEQ_SHIFT, M98090_DVEQ_NUM - 1, 1,
 		max98090_dv_tlv),
 
-	SOC_SINGLE_EXT("ALC Enable", M98090_REG_DRC_TIMING,
-		M98090_DRCEN_SHIFT, M98090_DRCEN_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
-	SOC_ENUM_EXT("ALC Attack Time", max98090_drcatk_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
-	SOC_ENUM_EXT("ALC Release Time", max98090_drcrls_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
+	SOC_SINGLE("ALC Enable", M98090_REG_DRC_TIMING,
+		M98090_DRCEN_SHIFT, M98090_DRCEN_NUM - 1, 0),
+	SOC_ENUM("ALC Attack Time", max98090_drcatk_enum),
+	SOC_ENUM("ALC Release Time", max98090_drcrls_enum),
 	SOC_SINGLE_TLV("ALC Make Up Volume", M98090_REG_DRC_GAIN,
 		M98090_DRCG_SHIFT, M98090_DRCG_NUM - 1, 0,
 		max98090_alcmakeup_tlv),
-	SOC_ENUM_EXT("ALC Compression Ratio", max98090_alccmp_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
-	SOC_ENUM_EXT("ALC Expansion Ratio", max98090_drcexp_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
-	SOC_SINGLE_EXT_TLV("ALC Compression Threshold Volume",
+	SOC_ENUM("ALC Compression Ratio", max98090_alccmp_enum),
+	SOC_ENUM("ALC Expansion Ratio", max98090_drcexp_enum),
+	SOC_SINGLE_TLV("ALC Compression Threshold Volume",
 		M98090_REG_DRC_COMPRESSOR, M98090_DRCTHC_SHIFT,
-		M98090_DRCTHC_NUM - 1, 1,
-		snd_soc_get_volsw, max98090_put_volsw, max98090_alccomp_tlv),
-	SOC_SINGLE_EXT_TLV("ALC Expansion Threshold Volume",
+		M98090_DRCTHC_NUM - 1, 1, max98090_alccomp_tlv),
+	SOC_SINGLE_TLV("ALC Expansion Threshold Volume",
 		M98090_REG_DRC_EXPANDER, M98090_DRCTHE_SHIFT,
-		M98090_DRCTHE_NUM - 1, 1,
-		snd_soc_get_volsw, max98090_put_volsw, max98090_drcexp_tlv),
+		M98090_DRCTHE_NUM - 1, 1, max98090_drcexp_tlv),
 
-	SOC_ENUM_EXT("DAC HP Playback Performance Mode",
-		max98090_dac_perfmode_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
-	SOC_ENUM_EXT("DAC High Performance Mode", max98090_dachp_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
+	SOC_ENUM("DAC HP Playback Performance Mode",
+		max98090_dac_perfmode_enum),
+	SOC_ENUM("DAC High Performance Mode", max98090_dachp_enum),
 
 	SOC_SINGLE_TLV("Headphone Left Mixer Volume",
 		M98090_REG_HP_CONTROL, M98090_MIXHPLG_SHIFT,
@@ -836,12 +684,9 @@ static const struct snd_kcontrol_new max98090_snd_controls[] = {
 	SOC_SINGLE("Volume Adjustment Smoothing", M98090_REG_LEVEL_CONTROL,
 		M98090_VSENN_SHIFT, M98090_VSENN_NUM - 1, 1),
 
-	SND_SOC_BYTES_E("Biquad Coefficients",
-		M98090_REG_RECORD_BIQUAD_BASE, 15,
-		snd_soc_bytes_get, max98090_bytes_put),
-	SOC_SINGLE_EXT("Biquad Switch", M98090_REG_DSP_FILTER_ENABLE,
-		M98090_ADCBQEN_SHIFT, M98090_ADCBQEN_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
+	SND_SOC_BYTES("Biquad Coefficients", M98090_REG_RECORD_BIQUAD_BASE, 15),
+	SOC_SINGLE("Biquad Switch", M98090_REG_DSP_FILTER_ENABLE,
+		M98090_ADCBQEN_SHIFT, M98090_ADCBQEN_NUM - 1, 0),
 };
 
 static const struct snd_kcontrol_new max98091_snd_controls[] = {
@@ -850,12 +695,10 @@ static const struct snd_kcontrol_new max98091_snd_controls[] = {
 		M98090_DMIC34_ZEROPAD_SHIFT,
 		M98090_DMIC34_ZEROPAD_NUM - 1, 0),
 
-	SOC_ENUM_EXT("Filter DMIC34 Mode", max98090_filter_dmic34mode_enum,
-		snd_soc_get_enum_double, max98090_put_enum_double),
-	SOC_SINGLE_EXT("DMIC34 DC Blocking", M98090_REG_FILTER_CONFIG,
+	SOC_ENUM("Filter DMIC34 Mode", max98090_filter_dmic34mode_enum),
+	SOC_SINGLE("DMIC34 DC Blocking", M98090_REG_FILTER_CONFIG,
 		M98090_FLT_DMIC34HPF_SHIFT,
-		M98090_FLT_DMIC34HPF_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
+		M98090_FLT_DMIC34HPF_NUM - 1, 0),
 
 	SOC_SINGLE_TLV("DMIC3 Boost Volume", M98090_REG_DMIC3_VOLUME,
 		M98090_DMIC_AV3G_SHIFT, M98090_DMIC_AV3G_NUM - 1, 0,
@@ -873,9 +716,8 @@ static const struct snd_kcontrol_new max98091_snd_controls[] = {
 
 	SND_SOC_BYTES("DMIC34 Biquad Coefficients",
 		M98090_REG_DMIC34_BIQUAD_BASE, 15),
-	SOC_SINGLE_EXT("DMIC34 Biquad Switch", M98090_REG_DSP_FILTER_ENABLE,
-		M98090_DMIC34BQEN_SHIFT, M98090_DMIC34BQEN_NUM - 1, 0,
-		snd_soc_get_volsw, max98090_put_volsw),
+	SOC_SINGLE("DMIC34 Biquad Switch", M98090_REG_DSP_FILTER_ENABLE,
+		M98090_DMIC34BQEN_SHIFT, M98090_DMIC34BQEN_NUM - 1, 0),
 
 	SOC_SINGLE_TLV("DMIC34 BQ PreAttenuation Volume",
 		M98090_REG_DMIC34_BQ_PREATTEN, M98090_AV34BQ_SHIFT,
@@ -929,6 +771,19 @@ static int max98090_micinput_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int max98090_shdn_event(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
+
+	if (event & SND_SOC_DAPM_POST_PMU)
+		max98090->shdn_pending = true;
+
+	return 0;
+
+}
+
 static const char *mic1_mux_text[] = { "IN12", "IN56" };
 
 static SOC_ENUM_SINGLE_DECL(mic1_mux_enum,
@@ -1029,14 +884,10 @@ static SOC_ENUM_SINGLE_DECL(ltenr_mux_enum,
 			    lten_mux_text);
 
 static const struct snd_kcontrol_new max98090_ltenl_mux =
-	SOC_DAPM_ENUM_EXT("LTENL Mux", ltenl_mux_enum,
-			  snd_soc_dapm_get_enum_double,
-			  max98090_dapm_put_enum_double);
+	SOC_DAPM_ENUM("LTENL Mux", ltenl_mux_enum);
 
 static const struct snd_kcontrol_new max98090_ltenr_mux =
-	SOC_DAPM_ENUM_EXT("LTENR Mux", ltenr_mux_enum,
-			  snd_soc_dapm_get_enum_double,
-			  max98090_dapm_put_enum_double);
+	SOC_DAPM_ENUM("LTENR Mux", ltenr_mux_enum);
 
 static const char *lben_mux_text[] = { "Normal", "Loopback" };
 
@@ -1051,14 +902,10 @@ static SOC_ENUM_SINGLE_DECL(lbenr_mux_enum,
 			    lben_mux_text);
 
 static const struct snd_kcontrol_new max98090_lbenl_mux =
-	SOC_DAPM_ENUM_EXT("LBENL Mux", lbenl_mux_enum,
-			  snd_soc_dapm_get_enum_double,
-			  max98090_dapm_put_enum_double);
+	SOC_DAPM_ENUM("LBENL Mux", lbenl_mux_enum);
 
 static const struct snd_kcontrol_new max98090_lbenr_mux =
-	SOC_DAPM_ENUM_EXT("LBENR Mux", lbenr_mux_enum,
-			  snd_soc_dapm_get_enum_double,
-			  max98090_dapm_put_enum_double);
+	SOC_DAPM_ENUM("LBENR Mux", lbenr_mux_enum);
 
 static const char *stenl_mux_text[] = { "Normal", "Sidetone Left" };
 
@@ -1225,25 +1072,21 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("IN56"),
 
 	SND_SOC_DAPM_SUPPLY("MICBIAS", M98090_REG_INPUT_ENABLE,
-		M98090_MBEN_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		M98090_MBEN_SHIFT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("SHDN", M98090_REG_DEVICE_SHUTDOWN,
 		M98090_SHDNN_SHIFT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("SDIEN", M98090_REG_IO_CONFIGURATION,
-		M98090_SDIEN_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		M98090_SDIEN_SHIFT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("SDOEN", M98090_REG_IO_CONFIGURATION,
-		M98090_SDOEN_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		M98090_SDOEN_SHIFT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("DMICL_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
-		M98090_DIGMICL_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		 M98090_DIGMICL_SHIFT, 0, max98090_shdn_event,
+			SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_SUPPLY("DMICR_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
-		M98090_DIGMICR_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		 M98090_DIGMICR_SHIFT, 0, max98090_shdn_event,
+			 SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_SUPPLY("AHPF", M98090_REG_FILTER_CONFIG,
-		M98090_AHPF_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		M98090_AHPF_SHIFT, 0, NULL, 0),
 
 /*
  * Note: Sysclk and misc power supplies are taken care of by SHDN
@@ -1273,12 +1116,10 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 		&max98090_lineb_mixer_controls[0],
 		ARRAY_SIZE(max98090_lineb_mixer_controls)),
 
-	SND_SOC_DAPM_PGA_E("LINEA Input", M98090_REG_INPUT_ENABLE,
-		M98090_LINEAEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
-	SND_SOC_DAPM_PGA_E("LINEB Input", M98090_REG_INPUT_ENABLE,
-		M98090_LINEBEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+	SND_SOC_DAPM_PGA("LINEA Input", M98090_REG_INPUT_ENABLE,
+		M98090_LINEAEN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("LINEB Input", M98090_REG_INPUT_ENABLE,
+		M98090_LINEBEN_SHIFT, 0, NULL, 0),
 
 	SND_SOC_DAPM_MIXER("Left ADC Mixer", SND_SOC_NOPM, 0, 0,
 		&max98090_left_adc_mixer_controls[0],
@@ -1289,11 +1130,11 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 		ARRAY_SIZE(max98090_right_adc_mixer_controls)),
 
 	SND_SOC_DAPM_ADC_E("ADCL", NULL, M98090_REG_INPUT_ENABLE,
-		M98090_ADLEN_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		M98090_ADLEN_SHIFT, 0, max98090_shdn_event,
+		SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_ADC_E("ADCR", NULL, M98090_REG_INPUT_ENABLE,
-		M98090_ADREN_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		M98090_ADREN_SHIFT, 0, max98090_shdn_event,
+		SND_SOC_DAPM_POST_PMU),
 
 	SND_SOC_DAPM_AIF_OUT("AIFOUTL", "HiFi Capture", 0,
 		SND_SOC_NOPM, 0, 0),
@@ -1321,12 +1162,10 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("AIFINL", "HiFi Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("AIFINR", "HiFi Playback", 1, SND_SOC_NOPM, 0, 0),
 
-	SND_SOC_DAPM_DAC_E("DACL", NULL, M98090_REG_OUTPUT_ENABLE,
-		M98090_DALEN_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
-	SND_SOC_DAPM_DAC_E("DACR", NULL, M98090_REG_OUTPUT_ENABLE,
-		M98090_DAREN_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+	SND_SOC_DAPM_DAC("DACL", NULL, M98090_REG_OUTPUT_ENABLE,
+		M98090_DALEN_SHIFT, 0),
+	SND_SOC_DAPM_DAC("DACR", NULL, M98090_REG_OUTPUT_ENABLE,
+		M98090_DAREN_SHIFT, 0),
 
 	SND_SOC_DAPM_MIXER("Left Headphone Mixer", SND_SOC_NOPM, 0, 0,
 		&max98090_left_hp_mixer_controls[0],
@@ -1361,26 +1200,20 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("MIXHPRSEL Mux", SND_SOC_NOPM, 0, 0,
 		&max98090_mixhprsel_mux),
 
-	SND_SOC_DAPM_PGA_E("HP Left Out", M98090_REG_OUTPUT_ENABLE,
-		M98090_HPLEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
-	SND_SOC_DAPM_PGA_E("HP Right Out", M98090_REG_OUTPUT_ENABLE,
-		M98090_HPREN_SHIFT, 0, NULL, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
-
-	SND_SOC_DAPM_PGA_E("SPK Left Out", M98090_REG_OUTPUT_ENABLE,
-		M98090_SPLEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
-	SND_SOC_DAPM_PGA_E("SPK Right Out", M98090_REG_OUTPUT_ENABLE,
-		M98090_SPREN_SHIFT, 0, NULL, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
-
-	SND_SOC_DAPM_PGA_E("RCV Left Out", M98090_REG_OUTPUT_ENABLE,
-		M98090_RCVLEN_SHIFT, 0, NULL, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
-	SND_SOC_DAPM_PGA_E("RCV Right Out", M98090_REG_OUTPUT_ENABLE,
-		M98090_RCVREN_SHIFT, 0, NULL, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+	SND_SOC_DAPM_PGA("HP Left Out", M98090_REG_OUTPUT_ENABLE,
+		M98090_HPLEN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("HP Right Out", M98090_REG_OUTPUT_ENABLE,
+		M98090_HPREN_SHIFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_PGA("SPK Left Out", M98090_REG_OUTPUT_ENABLE,
+		M98090_SPLEN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("SPK Right Out", M98090_REG_OUTPUT_ENABLE,
+		M98090_SPREN_SHIFT, 0, NULL, 0),
+
+	SND_SOC_DAPM_PGA("RCV Left Out", M98090_REG_OUTPUT_ENABLE,
+		M98090_RCVLEN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("RCV Right Out", M98090_REG_OUTPUT_ENABLE,
+		M98090_RCVREN_SHIFT, 0, NULL, 0),
 
 	SND_SOC_DAPM_OUTPUT("HPL"),
 	SND_SOC_DAPM_OUTPUT("HPR"),
@@ -1395,11 +1228,9 @@ static const struct snd_soc_dapm_widget max98091_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("DMIC4"),
 
 	SND_SOC_DAPM_SUPPLY("DMIC3_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
-		M98090_DIGMIC3_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		 M98090_DIGMIC3_SHIFT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("DMIC4_ENA", M98090_REG_DIGITAL_MIC_ENABLE,
-		M98090_DIGMIC4_SHIFT, 0, max98090_dapm_event,
-		SND_SOC_DAPM_PRE_POST_PMU | SND_SOC_DAPM_PRE_POST_PMD),
+		 M98090_DIGMIC4_SHIFT, 0, NULL, 0),
 };
 
 static const struct snd_soc_dapm_route max98090_dapm_routes[] = {
@@ -1670,11 +1501,6 @@ static void max98090_configure_bclk(struct snd_soc_component *component)
 		return;
 	}
 
-	/*
-	 * Master mode: no need to save and restore SHDN for the following
-	 * sensitive registers.
-	 */
-
 	/* Check for supported PCLK to LRCLK ratios */
 	for (i = 0; i < ARRAY_SIZE(pclk_rates); i++) {
 		if ((pclk_rates[i] == max98090->sysclk) &&
@@ -1761,14 +1587,12 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 		case SND_SOC_DAIFMT_CBS_CFS:
 			/* Set to slave mode PLL - MAS mode off */
-			max98090_shdn_save(max98090);
 			snd_soc_component_write(component,
 				M98090_REG_CLOCK_RATIO_NI_MSB, 0x00);
 			snd_soc_component_write(component,
 				M98090_REG_CLOCK_RATIO_NI_LSB, 0x00);
 			snd_soc_component_update_bits(component, M98090_REG_CLOCK_MODE,
 				M98090_USE_M1_MASK, 0);
-			max98090_shdn_restore(max98090);
 			max98090->master = false;
 			break;
 		case SND_SOC_DAIFMT_CBM_CFM:
@@ -1794,9 +1618,7 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 			dev_err(component->dev, "DAI clock mode unsupported");
 			return -EINVAL;
 		}
-		max98090_shdn_save(max98090);
 		snd_soc_component_write(component, M98090_REG_MASTER_MODE, regval);
-		max98090_shdn_restore(max98090);
 
 		regval = 0;
 		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -1841,10 +1663,8 @@ static int max98090_dai_set_fmt(struct snd_soc_dai *codec_dai,
 		if (max98090->tdm_slots > 1)
 			regval ^= M98090_BCI_MASK;
 
-		max98090_shdn_save(max98090);
 		snd_soc_component_write(component,
 			M98090_REG_INTERFACE_FORMAT, regval);
-		max98090_shdn_restore(max98090);
 	}
 
 	return 0;
@@ -1856,7 +1676,6 @@ static int max98090_set_tdm_slot(struct snd_soc_dai *codec_dai,
 	struct snd_soc_component *component = codec_dai->component;
 	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
 	struct max98090_cdata *cdata;
-
 	cdata = &max98090->dai[0];
 
 	if (slots < 0 || slots > 4)
@@ -1866,7 +1685,6 @@ static int max98090_set_tdm_slot(struct snd_soc_dai *codec_dai,
 	max98090->tdm_width = slot_width;
 
 	if (max98090->tdm_slots > 1) {
-		max98090_shdn_save(max98090);
 		/* SLOTL SLOTR SLOTDLY */
 		snd_soc_component_write(component, M98090_REG_TDM_FORMAT,
 			0 << M98090_TDM_SLOTL_SHIFT |
@@ -1877,7 +1695,6 @@ static int max98090_set_tdm_slot(struct snd_soc_dai *codec_dai,
 		snd_soc_component_update_bits(component, M98090_REG_TDM_CONTROL,
 			M98090_TDM_MASK,
 			M98090_TDM_MASK);
-		max98090_shdn_restore(max98090);
 	}
 
 	/*
@@ -2077,7 +1894,6 @@ static int max98090_configure_dmic(struct max98090_priv *max98090,
 	dmic_freq = dmic_table[pclk_index].settings[micclk_index].freq;
 	dmic_comp = dmic_table[pclk_index].settings[micclk_index].comp[i];
 
-	max98090_shdn_save(max98090);
 	regmap_update_bits(max98090->regmap, M98090_REG_DIGITAL_MIC_ENABLE,
 			   M98090_MICCLK_MASK,
 			   micclk_index << M98090_MICCLK_SHIFT);
@@ -2086,7 +1902,6 @@ static int max98090_configure_dmic(struct max98090_priv *max98090,
 			   M98090_DMIC_COMP_MASK | M98090_DMIC_FREQ_MASK,
 			   dmic_comp << M98090_DMIC_COMP_SHIFT |
 			   dmic_freq << M98090_DMIC_FREQ_SHIFT);
-	max98090_shdn_restore(max98090);
 
 	return 0;
 }
@@ -2123,10 +1938,8 @@ static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
 
 	switch (params_width(params)) {
 	case 16:
-		max98090_shdn_save(max98090);
 		snd_soc_component_update_bits(component, M98090_REG_INTERFACE_FORMAT,
 			M98090_WS_MASK, 0);
-		max98090_shdn_restore(max98090);
 		break;
 	default:
 		return -EINVAL;
@@ -2137,7 +1950,6 @@ static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
 
 	cdata->rate = max98090->lrclk;
 
-	max98090_shdn_save(max98090);
 	/* Update filter mode */
 	if (max98090->lrclk < 24000)
 		snd_soc_component_update_bits(component, M98090_REG_FILTER_CONFIG,
@@ -2153,7 +1965,6 @@ static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
 	else
 		snd_soc_component_update_bits(component, M98090_REG_FILTER_CONFIG,
 			M98090_DHF_MASK, M98090_DHF_MASK);
-	max98090_shdn_restore(max98090);
 
 	max98090_configure_dmic(max98090, max98090->dmic_freq, max98090->pclk,
 				max98090->lrclk);
@@ -2184,7 +1995,6 @@ static int max98090_dai_set_sysclk(struct snd_soc_dai *dai,
 	 *		 0x02 (when master clk is 20MHz to 40MHz)..
 	 *		 0x03 (when master clk is 40MHz to 60MHz)..
 	 */
-	max98090_shdn_save(max98090);
 	if ((freq >= 10000000) && (freq <= 20000000)) {
 		snd_soc_component_write(component, M98090_REG_SYSTEM_CLOCK,
 			M98090_PSCLK_DIV1);
@@ -2199,10 +2009,8 @@ static int max98090_dai_set_sysclk(struct snd_soc_dai *dai,
 		max98090->pclk = freq >> 2;
 	} else {
 		dev_err(component->dev, "Invalid master clock frequency\n");
-		max98090_shdn_restore(max98090);
 		return -EINVAL;
 	}
-	max98090_shdn_restore(max98090);
 
 	max98090->sysclk = freq;
 
@@ -2314,12 +2122,10 @@ static void max98090_pll_work(struct max98090_priv *max98090)
 	 */
 
 	/* Toggle shutdown OFF then ON */
-	mutex_lock(&component->card->dapm_mutex);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, 0);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
-	mutex_unlock(&component->card->dapm_mutex);
 
 	for (i = 0; i < 10; ++i) {
 		/* Give PLL time to lock */
@@ -2642,12 +2448,7 @@ static int max98090_probe(struct snd_soc_component *component)
 	 */
 	snd_soc_component_read32(component, M98090_REG_DEVICE_STATUS);
 
-	/*
-	 * SHDN should be 0 at the point, no need to save/restore for the
-	 * following registers.
-	 *
-	 * High Performance is default
-	 */
+	/* High Performance is default */
 	snd_soc_component_update_bits(component, M98090_REG_DAC_CONTROL,
 		M98090_DACHP_MASK,
 		1 << M98090_DACHP_SHIFT);
@@ -2658,12 +2459,7 @@ static int max98090_probe(struct snd_soc_component *component)
 		M98090_ADCHP_MASK,
 		1 << M98090_ADCHP_SHIFT);
 
-	/*
-	 * SHDN should be 0 at the point, no need to save/restore for the
-	 * following registers.
-	 *
-	 * Turn on VCM bandgap reference
-	 */
+	/* Turn on VCM bandgap reference */
 	snd_soc_component_write(component, M98090_REG_BIAS_CONTROL,
 		M98090_VCM_MODE_MASK);
 
@@ -2695,9 +2491,25 @@ static void max98090_remove(struct snd_soc_component *component)
 	max98090->component = NULL;
 }
 
+static void max98090_seq_notifier(struct snd_soc_component *component,
+	enum snd_soc_dapm_type event, int subseq)
+{
+	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
+
+	if (max98090->shdn_pending) {
+		snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
+				M98090_SHDNN_MASK, 0);
+		msleep(40);
+		snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
+				M98090_SHDNN_MASK, M98090_SHDNN_MASK);
+		max98090->shdn_pending = false;
+	}
+}
+
 static const struct snd_soc_component_driver soc_component_dev_max98090 = {
 	.probe			= max98090_probe,
 	.remove			= max98090_remove,
+	.seq_notifier		= max98090_seq_notifier,
 	.set_bias_level		= max98090_set_bias_level,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
diff --git a/sound/soc/codecs/max98090.h b/sound/soc/codecs/max98090.h
index 0a31708b7df7..a197114b0dad 100644
--- a/sound/soc/codecs/max98090.h
+++ b/sound/soc/codecs/max98090.h
@@ -1539,8 +1539,7 @@ struct max98090_priv {
 	unsigned int pa2en;
 	unsigned int sidetone;
 	bool master;
-	int saved_count;
-	int saved_shdn;
+	bool shdn_pending;
 };
 
 int max98090_mic_detect(struct snd_soc_component *component,
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

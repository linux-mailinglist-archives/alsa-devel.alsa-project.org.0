Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C42D140E6A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 16:57:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C933C17FB;
	Fri, 17 Jan 2020 16:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C933C17FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579276624;
	bh=hFDavGMfMVIVcWfg9xHERqg6TqF8DW4XRJgx/AkCmGQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=USZ+NlBRJGKK0N31HoWWfVxIsB5msJEnrzeK4H+2z3cX4rheJVwm/d0R9KrHyzAZ+
	 s1cmpM4cQ+bgCnKBQ2tr3zFZ5m5BpxYWDB6Hwr8kcpOIsjQCMCJHwVedrgCW/fjJYB
	 F0OseoS1wWccXtL2FB12MwxNlprYulS9WSHKchgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA2A1F80328;
	Fri, 17 Jan 2020 16:46:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5714F801EB; Fri, 17 Jan 2020 16:44:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCA37F80273
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 16:44:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA37F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CadoOQjo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=CXLAXq5OnNkw2oK7sCOLUl2OUZIsuk5m0e5961P04rU=; b=CadoOQjovv6g
 uOHFZIOmX+1bcCTkFy4P/75wDF6crePxwTgPgd4ykp7G49TsYqjIitd3UGbLZIzC8FDRag302TJhk
 hfgBiG/LeUZg1x8wkuq8upzKrfem5Wy5UpTDGE2+85bJtaU3xCciXm4kaB4nWWqBgP426umsThusM
 na9SI=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTn9-0006ru-Mo; Fri, 17 Jan 2020 15:44:11 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5A029D02A2A; Fri, 17 Jan 2020 15:44:11 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20200114181229.42302-1-stephan@gerhold.net>
Message-Id: <applied-20200114181229.42302-1-stephan@gerhold.net>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:11 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Nikita Travkin <nikitos.tr@gmail.com>
Subject: [alsa-devel] Applied "ASoC: msm8916-wcd-analog: Simplify MIC BIAS
	Internal" to the asoc tree
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

The patch

   ASoC: msm8916-wcd-analog: Simplify MIC BIAS Internal

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 65fe457e7bafcbb844c66e8c54a414f090967eaa Mon Sep 17 00:00:00 2001
From: Stephan Gerhold <stephan@gerhold.net>
Date: Tue, 14 Jan 2020 19:12:28 +0100
Subject: [PATCH] ASoC: msm8916-wcd-analog: Simplify MIC BIAS Internal

At the moment, MIC BIAS Internal* and MIC BIAS External* both reference
the same register, and have a part of their initialization sequence
duplicated.

For example, the sequence for enabling MIC BIAS Internal1 is:
  I1. Enable MIC_BIAS1 supply (MICB_EN bit in CDC_A_MICB_1_EN)
  I2. Enable internal RBIAS (TX1_INT_RBIAS_EN bit in CDC_A_MICB_1_INT_RBIAS)

The sequence for enabling MIC BIAS External1 is:
  E1. Enable MIC_BIAS1 supply (MICB_EN bit in CDC_A_MICB_1_EN)
  (E2. Ideally, make sure internal RBIAS is disabled. However, this should
   not happen in practice because DAPM will disable unused supplies...)

Right now we have:
  SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_EN, 7, 0, ...) // I1
  SND_SOC_DAPM_SUPPLY("MIC BIAS External1", CDC_A_MICB_1_EN, 7, 0, ...) // E1
and I2 is done in the PM event handler (pm8916_wcd_analog_enable_micbias_int1).

We can simplify this by defining a common DAPM supply for I1/E1 ("MIC_BIAS1"),
and one DAPM supply for I2 ("MIC BIAS Internal1"). Additional DAPM routes
ensure that we also enable the MIC_BIAS1 supply for the internal and external
pull up resistor.

Another advantage of this is that we now disable the internal RBIAS
when it is not needed. This makes it much easier to add support for
MIC BIAS Internal3 as a next step.

Tested-by: Nikita Travkin <nikitos.tr@gmail.com> # longcheer-l8150
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20200114181229.42302-1-stephan@gerhold.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 112 ++++++++++----------------
 1 file changed, 42 insertions(+), 70 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 1f7964beb20c..d6d727f5bae5 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -374,9 +374,8 @@ static void pm8916_wcd_analog_micbias_enable(struct snd_soc_component *component
 
 }
 
-static int pm8916_wcd_analog_enable_micbias_ext(struct snd_soc_component
-						 *component, int event,
-						 int reg, unsigned int cap_mode)
+static int pm8916_wcd_analog_enable_micbias(struct snd_soc_component *component,
+					    int event, unsigned int cap_mode)
 {
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -389,72 +388,44 @@ static int pm8916_wcd_analog_enable_micbias_ext(struct snd_soc_component
 	return 0;
 }
 
-static int pm8916_wcd_analog_enable_micbias_int(struct snd_soc_component
-						 *component, int event,
-						 int reg, u32 cap_mode)
+static int pm8916_wcd_analog_enable_micbias_int(struct snd_soc_dapm_widget *w,
+						struct snd_kcontrol *kcontrol,
+						int event)
 {
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		snd_soc_component_update_bits(component, reg, MICB_1_EN_PULL_DOWN_EN_MASK, 0);
 		snd_soc_component_update_bits(component, CDC_A_MICB_1_EN,
 				    MICB_1_EN_OPA_STG2_TAIL_CURR_MASK,
 				    MICB_1_EN_OPA_STG2_TAIL_CURR_1_60UA);
-
-		break;
-	case SND_SOC_DAPM_POST_PMU:
-		pm8916_wcd_analog_micbias_enable(component);
-		snd_soc_component_update_bits(component, CDC_A_MICB_1_EN,
-				    MICB_1_EN_BYP_CAP_MASK, cap_mode);
 		break;
 	}
 
 	return 0;
 }
 
-static int pm8916_wcd_analog_enable_micbias_ext1(struct
-						  snd_soc_dapm_widget
-						  *w, struct snd_kcontrol
-						  *kcontrol, int event)
+static int pm8916_wcd_analog_enable_micbias1(struct snd_soc_dapm_widget *w,
+					     struct snd_kcontrol *kcontrol,
+					     int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
 
-	return pm8916_wcd_analog_enable_micbias_ext(component, event, w->reg,
-						     wcd->micbias1_cap_mode);
+	return pm8916_wcd_analog_enable_micbias(component, event,
+						wcd->micbias1_cap_mode);
 }
 
-static int pm8916_wcd_analog_enable_micbias_ext2(struct
-						  snd_soc_dapm_widget
-						  *w, struct snd_kcontrol
-						  *kcontrol, int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
-
-	return pm8916_wcd_analog_enable_micbias_ext(component, event, w->reg,
-						     wcd->micbias2_cap_mode);
-
-}
-
-static int pm8916_wcd_analog_enable_micbias_int1(struct
-						  snd_soc_dapm_widget
-						  *w, struct snd_kcontrol
-						  *kcontrol, int event)
+static int pm8916_wcd_analog_enable_micbias2(struct snd_soc_dapm_widget *w,
+					     struct snd_kcontrol *kcontrol,
+					     int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct pm8916_wcd_analog_priv *wcd = snd_soc_component_get_drvdata(component);
 
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
-				    MICB_1_INT_TX1_INT_RBIAS_EN_MASK,
-				    MICB_1_INT_TX1_INT_RBIAS_EN_ENABLE);
-		break;
-	}
+	return pm8916_wcd_analog_enable_micbias(component, event,
+						wcd->micbias2_cap_mode);
 
-	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
-						     wcd->micbias1_cap_mode);
 }
 
 static int pm8916_mbhc_configure_bias(struct pm8916_wcd_analog_priv *priv,
@@ -564,9 +535,8 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		snd_soc_component_update_bits(component, CDC_A_MICB_1_INT_RBIAS,
-				    MICB_1_INT_TX2_INT_RBIAS_EN_MASK,
-				    MICB_1_INT_TX2_INT_RBIAS_EN_ENABLE);
+		snd_soc_component_update_bits(component, CDC_A_MICB_2_EN,
+					      CDC_A_MICB_2_PULL_DOWN_EN_MASK, 0);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
 		pm8916_mbhc_configure_bias(wcd, true);
@@ -576,8 +546,7 @@ static int pm8916_wcd_analog_enable_micbias_int2(struct
 		break;
 	}
 
-	return pm8916_wcd_analog_enable_micbias_int(component, event, w->reg,
-						     wcd->micbias2_cap_mode);
+	return pm8916_wcd_analog_enable_micbias_int(w, kcontrol, event);
 }
 
 static int pm8916_wcd_analog_enable_adc(struct snd_soc_dapm_widget *w,
@@ -878,14 +847,15 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
 	{"SPK PA", NULL, "SPK DAC"},
 	{"SPK DAC", "Switch", "PDM_RX3"},
 
-	{"MIC BIAS Internal1", NULL, "INT_LDO_H"},
-	{"MIC BIAS Internal2", NULL, "INT_LDO_H"},
-	{"MIC BIAS External1", NULL, "INT_LDO_H"},
-	{"MIC BIAS External2", NULL, "INT_LDO_H"},
-	{"MIC BIAS Internal1", NULL, "vdd-micbias"},
-	{"MIC BIAS Internal2", NULL, "vdd-micbias"},
-	{"MIC BIAS External1", NULL, "vdd-micbias"},
-	{"MIC BIAS External2", NULL, "vdd-micbias"},
+	{"MIC_BIAS1", NULL, "INT_LDO_H"},
+	{"MIC_BIAS2", NULL, "INT_LDO_H"},
+	{"MIC_BIAS1", NULL, "vdd-micbias"},
+	{"MIC_BIAS2", NULL, "vdd-micbias"},
+
+	{"MIC BIAS External1", NULL, "MIC_BIAS1"},
+	{"MIC BIAS Internal1", NULL, "MIC_BIAS1"},
+	{"MIC BIAS External2", NULL, "MIC_BIAS2"},
+	{"MIC BIAS Internal2", NULL, "MIC_BIAS2"},
 };
 
 static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
@@ -937,22 +907,24 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("RX_BIAS", CDC_A_RX_COM_BIAS_DAC, 7, 0, NULL, 0),
 
 	/* TX */
-	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_EN, 7, 0,
-			    pm8916_wcd_analog_enable_micbias_int1,
-			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-			    SND_SOC_DAPM_POST_PMD),
-	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal2", CDC_A_MICB_2_EN, 7, 0,
+	SND_SOC_DAPM_SUPPLY("MIC_BIAS1", CDC_A_MICB_1_EN, 7, 0,
+			    pm8916_wcd_analog_enable_micbias1,
+			    SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_SUPPLY("MIC_BIAS2", CDC_A_MICB_2_EN, 7, 0,
+			    pm8916_wcd_analog_enable_micbias2,
+			    SND_SOC_DAPM_POST_PMU),
+
+	SND_SOC_DAPM_SUPPLY("MIC BIAS External1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS External2", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal1", CDC_A_MICB_1_INT_RBIAS, 7, 0,
+			    pm8916_wcd_analog_enable_micbias_int,
+			    SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal2", CDC_A_MICB_1_INT_RBIAS, 4, 0,
 			    pm8916_wcd_analog_enable_micbias_int2,
 			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 			    SND_SOC_DAPM_POST_PMD),
 
-	SND_SOC_DAPM_SUPPLY("MIC BIAS External1", CDC_A_MICB_1_EN, 7, 0,
-			    pm8916_wcd_analog_enable_micbias_ext1,
-			    SND_SOC_DAPM_POST_PMU),
-	SND_SOC_DAPM_SUPPLY("MIC BIAS External2", CDC_A_MICB_2_EN, 7, 0,
-			    pm8916_wcd_analog_enable_micbias_ext2,
-			    SND_SOC_DAPM_POST_PMU),
-
 	SND_SOC_DAPM_ADC_E("ADC1", NULL, CDC_A_TX_1_EN, 7, 0,
 			   pm8916_wcd_analog_enable_adc,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

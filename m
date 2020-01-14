Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A313B1DA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 19:16:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD04517FC;
	Tue, 14 Jan 2020 19:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD04517FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579025784;
	bh=mwfAGjgdustPVn8SA1Fz1+uFb8UNB5/zrhowwSZfe90=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tf5+ZiPpCALlhfL4ULBSkCNFbCTWegKLw6J5nNGTM2HbQ1rnZJ5KxtObyjRAVeBjf
	 IOzDVvnt/wjxh3KqhFAGkDDHXKEwO55XmpXLPIUaP117Av45Pixm1EIeCXRfG0Cghp
	 LuUvRNbVo+YZ6ykgxkW4FRoZStmLzRSM/VT5kzAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 503FAF80171;
	Tue, 14 Jan 2020 19:14:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40AF0F8016F; Tue, 14 Jan 2020 19:14:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D34E5F800E9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 19:14:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D34E5F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="PdNXUSTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579025670;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=omk0uQu6FFF+KejCdrzQsCw6t5K4pclplBbRGHjX3Es=;
 b=PdNXUSTyaqyAyvltsZO1OjuY7ZTJvEDpNpCgmAnoK2Arj0L73u3do3JdFvovrWBn+l
 yPieE3vFhM5KQKRaIfjF4gVwWvZx5XSCcleJL1drQHq7iqDfrIiJbOH3XP7/QC7p3kci
 CDCVH0kyrTiW6+1pevxi7MW6GOmrFrKGsiyAcjvm5Pyqf9SVjnH+5rlY2pMW/6OANwKP
 WpqjuSmFTqzviyBO/uskVWmsvLREwlAh3mkEYuNdnAuKZafjSebviGK8+ekhVdKZawLG
 DMxv7nlj7dtfDKEgSM34Hn24pbWItG9MQoq/qNmKnRB88xWsKhxMxH9lZ5hIL07QmkZj
 Spsg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7IOGU5qzCB3a93viaVr"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0EIEQXnH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Jan 2020 19:14:26 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 14 Jan 2020 19:12:28 +0100
Message-Id: <20200114181229.42302-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Nikita Travkin <nikitos.tr@gmail.com>
Subject: [alsa-devel] [PATCH v2 1/2] ASoC: msm8916-wcd-analog: Simplify MIC
	BIAS Internal
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
---
v1: https://lore.kernel.org/alsa-devel/20200111164006.43074-4-stephan@gerhold.net/
Changes in v2:
  - Use an extra DAPM supply for MIC_BIASX that is referenced by
    MIC BIAS InternalX and MIC BIAS ExternalX, instead of combining it with
    MIC BIAS ExternalX
  - Clarify commit message
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
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

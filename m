Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9772704C5
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 21:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4512F1688;
	Fri, 18 Sep 2020 21:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4512F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600456319;
	bh=dCMxhyjIazoxgfgudzTcwFwnLsYnoRixzO9ePHwMmOk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TJ9AfsQrUjADay7/iOcoKUihluQrOv0PdixCW1Ub2EE+uzFKBOb6c+uSOR4F1xcfC
	 +HJlgHQuRXmDzZ34Jr7oUO31QgXtcrEe6QZ8Tx3rCTq5i2lq1hk6Sdy022AW8rk7e1
	 RGNzUhPUXHoZACqmEI9cDiSkqFs63v00HHFj/jwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE61F80306;
	Fri, 18 Sep 2020 21:06:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67BCBF802F9; Fri, 18 Sep 2020 21:06:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05715F802D2
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 21:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05715F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PgGOQgOh"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ6NEK084859;
 Fri, 18 Sep 2020 14:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600455983;
 bh=8mQpP6IX4LGGBdBDS2eVQw2UxN9HaSNtA5kwZ8zz7BA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=PgGOQgOhVOkjgCBsBt3OqfvrIjWJVck+A1s/Tm1mo0kJAsMawHeu/NhIBxTPagS3C
 9D1443gaOl5G54JgwNa9Zt7vVRelfvkwGf1oclrI9vjHlTfoNFkHa9YCpnytZWU2NF
 vg9Eh+imUtpclfeJNQZxRFRMepXgrUEbCA9WZEnc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IJ6Nn5079483
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2020 14:06:23 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 14:06:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 14:06:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IJ6LpH083832;
 Fri, 18 Sep 2020 14:06:23 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 8/9] ASoC: tas2770: Fix the spacing and new lines
Date: Fri, 18 Sep 2020 14:05:47 -0500
Message-ID: <20200918190548.12598-8-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918190548.12598-1-dmurphy@ti.com>
References: <20200918190548.12598-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Fix up the spacing for argument alignment and add new lines to separate
code. Eliminate unneccessary goto statements when the error code could
just be returned.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2770.c | 300 ++++++++++++++++---------------------
 1 file changed, 131 insertions(+), 169 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 3226c6d4493e..b17cf0a7f785 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -39,6 +39,7 @@ static void tas2770_reset(struct tas2770_priv *tas2770)
 		msleep(20);
 		gpiod_set_value_cansleep(tas2770->reset_gpio, 1);
 	}
+
 	snd_soc_component_write(tas2770->component, TAS2770_SW_RST,
 		TAS2770_RST);
 }
@@ -51,27 +52,24 @@ static int tas2770_set_bias_level(struct snd_soc_component *component,
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
-		snd_soc_component_update_bits(component,
-			TAS2770_PWR_CTRL,
-			TAS2770_PWR_CTRL_MASK,
-			TAS2770_PWR_CTRL_ACTIVE);
+		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+					      TAS2770_PWR_CTRL_MASK,
+					      TAS2770_PWR_CTRL_ACTIVE);
 		break;
 	case SND_SOC_BIAS_STANDBY:
 	case SND_SOC_BIAS_PREPARE:
-		snd_soc_component_update_bits(component,
-			TAS2770_PWR_CTRL,
-			TAS2770_PWR_CTRL_MASK, TAS2770_PWR_CTRL_MUTE);
+		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+					      TAS2770_PWR_CTRL_MASK,
+					      TAS2770_PWR_CTRL_MUTE);
 		break;
 	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component,
-			TAS2770_PWR_CTRL,
-			TAS2770_PWR_CTRL_MASK,
-			TAS2770_PWR_CTRL_SHUTDOWN);
+		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+					      TAS2770_PWR_CTRL_MASK,
+					      TAS2770_PWR_CTRL_SHUTDOWN);
 		break;
 
 	default:
-		dev_err(tas2770->dev,
-				"wrong power level setting %d\n", level);
+		dev_err(tas2770->dev, "wrong power level setting %d\n", level);
 		return -EINVAL;
 	}
 
@@ -83,11 +81,9 @@ static int tas2770_codec_suspend(struct snd_soc_component *component)
 {
 	int ret;
 
-	ret = snd_soc_component_update_bits(component,
-		TAS2770_PWR_CTRL,
-		TAS2770_PWR_CTRL_MASK,
-		TAS2770_PWR_CTRL_SHUTDOWN);
-
+	ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+					    TAS2770_PWR_CTRL_MASK,
+					    TAS2770_PWR_CTRL_SHUTDOWN);
 	if (ret < 0)
 		return ret;
 
@@ -98,11 +94,9 @@ static int tas2770_codec_resume(struct snd_soc_component *component)
 {
 	int ret;
 
-	ret = snd_soc_component_update_bits(component,
-		TAS2770_PWR_CTRL,
-		TAS2770_PWR_CTRL_MASK,
-		TAS2770_PWR_CTRL_ACTIVE);
-
+	ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+					    TAS2770_PWR_CTRL_MASK,
+					    TAS2770_PWR_CTRL_ACTIVE);
 	if (ret < 0)
 		return ret;
 
@@ -135,16 +129,14 @@ static int tas2770_dac_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_PWR_CTRL,
-			TAS2770_PWR_CTRL_MASK,
-			TAS2770_PWR_CTRL_MUTE);
+		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_MUTE);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_PWR_CTRL,
-			TAS2770_PWR_CTRL_MASK,
-			TAS2770_PWR_CTRL_SHUTDOWN);
+		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_SHUTDOWN);
 		break;
 	default:
 		dev_err(tas2770->dev, "Not supported evevt\n");
@@ -164,14 +156,11 @@ static const struct snd_kcontrol_new vsense_switch =
 
 static const struct snd_soc_dapm_widget tas2770_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0,
-				&tas2770_asi1_mux),
-	SND_SOC_DAPM_SWITCH("ISENSE", TAS2770_PWR_CTRL, 3, 1,
-			&isense_switch),
-	SND_SOC_DAPM_SWITCH("VSENSE", TAS2770_PWR_CTRL, 2, 1,
-			&vsense_switch),
+	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2770_asi1_mux),
+	SND_SOC_DAPM_SWITCH("ISENSE", TAS2770_PWR_CTRL, 3, 1, &isense_switch),
+	SND_SOC_DAPM_SWITCH("VSENSE", TAS2770_PWR_CTRL, 2, 1, &vsense_switch),
 	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2770_dac_event,
-	SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_OUTPUT("OUT"),
 	SND_SOC_DAPM_SIGGEN("VMON"),
 	SND_SOC_DAPM_SIGGEN("IMON")
@@ -194,15 +183,13 @@ static int tas2770_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 
 	if (mute)
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_PWR_CTRL,
-			TAS2770_PWR_CTRL_MASK,
-			TAS2770_PWR_CTRL_MUTE);
+		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_MUTE);
 	else
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_PWR_CTRL,
-			TAS2770_PWR_CTRL_MASK,
-			TAS2770_PWR_CTRL_ACTIVE);
+		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_ACTIVE);
 
 	if (ret < 0)
 		return ret;
@@ -217,24 +204,21 @@ static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
 
 	switch (bitwidth) {
 	case SNDRV_PCM_FORMAT_S16_LE:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG2,
-			TAS2770_TDM_CFG_REG2_RXW_MASK,
-			TAS2770_TDM_CFG_REG2_RXW_16BITS);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG2,
+						    TAS2770_TDM_CFG_REG2_RXW_MASK,
+						    TAS2770_TDM_CFG_REG2_RXW_16BITS);
 		tas2770->v_sense_slot = tas2770->i_sense_slot + 2;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG2,
-			TAS2770_TDM_CFG_REG2_RXW_MASK,
-			TAS2770_TDM_CFG_REG2_RXW_24BITS);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG2,
+						    TAS2770_TDM_CFG_REG2_RXW_MASK,
+						    TAS2770_TDM_CFG_REG2_RXW_24BITS);
 		tas2770->v_sense_slot = tas2770->i_sense_slot + 4;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG2,
-			TAS2770_TDM_CFG_REG2_RXW_MASK,
-			TAS2770_TDM_CFG_REG2_RXW_32BITS);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG2,
+						    TAS2770_TDM_CFG_REG2_RXW_MASK,
+						    TAS2770_TDM_CFG_REG2_RXW_32BITS);
 		tas2770->v_sense_slot = tas2770->i_sense_slot + 4;
 		break;
 
@@ -247,21 +231,19 @@ static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
 
 	tas2770->channel_size = bitwidth;
 
-	ret = snd_soc_component_update_bits(component,
-		TAS2770_TDM_CFG_REG5,
-		TAS2770_TDM_CFG_REG5_VSNS_MASK |
-		TAS2770_TDM_CFG_REG5_50_MASK,
-		TAS2770_TDM_CFG_REG5_VSNS_ENABLE |
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG5,
+					    TAS2770_TDM_CFG_REG5_VSNS_MASK |
+					    TAS2770_TDM_CFG_REG5_50_MASK,
+					    TAS2770_TDM_CFG_REG5_VSNS_ENABLE |
 		tas2770->v_sense_slot);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component,
-		TAS2770_TDM_CFG_REG6,
-		TAS2770_TDM_CFG_REG6_ISNS_MASK |
-		TAS2770_TDM_CFG_REG6_50_MASK,
-		TAS2770_TDM_CFG_REG6_ISNS_ENABLE |
-		tas2770->i_sense_slot);
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG6,
+					    TAS2770_TDM_CFG_REG6_ISNS_MASK |
+					    TAS2770_TDM_CFG_REG6_50_MASK,
+					    TAS2770_TDM_CFG_REG6_ISNS_ENABLE |
+					    tas2770->i_sense_slot);
 	if (ret < 0)
 		return ret;
 
@@ -275,82 +257,70 @@ static int tas2770_set_samplerate(struct tas2770_priv *tas2770, int samplerate)
 
 	switch (samplerate) {
 	case 48000:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_SMP_MASK,
-			TAS2770_TDM_CFG_REG0_SMP_48KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_SMP_MASK,
+						    TAS2770_TDM_CFG_REG0_SMP_48KHZ);
 		if (ret < 0)
 			return ret;
 
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_31_MASK,
-			TAS2770_TDM_CFG_REG0_31_44_1_48KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_31_MASK,
+						    TAS2770_TDM_CFG_REG0_31_44_1_48KHZ);
 		break;
 	case 44100:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_SMP_MASK,
-			TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_SMP_MASK,
+						    TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
 		if (ret < 0)
 			return ret;
 
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_31_MASK,
-			TAS2770_TDM_CFG_REG0_31_44_1_48KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_31_MASK,
+						    TAS2770_TDM_CFG_REG0_31_44_1_48KHZ);
 		break;
 	case 96000:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_SMP_MASK,
-			TAS2770_TDM_CFG_REG0_SMP_48KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_SMP_MASK,
+						    TAS2770_TDM_CFG_REG0_SMP_48KHZ);
 		if (ret < 0)
 			return ret;
 
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_31_MASK,
-			TAS2770_TDM_CFG_REG0_31_88_2_96KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_31_MASK,
+						    TAS2770_TDM_CFG_REG0_31_88_2_96KHZ);
 		break;
 	case 88200:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_SMP_MASK,
-			TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_SMP_MASK,
+						    TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
 		if (ret < 0)
 			return ret;
 
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_31_MASK,
-			TAS2770_TDM_CFG_REG0_31_88_2_96KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_31_MASK,
+						    TAS2770_TDM_CFG_REG0_31_88_2_96KHZ);
 		break;
 	case 19200:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_SMP_MASK,
-			TAS2770_TDM_CFG_REG0_SMP_48KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_SMP_MASK,
+						    TAS2770_TDM_CFG_REG0_SMP_48KHZ);
 		if (ret < 0)
 			return ret;
 
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_31_MASK,
-			TAS2770_TDM_CFG_REG0_31_176_4_192KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_31_MASK,
+						    TAS2770_TDM_CFG_REG0_31_176_4_192KHZ);
 		break;
 	case 17640:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_SMP_MASK,
-			TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_SMP_MASK,
+						    TAS2770_TDM_CFG_REG0_SMP_44_1KHZ);
 		if (ret < 0)
 			return ret;
 
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG0,
-			TAS2770_TDM_CFG_REG0_31_MASK,
-			TAS2770_TDM_CFG_REG0_31_176_4_192KHZ);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG0,
+						    TAS2770_TDM_CFG_REG0_31_MASK,
+						    TAS2770_TDM_CFG_REG0_31_176_4_192KHZ);
 		break;
 	default:
 		ret = -EINVAL;
@@ -373,23 +343,19 @@ static int tas2770_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	ret = tas2770_set_bitwidth(tas2770, params_format(params));
-	if (ret < 0)
-		goto end;
-
-
-	ret = tas2770_set_samplerate(tas2770, params_rate(params));
+	if (ret)
+		return ret;
 
-end:
-	return ret;
+	return tas2770_set_samplerate(tas2770, params_rate(params));
 }
 
 static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
-	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
-	int ret;
 	struct snd_soc_component *component = dai->component;
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
+	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
+	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
@@ -412,8 +378,8 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG1,
-		TAS2770_TDM_CFG_REG1_RX_MASK,
-		asi_cfg_1);
+					    TAS2770_TDM_CFG_REG1_RX_MASK,
+					    asi_cfg_1);
 	if (ret < 0)
 		return ret;
 
@@ -437,8 +403,8 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG1,
-		TAS2770_TDM_CFG_REG1_MASK,
-	(tdm_rx_start_slot << TAS2770_TDM_CFG_REG1_51_SHIFT));
+					    TAS2770_TDM_CFG_REG1_MASK,
+					    (tdm_rx_start_slot << TAS2770_TDM_CFG_REG1_51_SHIFT));
 	if (ret < 0)
 		return ret;
 
@@ -464,6 +430,7 @@ static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	if (slots == 1) {
 		if (tx_mask != 1)
 			return -EINVAL;
+
 		left_slot = 0;
 		right_slot = 0;
 	} else {
@@ -481,43 +448,36 @@ static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
 		return -EINVAL;
 
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG3,
-		TAS2770_TDM_CFG_REG3_30_MASK,
-		(left_slot << TAS2770_TDM_CFG_REG3_30_SHIFT));
+					    TAS2770_TDM_CFG_REG3_30_MASK,
+					    (left_slot << TAS2770_TDM_CFG_REG3_30_SHIFT));
 	if (ret < 0)
 		return ret;
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG3,
-		TAS2770_TDM_CFG_REG3_RXS_MASK,
-	(right_slot << TAS2770_TDM_CFG_REG3_RXS_SHIFT));
+					    TAS2770_TDM_CFG_REG3_RXS_MASK,
+					    (right_slot << TAS2770_TDM_CFG_REG3_RXS_SHIFT));
 	if (ret < 0)
 		return ret;
 
 	switch (slot_width) {
 	case 16:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG2,
-			TAS2770_TDM_CFG_REG2_RXS_MASK,
-			TAS2770_TDM_CFG_REG2_RXS_16BITS);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG2,
+						    TAS2770_TDM_CFG_REG2_RXS_MASK,
+						    TAS2770_TDM_CFG_REG2_RXS_16BITS);
 		break;
-
 	case 24:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG2,
-			TAS2770_TDM_CFG_REG2_RXS_MASK,
-			TAS2770_TDM_CFG_REG2_RXS_24BITS);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG2,
+						    TAS2770_TDM_CFG_REG2_RXS_MASK,
+						    TAS2770_TDM_CFG_REG2_RXS_24BITS);
 		break;
-
 	case 32:
-		ret = snd_soc_component_update_bits(component,
-			TAS2770_TDM_CFG_REG2,
-			TAS2770_TDM_CFG_REG2_RXS_MASK,
-			TAS2770_TDM_CFG_REG2_RXS_32BITS);
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG2,
+						    TAS2770_TDM_CFG_REG2_RXS_MASK,
+						    TAS2770_TDM_CFG_REG2_RXS_32BITS);
 		break;
-
 	case 0:
 		/* Do not change slot width */
 		ret = 0;
 		break;
-
 	default:
 		ret = -EINVAL;
 	}
@@ -585,11 +545,9 @@ static DECLARE_TLV_DB_SCALE(tas2770_playback_volume, -12750, 50, 0);
 
 static const struct snd_kcontrol_new tas2770_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Playback Volume", TAS2770_PLAY_CFG_REG2,
-		0, TAS2770_PLAY_CFG_REG2_VMAX, 1,
-		tas2770_playback_volume),
-	SOC_SINGLE_TLV("Amp Gain Volume", TAS2770_PLAY_CFG_REG0,
-		0, 0x14, 0,
-		tas2770_digital_tlv),
+		       0, TAS2770_PLAY_CFG_REG2_VMAX, 1, tas2770_playback_volume),
+	SOC_SINGLE_TLV("Amp Gain Volume", TAS2770_PLAY_CFG_REG0, 0, 0x14, 0,
+		       tas2770_digital_tlv),
 };
 
 static const struct snd_soc_component_driver soc_component_driver_tas2770 = {
@@ -650,6 +608,7 @@ static bool tas2770_volatile(struct device *dev, unsigned int reg)
 	case TAS2770_TEMP_LSB:
 		return true;
 	}
+
 	return false;
 }
 
@@ -668,6 +627,7 @@ static bool tas2770_writeable(struct device *dev, unsigned int reg)
 	case TAS2770_REV_AND_GPID:
 		return false;
 	}
+
 	return true;
 }
 
@@ -701,26 +661,29 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 	int rc = 0;
 
 	rc = fwnode_property_read_u32(dev->fwnode, "ti,asi-format",
-					&tas2770->asi_format);
+				      &tas2770->asi_format);
 	if (rc) {
 		dev_info(tas2770->dev, "Property %s is missing setting default slot\n",
-			"ti,asi-format");
+			 "ti,asi-format");
+
 		tas2770->asi_format = 0;
 	}
 
 	rc = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
-			&tas2770->i_sense_slot);
+				      &tas2770->i_sense_slot);
 	if (rc) {
 		dev_info(tas2770->dev, "Property %s is missing setting default slot\n",
-			"ti,imon-slot-no");
+			 "ti,imon-slot-no");
+
 		tas2770->i_sense_slot = 0;
 	}
 
 	rc = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
-				&tas2770->v_sense_slot);
+				      &tas2770->v_sense_slot);
 	if (rc) {
 		dev_info(tas2770->dev, "Property %s is missing setting default slot\n",
-			"ti,vmon-slot-no");
+			 "ti,vmon-slot-no");
+
 		tas2770->v_sense_slot = 2;
 	}
 
@@ -733,22 +696,23 @@ static int tas2770_i2c_probe(struct i2c_client *client,
 	struct tas2770_priv *tas2770;
 	int result;
 
-	tas2770 = devm_kzalloc(&client->dev,
-		sizeof(struct tas2770_priv), GFP_KERNEL);
+	tas2770 = devm_kzalloc(&client->dev, sizeof(struct tas2770_priv),
+			       GFP_KERNEL);
 	if (!tas2770)
 		return -ENOMEM;
-	tas2770->dev = &client->dev;
 
+	tas2770->dev = &client->dev;
 	i2c_set_clientdata(client, tas2770);
 	dev_set_drvdata(&client->dev, tas2770);
+
 	tas2770->power_state = TAS2770_POWER_SHUTDOWN;
 
 	tas2770->regmap = devm_regmap_init_i2c(client, &tas2770_i2c_regmap);
 	if (IS_ERR(tas2770->regmap)) {
 		result = PTR_ERR(tas2770->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-					result);
-		goto end;
+			result);
+		return result;
 	}
 
 	if (client->dev.of_node) {
@@ -756,7 +720,7 @@ static int tas2770_i2c_probe(struct i2c_client *client,
 		if (result) {
 			dev_err(tas2770->dev, "%s: Failed to parse devicetree\n",
 				__func__);
-			goto end;
+			return result;
 		}
 	}
 
@@ -776,7 +740,6 @@ static int tas2770_i2c_probe(struct i2c_client *client,
 	if (result)
 		dev_err(tas2770->dev, "Register codec failed.\n");
 
-end:
 	return result;
 }
 
@@ -802,7 +765,6 @@ static struct i2c_driver tas2770_i2c_driver = {
 	.probe      = tas2770_i2c_probe,
 	.id_table   = tas2770_i2c_id,
 };
-
 module_i2c_driver(tas2770_i2c_driver);
 
 MODULE_AUTHOR("Shi Fu <shifu0704@thundersoft.com>");
-- 
2.28.0


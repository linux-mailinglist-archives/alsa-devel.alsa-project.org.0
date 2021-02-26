Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E1326434
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 15:41:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A3661681;
	Fri, 26 Feb 2021 15:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A3661681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614350467;
	bh=FCcvSds6l6v3Xo4NuE+dx281IlpEbh3JwdkiUxhf894=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gTrLtMKZX3/Y6t9uwzfMHy6xkBhtqWD01Qspeia/YPMxK7vzBKwRpiZYl/t6CC5AE
	 ZYJj1bONFGJk3KTlYYSh03qfZ3Pn1ZgM4BT3j6Xt0gJ8jwoyZvXwBX0U4KhHtKs21H
	 XtWOPDfW/UNZCnRLYoIZKvExfSwx14HwJtUbcyJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1032F802E0;
	Fri, 26 Feb 2021 15:38:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC5A3F8028D; Fri, 26 Feb 2021 15:38:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4296F8016C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 15:38:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4296F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FKJWsyNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614350313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4AWCZe0KOYt6EQ0PKQWdNvgl0pSN5ha45N+EAO7Hg8=;
 b=FKJWsyNoOtdSm/KyQRa8ezRZBk3rFte+kxJhDdt77n9L2hqf3fZGLwBP0skIOEhFyW3aXU
 zROw5f22dZ5IUmPZ18L7bB3mBA4yTp5c2yonPSCDVzMw8wTbyVVynaJbeFDSctVaei4yct
 8cLW5yf5KFwyxzPJAL02wP4bJqODAc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-Oe56Vo98PV-LkOarp46gjQ-1; Fri, 26 Feb 2021 09:38:29 -0500
X-MC-Unique: Oe56Vo98PV-LkOarp46gjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24A62107ACED;
 Fri, 26 Feb 2021 14:38:28 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C92D5D9D2;
 Fri, 26 Feb 2021 14:38:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/5] ASoC: rt5640: Add emulated 'DAC1 Playback Switch' control
Date: Fri, 26 Feb 2021 15:38:15 +0100
Message-Id: <20210226143817.84287-4-hdegoede@redhat.com>
In-Reply-To: <20210226143817.84287-1-hdegoede@redhat.com>
References: <20210226143817.84287-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org
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

When using AIF1 the 'DAC1 Playback Volume' control will be used as the
PlaybackMasterElem in UCM.

We need a matching 'DAC1 Playback Switch' for 2 reasons:

1. To be able to truely fully mute the output (the softest volume setting
   is not fully muted).
2. For reliable output-mute LED control.

The path from the IF1_DAC data input to the 'Stereo DAC MIXL' /
'Stereo DAC MIXR' digital mixer has a 'DAC MIXL' / 'DAC MIXR' digital
mixer with IF1_DAC data as one of its inputs direclty after the
'DAC1 Playback Volume' control.

This commit adds an emulated "DAC1 Playback Switch" control by:

1. Declaring the enable flag for the mixers IF1_DAC input as well as the
"DAC1 Playback Switch" control both as SND_SOC_NOPM controls.

2. Storing the settings of both controls as driver-private data.

3. Only clearing the mute flag for the IF1_DAC input of that mixer if the
stored values indicate both controls are enabled.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 96 +++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/rt5640.h |  4 ++
 2 files changed, 96 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index a5674c227b3a..c143ca174921 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -378,6 +378,56 @@ static const char * const rt5640_clsd_spk_ratio[] = {"1.66x", "1.83x", "1.94x",
 static SOC_ENUM_SINGLE_DECL(rt5640_clsd_spk_ratio_enum, RT5640_CLS_D_OUT,
 			    RT5640_CLSD_RATIO_SFT, rt5640_clsd_spk_ratio);
 
+/*
+ * For reliable output-mute LED control we need a "DAC1 Playback Switch" control.
+ * We emulate this by only clearing the RT5640_M_IF1_DAC_L/_R AD_DA_MIXER register
+ * bits when both our emulated DAC1 Playback Switch control and the DAC1 MIXL/R
+ * DAPM-mixer DAC1 input are enabled.
+ */
+static void rt5640_update_ad_da_mixer_if1_dac_m_bits(struct rt5640_priv *rt5640)
+{
+	int val = RT5640_M_IF1_DAC_L | RT5640_M_IF1_DAC_R;
+
+	if (rt5640->dac1_mixl_if1_switch && rt5640->dac1_playback_switch_l)
+		val &= ~RT5640_M_IF1_DAC_L;
+
+	if (rt5640->dac1_mixr_if1_switch && rt5640->dac1_playback_switch_r)
+		val &= ~RT5640_M_IF1_DAC_R;
+
+	regmap_update_bits(rt5640->regmap, RT5640_AD_DA_MIXER,
+			   RT5640_M_IF1_DAC_L | RT5640_M_IF1_DAC_R, val);
+}
+
+static int rt5640_dac1_playback_switch_get(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt5640->dac1_playback_switch_l;
+	ucontrol->value.integer.value[1] = rt5640->dac1_playback_switch_r;
+
+	return 0;
+}
+
+static int rt5640_dac1_playback_switch_put(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+
+	if (rt5640->dac1_playback_switch_l == ucontrol->value.integer.value[0] &&
+	    rt5640->dac1_playback_switch_r == ucontrol->value.integer.value[1])
+		return 0;
+
+	rt5640->dac1_playback_switch_l = ucontrol->value.integer.value[0];
+	rt5640->dac1_playback_switch_r = ucontrol->value.integer.value[1];
+
+	rt5640_update_ad_da_mixer_if1_dac_m_bits(rt5640);
+
+	return 1;
+}
+
 static const struct snd_kcontrol_new rt5640_snd_controls[] = {
 	/* Speaker Output Volume */
 	SOC_DOUBLE("Speaker Channel Switch", RT5640_SPK_VOL,
@@ -400,6 +450,8 @@ static const struct snd_kcontrol_new rt5640_snd_controls[] = {
 	/* DAC Digital Volume */
 	SOC_DOUBLE("DAC2 Playback Switch", RT5640_DAC2_CTRL,
 		RT5640_M_DAC_L2_VOL_SFT, RT5640_M_DAC_R2_VOL_SFT, 1, 1),
+	SOC_DOUBLE_EXT("DAC1 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
+			rt5640_dac1_playback_switch_get, rt5640_dac1_playback_switch_put),
 	SOC_DOUBLE_TLV("DAC1 Playback Volume", RT5640_DAC1_DIG_VOL,
 			RT5640_L_VOL_SFT, RT5640_R_VOL_SFT,
 			175, 0, dac_vol_tlv),
@@ -515,18 +567,44 @@ static const struct snd_kcontrol_new rt5640_mono_adc_r_mix[] = {
 			RT5640_M_MONO_ADC_R2_SFT, 1, 1),
 };
 
+/* See comment above rt5640_update_ad_da_mixer_if1_dac_m_bits() */
+static int rt5640_put_dac1_mix_if1_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (mc->shift == 0)
+		rt5640->dac1_mixl_if1_switch = ucontrol->value.integer.value[0];
+	else
+		rt5640->dac1_mixr_if1_switch = ucontrol->value.integer.value[0];
+
+	/* Apply the update (if any) */
+	ret = snd_soc_dapm_put_volsw(kcontrol, ucontrol);
+	if (ret == 0)
+		return 0;
+
+	rt5640_update_ad_da_mixer_if1_dac_m_bits(rt5640);
+
+	return 1;
+}
+
+#define SOC_DAPM_SINGLE_RT5640_IF1_SW(name, shift) \
+	SOC_SINGLE_EXT(name, SND_SOC_NOPM, shift, 1, 0, \
+		       snd_soc_dapm_get_volsw, rt5640_put_dac1_mix_if1_switch)
+
 static const struct snd_kcontrol_new rt5640_dac_l_mix[] = {
 	SOC_DAPM_SINGLE("Stereo ADC Switch", RT5640_AD_DA_MIXER,
 			RT5640_M_ADCMIX_L_SFT, 1, 1),
-	SOC_DAPM_SINGLE("INF1 Switch", RT5640_AD_DA_MIXER,
-			RT5640_M_IF1_DAC_L_SFT, 1, 1),
+	SOC_DAPM_SINGLE_RT5640_IF1_SW("INF1 Switch", 0),
 };
 
 static const struct snd_kcontrol_new rt5640_dac_r_mix[] = {
 	SOC_DAPM_SINGLE("Stereo ADC Switch", RT5640_AD_DA_MIXER,
 			RT5640_M_ADCMIX_R_SFT, 1, 1),
-	SOC_DAPM_SINGLE("INF1 Switch", RT5640_AD_DA_MIXER,
-			RT5640_M_IF1_DAC_R_SFT, 1, 1),
+	SOC_DAPM_SINGLE_RT5640_IF1_SW("INF1 Switch", 1),
 };
 
 static const struct snd_kcontrol_new rt5640_sto_dac_l_mix[] = {
@@ -2831,6 +2909,16 @@ static int rt5640_i2c_probe(struct i2c_client *i2c,
 	INIT_DELAYED_WORK(&rt5640->bp_work, rt5640_button_press_work);
 	INIT_WORK(&rt5640->jack_work, rt5640_jack_work);
 
+	/*
+	 * Enable the emulated "DAC1 Playback Switch" by default to avoid
+	 * muting the output with older UCM profiles.
+	 */
+	rt5640->dac1_playback_switch_l = true;
+	rt5640->dac1_playback_switch_r = true;
+	/* The Power-On-Reset values for the DAC1 mixer have the INF1 input enabled. */
+	rt5640->dac1_mixl_if1_switch = true;
+	rt5640->dac1_mixr_if1_switch = true;
+
 	/* Make sure work is stopped on probe-error / remove */
 	ret = devm_add_action_or_reset(&i2c->dev, rt5640_cancel_work, rt5640);
 	if (ret)
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 4fd47f2b936b..0d029f5dbb61 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -2135,6 +2135,10 @@ struct rt5640_priv {
 
 	bool hp_mute;
 	bool asrc_en;
+	bool dac1_mixl_if1_switch;
+	bool dac1_mixr_if1_switch;
+	bool dac1_playback_switch_l;
+	bool dac1_playback_switch_r;
 
 	/* Jack and button detect data */
 	bool ovcd_irq_enabled;
-- 
2.30.1


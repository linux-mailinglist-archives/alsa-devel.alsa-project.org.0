Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ACD31BAF8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 15:25:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C4CE1654;
	Mon, 15 Feb 2021 15:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C4CE1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613399110;
	bh=5RDpN9EIdsIdWkoaduM3w4PoatRF/TUqhxJxhzWoqho=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cLVNfvswFF7IVYRCxekmn4127qsbno5BAJlyBcPoXVlVui8t3dV0l1G9yOa9s7IW+
	 rXTLf89fLDELljORUKS7Z7AdZTPFKQU8u5OAbBIjiH6ZVcnby44s5XUodO7qWAvp0l
	 BuowPRNxkUAY2Y+kucBz8DVDb1WYNaBuryNZyBKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2BE3F802E0;
	Mon, 15 Feb 2021 15:22:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 600EFF802DF; Mon, 15 Feb 2021 15:22:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D55DF800AE
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 15:21:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D55DF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="akgyrLYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613398898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AjP2+SOJD4ua9p9k8We7xOP/Qw/cpJ+zyVG9I5hu24=;
 b=akgyrLYXQ5gz9crzjQgrNAsb5FMYdISFnPQ6NdlO1cqnY5B/gK6NryGggJWZ/G/ptakUHU
 12ZtFZtg/QdMQzIQUB02W3jxsBOkqnYUXtRZ/Tdm4jbZ2XSJTBDNvIrtXNI2XiLQ4TfwYJ
 2dPjNcPgXZAhoRcpHOgAZxYjISXb6Go=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-l29T5GYIODKP6KDjupABjQ-1; Mon, 15 Feb 2021 09:21:34 -0500
X-MC-Unique: l29T5GYIODKP6KDjupABjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3B116EE22;
 Mon, 15 Feb 2021 14:21:29 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E6A95D9C0;
 Mon, 15 Feb 2021 14:21:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 4/4] ASoC: rt5670: Add emulated 'DAC1 Playback Switch' control
Date: Mon, 15 Feb 2021 15:21:18 +0100
Message-Id: <20210215142118.308516-5-hdegoede@redhat.com>
In-Reply-To: <20210215142118.308516-1-hdegoede@redhat.com>
References: <20210215142118.308516-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <bard.liao@intel.com>
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

For reliable output-mute LED control we need a "DAC1 Playback Switch"
control. The "DAC Playback volume" control is the only control in the
path from the DAC1 data input to the speaker output, so the UCM profile
for the speaker output will have its PlaybackMixerElem set to "DAC1".

But userspace (pulseaudio) will set the "DAC1 Playback Volume" control to
its softest setting (which is not fully muted) while still showing the
speaker as being enabled at a low volume in the UI.

If we were to set the SNDRV_CTL_ELEM_ACCESS_SPK_LED on the "DAC1 Playback
Volume" control, this would mean then what pressing KEY_VOLUMEDOWN the
speaker-mute LED (embedded in the volume-mute toggle key) would light
while the UI is still showing the speaker as being enabled at a low
volume, meaning that the UI and the LED are out of sync.

Only after an _extra_ KEY_VOLUMEDOWN press would the UI show the
speaker as being muted.

The path from DAC1 data input to the speaker output does have
a digital mixer with DAC1's data as one of its inputs direclty after
the "DAC1 Playback Volume" control.

This commit adds an emulated "DAC1 Playback Switch" control by:

1. Declaring the enable flag for that mixers DAC1 input as well as the
"DAC1 Playback Switch" control both as SND_SOC_NOPM controls.

2. Storing the settings of both controls as driver-private data

3. Only clearing the mute flag for the DAC1 input of that mixer if the
stored values indicate both controls are enabled.

This is a preparation patch for adding "audio-mute" LED trigger support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5670.c | 96 +++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/rt5670.h |  5 ++
 2 files changed, 97 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 4d22fa4e8ab7..feab15d0686a 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -629,6 +629,56 @@ static SOC_ENUM_SINGLE_DECL(rt5670_if2_dac_enum, RT5670_DIG_INF1_DATA,
 static SOC_ENUM_SINGLE_DECL(rt5670_if2_adc_enum, RT5670_DIG_INF1_DATA,
 				RT5670_IF2_ADC_SEL_SFT, rt5670_data_select);
 
+/*
+ * For reliable output-mute LED control we need a "DAC1 Playback Switch" control.
+ * We emulate this by only clearing the RT5670_M_DAC1_L/_R AD_DA_MIXER register
+ * bits when both our emulated DAC1 Playback Switch control and the DAC1 MIXL/R
+ * DAPM-mixer DAC1 input are enabled.
+ */
+static void rt5670_update_ad_da_mixer_dac1_m_bits(struct rt5670_priv *rt5670)
+{
+	int val = RT5670_M_DAC1_L | RT5670_M_DAC1_R;
+
+	if (rt5670->dac1_mixl_dac1_switch && rt5670->dac1_playback_switch_l)
+		val &= ~RT5670_M_DAC1_L;
+
+	if (rt5670->dac1_mixr_dac1_switch && rt5670->dac1_playback_switch_r)
+		val &= ~RT5670_M_DAC1_R;
+
+	regmap_update_bits(rt5670->regmap, RT5670_AD_DA_MIXER,
+			   RT5670_M_DAC1_L | RT5670_M_DAC1_R, val);
+}
+
+static int rt5670_dac1_playback_switch_get(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rt5670->dac1_playback_switch_l;
+	ucontrol->value.integer.value[1] = rt5670->dac1_playback_switch_r;
+
+	return 0;
+}
+
+static int rt5670_dac1_playback_switch_put(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
+
+	if (rt5670->dac1_playback_switch_l == ucontrol->value.integer.value[0] &&
+	    rt5670->dac1_playback_switch_r == ucontrol->value.integer.value[1])
+		return 0;
+
+	rt5670->dac1_playback_switch_l = ucontrol->value.integer.value[0];
+	rt5670->dac1_playback_switch_r = ucontrol->value.integer.value[1];
+
+	rt5670_update_ad_da_mixer_dac1_m_bits(rt5670);
+
+	return 1;
+}
+
 static const struct snd_kcontrol_new rt5670_snd_controls[] = {
 	/* Headphone Output Volume */
 	SOC_DOUBLE_TLV("HP Playback Volume", RT5670_HP_VOL,
@@ -640,6 +690,8 @@ static const struct snd_kcontrol_new rt5670_snd_controls[] = {
 	/* DAC Digital Volume */
 	SOC_DOUBLE("DAC2 Playback Switch", RT5670_DAC_CTRL,
 		RT5670_M_DAC_L2_VOL_SFT, RT5670_M_DAC_R2_VOL_SFT, 1, 1),
+	SOC_DOUBLE_EXT("DAC1 Playback Switch", SND_SOC_NOPM, 0, 1, 1, 0,
+			rt5670_dac1_playback_switch_get, rt5670_dac1_playback_switch_put),
 	SOC_DOUBLE_TLV("DAC1 Playback Volume", RT5670_DAC1_DIG_VOL,
 			RT5670_L_VOL_SFT, RT5670_R_VOL_SFT,
 			175, 0, dac_vol_tlv),
@@ -909,18 +961,44 @@ static const struct snd_kcontrol_new rt5670_mono_adc_r_mix[] = {
 			RT5670_M_MONO_ADC_R2_SFT, 1, 1),
 };
 
+/* See comment above rt5670_update_ad_da_mixer_dac1_m_bits() */
+static int rt5670_put_dac1_mix_dac1_switch(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
+	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	if (mc->shift == 0)
+		rt5670->dac1_mixl_dac1_switch = ucontrol->value.integer.value[0];
+	else
+		rt5670->dac1_mixr_dac1_switch = ucontrol->value.integer.value[0];
+
+	/* Apply the update (if any) */
+	ret = snd_soc_dapm_put_volsw(kcontrol, ucontrol);
+	if (ret == 0)
+		return 0;
+
+	rt5670_update_ad_da_mixer_dac1_m_bits(rt5670);
+
+	return 1;
+}
+
+#define SOC_DAPM_SINGLE_RT5670_DAC1_SW(name, shift) \
+	SOC_SINGLE_EXT(name, SND_SOC_NOPM, shift, 1, 0, \
+		       snd_soc_dapm_get_volsw, rt5670_put_dac1_mix_dac1_switch)
+
 static const struct snd_kcontrol_new rt5670_dac_l_mix[] = {
 	SOC_DAPM_SINGLE("Stereo ADC Switch", RT5670_AD_DA_MIXER,
 			RT5670_M_ADCMIX_L_SFT, 1, 1),
-	SOC_DAPM_SINGLE("DAC1 Switch", RT5670_AD_DA_MIXER,
-			RT5670_M_DAC1_L_SFT, 1, 1),
+	SOC_DAPM_SINGLE_RT5670_DAC1_SW("DAC1 Switch", 0),
 };
 
 static const struct snd_kcontrol_new rt5670_dac_r_mix[] = {
 	SOC_DAPM_SINGLE("Stereo ADC Switch", RT5670_AD_DA_MIXER,
 			RT5670_M_ADCMIX_R_SFT, 1, 1),
-	SOC_DAPM_SINGLE("DAC1 Switch", RT5670_AD_DA_MIXER,
-			RT5670_M_DAC1_R_SFT, 1, 1),
+	SOC_DAPM_SINGLE_RT5670_DAC1_SW("DAC1 Switch", 1),
 };
 
 static const struct snd_kcontrol_new rt5670_sto_dac_l_mix[] = {
@@ -2993,6 +3071,16 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 		dev_info(&i2c->dev, "quirk JD mode 3\n");
 	}
 
+	/*
+	 * Enable the emulated "DAC1 Playback Switch" by default to avoid
+	 * muting the output with older UCM profiles.
+	 */
+	rt5670->dac1_playback_switch_l = true;
+	rt5670->dac1_playback_switch_r = true;
+	/* The Power-On-Reset values for the DAC1 mixer have the DAC1 input enabled. */
+	rt5670->dac1_mixl_dac1_switch = true;
+	rt5670->dac1_mixr_dac1_switch = true;
+
 	rt5670->regmap = devm_regmap_init_i2c(i2c, &rt5670_regmap);
 	if (IS_ERR(rt5670->regmap)) {
 		ret = PTR_ERR(rt5670->regmap);
diff --git a/sound/soc/codecs/rt5670.h b/sound/soc/codecs/rt5670.h
index f9c4db156c80..6fb3c369ee98 100644
--- a/sound/soc/codecs/rt5670.h
+++ b/sound/soc/codecs/rt5670.h
@@ -2013,6 +2013,11 @@ struct rt5670_priv {
 	int dsp_rate;
 	int jack_type;
 	int jack_type_saved;
+
+	bool dac1_mixl_dac1_switch;
+	bool dac1_mixr_dac1_switch;
+	bool dac1_playback_switch_l;
+	bool dac1_playback_switch_r;
 };
 
 void rt5670_jack_suspend(struct snd_soc_component *component);
-- 
2.30.1


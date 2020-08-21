Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719524E034
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 20:58:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C1E1684;
	Fri, 21 Aug 2020 20:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C1E1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036335;
	bh=oAOaB3994c5Ra/BBX+Jwy9JK8QCz85uZHVZ2drOanRA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQmSrPQF0Yv6WTCfpDN/BXFN83j5HLpA2B8DJZyVdUjBfiiLNP4pudBcympb4zgbO
	 kwcHHp54EIZhyMGN5CrLqMMeP56g8LM363wsLd/zpLtL9vUOTlK+eGGVVdwlO8DjuC
	 WSLvUIy/x8c28AegFIRA1l+1g5xzx0gTfCSeP0BI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E803F80303;
	Fri, 21 Aug 2020 20:54:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5C3BF802E0; Fri, 21 Aug 2020 20:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 380F4F802A9
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 380F4F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BZySkau+"
Received: by mail-qt1-x841.google.com with SMTP id s16so1941183qtn.7
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GP5vIYZDE5wLQloDqHwwOOSc6E8YyrpTpCW1tgf7iiM=;
 b=BZySkau+Lmb4Mn7kwLID8XWciUtg9EQYdPQ41jEmFjltAl0Mpxpqey0ii9hlyV+tqf
 T48NHqDEs1yxgc3qkGmJCTTz5E+o6opRPKR4937Wi732O5CldMKxnUiSayTjExLnCOvU
 I1HvFg0g91vM50EgrZ8vYtpf5ep/MiF7RpJ+gmcuiNZfwq0mZcPiRXyDR9pCEWf5q1NZ
 3FvwJLgzYjwx9YNgT3rkno1CQBgUgc5WIIR3PfkBguXnAvBGrTAaHbz9JyHbZLdM9Qg5
 lyat9CdodV9zduPNynOuYUPjDftdNyfyw0fPcjPIlTNhfOFAcHGycDqfD4ICa3LQ5CsU
 ATng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GP5vIYZDE5wLQloDqHwwOOSc6E8YyrpTpCW1tgf7iiM=;
 b=g6HEo8CaGzRG0KlVVZCHF0+SbV76WBRtyRHtS14IizKq9m/JbhfPBiRW7WeuGGLc3q
 1/N5olCswVLhcF91wfrikntQ0ohgkmTBLIaHWkcOfrKkDds4qiM5JiIyhPfaZL+0uKfW
 zVeUeG6WFS6afNiCsHqhmrnC6p6Ifa7G56FpLDYgmAZ8G10TpuCy03gtJDayuuUoqxH3
 8Yn8tsi848Km74FkLsAxrZpHjxo+T00/Z4UQmsrRif/tZPOV+1je40y5SiV37zzko7TH
 eUFP6KW+D9gcMSrugrL67qpHXCNfyEquu64z9V9b3Ikz6a+0ATarjgdIrjQ6w+5Ad4dP
 n24g==
X-Gm-Message-State: AOAM5315H8Qh+eps19FjclG/MFSSl9yz4Ox3ESBvRHMRoz8nwpH85vBn
 nBzhkTeoS826Q8V+wvAacMahKq+Jazo=
X-Google-Smtp-Source: ABdhPJwq9xnhoPY81WJaYWLW9xZcomJNImjoRqEUOGfPKHuinRvHVD/BHOR0sivtN3KZ2o3MtyMELg==
X-Received: by 2002:ac8:431a:: with SMTP id z26mr4015779qtm.298.1598036030149; 
 Fri, 21 Aug 2020 11:53:50 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:53:49 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 05/20] ALSA: hda/ca0132 - Add bass redirection controls.
Date: Fri, 21 Aug 2020 14:52:22 -0400
Message-Id: <20200821185239.26133-6-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821185239.26133-1-conmanx360@gmail.com>
References: <20200821185239.26133-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Add bass redirection controls for surround outputs. This uses the DSP to
redirect audio below the bass redirection crossover frequency to the LFE
channel from the front/rear L/R speakers. This only goes into effect if
the speakers aren't set as full range, and only if the surround
configuration has an LFE channel.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 130 +++++++++++++++++++++++++++++++++--
 1 file changed, 126 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index c9cd4fc218fe..d97358406401 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -149,6 +149,8 @@ enum {
 	SPEAKER_CHANNEL_CFG_ENUM,
 	SPEAKER_FULL_RANGE_FRONT,
 	SPEAKER_FULL_RANGE_REAR,
+	BASS_REDIRECTION,
+	BASS_REDIRECTION_XOVER,
 #define EFFECTS_COUNT  (EFFECT_END_NID - EFFECT_START_NID)
 };
 
@@ -1123,6 +1125,8 @@ struct ca0132_spec {
 	unsigned char speaker_range_val[2];
 	unsigned char mic_boost_enum_val;
 	unsigned char smart_volume_setting;
+	unsigned char bass_redirection_val;
+	long bass_redirect_xover_freq;
 	long fx_ctl_val[EFFECT_LEVEL_SLIDERS];
 	long xbass_xover_freq;
 	long eq_preset_val;
@@ -4324,6 +4328,35 @@ static int ca0132_alt_set_full_range_speaker(struct hda_codec *codec)
 	return 0;
 }
 
+static int ca0132_alt_surround_set_bass_redirection(struct hda_codec *codec,
+		bool val)
+{
+	struct ca0132_spec *spec = codec->spec;
+	unsigned int tmp;
+	int err;
+
+	if (val && spec->channel_cfg_val != SPEAKER_CHANNELS_4_0 &&
+			spec->channel_cfg_val != SPEAKER_CHANNELS_2_0)
+		tmp = FLOAT_ONE;
+	else
+		tmp = FLOAT_ZERO;
+
+	err = dspio_set_uint_param(codec, 0x96, SPEAKER_BASS_REDIRECT, tmp);
+	if (err < 0)
+		return err;
+
+	/* If it is enabled, make sure to set the crossover frequency. */
+	if (tmp) {
+		tmp = float_xbass_xover_lookup[spec->xbass_xover_freq];
+		err = dspio_set_uint_param(codec, 0x96,
+				SPEAKER_BASS_REDIRECT_XOVER_FREQ, tmp);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 /*
  * These are the commands needed to setup output on each of the different card
  * types.
@@ -4593,6 +4626,15 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 		ca0132_effects_set(codec, X_BASS,
 			spec->effects_switch[X_BASS - EFFECT_START_NID]);
 
+	if (spec->cur_out_type == SURROUND_OUT)
+		err = ca0132_alt_surround_set_bass_redirection(codec,
+				spec->bass_redirection_val);
+	else
+		err = ca0132_alt_surround_set_bass_redirection(codec, 0);
+
+	if (err < 0)
+		goto exit;
+
 	/* run through the output dsp commands for the selected output. */
 	for (i = 0; i < alt_out_presets[spec->cur_out_type].commands; i++) {
 		err = dspio_set_uint_param(codec,
@@ -5282,6 +5324,18 @@ static int ca0132_vnode_switch_set(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 /* End of control change helpers. */
+
+static void ca0132_alt_bass_redirection_xover_set(struct hda_codec *codec,
+		long idx)
+{
+	snd_hda_power_up(codec);
+
+	dspio_set_param(codec, 0x96, 0x20, SPEAKER_BASS_REDIRECT_XOVER_FREQ,
+			&(float_xbass_xover_lookup[idx]), sizeof(unsigned int));
+
+	snd_hda_power_down(codec);
+}
+
 /*
  * Below I've added controls to mess with the effect levels, I've only enabled
  * them on the Sound Blaster Z, but they would probably also work on the
@@ -5290,6 +5344,7 @@ static int ca0132_vnode_switch_set(struct snd_kcontrol *kcontrol,
  */
 
 /* Sets DSP effect level from the sliders above the controls */
+
 static int ca0132_alt_slider_ctl_set(struct hda_codec *codec, hda_nid_t nid,
 			  const unsigned int *lookup, int idx)
 {
@@ -5335,8 +5390,12 @@ static int ca0132_alt_xbass_xover_slider_ctl_get(struct snd_kcontrol *kcontrol,
 	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
 	struct ca0132_spec *spec = codec->spec;
 	long *valp = ucontrol->value.integer.value;
+	hda_nid_t nid = get_amp_nid(kcontrol);
 
-	*valp = spec->xbass_xover_freq;
+	if (nid == BASS_REDIRECTION_XOVER)
+		*valp = spec->bass_redirect_xover_freq;
+	else
+		*valp = spec->xbass_xover_freq;
 
 	return 0;
 }
@@ -5391,16 +5450,25 @@ static int ca0132_alt_xbass_xover_slider_put(struct snd_kcontrol *kcontrol,
 	struct ca0132_spec *spec = codec->spec;
 	hda_nid_t nid = get_amp_nid(kcontrol);
 	long *valp = ucontrol->value.integer.value;
+	long *cur_val;
 	int idx;
 
+	if (nid == BASS_REDIRECTION_XOVER)
+		cur_val = &spec->bass_redirect_xover_freq;
+	else
+		cur_val = &spec->xbass_xover_freq;
+
 	/* any change? */
-	if (spec->xbass_xover_freq == *valp)
+	if (*cur_val == *valp)
 		return 0;
 
-	spec->xbass_xover_freq = *valp;
+	*cur_val = *valp;
 
 	idx = *valp;
-	ca0132_alt_slider_ctl_set(codec, nid, float_xbass_xover_lookup, idx);
+	if (nid == BASS_REDIRECTION_XOVER)
+		ca0132_alt_bass_redirection_xover_set(codec, *cur_val);
+	else
+		ca0132_alt_slider_ctl_set(codec, nid, float_xbass_xover_lookup, idx);
 
 	return 0;
 }
@@ -5968,6 +6036,11 @@ static int ca0132_switch_get(struct snd_kcontrol *kcontrol,
 		return 0;
 	}
 
+	if (nid == BASS_REDIRECTION) {
+		*valp = spec->bass_redirection_val;
+		return 0;
+	}
+
 	return 0;
 }
 
@@ -6054,6 +6127,14 @@ static int ca0132_switch_put(struct snd_kcontrol *kcontrol,
 		changed = 0;
 	}
 
+	if (nid == BASS_REDIRECTION) {
+		spec->bass_redirection_val = *valp;
+		if (spec->cur_out_type == SURROUND_OUT)
+			ca0132_alt_surround_set_bass_redirection(codec, *valp);
+
+		changed = 0;
+	}
+
 exit:
 	snd_hda_power_down(codec);
 	return changed;
@@ -6436,6 +6517,39 @@ static int ca0132_alt_add_rear_full_range_switch(struct hda_codec *codec)
 				snd_ctl_new1(&knew, codec));
 }
 
+/*
+ * Bass redirection redirects audio below the crossover frequency to the LFE
+ * channel on speakers that are set as not being full-range. On configurations
+ * without an LFE channel, it does nothing. Bass redirection seems to be the
+ * replacement for X-Bass on configurations with an LFE channel.
+ */
+static int ca0132_alt_add_bass_redirection_crossover(struct hda_codec *codec)
+{
+	const char *namestr = "Output: Bass Redirection Playback Volume";
+	struct snd_kcontrol_new knew =
+		HDA_CODEC_VOLUME_MONO(namestr, BASS_REDIRECTION_XOVER, 1, 0,
+				HDA_OUTPUT);
+
+	knew.tlv.c = NULL;
+	knew.info = ca0132_alt_xbass_xover_slider_info;
+	knew.get = ca0132_alt_xbass_xover_slider_ctl_get;
+	knew.put = ca0132_alt_xbass_xover_slider_put;
+
+	return snd_hda_ctl_add(codec, BASS_REDIRECTION_XOVER,
+			snd_ctl_new1(&knew, codec));
+}
+
+static int ca0132_alt_add_bass_redirection_switch(struct hda_codec *codec)
+{
+	const char *namestr = "Output: Bass Redirection Playback Switch";
+	struct snd_kcontrol_new knew =
+		CA0132_CODEC_MUTE_MONO(namestr, BASS_REDIRECTION, 1,
+				HDA_OUTPUT);
+
+	return snd_hda_ctl_add(codec, BASS_REDIRECTION,
+			snd_ctl_new1(&knew, codec));
+}
+
 /*
  * Create an Input Source enumerated control for the alternate ca0132 codecs
  * because the front microphone has no auto-detect, and Line-in has to be set
@@ -6749,6 +6863,12 @@ static int ca0132_build_controls(struct hda_codec *codec)
 		if (err < 0)
 			return err;
 		err = ca0132_alt_add_rear_full_range_switch(codec);
+		if (err < 0)
+			return err;
+		err = ca0132_alt_add_bass_redirection_crossover(codec);
+		if (err < 0)
+			return err;
+		err = ca0132_alt_add_bass_redirection_switch(codec);
 		if (err < 0)
 			return err;
 		err = ca0132_alt_add_mic_boost_enum(codec);
@@ -8102,6 +8222,8 @@ static void ca0132_init_chip(struct hda_codec *codec)
 		spec->xbass_xover_freq = 8;
 		for (i = 0; i < EFFECT_LEVEL_SLIDERS; i++)
 			spec->fx_ctl_val[i] = effect_slider_defaults[i];
+
+		spec->bass_redirect_xover_freq = 8;
 	}
 
 	spec->voicefx_val = 0;
-- 
2.20.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2C32521B8
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:14:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A092E1690;
	Tue, 25 Aug 2020 22:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A092E1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386469;
	bh=t75CkHHODcAPMc8ljbziKe3cV6pPxGFNH4khduv6FcM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VhLyMK5tpsYnTEDPTuUQ+AH1K1PtQgUtTCcaM+nRIQOuOxOLV1CCB1ZJhF5Jbfeix
	 PulJIbS9XW/+oMewQ2FXi++acSOo6USrCvYWvlbF1UWg9+ftLagYYTys5h0z9AhMD0
	 c16dXsAf5Xj3R0MeqjlNk5BW3KeonSbROABATGRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C087DF802E7;
	Tue, 25 Aug 2020 22:11:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72524F802D2; Tue, 25 Aug 2020 22:11:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B264F8028A
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B264F8028A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uUFN2OQZ"
Received: by mail-qt1-x843.google.com with SMTP id x12so10043896qtp.1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yIaws6KCQVSIHzziY2z48AJ0prwYu0pRy814kvci+dY=;
 b=uUFN2OQZhfmf7N/SXBxbcxw6GjBwi/XXCJ5m9j10GKyYoglQT9oLLGXuT7L7fQmP6E
 n7xsr+9tCay1tf1Q2AItXmARF6JLSWRBof6yhgQu88mQqEOBUGSf5STs/iwqaG2XmHsg
 tWX+SRkYn+PCQ2lgq+6cajv9QKoELDKzkQfRfQsLH+pG/6fTM1mBHNhNFiVE6RkkyFXd
 jt8sVGsf1cufGPQMuEMeRHGwSovJ1ntxHoWWETIOvHyVbdGqFQuObGrmwSOF50+pWKd2
 L7D+KjDBDPRoOB2NX34tS07C0ZywOTu7Zq+Ve9f+tX9LhXP4q9uVYpimHcU6kOny8M+f
 9Qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yIaws6KCQVSIHzziY2z48AJ0prwYu0pRy814kvci+dY=;
 b=alvaoeMH+jdVKbJ7HGUbe3jekb6ZUL43LAdeyarzsq/TwYkw0wTvKiPQscvyv9ltQX
 hItDlUX43oRuiyyzsaryNP5D2N4rRA1Ur9uMhyOWiPtlWW6LrwLpdUoh7xO89GZTCugv
 NPg2vcSEsh4WrnJRxhfacQFldpMQf2jhtD59BW4vDWxmWuZVVTQvgk0neSlCRLAS/OmV
 XZrG/Yv1Ivx+llCasbkFzcg91a12Td06up3KIqd5XbU4Z0xHlsM7M56L68ri02c7WUz7
 jOvuxbbXqTOGGPF4icoJm20JC+d9E9hO3eAylB1uSG8p3ipUQYxBWyLjqAkD1zSlhOOZ
 invQ==
X-Gm-Message-State: AOAM5320QlI4jSVvosFgfasP8kPjPRTHFVPphUukkWsSi1iLGy2uzBdf
 wEa+sJ2hWEwLT9rFiGn57DM=
X-Google-Smtp-Source: ABdhPJz7seAil9NuJNPC++/C0qZVhxR56CW8clBp4EjSUw4LDXkVLCnNgceRAg6PTWNF7VVVhcfX2w==
X-Received: by 2002:ac8:4747:: with SMTP id k7mr10852930qtp.76.1598386266618; 
 Tue, 25 Aug 2020 13:11:06 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:06 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 04/20] ALSA: hda/ca0132 - Add full-range speaker selection
 controls.
Date: Tue, 25 Aug 2020 16:10:23 -0400
Message-Id: <20200825201040.30339-5-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200825201040.30339-1-conmanx360@gmail.com>
References: <20200825201040.30339-1-conmanx360@gmail.com>
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

Add functions for setting full-range speakers and controls to
enable/disable the setting. Setting a speaker to full-range means that
the channels won't have their bass redirected to the LFE channel.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 117 +++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 1a5fb30b69ab..469cefe9a51a 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -147,6 +147,8 @@ enum {
 	AE5_SOUND_FILTER_ENUM,
 	ZXR_HEADPHONE_GAIN,
 	SPEAKER_CHANNEL_CFG_ENUM,
+	SPEAKER_FULL_RANGE_FRONT,
+	SPEAKER_FULL_RANGE_REAR,
 #define EFFECTS_COUNT  (EFFECT_END_NID - EFFECT_START_NID)
 };
 
@@ -592,6 +594,24 @@ static const struct ct_eq_preset ca0132_alt_eq_presets[] = {
 	}
 };
 
+/*
+ * DSP reqs for handling full-range speakers/bass redirection. If a speaker is
+ * set as not being full range, and bass redirection is enabled, all
+ * frequencies below the crossover frequency are redirected to the LFE
+ * channel. If the surround configuration has no LFE channel, this can't be
+ * enabled. X-Bass must be disabled when using these.
+ */
+enum speaker_range_reqs {
+	SPEAKER_BASS_REDIRECT            = 0x15,
+	SPEAKER_BASS_REDIRECT_XOVER_FREQ = 0x16,
+	/* Between 0x16-0x1a are the X-Bass reqs. */
+	SPEAKER_FULL_RANGE_FRONT_L_R     = 0x1a,
+	SPEAKER_FULL_RANGE_CENTER_LFE    = 0x1b,
+	SPEAKER_FULL_RANGE_REAR_L_R      = 0x1c,
+	SPEAKER_FULL_RANGE_SURROUND_L_R  = 0x1d,
+	SPEAKER_BASS_REDIRECT_SUB_GAIN   = 0x1e,
+};
+
 /*
  * Definitions for the DSP req's to handle speaker tuning. These all belong to
  * module ID 0x96, the output effects module.
@@ -1100,6 +1120,7 @@ struct ca0132_spec {
 	unsigned char in_enum_val;
 	unsigned char out_enum_val;
 	unsigned char channel_cfg_val;
+	unsigned char speaker_range_val[2];
 	unsigned char mic_boost_enum_val;
 	unsigned char smart_volume_setting;
 	long fx_ctl_val[EFFECT_LEVEL_SLIDERS];
@@ -4259,6 +4280,50 @@ static void ae5_mmio_select_out(struct hda_codec *codec)
 			ae5_ca0113_output_presets[spec->cur_out_type].vals[i]);
 }
 
+static int ca0132_alt_set_full_range_speaker(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+	unsigned int tmp;
+	int err;
+
+	/* 2.0/4.0 setup has no LFE channel, so setting full-range does nothing. */
+	if (spec->channel_cfg_val == SPEAKER_CHANNELS_4_0
+			|| spec->channel_cfg_val == SPEAKER_CHANNELS_2_0)
+		return 0;
+
+	/* Set front L/R full range. Zero for full-range, one for redirection. */
+	tmp = spec->speaker_range_val[0] ? FLOAT_ZERO : FLOAT_ONE;
+	err = dspio_set_uint_param(codec, 0x96,
+			SPEAKER_FULL_RANGE_FRONT_L_R, tmp);
+	if (err < 0)
+		return err;
+
+	/* When setting full-range rear, both rear and center/lfe are set. */
+	tmp = spec->speaker_range_val[1] ? FLOAT_ZERO : FLOAT_ONE;
+	err = dspio_set_uint_param(codec, 0x96,
+			SPEAKER_FULL_RANGE_CENTER_LFE, tmp);
+	if (err < 0)
+		return err;
+
+	err = dspio_set_uint_param(codec, 0x96,
+			SPEAKER_FULL_RANGE_REAR_L_R, tmp);
+	if (err < 0)
+		return err;
+
+	/*
+	 * Only the AE series cards set this value when setting full-range,
+	 * and it's always 1.0f.
+	 */
+	if (ca0132_quirk(spec) == QUIRK_AE5) {
+		err = dspio_set_uint_param(codec, 0x96,
+				SPEAKER_FULL_RANGE_SURROUND_L_R, FLOAT_ONE);
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
@@ -4539,6 +4604,9 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 			goto exit;
 	}
 
+	if (spec->cur_out_type == SURROUND_OUT)
+		err = ca0132_alt_set_full_range_speaker(codec);
+
 exit:
 	snd_hda_power_down_pm(codec);
 
@@ -5269,6 +5337,7 @@ static int ca0132_alt_xbass_xover_slider_ctl_get(struct snd_kcontrol *kcontrol,
 	long *valp = ucontrol->value.integer.value;
 
 	*valp = spec->xbass_xover_freq;
+
 	return 0;
 }
 
@@ -5894,6 +5963,11 @@ static int ca0132_switch_get(struct snd_kcontrol *kcontrol,
 		return 0;
 	}
 
+	if (nid == SPEAKER_FULL_RANGE_FRONT || nid == SPEAKER_FULL_RANGE_REAR) {
+		*valp = spec->speaker_range_val[nid - SPEAKER_FULL_RANGE_FRONT];
+		return 0;
+	}
+
 	return 0;
 }
 
@@ -5972,6 +6046,14 @@ static int ca0132_switch_put(struct snd_kcontrol *kcontrol,
 		goto exit;
 	}
 
+	if (nid == SPEAKER_FULL_RANGE_FRONT || nid == SPEAKER_FULL_RANGE_REAR) {
+		spec->speaker_range_val[nid - SPEAKER_FULL_RANGE_FRONT] = *valp;
+		if (spec->cur_out_type == SURROUND_OUT)
+			ca0132_alt_set_full_range_speaker(codec);
+
+		changed = 0;
+	}
+
 exit:
 	snd_hda_power_down(codec);
 	return changed;
@@ -6329,6 +6411,31 @@ static int ca0132_alt_add_speaker_channel_cfg_enum(struct hda_codec *codec)
 				snd_ctl_new1(&knew, codec));
 }
 
+/*
+ * Full range front stereo and rear surround switches. When these are set to
+ * full range, the lower frequencies from these channels are no longer
+ * redirected to the LFE channel.
+ */
+static int ca0132_alt_add_front_full_range_switch(struct hda_codec *codec)
+{
+	struct snd_kcontrol_new knew =
+		CA0132_CODEC_MUTE_MONO("Full-Range Front Speakers",
+				    SPEAKER_FULL_RANGE_FRONT, 1, HDA_OUTPUT);
+
+	return snd_hda_ctl_add(codec, SPEAKER_FULL_RANGE_FRONT,
+				snd_ctl_new1(&knew, codec));
+}
+
+static int ca0132_alt_add_rear_full_range_switch(struct hda_codec *codec)
+{
+	struct snd_kcontrol_new knew =
+		CA0132_CODEC_MUTE_MONO("Full-Range Rear Speakers",
+				    SPEAKER_FULL_RANGE_REAR, 1, HDA_OUTPUT);
+
+	return snd_hda_ctl_add(codec, SPEAKER_FULL_RANGE_REAR,
+				snd_ctl_new1(&knew, codec));
+}
+
 /*
  * Create an Input Source enumerated control for the alternate ca0132 codecs
  * because the front microphone has no auto-detect, and Line-in has to be set
@@ -6636,6 +6743,12 @@ static int ca0132_build_controls(struct hda_codec *codec)
 		if (err < 0)
 			return err;
 		err = ca0132_alt_add_speaker_channel_cfg_enum(codec);
+		if (err < 0)
+			return err;
+		err = ca0132_alt_add_front_full_range_switch(codec);
+		if (err < 0)
+			return err;
+		err = ca0132_alt_add_rear_full_range_switch(codec);
 		if (err < 0)
 			return err;
 		err = ca0132_alt_add_mic_boost_enum(codec);
@@ -7982,6 +8095,10 @@ static void ca0132_init_chip(struct hda_codec *codec)
 	 * ca0132 codecs. Also sets x-bass crossover frequency to 80hz.
 	 */
 	if (ca0132_use_alt_controls(spec)) {
+		/* Set speakers to default to full range. */
+		spec->speaker_range_val[0] = 1;
+		spec->speaker_range_val[1] = 1;
+
 		spec->xbass_xover_freq = 8;
 		for (i = 0; i < EFFECT_LEVEL_SLIDERS; i++)
 			spec->fx_ctl_val[i] = effect_slider_defaults[i];
-- 
2.20.1


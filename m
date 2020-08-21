Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE424E032
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 20:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 295881685;
	Fri, 21 Aug 2020 20:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 295881685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036311;
	bh=64rdbhKiaBV9KEbCYTU2On9nPFCbTmFEacdqwrJ+txY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOcy7gYCEzNsAc22JPIMti7kMZluEGWm2cfG+0ukUocW84/sBwm/c6iPmoWT0gQyB
	 hTucOj8D9fx5rvUwG4NixTBMHmv3Xtkgt27G0+vo73eSMxRqyEsF1utG/oQYKcMxHE
	 Yqia641OeWWOcblK1lCRplxFG5446DBvNJFsjmto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3DE6F802F9;
	Fri, 21 Aug 2020 20:54:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E1AFF802DF; Fri, 21 Aug 2020 20:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7569AF80257
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7569AF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y0Wcp4/M"
Received: by mail-qk1-x742.google.com with SMTP id n129so2270741qkd.6
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FkuYgNKCtUXMPtc6muXtdoZjdyTibLpATGL7dNNNZPg=;
 b=Y0Wcp4/MXDntSK2n3JgLheU1eu6HIMSdfZMTaGGLxyAp979vzrNad6JdSArM8yreUq
 pFoZpQwFzxHL8g4meFahiPWxgvL7Y8EPgaHeYS8V3VJENpIDstKUKK1ByrWL6vZaKabA
 1dRKSUmGDyLu4pDShUdMgBhbPcXmDcD932ceBnIaP69QQqG+tYnAZPNM3/2x7R3rG4XF
 kdAH9s6YTu+ksFM5YQ9tsxL9etDfiPhh5E+gaATrxwEuw1MnUC19yADSSE0CBl5zv8bh
 t7l4EtJBxLasvEyhevX0EpniloZxIJtfHrCGdK7UOzDu/nrGNLkkaQ/o7mYc7K7aJHRe
 g57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FkuYgNKCtUXMPtc6muXtdoZjdyTibLpATGL7dNNNZPg=;
 b=RhRRZ7JIzSCJLw8Gzi5YywfqjOFPH/RjnoNBsTiHokl+nsXJw9NISILajGyk5CHQYp
 e3DNZ5XAYJ9qK95TGGStmmbi/m+DaK/tLzhxYDORA8P13Y7Nh50624ZCKUqsQG3ZnlzW
 YCFVE9Mkl6COIgQmL4rpACCv5ZNmf25r1PNYetWpaoQqmF59RSsJ3jj4UoDAZqX2e7xt
 dZLSzKiwhowkINLAzQub9jaz8mbZdsO9rRM+WDrBfCxVcOm7s65l3XROT0bLDFeQ3bzE
 SxhBvTSsBXHEGDbtcOynn05mHzUyna6PEhJPAbo/WjE7Q0J0WVtp0ix/X3Nf8Vj3LK4V
 hqig==
X-Gm-Message-State: AOAM530+vyPDLR8yWTG6CBNVVAlSZVIzlOPFY9pVbzgAxMEDwKDWGfs2
 BNaaaGNhWcKniOrIpQZXn2Q=
X-Google-Smtp-Source: ABdhPJyWgd9Bpi9Je3odQ/g7+DnVheiXwseS8AhAiIEWXKsVQ80GZVO1rjNcU9eGQNC6RhqK0dVbVA==
X-Received: by 2002:a37:27d8:: with SMTP id n207mr4213895qkn.446.1598036032066; 
 Fri, 21 Aug 2020 11:53:52 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:53:51 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 06/20] ALSA: hda/ca0132 - Remove surround output selection.
Date: Fri, 21 Aug 2020 14:52:23 -0400
Message-Id: <20200821185239.26133-7-conmanx360@gmail.com>
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

Remove the surround output selection and merge it with the speaker
output selection. Now that the extra commands that were being run on
surround output setting are known, there's no need to have it be
separate.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 151 +++++++++++------------------------
 1 file changed, 46 insertions(+), 105 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index d97358406401..f0fa1e8f41da 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -82,11 +82,10 @@ MODULE_FIRMWARE(R3DI_EFX_FILE);
 
 static const char *const dirstr[2] = { "Playback", "Capture" };
 
-#define NUM_OF_OUTPUTS 3
+#define NUM_OF_OUTPUTS 2
 enum {
 	SPEAKER_OUT,
 	HEADPHONE_OUT,
-	SURROUND_OUT
 };
 
 enum {
@@ -699,16 +698,6 @@ static const struct ca0132_alt_out_set alt_out_presets[] = {
 		    0x00000000, 0x00000000, 0x00000000,
 		    0x00000000 }
 	},
-	{ .name = "Surround",
-	  .commands = 8,
-	  .mids = { 0x96, 0x8F, 0x96, 0x96,
-		    0x96, 0x96, 0x96, 0x96 },
-	  .reqs = { 0x18, 0x01, 0x1F, 0x15,
-		    0x3A, 0x1A, 0x1B, 0x1C },
-	  .vals = { 0x00000000, 0x00000000, 0x00000000,
-		    0x00000000, 0x00000000, 0x00000000,
-		    0x00000000, 0x00000000 }
-	}
 };
 
 /* Surround output channel count configuration structures. */
@@ -785,10 +774,6 @@ static const struct ae5_ca0113_output_set ae5_ca0113_output_presets[] = {
 	{ .group =  { 0x30, 0x30, 0x48, 0x48, 0x48, 0x30 },
 	  .target = { 0x2e, 0x30, 0x0d, 0x17, 0x19, 0x32 },
 	  .vals =   { 0x3f, 0x3f, 0x00, 0x00, 0x00, 0x00 }
-	},
-	{ .group =  { 0x30, 0x30, 0x48, 0x48, 0x48, 0x30 },
-	  .target = { 0x2e, 0x30, 0x0d, 0x17, 0x19, 0x32 },
-	  .vals =   { 0x00, 0x00, 0x40, 0x00, 0x00, 0x3f }
 	}
 };
 
@@ -4440,42 +4425,6 @@ static void ca0132_alt_select_out_quirk_handler(struct hda_codec *codec)
 			break;
 		}
 		break;
-	case SURROUND_OUT:
-		switch (ca0132_quirk(spec)) {
-		case QUIRK_SBZ:
-			ca0113_mmio_gpio_set(codec, 7, false);
-			ca0113_mmio_gpio_set(codec, 4, true);
-			ca0113_mmio_gpio_set(codec, 1, true);
-			chipio_set_control_param(codec, 0x0d, 0x18);
-			break;
-		case QUIRK_ZXR:
-			ca0113_mmio_gpio_set(codec, 2, true);
-			ca0113_mmio_gpio_set(codec, 3, true);
-			ca0113_mmio_gpio_set(codec, 5, false);
-			zxr_headphone_gain_set(codec, 0);
-			chipio_set_control_param(codec, 0x0d, 0x24);
-			break;
-		case QUIRK_R3DI:
-			chipio_set_control_param(codec, 0x0d, 0x24);
-			r3di_gpio_out_set(codec, R3DI_LINE_OUT);
-			break;
-		case QUIRK_R3D:
-			ca0113_mmio_gpio_set(codec, 1, true);
-			chipio_set_control_param(codec, 0x0d, 0x24);
-			break;
-		case QUIRK_AE5:
-			ae5_mmio_select_out(codec);
-			ae5_headphone_gain_set(codec, 2);
-			tmp = FLOAT_ZERO;
-			dspio_set_uint_param(codec, 0x96, 0x29, tmp);
-			dspio_set_uint_param(codec, 0x96, 0x2a, tmp);
-			chipio_set_control_param(codec, 0x0d, 0xa4);
-			chipio_write(codec, 0x18b03c, 0x00000012);
-			break;
-		default:
-			break;
-		}
-		break;
 	}
 }
 
@@ -4492,11 +4441,10 @@ static void ca0132_alt_select_out_quirk_handler(struct hda_codec *codec)
 static int ca0132_alt_select_out(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
+	unsigned int tmp, outfx_set, i;
 	unsigned int pin_ctl;
 	int jack_present;
 	int auto_jack;
-	unsigned int i;
-	unsigned int tmp;
 	int err;
 	/* Default Headphone is rear headphone */
 	hda_nid_t headphone_nid = spec->out_pins[1];
@@ -4523,6 +4471,8 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 	} else
 		spec->cur_out_type = spec->out_enum_val;
 
+	outfx_set = spec->effects_switch[PLAY_ENHANCEMENT - EFFECT_START_NID];
+
 	/* Begin DSP output switch */
 	tmp = FLOAT_ONE;
 	err = dspio_set_uint_param(codec, 0x96, 0x3A, tmp);
@@ -4536,6 +4486,7 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 		codec_dbg(codec, "%s speaker\n", __func__);
 
 		/* disable headphone node */
+
 		pin_ctl = snd_hda_codec_read(codec, spec->out_pins[1], 0,
 					AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
 		snd_hda_set_pin_ctl(codec, spec->out_pins[1],
@@ -4549,15 +4500,34 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 		snd_hda_codec_write(codec, spec->out_pins[0], 0,
 			AC_VERB_SET_EAPD_BTLENABLE, 0x01);
 
-		/* If PlayEnhancement is enabled, set different source */
-		if (spec->effects_switch[PLAY_ENHANCEMENT - EFFECT_START_NID])
-			dspio_set_uint_param(codec, 0x80, 0x04, FLOAT_ONE);
+		/* enable center/lfe out node */
+		pin_ctl = snd_hda_codec_read(codec, spec->out_pins[2], 0,
+				AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
+		snd_hda_set_pin_ctl(codec, spec->out_pins[2],
+				pin_ctl | PIN_OUT);
+		/* Now set rear surround node as out. */
+		pin_ctl = snd_hda_codec_read(codec, spec->out_pins[3], 0,
+				AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
+		snd_hda_set_pin_ctl(codec, spec->out_pins[3],
+				pin_ctl | PIN_OUT);
+
+		/*
+		 * Without PlayEnhancement being enabled, if we've got a 2.0
+		 * setup, set it to floating point eight to disable any DSP
+		 * processing effects.
+		 */
+		if (!outfx_set && spec->channel_cfg_val == SPEAKER_CHANNELS_2_0)
+			tmp = FLOAT_EIGHT;
 		else
-			dspio_set_uint_param(codec, 0x80, 0x04, FLOAT_EIGHT);
+			tmp = speaker_channel_cfgs[spec->channel_cfg_val].val;
+
+		err = dspio_set_uint_param(codec, 0x80, 0x04, tmp);
+		if (err < 0)
+			goto exit;
+
 		break;
 	case HEADPHONE_OUT:
 		codec_dbg(codec, "%s hp\n", __func__);
-
 		snd_hda_codec_write(codec, spec->out_pins[0], 0,
 			AC_VERB_SET_EAPD_BTLENABLE, 0x00);
 
@@ -4568,7 +4538,6 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 				pin_ctl & ~PIN_HP);
 
 		/* enable headphone, either front or rear */
-
 		if (snd_hda_jack_detect(codec, spec->unsol_tag_front_hp))
 			headphone_nid = spec->out_pins[2];
 		else if (snd_hda_jack_detect(codec, spec->unsol_tag_hp))
@@ -4579,54 +4548,22 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 		snd_hda_set_pin_ctl(codec, headphone_nid,
 				    pin_ctl | PIN_HP);
 
-		if (spec->effects_switch[PLAY_ENHANCEMENT - EFFECT_START_NID])
+		if (outfx_set)
 			dspio_set_uint_param(codec, 0x80, 0x04, FLOAT_ONE);
 		else
 			dspio_set_uint_param(codec, 0x80, 0x04, FLOAT_ZERO);
 		break;
-	case SURROUND_OUT:
-		codec_dbg(codec, "%s surround\n", __func__);
-
-		/* enable line out node */
-		pin_ctl = snd_hda_codec_read(codec, spec->out_pins[0], 0,
-				AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
-		snd_hda_set_pin_ctl(codec, spec->out_pins[0],
-						pin_ctl | PIN_OUT);
-		/* Disable headphone out */
-		pin_ctl = snd_hda_codec_read(codec, spec->out_pins[1], 0,
-					AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
-		snd_hda_set_pin_ctl(codec, spec->out_pins[1],
-				    pin_ctl & ~PIN_HP);
-		/* Enable EAPD on line out */
-		snd_hda_codec_write(codec, spec->out_pins[0], 0,
-			AC_VERB_SET_EAPD_BTLENABLE, 0x01);
-		/* enable center/lfe out node */
-		pin_ctl = snd_hda_codec_read(codec, spec->out_pins[2], 0,
-					AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
-		snd_hda_set_pin_ctl(codec, spec->out_pins[2],
-				    pin_ctl | PIN_OUT);
-		/* Now set rear surround node as out. */
-		pin_ctl = snd_hda_codec_read(codec, spec->out_pins[3], 0,
-					AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
-		snd_hda_set_pin_ctl(codec, spec->out_pins[3],
-				    pin_ctl | PIN_OUT);
-
-		tmp = speaker_channel_cfgs[spec->channel_cfg_val].val;
-		dspio_set_uint_param(codec, 0x80, 0x04, tmp);
-		break;
 	}
 	/*
-	 * Surround always sets it's scp command to req 0x04 to FLOAT_EIGHT.
-	 * With this set though, X_BASS cannot be enabled. So, if we have OutFX
-	 * enabled, we need to make sure X_BASS is off, otherwise everything
-	 * sounds all muffled. Running ca0132_effects_set with X_BASS as the
-	 * effect should sort this out.
+	 * If output effects are enabled, set the X-Bass effect value again to
+	 * make sure that it's properly enabled/disabled for speaker
+	 * configurations with an LFE channel.
 	 */
-	if (spec->effects_switch[PLAY_ENHANCEMENT - EFFECT_START_NID])
+	if (outfx_set)
 		ca0132_effects_set(codec, X_BASS,
 			spec->effects_switch[X_BASS - EFFECT_START_NID]);
 
-	if (spec->cur_out_type == SURROUND_OUT)
+	if (spec->cur_out_type == SPEAKER_OUT)
 		err = ca0132_alt_surround_set_bass_redirection(codec,
 				spec->bass_redirection_val);
 	else
@@ -4646,7 +4583,7 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 			goto exit;
 	}
 
-	if (spec->cur_out_type == SURROUND_OUT)
+	if (spec->cur_out_type == SPEAKER_OUT)
 		err = ca0132_alt_set_full_range_speaker(codec);
 
 exit:
@@ -5054,7 +4991,7 @@ static int ca0132_voicefx_set(struct hda_codec *codec, int enable)
 static int ca0132_effects_set(struct hda_codec *codec, hda_nid_t nid, long val)
 {
 	struct ca0132_spec *spec = codec->spec;
-	unsigned int on, tmp;
+	unsigned int on, tmp, channel_cfg;
 	int num_fx = OUT_EFFECTS_COUNT + IN_EFFECTS_COUNT;
 	int err = 0;
 	int idx = nid - EFFECT_START_NID;
@@ -5067,8 +5004,12 @@ static int ca0132_effects_set(struct hda_codec *codec, hda_nid_t nid, long val)
 		/* if PE if off, turn off out effects. */
 		if (!spec->effects_switch[PLAY_ENHANCEMENT - EFFECT_START_NID])
 			val = 0;
-		if (spec->cur_out_type == SURROUND_OUT && nid == X_BASS)
-			val = 0;
+		if (spec->cur_out_type == SPEAKER_OUT && nid == X_BASS) {
+			channel_cfg = spec->channel_cfg_val;
+			if (channel_cfg != SPEAKER_CHANNELS_2_0 &&
+					channel_cfg != SPEAKER_CHANNELS_4_0)
+				val = 0;
+		}
 	}
 
 	/* for in effect, qualify with CrystalVoice */
@@ -5799,7 +5740,7 @@ static int ca0132_alt_speaker_channel_cfg_put(struct snd_kcontrol *kcontrol,
 
 	spec->channel_cfg_val = sel;
 
-	if (spec->out_enum_val == SURROUND_OUT)
+	if (spec->out_enum_val == SPEAKER_OUT)
 		ca0132_alt_select_out(codec);
 
 	return 1;
@@ -6121,7 +6062,7 @@ static int ca0132_switch_put(struct snd_kcontrol *kcontrol,
 
 	if (nid == SPEAKER_FULL_RANGE_FRONT || nid == SPEAKER_FULL_RANGE_REAR) {
 		spec->speaker_range_val[nid - SPEAKER_FULL_RANGE_FRONT] = *valp;
-		if (spec->cur_out_type == SURROUND_OUT)
+		if (spec->cur_out_type == SPEAKER_OUT)
 			ca0132_alt_set_full_range_speaker(codec);
 
 		changed = 0;
@@ -6129,7 +6070,7 @@ static int ca0132_switch_put(struct snd_kcontrol *kcontrol,
 
 	if (nid == BASS_REDIRECTION) {
 		spec->bass_redirection_val = *valp;
-		if (spec->cur_out_type == SURROUND_OUT)
+		if (spec->cur_out_type == SPEAKER_OUT)
 			ca0132_alt_surround_set_bass_redirection(codec, *valp);
 
 		changed = 0;
-- 
2.20.1


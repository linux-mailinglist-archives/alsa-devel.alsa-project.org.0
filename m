Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9272D3541
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 22:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A3E16FF;
	Tue,  8 Dec 2020 22:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A3E16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607462992;
	bh=C/TRUZ8SN3UO6tE4ZePl8LhTNj/1UfckflluvSFcbGw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i3xntRNcK3ZqwODC6idrVYbIcmKXrvc8GEldqpwcwJyzJRTNxw58F19a1BpbOxVxU
	 nbnXTrozupgk5p8wmppvEKrkWRlNjPuez2YSzEYNYsJT0ulthhunZK4L3+17C6Qla6
	 QJE01zQpANglwTxkfWSkUQahKHGjL38XQ9ot57iE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ED62F804EB;
	Tue,  8 Dec 2020 22:26:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1140FF804E3; Tue,  8 Dec 2020 22:26:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A96DF80253
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 22:26:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A96DF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nin7QQE8"
Received: by mail-qk1-x72e.google.com with SMTP id 143so46409qke.10
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 13:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5T57w/qT81E5tyEXIT6CUDXHzkp5L3rDJHbJUoKO/vI=;
 b=nin7QQE8YNSUVSu84uCpoXp1R15OKl9fltBiJlL6TZtuRypvuwO5Mo9xCF995wOZiQ
 v+BXxdtv22nZthrgpbSwrmFZ4hL3QxJpP2Ff7/QsuUVe2kSRIY33RIZ8h0tXEtWsAP6r
 jI3OovhQ5oD0szjBrZoJAIUv045KYigepNhwDSkFuVIWKU0zf2KJ/mz4vx5zezOFZ7/h
 kLPLlky81k9ctsv5YeRdMeOJmfXkx0V+Btes5AYmy0d4zt/ag7Ra8jzwEn0IKITa6me2
 1+2zi6VgyjPicycho7OPCNmemWLVQBhkP86ZwNrsiy7cAJQgP7ZdZDKPuKAlpNLNqcVo
 Cm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5T57w/qT81E5tyEXIT6CUDXHzkp5L3rDJHbJUoKO/vI=;
 b=Atv5eiXvG+92/NNH9HD9UKPN0u62+Vn8Igkwwg5M324bWON38RFovKcQ7sT5xIE+NH
 cnHI/oF6MLv9LfzL94Zkrat/Upy5u5UlUlJbaX/BxL+i84kUCGbivC/1q7yfqE6wusoZ
 u9AHNk2C5TqqvGi+Y2VKgtrUJtqa6ue8L1ot4qt5n1FjSsv0rQb2TmsHJ0yntJIIxHrQ
 1xhkJIoiubWtKz7gaTKdk0NX4j7yzH2jn5IZBloP4RucQAmo8L3Zin79fUVaKMLG6AD6
 fIjX+mYM/ds5CxSRT99rLbdR18n5BNBdEsV7VsM277ZO5Bkw8P1bqqylhqpvJPx1lP18
 EHaQ==
X-Gm-Message-State: AOAM531vulDiE5UfNTvWIM8Gs5GR9Hn3QKo63ehI4WDTFHcHU+szB9c1
 cEEJU7/RmuXvemS0tZgwzcA=
X-Google-Smtp-Source: ABdhPJwV5YYMsgKMW72bv3/4FPhTpA7TfyNdCpvDfxPOriMWl/UN7+6dXkeu+dGgp4KeeOwH1KT6XA==
X-Received: by 2002:a37:a5d5:: with SMTP id
 o204mr33904190qke.112.1607462789674; 
 Tue, 08 Dec 2020 13:26:29 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id l1sm16018572qkj.101.2020.12.08.13.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 13:26:29 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 5/5] ALSA: hda/ca0132 - Remove now unnecessary DSP setup
 functions.
Date: Tue,  8 Dec 2020 16:25:45 -0500
Message-Id: <20201208212546.428392-6-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208212546.428392-1-conmanx360@gmail.com>
References: <20201208212546.428392-1-conmanx360@gmail.com>
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

Now that the DSP's audio configuration is understood, remove previous
hacky methods of trying to properly configure it.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 105 -----------------------------------
 1 file changed, 105 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 12fee1146fc2..b7d36c9b28b5 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -2436,13 +2436,6 @@ static int dspio_set_uint_param(struct hda_codec *codec, int mod_id,
 			sizeof(unsigned int));
 }
 
-static int dspio_set_uint_param_no_source(struct hda_codec *codec, int mod_id,
-			int req, const unsigned int data)
-{
-	return dspio_set_param(codec, mod_id, 0x00, req, &data,
-			sizeof(unsigned int));
-}
-
 /*
  * Allocate a DSP DMA channel via an SCP message
  */
@@ -7789,24 +7782,6 @@ static void ca0132_alt_init_speaker_tuning(struct hda_codec *codec)
 				SPEAKER_TUNING_FRONT_LEFT_DELAY + i, values[i]);
 }
 
-/*
- * Creates a dummy stream to bind the output to. This seems to have to be done
- * after changing the main outputs source and destination streams.
- */
-static void ca0132_alt_create_dummy_stream(struct hda_codec *codec)
-{
-	struct ca0132_spec *spec = codec->spec;
-	unsigned int stream_format;
-
-	stream_format = snd_hdac_calc_stream_format(48000, 2,
-			SNDRV_PCM_FORMAT_S32_LE, 32, 0);
-
-	snd_hda_codec_setup_stream(codec, spec->dacs[0], spec->dsp_stream_id,
-					0, stream_format);
-
-	snd_hda_codec_cleanup_stream(codec, spec->dacs[0]);
-}
-
 /*
  * Initialize mic for non-chromebook ca0132 implementations.
  */
@@ -7848,9 +7823,6 @@ static void sbz_connect_streams(struct hda_codec *codec)
 
 	codec_dbg(codec, "Connect Streams entered, mutex locked and loaded.\n");
 
-	chipio_set_stream_channels(codec, 0x0C, 6);
-	chipio_set_stream_control(codec, 0x0C, 1);
-
 	/* This value is 0x43 for 96khz, and 0x83 for 192khz. */
 	chipio_write_no_mutex(codec, 0x18a020, 0x00000043);
 
@@ -7898,9 +7870,6 @@ static void sbz_chipio_startup_data(struct hda_codec *codec)
 		break;
 	}
 
-	chipio_set_stream_channels(codec, 0x0c, 6);
-	chipio_set_stream_control(codec, 0x0c, 1);
-
 	if (dsp_out_remap_data)
 		chipio_remap_stream(codec, dsp_out_remap_data);
 
@@ -7908,57 +7877,6 @@ static void sbz_chipio_startup_data(struct hda_codec *codec)
 	mutex_unlock(&spec->chipio_mutex);
 }
 
-/*
- * Custom DSP SCP commands where the src value is 0x00 instead of 0x20. This is
- * done after the DSP is loaded.
- */
-static void ca0132_alt_dsp_scp_startup(struct hda_codec *codec)
-{
-	struct ca0132_spec *spec = codec->spec;
-	unsigned int tmp, i;
-
-	/*
-	 * Gotta run these twice, or else mic works inconsistently. Not clear
-	 * why this is, but multiple tests have confirmed it.
-	 */
-	for (i = 0; i < 2; i++) {
-		switch (ca0132_quirk(spec)) {
-		case QUIRK_SBZ:
-		case QUIRK_AE5:
-		case QUIRK_AE7:
-			tmp = 0x00000003;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0C, tmp);
-			tmp = 0x00000000;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0A, tmp);
-			tmp = 0x00000001;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0B, tmp);
-			tmp = 0x00000004;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0C, tmp);
-			tmp = 0x00000005;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0C, tmp);
-			tmp = 0x00000000;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0C, tmp);
-			break;
-		case QUIRK_R3D:
-		case QUIRK_R3DI:
-			tmp = 0x00000000;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0A, tmp);
-			tmp = 0x00000001;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0B, tmp);
-			tmp = 0x00000004;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0C, tmp);
-			tmp = 0x00000005;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0C, tmp);
-			tmp = 0x00000000;
-			dspio_set_uint_param_no_source(codec, 0x80, 0x0C, tmp);
-			break;
-		default:
-			break;
-		}
-		msleep(100);
-	}
-}
-
 static void ca0132_alt_dsp_initial_mic_setup(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
@@ -8076,9 +7994,6 @@ static void ae5_post_dsp_stream_setup(struct hda_codec *codec)
 
 	chipio_set_conn_rate_no_mutex(codec, 0x70, SR_96_000);
 
-	chipio_set_stream_channels(codec, 0x0C, 6);
-	chipio_set_stream_control(codec, 0x0C, 1);
-
 	chipio_set_stream_source_dest(codec, 0x5, 0x43, 0x0);
 
 	chipio_set_stream_source_dest(codec, 0x18, 0x9, 0xd0);
@@ -8136,9 +8051,6 @@ static void ae7_post_dsp_setup_ports(struct hda_codec *codec)
 
 	mutex_lock(&spec->chipio_mutex);
 
-	chipio_set_stream_channels(codec, 0x0c, 6);
-	chipio_set_stream_control(codec, 0x0c, 1);
-
 	/* Seems to share the same port remapping as the SBZ. */
 	chipio_remap_stream(codec, &stream_remap_data[1]);
 
@@ -8164,8 +8076,6 @@ static void ae7_post_dsp_asi_stream_setup(struct hda_codec *codec)
 	ca0113_mmio_command_set(codec, 0x30, 0x2b, 0x00);
 
 	chipio_set_conn_rate_no_mutex(codec, 0x70, SR_96_000);
-	chipio_set_stream_channels(codec, 0x0c, 6);
-	chipio_set_stream_control(codec, 0x0c, 1);
 
 	chipio_set_stream_source_dest(codec, 0x05, 0x43, 0x00);
 	chipio_set_stream_source_dest(codec, 0x18, 0x09, 0xd0);
@@ -8372,7 +8282,6 @@ static void r3d_setup_defaults(struct hda_codec *codec)
 	if (spec->dsp_state != DSP_DOWNLOADED)
 		return;
 
-	ca0132_alt_dsp_scp_startup(codec);
 	ca0132_alt_init_analog_mics(codec);
 	ca0132_alt_start_dsp_audio_streams(codec);
 
@@ -8423,15 +8332,11 @@ static void sbz_setup_defaults(struct hda_codec *codec)
 	if (spec->dsp_state != DSP_DOWNLOADED)
 		return;
 
-	ca0132_alt_dsp_scp_startup(codec);
 	ca0132_alt_init_analog_mics(codec);
 	ca0132_alt_start_dsp_audio_streams(codec);
 	sbz_connect_streams(codec);
 	sbz_chipio_startup_data(codec);
 
-	chipio_set_stream_control(codec, 0x03, 1);
-	chipio_set_stream_control(codec, 0x04, 1);
-
 	/*
 	 * Sets internal input loopback to off, used to have a switch to
 	 * enable input loopback, but turned out to be way too buggy.
@@ -8466,8 +8371,6 @@ static void sbz_setup_defaults(struct hda_codec *codec)
 	}
 
 	ca0132_alt_init_speaker_tuning(codec);
-
-	ca0132_alt_create_dummy_stream(codec);
 }
 
 /*
@@ -8483,11 +8386,8 @@ static void ae5_setup_defaults(struct hda_codec *codec)
 	if (spec->dsp_state != DSP_DOWNLOADED)
 		return;
 
-	ca0132_alt_dsp_scp_startup(codec);
 	ca0132_alt_init_analog_mics(codec);
 	ca0132_alt_start_dsp_audio_streams(codec);
-	chipio_set_stream_control(codec, 0x03, 1);
-	chipio_set_stream_control(codec, 0x04, 1);
 
 	/* New, unknown SCP req's */
 	tmp = FLOAT_ZERO;
@@ -8536,8 +8436,6 @@ static void ae5_setup_defaults(struct hda_codec *codec)
 	}
 
 	ca0132_alt_init_speaker_tuning(codec);
-
-	ca0132_alt_create_dummy_stream(codec);
 }
 
 /*
@@ -8553,7 +8451,6 @@ static void ae7_setup_defaults(struct hda_codec *codec)
 	if (spec->dsp_state != DSP_DOWNLOADED)
 		return;
 
-	ca0132_alt_dsp_scp_startup(codec);
 	ca0132_alt_init_analog_mics(codec);
 	ca0132_alt_start_dsp_audio_streams(codec);
 	ae7_post_dsp_setup_ports(codec);
@@ -8622,8 +8519,6 @@ static void ae7_setup_defaults(struct hda_codec *codec)
 	}
 
 	ca0132_alt_init_speaker_tuning(codec);
-
-	ca0132_alt_create_dummy_stream(codec);
 }
 
 /*
-- 
2.25.1


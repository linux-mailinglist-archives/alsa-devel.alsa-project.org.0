Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2396D743DD7
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 16:48:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10DD593A;
	Fri, 30 Jun 2023 16:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10DD593A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688136480;
	bh=Dy7OEeb9uhMqoSQ1NszHwiAzSl4oYFkpfvoQ3cmb4SY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nl7RwAjUST5tHnMkDLjGt02ct9A21l2bJba31VfEFjbc0xeZcCMERJbWipJERyIME
	 RBgXIbVL3o5TDSxLhIsTMiDbeNezAVvxB+g/V6meVXAlf2ukJ8a6ELHRTOmyOQQxR1
	 uzQIfjGHntjToW31yTNS/OX8LA1EOMRnU0XkhN2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02DACF805A8; Fri, 30 Jun 2023 16:46:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F433F80589;
	Fri, 30 Jun 2023 16:46:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6843AF80558; Fri, 30 Jun 2023 16:46:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D80CAF80431
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 16:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D80CAF80431
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9CDDF242ED;
	Fri, 30 Jun 2023 10:45:43 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1qFFNX-mnR-00; Fri, 30 Jun 2023 16:45:43 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 4/8] ALSA: emu10k1: make playback in E-MU D.A.S. mode
 32-bit
Date: Fri, 30 Jun 2023 16:45:38 +0200
Message-Id: <20230630144542.664190-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
References: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MXEXJ755RFVL2LUIGIDWSAJRIIVGC2NL
X-Message-ID-Hash: MXEXJ755RFVL2LUIGIDWSAJRIIVGC2NL
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXEXJ755RFVL2LUIGIDWSAJRIIVGC2NL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Each channel now uses a stereo voice pair. But the FX send amounts and
attenuation are per voice, so we have to use fixed values tuned to the
DSP code to avoid messing up the split samples.

As "regular" mode allows manipulating the amounts and att'n via mixer
controls, we can either:
- "Fake" them with DSP code, which doesn't seem worth the bother
- Ignore them, which doesn't seem very nice

So 32-bit playback simply remains unavailable in non-D.A.S. mode.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c  | 18 ++++++++++-----
 sound/pci/emu10k1/emupcm.c | 46 +++++++++++++++++++++++++-------------
 2 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 428ae365eb99..103cb35b39e0 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1290,7 +1290,8 @@ static int _snd_emu10k1_das_init_efx(struct snd_emu10k1 *emu)
 {
 	enum {
 		ENUM_GPR(bit_shifter16, 1),
-		ENUM_GPR(tmp, 1),
+		ENUM_GPR(lowword_mask, 1),
+		ENUM_GPR(tmp, 2),
 		num_static_gprs
 	};
 	int gpr = num_static_gprs;
@@ -1321,10 +1322,14 @@ static int _snd_emu10k1_das_init_efx(struct snd_emu10k1 *emu)
 
 	gpr_map = icode->gpr_map;
 	gpr_map[bit_shifter16] = 0x00008000;
+	gpr_map[lowword_mask] = 0x0000ffff;
 
 	if (emu->card_capabilities->ca0108_chip) {
-		for (int z = 0; z < 16; z++)
-			A_OP(icode, &ptr, iMACINT0, A3_EMU32OUT(z), A_C_00000000, A_FXBUS(z), A_C_00000002);
+		for (int z = 0; z < 16; z++) {
+			A_OP(icode, &ptr, iMAC0, A_GPR(tmp), A_C_00000000, A_FXBUS(z * 2), A_C_00010000); // >> 15
+			A_OP(icode, &ptr, iMACINT0, A_GPR(tmp + 1), A_C_00000000, A_FXBUS(z * 2 + 1), A_C_00000002); // << 1
+			A_OP(icode, &ptr, iANDXOR, A3_EMU32OUT(z), A_GPR(tmp), A_GPR(lowword_mask), A_GPR(tmp + 1));
+		}
 
 		snd_emu10k1_audigy_dsp_convert_32_to_2x16(
 			icode, &ptr, tmp, bit_shifter16, A3_EMU32IN(0), A_EXTOUT(0));
@@ -1337,8 +1342,11 @@ static int _snd_emu10k1_das_init_efx(struct snd_emu10k1 *emu)
 			gpr_map[gpr++] = 0x00000000;
 		}
 	} else {
-		for (int z = 0; z < 16; z++)
-			A_OP(icode, &ptr, iMACINT0, A_EMU32OUTL(z), A_C_00000000, A_FXBUS(z), A_C_00000002);
+		for (int z = 0; z < 16; z++) {
+			A_OP(icode, &ptr, iMAC0, A_GPR(tmp), A_C_00000000, A_FXBUS(z * 2), A_C_00010000); // >> 15
+			A_OP(icode, &ptr, iMACINT0, A_GPR(tmp + 1), A_C_00000000, A_FXBUS(z * 2 + 1), A_C_00000002); // << 1
+			A_OP(icode, &ptr, iANDXOR, A_EMU32OUTL(z), A_GPR(tmp), A_GPR(lowword_mask), A_GPR(tmp + 1));
+		}
 
 		/* Note that the Alice2 DSPs have 6 I2S inputs which we don't use. */
 		snd_emu10k1_audigy_dsp_convert_32_to_2x16(
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index bd222de7ea9f..7aed356637ab 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -366,13 +366,16 @@ static void snd_emu10k1_pcm_init_das_voices(struct snd_emu10k1 *emu,
 					    unsigned char channel)
 {
 	static const unsigned char send_amount[8] = { 255, 0, 0, 0, 0, 0, 0, 0 };
-	unsigned char send_routing[8];
+	unsigned char send_routing[9];
 
 	for (int i = 0; i < ARRAY_SIZE(send_routing); i++)
 		send_routing[i] = (channel + i) % NUM_G;
-	snd_emu10k1_pcm_init_voice(emu, evoice, true, false,
+	snd_emu10k1_pcm_init_voice(emu, evoice, true, true,
 				   start_addr, end_addr,
 				   send_routing, send_amount);
+	snd_emu10k1_pcm_init_voice(emu, evoice + 1, true, true,
+				   start_addr, end_addr,
+				   send_routing + 1, send_amount);
 }
 
 static void snd_emu10k1_pcm_init_extra_voice(struct snd_emu10k1 *emu,
@@ -406,7 +409,7 @@ static int snd_emu10k1_playback_hw_params(struct snd_pcm_substream *substream,
 	} else {
 		type = EMU10K1_EFX;
 		channels = params_channels(hw_params);
-		count = 1;
+		count = 1 + emu->das_mode;
 	}
 	err = snd_emu10k1_pcm_channel_alloc(epcm, type, count, channels);
 	if (err < 0)
@@ -509,15 +512,17 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	snd_emu10k1_pcm_init_extra_voice(emu, epcm->extra, true,
 					 start_addr, start_addr + extra_size);
 
-	epcm->ccca_start_addr = start_addr;
 	if (das_mode) {
+		start_addr >>= 1;
+		epcm->ccca_start_addr = start_addr;
 		for (i = 0; i < runtime->channels; i++) {
 			snd_emu10k1_pcm_init_das_voices(emu, epcm->voices[i],
 							start_addr, start_addr + channel_size,
-							i);
+							i * 2);
 			start_addr += channel_size;
 		}
 	} else {
+		epcm->ccca_start_addr = start_addr;
 		for (i = 0; i < runtime->channels; i++) {
 			snd_emu10k1_pcm_init_voices(emu, epcm->voices[i], true, false,
 						    start_addr, start_addr + channel_size,
@@ -722,6 +727,7 @@ static void snd_emu10k1_playback_unmute_das_voices(struct snd_emu10k1 *emu,
 						   struct snd_emu10k1_voice *evoice)
 {
 	snd_emu10k1_playback_commit_volume(emu, evoice, 0x8000 << 16);
+	snd_emu10k1_playback_commit_volume(emu, evoice + 1, 0x8000 << 16);
 }
 
 static void snd_emu10k1_playback_mute_voice(struct snd_emu10k1 *emu,
@@ -936,24 +942,29 @@ static snd_pcm_uframes_t snd_emu10k1_playback_pointer(struct snd_pcm_substream *
 }
 
 static u64 snd_emu10k1_efx_playback_voice_mask(struct snd_emu10k1_pcm *epcm,
-					       int channels)
+					       bool stereo, int channels)
 {
 	u64 mask = 0;
+	u64 mask0 = (1 << (1 << stereo)) - 1;
 
 	for (int i = 0; i < channels; i++) {
 		int voice = epcm->voices[i]->number;
-		mask |= 1ULL << voice;
+		mask |= mask0 << voice;
 	}
 	return mask;
 }
 
 static void snd_emu10k1_efx_playback_freeze_voices(struct snd_emu10k1 *emu,
 						   struct snd_emu10k1_pcm *epcm,
-						   int channels)
+						   bool stereo, int channels)
 {
 	for (int i = 0; i < channels; i++) {
 		int voice = epcm->voices[i]->number;
 		snd_emu10k1_ptr_write(emu, CPF_STOP, voice, 1);
+		if (stereo) {
+			// Weirdly enough, the stereo slave needs to be stopped separately
+			snd_emu10k1_ptr_write(emu, CPF_STOP, voice + 1, 1);
+		}
 		snd_emu10k1_playback_commit_pitch(emu, voice, PITCH_48000 << 16);
 	}
 }
@@ -977,14 +988,14 @@ static void snd_emu10k1_efx_playback_unmute_das_voices(struct snd_emu10k1 *emu,
 
 static void snd_emu10k1_efx_playback_stop_voices(struct snd_emu10k1 *emu,
 						 struct snd_emu10k1_pcm *epcm,
-						 int channels)
+						 bool stereo, int channels)
 {
 	for (int i = 0; i < channels; i++)
 		snd_emu10k1_playback_stop_voice(emu, epcm->voices[i]);
 	snd_emu10k1_playback_set_stopped(emu, epcm);
 
 	for (int i = 0; i < channels; i++)
-		snd_emu10k1_playback_mute_voice(emu, epcm->voices[i]);
+		snd_emu10k1_playback_mute_voices(emu, epcm->voices[i], stereo);
 }
 
 static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
@@ -1003,15 +1014,15 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		mask = snd_emu10k1_efx_playback_voice_mask(
-				epcm, runtime->channels);
+				epcm, das_mode, runtime->channels);
 		for (int i = 0; i < 10; i++) {
 			// Note that the freeze is not interruptible, so we make no
 			// effort to reset the bits outside the error handling here.
 			snd_emu10k1_voice_set_loop_stop_multiple(emu, mask);
 			snd_emu10k1_efx_playback_freeze_voices(
-					emu, epcm, runtime->channels);
+					emu, epcm, das_mode, runtime->channels);
 			snd_emu10k1_playback_prepare_voices(
-					emu, epcm, true, false, runtime->channels);
+					emu, epcm, true, das_mode, runtime->channels);
 
 			// It might seem to make more sense to unmute the voices only after
 			// they have been started, to potentially avoid torturing the speakers
@@ -1033,7 +1044,7 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 			}
 
 			snd_emu10k1_efx_playback_stop_voices(
-					emu, epcm, runtime->channels);
+					emu, epcm, das_mode, runtime->channels);
 
 			if (result != -EAGAIN)
 				break;
@@ -1046,7 +1057,7 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
 		snd_emu10k1_efx_playback_stop_voices(
-				emu, epcm, runtime->channels);
+				emu, epcm, das_mode, runtime->channels);
 
 		epcm->resume_pos = snd_emu10k1_playback_pointer(substream);
 		break;
@@ -1232,8 +1243,11 @@ static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_efx_playback;
-	if (emu->card_capabilities->emu_model)
+	if (emu->card_capabilities->emu_model) {
 		snd_emu1010_constrain_efx_rate(emu, runtime);
+		if (emu->das_mode)
+			runtime->hw.formats = SNDRV_PCM_FMTBIT_S32_LE;
+	}
 	err = snd_emu10k1_playback_set_constraints(runtime);
 	if (err < 0) {
 		kfree(epcm);
-- 
2.40.0.152.g15d061e6df


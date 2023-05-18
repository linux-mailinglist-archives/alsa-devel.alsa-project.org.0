Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A77083B6
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C708420C;
	Thu, 18 May 2023 16:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C708420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684419178;
	bh=rTbwgxGmFhLBgXhjNasl/6vRTxUlIqBhzpA2WuRFo98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g1N/d5hNLTgjRVnH/fkcJj/mNKtP7QWtU9ubOnBuujcHjXWarZxk4q0DpOc+CliiU
	 kK3cQlpGfhqiSp2c8TWM0XGGoAE525wPYzjmgWdbVFeue/iOW90GMav4a/TFztIpqO
	 28kg9K3kCWL8pi5pybwgnTfXmsp8CVUhBHiD6BpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A3B1F805D3; Thu, 18 May 2023 16:10:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 757D5F805C9;
	Thu, 18 May 2023 16:10:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 187BCF8057F; Thu, 18 May 2023 16:10:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94AB5F80542
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94AB5F80542
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9534A24125;
	Thu, 18 May 2023 10:09:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeKB-d9w-00; Thu, 18 May 2023 16:09:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 7/7] ALSA: emu10k1: revamp playback voice allocator
Date: Thu, 18 May 2023 16:09:47 +0200
Message-Id: <20230518140947.3725394-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UBIZMAJMW3WSXNWLO5URXUYO3JRDEPDU
X-Message-ID-Hash: UBIZMAJMW3WSXNWLO5URXUYO3JRDEPDU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UBIZMAJMW3WSXNWLO5URXUYO3JRDEPDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of separate voices, we now allocate non-interleaved channels,
which may in turn contain two interleaved voices each. The higher-level
code keeps only one pointer per channel. The channels are not allocated
in one block any more, as there is no reason to do that. As a
consequence of that, and because it is cleaner regardless, we now let
the allocator store these pointers at a specified location, rather than
returning only the first one and having the calling code deduce the
remaining ones.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h              |   3 +-
 sound/pci/emu10k1/emu10k1_callback.c |   2 +-
 sound/pci/emu10k1/emumixer.c         |  24 +++---
 sound/pci/emu10k1/emupcm.c           |  44 ++++++-----
 sound/pci/emu10k1/emuproc.c          |   5 +-
 sound/pci/emu10k1/voice.c            | 110 ++++++++++++++-------------
 6 files changed, 97 insertions(+), 91 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 42959ba9c9f4..50fb242656f7 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1452,6 +1452,7 @@ struct snd_emu10k1_voice {
 	unsigned char number;
 	unsigned char use;
 	unsigned char dirty;
+	unsigned char last;
 	void (*interrupt)(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *pvoice);
 
 	struct snd_emu10k1_pcm *epcm;
@@ -1848,7 +1849,7 @@ int snd_emu10k1_synth_copy_from_user(struct snd_emu10k1 *emu, struct snd_util_me
 int snd_emu10k1_memblk_map(struct snd_emu10k1 *emu, struct snd_emu10k1_memblk *blk);
 
 /* voice allocation */
-int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int pair,
+int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int count, int channels,
 			    struct snd_emu10k1_pcm *epcm, struct snd_emu10k1_voice **rvoice);
 int snd_emu10k1_voice_free(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *pvoice);
 
diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index e256d3c22ee4..5691f2b610c4 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -282,7 +282,7 @@ get_voice(struct snd_emux *emu, struct snd_emux_port *port)
 			if (vp->ch < 0) {
 				/* allocate a voice */
 				struct snd_emu10k1_voice *hwvoice;
-				if (snd_emu10k1_voice_alloc(hw, EMU10K1_SYNTH, 1, NULL, &hwvoice) < 0 || hwvoice == NULL)
+				if (snd_emu10k1_voice_alloc(hw, EMU10K1_SYNTH, 1, 1, NULL, &hwvoice) < 0)
 					continue;
 				vp->ch = hwvoice->number;
 				emu->num_voices++;
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 183051e846f2..a7dd88404ae1 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1467,13 +1467,13 @@ static int snd_emu10k1_send_routing_put(struct snd_kcontrol *kcontrol,
 				change = 1;
 			}
 		}	
-	if (change && mix->epcm) {
-		if (mix->epcm->voices[0] && mix->epcm->voices[1]) {
+	if (change && mix->epcm && mix->epcm->voices[0]) {
+		if (!mix->epcm->voices[0]->last) {
 			update_emu10k1_fxrt(emu, mix->epcm->voices[0]->number,
 					    &mix->send_routing[1][0]);
-			update_emu10k1_fxrt(emu, mix->epcm->voices[1]->number,
+			update_emu10k1_fxrt(emu, mix->epcm->voices[0]->number + 1,
 					    &mix->send_routing[2][0]);
-		} else if (mix->epcm->voices[0]) {
+		} else {
 			update_emu10k1_fxrt(emu, mix->epcm->voices[0]->number,
 					    &mix->send_routing[0][0]);
 		}
@@ -1535,13 +1535,13 @@ static int snd_emu10k1_send_volume_put(struct snd_kcontrol *kcontrol,
 			change = 1;
 		}
 	}
-	if (change && mix->epcm) {
-		if (mix->epcm->voices[0] && mix->epcm->voices[1]) {
+	if (change && mix->epcm && mix->epcm->voices[0]) {
+		if (!mix->epcm->voices[0]->last) {
 			update_emu10k1_send_volume(emu, mix->epcm->voices[0]->number,
 						   &mix->send_volume[1][0]);
-			update_emu10k1_send_volume(emu, mix->epcm->voices[1]->number,
+			update_emu10k1_send_volume(emu, mix->epcm->voices[0]->number + 1,
 						   &mix->send_volume[2][0]);
-		} else if (mix->epcm->voices[0]) {
+		} else {
 			update_emu10k1_send_volume(emu, mix->epcm->voices[0]->number,
 						   &mix->send_volume[0][0]);
 		}
@@ -1601,11 +1601,11 @@ static int snd_emu10k1_attn_put(struct snd_kcontrol *kcontrol,
 			change = 1;
 		}
 	}
-	if (change && mix->epcm) {
-		if (mix->epcm->voices[0] && mix->epcm->voices[1]) {
+	if (change && mix->epcm && mix->epcm->voices[0]) {
+		if (!mix->epcm->voices[0]->last) {
 			snd_emu10k1_ptr_write(emu, VTFT_VOLUMETARGET, mix->epcm->voices[0]->number, mix->attn[1]);
-			snd_emu10k1_ptr_write(emu, VTFT_VOLUMETARGET, mix->epcm->voices[1]->number, mix->attn[2]);
-		} else if (mix->epcm->voices[0]) {
+			snd_emu10k1_ptr_write(emu, VTFT_VOLUMETARGET, mix->epcm->voices[0]->number + 1, mix->attn[2]);
+		} else {
 			snd_emu10k1_ptr_write(emu, VTFT_VOLUMETARGET, mix->epcm->voices[0]->number, mix->attn[0]);
 		}
 	}
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 8bf0a4d8aaf1..ab3f81dd439e 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -86,32 +86,26 @@ static void snd_emu10k1_pcm_free_voices(struct snd_emu10k1_pcm *epcm)
 	}
 }
 
-static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voices)
+static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm *epcm,
+					 int type, int count, int channels)
 {
-	int err, i;
+	int err;
 
 	snd_emu10k1_pcm_free_voices(epcm);
 
 	err = snd_emu10k1_voice_alloc(epcm->emu,
-				      epcm->type == PLAYBACK_EMUVOICE ? EMU10K1_PCM : EMU10K1_EFX,
-				      voices,
+				      type, count, channels,
 				      epcm, &epcm->voices[0]);
-	
 	if (err < 0)
 		return err;
-	if (voices > 1) {
-		for (i = 1; i < voices; i++) {
-			epcm->voices[i] = &epcm->emu->voices[(epcm->voices[0]->number + i) % NUM_G];
-		}
-	}
+
 	if (epcm->extra == NULL) {
 		// The hardware supports only (half-)loop interrupts, so to support an
 		// arbitrary number of periods per buffer, we use an extra voice with a
 		// period-sized loop as the interrupt source. Additionally, the interrupt
 		// timing of the hardware is "suboptimal" and needs some compensation.
 		err = snd_emu10k1_voice_alloc(epcm->emu,
-					      epcm->type == PLAYBACK_EMUVOICE ? EMU10K1_PCM_IRQ : EMU10K1_EFX_IRQ,
-					      1,
+					      type + 1, 1, 1,
 					      epcm, &epcm->extra);
 		if (err < 0) {
 			/*
@@ -308,9 +302,19 @@ static int snd_emu10k1_playback_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
 	size_t alloc_size;
+	int type, channels, count;
 	int err;
 
-	err = snd_emu10k1_pcm_channel_alloc(epcm, params_channels(hw_params));
+	if (epcm->type == PLAYBACK_EMUVOICE) {
+		type = EMU10K1_PCM;
+		channels = 1;
+		count = params_channels(hw_params);
+	} else {
+		type = EMU10K1_EFX;
+		channels = params_channels(hw_params);
+		count = 1;
+	}
+	err = snd_emu10k1_pcm_channel_alloc(epcm, type, count, channels);
 	if (err < 0)
 		return err;
 
@@ -380,8 +384,8 @@ static int snd_emu10k1_playback_prepare(struct snd_pcm_substream *substream)
 	snd_emu10k1_pcm_init_voice(emu, 1, 0, epcm->voices[0], w_16, stereo,
 				   start_addr, end_addr,
 				   &emu->pcm_mixer[substream->number]);
-	if (epcm->voices[1])
-		snd_emu10k1_pcm_init_voice(emu, 0, 0, epcm->voices[1], w_16, true,
+	if (stereo)
+		snd_emu10k1_pcm_init_voice(emu, 0, 0, epcm->voices[0] + 1, w_16, true,
 					   start_addr, end_addr,
 					   &emu->pcm_mixer[substream->number]);
 	return 0;
@@ -572,18 +576,14 @@ static void snd_emu10k1_playback_unmute_voice(struct snd_emu10k1 *emu,
 	unsigned int vattn;
 	unsigned int tmp;
 
-	if (evoice == NULL)	/* skip second voice for mono */
-		return;
 	tmp = stereo ? (master ? 1 : 2) : 0;
 	vattn = mix->attn[tmp] << 16;
 	snd_emu10k1_playback_commit_volume(emu, evoice, vattn);
 }	
 
 static void snd_emu10k1_playback_mute_voice(struct snd_emu10k1 *emu,
 					    struct snd_emu10k1_voice *evoice)
 {
-	if (evoice == NULL)
-		return;
 	snd_emu10k1_playback_commit_volume(emu, evoice, 0);
 }
 
@@ -655,19 +655,21 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 		mix = &emu->pcm_mixer[substream->number];
 		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[0], stereo, true, mix);
-		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[1], stereo, false, mix);
+		if (stereo)
+			snd_emu10k1_playback_unmute_voice(emu, epcm->voices[0] + 1, true, false, mix);
 		snd_emu10k1_playback_set_running(emu, epcm);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0]);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		snd_emu10k1_playback_stop_voice(emu, epcm->voices[0]);
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
 		snd_emu10k1_playback_set_stopped(emu, epcm);
 		snd_emu10k1_playback_mute_voice(emu, epcm->voices[0]);
-		snd_emu10k1_playback_mute_voice(emu, epcm->voices[1]);
+		if (stereo)
+			snd_emu10k1_playback_mute_voice(emu, epcm->voices[0] + 1);
 		break;
 	default:
 		result = -EINVAL;
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index abcec8a01760..89ea3adff322 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -372,12 +372,13 @@ static void snd_emu10k1_proc_voices_read(struct snd_info_entry *entry,
 	};
 	static_assert(ARRAY_SIZE(types) == EMU10K1_NUM_TYPES);
 
-	snd_iprintf(buffer, "ch\tdirty\tuse\n");
+	snd_iprintf(buffer, "ch\tdirty\tlast\tuse\n");
 	for (idx = 0; idx < NUM_G; idx++) {
 		voice = &emu->voices[idx];
-		snd_iprintf(buffer, "%i\t%u\t%s\n",
+		snd_iprintf(buffer, "%i\t%u\t%u\t%s\n",
 			idx,
 			voice->dirty,
+			voice->last,
 			types[voice->use]);
 	}
 }
diff --git a/sound/pci/emu10k1/voice.c b/sound/pci/emu10k1/voice.c
index 6c58e3bd14f7..6939498e26f0 100644
--- a/sound/pci/emu10k1/voice.c
+++ b/sound/pci/emu10k1/voice.c
@@ -23,103 +23,101 @@
  * allocator uses a round robin scheme.  The next free voice is tracked in 
  * the card record and each allocation begins where the last left off.  The 
  * hardware requires stereo interleaved voices be aligned to an even/odd 
- * boundary.  For multichannel voice allocation we ensure than the block of 
- * voices does not cross the 32 voice boundary.  This simplifies the 
- * multichannel support and ensures we can use a single write to the 
- * (set|clear)_loop_stop registers.  Otherwise (for example) the voices would 
- * get out of sync when pausing/resuming a stream.
+ * boundary.
  *							--rlrevell
  */
 
 static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 		       struct snd_emu10k1_pcm *epcm, struct snd_emu10k1_voice **rvoice)
 {
 	struct snd_emu10k1_voice *voice;
-	int i, j, k, first_voice, last_voice, skip;
+	int i, j, k, skip;
 
-	*rvoice = NULL;
-	first_voice = last_voice = 0;
-	for (i = emu->next_free_voice, j = 0; j < NUM_G ; i += number, j += number) {
+	for (i = emu->next_free_voice, j = 0; j < NUM_G; i = (i + skip) % NUM_G, j += skip) {
 		/*
 		dev_dbg(emu->card->dev, "i %d j %d next free %d!\n",
 		       i, j, emu->next_free_voice);
 		*/
-		i %= NUM_G;
 
 		/* stereo voices must be even/odd */
-		if ((number == 2) && (i % 2)) {
-			i++;
+		if ((number > 1) && (i % 2)) {
+			skip = 1;
 			continue;
 		}
-			
-		skip = 0;
+
 		for (k = 0; k < number; k++) {
-			voice = &emu->voices[(i+k) % NUM_G];
+			voice = &emu->voices[i + k];
 			if (voice->use) {
-				skip = 1;
-				break;
+				skip = k + 1;
+				goto next;
 			}
 		}
-		if (!skip) {
-			/* dev_dbg(emu->card->dev, "allocated voice %d\n", i); */
-			first_voice = i;
-			last_voice = (i + number) % NUM_G;
-			emu->next_free_voice = last_voice;
-			break;
+
+		for (k = 0; k < number; k++) {
+			voice = &emu->voices[i + k];
+			voice->use = type;
+			voice->epcm = epcm;
+			/* dev_dbg(emu->card->dev, "allocated voice %d\n", i + k); */
 		}
+		voice->last = 1;
+
+		*rvoice = &emu->voices[i];
+		emu->next_free_voice = (i + number) % NUM_G;
+		return 0;
+
+	next: ;
 	}
-	
-	if (first_voice == last_voice)
-		return -ENOMEM;
-	
-	for (i = 0; i < number; i++) {
-		voice = &emu->voices[(first_voice + i) % NUM_G];
-		/*
-		dev_dbg(emu->card->dev, "voice alloc - %i, %i of %i\n",
-		       voice->number, idx-first_voice+1, number);
-		*/
-		voice->use = type;
-		voice->epcm = epcm;
-	}
-	*rvoice = &emu->voices[first_voice];
-	return 0;
+	return -ENOMEM;  // -EBUSY would have been better
 }
 
 static void voice_free(struct snd_emu10k1 *emu,
 		       struct snd_emu10k1_voice *pvoice)
 {
 	if (pvoice->dirty)
 		snd_emu10k1_voice_init(emu, pvoice->number);
 	pvoice->interrupt = NULL;
-	pvoice->use = pvoice->dirty = 0;
+	pvoice->use = pvoice->dirty = pvoice->last = 0;
 	pvoice->epcm = NULL;
 }
 
-int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int number,
+int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int count, int channels,
 			    struct snd_emu10k1_pcm *epcm, struct snd_emu10k1_voice **rvoice)
 {
 	unsigned long flags;
 	int result;
 
 	if (snd_BUG_ON(!rvoice))
 		return -EINVAL;
-	if (snd_BUG_ON(!number))
+	if (snd_BUG_ON(!count))
+		return -EINVAL;
+	if (snd_BUG_ON(!channels))
 		return -EINVAL;
 
 	spin_lock_irqsave(&emu->voice_lock, flags);
-	for (;;) {
-		result = voice_alloc(emu, type, number, epcm, rvoice);
-		if (result == 0 || type == EMU10K1_SYNTH)
-			break;
-
-		/* free a voice from synth */
-		if (emu->get_synth_voice) {
-			result = emu->get_synth_voice(emu);
-			if (result >= 0)
-				voice_free(emu, &emu->voices[result]);
+	for (int got = 0; got < channels; ) {
+		result = voice_alloc(emu, type, count, epcm, &rvoice[got]);
+		if (result == 0) {
+			got++;
+			/*
+			dev_dbg(emu->card->dev, "voice alloc - %i, %i of %i\n",
+			        rvoice[got - 1]->number, got, want);
+			*/
+			continue;
 		}
-		if (result < 0)
-			break;
+		if (type != EMU10K1_SYNTH && emu->get_synth_voice) {
+			/* free a voice from synth */
+			result = emu->get_synth_voice(emu);
+			if (result >= 0) {
+				voice_free(emu, &emu->voices[result]);
+				continue;
+			}
+		}
+		for (int i = 0; i < got; i++) {
+			for (int j = 0; j < count; j++)
+				voice_free(emu, rvoice[i] + j);
+			rvoice[i] = NULL;
+		}
+		break;
 	}
 	spin_unlock_irqrestore(&emu->voice_lock, flags);
 
@@ -132,11 +130,15 @@ int snd_emu10k1_voice_free(struct snd_emu10k1 *emu,
 			   struct snd_emu10k1_voice *pvoice)
 {
 	unsigned long flags;
+	int last;
 
 	if (snd_BUG_ON(!pvoice))
 		return -EINVAL;
 	spin_lock_irqsave(&emu->voice_lock, flags);
-	voice_free(emu, pvoice);
+	do {
+		last = pvoice->last;
+		voice_free(emu, pvoice++);
+	} while (!last);
 	spin_unlock_irqrestore(&emu->voice_lock, flags);
 	return 0;
 }
-- 
2.40.0.152.g15d061e6df


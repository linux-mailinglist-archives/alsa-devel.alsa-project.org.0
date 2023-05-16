Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD470498D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DD8B826;
	Tue, 16 May 2023 11:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DD8B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684230118;
	bh=BrKjLdm7spketimLtsMja5MNE0nD+rtFuPboXA15cyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZnyIjqbv+LSN/A5KSxEpgiA3raPy1VUeHdzHFOTWoO+gyoR2fMVYRvpPEcm4hrxd0
	 +/wb8ta+cI2jGvxAPo6d/ozq6fcuLaX8geXi2mSLjHxyHpqbv+v9XyEYA8AKrQzanl
	 /8M5p1cxXWHx3bjT/UnN5Zs56TgkYesDmU0Y3rX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 187E5F80637; Tue, 16 May 2023 11:37:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78A44F80631;
	Tue, 16 May 2023 11:37:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01D38F80571; Tue, 16 May 2023 11:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E02CF80544
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E02CF80544
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D7F1624285;
	Tue, 16 May 2023 05:36:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q0G-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 5/6] ALSA: emu10k1: skip needless setting of some voice
 registers
Date: Tue, 16 May 2023 11:36:11 +0200
Message-Id: <20230516093612.3536451-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 33L7IHJ77MQZTXFHHCYERSBOMGKU242B
X-Message-ID-Hash: 33L7IHJ77MQZTXFHHCYERSBOMGKU242B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33L7IHJ77MQZTXFHHCYERSBOMGKU242B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many registers are meaningless for stereo slaves and the extra voices.
This patch cleans up these unnecessary register writes.

snd_emu10k1_playback_{trigger,stop}_voice() is not called for stereo
slaves any more.

snd_emu10k1_playback_prepare_voice() is renamed to
snd_emu10k1_playback_unmute_voice(), as this better reflects its
remaining function. It's not called for the extra voices any more.

Accordingly, snd_emu10k1_playback_mute_voice() is factored out from
snd_emu10k1_playback_stop_voice(), and is called selectively as well.

This doesn't add conditionals which would avoid initializing
sub-registers, as that wouldn't pull its weight.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h    |  8 ++++
 sound/pci/emu10k1/emupcm.c | 89 ++++++++++++++++++++------------------
 2 files changed, 56 insertions(+), 41 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index a5e935e16651..5c1e5b123362 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -404,6 +404,14 @@ SUB_REG(HCFG, LOCKTANKCACHE,	0x00000004)	/* 1 = Cancel bustmaster accesses to ta
 //   distortion), the modulation engine sets the target registers, towards
 //   which the current registers "swerve" gradually.
 
+// For the odd channel in a stereo pair, these registers are meaningless:
+//   CPF_STEREO, CPF_CURRENTPITCH, PTRX_PITCHTARGET, CCR_CACHEINVALIDSIZE,
+//   PSST_LOOPSTARTADDR, DSL_LOOPENDADDR, CCCA_CURRADDR
+// The somewhat non-obviously still meaningful ones are:
+//   CPF_STOP, CPF_FRACADDRESS, CCR_READADDRESS (!),
+//   CCCA_INTERPROM, CCCA_8BITSELECT (!)
+// (The envelope engine is ignored here, as stereo matters only for verbatim playback.)
+
 #define CPF			0x00		/* Current pitch and fraction register			*/
 SUB_REG(CPF, CURRENTPITCH,	0xffff0000)	/* Current pitch (linear, 0x4000 == unity pitch shift) 	*/
 #define CPF_STEREO_MASK		0x00008000	/* 1 = Even channel interleave, odd channel locked	*/
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 7b0ab4e02cfd..4ade0ef2cd1b 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -301,12 +301,12 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 			start_addr += ccis;
 			end_addr += ccis + emu->delay_pcm_irq;
 		}
-		if (stereo && !extra) {
-			snd_emu10k1_ptr_write(emu, CPF, voice, CPF_STEREO_MASK);
-			snd_emu10k1_ptr_write(emu, CPF, (voice + 1), CPF_STEREO_MASK);
-		} else {
-			snd_emu10k1_ptr_write(emu, CPF, voice, 0);
-		}
+	}
+	if (stereo && !extra) {
+		// Not really necessary for the slave, but it doesn't hurt
+		snd_emu10k1_ptr_write(emu, CPF, voice, CPF_STEREO_MASK);
+	} else {
+		snd_emu10k1_ptr_write(emu, CPF, voice, 0);
 	}
 
 	/* setup routing */
@@ -325,6 +325,7 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 				      snd_emu10k1_compose_send_routing(send_routing));
 	/* Assumption that PT is already 0 so no harm overwriting */
 	snd_emu10k1_ptr_write(emu, PTRX, voice, (send_amount[0] << 8) | send_amount[1]);
+	// Stereo slaves don't need to have the addresses set, but it doesn't hurt
 	snd_emu10k1_ptr_write(emu, DSL, voice, end_addr | (send_amount[3] << 24));
 	snd_emu10k1_ptr_write(emu, PSST, voice,
 			(start_addr + (extra ? emu->delay_pcm_irq : 0)) |
@@ -554,8 +555,6 @@ static void snd_emu10k1_playback_invalidate_cache(struct snd_emu10k1 *emu, int e
 	struct snd_pcm_runtime *runtime;
 	unsigned int voice, stereo, i, ccis, cra = 64, cs, sample;
 
-	if (evoice == NULL)
-		return;
 	runtime = evoice->epcm->substream->runtime;
 	voice = evoice->number;
 	stereo = (!extra && runtime->channels == 2);
@@ -575,71 +574,79 @@ static void snd_emu10k1_playback_invalidate_cache(struct snd_emu10k1 *emu, int e
 	snd_emu10k1_ptr_write(emu, CCR_READADDRESS, voice, cra);
 	if (stereo) {
 		snd_emu10k1_ptr_write(emu, CCR_CACHEINVALIDSIZE, voice + 1, 0);
+		// The engine goes haywire if this one is out of sync
 		snd_emu10k1_ptr_write(emu, CCR_READADDRESS, voice + 1, cra);
 	}
 	/* fill cache */
 	snd_emu10k1_ptr_write(emu, CCR_CACHEINVALIDSIZE, voice, ccis);
 	if (stereo) {
 		snd_emu10k1_ptr_write(emu, CCR_CACHEINVALIDSIZE, voice+1, ccis);
 	}
 }
 
-static void snd_emu10k1_playback_prepare_voice(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *evoice,
-					       int master,
-					       struct snd_emu10k1_pcm_mixer *mix)
+static void snd_emu10k1_playback_commit_volume(struct snd_emu10k1 *emu,
+					       struct snd_emu10k1_voice *evoice,
+					       unsigned int vattn)
+{
+	snd_emu10k1_ptr_write(emu, VTFT, evoice->number, vattn | VTFT_FILTERTARGET_MASK);
+	snd_emu10k1_ptr_write(emu, CVCF, evoice->number, vattn | CVCF_CURRENTFILTER_MASK);
+}
+
+static void snd_emu10k1_playback_unmute_voice(struct snd_emu10k1 *emu,
+					      struct snd_emu10k1_voice *evoice,
+					      bool master,
+					      struct snd_emu10k1_pcm_mixer *mix)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_runtime *runtime;
 	unsigned int vattn;
-	unsigned int voice, tmp;
+	unsigned int tmp;
 
 	if (evoice == NULL)	/* skip second voice for mono */
 		return;
 	substream = evoice->epcm->substream;
 	runtime = substream->runtime;
-	voice = evoice->number;
 
 	tmp = runtime->channels == 2 ? (master ? 1 : 2) : 0;
-	vattn = mix != NULL ? (mix->attn[tmp] << 16) : 0;
-	snd_emu10k1_ptr_write(emu, VTFT, voice, vattn | VTFT_FILTERTARGET_MASK);
-	snd_emu10k1_ptr_write(emu, CVCF, voice, vattn | CVCF_CURRENTFILTER_MASK);
+	vattn = mix->attn[tmp] << 16;
+	snd_emu10k1_playback_commit_volume(emu, evoice, vattn);
 }	
 
+static void snd_emu10k1_playback_mute_voice(struct snd_emu10k1 *emu,
+					    struct snd_emu10k1_voice *evoice)
+{
+	if (evoice == NULL)
+		return;
+	snd_emu10k1_playback_commit_volume(emu, evoice, 0);
+}
+
 static void snd_emu10k1_playback_trigger_voice(struct snd_emu10k1 *emu,
-					       struct snd_emu10k1_voice *evoice,
-					       int master)
+					       struct snd_emu10k1_voice *evoice)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_runtime *runtime;
 	unsigned int voice, pitch_target;
 
-	if (evoice == NULL)	/* skip second voice for mono */
-		return;
 	substream = evoice->epcm->substream;
 	runtime = substream->runtime;
 	voice = evoice->number;
 
 	if (emu->card_capabilities->emu_model)
 		pitch_target = PITCH_48000; /* Disable interpolators on emu1010 card */
 	else 
 		pitch_target = emu10k1_calc_pitch_target(runtime->rate);
 	snd_emu10k1_ptr_write(emu, PTRX_PITCHTARGET, voice, pitch_target);
-	if (master || evoice->epcm->type == PLAYBACK_EFX)
-		snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, pitch_target);
+	snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, pitch_target);
 }
 
 static void snd_emu10k1_playback_stop_voice(struct snd_emu10k1 *emu,
 					    struct snd_emu10k1_voice *evoice)
 {
 	unsigned int voice;
 
-	if (evoice == NULL)
-		return;
 	voice = evoice->number;
 	snd_emu10k1_ptr_write(emu, PTRX_PITCHTARGET, voice, 0);
 	snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, 0);
-	snd_emu10k1_ptr_write(emu, VTFT, voice, VTFT_FILTERTARGET_MASK);
-	snd_emu10k1_ptr_write(emu, CVCF, voice, CVCF_CURRENTFILTER_MASK);
 }
 
 static void snd_emu10k1_playback_set_running(struct snd_emu10k1 *emu,
@@ -698,21 +705,20 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 		if (cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
 			snd_emu10k1_playback_mangle_extra(emu, epcm, substream, runtime);
 		mix = &emu->pcm_mixer[substream->number];
-		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[0], 1, mix);
-		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[1], 0, mix);
-		snd_emu10k1_playback_prepare_voice(emu, epcm->extra, 1, NULL);
+		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[0], true, mix);
+		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[1], false, mix);
 		snd_emu10k1_playback_set_running(emu, epcm);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0], 1);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[1], 0);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->extra, 1);
+		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0]);
+		snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		snd_emu10k1_playback_stop_voice(emu, epcm->voices[0]);
-		snd_emu10k1_playback_stop_voice(emu, epcm->voices[1]);
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
 		snd_emu10k1_playback_set_stopped(emu, epcm);
+		snd_emu10k1_playback_mute_voice(emu, epcm->voices[0]);
+		snd_emu10k1_playback_mute_voice(emu, epcm->voices[1]);
 		break;
 	default:
 		result = -EINVAL;
@@ -844,25 +850,26 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		snd_emu10k1_playback_prepare_voice(emu, epcm->extra, 1, NULL);
-		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[0], 0,
-						   &emu->efx_pcm_mixer[0]);
-		for (i = 1; i < NUM_EFX_PLAYBACK; i++)
-			snd_emu10k1_playback_prepare_voice(emu, epcm->voices[i], 0,
-							   &emu->efx_pcm_mixer[i]);
+		for (i = 0; i < NUM_EFX_PLAYBACK; i++)
+			snd_emu10k1_playback_unmute_voice(emu, epcm->voices[i], false,
+							  &emu->efx_pcm_mixer[i]);
+
 		snd_emu10k1_playback_set_running(emu, epcm);
 		for (i = 0; i < NUM_EFX_PLAYBACK; i++)
-			snd_emu10k1_playback_trigger_voice(emu, epcm->voices[i], 0);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->extra, 1);
+			snd_emu10k1_playback_trigger_voice(emu, epcm->voices[i]);
+		snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		for (i = 0; i < NUM_EFX_PLAYBACK; i++) {	
 			snd_emu10k1_playback_stop_voice(emu, epcm->voices[i]);
 		}
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
 		snd_emu10k1_playback_set_stopped(emu, epcm);
+
+		for (i = 0; i < NUM_EFX_PLAYBACK; i++)
+			snd_emu10k1_playback_mute_voice(emu, epcm->voices[i]);
 		break;
 	default:
 		result = -EINVAL;
-- 
2.40.0.152.g15d061e6df


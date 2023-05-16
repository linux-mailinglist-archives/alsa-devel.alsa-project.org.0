Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF2704992
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:42:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE7103E;
	Tue, 16 May 2023 11:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE7103E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684230133;
	bh=Ha5WO41wMgw7/qWgfooexv+UCCRqz/fZRTEp3n80oSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=snPzPdNStg7YkDf8Cj/gtRrrjghTrDK9hb19vuZNtQaONZMdr/tMWn9Jjo6CAmXAB
	 DN/L5BXUgwaW7OB6Y6Nf4iRRhryzl7VNWowuVRpfp6T89TaH/Ln7AIeOOMINjha5ji
	 l5V5kTF/ccBogbVZI5Y1OlxHMJfUd1jvo3+aZCt4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDAE4F80649; Tue, 16 May 2023 11:37:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5628EF80639;
	Tue, 16 May 2023 11:37:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86AD2F80548; Tue, 16 May 2023 11:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42C89F80431
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42C89F80431
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C739B2423B;
	Tue, 16 May 2023 05:36:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-pzy-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/6] ALSA: emu10k1: cleanup envelope register init
Date: Tue, 16 May 2023 11:36:08 +0200
Message-Id: <20230516093612.3536451-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YY72JJ6OZJWYLE7HV5CLNITL3XGX3QJP
X-Message-ID-Hash: YY72JJ6OZJWYLE7HV5CLNITL3XGX3QJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YY72JJ6OZJWYLE7HV5CLNITL3XGX3QJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We (rightfully) don't enable the envelope engine for PCM voices, so any
related setup is entirely pointless - the EMU8K documentation makes that
very clear, and the fact that the various open drivers all use different
values to no observable detriment pretty much confirms it.

The remaining initializations are regrouped for clarity.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h          |  1 -
 sound/pci/emu10k1/emu10k1_main.c | 10 +++---
 sound/pci/emu10k1/emupcm.c       | 42 ++++++----------------
 sound/pci/emu10k1/io.c           | 61 --------------------------------
 4 files changed, 14 insertions(+), 100 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 7bcb1a2d779a..36687195c8f7 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1798,7 +1798,6 @@ void snd_emu10k1_wait(struct snd_emu10k1 *emu, unsigned int wait);
 static inline unsigned int snd_emu10k1_wc(struct snd_emu10k1 *emu) { return (inl(emu->port + WC) >> 6) & 0xfffff; }
 unsigned short snd_emu10k1_ac97_read(struct snd_ac97 *ac97, unsigned short reg);
 void snd_emu10k1_ac97_write(struct snd_ac97 *ac97, unsigned short reg, unsigned short data);
-unsigned int snd_emu10k1_rate_to_pitch(unsigned int rate);
 
 #ifdef CONFIG_PM_SLEEP
 void snd_emu10k1_suspend_regs(struct snd_emu10k1 *emu);
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 5c8f38f20fcc..793ae8797172 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -58,7 +58,6 @@ MODULE_FIRMWARE(EMU1010_NOTEBOOK_FILENAME);
 void snd_emu10k1_voice_init(struct snd_emu10k1 *emu, int ch)
 {
 	snd_emu10k1_ptr_write(emu, DCYSUSV, ch, 0);
-	snd_emu10k1_ptr_write(emu, IP, ch, 0);
 	snd_emu10k1_ptr_write(emu, VTFT, ch, VTFT_FILTERTARGET_MASK);
 	snd_emu10k1_ptr_write(emu, CVCF, ch, CVCF_CURRENTFILTER_MASK);
 	snd_emu10k1_ptr_write(emu, PTRX, ch, 0);
@@ -72,19 +71,18 @@ void snd_emu10k1_voice_init(struct snd_emu10k1 *emu, int ch)
 	snd_emu10k1_ptr_write(emu, Z2, ch, 0);
 	snd_emu10k1_ptr_write(emu, FXRT, ch, 0x32100000);
 
-	snd_emu10k1_ptr_write(emu, ATKHLDM, ch, 0);
+	// The rest is meaningless as long as DCYSUSV_CHANNELENABLE_MASK is zero
 	snd_emu10k1_ptr_write(emu, DCYSUSM, ch, 0);
+	snd_emu10k1_ptr_write(emu, ATKHLDV, ch, 0);
+	snd_emu10k1_ptr_write(emu, ATKHLDM, ch, 0);
+	snd_emu10k1_ptr_write(emu, IP, ch, 0);
 	snd_emu10k1_ptr_write(emu, IFATN, ch, IFATN_FILTERCUTOFF_MASK | IFATN_ATTENUATION_MASK);
 	snd_emu10k1_ptr_write(emu, PEFE, ch, 0);
 	snd_emu10k1_ptr_write(emu, FMMOD, ch, 0);
 	snd_emu10k1_ptr_write(emu, TREMFRQ, ch, 24);	/* 1 Hz */
 	snd_emu10k1_ptr_write(emu, FM2FRQ2, ch, 24);	/* 1 Hz */
-	snd_emu10k1_ptr_write(emu, TEMPENV, ch, 0);
-
-	/*** these are last so OFF prevents writing ***/
 	snd_emu10k1_ptr_write(emu, LFOVAL2, ch, 0);
 	snd_emu10k1_ptr_write(emu, LFOVAL1, ch, 0);
-	snd_emu10k1_ptr_write(emu, ATKHLDV, ch, 0);
 	snd_emu10k1_ptr_write(emu, ENVVOL, ch, 0);
 	snd_emu10k1_ptr_write(emu, ENVVAL, ch, 0);
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index c5ab0926d04f..d377669a8a94 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -348,24 +348,9 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 	silent_page = ((unsigned int)emu->silent_page.addr << emu->address_mode) | (emu->address_mode ? MAP_PTI_MASK1 : MAP_PTI_MASK0);
 	snd_emu10k1_ptr_write(emu, MAPA, voice, silent_page);
 	snd_emu10k1_ptr_write(emu, MAPB, voice, silent_page);
-	/* modulation envelope */
+	// Disable filter (in conjunction with CCCA_RESONANCE == 0)
 	snd_emu10k1_ptr_write(emu, VTFT, voice, VTFT_FILTERTARGET_MASK);
 	snd_emu10k1_ptr_write(emu, CVCF, voice, CVCF_CURRENTFILTER_MASK);
-	snd_emu10k1_ptr_write(emu, ATKHLDM, voice, 0);
-	snd_emu10k1_ptr_write(emu, DCYSUSM, voice, 0x007f);
-	snd_emu10k1_ptr_write(emu, LFOVAL1, voice, 0x8000);
-	snd_emu10k1_ptr_write(emu, LFOVAL2, voice, 0x8000);
-	snd_emu10k1_ptr_write(emu, FMMOD, voice, 0);
-	snd_emu10k1_ptr_write(emu, TREMFRQ, voice, 0);
-	snd_emu10k1_ptr_write(emu, FM2FRQ2, voice, 0);
-	snd_emu10k1_ptr_write(emu, ENVVAL, voice, 0x8000);
-	/* volume envelope */
-	snd_emu10k1_ptr_write(emu, ATKHLDV, voice, 0x7f7f);
-	snd_emu10k1_ptr_write(emu, ENVVOL, voice, 0x0000);
-	/* filter envelope */
-	snd_emu10k1_ptr_write(emu, PEFE_FILTERAMOUNT, voice, 0x7f);
-	/* pitch envelope */
-	snd_emu10k1_ptr_write(emu, PEFE_PITCHAMOUNT, voice, 0);
 
 	spin_unlock_irqrestore(&emu->reg_lock, flags);
 }
@@ -600,51 +585,46 @@ static void snd_emu10k1_playback_invalidate_cache(struct snd_emu10k1 *emu, int e
 }
 
 static void snd_emu10k1_playback_prepare_voice(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *evoice,
-					       int master, int extra,
+					       int master,
 					       struct snd_emu10k1_pcm_mixer *mix)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_runtime *runtime;
-	unsigned int attn, vattn;
+	unsigned int vattn;
 	unsigned int voice, tmp;
 
 	if (evoice == NULL)	/* skip second voice for mono */
 		return;
 	substream = evoice->epcm->substream;
 	runtime = substream->runtime;
 	voice = evoice->number;
 
-	attn = extra ? 0 : 0x00ff;
 	tmp = runtime->channels == 2 ? (master ? 1 : 2) : 0;
 	vattn = mix != NULL ? (mix->attn[tmp] << 16) : 0;
-	snd_emu10k1_ptr_write(emu, IFATN, voice, attn);
 	snd_emu10k1_ptr_write(emu, VTFT, voice, vattn | VTFT_FILTERTARGET_MASK);
 	snd_emu10k1_ptr_write(emu, CVCF, voice, vattn | CVCF_CURRENTFILTER_MASK);
-	snd_emu10k1_ptr_write(emu, DCYSUSV, voice, 0x7f7f);
 	snd_emu10k1_voice_clear_loop_stop(emu, voice);
 }	
 
 static void snd_emu10k1_playback_trigger_voice(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *evoice, int master, int extra)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_runtime *runtime;
-	unsigned int voice, pitch, pitch_target;
+	unsigned int voice, pitch_target;
 
 	if (evoice == NULL)	/* skip second voice for mono */
 		return;
 	substream = evoice->epcm->substream;
 	runtime = substream->runtime;
 	voice = evoice->number;
 
-	pitch = snd_emu10k1_rate_to_pitch(runtime->rate) >> 8;
 	if (emu->card_capabilities->emu_model)
 		pitch_target = PITCH_48000; /* Disable interpolators on emu1010 card */
 	else 
 		pitch_target = emu10k1_calc_pitch_target(runtime->rate);
 	snd_emu10k1_ptr_write(emu, PTRX_PITCHTARGET, voice, pitch_target);
 	if (master || evoice->epcm->type == PLAYBACK_EFX)
 		snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, pitch_target);
-	snd_emu10k1_ptr_write(emu, IP, voice, pitch);
 	if (extra)
 		snd_emu10k1_voice_intr_enable(emu, voice);
 }
@@ -659,10 +639,8 @@ static void snd_emu10k1_playback_stop_voice(struct snd_emu10k1 *emu, struct snd_
 	snd_emu10k1_voice_intr_disable(emu, voice);
 	snd_emu10k1_ptr_write(emu, PTRX_PITCHTARGET, voice, 0);
 	snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, 0);
-	snd_emu10k1_ptr_write(emu, IFATN, voice, 0xffff);
 	snd_emu10k1_ptr_write(emu, VTFT, voice, VTFT_FILTERTARGET_MASK);
 	snd_emu10k1_ptr_write(emu, CVCF, voice, CVCF_CURRENTFILTER_MASK);
-	snd_emu10k1_ptr_write(emu, IP, voice, 0);
 }
 
 static inline void snd_emu10k1_playback_mangle_extra(struct snd_emu10k1 *emu,
@@ -707,9 +685,9 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 		if (cmd == SNDRV_PCM_TRIGGER_PAUSE_RELEASE)
 			snd_emu10k1_playback_mangle_extra(emu, epcm, substream, runtime);
 		mix = &emu->pcm_mixer[substream->number];
-		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[0], 1, 0, mix);
-		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[1], 0, 0, mix);
-		snd_emu10k1_playback_prepare_voice(emu, epcm->extra, 1, 1, NULL);
+		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[0], 1, mix);
+		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[1], 0, mix);
+		snd_emu10k1_playback_prepare_voice(emu, epcm->extra, 1, NULL);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0], 1, 0);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[1], 0, 0);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->extra, 1, 1);
@@ -853,11 +831,11 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		snd_emu10k1_playback_prepare_voice(emu, epcm->extra, 1, 1, NULL);
-		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[0], 0, 0,
+		snd_emu10k1_playback_prepare_voice(emu, epcm->extra, 1, NULL);
+		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[0], 0,
 						   &emu->efx_pcm_mixer[0]);
 		for (i = 1; i < NUM_EFX_PLAYBACK; i++)
-			snd_emu10k1_playback_prepare_voice(emu, epcm->voices[i], 0, 0,
+			snd_emu10k1_playback_prepare_voice(emu, epcm->voices[i], 0,
 							   &emu->efx_pcm_mixer[i]);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0], 0, 0);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->extra, 1, 1);
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index 59b0f4d08c6b..f50943913a31 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -514,64 +514,3 @@ void snd_emu10k1_ac97_write(struct snd_ac97 *ac97, unsigned short reg, unsigned
 	outw(data, emu->port + AC97DATA);
 	spin_unlock_irqrestore(&emu->emu_lock, flags);
 }
-
-/*
- *  convert rate to pitch
- */
-
-unsigned int snd_emu10k1_rate_to_pitch(unsigned int rate)
-{
-	static const u32 logMagTable[128] = {
-		0x00000, 0x02dfc, 0x05b9e, 0x088e6, 0x0b5d6, 0x0e26f, 0x10eb3, 0x13aa2,
-		0x1663f, 0x1918a, 0x1bc84, 0x1e72e, 0x2118b, 0x23b9a, 0x2655d, 0x28ed5,
-		0x2b803, 0x2e0e8, 0x30985, 0x331db, 0x359eb, 0x381b6, 0x3a93d, 0x3d081,
-		0x3f782, 0x41e42, 0x444c1, 0x46b01, 0x49101, 0x4b6c4, 0x4dc49, 0x50191,
-		0x5269e, 0x54b6f, 0x57006, 0x59463, 0x5b888, 0x5dc74, 0x60029, 0x623a7,
-		0x646ee, 0x66a00, 0x68cdd, 0x6af86, 0x6d1fa, 0x6f43c, 0x7164b, 0x73829,
-		0x759d4, 0x77b4f, 0x79c9a, 0x7bdb5, 0x7dea1, 0x7ff5e, 0x81fed, 0x8404e,
-		0x86082, 0x88089, 0x8a064, 0x8c014, 0x8df98, 0x8fef1, 0x91e20, 0x93d26,
-		0x95c01, 0x97ab4, 0x9993e, 0x9b79f, 0x9d5d9, 0x9f3ec, 0xa11d8, 0xa2f9d,
-		0xa4d3c, 0xa6ab5, 0xa8808, 0xaa537, 0xac241, 0xadf26, 0xafbe7, 0xb1885,
-		0xb3500, 0xb5157, 0xb6d8c, 0xb899f, 0xba58f, 0xbc15e, 0xbdd0c, 0xbf899,
-		0xc1404, 0xc2f50, 0xc4a7b, 0xc6587, 0xc8073, 0xc9b3f, 0xcb5ed, 0xcd07c,
-		0xceaec, 0xd053f, 0xd1f73, 0xd398a, 0xd5384, 0xd6d60, 0xd8720, 0xda0c3,
-		0xdba4a, 0xdd3b4, 0xded03, 0xe0636, 0xe1f4e, 0xe384a, 0xe512c, 0xe69f3,
-		0xe829f, 0xe9b31, 0xeb3a9, 0xecc08, 0xee44c, 0xefc78, 0xf148a, 0xf2c83,
-		0xf4463, 0xf5c2a, 0xf73da, 0xf8b71, 0xfa2f0, 0xfba57, 0xfd1a7, 0xfe8df
-	};
-	static const char logSlopeTable[128] = {
-		0x5c, 0x5c, 0x5b, 0x5a, 0x5a, 0x59, 0x58, 0x58,
-		0x57, 0x56, 0x56, 0x55, 0x55, 0x54, 0x53, 0x53,
-		0x52, 0x52, 0x51, 0x51, 0x50, 0x50, 0x4f, 0x4f,
-		0x4e, 0x4d, 0x4d, 0x4d, 0x4c, 0x4c, 0x4b, 0x4b,
-		0x4a, 0x4a, 0x49, 0x49, 0x48, 0x48, 0x47, 0x47,
-		0x47, 0x46, 0x46, 0x45, 0x45, 0x45, 0x44, 0x44,
-		0x43, 0x43, 0x43, 0x42, 0x42, 0x42, 0x41, 0x41,
-		0x41, 0x40, 0x40, 0x40, 0x3f, 0x3f, 0x3f, 0x3e,
-		0x3e, 0x3e, 0x3d, 0x3d, 0x3d, 0x3c, 0x3c, 0x3c,
-		0x3b, 0x3b, 0x3b, 0x3b, 0x3a, 0x3a, 0x3a, 0x39,
-		0x39, 0x39, 0x39, 0x38, 0x38, 0x38, 0x38, 0x37,
-		0x37, 0x37, 0x37, 0x36, 0x36, 0x36, 0x36, 0x35,
-		0x35, 0x35, 0x35, 0x34, 0x34, 0x34, 0x34, 0x34,
-		0x33, 0x33, 0x33, 0x33, 0x32, 0x32, 0x32, 0x32,
-		0x32, 0x31, 0x31, 0x31, 0x31, 0x31, 0x30, 0x30,
-		0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f, 0x2f
-	};
-	int i;
-
-	if (rate == 0)
-		return 0;	/* Bail out if no leading "1" */
-	rate *= 11185;		/* Scale 48000 to 0x20002380 */
-	for (i = 31; i > 0; i--) {
-		if (rate & 0x80000000) {	/* Detect leading "1" */
-			return (((unsigned int) (i - 15) << 20) +
-			       logMagTable[0x7f & (rate >> 24)] +
-					(0x7f & (rate >> 17)) *
-					logSlopeTable[0x7f & (rate >> 24)]);
-		}
-		rate <<= 1;
-	}
-
-	return 0;		/* Should never reach this point */
-}
-
-- 
2.40.0.152.g15d061e6df


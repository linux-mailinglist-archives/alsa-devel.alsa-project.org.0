Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDEF707CBE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 723FB827;
	Thu, 18 May 2023 11:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 723FB827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684401922;
	bh=g3LhUA+qYFdMMSRgJjJMV+ezHKqcm2NnNTSV2CF14ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kQQsf2RhOLA6tXmMZD/8Mpfo39rSFPB4fntME5WXhrSXAgIxrvqJ744iFBU+62ze/
	 Qi0N5ufE+CmP2SokBw51sGXds/rd80VQuEDGR4rg9ATfAg4DX+PKoKxjV/k8RKKqNP
	 6hkiGDf1+aYAN7PZmhf2fi3moBFZjwfPAZK3ajpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16495F805C3; Thu, 18 May 2023 11:22:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7574CF805BB;
	Thu, 18 May 2023 11:22:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2467FF80589; Thu, 18 May 2023 11:22:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B47BCF80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B47BCF80087
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9C26B2421F;
	Thu, 18 May 2023 05:22:24 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZq4-VlJ-00; Thu, 18 May 2023 11:22:24 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 8/9] ALSA: emu10k1: refactor PCM playback address handling
Date: Thu, 18 May 2023 11:22:23 +0200
Message-Id: <20230518092224.3696958-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
References: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YZZNUDACHIIWVETTTZ5VBKXAVBQOZFBL
X-Message-ID-Hash: YZZNUDACHIIWVETTTZ5VBKXAVBQOZFBL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZZNUDACHIIWVETTTZ5VBKXAVBQOZFBL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Pull the special handling of extra voices out of
snd_emu10k1_pcm_init_voice(), simplify snd_emu10k1_playback_pointer(),
and make the logic overall clearer. Also, add verbose comments.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 81 ++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 29 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 063918397a5f..89f7e85034b6 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -269,9 +269,6 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 		memcpy(send_amount, &mix->send_volume[tmp][0], 8);
 	}
 
-	if (master) {
-		evoice->epcm->ccca_start_addr = start_addr + 64 - 3;
-	}
 	if (stereo) {
 		// Not really necessary for the slave, but it doesn't hurt
 		snd_emu10k1_ptr_write(emu, CPF, voice, CPF_STEREO_MASK);
@@ -299,12 +296,7 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 		pitch_target = PITCH_48000; /* Disable interpolators on emu1010 card */
 	else 
 		pitch_target = emu10k1_calc_pitch_target(runtime->rate);
-	if (extra)
-		snd_emu10k1_ptr_write(emu, CCCA, voice, (end_addr - 3) |
-			      emu10k1_select_interprom(pitch_target) |
-			      (w_16 ? 0 : CCCA_8BITSELECT));
-	else
-		snd_emu10k1_ptr_write(emu, CCCA, voice, (start_addr + 64 - 3) |
+	snd_emu10k1_ptr_write(emu, CCCA, voice,
 			      emu10k1_select_interprom(pitch_target) |
 			      (w_16 ? 0 : CCCA_8BITSELECT));
 	/* Clear filter delay memory */
@@ -401,6 +393,7 @@ static int snd_emu10k1_playback_prepare(struct snd_pcm_substream *substream)
 	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra, w_16, false,
 				   start_addr, end_addr, NULL);
 	start_addr >>= stereo;
+	epcm->ccca_start_addr = start_addr;
 	end_addr = start_addr + runtime->buffer_size;
 	snd_emu10k1_pcm_init_voice(emu, 1, 0, epcm->voices[0], w_16, stereo,
 				   start_addr, end_addr,
@@ -428,13 +421,8 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra, true, false,
 				   start_addr, start_addr + (channel_size / 2), NULL);
 
-	/* only difference with the master voice is we use it for the pointer */
-	snd_emu10k1_pcm_init_voice(emu, 1, 0, epcm->voices[0], true, false,
-				   start_addr, start_addr + channel_size,
-				   &emu->efx_pcm_mixer[0]);
-
-	start_addr += channel_size;
-	for (i = 1; i < NUM_EFX_PLAYBACK; i++) {
+	epcm->ccca_start_addr = start_addr;
+	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
 		snd_emu10k1_pcm_init_voice(emu, 0, 0, epcm->voices[i], true, false,
 					   start_addr, start_addr + channel_size,
 					   &emu->efx_pcm_mixer[i]);
@@ -540,13 +528,45 @@ static void snd_emu10k1_playback_prepare_voices(struct snd_emu10k1 *emu,
 						bool w_16, bool stereo,
 						int channels)
 {
+	struct snd_pcm_substream *substream = epcm->substream;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned eloop_start = epcm->start_addr >> w_16;
+	unsigned loop_start = eloop_start >> stereo;
+	unsigned eloop_size = runtime->period_size;
+	unsigned loop_size = runtime->buffer_size;
 	u32 sample = w_16 ? 0 : 0x80808080;
 
+	// To make the playback actually start at the 1st frame,
+	// we need to compensate for two circumstances:
+	// - The actual position is delayed by the cache size (64 frames)
+	// - The interpolator is centered around the 4th frame
+	loop_start += 64 - 3;
 	for (int i = 0; i < channels; i++) {
 		unsigned voice = epcm->voices[i]->number;
+		snd_emu10k1_ptr_write(emu, CCCA_CURRADDR, voice, loop_start);
+		loop_start += loop_size;
 		snd_emu10k1_playback_fill_cache(emu, voice, sample, stereo);
 	}
 
+	// The interrupt is triggered when CCCA_CURRADDR (CA) wraps around,
+	// which is ahead of the actual playback position, so the interrupt
+	// source needs to be delayed.
+	//
+	// In principle, this wouldn't need to be the cache's entire size - in
+	// practice, CCR_CACHEINVALIDSIZE (CIS) > `fetch threshold` has never
+	// been observed, and assuming 40 _bytes_ should be safe.
+	//
+	// The cache fills are somewhat random, which makes it impossible to
+	// align them with the interrupts. This makes a non-delayed interrupt
+	// source not practical, as the interrupt handler would have to wait
+	// for (CA - CIS) >= period_boundary for every channel in the stream.
+	//
+	// This is why all other (open) drivers for these chips use timer-based
+	// interrupts.
+	//
+	eloop_start += eloop_size - 3;
+	snd_emu10k1_ptr_write(emu, CCCA_CURRADDR, epcm->extra->number, eloop_start);
+
 	// It takes a moment until the cache fills complete,
 	// but the unmuting takes long enough for that.
 }
@@ -746,24 +766,27 @@ static snd_pcm_uframes_t snd_emu10k1_playback_pointer(struct snd_pcm_substream *
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
-	unsigned int ptr;
+	int ptr;
 
 	if (!epcm->running)
 		return 0;
+
 	ptr = snd_emu10k1_ptr_read(emu, CCCA, epcm->voices[0]->number) & 0x00ffffff;
-#if 0	/* Perex's code */
-	ptr += runtime->buffer_size;
 	ptr -= epcm->ccca_start_addr;
-	ptr %= runtime->buffer_size;
-#else	/* EMU10K1 Open Source code from Creative */
-	if (ptr < epcm->ccca_start_addr)
-		ptr += runtime->buffer_size - epcm->ccca_start_addr;
-	else {
-		ptr -= epcm->ccca_start_addr;
-		if (ptr >= runtime->buffer_size)
-			ptr -= runtime->buffer_size;
-	}
-#endif
+
+	// This is the size of the whole cache minus the interpolator read-ahead,
+	// which leads us to the actual playback position.
+	//
+	// The cache is constantly kept mostly filled, so in principle we could
+	// return a more advanced position representing how far the hardware has
+	// already read the buffer, and set runtime->delay accordingly. However,
+	// this would be slightly different for every channel (and remarkably slow
+	// to obtain), so only a fixed worst-case value would be practical.
+	//
+	ptr -= 64 - 3;
+	if (ptr < 0)
+		ptr += runtime->buffer_size;
+
 	/*
 	dev_dbg(emu->card->dev,
 	       "ptr = 0x%lx, buffer_size = 0x%lx, period_size = 0x%lx\n",
-- 
2.40.0.152.g15d061e6df


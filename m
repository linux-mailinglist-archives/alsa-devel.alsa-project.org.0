Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D147570839C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC62F822;
	Thu, 18 May 2023 16:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC62F822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684419105;
	bh=XChIAK5QBHytsi+G5ppn3Rn1hmAovJliB0T4FrrbfCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uj0dX2N9sTqGMDjSsACtJy4Cwa9rvvxqVYc+P8ednjDJrG7NoQoVKJ0nb1RFPOCMZ
	 WkliUk5qFWUiuAtdD7m4Nd0hiBvPJXZS68wnIxMYACP8gjJ9rkqNeea+uVvCx5G9x3
	 cExY1XFPGax86wtNReBj8RPh1CeJQMAwbaSD4ei4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E95CF80570; Thu, 18 May 2023 16:10:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0981F80563;
	Thu, 18 May 2023 16:10:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AEBBF80544; Thu, 18 May 2023 16:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48765F8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48765F8016D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 933F4240F9;
	Thu, 18 May 2023 10:09:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeKB-d9q-00; Thu, 18 May 2023 16:09:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 6/7] ALSA: emu10k1: make snd_emu10k1_voice_alloc() assign
 voices' epcm
Date: Thu, 18 May 2023 16:09:46 +0200
Message-Id: <20230518140947.3725394-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZPJZ3UDWCDMQVQONFFGZ5WIZY4UPVA5Y
X-Message-ID-Hash: ZPJZ3UDWCDMQVQONFFGZ5WIZY4UPVA5Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPJZ3UDWCDMQVQONFFGZ5WIZY4UPVA5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The voice allocator clearly knows about the field (it resets it), so
it's more consistent (and leads to less duplicated code) to have the
constructor take it as a parameter.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h              | 3 ++-
 sound/pci/emu10k1/emu10k1_callback.c | 2 +-
 sound/pci/emu10k1/emupcm.c           | 7 ++-----
 sound/pci/emu10k1/voice.c            | 7 ++++---
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 6ec2079534d4..42959ba9c9f4 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1848,7 +1848,8 @@ int snd_emu10k1_synth_copy_from_user(struct snd_emu10k1 *emu, struct snd_util_me
 int snd_emu10k1_memblk_map(struct snd_emu10k1 *emu, struct snd_emu10k1_memblk *blk);
 
 /* voice allocation */
-int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int pair, struct snd_emu10k1_voice **rvoice);
+int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int pair,
+			    struct snd_emu10k1_pcm *epcm, struct snd_emu10k1_voice **rvoice);
 int snd_emu10k1_voice_free(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *pvoice);
 
 /* MIDI uart */
diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index d70ca1f50705..e256d3c22ee4 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -282,7 +282,7 @@ get_voice(struct snd_emux *emu, struct snd_emux_port *port)
 			if (vp->ch < 0) {
 				/* allocate a voice */
 				struct snd_emu10k1_voice *hwvoice;
-				if (snd_emu10k1_voice_alloc(hw, EMU10K1_SYNTH, 1, &hwvoice) < 0 || hwvoice == NULL)
+				if (snd_emu10k1_voice_alloc(hw, EMU10K1_SYNTH, 1, NULL, &hwvoice) < 0 || hwvoice == NULL)
 					continue;
 				vp->ch = hwvoice->number;
 				emu->num_voices++;
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 63e085aa65fe..8bf0a4d8aaf1 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -95,36 +95,33 @@ static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voic
 	err = snd_emu10k1_voice_alloc(epcm->emu,
 				      epcm->type == PLAYBACK_EMUVOICE ? EMU10K1_PCM : EMU10K1_EFX,
 				      voices,
-				      &epcm->voices[0]);
+				      epcm, &epcm->voices[0]);
 	
 	if (err < 0)
 		return err;
-	epcm->voices[0]->epcm = epcm;
 	if (voices > 1) {
 		for (i = 1; i < voices; i++) {
 			epcm->voices[i] = &epcm->emu->voices[(epcm->voices[0]->number + i) % NUM_G];
-			epcm->voices[i]->epcm = epcm;
 		}
 	}
 	if (epcm->extra == NULL) {
 		// The hardware supports only (half-)loop interrupts, so to support an
 		// arbitrary number of periods per buffer, we use an extra voice with a
 		// period-sized loop as the interrupt source. Additionally, the interrupt
 		// timing of the hardware is "suboptimal" and needs some compensation.
 		err = snd_emu10k1_voice_alloc(epcm->emu,
 					      epcm->type == PLAYBACK_EMUVOICE ? EMU10K1_PCM_IRQ : EMU10K1_EFX_IRQ,
 					      1,
-					      &epcm->extra);
+					      epcm, &epcm->extra);
 		if (err < 0) {
 			/*
 			dev_dbg(emu->card->dev, "pcm_channel_alloc: "
 			       "failed extra: voices=%d, frame=%d\n",
 			       voices, frame);
 			*/
 			snd_emu10k1_pcm_free_voices(epcm);
 			return err;
 		}
-		epcm->extra->epcm = epcm;
 		epcm->extra->interrupt = snd_emu10k1_pcm_interrupt;
 	}
 
diff --git a/sound/pci/emu10k1/voice.c b/sound/pci/emu10k1/voice.c
index 25e78fc188bf..6c58e3bd14f7 100644
--- a/sound/pci/emu10k1/voice.c
+++ b/sound/pci/emu10k1/voice.c
@@ -32,7 +32,7 @@
  */
 
 static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
-		       struct snd_emu10k1_voice **rvoice)
+		       struct snd_emu10k1_pcm *epcm, struct snd_emu10k1_voice **rvoice)
 {
 	struct snd_emu10k1_voice *voice;
 	int i, j, k, first_voice, last_voice, skip;
@@ -79,6 +79,7 @@ static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 		       voice->number, idx-first_voice+1, number);
 		*/
 		voice->use = type;
+		voice->epcm = epcm;
 	}
 	*rvoice = &emu->voices[first_voice];
 	return 0;
@@ -95,19 +96,19 @@ static void voice_free(struct snd_emu10k1 *emu,
 }
 
 int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int number,
-			    struct snd_emu10k1_voice **rvoice)
+			    struct snd_emu10k1_pcm *epcm, struct snd_emu10k1_voice **rvoice)
 {
 	unsigned long flags;
 	int result;
 
 	if (snd_BUG_ON(!rvoice))
 		return -EINVAL;
 	if (snd_BUG_ON(!number))
 		return -EINVAL;
 
 	spin_lock_irqsave(&emu->voice_lock, flags);
 	for (;;) {
-		result = voice_alloc(emu, type, number, rvoice);
+		result = voice_alloc(emu, type, number, epcm, rvoice);
 		if (result == 0 || type == EMU10K1_SYNTH)
 			break;
 
-- 
2.40.0.152.g15d061e6df


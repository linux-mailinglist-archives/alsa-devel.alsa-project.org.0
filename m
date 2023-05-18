Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F98708399
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2B021FC;
	Thu, 18 May 2023 16:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2B021FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684419070;
	bh=qgQFb0o6zsRm9IvBp4N+RejTPae4lz030Wo5V7JzIyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G7wji8fEBCrtEVhZJLccIREYAW452yfUzAnIiKBxB+3wDox0mOyaFfX9qAZW6EvFN
	 vHZ4BY0/Y4UMiNk6u/3BY4GlRNULAONXVNGkEd8DI5L72WUFqz2N5ZCSwgm1UMSgig
	 NePSCV5OlBCULz+tmwd3VPOylglDzEUtRDIzzmsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7113F8016D; Thu, 18 May 2023 16:09:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16B7BF8025A;
	Thu, 18 May 2023 16:09:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFF35F80549; Thu, 18 May 2023 16:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74B10F8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74B10F8025A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7FF7423F5A;
	Thu, 18 May 2023 10:09:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeKB-d9Y-00; Thu, 18 May 2023 16:09:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/7] ALSA: emu10k1: improve voice status display in /proc
Date: Thu, 18 May 2023 16:09:43 +0200
Message-Id: <20230518140947.3725394-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3ESA537Q2KEGRIRLKWAW2CYYDCPA3OLR
X-Message-ID-Hash: 3ESA537Q2KEGRIRLKWAW2CYYDCPA3OLR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ESA537Q2KEGRIRLKWAW2CYYDCPA3OLR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Eliminate the MIDI type, as there is no such thing - the MPU401 port
doesn't have anything to do with voices.

For clarity, differentiate between regular and extra voices.

Don't atomize the enum into bits in the table display.

Simplify/optimize the storage.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h     | 13 ++++++-------
 sound/pci/emu10k1/emupcm.c  |  2 +-
 sound/pci/emu10k1/emuproc.c | 16 ++++++++--------
 sound/pci/emu10k1/voice.c   | 20 +++-----------------
 4 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 9c5de1f45566..2d247f8f635b 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1437,21 +1437,20 @@ SUB_REG_NC(A_EHC, A_I2S_CAPTURE_RATE, 0x00000e00)  /* This sets the capture PCM
 /* ------------------- STRUCTURES -------------------- */
 
 enum {
+	EMU10K1_UNUSED,  // This must be zero
 	EMU10K1_EFX,
+	EMU10K1_EFX_IRQ,
 	EMU10K1_PCM,
+	EMU10K1_PCM_IRQ,
 	EMU10K1_SYNTH,
-	EMU10K1_MIDI
+	EMU10K1_NUM_TYPES
 };
 
 struct snd_emu10k1;
 
 struct snd_emu10k1_voice {
-	int number;
-	unsigned int use: 1,
-	    pcm: 1,
-	    efx: 1,
-	    synth: 1,
-	    midi: 1;
+	unsigned char number;
+	unsigned char use;
 	void (*interrupt)(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *pvoice);
 
 	struct snd_emu10k1_pcm *epcm;
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 1ca16f0ddbed..aa3d6d573f05 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -117,7 +117,7 @@ static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voic
 		// period-sized loop as the interrupt source. Additionally, the interrupt
 		// timing of the hardware is "suboptimal" and needs some compensation.
 		err = snd_emu10k1_voice_alloc(epcm->emu,
-					      epcm->type == PLAYBACK_EMUVOICE ? EMU10K1_PCM : EMU10K1_EFX,
+					      epcm->type == PLAYBACK_EMUVOICE ? EMU10K1_PCM_IRQ : EMU10K1_EFX_IRQ,
 					      1,
 					      &epcm->extra);
 		if (err < 0) {
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 708aff6cf09a..c423a56ebf9e 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -367,17 +367,17 @@ static void snd_emu10k1_proc_voices_read(struct snd_info_entry *entry,
 	struct snd_emu10k1 *emu = entry->private_data;
 	struct snd_emu10k1_voice *voice;
 	int idx;
-	
-	snd_iprintf(buffer, "ch\tuse\tpcm\tefx\tsynth\tmidi\n");
+	static const char * const types[] = {
+		"Unused", "EFX", "EFX IRQ", "PCM", "PCM IRQ", "Synth"
+	};
+	static_assert(ARRAY_SIZE(types) == EMU10K1_NUM_TYPES);
+
+	snd_iprintf(buffer, "ch\tuse\n");
 	for (idx = 0; idx < NUM_G; idx++) {
 		voice = &emu->voices[idx];
-		snd_iprintf(buffer, "%i\t%i\t%i\t%i\t%i\t%i\n",
+		snd_iprintf(buffer, "%i\t%s\n",
 			idx,
-			voice->use,
-			voice->pcm,
-			voice->efx,
-			voice->synth,
-			voice->midi);
+			types[voice->use]);
 	}
 }
 
diff --git a/sound/pci/emu10k1/voice.c b/sound/pci/emu10k1/voice.c
index a602df9117f6..ac89d09ed9bc 100644
--- a/sound/pci/emu10k1/voice.c
+++ b/sound/pci/emu10k1/voice.c
@@ -78,32 +78,18 @@ static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 		dev_dbg(emu->card->dev, "voice alloc - %i, %i of %i\n",
 		       voice->number, idx-first_voice+1, number);
 		*/
-		voice->use = 1;
-		switch (type) {
-		case EMU10K1_PCM:
-			voice->pcm = 1;
-			break;
-		case EMU10K1_SYNTH:
-			voice->synth = 1;
-			break;
-		case EMU10K1_MIDI:
-			voice->midi = 1;
-			break;
-		case EMU10K1_EFX:
-			voice->efx = 1;
-			break;
-		}
+		voice->use = type;
 	}
 	*rvoice = &emu->voices[first_voice];
 	return 0;
 }
 
 static void voice_free(struct snd_emu10k1 *emu,
 		       struct snd_emu10k1_voice *pvoice)
 {
 	snd_emu10k1_voice_init(emu, pvoice->number);
 	pvoice->interrupt = NULL;
-	pvoice->use = pvoice->pcm = pvoice->synth = pvoice->midi = pvoice->efx = 0;
+	pvoice->use = 0;
 	pvoice->epcm = NULL;
 }
 
@@ -121,7 +107,7 @@ int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 	spin_lock_irqsave(&emu->voice_lock, flags);
 	for (;;) {
 		result = voice_alloc(emu, type, number, rvoice);
-		if (result == 0 || type == EMU10K1_SYNTH || type == EMU10K1_MIDI)
+		if (result == 0 || type == EMU10K1_SYNTH)
 			break;
 
 		/* free a voice from synth */
-- 
2.40.0.152.g15d061e6df


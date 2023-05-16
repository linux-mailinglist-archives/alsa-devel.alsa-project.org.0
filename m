Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99522704975
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AECDAF0;
	Tue, 16 May 2023 11:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AECDAF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684229909;
	bh=2jmqXbxvcnNxUfQtXoZD9KLQ6O+GdxAkKC5UAdgs79k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eXnIku9frbU2PNDBEMAmLpYPVvwJ6LeJYLVJFoVJz3O02VBT4+uedew6pC1HFYRR5
	 t/t/r7ajUbOwD0h+Z+bVWWF+nQg/+WFrZCXE+g4EZMQ9R4uIpEPCYnHQ5KCvxQF4My
	 2d/uLHrZ1J5G+v9b+LbXrt+796yWJzEfb6RFT2Z0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C9A8F805A0; Tue, 16 May 2023 11:36:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA2FEF805A1;
	Tue, 16 May 2023 11:36:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26D82F80579; Tue, 16 May 2023 11:36:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3651FF802E8
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3651FF802E8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id DA9BF2428D;
	Tue, 16 May 2023 05:36:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q0A-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 4/6] ALSA: emu10k1: rewire {en,dis}abling interrupts for PCM
 playback
Date: Tue, 16 May 2023 11:36:10 +0200
Message-Id: <20230516093612.3536451-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IA64CMM3WHNY3PXNB6XVUMGAVXOC3MX4
X-Message-ID-Hash: IA64CMM3WHNY3PXNB6XVUMGAVXOC3MX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IA64CMM3WHNY3PXNB6XVUMGAVXOC3MX4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We now enable ints even before triggering, and disable them only after
stopping - otherwise there is a race condition we may plausibly run into
when we pause/resume near the end of the buffer.

Updating the epcm->running flag is moved the same way, as it affects the
*_pointer() functions, which are called by the interrupt handler.

Also, factor these out to own functions, for clarity.

For multi-channel, the extra voice is now triggered after all regular
voices - we wouldn't want to receive an int before all channels have
passed the period boundary.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 45 ++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 2b6f5d2bbb3e..7b0ab4e02cfd 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -605,7 +605,9 @@ static void snd_emu10k1_playback_prepare_voice(struct snd_emu10k1 *emu, struct s
 	snd_emu10k1_ptr_write(emu, CVCF, voice, vattn | CVCF_CURRENTFILTER_MASK);
 }	
 
-static void snd_emu10k1_playback_trigger_voice(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *evoice, int master, int extra)
+static void snd_emu10k1_playback_trigger_voice(struct snd_emu10k1 *emu,
+					       struct snd_emu10k1_voice *evoice,
+					       int master)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_runtime *runtime;
@@ -624,24 +626,36 @@ static void snd_emu10k1_playback_trigger_voice(struct snd_emu10k1 *emu, struct s
 	snd_emu10k1_ptr_write(emu, PTRX_PITCHTARGET, voice, pitch_target);
 	if (master || evoice->epcm->type == PLAYBACK_EFX)
 		snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, pitch_target);
-	if (extra)
-		snd_emu10k1_voice_intr_enable(emu, voice);
 }
 
-static void snd_emu10k1_playback_stop_voice(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *evoice)
+static void snd_emu10k1_playback_stop_voice(struct snd_emu10k1 *emu,
+					    struct snd_emu10k1_voice *evoice)
 {
 	unsigned int voice;
 
 	if (evoice == NULL)
 		return;
 	voice = evoice->number;
-	snd_emu10k1_voice_intr_disable(emu, voice);
 	snd_emu10k1_ptr_write(emu, PTRX_PITCHTARGET, voice, 0);
 	snd_emu10k1_ptr_write(emu, CPF_CURRENTPITCH, voice, 0);
 	snd_emu10k1_ptr_write(emu, VTFT, voice, VTFT_FILTERTARGET_MASK);
 	snd_emu10k1_ptr_write(emu, CVCF, voice, CVCF_CURRENTFILTER_MASK);
 }
 
+static void snd_emu10k1_playback_set_running(struct snd_emu10k1 *emu,
+					     struct snd_emu10k1_pcm *epcm)
+{
+	epcm->running = 1;
+	snd_emu10k1_voice_intr_enable(emu, epcm->extra->number);
+}
+
+static void snd_emu10k1_playback_set_stopped(struct snd_emu10k1 *emu,
+					      struct snd_emu10k1_pcm *epcm)
+{
+	snd_emu10k1_voice_intr_disable(emu, epcm->extra->number);
+	epcm->running = 0;
+}
+
 static inline void snd_emu10k1_playback_mangle_extra(struct snd_emu10k1 *emu,
 		struct snd_emu10k1_pcm *epcm,
 		struct snd_pcm_substream *substream,
@@ -687,18 +701,18 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[0], 1, mix);
 		snd_emu10k1_playback_prepare_voice(emu, epcm->voices[1], 0, mix);
 		snd_emu10k1_playback_prepare_voice(emu, epcm->extra, 1, NULL);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0], 1, 0);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[1], 0, 0);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->extra, 1, 1);
-		epcm->running = 1;
+		snd_emu10k1_playback_set_running(emu, epcm);
+		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0], 1);
+		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[1], 0);
+		snd_emu10k1_playback_trigger_voice(emu, epcm->extra, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		epcm->running = 0;
 		snd_emu10k1_playback_stop_voice(emu, epcm->voices[0]);
 		snd_emu10k1_playback_stop_voice(emu, epcm->voices[1]);
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
+		snd_emu10k1_playback_set_stopped(emu, epcm);
 		break;
 	default:
 		result = -EINVAL;
@@ -836,20 +850,19 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 		for (i = 1; i < NUM_EFX_PLAYBACK; i++)
 			snd_emu10k1_playback_prepare_voice(emu, epcm->voices[i], 0,
 							   &emu->efx_pcm_mixer[i]);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0], 0, 0);
-		snd_emu10k1_playback_trigger_voice(emu, epcm->extra, 1, 1);
-		for (i = 1; i < NUM_EFX_PLAYBACK; i++)
-			snd_emu10k1_playback_trigger_voice(emu, epcm->voices[i], 0, 0);
-		epcm->running = 1;
+		snd_emu10k1_playback_set_running(emu, epcm);
+		for (i = 0; i < NUM_EFX_PLAYBACK; i++)
+			snd_emu10k1_playback_trigger_voice(emu, epcm->voices[i], 0);
+		snd_emu10k1_playback_trigger_voice(emu, epcm->extra, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		epcm->running = 0;
 		for (i = 0; i < NUM_EFX_PLAYBACK; i++) {	
 			snd_emu10k1_playback_stop_voice(emu, epcm->voices[i]);
 		}
 		snd_emu10k1_playback_stop_voice(emu, epcm->extra);
+		snd_emu10k1_playback_set_stopped(emu, epcm);
 		break;
 	default:
 		result = -EINVAL;
-- 
2.40.0.152.g15d061e6df


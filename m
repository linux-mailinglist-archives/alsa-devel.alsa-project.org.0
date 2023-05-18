Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C3370839B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:11:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F79C209;
	Thu, 18 May 2023 16:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F79C209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684419099;
	bh=xEhHDleqFO5sfvGT61hehxPPS+iZ6hhUf6oqBwaekIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jgc3kXDkKVIz9C4JuXJfFHvBR5c+NCZqCVheAY0mEUd3l6VeCt6JpOv5HEpwCSGqS
	 zDwMWtFxOGR6Ip8CHWZ/+HW5QKnsbABFv1l6XX53hzpje8sO0geOgjIZZNT+BVC0wR
	 GPAFTprgR6cRk4WLKf+6+Dj1kmCAf8+cxN+94ENw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27E41F8055A; Thu, 18 May 2023 16:10:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83DD6F80272;
	Thu, 18 May 2023 16:10:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F2D3F80548; Thu, 18 May 2023 16:09:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 936A9F8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 936A9F8016A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 8FADF240DB;
	Thu, 18 May 2023 10:09:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeKB-d9k-00; Thu, 18 May 2023 16:09:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 5/7] ALSA: emu10k1: centralize freeing PCM voices
Date: Thu, 18 May 2023 16:09:45 +0200
Message-Id: <20230518140947.3725394-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQLU75EIQKDYBKVMSPVWM7QWSW2WC7OL
X-Message-ID-Hash: ZQLU75EIQKDYBKVMSPVWM7QWSW2WC7OL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQLU75EIQKDYBKVMSPVWM7QWSW2WC7OL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index c4696c127028..63e085aa65fe 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -76,16 +76,22 @@ static void snd_emu10k1_pcm_efx_interrupt(struct snd_emu10k1 *emu,
 	snd_pcm_period_elapsed(emu->pcm_capture_efx_substream);
 }	 
 
-static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voices)
+static void snd_emu10k1_pcm_free_voices(struct snd_emu10k1_pcm *epcm)
 {
-	int err, i;
-
-	for (i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
+	for (unsigned i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
 		if (epcm->voices[i]) {
 			snd_emu10k1_voice_free(epcm->emu, epcm->voices[i]);
 			epcm->voices[i] = NULL;
 		}
 	}
+}
+
+static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voices)
+{
+	int err, i;
+
+	snd_emu10k1_pcm_free_voices(epcm);
+
 	err = snd_emu10k1_voice_alloc(epcm->emu,
 				      epcm->type == PLAYBACK_EMUVOICE ? EMU10K1_PCM : EMU10K1_EFX,
 				      voices,
@@ -115,15 +121,13 @@ static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voic
 			       "failed extra: voices=%d, frame=%d\n",
 			       voices, frame);
 			*/
-			for (i = 0; i < voices; i++) {
-				snd_emu10k1_voice_free(epcm->emu, epcm->voices[i]);
-				epcm->voices[i] = NULL;
-			}
+			snd_emu10k1_pcm_free_voices(epcm);
 			return err;
 		}
 		epcm->extra->epcm = epcm;
 		epcm->extra->interrupt = snd_emu10k1_pcm_interrupt;
 	}
+
 	return 0;
 }
 
@@ -342,21 +346,15 @@ static int snd_emu10k1_playback_hw_free(struct snd_pcm_substream *substream)
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm;
-	int i;
 
 	if (runtime->private_data == NULL)
 		return 0;
 	epcm = runtime->private_data;
 	if (epcm->extra) {
 		snd_emu10k1_voice_free(epcm->emu, epcm->extra);
 		epcm->extra = NULL;
 	}
-	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
-		if (epcm->voices[i]) {
-			snd_emu10k1_voice_free(epcm->emu, epcm->voices[i]);
-			epcm->voices[i] = NULL;
-		}
-	}
+	snd_emu10k1_pcm_free_voices(epcm);
 	if (epcm->memblk) {
 		snd_emu10k1_free_pages(emu, epcm->memblk);
 		epcm->memblk = NULL;
-- 
2.40.0.152.g15d061e6df


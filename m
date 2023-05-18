Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FA7083A0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:12:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CB3A83E;
	Thu, 18 May 2023 16:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CB3A83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684419128;
	bh=B8+VwJa6q4nnA/x8Ok2d17U7hI5O4USuHJvFesYsEjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j7D4Ov2+ongsdQzfUHOymBgdhCooF1wRmhFx+RZHM2rFzCTxZho5YfM/X1Twr3pEV
	 Ml5V88EK+j7OgO9qXRnU77Dcc1hzk43Ldu6N7baWoRjW/4HFMPaKTIJ5R8G7eJCs61
	 2SD48T7Pyye8iYxPlyPr5f9j7lpGu5Cz6pINe/3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 714FEF805A8; Thu, 18 May 2023 16:10:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88AC6F805A8;
	Thu, 18 May 2023 16:10:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEAB7F80558; Thu, 18 May 2023 16:09:58 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 73E68F8053D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E68F8053D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 8282624051;
	Thu, 18 May 2023 10:09:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeKB-d9e-00; Thu, 18 May 2023 16:09:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 4/7] ALSA: emu10k1: make freeing untouched playback voices
 cheap
Date: Thu, 18 May 2023 16:09:44 +0200
Message-Id: <20230518140947.3725394-5-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E5PRBLMOLU3V3J6WROSH6WKK43INZLJU
X-Message-ID-Hash: E5PRBLMOLU3V3J6WROSH6WKK43INZLJU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5PRBLMOLU3V3J6WROSH6WKK43INZLJU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This allows us to drop the code that tries to preserve already allocated
voices upon repeated hw_param callback invocations. Getting it right for
multi-channel voices would otherwise get a bit hairy.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h              |  1 +
 sound/pci/emu10k1/emu10k1_callback.c |  1 +
 sound/pci/emu10k1/emupcm.c           | 13 ++-----------
 sound/pci/emu10k1/emuproc.c          |  5 +++--
 sound/pci/emu10k1/voice.c            |  5 +++--
 5 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 2d247f8f635b..6ec2079534d4 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1451,6 +1451,7 @@ struct snd_emu10k1;
 struct snd_emu10k1_voice {
 	unsigned char number;
 	unsigned char use;
+	unsigned char dirty;
 	void (*interrupt)(struct snd_emu10k1 *emu, struct snd_emu10k1_voice *pvoice);
 
 	struct snd_emu10k1_pcm *epcm;
diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index 4a8b2df06a28..d70ca1f50705 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -458,6 +458,7 @@ start_voice(struct snd_emux_voice *vp)
 	}
 #endif
 
+	hw->voices[ch].dirty = 1;
 	return 0;
 }
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index aa3d6d573f05..c4696c127028 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -80,17 +80,6 @@ static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voic
 {
 	int err, i;
 
-	if (epcm->voices[1] != NULL && voices < 2) {
-		snd_emu10k1_voice_free(epcm->emu, epcm->voices[1]);
-		epcm->voices[1] = NULL;
-	}
-	for (i = 0; i < voices; i++) {
-		if (epcm->voices[i] == NULL)
-			break;
-	}
-	if (i == voices)
-		return 0; /* already allocated */
-
 	for (i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
 		if (epcm->voices[i]) {
 			snd_emu10k1_voice_free(epcm->emu, epcm->voices[i]);
@@ -306,6 +295,8 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 				      snd_emu10k1_compose_send_routing(send_routing));
 	}
 
+	emu->voices[voice].dirty = 1;
+
 	spin_unlock_irqrestore(&emu->reg_lock, flags);
 }
 
diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index c423a56ebf9e..abcec8a01760 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -372,11 +372,12 @@ static void snd_emu10k1_proc_voices_read(struct snd_info_entry *entry,
 	};
 	static_assert(ARRAY_SIZE(types) == EMU10K1_NUM_TYPES);
 
-	snd_iprintf(buffer, "ch\tuse\n");
+	snd_iprintf(buffer, "ch\tdirty\tuse\n");
 	for (idx = 0; idx < NUM_G; idx++) {
 		voice = &emu->voices[idx];
-		snd_iprintf(buffer, "%i\t%s\n",
+		snd_iprintf(buffer, "%i\t%u\t%s\n",
 			idx,
+			voice->dirty,
 			types[voice->use]);
 	}
 }
diff --git a/sound/pci/emu10k1/voice.c b/sound/pci/emu10k1/voice.c
index ac89d09ed9bc..25e78fc188bf 100644
--- a/sound/pci/emu10k1/voice.c
+++ b/sound/pci/emu10k1/voice.c
@@ -87,9 +87,10 @@ static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 static void voice_free(struct snd_emu10k1 *emu,
 		       struct snd_emu10k1_voice *pvoice)
 {
-	snd_emu10k1_voice_init(emu, pvoice->number);
+	if (pvoice->dirty)
+		snd_emu10k1_voice_init(emu, pvoice->number);
 	pvoice->interrupt = NULL;
-	pvoice->use = 0;
+	pvoice->use = pvoice->dirty = 0;
 	pvoice->epcm = NULL;
 }
 
-- 
2.40.0.152.g15d061e6df


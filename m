Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E789370839E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:11:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33CCF1F1;
	Thu, 18 May 2023 16:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33CCF1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684419115;
	bh=2scjB2WtspAGTcKhshT83X+chUHMmtS8lGH+xUnHcLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g7GYd9KRhgGRT7gJMhlq4uXCo21RwJwhcSA/GhJAvmYIdFsemX3AmbJUpaus+044H
	 Vvauzx2Acz7ZXS914OE8fP9vqaXqhMa1DcKA2vgOIhgYjW51rdZvp/Lr3ua0xpo1aM
	 tR/5E4T8mSKq+/T5bK7+KiG+vgX2KuvEZkfOWUhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DF23F80588; Thu, 18 May 2023 16:10:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D78CF80587;
	Thu, 18 May 2023 16:10:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64DD5F8016D; Thu, 18 May 2023 16:09:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC974F802E8
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC974F802E8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7D66E23F20;
	Thu, 18 May 2023 10:09:47 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeKB-d9S-00; Thu, 18 May 2023 16:09:47 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/7] ALSA: emu10k1: don't forget to reset reclaimed synth
 voices
Date: Thu, 18 May 2023 16:09:42 +0200
Message-Id: <20230518140947.3725394-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MCPLVUYQCAVDNKJZF2KYRAEXO7D6BOGE
X-Message-ID-Hash: MCPLVUYQCAVDNKJZF2KYRAEXO7D6BOGE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCPLVUYQCAVDNKJZF2KYRAEXO7D6BOGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The subsequent allocation may still fail after freeing some voices, so
we shouldn't leave them in their programmed state.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/voice.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/pci/emu10k1/voice.c b/sound/pci/emu10k1/voice.c
index cbeb8443492c..a602df9117f6 100644
--- a/sound/pci/emu10k1/voice.c
+++ b/sound/pci/emu10k1/voice.c
@@ -98,6 +98,15 @@ static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 	return 0;
 }
 
+static void voice_free(struct snd_emu10k1 *emu,
+		       struct snd_emu10k1_voice *pvoice)
+{
+	snd_emu10k1_voice_init(emu, pvoice->number);
+	pvoice->interrupt = NULL;
+	pvoice->use = pvoice->pcm = pvoice->synth = pvoice->midi = pvoice->efx = 0;
+	pvoice->epcm = NULL;
+}
+
 int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 			    struct snd_emu10k1_voice **rvoice)
 {
@@ -118,12 +127,8 @@ int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 		/* free a voice from synth */
 		if (emu->get_synth_voice) {
 			result = emu->get_synth_voice(emu);
-			if (result >= 0) {
-				struct snd_emu10k1_voice *pvoice = &emu->voices[result];
-				pvoice->interrupt = NULL;
-				pvoice->use = pvoice->pcm = pvoice->synth = pvoice->midi = pvoice->efx = 0;
-				pvoice->epcm = NULL;
-			}
+			if (result >= 0)
+				voice_free(emu, &emu->voices[result]);
 		}
 		if (result < 0)
 			break;
@@ -143,10 +148,7 @@ int snd_emu10k1_voice_free(struct snd_emu10k1 *emu,
 	if (snd_BUG_ON(!pvoice))
 		return -EINVAL;
 	spin_lock_irqsave(&emu->voice_lock, flags);
-	pvoice->interrupt = NULL;
-	pvoice->use = pvoice->pcm = pvoice->synth = pvoice->midi = pvoice->efx = 0;
-	pvoice->epcm = NULL;
-	snd_emu10k1_voice_init(emu, pvoice->number);
+	voice_free(emu, pvoice);
 	spin_unlock_irqrestore(&emu->voice_lock, flags);
 	return 0;
 }
-- 
2.40.0.152.g15d061e6df


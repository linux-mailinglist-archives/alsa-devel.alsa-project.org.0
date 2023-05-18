Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC43707CC0
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16511204;
	Thu, 18 May 2023 11:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16511204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684401964;
	bh=y2WOMC+rzXR/nN7J8ytzEFuagUTKfB7Fo0d1Cq3hVyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oSeg9j+NO5ZW8QYknMm9coAMAwuLBe/1ZCJHVtbmgAEWgzGFDA4nZCAVtPKMnIPvy
	 K/eBDd3lNQf3sOvg8ooUjajC8QD/P0xrvikyOr9fBEtp29fCTs5eXVC76JK+gV5O9a
	 Bg/TkyeL/kHvdqdzchu+AJzH+hH40/5JoCOR7tBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED9A2F805DA; Thu, 18 May 2023 11:23:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 505B6F805D8;
	Thu, 18 May 2023 11:23:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2972BF80544; Thu, 18 May 2023 11:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28429F80544
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28429F80544
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 99F402421A;
	Thu, 18 May 2023 05:22:24 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZq4-VlD-00; Thu, 18 May 2023 11:22:24 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 7/9] ALSA: emu10k1: refactor PCM playback cache filling
Date: Thu, 18 May 2023 11:22:22 +0200
Message-Id: <20230518092224.3696958-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
References: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VHTTV45R5R26YHK6JFPUFNB7SCWYLWJH
X-Message-ID-Hash: VHTTV45R5R26YHK6JFPUFNB7SCWYLWJH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHTTV45R5R26YHK6JFPUFNB7SCWYLWJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename snd_emu10k1_playback_invalidate_cache() to the more apt
snd_emu10k1_playback_fill_cache(), and factor out
snd_emu10k1_playback_prepare_voices(), which calls the former for all
channels.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index bbe054be2448..063918397a5f 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -511,16 +511,12 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static void snd_emu10k1_playback_invalidate_cache(struct snd_emu10k1 *emu,
-						  struct snd_emu10k1_voice *evoice,
-						  bool w_16, bool stereo)
+static void snd_emu10k1_playback_fill_cache(struct snd_emu10k1 *emu,
+					    unsigned voice,
+					    u32 sample, bool stereo)
 {
-	unsigned voice, sample;
 	u32 ccr;
 
-	voice = evoice->number;
-	sample = w_16 ? 0 : 0x80808080;
-
 	// We assume that the cache is resting at this point (i.e.,
 	// CCR_CACHEINVALIDSIZE is very small).
 
@@ -539,6 +535,22 @@ static void snd_emu10k1_playback_invalidate_cache(struct snd_emu10k1 *emu,
 	snd_emu10k1_ptr_write(emu, CCR, voice, ccr);
 }
 
+static void snd_emu10k1_playback_prepare_voices(struct snd_emu10k1 *emu,
+						struct snd_emu10k1_pcm *epcm,
+						bool w_16, bool stereo,
+						int channels)
+{
+	u32 sample = w_16 ? 0 : 0x80808080;
+
+	for (int i = 0; i < channels; i++) {
+		unsigned voice = epcm->voices[i]->number;
+		snd_emu10k1_playback_fill_cache(emu, voice, sample, stereo);
+	}
+
+	// It takes a moment until the cache fills complete,
+	// but the unmuting takes long enough for that.
+}
+
 static void snd_emu10k1_playback_commit_volume(struct snd_emu10k1 *emu,
 					       struct snd_emu10k1_voice *evoice,
 					       unsigned int vattn)
@@ -632,7 +644,7 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 	spin_lock(&emu->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		snd_emu10k1_playback_invalidate_cache(emu, epcm->voices[0], w_16, stereo);
+		snd_emu10k1_playback_prepare_voices(emu, epcm, w_16, stereo, 1);
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -774,10 +786,7 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	spin_lock(&emu->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		/* prepare voices */
-		for (i = 0; i < NUM_EFX_PLAYBACK; i++) {	
-			snd_emu10k1_playback_invalidate_cache(emu, epcm->voices[i], true, false);
-		}
+		snd_emu10k1_playback_prepare_voices(emu, epcm, true, false, NUM_EFX_PLAYBACK);
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-- 
2.40.0.152.g15d061e6df


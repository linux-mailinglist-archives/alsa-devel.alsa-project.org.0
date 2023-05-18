Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA9A707CBC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2337F82B;
	Thu, 18 May 2023 11:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2337F82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684401891;
	bh=BDQHdQvpSahYthnktApYILbOSy4+xGL42s/zrIb9oAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XrxRX+UfdJYvdqQGbZsKA94JliAxZTgkM2VMMb/mJEX6HF8c89C1mpHCRX84YrTyi
	 tezdqejfkIUlIaoyFxig1hzeWaEgvHCMHv2mnHa0M7TdiaXCo2bcX8Jdp/VSrJuHnB
	 dI1sA2CELt68qLLU6j7tcmBusVZ/gK0BMibwLZ2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62C3EF805AE; Thu, 18 May 2023 11:22:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1898F805A0;
	Thu, 18 May 2023 11:22:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F854F8055A; Thu, 18 May 2023 11:22:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2229FF80548
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2229FF80548
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9784C24215;
	Thu, 18 May 2023 05:22:24 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZq4-Vl7-00; Thu, 18 May 2023 11:22:24 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 6/9] ALSA: emu10k1: improve API of low-level voice
 manipulation functions
Date: Thu, 18 May 2023 11:22:21 +0200
Message-Id: <20230518092224.3696958-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
References: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D7SE2CUIZK6P6A3DPA5AVDEDZKFNNBDN
X-Message-ID-Hash: D7SE2CUIZK6P6A3DPA5AVDEDZKFNNBDN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7SE2CUIZK6P6A3DPA5AVDEDZKFNNBDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Originally, there was a 1:1 relationship between the PCM streams' and
the low-level voices' parameters. The addition of multi-channel playback
partially invalidated that, but didn't introduce proper layering, so
things kept working only by virtue of the multi-channel device never
having two channels (yet). The upcoming addition of 32-bit playback
would complete upending the relationships.

So this patch detaches the low-level parameters from the high-level
ones: we pass pre-calculated bit width and stereo flags to the low-level
manipulation functions instead of calculating them in-place from the
stream parameters.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 50 +++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index feb575922738..bbe054be2448 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -239,22 +239,21 @@ static unsigned int emu10k1_select_interprom(unsigned int pitch_target)
 static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 				       int master, int extra,
 				       struct snd_emu10k1_voice *evoice,
+				       bool w_16, bool stereo,
 				       unsigned int start_addr,
 				       unsigned int end_addr,
 				       struct snd_emu10k1_pcm_mixer *mix)
 {
 	struct snd_pcm_substream *substream = evoice->epcm->substream;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int silent_page, tmp;
-	int voice, stereo, w_16;
+	int voice;
 	unsigned char send_amount[8];
 	unsigned char send_routing[8];
 	unsigned long flags;
 	unsigned int pitch_target;
 
 	voice = evoice->number;
-	stereo = runtime->channels == 2;
-	w_16 = snd_pcm_format_width(runtime->format) == 16;
 
 	spin_lock_irqsave(&emu->reg_lock, flags);
 
@@ -273,7 +272,7 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 	if (master) {
 		evoice->epcm->ccca_start_addr = start_addr + 64 - 3;
 	}
-	if (stereo && !extra) {
+	if (stereo) {
 		// Not really necessary for the slave, but it doesn't hurt
 		snd_emu10k1_ptr_write(emu, CPF, voice, CPF_STEREO_MASK);
 	} else {
@@ -399,15 +398,15 @@ static int snd_emu10k1_playback_prepare(struct snd_pcm_substream *substream)
 
 	start_addr = epcm->start_addr >> w_16;
 	end_addr = start_addr + runtime->period_size;
-	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra,
+	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra, w_16, false,
 				   start_addr, end_addr, NULL);
 	start_addr >>= stereo;
 	end_addr = start_addr + runtime->buffer_size;
-	snd_emu10k1_pcm_init_voice(emu, 1, 0, epcm->voices[0],
+	snd_emu10k1_pcm_init_voice(emu, 1, 0, epcm->voices[0], w_16, stereo,
 				   start_addr, end_addr,
 				   &emu->pcm_mixer[substream->number]);
 	if (epcm->voices[1])
-		snd_emu10k1_pcm_init_voice(emu, 0, 0, epcm->voices[1],
+		snd_emu10k1_pcm_init_voice(emu, 0, 0, epcm->voices[1], w_16, true,
 					   start_addr, end_addr,
 					   &emu->pcm_mixer[substream->number]);
 	return 0;
@@ -426,17 +425,17 @@ static int snd_emu10k1_efx_playback_prepare(struct snd_pcm_substream *substream)
 
 	channel_size = runtime->buffer_size;
 
-	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra,
+	snd_emu10k1_pcm_init_voice(emu, 1, 1, epcm->extra, true, false,
 				   start_addr, start_addr + (channel_size / 2), NULL);
 
 	/* only difference with the master voice is we use it for the pointer */
-	snd_emu10k1_pcm_init_voice(emu, 1, 0, epcm->voices[0],
+	snd_emu10k1_pcm_init_voice(emu, 1, 0, epcm->voices[0], true, false,
 				   start_addr, start_addr + channel_size,
 				   &emu->efx_pcm_mixer[0]);
 
 	start_addr += channel_size;
 	for (i = 1; i < NUM_EFX_PLAYBACK; i++) {
-		snd_emu10k1_pcm_init_voice(emu, 0, 0, epcm->voices[i],
+		snd_emu10k1_pcm_init_voice(emu, 0, 0, epcm->voices[i], true, false,
 					   start_addr, start_addr + channel_size,
 					   &emu->efx_pcm_mixer[i]);
 		start_addr += channel_size;
@@ -513,16 +512,14 @@ static int snd_emu10k1_capture_prepare(struct snd_pcm_substream *substream)
 }
 
 static void snd_emu10k1_playback_invalidate_cache(struct snd_emu10k1 *emu,
-						  struct snd_emu10k1_voice *evoice)
+						  struct snd_emu10k1_voice *evoice,
+						  bool w_16, bool stereo)
 {
-	struct snd_pcm_runtime *runtime;
-	unsigned voice, stereo, sample;
+	unsigned voice, sample;
 	u32 ccr;
 
-	runtime = evoice->epcm->substream->runtime;
 	voice = evoice->number;
-	stereo = (runtime->channels == 2);
-	sample = snd_pcm_format_width(runtime->format) == 16 ? 0 : 0x80808080;
+	sample = w_16 ? 0 : 0x80808080;
 
 	// We assume that the cache is resting at this point (i.e.,
 	// CCR_CACHEINVALIDSIZE is very small).
@@ -552,20 +549,15 @@ static void snd_emu10k1_playback_commit_volume(struct snd_emu10k1 *emu,
 
 static void snd_emu10k1_playback_unmute_voice(struct snd_emu10k1 *emu,
 					      struct snd_emu10k1_voice *evoice,
-					      bool master,
+					      bool stereo, bool master,
 					      struct snd_emu10k1_pcm_mixer *mix)
 {
-	struct snd_pcm_substream *substream;
-	struct snd_pcm_runtime *runtime;
 	unsigned int vattn;
 	unsigned int tmp;
 
 	if (evoice == NULL)	/* skip second voice for mono */
 		return;
-	substream = evoice->epcm->substream;
-	runtime = substream->runtime;
-
-	tmp = runtime->channels == 2 ? (master ? 1 : 2) : 0;
+	tmp = stereo ? (master ? 1 : 2) : 0;
 	vattn = mix->attn[tmp] << 16;
 	snd_emu10k1_playback_commit_volume(emu, evoice, vattn);
 }	
@@ -628,23 +620,25 @@ static int snd_emu10k1_playback_trigger(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_emu10k1_pcm *epcm = runtime->private_data;
 	struct snd_emu10k1_pcm_mixer *mix;
+	bool w_16 = snd_pcm_format_width(runtime->format) == 16;
+	bool stereo = runtime->channels == 2;
 	int result = 0;
 
 	/*
 	dev_dbg(emu->card->dev,
 		"trigger - emu10k1 = 0x%x, cmd = %i, pointer = %i\n",
 	       (int)emu, cmd, substream->ops->pointer(substream))
 	*/
 	spin_lock(&emu->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		snd_emu10k1_playback_invalidate_cache(emu, epcm->voices[0]);
+		snd_emu10k1_playback_invalidate_cache(emu, epcm->voices[0], w_16, stereo);
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		mix = &emu->pcm_mixer[substream->number];
-		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[0], true, mix);
-		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[1], false, mix);
+		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[0], stereo, true, mix);
+		snd_emu10k1_playback_unmute_voice(emu, epcm->voices[1], stereo, false, mix);
 		snd_emu10k1_playback_set_running(emu, epcm);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->voices[0]);
 		snd_emu10k1_playback_trigger_voice(emu, epcm->extra);
@@ -782,13 +776,13 @@ static int snd_emu10k1_efx_playback_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 		/* prepare voices */
 		for (i = 0; i < NUM_EFX_PLAYBACK; i++) {	
-			snd_emu10k1_playback_invalidate_cache(emu, epcm->voices[i]);
+			snd_emu10k1_playback_invalidate_cache(emu, epcm->voices[i], true, false);
 		}
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
 		for (i = 0; i < NUM_EFX_PLAYBACK; i++)
-			snd_emu10k1_playback_unmute_voice(emu, epcm->voices[i], false,
+			snd_emu10k1_playback_unmute_voice(emu, epcm->voices[i], false, true,
 							  &emu->efx_pcm_mixer[i]);
 
 		snd_emu10k1_playback_set_running(emu, epcm);
-- 
2.40.0.152.g15d061e6df


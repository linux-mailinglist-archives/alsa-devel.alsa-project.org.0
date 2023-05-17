Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A27B6706FC0
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 19:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4547F4;
	Wed, 17 May 2023 19:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4547F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684345532;
	bh=/GZtL0hmqOrdJnmdBRi+7N6Yb5w3VEcjOSLo/Jjeliw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SgIq8vPJpVmKOldo37mkTACM/r6fLl6eQ+vQKJM1i3ivI+zaw4PHczScn5XB5HVcI
	 WCaET8S6dFgKD4Yh5ousxOl+ptT9Rfojgab5sWiC4uqacfM6cCHA8RmT5Ieo6k8drx
	 SiBDmSsnzmiLzR6/0xlXz0sJzDKTghdmfTB4B1IE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEA0CF805AB; Wed, 17 May 2023 19:43:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B43AF805AA;
	Wed, 17 May 2023 19:43:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECE8CF8055C; Wed, 17 May 2023 19:43:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FE33F8025A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 19:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE33F8025A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B5C312421A;
	Wed, 17 May 2023 13:42:56 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzLAu-LNb-00; Wed, 17 May 2023 19:42:56 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 6/9] ALSA: emu10k1: fix PCM playback buffer size constraints
Date: Wed, 17 May 2023 19:42:53 +0200
Message-Id: <20230517174256.3657060-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230517174256.3657060-1-oswald.buddenhagen@gmx.de>
References: <20230517174256.3657060-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7J67S27DAAIE3ATADSQI6II5CWSXWYNM
X-Message-ID-Hash: 7J67S27DAAIE3ATADSQI6II5CWSXWYNM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7J67S27DAAIE3ATADSQI6II5CWSXWYNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The period_bytes_min parameter made no sense at all, as it didn't
correlate with any hardware limitation.
The same can be said of the buffer_bytes minimum constraint.
Instead, apply a buffer_size constraint, which works on frames.

Sync up the constraints of the EFX playback with those of the regular
playback, as there is no reason for them to diverge.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index feb575922738..5226f0978408 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -457,9 +457,8 @@ static const struct snd_pcm_hardware snd_emu10k1_efx_playback =
 	.rate_max =		48000,
 	.channels_min =		NUM_EFX_PLAYBACK,
 	.channels_max =		NUM_EFX_PLAYBACK,
-	.buffer_bytes_max =	(64*1024),
-	.period_bytes_min =	64,
-	.period_bytes_max =	(64*1024),
+	.buffer_bytes_max =	(128*1024),
+	.period_bytes_max =	(128*1024),
 	.periods_min =		2,
 	.periods_max =		2,
 	.fifo_size =		0,
@@ -851,7 +850,6 @@ static const struct snd_pcm_hardware snd_emu10k1_playback =
 	.channels_min =		1,
 	.channels_max =		2,
 	.buffer_bytes_max =	(128*1024),
-	.period_bytes_min =	64,
 	.period_bytes_max =	(128*1024),
 	.periods_min =		1,
 	.periods_max =		1024,
@@ -956,25 +954,46 @@ static int snd_emu10k1_efx_playback_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int snd_emu10k1_playback_set_constraints(struct snd_pcm_runtime *runtime)
+{
+	int err;
+
+	// The buffer size must be a multiple of the period size, to avoid a
+	// mismatch between the extra voice and the regular voices.
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
+		return err;
+	// The hardware is typically the cache's size of 64 frames ahead.
+	// Leave enough time for actually filling up the buffer.
+	err = snd_pcm_hw_constraint_minmax(
+			runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 256, UINT_MAX);
+	return err;
+}
+
 static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
 {
 	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
 	struct snd_emu10k1_pcm *epcm;
 	struct snd_emu10k1_pcm_mixer *mix;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int i, j;
+	int i, j, err;
 
 	epcm = kzalloc(sizeof(*epcm), GFP_KERNEL);
 	if (epcm == NULL)
 		return -ENOMEM;
 	epcm->emu = emu;
 	epcm->type = PLAYBACK_EFX;
 	epcm->substream = substream;
 	
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_efx_playback;
-	
+	err = snd_emu10k1_playback_set_constraints(runtime);
+	if (err < 0) {
+		kfree(epcm);
+		return err;
+	}
+
 	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
 		mix = &emu->efx_pcm_mixer[i];
 		for (j = 0; j < 8; j++)
@@ -1005,12 +1024,7 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
 	runtime->private_data = epcm;
 	runtime->private_free = snd_emu10k1_pcm_free_substream;
 	runtime->hw = snd_emu10k1_playback;
-	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (err < 0) {
-		kfree(epcm);
-		return err;
-	}
-	err = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 256, UINT_MAX);
+	err = snd_emu10k1_playback_set_constraints(runtime);
 	if (err < 0) {
 		kfree(epcm);
 		return err;
-- 
2.40.0.152.g15d061e6df


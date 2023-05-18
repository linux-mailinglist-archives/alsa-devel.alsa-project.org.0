Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37798707CBD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 900B81F6;
	Thu, 18 May 2023 11:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 900B81F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684401916;
	bh=qH76bRYHQLzPwPuIBIKh3nTBa7uoc8FaKEyNzlJ+yuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BD2X8D76UrOPRaEzsxpimClwyeiGRZvfALd1GddjZB91YUEdzaUGGYmeDKaE1B4IT
	 qYYgTrxmtLkXCN0tJn7mXSiKde2eXoyQA08hCYjrXr4Z7zVXDigdR7lOtM4AvjxNy9
	 DNpHi10jAMUDHpC51gW0qNCqh6nqaHnihGZ/k70U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D833EF805B5; Thu, 18 May 2023 11:22:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 493D3F805B1;
	Thu, 18 May 2023 11:22:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B297EF80589; Thu, 18 May 2023 11:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB4B4F80542
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB4B4F80542
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9E5592422B;
	Thu, 18 May 2023 05:22:24 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzZq4-VlP-00; Thu, 18 May 2023 11:22:24 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 9/9] ALSA: emu10k1: fix PCM playback buffer size
 constraints
Date: Thu, 18 May 2023 11:22:24 +0200
Message-Id: <20230518092224.3696958-9-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
References: <20230518092224.3696958-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QNEJWKT5LUWISD7PV6SBMQUTHWBRCKXS
X-Message-ID-Hash: QNEJWKT5LUWISD7PV6SBMQUTHWBRCKXS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNEJWKT5LUWISD7PV6SBMQUTHWBRCKXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The period_bytes_min parameter and the buffer_bytes minimum constraint
made no sense at all, as they didn't reflect any hardware limitation.
Instead, apply a frame-based period_size minimum constraint, which is
derived from the cache size (it would be actually possible to go below
that, but it would require special handling, and it would be practically
impossible to keep up with the IRQ rate anyway).

Sync up the constraints of the EFX playback with those of the regular
playback, as there is no reason for them to diverge.

N.b., the maximum buffer size is actually arbitrary - the hardware could
go waay beyond 128 KiB.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2:
- constrain period size instead of buffer size, as otherwise a stupid
  app could set a small buffer with many periods, thus making the period
  size too small. takashi was actually right! :-D
---
 sound/pci/emu10k1/emupcm.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 89f7e85034b6..9045359bb461 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -444,9 +444,8 @@ static const struct snd_pcm_hardware snd_emu10k1_efx_playback =
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
@@ -877,7 +876,6 @@ static const struct snd_pcm_hardware snd_emu10k1_playback =
 	.channels_min =		1,
 	.channels_max =		2,
 	.buffer_bytes_max =	(128*1024),
-	.period_bytes_min =	64,
 	.period_bytes_max =	(128*1024),
 	.periods_min =		1,
 	.periods_max =		1024,
@@ -982,25 +980,46 @@ static int snd_emu10k1_efx_playback_close(struct snd_pcm_substream *substream)
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
+			runtime, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 128, UINT_MAX);
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
@@ -1031,12 +1050,7 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
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


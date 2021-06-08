Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14D39F886
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:11:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E5301726;
	Tue,  8 Jun 2021 16:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E5301726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161509;
	bh=bWvr5gG/RxkwPf3UAvGXIHTe/oddN4QAKyVxtapdZ8k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fXMMDzk/zNEnrSY66yaiEYETYTyxQPD8rvtfVn4Vv9SRHd2ui+y0E0ZoIQ3pKNsSG
	 cNVEgqZxWQ7/Nq7xyArso7j0Blbou3TMLpQtkStWL+c8EeH6Y50zWULOZQfOgiufc6
	 T8GHDzKN/rlcE6B9RaaNhVYrh027d1xa7dHlAiIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B2CAF8057B;
	Tue,  8 Jun 2021 16:06:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87FEBF80566; Tue,  8 Jun 2021 16:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A553F804C3
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A553F804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="qd/iC8bh"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lgR0LQCj"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C7408219DC
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Xszkd6G1zgaCiKxAkzQN2htm5JmsOJNmkoJY3/EnY8=;
 b=qd/iC8bh1dMyu4XNUJBCb9VLdqeGgAvXQxT4UTUlmMJ4pPaZz+JQ09g4e9Nd33g/OsgU1B
 Jib0U722dQKfvz8OMgxJgpSPzMRevN8DAVKWnJATpbdKULPYzlewndR9fkz+WEFXRvWHNy
 mxWmigCB0m08WzFqDDpYK7K4lMgvBY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Xszkd6G1zgaCiKxAkzQN2htm5JmsOJNmkoJY3/EnY8=;
 b=lgR0LQCjlRgmqOoBJGuG1dnqHBSVLSEWvmzRykQcP4cMwRXBcD4IFSIPs58A5fNynGRDyl
 NOLEQzOM4c+fVOBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B76B3A3B84;
 Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/66] ALSA: ad1816a: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:39 +0200
Message-Id: <20210608140540.17885-6-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ISA AD1816A driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/ad1816a/ad1816a.c     | 23 ++++++++++++++---------
 sound/isa/ad1816a/ad1816a_lib.c | 27 ++++++++++++++++++---------
 2 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/sound/isa/ad1816a/ad1816a.c b/sound/isa/ad1816a/ad1816a.c
index f11af983b3b6..fa5bed0d5a6f 100644
--- a/sound/isa/ad1816a/ad1816a.c
+++ b/sound/isa/ad1816a/ad1816a.c
@@ -131,16 +131,18 @@ static int snd_card_ad1816a_probe(int dev, struct pnp_card_link *pcard,
 		return error;
 	chip = card->private_data;
 
-	if ((error = snd_card_ad1816a_pnp(dev, pcard, pid))) {
+	error = snd_card_ad1816a_pnp(dev, pcard, pid);
+	if (error) {
 		snd_card_free(card);
 		return error;
 	}
 
-	if ((error = snd_ad1816a_create(card, port[dev],
-					irq[dev],
-					dma1[dev],
-					dma2[dev],
-					chip)) < 0) {
+	error = snd_ad1816a_create(card, port[dev],
+				   irq[dev],
+				   dma1[dev],
+				   dma2[dev],
+				   chip);
+	if (error) {
 		snd_card_free(card);
 		return error;
 	}
@@ -152,12 +154,14 @@ static int snd_card_ad1816a_probe(int dev, struct pnp_card_link *pcard,
 	sprintf(card->longname, "%s, SS at 0x%lx, irq %d, dma %d&%d",
 		card->shortname, chip->port, irq[dev], dma1[dev], dma2[dev]);
 
-	if ((error = snd_ad1816a_pcm(chip, 0)) < 0) {
+	error = snd_ad1816a_pcm(chip, 0);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
 
-	if ((error = snd_ad1816a_mixer(chip)) < 0) {
+	error = snd_ad1816a_mixer(chip);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
@@ -189,7 +193,8 @@ static int snd_card_ad1816a_probe(int dev, struct pnp_card_link *pcard,
 		}
 	}
 
-	if ((error = snd_card_register(card)) < 0) {
+	error = snd_card_register(card);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
diff --git a/sound/isa/ad1816a/ad1816a_lib.c b/sound/isa/ad1816a/ad1816a_lib.c
index 01381fe7c0c9..6d4999b30461 100644
--- a/sound/isa/ad1816a/ad1816a_lib.c
+++ b/sound/isa/ad1816a/ad1816a_lib.c
@@ -155,7 +155,8 @@ static void snd_ad1816a_close(struct snd_ad1816a *chip, unsigned int mode)
 		snd_ad1816a_write_mask(chip, AD1816A_INTERRUPT_ENABLE,
 			AD1816A_TIMER_IRQ_ENABLE, 0x0000);
 	}
-	if (!((chip->mode &= ~mode) & AD1816A_MODE_OPEN))
+	chip->mode &= ~mode;
+	if (!(chip->mode & AD1816A_MODE_OPEN))
 		chip->mode = 0;
 
 	spin_unlock_irqrestore(&chip->lock, flags);
@@ -426,7 +427,8 @@ static int snd_ad1816a_playback_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int error;
 
-	if ((error = snd_ad1816a_open(chip, AD1816A_MODE_PLAYBACK)) < 0)
+	error = snd_ad1816a_open(chip, AD1816A_MODE_PLAYBACK);
+	if (error < 0)
 		return error;
 	runtime->hw = snd_ad1816a_playback;
 	snd_pcm_limit_isa_dma_size(chip->dma1, &runtime->hw.buffer_bytes_max);
@@ -441,7 +443,8 @@ static int snd_ad1816a_capture_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int error;
 
-	if ((error = snd_ad1816a_open(chip, AD1816A_MODE_CAPTURE)) < 0)
+	error = snd_ad1816a_open(chip, AD1816A_MODE_CAPTURE);
+	if (error < 0)
 		return error;
 	runtime->hw = snd_ad1816a_capture;
 	snd_pcm_limit_isa_dma_size(chip->dma2, &runtime->hw.buffer_bytes_max);
@@ -586,7 +589,8 @@ int snd_ad1816a_create(struct snd_card *card,
 	chip->dma1 = -1;
 	chip->dma2 = -1;
 
-	if ((chip->res_port = request_region(port, 16, "AD1816A")) == NULL) {
+	chip->res_port = request_region(port, 16, "AD1816A");
+	if (!chip->res_port) {
 		snd_printk(KERN_ERR "ad1816a: can't grab port 0x%lx\n", port);
 		snd_ad1816a_free(chip);
 		return -EBUSY;
@@ -615,7 +619,8 @@ int snd_ad1816a_create(struct snd_card *card,
 	chip->port = port;
 	spin_lock_init(&chip->lock);
 
-	if ((error = snd_ad1816a_probe(chip))) {
+	error = snd_ad1816a_probe(chip);
+	if (error) {
 		snd_ad1816a_free(chip);
 		return error;
 	}
@@ -623,7 +628,8 @@ int snd_ad1816a_create(struct snd_card *card,
 	snd_ad1816a_init(chip);
 
 	/* Register device */
-	if ((error = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	error = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (error < 0) {
 		snd_ad1816a_free(chip);
 		return error;
 	}
@@ -652,7 +658,8 @@ int snd_ad1816a_pcm(struct snd_ad1816a *chip, int device)
 	int error;
 	struct snd_pcm *pcm;
 
-	if ((error = snd_pcm_new(chip->card, "AD1816A", device, 1, 1, &pcm)))
+	error = snd_pcm_new(chip->card, "AD1816A", device, 1, 1, &pcm);
+	if (error)
 		return error;
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_ad1816a_playback_ops);
@@ -682,7 +689,8 @@ int snd_ad1816a_timer(struct snd_ad1816a *chip, int device)
 	tid.card = chip->card->number;
 	tid.device = device;
 	tid.subdevice = 0;
-	if ((error = snd_timer_new(chip->card, "AD1816A", &tid, &timer)) < 0)
+	error = snd_timer_new(chip->card, "AD1816A", &tid, &timer);
+	if (error < 0)
 		return error;
 	strcpy(timer->name, snd_ad1816a_chip_id(chip));
 	timer->private_data = chip;
@@ -944,7 +952,8 @@ int snd_ad1816a_mixer(struct snd_ad1816a *chip)
 	strcpy(card->mixername, snd_ad1816a_chip_id(chip));
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_ad1816a_controls); idx++) {
-		if ((err = snd_ctl_add(card, snd_ctl_new1(&snd_ad1816a_controls[idx], chip))) < 0)
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_ad1816a_controls[idx], chip));
+		if (err < 0)
 			return err;
 	}
 	return 0;
-- 
2.26.2


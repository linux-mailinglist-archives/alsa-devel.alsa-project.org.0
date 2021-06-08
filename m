Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AA39F8D7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB4517B4;
	Tue,  8 Jun 2021 16:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB4517B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161959;
	bh=6+vMARa8I5ZmvSMFZNvDycbVxEZcBtBcK95df7VGdT8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hwtVe6gLhoOtMNWuFwZkCF4nNqipVV5j+OO2hYKWZQQ3TXCRVBEZlkp2XeYT+I6SF
	 90h29XD7IXJTUUx0oBovbc+zgvfLHaNV0YCClGvetkR+QbQhvwe7pu8cHVtqUkp1oP
	 kb/o2N+04DD/9RJ3Zc99vdfAAC9sIbQ+YLgQiPX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1EAF80608;
	Tue,  8 Jun 2021 16:06:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 441BCF805F5; Tue,  8 Jun 2021 16:06:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9324FF804E6
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9324FF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Eb1xz2w4"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="oKbjG9oY"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3A9DA1FDEF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCZhNctjXazKM/8z7D46HawzbJCfjTeLHoJQmJh0E6k=;
 b=Eb1xz2w4D9YjyG0qS8eLO1H0BZMtzHr+sZGJgKyOdOBXymp9/g8+rtes1cZ8lxiCs2NsIs
 k1HmGMoEVaWafZ/Tf6v5f/oEMunUITzVOsYp5EEozLM7K6rbqd8Ci2pV+7FE/BPuKXbsT9
 7zLYY2yDXCOr3jWjH59mp+q4x8O0adw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCZhNctjXazKM/8z7D46HawzbJCfjTeLHoJQmJh0E6k=;
 b=oKbjG9oYQGY4hlOUVXapBS5xVMzmhs8IL4LlACZR/RxTUoMISTh1HI+4F7/YMZsS+6OzWJ
 SknnfkxF/4rOa0CA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 29D34A3B88;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 49/66] ALSA: rme9652: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:23 +0200
Message-Id: <20210608140540.17885-50-tiwai@suse.de>
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

PCI RME9652 driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/rme9652.c | 98 +++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 47 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 7a4d395abcee..f1aad38760d6 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -433,9 +433,9 @@ static int rme9652_set_interrupt_interval(struct snd_rme9652 *s,
 
 	spin_lock_irq(&s->lock);
 
-	if ((restart = s->running)) {
+	restart = s->running;
+	if (restart)
 		rme9652_stop(s);
-	}
 
 	frames >>= 7;
 	n = 0;
@@ -518,16 +518,15 @@ static int rme9652_set_rate(struct snd_rme9652 *rme9652, int rate)
 		return -EBUSY;
 	}
 
-	if ((restart = rme9652->running)) {
+	restart = rme9652->running;
+	if (restart)
 		rme9652_stop(rme9652);
-	}
 	rme9652->control_register &= ~(RME9652_freq | RME9652_DS);
 	rme9652->control_register |= rate;
 	rme9652_write(rme9652, RME9652_control_register, rme9652->control_register);
 
-	if (restart) {
+	if (restart)
 		rme9652_start(rme9652);
-	}
 
 	if (rate & RME9652_DS) {
 		if (rme9652->ss_channels == RME9652_NCHANNELS) {
@@ -878,15 +877,14 @@ static int rme9652_set_adat1_input(struct snd_rme9652 *rme9652, int internal)
 
 	/* XXX do we actually need to stop the card when we do this ? */
 
-	if ((restart = rme9652->running)) {
+	restart = rme9652->running;
+	if (restart)
 		rme9652_stop(rme9652);
-	}
 
 	rme9652_write(rme9652, RME9652_control_register, rme9652->control_register);
 
-	if (restart) {
+	if (restart)
 		rme9652_start(rme9652);
-	}
 
 	return 0;
 }
@@ -943,15 +941,14 @@ static int rme9652_set_spdif_input(struct snd_rme9652 *rme9652, int in)
 	rme9652->control_register &= ~RME9652_inp;
 	rme9652->control_register |= rme9652_encode_spdif_in(in);
 
-	if ((restart = rme9652->running)) {
+	restart = rme9652->running;
+	if (restart)
 		rme9652_stop(rme9652);
-	}
 
 	rme9652_write(rme9652, RME9652_control_register, rme9652->control_register);
 
-	if (restart) {
+	if (restart)
 		rme9652_start(rme9652);
-	}
 
 	return 0;
 }
@@ -1010,15 +1007,14 @@ static int rme9652_set_spdif_output(struct snd_rme9652 *rme9652, int out)
 		rme9652->control_register &= ~RME9652_opt_out;
 	}
 
-	if ((restart = rme9652->running)) {
+	restart = rme9652->running;
+	if (restart)
 		rme9652_stop(rme9652);
-	}
 
 	rme9652_write(rme9652, RME9652_control_register, rme9652->control_register);
 
-	if (restart) {
+	if (restart)
 		rme9652_start(rme9652);
-	}
 
 	return 0;
 }
@@ -1086,15 +1082,14 @@ static int rme9652_set_sync_mode(struct snd_rme9652 *rme9652, int mode)
 		break;
 	}
 
-	if ((restart = rme9652->running)) {
+	restart = rme9652->running;
+	if (restart)
 		rme9652_stop(rme9652);
-	}
 
 	rme9652_write(rme9652, RME9652_control_register, rme9652->control_register);
 
-	if (restart) {
+	if (restart)
 		rme9652_start(rme9652);
-	}
 
 	return 0;
 }
@@ -1173,15 +1168,14 @@ static int rme9652_set_sync_pref(struct snd_rme9652 *rme9652, int pref)
 		break;
 	}
 
-	if ((restart = rme9652->running)) {
+	restart = rme9652->running;
+	if (restart)
 		rme9652_stop(rme9652);
-	}
 
 	rme9652_write(rme9652, RME9652_control_register, rme9652->control_register);
 
-	if (restart) {
+	if (restart)
 		rme9652_start(rme9652);
-	}
 
 	return 0;
 }
@@ -1513,19 +1507,27 @@ static int snd_rme9652_create_controls(struct snd_card *card, struct snd_rme9652
 	struct snd_kcontrol *kctl;
 
 	for (idx = 0; idx < ARRAY_SIZE(snd_rme9652_controls); idx++) {
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_rme9652_controls[idx], rme9652))) < 0)
+		kctl = snd_ctl_new1(&snd_rme9652_controls[idx], rme9652);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
 		if (idx == 1)	/* IEC958 (S/PDIF) Stream */
 			rme9652->spdif_ctl = kctl;
 	}
 
-	if (rme9652->ss_channels == RME9652_NCHANNELS)
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_rme9652_adat3_check, rme9652))) < 0)
+	if (rme9652->ss_channels == RME9652_NCHANNELS) {
+		kctl = snd_ctl_new1(&snd_rme9652_adat3_check, rme9652);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
+	}
 
-	if (rme9652->hw_rev >= 15)
-		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_rme9652_adat1_input, rme9652))) < 0)
+	if (rme9652->hw_rev >= 15) {
+		kctl = snd_ctl_new1(&snd_rme9652_adat1_input, rme9652);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			return err;
+	}
 
 	return 0;
 }
@@ -1842,9 +1844,9 @@ static char *rme9652_channel_buffer_location(struct snd_rme9652 *rme9652,
 	if (snd_BUG_ON(channel < 0 || channel >= RME9652_NCHANNELS))
 		return NULL;
         
-	if ((mapped_channel = rme9652->channel_map[channel]) < 0) {
+	mapped_channel = rme9652->channel_map[channel];
+	if (mapped_channel < 0)
 		return NULL;
-	}
 	
 	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
 		return rme9652->capture_buffer +
@@ -2021,12 +2023,14 @@ static int snd_rme9652_hw_params(struct snd_pcm_substream *substream,
 	/* how to make sure that the rate matches an externally-set one ?
 	 */
 
-	if ((err = rme9652_set_rate(rme9652, params_rate(params))) < 0) {
+	err = rme9652_set_rate(rme9652, params_rate(params));
+	if (err < 0) {
 		_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_RATE);
 		return err;
 	}
 
-	if ((err = rme9652_set_interrupt_interval(rme9652, params_period_size(params))) < 0) {
+	err = rme9652_set_interrupt_interval(rme9652, params_period_size(params));
+	if (err < 0) {
 		_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
 		return err;
 	}
@@ -2406,11 +2410,9 @@ static int snd_rme9652_create_pcm(struct snd_card *card,
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err = snd_pcm_new(card,
-			       rme9652->card_name,
-			       0, 1, 1, &pcm)) < 0) {
+	err = snd_pcm_new(card, rme9652->card_name, 0, 1, 1, &pcm);
+	if (err < 0)
 		return err;
-	}
 
 	rme9652->pcm = pcm;
 	pcm->private_data = rme9652;
@@ -2450,12 +2452,14 @@ static int snd_rme9652_create(struct snd_card *card,
 		return -ENODEV;
 	}
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	spin_lock_init(&rme9652->lock);
 
-	if ((err = pci_request_regions(pci, "rme9652")) < 0)
+	err = pci_request_regions(pci, "rme9652");
+	if (err < 0)
 		return err;
 	rme9652->port = pci_resource_start(pci, 0);
 	rme9652->iobase = ioremap(rme9652->port, RME9652_IO_EXTENT);
@@ -2528,17 +2532,17 @@ static int snd_rme9652_create(struct snd_card *card,
 
 	pci_set_master(rme9652->pci);
 
-	if ((err = snd_rme9652_initialize_memory(rme9652)) < 0) {
+	err = snd_rme9652_initialize_memory(rme9652);
+	if (err < 0)
 		return err;
-	}
 
-	if ((err = snd_rme9652_create_pcm(card, rme9652)) < 0) {
+	err = snd_rme9652_create_pcm(card, rme9652);
+	if (err < 0)
 		return err;
-	}
 
-	if ((err = snd_rme9652_create_controls(card, rme9652)) < 0) {
+	err = snd_rme9652_create_controls(card, rme9652);
+	if (err < 0)
 		return err;
-	}
 
 	snd_rme9652_proc_init(rme9652);
 
-- 
2.26.2


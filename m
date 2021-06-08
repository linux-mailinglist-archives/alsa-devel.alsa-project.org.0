Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364639F91E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095C518A0;
	Tue,  8 Jun 2021 16:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095C518A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162542;
	bh=pMBajeCDW1EO+ol4LLjZBrsmVlbsYPQWDe0gCksRTjo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJAInxuYuhmbUclf/auG1uDDGpF6R5kz7AriFwNHNOyATrbuaH/PjMJMynZp8cZLQ
	 RK5GJdNJITaydzedrvJcrpO+yZXy778U8fa+PdeUX1MQaO7Qx2EPTgqaBou2YhSlbs
	 lZOdFs49lxjQwf+p5xdb77t1rjCCfHJe+JSs1fZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F8A6F80715;
	Tue,  8 Jun 2021 16:07:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49BD3F8063D; Tue,  8 Jun 2021 16:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E0E7F80518
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E0E7F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="iGT6Fo8s"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="SrbXwE/1"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C26BB219EA
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mz2hYP5Oh+PlY4BuVbSbX0fi3nx2qOY57RpUMX55pug=;
 b=iGT6Fo8slQi5c3Qrg49uA+KXkTHGRQwBKE/ye8ORhS7ewDzbHG52iBxbYp09YS748drJMz
 27gif7COwt3Cb+GIuCvfVRpSUh2hUNEdouZdrxa8YEwikEmALaBqCEAk+I6T1+kb9Ux1d+
 V8U6XrQGY7nQjcLBt7R8FGWcEIupoBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mz2hYP5Oh+PlY4BuVbSbX0fi3nx2qOY57RpUMX55pug=;
 b=SrbXwE/134hovXCvPi2bcOtcIEy0HHIbFmzvVEaylopSfatzIP0fVh0PQUcB/K7RPUr3gK
 fvBiHe2HsWeadCDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B2474A3B84;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 41/66] ALSA: emu10k1x: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:15 +0200
Message-Id: <20210608140540.17885-42-tiwai@suse.de>
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

PCI EMU10k1X driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emu10k1x.c | 85 +++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 31 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index d9a12cd01647..89b0f3884067 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -349,7 +349,8 @@ static void snd_emu10k1x_pcm_interrupt(struct emu10k1x *emu, struct emu10k1x_voi
 {
 	struct emu10k1x_pcm *epcm;
 
-	if ((epcm = voice->epcm) == NULL)
+	epcm = voice->epcm;
+	if (!epcm)
 		return;
 	if (epcm->substream == NULL)
 		return;
@@ -371,10 +372,11 @@ static int snd_emu10k1x_playback_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0) {
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
-	}
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
+	err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
+	if (err < 0)
                 return err;
 
 	epcm = kzalloc(sizeof(*epcm), GFP_KERNEL);
@@ -550,10 +552,12 @@ static int snd_emu10k1x_pcm_open_capture(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int err;
 
-	if ((err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
-                return err;
-	if ((err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64)) < 0)
-                return err;
+	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
+	if (err < 0)
+		return err;
 
 	epcm = kzalloc(sizeof(*epcm), GFP_KERNEL);
 	if (epcm == NULL)
@@ -722,7 +726,8 @@ static int snd_emu10k1x_ac97(struct emu10k1x *chip)
 		.read = snd_emu10k1x_ac97_read,
 	};
   
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus);
+	if (err < 0)
 		return err;
 	pbus->no_vra = 1; /* we don't need VRA */
 
@@ -838,7 +843,8 @@ static int snd_emu10k1x_pcm(struct emu10k1x *emu, int device)
 	if (device == 0)
 		capture = 1;
 	
-	if ((err = snd_pcm_new(emu->card, "emu10k1x", device, 1, capture, &pcm)) < 0)
+	err = snd_pcm_new(emu->card, "emu10k1x", device, 1, capture, &pcm);
+	if (err < 0)
 		return err;
   
 	pcm->private_data = emu;
@@ -891,7 +897,8 @@ static int snd_emu10k1x_create(struct snd_card *card,
 
 	*rchip = NULL;
 
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28)) < 0) {
@@ -914,8 +921,8 @@ static int snd_emu10k1x_create(struct snd_card *card,
 	spin_lock_init(&chip->voice_lock);
   
 	chip->port = pci_resource_start(pci, 0);
-	if ((chip->res_port = request_region(chip->port, 8,
-					     "EMU10K1X")) == NULL) { 
+	chip->res_port = request_region(chip->port, 8, "EMU10K1X");
+	if (!chip->res_port) {
 		dev_err(card->dev, "cannot allocate the port 0x%lx\n",
 			chip->port);
 		snd_emu10k1x_free(chip);
@@ -991,8 +998,8 @@ static int snd_emu10k1x_create(struct snd_card *card,
 
 	outl(HCFG_LOCKSOUNDCACHE|HCFG_AUDIOENABLE, chip->port+HCFG);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
-				  chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_emu10k1x_free(chip);
 		return err;
 	}
@@ -1171,17 +1178,23 @@ static int snd_emu10k1x_mixer(struct emu10k1x *emu)
 	struct snd_kcontrol *kctl;
 	struct snd_card *card = emu->card;
 
-	if ((kctl = snd_ctl_new1(&snd_emu10k1x_spdif_mask_control, emu)) == NULL)
+	kctl = snd_ctl_new1(&snd_emu10k1x_spdif_mask_control, emu);
+	if (!kctl)
 		return -ENOMEM;
-	if ((err = snd_ctl_add(card, kctl)))
+	err = snd_ctl_add(card, kctl);
+	if (err)
 		return err;
-	if ((kctl = snd_ctl_new1(&snd_emu10k1x_shared_spdif, emu)) == NULL)
+	kctl = snd_ctl_new1(&snd_emu10k1x_shared_spdif, emu);
+	if (!kctl)
 		return -ENOMEM;
-	if ((err = snd_ctl_add(card, kctl)))
+	err = snd_ctl_add(card, kctl);
+	if (err)
 		return err;
-	if ((kctl = snd_ctl_new1(&snd_emu10k1x_spdif_control, emu)) == NULL)
+	kctl = snd_ctl_new1(&snd_emu10k1x_spdif_control, emu);
+	if (!kctl)
 		return -ENOMEM;
-	if ((err = snd_ctl_add(card, kctl)))
+	err = snd_ctl_add(card, kctl);
+	if (err)
 		return err;
 
 	return 0;
@@ -1488,7 +1501,8 @@ static int emu10k1x_midi_init(struct emu10k1x *emu,
 	struct snd_rawmidi *rmidi;
 	int err;
 
-	if ((err = snd_rawmidi_new(emu->card, name, device, 1, 1, &rmidi)) < 0)
+	err = snd_rawmidi_new(emu->card, name, device, 1, 1, &rmidi);
+	if (err < 0)
 		return err;
 	midi->emu = emu;
 	spin_lock_init(&midi->open_lock);
@@ -1511,7 +1525,8 @@ static int snd_emu10k1x_midi(struct emu10k1x *emu)
 	struct emu10k1x_midi *midi = &emu->midi;
 	int err;
 
-	if ((err = emu10k1x_midi_init(emu, midi, 0, "EMU10K1X MPU-401 (UART)")) < 0)
+	err = emu10k1x_midi_init(emu, midi, 0, "EMU10K1X MPU-401 (UART)");
+	if (err < 0)
 		return err;
 
 	midi->tx_enable = INTE_MIDITXENABLE;
@@ -1543,35 +1558,42 @@ static int snd_emu10k1x_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	if ((err = snd_emu10k1x_create(card, pci, &chip)) < 0) {
+	err = snd_emu10k1x_create(card, pci, &chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 
-	if ((err = snd_emu10k1x_pcm(chip, 0)) < 0) {
+	err = snd_emu10k1x_pcm(chip, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_emu10k1x_pcm(chip, 1)) < 0) {
+	err = snd_emu10k1x_pcm(chip, 1);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-	if ((err = snd_emu10k1x_pcm(chip, 2)) < 0) {
+	err = snd_emu10k1x_pcm(chip, 2);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 
-	if ((err = snd_emu10k1x_ac97(chip)) < 0) {
+	err = snd_emu10k1x_ac97(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 
-	if ((err = snd_emu10k1x_mixer(chip)) < 0) {
+	err = snd_emu10k1x_mixer(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	
-	if ((err = snd_emu10k1x_midi(chip)) < 0) {
+	err = snd_emu10k1x_midi(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -1583,7 +1605,8 @@ static int snd_emu10k1x_probe(struct pci_dev *pci,
 	sprintf(card->longname, "%s at 0x%lx irq %i",
 		card->shortname, chip->port, chip->irq);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2


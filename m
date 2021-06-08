Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C89CE39F8BF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:15:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25ABB1727;
	Tue,  8 Jun 2021 16:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25ABB1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161724;
	bh=IIW2J0kdOsSOcbwuJj1u/aju4t9jPYYj/iQcVJv2ePA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LaJnfWuUhtZ35delGHRWkcoJIzxCYCuvqQg2Wf6AI+UfRlaZR8iHWEAnyAg7PDOwm
	 gJjHyJqeKLiFDAEQTxt/SkGWUJceByKNP8A1SaFFA22rP1FEoK4DSO36WxIwK+c4/+
	 Z9zZ0KLmCzQDLHns3Lm6uvm3Oq+PwVf3QJSSEJA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65614F805D7;
	Tue,  8 Jun 2021 16:06:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0550CF805B0; Tue,  8 Jun 2021 16:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FEAFF804D8
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FEAFF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BR5HQhdH"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Gi+Mb+xw"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E9B611FDE0
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9T+JdEW44c8pK2gddTA0tnVWV89kpurUd5D+IyJdic=;
 b=BR5HQhdHfAFGQKcxcuPD43qkLcXc9vvYB3SRkf/7ZU5dSYWM12XUOAIvBW0nsRI6gn66Q8
 N9itAd1AwHuaP7Sipoo28HO0EovRiNiwEnYEKA05Pe6DArp3jmdYae0n93IwSdPcieyxWa
 m7aMLmQ4u6SMBQIs8RFnrCmKHQViDbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9T+JdEW44c8pK2gddTA0tnVWV89kpurUd5D+IyJdic=;
 b=Gi+Mb+xwBroN0kMZdR5k04Tl7jI76J5n2Q98wdO+7XYn+1Q+auaNz/urJGTk/5bx+k/BLn
 Ql44Ph4xCdoOz8AA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D9871A3B84;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 26/66] ALSA: es1968: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:00 +0200
Message-Id: <20210608140540.17885-27-tiwai@suse.de>
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

PCI ES1968 driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1968.c | 75 +++++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 30 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 5fa1861236f5..c038c1035c39 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -1600,7 +1600,8 @@ static int snd_es1968_capture_open(struct snd_pcm_substream *substream)
 	es->mode = ESM_MODE_CAPTURE;
 
 	/* get mixbuffer */
-	if ((es->mixbuf = snd_es1968_new_memory(chip, ESM_MIXBUF_SIZE)) == NULL) {
+	es->mixbuf = snd_es1968_new_memory(chip, ESM_MIXBUF_SIZE);
+	if (!es->mixbuf) {
 		snd_es1968_free_apu_pair(chip, apu1);
 		snd_es1968_free_apu_pair(chip, apu2);
 		kfree(es);
@@ -1695,11 +1696,13 @@ static void es1968_measure_clock(struct es1968 *chip)
 		chip->clock = 48000; /* default clock value */
 
 	/* search 2 APUs (although one apu is enough) */
-	if ((apu = snd_es1968_alloc_apu_pair(chip, ESM_APU_PCM_PLAY)) < 0) {
+	apu = snd_es1968_alloc_apu_pair(chip, ESM_APU_PCM_PLAY);
+	if (apu < 0) {
 		dev_err(chip->card->dev, "Hmm, cannot find empty APU pair!?\n");
 		return;
 	}
-	if ((memory = snd_es1968_new_memory(chip, CLOCK_MEASURE_BUFSIZE)) == NULL) {
+	memory = snd_es1968_new_memory(chip, CLOCK_MEASURE_BUFSIZE);
+	if (!memory) {
 		dev_warn(chip->card->dev,
 			 "cannot allocate dma buffer - using default clock %d\n",
 			 chip->clock);
@@ -1791,7 +1794,8 @@ snd_es1968_pcm(struct es1968 *chip, int device)
 	int err;
 
 	/* get DMA buffer */
-	if ((err = snd_es1968_init_dmabuf(chip)) < 0)
+	err = snd_es1968_init_dmabuf(chip);
+	if (err < 0)
 		return err;
 
 	/* set PCMBAR */
@@ -1800,9 +1804,10 @@ snd_es1968_pcm(struct es1968 *chip, int device)
 	wave_set_register(chip, 0x01FE, chip->dma.addr >> 12);
 	wave_set_register(chip, 0x01FF, chip->dma.addr >> 12);
 
-	if ((err = snd_pcm_new(chip->card, "ESS Maestro", device,
-			       chip->playback_streams,
-			       chip->capture_streams, &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "ESS Maestro", device,
+			  chip->playback_streams,
+			  chip->capture_streams, &pcm);
+	if (err < 0)
 		return err;
 
 	pcm->private_data = chip;
@@ -1953,7 +1958,8 @@ static irqreturn_t snd_es1968_interrupt(int irq, void *dev_id)
 	struct es1968 *chip = dev_id;
 	u32 event;
 
-	if (!(event = inb(chip->io_port + 0x1A)))
+	event = inb(chip->io_port + 0x1A);
+	if (!event)
 		return IRQ_NONE;
 
 	outw(inw(chip->io_port + 4) & 1, chip->io_port + 4);
@@ -2008,13 +2014,15 @@ snd_es1968_mixer(struct es1968 *chip)
 		.read = snd_es1968_ac97_read,
 	};
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, NULL, &pbus);
+	if (err < 0)
 		return err;
 	pbus->no_vra = 1; /* ES1968 doesn't need VRA */
 
 	memset(&ac97, 0, sizeof(ac97));
 	ac97.private_data = chip;
-	if ((err = snd_ac97_mixer(pbus, &ac97, &chip->ac97)) < 0)
+	err = snd_ac97_mixer(pbus, &ac97, &chip->ac97);
+	if (err < 0)
 		return err;
 
 #ifndef CONFIG_SND_ES1968_INPUT
@@ -2661,7 +2669,8 @@ static int snd_es1968_create(struct snd_card *card,
 	*chip_ret = NULL;
 
 	/* enable PCI device */
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 28 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28))) {
@@ -2692,7 +2701,8 @@ static int snd_es1968_create(struct snd_card *card,
 	chip->playback_streams = play_streams;
 	chip->capture_streams = capt_streams;
 
-	if ((err = pci_request_regions(pci, "ESS Maestro")) < 0) {
+	err = pci_request_regions(pci, "ESS Maestro");
+	if (err < 0) {
 		kfree(chip);
 		pci_disable_device(pci);
 		return err;
@@ -2739,7 +2749,8 @@ static int snd_es1968_create(struct snd_card *card,
 
 	snd_es1968_chip_init(chip);
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_es1968_free(chip);
 		return err;
 	}
@@ -2804,14 +2815,15 @@ static int snd_es1968_probe(struct pci_dev *pci,
 		total_bufsize[dev] = 128;
 	if (total_bufsize[dev] > 4096)
 		total_bufsize[dev] = 4096;
-	if ((err = snd_es1968_create(card, pci,
-				     total_bufsize[dev] * 1024, /* in bytes */
-				     pcm_substreams_p[dev], 
-				     pcm_substreams_c[dev],
-				     pci_id->driver_data,
-				     use_pm[dev],
-				     radio_nr[dev],
-				     &chip)) < 0) {
+	err = snd_es1968_create(card, pci,
+				total_bufsize[dev] * 1024, /* in bytes */
+				pcm_substreams_p[dev],
+				pcm_substreams_c[dev],
+				pci_id->driver_data,
+				use_pm[dev],
+				radio_nr[dev],
+				&chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -2832,12 +2844,14 @@ static int snd_es1968_probe(struct pci_dev *pci,
 		break;
 	}
 
-	if ((err = snd_es1968_pcm(chip, 0)) < 0) {
+	err = snd_es1968_pcm(chip, 0);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 
-	if ((err = snd_es1968_mixer(chip)) < 0) {
+	err = snd_es1968_mixer(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -2855,13 +2869,13 @@ static int snd_es1968_probe(struct pci_dev *pci,
 		}
 	}
 	if (enable_mpu[dev]) {
-		if ((err = snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401,
-					       chip->io_port + ESM_MPU401_PORT,
-					       MPU401_INFO_INTEGRATED |
-					       MPU401_INFO_IRQ_HOOK,
-					       -1, &chip->rmidi)) < 0) {
+		err = snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401,
+					  chip->io_port + ESM_MPU401_PORT,
+					  MPU401_INFO_INTEGRATED |
+					  MPU401_INFO_IRQ_HOOK,
+					  -1, &chip->rmidi);
+		if (err < 0)
 			dev_warn(card->dev, "skipping MPU-401 MIDI support..\n");
-		}
 	}
 
 	snd_es1968_create_gameport(chip, dev);
@@ -2882,7 +2896,8 @@ static int snd_es1968_probe(struct pci_dev *pci,
 	sprintf(card->longname, "%s at 0x%lx, irq %i",
 		card->shortname, chip->io_port, chip->irq);
 
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
-- 
2.26.2


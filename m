Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2013C7273
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D53A21741;
	Tue, 13 Jul 2021 16:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D53A21741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187254;
	bh=MM8nAbkRXnqXeWcb/DQsJlSaUL9thQCCxkxM8LTIGkY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rZE/0WDVN8InO/jJuYfedMPc/ybm3ZwYjSjumKqjbFWZpduEt2rSDnT/nq7A7lbO/
	 m3ZdjyY3NAwUnKscapR4w9yuyJJ5PtOWoTjevjTrcikZ1RyIQblOa2FaWxpUgUNrMk
	 wCL0FzHVcPKUswMgq4V++/q24xl3h7kyCTl7rX1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD6F0F805C0;
	Tue, 13 Jul 2021 16:30:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F855F80571; Tue, 13 Jul 2021 16:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50166F8020C
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50166F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="o4Vwv4h0"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ULIMK2SQ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 28DE822890
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+VjR1w11Q3F9wCC/be1IS6Bth9NT0VM8G6Mbvn1q2U=;
 b=o4Vwv4h0t29VPrCI/NpQw7hYJZQAr7MehOarst+Lax0byCbMUHbGRvltiUokBGWNdQJq5f
 huA8e3lcBOYtRQbv/L6KT5FwLNFzmidCYZiIzKeGaagWH0yn60m2FT4xfgLmfB0uDuDne2
 qF/lAIZbGwINNjvKADQwcugfxDH8j1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+VjR1w11Q3F9wCC/be1IS6Bth9NT0VM8G6Mbvn1q2U=;
 b=ULIMK2SQtnrOzzwzQd0h4I53kyVZ9my6wv2UBSh8NLbzWJUTaFXArfKpi0CG+ujV3Z0Rh8
 RP/1fMRhpptlhpCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 17491A3B8A;
 Tue, 13 Jul 2021 14:29:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 28/51] ALSA: ca0106: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:34 +0200
Message-Id: <20210713142857.19654-29-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713142857.19654-1-tiwai@suse.de>
References: <20210713142857.19654-1-tiwai@suse.de>
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

This patch converts the resource management in PCI ca0106 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ca0106/ca0106.h      |   3 +-
 sound/pci/ca0106/ca0106_main.c | 114 +++++++++------------------------
 2 files changed, 30 insertions(+), 87 deletions(-)

diff --git a/sound/pci/ca0106/ca0106.h b/sound/pci/ca0106/ca0106.h
index 62a22ca3b9de..f246e6094289 100644
--- a/sound/pci/ca0106/ca0106.h
+++ b/sound/pci/ca0106/ca0106.h
@@ -667,7 +667,6 @@ struct snd_ca0106 {
 	struct pci_dev *pci;
 
 	unsigned long port;
-	struct resource *res_port;
 	int irq;
 
 	unsigned int serial;            /* serial number */
@@ -688,7 +687,7 @@ struct snd_ca0106 {
 	u8 i2c_capture_volume[4][2];
 	int capture_mic_line_in;
 
-	struct snd_dma_buffer buffer;
+	struct snd_dma_buffer *buffer;
 
 	struct snd_ca_midi midi;
 	struct snd_ca_midi midi2;
diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index 99778711006a..36fb150b72fb 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -718,7 +718,7 @@ static int snd_ca0106_pcm_prepare_playback(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_ca0106_pcm *epcm = runtime->private_data;
 	int channel = epcm->channel_id;
-	u32 *table_base = (u32 *)(emu->buffer.area+(8*16*channel));
+	u32 *table_base = (u32 *)(emu->buffer->area+(8*16*channel));
 	u32 period_size_bytes = frames_to_bytes(runtime, runtime->period_size);
 	u32 hcfg_mask = HCFG_PLAYBACK_S32_LE;
 	u32 hcfg_set = 0x00000000;
@@ -746,7 +746,7 @@ static int snd_ca0106_pcm_prepare_playback(struct snd_pcm_substream *substream)
 		   runtime->dma_addr, runtime->dma_area, table_base);
 	dev_dbg(emu->card->dev,
 		"dma_addr=%x, dma_area=%p, dma_bytes(size)=%x\n",
-		   emu->buffer.addr, emu->buffer.area, emu->buffer.bytes);
+		   emu->buffer->addr, emu->buffer->area, emu->buffer->bytes);
 #endif /* debug */
 	/* Rate can be set per channel. */
 	/* reg40 control host to fifo */
@@ -796,13 +796,13 @@ static int snd_ca0106_pcm_prepare_playback(struct snd_pcm_substream *substream)
 	reg71 = (reg71 & ~reg71_mask) | reg71_set;
 	snd_ca0106_ptr_write(emu, 0x71, 0, reg71);
 
-	/* FIXME: Check emu->buffer.size before actually writing to it. */
+	/* FIXME: Check emu->buffer->size before actually writing to it. */
         for(i=0; i < runtime->periods; i++) {
 		table_base[i*2] = runtime->dma_addr + (i * period_size_bytes);
 		table_base[i*2+1] = period_size_bytes << 16;
 	}
  
-	snd_ca0106_ptr_write(emu, PLAYBACK_LIST_ADDR, channel, emu->buffer.addr+(8*16*channel));
+	snd_ca0106_ptr_write(emu, PLAYBACK_LIST_ADDR, channel, emu->buffer->addr+(8*16*channel));
 	snd_ca0106_ptr_write(emu, PLAYBACK_LIST_SIZE, channel, (runtime->periods - 1) << 19);
 	snd_ca0106_ptr_write(emu, PLAYBACK_LIST_PTR, channel, 0);
 	snd_ca0106_ptr_write(emu, PLAYBACK_DMA_ADDR, channel, runtime->dma_addr);
@@ -853,7 +853,7 @@ static int snd_ca0106_pcm_prepare_capture(struct snd_pcm_substream *substream)
 		   runtime->dma_addr, runtime->dma_area, table_base);
 	dev_dbg(emu->card->dev,
 		"dma_addr=%x, dma_area=%p, dma_bytes(size)=%x\n",
-		   emu->buffer.addr, emu->buffer.area, emu->buffer.bytes);
+		   emu->buffer->addr, emu->buffer->area, emu->buffer->bytes);
 #endif /* debug */
 	/* reg71 controls ADC rate. */
 	switch (runtime->rate) {
@@ -1183,32 +1183,11 @@ static int snd_ca0106_ac97(struct snd_ca0106 *chip)
 
 static void ca0106_stop_chip(struct snd_ca0106 *chip);
 
-static int snd_ca0106_free(struct snd_ca0106 *chip)
+static void snd_ca0106_free(struct snd_card *card)
 {
-	if (chip->res_port != NULL) {
-		/* avoid access to already used hardware */
-		ca0106_stop_chip(chip);
-	}
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-	// release the data
-#if 1
-	if (chip->buffer.area)
-		snd_dma_free_pages(&chip->buffer);
-#endif
-
-	// release the i/o port
-	release_and_free_resource(chip->res_port);
-
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
+	struct snd_ca0106 *chip = card->private_data;
 
-static int snd_ca0106_dev_free(struct snd_device *device)
-{
-	struct snd_ca0106 *chip = device->device_data;
-	return snd_ca0106_free(chip);
+	ca0106_stop_chip(chip);
 }
 
 static irqreturn_t snd_ca0106_interrupt(int irq, void *dev_id)
@@ -1594,50 +1573,33 @@ static void ca0106_stop_chip(struct snd_ca0106 *chip)
 }
 
 static int snd_ca0106_create(int dev, struct snd_card *card,
-					 struct pci_dev *pci,
-					 struct snd_ca0106 **rchip)
+			     struct pci_dev *pci)
 {
-	struct snd_ca0106 *chip;
+	struct snd_ca0106 *chip = card->private_data;
 	const struct snd_ca0106_details *c;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_ca0106_dev_free,
-	};
-
-	*rchip = NULL;
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_err(card->dev, "error to set 32bit mask DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
 
 	spin_lock_init(&chip->emu_lock);
 
+	err = pci_request_regions(pci, "snd_ca0106");
+	if (err < 0)
+		return err;
 	chip->port = pci_resource_start(pci, 0);
-	chip->res_port = request_region(chip->port, 0x20, "snd_ca0106");
-	if (!chip->res_port) {
-		snd_ca0106_free(chip);
-		dev_err(card->dev, "cannot allocate the port\n");
-		return -EBUSY;
-	}
 
-	if (request_irq(pci->irq, snd_ca0106_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, chip)) {
-		snd_ca0106_free(chip);
+	if (devm_request_irq(&pci->dev, pci->irq, snd_ca0106_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "cannot grab irq\n");
 		return -EBUSY;
 	}
@@ -1645,11 +1607,9 @@ static int snd_ca0106_create(int dev, struct snd_card *card,
 	card->sync_irq = chip->irq;
 
 	/* This stores the periods table. */
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				1024, &chip->buffer) < 0) {
-		snd_ca0106_free(chip);
+	chip->buffer = snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV, 1024);
+	if (!chip->buffer)
 		return -ENOMEM;
-	}
 
 	pci_set_master(pci);
 	/* read serial */
@@ -1678,13 +1638,6 @@ static int snd_ca0106_create(int dev, struct snd_card *card,
 		c->name, chip->port, chip->irq);
 
 	ca0106_init_chip(chip, 0);
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_ca0106_free(chip);
-		return err;
-	}
-	*rchip = chip;
 	return 0;
 }
 
@@ -1787,36 +1740,37 @@ static int snd_ca0106_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
-	err = snd_ca0106_create(dev, card, pci, &chip);
+	err = snd_ca0106_create(dev, card, pci);
 	if (err < 0)
-		goto error;
-	card->private_data = chip;
+		return err;
+	card->private_free = snd_ca0106_free;
 
 	for (i = 0; i < 4; i++) {
 		err = snd_ca0106_pcm(chip, i);
 		if (err < 0)
-			goto error;
+			return err;
 	}
 
 	if (chip->details->ac97 == 1) {
 		/* The SB0410 and SB0413 do not have an AC97 chip. */
 		err = snd_ca0106_ac97(chip);
 		if (err < 0)
-			goto error;
+			return err;
 	}
 	err = snd_ca0106_mixer(chip);
 	if (err < 0)
-		goto error;
+		return err;
 
 	dev_dbg(card->dev, "probe for MIDI channel A ...");
 	err = snd_ca0106_midi(chip, CA0106_MIDI_CHAN_A);
 	if (err < 0)
-		goto error;
+		return err;
 	dev_dbg(card->dev, " done.\n");
 
 #ifdef CONFIG_SND_PROC_FS
@@ -1825,20 +1779,11 @@ static int snd_ca0106_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
-
- error:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_ca0106_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1894,7 +1839,6 @@ static struct pci_driver ca0106_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ca0106_ids,
 	.probe = snd_ca0106_probe,
-	.remove = snd_ca0106_remove,
 	.driver = {
 		.pm = SND_CA0106_PM_OPS,
 	},
-- 
2.26.2


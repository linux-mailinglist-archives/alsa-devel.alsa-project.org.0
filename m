Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 832BB3C727B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F00FD1749;
	Tue, 13 Jul 2021 16:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F00FD1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187296;
	bh=koSf+qZIofxM1FbFMkCN5TR+RDLzM7vpaFnwA3onZhI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uUJRiDK+cL4K8YI5pMpD6EeAt7JZ80yxHpHdyAvImXU4ppjHNc9MSjRywabI+1U2A
	 4ae2tmVyEM6AwzYU7gt1UDokMY0WLhIeSN2vmDqQufFJDyuDv7Pj8S+wB7jxas2MQ3
	 HZYEBwfd0fwthTyu/jm/i9oUhNa2Zq/zzbkd/S64=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2632F805C6;
	Tue, 13 Jul 2021 16:30:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFD88F8057D; Tue, 13 Jul 2021 16:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0701F80528
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0701F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="IqOZS4iS"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="/jrD4dRJ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9AE8E201E4
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkA9CWpMRHhH3XexDHueFTfUV/dzJPEvgrksSDbn66M=;
 b=IqOZS4iSAT9Es/7V99HYVeC9JfbTOJKbxqtvSXZfnXV+g7Os3cDgH04Gux2JbLlW42lldd
 5L8Po84nSgwXjuhBxh0pRV/S1dWAdGB+fOIZS/8RdnNHoC+qJeyhlcmhjHi8qAEUmXhyu1
 fkwxvi0enu+utF3s3/cFIfFWio1jBXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186575;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkA9CWpMRHhH3XexDHueFTfUV/dzJPEvgrksSDbn66M=;
 b=/jrD4dRJzR0yX9iyB2yx0vR0S/GCtMwByycNRbHx7xAgeCKdy2PsoDxlsnp7x+Sg0ExsRv
 3dXVc/QlLNv5KUBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 94267A3B90;
 Tue, 13 Jul 2021 14:29:35 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 33/51] ALSA: emu10k1x: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:39 +0200
Message-Id: <20210713142857.19654-34-tiwai@suse.de>
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

This patch converts the resource management in PCI emu10k1x driver
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, the page allocations
are done with the devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emu10k1x.c | 128 ++++++++---------------------------
 1 file changed, 30 insertions(+), 98 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 89b0f3884067..c49c44dc1082 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -216,7 +216,6 @@ struct emu10k1x {
 	struct pci_dev *pci;
 
 	unsigned long port;
-	struct resource *res_port;
 	int irq;
 
 	unsigned char revision;		/* chip revision */
@@ -233,7 +232,7 @@ struct emu10k1x {
 	struct emu10k1x_voice capture_voice;
 	u32 spdif_bits[3]; // SPDIF out setup
 
-	struct snd_dma_buffer dma_buffer;
+	struct snd_dma_buffer *dma_buffer;
 
 	struct emu10k1x_midi midi;
 };
@@ -442,7 +441,7 @@ static int snd_emu10k1x_pcm_prepare(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct emu10k1x_pcm *epcm = runtime->private_data;
 	int voice = epcm->voice->number;
-	u32 *table_base = (u32 *)(emu->dma_buffer.area+1024*voice);
+	u32 *table_base = (u32 *)(emu->dma_buffer->area+1024*voice);
 	u32 period_size_bytes = frames_to_bytes(runtime, runtime->period_size);
 	int i;
 	
@@ -451,7 +450,7 @@ static int snd_emu10k1x_pcm_prepare(struct snd_pcm_substream *substream)
 		*table_base++=period_size_bytes<<16;
 	}
 
-	snd_emu10k1x_ptr_write(emu, PLAYBACK_LIST_ADDR, voice, emu->dma_buffer.addr+1024*voice);
+	snd_emu10k1x_ptr_write(emu, PLAYBACK_LIST_ADDR, voice, emu->dma_buffer->addr+1024*voice);
 	snd_emu10k1x_ptr_write(emu, PLAYBACK_LIST_SIZE, voice, (runtime->periods - 1) << 19);
 	snd_emu10k1x_ptr_write(emu, PLAYBACK_LIST_PTR, voice, 0);
 	snd_emu10k1x_ptr_write(emu, PLAYBACK_POINTER, voice, 0);
@@ -737,37 +736,15 @@ static int snd_emu10k1x_ac97(struct emu10k1x *chip)
 	return snd_ac97_mixer(pbus, &ac97, &chip->ac97);
 }
 
-static int snd_emu10k1x_free(struct emu10k1x *chip)
+static void snd_emu10k1x_free(struct snd_card *card)
 {
+	struct emu10k1x *chip = card->private_data;
+
 	snd_emu10k1x_ptr_write(chip, TRIGGER_CHANNEL, 0, 0);
 	// disable interrupts
 	outl(0, chip->port + INTE);
 	// disable audio
 	outl(HCFG_LOCKSOUNDCACHE, chip->port + HCFG);
-
-	/* release the irq */
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-
-	// release the i/o port
-	release_and_free_resource(chip->res_port);
-
-	// release the DMA
-	if (chip->dma_buffer.area) {
-		snd_dma_free_pages(&chip->dma_buffer);
-	}
-
-	pci_disable_device(chip->pci);
-
-	// release the data
-	kfree(chip);
-	return 0;
-}
-
-static int snd_emu10k1x_dev_free(struct snd_device *device)
-{
-	struct emu10k1x *chip = device->device_data;
-	return snd_emu10k1x_free(chip);
 }
 
 static irqreturn_t snd_emu10k1x_interrupt(int irq, void *dev_id)
@@ -885,34 +862,21 @@ static int snd_emu10k1x_pcm(struct emu10k1x *emu, int device)
 }
 
 static int snd_emu10k1x_create(struct snd_card *card,
-			       struct pci_dev *pci,
-			       struct emu10k1x **rchip)
+			       struct pci_dev *pci)
 {
-	struct emu10k1x *chip;
+	struct emu10k1x *chip = card->private_data;
 	int err;
 	int ch;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_emu10k1x_dev_free,
-	};
-
-	*rchip = NULL;
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(28)) < 0) {
 		dev_err(card->dev, "error to set 28bit mask DMA\n");
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
@@ -920,29 +884,24 @@ static int snd_emu10k1x_create(struct snd_card *card,
 	spin_lock_init(&chip->emu_lock);
 	spin_lock_init(&chip->voice_lock);
   
+	err = pci_request_regions(pci, "EMU10K1X");
+	if (err < 0)
+		return err;
 	chip->port = pci_resource_start(pci, 0);
-	chip->res_port = request_region(chip->port, 8, "EMU10K1X");
-	if (!chip->res_port) {
-		dev_err(card->dev, "cannot allocate the port 0x%lx\n",
-			chip->port);
-		snd_emu10k1x_free(chip);
-		return -EBUSY;
-	}
 
-	if (request_irq(pci->irq, snd_emu10k1x_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_emu10k1x_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "cannot grab irq %d\n", pci->irq);
-		snd_emu10k1x_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_emu10k1x_free;
   
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				4 * 1024, &chip->dma_buffer) < 0) {
-		snd_emu10k1x_free(chip);
+	chip->dma_buffer = snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV,
+						4 * 1024);
+	if (!chip->dma_buffer)
 		return -ENOMEM;
-	}
 
 	pci_set_master(pci);
 	/* read revision & serial */
@@ -998,12 +957,6 @@ static int snd_emu10k1x_create(struct snd_card *card,
 
 	outl(HCFG_LOCKSOUNDCACHE|HCFG_AUDIOENABLE, chip->port+HCFG);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_emu10k1x_free(chip);
-		return err;
-	}
-	*rchip = chip;
 	return 0;
 }
 
@@ -1553,50 +1506,37 @@ static int snd_emu10k1x_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
-	err = snd_emu10k1x_create(card, pci, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_emu10k1x_create(card, pci);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_emu10k1x_pcm(chip, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_emu10k1x_pcm(chip, 1);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_emu10k1x_pcm(chip, 2);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_emu10k1x_ac97(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_emu10k1x_mixer(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	
 	err = snd_emu10k1x_midi(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	snd_emu10k1x_proc_init(chip);
 
@@ -1606,21 +1546,14 @@ static int snd_emu10k1x_probe(struct pci_dev *pci,
 		card->shortname, chip->port, chip->irq);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
 }
 
-static void snd_emu10k1x_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 // PCI IDs
 static const struct pci_device_id snd_emu10k1x_ids[] = {
 	{ PCI_VDEVICE(CREATIVE, 0x0006), 0 },	/* Dell OEM version (EMU10K1) */
@@ -1633,7 +1566,6 @@ static struct pci_driver emu10k1x_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_emu10k1x_ids,
 	.probe = snd_emu10k1x_probe,
-	.remove = snd_emu10k1x_remove,
 };
 
 module_pci_driver(emu10k1x_driver);
-- 
2.26.2


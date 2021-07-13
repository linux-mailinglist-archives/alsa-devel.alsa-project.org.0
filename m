Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770683C728A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B62E1743;
	Tue, 13 Jul 2021 16:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B62E1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187510;
	bh=YolAqSXetGAUVxgLobS1MDHXC3XY4a4cUyX0dAPjSsE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VcT8sObSRtPoC13RprSozo8z2dQfP+w2Aw/p5Q2D8pAqKCLNibib55ymrfbvOI/z3
	 PV0R3SLjtCke7L63yySCP48sYRs/aDNiygdOPn+0GvNC36ZDh0hBkmbR6Eb+yZUAki
	 Vyax2BGU6ZROqVZBsQRoXxR0/qOC+oBR5SOoVme4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88338F80614;
	Tue, 13 Jul 2021 16:30:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F981F80537; Tue, 13 Jul 2021 16:30:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB84BF80527
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB84BF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="H8fAtcGl"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="qdzLF6FK"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7A6F222837
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFYQmvZBz/Rv+iOemGkk9WuHcg2BLKGc66cW/sYHUBY=;
 b=H8fAtcGlmZkgtwjGHg26gAfdY3BNZA2OHckk1cO036VRhDtHkTYXeN8Tned1nD3QgNGJpo
 UomdhxKKgLVQfKZR6r6vGwFTCrK/SVxo01lx58rlUD7Y9qjD9DBb8lhyrFY1J0tbpcb0JU
 25BvBuGgkPWE06dknrfbx3HWC0ApjFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFYQmvZBz/Rv+iOemGkk9WuHcg2BLKGc66cW/sYHUBY=;
 b=qdzLF6FKUJ4+0Y5KTdpxYGDW5FmK8H26Mj+ieeCjtrtI5IgDzmW4q+Pbm9SQZU3W+g1LLW
 S4EAYniAWE/MbHAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 69041A3B88;
 Tue, 13 Jul 2021 14:29:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 37/51] ALSA: lola: Allocate resources with device-managed APIs
Date: Tue, 13 Jul 2021 16:28:43 +0200
Message-Id: <20210713142857.19654-38-tiwai@suse.de>
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

This patch converts the resource management in PCI lola driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, the page allocations are done
with the devres helper, and the card object release is managed now via
card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lola/lola.c     | 127 +++++++++++---------------------------
 sound/pci/lola/lola.h     |   5 +-
 sound/pci/lola/lola_pcm.c |  20 +++---
 3 files changed, 44 insertions(+), 108 deletions(-)

diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index 03b4be44bb26..5269a1d396a5 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -344,20 +344,18 @@ static void lola_irq_disable(struct lola *chip)
 
 static int setup_corb_rirb(struct lola *chip)
 {
-	int err;
 	unsigned char tmp;
 	unsigned long end_time;
 
-	err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-				  &chip->pci->dev,
-				  PAGE_SIZE, &chip->rb);
-	if (err < 0)
-		return err;
+	chip->rb = snd_devm_alloc_pages(&chip->pci->dev, SNDRV_DMA_TYPE_DEV,
+					PAGE_SIZE);
+	if (!chip->rb)
+		return -ENOMEM;
 
-	chip->corb.addr = chip->rb.addr;
-	chip->corb.buf = (__le32 *)chip->rb.area;
-	chip->rirb.addr = chip->rb.addr + 2048;
-	chip->rirb.buf = (__le32 *)(chip->rb.area + 2048);
+	chip->corb.addr = chip->rb->addr;
+	chip->corb.buf = (__le32 *)chip->rb->area;
+	chip->rirb.addr = chip->rb->addr + 2048;
+	chip->rirb.buf = (__le32 *)(chip->rb->area + 2048);
 
 	/* disable ringbuffer DMAs */
 	lola_writeb(chip, BAR0, RIRBCTL, 0);
@@ -529,56 +527,31 @@ static void lola_stop_hw(struct lola *chip)
 	lola_irq_disable(chip);
 }
 
-static void lola_free(struct lola *chip)
+static void lola_free(struct snd_card *card)
 {
+	struct lola *chip = card->private_data;
+
 	if (chip->initialized)
 		lola_stop_hw(chip);
-	lola_free_pcm(chip);
 	lola_free_mixer(chip);
-	if (chip->irq >= 0)
-		free_irq(chip->irq, (void *)chip);
-	iounmap(chip->bar[0].remap_addr);
-	iounmap(chip->bar[1].remap_addr);
-	if (chip->rb.area)
-		snd_dma_free_pages(&chip->rb);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
 }
 
-static int lola_dev_free(struct snd_device *device)
+static int lola_create(struct snd_card *card, struct pci_dev *pci, int dev)
 {
-	lola_free(device->device_data);
-	return 0;
-}
-
-static int lola_create(struct snd_card *card, struct pci_dev *pci,
-		       int dev, struct lola **rchip)
-{
-	struct lola *chip;
+	struct lola *chip = card->private_data;
 	int err;
 	unsigned int dever;
-	static const struct snd_device_ops ops = {
-		.dev_free = lola_dev_free,
-	};
 
-	*rchip = NULL;
-
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (!chip) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&chip->reg_lock);
 	mutex_init(&chip->open_mutex);
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
+	card->private_free = lola_free;
 
 	chip->granularity = granularity[dev];
 	switch (chip->granularity) {
@@ -607,34 +580,25 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci,
 		chip->sample_rate_min = 16000;
 	}
 
-	err = pci_request_regions(pci, DRVNAME);
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	err = pcim_iomap_regions(pci, (1 << 0) | (1 << 2), DRVNAME);
+	if (err < 0)
 		return err;
-	}
 
 	chip->bar[0].addr = pci_resource_start(pci, 0);
-	chip->bar[0].remap_addr = pci_ioremap_bar(pci, 0);
+	chip->bar[0].remap_addr = pcim_iomap_table(pci)[0];
 	chip->bar[1].addr = pci_resource_start(pci, 2);
-	chip->bar[1].remap_addr = pci_ioremap_bar(pci, 2);
-	if (!chip->bar[0].remap_addr || !chip->bar[1].remap_addr) {
-		dev_err(chip->card->dev, "ioremap error\n");
-		err = -ENXIO;
-		goto errout;
-	}
+	chip->bar[1].remap_addr = pcim_iomap_table(pci)[2];
 
 	pci_set_master(pci);
 
 	err = reset_controller(chip);
 	if (err < 0)
-		goto errout;
+		return err;
 
-	if (request_irq(pci->irq, lola_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, lola_interrupt, IRQF_SHARED,
+			     KBUILD_MODNAME, chip)) {
 		dev_err(chip->card->dev, "unable to grab IRQ %d\n", pci->irq);
-		err = -EBUSY;
-		goto errout;
+		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
@@ -653,19 +617,12 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci,
 	    (!chip->pcm[CAPT].num_streams &&
 	     !chip->pcm[PLAY].num_streams)) {
 		dev_err(chip->card->dev, "invalid DEVER = %x\n", dever);
-		err = -EINVAL;
-		goto errout;
+		return -EINVAL;
 	}
 
 	err = setup_corb_rirb(chip);
 	if (err < 0)
-		goto errout;
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		dev_err(chip->card->dev, "Error creating device [card]!\n");
-		goto errout;
-	}
+		return err;
 
 	strcpy(card->driver, "Lola");
 	strscpy(card->shortname, "Digigram Lola", sizeof(card->shortname));
@@ -677,12 +634,7 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci,
 	lola_irq_enable(chip);
 
 	chip->initialized = 1;
-	*rchip = chip;
 	return 0;
-
- errout:
-	lola_free(chip);
-	return err;
 }
 
 static int lola_probe(struct pci_dev *pci,
@@ -700,47 +652,39 @@ static int lola_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0) {
 		dev_err(&pci->dev, "Error creating card!\n");
 		return err;
 	}
+	chip = card->private_data;
 
-	err = lola_create(card, pci, dev, &chip);
+	err = lola_create(card, pci, dev);
 	if (err < 0)
-		goto out_free;
-	card->private_data = chip;
+		return err;
 
 	err = lola_parse_tree(chip);
 	if (err < 0)
-		goto out_free;
+		return err;
 
 	err = lola_create_pcm(chip);
 	if (err < 0)
-		goto out_free;
+		return err;
 
 	err = lola_create_mixer(chip);
 	if (err < 0)
-		goto out_free;
+		return err;
 
 	lola_proc_debug_new(chip);
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto out_free;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	dev++;
-	return err;
-out_free:
-	snd_card_free(card);
-	return err;
-}
-
-static void lola_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
+	return 0;
 }
 
 /* PCI IDs */
@@ -755,7 +699,6 @@ static struct pci_driver lola_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = lola_ids,
 	.probe = lola_probe,
-	.remove = lola_remove,
 };
 
 module_pci_driver(lola_driver);
diff --git a/sound/pci/lola/lola.h b/sound/pci/lola/lola.h
index 8a598aa40bf3..0ff772cf66e6 100644
--- a/sound/pci/lola/lola.h
+++ b/sound/pci/lola/lola.h
@@ -303,7 +303,7 @@ struct lola_stream {
 
 struct lola_pcm {
 	unsigned int num_streams;
-	struct snd_dma_buffer bdl; /* BDL buffer */
+	struct snd_dma_buffer *bdl; /* BDL buffer */
 	struct lola_stream streams[MAX_STREAM_COUNT];
 };
 
@@ -328,7 +328,7 @@ struct lola {
 	unsigned int last_cmd_nid, last_verb, last_data, last_extdata;
 
 	/* CORB/RIRB buffers */
-	struct snd_dma_buffer rb;
+	struct snd_dma_buffer *rb;
 
 	/* unsolicited events */
 	unsigned int last_unsol_res;
@@ -480,7 +480,6 @@ int lola_codec_flush(struct lola *chip);
 
 /* PCM */
 int lola_create_pcm(struct lola *chip);
-void lola_free_pcm(struct lola *chip);
 int lola_init_pcm(struct lola *chip, int dir, int *nidp);
 void lola_pcm_update(struct lola *chip, struct lola_pcm *pcm, unsigned int bits);
 
diff --git a/sound/pci/lola/lola_pcm.c b/sound/pci/lola/lola_pcm.c
index 684faaf40f31..738ec987000a 100644
--- a/sound/pci/lola/lola_pcm.c
+++ b/sound/pci/lola/lola_pcm.c
@@ -348,7 +348,7 @@ static int lola_setup_periods(struct lola *chip, struct lola_pcm *pcm,
 	periods = str->bufsize / period_bytes;
 
 	/* program the initial BDL entries */
-	bdl = (__le32 *)(pcm->bdl.area + LOLA_BDL_ENTRY_SIZE * str->index);
+	bdl = (__le32 *)(pcm->bdl->area + LOLA_BDL_ENTRY_SIZE * str->index);
 	ofs = 0;
 	str->frags = 0;
 	for (i = 0; i < periods; i++) {
@@ -433,7 +433,7 @@ static int lola_setup_controller(struct lola *chip, struct lola_pcm *pcm,
 		return -EINVAL;
 
 	/* set up BDL */
-	bdl = pcm->bdl.addr + LOLA_BDL_ENTRY_SIZE * str->index;
+	bdl = pcm->bdl->addr + LOLA_BDL_ENTRY_SIZE * str->index;
 	lola_dsd_write(chip, str->dsd, BDPL, (u32)bdl);
 	lola_dsd_write(chip, str->dsd, BDPU, upper_32_bits(bdl));
 	/* program the stream LVI (last valid index) of the BDL */
@@ -588,11 +588,11 @@ int lola_create_pcm(struct lola *chip)
 	int i, err;
 
 	for (i = 0; i < 2; i++) {
-		err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-					  &chip->pci->dev,
-					  PAGE_SIZE, &chip->pcm[i].bdl);
-		if (err < 0)
-			return err;
+		chip->pcm[i].bdl =
+			snd_devm_alloc_pages(&chip->pci->dev, SNDRV_DMA_TYPE_DEV,
+					     PAGE_SIZE);
+		if (!chip->pcm[i].bdl)
+			return -ENOMEM;
 	}
 
 	err = snd_pcm_new(chip->card, "Digigram Lola", 0,
@@ -614,12 +614,6 @@ int lola_create_pcm(struct lola *chip)
 	return 0;
 }
 
-void lola_free_pcm(struct lola *chip)
-{
-	snd_dma_free_pages(&chip->pcm[0].bdl);
-	snd_dma_free_pages(&chip->pcm[1].bdl);
-}
-
 /*
  */
 
-- 
2.26.2


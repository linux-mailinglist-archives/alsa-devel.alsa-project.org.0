Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C4A39F901
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:25:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D8E7184E;
	Tue,  8 Jun 2021 16:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D8E7184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162318;
	bh=uGdzMECVlQ4UJcv6HTFBWtP9rO7Qh19Bn2RLmMlJJPE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n28G1NKDfkCGn5novSHnaHFccrOuNxmHLUUvB4OGm5ZhJFDo3rjG6OAn+IApya3vI
	 v529VyBAfe0h6cybrZ39TcxW3jc0djlz8KRzeptTEadxbxXS0BsmvKG5jV1VYvhDsU
	 QqC5YU8ynbRlwJs55zHZCvk05EenxBYPfHWD/hO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48DA2F8067B;
	Tue,  8 Jun 2021 16:07:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBE18F8061B; Tue,  8 Jun 2021 16:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB0B2F80508
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB0B2F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="KjLLyrL1"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="EiSKJRRP"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1A8EA219F1
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=etsNqx9FEMj7bKbj4D8wStPv8YUo0zrtccZ0vVE/KEU=;
 b=KjLLyrL1RDGBDGQau3huuwgntvDxwMvvxyGwHU8veX2ly5z9benTTEvE/3587F+hEemL+O
 QNUGFjdpSck7pA6kECESN+sb7tcIVGm3piGlituXjAMQJllEdSRgiIpPd5/b4usCJTTZTf
 UDnq9+Y8ZmhUpyAIXPl8FuD+AMLYGGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=etsNqx9FEMj7bKbj4D8wStPv8YUo0zrtccZ0vVE/KEU=;
 b=EiSKJRRP7Mr3YPXFBK1ojjtPlrdIsgQ6w8j4GGmXeDQ+zxLhsO9ZpvyBBkh1bUo7MK3Aig
 sqVZZBavosdvLoCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 0ABF4A3B89;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 47/66] ALSA: riptide: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:21 +0200
Message-Id: <20210608140540.17885-48-tiwai@suse.de>
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

PCI riptide driver code contains a few assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/riptide/riptide.c | 88 ++++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 35 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 56827db97239..709a1a2cde20 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1087,9 +1087,15 @@ static irqreturn_t riptide_handleirq(int irq, void *dev_id)
 		substream[i] = chip->playback_substream[i];
 	substream[i] = chip->capture_substream;
 	for (i = 0; i < PLAYBACK_SUBSTREAMS + 1; i++) {
-		if (substream[i] &&
-		    (runtime = substream[i]->runtime) &&
-		    (data = runtime->private_data) && data->state != ST_STOP) {
+		if (!substream[i])
+			continue;
+		runtime = substream[i]->runtime;
+		if (!runtime)
+			continue;
+		data = runtime->private_data;
+		if (!data)
+			continue;
+		if (data->state != ST_STOP) {
 			pos = 0;
 			for (j = 0; j < data->pages; j++) {
 				c = &data->sgdbuf[j];
@@ -1549,10 +1555,10 @@ snd_riptide_hw_params(struct snd_pcm_substream *substream,
 		    (int)sgdlist->bytes);
 	if (sgdlist->area)
 		snd_dma_free_pages(sgdlist);
-	if ((err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
-				       &chip->pci->dev,
-				       sizeof(struct sgd) * (DESC_MAX_MASK + 1),
-				       sgdlist)) < 0) {
+	err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
+				  sizeof(struct sgd) * (DESC_MAX_MASK + 1),
+				  sgdlist);
+	if (err < 0) {
 		snd_printk(KERN_ERR "Riptide: failed to alloc %d dma bytes\n",
 			   (int)sizeof(struct sgd) * (DESC_MAX_MASK + 1));
 		return err;
@@ -1677,9 +1683,9 @@ static int snd_riptide_pcm(struct snd_riptide *chip, int device)
 	struct snd_pcm *pcm;
 	int err;
 
-	if ((err =
-	     snd_pcm_new(chip->card, "RIPTIDE", device, PLAYBACK_SUBSTREAMS, 1,
-			 &pcm)) < 0)
+	err = snd_pcm_new(chip->card, "RIPTIDE", device, PLAYBACK_SUBSTREAMS, 1,
+			  &pcm);
+	if (err < 0)
 		return err;
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 			&snd_riptide_playback_ops);
@@ -1766,14 +1772,16 @@ static int snd_riptide_initialize(struct snd_riptide *chip)
 
 	cif = chip->cif;
 	if (!cif) {
-		if ((cif = kzalloc(sizeof(struct cmdif), GFP_KERNEL)) == NULL)
+		cif = kzalloc(sizeof(struct cmdif), GFP_KERNEL);
+		if (!cif)
 			return -ENOMEM;
 		cif->hwport = (struct riptideport *)chip->port;
 		spin_lock_init(&cif->lock);
 		chip->cif = cif;
 	}
 	cif->is_reset = 0;
-	if ((err = riptide_reset(cif, chip)) != 0)
+	err = riptide_reset(cif, chip);
+	if (err)
 		return err;
 	device_id = chip->device_id;
 	switch (device_id) {
@@ -1797,7 +1805,8 @@ static int snd_riptide_free(struct snd_riptide *chip)
 	if (!chip)
 		return 0;
 
-	if ((cif = chip->cif)) {
+	cif = chip->cif;
+	if (cif) {
 		SET_GRESET(cif->hwport);
 		udelay(100);
 		UNSET_GRESET(cif->hwport);
@@ -1830,9 +1839,11 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 	};
 
 	*rchip = NULL;
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
-	if (!(chip = kzalloc(sizeof(struct snd_riptide), GFP_KERNEL)))
+	chip = kzalloc(sizeof(struct snd_riptide), GFP_KERNEL);
+	if (!chip)
 		return -ENOMEM;
 
 	spin_lock_init(&chip->lock);
@@ -1845,8 +1856,8 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 	chip->handled_irqs = 0;
 	chip->cif = NULL;
 
-	if ((chip->res_port =
-	     request_region(chip->port, 64, "RIPTIDE")) == NULL) {
+	chip->res_port = request_region(chip->port, 64, "RIPTIDE");
+	if (!chip->res_port) {
 		snd_printk(KERN_ERR
 			   "Riptide: unable to grab region 0x%lx-0x%lx\n",
 			   chip->port, chip->port + 64 - 1);
@@ -1868,12 +1879,14 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 	card->sync_irq = chip->irq;
 	chip->device_id = pci->device;
 	pci_set_master(pci);
-	if ((err = snd_riptide_initialize(chip)) < 0) {
+	err = snd_riptide_initialize(chip);
+	if (err < 0) {
 		snd_riptide_free(chip);
 		return err;
 	}
 
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0) {
 		snd_riptide_free(chip);
 		return err;
 	}
@@ -1903,7 +1916,8 @@ snd_riptide_proc_read(struct snd_info_entry *entry,
 	for (i = 0; i < 64; i += 4)
 		snd_iprintf(buffer, "%c%02x: %08x",
 			    (i % 16) ? ' ' : '\n', i, inl(chip->port + i));
-	if ((cif = chip->cif)) {
+	cif = chip->cif;
+	if (cif) {
 		snd_iprintf(buffer,
 			    "\nVersion: ASIC: %d CODEC: %d AUXDSP: %d PROG: %d",
 			    chip->firmware.firmware.ASIC,
@@ -1922,10 +1936,11 @@ snd_riptide_proc_read(struct snd_info_entry *entry,
 	}
 	snd_iprintf(buffer, "\nOpen streams %d:\n", chip->openstreams);
 	for (i = 0; i < PLAYBACK_SUBSTREAMS; i++) {
-		if (chip->playback_substream[i]
-		    && chip->playback_substream[i]->runtime
-		    && (data =
-			chip->playback_substream[i]->runtime->private_data)) {
+		if (!chip->playback_substream[i] ||
+		    !chip->playback_substream[i]->runtime)
+			continue;
+		data = chip->playback_substream[i]->runtime->private_data;
+		if (data) {
 			snd_iprintf(buffer,
 				    "stream: %d mixer: %d source: %d (%d,%d)\n",
 				    data->id, data->mixer, data->source,
@@ -1934,15 +1949,16 @@ snd_riptide_proc_read(struct snd_info_entry *entry,
 				snd_iprintf(buffer, "rate: %d\n", rate);
 		}
 	}
-	if (chip->capture_substream
-	    && chip->capture_substream->runtime
-	    && (data = chip->capture_substream->runtime->private_data)) {
-		snd_iprintf(buffer,
-			    "stream: %d mixer: %d source: %d (%d,%d)\n",
-			    data->id, data->mixer,
-			    data->source, data->intdec[0], data->intdec[1]);
-		if (!(getsamplerate(cif, data->intdec, &rate)))
-			snd_iprintf(buffer, "rate: %d\n", rate);
+	if (chip->capture_substream && chip->capture_substream->runtime) {
+		data = chip->capture_substream->runtime->private_data;
+		if (data) {
+			snd_iprintf(buffer,
+				    "stream: %d mixer: %d source: %d (%d,%d)\n",
+				    data->id, data->mixer,
+				    data->source, data->intdec[0], data->intdec[1]);
+			if (!(getsamplerate(cif, data->intdec, &rate)))
+				snd_iprintf(buffer, "rate: %d\n", rate);
+		}
 	}
 	snd_iprintf(buffer, "Paths:\n");
 	i = getpaths(cif, p);
@@ -1973,12 +1989,14 @@ static int snd_riptide_mixer(struct snd_riptide *chip)
 	ac97.private_data = chip;
 	ac97.scaps = AC97_SCAP_SKIP_MODEM;
 
-	if ((err = snd_ac97_bus(chip->card, 0, &ops, chip, &pbus)) < 0)
+	err = snd_ac97_bus(chip->card, 0, &ops, chip, &pbus);
+	if (err < 0)
 		return err;
 
 	chip->ac97_bus = pbus;
 	ac97.pci = chip->pci;
-	if ((err = snd_ac97_mixer(pbus, &ac97, &chip->ac97)) < 0)
+	err = snd_ac97_mixer(pbus, &ac97, &chip->ac97);
+	if (err < 0)
 		return err;
 	return err;
 }
-- 
2.26.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582853C9A34
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:10:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43A716FB;
	Thu, 15 Jul 2021 10:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43A716FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336618;
	bh=uxuF127RxNh1vLpBnb0mPeIWS80fxyC5mYoJSDXE1Qg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ACegrphz4uW76OrWiRS9nbS/9JZWe7wHDd8YANZDFiPGsRcGX2olrawjS5ZE6YMr3
	 A2TTrcFvK8S+Umugrd8jJ0ZO1jPEEkUa2sXkvlcmko18PvlEGzkFGYtWmz0sxPh/rV
	 vK37opn5abGRMSDoN9xjxLFvgBZ1IRbbMmmaLSSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4006CF80602;
	Thu, 15 Jul 2021 10:00:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D84EF805DF; Thu, 15 Jul 2021 10:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF4D9F80217
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF4D9F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xMqgXAPS"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4viBLlQc"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7A77F1FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uyZApUrkBxBgvslIS+XWOOksLZCPmv837Tq/su6y7k=;
 b=xMqgXAPSBqBdfkawjqxvwjt947yNc95ACC+sipGy5Z78Aksvn7EQyYMMwKKli+5/k60IjE
 VEKH1SuU5urUPky7ErDCvjDchGyh0FLGrY9omkphmx993YwTw3sdvPlr3DVmbeR2uYCl0X
 9a2ICLcs+YwWwA7BQbquJluMwT9DnDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uyZApUrkBxBgvslIS+XWOOksLZCPmv837Tq/su6y7k=;
 b=4viBLlQccnmcVzC/y8NORIQrxSwpw93KhmStNYTND4w8bBu+3vi6OBwpIE+hSXIfJp43mW
 4tnb/gIdT7oa/YAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 68AA3A3B99;
 Thu, 15 Jul 2021 08:00:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 23/79] ALSA: sis7019: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:58:45 +0200
Message-Id: <20210715075941.23332-24-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
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

This patch converts the resource management in PCI sis7019 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/sis7019.c | 87 +++++++++++----------------------------------
 1 file changed, 20 insertions(+), 67 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index 00ab51c889da..0b722b0e0604 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -1007,16 +1007,10 @@ static int sis_mixer_create(struct sis7019 *sis)
 	return rc;
 }
 
-static void sis_free_suspend(struct sis7019 *sis)
+static void sis_chip_free(struct snd_card *card)
 {
-	int i;
-
-	for (i = 0; i < SIS_SUSPEND_PAGES; i++)
-		kfree(sis->suspend_state[i]);
-}
+	struct sis7019 *sis = card->private_data;
 
-static int sis_chip_free(struct sis7019 *sis)
-{
 	/* Reset the chip, and disable all interrputs.
 	 */
 	outl(SIS_GCR_SOFTWARE_RESET, sis->ioport + SIS_GCR);
@@ -1028,18 +1022,6 @@ static int sis_chip_free(struct sis7019 *sis)
 	 */
 	if (sis->irq >= 0)
 		free_irq(sis->irq, sis);
-
-	iounmap(sis->ioaddr);
-	pci_release_regions(sis->pci);
-	pci_disable_device(sis->pci);
-	sis_free_suspend(sis);
-	return 0;
-}
-
-static int sis_dev_free(struct snd_device *dev)
-{
-	struct sis7019 *sis = dev->device_data;
-	return sis_chip_free(sis);
 }
 
 static int sis_chip_init(struct sis7019 *sis)
@@ -1265,7 +1247,8 @@ static int sis_alloc_suspend(struct sis7019 *sis)
 	 * buffer.
 	 */
 	for (i = 0; i < SIS_SUSPEND_PAGES; i++) {
-		sis->suspend_state[i] = kmalloc(4096, GFP_KERNEL);
+		sis->suspend_state[i] = devm_kmalloc(&sis->pci->dev, 4096,
+						     GFP_KERNEL);
 		if (!sis->suspend_state[i])
 			return -ENOMEM;
 	}
@@ -1279,23 +1262,19 @@ static int sis_chip_create(struct snd_card *card,
 {
 	struct sis7019 *sis = card->private_data;
 	struct voice *voice;
-	static const struct snd_device_ops ops = {
-		.dev_free = sis_dev_free,
-	};
 	int rc;
 	int i;
 
-	rc = pci_enable_device(pci);
+	rc = pcim_enable_device(pci);
 	if (rc)
-		goto error_out;
+		return rc;
 
 	rc = dma_set_mask(&pci->dev, DMA_BIT_MASK(30));
 	if (rc < 0) {
 		dev_err(&pci->dev, "architecture does not support 30-bit PCI busmaster DMA");
-		goto error_out_enabled;
+		return -ENXIO;
 	}
 
-	memset(sis, 0, sizeof(*sis));
 	mutex_init(&sis->ac97_mutex);
 	spin_lock_init(&sis->voice_lock);
 	sis->card = card;
@@ -1306,31 +1285,31 @@ static int sis_chip_create(struct snd_card *card,
 	rc = pci_request_regions(pci, "SiS7019");
 	if (rc) {
 		dev_err(&pci->dev, "unable request regions\n");
-		goto error_out_enabled;
+		return rc;
 	}
 
-	rc = -EIO;
-	sis->ioaddr = ioremap(pci_resource_start(pci, 1), 0x4000);
+	sis->ioaddr = devm_ioremap(&pci->dev, pci_resource_start(pci, 1), 0x4000);
 	if (!sis->ioaddr) {
 		dev_err(&pci->dev, "unable to remap MMIO, aborting\n");
-		goto error_out_cleanup;
+		return -EIO;
 	}
 
 	rc = sis_alloc_suspend(sis);
 	if (rc < 0) {
 		dev_err(&pci->dev, "unable to allocate state storage\n");
-		goto error_out_cleanup;
+		return rc;
 	}
 
 	rc = sis_chip_init(sis);
 	if (rc)
-		goto error_out_cleanup;
+		return rc;
+	card->private_free = sis_chip_free;
 
 	rc = request_irq(pci->irq, sis_interrupt, IRQF_SHARED, KBUILD_MODNAME,
 			 sis);
 	if (rc) {
 		dev_err(&pci->dev, "unable to allocate irq %d\n", sis->irq);
-		goto error_out_cleanup;
+		return rc;
 	}
 
 	sis->irq = pci->irq;
@@ -1349,20 +1328,7 @@ static int sis_chip_create(struct snd_card *card,
 	voice->num = SIS_CAPTURE_CHAN_AC97_PCM_IN;
 	voice->ctrl_base = SIS_CAPTURE_DMA_ADDR(sis->ioaddr, voice->num);
 
-	rc = snd_device_new(card, SNDRV_DEV_LOWLEVEL, sis, &ops);
-	if (rc)
-		goto error_out_cleanup;
-
 	return 0;
-
-error_out_cleanup:
-	sis_chip_free(sis);
-
-error_out_enabled:
-	pci_disable_device(pci);
-
-error_out:
-	return rc;
 }
 
 static int snd_sis7019_probe(struct pci_dev *pci,
@@ -1372,9 +1338,8 @@ static int snd_sis7019_probe(struct pci_dev *pci,
 	struct sis7019 *sis;
 	int rc;
 
-	rc = -ENOENT;
 	if (!enable)
-		goto error_out;
+		return -ENOENT;
 
 	/* The user can specify which codecs should be present so that we
 	 * can wait for them to show up if they are slow to recover from
@@ -1390,23 +1355,23 @@ static int snd_sis7019_probe(struct pci_dev *pci,
 	rc = snd_card_new(&pci->dev, index, id, THIS_MODULE,
 			  sizeof(*sis), &card);
 	if (rc < 0)
-		goto error_out;
+		return rc;
 
 	strcpy(card->driver, "SiS7019");
 	strcpy(card->shortname, "SiS7019");
 	rc = sis_chip_create(card, pci);
 	if (rc)
-		goto card_error_out;
+		return rc;
 
 	sis = card->private_data;
 
 	rc = sis_mixer_create(sis);
 	if (rc)
-		goto card_error_out;
+		return rc;
 
 	rc = sis_pcm_create(sis);
 	if (rc)
-		goto card_error_out;
+		return rc;
 
 	snprintf(card->longname, sizeof(card->longname),
 			"%s Audio Accelerator with %s at 0x%lx, irq %d",
@@ -1415,28 +1380,16 @@ static int snd_sis7019_probe(struct pci_dev *pci,
 
 	rc = snd_card_register(card);
 	if (rc)
-		goto card_error_out;
+		return rc;
 
 	pci_set_drvdata(pci, card);
 	return 0;
-
-card_error_out:
-	snd_card_free(card);
-
-error_out:
-	return rc;
-}
-
-static void snd_sis7019_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver sis7019_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_sis7019_ids,
 	.probe = snd_sis7019_probe,
-	.remove = snd_sis7019_remove,
 	.driver = {
 		.pm = SIS_PM_OPS,
 	},
-- 
2.26.2


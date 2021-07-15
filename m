Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2EC3C9A5F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA36D1679;
	Thu, 15 Jul 2021 10:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA36D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337087;
	bh=X+EKB321wIZcLoRBhY7M+HvVxeEwP0kRS8hdb3YSHNE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHHHW8shpHHO+55uQoYKhwH25S3A25QP/XsrZJdWh+/hqZnhA6ms6euJCVMY03gS7
	 2HLgsmzpGChrrBcklofLUfiflCoocljkrtjtcBGp3ezeHQnIQe9/sWPgzkC8qIkrsX
	 AUh1y5LC76oCSR/Iy5V8QObisCAfm/0tSGssrlpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C17E4F80536;
	Thu, 15 Jul 2021 10:01:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11869F8051D; Thu, 15 Jul 2021 10:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FD7AF80526
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD7AF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="FeCHlOc3"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="2NnXeTaA"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 188F71FDEA
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgWBHQVODUeHp2jMa9p6i+45SIGnHJjefe5XxogOvKY=;
 b=FeCHlOc3o4E2PenEMeHuoHeyH4KlBsDUWW+iLBi9pWqcanMYz/wAnD9HaNK5R+AU8+wN0S
 w+cHbdOoV/CLzteVA5YJQ+F0KqEWX/6EevuM8pToTQnByZeBpHDyiw/byBzgmQJ4xY2gSa
 F48FLBkINJo7csT5znPcnc2RW/qcjdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgWBHQVODUeHp2jMa9p6i+45SIGnHJjefe5XxogOvKY=;
 b=2NnXeTaAsbEw8mKbZZYqJBEoaciXWZpHd38yYkzJNde+Pz4qoV+Or//9WZNHJvYVECSZ1H
 NCPOBqCs6rEs2mBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1145EA3BC0;
 Thu, 15 Jul 2021 08:00:11 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 44/79] ALSA: riptide: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:06 +0200
Message-Id: <20210715075941.23332-45-tiwai@suse.de>
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

This patch converts the resource management in PCI riptide driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/riptide/riptide.c | 89 +++++++++----------------------------
 1 file changed, 22 insertions(+), 67 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 709a1a2cde20..5a987c683c41 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1798,13 +1798,11 @@ static int snd_riptide_initialize(struct snd_riptide *chip)
 	return err;
 }
 
-static int snd_riptide_free(struct snd_riptide *chip)
+static void snd_riptide_free(struct snd_card *card)
 {
+	struct snd_riptide *chip = card->private_data;
 	struct cmdif *cif;
 
-	if (!chip)
-		return 0;
-
 	cif = chip->cif;
 	if (cif) {
 		SET_GRESET(cif->hwport);
@@ -1812,39 +1810,19 @@ static int snd_riptide_free(struct snd_riptide *chip)
 		UNSET_GRESET(cif->hwport);
 		kfree(chip->cif);
 	}
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
 	release_firmware(chip->fw_entry);
-	release_and_free_resource(chip->res_port);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_riptide_dev_free(struct snd_device *device)
-{
-	struct snd_riptide *chip = device->device_data;
-
-	return snd_riptide_free(chip);
 }
 
 static int
-snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
-		   struct snd_riptide **rchip)
+snd_riptide_create(struct snd_card *card, struct pci_dev *pci)
 {
-	struct snd_riptide *chip;
+	struct snd_riptide *chip = card->private_data;
 	struct riptideport *hwport;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_riptide_dev_free,
-	};
 
-	*rchip = NULL;
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
-	chip = kzalloc(sizeof(struct snd_riptide), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
 
 	spin_lock_init(&chip->lock);
 	chip->card = card;
@@ -1855,24 +1833,20 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 	chip->received_irqs = 0;
 	chip->handled_irqs = 0;
 	chip->cif = NULL;
+	card->private_free = snd_riptide_free;
 
-	chip->res_port = request_region(chip->port, 64, "RIPTIDE");
-	if (!chip->res_port) {
-		snd_printk(KERN_ERR
-			   "Riptide: unable to grab region 0x%lx-0x%lx\n",
-			   chip->port, chip->port + 64 - 1);
-		snd_riptide_free(chip);
-		return -EBUSY;
-	}
+	err = pci_request_regions(pci, "RIPTIDE");
+	if (err < 0)
+		return err;
 	hwport = (struct riptideport *)chip->port;
 	UNSET_AIE(hwport);
 
-	if (request_threaded_irq(pci->irq, snd_riptide_interrupt,
-				 riptide_handleirq, IRQF_SHARED,
-				 KBUILD_MODNAME, chip)) {
+	if (devm_request_threaded_irq(&pci->dev, pci->irq,
+				      snd_riptide_interrupt,
+				      riptide_handleirq, IRQF_SHARED,
+				      KBUILD_MODNAME, chip)) {
 		snd_printk(KERN_ERR "Riptide: unable to grab IRQ %d\n",
 			   pci->irq);
-		snd_riptide_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
@@ -1880,18 +1854,9 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci,
 	chip->device_id = pci->device;
 	pci_set_master(pci);
 	err = snd_riptide_initialize(chip);
-	if (err < 0) {
-		snd_riptide_free(chip);
-		return err;
-	}
-
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_riptide_free(chip);
+	if (err < 0)
 		return err;
-	}
 
-	*rchip = chip;
 	return 0;
 }
 
@@ -2073,20 +2038,20 @@ snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
-	err = snd_riptide_create(card, pci, &chip);
+	chip = card->private_data;
+	err = snd_riptide_create(card, pci);
 	if (err < 0)
-		goto error;
-	card->private_data = chip;
+		return err;
 	err = snd_riptide_pcm(chip, 0);
 	if (err < 0)
-		goto error;
+		return err;
 	err = snd_riptide_mixer(chip);
 	if (err < 0)
-		goto error;
+		return err;
 
 	val = LEGACY_ENABLE_ALL;
 	if (opl3_port[dev])
@@ -2153,26 +2118,16 @@ snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	snd_riptide_proc_init(chip);
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
-static void snd_card_riptide_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_riptide_ids,
 	.probe = snd_card_riptide_probe,
-	.remove = snd_card_riptide_remove,
 	.driver = {
 		.pm = RIPTIDE_PM_OPS,
 	},
-- 
2.26.2


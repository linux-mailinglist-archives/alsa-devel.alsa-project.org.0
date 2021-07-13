Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EEB3C7224
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:27:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D18BC16C6;
	Tue, 13 Jul 2021 16:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D18BC16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626186458;
	bh=CEUUEMRpKh2q+wEKO3UkqbaUVHguEKirBq7NjDfVM0E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wv7x2zLyCyrtFqhFB+FGYbAsPW34JbiM9WLXXNDzYFqRONI2wxdI92E0fe0tBqOed
	 jJoR4t3eV3G5/u6KrCnrA6vvMpae49wXTyrxweh1anaK3AKYm1sxT9PodHIvJ+Zix5
	 J/7ejhZZxG7BIVvh4/ToMLy0wTga/r5CXGYGz8TY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1608DF802E0;
	Tue, 13 Jul 2021 16:25:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC746F804EC; Tue, 13 Jul 2021 16:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FFFBF8016A
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFFBF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="wUC8X094"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="C/Jv56Ru"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 054C2228E3
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJDCaxedyEx7rQY8uxQVc9bkBE7FagFDqODBfkzm5cU=;
 b=wUC8X094oytslxjDY55Z8zqQG0C7cgMF8PjOb0k5ndzaaM3XFx0F1eTV/V2vowxqSgF0pL
 UuYOp/jLVqigc0tCHsZPWHhu2vwzlNL9LzcMzCe/NTMMV5i6BaoxnUy8iSIeZS0qivRVCq
 cVpLjsXYYdDYLiwRg/m1QvWNlXXOp2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJDCaxedyEx7rQY8uxQVc9bkBE7FagFDqODBfkzm5cU=;
 b=C/Jv56RuKEHkgPK/xPhF4zy1gJMsaslqbQInNN0q7nRNJotPu0hOQmeBHMsk1N1ASkQIre
 gOZVEKFpn78wjuBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id F325AA3B88;
 Tue, 13 Jul 2021 14:24:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/51] ALSA: atiixp: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:24:40 +0200
Message-Id: <20210713142445.19252-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713142445.19252-1-tiwai@suse.de>
References: <20210713142445.19252-1-tiwai@suse.de>
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

Like the previous patch, this patch converts the resource allocations
with device-managed API calls, so that we can reduce resource-free
calls.

The atiixp drivers are simpler than intel8x0, and even the irq can be
allocated with devres.

The end result is a good amount of code reduction.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c       | 92 +++++++++-------------------------------
 sound/pci/atiixp_modem.c | 92 +++++++++-------------------------------
 2 files changed, 40 insertions(+), 144 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 5f8aa35c4bea..b8e035d5930d 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1530,87 +1530,44 @@ static void snd_atiixp_proc_init(struct atiixp *chip)
  * destructor
  */
 
-static int snd_atiixp_free(struct atiixp *chip)
+static void snd_atiixp_free(struct snd_card *card)
 {
-	if (chip->irq < 0)
-		goto __hw_end;
-	snd_atiixp_chip_stop(chip);
-
-      __hw_end:
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-	iounmap(chip->remap_addr);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_atiixp_dev_free(struct snd_device *device)
-{
-	struct atiixp *chip = device->device_data;
-	return snd_atiixp_free(chip);
+	snd_atiixp_chip_stop(card->private_data);
 }
 
 /*
  * constructor for chip instance
  */
-static int snd_atiixp_create(struct snd_card *card,
-			     struct pci_dev *pci,
-			     struct atiixp **r_chip)
+static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 {
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_atiixp_dev_free,
-	};
-	struct atiixp *chip;
+	struct atiixp *chip = card->private_data;
 	int err;
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&chip->reg_lock);
 	mutex_init(&chip->open_mutex);
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
-	err = pci_request_regions(pci, "ATI IXP AC97");
-	if (err < 0) {
-		pci_disable_device(pci);
-		kfree(chip);
+	err = pcim_iomap_regions(pci, 1 << 0, "ATI IXP AC97");
+	if (err < 0)
 		return err;
-	}
 	chip->addr = pci_resource_start(pci, 0);
-	chip->remap_addr = pci_ioremap_bar(pci, 0);
-	if (chip->remap_addr == NULL) {
-		dev_err(card->dev, "AC'97 space ioremap problem\n");
-		snd_atiixp_free(chip);
-		return -EIO;
-	}
+	chip->remap_addr = pcim_iomap_table(pci)[0];
 
-	if (request_irq(pci->irq, snd_atiixp_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_atiixp_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_atiixp_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_atiixp_free;
 	pci_set_master(pci);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_atiixp_free(chip);
-		return err;
-	}
-
-	*r_chip = chip;
 	return 0;
 }
 
@@ -1622,30 +1579,31 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 	struct atiixp *chip;
 	int err;
 
-	err = snd_card_new(&pci->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pci->dev, index, id, THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	strcpy(card->driver, spdif_aclink ? "ATIIXP" : "ATIIXP-SPDMA");
 	strcpy(card->shortname, "ATI IXP");
-	err = snd_atiixp_create(card, pci, &chip);
+	err = snd_atiixp_init(card, pci);
 	if (err < 0)
-		goto __error;
-	card->private_data = chip;
+		return err;
 
 	err = snd_atiixp_aclink_reset(chip);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	chip->spdif_over_aclink = spdif_aclink;
 
 	err = snd_atiixp_mixer_new(chip, ac97_clock, ac97_quirk);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	err = snd_atiixp_pcm_new(chip);
 	if (err < 0)
-		goto __error;
+		return err;
 	
 	snd_atiixp_proc_init(chip);
 
@@ -1659,26 +1617,16 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	return 0;
-
- __error:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_atiixp_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver atiixp_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_atiixp_ids,
 	.probe = snd_atiixp_probe,
-	.remove = snd_atiixp_remove,
 	.driver = {
 		.pm = SND_ATIIXP_PM_OPS,
 	},
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 9739c3a82777..178dce8ef1e9 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -1159,87 +1159,44 @@ static void snd_atiixp_proc_init(struct atiixp_modem *chip)
  * destructor
  */
 
-static int snd_atiixp_free(struct atiixp_modem *chip)
+static void snd_atiixp_free(struct snd_card *card)
 {
-	if (chip->irq < 0)
-		goto __hw_end;
-	snd_atiixp_chip_stop(chip);
-
-      __hw_end:
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-	iounmap(chip->remap_addr);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_atiixp_dev_free(struct snd_device *device)
-{
-	struct atiixp_modem *chip = device->device_data;
-	return snd_atiixp_free(chip);
+	snd_atiixp_chip_stop(card->private_data);
 }
 
 /*
  * constructor for chip instance
  */
-static int snd_atiixp_create(struct snd_card *card,
-			     struct pci_dev *pci,
-			     struct atiixp_modem **r_chip)
+static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 {
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_atiixp_dev_free,
-	};
-	struct atiixp_modem *chip;
+	struct atiixp_modem *chip = card->private_data;
 	int err;
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
-
 	spin_lock_init(&chip->reg_lock);
 	mutex_init(&chip->open_mutex);
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
-	err = pci_request_regions(pci, "ATI IXP MC97");
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	err = pcim_iomap_regions(pci, 1 << 0, "ATI IXP MC97");
+	if (err < 0)
 		return err;
-	}
 	chip->addr = pci_resource_start(pci, 0);
-	chip->remap_addr = pci_ioremap_bar(pci, 0);
-	if (chip->remap_addr == NULL) {
-		dev_err(card->dev, "AC'97 space ioremap problem\n");
-		snd_atiixp_free(chip);
-		return -EIO;
-	}
+	chip->remap_addr = pcim_iomap_table(pci)[0];
 
-	if (request_irq(pci->irq, snd_atiixp_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, chip)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_atiixp_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_atiixp_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_atiixp_free;
 	pci_set_master(pci);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_atiixp_free(chip);
-		return err;
-	}
-
-	*r_chip = chip;
 	return 0;
 }
 
@@ -1251,28 +1208,29 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 	struct atiixp_modem *chip;
 	int err;
 
-	err = snd_card_new(&pci->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pci->dev, index, id, THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	strcpy(card->driver, "ATIIXP-MODEM");
 	strcpy(card->shortname, "ATI IXP Modem");
-	err = snd_atiixp_create(card, pci, &chip);
+	err = snd_atiixp_init(card, pci);
 	if (err < 0)
-		goto __error;
-	card->private_data = chip;
+		return err;
 
 	err = snd_atiixp_aclink_reset(chip);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	err = snd_atiixp_mixer_new(chip, ac97_clock);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	err = snd_atiixp_pcm_new(chip);
 	if (err < 0)
-		goto __error;
+		return err;
 	
 	snd_atiixp_proc_init(chip);
 
@@ -1283,26 +1241,16 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	return 0;
-
- __error:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_atiixp_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver atiixp_modem_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_atiixp_ids,
 	.probe = snd_atiixp_probe,
-	.remove = snd_atiixp_remove,
 	.driver = {
 		.pm = SND_ATIIXP_PM_OPS,
 	},
-- 
2.26.2


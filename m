Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DE13C722F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:29:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DEC016C6;
	Tue, 13 Jul 2021 16:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DEC016C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626186550;
	bh=EmXsO8A6hKMGipEIU2L5NclT23mD126IniGJcoPq4wg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FW4xMnZ855Ta50ZAryukNOob8SUlbnnysHKie4fpNZX1Vv8FN0A+yJayKQcO0py+e
	 sFIea/aUq+NHLwh37fMcJK6JTl4R5p04qoSZF2tA3v/SptaBx0lNcagW8+a3KZFg70
	 olwzUylDQ6k6I+WmdGYvIoOTmApGSapgfPhsqvJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A08F8051A;
	Tue, 13 Jul 2021 16:25:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2320FF804F1; Tue, 13 Jul 2021 16:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 307E0F80431
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 307E0F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="szIpJxkZ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="kQwT3FF7"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 00B1B228E1
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYGwEgxSe3lfwTayzEuKCrhyKkUnngXAooaOVfsxXoc=;
 b=szIpJxkZmJ1SFuWtL6v6JwBpXrWohAlFpd/Gsd+ajtk6sQ1Fmk2bjBJXnr0sJqqcwua5O/
 srqRnuXUpWL8CS48uzz5yPOT/VzZwARrA+VLFGyflz+RHq5qYht7ctRBAJVFZstZzoxv02
 9fXRDvn48yLjP5/nq3KdAR52pCO7jTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYGwEgxSe3lfwTayzEuKCrhyKkUnngXAooaOVfsxXoc=;
 b=kQwT3FF76DnALhLf8jT7FJqplCcgusEyjdMy5lbQCQad9+thFvWxQ4subN+v/TJKGqWsre
 bM1rQZLMiNd+eLDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E1B75A3B8A;
 Tue, 13 Jul 2021 14:24:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/51] ALSA: intel8x0: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:24:39 +0200
Message-Id: <20210713142445.19252-4-tiwai@suse.de>
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

This patch refactors the intel8x0 and intel8x0m driver codes using
devres and gets rid of the driver remove callback.

The conversion is fairly straightforward: each API call is replaced
with the device-managed API function, e.g. pci_enable_device() ->
pcim_enable_device(), and so on.  The buffer descriptor list is
allocated with a new API, snd_devm_alloc_pages().

A slight code structure change is that the intel8x0 object is
allocated as a card's private_data instead of the own lowlevel
snd_device object.  This simplifies the resource management.
And, the take-down procedure is triggered via card->private_free, and
it's registered at the end of the whole initialization, i.e. after the
all resources get properly managed.

The only not-devres-managed resource is the irq handler.  Since we
need to release at suspend and re-acquire at resume (otherwise
something weird happens on some machines), this is still managed
manually.  But the rest are all freed automatically.

The end result is a good amount of code reduction.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 140 +++++++++++++-----------------------------
 sound/pci/intel8x0m.c | 139 ++++++++++++-----------------------------
 2 files changed, 81 insertions(+), 198 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 6a436a2ce26a..67cb65a53edd 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -378,7 +378,7 @@ struct intel8x0 {
 	spinlock_t reg_lock;
 	
 	u32 bdbars_count;
-	struct snd_dma_buffer bdbars;
+	struct snd_dma_buffer *bdbars;
 	u32 int_sta_reg;		/* interrupt status register */
 	u32 int_sta_mask;		/* interrupt status mask */
 };
@@ -2528,8 +2528,9 @@ static int snd_intel8x0_chip_init(struct intel8x0 *chip, int probing)
 	return 0;
 }
 
-static int snd_intel8x0_free(struct intel8x0 *chip)
+static void snd_intel8x0_free(struct snd_card *card)
 {
+	struct intel8x0 *chip = card->private_data;
 	unsigned int i;
 
 	if (chip->irq < 0)
@@ -2552,16 +2553,6 @@ static int snd_intel8x0_free(struct intel8x0 *chip)
       __hw_end:
 	if (chip->irq >= 0)
 		free_irq(chip->irq, chip);
-	if (chip->bdbars.area)
-		snd_dma_free_pages(&chip->bdbars);
-	if (chip->addr)
-		pci_iounmap(chip->pci, chip->addr);
-	if (chip->bmaddr)
-		pci_iounmap(chip->pci, chip->bmaddr);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2831,12 +2822,6 @@ static void snd_intel8x0_proc_init(struct intel8x0 *chip)
 			     snd_intel8x0_proc_read);
 }
 
-static int snd_intel8x0_dev_free(struct snd_device *device)
-{
-	struct intel8x0 *chip = device->device_data;
-	return snd_intel8x0_free(chip);
-}
-
 struct ich_reg_info {
 	unsigned int int_sta_mask;
 	unsigned int offset;
@@ -2880,19 +2865,15 @@ static int snd_intel8x0_inside_vm(struct pci_dev *pci)
 	return result;
 }
 
-static int snd_intel8x0_create(struct snd_card *card,
-			       struct pci_dev *pci,
-			       unsigned long device_type,
-			       struct intel8x0 **r_intel8x0)
+static int snd_intel8x0_init(struct snd_card *card,
+			     struct pci_dev *pci,
+			     unsigned long device_type)
 {
-	struct intel8x0 *chip;
+	struct intel8x0 *chip = card->private_data;
 	int err;
 	unsigned int i;
 	unsigned int int_sta_masks;
 	struct ichdev *ichdev;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_intel8x0_dev_free,
-	};
 
 	static const unsigned int bdbars[] = {
 		3, /* DEVICE_INTEL */
@@ -2925,17 +2906,10 @@ static int snd_intel8x0_create(struct snd_card *card,
 	};
 	const struct ich_reg_info *tbl;
 
-	*r_intel8x0 = NULL;
-
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	spin_lock_init(&chip->reg_lock);
 	chip->device_type = device_type;
 	chip->card = card;
@@ -2961,38 +2935,23 @@ static int snd_intel8x0_create(struct snd_card *card,
 		chip->fix_nocache = 1; /* enable workaround */
 
 	err = pci_request_regions(pci, card->shortname);
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 
 	if (device_type == DEVICE_ALI) {
 		/* ALI5455 has no ac97 region */
-		chip->bmaddr = pci_iomap(pci, 0, 0);
-		goto port_inited;
-	}
-
-	if (pci_resource_flags(pci, 2) & IORESOURCE_MEM) /* ICH4 and Nforce */
-		chip->addr = pci_iomap(pci, 2, 0);
-	else
-		chip->addr = pci_iomap(pci, 0, 0);
-	if (!chip->addr) {
-		dev_err(card->dev, "AC'97 space ioremap problem\n");
-		snd_intel8x0_free(chip);
-		return -EIO;
+		chip->bmaddr = pcim_iomap(pci, 0, 0);
+	} else {
+		if (pci_resource_flags(pci, 2) & IORESOURCE_MEM) /* ICH4 and Nforce */
+			chip->addr = pcim_iomap(pci, 2, 0);
+		else
+			chip->addr = pcim_iomap(pci, 0, 0);
+		if (pci_resource_flags(pci, 3) & IORESOURCE_MEM) /* ICH4 */
+			chip->bmaddr = pcim_iomap(pci, 3, 0);
+		else
+			chip->bmaddr = pcim_iomap(pci, 1, 0);
 	}
-	if (pci_resource_flags(pci, 3) & IORESOURCE_MEM) /* ICH4 */
-		chip->bmaddr = pci_iomap(pci, 3, 0);
-	else
-		chip->bmaddr = pci_iomap(pci, 1, 0);
 
- port_inited:
-	if (!chip->bmaddr) {
-		dev_err(card->dev, "Controller space ioremap problem\n");
-		snd_intel8x0_free(chip);
-		return -EIO;
-	}
 	chip->bdbars_count = bdbars[device_type];
 
 	/* initialize offsets */
@@ -3028,21 +2987,20 @@ static int snd_intel8x0_create(struct snd_card *card,
 
 	/* allocate buffer descriptor lists */
 	/* the start of each lists must be aligned to 8 bytes */
-	if (snd_dma_alloc_pages(intel8x0_dma_type(chip), &pci->dev,
-				chip->bdbars_count * sizeof(u32) * ICH_MAX_FRAGS * 2,
-				&chip->bdbars) < 0) {
-		snd_intel8x0_free(chip);
-		dev_err(card->dev, "cannot allocate buffer descriptors\n");
+	chip->bdbars = snd_devm_alloc_pages(&pci->dev, intel8x0_dma_type(chip),
+					    chip->bdbars_count * sizeof(u32) *
+					    ICH_MAX_FRAGS * 2);
+	if (!chip->bdbars)
 		return -ENOMEM;
-	}
+
 	/* tables must be aligned to 8 bytes here, but the kernel pages
 	   are much bigger, so we don't care (on i386) */
 	int_sta_masks = 0;
 	for (i = 0; i < chip->bdbars_count; i++) {
 		ichdev = &chip->ichd[i];
-		ichdev->bdbar = ((__le32 *)chip->bdbars.area) +
+		ichdev->bdbar = ((__le32 *)chip->bdbars->area) +
 			(i * ICH_MAX_FRAGS * 2);
-		ichdev->bdbar_addr = chip->bdbars.addr +
+		ichdev->bdbar_addr = chip->bdbars->addr +
 			(i * sizeof(u32) * ICH_MAX_FRAGS * 2);
 		int_sta_masks |= ichdev->int_sta_mask;
 	}
@@ -3076,28 +3034,24 @@ static int snd_intel8x0_create(struct snd_card *card,
 		chip->codec_isr_bits |= chip->codec_bit[i];
 
 	err = snd_intel8x0_chip_init(chip, 1);
-	if (err < 0) {
-		snd_intel8x0_free(chip);
+	if (err < 0)
 		return err;
-	}
 
 	/* request irq after initializaing int_sta_mask, etc */
+	/* NOTE: we don't use devm version here since it's released /
+	 * re-acquired in PM callbacks.
+	 * It's released explicitly in snd_intel8x0_free(), too.
+	 */
 	if (request_irq(pci->irq, snd_intel8x0_interrupt,
 			IRQF_SHARED, KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_intel8x0_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_intel8x0_free(chip);
-		return err;
-	}
+	card->private_free = snd_intel8x0_free;
 
-	*r_intel8x0 = chip;
 	return 0;
 }
 
@@ -3163,9 +3117,11 @@ static int snd_intel8x0_probe(struct pci_dev *pci,
 	int err;
 	struct shortname_table *name;
 
-	err = snd_card_new(&pci->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pci->dev, index, id, THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	if (spdif_aclink < 0)
 		spdif_aclink = check_default_spdif_aclink(pci);
@@ -3199,23 +3155,16 @@ static int snd_intel8x0_probe(struct pci_dev *pci,
 			buggy_irq = 0;
 	}
 
-	err = snd_intel8x0_create(card, pci, pci_id->driver_data, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_intel8x0_init(card, pci, pci_id->driver_data);
+	if (err < 0)
 		return err;
-	}
-	card->private_data = chip;
 
 	err = snd_intel8x0_mixer(chip, ac97_clock, ac97_quirk);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_intel8x0_pcm(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	
 	snd_intel8x0_proc_init(chip);
 
@@ -3233,24 +3182,17 @@ static int snd_intel8x0_probe(struct pci_dev *pci,
 	}
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
+
 	pci_set_drvdata(pci, card);
 	return 0;
 }
 
-static void snd_intel8x0_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver intel8x0_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_intel8x0_ids,
 	.probe = snd_intel8x0_probe,
-	.remove = snd_intel8x0_remove,
 	.driver = {
 		.pm = INTEL8X0_PM_OPS,
 	},
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index b96fce6cbd83..7de3cb2f17b5 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -182,7 +182,7 @@ struct intel8x0m {
 
 	spinlock_t reg_lock;
 	
-	struct snd_dma_buffer bdbars;
+	struct snd_dma_buffer *bdbars;
 	u32 bdbars_count;
 	u32 int_sta_reg;		/* interrupt status register */
 	u32 int_sta_mask;		/* interrupt status mask */
@@ -947,8 +947,9 @@ static int snd_intel8x0m_chip_init(struct intel8x0m *chip, int probing)
 	return 0;
 }
 
-static int snd_intel8x0m_free(struct intel8x0m *chip)
+static void snd_intel8x0m_free(struct snd_card *card)
 {
+	struct intel8x0m *chip = card->private_data;
 	unsigned int i;
 
 	if (chip->irq < 0)
@@ -962,16 +963,6 @@ static int snd_intel8x0m_free(struct intel8x0m *chip)
  __hw_end:
 	if (chip->irq >= 0)
 		free_irq(chip->irq, chip);
-	if (chip->bdbars.area)
-		snd_dma_free_pages(&chip->bdbars);
-	if (chip->addr)
-		pci_iounmap(chip->pci, chip->addr);
-	if (chip->bmaddr)
-		pci_iounmap(chip->pci, chip->bmaddr);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1047,47 +1038,30 @@ static void snd_intel8x0m_proc_init(struct intel8x0m *chip)
 			     snd_intel8x0m_proc_read);
 }
 
-static int snd_intel8x0m_dev_free(struct snd_device *device)
-{
-	struct intel8x0m *chip = device->device_data;
-	return snd_intel8x0m_free(chip);
-}
-
 struct ich_reg_info {
 	unsigned int int_sta_mask;
 	unsigned int offset;
 };
 
-static int snd_intel8x0m_create(struct snd_card *card,
-				struct pci_dev *pci,
-				unsigned long device_type,
-				struct intel8x0m **r_intel8x0m)
+static int snd_intel8x0m_init(struct snd_card *card,
+			      struct pci_dev *pci,
+			      unsigned long device_type)
 {
-	struct intel8x0m *chip;
+	struct intel8x0m *chip = card->private_data;
 	int err;
 	unsigned int i;
 	unsigned int int_sta_masks;
 	struct ichdev *ichdev;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_intel8x0m_dev_free,
-	};
 	static const struct ich_reg_info intel_regs[2] = {
 		{ ICH_MIINT, 0 },
 		{ ICH_MOINT, 0x10 },
 	};
 	const struct ich_reg_info *tbl;
 
-	*r_intel8x0m = NULL;
-
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (chip == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	spin_lock_init(&chip->reg_lock);
 	chip->device_type = device_type;
 	chip->card = card;
@@ -1095,37 +1069,21 @@ static int snd_intel8x0m_create(struct snd_card *card,
 	chip->irq = -1;
 
 	err = pci_request_regions(pci, card->shortname);
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 
 	if (device_type == DEVICE_ALI) {
 		/* ALI5455 has no ac97 region */
-		chip->bmaddr = pci_iomap(pci, 0, 0);
-		goto port_inited;
-	}
-
-	if (pci_resource_flags(pci, 2) & IORESOURCE_MEM) /* ICH4 and Nforce */
-		chip->addr = pci_iomap(pci, 2, 0);
-	else
-		chip->addr = pci_iomap(pci, 0, 0);
-	if (!chip->addr) {
-		dev_err(card->dev, "AC'97 space ioremap problem\n");
-		snd_intel8x0m_free(chip);
-		return -EIO;
-	}
-	if (pci_resource_flags(pci, 3) & IORESOURCE_MEM) /* ICH4 */
-		chip->bmaddr = pci_iomap(pci, 3, 0);
-	else
-		chip->bmaddr = pci_iomap(pci, 1, 0);
-
-port_inited:
-	if (!chip->bmaddr) {
-		dev_err(card->dev, "Controller space ioremap problem\n");
-		snd_intel8x0m_free(chip);
-		return -EIO;
+		chip->bmaddr = pcim_iomap(pci, 0, 0);
+	} else {
+		if (pci_resource_flags(pci, 2) & IORESOURCE_MEM) /* ICH4 and Nforce */
+			chip->addr = pcim_iomap(pci, 2, 0);
+		else
+			chip->addr = pcim_iomap(pci, 0, 0);
+		if (pci_resource_flags(pci, 3) & IORESOURCE_MEM) /* ICH4 */
+			chip->bmaddr = pcim_iomap(pci, 3, 0);
+		else
+			chip->bmaddr = pcim_iomap(pci, 1, 0);
 	}
 
 	/* initialize offsets */
@@ -1153,19 +1111,19 @@ static int snd_intel8x0m_create(struct snd_card *card,
 
 	/* allocate buffer descriptor lists */
 	/* the start of each lists must be aligned to 8 bytes */
-	if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &pci->dev,
-				chip->bdbars_count * sizeof(u32) * ICH_MAX_FRAGS * 2,
-				&chip->bdbars) < 0) {
-		snd_intel8x0m_free(chip);
+	chip->bdbars = snd_devm_alloc_pages(&pci->dev, SNDRV_DMA_TYPE_DEV,
+					    chip->bdbars_count * sizeof(u32) *
+					    ICH_MAX_FRAGS * 2);
+	if (!chip->bdbars)
 		return -ENOMEM;
-	}
+
 	/* tables must be aligned to 8 bytes here, but the kernel pages
 	   are much bigger, so we don't care (on i386) */
 	int_sta_masks = 0;
 	for (i = 0; i < chip->bdbars_count; i++) {
 		ichdev = &chip->ichd[i];
-		ichdev->bdbar = ((__le32 *)chip->bdbars.area) + (i * ICH_MAX_FRAGS * 2);
-		ichdev->bdbar_addr = chip->bdbars.addr + (i * sizeof(u32) * ICH_MAX_FRAGS * 2);
+		ichdev->bdbar = ((__le32 *)chip->bdbars->area) + (i * ICH_MAX_FRAGS * 2);
+		ichdev->bdbar_addr = chip->bdbars->addr + (i * sizeof(u32) * ICH_MAX_FRAGS * 2);
 		int_sta_masks |= ichdev->int_sta_mask;
 	}
 	chip->int_sta_reg = ICH_REG_GLOB_STA;
@@ -1174,27 +1132,23 @@ static int snd_intel8x0m_create(struct snd_card *card,
 	pci_set_master(pci);
 
 	err = snd_intel8x0m_chip_init(chip, 1);
-	if (err < 0) {
-		snd_intel8x0m_free(chip);
+	if (err < 0)
 		return err;
-	}
 
+	/* NOTE: we don't use devm version here since it's released /
+	 * re-acquired in PM callbacks.
+	 * It's released explicitly in snd_intel8x0m_free(), too.
+	 */
 	if (request_irq(pci->irq, snd_intel8x0m_interrupt, IRQF_SHARED,
 			KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_intel8x0m_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_intel8x0m_free(chip);
-		return err;
-	}
+	card->private_free = snd_intel8x0m_free;
 
-	*r_intel8x0m = chip;
 	return 0;
 }
 
@@ -1232,9 +1186,11 @@ static int snd_intel8x0m_probe(struct pci_dev *pci,
 	int err;
 	struct shortname_table *name;
 
-	err = snd_card_new(&pci->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pci->dev, index, id, THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	strcpy(card->driver, "ICH-MODEM");
 	strcpy(card->shortname, "Intel ICH");
@@ -1246,23 +1202,16 @@ static int snd_intel8x0m_probe(struct pci_dev *pci,
 	}
 	strcat(card->shortname," Modem");
 
-	err = snd_intel8x0m_create(card, pci, pci_id->driver_data, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_intel8x0m_init(card, pci, pci_id->driver_data);
+	if (err < 0)
 		return err;
-	}
-	card->private_data = chip;
 
 	err = snd_intel8x0m_mixer(chip, ac97_clock);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_intel8x0m_pcm(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	
 	snd_intel8x0m_proc_init(chip);
 
@@ -1270,24 +1219,16 @@ static int snd_intel8x0m_probe(struct pci_dev *pci,
 		card->shortname, chip->irq);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pci_set_drvdata(pci, card);
 	return 0;
 }
 
-static void snd_intel8x0m_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver intel8x0m_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_intel8x0m_ids,
 	.probe = snd_intel8x0m_probe,
-	.remove = snd_intel8x0m_remove,
 	.driver = {
 		.pm = INTEL8X0M_PM_OPS,
 	},
-- 
2.26.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4923C9A1E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B86A16A6;
	Thu, 15 Jul 2021 10:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B86A16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336390;
	bh=9oT/8Yn6eM/MS37V2qs4XXcYDIVtK0JgNZI3RjsnY9M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEdR2al8fYZAZcb0LrzU9cp33zcGTPHBT2kEl5l9kUjQkzDQj0kmYW0z2jiUmrHkP
	 tZzHJzxnKYAF65dSebKDO7puapeU8mnq5BaeVdGenJ44UgHAviHVJjkp1XCjr3AzyP
	 1JYfh/tzh+vVZLkVI0uCuSSRKDvycWmaPMfut7+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 677E9F805C9;
	Thu, 15 Jul 2021 10:00:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C01E5F8057A; Thu, 15 Jul 2021 10:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E986F804E1
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E986F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="c6l52mFW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="FCkCWryL"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 637821FDF4
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVoQFZcZDEz/aIY4axXyCs2PwKbA/oK8tE2aB3o6Z9s=;
 b=c6l52mFWDEiLLqh0Wd4q2NC1KYpb61amoMi+trPQ8mZ6X1nXuPRSE6yB4NJzbXmfpSODSH
 RbWXmAXwF0NJfYzU/2r2ceoRqbHFx2wKXwv9AodOhz5HOMrOSYU2h3nqFQBD0dP986UOcU
 j6kSzoua8laJLzCkKSPOm2QXzJb+C60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335997;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVoQFZcZDEz/aIY4axXyCs2PwKbA/oK8tE2aB3o6Z9s=;
 b=FCkCWryL1W4EvDCumwixQY21ETEBSRtK9V2X5tDzYYoc93ZDUSqN4hFq+wJQrx/X3yYkH3
 Oq1OC5kCvwT/zrCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 51526A3B99;
 Thu, 15 Jul 2021 07:59:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 12/79] ALSA: bt87x: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:58:34 +0200
Message-Id: <20210715075941.23332-13-tiwai@suse.de>
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

This patch converts the resource management in PCI bt87x driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/bt87x.c | 98 ++++++++++++-----------------------------------
 1 file changed, 25 insertions(+), 73 deletions(-)

diff --git a/sound/pci/bt87x.c b/sound/pci/bt87x.c
index 39bcfb81e81c..d23f93163841 100644
--- a/sound/pci/bt87x.c
+++ b/sound/pci/bt87x.c
@@ -656,23 +656,11 @@ static const struct snd_kcontrol_new snd_bt87x_capture_source = {
 	.put = snd_bt87x_capture_source_put,
 };
 
-static int snd_bt87x_free(struct snd_bt87x *chip)
-{
-	if (chip->mmio)
-		snd_bt87x_stop(chip);
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-	iounmap(chip->mmio);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_bt87x_dev_free(struct snd_device *device)
+static void snd_bt87x_free(struct snd_card *card)
 {
-	struct snd_bt87x *chip = device->device_data;
-	return snd_bt87x_free(chip);
+	struct snd_bt87x *chip = card->private_data;
+
+	snd_bt87x_stop(chip);
 }
 
 static int snd_bt87x_pcm(struct snd_bt87x *chip, int device, char *name)
@@ -694,43 +682,24 @@ static int snd_bt87x_pcm(struct snd_bt87x *chip, int device, char *name)
 }
 
 static int snd_bt87x_create(struct snd_card *card,
-			    struct pci_dev *pci,
-			    struct snd_bt87x **rchip)
+			    struct pci_dev *pci)
 {
-	struct snd_bt87x *chip;
+	struct snd_bt87x *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free = snd_bt87x_dev_free
-	};
-
-	*rchip = NULL;
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
-	if (!chip) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	chip->card = card;
 	chip->pci = pci;
 	chip->irq = -1;
 	spin_lock_init(&chip->reg_lock);
 
-	err = pci_request_regions(pci, "Bt87x audio");
-	if (err < 0) {
-		kfree(chip);
-		pci_disable_device(pci);
+	err = pcim_iomap_regions(pci, 1 << 0, "Bt87x audio");
+	if (err < 0)
 		return err;
-	}
-	chip->mmio = pci_ioremap_bar(pci, 0);
-	if (!chip->mmio) {
-		dev_err(card->dev, "cannot remap io memory\n");
-		err = -ENOMEM;
-		goto fail;
-	}
+	chip->mmio = pcim_iomap_table(pci)[0];
 
 	chip->reg_control = CTL_A_PWRDN | CTL_DA_ES2 |
 			    CTL_PKTP_16 | (15 << CTL_DA_SDR_SHIFT);
@@ -739,26 +708,18 @@ static int snd_bt87x_create(struct snd_card *card,
 	snd_bt87x_writel(chip, REG_INT_MASK, 0);
 	snd_bt87x_writel(chip, REG_INT_STAT, MY_INTERRUPTS);
 
-	err = request_irq(pci->irq, snd_bt87x_interrupt, IRQF_SHARED,
-			  KBUILD_MODNAME, chip);
+	err = devm_request_irq(&pci->dev, pci->irq, snd_bt87x_interrupt,
+			       IRQF_SHARED, KBUILD_MODNAME, chip);
 	if (err < 0) {
 		dev_err(card->dev, "cannot grab irq %d\n", pci->irq);
-		goto fail;
+		return err;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	card->private_free = snd_bt87x_free;
 	pci_set_master(pci);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0)
-		goto fail;
-
-	*rchip = chip;
 	return 0;
-
-fail:
-	snd_bt87x_free(chip);
-	return err;
 }
 
 #define BT_DEVICE(chip, subvend, subdev, id) \
@@ -868,14 +829,15 @@ static int snd_bt87x_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
-	err = snd_bt87x_create(card, pci, &chip);
+	err = snd_bt87x_create(card, pci);
 	if (err < 0)
-		goto _error;
+		return err;
 
 	memcpy(&chip->board, &snd_bt87x_boards[boardid], sizeof(chip->board));
 
@@ -887,24 +849,24 @@ static int snd_bt87x_probe(struct pci_dev *pci,
 
 		err = snd_bt87x_pcm(chip, DEVICE_DIGITAL, "Bt87x Digital");
 		if (err < 0)
-			goto _error;
+			return err;
 	}
 	if (!chip->board.no_analog) {
 		err = snd_bt87x_pcm(chip, DEVICE_ANALOG, "Bt87x Analog");
 		if (err < 0)
-			goto _error;
+			return err;
 		err = snd_ctl_add(card, snd_ctl_new1(
 				  &snd_bt87x_capture_volume, chip));
 		if (err < 0)
-			goto _error;
+			return err;
 		err = snd_ctl_add(card, snd_ctl_new1(
 				  &snd_bt87x_capture_boost, chip));
 		if (err < 0)
-			goto _error;
+			return err;
 		err = snd_ctl_add(card, snd_ctl_new1(
 				  &snd_bt87x_capture_source, chip));
 		if (err < 0)
-			goto _error;
+			return err;
 	}
 	dev_info(card->dev, "bt87x%d: Using board %d, %sanalog, %sdigital "
 		   "(rate %d Hz)\n", dev, boardid,
@@ -920,20 +882,11 @@ static int snd_bt87x_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto _error;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	++dev;
 	return 0;
-
-_error:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_bt87x_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 /* default entries for all Bt87x cards - it's not exported */
@@ -948,7 +901,6 @@ static struct pci_driver driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_bt87x_ids,
 	.probe = snd_bt87x_probe,
-	.remove = snd_bt87x_remove,
 };
 
 static int __init alsa_card_bt87x_init(void)
-- 
2.26.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D70E3C9A60
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:18:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99AA116D5;
	Thu, 15 Jul 2021 10:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99AA116D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337109;
	bh=d/C0rxyXkKVuR0Uscy2kZMRm2mBQNj8N5xvsZfdYMbI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XuHjykqJGyx/dysv5Qty2BPLnmc578gqXrIhaMdo0wA/a9KPpAnIKiAcYprGnfxmY
	 OeT0jF65H876Z0BuZLRa32kpj9TWgSKFOmRkk7XipNBT+4Ki5E9mecynOOKKOqh+wI
	 4b7VTQ0fqT8i2IkOD8xCATdwdTEUjMBARkZ4t0aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 474A0F806F0;
	Thu, 15 Jul 2021 10:01:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05189F8067A; Thu, 15 Jul 2021 10:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4C81F80527
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C81F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Vo1Ukmcs"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="gIdpdcFP"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A85E81FD3E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzI14anQ4CDPJLD01RdxJOrySULsuaN6XiAhanN5VYg=;
 b=Vo1Ukmcsua1Yy/3Mip8l4ecefHEbh6nsvRSG3w9CBZujRUObIz7LygteF7fWKMLtIwb8Ar
 +F+/VkK4CGo+VmwWTAmfeTozDg0ABd9WUy94yYIE+I+U1PwhgXNncQ2VpxH6/U5HegmTOb
 EsxxRQ7TPMhx1RVucC+tKSnHZAHfxh4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzI14anQ4CDPJLD01RdxJOrySULsuaN6XiAhanN5VYg=;
 b=gIdpdcFPs4bFzdwbu/n1lZMA9+ub5rt2fxARCvnn6SwMtZcvVcNV+j61Z6QSS9qqjSCuNp
 NDzvBOIu8tqsbWBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 964DDA3BC0;
 Thu, 15 Jul 2021 08:00:10 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 43/79] ALSA: oxygen: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:05 +0200
Message-Id: <20210715075941.23332-44-tiwai@suse.de>
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

This patch converts the resource management in PCI oxygen drivers with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the page allocations are
done with the devres helper.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/oxygen/oxygen.c     |  1 -
 sound/pci/oxygen/oxygen.h     |  1 -
 sound/pci/oxygen/oxygen_lib.c | 66 ++++++++++++-----------------------
 sound/pci/oxygen/se6x.c       |  1 -
 sound/pci/oxygen/virtuoso.c   |  1 -
 5 files changed, 22 insertions(+), 48 deletions(-)

diff --git a/sound/pci/oxygen/oxygen.c b/sound/pci/oxygen/oxygen.c
index e335c4b5b381..c346f42befc2 100644
--- a/sound/pci/oxygen/oxygen.c
+++ b/sound/pci/oxygen/oxygen.c
@@ -854,7 +854,6 @@ static struct pci_driver oxygen_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = oxygen_ids,
 	.probe = generic_oxygen_probe,
-	.remove = oxygen_pci_remove,
 #ifdef CONFIG_PM_SLEEP
 	.driver = {
 		.pm = &oxygen_pci_pm,
diff --git a/sound/pci/oxygen/oxygen.h b/sound/pci/oxygen/oxygen.h
index 06bf7e5744d0..0cae640708f3 100644
--- a/sound/pci/oxygen/oxygen.h
+++ b/sound/pci/oxygen/oxygen.h
@@ -161,7 +161,6 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 				      const struct pci_device_id *id
 				     )
 		    );
-void oxygen_pci_remove(struct pci_dev *pci);
 #ifdef CONFIG_PM_SLEEP
 extern const struct dev_pm_ops oxygen_pci_pm;
 #endif
diff --git a/sound/pci/oxygen/oxygen_lib.c b/sound/pci/oxygen/oxygen_lib.c
index afc6dd329c09..4fb3f2484fdb 100644
--- a/sound/pci/oxygen/oxygen_lib.c
+++ b/sound/pci/oxygen/oxygen_lib.c
@@ -570,15 +570,10 @@ static void oxygen_card_free(struct snd_card *card)
 	struct oxygen *chip = card->private_data;
 
 	oxygen_shutdown(chip);
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
 	flush_work(&chip->spdif_input_bits_work);
 	flush_work(&chip->gpio_work);
 	chip->model.cleanup(chip);
-	kfree(chip->model_data);
 	mutex_destroy(&chip->mutex);
-	pci_release_regions(chip->pci);
-	pci_disable_device(chip->pci);
 }
 
 int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
@@ -594,8 +589,8 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 	const struct pci_device_id *pci_id;
 	int err;
 
-	err = snd_card_new(&pci->dev, index, id, owner,
-			   sizeof(*chip), &card);
+	err = snd_devm_card_new(&pci->dev, index, id, owner,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
 
@@ -610,41 +605,38 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 	INIT_WORK(&chip->gpio_work, oxygen_gpio_changed);
 	init_waitqueue_head(&chip->ac97_waitqueue);
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
-		goto err_card;
+		return err;
 
 	err = pci_request_regions(pci, DRIVER);
 	if (err < 0) {
 		dev_err(card->dev, "cannot reserve PCI resources\n");
-		goto err_pci_enable;
+		return err;
 	}
 
 	if (!(pci_resource_flags(pci, 0) & IORESOURCE_IO) ||
 	    pci_resource_len(pci, 0) < OXYGEN_IO_SIZE) {
 		dev_err(card->dev, "invalid PCI I/O range\n");
-		err = -ENXIO;
-		goto err_pci_regions;
+		return -ENXIO;
 	}
 	chip->addr = pci_resource_start(pci, 0);
 
 	pci_id = oxygen_search_pci_id(chip, ids);
-	if (!pci_id) {
-		err = -ENODEV;
-		goto err_pci_regions;
-	}
+	if (!pci_id)
+		return -ENODEV;
+
 	oxygen_restore_eeprom(chip, pci_id);
 	err = get_model(chip, pci_id);
 	if (err < 0)
-		goto err_pci_regions;
+		return err;
 
 	if (chip->model.model_data_size) {
-		chip->model_data = kzalloc(chip->model.model_data_size,
-					   GFP_KERNEL);
-		if (!chip->model_data) {
-			err = -ENOMEM;
-			goto err_pci_regions;
-		}
+		chip->model_data = devm_kzalloc(&pci->dev,
+						chip->model.model_data_size,
+						GFP_KERNEL);
+		if (!chip->model_data)
+			return -ENOMEM;
 	}
 
 	pci_set_master(pci);
@@ -654,11 +646,11 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 	oxygen_init(chip);
 	chip->model.init(chip);
 
-	err = request_irq(pci->irq, oxygen_interrupt, IRQF_SHARED,
-			  KBUILD_MODNAME, chip);
+	err = devm_request_irq(&pci->dev, pci->irq, oxygen_interrupt,
+			       IRQF_SHARED, KBUILD_MODNAME, chip);
 	if (err < 0) {
 		dev_err(card->dev, "cannot grab interrupt %d\n", pci->irq);
-		goto err_card;
+		return err;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
@@ -672,11 +664,11 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 
 	err = oxygen_pcm_init(chip);
 	if (err < 0)
-		goto err_card;
+		return err;
 
 	err = oxygen_mixer_init(chip);
 	if (err < 0)
-		goto err_card;
+		return err;
 
 	if (chip->model.device_config & (MIDI_OUTPUT | MIDI_INPUT)) {
 		unsigned int info_flags =
@@ -689,7 +681,7 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 					  chip->addr + OXYGEN_MPU401,
 					  info_flags, -1, &chip->midi);
 		if (err < 0)
-			goto err_card;
+			return err;
 	}
 
 	oxygen_proc_init(chip);
@@ -704,27 +696,13 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto err_card;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	return 0;
-
-err_pci_regions:
-	pci_release_regions(pci);
-err_pci_enable:
-	pci_disable_device(pci);
-err_card:
-	snd_card_free(card);
-	return err;
 }
 EXPORT_SYMBOL(oxygen_pci_probe);
 
-void oxygen_pci_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-EXPORT_SYMBOL(oxygen_pci_remove);
-
 #ifdef CONFIG_PM_SLEEP
 static int oxygen_pci_suspend(struct device *dev)
 {
diff --git a/sound/pci/oxygen/se6x.c b/sound/pci/oxygen/se6x.c
index 434f885f6f91..17650a5b1bfa 100644
--- a/sound/pci/oxygen/se6x.c
+++ b/sound/pci/oxygen/se6x.c
@@ -137,7 +137,6 @@ static struct pci_driver se6x_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = se6x_ids,
 	.probe = se6x_probe,
-	.remove = oxygen_pci_remove,
 #ifdef CONFIG_PM_SLEEP
 	.driver = {
 		.pm = &oxygen_pci_pm,
diff --git a/sound/pci/oxygen/virtuoso.c b/sound/pci/oxygen/virtuoso.c
index baa3244d4dab..2e405133371f 100644
--- a/sound/pci/oxygen/virtuoso.c
+++ b/sound/pci/oxygen/virtuoso.c
@@ -82,7 +82,6 @@ static struct pci_driver xonar_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = xonar_ids,
 	.probe = xonar_probe,
-	.remove = oxygen_pci_remove,
 #ifdef CONFIG_PM_SLEEP
 	.driver = {
 		.pm = &oxygen_pci_pm,
-- 
2.26.2


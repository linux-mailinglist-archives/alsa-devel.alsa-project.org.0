Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C8C3C727A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F34F01746;
	Tue, 13 Jul 2021 16:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F34F01746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187276;
	bh=M61xlYjISGekzwcgH9tpsxHic38nO0IrBeBX+A4jb64=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=si87eVt87ToH2nFLvr6YNyybnACXljxIun4eZR98RQKKr0SRq1qn3mjeBDv3ym3BC
	 aYc9RIpZlT2ns6qJrgeuxzI5N44eMu7mZMGwNQWSeHzVK0rj8rzRnOULVIMIDZSRXK
	 QBXCZOfdXNMFlMgWdM7LtrLdpwuk+F33zq6gjkzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52546F805C1;
	Tue, 13 Jul 2021 16:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1795FF8051E; Tue, 13 Jul 2021 16:29:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8059F804FF
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8059F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="VtrSOIyE"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="p5o/pf3p"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7D33C22837
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0M9C7JIFCdVwEfvT+i1ktVRpUU4Ny5l0DvVLus9qE8=;
 b=VtrSOIyEfII/zhg2LxJ/DGWRwRnjMv93QbFTMuqN8mzTbhcpOpTZlYbI6zvnc5wqP9eHwo
 NQZiwYAXH5Zqb8ZOv+C9OT8OKRNE+2w9NuUomb6iXcbMT0yfLG3i2bXa38KiCmjYbgrDTX
 Uv0HcRXEUacu1xWExJYoKpdfizBSNSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0M9C7JIFCdVwEfvT+i1ktVRpUU4Ny5l0DvVLus9qE8=;
 b=p5o/pf3pg63O18TENg2YhKiYFkQortbsoS04pmYR5tWrArylj3+IlE83RVaOBAMiFFVEj4
 LD/e1+9hdBrrd/AA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6CD36A3B8A;
 Tue, 13 Jul 2021 14:29:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 30/51] ALSA: cs5535audio: Allocate resources with
 device-managed APIs
Date: Tue, 13 Jul 2021 16:28:36 +0200
Message-Id: <20210713142857.19654-31-tiwai@suse.de>
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

This patch converts the resource management in PCI cs5535audio driver
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, and the card object
release is managed now via card->private_free instead of a lowlevel
snd_device.  A slight uncertain change is the call of
olpc_quirks_cleanup() at removal: formerly this was called
unconditionally at remove, but this should be a conditionally call,
hence the machine_is_olpc() check is added here as well.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs5535audio/cs5535audio.c      | 94 +++++-------------------
 sound/pci/cs5535audio/cs5535audio_olpc.c |  7 +-
 2 files changed, 23 insertions(+), 78 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index e048b45d9e7e..499fa0148f9a 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -237,51 +237,24 @@ static irqreturn_t snd_cs5535audio_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int snd_cs5535audio_free(struct cs5535audio *cs5535au)
+static void snd_cs5535audio_free(struct snd_card *card)
 {
-	pci_set_power_state(cs5535au->pci, PCI_D3hot);
-
-	if (cs5535au->irq >= 0)
-		free_irq(cs5535au->irq, cs5535au);
-
-	pci_release_regions(cs5535au->pci);
-	pci_disable_device(cs5535au->pci);
-	kfree(cs5535au);
-	return 0;
-}
-
-static int snd_cs5535audio_dev_free(struct snd_device *device)
-{
-	struct cs5535audio *cs5535au = device->device_data;
-	return snd_cs5535audio_free(cs5535au);
+	olpc_quirks_cleanup();
 }
 
 static int snd_cs5535audio_create(struct snd_card *card,
-				  struct pci_dev *pci,
-				  struct cs5535audio **rcs5535au)
+				  struct pci_dev *pci)
 {
-	struct cs5535audio *cs5535au;
-
+	struct cs5535audio *cs5535au = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_cs5535audio_dev_free,
-	};
 
-	*rcs5535au = NULL;
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_warn(card->dev, "unable to get 32bit dma\n");
-		err = -ENXIO;
-		goto pcifail;
-	}
-
-	cs5535au = kzalloc(sizeof(*cs5535au), GFP_KERNEL);
-	if (cs5535au == NULL) {
-		err = -ENOMEM;
-		goto pcifail;
+		return -ENXIO;
 	}
 
 	spin_lock_init(&cs5535au->reg_lock);
@@ -290,38 +263,22 @@ static int snd_cs5535audio_create(struct snd_card *card,
 	cs5535au->irq = -1;
 
 	err = pci_request_regions(pci, "CS5535 Audio");
-	if (err < 0) {
-		kfree(cs5535au);
-		goto pcifail;
-	}
+	if (err < 0)
+		return err;
 
 	cs5535au->port = pci_resource_start(pci, 0);
 
-	if (request_irq(pci->irq, snd_cs5535audio_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, cs5535au)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_cs5535audio_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, cs5535au)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		err = -EBUSY;
-		goto sndfail;
+		return -EBUSY;
 	}
 
 	cs5535au->irq = pci->irq;
 	card->sync_irq = cs5535au->irq;
 	pci_set_master(pci);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, cs5535au, &ops);
-	if (err < 0)
-		goto sndfail;
-
-	*rcs5535au = cs5535au;
 	return 0;
-
-sndfail: /* leave the device alive, just kill the snd */
-	snd_cs5535audio_free(cs5535au);
-	return err;
-
-pcifail:
-	pci_disable_device(pci);
-	return err;
 }
 
 static int snd_cs5535audio_probe(struct pci_dev *pci,
@@ -339,24 +296,24 @@ static int snd_cs5535audio_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*cs5535au), &card);
 	if (err < 0)
 		return err;
+	cs5535au = card->private_data;
+	card->private_free = snd_cs5535audio_free;
 
-	err = snd_cs5535audio_create(card, pci, &cs5535au);
+	err = snd_cs5535audio_create(card, pci);
 	if (err < 0)
-		goto probefail_out;
-
-	card->private_data = cs5535au;
+		return err;
 
 	err = snd_cs5535audio_mixer(cs5535au);
 	if (err < 0)
-		goto probefail_out;
+		return err;
 
 	err = snd_cs5535audio_pcm(cs5535au);
 	if (err < 0)
-		goto probefail_out;
+		return err;
 
 	strcpy(card->driver, DRIVER_NAME);
 
@@ -367,28 +324,17 @@ static int snd_cs5535audio_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto probefail_out;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
-
-probefail_out:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_cs5535audio_remove(struct pci_dev *pci)
-{
-	olpc_quirks_cleanup();
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver cs5535audio_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cs5535audio_ids,
 	.probe = snd_cs5535audio_probe,
-	.remove = snd_cs5535audio_remove,
 #ifdef CONFIG_PM_SLEEP
 	.driver = {
 		.pm = &snd_cs5535audio_pm,
diff --git a/sound/pci/cs5535audio/cs5535audio_olpc.c b/sound/pci/cs5535audio/cs5535audio_olpc.c
index 110d3209441b..122170a410d9 100644
--- a/sound/pci/cs5535audio/cs5535audio_olpc.c
+++ b/sound/pci/cs5535audio/cs5535audio_olpc.c
@@ -171,10 +171,8 @@ int olpc_quirks(struct snd_card *card, struct snd_ac97 *ac97)
 	for (i = 0; i < ARRAY_SIZE(olpc_cs5535audio_ctls); i++) {
 		err = snd_ctl_add(card, snd_ctl_new1(&olpc_cs5535audio_ctls[i],
 				ac97->private_data));
-		if (err < 0) {
-			gpio_free(OLPC_GPIO_MIC_AC);
+		if (err < 0)
 			return err;
-		}
 	}
 
 	/* turn off the mic by default */
@@ -184,5 +182,6 @@ int olpc_quirks(struct snd_card *card, struct snd_ac97 *ac97)
 
 void olpc_quirks_cleanup(void)
 {
-	gpio_free(OLPC_GPIO_MIC_AC);
+	if (machine_is_olpc())
+		gpio_free(OLPC_GPIO_MIC_AC);
 }
-- 
2.26.2


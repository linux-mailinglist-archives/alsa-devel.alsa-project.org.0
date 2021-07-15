Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C295D3C9A4B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D3831708;
	Thu, 15 Jul 2021 10:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D3831708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336833;
	bh=M61xlYjISGekzwcgH9tpsxHic38nO0IrBeBX+A4jb64=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W8VsaZV4DFY7tJYU+yEp+27ETJthknJYss/SEoMXGDQZu+v9dok/QDujzhpcwk0yf
	 MCbqfG/VF2HZYv3I8XKus9LS8/1YEA2aDx3BbF8mOOxTUBgNIcgIda+OHdXa+wtWyC
	 I+upzx6WwE6+THt71vvexqlp7E80ycqabcwazcMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FB16F8051A;
	Thu, 15 Jul 2021 10:00:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0946F80621; Thu, 15 Jul 2021 10:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD781F80510
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD781F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="2Xtzp6x1"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="rwFJqCbi"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A9FCB1FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0M9C7JIFCdVwEfvT+i1ktVRpUU4Ny5l0DvVLus9qE8=;
 b=2Xtzp6x1oa4js8kloxTbKY1kz1NICMeNXr3/H3w88Tskd/5AUxv9YiiCUcnBKDwWwkfvGY
 uHt0OwWCXoKdNS0S0qNburkwHqDPeKJG2FWZCbuHb9I2Nq4W3DvMEAnTOC82+HbS5wVSGc
 CuNIwEtHLQhaZ8Ru30v4N1elNcIxeg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0M9C7JIFCdVwEfvT+i1ktVRpUU4Ny5l0DvVLus9qE8=;
 b=rwFJqCbiYBFq8BheVEuQxP20E2c6gB56xcjBS3Oh/W4NJCngtgm7y2RW8zYFN82RHmv3jY
 PMc835rEsKJhDyBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 9942BA3B8D;
 Thu, 15 Jul 2021 08:00:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 31/79] ALSA: cs5535audio: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:58:53 +0200
Message-Id: <20210715075941.23332-32-tiwai@suse.de>
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F883C7260
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:39:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E667172A;
	Tue, 13 Jul 2021 16:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E667172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187149;
	bh=bNSQemfVC1DiX6Uq9y18hFJZpLstF4eX4rh3LBHuYdw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=prNRjhYEeD1XNtwZlsQtdZm9dNIqq5Nyux1xzbsLhj23zWoj7Qg3T7i/pPu9Xghew
	 3741eABP3YxERAs98NbgY6gYU/I7yRwte5RLpKINXWq1e4CeO8xVXLLnvNkVYrh1FW
	 UCK4tpwBMZIZSjnKo5eISX05y84znIkFzVkJhTyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD684F805A9;
	Tue, 13 Jul 2021 16:30:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94939F80563; Tue, 13 Jul 2021 16:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17190F8051F
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17190F8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="WAqOZk2C"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="XJdETGTv"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CC1BE201E4
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7FdamqqrTOHT6NYW+ddkP/Za1baGYW44k+vEw1Su2q4=;
 b=WAqOZk2COrXkN54u1MNGOGNfyvzQOhYIR4fXwiSY3b386lmBRdFaYGy+AEzAJICy9jReGx
 h5lrLqgop3v/t6ZtetYctGm1r+Iyhes1HlcpHPIVFuBb5Zkv9xfV2lSuWyfr/lDPt2rT0T
 Vpe7/4Hg10UWklha/gM80CM/aZx8adQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7FdamqqrTOHT6NYW+ddkP/Za1baGYW44k+vEw1Su2q4=;
 b=XJdETGTv8BbWaKa5WieI2nsB3J5GY1yrKn6AFJYA2cxrk/4uYDhoKhLm59UyBHl6CU4rxP
 mmllMq+o9gA39XAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C4FD6A3B83;
 Tue, 13 Jul 2021 14:29:28 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 23/51] ALSA: sonicvibes: Allocate resources with
 device-managed APIs
Date: Tue, 13 Jul 2021 16:28:29 +0200
Message-Id: <20210713142857.19654-24-tiwai@suse.de>
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

This patch converts the resource management in PCI sonicvibes driver
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, and the card object
release is managed now via card->private_free instead of a lowlevel
snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/sonicvibes.c | 117 ++++++++++-------------------------------
 1 file changed, 27 insertions(+), 90 deletions(-)

diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index 03a48da897e3..c8c49881008f 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -1193,69 +1193,43 @@ static inline int snd_sonicvibes_create_gameport(struct sonicvibes *sonic) { ret
 static inline void snd_sonicvibes_free_gameport(struct sonicvibes *sonic) { }
 #endif
 
-static int snd_sonicvibes_free(struct sonicvibes *sonic)
+static void snd_sonicvibes_free(struct snd_card *card)
 {
+	struct sonicvibes *sonic = card->private_data;
+
 	snd_sonicvibes_free_gameport(sonic);
 	pci_write_config_dword(sonic->pci, 0x40, sonic->dmaa_port);
 	pci_write_config_dword(sonic->pci, 0x48, sonic->dmac_port);
-	if (sonic->irq >= 0)
-		free_irq(sonic->irq, sonic);
-	release_and_free_resource(sonic->res_dmaa);
-	release_and_free_resource(sonic->res_dmac);
-	pci_release_regions(sonic->pci);
-	pci_disable_device(sonic->pci);
-	kfree(sonic);
-	return 0;
-}
-
-static int snd_sonicvibes_dev_free(struct snd_device *device)
-{
-	struct sonicvibes *sonic = device->device_data;
-	return snd_sonicvibes_free(sonic);
 }
 
 static int snd_sonicvibes_create(struct snd_card *card,
 				 struct pci_dev *pci,
 				 int reverb,
-				 int mge,
-				 struct sonicvibes **rsonic)
+				 int mge)
 {
-	struct sonicvibes *sonic;
+	struct sonicvibes *sonic = card->private_data;
 	unsigned int dmaa, dmac;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_sonicvibes_dev_free,
-	};
 
-	*rsonic = NULL;
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	/* check, if we can restrict PCI DMA transfers to 24 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(24))) {
 		dev_err(card->dev,
 			"architecture does not support 24bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
                 return -ENXIO;
         }
 
-	sonic = kzalloc(sizeof(*sonic), GFP_KERNEL);
-	if (sonic == NULL) {
-		pci_disable_device(pci);
-		return -ENOMEM;
-	}
 	spin_lock_init(&sonic->reg_lock);
 	sonic->card = card;
 	sonic->pci = pci;
 	sonic->irq = -1;
 
 	err = pci_request_regions(pci, "S3 SonicVibes");
-	if (err < 0) {
-		kfree(sonic);
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 
 	sonic->sb_port = pci_resource_start(pci, 0);
 	sonic->enh_port = pci_resource_start(pci, 1);
@@ -1263,14 +1237,14 @@ static int snd_sonicvibes_create(struct snd_card *card,
 	sonic->midi_port = pci_resource_start(pci, 3);
 	sonic->game_port = pci_resource_start(pci, 4);
 
-	if (request_irq(pci->irq, snd_sonicvibes_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, sonic)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_sonicvibes_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, sonic)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_sonicvibes_free(sonic);
 		return -EBUSY;
 	}
 	sonic->irq = pci->irq;
 	card->sync_irq = sonic->irq;
+	card->private_free = snd_sonicvibes_free;
 
 	pci_read_config_dword(pci, 0x40, &dmaa);
 	pci_read_config_dword(pci, 0x48, &dmac);
@@ -1294,17 +1268,17 @@ static int snd_sonicvibes_create(struct snd_card *card,
 	pci_write_config_dword(pci, 0x40, dmaa);
 	pci_write_config_dword(pci, 0x48, dmac);
 
-	sonic->res_dmaa = request_region(dmaa, 0x10, "S3 SonicVibes DDMA-A");
+	sonic->res_dmaa = devm_request_region(&pci->dev, dmaa, 0x10,
+					      "S3 SonicVibes DDMA-A");
 	if (!sonic->res_dmaa) {
-		snd_sonicvibes_free(sonic);
 		dev_err(card->dev,
 			"unable to grab DDMA-A port at 0x%x-0x%x\n",
 			dmaa, dmaa + 0x10 - 1);
 		return -EBUSY;
 	}
-	sonic->res_dmac = request_region(dmac, 0x10, "S3 SonicVibes DDMA-C");
+	sonic->res_dmac = devm_request_region(&pci->dev, dmac, 0x10,
+					      "S3 SonicVibes DDMA-C");
 	if (!sonic->res_dmac) {
-		snd_sonicvibes_free(sonic);
 		dev_err(card->dev,
 			"unable to grab DDMA-C port at 0x%x-0x%x\n",
 			dmac, dmac + 0x10 - 1);
@@ -1365,15 +1339,7 @@ static int snd_sonicvibes_create(struct snd_card *card,
 #endif
 	sonic->revision = snd_sonicvibes_in(sonic, SV_IREG_REVISION);
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, sonic, &ops);
-	if (err < 0) {
-		snd_sonicvibes_free(sonic);
-		return err;
-	}
-
 	snd_sonicvibes_proc_init(sonic);
-
-	*rsonic = sonic;
 	return 0;
 }
 
@@ -1429,7 +1395,7 @@ static int snd_sonic_probe(struct pci_dev *pci,
 	struct sonicvibes *sonic;
 	struct snd_rawmidi *midi_uart;
 	struct snd_opl3 *opl3;
-	int idx, err;
+	int err;
 
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
@@ -1438,25 +1404,16 @@ static int snd_sonic_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
  
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*sonic), &card);
 	if (err < 0)
 		return err;
-	for (idx = 0; idx < 5; idx++) {
-		if (pci_resource_start(pci, idx) == 0 ||
-		    !(pci_resource_flags(pci, idx) & IORESOURCE_IO)) {
-			snd_card_free(card);
-			return -ENODEV;
-		}
-	}
+	sonic = card->private_data;
 	err = snd_sonicvibes_create(card, pci,
 				    reverb[dev] ? 1 : 0,
-				    mge[dev] ? 1 : 0,
-				    &sonic);
-	if (err < 0) {
-		snd_card_free(card);
+				    mge[dev] ? 1 : 0);
+	if (err < 0)
 		return err;
-	}
 
 	strcpy(card->driver, "SonicVibes");
 	strcpy(card->shortname, "S3 SonicVibes");
@@ -1467,65 +1424,45 @@ static int snd_sonic_probe(struct pci_dev *pci,
 		sonic->irq);
 
 	err = snd_sonicvibes_pcm(sonic, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_sonicvibes_mixer(sonic);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_mpu401_uart_new(card, 0, MPU401_HW_SONICVIBES,
 				  sonic->midi_port,
 				  MPU401_INFO_INTEGRATED |
 				  MPU401_INFO_IRQ_HOOK,
 				  -1, &midi_uart);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	snd_sonicvibes_midi(sonic, midi_uart);
 	err = snd_opl3_create(card, sonic->synth_port,
 			      sonic->synth_port + 2,
 			      OPL3_HW_OPL3_SV, 1, &opl3);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_sonicvibes_create_gameport(sonic);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
 }
 
-static void snd_sonic_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver sonicvibes_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_sonic_ids,
 	.probe = snd_sonic_probe,
-	.remove = snd_sonic_remove,
 };
 
 module_pci_driver(sonicvibes_driver);
-- 
2.26.2


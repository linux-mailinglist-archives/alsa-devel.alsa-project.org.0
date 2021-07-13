Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7553C7249
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A541706;
	Tue, 13 Jul 2021 16:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A541706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626186895;
	bh=iL+5QYWcqFJ/rqVbv6HLHKqK9CLp3bE/Iik22OwQ83w=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZIMdQvF6XqhWHhxk45FiTGZlaxvdrQsuXdCtnC5p51cxPx5cSz+9BBGM2C3JzLNq0
	 Ehj7OJuMD5jZQ92EAqBCZCdssVH/rrREztSIxO7cnbbo8WG5pckmSc4XJbZTxegdQZ
	 kQHlIAjUKr3+2CEyy5UKNira5iIIk1BV9YcWP0Is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D42F80524;
	Tue, 13 Jul 2021 16:29:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47B77F8051D; Tue, 13 Jul 2021 16:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 670EAF8020C
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 670EAF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ipJlu2G3"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="kNEenyJP"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 70A4B22890
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nl60tUDaTiqUjJ7wQbcQb591DUGCv849os2WeQHxgc8=;
 b=ipJlu2G338IFwFUnYS5XuPwhK8hAB7DEW6ZVnZXQMSxKANM+qPznOAq1o0ZL0N4cvnAA0k
 j94CFaNyGDVNHTR/8ipgSFwoBgyqonwtNIsapt0d4aDv4vtEDMc74e9PkOexNF9A75VHqA
 vtk4ZSVqqPvLeO3vi8Jjl4osIA6oNSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nl60tUDaTiqUjJ7wQbcQb591DUGCv849os2WeQHxgc8=;
 b=kNEenyJPNkCMuuhjIQ7wjzq9XwuGQdDYGMhDGUq8TXoOR3GW8F/0xwrfYFu9DvrAo6t/Jv
 4qfQ3WffxmSgUFBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 69637A3B85;
 Tue, 13 Jul 2021 14:29:16 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/51] ALSA: als4000: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:15 +0200
Message-Id: <20210713142857.19654-10-tiwai@suse.de>
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

This patch converts the resource management in PCI als4000 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/als4000.c | 59 +++++++++++++--------------------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index 509f317ee682..535eccd124be 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -746,13 +746,15 @@ static int snd_als4000_create_gameport(struct snd_card_als4000 *acard, int dev)
 
 	if (joystick_port[dev] == 1) { /* auto-detect */
 		for (io_port = 0x200; io_port <= 0x218; io_port += 8) {
-			r = request_region(io_port, 8, "ALS4000 gameport");
+			r = devm_request_region(&acard->pci->dev, io_port, 8,
+						"ALS4000 gameport");
 			if (r)
 				break;
 		}
 	} else {
 		io_port = joystick_port[dev];
-		r = request_region(io_port, 8, "ALS4000 gameport");
+		r = devm_request_region(&acard->pci->dev, io_port, 8,
+					"ALS4000 gameport");
 	}
 
 	if (!r) {
@@ -763,7 +765,6 @@ static int snd_als4000_create_gameport(struct snd_card_als4000 *acard, int dev)
 	acard->gameport = gp = gameport_allocate_port();
 	if (!gp) {
 		dev_err(&acard->pci->dev, "cannot allocate memory for gameport\n");
-		release_and_free_resource(r);
 		return -ENOMEM;
 	}
 
@@ -771,7 +772,6 @@ static int snd_als4000_create_gameport(struct snd_card_als4000 *acard, int dev)
 	gameport_set_phys(gp, "pci%s/gameport0", pci_name(acard->pci));
 	gameport_set_dev_parent(gp, &acard->pci->dev);
 	gp->io = io_port;
-	gameport_set_port_data(gp, r);
 
 	/* Enable legacy joystick port */
 	snd_als4000_set_addr(acard->iobase, 0, 0, 0, 1);
@@ -784,15 +784,11 @@ static int snd_als4000_create_gameport(struct snd_card_als4000 *acard, int dev)
 static void snd_als4000_free_gameport(struct snd_card_als4000 *acard)
 {
 	if (acard->gameport) {
-		struct resource *r = gameport_get_port_data(acard->gameport);
-
 		gameport_unregister_port(acard->gameport);
 		acard->gameport = NULL;
 
 		/* disable joystick */
 		snd_als4000_set_addr(acard->iobase, 0, 0, 0, 0);
-
-		release_and_free_resource(r);
 	}
 }
 #else
@@ -808,8 +804,6 @@ static void snd_card_als4000_free( struct snd_card *card )
 	snd_als4k_gcr_write_addr(acard->iobase, ALS4K_GCR8C_MISC_CTRL, 0);
 	/* free resources */
 	snd_als4000_free_gameport(acard);
-	pci_release_regions(acard->pci);
-	pci_disable_device(acard->pci);
 }
 
 static int snd_card_als4000_probe(struct pci_dev *pci,
@@ -832,36 +826,30 @@ static int snd_card_als4000_probe(struct pci_dev *pci,
 	}
 
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
 	/* check, if we can restrict PCI DMA transfers to 24 bits */
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(24))) {
 		dev_err(&pci->dev, "architecture does not support 24bit PCI busmaster DMA\n");
-		pci_disable_device(pci);
 		return -ENXIO;
 	}
 
 	err = pci_request_regions(pci, "ALS4000");
-	if (err < 0) {
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 	iobase = pci_resource_start(pci, 0);
 
 	pci_read_config_word(pci, PCI_COMMAND, &word);
 	pci_write_config_word(pci, PCI_COMMAND, word | PCI_COMMAND_IO);
 	pci_set_master(pci);
 	
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(*acard) /* private_data: acard */,
-			   &card);
-	if (err < 0) {
-		pci_release_regions(pci);
-		pci_disable_device(pci);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*acard) /* private_data: acard */,
+				&card);
+	if (err < 0)
 		return err;
-	}
 
 	acard = card->private_data;
 	acard->pci = pci;
@@ -881,7 +869,7 @@ static int snd_card_als4000_probe(struct pci_dev *pci,
 			       SB_HW_ALS4000,
 			       &chip);
 	if (err < 0)
-		goto out_err;
+		return err;
 	acard->chip = chip;
 
 	chip->pci = pci;
@@ -902,7 +890,7 @@ static int snd_card_als4000_probe(struct pci_dev *pci,
 	if (err < 0) {
 		dev_err(&pci->dev, "no MPU-401 device at 0x%lx?\n",
 				iobase + ALS4K_IOB_30_MIDI_DATA);
-		goto out_err;
+		return err;
 	}
 	/* FIXME: ALS4000 has interesting MPU401 configuration features
 	 * at ALS4K_CR1A_MPU401_UART_MODE_CONTROL
@@ -912,11 +900,11 @@ static int snd_card_als4000_probe(struct pci_dev *pci,
 
 	err = snd_als4000_pcm(chip, 0);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	err = snd_sbmixer_new(chip);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	if (snd_opl3_create(card,
 				iobase + ALS4K_IOB_10_ADLIB_ADDR0,
@@ -928,30 +916,18 @@ static int snd_card_als4000_probe(struct pci_dev *pci,
 	} else {
 		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 		if (err < 0)
-			goto out_err;
+			return err;
 	}
 
 	snd_als4000_create_gameport(acard, dev);
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto out_err;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	dev++;
-	err = 0;
-	goto out;
-
-out_err:
-	snd_card_free(card);
-	
-out:
-	return err;
-}
-
-static void snd_card_als4000_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
+	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -996,7 +972,6 @@ static struct pci_driver als4000_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_als4000_ids,
 	.probe = snd_card_als4000_probe,
-	.remove = snd_card_als4000_remove,
 	.driver = {
 		.pm = SND_ALS4000_PM_OPS,
 	},
-- 
2.26.2


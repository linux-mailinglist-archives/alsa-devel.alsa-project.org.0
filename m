Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7083C728B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:45:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973C5172E;
	Tue, 13 Jul 2021 16:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973C5172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187536;
	bh=XSFCpWcarI/UhCKK6/mXpzQb2gxAtZeW+imCNhjyJEI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IGmE9wJa9EpQ29Zyv5afzzcVZIMlUOkISoFRu9Kf8g7t6xEKRqswOqcrvubbuYEfo
	 7pvGKiBtU4wr/ONSqm0a7qH+fWKLBZzug9fmlYaxv7NS20UUvrxiKbUdMt7HVWxZVW
	 ZmrhMIMIvXbkjxOlSTrWncuR/XlFundjBbLD8vxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24F5FF80615;
	Tue, 13 Jul 2021 16:30:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83440F8052D; Tue, 13 Jul 2021 16:30:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23B4CF8053C
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23B4CF8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="LYvsuUfY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="am7jT/Iz"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DFDE222855
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAMtIW8bRBSWt+2TSKRdiNb5VV+3csQJNzMKaqR7Heg=;
 b=LYvsuUfYClqEQLkHFhz4aoTC+ZZUbb+2XJCN98dDy/+g9eSg50yTlCVIkkx9zq7tvVSkHR
 oY6Ka8J3e97kN3IXABndVkEvgqoXLSIpnZmOyhmHoUY87q9UiNW9ePsHiyhHesu/s+CDyb
 pNEVhtuX1NUI+KrVavq1y8iwx2DP5CA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186580;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAMtIW8bRBSWt+2TSKRdiNb5VV+3csQJNzMKaqR7Heg=;
 b=am7jT/Izg+bVIGjYbL5x4hZqAgwqAnP5uQiFiOLfcMOMakXD6uzzqAaEP9JmolftBx716l
 3AhZTDiyKQ6BLkDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D02D5A3B92;
 Tue, 13 Jul 2021 14:29:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 41/51] ALSA: hdspm: Allocate resources with device-managed APIs
Date: Tue, 13 Jul 2021 16:28:47 +0200
Message-Id: <20210713142857.19654-42-tiwai@suse.de>
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

This patch converts the resource management in PCI hdspm driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdspm.c | 64 ++++++++-------------------------------
 1 file changed, 12 insertions(+), 52 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 97a0bff96b28..ff06ee82607c 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6575,34 +6575,25 @@ static int snd_hdspm_create(struct snd_card *card,
 		}
 	}
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
 	pci_set_master(hdspm->pci);
 
-	err = pci_request_regions(pci, "hdspm");
+	err = pcim_iomap_regions(pci, 1 << 0, "hdspm");
 	if (err < 0)
 		return err;
 
 	hdspm->port = pci_resource_start(pci, 0);
 	io_extent = pci_resource_len(pci, 0);
-
-	dev_dbg(card->dev, "grabbed memory region 0x%lx-0x%lx\n",
-			hdspm->port, hdspm->port + io_extent - 1);
-
-	hdspm->iobase = ioremap(hdspm->port, io_extent);
-	if (!hdspm->iobase) {
-		dev_err(card->dev, "unable to remap region 0x%lx-0x%lx\n",
-				hdspm->port, hdspm->port + io_extent - 1);
-		return -EBUSY;
-	}
+	hdspm->iobase = pcim_iomap_table(pci)[0];
 	dev_dbg(card->dev, "remapped region (0x%lx) 0x%lx-0x%lx\n",
 			(unsigned long)hdspm->iobase, hdspm->port,
 			hdspm->port + io_extent - 1);
 
-	if (request_irq(pci->irq, snd_hdspm_interrupt,
-			IRQF_SHARED, KBUILD_MODNAME, hdspm)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_hdspm_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, hdspm)) {
 		dev_err(card->dev, "unable to use IRQ %d\n", pci->irq);
 		return -EBUSY;
 	}
@@ -6614,7 +6605,7 @@ static int snd_hdspm_create(struct snd_card *card,
 
 	dev_dbg(card->dev, "kmalloc Mixer memory of %zd Bytes\n",
 		sizeof(*hdspm->mixer));
-	hdspm->mixer = kzalloc(sizeof(*hdspm->mixer), GFP_KERNEL);
+	hdspm->mixer = devm_kzalloc(&pci->dev, sizeof(*hdspm->mixer), GFP_KERNEL);
 	if (!hdspm->mixer)
 		return -ENOMEM;
 
@@ -6859,8 +6850,9 @@ static int snd_hdspm_create(struct snd_card *card,
 }
 
 
-static int snd_hdspm_free(struct hdspm * hdspm)
+static void snd_hdspm_card_free(struct snd_card *card)
 {
+	struct hdspm *hdspm = card->private_data;
 
 	if (hdspm->port) {
 		cancel_work_sync(&hdspm->midi_work);
@@ -6873,28 +6865,6 @@ static int snd_hdspm_free(struct hdspm * hdspm)
 		hdspm_write(hdspm, HDSPM_controlRegister,
 			    hdspm->control_register);
 	}
-
-	if (hdspm->irq >= 0)
-		free_irq(hdspm->irq, (void *) hdspm);
-
-	kfree(hdspm->mixer);
-	iounmap(hdspm->iobase);
-
-	if (hdspm->port)
-		pci_release_regions(hdspm->pci);
-
-	if (pci_is_enabled(hdspm->pci))
-		pci_disable_device(hdspm->pci);
-	return 0;
-}
-
-
-static void snd_hdspm_card_free(struct snd_card *card)
-{
-	struct hdspm *hdspm = card->private_data;
-
-	if (hdspm)
-		snd_hdspm_free(hdspm);
 }
 
 
@@ -6913,8 +6883,8 @@ static int snd_hdspm_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev],
-			   THIS_MODULE, sizeof(*hdspm), &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev],
+				THIS_MODULE, sizeof(*hdspm), &card);
 	if (err < 0)
 		return err;
 
@@ -6925,7 +6895,7 @@ static int snd_hdspm_probe(struct pci_dev *pci,
 
 	err = snd_hdspm_create(card, hdspm);
 	if (err < 0)
-		goto free_card;
+		return err;
 
 	if (hdspm->io_type != MADIface) {
 		snprintf(card->shortname, sizeof(card->shortname), "%s_%x",
@@ -6944,28 +6914,18 @@ static int snd_hdspm_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto free_card;
+		return err;
 
 	pci_set_drvdata(pci, card);
 
 	dev++;
 	return 0;
-
-free_card:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_hdspm_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver hdspm_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_hdspm_ids,
 	.probe = snd_hdspm_probe,
-	.remove = snd_hdspm_remove,
 };
 
 module_pci_driver(hdspm_driver);
-- 
2.26.2


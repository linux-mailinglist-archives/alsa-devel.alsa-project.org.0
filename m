Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1E3C9A08
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79C9C16A0;
	Thu, 15 Jul 2021 10:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79C9C16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336092;
	bh=dygp7l9dRjraYxuO8M6a3srDZkTC+yzU5SZoKKwqOQM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Th4+yGJ2O442hXYYc9JWuLjXh5EiGnzJG35jfuxzfvO9YgmtxZax4XYk+VP6Wz5Ed
	 2UUK2zYQgajCjNfsXXECwaDobnHk0JW5hdhMm2+2PlebuJRip3ANY6RHyqwdI2csHB
	 uWilMijzebnzZIjC9DmGcP0yFk25RLThdvdOqBX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DEE0F804FD;
	Thu, 15 Jul 2021 10:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D463FF804ED; Thu, 15 Jul 2021 10:00:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05537F80217
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05537F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="nxsvuweT"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="RpVRxyQo"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 744492284F
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kujywtrM7C2dS+YRTuwBHd2FutC2YUFWonnKVXTOTg4=;
 b=nxsvuweTcqVs7d724RumjfVJWEj5/3BA/gU5kM9cCI1bXW6XV+rDbrTDNtORKSm5BQ3IPB
 UVygc22iLz2dKxIYUvMJ4eq8UBbxQEYXQYv8bsDFf2pjgRjIhcpyDuPVFV4CHGIOwodXEz
 M6PCQFRfi3oeVoJo3scAVcXC0h5OLzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kujywtrM7C2dS+YRTuwBHd2FutC2YUFWonnKVXTOTg4=;
 b=RpVRxyQoLnepPiHPfsqGs+Xd6spiV3/+/N/J3b9VVyw6YsgTRntFiUHra8EKsPVVy2ALrW
 kjhxPBV++sjiKeCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 62A14A3B8D;
 Thu, 15 Jul 2021 07:59:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/79] ALSA: hda: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:58:29 +0200
Message-Id: <20210715075941.23332-8-tiwai@suse.de>
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

This patch is an attempt to slightly simplify the resource management
in HD-audio code, by using some device-managed APIs.  Only a few
resources like PCI enablement and PCI resources managed via devres,
but most of the rest code dealing with HD-audio core stuff couldn't be
changed so much, hence the changes in this patch are pretty small in
the end.  A special caveat is needed for the card object: we can't
move the card object release into devres, because the driver is
involved with the component stuff and its unregistiration doesn't work
well from devres release at all.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_controller.h |  1 -
 sound/pci/hda/hda_intel.c      | 26 +++++---------------------
 2 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index 68f9668788ea..e4b290de81de 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -141,7 +141,6 @@ struct azx {
 	unsigned int snoop:1;
 	unsigned int uc_buffer:1; /* non-cached pages for stream buffers */
 	unsigned int align_buffer_size:1;
-	unsigned int region_requested:1;
 	unsigned int disabled:1; /* disabled by vga_switcheroo */
 	unsigned int pm_prepared:1;
 
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 0322b289505e..4d64f2ce30dc 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1367,18 +1367,11 @@ static void azx_free(struct azx *chip)
 
 	if (bus->irq >= 0)
 		free_irq(bus->irq, (void*)chip);
-	if (chip->msi)
-		pci_disable_msi(chip->pci);
-	iounmap(bus->remap_addr);
 
 	azx_free_stream_pages(chip);
 	azx_free_streams(chip);
 	snd_hdac_bus_exit(bus);
 
-	if (chip->region_requested)
-		pci_release_regions(chip->pci);
-
-	pci_disable_device(chip->pci);
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
 	release_firmware(chip->fw);
 #endif
@@ -1767,15 +1760,13 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	*rchip = NULL;
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
 	hda = devm_kzalloc(&pci->dev, sizeof(*hda), GFP_KERNEL);
-	if (!hda) {
-		pci_disable_device(pci);
+	if (!hda)
 		return -ENOMEM;
-	}
 
 	chip = &hda->chip;
 	mutex_init(&chip->open_mutex);
@@ -1811,10 +1802,8 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 		chip->bdl_pos_adj = bdl_pos_adj[dev];
 
 	err = azx_bus_init(chip, model[dev]);
-	if (err < 0) {
-		pci_disable_device(pci);
+	if (err < 0)
 		return err;
-	}
 
 	/* use the non-cached pages in non-snoop mode */
 	if (!azx_snoop(chip))
@@ -1860,17 +1849,12 @@ static int azx_first_init(struct azx *chip)
 	}
 #endif
 
-	err = pci_request_regions(pci, "ICH HD audio");
+	err = pcim_iomap_regions(pci, 1 << 0, "ICH HD audio");
 	if (err < 0)
 		return err;
-	chip->region_requested = 1;
 
 	bus->addr = pci_resource_start(pci, 0);
-	bus->remap_addr = pci_ioremap_bar(pci, 0);
-	if (bus->remap_addr == NULL) {
-		dev_err(card->dev, "ioremap error\n");
-		return -ENXIO;
-	}
+	bus->remap_addr = pcim_iomap_table(pci)[0];
 
 	if (chip->driver_type == AZX_DRIVER_SKL)
 		snd_hdac_bus_parse_capabilities(bus);
-- 
2.26.2


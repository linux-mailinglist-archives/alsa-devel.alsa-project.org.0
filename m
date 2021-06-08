Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1322A39F93E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADD761813;
	Tue,  8 Jun 2021 16:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADD761813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162789;
	bh=bPYDRSFcLrpDMYZUaEaCQ31nK8wxfE3m1YWUW6kDEbc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NGuHbVwTS/Uum7W88ZwpDBuRSo7nD9TveA9f51MofkU6dXpEV1vV6mq/SOch3AIWu
	 D+ewDCZbgGmPzFqY0SMNrubtscAsVIL6e42DW2f8xpsD5tsz7shtXsppfnWvafSgFs
	 NGUoDKsR0adCrz3b+92pzRVTvTjeqkvmkkwyhdaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80891F8079B;
	Tue,  8 Jun 2021 16:07:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F956F8052D; Tue,  8 Jun 2021 16:07:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76EDBF8052D
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76EDBF8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="gEkIdjAv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0TKNk41+"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 79484219E8
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/o06NoUcVG6+yqLEM0YsRzpJmDITHvDPocX6CnHcgVQ=;
 b=gEkIdjAvc4KQzlDJisCjotY5ecOGc7UULDeISGrJMGwwqyxd2XxWP4WUXwoYMP7TsXsf2Y
 QdvV4+/CXC1X2XljePxjd/KibZwqCQUZFZkAlwoRe7NuV83m8EGywlm6ZR8NK4LvYoAOqI
 W5rhM1nfd0GfTa89V/0COV6GeCOUjZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/o06NoUcVG6+yqLEM0YsRzpJmDITHvDPocX6CnHcgVQ=;
 b=0TKNk41+y0LWMmT91j1YKD9/qdquhDmDftXbflIuSfu89SyXef5ckvHYZfZMMAOWl2w3iL
 IqFejcXhuQtbKlDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6719EA3B84;
 Tue,  8 Jun 2021 14:05:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 35/66] ALSA: au88x0: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:09 +0200
Message-Id: <20210608140540.17885-36-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

PCI AU88x0 driver code contains a lot of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes.  A potential real fix is
about the PCI AGP bridge management refcount in addition while spotted
out during conversions.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/au88x0/au88x0.c        | 77 +++++++++++++++++++-------------
 sound/pci/au88x0/au88x0_a3d.c    | 28 +++++++-----
 sound/pci/au88x0/au88x0_core.c   | 47 +++++++++----------
 sound/pci/au88x0/au88x0_eq.c     | 20 +++++----
 sound/pci/au88x0/au88x0_mixer.c  |  3 +-
 sound/pci/au88x0/au88x0_mpu401.c | 14 +++---
 sound/pci/au88x0/au88x0_pcm.c    | 15 ++++---
 7 files changed, 115 insertions(+), 89 deletions(-)

diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index 1b37b7225b1d..1f7fee470266 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -46,8 +46,9 @@ MODULE_DEVICE_TABLE(pci, snd_vortex_ids);
 static void vortex_fix_latency(struct pci_dev *vortex)
 {
 	int rc;
-	if (!(rc = pci_write_config_byte(vortex, 0x40, 0xff))) {
-			dev_info(&vortex->dev, "vortex latency is 0xff\n");
+	rc = pci_write_config_byte(vortex, 0x40, 0xff);
+	if (!rc) {
+		dev_info(&vortex->dev, "vortex latency is 0xff\n");
 	} else {
 		dev_warn(&vortex->dev,
 			 "could not set vortex latency: pci error 0x%x\n", rc);
@@ -65,9 +66,12 @@ static void vortex_fix_agp_bridge(struct pci_dev *via)
 	 * read the config and it is not already set
 	 */
 
-	if (!(rc = pci_read_config_byte(via, 0x42, &value))
-			&& ((value & 0x10)
-				|| !(rc = pci_write_config_byte(via, 0x42, value | 0x10)))) {
+	rc = pci_read_config_byte(via, 0x42, &value);
+	if (!rc) {
+		if (!(value & 0x10))
+			rc = pci_write_config_byte(via, 0x42, value | 0x10);
+	}
+	if (!rc) {
 		dev_info(&via->dev, "bridge config is 0x%x\n", value | 0x10);
 	} else {
 		dev_warn(&via->dev,
@@ -102,14 +106,16 @@ static void snd_vortex_workaround(struct pci_dev *vortex, int fix)
 	} else {
 		if (fix & 0x1)
 			vortex_fix_latency(vortex);
-		if ((fix & 0x2) && (via = pci_get_device(PCI_VENDOR_ID_VIA,
-				PCI_DEVICE_ID_VIA_8365_1, NULL)))
-			vortex_fix_agp_bridge(via);
-		if ((fix & 0x4) && (via = pci_get_device(PCI_VENDOR_ID_VIA,
-				PCI_DEVICE_ID_VIA_82C598_1, NULL)))
-			vortex_fix_agp_bridge(via);
-		if ((fix & 0x8) && (via = pci_get_device(PCI_VENDOR_ID_AMD,
-				PCI_DEVICE_ID_AMD_FE_GATE_7007, NULL)))
+		if (fix & 0x2)
+			via = pci_get_device(PCI_VENDOR_ID_VIA,
+					     PCI_DEVICE_ID_VIA_8365_1, NULL);
+		else if (fix & 0x4)
+			via = pci_get_device(PCI_VENDOR_ID_VIA,
+					     PCI_DEVICE_ID_VIA_82C598_1, NULL);
+		else if (fix & 0x8)
+			via = pci_get_device(PCI_VENDOR_ID_AMD,
+					     PCI_DEVICE_ID_AMD_FE_GATE_7007, NULL);
+		if (via)
 			vortex_fix_agp_bridge(via);
 	}
 	pci_dev_put(via);
@@ -147,7 +153,8 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)
 	*rchip = NULL;
 
 	// check PCI availability (DMA).
-	if ((err = pci_enable_device(pci)) < 0)
+	err = pci_enable_device(pci);
+	if (err < 0)
 		return err;
 	if (dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32))) {
 		dev_err(card->dev, "error to set DMA mask\n");
@@ -174,7 +181,8 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)
 	// (1) PCI resource allocation
 	// Get MMIO area
 	//
-	if ((err = pci_request_regions(pci, CARD_NAME_SHORT)) != 0)
+	err = pci_request_regions(pci, CARD_NAME_SHORT);
+	if (err)
 		goto regions_out;
 
 	chip->mmio = pci_ioremap_bar(pci, 0);
@@ -187,14 +195,15 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)
 	/* Init audio core.
 	 * This must be done before we do request_irq otherwise we can get spurious
 	 * interrupts that we do not handle properly and make a mess of things */
-	if ((err = vortex_core_init(chip)) != 0) {
+	err = vortex_core_init(chip);
+	if (err) {
 		dev_err(card->dev, "hw core init failed\n");
 		goto core_out;
 	}
 
-	if ((err = request_irq(pci->irq, vortex_interrupt,
-			       IRQF_SHARED, KBUILD_MODNAME,
-	                       chip)) != 0) {
+	err = request_irq(pci->irq, vortex_interrupt,
+			  IRQF_SHARED, KBUILD_MODNAME, chip);
+	if (err) {
 		dev_err(card->dev, "cannot grab irq\n");
 		goto irq_out;
 	}
@@ -205,9 +214,9 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)
 	// End of PCI setup.
 
 	// Register alsa root device.
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+	if (err < 0)
 		goto alloc_out;
-	}
 
 	*rchip = chip;
 
@@ -252,7 +261,8 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		return err;
 
 	// (3)
-	if ((err = snd_vortex_create(card, pci, &chip)) < 0) {
+	err = snd_vortex_create(card, pci, &chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -278,12 +288,14 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	}
 #ifndef CHIP_AU8820
 	// ADB SPDIF
-	if ((err = snd_vortex_new_pcm(chip, VORTEX_PCM_SPDIF, 1)) < 0) {
+	err = snd_vortex_new_pcm(chip, VORTEX_PCM_SPDIF, 1);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 	// A3D
-	if ((err = snd_vortex_new_pcm(chip, VORTEX_PCM_A3D, NR_A3D)) < 0) {
+	err = snd_vortex_new_pcm(chip, VORTEX_PCM_A3D, NR_A3D);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -297,12 +309,14 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	 */
 #ifndef CHIP_AU8810
 	// WT pcm.
-	if ((err = snd_vortex_new_pcm(chip, VORTEX_PCM_WT, NR_WT)) < 0) {
+	err = snd_vortex_new_pcm(chip, VORTEX_PCM_WT, NR_WT);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
 #endif
-	if ((err = snd_vortex_midi(chip)) < 0) {
+	err = snd_vortex_midi(chip);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -327,13 +341,13 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 #endif
 
 	// (5)
-	if ((err = pci_read_config_word(pci, PCI_DEVICE_ID,
-				  &(chip->device))) < 0) {
+	err = pci_read_config_word(pci, PCI_DEVICE_ID, &chip->device);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}	
-	if ((err = pci_read_config_word(pci, PCI_VENDOR_ID,
-				  &(chip->vendor))) < 0) {
+	err = pci_read_config_word(pci, PCI_VENDOR_ID, &chip->vendor);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
@@ -352,7 +366,8 @@ snd_vortex_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 #endif
 
 	// (6)
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_card_free(card);
 		return err;
 	}
diff --git a/sound/pci/au88x0/au88x0_a3d.c b/sound/pci/au88x0/au88x0_a3d.c
index 2db183f8826a..eabaee0463fe 100644
--- a/sound/pci/au88x0/au88x0_a3d.c
+++ b/sound/pci/au88x0/au88x0_a3d.c
@@ -849,46 +849,50 @@ static int vortex_a3d_register_controls(vortex_t *vortex)
 	int err, i;
 	/* HRTF controls. */
 	for (i = 0; i < NR_A3D; i++) {
-		if ((kcontrol =
-		     snd_ctl_new1(&vortex_a3d_kcontrol, &vortex->a3d[i])) == NULL)
+		kcontrol = snd_ctl_new1(&vortex_a3d_kcontrol, &vortex->a3d[i]);
+		if (!kcontrol)
 			return -ENOMEM;
 		kcontrol->id.numid = CTRLID_HRTF;
 		kcontrol->info = snd_vortex_a3d_hrtf_info;
 		kcontrol->put = snd_vortex_a3d_hrtf_put;
-		if ((err = snd_ctl_add(vortex->card, kcontrol)) < 0)
+		err = snd_ctl_add(vortex->card, kcontrol);
+		if (err < 0)
 			return err;
 	}
 	/* ITD controls. */
 	for (i = 0; i < NR_A3D; i++) {
-		if ((kcontrol =
-		     snd_ctl_new1(&vortex_a3d_kcontrol, &vortex->a3d[i])) == NULL)
+		kcontrol = snd_ctl_new1(&vortex_a3d_kcontrol, &vortex->a3d[i]);
+		if (!kcontrol)
 			return -ENOMEM;
 		kcontrol->id.numid = CTRLID_ITD;
 		kcontrol->info = snd_vortex_a3d_itd_info;
 		kcontrol->put = snd_vortex_a3d_itd_put;
-		if ((err = snd_ctl_add(vortex->card, kcontrol)) < 0)
+		err = snd_ctl_add(vortex->card, kcontrol);
+		if (err < 0)
 			return err;
 	}
 	/* ILD (gains) controls. */
 	for (i = 0; i < NR_A3D; i++) {
-		if ((kcontrol =
-		     snd_ctl_new1(&vortex_a3d_kcontrol, &vortex->a3d[i])) == NULL)
+		kcontrol = snd_ctl_new1(&vortex_a3d_kcontrol, &vortex->a3d[i]);
+		if (!kcontrol)
 			return -ENOMEM;
 		kcontrol->id.numid = CTRLID_GAINS;
 		kcontrol->info = snd_vortex_a3d_ild_info;
 		kcontrol->put = snd_vortex_a3d_ild_put;
-		if ((err = snd_ctl_add(vortex->card, kcontrol)) < 0)
+		err = snd_ctl_add(vortex->card, kcontrol);
+		if (err < 0)
 			return err;
 	}
 	/* Filter controls. */
 	for (i = 0; i < NR_A3D; i++) {
-		if ((kcontrol =
-		     snd_ctl_new1(&vortex_a3d_kcontrol, &vortex->a3d[i])) == NULL)
+		kcontrol = snd_ctl_new1(&vortex_a3d_kcontrol, &vortex->a3d[i]);
+		if (!kcontrol)
 			return -ENOMEM;
 		kcontrol->id.numid = CTRLID_FILTER;
 		kcontrol->info = snd_vortex_a3d_filter_info;
 		kcontrol->put = snd_vortex_a3d_filter_put;
-		if ((err = snd_ctl_add(vortex->card, kcontrol)) < 0)
+		err = snd_ctl_add(vortex->card, kcontrol);
+		if (err < 0)
 			return err;
 	}
 	return 0;
diff --git a/sound/pci/au88x0/au88x0_core.c b/sound/pci/au88x0/au88x0_core.c
index 5180f1bd1326..2ed5100b8cae 100644
--- a/sound/pci/au88x0/au88x0_core.c
+++ b/sound/pci/au88x0/au88x0_core.c
@@ -2120,9 +2120,9 @@ vortex_adb_allocroute(vortex_t *vortex, int dma, int nr_ch, int dir,
 				      VORTEX_RESOURCE_DMA);
 	} else {
 		en = 1;
-		if ((dma =
-		     vortex_adb_checkinout(vortex, NULL, en,
-					   VORTEX_RESOURCE_DMA)) < 0)
+		dma = vortex_adb_checkinout(vortex, NULL, en,
+					    VORTEX_RESOURCE_DMA);
+		if (dma < 0)
 			return -EBUSY;
 	}
 
@@ -2140,18 +2140,20 @@ vortex_adb_allocroute(vortex_t *vortex, int dma, int nr_ch, int dir,
 		/* Get SRC and MIXER hardware resources. */
 		if (stream->type != VORTEX_PCM_SPDIF) {
 			for (i = 0; i < nr_ch; i++) {
-				if ((src[i] = vortex_adb_checkinout(vortex,
-							   stream->resources, en,
-							   VORTEX_RESOURCE_SRC)) < 0) {
+				src[i] = vortex_adb_checkinout(vortex,
+							       stream->resources, en,
+							       VORTEX_RESOURCE_SRC);
+				if (src[i] < 0) {
 					memset(stream->resources, 0,
 					       sizeof(stream->resources));
 					return -EBUSY;
 				}
 				if (stream->type != VORTEX_PCM_A3D) {
-					if ((mix[i] = vortex_adb_checkinout(vortex,
-								   stream->resources,
-								   en,
-								   VORTEX_RESOURCE_MIXIN)) < 0) {
+					mix[i] = vortex_adb_checkinout(vortex,
+								       stream->resources,
+								       en,
+								       VORTEX_RESOURCE_MIXIN);
+					if (mix[i] < 0) {
 						memset(stream->resources,
 						       0,
 						       sizeof(stream->resources));
@@ -2162,10 +2164,10 @@ vortex_adb_allocroute(vortex_t *vortex, int dma, int nr_ch, int dir,
 		}
 #ifndef CHIP_AU8820
 		if (stream->type == VORTEX_PCM_A3D) {
-			if ((a3d =
-			     vortex_adb_checkinout(vortex,
-						   stream->resources, en,
-						   VORTEX_RESOURCE_A3D)) < 0) {
+			a3d = vortex_adb_checkinout(vortex,
+						    stream->resources, en,
+						    VORTEX_RESOURCE_A3D);
+			if (a3d < 0) {
 				memset(stream->resources, 0,
 				       sizeof(stream->resources));
 				dev_err(vortex->card->dev,
@@ -2278,19 +2280,18 @@ vortex_adb_allocroute(vortex_t *vortex, int dma, int nr_ch, int dir,
 
 		/* Get SRC and MIXER hardware resources. */
 		for (i = 0; i < nr_ch; i++) {
-			if ((mix[i] =
-			     vortex_adb_checkinout(vortex,
-						   stream->resources, en,
-						   VORTEX_RESOURCE_MIXOUT))
-			    < 0) {
+			mix[i] = vortex_adb_checkinout(vortex,
+						       stream->resources, en,
+						       VORTEX_RESOURCE_MIXOUT);
+			if (mix[i] < 0) {
 				memset(stream->resources, 0,
 				       sizeof(stream->resources));
 				return -EBUSY;
 			}
-			if ((src[i] =
-			     vortex_adb_checkinout(vortex,
-						   stream->resources, en,
-						   VORTEX_RESOURCE_SRC)) < 0) {
+			src[i] = vortex_adb_checkinout(vortex,
+						       stream->resources, en,
+						       VORTEX_RESOURCE_SRC);
+			if (src[i] < 0) {
 				memset(stream->resources, 0,
 				       sizeof(stream->resources));
 				return -EBUSY;
diff --git a/sound/pci/au88x0/au88x0_eq.c b/sound/pci/au88x0/au88x0_eq.c
index 58e92f2a72c0..71c13100d7ef 100644
--- a/sound/pci/au88x0/au88x0_eq.c
+++ b/sound/pci/au88x0/au88x0_eq.c
@@ -873,29 +873,33 @@ static int vortex_eq_init(vortex_t *vortex)
 
 	vortex_Eqlzr_init(vortex);
 
-	if ((kcontrol =
-	     snd_ctl_new1(&vortex_eqtoggle_kcontrol, vortex)) == NULL)
+	kcontrol = snd_ctl_new1(&vortex_eqtoggle_kcontrol, vortex);
+	if (!kcontrol)
 		return -ENOMEM;
 	kcontrol->private_value = 0;
-	if ((err = snd_ctl_add(vortex->card, kcontrol)) < 0)
+	err = snd_ctl_add(vortex->card, kcontrol);
+	if (err < 0)
 		return err;
 
 	/* EQ gain controls */
 	for (i = 0; i < 10; i++) {
-		if ((kcontrol =
-		     snd_ctl_new1(&vortex_eq_kcontrol, vortex)) == NULL)
+		kcontrol = snd_ctl_new1(&vortex_eq_kcontrol, vortex);
+		if (!kcontrol)
 			return -ENOMEM;
 		snprintf(kcontrol->id.name, sizeof(kcontrol->id.name),
 			"%s Playback Volume", EqBandLabels[i]);
 		kcontrol->private_value = i;
-		if ((err = snd_ctl_add(vortex->card, kcontrol)) < 0)
+		err = snd_ctl_add(vortex->card, kcontrol);
+		if (err < 0)
 			return err;
 		//vortex->eqctrl[i] = kcontrol;
 	}
 	/* EQ band levels */
-	if ((kcontrol = snd_ctl_new1(&vortex_levels_kcontrol, vortex)) == NULL)
+	kcontrol = snd_ctl_new1(&vortex_levels_kcontrol, vortex);
+	if (!kcontrol)
 		return -ENOMEM;
-	if ((err = snd_ctl_add(vortex->card, kcontrol)) < 0)
+	err = snd_ctl_add(vortex->card, kcontrol);
+	if (err < 0)
 		return err;
 
 	return 0;
diff --git a/sound/pci/au88x0/au88x0_mixer.c b/sound/pci/au88x0/au88x0_mixer.c
index 5b647682b683..aeba684b8d18 100644
--- a/sound/pci/au88x0/au88x0_mixer.c
+++ b/sound/pci/au88x0/au88x0_mixer.c
@@ -30,7 +30,8 @@ static int snd_vortex_mixer(vortex_t *vortex)
 		.read = vortex_codec_read,
 	};
 
-	if ((err = snd_ac97_bus(vortex->card, 0, &ops, NULL, &pbus)) < 0)
+	err = snd_ac97_bus(vortex->card, 0, &ops, NULL, &pbus);
+	if (err < 0)
 		return err;
 	memset(&ac97, 0, sizeof(ac97));
 	// Initialize AC97 codec stuff.
diff --git a/sound/pci/au88x0/au88x0_mpu401.c b/sound/pci/au88x0/au88x0_mpu401.c
index 603494e7d30e..164f6b7039ab 100644
--- a/sound/pci/au88x0/au88x0_mpu401.c
+++ b/sound/pci/au88x0/au88x0_mpu401.c
@@ -68,9 +68,9 @@ static int snd_vortex_midi(vortex_t *vortex)
 
 	/* Create MPU401 instance. */
 #ifdef VORTEX_MPU401_LEGACY
-	if ((temp =
-	     snd_mpu401_uart_new(vortex->card, 0, MPU401_HW_MPU401, 0x330,
-				 MPU401_INFO_IRQ_HOOK, -1, &rmidi)) != 0) {
+	temp = snd_mpu401_uart_new(vortex->card, 0, MPU401_HW_MPU401, 0x330,
+				   MPU401_INFO_IRQ_HOOK, -1, &rmidi);
+	if (temp) {
 		hwwrite(vortex->mmio, VORTEX_CTRL,
 			(hwread(vortex->mmio, VORTEX_CTRL) &
 			 ~CTRL_MIDI_PORT) & ~CTRL_MIDI_EN);
@@ -78,10 +78,10 @@ static int snd_vortex_midi(vortex_t *vortex)
 	}
 #else
 	port = (unsigned long)(vortex->mmio + VORTEX_MIDI_DATA);
-	if ((temp =
-	     snd_mpu401_uart_new(vortex->card, 0, MPU401_HW_AUREAL, port,
-				 MPU401_INFO_INTEGRATED | MPU401_INFO_MMIO |
-				 MPU401_INFO_IRQ_HOOK, -1, &rmidi)) != 0) {
+	temp = snd_mpu401_uart_new(vortex->card, 0, MPU401_HW_AUREAL, port,
+				   MPU401_INFO_INTEGRATED | MPU401_INFO_MMIO |
+				   MPU401_INFO_IRQ_HOOK, -1, &rmidi);
+	if (temp) {
 		hwwrite(vortex->mmio, VORTEX_CTRL,
 			(hwread(vortex->mmio, VORTEX_CTRL) &
 			 ~CTRL_MIDI_PORT) & ~CTRL_MIDI_EN);
diff --git a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
index d019aa566de3..546f71220604 100644
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -130,14 +130,14 @@ static int snd_vortex_pcm_open(struct snd_pcm_substream *substream)
 	int err;
 	
 	/* Force equal size periods */
-	if ((err =
-	     snd_pcm_hw_constraint_integer(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIODS)) < 0)
+	err = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (err < 0)
 		return err;
 	/* Avoid PAGE_SIZE boundary to fall inside of a period. */
-	if ((err =
-	     snd_pcm_hw_constraint_pow2(runtime, 0,
-					SNDRV_PCM_HW_PARAM_PERIOD_BYTES)) < 0)
+	err = snd_pcm_hw_constraint_pow2(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES);
+	if (err < 0)
 		return err;
 
 	snd_pcm_hw_constraint_step(runtime, 0,
@@ -658,7 +658,8 @@ static int snd_vortex_new_pcm(vortex_t *chip, int idx, int nr)
 			kctl = snd_ctl_new1(&snd_vortex_mixer_spdif[i], chip);
 			if (!kctl)
 				return -ENOMEM;
-			if ((err = snd_ctl_add(chip->card, kctl)) < 0)
+			err = snd_ctl_add(chip->card, kctl);
+			if (err < 0)
 				return err;
 		}
 	}
-- 
2.26.2


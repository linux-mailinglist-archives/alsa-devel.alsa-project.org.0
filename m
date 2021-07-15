Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE033C9A5C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:17:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83E5C1735;
	Thu, 15 Jul 2021 10:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83E5C1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337044;
	bh=x2y5nsZB57txz1whjjVzk5rAKRhvdk+GAi44U3tWxBU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XXxC850VdaMSSSWvNt2uKfoEVknzF5xuudlKxgeDrSmqH8BTvNH3P0j/xtCg8w6Po
	 nhhYUvrs73PokjyI6t+SGJQk0CpZRPY+WTX4RgwljUGcKaAZu+kAgm/6fzSp1/dbFy
	 Omw029oALBh4el6E4eeDRo5nEu58geVsM1TpPM0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55493F806E9;
	Thu, 15 Jul 2021 10:01:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3350F80678; Thu, 15 Jul 2021 10:01:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3942DF80524
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3942DF80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="rrnPV1W8"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="1ge7t/qn"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 093A31FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZylPcUdm825DBGsYo9uClnk9V1jD3btPbVGNcPlaL1w=;
 b=rrnPV1W8zZxn81GQ8kc3BHMM+ZzXmeEkFsJJfmxh0OIAdrs4TPy5OZDh8mKooiUJdE5FLd
 3VxMza9410PkuIi8QxyJNbP2VUR0F3v4aQsknNr4ffYRoq7ZRmrADm/WpYl3V8JvU5Oj96
 PT0gaMEw9l0VG4QSHbxlVipC5smQa9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZylPcUdm825DBGsYo9uClnk9V1jD3btPbVGNcPlaL1w=;
 b=1ge7t/qndyWXpbPM7GTJHPvohvdtrLJB4jbP5cDbBV8BpW2rYo51AtlbsO9RdkpfTtgsRv
 lbEzxCU7Brv8hGCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id EB731A3BBC;
 Thu, 15 Jul 2021 08:00:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 42/79] ALSA: nm256: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:04 +0200
Message-Id: <20210715075941.23332-43-tiwai@suse.de>
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

This patch converts the resource management in PCI nm256 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/nm256/nm256.c | 130 ++++++++++------------------------------
 1 file changed, 30 insertions(+), 100 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 12d02d7d3b51..a54b9b26a0c2 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -193,11 +193,9 @@ struct nm256 {
 	struct snd_card *card;
 
 	void __iomem *cport;		/* control port */
-	struct resource *res_cport;	/* its resource */
 	unsigned long cport_addr;	/* physical address */
 
 	void __iomem *buffer;		/* buffer */
-	struct resource *res_buffer;	/* its resource */
 	unsigned long buffer_addr;	/* buffer phyiscal address */
 
 	u32 buffer_start;		/* start offset from pci resource 0 */
@@ -1313,8 +1311,9 @@ snd_nm256_mixer(struct nm256 *chip)
 		.read = snd_nm256_ac97_read,
 	};
 
-	chip->ac97_regs = kcalloc(ARRAY_SIZE(nm256_ac97_init_val),
-				  sizeof(short), GFP_KERNEL);
+	chip->ac97_regs = devm_kcalloc(chip->card->dev,
+				       ARRAY_SIZE(nm256_ac97_init_val),
+				       sizeof(short), GFP_KERNEL);
 	if (! chip->ac97_regs)
 		return -ENOMEM;
 
@@ -1437,56 +1436,27 @@ static SIMPLE_DEV_PM_OPS(nm256_pm, nm256_suspend, nm256_resume);
 #define NM256_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP */
 
-static int snd_nm256_free(struct nm256 *chip)
+static void snd_nm256_free(struct snd_card *card)
 {
+	struct nm256 *chip = card->private_data;
+
 	if (chip->streams[SNDRV_PCM_STREAM_PLAYBACK].running)
 		snd_nm256_playback_stop(chip);
 	if (chip->streams[SNDRV_PCM_STREAM_CAPTURE].running)
 		snd_nm256_capture_stop(chip);
-
-	if (chip->irq >= 0)
-		free_irq(chip->irq, chip);
-
-	iounmap(chip->cport);
-	iounmap(chip->buffer);
-	release_and_free_resource(chip->res_cport);
-	release_and_free_resource(chip->res_buffer);
-
-	pci_disable_device(chip->pci);
-	kfree(chip->ac97_regs);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_nm256_dev_free(struct snd_device *device)
-{
-	struct nm256 *chip = device->device_data;
-	return snd_nm256_free(chip);
 }
 
 static int
-snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
-		 struct nm256 **chip_ret)
+snd_nm256_create(struct snd_card *card, struct pci_dev *pci)
 {
-	struct nm256 *chip;
+	struct nm256 *chip = card->private_data;
 	int err, pval;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_nm256_dev_free,
-	};
 	u32 addr;
 
-	*chip_ret = NULL;
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
-
 	chip->card = card;
 	chip->pci = pci;
 	chip->use_cache = use_cache;
@@ -1508,22 +1478,16 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 	chip->buffer_addr = pci_resource_start(pci, 0);
 	chip->cport_addr = pci_resource_start(pci, 1);
 
+	if (pci_request_regions(pci, card->driver))
+		return err;
+
 	/* Init the memory port info.  */
 	/* remap control port (#2) */
-	chip->res_cport = request_mem_region(chip->cport_addr, NM_PORT2_SIZE,
-					     card->driver);
-	if (chip->res_cport == NULL) {
-		dev_err(card->dev, "memory region 0x%lx (size 0x%x) busy\n",
-			   chip->cport_addr, NM_PORT2_SIZE);
-		err = -EBUSY;
-		goto __error;
-	}
-	chip->cport = ioremap(chip->cport_addr, NM_PORT2_SIZE);
-	if (chip->cport == NULL) {
+	chip->cport = devm_ioremap(&pci->dev, chip->cport_addr, NM_PORT2_SIZE);
+	if (!chip->cport) {
 		dev_err(card->dev, "unable to map control port %lx\n",
 			chip->cport_addr);
-		err = -ENOMEM;
-		goto __error;
+		return -ENOMEM;
 	}
 
 	if (!strcmp(card->driver, "NM256AV")) {
@@ -1539,8 +1503,7 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 					" force_ac97=1\n");
 				dev_err(card->dev,
 					"or try sb16, opl3sa2, or cs423x drivers instead.\n");
-				err = -ENXIO;
-				goto __error;
+				return -ENXIO;
 			}
 		}
 		chip->buffer_end = 2560 * 1024;
@@ -1572,7 +1535,7 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 		/* get buffer end pointer from signature */
 		err = snd_nm256_peek_for_sig(chip);
 		if (err < 0)
-			goto __error;
+			return err;
 	}
 
 	chip->buffer_start = chip->buffer_end - chip->buffer_size;
@@ -1581,21 +1544,12 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 	dev_info(card->dev, "Mapping port 1 from 0x%x - 0x%x\n",
 	       chip->buffer_start, chip->buffer_end);
 
-	chip->res_buffer = request_mem_region(chip->buffer_addr,
-					      chip->buffer_size,
-					      card->driver);
-	if (chip->res_buffer == NULL) {
-		dev_err(card->dev, "buffer 0x%lx (size 0x%x) busy\n",
-			   chip->buffer_addr, chip->buffer_size);
-		err = -EBUSY;
-		goto __error;
-	}
-	chip->buffer = ioremap(chip->buffer_addr, chip->buffer_size);
-	if (chip->buffer == NULL) {
-		err = -ENOMEM;
+	chip->buffer = devm_ioremap(&pci->dev, chip->buffer_addr,
+				    chip->buffer_size);
+	if (!chip->buffer) {
 		dev_err(card->dev, "unable to map ring buffer at %lx\n",
 			chip->buffer_addr);
-		goto __error;
+		return -ENOMEM;
 	}
 
 	/* set offsets */
@@ -1618,19 +1572,10 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 	chip->coeffs_current = 0;
 
 	snd_nm256_init_chip(chip);
+	card->private_free = snd_nm256_free;
 
 	// pci_set_master(pci); /* needed? */
-	
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0)
-		goto __error;
-
-	*chip_ret = chip;
 	return 0;
-
-__error:
-	snd_nm256_free(chip);
-	return err;
 }
 
 
@@ -1673,9 +1618,11 @@ static int snd_nm256_probe(struct pci_dev *pci,
 		}
 	}
 
-	err = snd_card_new(&pci->dev, index, id, THIS_MODULE, 0, &card);
+	err = snd_devm_card_new(&pci->dev, index, id, THIS_MODULE,
+				sizeof(*chip), &card);
 	if (err < 0)
 		return err;
+	chip = card->private_data;
 
 	switch (pci->device) {
 	case PCI_DEVICE_ID_NEOMAGIC_NM256AV_AUDIO:
@@ -1689,7 +1636,6 @@ static int snd_nm256_probe(struct pci_dev *pci,
 		break;
 	default:
 		dev_err(&pci->dev, "invalid device id 0x%x\n", pci->device);
-		snd_card_free(card);
 		return -EINVAL;
 	}
 
@@ -1704,12 +1650,9 @@ static int snd_nm256_probe(struct pci_dev *pci,
 		capture_bufsize = 4;
 	if (capture_bufsize > 128)
 		capture_bufsize = 128;
-	err = snd_nm256_create(card, pci, &chip);
-	if (err < 0) {
-		snd_card_free(card);
+	err = snd_nm256_create(card, pci);
+	if (err < 0)
 		return err;
-	}
-	card->private_data = chip;
 
 	if (reset_workaround) {
 		dev_dbg(&pci->dev, "reset_workaround activated\n");
@@ -1722,15 +1665,11 @@ static int snd_nm256_probe(struct pci_dev *pci,
 	}
 
 	err = snd_nm256_pcm(chip, 0);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_nm256_mixer(chip);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	sprintf(card->shortname, "NeoMagic %s", card->driver);
 	sprintf(card->longname, "%s at 0x%lx & 0x%lx, irq %d",
@@ -1738,26 +1677,17 @@ static int snd_nm256_probe(struct pci_dev *pci,
 		chip->buffer_addr, chip->cport_addr, chip->irq);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	pci_set_drvdata(pci, card);
 	return 0;
 }
 
-static void snd_nm256_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
-
 static struct pci_driver nm256_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_nm256_ids,
 	.probe = snd_nm256_probe,
-	.remove = snd_nm256_remove,
 	.driver = {
 		.pm = NM256_PM_OPS,
 	},
-- 
2.26.2


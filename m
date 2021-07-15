Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5393C9A9B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98CA91783;
	Thu, 15 Jul 2021 10:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98CA91783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337655;
	bh=i+tPLyRyXQqhEEW97p4tOJFZ7s2B2+3s3jZGcabMA3k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HugayOE3CbkaArTFUddL2AG5ydp0d/nIJJi4hRHVRIpgR0Fo2WiQRfMq3okZ6u29O
	 rLus+vcUBOzSLvSEKC0JowrdlyhTkmP/rUD/ccB6PixZFE2h+x8aMi3fisIG+438US
	 DWzDWEMHpjzygbf8p8qJzoEHv5QkWN7oOjYloDJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42125F804E3;
	Thu, 15 Jul 2021 10:01:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBB88F8079B; Thu, 15 Jul 2021 10:01:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89F48F805AB
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89F48F805AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="HlcZhAsY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="rkOwLW3b"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 626162284F
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6vFinjlhLc0ENWa69KTssHtx3Sut+fM1cEirG3hAvI=;
 b=HlcZhAsYNBlChiZHYwP+M4eXupQDVF2kynWV1/K9DrRWHIKAOdWZFmWIh7VuC9l1M7XEa+
 U8vGryGMt8VC1gnk/DS2GSyCaGTYcGgXYPP/YNsjHLQ6v7NKq1yJfPTvKSAy7p4NRsh3t9
 eLc5jOjZZgk40KqJn1+s5eIVmYYBz/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6vFinjlhLc0ENWa69KTssHtx3Sut+fM1cEirG3hAvI=;
 b=rkOwLW3b47vYoznK2jRUMmt3CxRsEzM6/q4mfRpBnyoa57vfB9XOze7zEGkaOzMfJaenF2
 Onw7NHqWj0OXx7BA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 5A9D5A3B9B;
 Thu, 15 Jul 2021 08:00:22 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 69/79] ALSA: sc6000: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:31 +0200
Message-Id: <20210715075941.23332-70-tiwai@suse.de>
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

This patch converts the resource management in ISA als100 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The cleanup code was moved from
the remove callback to card->private_free, and then the remove
callback became superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sc6000.c | 73 +++++++++++++++++-----------------------------
 1 file changed, 26 insertions(+), 47 deletions(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index 3462663050bb..6236c4fa766a 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -529,6 +529,14 @@ static int snd_sc6000_match(struct device *devptr, unsigned int dev)
 	return 1;
 }
 
+static void snd_sc6000_free(struct snd_card *card)
+{
+	char __iomem **vport = card->private_data;
+
+	if (*vport)
+		sc6000_setup_board(*vport, 0);
+}
+
 static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 {
 	static const int possible_irqs[] = { 5, 7, 9, 10, 11, -1 };
@@ -543,8 +551,8 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 	char __iomem *vmss_port;
 
 
-	err = snd_card_new(devptr, index[dev], id[dev], THIS_MODULE,
-			   sizeof(vport), &card);
+	err = snd_devm_card_new(devptr, index[dev], id[dev], THIS_MODULE,
+				sizeof(vport), &card);
 	if (err < 0)
 		return err;
 
@@ -553,8 +561,7 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 		xirq = snd_legacy_find_free_irq(possible_irqs);
 		if (xirq < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free IRQ\n");
-			err = -EBUSY;
-			goto err_exit;
+			return -EBUSY;
 		}
 	}
 
@@ -562,38 +569,33 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 		xdma = snd_legacy_find_free_dma(possible_dmas);
 		if (xdma < 0) {
 			snd_printk(KERN_ERR PFX "unable to find a free DMA\n");
-			err = -EBUSY;
-			goto err_exit;
+			return -EBUSY;
 		}
 	}
 
-	if (!request_region(port[dev], 0x10, DRV_NAME)) {
+	if (!devm_request_region(devptr, port[dev], 0x10, DRV_NAME)) {
 		snd_printk(KERN_ERR PFX
 			   "I/O port region is already in use.\n");
-		err = -EBUSY;
-		goto err_exit;
+		return -EBUSY;
 	}
 	*vport = devm_ioport_map(devptr, port[dev], 0x10);
 	if (*vport == NULL) {
 		snd_printk(KERN_ERR PFX
 			   "I/O port cannot be iomapped.\n");
-		err = -EBUSY;
-		goto err_unmap1;
+		return -EBUSY;
 	}
 
 	/* to make it marked as used */
-	if (!request_region(mss_port[dev], 4, DRV_NAME)) {
+	if (!devm_request_region(devptr, mss_port[dev], 4, DRV_NAME)) {
 		snd_printk(KERN_ERR PFX
 			   "SC-6000 port I/O port region is already in use.\n");
-		err = -EBUSY;
-		goto err_unmap1;
+		return -EBUSY;
 	}
 	vmss_port = devm_ioport_map(devptr, mss_port[dev], 4);
 	if (!vmss_port) {
 		snd_printk(KERN_ERR PFX
 			   "MSS port I/O cannot be iomapped.\n");
-		err = -EBUSY;
-		goto err_unmap2;
+		return -EBUSY;
 	}
 
 	snd_printd("Initializing BASE[0x%lx] IRQ[%d] DMA[%d] MIRQ[%d]\n",
@@ -602,28 +604,29 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 
 	err = sc6000_init_board(*vport, vmss_port, dev);
 	if (err < 0)
-		goto err_unmap2;
+		return err;
+	card->private_free = snd_sc6000_free;
 
 	err = snd_wss_create(card, mss_port[dev] + 4,  -1, xirq, xdma, -1,
 			     WSS_HW_DETECT, 0, &chip);
 	if (err < 0)
-		goto err_unmap2;
+		return err;
 
 	err = snd_wss_pcm(chip, 0);
 	if (err < 0) {
 		snd_printk(KERN_ERR PFX
 			   "error creating new WSS PCM device\n");
-		goto err_unmap2;
+		return err;
 	}
 	err = snd_wss_mixer(chip);
 	if (err < 0) {
 		snd_printk(KERN_ERR PFX "error creating new WSS mixer\n");
-		goto err_unmap2;
+		return err;
 	}
 	err = snd_sc6000_mixer(chip);
 	if (err < 0) {
 		snd_printk(KERN_ERR PFX "the mixer rewrite failed\n");
-		goto err_unmap2;
+		return err;
 	}
 	if (snd_opl3_create(card,
 			    0x388, 0x388 + 2,
@@ -633,7 +636,7 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 	} else {
 		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 		if (err < 0)
-			goto err_unmap2;
+			return err;
 	}
 
 	if (mpu_port[dev] != SNDRV_AUTO_PORT) {
@@ -654,39 +657,15 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto err_unmap2;
+		return err;
 
 	dev_set_drvdata(devptr, card);
 	return 0;
-
-err_unmap2:
-	sc6000_setup_board(*vport, 0);
-	release_region(mss_port[dev], 4);
-err_unmap1:
-	release_region(port[dev], 0x10);
-err_exit:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_sc6000_remove(struct device *devptr, unsigned int dev)
-{
-	struct snd_card *card = dev_get_drvdata(devptr);
-	char __iomem **vport = card->private_data;
-
-	if (sc6000_setup_board(*vport, 0) < 0)
-		snd_printk(KERN_WARNING "sc6000_setup_board failed on exit!\n");
-
-	release_region(port[dev], 0x10);
-	release_region(mss_port[dev], 4);
-
-	snd_card_free(card);
 }
 
 static struct isa_driver snd_sc6000_driver = {
 	.match		= snd_sc6000_match,
 	.probe		= snd_sc6000_probe,
-	.remove		= snd_sc6000_remove,
 	/* FIXME: suspend/resume */
 	.driver		= {
 		.name	= DRV_NAME,
-- 
2.26.2


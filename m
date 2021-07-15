Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6D3C9A8A
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 455661749;
	Thu, 15 Jul 2021 10:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 455661749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337572;
	bh=kbHwg5p4mLJ9Pp8tKgwQxK/5QJkBglXMEUR9R8/Ea18=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NW9nxUGaczhOS0Gn27PjGoOhYFSnqYy8ptY0/xOs37rvjGeR4p5y/u9RsewHPMHzg
	 4cf+J2LN2Rk2GnkQ4WP87Jyt6wZVEJdiUjHzLbho3Aej24g968eFIQX8MpluhFuA7I
	 vbenQzbCakvgC0oLAOathXjHLb3lDYfcwhf8iKNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7911AF807D1;
	Thu, 15 Jul 2021 10:01:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A807F80769; Thu, 15 Jul 2021 10:01:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AE7BF8057B
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE7BF8057B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="wb7uD/3s"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="YcFKAjBI"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D6AC71FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LxBIoNBSEcRqYu6DUDCLvkd6JkSstXgf3gRqyu2/Tc=;
 b=wb7uD/3sueB3mnUMWv8BDkDBHtOFH0hwOqI6cshSLUkj9riWchZKvLxL1Fag5rUL3yxTrb
 hEOJPWPtz+iC9/rJ2CsOYsK5/PQDZkd/LCM/EUqTkIaZAHacrIciavDaUWaIa3kBd9dtAU
 TOP3QAu8HQIqsgOcrlga1ndhXzIX/a0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LxBIoNBSEcRqYu6DUDCLvkd6JkSstXgf3gRqyu2/Tc=;
 b=YcFKAjBIhARDkL4sVyExjHAPFHm+Pzi+G1ayl5BLfo0zOv2JEYyl34v9bN6IyX/Rok5ZRs
 MaKCA1GN951i+qDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id CE3E8A3B8F;
 Thu, 15 Jul 2021 08:00:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 66/79] ALSA: msnd: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:28 +0200
Message-Id: <20210715075941.23332-67-tiwai@suse.de>
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

This patch converts the resource management in ISA msnd drivers with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/msnd/msnd_pinnacle.c | 119 ++++++++-------------------------
 1 file changed, 28 insertions(+), 91 deletions(-)

diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle.c
index 69647b41300d..4433a92f08e7 100644
--- a/sound/isa/msnd/msnd_pinnacle.c
+++ b/sound/isa/msnd/msnd_pinnacle.c
@@ -472,11 +472,6 @@ static int snd_msnd_dsp_full_reset(struct snd_card *card)
 	return rv;
 }
 
-static int snd_msnd_dev_free(struct snd_device *device)
-{
-	snd_printdd("snd_msnd_chip_free()\n");
-	return 0;
-}
 
 static int snd_msnd_send_dsp_cmd_chk(struct snd_msnd *chip, u8 cmd)
 {
@@ -528,58 +523,47 @@ static int snd_msnd_attach(struct snd_card *card)
 {
 	struct snd_msnd *chip = card->private_data;
 	int err;
-	static const struct snd_device_ops ops = {
-		.dev_free =      snd_msnd_dev_free,
-		};
 
-	err = request_irq(chip->irq, snd_msnd_interrupt, 0, card->shortname,
-			  chip);
+	err = devm_request_irq(card->dev, chip->irq, snd_msnd_interrupt, 0,
+			       card->shortname, chip);
 	if (err < 0) {
 		printk(KERN_ERR LOGNAME ": Couldn't grab IRQ %d\n", chip->irq);
 		return err;
 	}
 	card->sync_irq = chip->irq;
-	if (request_region(chip->io, DSP_NUMIO, card->shortname) == NULL) {
-		free_irq(chip->irq, chip);
+	if (!devm_request_region(card->dev, chip->io, DSP_NUMIO,
+				 card->shortname))
 		return -EBUSY;
-	}
 
-	if (!request_mem_region(chip->base, BUFFSIZE, card->shortname)) {
+	if (!devm_request_mem_region(card->dev, chip->base, BUFFSIZE,
+				     card->shortname)) {
 		printk(KERN_ERR LOGNAME
 			": unable to grab memory region 0x%lx-0x%lx\n",
 			chip->base, chip->base + BUFFSIZE - 1);
-		release_region(chip->io, DSP_NUMIO);
-		free_irq(chip->irq, chip);
 		return -EBUSY;
 	}
-	chip->mappedbase = ioremap(chip->base, 0x8000);
+	chip->mappedbase = devm_ioremap(card->dev, chip->base, 0x8000);
 	if (!chip->mappedbase) {
 		printk(KERN_ERR LOGNAME
 			": unable to map memory region 0x%lx-0x%lx\n",
 			chip->base, chip->base + BUFFSIZE - 1);
-		err = -EIO;
-		goto err_release_region;
+		return -EIO;
 	}
 
 	err = snd_msnd_dsp_full_reset(card);
 	if (err < 0)
-		goto err_release_region;
-
-	/* Register device */
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0)
-		goto err_release_region;
+		return err;
 
 	err = snd_msnd_pcm(card, 0);
 	if (err < 0) {
 		printk(KERN_ERR LOGNAME ": error creating new PCM device\n");
-		goto err_release_region;
+		return err;
 	}
 
 	err = snd_msndmix_new(card);
 	if (err < 0) {
 		printk(KERN_ERR LOGNAME ": error creating new Mixer device\n");
-		goto err_release_region;
+		return err;
 	}
 
 
@@ -595,7 +579,7 @@ static int snd_msnd_attach(struct snd_card *card)
 		if (err < 0) {
 			printk(KERN_ERR LOGNAME
 				": error creating new Midi device\n");
-			goto err_release_region;
+			return err;
 		}
 		mpu = chip->rmidi->private_data;
 
@@ -610,30 +594,12 @@ static int snd_msnd_attach(struct snd_card *card)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto err_release_region;
+		return err;
 
 	return 0;
-
-err_release_region:
-	iounmap(chip->mappedbase);
-	release_mem_region(chip->base, BUFFSIZE);
-	release_region(chip->io, DSP_NUMIO);
-	free_irq(chip->irq, chip);
-	return err;
 }
 
 
-static void snd_msnd_unload(struct snd_card *card)
-{
-	struct snd_msnd *chip = card->private_data;
-
-	iounmap(chip->mappedbase);
-	release_mem_region(chip->base, BUFFSIZE);
-	release_region(chip->io, DSP_NUMIO);
-	free_irq(chip->irq, chip);
-	snd_card_free(card);
-}
-
 #ifndef MSND_CLASSIC
 
 /* Pinnacle/Fiji Logical Device Configuration */
@@ -892,8 +858,8 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 		return -ENODEV;
 	}
 
-	err = snd_card_new(pdev, index[idx], id[idx], THIS_MODULE,
-			   sizeof(struct snd_msnd), &card);
+	err = snd_devm_card_new(pdev, index[idx], id[idx], THIS_MODULE,
+				sizeof(struct snd_msnd), &card);
 	if (err < 0)
 		return err;
 
@@ -934,17 +900,15 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 	printk(KERN_INFO LOGNAME ": Non-PnP mode: configuring at port 0x%lx\n",
 			cfg[idx]);
 
-	if (!request_region(cfg[idx], 2, "Pinnacle/Fiji Config")) {
+	if (!devm_request_region(card->dev, cfg[idx], 2,
+				 "Pinnacle/Fiji Config")) {
 		printk(KERN_ERR LOGNAME ": Config port 0x%lx conflict\n",
 			   cfg[idx]);
-		snd_card_free(card);
 		return -EIO;
 	}
 	if (reset[idx])
-		if (snd_msnd_pinnacle_cfg_reset(cfg[idx])) {
-			err = -EIO;
-			goto cfg_error;
-		}
+		if (snd_msnd_pinnacle_cfg_reset(cfg[idx]))
+			return -EIO;
 
 	/* DSP */
 	err = snd_msnd_write_cfg_logical(cfg[idx], 0,
@@ -952,7 +916,7 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 					 irq[idx], mem[idx]);
 
 	if (err)
-		goto cfg_error;
+		return err;
 
 	/* The following are Pinnacle specific */
 
@@ -967,7 +931,7 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 						 mpu_irq[idx], 0);
 
 		if (err)
-			goto cfg_error;
+			return err;
 	}
 
 	/* IDE */
@@ -982,7 +946,7 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 						 ide_irq[idx], 0);
 
 		if (err)
-			goto cfg_error;
+			return err;
 	}
 
 	/* Joystick */
@@ -995,9 +959,8 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 						 0, 0);
 
 		if (err)
-			goto cfg_error;
+			return err;
 	}
-	release_region(cfg[idx], 2);
 
 #endif /* MSND_CLASSIC */
 
@@ -1027,37 +990,22 @@ static int snd_msnd_isa_probe(struct device *pdev, unsigned int idx)
 	err = snd_msnd_probe(card);
 	if (err < 0) {
 		printk(KERN_ERR LOGNAME ": Probe failed\n");
-		snd_card_free(card);
 		return err;
 	}
 
 	err = snd_msnd_attach(card);
 	if (err < 0) {
 		printk(KERN_ERR LOGNAME ": Attach failed\n");
-		snd_card_free(card);
 		return err;
 	}
 	dev_set_drvdata(pdev, card);
 
 	return 0;
-
-#ifndef MSND_CLASSIC
-cfg_error:
-	release_region(cfg[idx], 2);
-	snd_card_free(card);
-	return err;
-#endif
-}
-
-static void snd_msnd_isa_remove(struct device *pdev, unsigned int dev)
-{
-	snd_msnd_unload(dev_get_drvdata(pdev));
 }
 
 static struct isa_driver snd_msnd_driver = {
 	.match		= snd_msnd_isa_match,
 	.probe		= snd_msnd_isa_probe,
-	.remove		= snd_msnd_isa_remove,
 	/* FIXME: suspend, resume */
 	.driver		= {
 		.name	= DEV_NAME
@@ -1107,9 +1055,9 @@ static int snd_msnd_pnp_detect(struct pnp_card_link *pcard,
 	 * Create a new ALSA sound card entry, in anticipation
 	 * of detecting our hardware ...
 	 */
-	ret = snd_card_new(&pcard->card->dev,
-			   index[idx], id[idx], THIS_MODULE,
-			   sizeof(struct snd_msnd), &card);
+	ret = snd_devm_card_new(&pcard->card->dev,
+				index[idx], id[idx], THIS_MODULE,
+				sizeof(struct snd_msnd), &card);
 	if (ret < 0)
 		return ret;
 
@@ -1151,28 +1099,18 @@ static int snd_msnd_pnp_detect(struct pnp_card_link *pcard,
 	ret = snd_msnd_probe(card);
 	if (ret < 0) {
 		printk(KERN_ERR LOGNAME ": Probe failed\n");
-		goto _release_card;
+		return ret;
 	}
 
 	ret = snd_msnd_attach(card);
 	if (ret < 0) {
 		printk(KERN_ERR LOGNAME ": Attach failed\n");
-		goto _release_card;
+		return ret;
 	}
 
 	pnp_set_card_drvdata(pcard, card);
 	++idx;
 	return 0;
-
-_release_card:
-	snd_card_free(card);
-	return ret;
-}
-
-static void snd_msnd_pnp_remove(struct pnp_card_link *pcard)
-{
-	snd_msnd_unload(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
 }
 
 static int isa_registered;
@@ -1191,7 +1129,6 @@ static struct pnp_card_driver msnd_pnpc_driver = {
 	.name = "msnd_pinnacle",
 	.id_table = msnd_pnpids,
 	.probe = snd_msnd_pnp_detect,
-	.remove = snd_msnd_pnp_remove,
 };
 #endif /* CONFIG_PNP */
 
-- 
2.26.2


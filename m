Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE673C9A9E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC72D1752;
	Thu, 15 Jul 2021 10:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC72D1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337726;
	bh=TXuTrEN08yehKr7Ciy62unZ11BMc5BaFrn3/wwNyw6A=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWsKN0q6C5X9OIOhJd+nfPayQlbMPQ+3nlLE5EEkmWyetRpp85lUeyCYn4V9Szscq
	 qtNuDRYteuQKcCWhhTINLpuo8qOVAC+3qoXxQct0T1TN9R9C09gLYno9JdaNf3sevS
	 yfOgEFiFMShScj7MAplhlwDYuA02NP3xb57j9rpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DFCEF80841;
	Thu, 15 Jul 2021 10:01:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E38DAF807DE; Thu, 15 Jul 2021 10:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18F30F805AA
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F30F805AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZOLDZ+8I"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="9+sZg/ie"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D8D0522854
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRUeyFmo/r1kEv9m/+nXyBfMbslPAZh0fUINSstUFp4=;
 b=ZOLDZ+8Ig0ookJEcAEWx5PgmZoBr6Ts0lrsYaPCNDD3O5xRhOvtYwTescgTXUd7o+7hsHS
 JybqJmopOVrnPW6Y8nmk/ApW8EVRf/xWtVoRQHUMV71BXi3gp9j855g/8d+SYMucAm/O7/
 gSqbDBfRzS6SR4WXrga+jTAA/YGd7eY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRUeyFmo/r1kEv9m/+nXyBfMbslPAZh0fUINSstUFp4=;
 b=9+sZg/iet2yjfb+qzJ43/ZTFdw6d/MRS7uh6V5LNmW3s+hVVWZgifYjrBzGYFceug8Obn+
 7S9ma44c5CcqCvAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C647FA3B9D;
 Thu, 15 Jul 2021 08:00:22 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 70/79] ALSA: sscape: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:32 +0200
Message-Id: <20210715075941.23332-71-tiwai@suse.de>
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

This patch converts the resource management in ISA sscape driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sscape.c | 92 ++++++++++------------------------------------
 1 file changed, 20 insertions(+), 72 deletions(-)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index e70ef9aee545..0bc0025f7c19 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -327,17 +327,6 @@ static void activate_ad1845_unsafe(unsigned io_base)
 	sscape_write_unsafe(io_base, GA_CDCFG_REG, 0x80);
 }
 
-/*
- * Do the necessary ALSA-level cleanup to deallocate our driver ...
- */
-static void soundscape_free(struct snd_card *c)
-{
-	struct soundscape *sscape = get_card_soundscape(c);
-	release_and_free_resource(sscape->io_res);
-	release_and_free_resource(sscape->wss_res);
-	free_dma(sscape->chip->dma1);
-}
-
 /*
  * Tell the SoundScape to begin a DMA transfer using the given channel.
  * All locking issues are left to the caller.
@@ -941,7 +930,7 @@ static int create_sscape(int dev, struct snd_card *card)
 	 * Grab IO ports that we will need to probe so that we
 	 * can detect and control this hardware ...
 	 */
-	io_res = request_region(port[dev], 8, "SoundScape");
+	io_res = devm_request_region(card->dev, port[dev], 8, "SoundScape");
 	if (!io_res) {
 		snd_printk(KERN_ERR
 			   "sscape: can't grab port 0x%lx\n", port[dev]);
@@ -949,22 +938,22 @@ static int create_sscape(int dev, struct snd_card *card)
 	}
 	wss_res = NULL;
 	if (sscape->type == SSCAPE_VIVO) {
-		wss_res = request_region(wss_port[dev], 4, "SoundScape");
+		wss_res = devm_request_region(card->dev, wss_port[dev], 4,
+					      "SoundScape");
 		if (!wss_res) {
 			snd_printk(KERN_ERR "sscape: can't grab port 0x%lx\n",
 					    wss_port[dev]);
-			err = -EBUSY;
-			goto _release_region;
+			return -EBUSY;
 		}
 	}
 
 	/*
 	 * Grab one DMA channel ...
 	 */
-	err = request_dma(dma[dev], "SoundScape");
+	err = snd_devm_request_dma(card->dev, dma[dev], "SoundScape");
 	if (err < 0) {
 		snd_printk(KERN_ERR "sscape: can't grab DMA %d\n", dma[dev]);
-		goto _release_region;
+		return err;
 	}
 
 	spin_lock_init(&sscape->lock);
@@ -975,8 +964,7 @@ static int create_sscape(int dev, struct snd_card *card)
 	if (!detect_sscape(sscape, wss_port[dev])) {
 		printk(KERN_ERR "sscape: hardware not detected at 0x%x\n",
 			sscape->io_base);
-		err = -ENODEV;
-		goto _release_dma;
+		return -ENODEV;
 	}
 
 	switch (sscape->type) {
@@ -1006,15 +994,13 @@ static int create_sscape(int dev, struct snd_card *card)
 	irq_cfg = get_irq_config(sscape->type, irq[dev]);
 	if (irq_cfg == INVALID_IRQ) {
 		snd_printk(KERN_ERR "sscape: Invalid IRQ %d\n", irq[dev]);
-		err = -ENXIO;
-		goto _release_dma;
+		return -ENXIO;
 	}
 
 	mpu_irq_cfg = get_irq_config(sscape->type, mpu_irq[dev]);
 	if (mpu_irq_cfg == INVALID_IRQ) {
 		snd_printk(KERN_ERR "sscape: Invalid IRQ %d\n", mpu_irq[dev]);
-		err = -ENXIO;
-		goto _release_dma;
+		return -ENXIO;
 	}
 
 	/*
@@ -1060,7 +1046,7 @@ static int create_sscape(int dev, struct snd_card *card)
 		snd_printk(KERN_ERR
 				"sscape: No AD1845 device at 0x%lx, IRQ %d\n",
 				wss_port[dev], irq[dev]);
-		goto _release_dma;
+		return err;
 	}
 	strcpy(card->driver, "SoundScape");
 	strcpy(card->shortname, name);
@@ -1082,7 +1068,7 @@ static int create_sscape(int dev, struct snd_card *card)
 				snd_printk(KERN_ERR "sscape: Failed to create "
 						"MPU-401 device at 0x%lx\n",
 						port[dev]);
-				goto _release_dma;
+				return err;
 			}
 
 			/*
@@ -1109,24 +1095,7 @@ static int create_sscape(int dev, struct snd_card *card)
 		}
 	}
 
-	/*
-	 * Now that we have successfully created this sound card,
-	 * it is safe to store the pointer.
-	 * NOTE: we only register the sound card's "destructor"
-	 *       function now that our "constructor" has completed.
-	 */
-	card->private_free = soundscape_free;
-
 	return 0;
-
-_release_dma:
-	free_dma(dma[dev]);
-
-_release_region:
-	release_and_free_resource(wss_res);
-	release_and_free_resource(io_res);
-
-	return err;
 }
 
 
@@ -1156,8 +1125,8 @@ static int snd_sscape_probe(struct device *pdev, unsigned int dev)
 	struct soundscape *sscape;
 	int ret;
 
-	ret = snd_card_new(pdev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct soundscape), &card);
+	ret = snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct soundscape), &card);
 	if (ret < 0)
 		return ret;
 
@@ -1168,24 +1137,15 @@ static int snd_sscape_probe(struct device *pdev, unsigned int dev)
 
 	ret = create_sscape(dev, card);
 	if (ret < 0)
-		goto _release_card;
+		return ret;
 
 	ret = snd_card_register(card);
 	if (ret < 0) {
 		snd_printk(KERN_ERR "sscape: Failed to register sound card\n");
-		goto _release_card;
+		return ret;
 	}
 	dev_set_drvdata(pdev, card);
 	return 0;
-
-_release_card:
-	snd_card_free(card);
-	return ret;
-}
-
-static void snd_sscape_remove(struct device *devptr, unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(devptr));
 }
 
 #define DEV_NAME "sscape"
@@ -1193,7 +1153,6 @@ static void snd_sscape_remove(struct device *devptr, unsigned int dev)
 static struct isa_driver snd_sscape_driver = {
 	.match		= snd_sscape_match,
 	.probe		= snd_sscape_probe,
-	.remove		= snd_sscape_remove,
 	/* FIXME: suspend/resume */
 	.driver		= {
 		.name	= DEV_NAME
@@ -1244,9 +1203,9 @@ static int sscape_pnp_detect(struct pnp_card_link *pcard,
 	 * Create a new ALSA sound card entry, in anticipation
 	 * of detecting our hardware ...
 	 */
-	ret = snd_card_new(&pcard->card->dev,
-			   index[idx], id[idx], THIS_MODULE,
-			   sizeof(struct soundscape), &card);
+	ret = snd_devm_card_new(&pcard->card->dev,
+				index[idx], id[idx], THIS_MODULE,
+				sizeof(struct soundscape), &card);
 	if (ret < 0)
 		return ret;
 
@@ -1277,27 +1236,17 @@ static int sscape_pnp_detect(struct pnp_card_link *pcard,
 
 	ret = create_sscape(idx, card);
 	if (ret < 0)
-		goto _release_card;
+		return ret;
 
 	ret = snd_card_register(card);
 	if (ret < 0) {
 		snd_printk(KERN_ERR "sscape: Failed to register sound card\n");
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
-static void sscape_pnp_remove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
 }
 
 static struct pnp_card_driver sscape_pnpc_driver = {
@@ -1305,7 +1254,6 @@ static struct pnp_card_driver sscape_pnpc_driver = {
 	.name = "sscape",
 	.id_table = sscape_pnpids,
 	.probe = sscape_pnp_detect,
-	.remove = sscape_pnp_remove,
 };
 
 #endif /* CONFIG_PNP */
-- 
2.26.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BDB3C9A87
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:25:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BCDE1749;
	Thu, 15 Jul 2021 10:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BCDE1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337508;
	bh=UmeZ7ag78PZFFqspkHwDljiQneoAOL6eqCouDx75+cs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NblqEBDxRHb4AskfU2SFIzFO3dW2+WULcoWhpVgIUpDpxMmu9RODlwi3RYgSg+Rpg
	 RPirU3wT2/V1RXOkxRp8SuXCywiRZPZSxWBXUa9jimyX9QAbcD7tl4H5G5jtPHAgy9
	 fL0USxhssRSct8GEa7BS7BR7qSc23oa6esnwYs3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80044F80797;
	Thu, 15 Jul 2021 10:01:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4070AF80753; Thu, 15 Jul 2021 10:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57892F80570
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57892F80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="X/0n4i6F"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="M9Yj96Qa"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2F4071FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQ5FP0OW+9sR/Far1VtCm814RFNGYZuDqdhZpEyhWAs=;
 b=X/0n4i6FBRf3x6+HBAaceXF7eMkHPf1+OTlhRD8C6mhDRknSE2mbOUm9yf3qVwra8QUqHX
 Bg//4AL/blA5u0qWXzpulI4OvjQsi9bsfr4tgFIKlAcciLqIdWLzuq6wH+uaEUZLuJbCZh
 CQ73QwuZ5ZKDOgTkEQ62aHU7OUqK9hQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQ5FP0OW+9sR/Far1VtCm814RFNGYZuDqdhZpEyhWAs=;
 b=M9Yj96Qaad/jalkSyOUPTpGai0Wu5Zoz+9QE0p2q0NRvbbqfoMaYwMBTX+4oo7TOnYZHzh
 QoJ3XEiNGJ5benBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1DD94A3B8F;
 Thu, 15 Jul 2021 08:00:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 62/79] ALSA: es1688: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:24 +0200
Message-Id: <20210715075941.23332-63-tiwai@suse.de>
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

This patch converts the resource management in ISA es1688 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/es1688.h        |  1 -
 sound/isa/es1688/es1688.c     | 33 +++++++++------------------------
 sound/isa/es1688/es1688_lib.c | 29 +++++++++--------------------
 3 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/include/sound/es1688.h b/include/sound/es1688.h
index 099569c31fbb..da577bbf9cc7 100644
--- a/include/sound/es1688.h
+++ b/include/sound/es1688.h
@@ -18,7 +18,6 @@
 
 struct snd_es1688 {
 	unsigned long port;		/* port of ESS chip */
-	struct resource *res_port;
 	unsigned long mpu_port;		/* MPU-401 port of ESS chip */
 	int irq;			/* IRQ number of ESS chip */
 	int mpu_irq;			/* MPU IRQ */
diff --git a/sound/isa/es1688/es1688.c b/sound/isa/es1688/es1688.c
index 750d4995634f..f935b56eeec7 100644
--- a/sound/isa/es1688/es1688.c
+++ b/sound/isa/es1688/es1688.c
@@ -166,36 +166,27 @@ static int snd_es1688_isa_probe(struct device *dev, unsigned int n)
 	struct snd_card *card;
 	int error;
 
-	error = snd_card_new(dev, index[n], id[n], THIS_MODULE,
-			     sizeof(struct snd_es1688), &card);
+	error = snd_devm_card_new(dev, index[n], id[n], THIS_MODULE,
+				  sizeof(struct snd_es1688), &card);
 	if (error < 0)
 		return error;
 
 	error = snd_es1688_legacy_create(card, dev, n);
 	if (error < 0)
-		goto out;
+		return error;
 
 	error = snd_es1688_probe(card, n);
 	if (error < 0)
-		goto out;
+		return error;
 
 	dev_set_drvdata(dev, card);
 
 	return 0;
-out:
-	snd_card_free(card);
-	return error;
-}
-
-static void snd_es1688_isa_remove(struct device *dev, unsigned int n)
-{
-	snd_card_free(dev_get_drvdata(dev));
 }
 
 static struct isa_driver snd_es1688_driver = {
 	.match		= snd_es1688_match,
 	.probe		= snd_es1688_isa_probe,
-	.remove		= snd_es1688_isa_remove,
 #if 0	/* FIXME */
 	.suspend	= snd_es1688_suspend,
 	.resume		= snd_es1688_resume,
@@ -249,22 +240,18 @@ static int snd_es968_pnp_detect(struct pnp_card_link *pcard,
 	if (dev == SNDRV_CARDS)
 		return -ENODEV;
 
-	error = snd_card_new(&pcard->card->dev,
-			     index[dev], id[dev], THIS_MODULE,
-			     sizeof(struct snd_es1688), &card);
+	error = snd_devm_card_new(&pcard->card->dev,
+				  index[dev], id[dev], THIS_MODULE,
+				  sizeof(struct snd_es1688), &card);
 	if (error < 0)
 		return error;
 
 	error = snd_card_es968_pnp(card, dev, pcard, pid);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 	error = snd_es1688_probe(card, dev);
-	if (error < 0) {
-		snd_card_free(card);
+	if (error < 0)
 		return error;
-	}
 	pnp_set_card_drvdata(pcard, card);
 	snd_es968_pnp_is_probed = 1;
 	return 0;
@@ -272,8 +259,6 @@ static int snd_es968_pnp_detect(struct pnp_card_link *pcard,
 
 static void snd_es968_pnp_remove(struct pnp_card_link *pcard)
 {
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
 	snd_es968_pnp_is_probed = 0;
 }
 
diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index 8554cb2263c1..9cd66b236cef 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -580,13 +580,6 @@ static int snd_es1688_free(struct snd_es1688 *chip)
 {
 	if (chip->hardware != ES1688_HW_UNDEF)
 		snd_es1688_init(chip, 0);
-	release_and_free_resource(chip->res_port);
-	if (chip->irq >= 0)
-		free_irq(chip->irq, (void *) chip);
-	if (chip->dma8 >= 0) {
-		disable_dma(chip->dma8);
-		free_dma(chip->dma8);
-	}
 	return 0;
 }
 
@@ -624,26 +617,25 @@ int snd_es1688_create(struct snd_card *card,
 	chip->dma8 = -1;
 	chip->hardware = ES1688_HW_UNDEF;
 	
-	chip->res_port = request_region(port + 4, 12, "ES1688");
-	if (chip->res_port == NULL) {
+	if (!devm_request_region(card->dev, port + 4, 12, "ES1688")) {
 		snd_printk(KERN_ERR "es1688: can't grab port 0x%lx\n", port + 4);
-		err = -EBUSY;
-		goto exit;
+		return -EBUSY;
 	}
 
-	err = request_irq(irq, snd_es1688_interrupt, 0, "ES1688", (void *) chip);
+	err = devm_request_irq(card->dev, irq, snd_es1688_interrupt, 0,
+			       "ES1688", (void *) chip);
 	if (err < 0) {
 		snd_printk(KERN_ERR "es1688: can't grab IRQ %d\n", irq);
-		goto exit;
+		return err;
 	}
 
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
-	err = request_dma(dma8, "ES1688");
+	err = snd_devm_request_dma(card->dev, dma8, "ES1688");
 
 	if (err < 0) {
 		snd_printk(KERN_ERR "es1688: can't grab DMA8 %d\n", dma8);
-		goto exit;
+		return err;
 	}
 	chip->dma8 = dma8;
 
@@ -659,17 +651,14 @@ int snd_es1688_create(struct snd_card *card,
 
 	err = snd_es1688_probe(chip);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	err = snd_es1688_init(chip, 1);
 	if (err < 0)
-		goto exit;
+		return err;
 
 	/* Register device */
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-exit:
-	if (err)
-		snd_es1688_free(chip);
 	return err;
 }
 
-- 
2.26.2


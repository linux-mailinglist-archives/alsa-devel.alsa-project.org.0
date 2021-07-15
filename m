Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 220983C9A70
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1BC01735;
	Thu, 15 Jul 2021 10:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1BC01735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337295;
	bh=sa4ah6JtEcK+tWnFZfcpLmZ9ze+pRkrhKELgkgKDmJM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NpcQTneuZxEMoDVQUGGMjJ2GGuhizCeNG2H7/DcDjWNAasb4JD+gW5RpnYpDVYSKw
	 0iIzPwntl4sSlUTc7FrEm/Zz1g8SCXIKY0cGQhOJAuUiZf0ke3B0w0UhNrDXbINEw5
	 tixOe3MTuxd1VQIT1b812aGi1ebIsmqazfTUQzW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF3A7F80730;
	Thu, 15 Jul 2021 10:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37BA2F80710; Thu, 15 Jul 2021 10:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CF7DF80549
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CF7DF80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="MUEdLDxT"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="LrIZkuFp"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 257651FD3E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrKMj97jEZ1Ruv60pMc3FAQRmlcNJ1z2f901Umap9Xw=;
 b=MUEdLDxTA42FshxtlTuOz97DPhodssajEWOe3ayrqvTPJEPWsiKDyT3xJ7psKebFFzveJD
 5lbLgRafAFT0uqV51rZcw85tY6p1KawYgXnZsldwTJdsJ4CC+qRIRq3hGvnMO8T6eeqVD8
 4SZUo7UJqk/mR7QKLLtaWGQWRhFHWp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrKMj97jEZ1Ruv60pMc3FAQRmlcNJ1z2f901Umap9Xw=;
 b=LrIZkuFphVapKKBIxQSC4rZFPNhICagU6RfX2jkCtaLDmvPHGlm3DdYgFKIPLr70aMN8w4
 hLNn+hN/yVdVBfCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1479DA3B8F;
 Thu, 15 Jul 2021 08:00:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 53/79] ALSA: wss: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:15 +0200
Message-Id: <20210715075941.23332-54-tiwai@suse.de>
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

This patch converts the resource management in ISA wss driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  Since the whole destructor code
could be removed by the conversion, the lowlevel snd_device was
dropped as well.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cs423x/cs4236_lib.c |  2 --
 sound/isa/wss/wss_lib.c       | 67 ++++++-----------------------------
 2 files changed, 11 insertions(+), 58 deletions(-)

diff --git a/sound/isa/cs423x/cs4236_lib.c b/sound/isa/cs423x/cs4236_lib.c
index 63957aea456b..35f25911adcf 100644
--- a/sound/isa/cs423x/cs4236_lib.c
+++ b/sound/isa/cs423x/cs4236_lib.c
@@ -298,7 +298,6 @@ int snd_cs4236_create(struct snd_card *card,
 	if (cport < 0x100 || cport == SNDRV_AUTO_PORT) {
 		snd_printk(KERN_ERR "please, specify control port "
 			   "for CS4236+ chips\n");
-		snd_device_free(card, chip);
 		return -ENODEV;
 	}
 	ver1 = snd_cs4236_ctrl_in(chip, 1);
@@ -308,7 +307,6 @@ int snd_cs4236_create(struct snd_card *card,
 	if (ver1 != ver2) {
 		snd_printk(KERN_ERR "CS4236+ chip detected, but "
 			   "control port 0x%lx is not valid\n", cport);
-		snd_device_free(card, chip);
 		return -ENODEV;
 	}
 	snd_cs4236_ctrl_out(chip, 0, 0x00);
diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index 743e0f05e335..026061b55ee9 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -1655,36 +1655,6 @@ static void snd_wss_resume(struct snd_wss *chip)
 }
 #endif /* CONFIG_PM */
 
-static int snd_wss_free(struct snd_wss *chip)
-{
-	release_and_free_resource(chip->res_port);
-	release_and_free_resource(chip->res_cport);
-	if (chip->irq >= 0) {
-		disable_irq(chip->irq);
-		if (!(chip->hwshare & WSS_HWSHARE_IRQ))
-			free_irq(chip->irq, (void *) chip);
-	}
-	if (!(chip->hwshare & WSS_HWSHARE_DMA1) && chip->dma1 >= 0) {
-		snd_dma_disable(chip->dma1);
-		free_dma(chip->dma1);
-	}
-	if (!(chip->hwshare & WSS_HWSHARE_DMA2) &&
-	    chip->dma2 >= 0 && chip->dma2 != chip->dma1) {
-		snd_dma_disable(chip->dma2);
-		free_dma(chip->dma2);
-	}
-	if (chip->timer)
-		snd_device_free(chip->card, chip->timer);
-	kfree(chip);
-	return 0;
-}
-
-static int snd_wss_dev_free(struct snd_device *device)
-{
-	struct snd_wss *chip = device->device_data;
-	return snd_wss_free(chip);
-}
-
 const char *snd_wss_chip_id(struct snd_wss *chip)
 {
 	switch (chip->hardware) {
@@ -1738,7 +1708,7 @@ static int snd_wss_new(struct snd_card *card,
 	struct snd_wss *chip;
 
 	*rchip = NULL;
-	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(card->dev, sizeof(*chip), GFP_KERNEL);
 	if (chip == NULL)
 		return -ENOMEM;
 	chip->hardware = hardware;
@@ -1774,9 +1744,6 @@ int snd_wss_create(struct snd_card *card,
 		      unsigned short hwshare,
 		      struct snd_wss **rchip)
 {
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_wss_dev_free,
-	};
 	struct snd_wss *chip;
 	int err;
 
@@ -1788,42 +1755,39 @@ int snd_wss_create(struct snd_card *card,
 	chip->dma1 = -1;
 	chip->dma2 = -1;
 
-	chip->res_port = request_region(port, 4, "WSS");
+	chip->res_port = devm_request_region(card->dev, port, 4, "WSS");
 	if (!chip->res_port) {
 		snd_printk(KERN_ERR "wss: can't grab port 0x%lx\n", port);
-		snd_wss_free(chip);
 		return -EBUSY;
 	}
 	chip->port = port;
 	if ((long)cport >= 0) {
-		chip->res_cport = request_region(cport, 8, "CS4232 Control");
+		chip->res_cport = devm_request_region(card->dev, cport, 8,
+						      "CS4232 Control");
 		if (!chip->res_cport) {
 			snd_printk(KERN_ERR
 				"wss: can't grab control port 0x%lx\n", cport);
-			snd_wss_free(chip);
 			return -ENODEV;
 		}
 	}
 	chip->cport = cport;
 	if (!(hwshare & WSS_HWSHARE_IRQ))
-		if (request_irq(irq, snd_wss_interrupt, 0,
-				"WSS", (void *) chip)) {
+		if (devm_request_irq(card->dev, irq, snd_wss_interrupt, 0,
+				     "WSS", (void *) chip)) {
 			snd_printk(KERN_ERR "wss: can't grab IRQ %d\n", irq);
-			snd_wss_free(chip);
 			return -EBUSY;
 		}
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
-	if (!(hwshare & WSS_HWSHARE_DMA1) && request_dma(dma1, "WSS - 1")) {
+	if (!(hwshare & WSS_HWSHARE_DMA1) &&
+	    snd_devm_request_dma(card->dev, dma1, "WSS - 1")) {
 		snd_printk(KERN_ERR "wss: can't grab DMA1 %d\n", dma1);
-		snd_wss_free(chip);
 		return -EBUSY;
 	}
 	chip->dma1 = dma1;
-	if (!(hwshare & WSS_HWSHARE_DMA2) && dma1 != dma2 &&
-	      dma2 >= 0 && request_dma(dma2, "WSS - 2")) {
+	if (!(hwshare & WSS_HWSHARE_DMA2) && dma1 != dma2 && dma2 >= 0 &&
+	    snd_devm_request_dma(card->dev, dma2, "WSS - 2")) {
 		snd_printk(KERN_ERR "wss: can't grab DMA2 %d\n", dma2);
-		snd_wss_free(chip);
 		return -EBUSY;
 	}
 	if (dma1 == dma2 || dma2 < 0) {
@@ -1839,10 +1803,8 @@ int snd_wss_create(struct snd_card *card,
 	}
 
 	/* global setup */
-	if (snd_wss_probe(chip) < 0) {
-		snd_wss_free(chip);
+	if (snd_wss_probe(chip) < 0)
 		return -ENODEV;
-	}
 	snd_wss_init(chip);
 
 #if 0
@@ -1853,13 +1815,6 @@ int snd_wss_create(struct snd_card *card,
 	}
 #endif
 
-	/* Register device */
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_wss_free(chip);
-		return err;
-	}
-
 #ifdef CONFIG_PM
 	/* Power Management */
 	chip->suspend = snd_wss_suspend;
-- 
2.26.2


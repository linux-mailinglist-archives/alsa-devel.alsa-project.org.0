Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6B3C9A89
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E211762;
	Thu, 15 Jul 2021 10:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E211762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337549;
	bh=N8bGt2d3GmBzaRdIFOFNRfQhAupN8fTw0uXA3r95Wn0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EzE5vnf4YiiaFYBuBl6jQOtb71X6llN03y4xSzB8Yvpt/b88f0O4XkvUjZ5LIidMx
	 7f6lHUafC7pDNDWHStRZZr+eM+nOqwBtc0LNDPRpPtdVCSA/jiU/6857dIceVyIthw
	 t4v/ZCtbq107Q8nnOG1KyEMDmcc3BHHgDMv1v5Ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C302F80799;
	Thu, 15 Jul 2021 10:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9755DF80579; Thu, 15 Jul 2021 10:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13628F80579
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13628F80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="uRpBKLnb"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="7CdWeLc7"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DC6481FDEA
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiZ0EA9mT23ir39teMSDmM++T966FtiEpWucGxOKKb0=;
 b=uRpBKLnbY0BAQbym1KD2B0RiS1wK9JqbXbkBErvqf+Dc+64EMI4shlYMPPU8bfy7WR7YeD
 SYsJ/9Sd26IGMHle+8kScR/uTeWPIAFqtezIT+lkahkhoNUJb8IFKx/fBMj4WWcGfqeFZf
 LMfAzBMzWWFacn43i2pMRAx9wdUqJdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiZ0EA9mT23ir39teMSDmM++T966FtiEpWucGxOKKb0=;
 b=7CdWeLc7A8gaHjNiWjBX4AAtt6WtM5+97DITnrOxUSJmTt8KujmOiaGHm8hUMugC0Qv+Fn
 yVPXcAhzfPuKSuDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D5BF1A3B8F;
 Thu, 15 Jul 2021 08:00:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 64/79] ALSA: galaxy: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:26 +0200
Message-Id: <20210715075941.23332-65-tiwai@suse.de>
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

This patch converts the resource management in ISA galaxy drivers with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/galaxy/galaxy.c | 82 ++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 49 deletions(-)

diff --git a/sound/isa/galaxy/galaxy.c b/sound/isa/galaxy/galaxy.c
index d33d69f29924..ea001c80149d 100644
--- a/sound/isa/galaxy/galaxy.c
+++ b/sound/isa/galaxy/galaxy.c
@@ -472,20 +472,10 @@ static void snd_galaxy_free(struct snd_card *card)
 {
 	struct snd_galaxy *galaxy = card->private_data;
 
-	if (galaxy->wss_port) {
+	if (galaxy->wss_port)
 		wss_set_config(galaxy->wss_port, 0);
-		ioport_unmap(galaxy->wss_port);
-		release_and_free_resource(galaxy->res_wss_port);
-	}
-	if (galaxy->config_port) {
+	if (galaxy->config_port)
 		galaxy_set_config(galaxy, galaxy->config);
-		ioport_unmap(galaxy->config_port);
-		release_and_free_resource(galaxy->res_config_port);
-	}
-	if (galaxy->port) {
-		ioport_unmap(galaxy->port);
-		release_and_free_resource(galaxy->res_port);
-	}
 }
 
 static int snd_galaxy_probe(struct device *dev, unsigned int n)
@@ -496,56 +486,60 @@ static int snd_galaxy_probe(struct device *dev, unsigned int n)
 	u8 type;
 	int err;
 
-	err = snd_card_new(dev, index[n], id[n], THIS_MODULE,
-			   sizeof(*galaxy), &card);
+	err = snd_devm_card_new(dev, index[n], id[n], THIS_MODULE,
+				sizeof(*galaxy), &card);
 	if (err < 0)
 		return err;
 
 	card->private_free = snd_galaxy_free;
 	galaxy = card->private_data;
 
-	galaxy->res_port = request_region(port[n], 16, DRV_NAME);
+	galaxy->res_port = devm_request_region(dev, port[n], 16, DRV_NAME);
 	if (!galaxy->res_port) {
 		dev_err(dev, "could not grab ports %#lx-%#lx\n", port[n],
 			port[n] + 15);
-		err = -EBUSY;
-		goto error;
+		return -EBUSY;
 	}
-	galaxy->port = ioport_map(port[n], 16);
+	galaxy->port = devm_ioport_map(dev, port[n], 16);
+	if (!galaxy->port)
+		return -ENOMEM;
 
 	err = galaxy_init(galaxy, &type);
 	if (err < 0) {
 		dev_err(dev, "did not find a Sound Galaxy at %#lx\n", port[n]);
-		goto error;
+		return err;
 	}
 	dev_info(dev, "Sound Galaxy (type %d) found at %#lx\n", type, port[n]);
 
-	galaxy->res_config_port = request_region(port[n] + GALAXY_PORT_CONFIG,
-						 16, DRV_NAME);
+	galaxy->res_config_port =
+		devm_request_region(dev, port[n] + GALAXY_PORT_CONFIG, 16,
+				    DRV_NAME);
 	if (!galaxy->res_config_port) {
 		dev_err(dev, "could not grab ports %#lx-%#lx\n",
 			port[n] + GALAXY_PORT_CONFIG,
 			port[n] + GALAXY_PORT_CONFIG + 15);
-		err = -EBUSY;
-		goto error;
+		return -EBUSY;
 	}
-	galaxy->config_port = ioport_map(port[n] + GALAXY_PORT_CONFIG, 16);
-
+	galaxy->config_port =
+		devm_ioport_map(dev, port[n] + GALAXY_PORT_CONFIG, 16);
+	if (!galaxy->config_port)
+		return -ENOMEM;
 	galaxy_config(galaxy, config[n]);
 
-	galaxy->res_wss_port = request_region(wss_port[n], 4, DRV_NAME);
+	galaxy->res_wss_port = devm_request_region(dev, wss_port[n], 4, DRV_NAME);
 	if (!galaxy->res_wss_port)  {
 		dev_err(dev, "could not grab ports %#lx-%#lx\n", wss_port[n],
 			wss_port[n] + 3);
-		err = -EBUSY;
-		goto error;
+		return -EBUSY;
 	}
-	galaxy->wss_port = ioport_map(wss_port[n], 4);
+	galaxy->wss_port = devm_ioport_map(dev, wss_port[n], 4);
+	if (!galaxy->wss_port)
+		return -ENOMEM;
 
 	err = galaxy_wss_config(galaxy, wss_config[n]);
 	if (err < 0) {
 		dev_err(dev, "could not configure WSS\n");
-		goto error;
+		return err;
 	}
 
 	strcpy(card->driver, DRV_NAME);
@@ -557,25 +551,25 @@ static int snd_galaxy_probe(struct device *dev, unsigned int n)
 	err = snd_wss_create(card, wss_port[n] + 4, -1, irq[n], dma1[n],
 			     dma2[n], WSS_HW_DETECT, 0, &chip);
 	if (err < 0)
-		goto error;
+		return err;
 
 	err = snd_wss_pcm(chip, 0);
 	if (err < 0)
-		goto error;
+		return err;
 
 	err = snd_wss_mixer(chip);
 	if (err < 0)
-		goto error;
+		return err;
 
 	err = snd_wss_timer(chip, 0);
 	if (err < 0)
-		goto error;
+		return err;
 
 	if (mpu_port[n] >= 0) {
 		err = snd_mpu401_uart_new(card, 0, MPU401_HW_MPU401,
 					  mpu_port[n], 0, mpu_irq[n], NULL);
 		if (err < 0)
-			goto error;
+			return err;
 	}
 
 	if (fm_port[n] >= 0) {
@@ -585,38 +579,28 @@ static int snd_galaxy_probe(struct device *dev, unsigned int n)
 				      OPL3_HW_AUTO, 0, &opl3);
 		if (err < 0) {
 			dev_err(dev, "no OPL device at %#lx\n", fm_port[n]);
-			goto error;
+			return err;
 		}
 		err = snd_opl3_timer_new(opl3, 1, 2);
 		if (err < 0)
-			goto error;
+			return err;
 
 		err = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
 		if (err < 0)
-			goto error;
+			return err;
 	}
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 
 	dev_set_drvdata(dev, card);
 	return 0;
-
-error:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_galaxy_remove(struct device *dev, unsigned int n)
-{
-	snd_card_free(dev_get_drvdata(dev));
 }
 
 static struct isa_driver snd_galaxy_driver = {
 	.match		= snd_galaxy_match,
 	.probe		= snd_galaxy_probe,
-	.remove		= snd_galaxy_remove,
 
 	.driver		= {
 		.name	= DEV_NAME
-- 
2.26.2


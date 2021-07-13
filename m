Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326B3C7299
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A29C81773;
	Tue, 13 Jul 2021 16:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A29C81773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187641;
	bh=h/HJYUIQ3H10Nk8LVYQibcebt4L9OhjMroqVoklppgE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fBE0K9pDHapia7IkdzpmMyUKjyXGfZ842/qiRaIC2Ixardh/dKKDMY5bp19RWAjGT
	 VKXSJDnelQKnT102Tsuu3OMimu8pBOCkHP4adA9pGS9Wa/v4YD+hxmMmJabGDe90NF
	 y89Y8MBgcT43vzeUVYdpCJDONmshp0FCTTJGRfO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A68DF80634;
	Tue, 13 Jul 2021 16:30:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D379F804F3; Tue, 13 Jul 2021 16:30:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FA16F8055C
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA16F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="V6yFS/Yi"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MmGEJhcP"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 24A8622855
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+X/2bTEhxb1+unE4n5+9Yg7YPVtnmR7yNJ0qjGYang=;
 b=V6yFS/Yii8vtG77gEAJXaIzZ7ZGBe0k/8LMULbvtulcrOKCvDS5pboGQY02/EN1sUBXfoR
 1N3NmSUAeLOhdXf7LZBURpzkjeUa9yEQuhdZO2jJYzLEKkvDS9WF7/+oBI+fd04o8Err89
 rRXrucVwo3MU4DsoLGzjDbDqCMk4Ex0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+X/2bTEhxb1+unE4n5+9Yg7YPVtnmR7yNJ0qjGYang=;
 b=MmGEJhcPq/u55adKb1BQ5NWnl0bJbbq/MUewBWYvK8uqErwvHRN6MVE4lOMsGUwMOGn0c6
 8eH6uWljF3pTIRDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 15386A3B85;
 Tue, 13 Jul 2021 14:29:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 49/51] ALSA: mtpav: Allocate resources with device-managed APIs
Date: Tue, 13 Jul 2021 16:28:55 +0200
Message-Id: <20210713142857.19654-50-tiwai@suse.de>
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

This patch converts the resource management in mtpav driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper now.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mtpav.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index 0e95b08d34d6..11235baaf6fa 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -566,13 +566,15 @@ static irqreturn_t snd_mtpav_irqh(int irq, void *dev_id)
  */
 static int snd_mtpav_get_ISA(struct mtpav *mcard)
 {
-	mcard->res_port = request_region(port, 3, "MotuMTPAV MIDI");
+	mcard->res_port = devm_request_region(mcard->card->dev, port, 3,
+					      "MotuMTPAV MIDI");
 	if (!mcard->res_port) {
 		snd_printk(KERN_ERR "MTVAP port 0x%lx is busy\n", port);
 		return -EBUSY;
 	}
 	mcard->port = port;
-	if (request_irq(irq, snd_mtpav_irqh, 0, "MOTU MTPAV", mcard)) {
+	if (devm_request_irq(mcard->card->dev, irq, snd_mtpav_irqh, 0,
+			     "MOTU MTPAV", mcard)) {
 		snd_printk(KERN_ERR "MTVAP IRQ %d busy\n", irq);
 		return -EBUSY;
 	}
@@ -667,9 +669,6 @@ static void snd_mtpav_free(struct snd_card *card)
 	if (crd->istimer > 0)
 		snd_mtpav_remove_output_timer(crd);
 	spin_unlock_irqrestore(&crd->spinlock, flags);
-	if (crd->irq >= 0)
-		free_irq(crd->irq, (void *)crd);
-	release_and_free_resource(crd->res_port);
 }
 
 /*
@@ -680,8 +679,8 @@ static int snd_mtpav_probe(struct platform_device *dev)
 	int err;
 	struct mtpav *mtp_card;
 
-	err = snd_card_new(&dev->dev, index, id, THIS_MODULE,
-			   sizeof(*mtp_card), &card);
+	err = snd_devm_card_new(&dev->dev, index, id, THIS_MODULE,
+				sizeof(*mtp_card), &card);
 	if (err < 0)
 		return err;
 
@@ -698,13 +697,13 @@ static int snd_mtpav_probe(struct platform_device *dev)
 
 	err = snd_mtpav_get_RAWMIDI(mtp_card);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	mtp_card->inmidiport = mtp_card->num_ports + MTPAV_PIDX_BROADCAST;
 
 	err = snd_mtpav_get_ISA(mtp_card);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	strcpy(card->driver, "MTPAV");
 	strcpy(card->shortname, "MTPAV on parallel port");
@@ -715,28 +714,17 @@ static int snd_mtpav_probe(struct platform_device *dev)
 
 	err = snd_card_register(mtp_card->card);
 	if (err < 0)
-		goto __error;
+		return err;
 
 	platform_set_drvdata(dev, card);
 	printk(KERN_INFO "Motu MidiTimePiece on parallel port irq: %d ioport: 0x%lx\n", irq, port);
 	return 0;
-
- __error:
-	snd_card_free(card);
-	return err;
-}
-
-static int snd_mtpav_remove(struct platform_device *devptr)
-{
-	snd_card_free(platform_get_drvdata(devptr));
-	return 0;
 }
 
 #define SND_MTPAV_DRIVER	"snd_mtpav"
 
 static struct platform_driver snd_mtpav_driver = {
 	.probe		= snd_mtpav_probe,
-	.remove		= snd_mtpav_remove,
 	.driver		= {
 		.name	= SND_MTPAV_DRIVER,
 	},
-- 
2.26.2


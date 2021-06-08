Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967AE39F929
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDFE318BB;
	Tue,  8 Jun 2021 16:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDFE318BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623162615;
	bh=S8PoKqc6i5doQwVBgKCh7FDkcnoZ/SytlO4ouJOOWCQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VQ4k+oqI7CF5AdjIPFmwh5OG5pisjRHAT3lfeKGHafrCq4RF63cz7YHyf/zCGZJuv
	 KLdaD9/St8pid/ObtqVVi/isvfF1eidcOOM1C+mKhmC32PN0MDPSf9nQnUYRqtvBvE
	 69hpxMc6JACHQs9tVRzuLqTA+Ua0muZLdGZLcEIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA11F80743;
	Tue,  8 Jun 2021 16:07:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EF65F8067B; Tue,  8 Jun 2021 16:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C9B4F80520
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C9B4F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="S3dcDptV"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lN/ztUmu"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D6733219FB
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXUZcujhpWJI3Z/TxgO3dxtyF6B9GN+18/4fZUZMWwY=;
 b=S3dcDptVbUdBzz3AfXx/tvsY9HFSstYvVG/4djXzAzR7ZqY549SY687WGZkOv+V8l7KIXC
 mcgmgmG7+1JamwIImFTcDfpI94CuOpLUuMr1j4DsR/LsIQIFly8lXdXz+kyw4AtSvJWS+4
 vByWz0JokGCt4j1nDa2ghZQsKCsjNc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXUZcujhpWJI3Z/TxgO3dxtyF6B9GN+18/4fZUZMWwY=;
 b=lN/ztUmuFyBj21IRQrM+JGBG37AibBaXZirbnddEnMeJ6qLdApCJBgAwdf4F5xQlGuTIVz
 jNVQtjrc/smSKpDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C5DCDA3B88;
 Tue,  8 Jun 2021 14:05:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 62/66] ALSA: serial: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:05:36 +0200
Message-Id: <20210608140540.17885-63-tiwai@suse.de>
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

A few ALSA serial drivers contain assignments in if condition, which
is a bad coding style that may confuse readers and occasionally lead
to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mtpav.c         | 15 +++++++++------
 sound/drivers/mts64.c         | 15 ++++++++++-----
 sound/drivers/portman2x4.c    | 15 ++++++++++-----
 sound/drivers/serial-u16550.c | 27 ++++++++++++++-------------
 4 files changed, 43 insertions(+), 29 deletions(-)

diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index df4b7f9cd50f..0e95b08d34d6 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -566,7 +566,8 @@ static irqreturn_t snd_mtpav_irqh(int irq, void *dev_id)
  */
 static int snd_mtpav_get_ISA(struct mtpav *mcard)
 {
-	if ((mcard->res_port = request_region(port, 3, "MotuMTPAV MIDI")) == NULL) {
+	mcard->res_port = request_region(port, 3, "MotuMTPAV MIDI");
+	if (!mcard->res_port) {
 		snd_printk(KERN_ERR "MTVAP port 0x%lx is busy\n", port);
 		return -EBUSY;
 	}
@@ -628,10 +629,11 @@ static int snd_mtpav_get_RAWMIDI(struct mtpav *mcard)
 		hwports = 8;
 	mcard->num_ports = hwports;
 
-	if ((rval = snd_rawmidi_new(mcard->card, "MotuMIDI", 0,
-				    mcard->num_ports * 2 + MTPAV_PIDX_BROADCAST + 1,
-				    mcard->num_ports * 2 + MTPAV_PIDX_BROADCAST + 1,
-				    &mcard->rmidi)) < 0)
+	rval = snd_rawmidi_new(mcard->card, "MotuMIDI", 0,
+			       mcard->num_ports * 2 + MTPAV_PIDX_BROADCAST + 1,
+			       mcard->num_ports * 2 + MTPAV_PIDX_BROADCAST + 1,
+			       &mcard->rmidi);
+	if (rval < 0)
 		return rval;
 	rawmidi = mcard->rmidi;
 	rawmidi->private_data = mcard;
@@ -744,7 +746,8 @@ static int __init alsa_card_mtpav_init(void)
 {
 	int err;
 
-	if ((err = platform_driver_register(&snd_mtpav_driver)) < 0)
+	err = platform_driver_register(&snd_mtpav_driver);
+	if (err < 0)
 		return err;
 
 	device = platform_device_register_simple(SND_MTPAV_DRIVER, -1, NULL, 0);
diff --git a/sound/drivers/mts64.c b/sound/drivers/mts64.c
index 322d530ab07b..d3bc9e8c407d 100644
--- a/sound/drivers/mts64.c
+++ b/sound/drivers/mts64.c
@@ -950,7 +950,8 @@ static int snd_mts64_probe(struct platform_device *pdev)
 		goto free_pardev;
 	}
 
-	if ((err = snd_mts64_create(card, pardev, &mts)) < 0) {
+	err = snd_mts64_create(card, pardev, &mts);
+	if (err < 0) {
 		snd_printd("Cannot create main component\n");
 		goto release_pardev;
 	}
@@ -963,19 +964,22 @@ static int snd_mts64_probe(struct platform_device *pdev)
 		goto __err;
 	}
 	
-	if ((err = snd_mts64_rawmidi_create(card)) < 0) {
+	err = snd_mts64_rawmidi_create(card);
+	if (err < 0) {
 		snd_printd("Creating Rawmidi component failed\n");
 		goto __err;
 	}
 
 	/* init device */
-	if ((err = mts64_device_init(p)) < 0)
+	err = mts64_device_init(p);
+	if (err < 0)
 		goto __err;
 
 	platform_set_drvdata(pdev, card);
 
 	/* At this point card will be usable */
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_printd("Cannot register card\n");
 		goto __err;
 	}
@@ -1031,7 +1035,8 @@ static int __init snd_mts64_module_init(void)
 {
 	int err;
 
-	if ((err = platform_driver_register(&snd_mts64_driver)) < 0)
+	err = platform_driver_register(&snd_mts64_driver);
+	if (err < 0)
 		return err;
 
 	if (parport_register_driver(&mts64_parport_driver) != 0) {
diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index 2f4514ed47c5..52a656735365 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -749,7 +749,8 @@ static int snd_portman_probe(struct platform_device *pdev)
 		goto free_pardev;
 	}
 
-	if ((err = portman_create(card, pardev, &pm)) < 0) {
+	err = portman_create(card, pardev, &pm);
+	if (err < 0) {
 		snd_printd("Cannot create main component\n");
 		goto release_pardev;
 	}
@@ -762,19 +763,22 @@ static int snd_portman_probe(struct platform_device *pdev)
 		goto __err;
 	}
 	
-	if ((err = snd_portman_rawmidi_create(card)) < 0) {
+	err = snd_portman_rawmidi_create(card);
+	if (err < 0) {
 		snd_printd("Creating Rawmidi component failed\n");
 		goto __err;
 	}
 
 	/* init device */
-	if ((err = portman_device_init(pm)) < 0)
+	err = portman_device_init(pm);
+	if (err < 0)
 		goto __err;
 
 	platform_set_drvdata(pdev, card);
 
 	/* At this point card will be usable */
-	if ((err = snd_card_register(card)) < 0) {
+	err = snd_card_register(card);
+	if (err < 0) {
 		snd_printd("Cannot register card\n");
 		goto __err;
 	}
@@ -831,7 +835,8 @@ static int __init snd_portman_module_init(void)
 {
 	int err;
 
-	if ((err = platform_driver_register(&snd_portman_driver)) < 0)
+	err = platform_driver_register(&snd_portman_driver);
+	if (err < 0)
 		return err;
 
 	if (parport_register_driver(&portman_parport_driver) != 0) {
diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
index 6d5d1ca59ecf..da9983cba01c 100644
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -783,7 +783,8 @@ static int snd_uart16550_create(struct snd_card *card,
 	int err;
 
 
-	if ((uart = kzalloc(sizeof(*uart), GFP_KERNEL)) == NULL)
+	uart = kzalloc(sizeof(*uart), GFP_KERNEL);
+	if (!uart)
 		return -ENOMEM;
 	uart->adaptor = adaptor;
 	uart->card = card;
@@ -792,7 +793,8 @@ static int snd_uart16550_create(struct snd_card *card,
 	uart->base = iobase;
 	uart->drop_on_full = droponfull;
 
-	if ((err = snd_uart16550_detect(uart)) <= 0) {
+	err = snd_uart16550_detect(uart);
+	if (err <= 0) {
 		printk(KERN_ERR "no UART detected at 0x%lx\n", iobase);
 		snd_uart16550_free(uart);
 		return -ENODEV;
@@ -818,7 +820,8 @@ static int snd_uart16550_create(struct snd_card *card,
 	uart->timer_running = 0;
 
 	/* Register device */
-	if ((err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, uart, &ops)) < 0) {
+	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, uart, &ops);
+	if (err < 0) {
 		snd_uart16550_free(uart);
 		return err;
 	}
@@ -932,14 +935,10 @@ static int snd_serial_probe(struct platform_device *devptr)
 	strcpy(card->driver, "Serial");
 	strcpy(card->shortname, "Serial MIDI (UART16550A)");
 
-	if ((err = snd_uart16550_create(card,
-					port[dev],
-					irq[dev],
-					speed[dev],
-					base[dev],
-					adaptor[dev],
-					droponfull[dev],
-					&uart)) < 0)
+	err = snd_uart16550_create(card, port[dev], irq[dev], speed[dev],
+				   base[dev], adaptor[dev], droponfull[dev],
+				   &uart);
+	if (err < 0)
 		goto _err;
 
 	err = snd_uart16550_rmidi(uart, 0, outs[dev], ins[dev], &uart->rmidi);
@@ -952,7 +951,8 @@ static int snd_serial_probe(struct platform_device *devptr)
 		uart->base,
 		uart->irq);
 
-	if ((err = snd_card_register(card)) < 0)
+	err = snd_card_register(card);
+	if (err < 0)
 		goto _err;
 
 	platform_set_drvdata(devptr, card);
@@ -992,7 +992,8 @@ static int __init alsa_card_serial_init(void)
 {
 	int i, cards, err;
 
-	if ((err = platform_driver_register(&snd_serial_driver)) < 0)
+	err = platform_driver_register(&snd_serial_driver);
+	if (err < 0)
 		return err;
 
 	cards = 0;
-- 
2.26.2


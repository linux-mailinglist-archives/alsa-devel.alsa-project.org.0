Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC0E3C729E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:48:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45121770;
	Tue, 13 Jul 2021 16:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45121770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187724;
	bh=DEUGb2hT223hQiqhpFFrWdJG3HPT4ULSYVrlZMvsWsE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gag2Yk/AlhkKhom3Bt6Oebfwk9w6QyiTfRkwttOrc9M+34qE1XZkhmNjZs9+UrUSw
	 lGEP22nYHzI6e+TwNT3JMlCsIK3dO6AQ4KgQHXzDZeRcpQ3PtsbIkuyy3NsoCKwxGI
	 GjabeEGHcl9kv7hMLeoYGIuPWzkeQLzk42/EtHoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 637DEF8063E;
	Tue, 13 Jul 2021 16:31:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81AF9F8052E; Tue, 13 Jul 2021 16:30:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5922F8055B
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5922F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="gXrih/7k"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="A0k3ZrpK"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BBD3C201E5
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zK28Lu7ebD6MMTjmwt1TKvaGQMGol3PUYO6PYUxZHyo=;
 b=gXrih/7kMmEcxJYp20QFZ1fxDWKxVDBE5ysolOBL42wZ+wY0Uac+4nFn+OxdVDbpdBNl+A
 LXpBSiNLuKFMWQll43mj9ZWy5Ss538XDJnFLdEmUnDjuib6fNYs0Sq0bTvh0qZEd3hbZ28
 xgn8i7Q2R8Xfnmcg9z3xTXnqfIG7zXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zK28Lu7ebD6MMTjmwt1TKvaGQMGol3PUYO6PYUxZHyo=;
 b=A0k3ZrpKxmD92cFAPmErmuF9/MvOPKSws682xQdgbe9Vou8AVQ6zSf3GEbdDm7fnWCJnbm
 hFqnoWhej71bCXCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id ABDE7A3B8A;
 Tue, 13 Jul 2021 14:29:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 50/51] ALSA: serial-u16550: Allocate resources with
 device-managed APIs
Date: Tue, 13 Jul 2021 16:28:56 +0200
Message-Id: <20210713142857.19654-51-tiwai@suse.de>
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

This patch converts the resource management in serial u16550 driver
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper, and the card object
release is managed now via card->private_free instead of a lowlevel
snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/serial-u16550.c | 57 ++++++-----------------------------
 1 file changed, 9 insertions(+), 48 deletions(-)

diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
index da9983cba01c..d3bb5d177569 100644
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -115,7 +115,6 @@ struct snd_uart16550 {
 	int irq;
 
 	unsigned long base;
-	struct resource *res_base;
 
 	unsigned int speed;
 	unsigned int speed_base;
@@ -323,8 +322,7 @@ static int snd_uart16550_detect(struct snd_uart16550 *uart)
 		return -ENODEV;	/* Not configured */
 	}
 
-	uart->res_base = request_region(io_base, 8, "Serial MIDI");
-	if (uart->res_base == NULL) {
+	if (!devm_request_region(uart->card->dev, io_base, 8, "Serial MIDI")) {
 		snd_printk(KERN_ERR "u16550: can't grab port 0x%lx\n", io_base);
 		return -EBUSY;
 	}
@@ -752,21 +750,6 @@ static const struct snd_rawmidi_ops snd_uart16550_input =
 	.trigger =	snd_uart16550_input_trigger,
 };
 
-static int snd_uart16550_free(struct snd_uart16550 *uart)
-{
-	if (uart->irq >= 0)
-		free_irq(uart->irq, uart);
-	release_and_free_resource(uart->res_base);
-	kfree(uart);
-	return 0;
-};
-
-static int snd_uart16550_dev_free(struct snd_device *device)
-{
-	struct snd_uart16550 *uart = device->device_data;
-	return snd_uart16550_free(uart);
-}
-
 static int snd_uart16550_create(struct snd_card *card,
 				unsigned long iobase,
 				int irq,
@@ -776,14 +759,11 @@ static int snd_uart16550_create(struct snd_card *card,
 				int droponfull,
 				struct snd_uart16550 **ruart)
 {
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_uart16550_dev_free,
-	};
 	struct snd_uart16550 *uart;
 	int err;
 
 
-	uart = kzalloc(sizeof(*uart), GFP_KERNEL);
+	uart = devm_kzalloc(sizeof(*uart), GFP_KERNEL);
 	if (!uart)
 		return -ENOMEM;
 	uart->adaptor = adaptor;
@@ -796,13 +776,12 @@ static int snd_uart16550_create(struct snd_card *card,
 	err = snd_uart16550_detect(uart);
 	if (err <= 0) {
 		printk(KERN_ERR "no UART detected at 0x%lx\n", iobase);
-		snd_uart16550_free(uart);
 		return -ENODEV;
 	}
 
 	if (irq >= 0 && irq != SNDRV_AUTO_IRQ) {
-		if (request_irq(irq, snd_uart16550_interrupt,
-				0, "Serial MIDI", uart)) {
+		if (devm_request_irq(card->dev, irq, snd_uart16550_interrupt,
+				     0, "Serial MIDI", uart)) {
 			snd_printk(KERN_WARNING
 				   "irq %d busy. Using Polling.\n", irq);
 		} else {
@@ -819,13 +798,6 @@ static int snd_uart16550_create(struct snd_card *card,
 	timer_setup(&uart->buffer_timer, snd_uart16550_buffer_timer, 0);
 	uart->timer_running = 0;
 
-	/* Register device */
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, uart, &ops);
-	if (err < 0) {
-		snd_uart16550_free(uart);
-		return err;
-	}
-
 	switch (uart->adaptor) {
 	case SNDRV_SERIAL_MS124W_SA:
 	case SNDRV_SERIAL_MS124W_MB:
@@ -927,8 +899,8 @@ static int snd_serial_probe(struct platform_device *devptr)
 		return -ENODEV;
 	}
 
-	err  = snd_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
-			    0, &card);
+	err  = snd_devm_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
+				 0, &card);
 	if (err < 0)
 		return err;
 
@@ -939,11 +911,11 @@ static int snd_serial_probe(struct platform_device *devptr)
 				   base[dev], adaptor[dev], droponfull[dev],
 				   &uart);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	err = snd_uart16550_rmidi(uart, 0, outs[dev], ins[dev], &uart->rmidi);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	sprintf(card->longname, "%s [%s] at %#lx, irq %d",
 		card->shortname,
@@ -953,27 +925,16 @@ static int snd_serial_probe(struct platform_device *devptr)
 
 	err = snd_card_register(card);
 	if (err < 0)
-		goto _err;
+		return err;
 
 	platform_set_drvdata(devptr, card);
 	return 0;
-
- _err:
-	snd_card_free(card);
-	return err;
-}
-
-static int snd_serial_remove(struct platform_device *devptr)
-{
-	snd_card_free(platform_get_drvdata(devptr));
-	return 0;
 }
 
 #define SND_SERIAL_DRIVER	"snd_serial_u16550"
 
 static struct platform_driver snd_serial_driver = {
 	.probe		= snd_serial_probe,
-	.remove		=  snd_serial_remove,
 	.driver		= {
 		.name	= SND_SERIAL_DRIVER,
 	},
-- 
2.26.2


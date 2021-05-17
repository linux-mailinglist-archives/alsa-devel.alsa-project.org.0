Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40708382D4A
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 15:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3EC41669;
	Mon, 17 May 2021 15:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3EC41669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621257687;
	bh=FJaMe3qxdU6NulZwKfMQjs642Nx/ESW3BZljpfBKu9U=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GhTnwwgbEAi0+fWCNhs0HZ8wKRqAjoL7MxS4NbtgWsjmdvVH1F7BAnvjmmEaM6aNx
	 a/TwVj8Yop0cr/3hhCyZqoI+eLJpO2zOWaXrw91pTWT+FlpsW+gzv3GcXjkDwMSSQC
	 NKqng9Xg01JJlCXXs3i+RJ4VE+vCDmg0rLAaVBDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD2CEF80506;
	Mon, 17 May 2021 15:16:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47997F80430; Mon, 17 May 2021 15:16:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FFF2F80431
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FFF2F80431
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF6A4B226
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 13:15:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/11] ALSA: usx2y: Cleanup probe and disconnect callbacks
Date: Mon, 17 May 2021 15:15:44 +0200
Message-Id: <20210517131545.27252-11-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210517131545.27252-1-tiwai@suse.de>
References: <20210517131545.27252-1-tiwai@suse.de>
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

Minor code refactoring by merging the superfluous function calls.
The functions were split in the past for covering pre-history USB
driver code, but this is utterly useless.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/usbusx2y.c | 107 ++++++++++++++-----------------------
 1 file changed, 40 insertions(+), 67 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index 09ead00e395e..099bee662af6 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -148,7 +148,6 @@ MODULE_PARM_DESC(enable, "Enable "NAME_ALLCAPS".");
 
 static int snd_usx2y_card_used[SNDRV_CARDS];
 
-static void usx2y_usb_disconnect(struct usb_device *usb_device, void *ptr);
 static void snd_usx2y_card_private_free(struct snd_card *card);
 static void usx2y_unlinkseq(struct snd_usx2y_async_seq *s);
 
@@ -390,66 +389,6 @@ static int usx2y_create_card(struct usb_device *device,
 	return 0;
 }
 
-static int usx2y_usb_probe(struct usb_device *device,
-			   struct usb_interface *intf,
-			   const struct usb_device_id *device_id,
-			   struct snd_card **cardp)
-{
-	int		err;
-	struct snd_card *card;
-
-	*cardp = NULL;
-	if (le16_to_cpu(device->descriptor.idVendor) != 0x1604 ||
-	    (le16_to_cpu(device->descriptor.idProduct) != USB_ID_US122 &&
-	     le16_to_cpu(device->descriptor.idProduct) != USB_ID_US224 &&
-	     le16_to_cpu(device->descriptor.idProduct) != USB_ID_US428))
-		return -EINVAL;
-
-	err = usx2y_create_card(device, intf, &card);
-	if (err < 0)
-		return err;
-	err = usx2y_hwdep_new(card, device);
-	if (err < 0)
-		goto error;
-	err = snd_card_register(card);
-	if (err < 0)
-		goto error;
-	*cardp = card;
-	return 0;
-
- error:
-	snd_card_free(card);
-	return err;
-}
-
-/*
- * new 2.5 USB kernel API
- */
-static int snd_usx2y_probe(struct usb_interface *intf, const struct usb_device_id *id)
-{
-	struct snd_card *card;
-	int err;
-
-	err = usx2y_usb_probe(interface_to_usbdev(intf), intf, id, &card);
-	if (err < 0)
-		return err;
-	dev_set_drvdata(&intf->dev, card);
-	return 0;
-}
-
-static void snd_usx2y_disconnect(struct usb_interface *intf)
-{
-	usx2y_usb_disconnect(interface_to_usbdev(intf),
-			     usb_get_intfdata(intf));
-}
-
-static struct usb_driver snd_usx2y_usb_driver = {
-	.name =		"snd-usb-usx2y",
-	.probe =	snd_usx2y_probe,
-	.disconnect =	snd_usx2y_disconnect,
-	.id_table =	snd_usx2y_usb_id_table,
-};
-
 static void snd_usx2y_card_private_free(struct snd_card *card)
 {
 	struct usx2ydev *usx2y = usx2y(card);
@@ -463,18 +402,15 @@ static void snd_usx2y_card_private_free(struct snd_card *card)
 		snd_usx2y_card_used[usx2y->card_index] = 0;
 }
 
-/*
- * Frees the device.
- */
-static void usx2y_usb_disconnect(struct usb_device *device, void *ptr)
+static void snd_usx2y_disconnect(struct usb_interface *intf)
 {
 	struct snd_card *card;
 	struct usx2ydev *usx2y;
 	struct list_head *p;
 
-	if (!ptr)
+	card = usb_get_intfdata(intf);
+	if (!card)
 		return;
-	card = ptr;
 	usx2y = usx2y(card);
 	usx2y->chip_status = USX2Y_STAT_CHIP_HUP;
 	usx2y_unlinkseq(&usx2y->as04);
@@ -490,4 +426,41 @@ static void usx2y_usb_disconnect(struct usb_device *device, void *ptr)
 	snd_card_free(card);
 }
 
+static int snd_usx2y_probe(struct usb_interface *intf,
+			   const struct usb_device_id *id)
+{
+	struct usb_device *device = interface_to_usbdev(intf);
+	struct snd_card *card;
+	int err;
+
+	if (le16_to_cpu(device->descriptor.idVendor) != 0x1604 ||
+	    (le16_to_cpu(device->descriptor.idProduct) != USB_ID_US122 &&
+	     le16_to_cpu(device->descriptor.idProduct) != USB_ID_US224 &&
+	     le16_to_cpu(device->descriptor.idProduct) != USB_ID_US428))
+		return -EINVAL;
+
+	err = usx2y_create_card(device, intf, &card);
+	if (err < 0)
+		return err;
+	err = usx2y_hwdep_new(card, device);
+	if (err < 0)
+		goto error;
+	err = snd_card_register(card);
+	if (err < 0)
+		goto error;
+
+	dev_set_drvdata(&intf->dev, card);
+	return 0;
+
+ error:
+	snd_card_free(card);
+	return err;
+}
+
+static struct usb_driver snd_usx2y_usb_driver = {
+	.name =		"snd-usb-usx2y",
+	.probe =	snd_usx2y_probe,
+	.disconnect =	snd_usx2y_disconnect,
+	.id_table =	snd_usx2y_usb_id_table,
+};
 module_usb_driver(snd_usx2y_usb_driver);
-- 
2.26.2


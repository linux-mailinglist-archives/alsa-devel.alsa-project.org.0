Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC1F355265
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 13:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D8771670;
	Tue,  6 Apr 2021 13:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D8771670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617708997;
	bh=i20Agn+0A+DkyiS6kayiYY2KlWEBeQDXoE0PKppv0XM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VbK/yYLRLfU2dwYCokAkRbYqT7XHYbBfckzE4p+nm0vTrn5b8kilI+I9ftzUHgJhg
	 8ZOv8p4a76RzeVmILHgfMmqKT8le+OaR4E1/YAHXSngyKC8t7QPW3wv7fspofQSrun
	 GdGI043zI5vURVhjj3WBSaIepZ+1TTwoi+rrcsQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 888F7F80246;
	Tue,  6 Apr 2021 13:35:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ECA1F80249; Tue,  6 Apr 2021 13:35:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01D6DF80246
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 13:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D6DF80246
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB7BBB032
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 11:35:35 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add error checks for
 usb_driver_claim_interface() calls
Date: Tue,  6 Apr 2021 13:35:34 +0200
Message-Id: <20210406113534.30455-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

There are a few calls of usb_driver_claim_interface() but all of those
miss the proper error checks, as reported by Coverity.  This patch
adds those missing checks.

Along with it, replace the magic pointer with -1 with a constant
USB_AUDIO_IFACE_UNUSED for better readability.

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1475943 ("Error handling issues")
Addresses-Coverity-ID: 1475944 ("Error handling issues")
Addresses-Coverity-ID: 1475945 ("Error handling issues")
Fixes: b1ce7ba619d9 ("ALSA: usb-audio: claim autodetected PCM interfaces all at once")
Fixes: e5779998bf8b ("ALSA: usb-audio: refactor code")
Link: https://lore.kernel.org/r/202104051059.FB7F3016@keescook
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     | 14 +++++++-------
 sound/usb/quirks.c   | 16 ++++++++++++----
 sound/usb/usbaudio.h |  2 ++
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 0826a437f8fc..7b7526d3a56e 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -181,9 +181,8 @@ static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int int
 				ctrlif, interface);
 			return -EINVAL;
 		}
-		usb_driver_claim_interface(&usb_audio_driver, iface, (void *)-1L);
-
-		return 0;
+		return usb_driver_claim_interface(&usb_audio_driver, iface,
+						  USB_AUDIO_IFACE_UNUSED);
 	}
 
 	if ((altsd->bInterfaceClass != USB_CLASS_AUDIO &&
@@ -203,7 +202,8 @@ static int snd_usb_create_stream(struct snd_usb_audio *chip, int ctrlif, int int
 
 	if (! snd_usb_parse_audio_interface(chip, interface)) {
 		usb_set_interface(dev, interface, 0); /* reset the current interface */
-		usb_driver_claim_interface(&usb_audio_driver, iface, (void *)-1L);
+		return usb_driver_claim_interface(&usb_audio_driver, iface,
+						  USB_AUDIO_IFACE_UNUSED);
 	}
 
 	return 0;
@@ -862,7 +862,7 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 	struct snd_card *card;
 	struct list_head *p;
 
-	if (chip == (void *)-1L)
+	if (chip == USB_AUDIO_IFACE_UNUSED)
 		return;
 
 	card = chip->card;
@@ -992,7 +992,7 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 	struct usb_mixer_interface *mixer;
 	struct list_head *p;
 
-	if (chip == (void *)-1L)
+	if (chip == USB_AUDIO_IFACE_UNUSED)
 		return 0;
 
 	if (!chip->num_suspended_intf++) {
@@ -1022,7 +1022,7 @@ static int __usb_audio_resume(struct usb_interface *intf, bool reset_resume)
 	struct list_head *p;
 	int err = 0;
 
-	if (chip == (void *)-1L)
+	if (chip == USB_AUDIO_IFACE_UNUSED)
 		return 0;
 
 	atomic_inc(&chip->active); /* avoid autopm */
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index ae667cf77e61..63f27ce64bcb 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -55,8 +55,12 @@ static int create_composite_quirk(struct snd_usb_audio *chip,
 		if (!iface)
 			continue;
 		if (quirk->ifnum != probed_ifnum &&
-		    !usb_interface_claimed(iface))
-			usb_driver_claim_interface(driver, iface, (void *)-1L);
+		    !usb_interface_claimed(iface)) {
+			err = usb_driver_claim_interface(driver, iface,
+							 USB_AUDIO_IFACE_UNUSED);
+			if (err < 0)
+				return err;
+		}
 	}
 
 	return 0;
@@ -426,8 +430,12 @@ static int create_autodetect_quirks(struct snd_usb_audio *chip,
 			continue;
 
 		err = create_autodetect_quirk(chip, iface, driver);
-		if (err >= 0)
-			usb_driver_claim_interface(driver, iface, (void *)-1L);
+		if (err >= 0) {
+			err = usb_driver_claim_interface(driver, iface,
+							 USB_AUDIO_IFACE_UNUSED);
+			if (err < 0)
+				return err;
+		}
 	}
 
 	return 0;
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 60b9dd7df6bb..8794c8658ab9 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -61,6 +61,8 @@ struct snd_usb_audio {
 	struct media_intf_devnode *ctl_intf_media_devnode;
 };
 
+#define USB_AUDIO_IFACE_UNUSED	((void *)-1L)
+
 #define usb_audio_err(chip, fmt, args...) \
 	dev_err(&(chip)->dev->dev, fmt, ##args)
 #define usb_audio_warn(chip, fmt, args...) \
-- 
2.26.2


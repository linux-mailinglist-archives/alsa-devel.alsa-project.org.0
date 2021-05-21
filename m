Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C1638C1BF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 10:26:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADE9316A2;
	Fri, 21 May 2021 10:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADE9316A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621585575;
	bh=gfV5ERUFMufGwNccreVXPgel2nl+0V0GiJS6gXgd+zQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q+bQzkcW4Qj9iWvwAn1FSyrl1tTqaXdaPIyJZhda120K+MbGI8t3kpnRX5VmWs8o3
	 CR3GhBHpQHz+/PhJsxZQfjHcBUIC33DdbyMMSeBlIjJRY39K7PCBMgcveg0tB5mEQJ
	 E439Ixi4b58bYOoyMm0el3kYWAix6s7WuvDJIGLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29EBFF80425;
	Fri, 21 May 2021 10:24:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1DAFF80424; Fri, 21 May 2021 10:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAC82F80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 10:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAC82F80153
Received: by m.b4.vu (Postfix, from userid 1000)
 id 6691E612FB20; Fri, 21 May 2021 17:53:44 +0930 (ACST)
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/2] ALSA: usb-audio: scarlett2: Improve driver startup
 messages
Date: Fri, 21 May 2021 17:50:13 +0930
Message-Id: <b5d140c65f640faf2427e085fbbc0297b32e5fce.1621584566.git.g@b4.vu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1621584566.git.g@b4.vu>
References: <cover.1621584566.git.g@b4.vu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Geoffrey D. Bennett" <g@b4.vu>
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

Add separate init function to call the existing controls_create
function so a custom error can be displayed if initialisation fails.

Use info level instead of error for notifications.

Display the VID/PID so device_setup is targeted to the right device.

Display "enabled" message to easily confirm that the driver is loaded.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_quirks.c        |  2 +-
 sound/usb/mixer_scarlett_gen2.c | 79 +++++++++++++++++++++------------
 sound/usb/mixer_scarlett_gen2.h |  2 +-
 3 files changed, 52 insertions(+), 31 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index ffd922327ae4..805873d0cd55 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3017,7 +3017,7 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x1235, 0x8203): /* Focusrite Scarlett 6i6 2nd Gen */
 	case USB_ID(0x1235, 0x8204): /* Focusrite Scarlett 18i8 2nd Gen */
 	case USB_ID(0x1235, 0x8201): /* Focusrite Scarlett 18i20 2nd Gen */
-		err = snd_scarlett_gen2_controls_create(mixer);
+		err = snd_scarlett_gen2_init(mixer);
 		break;
 
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index dcff3e3a49f3..3ad8f61a2095 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1997,38 +1997,11 @@ static int scarlett2_mixer_status_create(struct usb_mixer_interface *mixer)
 	return usb_submit_urb(mixer->urb, GFP_KERNEL);
 }
 
-/* Entry point */
-int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
+int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
+				      const struct scarlett2_device_info *info)
 {
-	const struct scarlett2_device_info *info;
 	int err;
 
-	/* only use UAC_VERSION_2 */
-	if (!mixer->protocol)
-		return 0;
-
-	switch (mixer->chip->usb_id) {
-	case USB_ID(0x1235, 0x8203):
-		info = &s6i6_gen2_info;
-		break;
-	case USB_ID(0x1235, 0x8204):
-		info = &s18i8_gen2_info;
-		break;
-	case USB_ID(0x1235, 0x8201):
-		info = &s18i20_gen2_info;
-		break;
-	default: /* device not (yet) supported */
-		return -EINVAL;
-	}
-
-	if (!(mixer->chip->setup & SCARLETT2_ENABLE)) {
-		usb_audio_err(mixer->chip,
-			"Focusrite Scarlett Gen 2 Mixer Driver disabled; "
-			"use options snd_usb_audio device_setup=1 "
-			"to enable and report any issues to g@b4.vu");
-		return 0;
-	}
-
 	/* Initialise private data, routing, sequence number */
 	err = scarlett2_init_private(mixer, info);
 	if (err < 0)
@@ -2073,3 +2046,51 @@ int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
 
 	return 0;
 }
+
+int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	const struct scarlett2_device_info *info;
+	int err;
+
+	/* only use UAC_VERSION_2 */
+	if (!mixer->protocol)
+		return 0;
+
+	switch (chip->usb_id) {
+	case USB_ID(0x1235, 0x8203):
+		info = &s6i6_gen2_info;
+		break;
+	case USB_ID(0x1235, 0x8204):
+		info = &s18i8_gen2_info;
+		break;
+	case USB_ID(0x1235, 0x8201):
+		info = &s18i20_gen2_info;
+		break;
+	default: /* device not (yet) supported */
+		return -EINVAL;
+	}
+
+	if (!(chip->setup & SCARLETT2_ENABLE)) {
+		usb_audio_info(chip,
+			"Focusrite Scarlett Gen 2 Mixer Driver disabled; "
+			"use options snd_usb_audio vid=0x%04x pid=0x%04x "
+			"device_setup=1 to enable and report any issues "
+			"to g@b4.vu",
+			USB_ID_VENDOR(chip->usb_id),
+			USB_ID_PRODUCT(chip->usb_id));
+		return 0;
+	}
+
+	usb_audio_info(chip,
+		"Focusrite Scarlett Gen 2 Mixer Driver enabled pid=0x%04x",
+		USB_ID_PRODUCT(chip->usb_id));
+
+	err = snd_scarlett_gen2_controls_create(mixer, info);
+	if (err < 0)
+		usb_audio_err(mixer->chip,
+			      "Error initialising Scarlett Mixer Driver: %d",
+			      err);
+
+	return err;
+}
diff --git a/sound/usb/mixer_scarlett_gen2.h b/sound/usb/mixer_scarlett_gen2.h
index 52e1dad77afd..668c6b0cb50a 100644
--- a/sound/usb/mixer_scarlett_gen2.h
+++ b/sound/usb/mixer_scarlett_gen2.h
@@ -2,6 +2,6 @@
 #ifndef __USB_MIXER_SCARLETT_GEN2_H
 #define __USB_MIXER_SCARLETT_GEN2_H
 
-int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer);
+int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer);
 
 #endif /* __USB_MIXER_SCARLETT_GEN2_H */
-- 
2.31.1


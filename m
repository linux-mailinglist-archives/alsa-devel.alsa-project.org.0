Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF81E38E0
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 08:14:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0658179C;
	Wed, 27 May 2020 08:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0658179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590560060;
	bh=ud1O4m5kc3RWmPQGl85AMaQHOhV5tPiMMFIk1pkVKp4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iapHEo8yGhbLBTLGazoOrQcM4Y5Xna16Zk3c6HvgiCdPfTLauV57oB0KgIX7PYe/P
	 4vWm41GQS5oH+duap0z1XMdjhXCbsS0ARYHNNrMrvprsoq4PmkrSAGRyW1bTn6DUfP
	 +ELaHTLswhd74WCCQAJo13Nbs+6lHUxeP+aVE38U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA020F8016F;
	Wed, 27 May 2020 08:12:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52E78F8014E; Wed, 27 May 2020 08:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AAFCF800CD
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 08:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AAFCF800CD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C2D9ABCB
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 06:12:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Clean up quirk entries with macros
Date: Wed, 27 May 2020 08:12:27 +0200
Message-Id: <20200527061227.24915-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

Introduced a couple of macros to simplify some quirk entries.
Just cosmetic, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks-table.h | 93 ++++++++++++++++--------------------------------
 1 file changed, 30 insertions(+), 63 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index eb89902a83be..5236f4d015c4 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -25,6 +25,21 @@
 	.idProduct = prod, \
 	.bInterfaceClass = USB_CLASS_VENDOR_SPEC
 
+#define QUIRK_RENAME_DEVICE(_vendor, _device)				\
+	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) { \
+		.vendor_name = _vendor,					\
+		.product_name = _device,				\
+		.ifnum = QUIRK_NO_INTERFACE				\
+	}
+
+#define QUIRK_DEVICE_PROFILE(_vendor, _device, _profile)		\
+	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) { \
+		.vendor_name = _vendor,					\
+		.product_name = _device,				\
+		.profile_name = _profile,				\
+		.ifnum = QUIRK_NO_INTERFACE				\
+	}
+
 /* FTDI devices */
 {
 	USB_DEVICE(0x0403, 0xb8d8),
@@ -61,20 +76,12 @@
 /* Creative/E-Mu devices */
 {
 	USB_DEVICE(0x041e, 0x3010),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Creative Labs",
-		.product_name = "Sound Blaster MP3+",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_RENAME_DEVICE("Creative Labs", "Sound Blaster MP3+")
 },
 /* Creative/Toshiba Multimedia Center SB-0500 */
 {
 	USB_DEVICE(0x041e, 0x3048),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Toshiba",
-		.product_name = "SB-0500",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_RENAME_DEVICE("Toshiba", "SB-0500")
 },
 {
 	/* E-Mu 0202 USB */
@@ -207,11 +214,7 @@
 	.idProduct = 0x0990,
 	.bInterfaceClass = USB_CLASS_AUDIO,
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL,
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Logitech, Inc.",
-		.product_name = "QuickCam Pro 9000",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_RENAME_DEVICE("Logitech, Inc.", "QuickCam Pro 9000")
 },
 
 /*
@@ -2596,11 +2599,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 },
 {
 	USB_DEVICE(0x0ccd, 0x0028),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "TerraTec",
-		.product_name = "Aureon5.1MkII",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_RENAME_DEVICE("TerraTec", "Aureon5.1MkII")
 },
 {
 	USB_DEVICE(0x0ccd, 0x0035),
@@ -2615,19 +2614,11 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 /* Stanton/N2IT Final Scratch v1 device ('Scratchamp') */
 {
 	USB_DEVICE(0x103d, 0x0100),
-		.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Stanton",
-		.product_name = "ScratchAmp",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_RENAME_DEVICE("Stanton", "ScratchAmp")
 },
 {
 	USB_DEVICE(0x103d, 0x0101),
-		.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Stanton",
-		.product_name = "ScratchAmp",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_RENAME_DEVICE("Stanton", "ScratchAmp")
 },
 
 /* Novation EMS devices */
@@ -2788,11 +2779,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 {
 	/* aka. Serato Scratch Live DJ Box */
 	USB_DEVICE(0x13e5, 0x0001),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Rane",
-		.product_name = "SL-1",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_RENAME_DEVICE("Rane", "SL-1")
 },
 
 /* Native Instruments MK2 series */
@@ -3259,10 +3246,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 	 * is also used by the CM106 based cards, so make it unique.
 	 */
 	USB_DEVICE(0x0d8c, 0x0103),
-	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
-		.product_name = "Audio Advantage MicroII",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_RENAME_DEVICE(NULL, "Audio Advantage MicroII")
 },
 
 /* disabled due to regression for other devices;
@@ -3368,12 +3352,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 /* Dell WD15 Dock */
 {
 	USB_DEVICE(0x0bda, 0x4014),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Dell",
-		.product_name = "WD15 Dock",
-		.profile_name = "Dell-WD15-Dock",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_DEVICE_PROFILE("Dell", "WD15 Dock", "Dell-WD15-Dock")
 },
 /* Dell WD19 Dock */
 {
@@ -3553,12 +3532,8 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 
 #define ALC1220_VB_DESKTOP(vend, prod) { \
 	USB_DEVICE(vend, prod),	\
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) { \
-		.vendor_name = "Realtek", \
-		.product_name = "ALC1220-VB-DT", \
-		.profile_name = "Realtek-ALC1220-VB-Desktop", \
-		.ifnum = QUIRK_NO_INTERFACE \
-	} \
+	QUIRK_DEVICE_PROFILE("Realtek", "ALC1220-VB-DT", \
+			     "Realtek-ALC1220-VB-Desktop") \
 }
 ALC1220_VB_DESKTOP(0x0414, 0xa002), /* Gigabyte TRX40 Aorus Pro WiFi */
 ALC1220_VB_DESKTOP(0x0db0, 0x0d64), /* MSI TRX40 Creator */
@@ -3574,21 +3549,13 @@ ALC1220_VB_DESKTOP(0x26ce, 0x0a01), /* Asrock TRX40 Creator */
  */
 {
 	USB_DEVICE(0x0414, 0xa000),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Gigabyte",
-		.product_name = "Aorus Master Front Headphone",
-		.profile_name = "Gigabyte-Aorus-Master-Front-Headphone",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_DEVICE_PROFILE("Gigabyte", "Aorus Master Front Headphone",
+			     "Gigabyte-Aorus-Master-Front-Headphone")
 },
 {
 	USB_DEVICE(0x0414, 0xa001),
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Gigabyte",
-		.product_name = "Aorus Master Main Audio",
-		.profile_name = "Gigabyte-Aorus-Master-Main-Audio",
-		.ifnum = QUIRK_NO_INTERFACE
-	}
+	QUIRK_DEVICE_PROFILE("Gigabyte", "Aorus Master Main Audio",
+			     "Gigabyte-Aorus-Master-Main-Audio")
 },
 
 #undef USB_DEVICE_VENDOR_SPEC
-- 
2.16.4


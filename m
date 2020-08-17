Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AD4245FB8
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 10:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 513261693;
	Mon, 17 Aug 2020 10:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 513261693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597652656;
	bh=4HTHjweDHNUq2DqCvRq3DHmOhj1nYpiXgaIDEJIZxW0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YFtwRCBFPqCJ/QH8Qs+nm8bnWiC1Cz9haU0Mmw79edUjEn5Q+u2VmbfeT9QHsQlW2
	 izgXCe3Bd1UqAz8TwAiT6ish/2Y2eSBXEpOQ8B6yuQKa6zPfEBCWO8oExFcscjIej3
	 1qHDw+Stc5/AUuJS2r9/+ryijOHBrdb4LKPjmrwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE1DF80264;
	Mon, 17 Aug 2020 10:21:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 120F5F80257; Mon, 17 Aug 2020 10:21:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5853F80216
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5853F80216
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18EF8ACF6
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 08:22:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: usb-audio: Move device rename and profile quirks to
 an internal table
Date: Mon, 17 Aug 2020 10:21:38 +0200
Message-Id: <20200817082140.20232-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200817082140.20232-1-tiwai@suse.de>
References: <20200817082140.20232-1-tiwai@suse.de>
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

So far we've added the devices that need vendor/product string renames
or the profile setup into the standard quirk table in quirks-table.h.
This table is imported into the primary USB audio device entry, hence
it's all exported for the probing so that udev and co can take a look
at it.  OTOH, for renaming or profile setup, we don't need to expose
those explicit entries because the probe itself follows the standard
way.  That said, we're exposing unnecessarily too many entries.

This patch moves such internal quirk entries into the own table, and
reduces the exported device table size.  Along with the moving items,
re-arrange the entries in the proper order.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c         | 133 +++++++++++++++++++++++++++++++++++++++++++----
 sound/usb/quirks-table.h | 120 ------------------------------------------
 sound/usb/usbaudio.h     |   1 -
 3 files changed, 124 insertions(+), 130 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 696e788c5d31..fa764b61fe9c 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -332,6 +332,106 @@ static int snd_usb_create_streams(struct snd_usb_audio *chip, int ctrlif)
 	return 0;
 }
 
+/*
+ * Profile name preset table
+ */
+struct usb_audio_device_name {
+	u32 id;
+	const char *vendor_name;
+	const char *product_name;
+	const char *profile_name;	/* override card->longname */
+};
+
+#define PROFILE_NAME(vid, pid, vendor, product, profile)	 \
+	{ .id = USB_ID(vid, pid), .vendor_name = (vendor),	 \
+	  .product_name = (product), .profile_name = (profile) }
+#define DEVICE_NAME(vid, pid, vendor, product) \
+	PROFILE_NAME(vid, pid, vendor, product, NULL)
+
+/* vendor/product and profile name presets, sorted in device id order */
+static const struct usb_audio_device_name usb_audio_names[] = {
+	/* HP Thunderbolt Dock Audio Headset */
+	PROFILE_NAME(0x03f0, 0x0269, "HP", "Thunderbolt Dock Audio Headset",
+		     "HP-Thunderbolt-Dock-Audio-Headset"),
+	/* HP Thunderbolt Dock Audio Module */
+	PROFILE_NAME(0x03f0, 0x0567, "HP", "Thunderbolt Dock Audio Module",
+		     "HP-Thunderbolt-Dock-Audio-Module"),
+
+	/* Two entries for Gigabyte TRX40 Aorus Master:
+	 * TRX40 Aorus Master has two USB-audio devices, one for the front
+	 * headphone with ESS SABRE9218 DAC chip, while another for the rest
+	 * I/O (the rear panel and the front mic) with Realtek ALC1220-VB.
+	 * Here we provide two distinct names for making UCM profiles easier.
+	 */
+	PROFILE_NAME(0x0414, 0xa000, "Gigabyte", "Aorus Master Front Headphone",
+		     "Gigabyte-Aorus-Master-Front-Headphone"),
+	PROFILE_NAME(0x0414, 0xa001, "Gigabyte", "Aorus Master Main Audio",
+		     "Gigabyte-Aorus-Master-Main-Audio"),
+
+	/* Gigabyte TRX40 Aorus Pro WiFi */
+	PROFILE_NAME(0x0414, 0xa002,
+		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
+
+	/* Creative/E-Mu devices */
+	DEVICE_NAME(0x041e, 0x3010, "Creative Labs", "Sound Blaster MP3+"),
+	/* Creative/Toshiba Multimedia Center SB-0500 */
+	DEVICE_NAME(0x041e, 0x3048, "Toshiba", "SB-0500"),
+
+	DEVICE_NAME(0x046d, 0x0990, "Logitech, Inc.", "QuickCam Pro 9000"),
+
+	/* Dell WD15 Dock */
+	PROFILE_NAME(0x0bda, 0x4014, "Dell", "WD15 Dock", "Dell-WD15-Dock"),
+	/* Dell WD19 Dock */
+	PROFILE_NAME(0x0bda, 0x402e, "Dell", "WD19 Dock", "Dell-WD15-Dock"),
+
+	DEVICE_NAME(0x0ccd, 0x0028, "TerraTec", "Aureon5.1MkII"),
+
+	/*
+	 * The original product_name is "USB Sound Device", however this name
+	 * is also used by the CM106 based cards, so make it unique.
+	 */
+	DEVICE_NAME(0x0d8c, 0x0102, NULL, "ICUSBAUDIO7D"),
+	DEVICE_NAME(0x0d8c, 0x0103, NULL, "Audio Advantage MicroII"),
+
+	/* MSI TRX40 Creator */
+	PROFILE_NAME(0x0db0, 0x0d64,
+		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
+	/* MSI TRX40 */
+	PROFILE_NAME(0x0db0, 0x543d,
+		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
+
+	/* Stanton/N2IT Final Scratch v1 device ('Scratchamp') */
+	DEVICE_NAME(0x103d, 0x0100, "Stanton", "ScratchAmp"),
+	DEVICE_NAME(0x103d, 0x0101, "Stanton", "ScratchAmp"),
+
+	/* aka. Serato Scratch Live DJ Box */
+	DEVICE_NAME(0x13e5, 0x0001, "Rane", "SL-1"),
+
+	/* Lenovo ThinkStation P620 Rear Line-in, Line-out and Microphone */
+	PROFILE_NAME(0x17aa, 0x1046, "Lenovo", "ThinkStation P620 Rear",
+		     "Lenovo-ThinkStation-P620-Rear"),
+	/* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
+	PROFILE_NAME(0x17aa, 0x104d, "Lenovo", "ThinkStation P620 Main",
+		     "Lenovo-ThinkStation-P620-Main"),
+
+	/* Asrock TRX40 Creator */
+	PROFILE_NAME(0x26ce, 0x0a01,
+		     "Realtek", "ALC1220-VB-DT", "Realtek-ALC1220-VB-Desktop"),
+
+	{ } /* terminator */
+};
+
+static const struct usb_audio_device_name *
+lookup_device_name(u32 id)
+{
+	static const struct usb_audio_device_name *p;
+
+	for (p = usb_audio_names; p->id; p++)
+		if (p->id == id)
+			return p;
+	return NULL;
+}
+
 /*
  * free the chip instance
  *
@@ -357,10 +457,16 @@ static void usb_audio_make_shortname(struct usb_device *dev,
 				     const struct snd_usb_audio_quirk *quirk)
 {
 	struct snd_card *card = chip->card;
-
-	if (quirk && quirk->product_name && *quirk->product_name) {
-		strlcpy(card->shortname, quirk->product_name,
-			sizeof(card->shortname));
+	const struct usb_audio_device_name *preset;
+	const char *s = NULL;
+
+	preset = lookup_device_name(chip->usb_id);
+	if (preset && preset->product_name)
+		s = preset->product_name;
+	else if (quirk && quirk->product_name)
+		s = quirk->product_name;
+	if (s && *s) {
+		strlcpy(card->shortname, s, sizeof(card->shortname));
 		return;
 	}
 
@@ -382,17 +488,26 @@ static void usb_audio_make_longname(struct usb_device *dev,
 				    const struct snd_usb_audio_quirk *quirk)
 {
 	struct snd_card *card = chip->card;
+	const struct usb_audio_device_name *preset;
+	const char *s = NULL;
 	int len;
 
+	preset = lookup_device_name(chip->usb_id);
+
 	/* shortcut - if any pre-defined string is given, use it */
-	if (quirk && quirk->profile_name && *quirk->profile_name) {
-		strlcpy(card->longname, quirk->profile_name,
-			sizeof(card->longname));
+	if (preset && preset->profile_name)
+		s = preset->profile_name;
+	if (s && *s) {
+		strlcpy(card->longname, s, sizeof(card->longname));
 		return;
 	}
 
-	if (quirk && quirk->vendor_name && *quirk->vendor_name) {
-		len = strlcpy(card->longname, quirk->vendor_name, sizeof(card->longname));
+	if (preset && preset->vendor_name)
+		s = preset->vendor_name;
+	else if (quirk && quirk->vendor_name)
+		s = quirk->vendor_name;
+	if (s && *s) {
+		len = strlcpy(card->longname, s, sizeof(card->longname));
 	} else {
 		/* retrieve the vendor and device strings as longname */
 		if (dev->descriptor.iManufacturer)
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index f4fb002e3ef4..978f7113bd81 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -25,33 +25,6 @@
 	.idProduct = prod, \
 	.bInterfaceClass = USB_CLASS_VENDOR_SPEC
 
-#define QUIRK_RENAME_DEVICE(_vendor, _device)				\
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) { \
-		.vendor_name = _vendor,					\
-		.product_name = _device,				\
-		.ifnum = QUIRK_NO_INTERFACE				\
-	}
-
-#define QUIRK_DEVICE_PROFILE(_vendor, _device, _profile)		\
-	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) { \
-		.vendor_name = _vendor,					\
-		.product_name = _device,				\
-		.profile_name = _profile,				\
-		.ifnum = QUIRK_NO_INTERFACE				\
-	}
-
-/* HP Thunderbolt Dock Audio Headset */
-{
-	USB_DEVICE(0x03f0, 0x0269),
-	QUIRK_DEVICE_PROFILE("HP", "Thunderbolt Dock Audio Headset",
-			     "HP-Thunderbolt-Dock-Audio-Headset"),
-},
-/* HP Thunderbolt Dock Audio Module */
-{
-	USB_DEVICE(0x03f0, 0x0567),
-	QUIRK_DEVICE_PROFILE("HP", "Thunderbolt Dock Audio Module",
-			     "HP-Thunderbolt-Dock-Audio-Module"),
-},
 /* FTDI devices */
 {
 	USB_DEVICE(0x0403, 0xb8d8),
@@ -85,16 +58,6 @@
 	}
 },
 
-/* Creative/E-Mu devices */
-{
-	USB_DEVICE(0x041e, 0x3010),
-	QUIRK_RENAME_DEVICE("Creative Labs", "Sound Blaster MP3+")
-},
-/* Creative/Toshiba Multimedia Center SB-0500 */
-{
-	USB_DEVICE(0x041e, 0x3048),
-	QUIRK_RENAME_DEVICE("Toshiba", "SB-0500")
-},
 {
 	/* E-Mu 0202 USB */
 	.match_flags = USB_DEVICE_ID_MATCH_DEVICE,
@@ -226,7 +189,6 @@
 	.idProduct = 0x0990,
 	.bInterfaceClass = USB_CLASS_AUDIO,
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL,
-	QUIRK_RENAME_DEVICE("Logitech, Inc.", "QuickCam Pro 9000")
 },
 
 /*
@@ -2609,10 +2571,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		.type = QUIRK_MIDI_STANDARD_INTERFACE
 	}
 },
-{
-	USB_DEVICE(0x0ccd, 0x0028),
-	QUIRK_RENAME_DEVICE("TerraTec", "Aureon5.1MkII")
-},
 {
 	USB_DEVICE(0x0ccd, 0x0035),
 	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
@@ -2623,16 +2581,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 
-/* Stanton/N2IT Final Scratch v1 device ('Scratchamp') */
-{
-	USB_DEVICE(0x103d, 0x0100),
-	QUIRK_RENAME_DEVICE("Stanton", "ScratchAmp")
-},
-{
-	USB_DEVICE(0x103d, 0x0101),
-	QUIRK_RENAME_DEVICE("Stanton", "ScratchAmp")
-},
-
 /* Novation EMS devices */
 {
 	USB_DEVICE_VENDOR_SPEC(0x1235, 0x0001),
@@ -2817,26 +2765,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 
-/* */
-{
-	/* aka. Serato Scratch Live DJ Box */
-	USB_DEVICE(0x13e5, 0x0001),
-	QUIRK_RENAME_DEVICE("Rane", "SL-1")
-},
-
-/* Lenovo ThinkStation P620 Rear Line-in, Line-out and Microphone */
-{
-	USB_DEVICE(0x17aa, 0x1046),
-	QUIRK_DEVICE_PROFILE("Lenovo", "ThinkStation P620 Rear",
-			     "Lenovo-ThinkStation-P620-Rear"),
-},
-/* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
-{
-	USB_DEVICE(0x17aa, 0x104d),
-	QUIRK_DEVICE_PROFILE("Lenovo", "ThinkStation P620 Main",
-			     "Lenovo-ThinkStation-P620-Main"),
-},
-
 /* Native Instruments MK2 series */
 {
 	/* Komplete Audio 6 */
@@ -3295,19 +3223,6 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 	}
 },
 
-/*
- * The original product_name is "USB Sound Device", however this name
- * is also used by the CM106 based cards, so make it unique.
- */
-{
-	USB_DEVICE(0x0d8c, 0x0102),
-	QUIRK_RENAME_DEVICE(NULL, "ICUSBAUDIO7D")
-},
-{
-	USB_DEVICE(0x0d8c, 0x0103),
-	QUIRK_RENAME_DEVICE(NULL, "Audio Advantage MicroII")
-},
-
 /* disabled due to regression for other devices;
  * see https://bugzilla.kernel.org/show_bug.cgi?id=199905
  */
@@ -3408,18 +3323,10 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 		}
 	}
 },
-/* Dell WD15 Dock */
-{
-	USB_DEVICE(0x0bda, 0x4014),
-	QUIRK_DEVICE_PROFILE("Dell", "WD15 Dock", "Dell-WD15-Dock")
-},
 /* Dell WD19 Dock */
 {
 	USB_DEVICE(0x0bda, 0x402e),
 	.driver_info = (unsigned long) & (const struct snd_usb_audio_quirk) {
-		.vendor_name = "Dell",
-		.product_name = "WD19 Dock",
-		.profile_name = "Dell-WD15-Dock",
 		.ifnum = QUIRK_ANY_INTERFACE,
 		.type = QUIRK_SETUP_FMT_AFTER_RESUME
 	}
@@ -3645,33 +3552,6 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 	}
 },
 
-#define ALC1220_VB_DESKTOP(vend, prod) { \
-	USB_DEVICE(vend, prod),	\
-	QUIRK_DEVICE_PROFILE("Realtek", "ALC1220-VB-DT", \
-			     "Realtek-ALC1220-VB-Desktop") \
-}
-ALC1220_VB_DESKTOP(0x0414, 0xa002), /* Gigabyte TRX40 Aorus Pro WiFi */
-ALC1220_VB_DESKTOP(0x0db0, 0x0d64), /* MSI TRX40 Creator */
-ALC1220_VB_DESKTOP(0x0db0, 0x543d), /* MSI TRX40 */
-ALC1220_VB_DESKTOP(0x26ce, 0x0a01), /* Asrock TRX40 Creator */
-#undef ALC1220_VB_DESKTOP
-
-/* Two entries for Gigabyte TRX40 Aorus Master:
- * TRX40 Aorus Master has two USB-audio devices, one for the front headphone
- * with ESS SABRE9218 DAC chip, while another for the rest I/O (the rear
- * panel and the front mic) with Realtek ALC1220-VB.
- * Here we provide two distinct names for making UCM profiles easier.
- */
-{
-	USB_DEVICE(0x0414, 0xa000),
-	QUIRK_DEVICE_PROFILE("Gigabyte", "Aorus Master Front Headphone",
-			     "Gigabyte-Aorus-Master-Front-Headphone")
-},
-{
-	USB_DEVICE(0x0414, 0xa001),
-	QUIRK_DEVICE_PROFILE("Gigabyte", "Aorus Master Main Audio",
-			     "Gigabyte-Aorus-Master-Main-Audio")
-},
 {
 	/*
 	 * Pioneer DJ DJM-900NXS2
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index b91c4c0807ec..2275295fe71f 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -109,7 +109,6 @@ enum quirk_type {
 struct snd_usb_audio_quirk {
 	const char *vendor_name;
 	const char *product_name;
-	const char *profile_name;	/* override the card->longname */
 	int16_t ifnum;
 	uint16_t type;
 	bool shares_media_device;
-- 
2.16.4


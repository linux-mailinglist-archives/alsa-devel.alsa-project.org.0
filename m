Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CB245FBC
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 10:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BA6C1698;
	Mon, 17 Aug 2020 10:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BA6C1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597652712;
	bh=66EFlz3zCS9vrekf6v9GwmfVl05kHaG1Te9lu63vLDI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QABBC2vSB+RkkTx+MwtFw2B2QnBTdjankFSnct67Os2/gzxsV+iOpKKAe/Zwh3083
	 w5/gKLEAonQWXDrwZgOz4eroWYHEbPFHHBg8Hw53BnpqLGcG5KLr9kDkVPonj15Nmp
	 q0kKrYg0DJhP/TvMqllddTucQvrVKiwfarePqFrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72B48F802A9;
	Mon, 17 Aug 2020 10:21:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A68F802D2; Mon, 17 Aug 2020 10:21:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA03AF80255
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA03AF80255
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D32BAD0B
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 08:22:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: usb-audio: Simplify quirk entries with a macro
Date: Mon, 17 Aug 2020 10:21:39 +0200
Message-Id: <20200817082140.20232-3-tiwai@suse.de>
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

Introduce a new macro USB_AUDIO_DEVICE() for the entries matching with
the pid/vid pair and the class/subclass, and remove the open-code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks-table.h | 105 ++++++++++-------------------------------------
 1 file changed, 21 insertions(+), 84 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 978f7113bd81..988bb9d00192 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -25,6 +25,16 @@
 	.idProduct = prod, \
 	.bInterfaceClass = USB_CLASS_VENDOR_SPEC
 
+/* A standard entry matching with vid/pid and the audio class/subclass */
+#define USB_AUDIO_DEVICE(vend, prod) \
+	.match_flags = USB_DEVICE_ID_MATCH_DEVICE | \
+		       USB_DEVICE_ID_MATCH_INT_CLASS | \
+		       USB_DEVICE_ID_MATCH_INT_SUBCLASS, \
+	.idVendor = vend, \
+	.idProduct = prod, \
+	.bInterfaceClass = USB_CLASS_AUDIO, \
+	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
+
 /* FTDI devices */
 {
 	USB_DEVICE(0x0403, 0xb8d8),
@@ -127,69 +137,13 @@
  * Logitech QuickCam: bDeviceClass is vendor-specific, so generic interface
  * class matches do not take effect without an explicit ID match.
  */
-{
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
-		       USB_DEVICE_ID_MATCH_INT_CLASS |
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
-	.idVendor = 0x046d,
-	.idProduct = 0x0850,
-	.bInterfaceClass = USB_CLASS_AUDIO,
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
-},
-{
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
-		       USB_DEVICE_ID_MATCH_INT_CLASS |
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
-	.idVendor = 0x046d,
-	.idProduct = 0x08ae,
-	.bInterfaceClass = USB_CLASS_AUDIO,
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
-},
-{
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
-		       USB_DEVICE_ID_MATCH_INT_CLASS |
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
-	.idVendor = 0x046d,
-	.idProduct = 0x08c6,
-	.bInterfaceClass = USB_CLASS_AUDIO,
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
-},
-{
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
-		       USB_DEVICE_ID_MATCH_INT_CLASS |
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
-	.idVendor = 0x046d,
-	.idProduct = 0x08f0,
-	.bInterfaceClass = USB_CLASS_AUDIO,
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
-},
-{
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
-		       USB_DEVICE_ID_MATCH_INT_CLASS |
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
-	.idVendor = 0x046d,
-	.idProduct = 0x08f5,
-	.bInterfaceClass = USB_CLASS_AUDIO,
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
-},
-{
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
-		       USB_DEVICE_ID_MATCH_INT_CLASS |
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
-	.idVendor = 0x046d,
-	.idProduct = 0x08f6,
-	.bInterfaceClass = USB_CLASS_AUDIO,
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
-},
-{
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
-		       USB_DEVICE_ID_MATCH_INT_CLASS |
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
-	.idVendor = 0x046d,
-	.idProduct = 0x0990,
-	.bInterfaceClass = USB_CLASS_AUDIO,
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL,
-},
+{ USB_AUDIO_DEVICE(0x046d, 0x0850) },
+{ USB_AUDIO_DEVICE(0x046d, 0x08ae) },
+{ USB_AUDIO_DEVICE(0x046d, 0x08c6) },
+{ USB_AUDIO_DEVICE(0x046d, 0x08f0) },
+{ USB_AUDIO_DEVICE(0x046d, 0x08f5) },
+{ USB_AUDIO_DEVICE(0x046d, 0x08f6) },
+{ USB_AUDIO_DEVICE(0x046d, 0x0990) },
 
 /*
  * Yamaha devices
@@ -2831,13 +2785,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
  */
 
 #define AU0828_DEVICE(vid, pid, vname, pname) { \
-	.idVendor = vid, \
-	.idProduct = pid, \
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE | \
-		       USB_DEVICE_ID_MATCH_INT_CLASS | \
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS, \
-	.bInterfaceClass = USB_CLASS_AUDIO, \
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL, \
+	USB_AUDIO_DEVICE(vid, pid), \
 	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) { \
 		.vendor_name = vname, \
 		.product_name = pname, \
@@ -2867,13 +2815,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 
 /* Syntek STK1160 */
 {
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
-		       USB_DEVICE_ID_MATCH_INT_CLASS |
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
-	.idVendor = 0x05e1,
-	.idProduct = 0x0408,
-	.bInterfaceClass = USB_CLASS_AUDIO,
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL,
+	USB_AUDIO_DEVICE(0x05e1, 0x0408),
 	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
 		.vendor_name = "Syntek",
 		.product_name = "STK1160",
@@ -3628,13 +3570,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
  * channels to be swapped and out of phase, which is dealt with in quirks.c.
  */
 {
-	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
-		       USB_DEVICE_ID_MATCH_INT_CLASS |
-		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
-	.idVendor = 0x534d,
-	.idProduct = 0x2109,
-	.bInterfaceClass = USB_CLASS_AUDIO,
-	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL,
+	USB_AUDIO_DEVICE(0x534d, 0x2109),
 	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
 		.vendor_name = "MacroSilicon",
 		.product_name = "MS2109",
@@ -3675,3 +3611,4 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 },
 
 #undef USB_DEVICE_VENDOR_SPEC
+#undef USB_AUDIO_DEVICE
-- 
2.16.4


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB4823A863
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 16:28:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 475C7166D;
	Mon,  3 Aug 2020 16:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 475C7166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596464914;
	bh=CeW9c86nQYCB0z66dUL4BPd8RwuOGrxvwlPrrsYTIa0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a2uRbDaWUMLvW7iEs9VprvUIMEfo+76up1Kc1fYXxHHuYmFkpuXoiGvrF73tOW3rt
	 YicFjiDXRzdfBqeJ4MHt/zYm7OOKz3FX6r5qjiYDhX0Kpa4Ryqlze+FUeg9n8Qq620
	 f5aU2wQBMWh03j9qcXcIxiaMK+AcuSDsjxTJs+Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CFBAF800B7;
	Mon,  3 Aug 2020 16:26:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 433FDF80218; Mon,  3 Aug 2020 16:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96485F800B7
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 16:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96485F800B7
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1k2bPs-0006OC-09; Mon, 03 Aug 2020 14:26:16 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: Add support for Lenovo ThinkStation P620
Date: Mon,  3 Aug 2020 22:26:08 +0800
Message-Id: <20200803142612.17156-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Dmitry Panchenko <dmitry@d-systems.ee>, Andrew Oakley <andrew@adoakley.name>,
 open list <linux-kernel@vger.kernel.org>, Ard van Breemen <ard@kwaak.net>,
 Hector Martin <marcan@marcan.st>, Chris Boyle <chris@boyle.name>,
 Alexander Tsoy <alexander@tsoy.me>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>,
 Gregor Pintar <grpintar@gmail.com>, Hui Peng <benquike@gmail.com>
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

Lenovo ThinkStation P620 is like other TRX40 boards, is equipped with
two USB audio cards.

USB device (17aa:104d) provides functionality for Internal Speaker and
Front Headset. It's UAC v2, so it supports insertion control (jack
detection). However, when trying to get the connector status of the
speaker, an error occurs:
[    5.787405] usb 3-1: cannot get connectors status: req = 0x81, wValue = 0x200, wIndex = 0x1000, type = 0

Since the insertion control works perfectly for the headset, the error
for speaker is probably casued by connecting internally. So let's relax
the error for a bit if it's a speaker, and always reports it's connected.

USB device (17aa:1046) is for rear Line-in, Line-out and Microphone.
The insertion control works for all three jacks. However, there's an
Function Unit that doesn't work:
[    5.905415] usb 3-6: cannot get ctl value: req = 0x83, wValue = 0xc00, wIndex = 0x1300, type = 4
[    5.905418] usb 3-6: 19:0: cannot get min/max values for control 12 (id 19)

So turn off the FU to avoid the error.

Also, add specific card name for both devices, so userspace can easily
indentify both cards.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/usb/mixer.c        |  4 ++++
 sound/usb/mixer_maps.c   |  9 +++++++++
 sound/usb/quirks-table.h | 13 +++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index eab0fd4fd7c3..6b0f3a8469ef 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1463,6 +1463,10 @@ static int mixer_ctl_connector_get(struct snd_kcontrol *kcontrol,
 	snd_usb_unlock_shutdown(chip);
 
 	if (ret < 0) {
+		if (strstr(kcontrol->id.name, "Speaker")) {
+			ucontrol->value.integer.value[0] = 1;
+			return 0;
+		}
 error:
 		usb_audio_err(chip,
 			"cannot get connectors status: req = %#x, wValue = %#x, wIndex = %#x, type = %d\n",
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 9af7aa93f6fa..08eb230e2bff 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -370,6 +370,11 @@ static const struct usbmix_name_map asus_rog_map[] = {
 	{}
 };
 
+static const struct usbmix_name_map lenovo_p620_rear_map[] = {
+	{ 19, NULL, 12 }, /* FU, Input Gain Pad */
+	{}
+};
+
 /* TRX40 mobos with Realtek ALC1220-VB */
 static const struct usbmix_name_map trx40_mobo_map[] = {
 	{ 18, NULL }, /* OT, IEC958 - broken response, disabled */
@@ -573,6 +578,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.map = trx40_mobo_map,
 		.connector_map = trx40_mobo_connector_map,
 	},
+	{	/* Lenovo ThinkStation P620 Rear */
+		.id = USB_ID(0x17aa, 0x1046),
+		.map = lenovo_p620_rear_map,
+	},
 	{ 0 } /* terminator */
 };
 
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 9092cc0aa807..09590f055a1d 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2794,6 +2794,19 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	QUIRK_RENAME_DEVICE("Rane", "SL-1")
 },
 
+/* Lenovo ThinkStation P620 Rear Line-in, Line-out and Microphone */
+{
+	USB_DEVICE(0x17aa, 0x1046),
+	QUIRK_DEVICE_PROFILE("Lenovo", "ThinkStation P620 Rear",
+			     "Lenovo-ThinkStation-P620-Rear"),
+},
+/* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
+{
+	USB_DEVICE(0x17aa, 0x104d),
+	QUIRK_DEVICE_PROFILE("Lenovo", "ThinkStation P620 Main",
+			     "Lenovo-ThinkStation-P620-Main"),
+},
+
 /* Native Instruments MK2 series */
 {
 	/* Komplete Audio 6 */
-- 
2.17.1


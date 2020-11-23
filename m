Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 638FA2C020C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:09:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07ACF16CA;
	Mon, 23 Nov 2020 10:08:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07ACF16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122563;
	bh=D7ijhhHSOVoVhU9VWeACkUO8RbzrByXwrB2+Kb/V0hQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lTceC5NIPNL4Wmkk7iJInPpuDEbnmPAhLgmmcqr8LQ9dX1WrcDI6F4vkqoC34vUnY
	 rHNtfwNOSggHUyJfB2R6KuUGI0M+wkAo+3a5KT0cOH3WZZCrCsggwkLue8PR9Nlm2G
	 UWiiIPucHRVs6d4zQ7GBH7+h+DUsZyrXUhKuACMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6DFF80610;
	Mon, 23 Nov 2020 09:55:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA560F80563; Mon, 23 Nov 2020 09:54:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A502AF804EB
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A502AF804EB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00C9AAF8D;
 Mon, 23 Nov 2020 08:53:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 38/41] ALSA: usb-audio: Add generic implicit fb parsing
Date: Mon, 23 Nov 2020 09:53:44 +0100
Message-Id: <20201123085347.19667-39-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

This patch extends the implicit feedback mode parser code to check the
description more generically, so that the quirk entries can be added
without the explicit EP and interface numbers.  The search is done for
the next and the previous interface of the given altset, and if both
entries are ASYNC mode and the direction matches, it just takes as the
sync endpoint.  The generic parser is applicable only for the playback
stream.

As of now, only a few M-Audio devices have been converted to use this
mode.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 5 deletions(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index bc7edecff946..16b1fb55b7b9 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -19,6 +19,7 @@
 
 enum {
 	IMPLICIT_FB_NONE,
+	IMPLICIT_FB_GENERIC,
 	IMPLICIT_FB_FIXED,
 };
 
@@ -30,6 +31,8 @@ struct snd_usb_implicit_fb_match {
 	int type;
 };
 
+#define IMPLICIT_FB_GENERIC_DEV(vend, prod) \
+	{ .id = USB_ID(vend, prod), .type = IMPLICIT_FB_GENERIC }
 #define IMPLICIT_FB_FIXED_DEV(vend, prod, ep, ifnum) \
 	{ .id = USB_ID(vend, prod), .type = IMPLICIT_FB_FIXED, .ep_num = (ep),\
 	    .iface = (ifnum) }
@@ -38,19 +41,22 @@ struct snd_usb_implicit_fb_match {
 
 /* Implicit feedback quirk table for playback */
 static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
+	/* Generic matching */
+	IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2080), /* M-Audio FastTrack Ultra */
+	IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2081), /* M-Audio FastTrack Ultra */
+	IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2030), /* M-Audio Fast Track C400 */
+	IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2031), /* M-Audio Fast Track C600 */
+
 	/* Fixed EP */
+	/* FIXME: check the availability of generic matching */
 	IMPLICIT_FB_FIXED_DEV(0x1397, 0x0001, 0x81, 1), /* Behringer UFX1604 */
 	IMPLICIT_FB_FIXED_DEV(0x1397, 0x0002, 0x81, 1), /* Behringer UFX1204 */
-	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2080, 0x81, 2), /* M-Audio FastTrack Ultra */
-	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2081, 0x81, 2), /* M-Audio FastTrack Ultra */
 	IMPLICIT_FB_FIXED_DEV(0x2466, 0x8010, 0x81, 2), /* Fractal Audio Axe-Fx III */
 	IMPLICIT_FB_FIXED_DEV(0x07fd, 0x0008, 0x81, 2), /* MOTU M Series */
 	IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0001, 0x81, 2), /* Solid State Logic SSL2 */
 	IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0002, 0x81, 2), /* Solid State Logic SSL2+ */
 	IMPLICIT_FB_FIXED_DEV(0x0499, 0x172f, 0x81, 2), /* Steinberg UR22C */
 	IMPLICIT_FB_FIXED_DEV(0x0d9a, 0x00df, 0x81, 2), /* RTX6001 */
-	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2030, 0x81, 3), /* M-Audio Fast Track C400 */
-	IMPLICIT_FB_FIXED_DEV(0x0763, 0x2031, 0x81, 3), /* M-Audio Fast Track C600 */
 	IMPLICIT_FB_FIXED_DEV(0x22f0, 0x0006, 0x81, 3), /* Allen&Heath Qu-16 */
 	IMPLICIT_FB_FIXED_DEV(0x2b73, 0x000a, 0x82, 0), /* Pioneer DJ DJM-900NXS2 */
 	IMPLICIT_FB_FIXED_DEV(0x2b73, 0x0017, 0x82, 0), /* Pioneer DJ DJM-250MK2 */
@@ -75,7 +81,7 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 	{} /* terminator */
 };
 
-/* Implicit feedback quirk table for capture */
+/* Implicit feedback quirk table for capture: only FIXED type */
 static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[] = {
 	IMPLICIT_FB_FIXED_DEV(0x0582, 0x01e5, 0x0d, 0x01), /* BOSS GT-001 */
 
@@ -162,6 +168,47 @@ static int add_roland_implicit_fb(struct snd_usb_audio *chip,
 				       ifnum, alts);
 }
 
+
+static int __add_generic_implicit_fb(struct snd_usb_audio *chip,
+				     struct audioformat *fmt,
+				     int iface, int altset)
+{
+	struct usb_host_interface *alts;
+	struct usb_endpoint_descriptor *epd;
+
+	alts = snd_usb_get_host_interface(chip, iface, altset);
+	if (!alts)
+		return 0;
+
+	if ((alts->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC &&
+	     alts->desc.bInterfaceClass != USB_CLASS_AUDIO) ||
+	    alts->desc.bNumEndpoints < 1)
+		return 0;
+	epd = get_endpoint(alts, 0);
+	if (!usb_endpoint_is_isoc_in(epd) ||
+	    (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC)
+		return 0;
+	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress,
+				       iface, alts);
+}
+
+/* More generic quirk: look for the sync EP next to the data EP */
+static int add_generic_implicit_fb(struct snd_usb_audio *chip,
+				   struct audioformat *fmt,
+				   struct usb_host_interface *alts)
+{
+	if ((fmt->ep_attr & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC)
+		return 0;
+
+	if (__add_generic_implicit_fb(chip, fmt,
+				      alts->desc.bInterfaceNumber + 1,
+				      alts->desc.bAlternateSetting))
+		return 1;
+	return __add_generic_implicit_fb(chip, fmt,
+					 alts->desc.bInterfaceNumber - 1,
+					 alts->desc.bAlternateSetting);
+}
+
 static const struct snd_usb_implicit_fb_match *
 find_implicit_fb_entry(struct snd_usb_audio *chip,
 		       const struct snd_usb_implicit_fb_match *match,
@@ -189,6 +236,8 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 	p = find_implicit_fb_entry(chip, playback_implicit_fb_quirks, alts);
 	if (p) {
 		switch (p->type) {
+		case IMPLICIT_FB_GENERIC:
+			return add_generic_implicit_fb(chip, fmt, alts);
 		case IMPLICIT_FB_NONE:
 			return 0; /* No quirk */
 		case IMPLICIT_FB_FIXED:
-- 
2.16.4


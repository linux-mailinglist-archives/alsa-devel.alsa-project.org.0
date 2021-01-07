Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6249C2ED143
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 15:01:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E342B16A6;
	Thu,  7 Jan 2021 15:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E342B16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610028085;
	bh=HGU85H6WYdvtjGMQem3feTXeY9iqbApEeieiGOur+gA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OeW2V76QrepFAkcX29pswx4XN2PuJot2FwM2aM3Ds42rPguEVdZFoOAA0N4A1jDWr
	 Uix9sRYavtRmtpijkYSZVvHb7uNpWLr4pO6r1kXdWwfthXJK3Fie6laTVXjTo5Fzxp
	 WWCeepumUnVAWUfhXs4v4i2fpjLInYao3a1FskmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D45F804E3;
	Thu,  7 Jan 2021 14:58:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CD30F804C3; Thu,  7 Jan 2021 14:58:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94CD8F80258
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 14:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94CD8F80258
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D248EB722;
 Thu,  7 Jan 2021 13:58:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 5/5] ALSA: usb-audio: Fix implicit feedback sync setup for
 Pioneer devices
Date: Thu,  7 Jan 2021 14:58:01 +0100
Message-Id: <20210107135801.23860-6-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107135801.23860-1-tiwai@suse.de>
References: <20210107135801.23860-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>,
 Geraldo <geraldogabriel@gmail.com>
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

Pioneer devices have both playback and capture streams sharing the
same iface/altsetting, and those need to be paired as implicit
feedback.  Instead of a half-baked (and broken) static quirk entry,
set up more generically for those devices by checking the number of
endpoints and the attribute of the secondary EP.

Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Reported-by: František Kučera <konference@frantovo.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 46 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 9724efe1cdce..2e6fd8cf7a08 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -58,8 +58,6 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 	IMPLICIT_FB_FIXED_DEV(0x0499, 0x172f, 0x81, 2), /* Steinberg UR22C */
 	IMPLICIT_FB_FIXED_DEV(0x0d9a, 0x00df, 0x81, 2), /* RTX6001 */
 	IMPLICIT_FB_FIXED_DEV(0x22f0, 0x0006, 0x81, 3), /* Allen&Heath Qu-16 */
-	IMPLICIT_FB_FIXED_DEV(0x2b73, 0x000a, 0x82, 0), /* Pioneer DJ DJM-900NXS2 */
-	IMPLICIT_FB_FIXED_DEV(0x2b73, 0x0017, 0x82, 0), /* Pioneer DJ DJM-250MK2 */
 	IMPLICIT_FB_FIXED_DEV(0x1686, 0xf029, 0x82, 2), /* Zoom UAC-2 */
 	IMPLICIT_FB_FIXED_DEV(0x2466, 0x8003, 0x86, 2), /* Fractal Audio Axe-Fx II */
 	IMPLICIT_FB_FIXED_DEV(0x0499, 0x172a, 0x86, 2), /* Yamaha MODX */
@@ -100,7 +98,7 @@ static const struct snd_usb_implicit_fb_match capture_implicit_fb_quirks[] = {
 /* set up sync EP information on the audioformat */
 static int add_implicit_fb_sync_ep(struct snd_usb_audio *chip,
 				   struct audioformat *fmt,
-				   int ep, int ifnum,
+				   int ep, int ep_idx, int ifnum,
 				   const struct usb_host_interface *alts)
 {
 	struct usb_interface *iface;
@@ -115,7 +113,7 @@ static int add_implicit_fb_sync_ep(struct snd_usb_audio *chip,
 	fmt->sync_ep = ep;
 	fmt->sync_iface = ifnum;
 	fmt->sync_altsetting = alts->desc.bAlternateSetting;
-	fmt->sync_ep_idx = 0;
+	fmt->sync_ep_idx = ep_idx;
 	fmt->implicit_fb = 1;
 	usb_audio_dbg(chip,
 		      "%d:%d: added %s implicit_fb sync_ep %x, iface %d:%d\n",
@@ -147,7 +145,7 @@ static int add_generic_uac2_implicit_fb(struct snd_usb_audio *chip,
 	    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
 					USB_ENDPOINT_USAGE_IMPLICIT_FB)
 		return 0;
-	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress,
+	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 0,
 				       ifnum, alts);
 }
 
@@ -173,10 +171,30 @@ static int add_roland_implicit_fb(struct snd_usb_audio *chip,
 	    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
 					USB_ENDPOINT_USAGE_IMPLICIT_FB)
 		return 0;
-	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress,
+	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 0,
 				       ifnum, alts);
 }
 
+/* Pioneer devices: playback and capture streams sharing the same iface/altset
+ */
+static int add_pioneer_implicit_fb(struct snd_usb_audio *chip,
+				   struct audioformat *fmt,
+				   struct usb_host_interface *alts)
+{
+	struct usb_endpoint_descriptor *epd;
+
+	if (alts->desc.bNumEndpoints != 2)
+		return 0;
+
+	epd = get_endpoint(alts, 1);
+	if (!usb_endpoint_is_isoc_in(epd) ||
+	    (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC ||
+	    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
+					USB_ENDPOINT_USAGE_IMPLICIT_FB)
+		return 0;
+	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 1,
+				       alts->desc.bInterfaceNumber, alts);
+}
 
 static int __add_generic_implicit_fb(struct snd_usb_audio *chip,
 				     struct audioformat *fmt,
@@ -197,7 +215,7 @@ static int __add_generic_implicit_fb(struct snd_usb_audio *chip,
 	if (!usb_endpoint_is_isoc_in(epd) ||
 	    (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC)
 		return 0;
-	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress,
+	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 0,
 				       iface, alts);
 }
 
@@ -250,7 +268,7 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 		case IMPLICIT_FB_NONE:
 			return 0; /* No quirk */
 		case IMPLICIT_FB_FIXED:
-			return add_implicit_fb_sync_ep(chip, fmt, p->ep_num,
+			return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
 						       p->iface, NULL);
 		}
 	}
@@ -278,6 +296,14 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 			return 1;
 	}
 
+	/* Pioneer devices implicit feedback with vendor spec class */
+	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
+	    alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
+	    USB_ID_VENDOR(chip->usb_id) == 0x2b73 /* Pioneer */) {
+		if (add_pioneer_implicit_fb(chip, fmt, alts))
+			return 1;
+	}
+
 	/* Try the generic implicit fb if available */
 	if (chip->generic_implicit_fb)
 		return add_generic_implicit_fb(chip, fmt, alts);
@@ -295,8 +321,8 @@ static int audioformat_capture_quirk(struct snd_usb_audio *chip,
 
 	p = find_implicit_fb_entry(chip, capture_implicit_fb_quirks, alts);
 	if (p && p->type == IMPLICIT_FB_FIXED)
-		return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, p->iface,
-					       NULL);
+		return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
+					       p->iface, NULL);
 	return 0;
 }
 
-- 
2.26.2


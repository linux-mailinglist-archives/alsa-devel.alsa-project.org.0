Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC6236473B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 17:41:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41FD3168A;
	Mon, 19 Apr 2021 17:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41FD3168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618846861;
	bh=d+M1D7hsnYgvOBNuOszfp2EwGF2QT94PjNy5Z7rNDME=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rKT7RsCGmZh4bjejZvJ3Uw9N/ZB+/u3TKpeXCP219AfddJLWUmFtVCMF++ZmNpsmZ
	 u4SAV2C92l1kIX8GeNDtlHjS9mX6vVGPldMbq9LwAL7JpF84dWCj5AAauy40n90Tu5
	 jXtquGeVf/k1ye4yyejd4uWltkil52UXtc4oNseM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29256F80227;
	Mon, 19 Apr 2021 17:39:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4366F80274; Mon, 19 Apr 2021 17:39:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51B35F80227
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 17:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51B35F80227
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74428AF23
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 15:39:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: usb-audio: Re-apply implicit feedback mode to
 Pioneer devices
Date: Mon, 19 Apr 2021 17:39:18 +0200
Message-Id: <20210419153918.450-1-tiwai@suse.de>
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

Pioneer devices are supposed to be working with the implicit feedback
mode, but so far the attempt to apply the implicit feedback caused
issues, hence we explicitly skipped the implicit feedback mode for
them.  Recently, Geraldo discovered that the device actually works if
you skip the generic matching of the sync EPs for the capture stream.
That is, we should apply the implicit feedback setup for the playback
like other similar devices, while we need to return 1 from
audioformat_capture_quirk() so that no further matching will be done.

And, later on, Olivia reported later that the fiddling with the
capture quirk alone doesn't suffice for the test with speaker-test
program.  This seems to be a similar case like the recently fixed BOSS
devices.  Indeed, the problem could be addressed by setting
playback_first flag, which indicates that the playback URBs have to be
sent out at first even in the implicit feedback mode.

This patch implements the application of the implicit feedback to
Pioneer devices as described in the above.  The former
skip_pioneer_sync_ep() was dropped, and instead we provide
is_pioneer_implicit_fb() to check the Pioneer devices that need the
implicit feedback.  In the audioformat_implicit_fb_quirk(), simply
apply the implicit fb for playback and set chip->playback_first flag
if matching, and in audioformat_capture_quirk()(), it returns 1 for
skipping the generic EP sync handling.

Reported-by: Geraldo <geraldogabriel@gmail.com>
Tested-by: Olivia Mackintosh <livvy@base.nu>
Link: https://lore.kernel.org/r/s5ha6pygqfz.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 428e3a449f5d..77ffcea294dd 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -230,18 +230,27 @@ static int add_roland_implicit_fb(struct snd_usb_audio *chip,
 				       ifnum, alts);
 }
 
-/* Playback and capture EPs on Pioneer devices share the same iface/altset,
- * but they don't seem working with the implicit fb mode well, hence we
- * just return as if the sync were already set up.
+/* Playback and capture EPs on Pioneer devices share the same iface/altset
+ * for the implicit feedback operation
  */
-static int skip_pioneer_sync_ep(struct snd_usb_audio *chip,
-				struct audioformat *fmt,
-				struct usb_host_interface *alts)
+static bool is_pioneer_implicit_fb(struct snd_usb_audio *chip,
+				   struct usb_host_interface *alts)
+
 {
 	struct usb_endpoint_descriptor *epd;
 
+	if (USB_ID_VENDOR(chip->usb_id) != 0x2b73 &&
+	    USB_ID_VENDOR(chip->usb_id) != 0x08e4)
+		return false;
+	if (alts->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC)
+		return false;
 	if (alts->desc.bNumEndpoints != 2)
-		return 0;
+		return false;
+
+	epd = get_endpoint(alts, 0);
+	if (!usb_endpoint_is_isoc_out(epd) ||
+	    (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC)
+		return false;
 
 	epd = get_endpoint(alts, 1);
 	if (!usb_endpoint_is_isoc_in(epd) ||
@@ -250,8 +259,9 @@ static int skip_pioneer_sync_ep(struct snd_usb_audio *chip,
 	     USB_ENDPOINT_USAGE_DATA &&
 	     (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
 	     USB_ENDPOINT_USAGE_IMPLICIT_FB))
-		return 0;
-	return 1; /* don't handle with the implicit fb, just skip sync EP */
+		return false;
+
+	return true;
 }
 
 static int __add_generic_implicit_fb(struct snd_usb_audio *chip,
@@ -367,12 +377,12 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 	}
 
 	/* Pioneer devices with vendor spec class */
-	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
-	    alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
-	    (USB_ID_VENDOR(chip->usb_id) == 0x2b73 || /* Pioneer */
-	     USB_ID_VENDOR(chip->usb_id) == 0x08e4    /* Pioneer */)) {
-		if (skip_pioneer_sync_ep(chip, fmt, alts))
-			return 1;
+	if (is_pioneer_implicit_fb(chip, alts)) {
+		chip->playback_first = 1;
+		return add_implicit_fb_sync_ep(chip, fmt,
+					       get_endpoint(alts, 1)->bEndpointAddress,
+					       1, alts->desc.bInterfaceNumber,
+					       alts);
 	}
 
 	/* Try the generic implicit fb if available */
@@ -394,6 +404,8 @@ static int audioformat_capture_quirk(struct snd_usb_audio *chip,
 	if (p && (p->type == IMPLICIT_FB_FIXED || p->type == IMPLICIT_FB_BOTH))
 		return add_implicit_fb_sync_ep(chip, fmt, p->ep_num, 0,
 					       p->iface, NULL);
+	if (is_pioneer_implicit_fb(chip, alts))
+		return 1; /* skip the quirk, also don't handle generic sync EP */
 	return 0;
 }
 
-- 
2.26.2


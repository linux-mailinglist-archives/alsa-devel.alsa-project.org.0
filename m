Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC5F2F9AE3
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 09:00:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DA3417D7;
	Mon, 18 Jan 2021 08:59:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DA3417D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610956818;
	bh=4Aj57nA/nSaRgNaq2TKdelYPNp1vcrFat+ZR4fQt7sI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FQbUuANXo1zUiIngayCy/MtwHO4myZYdyGqSESsmMEyRTtjzwHCqWKMA+0R2HpfNd
	 x4obhYC8NiXoGnHlvnm975mmFb0kiRm3Fgiy+L9o4+pM3M3zTKHhyv35cM2yiO9FsE
	 ee50Ay+l53WqqpjpqTRLJx3MJvpDPU1tEpldeSpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 774B3F80253;
	Mon, 18 Jan 2021 08:58:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F34A6F804BD; Mon, 18 Jan 2021 08:58:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86B1EF800C0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 08:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86B1EF800C0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98A11ACAD;
 Mon, 18 Jan 2021 07:58:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: usb-audio: Avoid implicit feedback on Pioneer
 devices
Date: Mon, 18 Jan 2021 08:58:16 +0100
Message-Id: <20210118075816.25068-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118075816.25068-1-tiwai@suse.de>
References: <20210118075816.25068-1-tiwai@suse.de>
MIME-Version: 1.0
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

For addressing the regression on Pioneer devices, we recently
corrected the quirk code to enable the implicit feedback mode on those
devices properly.  However, the devices still showed problems with the
full duplex operations with JACK, and after debug sessions, we figured
out that the older kernels that had worked with JACK also didn't use
the implicit feedback mode at all although they had the quirk code to
enable it; instead, the old code worked just to skip the normal sync
endpoint setup that would have been detected without it.  IOW, what
broke without the implicit-fb quirk in the past was the application of
the normal sync endpoint that is actually the capture data endpoint on
these devices.

This patch covers the overseen piece: it modifies the quirk code again
not to enable the implicit feedback mode but just to make the driver
skipping the sync endpoint detection.  This made the driver working
with JACK full-duplex mode again.

Still it's not quite clear why the implicit feedback doesn't work on
those devices yet; maybe it's about some issues in the URB setup.  But
at least, with this patch, the driver should work in the level of the
older kernels again.

Fixes: 167c9dc84ec3 ("ALSA: usb-audio: Fix implicit feedback sync setup for Pioneer devices")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/implicit.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 1ac2cc6c33fb..521cc846d9d9 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -175,11 +175,13 @@ static int add_roland_implicit_fb(struct snd_usb_audio *chip,
 				       ifnum, alts);
 }
 
-/* Pioneer devices: playback and capture streams sharing the same iface/altset
+/* Playback and capture EPs on Pioneer devices share the same iface/altset,
+ * but they don't seem working with the implicit fb mode well, hence we
+ * just return as if the sync were already set up.
  */
-static int add_pioneer_implicit_fb(struct snd_usb_audio *chip,
-				   struct audioformat *fmt,
-				   struct usb_host_interface *alts)
+static int skip_pioneer_sync_ep(struct snd_usb_audio *chip,
+				struct audioformat *fmt,
+				struct usb_host_interface *alts)
 {
 	struct usb_endpoint_descriptor *epd;
 
@@ -194,8 +196,7 @@ static int add_pioneer_implicit_fb(struct snd_usb_audio *chip,
 	     (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
 	     USB_ENDPOINT_USAGE_IMPLICIT_FB))
 		return 0;
-	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 1,
-				       alts->desc.bInterfaceNumber, alts);
+	return 1; /* don't handle with the implicit fb, just skip sync EP */
 }
 
 static int __add_generic_implicit_fb(struct snd_usb_audio *chip,
@@ -298,11 +299,11 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 			return 1;
 	}
 
-	/* Pioneer devices implicit feedback with vendor spec class */
+	/* Pioneer devices with vendor spec class */
 	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
 	    alts->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
 	    USB_ID_VENDOR(chip->usb_id) == 0x2b73 /* Pioneer */) {
-		if (add_pioneer_implicit_fb(chip, fmt, alts))
+		if (skip_pioneer_sync_ep(chip, fmt, alts))
 			return 1;
 	}
 
-- 
2.26.2


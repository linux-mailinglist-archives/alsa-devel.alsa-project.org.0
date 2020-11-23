Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 888CF2C01C6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 09:56:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F9F31614;
	Mon, 23 Nov 2020 09:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F9F31614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606121803;
	bh=bM4jYkikz7Y+RT2LwD0nC/BvG51BN4zANxI85oTXYk4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JwGloUHAv9WvgvsCnEjOph8v3hZ+l+DMaHILSmTQ9h3FE17DL06LXkw/0mM7aB/C6
	 dtZn38cN8y0IgAWgWQWXH4oQmZdPOMXd7whrLIb7ixhd7GaO4jMteKcZLcrzAiIZ1t
	 tlnJHEontC07QwPs4dgIqCkz2R+Ko+RoQsa73kqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF2E6F8051C;
	Mon, 23 Nov 2020 09:54:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 012D0F8050F; Mon, 23 Nov 2020 09:54:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7A8FF80268
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7A8FF80268
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1118AAF8D;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/41] ALSA: usb-audio: Check implicit feedback EP generically
 for UAC2
Date: Mon, 23 Nov 2020 09:53:10 +0100
Message-Id: <20201123085347.19667-5-tiwai@suse.de>
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

It seems that many UAC2 devices are with the implicit feedback, but
they couldn't be probed properly because the assumption the driver
takes currently isn't applied: they have the single endpoint for both
data and implicit-fb streams, while we checked only the classical sync
endpoints assigned to the next altsetting in the same interface.

This patch extends the search to match with those typical cases where
the implicit fb stream is found in the next interface number.

While we're at it, slightly refactor the code, not returning 0/-ERROR
but use the standard bool to success/failur, which is more intuitive
in this particular case.

Reported-by: Dylan Robinson <dylan_robinson@motu.com>
Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 83 +++++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 66 insertions(+), 17 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 380d7275d187..2b11c2c837bf 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -272,33 +272,70 @@ static int snd_usb_pcm_sync_stop(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int search_roland_implicit_fb(struct usb_device *dev, int ifnum,
-				     unsigned int altsetting,
-				     struct usb_host_interface **alts,
-				     unsigned int *ep)
+/* Check whether the given iface:altsetting points to an implicit fb source */
+static bool search_generic_implicit_fb(struct usb_device *dev, int ifnum,
+				       unsigned int altsetting,
+				       struct usb_host_interface **altsp,
+				       unsigned int *ep)
 {
 	struct usb_interface *iface;
+	struct usb_host_interface *alts;
+	struct usb_interface_descriptor *altsd;
+	struct usb_endpoint_descriptor *epd;
+
+	iface = usb_ifnum_to_if(dev, ifnum);
+	if (!iface)
+		return false;
+	alts = usb_altnum_to_altsetting(iface, altsetting);
+	if (!alts)
+		return false;
+	altsd = get_iface_desc(alts);
+	if (altsd->bInterfaceClass != USB_CLASS_AUDIO ||
+	    altsd->bInterfaceSubClass != USB_SUBCLASS_AUDIOSTREAMING ||
+	    altsd->bInterfaceProtocol != UAC_VERSION_2 ||
+	    altsd->bNumEndpoints < 1)
+		return false;
+	epd = get_endpoint(alts, 0);
+	if (!usb_endpoint_is_isoc_in(epd) ||
+	    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
+					USB_ENDPOINT_USAGE_IMPLICIT_FB)
+		return false;
+	*ep = epd->bEndpointAddress;
+	*altsp = alts;
+	return true;
+}
+
+/* Like the function above, but specific to Roland with vendor class and hack */
+static bool search_roland_implicit_fb(struct usb_device *dev, int ifnum,
+				      unsigned int altsetting,
+				      struct usb_host_interface **altsp,
+				      unsigned int *ep)
+{
+	struct usb_interface *iface;
+	struct usb_host_interface *alts;
 	struct usb_interface_descriptor *altsd;
 	struct usb_endpoint_descriptor *epd;
 
 	iface = usb_ifnum_to_if(dev, ifnum);
-	if (!iface || iface->num_altsetting < altsetting + 1)
-		return -ENOENT;
-	*alts = &iface->altsetting[altsetting];
-	altsd = get_iface_desc(*alts);
-	if (altsd->bAlternateSetting != altsetting ||
-	    altsd->bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
+	if (!iface)
+		return false;
+	alts = usb_altnum_to_altsetting(iface, altsetting);
+	if (!alts)
+		return false;
+	altsd = get_iface_desc(alts);
+	if (altsd->bInterfaceClass != USB_CLASS_VENDOR_SPEC ||
 	    (altsd->bInterfaceSubClass != 2 &&
-	     altsd->bInterfaceProtocol != 2   ) ||
+	     altsd->bInterfaceProtocol != 2) ||
 	    altsd->bNumEndpoints < 1)
-		return -ENOENT;
-	epd = get_endpoint(*alts, 0);
+		return false;
+	epd = get_endpoint(alts, 0);
 	if (!usb_endpoint_is_isoc_in(epd) ||
 	    (epd->bmAttributes & USB_ENDPOINT_USAGE_MASK) !=
 					USB_ENDPOINT_USAGE_IMPLICIT_FB)
-		return -ENOENT;
+		return false;
 	*ep = epd->bEndpointAddress;
-	return 0;
+	*altsp = alts;
+	return true;
 }
 
 /* Setup an implicit feedback endpoint from a quirk. Returns 0 if no quirk
@@ -375,6 +412,19 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 		return 0;
 	}
 
+	/* Generic UAC2 implicit feedback */
+	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
+	    altsd->bInterfaceClass == USB_CLASS_AUDIO &&
+	    altsd->bInterfaceProtocol == UAC_VERSION_2 &&
+	    altsd->bNumEndpoints == 1) {
+		ifnum = altsd->bInterfaceNumber + 1;
+		if (search_generic_implicit_fb(dev, ifnum,
+					       altsd->bAlternateSetting,
+					       &alts, &ep))
+			goto add_sync_ep;
+	}
+
+	/* Roland/BOSS implicit feedback with vendor spec class */
 	if (attr == USB_ENDPOINT_SYNC_ASYNC &&
 	    altsd->bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
 	    altsd->bInterfaceProtocol == 2 &&
@@ -382,9 +432,8 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 	    USB_ID_VENDOR(subs->stream->chip->usb_id) == 0x0582 /* Roland */ &&
 	    search_roland_implicit_fb(dev, altsd->bInterfaceNumber + 1,
 				      altsd->bAlternateSetting,
-				      &alts, &ep) >= 0) {
+				      &alts, &ep))
 		goto add_sync_ep;
-	}
 
 	/* No quirk */
 	return 0;
-- 
2.16.4


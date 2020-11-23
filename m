Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA522C01E6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:03:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58A8C16BF;
	Mon, 23 Nov 2020 10:02:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58A8C16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122225;
	bh=LTlV4Qsp2M3OvDAp8Xrts5qsqecMpex9CSrpDOQ0woM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WIYNc1soQKzy/JPONFZUDyOomOJyd1bFQay+6PQFrvPlMvAiPQIdj/KtHiFEmXWJF
	 cyv1voMOeL/E0LBOrRqQAhVEFvr125PjK0tZQuQEKMiH8ZMrOQAuOOXebqMbqX2m4r
	 1F710pew1sC/HfOr5oVPgtBa4AB2DjdFKfxrje3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39D26F8015F;
	Mon, 23 Nov 2020 09:54:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02664F804D6; Mon, 23 Nov 2020 09:54:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BDB5F804CA
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BDB5F804CA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BECEBAFB5;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/41] ALSA: usb-audio: Add snd_usb_get_host_interface() helper
Date: Mon, 23 Nov 2020 09:53:22 +0100
Message-Id: <20201123085347.19667-17-tiwai@suse.de>
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

Add a helper function to retrieve the usb_host_interface object from
the given interface and altsetting number pair, which is a commonly
used procedure in the driver code.

No functional changes, just minor code refactoring.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/helper.c | 10 ++++++++++
 sound/usb/helper.h |  3 +++
 sound/usb/pcm.c    | 38 +++++++++++---------------------------
 3 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index cf92d7110773..a4410267bf70 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -121,3 +121,13 @@ unsigned char snd_usb_parse_datainterval(struct snd_usb_audio *chip,
 	return 0;
 }
 
+struct usb_host_interface *
+snd_usb_get_host_interface(struct snd_usb_audio *chip, int ifnum, int altsetting)
+{
+	struct usb_interface *iface;
+
+	iface = usb_ifnum_to_if(chip->dev, ifnum);
+	if (!iface)
+		return NULL;
+	return usb_altnum_to_altsetting(iface, altsetting);
+}
diff --git a/sound/usb/helper.h b/sound/usb/helper.h
index f5b4c6647e4d..e2b51ec96ec6 100644
--- a/sound/usb/helper.h
+++ b/sound/usb/helper.h
@@ -14,6 +14,9 @@ int snd_usb_ctl_msg(struct usb_device *dev, unsigned int pipe,
 unsigned char snd_usb_parse_datainterval(struct snd_usb_audio *chip,
 					 struct usb_host_interface *alts);
 
+struct usb_host_interface *
+snd_usb_get_host_interface(struct snd_usb_audio *chip, int ifnum, int altsetting);
+
 /*
  * retrieve usb_interface descriptor from the host interface
  * (conditional for compatibility with the older API)
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 392aa1cba61c..b0961ebd71f4 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -289,20 +289,16 @@ static int snd_usb_pcm_sync_stop(struct snd_pcm_substream *substream)
 }
 
 /* Check whether the given iface:altsetting points to an implicit fb source */
-static bool search_generic_implicit_fb(struct usb_device *dev, int ifnum,
+static bool search_generic_implicit_fb(struct snd_usb_audio *chip, int ifnum,
 				       unsigned int altsetting,
 				       struct usb_host_interface **altsp,
 				       unsigned int *ep)
 {
-	struct usb_interface *iface;
 	struct usb_host_interface *alts;
 	struct usb_interface_descriptor *altsd;
 	struct usb_endpoint_descriptor *epd;
 
-	iface = usb_ifnum_to_if(dev, ifnum);
-	if (!iface)
-		return false;
-	alts = usb_altnum_to_altsetting(iface, altsetting);
+	alts = snd_usb_get_host_interface(chip, ifnum, altsetting);
 	if (!alts)
 		return false;
 	altsd = get_iface_desc(alts);
@@ -322,20 +318,16 @@ static bool search_generic_implicit_fb(struct usb_device *dev, int ifnum,
 }
 
 /* Like the function above, but specific to Roland with vendor class and hack */
-static bool search_roland_implicit_fb(struct usb_device *dev, int ifnum,
+static bool search_roland_implicit_fb(struct snd_usb_audio *chip, int ifnum,
 				      unsigned int altsetting,
 				      struct usb_host_interface **altsp,
 				      unsigned int *ep)
 {
-	struct usb_interface *iface;
 	struct usb_host_interface *alts;
 	struct usb_interface_descriptor *altsd;
 	struct usb_endpoint_descriptor *epd;
 
-	iface = usb_ifnum_to_if(dev, ifnum);
-	if (!iface)
-		return false;
-	alts = usb_altnum_to_altsetting(iface, altsetting);
+	alts = snd_usb_get_host_interface(chip, ifnum, altsetting);
 	if (!alts)
 		return false;
 	altsd = get_iface_desc(alts);
@@ -359,11 +351,11 @@ static bool search_roland_implicit_fb(struct usb_device *dev, int ifnum,
  */
 static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 					 struct audioformat *fmt,
-					 struct usb_interface *iface,
 					 struct usb_host_interface *alts)
 {
 	struct usb_device *dev = chip->dev;
 	struct usb_interface_descriptor *altsd = get_iface_desc(alts);
+	struct usb_interface *iface;
 	unsigned int attr = fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
 	unsigned int ep;
 	unsigned int ifnum;
@@ -431,7 +423,7 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 	    altsd->bInterfaceProtocol == UAC_VERSION_2 &&
 	    altsd->bNumEndpoints == 1) {
 		ifnum = altsd->bInterfaceNumber + 1;
-		if (search_generic_implicit_fb(dev, ifnum,
+		if (search_generic_implicit_fb(chip, ifnum,
 					       altsd->bAlternateSetting,
 					       &alts, &ep))
 			goto add_sync_ep;
@@ -444,7 +436,7 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 	    altsd->bNumEndpoints == 1 &&
 	    USB_ID_VENDOR(chip->usb_id) == 0x0582 /* Roland */) {
 		ifnum = altsd->bInterfaceNumber + 1;
-		if (search_roland_implicit_fb(dev, ifnum,
+		if (search_roland_implicit_fb(chip, ifnum,
 					      altsd->bAlternateSetting,
 					      &alts, &ep))
 			goto add_sync_ep;
@@ -477,24 +469,20 @@ int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 				    struct audioformat *fmt)
 {
 	struct usb_device *dev = chip->dev;
-	struct usb_interface *iface;
 	struct usb_host_interface *alts;
 	struct usb_interface_descriptor *altsd;
 	unsigned int ep, attr, sync_attr;
 	bool is_playback;
 	int err;
 
-	iface = usb_ifnum_to_if(dev, fmt->iface);
-	if (!iface)
-		return 0;
-	alts = usb_altnum_to_altsetting(iface, fmt->altsetting);
+	alts = snd_usb_get_host_interface(chip, fmt->iface, fmt->altsetting);
 	if (!alts)
 		return 0;
 	altsd = get_iface_desc(alts);
 
 	is_playback = !(get_endpoint(alts, 0)->bEndpointAddress & USB_DIR_IN);
 	if (is_playback) {
-		err = audioformat_implicit_fb_quirk(chip, fmt, iface, alts);
+		err = audioformat_implicit_fb_quirk(chip, fmt, alts);
 		if (err > 0)
 			return 0;
 	}
@@ -564,7 +552,6 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 			     struct audioformat *fmt)
 {
 	struct usb_device *dev = subs->dev;
-	struct usb_interface *iface;
 	struct usb_host_interface *alts;
 	int is_playback = subs->direction == SNDRV_PCM_STREAM_PLAYBACK;
 	unsigned int ep;
@@ -577,11 +564,8 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 	if (!ep)
 		return 0;
 
-	iface = usb_ifnum_to_if(dev, fmt->sync_iface);
-	if (!iface)
-		return 0;
-
-	alts = usb_altnum_to_altsetting(iface, fmt->altsetting);
+	alts = snd_usb_get_host_interface(subs->stream->chip, fmt->sync_iface,
+					  fmt->altsetting);
 	if (!alts)
 		return 0;
 
-- 
2.16.4


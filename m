Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D2D2C01CE
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 09:59:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA361670;
	Mon, 23 Nov 2020 09:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA361670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606121998;
	bh=Xmq5ZYug4yaLYVEV7AmoECxqIPIOoG3DlD5NkYoW9Fc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSoe/EdAq8ktnUv/NqaZ2/+XibU3/LTZfGvCDKeLESG7vLIW4ewH8FAIftvoe5FXt
	 ua86bexdzIa1QUGJS0np9SPnVaynPCjsYuYAjF5+Us4trJv6BrFRnJjq4eGkrAAHof
	 cNsQpXtAFqT9it9On2HmbsNtfJ79Zz/YZB3w8TBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D41DF8053B;
	Mon, 23 Nov 2020 09:54:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57A89F80525; Mon, 23 Nov 2020 09:54:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3692FF804B4
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3692FF804B4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E01BAF94;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/41] ALSA: usb-audio: Track implicit fb sync endpoint in
 audioformat list
Date: Mon, 23 Nov 2020 09:53:14 +0100
Message-Id: <20201123085347.19667-9-tiwai@suse.de>
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

Instead of parsing and evaluating the sync endpoint and the implicit
feedback mode at each time the audio stream is opened, let's parse it
once at the probe time, as the all needed information can be obtained
statically from the descriptor or from the quirk.

This patch extends audioformat struct to record the sync endpoint,
interface and altsetting as well as the implicit feedback flag, which
are filled at parsing the streams.  Then, set_sync_endpoint() is much
simplified just to follow the already parsed data.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h   |   4 ++
 sound/usb/pcm.c    | 149 +++++++++++++++++++++++++++++++++--------------------
 sound/usb/pcm.h    |   2 +
 sound/usb/stream.c |   2 +
 4 files changed, 100 insertions(+), 57 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 3cc668f98f43..898a283576df 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -22,6 +22,10 @@ struct audioformat {
 	unsigned char attributes;	/* corresponding attributes of cs endpoint */
 	unsigned char endpoint;		/* endpoint */
 	unsigned char ep_attr;		/* endpoint attributes */
+	bool implicit_fb;		/* implicit feedback endpoint */
+	unsigned char sync_ep;		/* sync endpoint number */
+	unsigned char sync_iface;	/* sync EP interface */
+	unsigned char sync_altsetting;	/* sync EP alternate setting */
 	unsigned char datainterval;	/* log_2 of data packet interval */
 	unsigned char protocol;		/* UAC_VERSION_1/2/3 */
 	unsigned int maxpacksize;	/* max. packet size */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 8f4fe65d5c37..fea2764163b4 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -349,21 +349,18 @@ static bool search_roland_implicit_fb(struct usb_device *dev, int ifnum,
 /* Setup an implicit feedback endpoint from a quirk. Returns 0 if no quirk
  * applies. Returns 1 if a quirk was found.
  */
-static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
-					 struct usb_device *dev,
-					 struct usb_interface_descriptor *altsd,
-					 unsigned int attr)
+static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
+					 struct audioformat *fmt,
+					 struct usb_interface *iface,
+					 struct usb_host_interface *alts)
 {
-	struct usb_host_interface *alts;
-	struct usb_interface *iface;
+	struct usb_device *dev = chip->dev;
+	struct usb_interface_descriptor *altsd = get_iface_desc(alts);
+	unsigned int attr = fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
 	unsigned int ep;
 	unsigned int ifnum;
 
-	/* Implicit feedback sync EPs consumers are always playback EPs */
-	if (subs->direction != SNDRV_PCM_STREAM_PLAYBACK)
-		return 0;
-
-	switch (subs->stream->chip->usb_id) {
+	switch (chip->usb_id) {
 	case USB_ID(0x0763, 0x2030): /* M-Audio Fast Track C400 */
 	case USB_ID(0x0763, 0x2031): /* M-Audio Fast Track C600 */
 	case USB_ID(0x22f0, 0x0006): /* Allen&Heath Qu-16 */
@@ -437,11 +434,13 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 	    altsd->bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
 	    altsd->bInterfaceProtocol == 2 &&
 	    altsd->bNumEndpoints == 1 &&
-	    USB_ID_VENDOR(subs->stream->chip->usb_id) == 0x0582 /* Roland */ &&
-	    search_roland_implicit_fb(dev, altsd->bInterfaceNumber + 1,
-				      altsd->bAlternateSetting,
-				      &alts, &ep))
-		goto add_sync_ep;
+	    USB_ID_VENDOR(chip->usb_id) == 0x0582 /* Roland */) {
+		ifnum = altsd->bInterfaceNumber + 1;
+		if (search_roland_implicit_fb(dev, ifnum,
+					      altsd->bAlternateSetting,
+					      &alts, &ep))
+			goto add_sync_ep;
+	}
 
 	/* No quirk */
 	return 0;
@@ -450,56 +449,59 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 	iface = usb_ifnum_to_if(dev, ifnum);
 
 	if (!iface || iface->num_altsetting < 2)
-		return -EINVAL;
+		return 0;
 
 	alts = &iface->altsetting[1];
 
 add_sync_ep:
-	subs->sync_endpoint = snd_usb_add_endpoint(subs->stream->chip,
-						   alts, ep, !subs->direction,
-						   SND_USB_ENDPOINT_TYPE_DATA);
-	if (!subs->sync_endpoint)
-		return -EINVAL;
-
-	subs->sync_endpoint->is_implicit_feedback = 1;
-
-	subs->data_endpoint->sync_master = subs->sync_endpoint;
+	fmt->sync_ep = ep;
+	fmt->sync_iface = ifnum;
+	fmt->sync_altsetting = alts->desc.bAlternateSetting;
+	fmt->implicit_fb = 1;
+	dev_dbg(&dev->dev, "%d:%d: found implicit_fb sync_ep=%x, iface=%d, alt=%d\n",
+		fmt->iface, fmt->altsetting, fmt->sync_ep, fmt->sync_iface,
+		fmt->sync_altsetting);
 
 	return 1;
 }
 
-static int set_sync_endpoint(struct snd_usb_substream *subs,
-			     struct audioformat *fmt,
-			     struct usb_device *dev,
-			     struct usb_host_interface *alts,
-			     struct usb_interface_descriptor *altsd)
+int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
+				    struct audioformat *fmt)
 {
-	int is_playback = subs->direction == SNDRV_PCM_STREAM_PLAYBACK;
-	unsigned int ep, attr;
-	bool implicit_fb;
+	struct usb_device *dev = chip->dev;
+	struct usb_interface *iface;
+	struct usb_host_interface *alts;
+	struct usb_interface_descriptor *altsd;
+	unsigned int ep, attr, sync_attr;
+	bool is_playback;
 	int err;
 
-	attr = fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
-
-	subs->sync_endpoint = NULL;
-	subs->data_endpoint->sync_master = NULL;
-
-	err = set_sync_ep_implicit_fb_quirk(subs, dev, altsd, attr);
-	if (err < 0)
-		return err;
-
-	/* endpoint set by quirk */
-	if (err > 0)
+	iface = usb_ifnum_to_if(dev, fmt->iface);
+	if (!iface)
+		return 0;
+	alts = usb_altnum_to_altsetting(iface, fmt->altsetting);
+	if (!alts)
 		return 0;
+	altsd = get_iface_desc(alts);
+
+	is_playback = !(get_endpoint(alts, 0)->bEndpointAddress & USB_DIR_IN);
+	if (is_playback) {
+		err = audioformat_implicit_fb_quirk(chip, fmt, iface, alts);
+		if (err > 0)
+			return 0;
+	}
 
 	if (altsd->bNumEndpoints < 2)
 		return 0;
 
+	attr = fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
 	if ((is_playback && (attr == USB_ENDPOINT_SYNC_SYNC ||
 			     attr == USB_ENDPOINT_SYNC_ADAPTIVE)) ||
 	    (!is_playback && attr != USB_ENDPOINT_SYNC_ADAPTIVE))
 		return 0;
 
+	sync_attr = get_endpoint(alts, 1)->bmAttributes;
+
 	/*
 	 * In case of illegal SYNC_NONE for OUT endpoint, we keep going to see
 	 * if we don't find a sync endpoint, as on M-Audio Transit. In case of
@@ -510,7 +512,7 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 	/* ... and check descriptor size before accessing bSynchAddress
 	   because there is a version of the SB Audigy 2 NX firmware lacking
 	   the audio fields in the endpoint descriptors */
-	if ((get_endpoint(alts, 1)->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) != USB_ENDPOINT_XFER_ISOC ||
+	if ((sync_attr & USB_ENDPOINT_XFERTYPE_MASK) != USB_ENDPOINT_XFER_ISOC ||
 	    (get_endpoint(alts, 1)->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE &&
 	     get_endpoint(alts, 1)->bSynchAddress != 0)) {
 		dev_err(&dev->dev,
@@ -537,22 +539,57 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 		return -EINVAL;
 	}
 
-	implicit_fb = (get_endpoint(alts, 1)->bmAttributes & USB_ENDPOINT_USAGE_MASK)
-			== USB_ENDPOINT_USAGE_IMPLICIT_FB;
+	fmt->sync_ep = ep;
+	fmt->sync_iface = altsd->bInterfaceNumber;
+	fmt->sync_altsetting = altsd->bAlternateSetting;
+	if ((sync_attr & USB_ENDPOINT_USAGE_MASK) == USB_ENDPOINT_USAGE_IMPLICIT_FB)
+		fmt->implicit_fb = 1;
+
+	dev_dbg(&dev->dev, "%d:%d: found sync_ep=0x%x, iface=%d, alt=%d, implicit_fb=%d\n",
+		fmt->iface, fmt->altsetting, fmt->sync_ep, fmt->sync_iface,
+		fmt->sync_altsetting, fmt->implicit_fb);
+
+	return 0;
+}
+
+static int set_sync_endpoint(struct snd_usb_substream *subs,
+			     struct audioformat *fmt)
+{
+	struct usb_device *dev = subs->dev;
+	struct usb_interface *iface;
+	struct usb_host_interface *alts;
+	int is_playback = subs->direction == SNDRV_PCM_STREAM_PLAYBACK;
+	unsigned int ep;
+	int err;
+
+	subs->sync_endpoint = NULL;
+	subs->data_endpoint->sync_master = NULL;
+
+	ep = fmt->sync_ep;
+	if (!ep)
+		return 0;
+
+	iface = usb_ifnum_to_if(dev, fmt->sync_iface);
+	if (!iface)
+		return 0;
+
+	alts = usb_altnum_to_altsetting(iface, fmt->altsetting);
+	if (!alts)
+		return 0;
 
 	subs->sync_endpoint = snd_usb_add_endpoint(subs->stream->chip,
 						   alts, ep, !subs->direction,
-						   implicit_fb ?
-							SND_USB_ENDPOINT_TYPE_DATA :
-							SND_USB_ENDPOINT_TYPE_SYNC);
-
+						   fmt->implicit_fb ?
+						   SND_USB_ENDPOINT_TYPE_DATA :
+						   SND_USB_ENDPOINT_TYPE_SYNC);
 	if (!subs->sync_endpoint) {
-		if (is_playback && attr == USB_ENDPOINT_SYNC_NONE)
+		if (is_playback &&
+		    (fmt->ep_attr & USB_ENDPOINT_SYNCTYPE) == USB_ENDPOINT_SYNC_NONE)
 			return 0;
 		return -EINVAL;
 	}
 
-	subs->sync_endpoint->is_implicit_feedback = implicit_fb;
+	subs->sync_endpoint->is_implicit_feedback = fmt->implicit_fb;
 
 	subs->data_endpoint->sync_master = subs->sync_endpoint;
 
@@ -579,7 +616,6 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
 {
 	struct usb_device *dev = subs->dev;
 	struct usb_host_interface *alts;
-	struct usb_interface_descriptor *altsd;
 	struct usb_interface *iface;
 	int err;
 
@@ -589,7 +625,6 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
 	alts = usb_altnum_to_altsetting(iface, fmt->altsetting);
 	if (WARN_ON(!alts))
 		return -EINVAL;
-	altsd = get_iface_desc(alts);
 
 	if (fmt == subs->cur_audiofmt && !subs->need_setup_fmt)
 		return 0;
@@ -639,7 +674,7 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
 	if (!subs->data_endpoint)
 		return -EINVAL;
 
-	err = set_sync_endpoint(subs, fmt, dev, alts, altsd);
+	err = set_sync_endpoint(subs, fmt);
 	if (err < 0)
 		return err;
 
diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
index 9833627c1eca..362782c2df5c 100644
--- a/sound/usb/pcm.h
+++ b/sound/usb/pcm.h
@@ -14,5 +14,7 @@ int snd_usb_init_pitch(struct snd_usb_audio *chip, int iface,
 		       struct audioformat *fmt);
 void snd_usb_preallocate_buffer(struct snd_usb_substream *subs);
 
+int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
+				    struct audioformat *fmt);
 
 #endif /* __USBAUDIO_PCM_H */
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index f17913e0b5b4..7087ee2c8174 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1193,6 +1193,8 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 			continue;
 		}
 
+		snd_usb_audioformat_set_sync_ep(chip, fp);
+
 		dev_dbg(&dev->dev, "%u:%d: add audio endpoint %#x\n", iface_no, altno, fp->endpoint);
 		if (protocol == UAC_VERSION_3)
 			err = snd_usb_add_audio_stream_v3(chip, stream, fp, pd);
-- 
2.16.4


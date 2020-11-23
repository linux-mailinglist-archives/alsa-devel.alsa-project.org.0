Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5122C01D2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:00:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6CD310E;
	Mon, 23 Nov 2020 10:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6CD310E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122057;
	bh=giLoMiQoKE7RLRpeTShX/jlScOkN+OwZI0IF217eZA4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KWpS9M1ePZ+wGxjD8ntsOg6H98NLYX6HeIwaDG+mRkm5HCKQYZ7WIaH+hEPAEhkMN
	 cpXi2iMHoQsbJBIMxQkAAN1dMIh16Jc48fvVw+XCRDEUAuzBz7R/g5bbzM2hm12pXp
	 s0vTkJi+kCdwZC0Na5iz0mE1C+nlLDixQv9raByk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49322F80551;
	Mon, 23 Nov 2020 09:54:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB965F804C3; Mon, 23 Nov 2020 09:54:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F6B4F804C3
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F6B4F804C3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A05A5AFAC;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/41] ALSA: usb-audio: Create endpoint objects at parsing
 phase
Date: Mon, 23 Nov 2020 09:53:20 +0100
Message-Id: <20201123085347.19667-15-tiwai@suse.de>
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

Currently snd_usb_endpoint objects are created at first when the
substream is opened and tries to assign the endpoints corresponding to
the matching audioformat.  But since basically the all endpoints have
been already parsed and the information have been obtained, we may
create the endpoint objects statically at the init phase.  It's easier
to manage for the implicit fb case, for example.

This patch changes the endpoint object management and lets the parser
to create the all endpoint objects.

This change shouldn't bring any functional changes.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 87 ++++++++++++++++++++--------------------------------
 sound/usb/endpoint.h | 10 +++---
 sound/usb/pcm.c      | 27 ++++++++--------
 sound/usb/stream.c   | 16 ++++++++++
 4 files changed, 67 insertions(+), 73 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 94490d706013..eb459db511f8 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -440,22 +440,19 @@ static void snd_complete_urb(struct urb *urb)
 }
 
 /*
- * Get the existing endpoint object corresponding EP, iface and alt numbers
+ * Get the existing endpoint object corresponding EP
  * Returns NULL if not present.
- * Call inside chip->mutex locking for avoiding the race.
  */
 struct snd_usb_endpoint *
-snd_usb_get_endpoint(struct snd_usb_audio *chip,
-		     int ep_num, int iface, int altsetting)
+snd_usb_get_endpoint(struct snd_usb_audio *chip, int ep_num)
 {
 	struct snd_usb_endpoint *ep;
 
 	list_for_each_entry(ep, &chip->ep_list, list) {
-		if (ep->ep_num == ep_num &&
-		    ep->iface == iface &&
-		    ep->altsetting == altsetting)
+		if (ep->ep_num == ep_num)
 			return ep;
 	}
+
 	return NULL;
 }
 
@@ -466,14 +463,13 @@ snd_usb_get_endpoint(struct snd_usb_audio *chip,
  * snd_usb_add_endpoint: Add an endpoint to an USB audio chip
  *
  * @chip: The chip
- * @alts: The USB host interface
  * @ep_num: The number of the endpoint to use
- * @direction: SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE
  * @type: SND_USB_ENDPOINT_TYPE_DATA or SND_USB_ENDPOINT_TYPE_SYNC
  *
  * If the requested endpoint has not been added to the given chip before,
- * a new instance is created. Otherwise, a pointer to the previoulsy
- * created instance is returned. In case of any error, NULL is returned.
+ * a new instance is created.
+ *
+ * Returns zero on success or a negative error code.
  *
  * New endpoints will be added to chip->ep_list and must be freed by
  * calling snd_usb_endpoint_free().
@@ -481,74 +477,59 @@ snd_usb_get_endpoint(struct snd_usb_audio *chip,
  * For SND_USB_ENDPOINT_TYPE_SYNC, the caller needs to guarantee that
  * bNumEndpoints > 1 beforehand.
  */
-struct snd_usb_endpoint *snd_usb_add_endpoint(struct snd_usb_audio *chip,
-					      struct usb_host_interface *alts,
-					      int ep_num, int direction, int type)
+int snd_usb_add_endpoint(struct snd_usb_audio *chip, int ep_num, int type)
 {
 	struct snd_usb_endpoint *ep;
-	int is_playback = direction == SNDRV_PCM_STREAM_PLAYBACK;
-
-	if (WARN_ON(!alts))
-		return NULL;
+	bool is_playback;
 
-	mutex_lock(&chip->mutex);
-
-	ep = snd_usb_get_endpoint(chip, ep_num,
-				  alts->desc.bInterfaceNumber,
-				  alts->desc.bAlternateSetting);
-	if (ep) {
-		usb_audio_dbg(ep->chip, "Re-using EP %x in iface %d,%d\n",
-			      ep_num, ep->iface, ep->altsetting);
-		goto __exit_unlock;
-	}
+	ep = snd_usb_get_endpoint(chip, ep_num);
+	if (ep)
+		return 0;
 
-	usb_audio_dbg(chip, "Creating new %s %s endpoint #%x\n",
-		      is_playback ? "playback" : "capture",
+	usb_audio_dbg(chip, "Creating new %s endpoint #%x\n",
 		      ep_type_name(type),
 		      ep_num);
-
 	ep = kzalloc(sizeof(*ep), GFP_KERNEL);
 	if (!ep)
-		goto __exit_unlock;
+		return -ENOMEM;
 
 	ep->chip = chip;
 	spin_lock_init(&ep->lock);
 	ep->type = type;
 	ep->ep_num = ep_num;
-	ep->iface = alts->desc.bInterfaceNumber;
-	ep->altsetting = alts->desc.bAlternateSetting;
 	INIT_LIST_HEAD(&ep->ready_playback_urbs);
-	ep_num &= USB_ENDPOINT_NUMBER_MASK;
 
+	is_playback = ((ep_num & USB_ENDPOINT_DIR_MASK) == USB_DIR_OUT);
+	ep_num &= USB_ENDPOINT_NUMBER_MASK;
 	if (is_playback)
 		ep->pipe = usb_sndisocpipe(chip->dev, ep_num);
 	else
 		ep->pipe = usb_rcvisocpipe(chip->dev, ep_num);
 
-	if (type == SND_USB_ENDPOINT_TYPE_SYNC) {
-		if (get_endpoint(alts, 1)->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE &&
-		    get_endpoint(alts, 1)->bRefresh >= 1 &&
-		    get_endpoint(alts, 1)->bRefresh <= 9)
-			ep->syncinterval = get_endpoint(alts, 1)->bRefresh;
+	list_add_tail(&ep->list, &chip->ep_list);
+	return 0;
+}
+
+/* Set up syncinterval and maxsyncsize for a sync EP */
+void snd_usb_endpoint_set_syncinterval(struct snd_usb_audio *chip,
+				       struct snd_usb_endpoint *ep,
+				       struct usb_host_interface *alts)
+{
+	struct usb_endpoint_descriptor *desc = get_endpoint(alts, 1);
+
+	if (ep->type == SND_USB_ENDPOINT_TYPE_SYNC) {
+		if (desc->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE &&
+		    desc->bRefresh >= 1 && desc->bRefresh <= 9)
+			ep->syncinterval = desc->bRefresh;
 		else if (snd_usb_get_speed(chip->dev) == USB_SPEED_FULL)
 			ep->syncinterval = 1;
-		else if (get_endpoint(alts, 1)->bInterval >= 1 &&
-			 get_endpoint(alts, 1)->bInterval <= 16)
-			ep->syncinterval = get_endpoint(alts, 1)->bInterval - 1;
+		else if (desc->bInterval >= 1 && desc->bInterval <= 16)
+			ep->syncinterval = desc->bInterval - 1;
 		else
 			ep->syncinterval = 3;
 
-		ep->syncmaxsize = le16_to_cpu(get_endpoint(alts, 1)->wMaxPacketSize);
+		ep->syncmaxsize = le16_to_cpu(desc->wMaxPacketSize);
 	}
-
-	list_add_tail(&ep->list, &chip->ep_list);
-
-	ep->is_implicit_feedback = 0;
-
-__exit_unlock:
-	mutex_unlock(&chip->mutex);
-
-	return ep;
 }
 
 /*
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index 61487095a766..76b6de7de991 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -6,12 +6,9 @@
 #define SND_USB_ENDPOINT_TYPE_SYNC     1
 
 struct snd_usb_endpoint *snd_usb_get_endpoint(struct snd_usb_audio *chip,
-					      int ep_num, int iface,
-					      int altsetting);
+					      int ep_num);
 
-struct snd_usb_endpoint *snd_usb_add_endpoint(struct snd_usb_audio *chip,
-					      struct usb_host_interface *alts,
-					      int ep_num, int direction, int type);
+int snd_usb_add_endpoint(struct snd_usb_audio *chip, int ep_num, int type);
 
 int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 				snd_pcm_format_t pcm_format,
@@ -34,6 +31,9 @@ void snd_usb_endpoint_free(struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_slave_next_packet_size(struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep);
+void snd_usb_endpoint_set_syncinterval(struct snd_usb_audio *chip,
+				       struct snd_usb_endpoint *ep,
+				       struct usb_host_interface *alts);
 
 void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
 			     struct snd_usb_endpoint *sender,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 8ae7d2fdba0d..03b1a02bcff4 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -585,11 +585,7 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 	if (!alts)
 		return 0;
 
-	subs->sync_endpoint = snd_usb_add_endpoint(subs->stream->chip,
-						   alts, ep, !subs->direction,
-						   fmt->implicit_fb ?
-						   SND_USB_ENDPOINT_TYPE_DATA :
-						   SND_USB_ENDPOINT_TYPE_SYNC);
+	subs->sync_endpoint = snd_usb_get_endpoint(subs->stream->chip, ep);
 	if (!subs->sync_endpoint) {
 		if (is_playback &&
 		    (fmt->ep_attr & USB_ENDPOINT_SYNCTYPE) == USB_ENDPOINT_SYNC_NONE)
@@ -597,10 +593,14 @@ static int set_sync_endpoint(struct snd_usb_substream *subs,
 		return -EINVAL;
 	}
 
+	subs->sync_endpoint->iface = fmt->sync_iface;
+	subs->sync_endpoint->altsetting = fmt->sync_altsetting;
 	subs->sync_endpoint->is_implicit_feedback = fmt->implicit_fb;
 
 	subs->data_endpoint->sync_master = subs->sync_endpoint;
 
+	snd_usb_endpoint_set_syncinterval(subs->stream->chip, subs->sync_endpoint, alts);
+
 	if (!subs->sync_endpoint->use_count &&
 	    (subs->data_endpoint->iface != subs->sync_endpoint->iface ||
 	     subs->data_endpoint->altsetting != subs->sync_endpoint->altsetting)) {
@@ -641,8 +641,7 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
 
 	/* shared EP with implicit fb */
 	if (fmt->implicit_fb && !subs->need_setup_fmt) {
-		ep = snd_usb_get_endpoint(subs->stream->chip, fmt->endpoint,
-					  fmt->iface, fmt->altsetting);
+		ep = snd_usb_get_endpoint(subs->stream->chip, fmt->endpoint);
 		if (ep && ep->use_count > 0)
 			goto add_data_ep;
 	}
@@ -688,12 +687,12 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
  add_data_ep:
 	subs->interface = fmt->iface;
 	subs->altset_idx = fmt->altset_idx;
-	subs->data_endpoint = snd_usb_add_endpoint(subs->stream->chip,
-						   alts, fmt->endpoint, subs->direction,
-						   SND_USB_ENDPOINT_TYPE_DATA);
-
+	subs->data_endpoint = snd_usb_get_endpoint(subs->stream->chip,
+						   fmt->endpoint);
 	if (!subs->data_endpoint)
 		return -EINVAL;
+	subs->data_endpoint->iface = fmt->iface;
+	subs->data_endpoint->altsetting = fmt->altsetting;
 
 	err = set_sync_endpoint(subs, fmt);
 	if (err < 0)
@@ -1294,15 +1293,13 @@ static int apply_hw_constraint_from_sync(struct snd_pcm_runtime *runtime,
 
 	subs->fixed_hw = 0;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
-		ep = snd_usb_get_endpoint(chip, fp->endpoint, fp->iface,
-					  fp->altsetting);
+		ep = snd_usb_get_endpoint(chip, fp->endpoint);
 		if (ep && ep->cur_rate)
 			goto found;
 		if (!fp->implicit_fb)
 			continue;
 		/* for the implicit fb, check the sync ep as well */
-		ep = snd_usb_get_endpoint(chip, fp->sync_ep, fp->sync_iface,
-					  fp->sync_altsetting);
+		ep = snd_usb_get_endpoint(chip, fp->sync_ep);
 		if (ep && ep->cur_rate)
 			goto found;
 	}
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 7087ee2c8174..816fd3e5aada 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -1206,6 +1206,22 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 			kfree(pd);
 			return err;
 		}
+
+		/* add endpoints */
+		err = snd_usb_add_endpoint(chip, fp->endpoint,
+					   SND_USB_ENDPOINT_TYPE_DATA);
+		if (err < 0)
+			return err;
+
+		if (fp->sync_ep) {
+			err = snd_usb_add_endpoint(chip, fp->sync_ep,
+						   fp->implicit_fb ?
+						   SND_USB_ENDPOINT_TYPE_DATA :
+						   SND_USB_ENDPOINT_TYPE_SYNC);
+			if (err < 0)
+				return err;
+		}
+
 		/* try to set the interface... */
 		usb_set_interface(chip->dev, iface_no, altno);
 		snd_usb_init_pitch(chip, iface_no, alts, fp);
-- 
2.16.4


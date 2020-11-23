Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D92C0205
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:07:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E26168E;
	Mon, 23 Nov 2020 10:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E26168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122469;
	bh=fUONp+XAk1lg8+paeAerxut1gzW6bhIRMPRptRRSqk8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iMUByHI3MLoVqMGhrpzjt2uASPdfG+1i/5Z3TAmbWmoyDHNEE4AJxhS9a6+Y+6mli
	 NFXNOfPFh7jxrVJcIS5+QNLFVmtQe3PHgQnN7X1KEYuKSgYUYx82BamBaYgvkRIUuC
	 QRisaYM/r/PIwTHVk+vCA6+0tmR6e7T/1GQHZuug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8300AF805EC;
	Mon, 23 Nov 2020 09:55:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C50D6F8055C; Mon, 23 Nov 2020 09:54:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B0C2F804E0
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B0C2F804E0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5371AAFB0;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 25/41] ALSA: usb-audio: Refactor endpoint management
Date: Mon, 23 Nov 2020 09:53:31 +0100
Message-Id: <20201123085347.19667-26-tiwai@suse.de>
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

This is an intensive surgery for the endpoint and stream management
for achieving more robust and clean code.

The goals of this patch are:
- More clear endpoint resource changes
- The interface altsetting control in a single place
Below are brief description of the whole changes.

First off, most of the endpoint operations are moved into endpoint.c,
so that the snd_usb_endpoint object is only referred in other places.
The endpoint object is acquired and released via the new functions
snd_usb_endpoint_open() and snd_usb_endpoint_close() that are called
at PCM hw_params and hw_free callbacks, respectively.  Those are
ref-counted and EPs can manage the multiple opens.

The open callback receives the audioformat and hw_params arguments,
and those are used for initializing the EP parameters; especially the
endpoint, interface and altset numbers are read from there, as well as
the PCM parameters like the format, rate and channels.  Those are
stored in snd_usb_endpoint object.  If it's the secondary open, the
function checks whether the given parameters are compatible with the
already opened EP setup, too.

The coupling with a sync EP (including an implicit feedback sync) is
done by the sole snd_usb_endpoint_set_sync() call.

The configuration of each endpoint is done in a single shot via
snd_usb_endpoint_configure() call.  This is the place where most of
PCM configurations are done.  A few flags and special handling in the
snd_usb_substream are dropped along with this change.

A significant difference wrt the configuration from the previous code
is the order of USB host interface setups.  Now the interface is
always disabled at beginning and (re-)enabled at the last step of
snd_usb_endpoint_configure(), in order to be compliant with the
standard UAC2/3.  For UAC1, the interface is set before the parameter
setups since there seem devices that require it (e.g. Yamaha THR10),
just like how it was done in the previous driver code.

The start/stop are almost same as before, also single-shots.  The URB
callbacks need to be set via snd_usb_endpoint_set_callback() like the
previous code at the trigger phase, too.

Finally, the flag for the re-setup is set at the device suspend
through the full EP list, instead of PCM trigger.  This catches the
overlooked cases where the PCM hasn't been running yet but the device
needs the full setup after resume.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     |   8 +-
 sound/usb/card.h     |  11 +-
 sound/usb/clock.c    |  13 +-
 sound/usb/endpoint.c | 662 ++++++++++++++++++++++++++-------------------------
 sound/usb/endpoint.h |  40 ++--
 sound/usb/pcm.c      | 616 +++++++++++++++++++----------------------------
 6 files changed, 616 insertions(+), 734 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 096dd8e3c64b..58958afcec93 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -980,6 +980,7 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct snd_usb_audio *chip = usb_get_intfdata(intf);
 	struct snd_usb_stream *as;
+	struct snd_usb_endpoint *ep;
 	struct usb_mixer_interface *mixer;
 	struct list_head *p;
 
@@ -987,11 +988,10 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 		return 0;
 
 	if (!chip->num_suspended_intf++) {
-		list_for_each_entry(as, &chip->pcm_list, list) {
+		list_for_each_entry(as, &chip->pcm_list, list)
 			snd_usb_pcm_suspend(as);
-			as->substream[0].need_setup_ep =
-				as->substream[1].need_setup_ep = true;
-		}
+		list_for_each_entry(ep, &chip->ep_list, list)
+			snd_usb_endpoint_suspend(ep);
 		list_for_each(p, &chip->midi_list)
 			snd_usbmidi_suspend(p);
 		list_for_each_entry(mixer, &chip->mixer_list, list)
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 1f61be98a31d..66a249ae138f 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -26,6 +26,7 @@ struct audioformat {
 	unsigned char sync_ep;		/* sync endpoint number */
 	unsigned char sync_iface;	/* sync EP interface */
 	unsigned char sync_altsetting;	/* sync EP alternate setting */
+	unsigned char sync_ep_idx;	/* sync EP array index */
 	unsigned char datainterval;	/* log_2 of data packet interval */
 	unsigned char protocol;		/* UAC_VERSION_1/2/3 */
 	unsigned int maxpacksize;	/* max. packet size */
@@ -58,6 +59,7 @@ struct snd_urb_ctx {
 struct snd_usb_endpoint {
 	struct snd_usb_audio *chip;
 
+	int opened;		/* open refcount; protect with chip->mutex */
 	int use_count;
 	int ep_num;		/* the referenced endpoint number */
 	int type;		/* SND_USB_ENDPOINT_TYPE_* */
@@ -110,14 +112,18 @@ struct snd_usb_endpoint {
 	unsigned char silence_value;
 	unsigned int stride;
 	int iface, altsetting;
+	unsigned char ep_idx;		/* endpoint array index */
 	int skip_packets;		/* quirks for devices to ignore the first n packets
 					   in a stream */
-	bool is_implicit_feedback;      /* This endpoint is used as implicit feedback */
+	bool implicit_fb_sync;		/* syncs with implicit feedback */
+	bool need_setup;		/* (re-)need for configure? */
 
 	/* for hw constraints */
+	struct audioformat *cur_audiofmt;
 	unsigned int cur_rate;
 	snd_pcm_format_t cur_format;
 	unsigned int cur_channels;
+	unsigned int cur_frame_bytes;
 	unsigned int cur_period_frames;
 	unsigned int cur_period_bytes;
 	unsigned int cur_buffer_periods;
@@ -152,7 +158,6 @@ struct snd_usb_substream {
 	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
 
 	unsigned int running: 1;	/* running status */
-	unsigned int fixed_hw:1;	/* fixed hw constraints due to sync EP */
 
 	unsigned int hwptr_done;	/* processed byte position in the buffer */
 	unsigned int transfer_done;		/* processed frames since last period update */
@@ -163,8 +168,6 @@ struct snd_usb_substream {
 	struct snd_usb_endpoint *data_endpoint;
 	struct snd_usb_endpoint *sync_endpoint;
 	unsigned long flags;
-	bool need_setup_ep;		/* (re)configure EP at prepare? */
-	bool need_setup_fmt;		/* (re)configure fmt after resume? */
 	unsigned int speed;		/* USB_SPEED_XXX */
 
 	u64 formats;			/* format bitmasks (all or'ed) */
diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index f25da11fce3a..b869a711afbf 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -613,7 +613,6 @@ int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
 static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 				struct audioformat *fmt, int rate)
 {
-	struct usb_device *dev = chip->dev;
 	int cur_rate, prev_rate;
 	int clock;
 
@@ -656,15 +655,6 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 		return -ENXIO;
 	}
 
-	/* Some devices doesn't respond to sample rate changes while the
-	 * interface is active. */
-	if (rate != prev_rate) {
-		usb_set_interface(dev, fmt->iface, 0);
-		snd_usb_set_interface_quirk(chip);
-		usb_set_interface(dev, fmt->iface, fmt->altsetting);
-		snd_usb_set_interface_quirk(chip);
-	}
-
 validation:
 	/* validate clock after rate change */
 	if (!uac_clock_source_is_valid(chip, fmt, clock))
@@ -675,6 +665,9 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 int snd_usb_init_sample_rate(struct snd_usb_audio *chip,
 			     struct audioformat *fmt, int rate)
 {
+	usb_audio_dbg(chip, "%d:%d Set sample rate %d, clock %d\n",
+		      fmt->iface, fmt->altsetting, rate, fmt->clock);
+
 	switch (fmt->protocol) {
 	case UAC_VERSION_1:
 	default:
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 7012fdafc3d8..eee74313603e 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -18,6 +18,7 @@
 #include "card.h"
 #include "endpoint.h"
 #include "pcm.h"
+#include "clock.h"
 #include "quirks.h"
 
 #define EP_FLAG_RUNNING		1
@@ -116,10 +117,7 @@ static const char *usb_error_string(int err)
  */
 int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep)
 {
-	return  ep->sync_master &&
-		ep->sync_master->type == SND_USB_ENDPOINT_TYPE_DATA &&
-		ep->type == SND_USB_ENDPOINT_TYPE_DATA &&
-		usb_pipeout(ep->pipe);
+	return  ep->implicit_fb_sync && usb_pipeout(ep->pipe);
 }
 
 /*
@@ -185,18 +183,24 @@ static void retire_outbound_urb(struct snd_usb_endpoint *ep,
 	call_retire_callback(ep, urb_ctx->urb);
 }
 
+static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
+				    struct snd_usb_endpoint *sender,
+				    const struct urb *urb);
+
 static void retire_inbound_urb(struct snd_usb_endpoint *ep,
 			       struct snd_urb_ctx *urb_ctx)
 {
 	struct urb *urb = urb_ctx->urb;
+	struct snd_usb_endpoint *sync_slave;
 
 	if (unlikely(ep->skip_packets > 0)) {
 		ep->skip_packets--;
 		return;
 	}
 
-	if (ep->sync_slave)
-		snd_usb_handle_sync_urb(ep->sync_slave, ep, urb);
+	sync_slave = READ_ONCE(ep->sync_slave);
+	if (sync_slave)
+		snd_usb_handle_sync_urb(sync_slave, ep, urb);
 
 	call_retire_callback(ep, urb);
 }
@@ -518,25 +522,155 @@ int snd_usb_add_endpoint(struct snd_usb_audio *chip, int ep_num, int type)
 }
 
 /* Set up syncinterval and maxsyncsize for a sync EP */
-void snd_usb_endpoint_set_syncinterval(struct snd_usb_audio *chip,
-				       struct snd_usb_endpoint *ep,
-				       struct usb_host_interface *alts)
+static void endpoint_set_syncinterval(struct snd_usb_audio *chip,
+				      struct snd_usb_endpoint *ep)
 {
-	struct usb_endpoint_descriptor *desc = get_endpoint(alts, 1);
-
-	if (ep->type == SND_USB_ENDPOINT_TYPE_SYNC) {
-		if (desc->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE &&
-		    desc->bRefresh >= 1 && desc->bRefresh <= 9)
-			ep->syncinterval = desc->bRefresh;
-		else if (snd_usb_get_speed(chip->dev) == USB_SPEED_FULL)
-			ep->syncinterval = 1;
-		else if (desc->bInterval >= 1 && desc->bInterval <= 16)
-			ep->syncinterval = desc->bInterval - 1;
-		else
-			ep->syncinterval = 3;
+	struct usb_host_interface *alts;
+	struct usb_endpoint_descriptor *desc;
+
+	alts = snd_usb_get_host_interface(chip, ep->iface, ep->altsetting);
+	if (!alts)
+		return;
+
+	desc = get_endpoint(alts, ep->ep_idx);
+	if (desc->bLength >= USB_DT_ENDPOINT_AUDIO_SIZE &&
+	    desc->bRefresh >= 1 && desc->bRefresh <= 9)
+		ep->syncinterval = desc->bRefresh;
+	else if (snd_usb_get_speed(chip->dev) == USB_SPEED_FULL)
+		ep->syncinterval = 1;
+	else if (desc->bInterval >= 1 && desc->bInterval <= 16)
+		ep->syncinterval = desc->bInterval - 1;
+	else
+		ep->syncinterval = 3;
+
+	ep->syncmaxsize = le16_to_cpu(desc->wMaxPacketSize);
+}
+
+static bool endpoint_compatible(struct snd_usb_endpoint *ep,
+				const struct audioformat *fp,
+				const struct snd_pcm_hw_params *params)
+{
+	if (!ep->opened)
+		return false;
+	if (ep->cur_audiofmt != fp)
+		return false;
+	if (ep->cur_rate != params_rate(params) ||
+	    ep->cur_format != params_format(params) ||
+	    ep->cur_period_frames != params_period_size(params) ||
+	    ep->cur_buffer_periods != params_periods(params))
+		return false;
+	return true;
+}
+
+/*
+ * Check whether the given fp and hw params are compatbile with the current
+ * setup of the target EP for implicit feedback sync
+ */
+bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
+				 struct snd_usb_endpoint *ep,
+				 const struct audioformat *fp,
+				 const struct snd_pcm_hw_params *params)
+{
+	bool ret;
+
+	mutex_lock(&chip->mutex);
+	ret = endpoint_compatible(ep, fp, params);
+	mutex_unlock(&chip->mutex);
+	return ret;
+}
+
+/*
+ * snd_usb_endpoint_open: Open the endpoint
+ *
+ * Called from hw_params to assign the endpoint to the substream.
+ * It's reference-counted, and only the first opener is allowed to set up
+ * arbitrary parameters.  The later opener must be compatible with the
+ * former opened parameters.
+ * The endpoint needs to be closed via snd_usb_endpoint_close() later.
+ *
+ * Note that this function doesn't configure the endpoint.  The substream
+ * needs to set it up later via snd_usb_endpoint_configure().
+ */
+struct snd_usb_endpoint *
+snd_usb_endpoint_open(struct snd_usb_audio *chip,
+		      struct audioformat *fp,
+		      const struct snd_pcm_hw_params *params,
+		      bool is_sync_ep)
+{
+	struct snd_usb_endpoint *ep;
+	int ep_num = is_sync_ep ? fp->sync_ep : fp->endpoint;
 
-		ep->syncmaxsize = le16_to_cpu(desc->wMaxPacketSize);
+	mutex_lock(&chip->mutex);
+	ep = snd_usb_get_endpoint(chip, ep_num);
+	if (!ep) {
+		usb_audio_err(chip, "Cannot find EP 0x%x to open\n", ep_num);
+		goto unlock;
 	}
+
+	if (!ep->opened) {
+		if (is_sync_ep) {
+			ep->iface = fp->sync_iface;
+			ep->altsetting = fp->sync_altsetting;
+			ep->ep_idx = fp->sync_ep_idx;
+		} else {
+			ep->iface = fp->iface;
+			ep->altsetting = fp->altsetting;
+			ep->ep_idx = 0;
+		}
+		usb_audio_dbg(chip, "Open EP 0x%x, iface=%d:%d, idx=%d\n",
+			      ep_num, ep->iface, ep->altsetting, ep->ep_idx);
+
+		ep->cur_audiofmt = fp;
+		ep->cur_channels = fp->channels;
+		ep->cur_rate = params_rate(params);
+		ep->cur_format = params_format(params);
+		ep->cur_frame_bytes = snd_pcm_format_physical_width(ep->cur_format) *
+			ep->cur_channels / 8;
+		ep->cur_period_frames = params_period_size(params);
+		ep->cur_period_bytes = ep->cur_period_frames * ep->cur_frame_bytes;
+		ep->cur_buffer_periods = params_periods(params);
+
+		if (ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
+			endpoint_set_syncinterval(chip, ep);
+
+		ep->implicit_fb_sync = fp->implicit_fb;
+		ep->need_setup = true;
+
+		usb_audio_dbg(chip, "  channels=%d, rate=%d, format=%s, period_bytes=%d, periods=%d, implicit_fb=%d\n",
+			      ep->cur_channels, ep->cur_rate,
+			      snd_pcm_format_name(ep->cur_format),
+			      ep->cur_period_bytes, ep->cur_buffer_periods,
+			      ep->implicit_fb_sync);
+
+	} else {
+		if (!endpoint_compatible(ep, fp, params)) {
+			usb_audio_err(chip, "Incompatible EP setup for 0x%x\n",
+				      ep_num);
+			ep = NULL;
+			goto unlock;
+		}
+
+		usb_audio_dbg(chip, "Reopened EP 0x%x (count %d)\n",
+			      ep_num, ep->opened);
+	}
+
+	ep->opened++;
+
+ unlock:
+	mutex_unlock(&chip->mutex);
+	return ep;
+}
+
+/*
+ * snd_usb_endpoint_set_sync: Link data and sync endpoints
+ *
+ * Pass NULL to sync_ep to unlink again
+ */
+void snd_usb_endpoint_set_sync(struct snd_usb_audio *chip,
+			       struct snd_usb_endpoint *data_ep,
+			       struct snd_usb_endpoint *sync_ep)
+{
+	data_ep->sync_master = sync_ep;
 }
 
 /*
@@ -557,6 +691,54 @@ void snd_usb_endpoint_set_callback(struct snd_usb_endpoint *ep,
 	WRITE_ONCE(ep->data_subs, data_subs);
 }
 
+static int endpoint_set_interface(struct snd_usb_audio *chip,
+				  struct snd_usb_endpoint *ep,
+				  bool set)
+{
+	int altset = set ? ep->altsetting : 0;
+	int err;
+
+	usb_audio_dbg(chip, "Setting usb interface %d:%d for EP 0x%x\n",
+		      ep->iface, altset, ep->ep_num);
+	err = usb_set_interface(chip->dev, ep->iface, altset);
+	if (err < 0) {
+		usb_audio_err(chip, "%d:%d: usb_set_interface failed (%d)\n",
+			      ep->iface, altset, err);
+		return err;
+	}
+
+	snd_usb_set_interface_quirk(chip);
+	return 0;
+}
+
+/*
+ * snd_usb_endpoint_close: Close the endpoint
+ *
+ * Unreference the already opened endpoint via snd_usb_endpoint_open().
+ */
+void snd_usb_endpoint_close(struct snd_usb_audio *chip,
+			    struct snd_usb_endpoint *ep)
+{
+	mutex_lock(&chip->mutex);
+	usb_audio_dbg(chip, "Closing EP 0x%x (count %d)\n",
+		      ep->ep_num, ep->opened);
+	if (!--ep->opened) {
+		endpoint_set_interface(chip, ep, false);
+		ep->iface = -1;
+		ep->altsetting = 0;
+		ep->cur_audiofmt = NULL;
+		ep->cur_rate = 0;
+		usb_audio_dbg(chip, "EP 0x%x closed\n", ep->ep_num);
+	}
+	mutex_unlock(&chip->mutex);
+}
+
+/* Prepare for suspening EP, called from the main suspend handler */
+void snd_usb_endpoint_suspend(struct snd_usb_endpoint *ep)
+{
+	ep->need_setup = true;
+}
+
 /*
  *  wait until all urbs are processed.
  */
@@ -646,219 +828,36 @@ static void release_urbs(struct snd_usb_endpoint *ep, int force)
 	ep->nurbs = 0;
 }
 
-/*
- * Check data endpoint for format differences
- */
-static bool check_ep_params(struct snd_usb_endpoint *ep,
-			    snd_pcm_format_t pcm_format,
-			    unsigned int channels,
-			    unsigned int period_bytes,
-			    unsigned int frames_per_period,
-			    unsigned int periods_per_buffer,
-			    unsigned int rate,
-			    struct audioformat *fmt,
-			    struct snd_usb_endpoint *sync_ep)
-{
-	unsigned int maxsize, minsize, packs_per_ms, max_packs_per_urb;
-	unsigned int max_packs_per_period, urbs_per_period, urb_packs;
-	unsigned int max_urbs;
-	int frame_bits = snd_pcm_format_physical_width(pcm_format) * channels;
-	int tx_length_quirk = (ep->chip->tx_length_quirk &&
-			       usb_pipeout(ep->pipe));
-	bool ret = 1;
-
-	/* matching with the saved parameters? */
-	if (ep->cur_rate == rate &&
-	    ep->cur_format == pcm_format &&
-	    ep->cur_channels == channels &&
-	    ep->cur_period_frames == frames_per_period &&
-	    ep->cur_buffer_periods == periods_per_buffer)
-		return true;
-
-	if (pcm_format == SNDRV_PCM_FORMAT_DSD_U16_LE && fmt->dsd_dop) {
-		/*
-		 * When operating in DSD DOP mode, the size of a sample frame
-		 * in hardware differs from the actual physical format width
-		 * because we need to make room for the DOP markers.
-		 */
-		frame_bits += channels << 3;
-	}
-
-	ret = ret && (ep->datainterval == fmt->datainterval);
-	ret = ret && (ep->stride == frame_bits >> 3);
-
-	switch (pcm_format) {
-	case SNDRV_PCM_FORMAT_U8:
-		ret = ret && (ep->silence_value == 0x80);
-		break;
-	case SNDRV_PCM_FORMAT_DSD_U8:
-	case SNDRV_PCM_FORMAT_DSD_U16_LE:
-	case SNDRV_PCM_FORMAT_DSD_U32_LE:
-	case SNDRV_PCM_FORMAT_DSD_U16_BE:
-	case SNDRV_PCM_FORMAT_DSD_U32_BE:
-		ret = ret && (ep->silence_value == 0x69);
-		break;
-	default:
-		ret = ret && (ep->silence_value == 0);
-	}
-
-	/* assume max. frequency is 50% higher than nominal */
-	ret = ret && (ep->freqmax == ep->freqn + (ep->freqn >> 1));
-	/* Round up freqmax to nearest integer in order to calculate maximum
-	 * packet size, which must represent a whole number of frames.
-	 * This is accomplished by adding 0x0.ffff before converting the
-	 * Q16.16 format into integer.
-	 * In order to accurately calculate the maximum packet size when
-	 * the data interval is more than 1 (i.e. ep->datainterval > 0),
-	 * multiply by the data interval prior to rounding. For instance,
-	 * a freqmax of 41 kHz will result in a max packet size of 6 (5.125)
-	 * frames with a data interval of 1, but 11 (10.25) frames with a
-	 * data interval of 2.
-	 * (ep->freqmax << ep->datainterval overflows at 8.192 MHz for the
-	 * maximum datainterval value of 3, at USB full speed, higher for
-	 * USB high speed, noting that ep->freqmax is in units of
-	 * frames per packet in Q16.16 format.)
-	 */
-	maxsize = (((ep->freqmax << ep->datainterval) + 0xffff) >> 16) *
-			 (frame_bits >> 3);
-	if (tx_length_quirk)
-		maxsize += sizeof(__le32); /* Space for length descriptor */
-	/* but wMaxPacketSize might reduce this */
-	if (ep->maxpacksize && ep->maxpacksize < maxsize) {
-		/* whatever fits into a max. size packet */
-		unsigned int data_maxsize = maxsize = ep->maxpacksize;
-
-		if (tx_length_quirk)
-			/* Need to remove the length descriptor to calc freq */
-			data_maxsize -= sizeof(__le32);
-		ret = ret && (ep->freqmax == (data_maxsize / (frame_bits >> 3))
-				<< (16 - ep->datainterval));
-	}
-
-	if (ep->fill_max)
-		ret = ret && (ep->curpacksize == ep->maxpacksize);
-	else
-		ret = ret && (ep->curpacksize == maxsize);
-
-	if (snd_usb_get_speed(ep->chip->dev) != USB_SPEED_FULL) {
-		packs_per_ms = 8 >> ep->datainterval;
-		max_packs_per_urb = MAX_PACKS_HS;
-	} else {
-		packs_per_ms = 1;
-		max_packs_per_urb = MAX_PACKS;
-	}
-	if (sync_ep && !snd_usb_endpoint_implicit_feedback_sink(ep))
-		max_packs_per_urb = min(max_packs_per_urb,
-					1U << sync_ep->syncinterval);
-	max_packs_per_urb = max(1u, max_packs_per_urb >> ep->datainterval);
-
-	/*
-	 * Capture endpoints need to use small URBs because there's no way
-	 * to tell in advance where the next period will end, and we don't
-	 * want the next URB to complete much after the period ends.
-	 *
-	 * Playback endpoints with implicit sync much use the same parameters
-	 * as their corresponding capture endpoint.
-	 */
-	if (usb_pipein(ep->pipe) ||
-			snd_usb_endpoint_implicit_feedback_sink(ep)) {
-
-		urb_packs = packs_per_ms;
-		/*
-		 * Wireless devices can poll at a max rate of once per 4ms.
-		 * For dataintervals less than 5, increase the packet count to
-		 * allow the host controller to use bursting to fill in the
-		 * gaps.
-		 */
-		if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_WIRELESS) {
-			int interval = ep->datainterval;
-
-			while (interval < 5) {
-				urb_packs <<= 1;
-				++interval;
-			}
-		}
-		/* make capture URBs <= 1 ms and smaller than a period */
-		urb_packs = min(max_packs_per_urb, urb_packs);
-		while (urb_packs > 1 && urb_packs * maxsize >= period_bytes)
-			urb_packs >>= 1;
-		ret = ret && (ep->nurbs == MAX_URBS);
-
-	/*
-	 * Playback endpoints without implicit sync are adjusted so that
-	 * a period fits as evenly as possible in the smallest number of
-	 * URBs.  The total number of URBs is adjusted to the size of the
-	 * ALSA buffer, subject to the MAX_URBS and MAX_QUEUE limits.
-	 */
-	} else {
-		/* determine how small a packet can be */
-		minsize = (ep->freqn >> (16 - ep->datainterval)) *
-				(frame_bits >> 3);
-		/* with sync from device, assume it can be 12% lower */
-		if (sync_ep)
-			minsize -= minsize >> 3;
-		minsize = max(minsize, 1u);
-
-		/* how many packets will contain an entire ALSA period? */
-		max_packs_per_period = DIV_ROUND_UP(period_bytes, minsize);
-
-		/* how many URBs will contain a period? */
-		urbs_per_period = DIV_ROUND_UP(max_packs_per_period,
-				max_packs_per_urb);
-		/* how many packets are needed in each URB? */
-		urb_packs = DIV_ROUND_UP(max_packs_per_period, urbs_per_period);
-
-		/* limit the number of frames in a single URB */
-		ret = ret && (ep->max_urb_frames ==
-			DIV_ROUND_UP(frames_per_period, urbs_per_period));
-
-		/* try to use enough URBs to contain an entire ALSA buffer */
-		max_urbs = min((unsigned) MAX_URBS,
-				MAX_QUEUE * packs_per_ms / urb_packs);
-		ret = ret && (ep->nurbs == min(max_urbs,
-				urbs_per_period * periods_per_buffer));
-	}
-
-	ret = ret && (ep->datainterval == fmt->datainterval);
-	ret = ret && (ep->maxpacksize == fmt->maxpacksize);
-	ret = ret &&
-		(ep->fill_max == !!(fmt->attributes & UAC_EP_CS_ATTR_FILL_MAX));
-
-	return ret;
-}
-
 /*
  * configure a data endpoint
  */
-static int data_ep_set_params(struct snd_usb_endpoint *ep,
-			      snd_pcm_format_t pcm_format,
-			      unsigned int channels,
-			      unsigned int period_bytes,
-			      unsigned int frames_per_period,
-			      unsigned int periods_per_buffer,
-			      struct audioformat *fmt,
-			      struct snd_usb_endpoint *sync_ep)
+static int data_ep_set_params(struct snd_usb_endpoint *ep)
 {
+	struct snd_usb_audio *chip = ep->chip;
 	unsigned int maxsize, minsize, packs_per_ms, max_packs_per_urb;
 	unsigned int max_packs_per_period, urbs_per_period, urb_packs;
 	unsigned int max_urbs, i;
-	int frame_bits = snd_pcm_format_physical_width(pcm_format) * channels;
-	int tx_length_quirk = (ep->chip->tx_length_quirk &&
+	const struct audioformat *fmt = ep->cur_audiofmt;
+	int frame_bits = ep->cur_frame_bytes * 8;
+	int tx_length_quirk = (chip->tx_length_quirk &&
 			       usb_pipeout(ep->pipe));
 
-	if (pcm_format == SNDRV_PCM_FORMAT_DSD_U16_LE && fmt->dsd_dop) {
+	usb_audio_dbg(chip, "Setting params for data EP 0x%x, pipe 0x%x\n",
+		      ep->ep_num, ep->pipe);
+
+	if (ep->cur_format == SNDRV_PCM_FORMAT_DSD_U16_LE && fmt->dsd_dop) {
 		/*
 		 * When operating in DSD DOP mode, the size of a sample frame
 		 * in hardware differs from the actual physical format width
 		 * because we need to make room for the DOP markers.
 		 */
-		frame_bits += channels << 3;
+		frame_bits += ep->cur_channels << 3;
 	}
 
 	ep->datainterval = fmt->datainterval;
 	ep->stride = frame_bits >> 3;
 
-	switch (pcm_format) {
+	switch (ep->cur_format) {
 	case SNDRV_PCM_FORMAT_U8:
 		ep->silence_value = 0x80;
 		break;
@@ -911,16 +910,16 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep,
 	else
 		ep->curpacksize = maxsize;
 
-	if (snd_usb_get_speed(ep->chip->dev) != USB_SPEED_FULL) {
+	if (snd_usb_get_speed(chip->dev) != USB_SPEED_FULL) {
 		packs_per_ms = 8 >> ep->datainterval;
 		max_packs_per_urb = MAX_PACKS_HS;
 	} else {
 		packs_per_ms = 1;
 		max_packs_per_urb = MAX_PACKS;
 	}
-	if (sync_ep && !snd_usb_endpoint_implicit_feedback_sink(ep))
+	if (ep->sync_master && !ep->implicit_fb_sync)
 		max_packs_per_urb = min(max_packs_per_urb,
-					1U << sync_ep->syncinterval);
+					1U << ep->sync_master->syncinterval);
 	max_packs_per_urb = max(1u, max_packs_per_urb >> ep->datainterval);
 
 	/*
@@ -931,9 +930,7 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep,
 	 * Playback endpoints with implicit sync much use the same parameters
 	 * as their corresponding capture endpoint.
 	 */
-	if (usb_pipein(ep->pipe) ||
-	    ep->is_implicit_feedback ||
-	    snd_usb_endpoint_implicit_feedback_sink(ep)) {
+	if (usb_pipein(ep->pipe) || ep->implicit_fb_sync) {
 
 		urb_packs = packs_per_ms;
 		/*
@@ -942,7 +939,7 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep,
 		 * allow the host controller to use bursting to fill in the
 		 * gaps.
 		 */
-		if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_WIRELESS) {
+		if (snd_usb_get_speed(chip->dev) == USB_SPEED_WIRELESS) {
 			int interval = ep->datainterval;
 			while (interval < 5) {
 				urb_packs <<= 1;
@@ -951,7 +948,7 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep,
 		}
 		/* make capture URBs <= 1 ms and smaller than a period */
 		urb_packs = min(max_packs_per_urb, urb_packs);
-		while (urb_packs > 1 && urb_packs * maxsize >= period_bytes)
+		while (urb_packs > 1 && urb_packs * maxsize >= ep->cur_period_bytes)
 			urb_packs >>= 1;
 		ep->nurbs = MAX_URBS;
 
@@ -966,12 +963,12 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep,
 		minsize = (ep->freqn >> (16 - ep->datainterval)) *
 				(frame_bits >> 3);
 		/* with sync from device, assume it can be 12% lower */
-		if (sync_ep)
+		if (ep->sync_master)
 			minsize -= minsize >> 3;
 		minsize = max(minsize, 1u);
 
 		/* how many packets will contain an entire ALSA period? */
-		max_packs_per_period = DIV_ROUND_UP(period_bytes, minsize);
+		max_packs_per_period = DIV_ROUND_UP(ep->cur_period_bytes, minsize);
 
 		/* how many URBs will contain a period? */
 		urbs_per_period = DIV_ROUND_UP(max_packs_per_period,
@@ -980,13 +977,13 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep,
 		urb_packs = DIV_ROUND_UP(max_packs_per_period, urbs_per_period);
 
 		/* limit the number of frames in a single URB */
-		ep->max_urb_frames = DIV_ROUND_UP(frames_per_period,
-					urbs_per_period);
+		ep->max_urb_frames = DIV_ROUND_UP(ep->cur_period_frames,
+						  urbs_per_period);
 
 		/* try to use enough URBs to contain an entire ALSA buffer */
 		max_urbs = min((unsigned) MAX_URBS,
 				MAX_QUEUE * packs_per_ms / urb_packs);
-		ep->nurbs = min(max_urbs, urbs_per_period * periods_per_buffer);
+		ep->nurbs = min(max_urbs, urbs_per_period * ep->cur_buffer_periods);
 	}
 
 	/* allocate and initialize data urbs */
@@ -1004,7 +1001,7 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep,
 			goto out_of_memory;
 
 		u->urb->transfer_buffer =
-			usb_alloc_coherent(ep->chip->dev, u->buffer_size,
+			usb_alloc_coherent(chip->dev, u->buffer_size,
 					   GFP_KERNEL, &u->urb->transfer_dma);
 		if (!u->urb->transfer_buffer)
 			goto out_of_memory;
@@ -1028,9 +1025,13 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep,
  */
 static int sync_ep_set_params(struct snd_usb_endpoint *ep)
 {
+	struct snd_usb_audio *chip = ep->chip;
 	int i;
 
-	ep->syncbuf = usb_alloc_coherent(ep->chip->dev, SYNC_URBS * 4,
+	usb_audio_dbg(chip, "Setting params for sync EP 0x%x, pipe 0x%x\n",
+		      ep->ep_num, ep->pipe);
+
+	ep->syncbuf = usb_alloc_coherent(chip->dev, SYNC_URBS * 4,
 					 GFP_KERNEL, &ep->sync_dma);
 	if (!ep->syncbuf)
 		return -ENOMEM;
@@ -1063,60 +1064,19 @@ static int sync_ep_set_params(struct snd_usb_endpoint *ep)
 	return -ENOMEM;
 }
 
-/**
+/*
  * snd_usb_endpoint_set_params: configure an snd_usb_endpoint
  *
- * @ep: the snd_usb_endpoint to configure
- * @pcm_format: the audio fomat.
- * @channels: the number of audio channels.
- * @period_bytes: the number of bytes in one alsa period.
- * @period_frames: the number of frames in one alsa period.
- * @buffer_periods: the number of periods in one alsa buffer.
- * @rate: the frame rate.
- * @fmt: the USB audio format information
- * @sync_ep: the sync endpoint to use, if any
- *
  * Determine the number of URBs to be used on this endpoint.
  * An endpoint must be configured before it can be started.
  * An endpoint that is already running can not be reconfigured.
  */
-int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
-				snd_pcm_format_t pcm_format,
-				unsigned int channels,
-				unsigned int period_bytes,
-				unsigned int period_frames,
-				unsigned int buffer_periods,
-				unsigned int rate,
-				struct audioformat *fmt,
-				struct snd_usb_endpoint *sync_ep)
+static int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
+				       struct snd_usb_endpoint *ep)
 {
+	const struct audioformat *fmt = ep->cur_audiofmt;
 	int err;
 
-	usb_audio_dbg(ep->chip,
-		      "Setting params for ep %x (type %s, count %d), rate=%d, format=%s, channels=%d, period_bytes=%d, periods=%d\n",
-		      ep->ep_num, ep_type_name(ep->type), ep->use_count,
-		      rate, snd_pcm_format_name(pcm_format), channels,
-		      period_bytes, buffer_periods);
-
-	if (ep->use_count != 0) {
-		bool check = ep->is_implicit_feedback &&
-			check_ep_params(ep, pcm_format, channels, period_bytes,
-					period_frames, buffer_periods, rate,
-					fmt, sync_ep);
-
-		if (!check) {
-			usb_audio_warn(ep->chip,
-				"Unable to change format on ep #%x: already in use\n",
-				ep->ep_num);
-			return -EBUSY;
-		}
-
-		usb_audio_dbg(ep->chip,
-			      "Ep #%x already in use as implicit feedback but format not changed\n",
-			      ep->ep_num);
-		return 0;
-	}
-
 	/* release old buffers, if any */
 	release_urbs(ep, 0);
 
@@ -1124,17 +1084,17 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 	ep->maxpacksize = fmt->maxpacksize;
 	ep->fill_max = !!(fmt->attributes & UAC_EP_CS_ATTR_FILL_MAX);
 
-	if (snd_usb_get_speed(ep->chip->dev) == USB_SPEED_FULL) {
-		ep->freqn = get_usb_full_speed_rate(rate);
+	if (snd_usb_get_speed(chip->dev) == USB_SPEED_FULL) {
+		ep->freqn = get_usb_full_speed_rate(ep->cur_rate);
 		ep->pps = 1000 >> ep->datainterval;
 	} else {
-		ep->freqn = get_usb_high_speed_rate(rate);
+		ep->freqn = get_usb_high_speed_rate(ep->cur_rate);
 		ep->pps = 8000 >> ep->datainterval;
 	}
 
-	ep->sample_rem = rate % ep->pps;
-	ep->packsize[0] = rate / ep->pps;
-	ep->packsize[1] = (rate + (ep->pps - 1)) / ep->pps;
+	ep->sample_rem = ep->cur_rate % ep->pps;
+	ep->packsize[0] = ep->cur_rate / ep->pps;
+	ep->packsize[1] = (ep->cur_rate + (ep->pps - 1)) / ep->pps;
 
 	/* calculate the frequency in 16.16 format */
 	ep->freqm = ep->freqn;
@@ -1144,9 +1104,7 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 
 	switch (ep->type) {
 	case  SND_USB_ENDPOINT_TYPE_DATA:
-		err = data_ep_set_params(ep, pcm_format, channels,
-					 period_bytes, period_frames,
-					 buffer_periods, fmt, sync_ep);
+		err = data_ep_set_params(ep);
 		break;
 	case  SND_USB_ENDPOINT_TYPE_SYNC:
 		err = sync_ep_set_params(ep);
@@ -1155,24 +1113,92 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 		err = -EINVAL;
 	}
 
-	usb_audio_dbg(ep->chip, "Set up %d URBS, ret=%d\n", ep->nurbs, err);
+	usb_audio_dbg(chip, "Set up %d URBS, ret=%d\n", ep->nurbs, err);
 
 	if (err < 0)
 		return err;
 
-	/* record the current set up in the endpoint (for implicit fb) */
-	spin_lock_irq(&ep->lock);
-	ep->cur_rate = rate;
-	ep->cur_channels = channels;
-	ep->cur_format = pcm_format;
-	ep->cur_period_frames = period_frames;
-	ep->cur_period_bytes = period_bytes;
-	ep->cur_buffer_periods = buffer_periods;
-	spin_unlock_irq(&ep->lock);
+	/* some unit conversions in runtime */
+	ep->maxframesize = ep->maxpacksize / ep->cur_frame_bytes;
+	ep->curframesize = ep->curpacksize / ep->cur_frame_bytes;
 
 	return 0;
 }
 
+/*
+ * snd_usb_endpoint_configure: Configure the endpoint
+ *
+ * This function sets up the EP to be fully usable state.
+ * It's called either from hw_params or prepare callback.
+ * The function checks need_setup flag, and perfoms nothing unless needed,
+ * so it's safe to call this multiple times.
+ *
+ * This returns zero if unchanged, 1 if the configuration has changed,
+ * or a negative error code.
+ */
+int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
+			       struct snd_usb_endpoint *ep)
+{
+	bool iface_first;
+	int err = 0;
+
+	mutex_lock(&chip->mutex);
+	if (!ep->need_setup)
+		goto unlock;
+
+	/* No need to (re-)configure the sync EP belonging to the same altset */
+	if (ep->ep_idx) {
+		err = snd_usb_endpoint_set_params(chip, ep);
+		if (err < 0)
+			goto unlock;
+		goto done;
+	}
+
+	/* Need to deselect altsetting at first */
+	endpoint_set_interface(chip, ep, false);
+
+	/* Some UAC1 devices (e.g. Yamaha THR10) need the host interface
+	 * to be set up before parameter setups
+	 */
+	iface_first = ep->cur_audiofmt->protocol == UAC_VERSION_1;
+	if (iface_first) {
+		err = endpoint_set_interface(chip, ep, true);
+		if (err < 0)
+			goto unlock;
+	}
+
+	err = snd_usb_init_pitch(chip, ep->cur_audiofmt);
+	if (err < 0)
+		goto unlock;
+
+	err = snd_usb_init_sample_rate(chip, ep->cur_audiofmt, ep->cur_rate);
+	if (err < 0)
+		goto unlock;
+
+	err = snd_usb_endpoint_set_params(chip, ep);
+	if (err < 0)
+		goto unlock;
+
+	err = snd_usb_select_mode_quirk(chip, ep->cur_audiofmt);
+	if (err < 0)
+		goto unlock;
+
+	/* for UAC2/3, enable the interface altset here at last */
+	if (!iface_first) {
+		err = endpoint_set_interface(chip, ep, true);
+		if (err < 0)
+			goto unlock;
+	}
+
+ done:
+	ep->need_setup = false;
+	err = 1;
+
+unlock:
+	mutex_unlock(&chip->mutex);
+	return err;
+}
+
 /**
  * snd_usb_endpoint_start: start an snd_usb_endpoint
  *
@@ -1194,6 +1220,9 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	if (atomic_read(&ep->chip->shutdown))
 		return -EBADFD;
 
+	if (ep->sync_master)
+		WRITE_ONCE(ep->sync_master->sync_slave, ep);
+
 	usb_audio_dbg(ep->chip, "Starting %s EP 0x%x (count %d)\n",
 		      ep_type_name(ep->type), ep->ep_num, ep->use_count);
 
@@ -1226,6 +1255,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 			list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
 		}
 
+		usb_audio_dbg(ep->chip, "No URB submission due to implicit fb sync\n");
 		return 0;
 	}
 
@@ -1251,9 +1281,13 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 		set_bit(i, &ep->active_mask);
 	}
 
+	usb_audio_dbg(ep->chip, "%d URBs submitted for EP 0x%x\n",
+		      ep->nurbs, ep->ep_num);
 	return 0;
 
 __error:
+	if (ep->sync_master)
+		WRITE_ONCE(ep->sync_master->sync_slave, NULL);
 	clear_bit(EP_FLAG_RUNNING, &ep->flags);
 	ep->use_count--;
 	deactivate_urbs(ep, false);
@@ -1285,39 +1319,15 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
 	if (snd_BUG_ON(ep->use_count == 0))
 		return;
 
+	if (ep->sync_master)
+		WRITE_ONCE(ep->sync_master->sync_slave, NULL);
+
 	if (--ep->use_count == 0) {
 		deactivate_urbs(ep, false);
 		set_bit(EP_FLAG_STOPPING, &ep->flags);
 	}
 }
 
-/**
- * snd_usb_endpoint_deactivate: deactivate an snd_usb_endpoint
- *
- * @ep: the endpoint to deactivate
- *
- * If the endpoint is not currently in use, this functions will
- * deactivate its associated URBs.
- *
- * In case of any active users, this functions does nothing.
- */
-void snd_usb_endpoint_deactivate(struct snd_usb_endpoint *ep)
-{
-	if (!ep)
-		return;
-
-	if (ep->use_count != 0)
-		return;
-
-	deactivate_urbs(ep, true);
-	wait_clear_urbs(ep);
-
-	/* clear the saved hw params */
-	spin_lock_irq(&ep->lock);
-	ep->cur_rate = 0;
-	spin_unlock_irq(&ep->lock);
-}
-
 /**
  * snd_usb_endpoint_release: Tear down an snd_usb_endpoint
  *
@@ -1343,7 +1353,7 @@ void snd_usb_endpoint_free(struct snd_usb_endpoint *ep)
 	kfree(ep);
 }
 
-/**
+/*
  * snd_usb_handle_sync_urb: parse an USB sync packet
  *
  * @ep: the endpoint to handle the packet
@@ -1353,9 +1363,9 @@ void snd_usb_endpoint_free(struct snd_usb_endpoint *ep)
  * This function is called from the context of an endpoint that received
  * the packet and is used to let another endpoint object handle the payload.
  */
-void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
-			     struct snd_usb_endpoint *sender,
-			     const struct urb *urb)
+static void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
+				    struct snd_usb_endpoint *sender,
+				    const struct urb *urb)
 {
 	int shift;
 	unsigned int f;
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index e2fddb3dcf7a..2bfa6d3e029c 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -10,16 +10,25 @@ struct snd_usb_endpoint *snd_usb_get_endpoint(struct snd_usb_audio *chip,
 
 int snd_usb_add_endpoint(struct snd_usb_audio *chip, int ep_num, int type);
 
-int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
-				snd_pcm_format_t pcm_format,
-				unsigned int channels,
-				unsigned int period_bytes,
-				unsigned int period_frames,
-				unsigned int buffer_periods,
-				unsigned int rate,
-				struct audioformat *fmt,
-				struct snd_usb_endpoint *sync_ep);
-
+struct snd_usb_endpoint *
+snd_usb_endpoint_open(struct snd_usb_audio *chip,
+		      struct audioformat *fp,
+		      const struct snd_pcm_hw_params *params,
+		      bool is_sync_ep);
+void snd_usb_endpoint_close(struct snd_usb_audio *chip,
+			    struct snd_usb_endpoint *ep);
+int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
+			       struct snd_usb_endpoint *ep);
+void snd_usb_endpoint_suspend(struct snd_usb_endpoint *ep);
+
+bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
+				 struct snd_usb_endpoint *ep,
+				 const struct audioformat *fp,
+				 const struct snd_pcm_hw_params *params);
+
+void snd_usb_endpoint_set_sync(struct snd_usb_audio *chip,
+			       struct snd_usb_endpoint *data_ep,
+			       struct snd_usb_endpoint *sync_ep);
 void snd_usb_endpoint_set_callback(struct snd_usb_endpoint *ep,
 				   void (*prepare)(struct snd_usb_substream *subs,
 						   struct urb *urb),
@@ -27,23 +36,16 @@ void snd_usb_endpoint_set_callback(struct snd_usb_endpoint *ep,
 						  struct urb *urb),
 				   struct snd_usb_substream *data_subs);
 
-int  snd_usb_endpoint_start(struct snd_usb_endpoint *ep);
+int snd_usb_endpoint_start(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_sync_pending_stop(struct snd_usb_endpoint *ep);
+void snd_usb_endpoint_suspend(struct snd_usb_endpoint *ep);
 int  snd_usb_endpoint_activate(struct snd_usb_endpoint *ep);
-void snd_usb_endpoint_deactivate(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_release(struct snd_usb_endpoint *ep);
 void snd_usb_endpoint_free(struct snd_usb_endpoint *ep);
 
 int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_slave_next_packet_size(struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep);
-void snd_usb_endpoint_set_syncinterval(struct snd_usb_audio *chip,
-				       struct snd_usb_endpoint *ep,
-				       struct usb_host_interface *alts);
-
-void snd_usb_handle_sync_urb(struct snd_usb_endpoint *ep,
-			     struct snd_usb_endpoint *sender,
-			     const struct urb *urb);
 
 #endif /* __USBAUDIO_ENDPOINT_H */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 45a692512d27..e80e8cf1e863 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -80,21 +80,22 @@ static snd_pcm_uframes_t snd_usb_pcm_pointer(struct snd_pcm_substream *substream
 /*
  * find a matching audio format
  */
-static struct audioformat *find_format(struct list_head *fmt_list_head,
-				       snd_pcm_format_t format,
-				       unsigned int rate,
-				       unsigned int channels,
-				       struct snd_usb_substream *subs)
+static struct audioformat *
+find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
+	    unsigned int rate, unsigned int channels, bool strict_match,
+	    struct snd_usb_substream *subs)
 {
 	struct audioformat *fp;
 	struct audioformat *found = NULL;
 	int cur_attr = 0, attr;
 
 	list_for_each_entry(fp, fmt_list_head, list) {
-		if (!(fp->formats & pcm_format_to_bits(format)))
-			continue;
-		if (fp->channels != channels)
-			continue;
+		if (strict_match) {
+			if (!(fp->formats & pcm_format_to_bits(format)))
+				continue;
+			if (fp->channels != channels)
+				continue;
+		}
 		if (rate < fp->rate_min || rate > fp->rate_max)
 			continue;
 		if (!(fp->rates & SNDRV_PCM_RATE_CONTINUOUS)) {
@@ -140,38 +141,30 @@ static struct audioformat *find_format(struct list_head *fmt_list_head,
 	return found;
 }
 
-static struct audioformat *find_substream_format(struct snd_usb_substream *subs)
+static struct audioformat *
+find_substream_format(struct snd_usb_substream *subs,
+		      const struct snd_pcm_hw_params *params)
 {
-	return find_format(&subs->fmt_list, subs->pcm_format, subs->cur_rate,
-			   subs->channels, subs);
+	return find_format(&subs->fmt_list, params_format(params),
+			   params_rate(params), params_channels(params),
+			   true, subs);
 }
 
-static int init_pitch_v1(struct snd_usb_audio *chip,
-			 struct audioformat *fmt)
+static int init_pitch_v1(struct snd_usb_audio *chip, int ep)
 {
 	struct usb_device *dev = chip->dev;
-	unsigned int ep;
 	unsigned char data[1];
 	int err;
 
-	ep = fmt->endpoint;
-
 	data[0] = 1;
 	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), UAC_SET_CUR,
 			      USB_TYPE_CLASS|USB_RECIP_ENDPOINT|USB_DIR_OUT,
 			      UAC_EP_CS_ATTR_PITCH_CONTROL << 8, ep,
 			      data, sizeof(data));
-	if (err < 0) {
-		usb_audio_err(chip, "%d:%d: cannot set enable PITCH\n",
-			      fmt->iface, ep);
-		return err;
-	}
-
-	return 0;
+	return err;
 }
 
-static int init_pitch_v2(struct snd_usb_audio *chip,
-			 struct audioformat *fmt)
+static int init_pitch_v2(struct snd_usb_audio *chip, int ep)
 {
 	struct usb_device *dev = chip->dev;
 	unsigned char data[1];
@@ -182,13 +175,7 @@ static int init_pitch_v2(struct snd_usb_audio *chip,
 			      USB_TYPE_CLASS | USB_RECIP_ENDPOINT | USB_DIR_OUT,
 			      UAC2_EP_CS_PITCH << 8, 0,
 			      data, sizeof(data));
-	if (err < 0) {
-		usb_audio_err(chip, "%d:%d: cannot set enable PITCH (v2)\n",
-			      fmt->iface, fmt->altsetting);
-		return err;
-	}
-
-	return 0;
+	return err;
 }
 
 /*
@@ -197,29 +184,47 @@ static int init_pitch_v2(struct snd_usb_audio *chip,
 int snd_usb_init_pitch(struct snd_usb_audio *chip,
 		       struct audioformat *fmt)
 {
+	int err;
+
 	/* if endpoint doesn't have pitch control, bail out */
 	if (!(fmt->attributes & UAC_EP_CS_ATTR_PITCH_CONTROL))
 		return 0;
 
+	usb_audio_dbg(chip, "enable PITCH for EP 0x%x\n", fmt->endpoint);
+
 	switch (fmt->protocol) {
 	case UAC_VERSION_1:
+		err = init_pitch_v1(chip, fmt->endpoint);
+		break;
+	case UAC_VERSION_2:
+		err = init_pitch_v2(chip, fmt->endpoint);
+		break;
 	default:
-		return init_pitch_v1(chip, fmt);
+		return 0;
+	}
 
-	case UAC_VERSION_2:
-		return init_pitch_v2(chip, fmt);
+	if (err < 0) {
+		usb_audio_err(chip, "failed to enable PITCH for EP 0x%x\n",
+			      fmt->endpoint);
+		return err;
 	}
+
+	return 0;
 }
 
-static void stop_endpoints(struct snd_usb_substream *subs)
+static bool stop_endpoints(struct snd_usb_substream *subs)
 {
+	bool stopped = 0;
+
 	if (test_and_clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
 		snd_usb_endpoint_stop(subs->sync_endpoint);
-		subs->sync_endpoint->sync_slave = NULL;
+		stopped = true;
 	}
-
-	if (test_and_clear_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags))
+	if (test_and_clear_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags)) {
 		snd_usb_endpoint_stop(subs->data_endpoint);
+		stopped = true;
+	}
+	return stopped;
 }
 
 static int start_endpoints(struct snd_usb_substream *subs)
@@ -230,9 +235,7 @@ static int start_endpoints(struct snd_usb_substream *subs)
 		return -EINVAL;
 
 	if (!test_and_set_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags)) {
-		struct snd_usb_endpoint *ep = subs->data_endpoint;
-
-		err = snd_usb_endpoint_start(ep);
+		err = snd_usb_endpoint_start(subs->data_endpoint);
 		if (err < 0) {
 			clear_bit(SUBSTREAM_FLAG_DATA_EP_STARTED, &subs->flags);
 			goto error;
@@ -241,13 +244,9 @@ static int start_endpoints(struct snd_usb_substream *subs)
 
 	if (subs->sync_endpoint &&
 	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
-		struct snd_usb_endpoint *ep = subs->sync_endpoint;
-
-		ep->sync_slave = subs->data_endpoint;
-		err = snd_usb_endpoint_start(ep);
+		err = snd_usb_endpoint_start(subs->sync_endpoint);
 		if (err < 0) {
 			clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
-			ep->sync_slave = NULL;
 			goto error;
 		}
 	}
@@ -446,6 +445,7 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 	fmt->sync_ep = ep;
 	fmt->sync_iface = ifnum;
 	fmt->sync_altsetting = alts->desc.bAlternateSetting;
+	fmt->sync_ep_idx = 0;
 	fmt->implicit_fb = 1;
 	dev_dbg(&dev->dev, "%d:%d: found implicit_fb sync_ep=%x, iface=%d, alt=%d\n",
 		fmt->iface, fmt->altsetting, fmt->sync_ep, fmt->sync_iface,
@@ -527,6 +527,7 @@ int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 	fmt->sync_ep = ep;
 	fmt->sync_iface = altsd->bInterfaceNumber;
 	fmt->sync_altsetting = altsd->bAlternateSetting;
+	fmt->sync_ep_idx = 1;
 	if ((sync_attr & USB_ENDPOINT_USAGE_MASK) == USB_ENDPOINT_USAGE_IMPLICIT_FB)
 		fmt->implicit_fb = 1;
 
@@ -537,152 +538,6 @@ int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 	return 0;
 }
 
-static int set_sync_endpoint(struct snd_usb_substream *subs,
-			     struct audioformat *fmt)
-{
-	struct usb_device *dev = subs->dev;
-	struct usb_host_interface *alts;
-	struct snd_usb_audio *chip = subs->stream->chip;
-	int is_playback = subs->direction == SNDRV_PCM_STREAM_PLAYBACK;
-	unsigned int ep;
-	int err;
-
-	subs->sync_endpoint = NULL;
-	subs->data_endpoint->sync_master = NULL;
-
-	ep = fmt->sync_ep;
-	if (!ep)
-		return 0;
-
-	alts = snd_usb_get_host_interface(subs->stream->chip, fmt->sync_iface,
-					  fmt->altsetting);
-	if (!alts)
-		return 0;
-
-	subs->sync_endpoint = snd_usb_get_endpoint(chip, ep);
-	if (!subs->sync_endpoint) {
-		if (is_playback &&
-		    (fmt->ep_attr & USB_ENDPOINT_SYNCTYPE) == USB_ENDPOINT_SYNC_NONE)
-			return 0;
-		return -EINVAL;
-	}
-
-	subs->sync_endpoint->iface = fmt->sync_iface;
-	subs->sync_endpoint->altsetting = fmt->sync_altsetting;
-	subs->sync_endpoint->is_implicit_feedback = fmt->implicit_fb;
-
-	subs->data_endpoint->sync_master = subs->sync_endpoint;
-
-	snd_usb_endpoint_set_syncinterval(subs->stream->chip, subs->sync_endpoint, alts);
-
-	if (!subs->sync_endpoint->use_count &&
-	    (subs->data_endpoint->iface != subs->sync_endpoint->iface ||
-	     subs->data_endpoint->altsetting != subs->sync_endpoint->altsetting)) {
-		err = usb_set_interface(subs->dev,
-					subs->sync_endpoint->iface,
-					subs->sync_endpoint->altsetting);
-		if (err < 0)
-			return err;
-		dev_dbg(&dev->dev, "setting usb interface %d:%d\n",
-			subs->sync_endpoint->iface,
-			subs->sync_endpoint->altsetting);
-		snd_usb_set_interface_quirk(chip);
-	}
-
-	return 0;
-}
-
-/*
- * find a matching format and set up the interface
- */
-static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
-{
-	struct usb_device *dev = subs->dev;
-	struct snd_usb_audio *chip = subs->stream->chip;
-	struct usb_host_interface *alts;
-	struct usb_interface *iface;
-	struct snd_usb_endpoint *ep;
-	int err;
-
-	iface = usb_ifnum_to_if(dev, fmt->iface);
-	if (WARN_ON(!iface))
-		return -EINVAL;
-	alts = usb_altnum_to_altsetting(iface, fmt->altsetting);
-	if (WARN_ON(!alts))
-		return -EINVAL;
-
-	if (fmt == subs->cur_audiofmt && !subs->need_setup_fmt)
-		return 0;
-
-	/* shared EP with implicit fb */
-	if (fmt->implicit_fb && !subs->need_setup_fmt) {
-		ep = snd_usb_get_endpoint(chip, fmt->endpoint);
-		if (ep && ep->use_count > 0)
-			goto add_data_ep;
-	}
-
-	/* close the old interface */
-	if (subs->interface >= 0 && (subs->interface != fmt->iface || subs->need_setup_fmt)) {
-		err = usb_set_interface(subs->dev, subs->interface, 0);
-		if (err < 0) {
-			dev_err(&dev->dev,
-				"%d:%d: return to setting 0 failed (%d)\n",
-				fmt->iface, fmt->altsetting, err);
-			return -EIO;
-		}
-		subs->interface = -1;
-		subs->altset_idx = 0;
-	}
-
-	if (subs->need_setup_fmt)
-		subs->need_setup_fmt = false;
-
-	/* set interface */
-	if (iface->cur_altsetting != alts) {
-		err = snd_usb_select_mode_quirk(chip, fmt);
-		if (err < 0)
-			return -EIO;
-
-		err = usb_set_interface(dev, fmt->iface, fmt->altsetting);
-		if (err < 0) {
-			dev_err(&dev->dev,
-				"%d:%d: usb_set_interface failed (%d)\n",
-				fmt->iface, fmt->altsetting, err);
-			return -EIO;
-		}
-		dev_dbg(&dev->dev, "setting usb interface %d:%d\n",
-			fmt->iface, fmt->altsetting);
-		snd_usb_set_interface_quirk(chip);
-	}
-
-	subs->need_setup_ep = true;
-
- add_data_ep:
-	subs->interface = fmt->iface;
-	subs->altset_idx = fmt->altset_idx;
-	subs->data_endpoint = snd_usb_get_endpoint(chip, fmt->endpoint);
-	if (!subs->data_endpoint)
-		return -EINVAL;
-	subs->data_endpoint->iface = fmt->iface;
-	subs->data_endpoint->altsetting = fmt->altsetting;
-
-	err = set_sync_endpoint(subs, fmt);
-	if (err < 0)
-		return err;
-
-	if (subs->need_setup_ep) {
-		err = snd_usb_init_pitch(chip, fmt);
-		if (err < 0)
-			return err;
-	}
-
-	subs->cur_audiofmt = fmt;
-
-	snd_usb_set_format_quirk(subs, fmt);
-
-	return 0;
-}
-
 /*
  * Return the score of matching two audioformats.
  * Veto the audioformat if:
@@ -691,8 +546,8 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
  * - Requested sample rate is not supported.
  */
 static int match_endpoint_audioformats(struct snd_usb_substream *subs,
-				       struct audioformat *fp,
-				       struct audioformat *match, int rate,
+				       const struct audioformat *fp,
+				       int rate, int channels,
 				       snd_pcm_format_t pcm_format)
 {
 	int i, score;
@@ -716,108 +571,12 @@ static int match_endpoint_audioformats(struct snd_usb_substream *subs,
 	}
 
 	score = 1;
-	if (fp->channels == match->channels)
+	if (fp->channels == channels)
 		score++;
 
 	return score;
 }
 
-/*
- * Configure the sync ep using the rate and pcm format of the data ep.
- */
-static int configure_sync_endpoint(struct snd_usb_substream *subs)
-{
-	struct audioformat *fp;
-	struct audioformat *sync_fp = NULL;
-	int cur_score = 0;
-	int sync_period_bytes = subs->period_bytes;
-	struct snd_usb_substream *sync_subs =
-		&subs->stream->substream[subs->direction ^ 1];
-
-	if (subs->fixed_hw ||
-	    !subs->sync_endpoint->is_implicit_feedback) {
-		sync_fp = subs->cur_audiofmt;
-		goto configure;
-	}
-
-	sync_fp = find_format(&sync_subs->fmt_list, subs->pcm_format,
-			      subs->cur_rate, subs->channels, NULL);
-	if (sync_fp)
-		goto configure;
-
-	/* Try to find the best matching audioformat. */
-	list_for_each_entry(fp, &sync_subs->fmt_list, list) {
-		int score = match_endpoint_audioformats(subs,
-							fp, subs->cur_audiofmt,
-			subs->cur_rate, subs->pcm_format);
-
-		if (score > cur_score) {
-			sync_fp = fp;
-			cur_score = score;
-		}
-	}
-
-	if (unlikely(sync_fp == NULL)) {
-		dev_err(&subs->dev->dev,
-			"%s: no valid audioformat for sync ep %x found\n",
-			__func__, sync_subs->ep_num);
-		return -EINVAL;
-	}
-
-	/*
-	 * Recalculate the period bytes if channel number differ between
-	 * data and sync ep audioformat.
-	 */
-	if (sync_fp->channels != subs->channels) {
-		sync_period_bytes = (subs->period_bytes / subs->channels) *
-			sync_fp->channels;
-		dev_dbg(&subs->dev->dev,
-			"%s: adjusted sync ep period bytes (%d -> %d)\n",
-			__func__, subs->period_bytes, sync_period_bytes);
-	}
-
- configure:
-	return snd_usb_endpoint_set_params(subs->sync_endpoint,
-					   subs->pcm_format,
-					   sync_fp->channels,
-					   sync_period_bytes,
-					   subs->period_frames,
-					   subs->buffer_periods,
-					   subs->cur_rate,
-					   sync_fp,
-					   NULL);
-}
-
-/*
- * configure endpoint params
- *
- * called  during initial setup and upon resume
- */
-static int configure_endpoint(struct snd_usb_substream *subs)
-{
-	int ret;
-
-	/* format changed */
-	stop_endpoints(subs);
-	sync_pending_stops(subs);
-	ret = snd_usb_endpoint_set_params(subs->data_endpoint,
-					  subs->pcm_format,
-					  subs->channels,
-					  subs->period_bytes,
-					  subs->period_frames,
-					  subs->buffer_periods,
-					  subs->cur_rate,
-					  subs->cur_audiofmt,
-					  subs->sync_endpoint);
-	if (ret < 0)
-		return ret;
-
-	if (subs->sync_endpoint)
-		ret = configure_sync_endpoint(subs);
-
-	return ret;
-}
-
 static int snd_usb_pcm_change_state(struct snd_usb_substream *subs, int state)
 {
 	int ret;
@@ -866,6 +625,92 @@ int snd_usb_pcm_resume(struct snd_usb_stream *as)
 	return 0;
 }
 
+static struct snd_usb_substream *
+find_matching_substream(struct snd_usb_audio *chip, int stream, int ep_num,
+			int fmt_type)
+{
+	struct snd_usb_stream *as;
+	struct snd_usb_substream *subs;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		subs = &as->substream[stream];
+		if (as->fmt_type == fmt_type && subs->ep_num == ep_num)
+			return subs;
+	}
+
+	return NULL;
+}
+
+static struct audioformat *
+find_implicit_fb_sync_format(struct snd_usb_audio *chip,
+			     const struct audioformat *target,
+			     const struct snd_pcm_hw_params *params,
+			     int stream)
+{
+	struct snd_usb_substream *subs;
+	struct audioformat *fp, *sync_fmt;
+	int score, high_score;
+
+	subs = find_matching_substream(chip, stream, target->sync_ep,
+				       target->fmt_type);
+	if (!subs)
+		return NULL;
+
+	sync_fmt = NULL;
+	high_score = 0;
+	list_for_each_entry(fp, &subs->fmt_list, list) {
+		score = match_endpoint_audioformats(subs, fp,
+						    params_rate(params),
+						    params_channels(params),
+						    params_format(params));
+		if (score > high_score) {
+			sync_fmt = fp;
+			high_score = score;
+		}
+	}
+
+	return sync_fmt;
+}
+
+static void close_endpoints(struct snd_usb_audio *chip,
+			    struct snd_usb_substream *subs)
+{
+	if (subs->data_endpoint) {
+		snd_usb_endpoint_set_sync(chip, subs->data_endpoint, NULL);
+		snd_usb_endpoint_close(chip, subs->data_endpoint);
+		subs->data_endpoint = NULL;
+	}
+
+	if (subs->sync_endpoint) {
+		snd_usb_endpoint_close(chip, subs->sync_endpoint);
+		subs->sync_endpoint = NULL;
+	}
+}
+
+static int configure_endpoints(struct snd_usb_audio *chip,
+			       struct snd_usb_substream *subs)
+{
+	int err;
+
+	if (subs->data_endpoint->need_setup) {
+		/* stop any running stream beforehand */
+		if (stop_endpoints(subs))
+			sync_pending_stops(subs);
+		err = snd_usb_endpoint_configure(chip, subs->data_endpoint);
+		if (err < 0)
+			return err;
+		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
+	}
+
+	if (subs->sync_endpoint) {
+		err = snd_usb_endpoint_configure(chip, subs->sync_endpoint);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
 /*
  * hw_params callback
  *
@@ -880,30 +725,45 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
+	struct snd_usb_audio *chip = subs->stream->chip;
 	struct audioformat *fmt;
+	struct audioformat *sync_fmt;
 	int ret;
 
 	ret = snd_media_start_pipeline(subs);
 	if (ret)
 		return ret;
 
-	subs->pcm_format = params_format(hw_params);
-	subs->period_bytes = params_period_bytes(hw_params);
-	subs->period_frames = params_period_size(hw_params);
-	subs->buffer_periods = params_periods(hw_params);
-	subs->channels = params_channels(hw_params);
-	subs->cur_rate = params_rate(hw_params);
-
-	fmt = find_substream_format(subs);
+	fmt = find_substream_format(subs, hw_params);
 	if (!fmt) {
-		dev_dbg(&subs->dev->dev,
-			"cannot set format: format = %#x, rate = %d, channels = %d\n",
-			   subs->pcm_format, subs->cur_rate, subs->channels);
+		usb_audio_dbg(chip,
+			      "cannot find format: format=%s, rate=%d, channels=%d\n",
+			      snd_pcm_format_name(params_format(hw_params)),
+			      params_rate(hw_params), params_channels(hw_params));
 		ret = -EINVAL;
 		goto stop_pipeline;
 	}
 
-	ret = snd_usb_lock_shutdown(subs->stream->chip);
+	if (fmt->implicit_fb &&
+	    (fmt->iface != fmt->sync_iface ||
+	     fmt->altsetting != fmt->sync_altsetting)) {
+		sync_fmt = find_implicit_fb_sync_format(chip, fmt, hw_params,
+							!substream->stream);
+		if (!sync_fmt) {
+			usb_audio_dbg(chip,
+				      "cannot find sync format: ep=0x%x, iface=%d:%d, format=%s, rate=%d, channels=%d\n",
+				      fmt->sync_ep, fmt->sync_iface,
+				      fmt->sync_altsetting,
+				      snd_pcm_format_name(params_format(hw_params)),
+				      params_rate(hw_params), params_channels(hw_params));
+			ret = -EINVAL;
+			goto stop_pipeline;
+		}
+	} else {
+		sync_fmt = fmt;
+	}
+
+	ret = snd_usb_lock_shutdown(chip);
 	if (ret < 0)
 		goto stop_pipeline;
 
@@ -911,18 +771,56 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		goto unlock;
 
-	ret = set_format(subs, fmt);
+	if (subs->data_endpoint) {
+		if (snd_usb_endpoint_compatible(chip, subs->data_endpoint,
+						fmt, hw_params))
+			goto unlock;
+		close_endpoints(chip, subs);
+	}
+
+	subs->data_endpoint = snd_usb_endpoint_open(chip, fmt, hw_params, false);
+	if (!subs->data_endpoint) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if (fmt->sync_ep) {
+		subs->sync_endpoint = snd_usb_endpoint_open(chip, sync_fmt,
+							    hw_params,
+							    fmt == sync_fmt);
+		if (!subs->sync_endpoint) {
+			ret = -EINVAL;
+			goto unlock;
+		}
+
+		snd_usb_endpoint_set_sync(chip, subs->data_endpoint,
+					  subs->sync_endpoint);
+	}
+
+	subs->interface = fmt->iface;
+	subs->altset_idx = fmt->altset_idx;
+	subs->cur_audiofmt = fmt;
+
+	ret = configure_endpoints(chip, subs);
 	if (ret < 0)
 		goto unlock;
 
+	subs->pcm_format = params_format(hw_params);
+	subs->period_bytes = params_period_bytes(hw_params);
+	subs->period_frames = params_period_size(hw_params);
+	subs->buffer_periods = params_periods(hw_params);
+	subs->channels = params_channels(hw_params);
+	subs->cur_rate = params_rate(hw_params);
+
  unlock:
-	snd_usb_unlock_shutdown(subs->stream->chip);
 	if (ret < 0)
-		goto stop_pipeline;
-	return ret;
+		close_endpoints(chip, subs);
 
+	snd_usb_unlock_shutdown(chip);
  stop_pipeline:
-	snd_media_stop_pipeline(subs);
+	if (ret < 0)
+		snd_media_stop_pipeline(subs);
+
 	return ret;
 }
 
@@ -941,15 +839,9 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 	subs->cur_rate = 0;
 	subs->period_bytes = 0;
 	if (!snd_usb_lock_shutdown(chip)) {
-		stop_endpoints(subs);
-		sync_pending_stops(subs);
-		snd_usb_endpoint_deactivate(subs->sync_endpoint);
-		snd_usb_endpoint_deactivate(subs->data_endpoint);
-		if (subs->data_endpoint) {
-			subs->data_endpoint->sync_master = NULL;
-			subs->data_endpoint = NULL;
-		}
-		subs->sync_endpoint = NULL;
+		if (stop_endpoints(subs))
+			sync_pending_stops(subs);
+		close_endpoints(chip, subs);
 		snd_usb_unlock_shutdown(chip);
 	}
 
@@ -965,16 +857,10 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_usb_substream *subs = runtime->private_data;
-	struct usb_host_interface *alts;
-	struct usb_interface *iface;
+	struct snd_usb_audio *chip = subs->stream->chip;
 	int ret;
 
-	if (! subs->cur_audiofmt) {
-		dev_err(&subs->dev->dev, "no format is specified!\n");
-		return -ENXIO;
-	}
-
-	ret = snd_usb_lock_shutdown(subs->stream->chip);
+	ret = snd_usb_lock_shutdown(chip);
 	if (ret < 0)
 		return ret;
 	if (snd_BUG_ON(!subs->data_endpoint)) {
@@ -982,36 +868,10 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 		goto unlock;
 	}
 
-	ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D0);
-	if (ret < 0)
-		goto unlock;
-
-	ret = set_format(subs, subs->cur_audiofmt);
+	ret = configure_endpoints(chip, subs);
 	if (ret < 0)
 		goto unlock;
 
-	if (subs->need_setup_ep) {
-
-		iface = usb_ifnum_to_if(subs->dev, subs->cur_audiofmt->iface);
-		alts = &iface->altsetting[subs->cur_audiofmt->altset_idx];
-		ret = snd_usb_init_sample_rate(subs->stream->chip,
-					       subs->cur_audiofmt,
-					       subs->cur_rate);
-		if (ret < 0)
-			goto unlock;
-
-		ret = configure_endpoint(subs);
-		if (ret < 0)
-			goto unlock;
-		subs->need_setup_ep = false;
-	}
-
-	/* some unit conversions in runtime */
-	subs->data_endpoint->maxframesize =
-		bytes_to_frames(runtime, subs->data_endpoint->maxpacksize);
-	subs->data_endpoint->curframesize =
-		bytes_to_frames(runtime, subs->data_endpoint->curpacksize);
-
 	/* reset the pointer */
 	subs->hwptr_done = 0;
 	subs->transfer_done = 0;
@@ -1025,7 +885,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 		ret = start_endpoints(subs);
 
  unlock:
-	snd_usb_unlock_shutdown(subs->stream->chip);
+	snd_usb_unlock_shutdown(chip);
 	return ret;
 }
 
@@ -1047,6 +907,8 @@ static const struct snd_pcm_hardware snd_usb_hardware =
 				SNDRV_PCM_INFO_INTERLEAVED |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_PAUSE,
+	.channels_min =		1,
+	.channels_max =		256,
 	.buffer_bytes_max =	1024 * 1024,
 	.period_bytes_min =	64,
 	.period_bytes_max =	512 * 1024,
@@ -1250,7 +1112,6 @@ static int apply_hw_constraint_from_sync(struct snd_pcm_runtime *runtime,
 	struct audioformat *fp;
 	int err;
 
-	subs->fixed_hw = 0;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		ep = snd_usb_get_endpoint(chip, fp->endpoint);
 		if (ep && ep->cur_rate)
@@ -1266,7 +1127,7 @@ static int apply_hw_constraint_from_sync(struct snd_pcm_runtime *runtime,
 
  found:
 	if (!find_format(&subs->fmt_list, ep->cur_format, ep->cur_rate,
-			 ep->cur_channels, NULL)) {
+			 ep->cur_channels, false, NULL)) {
 		usb_audio_dbg(chip, "EP 0x%x being used, but not applicable\n",
 			      ep->ep_num);
 		return 0;
@@ -1274,19 +1135,23 @@ static int apply_hw_constraint_from_sync(struct snd_pcm_runtime *runtime,
 
 	usb_audio_dbg(chip, "EP 0x%x being used, using fixed params:\n",
 		      ep->ep_num);
-	usb_audio_dbg(chip, "rate=%d, format=%s, channels=%d, period_size=%d, periods=%d\n",
-		      ep->cur_rate, snd_pcm_format_name(ep->cur_format),
-		      ep->cur_channels, ep->cur_period_frames,
+	usb_audio_dbg(chip, "rate=%d, period_size=%d, periods=%d\n",
+		      ep->cur_rate, ep->cur_period_frames,
 		      ep->cur_buffer_periods);
 
-	runtime->hw.formats = pcm_format_to_bits(ep->cur_format);
+	runtime->hw.formats = subs->formats;
 	runtime->hw.rate_min = runtime->hw.rate_max = ep->cur_rate;
-	runtime->hw.channels_min = runtime->hw.channels_max =
-		ep->cur_channels;
 	runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
 	runtime->hw.periods_min = runtime->hw.periods_max =
 		ep->cur_buffer_periods;
-	subs->fixed_hw = 1;
+
+	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				  hw_rule_channels, subs,
+				  SNDRV_PCM_HW_PARAM_FORMAT,
+				  SNDRV_PCM_HW_PARAM_RATE,
+				  -1);
+	if (err < 0)
+		return err;
 
 	err = snd_pcm_hw_constraint_minmax(runtime,
 					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
@@ -1442,9 +1307,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 
 	snd_media_stop_pipeline(subs);
 
-	if (subs->interface >= 0 &&
-	    !snd_usb_lock_shutdown(subs->stream->chip)) {
-		usb_set_interface(subs->dev, subs->interface, 0);
+	if (!snd_usb_lock_shutdown(subs->stream->chip)) {
 		subs->interface = -1;
 		ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D1);
 		snd_usb_unlock_shutdown(subs->stream->chip);
@@ -1823,15 +1686,19 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 					      retire_playback_urb,
 					      subs);
 		subs->running = 1;
+		dev_dbg(&subs->dev->dev, "%d:%d Start Playback PCM\n",
+			subs->cur_audiofmt->iface,
+			subs->cur_audiofmt->altsetting);
 		return 0;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		subs->need_setup_fmt = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 		stop_endpoints(subs);
 		snd_usb_endpoint_set_callback(subs->data_endpoint,
 					      NULL, NULL, NULL);
 		subs->running = 0;
+		dev_dbg(&subs->dev->dev, "%d:%d Stop Playback PCM\n",
+			subs->cur_audiofmt->iface,
+			subs->cur_audiofmt->altsetting);
 		return 0;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		/* keep retire_data_urb for delay calculation */
@@ -1840,6 +1707,9 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 					      retire_playback_urb,
 					      subs);
 		subs->running = 0;
+		dev_dbg(&subs->dev->dev, "%d:%d Pause Playback PCM\n",
+			subs->cur_audiofmt->iface,
+			subs->cur_audiofmt->altsetting);
 		return 0;
 	}
 
@@ -1863,10 +1733,11 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 					      NULL, retire_capture_urb,
 					      subs);
 		subs->running = 1;
+		dev_dbg(&subs->dev->dev, "%d:%d Start Capture PCM\n",
+			subs->cur_audiofmt->iface,
+			subs->cur_audiofmt->altsetting);
 		return 0;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		subs->need_setup_fmt = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 		stop_endpoints(subs);
 		fallthrough;
@@ -1874,6 +1745,9 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 		snd_usb_endpoint_set_callback(subs->data_endpoint,
 					      NULL, NULL, NULL);
 		subs->running = 0;
+		dev_dbg(&subs->dev->dev, "%d:%d Stop Capture PCM\n",
+			subs->cur_audiofmt->iface,
+			subs->cur_audiofmt->altsetting);
 		return 0;
 	}
 
-- 
2.16.4


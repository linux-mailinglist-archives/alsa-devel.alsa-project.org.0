Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF52C01CC
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 09:59:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BAE11682;
	Mon, 23 Nov 2020 09:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BAE11682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606121949;
	bh=BqdRASbTjZVs+hLCr/MCcIZHQF/lVvqHdcuIZFzjZuI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f+NvRI7aG7FggYXpZ/o5cfeqzo5amKkc39dh0dLTW49/L42H2GgNUmKd8do7caRt6
	 J3frChR071bmGkm5/DwAYADJVNsd/62YJdkCmECB2Zev01yxLoEVbuSrQY9TTRnGGV
	 TxlUrcbURbP1HurqcvTPJrHNbzF/SqFM+2oEgG1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83785F80535;
	Mon, 23 Nov 2020 09:54:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42B1CF8051B; Mon, 23 Nov 2020 09:54:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09F85F80290
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F85F80290
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E1ACAF99;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/41] ALSA: usb-audio: Add hw constraint for implicit fb sync
Date: Mon, 23 Nov 2020 09:53:16 +0100
Message-Id: <20201123085347.19667-11-tiwai@suse.de>
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

In the current code, there is no check at the stream open time whether
the endpoint is being already used by others.  In the normal
operations, this shouldn't happen, but in the case of the implicit
feedback mode, it's a common problem with the full duplex operation,
because the capture stream is always opened by the playback stream as
an implicit sync source.

Although we recently introduced the check of such a conflict of
parameters at the PCM hw_params time, it doesn't give any hint at the
hw_params itself and just gives the error.  This isn't quite
comfortable, and it caused problems on many applications.

This patch attempts to make the parameter handling easier by
introducing the strict hw constraint matching with the counterpart
stream that is being used.  That said, when an implicit feedback
playback stream is running before a capture stream is opened, the
capture stream carries the PCM hw-constraint to allow only the same
sample rate, format, periods and period frames as the running playback
stream.  If not opened or there is no conflict of endpoints, the
behavior remains as same as before.

Note that this kind of "weak link" should work for most cases, but
this is no concrete solution; e.g. if an application changes the hw
params multiple times while another stream is opened, this would lead
to inconsistencies.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |   9 ++++
 sound/usb/endpoint.c |  72 ++++++++++++++++++-------
 sound/usb/pcm.c      | 148 +++++++++++++++++++++++++++++++++++++++------------
 3 files changed, 175 insertions(+), 54 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 898a283576df..1f61be98a31d 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -114,6 +114,14 @@ struct snd_usb_endpoint {
 					   in a stream */
 	bool is_implicit_feedback;      /* This endpoint is used as implicit feedback */
 
+	/* for hw constraints */
+	unsigned int cur_rate;
+	snd_pcm_format_t cur_format;
+	unsigned int cur_channels;
+	unsigned int cur_period_frames;
+	unsigned int cur_period_bytes;
+	unsigned int cur_buffer_periods;
+
 	spinlock_t lock;
 	struct list_head list;
 };
@@ -144,6 +152,7 @@ struct snd_usb_substream {
 	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
 
 	unsigned int running: 1;	/* running status */
+	unsigned int fixed_hw:1;	/* fixed hw constraints due to sync EP */
 
 	unsigned int hwptr_done;	/* processed byte position in the buffer */
 	unsigned int transfer_done;		/* processed frames since last period update */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8205a64a734e..94490d706013 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -459,6 +459,9 @@ snd_usb_get_endpoint(struct snd_usb_audio *chip,
 	return NULL;
 }
 
+#define ep_type_name(type) \
+	(type == SND_USB_ENDPOINT_TYPE_DATA ? "data" : "sync")
+
 /**
  * snd_usb_add_endpoint: Add an endpoint to an USB audio chip
  *
@@ -500,9 +503,9 @@ struct snd_usb_endpoint *snd_usb_add_endpoint(struct snd_usb_audio *chip,
 	}
 
 	usb_audio_dbg(chip, "Creating new %s %s endpoint #%x\n",
-		    is_playback ? "playback" : "capture",
-		    type == SND_USB_ENDPOINT_TYPE_DATA ? "data" : "sync",
-		    ep_num);
+		      is_playback ? "playback" : "capture",
+		      ep_type_name(type),
+		      ep_num);
 
 	ep = kzalloc(sizeof(*ep), GFP_KERNEL);
 	if (!ep)
@@ -644,13 +647,14 @@ static void release_urbs(struct snd_usb_endpoint *ep, int force)
  * Check data endpoint for format differences
  */
 static bool check_ep_params(struct snd_usb_endpoint *ep,
-			      snd_pcm_format_t pcm_format,
-			      unsigned int channels,
-			      unsigned int period_bytes,
-			      unsigned int frames_per_period,
-			      unsigned int periods_per_buffer,
-			      struct audioformat *fmt,
-			      struct snd_usb_endpoint *sync_ep)
+			    snd_pcm_format_t pcm_format,
+			    unsigned int channels,
+			    unsigned int period_bytes,
+			    unsigned int frames_per_period,
+			    unsigned int periods_per_buffer,
+			    unsigned int rate,
+			    struct audioformat *fmt,
+			    struct snd_usb_endpoint *sync_ep)
 {
 	unsigned int maxsize, minsize, packs_per_ms, max_packs_per_urb;
 	unsigned int max_packs_per_period, urbs_per_period, urb_packs;
@@ -660,6 +664,14 @@ static bool check_ep_params(struct snd_usb_endpoint *ep,
 			       usb_pipeout(ep->pipe));
 	bool ret = 1;
 
+	/* matching with the saved parameters? */
+	if (ep->cur_rate == rate &&
+	    ep->cur_format == pcm_format &&
+	    ep->cur_channels == channels &&
+	    ep->cur_period_frames == frames_per_period &&
+	    ep->cur_buffer_periods == periods_per_buffer)
+		return true;
+
 	if (pcm_format == SNDRV_PCM_FORMAT_DSD_U16_LE && fmt->dsd_dop) {
 		/*
 		 * When operating in DSD DOP mode, the size of a sample frame
@@ -917,7 +929,8 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep,
 	 * as their corresponding capture endpoint.
 	 */
 	if (usb_pipein(ep->pipe) ||
-			snd_usb_endpoint_implicit_feedback_sink(ep)) {
+	    ep->is_implicit_feedback ||
+	    snd_usb_endpoint_implicit_feedback_sink(ep)) {
 
 		urb_packs = packs_per_ms;
 		/*
@@ -1076,12 +1089,17 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 {
 	int err;
 
+	usb_audio_dbg(ep->chip,
+		      "Setting params for ep %x (type %s, count %d), rate=%d, format=%s, channels=%d, period_bytes=%d, periods=%d\n",
+		      ep->ep_num, ep_type_name(ep->type), ep->use_count,
+		      rate, snd_pcm_format_name(pcm_format), channels,
+		      period_bytes, buffer_periods);
+
 	if (ep->use_count != 0) {
 		bool check = ep->is_implicit_feedback &&
-			check_ep_params(ep, pcm_format,
-					     channels, period_bytes,
-					     period_frames, buffer_periods,
-					     fmt, sync_ep);
+			check_ep_params(ep, pcm_format, channels, period_bytes,
+					period_frames, buffer_periods, rate,
+					fmt, sync_ep);
 
 		if (!check) {
 			usb_audio_warn(ep->chip,
@@ -1134,11 +1152,22 @@ int snd_usb_endpoint_set_params(struct snd_usb_endpoint *ep,
 		err = -EINVAL;
 	}
 
-	usb_audio_dbg(ep->chip,
-		"Setting params for ep #%x (type %d, %d urbs), ret=%d\n",
-		ep->ep_num, ep->type, ep->nurbs, err);
+	usb_audio_dbg(ep->chip, "Set up %d URBS, ret=%d\n", ep->nurbs, err);
 
-	return err;
+	if (err < 0)
+		return err;
+
+	/* record the current set up in the endpoint (for implicit fb) */
+	spin_lock_irq(&ep->lock);
+	ep->cur_rate = rate;
+	ep->cur_channels = channels;
+	ep->cur_format = pcm_format;
+	ep->cur_period_frames = period_frames;
+	ep->cur_period_bytes = period_bytes;
+	ep->cur_buffer_periods = buffer_periods;
+	spin_unlock_irq(&ep->lock);
+
+	return 0;
 }
 
 /**
@@ -1273,6 +1302,11 @@ void snd_usb_endpoint_deactivate(struct snd_usb_endpoint *ep)
 
 	deactivate_urbs(ep, true);
 	wait_clear_urbs(ep);
+
+	/* clear the saved hw params */
+	spin_lock_irq(&ep->lock);
+	ep->cur_rate = 0;
+	spin_unlock_irq(&ep->lock);
 }
 
 /**
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 78933b6571d0..6d1f5277cd90 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -81,30 +81,33 @@ static snd_pcm_uframes_t snd_usb_pcm_pointer(struct snd_pcm_substream *substream
 /*
  * find a matching audio format
  */
-static struct audioformat *find_format(struct snd_usb_substream *subs)
+static struct audioformat *find_format(struct list_head *fmt_list_head,
+				       snd_pcm_format_t format,
+				       unsigned int rate,
+				       unsigned int channels,
+				       struct snd_usb_substream *subs)
 {
 	struct audioformat *fp;
 	struct audioformat *found = NULL;
 	int cur_attr = 0, attr;
 
-	list_for_each_entry(fp, &subs->fmt_list, list) {
-		if (!(fp->formats & pcm_format_to_bits(subs->pcm_format)))
+	list_for_each_entry(fp, fmt_list_head, list) {
+		if (!(fp->formats & pcm_format_to_bits(format)))
 			continue;
-		if (fp->channels != subs->channels)
+		if (fp->channels != channels)
 			continue;
-		if (subs->cur_rate < fp->rate_min ||
-		    subs->cur_rate > fp->rate_max)
+		if (rate < fp->rate_min || rate > fp->rate_max)
 			continue;
-		if (! (fp->rates & SNDRV_PCM_RATE_CONTINUOUS)) {
+		if (!(fp->rates & SNDRV_PCM_RATE_CONTINUOUS)) {
 			unsigned int i;
 			for (i = 0; i < fp->nr_rates; i++)
-				if (fp->rate_table[i] == subs->cur_rate)
+				if (fp->rate_table[i] == rate)
 					break;
 			if (i >= fp->nr_rates)
 				continue;
 		}
 		attr = fp->ep_attr & USB_ENDPOINT_SYNCTYPE;
-		if (! found) {
+		if (!found) {
 			found = fp;
 			cur_attr = attr;
 			continue;
@@ -114,7 +117,7 @@ static struct audioformat *find_format(struct snd_usb_substream *subs)
 		 * this is a workaround for the case like
 		 * M-audio audiophile USB.
 		 */
-		if (attr != cur_attr) {
+		if (subs && attr != cur_attr) {
 			if ((attr == USB_ENDPOINT_SYNC_ASYNC &&
 			     subs->direction == SNDRV_PCM_STREAM_PLAYBACK) ||
 			    (attr == USB_ENDPOINT_SYNC_ADAPTIVE &&
@@ -138,6 +141,12 @@ static struct audioformat *find_format(struct snd_usb_substream *subs)
 	return found;
 }
 
+static struct audioformat *find_substream_format(struct snd_usb_substream *subs)
+{
+	return find_format(&subs->fmt_list, subs->pcm_format, subs->cur_rate,
+			   subs->channels, subs);
+}
+
 static int init_pitch_v1(struct snd_usb_audio *chip, int iface,
 			 struct usb_host_interface *alts,
 			 struct audioformat *fmt)
@@ -744,7 +753,6 @@ static int match_endpoint_audioformats(struct snd_usb_substream *subs,
  */
 static int configure_sync_endpoint(struct snd_usb_substream *subs)
 {
-	int ret;
 	struct audioformat *fp;
 	struct audioformat *sync_fp = NULL;
 	int cur_score = 0;
@@ -752,16 +760,16 @@ static int configure_sync_endpoint(struct snd_usb_substream *subs)
 	struct snd_usb_substream *sync_subs =
 		&subs->stream->substream[subs->direction ^ 1];
 
-	if (subs->sync_endpoint->type != SND_USB_ENDPOINT_TYPE_DATA ||
-	    !subs->stream)
-		return snd_usb_endpoint_set_params(subs->sync_endpoint,
-						   subs->pcm_format,
-						   subs->channels,
-						   subs->period_bytes,
-						   0, 0,
-						   subs->cur_rate,
-						   subs->cur_audiofmt,
-						   NULL);
+	if (subs->fixed_hw ||
+	    !subs->sync_endpoint->is_implicit_feedback) {
+		sync_fp = subs->cur_audiofmt;
+		goto configure;
+	}
+
+	sync_fp = find_format(&sync_subs->fmt_list, subs->pcm_format,
+			      subs->cur_rate, subs->channels, NULL);
+	if (sync_fp)
+		goto configure;
 
 	/* Try to find the best matching audioformat. */
 	list_for_each_entry(fp, &sync_subs->fmt_list, list) {
@@ -794,16 +802,16 @@ static int configure_sync_endpoint(struct snd_usb_substream *subs)
 			__func__, subs->period_bytes, sync_period_bytes);
 	}
 
-	ret = snd_usb_endpoint_set_params(subs->sync_endpoint,
-					  subs->pcm_format,
-					  sync_fp->channels,
-					  sync_period_bytes,
-					  0, 0,
-					  subs->cur_rate,
-					  sync_fp,
-					  NULL);
-
-	return ret;
+ configure:
+	return snd_usb_endpoint_set_params(subs->sync_endpoint,
+					   subs->pcm_format,
+					   sync_fp->channels,
+					   sync_period_bytes,
+					   subs->period_frames,
+					   subs->buffer_periods,
+					   subs->cur_rate,
+					   sync_fp,
+					   NULL);
 }
 
 /*
@@ -912,7 +920,7 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	subs->channels = params_channels(hw_params);
 	subs->cur_rate = params_rate(hw_params);
 
-	fmt = find_format(subs);
+	fmt = find_substream_format(subs);
 	if (!fmt) {
 		dev_dbg(&subs->dev->dev,
 			"cannot set format: format = %#x, rate = %d, channels = %d\n",
@@ -956,12 +964,13 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
+	struct snd_usb_audio *chip = subs->stream->chip;
 
 	snd_media_stop_pipeline(subs);
 	subs->cur_audiofmt = NULL;
 	subs->cur_rate = 0;
 	subs->period_bytes = 0;
-	if (!snd_usb_lock_shutdown(subs->stream->chip)) {
+	if (!snd_usb_lock_shutdown(chip)) {
 		stop_endpoints(subs);
 		sync_pending_stops(subs);
 		snd_usb_endpoint_deactivate(subs->sync_endpoint);
@@ -971,7 +980,7 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 			subs->data_endpoint = NULL;
 		}
 		subs->sync_endpoint = NULL;
-		snd_usb_unlock_shutdown(subs->stream->chip);
+		snd_usb_unlock_shutdown(chip);
 	}
 
 	return 0;
@@ -1288,6 +1297,64 @@ static int hw_rule_period_time(struct snd_pcm_hw_params *params,
 	return changed;
 }
 
+/* apply PCM hw constraints from the concurrent sync EP */
+static int apply_hw_constraint_from_sync(struct snd_pcm_runtime *runtime,
+					 struct snd_usb_substream *subs)
+{
+	struct snd_usb_audio *chip = subs->stream->chip;
+	struct snd_usb_endpoint *ep;
+	struct audioformat *fp;
+	int err;
+
+	subs->fixed_hw = 0;
+	list_for_each_entry(fp, &subs->fmt_list, list) {
+		ep = snd_usb_get_endpoint(chip, fp->endpoint, fp->iface,
+					  fp->altsetting);
+		if (ep && ep->cur_rate)
+			goto found;
+		if (!fp->implicit_fb)
+			continue;
+		/* for the implicit fb, check the sync ep as well */
+		ep = snd_usb_get_endpoint(chip, fp->sync_ep, fp->sync_iface,
+					  fp->sync_altsetting);
+		if (ep && ep->cur_rate)
+			goto found;
+	}
+	return 0;
+
+ found:
+	if (!find_format(&subs->fmt_list, ep->cur_format, ep->cur_rate,
+			 ep->cur_channels, NULL)) {
+		usb_audio_dbg(chip, "EP 0x%x being used, but not applicable\n",
+			      ep->ep_num);
+		return 0;
+	}
+
+	usb_audio_dbg(chip, "EP 0x%x being used, using fixed params:\n",
+		      ep->ep_num);
+	usb_audio_dbg(chip, "rate=%d, format=%s, channels=%d, period_size=%d, periods=%d\n",
+		      ep->cur_rate, snd_pcm_format_name(ep->cur_format),
+		      ep->cur_channels, ep->cur_period_frames,
+		      ep->cur_buffer_periods);
+
+	runtime->hw.formats = pcm_format_to_bits(ep->cur_format);
+	runtime->hw.rate_min = runtime->hw.rate_max = ep->cur_rate;
+	runtime->hw.channels_min = runtime->hw.channels_max =
+		ep->cur_channels;
+	runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
+	runtime->hw.periods_min = runtime->hw.periods_max =
+		ep->cur_buffer_periods;
+	subs->fixed_hw = 1;
+
+	err = snd_pcm_hw_constraint_minmax(runtime,
+					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   ep->cur_period_frames,
+					   ep->cur_period_frames);
+	if (err < 0)
+		return err;
+
+	return 1; /* notify the finding */
+}
 
 /*
  * set up the runtime hardware information.
@@ -1295,11 +1362,20 @@ static int hw_rule_period_time(struct snd_pcm_hw_params *params,
 
 static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substream *subs)
 {
+	struct snd_usb_audio *chip = subs->stream->chip;
 	struct audioformat *fp;
 	unsigned int pt, ptmin;
-	int param_period_time_if_needed;
+	int param_period_time_if_needed = -1;
 	int err;
 
+	mutex_lock(&chip->mutex);
+	err = apply_hw_constraint_from_sync(runtime, subs);
+	mutex_unlock(&chip->mutex);
+	if (err < 0)
+		return err;
+	if (err > 0) /* found the matching? */
+		goto add_extra_rules;
+
 	runtime->hw.formats = subs->formats;
 
 	runtime->hw.rate_min = 0x7fffffff;
@@ -1350,6 +1426,8 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 				  -1);
 	if (err < 0)
 		return err;
+
+add_extra_rules:
 	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_channels, subs,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
-- 
2.16.4


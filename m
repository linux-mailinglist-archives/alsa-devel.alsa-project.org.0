Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59E52829A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:51:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7C351688;
	Mon, 16 May 2022 12:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7C351688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698279;
	bh=fCtfP/JAMGGBvELe1cnUuzLogdBj2WzWRhKtKUdE5TQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sva92mm/D656mPpUwve/T7L6+QNj5yj121UTzEQCIzyaQp6sWe39NsR7nAOy0GI6k
	 Yn2CpCjQp+NNZD8Z6Dw/mQf5r13SuxYsm7w72JfQpI5ghATzfFiBLmvkQ0emOCgAho
	 0znwbI6P8rr9lGB5YEI8cCmJqcZqKUf5Z9KQXGIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 007AEF80564;
	Mon, 16 May 2022 12:48:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5469CF80559; Mon, 16 May 2022 12:48:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BEA8F80559
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BEA8F80559
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="O5HWoa71"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Io5bOrxN"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 33B8F1FB0E
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 10:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652698089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4XvezQx4XmjxzWuUPVo6AOuhsc7jcbmnoXm40TF6szU=;
 b=O5HWoa71e9Sncoqkc7Y9RBlEPwcJZ2YSN2X22YTBqpqYm6P+Ew28joDNhgdS6/Pqo0vV74
 QZowI65Blok9BrpXrcPqPVZk7B308jRKlxmIXm441Pi2DKq/HiAr6WTAu+6Iv4asWj73T9
 N37R3+ym2etvrXl09Q8T3ajbBtaqmAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652698089;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4XvezQx4XmjxzWuUPVo6AOuhsc7jcbmnoXm40TF6szU=;
 b=Io5bOrxNpaZ2qAI9HTkT9E/NFhdMfZnKel36otmSNl6jiJGwp+Dro2hHd/bfx0WSLfg/N5
 GsetyTp+xw4Ll4CA==
Received: from valkyrie.site.de (unknown [10.163.18.242])
 by relay2.suse.de (Postfix) with ESMTP id 10DB02C141;
 Mon, 16 May 2022 10:48:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Refcount multiple accesses on the single
 clock
Date: Mon, 16 May 2022 12:48:07 +0200
Message-Id: <20220516104807.16482-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

When a clock source is connected to multiple nodes / endpoints, the
current USB-audio driver tries to set up at each time one of them is
configured.  Although it reads the current rate and updates only if it
differs, some devices seem unhappy with this behavior and spew the
errors when reading/updating the rate unnecessarily.

This patch tries to reduce the redundant clock setup by introducing a
refcount for each clock source.  When the stream is actually running,
a clock rate is "locked", and it bypasses the clock and/or refuse to
change any longer.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215934
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c     |  1 +
 sound/usb/card.h     |  3 +-
 sound/usb/endpoint.c | 90 +++++++++++++++++++++++++++++++++++++++-----
 sound/usb/usbaudio.h |  1 +
 4 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 376962291c4d..0fff96a5d3ab 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -635,6 +635,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	INIT_LIST_HEAD(&chip->pcm_list);
 	INIT_LIST_HEAD(&chip->ep_list);
 	INIT_LIST_HEAD(&chip->iface_ref_list);
+	INIT_LIST_HEAD(&chip->clock_ref_list);
 	INIT_LIST_HEAD(&chip->midi_list);
 	INIT_LIST_HEAD(&chip->mixer_list);
 
diff --git a/sound/usb/card.h b/sound/usb/card.h
index 87f042d06ce0..ca75f2206170 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -44,6 +44,7 @@ struct audioformat {
 
 struct snd_usb_substream;
 struct snd_usb_iface_ref;
+struct snd_usb_clock_ref;
 struct snd_usb_endpoint;
 struct snd_usb_power_domain;
 
@@ -62,6 +63,7 @@ struct snd_urb_ctx {
 struct snd_usb_endpoint {
 	struct snd_usb_audio *chip;
 	struct snd_usb_iface_ref *iface_ref;
+	struct snd_usb_clock_ref *clock_ref;
 
 	int opened;		/* open refcount; protect with chip->mutex */
 	atomic_t running;	/* running status */
@@ -138,7 +140,6 @@ struct snd_usb_endpoint {
 	unsigned int cur_period_frames;
 	unsigned int cur_period_bytes;
 	unsigned int cur_buffer_periods;
-	unsigned char cur_clock;
 
 	spinlock_t lock;
 	struct list_head list;
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 743b8287cfcd..df5a70013a85 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -35,6 +35,14 @@ struct snd_usb_iface_ref {
 	struct list_head list;
 };
 
+/* clock refcounting */
+struct snd_usb_clock_ref {
+	unsigned char clock;
+	atomic_t locked;
+	int rate;
+	struct list_head list;
+};
+
 /*
  * snd_usb_endpoint is a model that abstracts everything related to an
  * USB endpoint and its streaming.
@@ -591,6 +599,25 @@ iface_ref_find(struct snd_usb_audio *chip, int iface)
 	return ip;
 }
 
+/* Similarly, a refcount object for clock */
+static struct snd_usb_clock_ref *
+clock_ref_find(struct snd_usb_audio *chip, int clock)
+{
+	struct snd_usb_clock_ref *ref;
+
+	list_for_each_entry(ref, &chip->clock_ref_list, list)
+		if (ref->clock == clock)
+			return ref;
+
+	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
+	if (!ref)
+		return NULL;
+	ref->clock = clock;
+	atomic_set(&ref->locked, 0);
+	list_add_tail(&ref->list, &chip->clock_ref_list);
+	return ref;
+}
+
 /*
  * Get the existing endpoint object corresponding EP
  * Returns NULL if not present.
@@ -768,6 +795,14 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 			goto unlock;
 		}
 
+		if (fp->protocol != UAC_VERSION_1) {
+			ep->clock_ref = clock_ref_find(chip, fp->clock);
+			if (!ep->clock_ref) {
+				ep = NULL;
+				goto unlock;
+			}
+		}
+
 		ep->cur_audiofmt = fp;
 		ep->cur_channels = fp->channels;
 		ep->cur_rate = params_rate(params);
@@ -777,7 +812,6 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		ep->cur_period_frames = params_period_size(params);
 		ep->cur_period_bytes = ep->cur_period_frames * ep->cur_frame_bytes;
 		ep->cur_buffer_periods = params_periods(params);
-		ep->cur_clock = fp->clock;
 
 		if (ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
 			endpoint_set_syncinterval(chip, ep);
@@ -894,8 +928,8 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 		ep->altsetting = 0;
 		ep->cur_audiofmt = NULL;
 		ep->cur_rate = 0;
-		ep->cur_clock = 0;
 		ep->iface_ref = NULL;
+		ep->clock_ref = NULL;
 		usb_audio_dbg(chip, "EP 0x%x closed\n", ep->ep_num);
 	}
 	mutex_unlock(&chip->mutex);
@@ -907,6 +941,8 @@ void snd_usb_endpoint_suspend(struct snd_usb_endpoint *ep)
 	ep->need_setup = true;
 	if (ep->iface_ref)
 		ep->iface_ref->need_setup = true;
+	if (ep->clock_ref)
+		ep->clock_ref->rate = 0;
 }
 
 /*
@@ -1314,6 +1350,33 @@ static int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	return 0;
 }
 
+static int init_sample_rate(struct snd_usb_audio *chip,
+			    struct snd_usb_endpoint *ep)
+{
+	struct snd_usb_clock_ref *clock = ep->clock_ref;
+	int err;
+
+	if (clock) {
+		if (atomic_read(&clock->locked))
+			return 0;
+		if (clock->rate == ep->cur_rate)
+			return 0;
+		if (clock->rate && clock->rate != ep->cur_rate) {
+			usb_audio_dbg(chip, "Mismatched sample rate %d vs %d for EP 0x%x\n",
+				      clock->rate, ep->cur_rate, ep->ep_num);
+			return -EINVAL;
+		}
+	}
+
+	err = snd_usb_init_sample_rate(chip, ep->cur_audiofmt, ep->cur_rate);
+	if (err < 0)
+		return err;
+
+	if (clock)
+		clock->rate = ep->cur_rate;
+	return 0;
+}
+
 /*
  * snd_usb_endpoint_configure: Configure the endpoint
  *
@@ -1343,8 +1406,7 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 		 * to update at each EP configuration
 		 */
 		if (ep->cur_audiofmt->protocol == UAC_VERSION_1) {
-			err = snd_usb_init_sample_rate(chip, ep->cur_audiofmt,
-						       ep->cur_rate);
+			err = init_sample_rate(chip, ep);
 			if (err < 0)
 				goto unlock;
 		}
@@ -1374,7 +1436,7 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 	if (err < 0)
 		goto unlock;
 
-	err = snd_usb_init_sample_rate(chip, ep->cur_audiofmt, ep->cur_rate);
+	err = init_sample_rate(chip, ep);
 	if (err < 0)
 		goto unlock;
 
@@ -1407,15 +1469,15 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 /* get the current rate set to the given clock by any endpoint */
 int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock)
 {
-	struct snd_usb_endpoint *ep;
+	struct snd_usb_clock_ref *ref;
 	int rate = 0;
 
 	if (!clock)
 		return 0;
 	mutex_lock(&chip->mutex);
-	list_for_each_entry(ep, &chip->ep_list, list) {
-		if (ep->cur_clock == clock && ep->cur_rate) {
-			rate = ep->cur_rate;
+	list_for_each_entry(ref, &chip->clock_ref_list, list) {
+		if (ref->clock == clock) {
+			rate = ref->rate;
 			break;
 		}
 	}
@@ -1456,6 +1518,9 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 	if (atomic_inc_return(&ep->running) != 1)
 		return 0;
 
+	if (ep->clock_ref)
+		atomic_inc(&ep->clock_ref->locked);
+
 	ep->active_mask = 0;
 	ep->unlink_mask = 0;
 	ep->phase = 0;
@@ -1565,6 +1630,9 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep, bool keep_pending)
 		if (ep->sync_source)
 			WRITE_ONCE(ep->sync_source->sync_sink, NULL);
 		stop_urbs(ep, false, keep_pending);
+		if (ep->clock_ref)
+			if (!atomic_dec_return(&ep->clock_ref->locked))
+				ep->clock_ref->rate = 0;
 	}
 }
 
@@ -1591,12 +1659,16 @@ void snd_usb_endpoint_free_all(struct snd_usb_audio *chip)
 {
 	struct snd_usb_endpoint *ep, *en;
 	struct snd_usb_iface_ref *ip, *in;
+	struct snd_usb_clock_ref *cp, *cn;
 
 	list_for_each_entry_safe(ep, en, &chip->ep_list, list)
 		kfree(ep);
 
 	list_for_each_entry_safe(ip, in, &chip->iface_ref_list, list)
 		kfree(ip);
+
+	list_for_each_entry_safe(cp, cn, &chip->clock_ref_list, list)
+		kfree(ip);
 }
 
 /*
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 044cd7ab27cb..ffbb4b0d09a0 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -45,6 +45,7 @@ struct snd_usb_audio {
 	struct list_head pcm_list;	/* list of pcm streams */
 	struct list_head ep_list;	/* list of audio-related endpoints */
 	struct list_head iface_ref_list; /* list of interface refcounts */
+	struct list_head clock_ref_list; /* list of clock refcounts */
 	int pcm_devs;
 
 	struct list_head midi_list;	/* list of midi interfaces */
-- 
2.35.3


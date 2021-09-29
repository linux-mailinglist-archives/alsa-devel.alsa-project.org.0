Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B19A741C04E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 10:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3810416A6;
	Wed, 29 Sep 2021 10:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3810416A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632903016;
	bh=9+AxtvFrm1ylIF74u1VI7svDV95jOUHinEr0VV6PatU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdRv9jjqrHFeB0ShRrRq0a7sLZsbessn9zYIwYjm0ooJT/LV1fGvaAeoBG5Ai9llP
	 8f6tfTXqSSGViLJZ6/imDaXggVZc9fCtEG8aQKjjXHPPZOyc2DGLinzbwq8ElC0Bz4
	 IMS44FeJWzAxitV+O7agkxa9qqrmY65gojES1bFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E784EF804CC;
	Wed, 29 Sep 2021 10:08:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 656FCF804E4; Wed, 29 Sep 2021 10:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D21DF80161
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 10:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D21DF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="pV1m2HTS"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="X0Ue0gOF"
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id A33AE22520
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632902928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpZYT20j9QKfwqhKg5DP2+ewT3SCG+N6M9+kUy36u+w=;
 b=pV1m2HTSpkEd597+cG2uZG2w3NB3qHTcsmPqZ/3DFbdhGn23pUacU9nAIY6v1BqoPi0miQ
 yelTrZjsrw4U6zj/4buxLg8TEOMRB0O9vrSIHt9Fj3fZDDsF9yn1KGcPjmi3nq+1o8eSyz
 cPMiRqEXbdDM6eVI3+owTg1pUYJzldk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632902928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EpZYT20j9QKfwqhKg5DP2+ewT3SCG+N6M9+kUy36u+w=;
 b=X0Ue0gOFHQMj3GByW0tvTucmuqdOo4UHZI+gwY2MfZ1bNoYC7gJraUB4a5t33DMxRW6pmz
 /JNxXrZkvCUHayAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay1.suse.de (Postfix) with ESMTP id 9319725D6E;
 Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/9] ALSA: usb-audio: Restrict rates for the shared clocks
Date: Wed, 29 Sep 2021 10:08:36 +0200
Message-Id: <20210929080844.11583-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210929080844.11583-1-tiwai@suse.de>
References: <20210929080844.11583-1-tiwai@suse.de>
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

When a single clock source is shared among several endpoints, we have
to keep the same rate on all active endpoints as long as the clock is
being used.  For dealing with such a case, this patch adds one more
check in the hw params constraint for the rate to take the shared
clocks into account.  The current rate is evaluated from the endpoint
list that applies the same clock source.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1190418
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |  1 +
 sound/usb/endpoint.c | 21 +++++++++++++++++++++
 sound/usb/endpoint.h |  1 +
 sound/usb/pcm.c      |  9 +++++++++
 4 files changed, 32 insertions(+)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 5b19901f305a..3329ce710cb9 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -136,6 +136,7 @@ struct snd_usb_endpoint {
 	unsigned int cur_period_frames;
 	unsigned int cur_period_bytes;
 	unsigned int cur_buffer_periods;
+	unsigned char cur_clock;
 
 	spinlock_t lock;
 	struct list_head list;
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 533919a28856..29c4865966f5 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -722,6 +722,7 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 		ep->cur_period_frames = params_period_size(params);
 		ep->cur_period_bytes = ep->cur_period_frames * ep->cur_frame_bytes;
 		ep->cur_buffer_periods = params_periods(params);
+		ep->cur_clock = fp->clock;
 
 		if (ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
 			endpoint_set_syncinterval(chip, ep);
@@ -833,6 +834,7 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 		ep->altsetting = 0;
 		ep->cur_audiofmt = NULL;
 		ep->cur_rate = 0;
+		ep->cur_clock = 0;
 		ep->iface_ref = NULL;
 		usb_audio_dbg(chip, "EP 0x%x closed\n", ep->ep_num);
 	}
@@ -1340,6 +1342,25 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 	return err;
 }
 
+/* get the current rate set to the given clock by any endpoint */
+int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock)
+{
+	struct snd_usb_endpoint *ep;
+	int rate = 0;
+
+	if (!clock)
+		return 0;
+	mutex_lock(&chip->mutex);
+	list_for_each_entry(ep, &chip->ep_list, list) {
+		if (ep->cur_clock == clock && ep->cur_rate) {
+			rate = ep->cur_rate;
+			break;
+		}
+	}
+	mutex_unlock(&chip->mutex);
+	return rate;
+}
+
 /**
  * snd_usb_endpoint_start: start an snd_usb_endpoint
  *
diff --git a/sound/usb/endpoint.h b/sound/usb/endpoint.h
index a668f675b52b..a1099ec37e1c 100644
--- a/sound/usb/endpoint.h
+++ b/sound/usb/endpoint.h
@@ -19,6 +19,7 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 			    struct snd_usb_endpoint *ep);
 int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 			       struct snd_usb_endpoint *ep);
+int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock);
 
 bool snd_usb_endpoint_compatible(struct snd_usb_audio *chip,
 				 struct snd_usb_endpoint *ep,
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 5dc9266180e3..19392117de9e 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -734,6 +734,7 @@ static int hw_rule_rate(struct snd_pcm_hw_params *params,
 			struct snd_pcm_hw_rule *rule)
 {
 	struct snd_usb_substream *subs = rule->private;
+	struct snd_usb_audio *chip = subs->stream->chip;
 	const struct audioformat *fp;
 	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	unsigned int rmin, rmax, r;
@@ -745,6 +746,14 @@ static int hw_rule_rate(struct snd_pcm_hw_params *params,
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		if (!hw_check_valid_format(subs, params, fp))
 			continue;
+		r = snd_usb_endpoint_get_clock_rate(chip, fp->clock);
+		if (r > 0) {
+			if (!snd_interval_test(it, r))
+				continue;
+			rmin = min(rmin, r);
+			rmax = max(rmax, r);
+			continue;
+		}
 		if (fp->rate_table && fp->nr_rates) {
 			for (i = 0; i < fp->nr_rates; i++) {
 				r = fp->rate_table[i];
-- 
2.26.2


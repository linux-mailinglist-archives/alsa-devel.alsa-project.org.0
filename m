Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C59213FA0A1
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 22:34:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 639D81714;
	Fri, 27 Aug 2021 22:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 639D81714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630096481;
	bh=VKmDeh8hGGPtLfAnAkGhJxjiQg6k7947j19qJqjRwsQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qMwcF0kQl5D2aH5RY9BjlBvaj4EFO9O7HS/jKG5aEDrMlje+8+HU6ly4kAyjaN7WP
	 ZPJeJZy1nodDi1kJQA9wlx52X9eJ5My5wjte8fLqjMctOjAUwt8qSlrioydBLtvFJa
	 +iqb+hh887+GvQHAFPz0a2rWog0Rcge/E9VY2+EM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD37F801D5;
	Fri, 27 Aug 2021 22:33:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 798B0F80129; Fri, 27 Aug 2021 22:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE03FF800FD
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 22:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE03FF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="JRKux/OA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="l9VFxtAR"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E4CF82236D
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 20:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1630096392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F4avrqFDtDpeQC06Hhzs8yQTWmvHhaWAT52w2QREx2s=;
 b=JRKux/OA0m3HG4yUulQATXy9urmzOeZVRKZmIuh/Dhh6LIycLHJpR8HSyOAB8ZkWF7NBd7
 ItZpVvDvkJGcLxS3/Kk+ZlBUlIVC9bMlsyh9tsjVny6f28TdlhkjXQwFPhAuc0/C/d7E1s
 MbfsRG9oIHN2p2fvD0jpHdaFJS6paGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1630096392;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F4avrqFDtDpeQC06Hhzs8yQTWmvHhaWAT52w2QREx2s=;
 b=l9VFxtAR/+v2WDVJO9Gg8j2yId/S03GnK8AiXDKLJbRpjNEaI9ZYHX57l9ttMVkfL8b5di
 bci4+9s4OUCM97BA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D7ADAA3B9A;
 Fri, 27 Aug 2021 20:33:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Work around for XRUN with low latency
 playback
Date: Fri, 27 Aug 2021 22:33:11 +0200
Message-Id: <20210827203311.5987-1-tiwai@suse.de>
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

The recent change for low latency playback works in most of test cases
but it turned out still to hit errors on some use cases, most notably
with JACK with small buffer sizes.  This is because USB-audio driver
fills up and submits full URBs at the beginning, while the URBs would
return immediately and try to fill more -- that can easily trigger
XRUN.  It was more or less expected, but in the small buffer size, the
problem became pretty obvious.

Fixing this behavior properly would require the change of the
fundamental driver design, so it's no trivial task, unfortunately.
Instead, here we work around the problem just by switching back to the
old method when the given configuration is too fragile with the low
latency stream handling.  As a threshold, we calculate the total
buffer bytes in all plus one URBs, and check whether it's beyond the
PCM buffer bytes.  The one extra URB is needed because XRUN happens at
the next submission after the first round.

Fixes: 307cc9baac5c ("ALSA: usb-audio: Reduce latency at playback start, take#2")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |  2 ++
 sound/usb/endpoint.c |  4 ++++
 sound/usb/pcm.c      | 13 +++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 6c0a052a28f9..5b19901f305a 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -94,6 +94,7 @@ struct snd_usb_endpoint {
 	struct list_head ready_playback_urbs; /* playback URB FIFO for implicit fb */
 
 	unsigned int nurbs;		/* # urbs */
+	unsigned int nominal_queue_size; /* total buffer sizes in URBs */
 	unsigned long active_mask;	/* bitmask of active urbs */
 	unsigned long unlink_mask;	/* bitmask of unlinked urbs */
 	char *syncbuf;			/* sync buffer for all sync URBs */
@@ -187,6 +188,7 @@ struct snd_usb_substream {
 	} dsd_dop;
 
 	bool trigger_tstamp_pending_update; /* trigger timestamp being updated from initial estimate */
+	bool early_playback_start;	/* early start needed for playback? */
 	struct media_ctl *media_ctl;
 };
 
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8b1bec51c806..bf26c04cf471 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1126,6 +1126,10 @@ static int data_ep_set_params(struct snd_usb_endpoint *ep)
 		INIT_LIST_HEAD(&u->ready_list);
 	}
 
+	/* total buffer bytes of all URBs plus the next queue;
+	 * referred in pcm.c
+	 */
+	ep->nominal_queue_size = maxsize * urb_packs * (ep->nurbs + 1);
 	return 0;
 
 out_of_memory:
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 4e5031a68064..f5cbf61ac366 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -614,6 +614,14 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	subs->period_elapsed_pending = 0;
 	runtime->delay = 0;
 
+	/* check whether early start is needed for playback stream */
+	subs->early_playback_start =
+		subs->direction == SNDRV_PCM_STREAM_PLAYBACK &&
+		subs->data_endpoint->nominal_queue_size >= subs->buffer_bytes;
+
+	if (subs->early_playback_start)
+		ret = start_endpoints(subs);
+
  unlock:
 	snd_usb_unlock_shutdown(chip);
 	return ret;
@@ -1394,7 +1402,7 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 		subs->trigger_tstamp_pending_update = false;
 	}
 
-	if (period_elapsed && !subs->running) {
+	if (period_elapsed && !subs->running && !subs->early_playback_start) {
 		subs->period_elapsed_pending = 1;
 		period_elapsed = 0;
 	}
@@ -1448,7 +1456,8 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 					      prepare_playback_urb,
 					      retire_playback_urb,
 					      subs);
-		if (cmd == SNDRV_PCM_TRIGGER_START) {
+		if (!subs->early_playback_start &&
+		    cmd == SNDRV_PCM_TRIGGER_START) {
 			err = start_endpoints(subs);
 			if (err < 0) {
 				snd_usb_endpoint_set_callback(subs->data_endpoint,
-- 
2.26.2


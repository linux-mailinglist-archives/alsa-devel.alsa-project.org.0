Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DACB83BE713
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 13:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FB3F86F;
	Wed,  7 Jul 2021 13:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FB3F86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625657187;
	bh=Cxf00uc9CYC+U94/gMkB4+xS8joxj+OBSVcDGx/8NII=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N6X2kgddzx14YT35T8eXMpWKcxCcgscwIgqavKqzDqgixO9Bs8CfQbDlTflqBE7x9
	 3+Q47cGoqJcCWGSPqpKbDVCW8GUyfDPsT4Z2berut1SUoKoHID02GzuaQPcdSVp11p
	 JFxcT/q/N4aWX4/qTWep0RMG2g8DQNQ6uEs093lU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3EA0F8025C;
	Wed,  7 Jul 2021 13:24:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA091F80224; Wed,  7 Jul 2021 13:24:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0ED6F8012F
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 13:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0ED6F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="CU2tCccK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="UkZyRCoL"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 6E76320072;
 Wed,  7 Jul 2021 11:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625657090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pgxl15du2YQEkh8BlT3T5it72MXPsOm/8OcE2SYe0M4=;
 b=CU2tCccKLOkEdgLgvGVtZn4FOS2VXhxAV933QROzzRPVBO6sVyocpG6q5i+JsdbgYXpETR
 i/tLup2XiHVm0XXi+P0lUx3QMNq8wnROuuVluk10+1johgRTVZKiJhYxJY6EOFEbCcaL4y
 Q0f4DdkPkWHJJypTFaDP4CHVVxo3fZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625657090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pgxl15du2YQEkh8BlT3T5it72MXPsOm/8OcE2SYe0M4=;
 b=UkZyRCoLhb/59Z4PhYs0ufrpsDVbpGZTix2EGGTyve/h8mbtOX1McqNqZdflA+6VOHLpA2
 slMAXD6BvoOo7XBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 12CB4A3BA0;
 Wed,  7 Jul 2021 11:24:50 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Reduce latency at playback start, take#2
Date: Wed,  7 Jul 2021 13:24:47 +0200
Message-Id: <20210707112447.27485-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hector Martin <marcan@marcan.st>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

This is another attempt for the reduction of the latency at the start
of a USB audio playback stream.  The first attempt in the commit
9ce650a75a3b caused an unexpected regression (a deadlock with pipewire
usage) and was later reverted by the commit 4b820e167bf6.  The devils
are always living in details, of course; the cause of the deadlock was
the call of snd_pcm_period_elapsed() inside prepare_playback_urb()
callback.  In the original code, this callback is never called from
the stream lock context as it's driven solely from the URB complete
callback.  Along with the movement of the URB submission into the
trigger START, this prepare call may be also executed in the stream
lock context, hence it deadlocked with the another lock in
snd_pcm_period_elapsed().  (Note that this happens only conditionally
with a small period size that matches with the URB buffer length,
which was a reason I overlooked during my tests.  Also, the problem
wasn't seen in the capture stream because the capture stream handles
the period-elapsed only at retire callback that isn't executed at the
trigger.)

If it were only about avoiding the deadlock, it'd be possible to use
snd_pcm_period_elapsed_under_stream_lock() as a solution.  However, in
general, the period elapsed notification must be sent after the actual
stream start, and replacing the call wouldn't satisfy the pattern.
A better option is to delay the notification after the stream start
procedure finished, instead.  In the case of USB framework, one of the
fitting place would be the complete callback of the first URB.

So, as a workaround of the deadlock and the order fixes above, in
addition to the re-applying the changes in the commit 9ce650a75a3,
this patch introduces a new flag indicating the delayed period-elapsed
handling and sets it under the possible deadlock condition
(i.e. prepare callback being called before subs->running is set).
Once when the flag is set, the period-elapsed call is handled at a
later URB complete call instead.

As a reference for the original motivation for the low-latency change,
I cite here again:

| USB-audio driver behaves a bit strangely for the playback stream --
| namely, it starts sending silent packets at PCM prepare state while
| the actual data is submitted at first when the trigger START is
| kicked off.  This is a workaround for the behavior where URBs are
| processed too quickly at the beginning.  That is, if we start
| submitting URBs at trigger START, the first few URBs will be
| immediately completed, and this would result in the immediate
| period-elapsed calls right after the start, which may confuse
| applications.
|
| OTOH, submitting the data after silent URBs would, of course, result
| in a certain delay of the actual data processing, and this is rather
| more serious problem on modern systems, in practice.
|
| This patch tries to revert the workaround and lets the URB
| submission starting at PCM trigger for the playback again.  As far
| as I've tested with various backends (native ALSA, PA, JACK, PW), I
| haven't seen any problems (famous last words :)
|
| Note that the capture stream handling needs no such workaround,
| since the capture is driven per received URB.

Link: https://lore.kernel.org/r/4e71531f-4535-fd46-040e-506a3c256bbd@marcan.st
Link: https://lore.kernel.org/r/s5hbl7li0fe.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h |  1 +
 sound/usb/pcm.c  | 26 +++++++++++++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index f41dbdc31336..6c0a052a28f9 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -158,6 +158,7 @@ struct snd_usb_substream {
 	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
 
 	unsigned int running: 1;	/* running status */
+	unsigned int period_elapsed_pending;	/* delay period handling */
 
 	unsigned int buffer_bytes;	/* buffer size in bytes */
 	unsigned int inflight_bytes;	/* in-flight data bytes on buffer (for playback) */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index e26d37365f02..4e5031a68064 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -611,13 +611,9 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	subs->hwptr_done = 0;
 	subs->transfer_done = 0;
 	subs->last_frame_number = 0;
+	subs->period_elapsed_pending = 0;
 	runtime->delay = 0;
 
-	/* for playback, submit the URBs now; otherwise, the first hwptr_done
-	 * updates for all URBs would happen at the same time when starting */
-	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK)
-		ret = start_endpoints(subs);
-
  unlock:
 	snd_usb_unlock_shutdown(chip);
 	return ret;
@@ -1398,6 +1394,10 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 		subs->trigger_tstamp_pending_update = false;
 	}
 
+	if (period_elapsed && !subs->running) {
+		subs->period_elapsed_pending = 1;
+		period_elapsed = 0;
+	}
 	spin_unlock_irqrestore(&subs->lock, flags);
 	urb->transfer_buffer_length = bytes;
 	if (period_elapsed)
@@ -1413,6 +1413,7 @@ static void retire_playback_urb(struct snd_usb_substream *subs,
 {
 	unsigned long flags;
 	struct snd_urb_ctx *ctx = urb->context;
+	bool period_elapsed = false;
 
 	spin_lock_irqsave(&subs->lock, flags);
 	if (ctx->queued) {
@@ -1423,13 +1424,20 @@ static void retire_playback_urb(struct snd_usb_substream *subs,
 	}
 
 	subs->last_frame_number = usb_get_current_frame_number(subs->dev);
+	if (subs->running) {
+		period_elapsed = subs->period_elapsed_pending;
+		subs->period_elapsed_pending = 0;
+	}
 	spin_unlock_irqrestore(&subs->lock, flags);
+	if (period_elapsed)
+		snd_pcm_period_elapsed(subs->pcm_substream);
 }
 
 static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substream,
 					      int cmd)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
+	int err;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -1440,6 +1448,14 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 					      prepare_playback_urb,
 					      retire_playback_urb,
 					      subs);
+		if (cmd == SNDRV_PCM_TRIGGER_START) {
+			err = start_endpoints(subs);
+			if (err < 0) {
+				snd_usb_endpoint_set_callback(subs->data_endpoint,
+							      NULL, NULL, NULL);
+				return err;
+			}
+		}
 		subs->running = 1;
 		dev_dbg(&subs->dev->dev, "%d:%d Start Playback PCM\n",
 			subs->cur_audiofmt->iface,
-- 
2.26.2


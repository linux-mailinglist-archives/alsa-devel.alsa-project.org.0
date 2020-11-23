Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E532D2C01EB
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:05:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86DBC167D;
	Mon, 23 Nov 2020 10:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86DBC167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122339;
	bh=SuNA1N6kMPHoIf0CdWmXZFYcqNl5D6u44uq9nEXdNhs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QWu5UkfytN47KKbBzF9gz/iKM67NgiexyoCBAWIytOZTf/gAtcT8wudkgFQAhsApQ
	 YAsCv5j/Zqf/W8e3Z9SL3Sr8BCPQFMcX3FSDhDTlfwdbryn+YrI6bRmLjEA3CGADrB
	 t9Pzx9rLgfHIIp5DVOmpWdZrVeQHCEC4hx0EJ6Z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39D09F805C8;
	Mon, 23 Nov 2020 09:55:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C594EF8053A; Mon, 23 Nov 2020 09:54:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98EB6F804E4
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98EB6F804E4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 980B8AFD7;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 30/41] ALSA: usb-audio: Drop unneeded snd_usb_substream fields
Date: Mon, 23 Nov 2020 09:53:36 +0100
Message-Id: <20201123085347.19667-31-tiwai@suse.de>
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

Some fields like interface and alt_idx in snd_usb_substream are mostly
useless now as they can be referred via either cur_audiofmt or
data_endpoint assigned to the substream.  Drop those, and also assure
the concurrency about the access of cur_audiofmt field.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c   |  1 -
 sound/usb/card.h   |  8 --------
 sound/usb/pcm.c    | 24 ++++++------------------
 sound/usb/proc.c   | 19 +++++++++++++------
 sound/usb/quirks.c | 10 +++++-----
 5 files changed, 24 insertions(+), 38 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 58958afcec93..7940b3bff5bc 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -124,7 +124,6 @@ static void snd_usb_stream_disconnect(struct snd_usb_stream *as)
 		subs = &as->substream[idx];
 		if (!subs->num_formats)
 			continue;
-		subs->interface = -1;
 		subs->data_endpoint = NULL;
 		subs->sync_endpoint = NULL;
 	}
diff --git a/sound/usb/card.h b/sound/usb/card.h
index f58c3769b058..1dd7a514d1d5 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -140,18 +140,10 @@ struct snd_usb_substream {
 	struct usb_device *dev;
 	struct snd_pcm_substream *pcm_substream;
 	int direction;	/* playback or capture */
-	int interface;	/* current interface */
 	int endpoint;	/* assigned endpoint */
 	const struct audioformat *cur_audiofmt;	/* current audioformat pointer (for hw_params callback) */
 	struct snd_usb_power_domain *str_pd;	/* UAC3 Power Domain for streaming path */
-	snd_pcm_format_t pcm_format;	/* current audio format (for hw_params callback) */
-	unsigned int channels;		/* current number of channels (for hw_params callback) */
 	unsigned int channels_max;	/* max channels in the all audiofmts */
-	unsigned int cur_rate;		/* current rate (for hw_params callback) */
-	unsigned int period_bytes;	/* current period bytes (for hw_params callback) */
-	unsigned int period_frames;	/* current frames per period */
-	unsigned int buffer_periods;	/* current periods per buffer */
-	unsigned int altset_idx;     /* USB data format: index of alternate setting */
 	unsigned int txfr_quirk:1;	/* allow sub-frame alignment */
 	unsigned int tx_length_quirk:1;	/* add length specifier to transfers */
 	unsigned int fmt_type;		/* USB audio format type (1-3) */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index fc028492dd1a..95a6a854dc55 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -797,20 +797,11 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 					  subs->sync_endpoint);
 	}
 
-	subs->interface = fmt->iface;
-	subs->altset_idx = fmt->altset_idx;
+	mutex_lock(&chip->mutex);
 	subs->cur_audiofmt = fmt;
+	mutex_unlock(&chip->mutex);
 
 	ret = configure_endpoints(chip, subs);
-	if (ret < 0)
-		goto unlock;
-
-	subs->pcm_format = params_format(hw_params);
-	subs->period_bytes = params_period_bytes(hw_params);
-	subs->period_frames = params_period_size(hw_params);
-	subs->buffer_periods = params_periods(hw_params);
-	subs->channels = params_channels(hw_params);
-	subs->cur_rate = params_rate(hw_params);
 
  unlock:
 	if (ret < 0)
@@ -835,9 +826,9 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 	struct snd_usb_audio *chip = subs->stream->chip;
 
 	snd_media_stop_pipeline(subs);
+	mutex_lock(&chip->mutex);
 	subs->cur_audiofmt = NULL;
-	subs->cur_rate = 0;
-	subs->period_bytes = 0;
+	mutex_unlock(&chip->mutex);
 	if (!snd_usb_lock_shutdown(chip)) {
 		if (stop_endpoints(subs))
 			sync_pending_stops(subs);
@@ -1274,8 +1265,6 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_usb_substream *subs = &as->substream[direction];
 	int ret;
 
-	subs->interface = -1;
-	subs->altset_idx = 0;
 	runtime->hw = snd_usb_hardware;
 	runtime->private_data = subs;
 	subs->pcm_substream = substream;
@@ -1308,7 +1297,6 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
 	snd_media_stop_pipeline(subs);
 
 	if (!snd_usb_lock_shutdown(subs->stream->chip)) {
-		subs->interface = -1;
 		ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D1);
 		snd_usb_unlock_shutdown(subs->stream->chip);
 		if (ret < 0)
@@ -1570,10 +1558,10 @@ static void prepare_playback_urb(struct snd_usb_substream *subs,
 	}
 	bytes = frames * ep->stride;
 
-	if (unlikely(subs->pcm_format == SNDRV_PCM_FORMAT_DSD_U16_LE &&
+	if (unlikely(ep->cur_format == SNDRV_PCM_FORMAT_DSD_U16_LE &&
 		     subs->cur_audiofmt->dsd_dop)) {
 		fill_playback_urb_dsd_dop(subs, urb, bytes);
-	} else if (unlikely(subs->pcm_format == SNDRV_PCM_FORMAT_DSD_U8 &&
+	} else if (unlikely(ep->cur_format == SNDRV_PCM_FORMAT_DSD_U8 &&
 			   subs->cur_audiofmt->dsd_bitrev)) {
 		/* bit-reverse the bytes */
 		u8 *buf = urb->transfer_buffer;
diff --git a/sound/usb/proc.c b/sound/usb/proc.c
index 889c550c9f29..447ba32e281c 100644
--- a/sound/usb/proc.c
+++ b/sound/usb/proc.c
@@ -175,32 +175,39 @@ static void proc_dump_ep_status(struct snd_usb_substream *subs,
 	}
 }
 
-static void proc_dump_substream_status(struct snd_usb_substream *subs, struct snd_info_buffer *buffer)
+static void proc_dump_substream_status(struct snd_usb_audio *chip,
+				       struct snd_usb_substream *subs,
+				       struct snd_info_buffer *buffer)
 {
+	mutex_lock(&chip->mutex);
 	if (subs->running) {
 		snd_iprintf(buffer, "  Status: Running\n");
-		snd_iprintf(buffer, "    Interface = %d\n", subs->interface);
-		snd_iprintf(buffer, "    Altset = %d\n", subs->altset_idx);
+		if (subs->cur_audiofmt) {
+			snd_iprintf(buffer, "    Interface = %d\n", subs->cur_audiofmt->iface);
+			snd_iprintf(buffer, "    Altset = %d\n", subs->cur_audiofmt->altsetting);
+		}
 		proc_dump_ep_status(subs, subs->data_endpoint, subs->sync_endpoint, buffer);
 	} else {
 		snd_iprintf(buffer, "  Status: Stop\n");
 	}
+	mutex_unlock(&chip->mutex);
 }
 
 static void proc_pcm_format_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 {
 	struct snd_usb_stream *stream = entry->private_data;
+	struct snd_usb_audio *chip = stream->chip;
 
-	snd_iprintf(buffer, "%s : %s\n", stream->chip->card->longname, stream->pcm->name);
+	snd_iprintf(buffer, "%s : %s\n", chip->card->longname, stream->pcm->name);
 
 	if (stream->substream[SNDRV_PCM_STREAM_PLAYBACK].num_formats) {
 		snd_iprintf(buffer, "\nPlayback:\n");
-		proc_dump_substream_status(&stream->substream[SNDRV_PCM_STREAM_PLAYBACK], buffer);
+		proc_dump_substream_status(chip, &stream->substream[SNDRV_PCM_STREAM_PLAYBACK], buffer);
 		proc_dump_substream_formats(&stream->substream[SNDRV_PCM_STREAM_PLAYBACK], buffer);
 	}
 	if (stream->substream[SNDRV_PCM_STREAM_CAPTURE].num_formats) {
 		snd_iprintf(buffer, "\nCapture:\n");
-		proc_dump_substream_status(&stream->substream[SNDRV_PCM_STREAM_CAPTURE], buffer);
+		proc_dump_substream_status(chip, &stream->substream[SNDRV_PCM_STREAM_CAPTURE], buffer);
 		proc_dump_substream_formats(&stream->substream[SNDRV_PCM_STREAM_CAPTURE], buffer);
 	}
 }
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 5510c8a98447..02f3f6ed9390 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1424,7 +1424,7 @@ static void set_format_emu_quirk(struct snd_usb_substream *subs,
 	 * by playback substream
 	 */
 	if (subs->direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		if (subs->stream->substream[SNDRV_PCM_STREAM_CAPTURE].interface != -1)
+		if (subs->stream->substream[SNDRV_PCM_STREAM_CAPTURE].cur_audiofmt)
 			return;
 	}
 
@@ -1459,13 +1459,13 @@ static void set_format_emu_quirk(struct snd_usb_substream *subs,
  */
 static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs)
 {
-
+	unsigned int cur_rate = subs->data_endpoint->cur_rate;
 	/* Convert sample rate value to little endian */
 	u8 sr[3];
 
-	sr[0] = subs->cur_rate & 0xff;
-	sr[1] = (subs->cur_rate >> 8) & 0xff;
-	sr[2] = (subs->cur_rate >> 16) & 0xff;
+	sr[0] = cur_rate & 0xff;
+	sr[1] = (cur_rate >> 8) & 0xff;
+	sr[2] = (cur_rate >> 16) & 0xff;
 
 	/* Configure device */
 	usb_set_interface(subs->dev, 0, 1);
-- 
2.16.4


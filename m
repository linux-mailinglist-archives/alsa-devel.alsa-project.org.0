Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A3B363652
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 17:14:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9D0D167F;
	Sun, 18 Apr 2021 17:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9D0D167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618758858;
	bh=YZxBTIIXgqvPCmrtGtO9Wk6WEH8bLYaEhX2Rx5Pq0sM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZwIK6ePSvH0QR3q3ftdGvzg9OKEk4PjmGbomQxRM+opXLlZwk4fDyr03s+XlxtN7n
	 rzyF3bJ/PVqMDPjooCEtj/7a02B7saFmR2otzOD893XxYDNXLPeNNhKUPdxv58NgAy
	 l+YNnnvMmtIXOVylB4q8oyqw+qLmhNyLON8nEYdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EC67F8013C;
	Sun, 18 Apr 2021 17:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35792F80253; Sun, 18 Apr 2021 17:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B338DF80164
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 17:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B338DF80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="Nd/yrVu5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V7xX8bm4jBy3DuLYSz4xKIJHzR5Tu7Ol7Yh9HiCbO5Q=; b=N
 d/yrVu550nFWxS8AMAlIHbhsObb7Mdic4ZW7wZ9fxFO2cmyvhcUFEhraSR25qzT7A/IOc5+LziEhD
 eB9VBYwt8x9FI7MBO2n35szhN9tyRi8EgmyxPC1iH4z7bcOq+DqbqAIZeqOdeSa4X4wDfT07UV9Yz
 Pm+p0ZPIE4/sX9/YWvTy3UY0XNeg763CkeFldpfZd3/D5foWGXuYtw5LBnHCYM0PSP0/3tM6TsKbD
 pD0pcpHwGOK2d3DaCR9l2n85hiu9BOP17/zpg4LGf+EY9Aw+v/IAcyiL0hrR1Ve/Dar9b7FQ/BjZ2
 m2N0dNGYjuZewU36yDpqWx/aWzFwUVU6w==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lY96F-00D9CE-Ew; Sun, 18 Apr 2021 17:12:39 +0200
From: David Henningsson <coding@diwic.se>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH v5] sound: rawmidi: Add framing mode
Date: Sun, 18 Apr 2021 17:12:17 +0200
Message-Id: <20210418151217.208582-1-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: coding@diwic.se
Cc: David Henningsson <coding@diwic.se>
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

This commit adds a new framing mode that frames all MIDI data into
32-byte frames with a timestamp.

The main benefit is that we can get accurate timestamps even if
userspace wakeup and processing is not immediate.

Testing on a Celeron N3150 with this mode has a max jitter of 2.8 ms,
compared to the in-kernel seq implementation which has a max jitter
of 5 ms during idle and much worse when running scheduler stress tests
in parallel.

Signed-off-by: David Henningsson <coding@diwic.se>
---

This version of the patch has been compile tested only, and
compared to v4, has only the changes with no controversy.

 include/sound/rawmidi.h     |  2 +
 include/uapi/sound/asound.h | 26 ++++++++++++-
 sound/core/rawmidi.c        | 73 ++++++++++++++++++++++++++++++++++++-
 sound/core/rawmidi_compat.c |  6 ++-
 4 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 334842daa904..b0057a193c31 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -81,6 +81,8 @@ struct snd_rawmidi_substream {
 	bool opened;			/* open flag */
 	bool append;			/* append flag (merge more streams) */
 	bool active_sensing;		/* send active sensing when close */
+	u8 framing;			/* whether to frame input data */
+	clockid_t clock_type;		/* clock source to use for input framing */
 	int use_count;			/* use counter (for output) */
 	size_t bytes;
 	struct snd_rawmidi *rmidi;
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 535a7229e1d9..124ac74a13e9 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -710,7 +710,7 @@ enum {
  *  Raw MIDI section - /dev/snd/midi??
  */
 
-#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 1)
+#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 2)
 
 enum {
 	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
@@ -736,12 +736,34 @@ struct snd_rawmidi_info {
 	unsigned char reserved[64];	/* reserved for future use */
 };
 
+enum {
+	SNDRV_RAWMIDI_FRAMING_NONE = 0,
+	SNDRV_RAWMIDI_FRAMING_TSTAMP,
+	SNDRV_RAWMIDI_FRAMING_LAST = SNDRV_RAWMIDI_FRAMING_TSTAMP,
+};
+
+#define SND_RAWMIDI_FRAMING_DATA_LENGTH 16
+
+struct snd_rawmidi_framing_tstamp {
+	/* For now, frame_type is always 0. Midi 2.0 is expected to add new
+	 * types here. Applications are expected to skip unknown frame types.
+	 */
+	u8 frame_type;
+	u8 length; /* number of valid bytes in data field */
+	u8 reserved[2];
+	u32 tv_nsec;		/* nanoseconds */
+	u64 tv_sec;		/* seconds */
+	u8 data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
+};
+
 struct snd_rawmidi_params {
 	int stream;
 	size_t buffer_size;		/* queue size in bytes */
 	size_t avail_min;		/* minimum avail bytes for wakeup */
 	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
-	unsigned char reserved[16];	/* reserved for future use */
+	unsigned char framing;		/* For input data only, frame incoming data */
+	unsigned char clock_type;	/* Type of clock to use for framing, same as clockid_t */
+	unsigned char reserved[14];	/* reserved for future use */
 };
 
 #ifndef __KERNEL__
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index aca00af93afe..c3a4940a919d 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -683,6 +683,8 @@ static int resize_runtime_buffer(struct snd_rawmidi_runtime *runtime,
 
 	if (params->buffer_size < 32 || params->buffer_size > 1024L * 1024L)
 		return -EINVAL;
+	if (params->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP && (params->buffer_size & 0x1f) != 0)
+		return -EINVAL;
 	if (params->avail_min < 1 || params->avail_min > params->buffer_size)
 		return -EINVAL;
 	if (params->buffer_size != runtime->buffer_size) {
@@ -720,7 +722,16 @@ EXPORT_SYMBOL(snd_rawmidi_output_params);
 int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 			     struct snd_rawmidi_params *params)
 {
+	if (params->framing) {
+		if (params->framing > SNDRV_RAWMIDI_FRAMING_LAST)
+			return -EINVAL;
+		/* framing requires a valid clock type */
+		if (params->clock_type != CLOCK_MONOTONIC_RAW && params->clock_type != CLOCK_MONOTONIC)
+			return -EINVAL;
+	}
 	snd_rawmidi_drain_input(substream);
+	substream->framing = params->framing;
+	substream->clock_type = params->clock_type;
 	return resize_runtime_buffer(substream->runtime, params, true);
 }
 EXPORT_SYMBOL(snd_rawmidi_input_params);
@@ -963,6 +974,56 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
 	return -ENOIOCTLCMD;
 }
 
+static int receive_with_tstamp_framing(struct snd_rawmidi_substream *substream,
+			const unsigned char *buffer, int src_count, const struct timespec64 *tstamp)
+{
+	struct snd_rawmidi_runtime *runtime = substream->runtime;
+	struct snd_rawmidi_framing_tstamp *dest_ptr;
+	struct snd_rawmidi_framing_tstamp frame = { .tv_sec = tstamp->tv_sec, .tv_nsec = tstamp->tv_nsec };
+	int dest_frames = 0;
+	int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
+
+	BUILD_BUG_ON(frame_size != 0x20);
+	if (snd_BUG_ON((runtime->hw_ptr & 0x1f) != 0))
+		return -EINVAL;
+
+	while (src_count > 0) {
+		if ((int)(runtime->buffer_size - runtime->avail) < frame_size) {
+			runtime->xruns += src_count;
+			break;
+		}
+		if (src_count >= SND_RAWMIDI_FRAMING_DATA_LENGTH)
+			frame.length = SND_RAWMIDI_FRAMING_DATA_LENGTH;
+		else {
+			frame.length = src_count;
+			memset(frame.data, 0, SND_RAWMIDI_FRAMING_DATA_LENGTH);
+		}
+		memcpy(frame.data, buffer, frame.length);
+		buffer += frame.length;
+		src_count -= frame.length;
+		dest_ptr = (struct snd_rawmidi_framing_tstamp *) (runtime->buffer + runtime->hw_ptr);
+		*dest_ptr = frame;
+		runtime->avail += frame_size;
+		runtime->hw_ptr += frame_size;
+		runtime->hw_ptr %= runtime->buffer_size;
+		dest_frames++;
+	}
+	return dest_frames * frame_size;
+}
+
+struct timespec64 get_framing_tstamp(struct snd_rawmidi_substream *substream)
+{
+	struct timespec64 ts64 = {0, 0};
+
+	if (substream->framing != SNDRV_RAWMIDI_FRAMING_TSTAMP)
+		return ts64;
+	if (substream->clock_type == CLOCK_MONOTONIC_RAW)
+		ktime_get_raw_ts64(&ts64);
+	else
+		ktime_get_ts64(&ts64);
+	return ts64;
+}
+
 /**
  * snd_rawmidi_receive - receive the input data from the device
  * @substream: the rawmidi substream
@@ -977,6 +1038,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			const unsigned char *buffer, int count)
 {
 	unsigned long flags;
+	struct timespec64 ts64 = get_framing_tstamp(substream);
 	int result = 0, count1;
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
 
@@ -987,8 +1049,11 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			  "snd_rawmidi_receive: input is not active!!!\n");
 		return -EINVAL;
 	}
+
 	spin_lock_irqsave(&runtime->lock, flags);
-	if (count == 1) {	/* special case, faster code */
+	if (substream->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP) {
+		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
+	} else if (count == 1) {	/* special case, faster code */
 		substream->bytes++;
 		if (runtime->avail < runtime->buffer_size) {
 			runtime->buffer[runtime->hw_ptr++] = buffer[0];
@@ -1596,6 +1661,12 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 					    "  Avail        : %lu\n"
 					    "  Overruns     : %lu\n",
 					    buffer_size, avail, xruns);
+				if (substream->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP) {
+					snd_iprintf(buffer,
+					    "  Framing      : tstamp\n"
+					    "  Clock type   : %s\n",
+					    substream->clock_type == CLOCK_MONOTONIC_RAW ? "monotonic raw" : "monotonic");
+				}
 			}
 		}
 	}
diff --git a/sound/core/rawmidi_compat.c b/sound/core/rawmidi_compat.c
index 7397130976d0..2603d2dd8abb 100644
--- a/sound/core/rawmidi_compat.c
+++ b/sound/core/rawmidi_compat.c
@@ -13,7 +13,9 @@ struct snd_rawmidi_params32 {
 	u32 buffer_size;
 	u32 avail_min;
 	unsigned int no_active_sensing; /* avoid bit-field */
-	unsigned char reserved[16];
+	unsigned char framing;
+	unsigned char clock_type;
+	unsigned char reserved[14];
 } __attribute__((packed));
 
 static int snd_rawmidi_ioctl_params_compat(struct snd_rawmidi_file *rfile,
@@ -25,6 +27,8 @@ static int snd_rawmidi_ioctl_params_compat(struct snd_rawmidi_file *rfile,
 	if (get_user(params.stream, &src->stream) ||
 	    get_user(params.buffer_size, &src->buffer_size) ||
 	    get_user(params.avail_min, &src->avail_min) ||
+	    get_user(params.framing, &src->framing) ||
+	    get_user(params.clock_type, &src->clock_type) ||
 	    get_user(val, &src->no_active_sensing))
 		return -EFAULT;
 	params.no_active_sensing = val;
-- 
2.25.1


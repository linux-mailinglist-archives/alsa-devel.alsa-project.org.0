Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF784364872
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 18:42:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2346A168A;
	Mon, 19 Apr 2021 18:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2346A168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618850548;
	bh=ht67IqLi06iM5pB+qSCwzqtsWKcE6rVAYaFzO1MQ3wE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SDNowWXZEmlu8SzTEdfnRifdfm/OXwkqIIU9ytXW4m+6bgBFRytSITIarf3tqAbBL
	 qTRVESp83ScukIxVafm6QKQ3ZeD/evr60xxXhgaLx3t0bXAHsPkYJbL4JlTGr7aEuU
	 9SPlg6Uc6pYEjNC/J5plL1iyy0OwyR1lW/51nm2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEC27F8014D;
	Mon, 19 Apr 2021 18:40:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A03AF80274; Mon, 19 Apr 2021 18:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E93DF8019B
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 18:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E93DF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="g15zwCyU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6oNfgbQzvTfqZkX1R5TZgrC3SP/iajbZ7G7oNqn9koM=; b=g
 15zwCyU63zF6u59bWSkJPt02KX9gSOm3Bx94G6RnOk8wJI+dVumVCh3UFP1UWNueszfi0nEYr7801
 I5LoEmpSc+PWPJfpFCna0T0KgmxjJZdns0wYCClt7htXCsTwGjiB9lG+WVyTQ36AQk64Iwr3Pj3oY
 snnahI8tVlk5C+AqiOlAaolmdBlh9/12jr3O7yf1+/dy/sjVoDkBgSUfCfPKhcgjL1cA1sXzYIFvM
 OscOmt5tUFtpn4xxZ7vHzHr8KLN7XIkKdk6ngpWr828x2oFiagsFV8XiWkk9K72BiB/gtjKDBdzKj
 dqRCNNw1AGM2u6qPOzV6Uy/0eBz/z6myA==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lYWx2-005otZ-AL; Mon, 19 Apr 2021 18:40:44 +0200
From: David Henningsson <coding@diwic.se>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v6] sound: rawmidi: Add framing mode
Date: Mon, 19 Apr 2021 18:40:23 +0200
Message-Id: <20210419164023.159967-1-coding@diwic.se>
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

Changes since v5: Added realtime clock and changed params struct according to
Jaroslav's wishes.

This version of the patch has been compile tested only.

 include/sound/rawmidi.h     |  2 +
 include/uapi/sound/asound.h | 30 ++++++++++++-
 sound/core/rawmidi.c        | 86 ++++++++++++++++++++++++++++++++++++-
 sound/core/rawmidi_compat.c |  4 +-
 4 files changed, 118 insertions(+), 4 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 334842daa904..989e1517332d 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -81,6 +81,8 @@ struct snd_rawmidi_substream {
 	bool opened;			/* open flag */
 	bool append;			/* append flag (merge more streams) */
 	bool active_sensing;		/* send active sensing when close */
+	unsigned int framing;		/* whether to frame input data */
+	unsigned int clock_type;	/* clock source to use for input framing */
 	int use_count;			/* use counter (for output) */
 	size_t bytes;
 	struct snd_rawmidi *rmidi;
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 535a7229e1d9..773a00c0a1d8 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -710,7 +710,7 @@ enum {
  *  Raw MIDI section - /dev/snd/midi??
  */
 
-#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 1)
+#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 2)
 
 enum {
 	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
@@ -736,12 +736,38 @@ struct snd_rawmidi_info {
 	unsigned char reserved[64];	/* reserved for future use */
 };
 
+#define SNDRV_RAWMIDI_MODE_FRAMING_MASK		(7<<0)
+#define SNDRV_RAWMIDI_MODE_FRAMING_SHIFT	0
+#define SNDRV_RAWMIDI_MODE_FRAMING_NONE		(0<<0)
+#define SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP	(1<<0)
+#define SNDRV_RAWMIDI_MODE_CLOCK_MASK		(7<<3)
+#define SNDRV_RAWMIDI_MODE_CLOCK_SHIFT		3
+#define SNDRV_RAWMIDI_MODE_CLOCK_NONE		(0<<3)
+#define SNDRV_RAWMIDI_MODE_CLOCK_REALTIME	(1<<3)
+#define SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC	(2<<3)
+#define SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC_RAW	(3<<3)
+
+#define SNDRV_RAWMIDI_FRAMING_DATA_LENGTH 16
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
+	u8 data[SNDRV_RAWMIDI_FRAMING_DATA_LENGTH];
+} __attribute__((packed));
+
 struct snd_rawmidi_params {
 	int stream;
 	size_t buffer_size;		/* queue size in bytes */
 	size_t avail_min;		/* minimum avail bytes for wakeup */
 	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
-	unsigned char reserved[16];	/* reserved for future use */
+	unsigned int mode;		/* For input data only, frame incoming data */
+	unsigned char reserved[12];	/* reserved for future use */
 };
 
 #ifndef __KERNEL__
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index aca00af93afe..5d5f4363e887 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -680,9 +680,12 @@ static int resize_runtime_buffer(struct snd_rawmidi_runtime *runtime,
 				 bool is_input)
 {
 	char *newbuf, *oldbuf;
+	unsigned int framing = params->mode & SNDRV_RAWMIDI_MODE_FRAMING_MASK;
 
 	if (params->buffer_size < 32 || params->buffer_size > 1024L * 1024L)
 		return -EINVAL;
+	if (framing == SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP && (params->buffer_size & 0x1f) != 0)
+		return -EINVAL;
 	if (params->avail_min < 1 || params->avail_min > params->buffer_size)
 		return -EINVAL;
 	if (params->buffer_size != runtime->buffer_size) {
@@ -720,7 +723,18 @@ EXPORT_SYMBOL(snd_rawmidi_output_params);
 int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 			     struct snd_rawmidi_params *params)
 {
+	unsigned int framing = params->mode & SNDRV_RAWMIDI_MODE_FRAMING_MASK;
+	unsigned int clock_type = params->mode & SNDRV_RAWMIDI_MODE_CLOCK_MASK;
+
+	if (framing == SNDRV_RAWMIDI_MODE_FRAMING_NONE && clock_type != SNDRV_RAWMIDI_MODE_CLOCK_NONE)
+		return -EINVAL;
+	else if (clock_type > SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC_RAW)
+		return -EINVAL;
+	if (framing > SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP)
+		return -EINVAL;
 	snd_rawmidi_drain_input(substream);
+	substream->framing = framing;
+	substream->clock_type = clock_type;
 	return resize_runtime_buffer(substream->runtime, params, true);
 }
 EXPORT_SYMBOL(snd_rawmidi_input_params);
@@ -963,6 +977,61 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
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
+		if (src_count >= SNDRV_RAWMIDI_FRAMING_DATA_LENGTH)
+			frame.length = SNDRV_RAWMIDI_FRAMING_DATA_LENGTH;
+		else {
+			frame.length = src_count;
+			memset(frame.data, 0, SNDRV_RAWMIDI_FRAMING_DATA_LENGTH);
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
+static struct timespec64 get_framing_tstamp(struct snd_rawmidi_substream *substream)
+{
+	struct timespec64 ts64 = {0, 0};
+
+	switch (substream->clock_type) {
+	case SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC_RAW:
+		ktime_get_raw_ts64(&ts64);
+		break;
+	case SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC:
+		ktime_get_ts64(&ts64);
+		break;
+	case SNDRV_RAWMIDI_MODE_CLOCK_REALTIME:
+		ktime_get_real_ts64(&ts64);
+		break;
+	}
+	return ts64;
+}
+
 /**
  * snd_rawmidi_receive - receive the input data from the device
  * @substream: the rawmidi substream
@@ -977,6 +1046,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			const unsigned char *buffer, int count)
 {
 	unsigned long flags;
+	struct timespec64 ts64 = get_framing_tstamp(substream);
 	int result = 0, count1;
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
 
@@ -987,8 +1057,11 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			  "snd_rawmidi_receive: input is not active!!!\n");
 		return -EINVAL;
 	}
+
 	spin_lock_irqsave(&runtime->lock, flags);
-	if (count == 1) {	/* special case, faster code */
+	if (substream->framing == SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP) {
+		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
+	} else if (count == 1) {	/* special case, faster code */
 		substream->bytes++;
 		if (runtime->avail < runtime->buffer_size) {
 			runtime->buffer[runtime->hw_ptr++] = buffer[0];
@@ -1534,6 +1607,7 @@ static __poll_t snd_rawmidi_poll(struct file *file, poll_table *wait)
 /*
  */
 
+
 static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 				       struct snd_info_buffer *buffer)
 {
@@ -1541,6 +1615,8 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 	struct snd_rawmidi_substream *substream;
 	struct snd_rawmidi_runtime *runtime;
 	unsigned long buffer_size, avail, xruns;
+	unsigned int clock_type;
+	static const char *clock_names[4] = { "none", "realtime", "monotonic", "monotonic raw" };
 
 	rmidi = entry->private_data;
 	snd_iprintf(buffer, "%s\n\n", rmidi->name);
@@ -1596,6 +1672,14 @@ static void snd_rawmidi_proc_info_read(struct snd_info_entry *entry,
 					    "  Avail        : %lu\n"
 					    "  Overruns     : %lu\n",
 					    buffer_size, avail, xruns);
+				if (substream->framing == SNDRV_RAWMIDI_MODE_FRAMING_TSTAMP) {
+					clock_type = substream->clock_type >> SNDRV_RAWMIDI_MODE_CLOCK_SHIFT;
+					if (!snd_BUG_ON(clock_type >= sizeof(clock_names)))
+						snd_iprintf(buffer,
+							    "  Framing      : tstamp\n"
+							    "  Clock type   : %s\n",
+							    clock_names[clock_type]);
+				}
 			}
 		}
 	}
diff --git a/sound/core/rawmidi_compat.c b/sound/core/rawmidi_compat.c
index 7397130976d0..68a93443583c 100644
--- a/sound/core/rawmidi_compat.c
+++ b/sound/core/rawmidi_compat.c
@@ -13,7 +13,8 @@ struct snd_rawmidi_params32 {
 	u32 buffer_size;
 	u32 avail_min;
 	unsigned int no_active_sensing; /* avoid bit-field */
-	unsigned char reserved[16];
+	unsigned int mode;
+	unsigned char reserved[12];
 } __attribute__((packed));
 
 static int snd_rawmidi_ioctl_params_compat(struct snd_rawmidi_file *rfile,
@@ -25,6 +26,7 @@ static int snd_rawmidi_ioctl_params_compat(struct snd_rawmidi_file *rfile,
 	if (get_user(params.stream, &src->stream) ||
 	    get_user(params.buffer_size, &src->buffer_size) ||
 	    get_user(params.avail_min, &src->avail_min) ||
+	    get_user(params.mode, &src->mode) ||
 	    get_user(val, &src->no_active_sensing))
 		return -EFAULT;
 	params.no_active_sensing = val;
-- 
2.25.1


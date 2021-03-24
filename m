Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D8B34712F
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 06:44:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E26B41683;
	Wed, 24 Mar 2021 06:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E26B41683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616564685;
	bh=osPk0pRoKU4FjbzG6POalOdEJkxGIV9Ck+aCk0AslXw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fih6lcp1hiFF6uWqUp4IsEzCrauam181gOVOXujiIgUPFzHhqGesBIADF7Cfmy/zi
	 5XJR25pN59IdvbZNcksK6OJ3Ynb5fccRkpv0zbW2GNB1FOmVj8Vf5AXdr4FHTukmfq
	 X02/b4/7f4V+2SeXKy38fTgcotqPbghg2EMzX1Zw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47AE2F801D5;
	Wed, 24 Mar 2021 06:43:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0B7BF8016B; Wed, 24 Mar 2021 06:43:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 429F7F800FF
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 06:43:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 429F7F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="OtXkMjVc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eYchDQmBRLxoRE0+yP0UoLKIZgtg4/rV3Co4R+jm8xI=; b=O
 tXkMjVc8lrp9PJ7cBTAPal02j4yjcsN8vMhBNIgL1fT8g3Ffdetrfd95q5e5zK1Sd1kdPn+7XYu/R
 IPtx8GRfBoM3gboJ8gc3ZHlvfOvDB11oyzMmEZkWx7iLseUt6AhthsXLpMQIdjiRHodyxhkCDj+6+
 +5UCPNXeGwAJQpwq1hiOQh9yp0dLFp0/gqjV8+Vx1g6wEUAqdp1wvCyNaqG7DvnyBQocMqtO8XAhS
 ixvntYHzWFB6G7ienLvxWYmLR0dNXnXgC90oIxa7+IYCcAfsury/sm52sLLV+zLge3xEAeBzEJWQF
 IrkBQLNDiFx+BYx3N0spnidYpVd8xhZgA==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lOwIJ-005cNI-Tk; Wed, 24 Mar 2021 06:43:03 +0100
From: David Henningsson <coding@diwic.se>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2] sound: rawmidi: Add framing mode
Date: Wed, 24 Mar 2021 06:42:53 +0100
Message-Id: <20210324054253.34642-1-coding@diwic.se>
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
16-byte frames with a timestamp from the monotonic_raw clock.

The main benefit is that we can get accurate timestamps even if
userspace wakeup and processing is not immediate.

Signed-off-by: David Henningsson <coding@diwic.se>
---

v2: Fixed checkpatch errors.

 include/sound/rawmidi.h     |  1 +
 include/uapi/sound/asound.h | 18 ++++++++++++++-
 sound/core/rawmidi.c        | 45 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 334842daa904..4ba5d2deec18 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -81,6 +81,7 @@ struct snd_rawmidi_substream {
 	bool opened;			/* open flag */
 	bool append;			/* append flag (merge more streams) */
 	bool active_sensing;		/* send active sensing when close */
+	u8 framing;			/* whether to frame data (for input) */
 	int use_count;			/* use counter (for output) */
 	size_t bytes;
 	struct snd_rawmidi *rmidi;
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 535a7229e1d9..f33076755025 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -736,12 +736,28 @@ struct snd_rawmidi_info {
 	unsigned char reserved[64];	/* reserved for future use */
 };
 
+enum {
+	SNDRV_RAWMIDI_FRAMING_NONE = 0,
+	SNDRV_RAWMIDI_FRAMING_TSTAMP_MONOTONIC_RAW,
+	SNDRV_RAWMIDI_FRAMING_LAST = SNDRV_RAWMIDI_FRAMING_TSTAMP_MONOTONIC_RAW,
+};
+
+#define SND_RAWMIDI_FRAMING_DATA_LENGTH 7
+
+struct snd_rawmidi_framing_tstamp {
+	unsigned int tv_sec;	/* seconds */
+	unsigned int tv_nsec;	/* nanoseconds */
+	unsigned char length;
+	unsigned char data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
+};
+
 struct snd_rawmidi_params {
 	int stream;
 	size_t buffer_size;		/* queue size in bytes */
 	size_t avail_min;		/* minimum avail bytes for wakeup */
 	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
-	unsigned char reserved[16];	/* reserved for future use */
+	unsigned char framing;		/* For input data only, frame incoming data */
+	unsigned char reserved[15];	/* reserved for future use */
 };
 
 #ifndef __KERNEL__
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index aca00af93afe..cd927ba178a6 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -721,6 +721,7 @@ int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
 			     struct snd_rawmidi_params *params)
 {
 	snd_rawmidi_drain_input(substream);
+	substream->framing = params->framing;
 	return resize_runtime_buffer(substream->runtime, params, true);
 }
 EXPORT_SYMBOL(snd_rawmidi_input_params);
@@ -963,6 +964,44 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
 	return -ENOIOCTLCMD;
 }
 
+static int receive_with_tstamp_framing(struct snd_rawmidi_substream *substream,
+			const unsigned char *buffer, int src_count, struct timespec64 *tstamp)
+{
+	struct snd_rawmidi_runtime *runtime = substream->runtime;
+	struct snd_rawmidi_framing_tstamp frame;
+	struct snd_rawmidi_framing_tstamp *dest_ptr;
+	int dest_frames = 0;
+	int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
+
+	frame.tv_sec = tstamp->tv_sec;
+	frame.tv_nsec = tstamp->tv_nsec;
+	if (snd_BUG_ON(runtime->hw_ptr & 15 || runtime->buffer_size & 15 || frame_size != 16))
+		return -EINVAL;
+
+	while (src_count > 0) {
+		if ((int)(runtime->buffer_size - runtime->avail) < frame_size) {
+			runtime->xruns += src_count;
+			return dest_frames * frame_size;
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
 /**
  * snd_rawmidi_receive - receive the input data from the device
  * @substream: the rawmidi substream
@@ -977,6 +1016,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			const unsigned char *buffer, int count)
 {
 	unsigned long flags;
+	struct timespec64 ts64;
 	int result = 0, count1;
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
 
@@ -988,7 +1028,10 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 		return -EINVAL;
 	}
 	spin_lock_irqsave(&runtime->lock, flags);
-	if (count == 1) {	/* special case, faster code */
+	if (substream->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP_MONOTONIC_RAW) {
+		ktime_get_raw_ts64(&ts64);
+		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
+	} else if (count == 1) {	/* special case, faster code */
 		substream->bytes++;
 		if (runtime->avail < runtime->buffer_size) {
 			runtime->buffer[runtime->hw_ptr++] = buffer[0];
-- 
2.25.1


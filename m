Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82536349AF4
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 21:24:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020CC1660;
	Thu, 25 Mar 2021 21:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020CC1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616703889;
	bh=m0G8oIYsPeBSm1zPKyrgSxm/vgGxA7fy23aovERLbv8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Et9c7TdFrsUovHdzxq6x6vGt5eVgsKe+2nkjau4N/GSTaJ27nnp/qFvBWd/CNNz47
	 iuP0SUr9BlSjId6v5wopmadELIJpUfd6D/DFXGCTPF91pEEzMMUuDGE0lnWiqTAylr
	 ivDD1ZzBjYuZRHx/143LVBaAIM4JtC/EnLhKXf2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65108F80103;
	Thu, 25 Mar 2021 21:23:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E959BF8025F; Thu, 25 Mar 2021 21:23:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F4B3F80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 21:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F4B3F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="GGBooT9B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Vsj3RHKoD0D1GdcXDsj8ZaHkuTMUkW5EG+t9NVbyDLQ=; b=G
 GBooT9BjFDBBsM3ldLcn4mKdXRaZWCZm/o/HDr9xTgOSQKSFAROrWyvennXUl8R2wOjF9BT7+5vNM
 45BcicwVtKbejXM+lWDHycy4u5/p1Fd04GKj648TO7jK9+EKPKXj0wGulmra5hARMaGRz8CPAUvRE
 xAUEFt3TVeRFJtjuwaleR6IwWjzDmUXylmpNyGKpKvrCyECx8Xzl5/r2n6+6hBqiDHeSa4DMdSQe6
 BfRIenh8dzYimZ+uQlT9kW7AJxV1gjnizJah5MxYhgA5+J7gJNzc6i0Gb3cbcsdpqvD7Ij44wiAAI
 Mg3C4tVIcTtKB0TEPlllSYmhvC+ejYj7Q==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lPWVX-002m7I-TL; Thu, 25 Mar 2021 21:23:07 +0100
From: David Henningsson <coding@diwic.se>
To: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz,
 o-takashi@sakamocchi.jp
Subject: [PATCH v3] sound: rawmidi: Add framing mode
Date: Thu, 25 Mar 2021 21:22:44 +0100
Message-Id: <20210325202244.8084-1-coding@diwic.se>
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
16-byte frames with a timestamp.

The main benefit is that we can get accurate timestamps even if
userspace wakeup and processing is not immediate.

Signed-off-by: David Henningsson <coding@diwic.se>
---

Changes in v3:
 * Bumped protocol version
 * More checks for invalid combinations in set_params
 * Frame: Timestamp is 64 bit for seconds and 3 bytes for data
 * Sets clock and framing individually.
   (Clock_type is unsigned char instead of clockid_t to avoid padding issues.)
 * Supports both monotonic and monotonic_raw timestamps
 * Moved spin lock to after timestamp retreival. Both to decrease time spent in spin lock,
   and to get more accurate timestamp in case the spin lock is actually busy.

 include/sound/rawmidi.h     |  2 ++
 include/uapi/sound/asound.h | 21 +++++++++++--
 sound/core/rawmidi.c        | 63 +++++++++++++++++++++++++++++++++++--
 3 files changed, 82 insertions(+), 4 deletions(-)

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
index 535a7229e1d9..a965a975aec3 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -710,7 +710,7 @@ enum {
  *  Raw MIDI section - /dev/snd/midi??
  */
 
-#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 1)
+#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 2)
 
 enum {
 	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
@@ -736,12 +736,29 @@ struct snd_rawmidi_info {
 	unsigned char reserved[64];	/* reserved for future use */
 };
 
+enum {
+	SNDRV_RAWMIDI_FRAMING_NONE = 0,
+	SNDRV_RAWMIDI_FRAMING_TSTAMP,
+	SNDRV_RAWMIDI_FRAMING_LAST = SNDRV_RAWMIDI_FRAMING_TSTAMP,
+};
+
+#define SND_RAWMIDI_FRAMING_DATA_LENGTH 3
+
+struct snd_rawmidi_framing_tstamp {
+	unsigned long long tv_sec;	/* seconds */
+	unsigned int tv_nsec;		/* nanoseconds */
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
+	unsigned char clock_type;		/* Type of clock to use for framing, same as clockid_t */
+	unsigned char reserved[14];	/* reserved for future use */
 };
 
 #ifndef __KERNEL__
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index aca00af93afe..269363286b3b 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -683,6 +683,8 @@ static int resize_runtime_buffer(struct snd_rawmidi_runtime *runtime,
 
 	if (params->buffer_size < 32 || params->buffer_size > 1024L * 1024L)
 		return -EINVAL;
+	if (params->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP && params->buffer_size & 0xf)
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
@@ -963,6 +974,45 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
 	return -ENOIOCTLCMD;
 }
 
+static int receive_with_tstamp_framing(struct snd_rawmidi_substream *substream,
+			const unsigned char *buffer, int src_count, struct timespec64 *tstamp)
+{
+	struct snd_rawmidi_runtime *runtime = substream->runtime;
+	struct snd_rawmidi_framing_tstamp frame;
+	struct snd_rawmidi_framing_tstamp *dest_ptr;
+
+	int dest_frames = 0;
+	int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
+
+	frame.tv_sec = tstamp->tv_sec;
+	frame.tv_nsec = tstamp->tv_nsec;
+
+	if (snd_BUG_ON(runtime->hw_ptr & 0xf || runtime->buffer_size & 0xf || frame_size != 0x10))
+		return -EINVAL;
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
@@ -977,6 +1027,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			const unsigned char *buffer, int count)
 {
 	unsigned long flags;
+	struct timespec64 ts64;
 	int result = 0, count1;
 	struct snd_rawmidi_runtime *runtime = substream->runtime;
 
@@ -987,8 +1038,15 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			  "snd_rawmidi_receive: input is not active!!!\n");
 		return -EINVAL;
 	}
-	spin_lock_irqsave(&runtime->lock, flags);
-	if (count == 1) {	/* special case, faster code */
+	if (substream->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP) {
+		if (substream->clock_type == CLOCK_MONOTONIC_RAW)
+			ktime_get_raw_ts64(&ts64);
+		else
+			ktime_get_ts64(&ts64);
+		spin_lock_irqsave(&runtime->lock, flags);
+		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
+	} else if (count == 1) {	/* special case, faster code */
+		spin_lock_irqsave(&runtime->lock, flags);
 		substream->bytes++;
 		if (runtime->avail < runtime->buffer_size) {
 			runtime->buffer[runtime->hw_ptr++] = buffer[0];
@@ -999,6 +1057,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 			runtime->xruns++;
 		}
 	} else {
+		spin_lock_irqsave(&runtime->lock, flags);
 		substream->bytes += count;
 		count1 = runtime->buffer_size - runtime->hw_ptr;
 		if (count1 > count)
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87B3470F3
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 06:34:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D5991693;
	Wed, 24 Mar 2021 06:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D5991693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616564045;
	bh=yFxuHYAub9qLaDOiSUSbIEHmCed0ogpMv1Oyry4oypM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hlUwlG2VVGT0Q185qXQh9iI6DrEhISMNk2FG6UGcjhAi+ZVPHPmo1dGojPoQ4IyZu
	 UdCAAir47VsnSdh/JBio5c9Az7QMGq0AmkGAwxwfpZ2SSIOyO5Mw5TqKBLe5THCFJk
	 NtHLmvVb0mHJOPG02wbE3C922uaK/m62L/kyBi6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30004F8032D;
	Wed, 24 Mar 2021 06:32:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FD1AF8032C; Wed, 24 Mar 2021 06:32:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE9ACF801EB
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 06:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE9ACF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="KWi6rWyB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pu/10OSZZ2g6MAe7fKXvb0S+ocPBG3ra3LOHbg5UUEc=; b=KWi6rWyB7b6ei93L/XSsuvr08E
 4qI4LsuM6Vvd8HffA/dp9hjZprMFUHsUpkD9DhxMkyzg14jzfz9xob+yhQt6L6/MGfYS+E6PjQk+y
 7uiFlx9i8iLHPzoOsZIpQUiaXbfpitOucgoqAG7GYXW8svX7QP9xBiYCk5lI2MaymLRDnBZlAjacP
 0hzQKy9a9IZAZf+o+5fCWVb1SYVJn4Xr8qUp4N/jqVo5ls/21pkUK+ylBevxjmQq7UFNmhnVR80xK
 I8Cq57LJvXIf1wrT/YxbMqawR1DEUIOsqdwcqC3NlhcJYnAGF+0A6nyYD0f2QsEkeiy1dwVBCBTIP
 BmcCFzGg==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lOw7t-005YhP-8Q; Wed, 24 Mar 2021 06:32:17 +0100
From: David Henningsson <coding@diwic.se>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 1/1] sound: rawmidi: Add framing mode
Date: Wed, 24 Mar 2021 06:31:54 +0100
Message-Id: <20210324053154.34107-2-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324053154.34107-1-coding@diwic.se>
References: <20210324053154.34107-1-coding@diwic.se>
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
---
 include/sound/rawmidi.h     |  1 +
 include/uapi/sound/asound.h | 18 ++++++++++++++-
 sound/core/rawmidi.c        | 45 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index 334842daa904..ea4d88d513e1 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -81,6 +81,7 @@ struct snd_rawmidi_substream {
 	bool opened;			/* open flag */
 	bool append;			/* append flag (merge more streams) */
 	bool active_sensing;		/* send active sensing when close */
+	u8 framing; /* whether to frame data (for input) */
 	int use_count;			/* use counter (for output) */
 	size_t bytes;
 	struct snd_rawmidi *rmidi;
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 535a7229e1d9..13c3865a818e 100644
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
+	unsigned char framing; /* For input data only, frame incoming data */
+	unsigned char reserved[15];	/* reserved for future use */
 };
 
 #ifndef __KERNEL__
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index aca00af93afe..fefa7d9b70a6 100644
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
+
+	int dest_frames = 0;
+	int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
+	frame.tv_sec = tstamp->tv_sec;
+	frame.tv_nsec = tstamp->tv_nsec;
+
+	if (snd_BUG_ON(runtime->hw_ptr & 15 || runtime->buffer_size & 15 || frame_size != 16))
+		return -EINVAL;
+	while (src_count > 0) {
+		if ((int)(runtime->buffer_size - runtime->avail) < frame_size) {
+			runtime->xruns += src_count;
+			return dest_frames * frame_size;
+		}
+		if (SND_RAWMIDI_FRAMING_DATA_LENGTH < src_count)
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
@@ -988,7 +1027,11 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
 		return -EINVAL;
 	}
 	spin_lock_irqsave(&runtime->lock, flags);
-	if (count == 1) {	/* special case, faster code */
+	if (substream->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP_MONOTONIC_RAW) {
+		struct timespec64 ts64;
+		ktime_get_raw_ts64(&ts64);
+		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
+	} else if (count == 1) {	/* special case, faster code */
 		substream->bytes++;
 		if (runtime->avail < runtime->buffer_size) {
 			runtime->buffer[runtime->hw_ptr++] = buffer[0];
-- 
2.25.1


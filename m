Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B13EECD9
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 14:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A651684;
	Tue, 17 Aug 2021 14:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A651684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629204813;
	bh=Zmvxblw28ciu2NZg3BkQgmi4swFRGqsBKktXIZRmCJk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbhvRwO33KBIJZUHC7bMyiqqBV52V/TCSDL/TMgZS9Zmu9ohiDkRkkHlQJY8qnF5K
	 EJHfbz3eykuGtwQX9WR0NKH1Aid/dCgHr6VVvcabx5g0luldXtP0qXVONIjv/niAw4
	 RyAcl6gmWlZulULxSug7VOVNZh9QIjC0cYyAhefk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F69F804BC;
	Tue, 17 Aug 2021 14:51:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91BE9F804B0; Tue, 17 Aug 2021 14:51:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D0CDF80163
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 14:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0CDF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="QVkJMhdi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L0U8b6cakC/27RGQmOmA7yDvzvJ1KAtvd9ylDXlHrMc=; b=QVkJMhdiJ0h8VXnVAhZgoODnXz
 yuwHJq8vdQhBkYr9ZqjfDafiwSytEHnVkQYptaQ+ZiPJUUm+MHjc+TkuuJQBG2J83iHHmo/20bEbn
 YQr/75+Fbk8e/fs/pSDtI0fJBFR1glKgGGUafOy6tCPes/0CnAyhkkhO5dArx7hjhrFkp6BOnuHIm
 DMntT/IjCX7kurSu9b1bV4VF/QorAkaYbRIaHy4ZF9kUsanO4yH4tBj9/lU/adArfaZZNgSpqzFu+
 KR1jMl4xii7pt/n6J11YEJk7l14jpOQiVCIbQiDSEc8aeExG8ydsksoX1PT/8FXe99E8uvAzTEO8S
 dreCvbew==;
Received: from c83-254-143-147.bredband.tele2.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <coding@diwic.se>)
 id 1mFyZD-00DMgr-9H; Tue, 17 Aug 2021 14:51:43 +0200
From: David Henningsson <coding@diwic.se>
To: tiwai@suse.de,
	alsa-devel@alsa-project.org,
	perex@perex.cz
Subject: [PATCH v2 1/2] Add rawmidi framing API
Date: Tue, 17 Aug 2021 14:51:31 +0200
Message-Id: <20210817125132.5737-2-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817125132.5737-1-coding@diwic.se>
References: <20210817125132.5737-1-coding@diwic.se>
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

Optionally, incoming rawmidi bytes can be put inside a frame of type snd_rawmidi_framing_tstamp_t.
The main current benefit is that can enable in-kernel timestamping of incoming bytes, and that
timestamp is likely to be more precise than what userspace can offer.

Tstamp type framing requires a kernel >= 5.14 and a buffer size that is a multiple of
sizeof(snd_rawmidi_framing_tstamp_t). It is only available on input streams.

Signed-off-by: David Henningsson <coding@diwic.se>
---
 include/rawmidi.h           | 26 ++++++++++++
 include/sound/uapi/asound.h | 30 +++++++++++++-
 src/rawmidi/rawmidi.c       | 83 +++++++++++++++++++++++++++++++++++++
 src/rawmidi/rawmidi_hw.c    |  2 +
 src/rawmidi/rawmidi_local.h |  2 +
 5 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/include/rawmidi.h b/include/rawmidi.h
index d88c932c..2f27cb78 100644
--- a/include/rawmidi.h
+++ b/include/rawmidi.h
@@ -79,6 +79,27 @@ typedef enum _snd_rawmidi_type {
 	SND_RAWMIDI_TYPE_VIRTUAL
 } snd_rawmidi_type_t;
 
+#define SND_RAWMIDI_CLOCK_NONE		(0<<3)
+#define SND_RAWMIDI_CLOCK_REALTIME	(1<<3)
+#define SND_RAWMIDI_CLOCK_MONOTONIC	(2<<3)
+#define SND_RAWMIDI_CLOCK_MONOTONIC_RAW	(3<<3)
+
+#define SND_RAWMIDI_FRAMING_DATA_LENGTH 16
+
+/** Incoming RawMidi bytes is put inside this container if tstamp type framing is enabled. */
+typedef struct _snd_rawmidi_framing_tstamp {
+	/**
+	 * For now, frame_type is always 0. Midi 2.0 is expected to add new
+	 * types here. Applications are expected to skip unknown frame types.
+	 */
+	__u8 frame_type;
+	__u8 length; /* number of valid bytes in data field */
+	__u8 reserved[2];
+	__u32 tv_nsec;		/* nanoseconds */
+	__u64 tv_sec;		/* seconds */
+	__u8 data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
+} snd_rawmidi_framing_tstamp_t;
+
 int snd_rawmidi_open(snd_rawmidi_t **in_rmidi, snd_rawmidi_t **out_rmidi,
 		     const char *name, int mode);
 int snd_rawmidi_open_lconf(snd_rawmidi_t **in_rmidi, snd_rawmidi_t **out_rmidi,
@@ -126,6 +147,11 @@ int snd_rawmidi_params_set_avail_min(snd_rawmidi_t *rmidi, snd_rawmidi_params_t
 size_t snd_rawmidi_params_get_avail_min(const snd_rawmidi_params_t *params);
 int snd_rawmidi_params_set_no_active_sensing(snd_rawmidi_t *rmidi, snd_rawmidi_params_t *params, int val);
 int snd_rawmidi_params_get_no_active_sensing(const snd_rawmidi_params_t *params);
+int snd_rawmidi_params_set_framing_type(const snd_rawmidi_t *rawmidi, snd_rawmidi_params_t *params, unsigned int val);
+int snd_rawmidi_params_get_framing_type(const snd_rawmidi_params_t *params);
+int snd_rawmidi_params_set_clock_type(const snd_rawmidi_t *rawmidi, snd_rawmidi_params_t *params, unsigned int val);
+int snd_rawmidi_params_get_clock_type(const snd_rawmidi_params_t *params);
+
 int snd_rawmidi_params(snd_rawmidi_t *rmidi, snd_rawmidi_params_t * params);
 int snd_rawmidi_params_current(snd_rawmidi_t *rmidi, snd_rawmidi_params_t *params);
 size_t snd_rawmidi_status_sizeof(void);
diff --git a/include/sound/uapi/asound.h b/include/sound/uapi/asound.h
index ec610c27..9fe3943f 100644
--- a/include/sound/uapi/asound.h
+++ b/include/sound/uapi/asound.h
@@ -702,7 +702,7 @@ enum {
  *  Raw MIDI section - /dev/snd/midi??
  */
 
-#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 1)
+#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 2)
 
 enum {
 	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
@@ -728,12 +728,38 @@ struct snd_rawmidi_info {
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
+	__u8 frame_type;
+	__u8 length; /* number of valid bytes in data field */
+	__u8 reserved[2];
+	__u32 tv_nsec;		/* nanoseconds */
+	__u64 tv_sec;		/* seconds */
+	__u8 data[SNDRV_RAWMIDI_FRAMING_DATA_LENGTH];
+} __packed;
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
 
 struct snd_rawmidi_status {
diff --git a/src/rawmidi/rawmidi.c b/src/rawmidi/rawmidi.c
index 55f44821..8ca7a8ac 100644
--- a/src/rawmidi/rawmidi.c
+++ b/src/rawmidi/rawmidi.c
@@ -118,6 +118,15 @@ hw:soundwave,1,2
 hw:DEV=1,CARD=soundwave,SUBDEV=2
 \endcode
 
+\section rawmidi_framing Framing of rawmidi data
+
+Optionally, incoming rawmidi bytes can be put inside a frame of type snd_rawmidi_framing_tstamp_t.
+The main current benefit is that can enable in-kernel timestamping of incoming bytes, and that
+timestamp is likely to be more precise than what userspace can offer.
+
+Tstamp type framing requires a kernel >= 5.14 and a buffer size that is a multiple of
+sizeof(snd_rawmidi_framing_tstamp_t). It is only available on input streams.
+
 \section rawmidi_examples Examples
 
 The full featured examples with cross-links:
@@ -154,6 +163,7 @@ static int snd_rawmidi_params_default(snd_rawmidi_t *rawmidi, snd_rawmidi_params
 	params->buffer_size = page_size();
 	params->avail_min = 1;
 	params->no_active_sensing = 1;
+	params->mode = 0;
 	return 0;
 }
 
@@ -811,6 +821,77 @@ int snd_rawmidi_params_get_no_active_sensing(const snd_rawmidi_params_t *params)
 	return params->no_active_sensing;
 }
 
+/**
+ * \brief enable or disable rawmidi framing
+ * \param rawmidi RawMidi handle
+ * \param params pointer to snd_rawmidi_params_t structure
+ * \param val (0 = no framing, 1 = tstamp type framing)
+ * \return 0 on success, otherwise a negative error code.
+ *
+ * Notable error codes:
+ * -EINVAL - "val" is invalid
+ * -ENOTSUP - Kernel is too old to support framing.
+ *
+ */
+int snd_rawmidi_params_set_framing_type(const snd_rawmidi_t *rawmidi, snd_rawmidi_params_t *params, unsigned int val)
+{
+	assert(rawmidi && params);
+	if (val > SNDRV_RAWMIDI_MODE_FRAMING_MASK >> SNDRV_RAWMIDI_MODE_FRAMING_SHIFT)
+		return -EINVAL;
+	if (val != SNDRV_RAWMIDI_MODE_FRAMING_NONE &&
+		(rawmidi->version < SNDRV_PROTOCOL_VERSION(2, 0, 2) || rawmidi->stream != SND_RAWMIDI_STREAM_INPUT))
+		return -ENOTSUP;
+	params->mode = (params->mode & ~SNDRV_RAWMIDI_MODE_FRAMING_MASK) + (val << SNDRV_RAWMIDI_MODE_FRAMING_SHIFT);
+	return 0;
+}
+
+/**
+ * \brief get current framing type
+ * \param params pointer to snd_rawmidi_params_t structure
+ * \return the current type (0 = no framing, 1 = tstamp type framing)
+ */
+int snd_rawmidi_params_get_framing_type(const snd_rawmidi_params_t *params)
+{
+	assert(params);
+	return (params->mode & SNDRV_RAWMIDI_MODE_FRAMING_MASK) >> SNDRV_RAWMIDI_MODE_FRAMING_SHIFT;
+}
+
+/**
+ * \brief sets clock type for tstamp type framing
+ * \param rawmidi RawMidi handle
+ * \param params pointer to snd_rawmidi_params_t structure
+ * \param val one of the SND_RAWMIDI_CLOCK_* constants
+ * \return 0 on success, otherwise a negative error code.
+ *
+ * Notable error codes:
+ * -EINVAL - "val" is invalid
+ * -ENOTSUP - Kernel is too old to support framing.
+ *
+ */
+int snd_rawmidi_params_set_clock_type(const snd_rawmidi_t *rawmidi, snd_rawmidi_params_t *params, unsigned int val)
+{
+	assert(rawmidi && params);
+	if (val > SNDRV_RAWMIDI_MODE_CLOCK_MASK >> SNDRV_RAWMIDI_MODE_CLOCK_SHIFT)
+		return -EINVAL;
+	if (val != SNDRV_RAWMIDI_MODE_CLOCK_NONE &&
+		(rawmidi->version < SNDRV_PROTOCOL_VERSION(2, 0, 2) || rawmidi->stream != SND_RAWMIDI_STREAM_INPUT))
+		return -ENOTSUP;
+	params->mode = (params->mode & ~SNDRV_RAWMIDI_MODE_CLOCK_MASK) + (val << SNDRV_RAWMIDI_MODE_CLOCK_SHIFT);
+	return 0;
+}
+
+/**
+ * \brief get current clock type (for tstamp type framing)
+ * \param params pointer to snd_rawmidi_params_t structure
+ * \return the current clock type (one of the SND_RAWMIDI_CLOCK_* constants)
+ */
+int snd_rawmidi_params_get_clock_type(const snd_rawmidi_params_t *params)
+{
+	assert(params);
+	return (params->mode & SNDRV_RAWMIDI_MODE_CLOCK_MASK) >> SNDRV_RAWMIDI_MODE_CLOCK_SHIFT;
+}
+
+
 /**
  * \brief set parameters about rawmidi stream
  * \param rawmidi RawMidi handle
@@ -828,6 +909,7 @@ int snd_rawmidi_params(snd_rawmidi_t *rawmidi, snd_rawmidi_params_t * params)
 	rawmidi->buffer_size = params->buffer_size;
 	rawmidi->avail_min = params->avail_min;
 	rawmidi->no_active_sensing = params->no_active_sensing;
+	rawmidi->params_mode = rawmidi->version < SNDRV_PROTOCOL_VERSION(2, 0, 2) ? 0 : params->mode;
 	return 0;
 }
 
@@ -844,6 +926,7 @@ int snd_rawmidi_params_current(snd_rawmidi_t *rawmidi, snd_rawmidi_params_t *par
 	params->buffer_size = rawmidi->buffer_size;
 	params->avail_min = rawmidi->avail_min;
 	params->no_active_sensing = rawmidi->no_active_sensing;
+	params->mode = rawmidi->params_mode;
 	return 0;
 }
 
diff --git a/src/rawmidi/rawmidi_hw.c b/src/rawmidi/rawmidi_hw.c
index 99927d75..6bfbc1f3 100644
--- a/src/rawmidi/rawmidi_hw.c
+++ b/src/rawmidi/rawmidi_hw.c
@@ -285,6 +285,7 @@ int snd_rawmidi_hw_open(snd_rawmidi_t **inputp, snd_rawmidi_t **outputp,
 		rmidi->poll_fd = fd;
 		rmidi->ops = &snd_rawmidi_hw_ops;
 		rmidi->private_data = hw;
+		rmidi->version = ver;
 		hw->open++;
 		*inputp = rmidi;
 	}
@@ -300,6 +301,7 @@ int snd_rawmidi_hw_open(snd_rawmidi_t **inputp, snd_rawmidi_t **outputp,
 		rmidi->poll_fd = fd;
 		rmidi->ops = &snd_rawmidi_hw_ops;
 		rmidi->private_data = hw;
+		rmidi->version = ver;
 		hw->open++;
 		*outputp = rmidi;
 	}
diff --git a/src/rawmidi/rawmidi_local.h b/src/rawmidi/rawmidi_local.h
index 721e1ec9..c4068d7c 100644
--- a/src/rawmidi/rawmidi_local.h
+++ b/src/rawmidi/rawmidi_local.h
@@ -42,12 +42,14 @@ struct _snd_rawmidi {
 	snd_rawmidi_type_t type;
 	snd_rawmidi_stream_t stream;
 	int mode;
+	int version;
 	int poll_fd;
 	const snd_rawmidi_ops_t *ops;
 	void *private_data;
 	size_t buffer_size;
 	size_t avail_min;
 	unsigned int no_active_sensing: 1;
+	int params_mode;
 };
 
 int snd_rawmidi_hw_open(snd_rawmidi_t **input, snd_rawmidi_t **output,
-- 
2.25.1


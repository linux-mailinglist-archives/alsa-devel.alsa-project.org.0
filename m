Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3BB5EA7BB
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 15:57:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC08F3;
	Mon, 26 Sep 2022 15:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC08F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200655;
	bh=3NTSmd6jrCWQ+fs662p5TJdshf39NBwRYVu4ZE/tBSU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g42Tj3isDIf96Wml7Ki5py9udlx+s3DLI9+t1XPVIdeuKSdPbEJKaj0TcHsIjc99R
	 Tndr2vZpgmcB5vgpzMIvLmw0X+Pdd5DagcBSIXKlztBsDbuB3lpRw12cX3mn//qpW6
	 a/y2oncBp4dALMbu3XFWjsGAF4QRi1wEn12lbNSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E91C5F80542;
	Mon, 26 Sep 2022 15:56:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37E13F8053C; Mon, 26 Sep 2022 15:56:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E7C9F802BE
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E7C9F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="WXxCRUeB"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="PR81Yd0C"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5288B21DD9;
 Mon, 26 Sep 2022 13:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGQC8h5yshF7ZLT/Sqvwr8AaHQXV5n31G1m7+ZEVGyA=;
 b=WXxCRUeBCktl43WL84veYLYYPsnbqf+dbadN14rY5Uf8xOUrVkjVHPr4nF4JAnZFP4+mq0
 MPb41W3TQrAwOsxWTWkHgu9Mi/EMcHJVzY4XQd41m7HPUOnMDFk0PSUwI0Sn/ll+dVAlod
 afjpj4Lk4np9aED8+0X3Wv0U9h84JLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200569;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGQC8h5yshF7ZLT/Sqvwr8AaHQXV5n31G1m7+ZEVGyA=;
 b=PR81Yd0CGgkBdEFkZAORa+yO5LIu1Nqqh7XzFwrUthjLrR1czsv9mXBs6fUJVH3UVhRvsa
 7IrmnQJNfjdm3cAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29838139BD;
 Mon, 26 Sep 2022 13:56:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2PlWCXmvMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/11] ALSA: pcm: Avoid reference to status->state
Date: Mon, 26 Sep 2022 15:55:48 +0200
Message-Id: <20220926135558.26580-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

In the PCM core and driver code, there are lots place referring to the
current PCM state via runtime->status->state.  This patch introduced a
local PCM state in runtime itself and replaces those references with
runtime->state.  It has improvements in two aspects:

- The reduction of a indirect access leads to more code optimization

- It avoids a possible (unexpected) modification of the state via mmap
  of the status record

The status->state is updated together with runtime->state, so that
user-space can still read the current state via mmap like before,
too.

This patch touches only the ALSA core code.  The changes in each
driver will follow in later patches.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h      |  20 +++++-
 sound/core/oss/pcm_oss.c |  42 ++++++-------
 sound/core/pcm.c         |   9 +--
 sound/core/pcm_compat.c  |   4 +-
 sound/core/pcm_lib.c     |  16 ++---
 sound/core/pcm_native.c  | 127 ++++++++++++++++++++-------------------
 6 files changed, 118 insertions(+), 100 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 8c48a5bce88c..7b1a022910e8 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -346,6 +346,8 @@ static inline void snd_pcm_pack_audio_tstamp_report(__u32 *data, __u32 *accuracy
 
 struct snd_pcm_runtime {
 	/* -- Status -- */
+	snd_pcm_state_t state;		/* stream state */
+	snd_pcm_state_t suspended_state; /* suspended stream state */
 	struct snd_pcm_substream *trigger_master;
 	struct timespec64 trigger_tstamp;	/* trigger timestamp */
 	bool trigger_tstamp_latched;     /* trigger timestamp latched in low-level driver/hardware */
@@ -678,11 +680,25 @@ void snd_pcm_stream_unlock_irqrestore(struct snd_pcm_substream *substream,
  */
 static inline int snd_pcm_running(struct snd_pcm_substream *substream)
 {
-	return (substream->runtime->status->state == SNDRV_PCM_STATE_RUNNING ||
-		(substream->runtime->status->state == SNDRV_PCM_STATE_DRAINING &&
+	return (substream->runtime->state == SNDRV_PCM_STATE_RUNNING ||
+		(substream->runtime->state == SNDRV_PCM_STATE_DRAINING &&
 		 substream->stream == SNDRV_PCM_STREAM_PLAYBACK));
 }
 
+/**
+ * __snd_pcm_set_state - Change the current PCM state
+ * @runtime: PCM runtime to set
+ * @state: the current state to set
+ *
+ * Call within the stream lock
+ */
+static inline void __snd_pcm_set_state(struct snd_pcm_runtime *runtime,
+				       snd_pcm_state_t state)
+{
+	runtime->state = state;
+	runtime->status->state = state; /* copy for mmap */
+}
+
 /**
  * bytes_to_samples - Unit conversion of the size from bytes to samples
  * @runtime: PCM runtime instance
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 02df915eb3c6..ac2efeb63a39 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1237,12 +1237,12 @@ snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream, const
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 	while (1) {
-		if (runtime->status->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->status->state == SNDRV_PCM_STATE_SUSPENDED) {
+		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
+		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: write: recovering from %s\n",
-				runtime->status->state == SNDRV_PCM_STATE_XRUN ?
+				runtime->state == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_oss_prepare(substream);
@@ -1257,7 +1257,7 @@ snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream, const
 			break;
 		/* test, if we can't store new data, because the stream */
 		/* has not been started */
-		if (runtime->status->state == SNDRV_PCM_STATE_PREPARED)
+		if (runtime->state == SNDRV_PCM_STATE_PREPARED)
 			return -EAGAIN;
 	}
 	return ret;
@@ -1269,18 +1269,18 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
 	snd_pcm_sframes_t delay;
 	int ret;
 	while (1) {
-		if (runtime->status->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->status->state == SNDRV_PCM_STATE_SUSPENDED) {
+		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
+		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: read: recovering from %s\n",
-				runtime->status->state == SNDRV_PCM_STATE_XRUN ?
+				runtime->state == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DRAIN, NULL);
 			if (ret < 0)
 				break;
-		} else if (runtime->status->state == SNDRV_PCM_STATE_SETUP) {
+		} else if (runtime->state == SNDRV_PCM_STATE_SETUP) {
 			ret = snd_pcm_oss_prepare(substream);
 			if (ret < 0)
 				break;
@@ -1293,7 +1293,7 @@ snd_pcm_sframes_t snd_pcm_oss_read3(struct snd_pcm_substream *substream, char *p
 					 frames, in_kernel);
 		mutex_lock(&runtime->oss.params_lock);
 		if (ret == -EPIPE) {
-			if (runtime->status->state == SNDRV_PCM_STATE_DRAINING) {
+			if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
 				ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DROP, NULL);
 				if (ret < 0)
 					break;
@@ -1312,12 +1312,12 @@ snd_pcm_sframes_t snd_pcm_oss_writev3(struct snd_pcm_substream *substream, void
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 	while (1) {
-		if (runtime->status->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->status->state == SNDRV_PCM_STATE_SUSPENDED) {
+		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
+		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: writev: recovering from %s\n",
-				runtime->status->state == SNDRV_PCM_STATE_XRUN ?
+				runtime->state == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_oss_prepare(substream);
@@ -1330,7 +1330,7 @@ snd_pcm_sframes_t snd_pcm_oss_writev3(struct snd_pcm_substream *substream, void
 
 		/* test, if we can't store new data, because the stream */
 		/* has not been started */
-		if (runtime->status->state == SNDRV_PCM_STATE_PREPARED)
+		if (runtime->state == SNDRV_PCM_STATE_PREPARED)
 			return -EAGAIN;
 	}
 	return ret;
@@ -1341,18 +1341,18 @@ snd_pcm_sframes_t snd_pcm_oss_readv3(struct snd_pcm_substream *substream, void *
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 	while (1) {
-		if (runtime->status->state == SNDRV_PCM_STATE_XRUN ||
-		    runtime->status->state == SNDRV_PCM_STATE_SUSPENDED) {
+		if (runtime->state == SNDRV_PCM_STATE_XRUN ||
+		    runtime->state == SNDRV_PCM_STATE_SUSPENDED) {
 #ifdef OSS_DEBUG
 			pcm_dbg(substream->pcm,
 				"pcm_oss: readv: recovering from %s\n",
-				runtime->status->state == SNDRV_PCM_STATE_XRUN ?
+				runtime->state == SNDRV_PCM_STATE_XRUN ?
 				"XRUN" : "SUSPEND");
 #endif
 			ret = snd_pcm_kernel_ioctl(substream, SNDRV_PCM_IOCTL_DRAIN, NULL);
 			if (ret < 0)
 				break;
-		} else if (runtime->status->state == SNDRV_PCM_STATE_SETUP) {
+		} else if (runtime->state == SNDRV_PCM_STATE_SETUP) {
 			ret = snd_pcm_oss_prepare(substream);
 			if (ret < 0)
 				break;
@@ -1635,7 +1635,7 @@ static int snd_pcm_oss_sync1(struct snd_pcm_substream *substream, size_t size)
 		result = 0;
 		set_current_state(TASK_INTERRUPTIBLE);
 		snd_pcm_stream_lock_irq(substream);
-		state = runtime->status->state;
+		state = runtime->state;
 		snd_pcm_stream_unlock_irq(substream);
 		if (state != SNDRV_PCM_STATE_RUNNING) {
 			set_current_state(TASK_RUNNING);
@@ -2854,8 +2854,8 @@ static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
 		struct snd_pcm_runtime *runtime = psubstream->runtime;
 		poll_wait(file, &runtime->sleep, wait);
 		snd_pcm_stream_lock_irq(psubstream);
-		if (runtime->status->state != SNDRV_PCM_STATE_DRAINING &&
-		    (runtime->status->state != SNDRV_PCM_STATE_RUNNING ||
+		if (runtime->state != SNDRV_PCM_STATE_DRAINING &&
+		    (runtime->state != SNDRV_PCM_STATE_RUNNING ||
 		     snd_pcm_oss_playback_ready(psubstream)))
 			mask |= EPOLLOUT | EPOLLWRNORM;
 		snd_pcm_stream_unlock_irq(psubstream);
@@ -2865,7 +2865,7 @@ static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
 		snd_pcm_state_t ostate;
 		poll_wait(file, &runtime->sleep, wait);
 		snd_pcm_stream_lock_irq(csubstream);
-		ostate = runtime->status->state;
+		ostate = runtime->state;
 		if (ostate != SNDRV_PCM_STATE_RUNNING ||
 		    snd_pcm_oss_capture_ready(csubstream))
 			mask |= EPOLLIN | EPOLLRDNORM;
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 82925709fa12..9d95e3731123 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -387,7 +387,7 @@ static void snd_pcm_substream_proc_hw_params_read(struct snd_info_entry *entry,
 		snd_iprintf(buffer, "closed\n");
 		goto unlock;
 	}
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (runtime->state == SNDRV_PCM_STATE_OPEN) {
 		snd_iprintf(buffer, "no setup\n");
 		goto unlock;
 	}
@@ -424,7 +424,7 @@ static void snd_pcm_substream_proc_sw_params_read(struct snd_info_entry *entry,
 		snd_iprintf(buffer, "closed\n");
 		goto unlock;
 	}
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (runtime->state == SNDRV_PCM_STATE_OPEN) {
 		snd_iprintf(buffer, "no setup\n");
 		goto unlock;
 	}
@@ -970,7 +970,7 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 	init_waitqueue_head(&runtime->sleep);
 	init_waitqueue_head(&runtime->tsleep);
 
-	runtime->status->state = SNDRV_PCM_STATE_OPEN;
+	__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_OPEN);
 	mutex_init(&runtime->buffer_mutex);
 	atomic_set(&runtime->buffer_accessing, 0);
 
@@ -1112,7 +1112,8 @@ static int snd_pcm_dev_disconnect(struct snd_device *device)
 			if (snd_pcm_running(substream))
 				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
 			/* to be sure, set the state unconditionally */
-			substream->runtime->status->state = SNDRV_PCM_STATE_DISCONNECTED;
+			__snd_pcm_set_state(substream->runtime,
+					    SNDRV_PCM_STATE_DISCONNECTED);
 			wake_up(&substream->runtime->sleep);
 			wake_up(&substream->runtime->tsleep);
 		}
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 917c5b4f19d7..42c2ada8e888 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -295,7 +295,7 @@ static int snd_pcm_ioctl_xferi_compat(struct snd_pcm_substream *substream,
 		return -ENOTTY;
 	if (substream->stream != dir)
 		return -EINVAL;
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
 	if (get_user(buf, &data32->buf) ||
@@ -341,7 +341,7 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_substream *substream,
 		return -ENOTTY;
 	if (substream->stream != dir)
 		return -EINVAL;
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
 	ch = substream->runtime->channels;
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 40751e5aff09..8b6aeb8a78f7 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -186,7 +186,7 @@ int snd_pcm_update_state(struct snd_pcm_substream *substream,
 	avail = snd_pcm_avail(substream);
 	if (avail > runtime->avail_max)
 		runtime->avail_max = avail;
-	if (runtime->status->state == SNDRV_PCM_STATE_DRAINING) {
+	if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
 		if (avail >= runtime->buffer_size) {
 			snd_pcm_drain_done(substream);
 			return -EPIPE;
@@ -1911,7 +1911,7 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 
 		snd_pcm_stream_lock_irq(substream);
 		set_current_state(TASK_INTERRUPTIBLE);
-		switch (runtime->status->state) {
+		switch (runtime->state) {
 		case SNDRV_PCM_STATE_SUSPENDED:
 			err = -ESTRPIPE;
 			goto _endloop;
@@ -2099,14 +2099,14 @@ static int pcm_sanity_check(struct snd_pcm_substream *substream)
 	runtime = substream->runtime;
 	if (snd_BUG_ON(!substream->ops->copy_user && !runtime->dma_area))
 		return -EINVAL;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	return 0;
 }
 
 static int pcm_accessible_state(struct snd_pcm_runtime *runtime)
 {
-	switch (runtime->status->state) {
+	switch (runtime->state) {
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_PAUSED:
@@ -2225,7 +2225,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		goto _end_unlock;
 
 	runtime->twake = runtime->control->avail_min ? : 1;
-	if (runtime->status->state == SNDRV_PCM_STATE_RUNNING)
+	if (runtime->state == SNDRV_PCM_STATE_RUNNING)
 		snd_pcm_update_hw_ptr(substream);
 
 	/*
@@ -2233,7 +2233,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 	 * thread may start capture
 	 */
 	if (!is_playback &&
-	    runtime->status->state == SNDRV_PCM_STATE_PREPARED &&
+	    runtime->state == SNDRV_PCM_STATE_PREPARED &&
 	    size >= runtime->start_threshold) {
 		err = snd_pcm_start(substream);
 		if (err < 0)
@@ -2247,7 +2247,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		snd_pcm_uframes_t cont;
 		if (!avail) {
 			if (!is_playback &&
-			    runtime->status->state == SNDRV_PCM_STATE_DRAINING) {
+			    runtime->state == SNDRV_PCM_STATE_DRAINING) {
 				snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
 				goto _end_unlock;
 			}
@@ -2303,7 +2303,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		xfer += frames;
 		avail -= frames;
 		if (is_playback &&
-		    runtime->status->state == SNDRV_PCM_STATE_PREPARED &&
+		    runtime->state == SNDRV_PCM_STATE_PREPARED &&
 		    snd_pcm_playback_hw_avail(runtime) >= (snd_pcm_sframes_t)runtime->start_threshold) {
 			err = snd_pcm_start(substream);
 			if (err < 0)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index ad0541e9e888..d9485b1ab719 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -595,8 +595,8 @@ static void snd_pcm_set_state(struct snd_pcm_substream *substream,
 			      snd_pcm_state_t state)
 {
 	snd_pcm_stream_lock_irq(substream);
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_DISCONNECTED)
-		substream->runtime->status->state = state;
+	if (substream->runtime->state != SNDRV_PCM_STATE_DISCONNECTED)
+		__snd_pcm_set_state(substream->runtime, state);
 	snd_pcm_stream_unlock_irq(substream);
 }
 
@@ -724,7 +724,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (err < 0)
 		return err;
 	snd_pcm_stream_lock_irq(substream);
-	switch (runtime->status->state) {
+	switch (runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
@@ -889,7 +889,7 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 	if (result < 0)
 		return result;
 	snd_pcm_stream_lock_irq(substream);
-	switch (runtime->status->state) {
+	switch (runtime->state) {
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
 		if (atomic_read(&substream->mmap_count))
@@ -920,7 +920,7 @@ static int snd_pcm_sw_params(struct snd_pcm_substream *substream,
 		return -ENXIO;
 	runtime = substream->runtime;
 	snd_pcm_stream_lock_irq(substream);
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (runtime->state == SNDRV_PCM_STATE_OPEN) {
 		snd_pcm_stream_unlock_irq(substream);
 		return -EBADFD;
 	}
@@ -1013,8 +1013,8 @@ int snd_pcm_status64(struct snd_pcm_substream *substream,
 	} else
 		runtime->audio_tstamp_report.valid = 1;
 
-	status->state = runtime->status->state;
-	status->suspended_state = runtime->status->suspended_state;
+	status->state = runtime->state;
+	status->suspended_state = runtime->suspended_state;
 	if (status->state == SNDRV_PCM_STATE_OPEN)
 		goto _end;
 	status->trigger_tstamp_sec = runtime->trigger_tstamp.tv_sec;
@@ -1148,7 +1148,7 @@ static int snd_pcm_channel_info(struct snd_pcm_substream *substream,
 	channel = info->channel;
 	runtime = substream->runtime;
 	snd_pcm_stream_lock_irq(substream);
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN) {
+	if (runtime->state == SNDRV_PCM_STATE_OPEN) {
 		snd_pcm_stream_unlock_irq(substream);
 		return -EBADFD;
 	}
@@ -1411,7 +1411,7 @@ static int snd_pcm_pre_start(struct snd_pcm_substream *substream,
 			     snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	if (runtime->status->state != SNDRV_PCM_STATE_PREPARED)
+	if (runtime->state != SNDRV_PCM_STATE_PREPARED)
 		return -EBADFD;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    !snd_pcm_playback_data(substream))
@@ -1444,7 +1444,7 @@ static void snd_pcm_post_start(struct snd_pcm_substream *substream,
 	runtime->hw_ptr_jiffies = jiffies;
 	runtime->hw_ptr_buffer_jiffies = (runtime->buffer_size * HZ) / 
 							    runtime->rate;
-	runtime->status->state = state;
+	__snd_pcm_set_state(runtime, state);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    runtime->silence_size > 0)
 		snd_pcm_playback_silence(substream, ULONG_MAX);
@@ -1485,7 +1485,7 @@ static int snd_pcm_pre_stop(struct snd_pcm_substream *substream,
 			    snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	runtime->trigger_master = substream;
 	return 0;
@@ -1506,9 +1506,9 @@ static void snd_pcm_post_stop(struct snd_pcm_substream *substream,
 			      snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	if (runtime->status->state != state) {
+	if (runtime->state != state) {
 		snd_pcm_trigger_tstamp(substream);
-		runtime->status->state = state;
+		__snd_pcm_set_state(runtime, state);
 		snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTOP);
 	}
 	wake_up(&runtime->sleep);
@@ -1584,9 +1584,9 @@ static int snd_pcm_pre_pause(struct snd_pcm_substream *substream,
 	if (!(runtime->info & SNDRV_PCM_INFO_PAUSE))
 		return -ENOSYS;
 	if (pause_pushed(state)) {
-		if (runtime->status->state != SNDRV_PCM_STATE_RUNNING)
+		if (runtime->state != SNDRV_PCM_STATE_RUNNING)
 			return -EBADFD;
-	} else if (runtime->status->state != SNDRV_PCM_STATE_PAUSED)
+	} else if (runtime->state != SNDRV_PCM_STATE_PAUSED)
 		return -EBADFD;
 	runtime->trigger_master = substream;
 	return 0;
@@ -1628,12 +1628,12 @@ static void snd_pcm_post_pause(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_trigger_tstamp(substream);
 	if (pause_pushed(state)) {
-		runtime->status->state = SNDRV_PCM_STATE_PAUSED;
+		__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_PAUSED);
 		snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MPAUSE);
 		wake_up(&runtime->sleep);
 		wake_up(&runtime->tsleep);
 	} else {
-		runtime->status->state = SNDRV_PCM_STATE_RUNNING;
+		__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_RUNNING);
 		snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MCONTINUE);
 	}
 }
@@ -1668,7 +1668,7 @@ static int snd_pcm_pre_suspend(struct snd_pcm_substream *substream,
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	switch (runtime->status->state) {
+	switch (runtime->state) {
 	case SNDRV_PCM_STATE_SUSPENDED:
 		return -EBUSY;
 	/* unresumable PCM state; return -EBUSY for skipping suspend */
@@ -1699,8 +1699,9 @@ static void snd_pcm_post_suspend(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_trigger_tstamp(substream);
-	runtime->status->suspended_state = runtime->status->state;
-	runtime->status->state = SNDRV_PCM_STATE_SUSPENDED;
+	runtime->suspended_state = runtime->state;
+	runtime->status->suspended_state = runtime->suspended_state;
+	__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_SUSPENDED);
 	snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSUSPEND);
 	wake_up(&runtime->sleep);
 	wake_up(&runtime->tsleep);
@@ -1791,8 +1792,8 @@ static int snd_pcm_do_resume(struct snd_pcm_substream *substream,
 	if (runtime->trigger_master != substream)
 		return 0;
 	/* DMA not running previously? */
-	if (runtime->status->suspended_state != SNDRV_PCM_STATE_RUNNING &&
-	    (runtime->status->suspended_state != SNDRV_PCM_STATE_DRAINING ||
+	if (runtime->suspended_state != SNDRV_PCM_STATE_RUNNING &&
+	    (runtime->suspended_state != SNDRV_PCM_STATE_DRAINING ||
 	     substream->stream != SNDRV_PCM_STREAM_PLAYBACK))
 		return 0;
 	return substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_RESUME);
@@ -1811,7 +1812,7 @@ static void snd_pcm_post_resume(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_trigger_tstamp(substream);
-	runtime->status->state = runtime->status->suspended_state;
+	__snd_pcm_set_state(runtime, runtime->suspended_state);
 	snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MRESUME);
 }
 
@@ -1848,7 +1849,7 @@ static int snd_pcm_xrun(struct snd_pcm_substream *substream)
 	int result;
 
 	snd_pcm_stream_lock_irq(substream);
-	switch (runtime->status->state) {
+	switch (runtime->state) {
 	case SNDRV_PCM_STATE_XRUN:
 		result = 0;	/* already there */
 		break;
@@ -1871,7 +1872,7 @@ static int snd_pcm_pre_reset(struct snd_pcm_substream *substream,
 			     snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	switch (runtime->status->state) {
+	switch (runtime->state) {
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_PAUSED:
@@ -1933,8 +1934,8 @@ static int snd_pcm_pre_prepare(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int f_flags = (__force int)state;
 
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	if (snd_pcm_running(substream))
 		return -EBUSY;
@@ -1985,7 +1986,7 @@ static int snd_pcm_prepare(struct snd_pcm_substream *substream,
 		f_flags = substream->f_flags;
 
 	snd_pcm_stream_lock_irq(substream);
-	switch (substream->runtime->status->state) {
+	switch (substream->runtime->state) {
 	case SNDRV_PCM_STATE_PAUSED:
 		snd_pcm_pause(substream, false);
 		fallthrough;
@@ -2009,7 +2010,7 @@ static int snd_pcm_pre_drain_init(struct snd_pcm_substream *substream,
 				  snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	switch (runtime->status->state) {
+	switch (runtime->state) {
 	case SNDRV_PCM_STATE_OPEN:
 	case SNDRV_PCM_STATE_DISCONNECTED:
 	case SNDRV_PCM_STATE_SUSPENDED:
@@ -2024,28 +2025,28 @@ static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		switch (runtime->status->state) {
+		switch (runtime->state) {
 		case SNDRV_PCM_STATE_PREPARED:
 			/* start playback stream if possible */
 			if (! snd_pcm_playback_empty(substream)) {
 				snd_pcm_do_start(substream, SNDRV_PCM_STATE_DRAINING);
 				snd_pcm_post_start(substream, SNDRV_PCM_STATE_DRAINING);
 			} else {
-				runtime->status->state = SNDRV_PCM_STATE_SETUP;
+				__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_SETUP);
 			}
 			break;
 		case SNDRV_PCM_STATE_RUNNING:
-			runtime->status->state = SNDRV_PCM_STATE_DRAINING;
+			__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_DRAINING);
 			break;
 		case SNDRV_PCM_STATE_XRUN:
-			runtime->status->state = SNDRV_PCM_STATE_SETUP;
+			__snd_pcm_set_state(runtime, SNDRV_PCM_STATE_SETUP);
 			break;
 		default:
 			break;
 		}
 	} else {
 		/* stop running stream */
-		if (runtime->status->state == SNDRV_PCM_STATE_RUNNING) {
+		if (runtime->state == SNDRV_PCM_STATE_RUNNING) {
 			snd_pcm_state_t new_state;
 
 			new_state = snd_pcm_capture_avail(runtime) > 0 ?
@@ -2055,7 +2056,7 @@ static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream,
 		}
 	}
 
-	if (runtime->status->state == SNDRV_PCM_STATE_DRAINING &&
+	if (runtime->state == SNDRV_PCM_STATE_DRAINING &&
 	    runtime->trigger_master == substream &&
 	    (runtime->hw.info & SNDRV_PCM_INFO_DRAIN_TRIGGER))
 		return substream->ops->trigger(substream,
@@ -2096,7 +2097,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 	card = substream->pcm->card;
 	runtime = substream->runtime;
 
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 
 	if (file) {
@@ -2107,7 +2108,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 
 	snd_pcm_stream_lock_irq(substream);
 	/* resume pause */
-	if (runtime->status->state == SNDRV_PCM_STATE_PAUSED)
+	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
 		snd_pcm_pause(substream, false);
 
 	/* pre-start/stop - all running streams are changed to DRAINING state */
@@ -2135,7 +2136,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 			if (s->stream != SNDRV_PCM_STREAM_PLAYBACK)
 				continue;
 			runtime = s->runtime;
-			if (runtime->status->state == SNDRV_PCM_STATE_DRAINING) {
+			if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
 				to_check = runtime;
 				break;
 			}
@@ -2174,7 +2175,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 			break;
 		}
 		if (tout == 0) {
-			if (substream->runtime->status->state == SNDRV_PCM_STATE_SUSPENDED)
+			if (substream->runtime->state == SNDRV_PCM_STATE_SUSPENDED)
 				result = -ESTRPIPE;
 			else {
 				dev_dbg(substream->pcm->card->dev,
@@ -2206,13 +2207,13 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
 		return -ENXIO;
 	runtime = substream->runtime;
 
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 
 	snd_pcm_stream_lock_irq(substream);
 	/* resume pause */
-	if (runtime->status->state == SNDRV_PCM_STATE_PAUSED)
+	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
 		snd_pcm_pause(substream, false);
 
 	snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
@@ -2275,8 +2276,8 @@ static int snd_pcm_link(struct snd_pcm_substream *substream, int fd)
 	snd_pcm_group_init(group);
 
 	down_write(&snd_pcm_link_rwsem);
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN ||
-	    substream->runtime->status->state != substream1->runtime->status->state ||
+	if (substream->runtime->state == SNDRV_PCM_STATE_OPEN ||
+	    substream->runtime->state != substream1->runtime->state ||
 	    substream->pcm->nonatomic != substream1->pcm->nonatomic) {
 		res = -EBADFD;
 		goto _end;
@@ -2700,7 +2701,7 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 
 	snd_pcm_drop(substream);
 	if (substream->hw_opened) {
-		if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
+		if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
 			do_hw_free(substream);
 		substream->ops->close(substream);
 		substream->hw_opened = 0;
@@ -2904,7 +2905,7 @@ static int snd_pcm_release(struct inode *inode, struct file *file)
  */
 static int do_pcm_hwsync(struct snd_pcm_substream *substream)
 {
-	switch (substream->runtime->status->state) {
+	switch (substream->runtime->state) {
 	case SNDRV_PCM_STATE_DRAINING:
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 			return -EBADFD;
@@ -3203,7 +3204,7 @@ static int snd_pcm_xferi_frames_ioctl(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_sframes_t result;
 
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	if (put_user(0, &_xferi->result))
 		return -EFAULT;
@@ -3226,7 +3227,7 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
 	void *bufs;
 	snd_pcm_sframes_t result;
 
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	if (runtime->channels > 128)
 		return -EINVAL;
@@ -3290,7 +3291,7 @@ static int snd_pcm_common_ioctl(struct file *file,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (substream->runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 
 	res = snd_power_wait(substream->pcm->card);
@@ -3421,7 +3422,7 @@ int snd_pcm_kernel_ioctl(struct snd_pcm_substream *substream,
 	snd_pcm_uframes_t *frames = arg;
 	snd_pcm_sframes_t result;
 	
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (substream->runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 
 	switch (cmd) {
@@ -3466,8 +3467,8 @@ static ssize_t snd_pcm_read(struct file *file, char __user *buf, size_t count,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	if (!frame_aligned(runtime, count))
 		return -EINVAL;
@@ -3491,8 +3492,8 @@ static ssize_t snd_pcm_write(struct file *file, const char __user *buf,
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	if (!frame_aligned(runtime, count))
 		return -EINVAL;
@@ -3518,8 +3519,8 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	if (!iter_is_iovec(to))
 		return -EINVAL;
@@ -3555,8 +3556,8 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN ||
-	    runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
+	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	if (!iter_is_iovec(from))
 		return -EINVAL;
@@ -3595,7 +3596,7 @@ static __poll_t snd_pcm_poll(struct file *file, poll_table *wait)
 		return ok | EPOLLERR;
 
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return ok | EPOLLERR;
 
 	poll_wait(file, &runtime->sleep, wait);
@@ -3603,7 +3604,7 @@ static __poll_t snd_pcm_poll(struct file *file, poll_table *wait)
 	mask = 0;
 	snd_pcm_stream_lock_irq(substream);
 	avail = snd_pcm_avail(substream);
-	switch (runtime->status->state) {
+	switch (runtime->state) {
 	case SNDRV_PCM_STATE_RUNNING:
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_PAUSED:
@@ -3874,7 +3875,7 @@ int snd_pcm_mmap_data(struct snd_pcm_substream *substream, struct file *file,
 			return -EINVAL;
 	}
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_OPEN)
+	if (runtime->state == SNDRV_PCM_STATE_OPEN)
 		return -EBADFD;
 	if (!(runtime->info & SNDRV_PCM_INFO_MMAP))
 		return -ENXIO;
@@ -3911,7 +3912,7 @@ static int snd_pcm_mmap(struct file *file, struct vm_area_struct *area)
 	substream = pcm_file->substream;
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (substream->runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 
 	offset = area->vm_pgoff << PAGE_SHIFT;
@@ -3949,7 +3950,7 @@ static int snd_pcm_fasync(int fd, struct file * file, int on)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	if (runtime->status->state == SNDRV_PCM_STATE_DISCONNECTED)
+	if (runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
 		return -EBADFD;
 	return snd_fasync_helper(fd, file, on, &runtime->fasync);
 }
-- 
2.35.3


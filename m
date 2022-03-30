Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0754EC306
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:10:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E67192E;
	Wed, 30 Mar 2022 14:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E67192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648642218;
	bh=jVv+w3Hnm3B6r1YQeq5Gn4GmfVW/3WByr1/VF/J1V3M=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uLDA9z98LtRt05trHxp67vOJk0kRmcALJcXHcVZ8d+evtuDfSyBqzERJ2QMeUy3QX
	 UcmB03sQIAx9z+aBq0H+M6oPUXrAAAACcn0j/wbxSavb8ZLlZihFziZvmNma0HpuCN
	 XTtO/nKIupze6PXdDjz70eU9RNl84e0oaHDIfdnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E7EBF800B8;
	Wed, 30 Mar 2022 14:09:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2554BF800B8; Wed, 30 Mar 2022 14:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44299F800B8
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 14:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44299F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="fOzw9CRt"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="nMMMjhi0"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C8EA61F37B
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 12:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648642144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZVchLPslAvw1XkXVEq1/6f05aY+8XKbAi3YAM5gm3Xw=;
 b=fOzw9CRtur2Lflru1Tf85QJBEX17SAEVuW9BcIvs/0TRW+YAY+eK5PbzEvY4vJeuv0NH9v
 WPI6xiEm3oh+FMQJ/MLPnJtzpQuEjucatpmY0e5jrlzAr+VVPWDHHtowp8ExthSut28k8T
 R1eN6UW0apd2XyqDpCf/VGcEmBZqnNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648642144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZVchLPslAvw1XkXVEq1/6f05aY+8XKbAi3YAM5gm3Xw=;
 b=nMMMjhi0MsHKSUD4N+0OEXVQS+3n86QnK7LewB8idTRjP5LIXIY/zst1pKfB66xmRRFt7R
 qqaM0+90Mmtv5ODQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C2849A3B92;
 Wed, 30 Mar 2022 12:09:04 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Fix potential AB/BA lock with buffer_mutex and
 mmap_lock
Date: Wed, 30 Mar 2022 14:09:03 +0200
Message-Id: <20220330120903.4738-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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

syzbot caught a potential deadlock between the PCM
runtime->buffer_mutex and the mm->mmap_lock.  It was brought by the
recent fix to cover the racy read/write and other ioctls, and in that
commit, I overlooked a (hopefully only) corner case that may take the
revert lock, namely, the OSS mmap.  The OSS mmap operation
exceptionally allows to re-configure the parameters inside the OSS
mmap syscall, where mm->mmap_mutex is already held.  Meanwhile, the
copy_from/to_user calls at read/write operations also take the
mm->mmap_lock internally, hence it may lead to a AB/BA deadlock.

A similar problem was already seen in the past and we fixed it with a
refcount (in commit b248371628aa).  The former fix covered only the
call paths with OSS read/write and OSS ioctls, while we need to cover
the concurrent access via both ALSA and OSS APIs now.

This patch addresses the problem above by replacing the buffer_mutex
lock in the read/write operations with a refcount similar as we've
used for OSS.  The new field, runtime->buffer_accessing, keeps the
number of concurrent read/write operations.  Unlike the former
buffer_mutex protection, this protects only around the
copy_from/to_user() calls; the other codes are basically protected by
the PCM stream lock.  The refcount can be a negative, meaning blocked
by the ioctls.  If a negative value is seen, the read/write aborts
with -EBUSY.  In the ioctl side, OTOH, they check this refcount, too,
and set to a negative value for blocking unless it's already being
accessed.

Reported-by: syzbot+6e5c88838328e99c7e1c@syzkaller.appspotmail.com
Fixes: dca947d4d26d ("ALSA: pcm: Fix races among concurrent read/write and buffer changes")
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/000000000000381a0d05db622a81@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     |  1 +
 sound/core/pcm.c        |  1 +
 sound/core/pcm_lib.c    |  9 +++++----
 sound/core/pcm_native.c | 39 ++++++++++++++++++++++++++++++++-------
 4 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 314f2779cab5..6b99310b5b88 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -402,6 +402,7 @@ struct snd_pcm_runtime {
 	struct fasync_struct *fasync;
 	bool stop_operating;		/* sync_stop will be called */
 	struct mutex buffer_mutex;	/* protect for buffer changes */
+	atomic_t buffer_accessing;	/* >0: in r/w operation, <0: blocked */
 
 	/* -- private section -- */
 	void *private_data;
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index edd9849210f2..977d54320a5c 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -970,6 +970,7 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 
 	runtime->status->state = SNDRV_PCM_STATE_OPEN;
 	mutex_init(&runtime->buffer_mutex);
+	atomic_set(&runtime->buffer_accessing, 0);
 
 	substream->runtime = runtime;
 	substream->private_data = pcm->private_data;
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index a40a35e51fad..1fc7c50ffa62 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1906,11 +1906,9 @@ static int wait_for_avail(struct snd_pcm_substream *substream,
 		if (avail >= runtime->twake)
 			break;
 		snd_pcm_stream_unlock_irq(substream);
-		mutex_unlock(&runtime->buffer_mutex);
 
 		tout = schedule_timeout(wait_time);
 
-		mutex_lock(&runtime->buffer_mutex);
 		snd_pcm_stream_lock_irq(substream);
 		set_current_state(TASK_INTERRUPTIBLE);
 		switch (runtime->status->state) {
@@ -2221,7 +2219,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 
 	nonblock = !!(substream->f_flags & O_NONBLOCK);
 
-	mutex_lock(&runtime->buffer_mutex);
 	snd_pcm_stream_lock_irq(substream);
 	err = pcm_accessible_state(runtime);
 	if (err < 0)
@@ -2276,6 +2273,10 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 			err = -EINVAL;
 			goto _end_unlock;
 		}
+		if (!atomic_inc_unless_negative(&runtime->buffer_accessing)) {
+			err = -EBUSY;
+			goto _end_unlock;
+		}
 		snd_pcm_stream_unlock_irq(substream);
 		if (!is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
@@ -2284,6 +2285,7 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 		if (is_playback)
 			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
 		snd_pcm_stream_lock_irq(substream);
+		atomic_dec(&runtime->buffer_accessing);
 		if (err < 0)
 			goto _end_unlock;
 		err = pcm_accessible_state(runtime);
@@ -2313,7 +2315,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 	if (xfer > 0 && err >= 0)
 		snd_pcm_update_state(substream, runtime);
 	snd_pcm_stream_unlock_irq(substream);
-	mutex_unlock(&runtime->buffer_mutex);
 	return xfer > 0 ? (snd_pcm_sframes_t)xfer : err;
 }
 EXPORT_SYMBOL(__snd_pcm_lib_xfer);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 704fdc9ebf91..4adaee62ef33 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -685,6 +685,24 @@ static int snd_pcm_hw_params_choose(struct snd_pcm_substream *pcm,
 	return 0;
 }
 
+/* acquire buffer_mutex; if it's in r/w operation, return -EBUSY, otherwise
+ * block the further r/w operations
+ */
+static int snd_pcm_buffer_access_lock(struct snd_pcm_runtime *runtime)
+{
+	if (!atomic_dec_unless_positive(&runtime->buffer_accessing))
+		return -EBUSY;
+	mutex_lock(&runtime->buffer_mutex);
+	return 0; /* keep buffer_mutex, unlocked by below */
+}
+
+/* release buffer_mutex and clear r/w access flag */
+static void snd_pcm_buffer_access_unlock(struct snd_pcm_runtime *runtime)
+{
+	mutex_unlock(&runtime->buffer_mutex);
+	atomic_inc(&runtime->buffer_accessing);
+}
+
 #if IS_ENABLED(CONFIG_SND_PCM_OSS)
 #define is_oss_stream(substream)	((substream)->oss.oss)
 #else
@@ -695,14 +713,16 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime;
-	int err = 0, usecs;
+	int err, usecs;
 	unsigned int bits;
 	snd_pcm_uframes_t frames;
 
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	mutex_lock(&runtime->buffer_mutex);
+	err = snd_pcm_buffer_access_lock(runtime);
+	if (err < 0)
+		return err;
 	snd_pcm_stream_lock_irq(substream);
 	switch (runtime->status->state) {
 	case SNDRV_PCM_STATE_OPEN:
@@ -820,7 +840,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 			snd_pcm_lib_free_pages(substream);
 	}
  unlock:
-	mutex_unlock(&runtime->buffer_mutex);
+	snd_pcm_buffer_access_unlock(runtime);
 	return err;
 }
 
@@ -865,7 +885,9 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
 	runtime = substream->runtime;
-	mutex_lock(&runtime->buffer_mutex);
+	result = snd_pcm_buffer_access_lock(runtime);
+	if (result < 0)
+		return result;
 	snd_pcm_stream_lock_irq(substream);
 	switch (runtime->status->state) {
 	case SNDRV_PCM_STATE_SETUP:
@@ -884,7 +906,7 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
 	cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
  unlock:
-	mutex_unlock(&runtime->buffer_mutex);
+	snd_pcm_buffer_access_unlock(runtime);
 	return result;
 }
 
@@ -1369,12 +1391,15 @@ static int snd_pcm_action_nonatomic(const struct action_ops *ops,
 
 	/* Guarantee the group members won't change during non-atomic action */
 	down_read(&snd_pcm_link_rwsem);
-	mutex_lock(&substream->runtime->buffer_mutex);
+	res = snd_pcm_buffer_access_lock(substream->runtime);
+	if (res < 0)
+		goto unlock;
 	if (snd_pcm_stream_linked(substream))
 		res = snd_pcm_action_group(ops, substream, state, false);
 	else
 		res = snd_pcm_action_single(ops, substream, state);
-	mutex_unlock(&substream->runtime->buffer_mutex);
+	snd_pcm_buffer_access_unlock(substream->runtime);
+ unlock:
 	up_read(&snd_pcm_link_rwsem);
 	return res;
 }
-- 
2.31.1


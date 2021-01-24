Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CA301DBD
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 17:59:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CA151910;
	Sun, 24 Jan 2021 17:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CA151910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611507570;
	bh=rULIMTPFuk1jke58EOOeVKCk3AbCxpitKS3AJ2GJ080=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzxa/4BnfaAF4Ps3IxS6pg2auAjELBsULmoq61LYZ2YlbxK4IGEUu4XwjLAqCMWJp
	 wcBD1rvqfhjxOZ52dshXbsugguUNCB/KoV1Tu4Jr9dEPM+AFwb/jfEryvPMZPK1xO+
	 08izqMCOUNvPVu3X6DOJLmg6ykypjeuPkC7KmyrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 917CFF8015B;
	Sun, 24 Jan 2021 17:55:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00DC3F80524; Sun, 24 Jan 2021 17:55:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDBA4F8051F
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 17:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDBA4F8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="ddEXikMV"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 4D4B8A1484;
 Sun, 24 Jan 2021 17:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=vX3CRhwxWMNn
 x+gi+0QcsHwpBgsOeqVz7H3Ivu36FTw=; b=ddEXikMVBpleWeXCRUnX+9KDnWYS
 n85tz7BW/70508N0Dxkx0U39Ib4IEaz8Ce1xcFd4lTHa+/JaJg/pQJ5qTJIw+Q9e
 W89lv3h0EGtseKg9oMK1I84U1AXQaMYPDOEYgxQ+Fainai5IoHhNU9ThCnwttdBo
 rL3bqGjynR3ROXEDiZRoL+z540EngE89YJuYITXtZsNrS+GrhVzgxR1MHgWsbY9e
 Eiy4qnk/R91zCFoER3JV2M4A2YVItb5asjmIiMdYdpqAty502aJ8Vf2NRsWZHKyD
 /zpVDoJezotnm5py8ra6Q/2wHROZZfH8QN5/78cIPP7c+Wc8saZPhwoAXA==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v2 9/9] ALSA: virtio: introduce device suspend/resume support
Date: Sun, 24 Jan 2021 17:54:08 +0100
Message-ID: <20210124165408.1122868-10-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
References: <20210124165408.1122868-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

All running PCM substreams are stopped on device suspend and restarted
on device resume.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/virtio_card.c    | 54 ++++++++++++++++++++
 sound/virtio/virtio_pcm.c     | 40 +++++++++++++++
 sound/virtio/virtio_pcm.h     |  6 +++
 sound/virtio/virtio_pcm_ops.c | 93 ++++++++++++++++++++---------------
 4 files changed, 154 insertions(+), 39 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index fabf91fc1c9c..90dadf18d9b0 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -491,6 +491,56 @@ static void virtsnd_config_changed(struct virtio_device *vdev)
 			 "sound device configuration was changed\n");
 }
 
+#ifdef CONFIG_PM_SLEEP
+/**
+ * virtsnd_freeze() - Suspend device.
+ * @vdev: VirtIO parent device.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_freeze(struct virtio_device *vdev)
+{
+	struct virtio_snd *snd = vdev->priv;
+
+	virtsnd_disable_vqs(snd);
+
+	vdev->config->reset(vdev);
+	vdev->config->del_vqs(vdev);
+
+	return 0;
+}
+
+/**
+ * virtsnd_restore() - Resume device.
+ * @vdev: VirtIO parent device.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_restore(struct virtio_device *vdev)
+{
+	struct virtio_snd *snd = vdev->priv;
+	int rc;
+
+	rc = virtsnd_find_vqs(snd);
+	if (rc)
+		return rc;
+
+	virtio_device_ready(vdev);
+
+	if (snd->nsubstreams) {
+		rc = virtsnd_pcm_restore(snd);
+		if (rc)
+			return rc;
+	}
+
+	virtsnd_enable_event_vq(snd);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
 static const struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_SOUND, VIRTIO_DEV_ANY_ID },
 	{ 0 },
@@ -504,6 +554,10 @@ static struct virtio_driver virtsnd_driver = {
 	.probe = virtsnd_probe,
 	.remove = virtsnd_remove,
 	.config_changed = virtsnd_config_changed,
+#ifdef CONFIG_PM_SLEEP
+	.freeze = virtsnd_freeze,
+	.restore = virtsnd_restore,
+#endif
 };
 
 static int __init init(void)
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index 6a1ca6b2c3ca..68d9c6dee13a 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -122,6 +122,7 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *substream,
 		SNDRV_PCM_INFO_BATCH |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_RESUME |
 		SNDRV_PCM_INFO_PAUSE;
 
 	if (!info->channels_min || info->channels_min > info->channels_max) {
@@ -511,6 +512,45 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+/**
+ * virtsnd_pcm_restore() - Resume PCM substreams.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_pcm_restore(struct virtio_snd *snd)
+{
+	unsigned int i;
+
+	for (i = 0; i < snd->nsubstreams; ++i) {
+		struct virtio_pcm_substream *substream = &snd->substreams[i];
+		struct snd_pcm_substream *ksubstream = substream->substream;
+		int rc;
+
+		if (!substream->suspended)
+			continue;
+
+		/*
+		 * We restart the substream by executing the standard command
+		 * sequence. The START command will be sent from a subsequent
+		 * call to the trigger() callback function after the device has
+		 * been resumed.
+		 */
+		rc = ksubstream->ops->hw_params(ksubstream, NULL);
+		if (rc)
+			return rc;
+
+		rc = ksubstream->ops->prepare(ksubstream);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
 /**
  * virtsnd_pcm_event() - Handle the PCM device event notification.
  * @snd: VirtIO sound device.
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index a326b921b947..23d0fdd57225 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -41,6 +41,7 @@ struct virtio_pcm_msg;
  * @hw_ptr: Substream hardware pointer value in frames [0 ... buffer_size).
  * @xfer_enabled: Data transfer state (0 - off, 1 - on).
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
+ * @suspended: Kernel ALSA substream is suspended.
  * @msgs: I/O messages.
  * @msg_last_enqueued: Index of the last I/O message added to the virtqueue.
  * @msg_count: Number of pending I/O messages in the virtqueue.
@@ -60,6 +61,7 @@ struct virtio_pcm_substream {
 	atomic_t hw_ptr;
 	atomic_t xfer_enabled;
 	atomic_t xfer_xrun;
+	bool suspended;
 	struct virtio_pcm_msg *msgs;
 	int msg_last_enqueued;
 	atomic_t msg_count;
@@ -102,6 +104,10 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd);
 
 int virtsnd_pcm_build_devs(struct virtio_snd *snd);
 
+#ifdef CONFIG_PM_SLEEP
+int virtsnd_pcm_restore(struct virtio_snd *snd);
+#endif /* CONFIG_PM_SLEEP */
+
 void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event);
 
 void virtsnd_pcm_tx_notify_cb(struct virtqueue *vqueue);
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 19882777fcd6..0b3c66802325 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -187,6 +187,8 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 	if (!ss)
 		return -EBADFD;
 
+	ss->suspended = false;
+
 	substream->runtime->hw = ss->hw;
 	substream->private_data = ss;
 
@@ -241,18 +243,20 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 	int vrate = -1;
 	int rc;
 
-	/*
-	 * If we got here after ops->trigger() was called, the queue may
-	 * still contain messages. In this case, we need to release the
-	 * substream first.
-	 */
-	if (atomic_read(&ss->msg_count)) {
-		rc = virtsnd_pcm_release(ss);
-		if (rc) {
-			dev_err(&vdev->dev,
-				"SID %u: invalid I/O queue state\n",
-				ss->sid);
-			return rc;
+	if (!ss->suspended) {
+		/*
+		 * If we got here after ops->trigger() was called, the queue may
+		 * still contain messages. In this case, we need to release the
+		 * substream first.
+		 */
+		if (atomic_read(&ss->msg_count)) {
+			rc = virtsnd_pcm_release(ss);
+			if (rc) {
+				dev_err(&vdev->dev,
+					"SID %u: invalid I/O queue state\n",
+					ss->sid);
+				return rc;
+			}
 		}
 	}
 
@@ -383,37 +387,41 @@ static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
 static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *ss = snd_pcm_substream_chip(substream);
-	struct virtio_snd_queue *queue = virtsnd_pcm_queue(ss);
 	struct virtio_snd_msg *msg;
 	unsigned long flags;
 	int rc;
 
-	/*
-	 * If we got here after ops->trigger() was called, the queue may
-	 * still contain messages. In this case, we need to reset the
-	 * substream first.
-	 */
-	if (atomic_read(&ss->msg_count)) {
-		rc = virtsnd_pcm_hw_params(substream, NULL);
-		if (rc)
-			return rc;
-	}
-
-	spin_lock_irqsave(&queue->lock, flags);
-	ss->msg_last_enqueued = -1;
-	spin_unlock_irqrestore(&queue->lock, flags);
+	if (!ss->suspended) {
+		struct virtio_snd_queue *queue = virtsnd_pcm_queue(ss);
+
+		/*
+		 * If we got here after ops->trigger() was called, the queue may
+		 * still contain messages. In this case, we need to reset the
+		 * substream first.
+		 */
+		if (atomic_read(&ss->msg_count)) {
+			rc = virtsnd_pcm_hw_params(substream, NULL);
+			if (rc)
+				return rc;
+		}
 
-	/*
-	 * Since I/O messages are asynchronous, they can be completed
-	 * when the runtime structure no longer exists. Since each
-	 * completion implies incrementing the hw_ptr, we cache all the
-	 * current values needed to compute the new hw_ptr value.
-	 */
-	ss->frame_bytes = substream->runtime->frame_bits >> 3;
-	ss->period_size = substream->runtime->period_size;
-	ss->buffer_size = substream->runtime->buffer_size;
+		spin_lock_irqsave(&queue->lock, flags);
+		ss->msg_last_enqueued = -1;
+		spin_unlock_irqrestore(&queue->lock, flags);
+
+		/*
+		 * Since I/O messages are asynchronous, they can be completed
+		 * when the runtime structure no longer exists. Since each
+		 * completion implies incrementing the hw_ptr, we cache all the
+		 * current values needed to compute the new hw_ptr value.
+		 */
+		ss->frame_bytes = substream->runtime->frame_bits >> 3;
+		ss->period_size = substream->runtime->period_size;
+		ss->buffer_size = substream->runtime->buffer_size;
+
+		atomic_set(&ss->hw_ptr, 0);
+	}
 
-	atomic_set(&ss->hw_ptr, 0);
 	atomic_set(&ss->xfer_xrun, 0);
 	atomic_set(&ss->msg_count, 0);
 
@@ -446,9 +454,12 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 	switch (command) {
 	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE: {
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME: {
 		int rc;
 
+		ss->suspended = false;
+
 		spin_lock(&queue->lock);
 		rc = virtsnd_pcm_msg_send(ss);
 		spin_unlock(&queue->lock);
@@ -465,9 +476,13 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 		return virtsnd_ctl_msg_send(snd, msg);
 	}
 	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH: {
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND: {
 		atomic_set(&ss->xfer_enabled, 0);
 
+		if (command == SNDRV_PCM_TRIGGER_SUSPEND)
+			ss->suspended = true;
+
 		msg = virtsnd_pcm_ctl_msg_alloc(ss, VIRTIO_SND_R_PCM_STOP,
 						GFP_ATOMIC);
 		if (IS_ERR(msg))
-- 
2.30.0



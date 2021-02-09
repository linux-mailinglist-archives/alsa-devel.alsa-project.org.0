Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52003314F5C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 13:45:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE47D16CF;
	Tue,  9 Feb 2021 13:45:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE47D16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612874756;
	bh=QPrxRhyNNZiHm3lqpbNJIipjdvgveVgw7s4B9hyNSu8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YRzpi0k3jfra1NeE4zr4y+r8m2OXJKx9iNAqk7hELCoLhyNKK+ETHfWK8zBbxBNx2
	 eun6PoTM6DGjaiv6h5AvMDNHeQeXWIRg5aZo33VoY3j2Y6GUoHtfAoiqo5dzH5tOnW
	 1fkmeMr2Hw9Wq+86six9Jh2+LC668u5uR3wLjzZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2AC6F804EC;
	Tue,  9 Feb 2021 13:41:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23D0FF804E5; Tue,  9 Feb 2021 13:41:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F708F804E6
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 13:41:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F708F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="SXWaVvwz"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id E2B93A15F7;
 Tue,  9 Feb 2021 13:41:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=Kf3NoYTKMR9c
 KxKhivPIKRwuTjyeEW86UKMD9wJXhYg=; b=SXWaVvwzKI9BNgLAL1EQJKR211hc
 WyuKWuvWAt8HwBQixKM8+xr3ts9WmVli/4LZxvHOzxHlTRFoOt3K4Pz7fMauc3AN
 0s3OXtUGmp66Bw95Q23lLFt17F1WzD+RgA9IAohvA9TiW5kwZDglCiYFCBOspHnU
 9t31Z9QwKJBnM2ANTtckNlk/3PahJLCErR0mxe+IyzGvTvSgegZgtH762bqw950d
 XOD1aQn7vHzyXQyCcd10Ey2+hJn4+0YBqqQZ/J5h5Y2haL8Og+azF+aDIo+MsrOV
 GmjrRJ09V/vAVC+CfC5ni4+EAS5CeJT/A4ukHDLAmFLUH0T4eJ4QHSJM9A==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v3 9/9] ALSA: virtio: introduce device suspend/resume support
Date: Tue, 9 Feb 2021 13:40:10 +0100
Message-ID: <20210209124011.1224628-10-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209124011.1224628-1-anton.yakovlev@opensynergy.com>
References: <20210209124011.1224628-1-anton.yakovlev@opensynergy.com>
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
 sound/virtio/virtio_card.c    | 57 +++++++++++++++++++++++++++++++++++
 sound/virtio/virtio_pcm.c     |  1 +
 sound/virtio/virtio_pcm_ops.c | 44 ++++++++++++++++++++-------
 3 files changed, 91 insertions(+), 11 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 787a4dec1da8..1f0a0fa7bbc0 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -373,6 +373,59 @@ static void virtsnd_config_changed(struct virtio_device *vdev)
 			 "sound device configuration was changed\n");
 }
 
+#ifdef CONFIG_PM_SLEEP
+/**
+ * virtsnd_freeze() - Suspend device.
+ * @vdev: VirtIO parent device.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_freeze(struct virtio_device *vdev)
+{
+	struct virtio_snd *snd = vdev->priv;
+
+	/* Stop all the virtqueues. */
+	vdev->config->reset(vdev);
+	vdev->config->del_vqs(vdev);
+
+	virtsnd_ctl_msg_cancel_all(snd);
+
+	kfree(snd->event_msgs);
+
+	/*
+	 * If the virtsnd_restore() fails before re-allocating events, then we
+	 * get a dangling pointer here.
+	 */
+	snd->event_msgs = NULL;
+
+	return 0;
+}
+
+/**
+ * virtsnd_restore() - Resume device.
+ * @vdev: VirtIO parent device.
+ *
+ * Context: Any context.
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
+	virtsnd_enable_event_vq(snd);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
 static const struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_SOUND, VIRTIO_DEV_ANY_ID },
 	{ 0 },
@@ -386,6 +439,10 @@ static struct virtio_driver virtsnd_driver = {
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
index 1d98de878385..401d4c975d2b 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -109,6 +109,7 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
 		SNDRV_PCM_INFO_BATCH |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_RESUME |
 		SNDRV_PCM_INFO_PAUSE;
 
 	if (!info->channels_min || info->channels_min > info->channels_max) {
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index c2224f5461c4..207f4877a5ec 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -220,6 +220,10 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (rc)
 		return rc;
 
+	/* If messages have already been allocated before, do nothing. */
+	if (runtime->status->state == SNDRV_PCM_STATE_SUSPENDED)
+		return 0;
+
 	return virtsnd_pcm_msg_alloc(vss, periods, period_bytes);
 }
 
@@ -260,19 +264,21 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	}
 
 	spin_lock_irqsave(&vss->lock, flags);
-	/*
-	 * Since I/O messages are asynchronous, they can be completed
-	 * when the runtime structure no longer exists. Since each
-	 * completion implies incrementing the hw_ptr, we cache all the
-	 * current values needed to compute the new hw_ptr value.
-	 */
-	vss->frame_bytes = runtime->frame_bits >> 3;
-	vss->period_size = runtime->period_size;
-	vss->buffer_size = runtime->buffer_size;
+	if (runtime->status->state != SNDRV_PCM_STATE_SUSPENDED) {
+		/*
+		 * Since I/O messages are asynchronous, they can be completed
+		 * when the runtime structure no longer exists. Since each
+		 * completion implies incrementing the hw_ptr, we cache all the
+		 * current values needed to compute the new hw_ptr value.
+		 */
+		vss->frame_bytes = runtime->frame_bits >> 3;
+		vss->period_size = runtime->period_size;
+		vss->buffer_size = runtime->buffer_size;
 
-	vss->hw_ptr = 0;
+		vss->hw_ptr = 0;
+		vss->msg_last_enqueued = -1;
+	}
 	vss->xfer_xrun = false;
-	vss->msg_last_enqueued = -1;
 	vss->msg_count = 0;
 	spin_unlock_irqrestore(&vss->lock, flags);
 
@@ -302,6 +308,21 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 	int rc;
 
 	switch (command) {
+	case SNDRV_PCM_TRIGGER_RESUME: {
+		/*
+		 * We restart the substream by executing the standard command
+		 * sequence.
+		 */
+		rc = virtsnd_pcm_hw_params(substream, NULL);
+		if (rc)
+			return rc;
+
+		rc = virtsnd_pcm_prepare(substream);
+		if (rc)
+			return rc;
+
+		fallthrough;
+	}
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE: {
 		struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
@@ -328,6 +349,7 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 		return virtsnd_ctl_msg_send_sync(snd, msg);
 	}
+	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH: {
 		spin_lock_irqsave(&vss->lock, flags);
-- 
2.30.0



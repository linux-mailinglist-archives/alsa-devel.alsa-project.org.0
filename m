Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AD832A6C3
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 17:52:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5653617AB;
	Tue,  2 Mar 2021 17:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5653617AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614703961;
	bh=W1hhMKaE/bOZoh3Js+Wf2kk4766qAZ+utI38/5sdTkw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C+U6U2bkC15WAZ0u9bT2EKSd9GeKgT1guDOSA4VJiNS+0ZOjbowoTaHdZSL5z/jbo
	 MISlzcKG7I9jWXP/GjfYYlfrKAVqqFzgGE5DFgJCPI+wrEY1VhcFVCZCGEg2AdrHru
	 TUFJASMdHrQkhokcFHq0Ey2kvzkon1CoXgaBbp7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32C45F804EC;
	Tue,  2 Mar 2021 17:48:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1098F804FA; Tue,  2 Mar 2021 17:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F650F804EC
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 17:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F650F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="GQmy+uqT"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id D10B9A17C5;
 Tue,  2 Mar 2021 17:48:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=Iq2O+faTDVb2
 vlZ2E3J4cQ1DqJ4S6FQ6CtKxj20OPQk=; b=GQmy+uqTDKQMXUfXaTOMxHbzM90U
 Xc12b7KSYDXBgpIBWyic2EXqMqnCUxPk524Jtg+/ttlnits6oevMe0UEhs0kZ3G6
 fLPxvbCMKlqGQREzs8NC4Tf2vDS8VuvGUqdtoXqyNOXlbP7ZJrxFDdMoY8UNQ1Jf
 Gom5ot4aEZLMb/yVb4I0vThpupY/Ubn3h//xuliIuM8i9XZLjKy8rx8lIG/RkBzz
 wr0TSgASOkRarqr3Q7H2EsUEdDgxVD2os7bIJzQ/hfmdrIOc1JLQ6IhxAGO3b6QY
 ynoyIAXC/u5I3NueXPuwGKyOPVbXdH1mvIopY8o+efoknKEN8NMq/4hhsQ==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v7 9/9] ALSA: virtio: introduce device suspend/resume support
Date: Tue, 2 Mar 2021 17:47:09 +0100
Message-ID: <20210302164709.3142702-10-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302164709.3142702-1-anton.yakovlev@opensynergy.com>
References: <20210302164709.3142702-1-anton.yakovlev@opensynergy.com>
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
 sound/virtio/virtio_card.c    | 56 +++++++++++++++++++++++++++++++++++
 sound/virtio/virtio_pcm.h     |  3 ++
 sound/virtio/virtio_pcm_ops.c | 33 ++++++++++++++++-----
 3 files changed, 85 insertions(+), 7 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 1c03fcc41c3b..ae9128063917 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -362,6 +362,58 @@ static void virtsnd_remove(struct virtio_device *vdev)
 	kfree(snd->event_msgs);
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
+	unsigned int i;
+
+	virtsnd_disable_event_vq(snd);
+	virtsnd_ctl_msg_cancel_all(snd);
+
+	vdev->config->del_vqs(vdev);
+	vdev->config->reset(vdev);
+
+	for (i = 0; i < snd->nsubstreams; ++i)
+		cancel_work_sync(&snd->substreams[i].elapsed_period);
+
+	kfree(snd->event_msgs);
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
@@ -374,6 +426,10 @@ static struct virtio_driver virtsnd_driver = {
 	.validate = virtsnd_validate,
 	.probe = virtsnd_probe,
 	.remove = virtsnd_remove,
+#ifdef CONFIG_PM_SLEEP
+	.freeze = virtsnd_freeze,
+	.restore = virtsnd_restore,
+#endif
 };
 
 static int __init init(void)
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 1353fdc9bd69..062eb8e8f2cf 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -31,6 +31,8 @@ struct virtio_pcm_msg;
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
  *           side.
+ * @suspended: True if the substream is suspended and must be reconfigured on
+ *             the device side at resume.
  * @msgs: Allocated I/O messages.
  * @nmsgs: Number of allocated I/O messages.
  * @msg_last_enqueued: Index of the last I/O message added to the virtqueue.
@@ -52,6 +54,7 @@ struct virtio_pcm_substream {
 	bool xfer_enabled;
 	bool xfer_xrun;
 	bool stopped;
+	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
 	int msg_last_enqueued;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 0682a2df6c8c..f8bfb87624be 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -115,6 +115,7 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
 	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	vss->suspended = false;
 
 	/*
 	 * If the substream has already been used, then the I/O queue may be in
@@ -272,16 +273,31 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
 
-	if (virtsnd_pcm_msg_pending_num(vss)) {
-		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
-			vss->sid);
-		return -EBADFD;
+	if (!vss->suspended) {
+		if (virtsnd_pcm_msg_pending_num(vss)) {
+			dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
+				vss->sid);
+			return -EBADFD;
+		}
+
+		vss->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
+		vss->hw_ptr = 0;
+		vss->msg_last_enqueued = -1;
+	} else {
+		struct snd_pcm_runtime *runtime = substream->runtime;
+		unsigned int buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
+		unsigned int period_bytes = snd_pcm_lib_period_bytes(substream);
+		int rc;
+
+		rc = virtsnd_pcm_dev_set_params(vss, buffer_bytes, period_bytes,
+						runtime->channels,
+						runtime->format, runtime->rate);
+		if (rc)
+			return rc;
 	}
 
-	vss->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
-	vss->hw_ptr = 0;
 	vss->xfer_xrun = false;
-	vss->msg_last_enqueued = -1;
+	vss->suspended = false;
 	vss->msg_count = 0;
 
 	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_PREPARE,
@@ -336,6 +352,9 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 		}
 
 		return virtsnd_ctl_msg_send_sync(snd, msg);
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		vss->suspended = true;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 		vss->stopped = true;
 		fallthrough;
-- 
2.30.1



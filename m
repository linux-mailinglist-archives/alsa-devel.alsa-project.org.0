Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED5E326C65
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Feb 2021 10:05:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D544B16AE;
	Sat, 27 Feb 2021 10:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D544B16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614416739;
	bh=u/Q0K1mwSL+ZSIlh8M0CngEFW23v0RV6Q1Q+XXqyfE4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7AQWjtN1BxYRfnOTquMW4J0+l3xpohEX/petQ//LBgT2ZBePDWNcfpEnVtDch0UI
	 2rNSTmOcgHcVQa5ACvIsM6Uq9/pUrmIEw3mAVCx8jIyGG4qtkPvz4r1ARqe0eGVYhV
	 EwkkDKdDnhKUJ+3ExtJVIfpb0jeZgJPGXe2ZQMGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B466F804FE;
	Sat, 27 Feb 2021 10:01:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52FEAF80430; Sat, 27 Feb 2021 10:00:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8337F80159
 for <alsa-devel@alsa-project.org>; Sat, 27 Feb 2021 10:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8337F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="Xlopr/eW"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 547D9A1765;
 Sat, 27 Feb 2021 10:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=zLcadKSiDEB2
 5euoNy23WAsizIICsggTnRBQxLzaEyk=; b=Xlopr/eWd8YAOS0Eq0Z5K60FlzOz
 bU5/TBb1pB5ZKQL4nQdWmOfb4CP8BVBaKMiRUTizHmrAdIZ/j41753zNj8Ya8IFN
 +aNd+oaKAF1PoeDzX3i1Ybxhqrxcqnx+4ig6A65sDmwh819Yui1/WE9CNDLlv+oI
 cUYRdXgwk9edgYAj6XgRyHQ43LYBBSDVh1yzPewBV+Ck0ImSleEZM11HYhOajP25
 EST9S6ndRwNVuws6+ZYtl4+oyZv/5ydv/L0Dzhic+/oeQ2vah+3kGSG5LISIUC98
 XOMN/S9asSSsEUf+plIANnLVAOny61yBt0NwquFfJ5AERcOVGZh13JH1xQ==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v6 9/9] ALSA: virtio: introduce device suspend/resume support
Date: Sat, 27 Feb 2021 09:59:56 +0100
Message-ID: <20210227085956.1700687-10-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
References: <20210227085956.1700687-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
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
 sound/virtio/virtio_pcm.c     |  1 +
 sound/virtio/virtio_pcm_ops.c | 41 ++++++++++++++++++++-----
 3 files changed, 90 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 59455a562018..c7ae8801991d 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -323,6 +323,58 @@ static void virtsnd_remove(struct virtio_device *vdev)
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
+
+	virtsnd_ctl_msg_cancel_all(snd);
+
+	vdev->config->del_vqs(vdev);
+	vdev->config->reset(vdev);
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
@@ -335,6 +387,10 @@ static struct virtio_driver virtsnd_driver = {
 	.validate = virtsnd_validate,
 	.probe = virtsnd_probe,
 	.remove = virtsnd_remove,
+#ifdef CONFIG_PM_SLEEP
+	.freeze = virtsnd_freeze,
+	.restore = virtsnd_restore,
+#endif
 };
 
 static int __init init(void)
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index 3605151860f2..4a4a6583b002 100644
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
index d02d79bd94f3..03a7e2666cfb 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -167,7 +167,8 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 	int vrate = -1;
 	int rc;
 
-	if (virtsnd_pcm_msg_pending_num(vss)) {
+	if (runtime->status->state != SNDRV_PCM_STATE_SUSPENDED &&
+	    virtsnd_pcm_msg_pending_num(vss)) {
 		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
 			vss->sid);
 		return -EBADFD;
@@ -231,6 +232,10 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (rc)
 		return rc;
 
+	/* If messages have already been allocated before, do nothing. */
+	if (runtime->status->state == SNDRV_PCM_STATE_SUSPENDED)
+		return 0;
+
 	/* Free previously allocated messages (if any). */
 	virtsnd_pcm_msg_free(vss);
 
@@ -267,20 +272,24 @@ static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
  */
 static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 {
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
 
-	if (virtsnd_pcm_msg_pending_num(vss)) {
-		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
-			vss->sid);
-		return -EBADFD;
+	if (runtime->status->state != SNDRV_PCM_STATE_SUSPENDED) {
+		if (virtsnd_pcm_msg_pending_num(vss)) {
+			dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
+				vss->sid);
+			return -EBADFD;
+		}
+
+		vss->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
+		vss->hw_ptr = 0;
+		vss->msg_last_enqueued = -1;
 	}
 
-	vss->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
-	vss->hw_ptr = 0;
 	vss->xfer_xrun = false;
-	vss->msg_last_enqueued = -1;
 	vss->msg_count = 0;
 
 	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_PREPARE,
@@ -309,6 +318,21 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
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
@@ -335,6 +359,7 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 		return virtsnd_ctl_msg_send_sync(snd, msg);
 	}
+	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH: {
 		spin_lock_irqsave(&vss->lock, flags);
-- 
2.30.1



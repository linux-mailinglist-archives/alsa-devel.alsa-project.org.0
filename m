Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD5321BB1
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 16:39:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9F7A1668;
	Mon, 22 Feb 2021 16:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9F7A1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614008398;
	bh=CTrCnQzFwTAEvjLTf9Iv25SL8u5YH+eIX/0REMyx9YE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUvE/AQM/j6ZdlAOaMv7fE4Vy4an1x1c9XgPCfxIyF9+xEiHtVqckbTZnE38UP156
	 5bNc4fGZDQKLI3mCeUfUJH8i7z6597gErRI+5NZi2urP5BNr1CfVUYZgTHZ6GbGqp0
	 1JwOv4AoLsIsqxCrBPtBJKWUTZYt3rr/LeomJt+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD694F804DF;
	Mon, 22 Feb 2021 16:36:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEB84F804AA; Mon, 22 Feb 2021 16:36:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 845AAF8025E
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 16:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 845AAF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="q5J7Ux00"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id 2181CA13EC;
 Mon, 22 Feb 2021 16:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=dDMP9wB02BpD
 ZmEaig0fD+4KahtJhHECHR1hu1zLULo=; b=q5J7Ux00F/WmlehpN08/U54brxmH
 cnNv+3lPDXMG3dllNU4Dd5kVC69JMUQvpChiil9hq+SqKZb3dt5L7+1P+rM4NWqb
 sPXEgFBXIJmW5PTZb5jem4OATJGYyMoTcVsW5jYQW8uzLgq9wAh4thxxWiGXV3en
 2fGBlmf1VXocvWwE42U7wDoMqcnJQaC3f8Uh41/JCVZ3/nKG/6SSKPiqsnQ4ITR3
 LSDdjZN2ZGxEGkPlW+I2cBxTjkEnS6bHkhvw6ofneqSlHrJvNGmPNVNNXXsEHnmJ
 j60wrfsBbUlh2LWT3OkTWCnisyQIODvXBRteyXz8N0YUsq4Xl64WTYV38g==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v5 6/9] ALSA: virtio: PCM substream operators
Date: Mon, 22 Feb 2021 16:34:41 +0100
Message-ID: <20210222153444.348390-7-anton.yakovlev@opensynergy.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-02.open-synergy.com (10.26.10.22)
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

Introduce the operators required for the operation of substreams.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile         |   3 +-
 sound/virtio/virtio_pcm.c     |   2 +
 sound/virtio/virtio_pcm.h     |   4 +
 sound/virtio/virtio_pcm_ops.c | 469 ++++++++++++++++++++++++++++++++++
 4 files changed, 477 insertions(+), 1 deletion(-)
 create mode 100644 sound/virtio/virtio_pcm_ops.c

diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index 626af3cc3ed7..34493226793f 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -6,5 +6,6 @@ virtio_snd-objs := \
 	virtio_card.o \
 	virtio_ctl_msg.o \
 	virtio_pcm.o \
-	virtio_pcm_msg.o
+	virtio_pcm_msg.o \
+	virtio_pcm_ops.o
 
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index 3cfd3520a9c0..3605151860f2 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -454,6 +454,8 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
 
 			for (kss = ks->substream; kss; kss = kss->next)
 				vs->substreams[kss->number]->substream = kss;
+
+			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops);
 		}
 
 		snd_pcm_set_managed_buffer_all(vpcm->pcm,
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index c70e4fed9044..c48d00acee2e 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -35,6 +35,7 @@ struct virtio_pcm_msg;
  * @msg_last_enqueued: Index of the last I/O message added to the virtqueue.
  * @msg_count: Number of pending I/O messages in the virtqueue.
  * @msg_empty: Notify when msg_count is zero.
+ * @msg_flushing: True if the I/O queue is in flushing state.
  */
 struct virtio_pcm_substream {
 	struct virtio_snd *snd;
@@ -56,6 +57,7 @@ struct virtio_pcm_substream {
 	int msg_last_enqueued;
 	unsigned int msg_count;
 	wait_queue_head_t msg_empty;
+	bool msg_flushing;
 };
 
 /**
@@ -82,6 +84,8 @@ struct virtio_pcm {
 	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
 };
 
+extern const struct snd_pcm_ops virtsnd_pcm_ops;
+
 int virtsnd_pcm_validate(struct virtio_device *vdev);
 
 int virtsnd_pcm_parse_cfg(struct virtio_snd *snd);
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
new file mode 100644
index 000000000000..07510778b555
--- /dev/null
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#include <sound/pcm_params.h>
+
+#include "virtio_card.h"
+
+/* Map for converting ALSA format to VirtIO format. */
+struct virtsnd_a2v_format {
+	snd_pcm_format_t alsa_bit;
+	unsigned int vio_bit;
+};
+
+static const struct virtsnd_a2v_format g_a2v_format_map[] = {
+	{ SNDRV_PCM_FORMAT_IMA_ADPCM, VIRTIO_SND_PCM_FMT_IMA_ADPCM },
+	{ SNDRV_PCM_FORMAT_MU_LAW, VIRTIO_SND_PCM_FMT_MU_LAW },
+	{ SNDRV_PCM_FORMAT_A_LAW, VIRTIO_SND_PCM_FMT_A_LAW },
+	{ SNDRV_PCM_FORMAT_S8, VIRTIO_SND_PCM_FMT_S8 },
+	{ SNDRV_PCM_FORMAT_U8, VIRTIO_SND_PCM_FMT_U8 },
+	{ SNDRV_PCM_FORMAT_S16_LE, VIRTIO_SND_PCM_FMT_S16 },
+	{ SNDRV_PCM_FORMAT_U16_LE, VIRTIO_SND_PCM_FMT_U16 },
+	{ SNDRV_PCM_FORMAT_S18_3LE, VIRTIO_SND_PCM_FMT_S18_3 },
+	{ SNDRV_PCM_FORMAT_U18_3LE, VIRTIO_SND_PCM_FMT_U18_3 },
+	{ SNDRV_PCM_FORMAT_S20_3LE, VIRTIO_SND_PCM_FMT_S20_3 },
+	{ SNDRV_PCM_FORMAT_U20_3LE, VIRTIO_SND_PCM_FMT_U20_3 },
+	{ SNDRV_PCM_FORMAT_S24_3LE, VIRTIO_SND_PCM_FMT_S24_3 },
+	{ SNDRV_PCM_FORMAT_U24_3LE, VIRTIO_SND_PCM_FMT_U24_3 },
+	{ SNDRV_PCM_FORMAT_S20_LE, VIRTIO_SND_PCM_FMT_S20 },
+	{ SNDRV_PCM_FORMAT_U20_LE, VIRTIO_SND_PCM_FMT_U20 },
+	{ SNDRV_PCM_FORMAT_S24_LE, VIRTIO_SND_PCM_FMT_S24 },
+	{ SNDRV_PCM_FORMAT_U24_LE, VIRTIO_SND_PCM_FMT_U24 },
+	{ SNDRV_PCM_FORMAT_S32_LE, VIRTIO_SND_PCM_FMT_S32 },
+	{ SNDRV_PCM_FORMAT_U32_LE, VIRTIO_SND_PCM_FMT_U32 },
+	{ SNDRV_PCM_FORMAT_FLOAT_LE, VIRTIO_SND_PCM_FMT_FLOAT },
+	{ SNDRV_PCM_FORMAT_FLOAT64_LE, VIRTIO_SND_PCM_FMT_FLOAT64 },
+	{ SNDRV_PCM_FORMAT_DSD_U8, VIRTIO_SND_PCM_FMT_DSD_U8 },
+	{ SNDRV_PCM_FORMAT_DSD_U16_LE, VIRTIO_SND_PCM_FMT_DSD_U16 },
+	{ SNDRV_PCM_FORMAT_DSD_U32_LE, VIRTIO_SND_PCM_FMT_DSD_U32 },
+	{ SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE,
+	  VIRTIO_SND_PCM_FMT_IEC958_SUBFRAME }
+};
+
+/* Map for converting ALSA frame rate to VirtIO frame rate. */
+struct virtsnd_a2v_rate {
+	unsigned int rate;
+	unsigned int vio_bit;
+};
+
+static const struct virtsnd_a2v_rate g_a2v_rate_map[] = {
+	{ 5512, VIRTIO_SND_PCM_RATE_5512 },
+	{ 8000, VIRTIO_SND_PCM_RATE_8000 },
+	{ 11025, VIRTIO_SND_PCM_RATE_11025 },
+	{ 16000, VIRTIO_SND_PCM_RATE_16000 },
+	{ 22050, VIRTIO_SND_PCM_RATE_22050 },
+	{ 32000, VIRTIO_SND_PCM_RATE_32000 },
+	{ 44100, VIRTIO_SND_PCM_RATE_44100 },
+	{ 48000, VIRTIO_SND_PCM_RATE_48000 },
+	{ 64000, VIRTIO_SND_PCM_RATE_64000 },
+	{ 88200, VIRTIO_SND_PCM_RATE_88200 },
+	{ 96000, VIRTIO_SND_PCM_RATE_96000 },
+	{ 176400, VIRTIO_SND_PCM_RATE_176400 },
+	{ 192000, VIRTIO_SND_PCM_RATE_192000 }
+};
+
+static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream);
+
+/**
+ * virtsnd_pcm_open() - Open the PCM substream.
+ * @substream: Kernel ALSA substream.
+ *
+ * Context: Process context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm *vpcm = snd_pcm_substream_chip(substream);
+	struct virtio_pcm_substream *vss = NULL;
+
+	if (vpcm) {
+		switch (substream->stream) {
+		case SNDRV_PCM_STREAM_PLAYBACK:
+		case SNDRV_PCM_STREAM_CAPTURE: {
+			struct virtio_pcm_stream *vs =
+				&vpcm->streams[substream->stream];
+
+			if (substream->number < vs->nsubstreams)
+				vss = vs->substreams[substream->number];
+			break;
+		}
+		}
+	}
+
+	if (!vss)
+		return -EBADFD;
+
+	substream->runtime->hw = vss->hw;
+	substream->private_data = vss;
+
+	snd_pcm_hw_constraint_integer(substream->runtime,
+				      SNDRV_PCM_HW_PARAM_PERIODS);
+
+	/*
+	 * If the substream has already been used, then the I/O queue may be in
+	 * an invalid state. Just in case, we do a check and try to return the
+	 * queue to its original state, if necessary.
+	 */
+	vss->msg_flushing = true;
+
+	return virtsnd_pcm_sync_stop(substream);
+}
+
+/**
+ * virtsnd_pcm_close() - Close the PCM substream.
+ * @substream: Kernel ALSA substream.
+ *
+ * Context: Process context.
+ * Return: 0.
+ */
+static int virtsnd_pcm_close(struct snd_pcm_substream *substream)
+{
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_hw_params() - Set the parameters of the PCM substream.
+ * @substream: Kernel ALSA substream.
+ * @hw_params: Hardware parameters (can be NULL).
+ *
+ * The function can be called both from the upper level (in this case,
+ * @hw_params is not NULL) or from the driver itself (in this case, @hw_params
+ * is NULL, and the parameter values are taken from the runtime structure).
+ *
+ * Context: Process context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *hw_params)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_device *vdev = vss->snd->vdev;
+	struct virtio_snd_msg *msg;
+	struct virtio_snd_pcm_set_params *request;
+	snd_pcm_format_t format;
+	unsigned int channels;
+	unsigned int rate;
+	unsigned int buffer_bytes;
+	unsigned int period_bytes;
+	unsigned int periods;
+	unsigned int i;
+	int vformat = -1;
+	int vrate = -1;
+	int rc;
+
+	if (vss->msg_flushing) {
+		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
+			vss->sid);
+		return -EBADFD;
+	}
+
+	/* Set hardware parameters in device */
+	if (hw_params) {
+		format = params_format(hw_params);
+		channels = params_channels(hw_params);
+		rate = params_rate(hw_params);
+		buffer_bytes = params_buffer_bytes(hw_params);
+		period_bytes = params_period_bytes(hw_params);
+		periods = params_periods(hw_params);
+	} else {
+		format = runtime->format;
+		channels = runtime->channels;
+		rate = runtime->rate;
+		buffer_bytes = frames_to_bytes(runtime, runtime->buffer_size);
+		period_bytes = frames_to_bytes(runtime, runtime->period_size);
+		periods = runtime->periods;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(g_a2v_format_map); ++i)
+		if (g_a2v_format_map[i].alsa_bit == format) {
+			vformat = g_a2v_format_map[i].vio_bit;
+
+			break;
+		}
+
+	for (i = 0; i < ARRAY_SIZE(g_a2v_rate_map); ++i)
+		if (g_a2v_rate_map[i].rate == rate) {
+			vrate = g_a2v_rate_map[i].vio_bit;
+
+			break;
+		}
+
+	if (vformat == -1 || vrate == -1)
+		return -EINVAL;
+
+	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_SET_PARAMS,
+					GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	request = virtsnd_ctl_msg_request(msg);
+	request->buffer_bytes = cpu_to_le32(buffer_bytes);
+	request->period_bytes = cpu_to_le32(period_bytes);
+	request->channels = channels;
+	request->format = vformat;
+	request->rate = vrate;
+
+	if (vss->features & (1U << VIRTIO_SND_PCM_F_MSG_POLLING))
+		request->features |=
+			cpu_to_le32(1U << VIRTIO_SND_PCM_F_MSG_POLLING);
+
+	if (vss->features & (1U << VIRTIO_SND_PCM_F_EVT_XRUNS))
+		request->features |=
+			cpu_to_le32(1U << VIRTIO_SND_PCM_F_EVT_XRUNS);
+
+	rc = virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	if (rc)
+		return rc;
+
+	return virtsnd_pcm_msg_alloc(vss, periods, period_bytes);
+}
+
+/**
+ * virtsnd_pcm_hw_free() - Reset the parameters of the PCM substream.
+ * @substream: Kernel ALSA substream.
+ *
+ * Context: Process context.
+ * Return: 0
+ */
+static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
+{
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_prepare() - Prepare the PCM substream.
+ * @substream: Kernel ALSA substream.
+ *
+ * The function can be called both from the upper level or from the driver
+ * itself.
+ *
+ * Context: Process context. Takes and releases the VirtIO substream spinlock.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_device *vdev = vss->snd->vdev;
+	struct virtio_snd_msg *msg;
+	unsigned long flags;
+
+	if (vss->msg_flushing) {
+		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
+			vss->sid);
+		return -EBADFD;
+	}
+
+	spin_lock_irqsave(&vss->lock, flags);
+	/*
+	 * Since I/O messages are asynchronous, they can be completed
+	 * when the runtime structure no longer exists. Since each
+	 * completion implies incrementing the hw_ptr, we cache all the
+	 * current values needed to compute the new hw_ptr value.
+	 */
+	vss->frame_bytes = runtime->frame_bits >> 3;
+	vss->period_size = runtime->period_size;
+	vss->buffer_size = runtime->buffer_size;
+
+	vss->hw_ptr = 0;
+	vss->xfer_xrun = false;
+	vss->msg_last_enqueued = -1;
+	vss->msg_count = 0;
+	spin_unlock_irqrestore(&vss->lock, flags);
+
+	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_PREPARE,
+					GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	return virtsnd_ctl_msg_send_sync(vss->snd, msg);
+}
+
+/**
+ * virtsnd_pcm_trigger() - Process command for the PCM substream.
+ * @substream: Kernel ALSA substream.
+ * @command: Substream command (SNDRV_PCM_TRIGGER_XXX).
+ *
+ * Context: Any context. Takes and releases the VirtIO substream spinlock.
+ *          May take and release the tx/rx queue spinlock.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_snd *snd = vss->snd;
+	struct virtio_snd_msg *msg;
+	unsigned long flags;
+	int rc;
+
+	switch (command) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE: {
+		struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+
+		spin_lock_irqsave(&queue->lock, flags);
+		spin_lock(&vss->lock);
+		rc = virtsnd_pcm_msg_send(vss);
+		if (!rc)
+			vss->xfer_enabled = true;
+		spin_unlock(&vss->lock);
+		spin_unlock_irqrestore(&queue->lock, flags);
+		if (rc)
+			return rc;
+
+		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
+						GFP_KERNEL);
+		if (!msg) {
+			spin_lock_irqsave(&vss->lock, flags);
+			vss->xfer_enabled = false;
+			spin_unlock_irqrestore(&vss->lock, flags);
+
+			return -ENOMEM;
+		}
+
+		return virtsnd_ctl_msg_send_sync(snd, msg);
+	}
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH: {
+		spin_lock_irqsave(&vss->lock, flags);
+		vss->xfer_enabled = false;
+		spin_unlock_irqrestore(&vss->lock, flags);
+
+		/*
+		 * The I/O queue needs to be flushed only when the substream is
+		 * completely stopped.
+		 */
+		if (command == SNDRV_PCM_TRIGGER_STOP)
+			vss->msg_flushing = true;
+
+		/*
+		 * The STOP command can be issued in an atomic context after
+		 * the drain is complete. Therefore, in general, we cannot sleep
+		 * here.
+		 */
+		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_STOP,
+						GFP_ATOMIC);
+		if (!msg)
+			return -ENOMEM;
+
+		return virtsnd_ctl_msg_send_async(snd, msg);
+	}
+	default: {
+		return -EINVAL;
+	}
+	}
+}
+
+/**
+ * virtsnd_pcm_msg_count() - Returns the number of pending I/O messages.
+ * @vss: VirtIO substream.
+ *
+ * Context: Any context.
+ * Return: Number of messages.
+ */
+static inline
+unsigned int virtsnd_pcm_msg_count(struct virtio_pcm_substream *vss)
+{
+	unsigned int msg_count;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vss->lock, flags);
+	msg_count = vss->msg_count;
+	spin_unlock_irqrestore(&vss->lock, flags);
+
+	return msg_count;
+}
+
+/**
+ * virtsnd_pcm_sync_stop() - Synchronous PCM substream stop.
+ * @substream: Kernel ALSA substream.
+ *
+ * The function can be called both from the upper level or from the driver
+ * itself.
+ *
+ * Context: Process context. Takes and releases the VirtIO substream spinlock.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_snd *snd = vss->snd;
+	struct virtio_snd_msg *msg;
+	unsigned int js = msecs_to_jiffies(msg_timeout_ms);
+	int rc;
+
+	if (!vss->msg_flushing)
+		return 0;
+
+	if (!virtsnd_pcm_msg_count(vss))
+		goto on_exit;
+
+	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
+					GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	rc = virtsnd_ctl_msg_send_sync(snd, msg);
+	if (rc)
+		return rc;
+
+	/*
+	 * The spec states that upon receipt of the RELEASE command "the device
+	 * MUST complete all pending I/O messages for the specified stream ID".
+	 * Thus, we consider the absence of I/O messages in the queue as an
+	 * indication that the substream has been released.
+	 */
+	rc = wait_event_interruptible_timeout(vss->msg_empty,
+					      !virtsnd_pcm_msg_count(vss),
+					      js);
+	if (rc <= 0) {
+		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
+			 vss->sid);
+
+		return !rc ? -ETIMEDOUT : rc;
+	}
+
+on_exit:
+	vss->msg_flushing = false;
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_pointer() - Get the current hardware position for the PCM
+ *                         substream.
+ * @substream: Kernel ALSA substream.
+ *
+ * Context: Any context. Takes and releases the VirtIO substream spinlock.
+ * Return: Hardware position in frames inside [0 ... buffer_size) range.
+ */
+static snd_pcm_uframes_t
+virtsnd_pcm_pointer(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	snd_pcm_uframes_t hw_ptr = SNDRV_PCM_POS_XRUN;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vss->lock, flags);
+	if (!vss->xfer_xrun)
+		hw_ptr = vss->hw_ptr;
+	spin_unlock_irqrestore(&vss->lock, flags);
+
+	return hw_ptr;
+}
+
+/* PCM substream operators map. */
+const struct snd_pcm_ops virtsnd_pcm_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_pointer,
+};
-- 
2.30.0



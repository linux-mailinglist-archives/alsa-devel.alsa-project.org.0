Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF1301DB5
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 17:57:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63E3D189D;
	Sun, 24 Jan 2021 17:57:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63E3D189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611507478;
	bh=Vzl2BJA4Gy9uznRzwwtqRFnSNsDnF0V4+q8XcjkRdQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vFUNcbbFC901LUYEvXvUdhxjrhxagQa+q/+LvvC7E2emBWh/bahbj7G9YX21QQS75
	 MQl7x1T7A5OJVA4RTYA1ar56XQyBMqcV8uLx44P+kZucpBKrEEF/0I9/zoJkqh2hta
	 G7uTaJL/kTCGU9Rr/83THPil9/yCA04vGM+j2eGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C32C6F804FA;
	Sun, 24 Jan 2021 17:54:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C67FF804FD; Sun, 24 Jan 2021 17:54:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 132D4F804FB
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 17:54:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 132D4F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="r21UG6M/"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id A3DDFA146E;
 Sun, 24 Jan 2021 17:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=VOjdMlszU3u7
 iXPzdQ1k8GoYyH1Sujlr//n1EymoP+8=; b=r21UG6M/H9rUafvy/q+F33avwnKP
 7FSRx4IR2RjdwacLomKOh1J88GOsGOYiCUTKy9ypDP6CQsy28VkLsao4ADMIkddQ
 +jTlpK8JKoDFf91AOft6iI6p9mmbkEVpyaFWN/AtEZsbXLiJvG96DuWtTGF3vk6B
 xXYjjgpZ10fj07tsxIG4OD1r+FJjSs0bCaxyFTxkb/oWFDm9DzN2v6bghE5jNHLp
 YJDbZegXFZSFTbUuSPjDHGxIn+p9UUD2p47CYGe4+Ou4Ud/YkBfQwu+/mW6ks/l3
 Z1KDQzZpU2U99iGSTDRIAaiMVLMQT+YOp9FOpnCKtzicvULdeoxXVIAjRA==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v2 5/9] ALSA: virtio: handling control and I/O messages for
 the PCM device
Date: Sun, 24 Jan 2021 17:54:04 +0100
Message-ID: <20210124165408.1122868-6-anton.yakovlev@opensynergy.com>
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

The driver implements a message-based transport for I/O substream
operations. Before the start of the substream, the hardware buffer is
sliced into I/O messages, the number of which is equal to the current
number of periods. The size of each message is equal to the current
size of one period.

I/O messages are organized in an ordered queue. The completion of the
I/O message indicates an elapsed period (the only exception is the end
of the stream for the capture substream). Upon completion, the message
is automatically re-added to the end of the queue.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile         |   3 +-
 sound/virtio/virtio_card.c    |  10 ++
 sound/virtio/virtio_card.h    |   9 +
 sound/virtio/virtio_pcm.c     |   3 +
 sound/virtio/virtio_pcm.h     |  31 ++++
 sound/virtio/virtio_pcm_msg.c | 325 ++++++++++++++++++++++++++++++++++
 6 files changed, 380 insertions(+), 1 deletion(-)
 create mode 100644 sound/virtio/virtio_pcm_msg.c

diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index 69162a545a41..626af3cc3ed7 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -5,5 +5,6 @@ obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
 virtio_snd-objs := \
 	virtio_card.o \
 	virtio_ctl_msg.o \
-	virtio_pcm.o
+	virtio_pcm.o \
+	virtio_pcm_msg.o
 
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 39fe13b43dd1..11d025ee77c2 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -143,6 +143,12 @@ static int virtsnd_find_vqs(struct virtio_snd *snd)
 	callbacks[VIRTIO_SND_VQ_CONTROL] = virtsnd_ctl_notify_cb;
 	callbacks[VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb;
 
+	virtio_cread(vdev, struct virtio_snd_config, streams, &n);
+	if (n) {
+		callbacks[VIRTIO_SND_VQ_TX] = virtsnd_pcm_tx_notify_cb;
+		callbacks[VIRTIO_SND_VQ_RX] = virtsnd_pcm_rx_notify_cb;
+	}
+
 	rc = virtio_find_vqs(vdev, VIRTIO_SND_VQ_MAX, vqs, callbacks, names,
 			     NULL);
 	if (rc) {
@@ -177,6 +183,10 @@ static int virtsnd_find_vqs(struct virtio_snd *snd)
  * virtsnd_enable_event_vq() - Enable the event virtqueue.
  * @snd: VirtIO sound device.
  *
+ * The tx queue is enabled only if the device supports playback stream(s).
+ *
+ * The rx queue is enabled only if the device supports capture stream(s).
+ *
  * Context: Any context.
  */
 static void virtsnd_enable_event_vq(struct virtio_snd *snd)
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index be6651a6aaf8..b11c09984882 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -89,4 +89,13 @@ virtsnd_rx_queue(struct virtio_snd *snd)
 	return &snd->queues[VIRTIO_SND_VQ_RX];
 }
 
+static inline struct virtio_snd_queue *
+virtsnd_pcm_queue(struct virtio_pcm_substream *substream)
+{
+	if (substream->direction == SNDRV_PCM_STREAM_PLAYBACK)
+		return virtsnd_tx_queue(substream->snd);
+	else
+		return virtsnd_rx_queue(substream->snd);
+}
+
 #endif /* VIRTIO_SND_CARD_H */
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index 036990b7b78a..1ab50dcc88c8 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -376,6 +376,7 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd)
 
 		substream->snd = snd;
 		substream->sid = i;
+		init_waitqueue_head(&substream->msg_empty);
 
 		rc = virtsnd_pcm_build_hw(substream, &info[i]);
 		if (rc)
@@ -530,6 +531,8 @@ void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
 		break;
 	}
 	case VIRTIO_SND_EVT_PCM_XRUN: {
+		if (atomic_read(&substream->xfer_enabled))
+			atomic_set(&substream->xfer_xrun, 1);
 		break;
 	}
 	}
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 73fb4d9dc524..d011b7e1d18d 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -24,6 +24,7 @@
 #include <sound/pcm.h>
 
 struct virtio_pcm;
+struct virtio_pcm_msg;
 
 /**
  * struct virtio_pcm_substream - VirtIO PCM substream.
@@ -34,6 +35,16 @@ struct virtio_pcm;
  * @features: Stream VirtIO feature bit map (1 << VIRTIO_SND_PCM_F_XXX).
  * @substream: Kernel ALSA substream.
  * @hw: Kernel ALSA substream hardware descriptor.
+ * @frame_bytes: Current frame size in bytes.
+ * @period_size: Current period size in frames.
+ * @buffer_size: Current buffer size in frames.
+ * @hw_ptr: Substream hardware pointer value in frames [0 ... buffer_size).
+ * @xfer_enabled: Data transfer state (0 - off, 1 - on).
+ * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
+ * @msgs: I/O messages.
+ * @msg_last_enqueued: Index of the last I/O message added to the virtqueue.
+ * @msg_count: Number of pending I/O messages in the virtqueue.
+ * @msg_empty: Notify when msg_count is zero.
  */
 struct virtio_pcm_substream {
 	struct virtio_snd *snd;
@@ -43,6 +54,16 @@ struct virtio_pcm_substream {
 	u32 features;
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_hardware hw;
+	unsigned int frame_bytes;
+	snd_pcm_uframes_t period_size;
+	snd_pcm_uframes_t buffer_size;
+	atomic_t hw_ptr;
+	atomic_t xfer_enabled;
+	atomic_t xfer_xrun;
+	struct virtio_pcm_msg *msgs;
+	int msg_last_enqueued;
+	atomic_t msg_count;
+	wait_queue_head_t msg_empty;
 };
 
 /**
@@ -86,4 +107,14 @@ struct virtio_pcm *virtsnd_pcm_find(struct virtio_snd *snd, unsigned int nid);
 struct virtio_pcm *virtsnd_pcm_find_or_create(struct virtio_snd *snd,
 					      unsigned int nid);
 
+struct virtio_snd_msg *
+virtsnd_pcm_ctl_msg_alloc(struct virtio_pcm_substream *substream,
+			  unsigned int command, gfp_t gfp);
+
+int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *substream,
+			  unsigned int nmsg, u8 *dma_area,
+			  unsigned int period_bytes);
+
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *substream);
+
 #endif /* VIRTIO_SND_PCM_H */
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
new file mode 100644
index 000000000000..d524e7cbe43f
--- /dev/null
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Sound card driver for virtio
+ * Copyright (C) 2020  OpenSynergy GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include <sound/pcm_params.h>
+
+#include "virtio_card.h"
+
+/**
+ * enum pcm_msg_sg_index - Scatter-gather element indexes for an I/O message.
+ * @PCM_MSG_SG_XFER: Element containing a virtio_snd_pcm_xfer structure.
+ * @PCM_MSG_SG_DATA: Element containing a data buffer.
+ * @PCM_MSG_SG_STATUS: Element containing a virtio_snd_pcm_status structure.
+ * @PCM_MSG_SG_MAX: The maximum number of elements in the scatter-gather table.
+ *
+ * These values are used as the index of the payload scatter-gather table.
+ */
+enum pcm_msg_sg_index {
+	PCM_MSG_SG_XFER = 0,
+	PCM_MSG_SG_DATA,
+	PCM_MSG_SG_STATUS,
+	PCM_MSG_SG_MAX
+};
+
+/**
+ * struct virtio_pcm_msg - VirtIO I/O message.
+ * @substream: VirtIO PCM substream.
+ * @xfer: Request header payload.
+ * @status: Response header payload.
+ * @sgs: Payload scatter-gather table.
+ */
+struct virtio_pcm_msg {
+	struct virtio_pcm_substream *substream;
+	struct virtio_snd_pcm_xfer xfer;
+	struct virtio_snd_pcm_status status;
+	struct scatterlist sgs[PCM_MSG_SG_MAX];
+};
+
+/**
+ * virtsnd_pcm_msg_alloc() - Allocate I/O messages.
+ * @substream: VirtIO PCM substream.
+ * @nmsg: Number of messages (equal to the number of periods).
+ * @dma_area: Pointer to used audio buffer.
+ * @period_bytes: Period (message payload) size.
+ *
+ * The function slices the buffer into nmsg parts (each with the size of
+ * period_bytes), and creates nmsg corresponding I/O messages.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -ENOMEM on failure.
+ */
+int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *substream,
+			  unsigned int nmsg, u8 *dma_area,
+			  unsigned int period_bytes)
+{
+	struct virtio_device *vdev = substream->snd->vdev;
+	unsigned int i;
+
+	if (substream->msgs)
+		devm_kfree(&vdev->dev, substream->msgs);
+
+	substream->msgs = devm_kcalloc(&vdev->dev, nmsg,
+				       sizeof(*substream->msgs), GFP_KERNEL);
+	if (!substream->msgs)
+		return -ENOMEM;
+
+	for (i = 0; i < nmsg; ++i) {
+		struct virtio_pcm_msg *msg = &substream->msgs[i];
+
+		msg->substream = substream;
+
+		sg_init_table(msg->sgs, PCM_MSG_SG_MAX);
+		sg_init_one(&msg->sgs[PCM_MSG_SG_XFER], &msg->xfer,
+			    sizeof(msg->xfer));
+		sg_init_one(&msg->sgs[PCM_MSG_SG_DATA],
+			    dma_area + period_bytes * i, period_bytes);
+		sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
+			    sizeof(msg->status));
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
+ * @substream: VirtIO PCM substream.
+ *
+ * All messages are organized in an ordered circular list. Each time the
+ * function is called, all currently non-enqueued messages are added to the
+ * virtqueue. For this, the function keeps track of two values:
+ *
+ *   msg_last_enqueued = index of the last enqueued message,
+ *   msg_count = # of pending messages in the virtqueue.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -EIO on failure.
+ */
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->substream->runtime;
+	struct virtio_snd *snd = substream->snd;
+	struct virtio_device *vdev = snd->vdev;
+	struct virtqueue *vqueue = virtsnd_pcm_queue(substream)->vqueue;
+	int i;
+	int n;
+	bool notify = false;
+
+	if (!vqueue)
+		return -EIO;
+
+	i = (substream->msg_last_enqueued + 1) % runtime->periods;
+	n = runtime->periods - atomic_read(&substream->msg_count);
+
+	for (; n; --n, i = (i + 1) % runtime->periods) {
+		struct virtio_pcm_msg *msg = &substream->msgs[i];
+		struct scatterlist *psgs[PCM_MSG_SG_MAX] = {
+			[PCM_MSG_SG_XFER] = &msg->sgs[PCM_MSG_SG_XFER],
+			[PCM_MSG_SG_DATA] = &msg->sgs[PCM_MSG_SG_DATA],
+			[PCM_MSG_SG_STATUS] = &msg->sgs[PCM_MSG_SG_STATUS]
+		};
+		int rc;
+
+		msg->xfer.stream_id = cpu_to_virtio32(vdev, substream->sid);
+		memset(&msg->status, 0, sizeof(msg->status));
+
+		atomic_inc(&substream->msg_count);
+
+		if (substream->direction == SNDRV_PCM_STREAM_PLAYBACK)
+			rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
+					       GFP_ATOMIC);
+		else
+			rc = virtqueue_add_sgs(vqueue, psgs, 1, 2, msg,
+					       GFP_ATOMIC);
+
+		if (rc) {
+			atomic_dec(&substream->msg_count);
+			return -EIO;
+		}
+
+		substream->msg_last_enqueued = i;
+	}
+
+	if (!(substream->features & (1U << VIRTIO_SND_PCM_F_MSG_POLLING)))
+		notify = virtqueue_kick_prepare(vqueue);
+
+	if (notify)
+		if (!virtqueue_notify(vqueue))
+			return -EIO;
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_msg_complete() - Complete an I/O message.
+ * @msg: I/O message.
+ * @size: Number of bytes written.
+ *
+ * Completion of the message means the elapsed period.
+ *
+ * The interrupt handler modifies three fields of the substream structure
+ * (hw_ptr, xfer_xrun, msg_count) that are used in operator functions. These
+ * values are atomic to avoid frequent interlocks with the interrupt handler.
+ * This becomes especially important in the case of multiple running substreams
+ * that share both the virtqueue and interrupt handler.
+ *
+ * Context: Interrupt context.
+ */
+static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg, size_t size)
+{
+	struct virtio_pcm_substream *substream = msg->substream;
+	snd_pcm_uframes_t hw_ptr;
+	unsigned int msg_count;
+
+	/*
+	 * hw_ptr always indicates the buffer position of the first I/O message
+	 * in the virtqueue. Therefore, on each completion of an I/O message,
+	 * the hw_ptr value is unconditionally advanced.
+	 */
+	hw_ptr = (snd_pcm_uframes_t)atomic_read(&substream->hw_ptr);
+
+	/*
+	 * If the capture substream returned an incorrect status, then just
+	 * increase the hw_ptr by the period size.
+	 */
+	if (substream->direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	    size <= sizeof(msg->status)) {
+		hw_ptr += substream->period_size;
+	} else {
+		size -= sizeof(msg->status);
+		hw_ptr += size / substream->frame_bytes;
+	}
+
+	atomic_set(&substream->hw_ptr, (u32)(hw_ptr % substream->buffer_size));
+	atomic_set(&substream->xfer_xrun, 0);
+
+	msg_count = atomic_dec_return(&substream->msg_count);
+
+	if (atomic_read(&substream->xfer_enabled)) {
+		struct snd_pcm_runtime *runtime = substream->substream->runtime;
+
+		runtime->delay =
+			bytes_to_frames(runtime,
+					le32_to_cpu(msg->status.latency_bytes));
+
+		snd_pcm_period_elapsed(substream->substream);
+
+		virtsnd_pcm_msg_send(substream);
+	} else if (!msg_count) {
+		wake_up_all(&substream->msg_empty);
+	}
+}
+
+/**
+ * virtsnd_pcm_notify_cb() - Process all completed I/O messages.
+ * @vqueue: Underlying tx/rx virtqueue.
+ *
+ * If transmission is allowed, then each completed message is immediately placed
+ * back at the end of the queue.
+ *
+ * Context: Interrupt context. Takes and releases the tx/rx queue spinlock.
+ */
+static inline void virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	while (queue->vqueue) {
+		virtqueue_disable_cb(queue->vqueue);
+
+		for (;;) {
+			struct virtio_pcm_msg *msg;
+			u32 length;
+
+			msg = virtqueue_get_buf(queue->vqueue, &length);
+			if (!msg)
+				break;
+
+			virtsnd_pcm_msg_complete(msg, length);
+		}
+
+		if (unlikely(virtqueue_is_broken(queue->vqueue)))
+			break;
+
+		if (virtqueue_enable_cb(queue->vqueue))
+			break;
+	}
+	spin_unlock_irqrestore(&queue->lock, flags);
+}
+
+/**
+ * virtsnd_pcm_tx_notify_cb() - Process all completed TX messages.
+ * @vqueue: Underlying tx virtqueue.
+ *
+ * Context: Interrupt context.
+ */
+void virtsnd_pcm_tx_notify_cb(struct virtqueue *vqueue)
+{
+	struct virtio_snd *snd = vqueue->vdev->priv;
+
+	virtsnd_pcm_notify_cb(virtsnd_tx_queue(snd));
+}
+
+/**
+ * virtsnd_pcm_rx_notify_cb() - Process all completed RX messages.
+ * @vqueue: Underlying rx virtqueue.
+ *
+ * Context: Interrupt context.
+ */
+void virtsnd_pcm_rx_notify_cb(struct virtqueue *vqueue)
+{
+	struct virtio_snd *snd = vqueue->vdev->priv;
+
+	virtsnd_pcm_notify_cb(virtsnd_rx_queue(snd));
+}
+
+/**
+ * virtsnd_pcm_ctl_msg_alloc() - Allocate and initialize the PCM device control
+ *                               message for the specified substream.
+ * @substream: VirtIO PCM substream.
+ * @command: Control request code (VIRTIO_SND_R_PCM_XXX).
+ * @gfp: Kernel flags for memory allocation.
+ *
+ * Context: Any context. May sleep if @gfp flags permit.
+ * Return: Allocated message on success, ERR_PTR(-errno) on failure.
+ */
+struct virtio_snd_msg *
+virtsnd_pcm_ctl_msg_alloc(struct virtio_pcm_substream *substream,
+			  unsigned int command, gfp_t gfp)
+{
+	struct virtio_device *vdev = substream->snd->vdev;
+	size_t request_size = sizeof(struct virtio_snd_pcm_hdr);
+	size_t response_size = sizeof(struct virtio_snd_hdr);
+	struct virtio_snd_msg *msg;
+
+	switch (command) {
+	case VIRTIO_SND_R_PCM_SET_PARAMS: {
+		request_size = sizeof(struct virtio_snd_pcm_set_params);
+		break;
+	}
+	}
+
+	msg = virtsnd_ctl_msg_alloc(vdev, request_size, response_size, gfp);
+	if (!IS_ERR(msg)) {
+		struct virtio_snd_pcm_hdr *hdr = sg_virt(&msg->sg_request);
+
+		hdr->hdr.code = cpu_to_virtio32(vdev, command);
+		hdr->stream_id = cpu_to_virtio32(vdev, substream->sid);
+	}
+
+	return msg;
+}
-- 
2.30.0



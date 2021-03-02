Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF4332A6B5
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 17:50:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A091789;
	Tue,  2 Mar 2021 17:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A091789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614703855;
	bh=8pHQORYHRb4Wb5l7Pe8mm51txX/H3/cHuW0YHTsn6+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pexVr1jk/Un2elGyYSLLjMjkd+xirlYGzMWMzNLXJwG82Bnfw39m4Mcacc+2S8nAV
	 UybL80alTGSQva9RO2CFLjyzhg2Xev8hWpFJlipYWM6zZevDXaUowBhR6K5X2EWNVt
	 qQtHh10u81GZegneuwk0eSiNfhpoVAKJetqp086U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D113F804AE;
	Tue,  2 Mar 2021 17:47:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02379F80482; Tue,  2 Mar 2021 17:47:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 220D5F802E7
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 17:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 220D5F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="iNLdmknl"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id B174BA17B5;
 Tue,  2 Mar 2021 17:47:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=Ur1JH1rykS6t
 nRYeaMZNcWrOf6YAKNCeMXYHMjjYm0s=; b=iNLdmknl01oUAiXjYbvfNA9ajZeI
 1ZqOmz8SQLZXd6eycHQM1BEqGzu3rZWSNmrePiE6OJt9JXKZo3I7xei4klV+nUiV
 cxctpmjiDhM57c1jeZCauWc7ZtorSymxaYwAMSC1sHN6ryV67MbBNaShFDhl52yl
 C/Db4QvFxOObzlpGEZsXNVBZcumw5rwHnTj4son3e6zEls0BDg+qb3/2n8EWutu8
 OOTvdGO492T5WomCF6KJO8gHsrr4aQrFUxdI5ThdApKdld6iWIJCySDuFzux0iyy
 1ocFPd6kc8MlwTDCrwnLsJ3j6Sp3CQuMZqIgCiLisT9IIXMrrMWz/5XLOQ==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v7 5/9] ALSA: virtio: handling control and I/O messages for
 the PCM device
Date: Tue, 2 Mar 2021 17:47:05 +0100
Message-ID: <20210302164709.3142702-6-anton.yakovlev@opensynergy.com>
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
 sound/virtio/virtio_card.c    |  22 +-
 sound/virtio/virtio_card.h    |   9 +
 sound/virtio/virtio_pcm.c     |  32 +++
 sound/virtio/virtio_pcm.h     |  40 ++++
 sound/virtio/virtio_pcm_msg.c | 414 ++++++++++++++++++++++++++++++++++
 6 files changed, 515 insertions(+), 5 deletions(-)
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
index 11c76ee311b7..57b9b7f3a9c0 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -55,6 +55,12 @@ static void virtsnd_event_send(struct virtqueue *vqueue,
 static void virtsnd_event_dispatch(struct virtio_snd *snd,
 				   struct virtio_snd_event *event)
 {
+	switch (le32_to_cpu(event->hdr.code)) {
+	case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED:
+	case VIRTIO_SND_EVT_PCM_XRUN:
+		virtsnd_pcm_event(snd, event);
+		break;
+	}
 }
 
 /**
@@ -101,11 +107,15 @@ static int virtsnd_find_vqs(struct virtio_snd *snd)
 	struct virtio_device *vdev = snd->vdev;
 	static vq_callback_t *callbacks[VIRTIO_SND_VQ_MAX] = {
 		[VIRTIO_SND_VQ_CONTROL] = virtsnd_ctl_notify_cb,
-		[VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb
+		[VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb,
+		[VIRTIO_SND_VQ_TX] = virtsnd_pcm_tx_notify_cb,
+		[VIRTIO_SND_VQ_RX] = virtsnd_pcm_rx_notify_cb
 	};
 	static const char *names[VIRTIO_SND_VQ_MAX] = {
 		[VIRTIO_SND_VQ_CONTROL] = "virtsnd-ctl",
-		[VIRTIO_SND_VQ_EVENT] = "virtsnd-event"
+		[VIRTIO_SND_VQ_EVENT] = "virtsnd-event",
+		[VIRTIO_SND_VQ_TX] = "virtsnd-tx",
+		[VIRTIO_SND_VQ_RX] = "virtsnd-rx"
 	};
 	struct virtqueue *vqs[VIRTIO_SND_VQ_MAX] = { 0 };
 	unsigned int i;
@@ -318,8 +328,12 @@ static void virtsnd_remove(struct virtio_device *vdev)
 	vdev->config->del_vqs(vdev);
 	vdev->config->reset(vdev);
 
-	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i)
-		cancel_work_sync(&snd->substreams[i].elapsed_period);
+	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i) {
+		struct virtio_pcm_substream *vss = &snd->substreams[i];
+
+		cancel_work_sync(&vss->elapsed_period);
+		virtsnd_pcm_msg_free(vss);
+	}
 
 	kfree(snd->event_msgs);
 }
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index 77a1b7255370..c43f9744d362 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -79,4 +79,13 @@ virtsnd_rx_queue(struct virtio_snd *snd)
 	return &snd->queues[VIRTIO_SND_VQ_RX];
 }
 
+static inline struct virtio_snd_queue *
+virtsnd_pcm_queue(struct virtio_pcm_substream *vss)
+{
+	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+		return virtsnd_tx_queue(vss->snd);
+	else
+		return virtsnd_rx_queue(vss->snd);
+}
+
 #endif /* VIRTIO_SND_CARD_H */
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index e16567e2e214..2dcd763efa29 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -353,6 +353,8 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd)
 		vss->snd = snd;
 		vss->sid = i;
 		INIT_WORK(&vss->elapsed_period, virtsnd_pcm_period_elapsed);
+		init_waitqueue_head(&vss->msg_empty);
+		spin_lock_init(&vss->lock);
 
 		rc = virtsnd_pcm_build_hw(vss, &info[i]);
 		if (rc)
@@ -477,3 +479,33 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
 
 	return 0;
 }
+
+/**
+ * virtsnd_pcm_event() - Handle the PCM device event notification.
+ * @snd: VirtIO sound device.
+ * @event: VirtIO sound event.
+ *
+ * Context: Interrupt context.
+ */
+void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
+{
+	struct virtio_pcm_substream *vss;
+	u32 sid = le32_to_cpu(event->data);
+
+	if (sid >= snd->nsubstreams)
+		return;
+
+	vss = &snd->substreams[sid];
+
+	switch (le32_to_cpu(event->hdr.code)) {
+	case VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED:
+		/* TODO: deal with shmem elapsed period */
+		break;
+	case VIRTIO_SND_EVT_PCM_XRUN:
+		spin_lock(&vss->lock);
+		if (vss->xfer_enabled)
+			vss->xfer_xrun = true;
+		spin_unlock(&vss->lock);
+		break;
+	}
+}
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 84f2f3f14f48..6722f1139666 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -23,6 +23,17 @@ struct virtio_pcm_msg;
  * @substream: Kernel ALSA substream.
  * @hw: Kernel ALSA substream hardware descriptor.
  * @elapsed_period: Kernel work to handle the elapsed period state.
+ * @lock: Spinlock that protects fields shared by interrupt handlers and
+ *        substream operators.
+ * @buffer_bytes: Current buffer size in bytes.
+ * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
+ * @xfer_enabled: Data transfer state (0 - off, 1 - on).
+ * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
+ * @msgs: Allocated I/O messages.
+ * @nmsgs: Number of allocated I/O messages.
+ * @msg_last_enqueued: Index of the last I/O message added to the virtqueue.
+ * @msg_count: Number of pending I/O messages in the virtqueue.
+ * @msg_empty: Notify when msg_count is zero.
  */
 struct virtio_pcm_substream {
 	struct virtio_snd *snd;
@@ -33,6 +44,16 @@ struct virtio_pcm_substream {
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_hardware hw;
 	struct work_struct elapsed_period;
+	spinlock_t lock;
+	size_t buffer_bytes;
+	size_t hw_ptr;
+	bool xfer_enabled;
+	bool xfer_xrun;
+	struct virtio_pcm_msg **msgs;
+	unsigned int nmsgs;
+	int msg_last_enqueued;
+	unsigned int msg_count;
+	wait_queue_head_t msg_empty;
 };
 
 /**
@@ -65,8 +86,27 @@ int virtsnd_pcm_parse_cfg(struct virtio_snd *snd);
 
 int virtsnd_pcm_build_devs(struct virtio_snd *snd);
 
+void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event);
+
+void virtsnd_pcm_tx_notify_cb(struct virtqueue *vqueue);
+
+void virtsnd_pcm_rx_notify_cb(struct virtqueue *vqueue);
+
 struct virtio_pcm *virtsnd_pcm_find(struct virtio_snd *snd, u32 nid);
 
 struct virtio_pcm *virtsnd_pcm_find_or_create(struct virtio_snd *snd, u32 nid);
 
+struct virtio_snd_msg *
+virtsnd_pcm_ctl_msg_alloc(struct virtio_pcm_substream *vss,
+			  unsigned int command, gfp_t gfp);
+
+int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
+			  unsigned int periods, unsigned int period_bytes);
+
+void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
+
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss);
+
+unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss);
+
 #endif /* VIRTIO_SND_PCM_H */
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
new file mode 100644
index 000000000000..f88c8f29cbd8
--- /dev/null
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -0,0 +1,414 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#include <sound/pcm_params.h>
+
+#include "virtio_card.h"
+
+/**
+ * struct virtio_pcm_msg - VirtIO I/O message.
+ * @substream: VirtIO PCM substream.
+ * @xfer: Request header payload.
+ * @status: Response header payload.
+ * @length: Data length in bytes.
+ * @sgs: Payload scatter-gather table.
+ */
+struct virtio_pcm_msg {
+	struct virtio_pcm_substream *substream;
+	struct virtio_snd_pcm_xfer xfer;
+	struct virtio_snd_pcm_status status;
+	size_t length;
+	struct scatterlist sgs[0];
+};
+
+/**
+ * enum pcm_msg_sg_index - Index values for the virtio_pcm_msg->sgs field in
+ *                         an I/O message.
+ * @PCM_MSG_SG_XFER: Element containing a virtio_snd_pcm_xfer structure.
+ * @PCM_MSG_SG_STATUS: Element containing a virtio_snd_pcm_status structure.
+ * @PCM_MSG_SG_DATA: The first element containing a data buffer.
+ */
+enum pcm_msg_sg_index {
+	PCM_MSG_SG_XFER = 0,
+	PCM_MSG_SG_STATUS,
+	PCM_MSG_SG_DATA
+};
+
+/**
+ * virtsnd_pcm_sg_num() - Count the number of sg-elements required to represent
+ *                        vmalloc'ed buffer.
+ * @data: Pointer to vmalloc'ed buffer.
+ * @length: Buffer size.
+ *
+ * Context: Any context.
+ * Return: Number of physically contiguous parts in the @data.
+ */
+static int virtsnd_pcm_sg_num(u8 *data, unsigned int length)
+{
+	phys_addr_t sg_address;
+	unsigned int sg_length;
+	int num = 0;
+
+	while (length) {
+		struct page *pg = vmalloc_to_page(data);
+		phys_addr_t pg_address = page_to_phys(pg);
+		size_t pg_length;
+
+		pg_length = PAGE_SIZE - offset_in_page(data);
+		if (pg_length > length)
+			pg_length = length;
+
+		if (!num || sg_address + sg_length != pg_address) {
+			sg_address = pg_address;
+			sg_length = pg_length;
+			num++;
+		} else {
+			sg_length += pg_length;
+		}
+
+		data += pg_length;
+		length -= pg_length;
+	}
+
+	return num;
+}
+
+/**
+ * virtsnd_pcm_sg_from() - Build sg-list from vmalloc'ed buffer.
+ * @sgs: Preallocated sg-list to populate.
+ * @nsgs: The maximum number of elements in the @sgs.
+ * @data: Pointer to vmalloc'ed buffer.
+ * @length: Buffer size.
+ *
+ * Splits the buffer into physically contiguous parts and makes an sg-list of
+ * such parts.
+ *
+ * Context: Any context.
+ */
+static void virtsnd_pcm_sg_from(struct scatterlist *sgs, int nsgs, u8 *data,
+				unsigned int length)
+{
+	int idx = -1;
+
+	while (length) {
+		struct page *pg = vmalloc_to_page(data);
+		size_t pg_length;
+
+		pg_length = PAGE_SIZE - offset_in_page(data);
+		if (pg_length > length)
+			pg_length = length;
+
+		if (idx == -1 ||
+		    sg_phys(&sgs[idx]) + sgs[idx].length != page_to_phys(pg)) {
+			if (idx + 1 == nsgs)
+				break;
+			sg_set_page(&sgs[++idx], pg, pg_length,
+				    offset_in_page(data));
+		} else {
+			sgs[idx].length += pg_length;
+		}
+
+		data += pg_length;
+		length -= pg_length;
+	}
+
+	sg_mark_end(&sgs[idx]);
+}
+
+/**
+ * virtsnd_pcm_msg_alloc() - Allocate I/O messages.
+ * @vss: VirtIO PCM substream.
+ * @periods: Current number of periods.
+ * @period_bytes: Current period size in bytes.
+ *
+ * The function slices the buffer into @periods parts (each with the size of
+ * @period_bytes), and creates @periods corresponding I/O messages.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -ENOMEM on failure.
+ */
+int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
+			  unsigned int periods, unsigned int period_bytes)
+{
+	struct snd_pcm_runtime *runtime = vss->substream->runtime;
+	unsigned int i;
+
+	vss->msgs = kcalloc(periods, sizeof(*vss->msgs), GFP_KERNEL);
+	if (!vss->msgs)
+		return -ENOMEM;
+
+	vss->nmsgs = periods;
+
+	for (i = 0; i < periods; ++i) {
+		u8 *data = runtime->dma_area + period_bytes * i;
+		int sg_num = virtsnd_pcm_sg_num(data, period_bytes);
+		struct virtio_pcm_msg *msg;
+
+		msg = kzalloc(sizeof(*msg) + sizeof(*msg->sgs) * (sg_num + 2),
+			      GFP_KERNEL);
+		if (!msg)
+			return -ENOMEM;
+
+		msg->substream = vss;
+		sg_init_one(&msg->sgs[PCM_MSG_SG_XFER], &msg->xfer,
+			    sizeof(msg->xfer));
+		sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
+			    sizeof(msg->status));
+		msg->length = period_bytes;
+		virtsnd_pcm_sg_from(&msg->sgs[PCM_MSG_SG_DATA], sg_num, data,
+				    period_bytes);
+
+		vss->msgs[i] = msg;
+	}
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_msg_free() - Free all allocated I/O messages.
+ * @vss: VirtIO PCM substream.
+ *
+ * Context: Any context.
+ */
+void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
+{
+	unsigned int i;
+
+	for (i = 0; vss->msgs && i < vss->nmsgs; ++i)
+		kfree(vss->msgs[i]);
+	kfree(vss->msgs);
+
+	vss->msgs = NULL;
+	vss->nmsgs = 0;
+}
+
+/**
+ * virtsnd_pcm_msg_send() - Send asynchronous I/O messages.
+ * @vss: VirtIO PCM substream.
+ *
+ * All messages are organized in an ordered circular list. Each time the
+ * function is called, all currently non-enqueued messages are added to the
+ * virtqueue. For this, the function keeps track of two values:
+ *
+ *   msg_last_enqueued = index of the last enqueued message,
+ *   msg_count = # of pending messages in the virtqueue.
+ *
+ * Context: Any context. Expects the tx/rx queue and the VirtIO substream
+ *          spinlocks to be held by caller.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
+{
+	struct snd_pcm_runtime *runtime = vss->substream->runtime;
+	struct virtio_snd *snd = vss->snd;
+	struct virtio_device *vdev = snd->vdev;
+	struct virtqueue *vqueue = virtsnd_pcm_queue(vss)->vqueue;
+	int i;
+	int n;
+	bool notify = false;
+
+	i = (vss->msg_last_enqueued + 1) % runtime->periods;
+	n = runtime->periods - vss->msg_count;
+
+	for (; n; --n, i = (i + 1) % runtime->periods) {
+		struct virtio_pcm_msg *msg = vss->msgs[i];
+		struct scatterlist *psgs[] = {
+			&msg->sgs[PCM_MSG_SG_XFER],
+			&msg->sgs[PCM_MSG_SG_DATA],
+			&msg->sgs[PCM_MSG_SG_STATUS]
+		};
+		int rc;
+
+		msg->xfer.stream_id = cpu_to_le32(vss->sid);
+		memset(&msg->status, 0, sizeof(msg->status));
+
+		if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+			rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
+					       GFP_ATOMIC);
+		else
+			rc = virtqueue_add_sgs(vqueue, psgs, 1, 2, msg,
+					       GFP_ATOMIC);
+
+		if (rc) {
+			dev_err(&vdev->dev,
+				"SID %u: failed to send I/O message\n",
+				vss->sid);
+			return rc;
+		}
+
+		vss->msg_last_enqueued = i;
+		vss->msg_count++;
+	}
+
+	if (!(vss->features & (1U << VIRTIO_SND_PCM_F_MSG_POLLING)))
+		notify = virtqueue_kick_prepare(vqueue);
+
+	if (notify)
+		virtqueue_notify(vqueue);
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_msg_pending_num() - Returns the number of pending I/O messages.
+ * @vss: VirtIO substream.
+ *
+ * Context: Any context.
+ * Return: Number of messages.
+ */
+unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss)
+{
+	unsigned int num;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vss->lock, flags);
+	num = vss->msg_count;
+	spin_unlock_irqrestore(&vss->lock, flags);
+
+	return num;
+}
+
+/**
+ * virtsnd_pcm_msg_complete() - Complete an I/O message.
+ * @msg: I/O message.
+ * @written_bytes: Number of bytes written to the message.
+ *
+ * Completion of the message means the elapsed period. If transmission is
+ * allowed, then each completed message is immediately placed back at the end
+ * of the queue.
+ *
+ * For the playback substream, @written_bytes is equal to sizeof(msg->status).
+ *
+ * For the capture substream, @written_bytes is equal to sizeof(msg->status)
+ * plus the number of captured bytes.
+ *
+ * Context: Interrupt context. Takes and releases the VirtIO substream spinlock.
+ */
+static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
+				     size_t written_bytes)
+{
+	struct virtio_pcm_substream *vss = msg->substream;
+
+	/*
+	 * hw_ptr always indicates the buffer position of the first I/O message
+	 * in the virtqueue. Therefore, on each completion of an I/O message,
+	 * the hw_ptr value is unconditionally advanced.
+	 */
+	spin_lock(&vss->lock);
+	/*
+	 * If the capture substream returned an incorrect status, then just
+	 * increase the hw_ptr by the message size.
+	 */
+	if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	    written_bytes <= sizeof(msg->status))
+		vss->hw_ptr += msg->length;
+	else
+		vss->hw_ptr += written_bytes - sizeof(msg->status);
+
+	if (vss->hw_ptr >= vss->buffer_bytes)
+		vss->hw_ptr -= vss->buffer_bytes;
+
+	vss->xfer_xrun = false;
+	vss->msg_count--;
+
+	if (vss->xfer_enabled) {
+		struct snd_pcm_runtime *runtime = vss->substream->runtime;
+
+		runtime->delay =
+			bytes_to_frames(runtime,
+					le32_to_cpu(msg->status.latency_bytes));
+
+		schedule_work(&vss->elapsed_period);
+
+		virtsnd_pcm_msg_send(vss);
+	} else if (!vss->msg_count) {
+		wake_up_all(&vss->msg_empty);
+	}
+	spin_unlock(&vss->lock);
+}
+
+/**
+ * virtsnd_pcm_notify_cb() - Process all completed I/O messages.
+ * @queue: Underlying tx/rx virtqueue.
+ *
+ * Context: Interrupt context. Takes and releases the tx/rx queue spinlock.
+ */
+static inline void virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue)
+{
+	struct virtio_pcm_msg *msg;
+	u32 written_bytes;
+	unsigned long flags;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	do {
+		virtqueue_disable_cb(queue->vqueue);
+		while ((msg = virtqueue_get_buf(queue->vqueue, &written_bytes)))
+			virtsnd_pcm_msg_complete(msg, written_bytes);
+		if (unlikely(virtqueue_is_broken(queue->vqueue)))
+			break;
+	} while (!virtqueue_enable_cb(queue->vqueue));
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
+ * @vss: VirtIO PCM substream.
+ * @command: Control request code (VIRTIO_SND_R_PCM_XXX).
+ * @gfp: Kernel flags for memory allocation.
+ *
+ * Context: Any context. May sleep if @gfp flags permit.
+ * Return: Allocated message on success, NULL on failure.
+ */
+struct virtio_snd_msg *
+virtsnd_pcm_ctl_msg_alloc(struct virtio_pcm_substream *vss,
+			  unsigned int command, gfp_t gfp)
+{
+	size_t request_size = sizeof(struct virtio_snd_pcm_hdr);
+	size_t response_size = sizeof(struct virtio_snd_hdr);
+	struct virtio_snd_msg *msg;
+
+	switch (command) {
+	case VIRTIO_SND_R_PCM_SET_PARAMS:
+		request_size = sizeof(struct virtio_snd_pcm_set_params);
+		break;
+	}
+
+	msg = virtsnd_ctl_msg_alloc(request_size, response_size, gfp);
+	if (msg) {
+		struct virtio_snd_pcm_hdr *hdr = virtsnd_ctl_msg_request(msg);
+
+		hdr->hdr.code = cpu_to_le32(command);
+		hdr->stream_id = cpu_to_le32(vss->sid);
+	}
+
+	return msg;
+}
-- 
2.30.1



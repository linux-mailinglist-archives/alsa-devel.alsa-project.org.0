Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EC32A6B1
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 17:50:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4497B179A;
	Tue,  2 Mar 2021 17:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4497B179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614703806;
	bh=CztSm/Ge8V/mRxT+YGscaSLghC94wzaJncJj7XRjARw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYv8mYSgEaD+q7rXelpkesi3diJXeW/2iN37bk2KXjARmNDfnmZQ9iYjx7QCqQpHl
	 rBH4y584TKCLoMjrWuJ8w0w3rc6L+inzV8qtzLJsMCqP0vlbIqdMT7zz5riCu62HFp
	 hxMIwi23jyGQcNxB2dt9F3rVbLQk3BPBOyYY5nyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53D70F8049C;
	Tue,  2 Mar 2021 17:47:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4086F802E7; Tue,  2 Mar 2021 17:47:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C45BF80277
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 17:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C45BF80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="sNrbLoGk"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id EE612A17AF;
 Tue,  2 Mar 2021 17:47:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=14QWOTVxu0OG
 POe7I0hWLwBq0YRPp1La1WmWNRS7tBQ=; b=sNrbLoGk+Puc8T2FeBdrMxHCsb0z
 QpHrAoGSel6B572b2UyNeY8xS+gPdM7ghzBCnl1zRpmRWsA1Y/NVwPjC5Ii5KG7v
 xVPZvoPBUM/6QhPtcKbxEnFhepsLIuUfX04M1pbl41QvF3ucjqzlLC3KGIBosWk1
 9EbNWSqz+tDYNKF9rFTv5CndhHQw8aTxO5j0mBSNBUwrOzy+NhWHRzQaBGWUSYKf
 mtPmr3jKuWLxQU28xdmBmT0K1J1cUy9QbG4vFbjNbk8Jv4qTIGD0wGq1fW7gq6mK
 rvGg/IDgNr7k+TijoDsbSGBwm+Ssc8CHh9ZTz20g/qibPIjkQR1LXOsN0g==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v7 3/9] ALSA: virtio: handling control messages
Date: Tue, 2 Mar 2021 17:47:03 +0100
Message-ID: <20210302164709.3142702-4-anton.yakovlev@opensynergy.com>
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

The control queue can be used by different parts of the driver to send
commands to the device. Control messages can be either synchronous or
asynchronous. The lifetime of a message is controlled by a reference
count.

Introduce a module parameter to set the message completion timeout:
  msg_timeout_ms [=1000]

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile         |   3 +-
 sound/virtio/virtio_card.c    |  13 ++
 sound/virtio/virtio_card.h    |   7 +
 sound/virtio/virtio_ctl_msg.c | 310 ++++++++++++++++++++++++++++++++++
 sound/virtio/virtio_ctl_msg.h |  78 +++++++++
 5 files changed, 410 insertions(+), 1 deletion(-)
 create mode 100644 sound/virtio/virtio_ctl_msg.c
 create mode 100644 sound/virtio/virtio_ctl_msg.h

diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index 8c87ebb9982b..dc551e637441 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -3,5 +3,6 @@
 obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
 
 virtio_snd-objs := \
-	virtio_card.o
+	virtio_card.o \
+	virtio_ctl_msg.o
 
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 5a37056858e9..b757b2444078 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -11,6 +11,10 @@
 
 #include "virtio_card.h"
 
+u32 virtsnd_msg_timeout_ms = MSEC_PER_SEC;
+module_param_named(msg_timeout_ms, virtsnd_msg_timeout_ms, uint, 0644);
+MODULE_PARM_DESC(msg_timeout_ms, "Message completion timeout in milliseconds");
+
 static void virtsnd_remove(struct virtio_device *vdev);
 
 /**
@@ -96,9 +100,11 @@ static int virtsnd_find_vqs(struct virtio_snd *snd)
 {
 	struct virtio_device *vdev = snd->vdev;
 	static vq_callback_t *callbacks[VIRTIO_SND_VQ_MAX] = {
+		[VIRTIO_SND_VQ_CONTROL] = virtsnd_ctl_notify_cb,
 		[VIRTIO_SND_VQ_EVENT] = virtsnd_event_notify_cb
 	};
 	static const char *names[VIRTIO_SND_VQ_MAX] = {
+		[VIRTIO_SND_VQ_CONTROL] = "virtsnd-ctl",
 		[VIRTIO_SND_VQ_EVENT] = "virtsnd-event"
 	};
 	struct virtqueue *vqs[VIRTIO_SND_VQ_MAX] = { 0 };
@@ -226,6 +232,11 @@ static int virtsnd_validate(struct virtio_device *vdev)
 		return -EINVAL;
 	}
 
+	if (!virtsnd_msg_timeout_ms) {
+		dev_err(&vdev->dev, "msg_timeout_ms value cannot be zero\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -247,6 +258,7 @@ static int virtsnd_probe(struct virtio_device *vdev)
 		return -ENOMEM;
 
 	snd->vdev = vdev;
+	INIT_LIST_HEAD(&snd->ctl_msgs);
 
 	vdev->priv = snd;
 
@@ -283,6 +295,7 @@ static void virtsnd_remove(struct virtio_device *vdev)
 	struct virtio_snd *snd = vdev->priv;
 
 	virtsnd_disable_event_vq(snd);
+	virtsnd_ctl_msg_cancel_all(snd);
 
 	if (snd->card)
 		snd_card_free(snd->card);
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index b903b1b12e90..1e76eeff160f 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -11,6 +11,8 @@
 #include <sound/core.h>
 #include <uapi/linux/virtio_snd.h>
 
+#include "virtio_ctl_msg.h"
+
 #define VIRTIO_SND_CARD_DRIVER	"virtio-snd"
 #define VIRTIO_SND_CARD_NAME	"VirtIO SoundCard"
 
@@ -29,15 +31,20 @@ struct virtio_snd_queue {
  * @vdev: Underlying virtio device.
  * @queues: Virtqueue wrappers.
  * @card: ALSA sound card.
+ * @ctl_msgs: Pending control request list.
  * @event_msgs: Device events.
  */
 struct virtio_snd {
 	struct virtio_device *vdev;
 	struct virtio_snd_queue queues[VIRTIO_SND_VQ_MAX];
 	struct snd_card *card;
+	struct list_head ctl_msgs;
 	struct virtio_snd_event *event_msgs;
 };
 
+/* Message completion timeout in milliseconds (module parameter). */
+extern u32 virtsnd_msg_timeout_ms;
+
 static inline struct virtio_snd_queue *
 virtsnd_control_queue(struct virtio_snd *snd)
 {
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
new file mode 100644
index 000000000000..26ff7e7cc041
--- /dev/null
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#include <linux/moduleparam.h>
+#include <linux/virtio_config.h>
+
+#include "virtio_card.h"
+
+/**
+ * struct virtio_snd_msg - Control message.
+ * @sg_request: Scattergather list containing a device request (header).
+ * @sg_response: Scattergather list containing a device response (status).
+ * @list: Pending message list entry.
+ * @notify: Request completed notification.
+ * @ref_count: Reference count used to manage a message lifetime.
+ */
+struct virtio_snd_msg {
+	struct scatterlist sg_request;
+	struct scatterlist sg_response;
+	struct list_head list;
+	struct completion notify;
+	refcount_t ref_count;
+};
+
+/**
+ * virtsnd_ctl_msg_ref() - Increment reference counter for the message.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ */
+void virtsnd_ctl_msg_ref(struct virtio_snd_msg *msg)
+{
+	refcount_inc(&msg->ref_count);
+}
+
+/**
+ * virtsnd_ctl_msg_unref() - Decrement reference counter for the message.
+ * @msg: Control message.
+ *
+ * The message will be freed when the ref_count value is 0.
+ *
+ * Context: Any context.
+ */
+void virtsnd_ctl_msg_unref(struct virtio_snd_msg *msg)
+{
+	if (refcount_dec_and_test(&msg->ref_count))
+		kfree(msg);
+}
+
+/**
+ * virtsnd_ctl_msg_request() - Get a pointer to the request header.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ */
+void *virtsnd_ctl_msg_request(struct virtio_snd_msg *msg)
+{
+	return sg_virt(&msg->sg_request);
+}
+
+/**
+ * virtsnd_ctl_msg_request() - Get a pointer to the response header.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ */
+void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg)
+{
+	return sg_virt(&msg->sg_response);
+}
+
+/**
+ * virtsnd_ctl_msg_alloc() - Allocate and initialize a control message.
+ * @request_size: Size of request header.
+ * @response_size: Size of response header.
+ * @gfp: Kernel flags for memory allocation.
+ *
+ * The message will be automatically freed when the ref_count value is 0.
+ *
+ * Context: Any context. May sleep if @gfp flags permit.
+ * Return: Allocated message on success, NULL on failure.
+ */
+struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
+					     size_t response_size, gfp_t gfp)
+{
+	struct virtio_snd_msg *msg;
+
+	if (!request_size || !response_size)
+		return NULL;
+
+	msg = kzalloc(sizeof(*msg) + request_size + response_size, gfp);
+	if (!msg)
+		return NULL;
+
+	sg_init_one(&msg->sg_request, (u8 *)msg + sizeof(*msg), request_size);
+	sg_init_one(&msg->sg_response, (u8 *)msg + sizeof(*msg) + request_size,
+		    response_size);
+
+	INIT_LIST_HEAD(&msg->list);
+	init_completion(&msg->notify);
+	/* This reference is dropped in virtsnd_ctl_msg_complete(). */
+	refcount_set(&msg->ref_count, 1);
+
+	return msg;
+}
+
+/**
+ * virtsnd_ctl_msg_send() - Send a control message.
+ * @snd: VirtIO sound device.
+ * @msg: Control message.
+ * @out_sgs: Additional sg-list to attach to the request header (may be NULL).
+ * @in_sgs: Additional sg-list to attach to the response header (may be NULL).
+ * @nowait: Flag indicating whether to wait for completion.
+ *
+ * Context: Any context. Takes and releases the control queue spinlock.
+ *          May sleep if @nowait is false.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
+			 struct scatterlist *out_sgs,
+			 struct scatterlist *in_sgs, bool nowait)
+{
+	struct virtio_device *vdev = snd->vdev;
+	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
+	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
+	struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
+	unsigned int nouts = 0;
+	unsigned int nins = 0;
+	struct scatterlist *psgs[4];
+	bool notify = false;
+	unsigned long flags;
+	int rc;
+
+	virtsnd_ctl_msg_ref(msg);
+
+	/* Set the default status in case the message was canceled. */
+	response->code = cpu_to_le32(VIRTIO_SND_S_IO_ERR);
+
+	psgs[nouts++] = &msg->sg_request;
+	if (out_sgs)
+		psgs[nouts++] = out_sgs;
+
+	psgs[nouts + nins++] = &msg->sg_response;
+	if (in_sgs)
+		psgs[nouts + nins++] = in_sgs;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins, msg,
+			       GFP_ATOMIC);
+	if (!rc) {
+		notify = virtqueue_kick_prepare(queue->vqueue);
+
+		list_add_tail(&msg->list, &snd->ctl_msgs);
+	}
+	spin_unlock_irqrestore(&queue->lock, flags);
+
+	if (rc) {
+		dev_err(&vdev->dev, "failed to send control message (0x%08x)\n",
+			le32_to_cpu(request->code));
+
+		/*
+		 * Since in this case virtsnd_ctl_msg_complete() will not be
+		 * called, it is necessary to decrement the reference count.
+		 */
+		virtsnd_ctl_msg_unref(msg);
+
+		goto on_exit;
+	}
+
+	if (notify)
+		virtqueue_notify(queue->vqueue);
+
+	if (nowait)
+		goto on_exit;
+
+	rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+	if (rc <= 0) {
+		if (!rc) {
+			dev_err(&vdev->dev,
+				"control message (0x%08x) timeout\n",
+				le32_to_cpu(request->code));
+			rc = -ETIMEDOUT;
+		}
+
+		goto on_exit;
+	}
+
+	switch (le32_to_cpu(response->code)) {
+	case VIRTIO_SND_S_OK:
+		rc = 0;
+		break;
+	case VIRTIO_SND_S_NOT_SUPP:
+		rc = -EOPNOTSUPP;
+		break;
+	case VIRTIO_SND_S_IO_ERR:
+		rc = -EIO;
+		break;
+	default:
+		rc = -EINVAL;
+		break;
+	}
+
+on_exit:
+	virtsnd_ctl_msg_unref(msg);
+
+	return rc;
+}
+
+/**
+ * virtsnd_ctl_msg_complete() - Complete a control message.
+ * @msg: Control message.
+ *
+ * Context: Any context. Expects the control queue spinlock to be held by
+ *          caller.
+ */
+void virtsnd_ctl_msg_complete(struct virtio_snd_msg *msg)
+{
+	list_del(&msg->list);
+	complete(&msg->notify);
+
+	virtsnd_ctl_msg_unref(msg);
+}
+
+/**
+ * virtsnd_ctl_msg_cancel_all() - Cancel all pending control messages.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context.
+ */
+void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd)
+{
+	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
+	unsigned long flags;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	while (!list_empty(&snd->ctl_msgs)) {
+		struct virtio_snd_msg *msg =
+			list_first_entry(&snd->ctl_msgs, struct virtio_snd_msg,
+					 list);
+
+		virtsnd_ctl_msg_complete(msg);
+	}
+	spin_unlock_irqrestore(&queue->lock, flags);
+}
+
+/**
+ * virtsnd_ctl_query_info() - Query the item configuration from the device.
+ * @snd: VirtIO sound device.
+ * @command: Control request code (VIRTIO_SND_R_XXX_INFO).
+ * @start_id: Item start identifier.
+ * @count: Item count to query.
+ * @size: Item information size in bytes.
+ * @info: Buffer for storing item information.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
+			   int count, size_t size, void *info)
+{
+	struct virtio_snd_msg *msg;
+	struct virtio_snd_query_info *query;
+	struct scatterlist sg;
+
+	msg = virtsnd_ctl_msg_alloc(sizeof(*query),
+				    sizeof(struct virtio_snd_hdr), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	query = virtsnd_ctl_msg_request(msg);
+	query->hdr.code = cpu_to_le32(command);
+	query->start_id = cpu_to_le32(start_id);
+	query->count = cpu_to_le32(count);
+	query->size = cpu_to_le32(size);
+
+	sg_init_one(&sg, info, count * size);
+
+	return virtsnd_ctl_msg_send(snd, msg, NULL, &sg, false);
+}
+
+/**
+ * virtsnd_ctl_notify_cb() - Process all completed control messages.
+ * @vqueue: Underlying control virtqueue.
+ *
+ * This callback function is called upon a vring interrupt request from the
+ * device.
+ *
+ * Context: Interrupt context. Takes and releases the control queue spinlock.
+ */
+void virtsnd_ctl_notify_cb(struct virtqueue *vqueue)
+{
+	struct virtio_snd *snd = vqueue->vdev->priv;
+	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
+	struct virtio_snd_msg *msg;
+	u32 length;
+	unsigned long flags;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	do {
+		virtqueue_disable_cb(vqueue);
+		while ((msg = virtqueue_get_buf(vqueue, &length)))
+			virtsnd_ctl_msg_complete(msg);
+		if (unlikely(virtqueue_is_broken(vqueue)))
+			break;
+	} while (!virtqueue_enable_cb(vqueue));
+	spin_unlock_irqrestore(&queue->lock, flags);
+}
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
new file mode 100644
index 000000000000..7f4db044f28e
--- /dev/null
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#ifndef VIRTIO_SND_MSG_H
+#define VIRTIO_SND_MSG_H
+
+#include <linux/atomic.h>
+#include <linux/virtio.h>
+
+struct virtio_snd;
+struct virtio_snd_msg;
+
+void virtsnd_ctl_msg_ref(struct virtio_snd_msg *msg);
+
+void virtsnd_ctl_msg_unref(struct virtio_snd_msg *msg);
+
+void *virtsnd_ctl_msg_request(struct virtio_snd_msg *msg);
+
+void *virtsnd_ctl_msg_response(struct virtio_snd_msg *msg);
+
+struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
+					     size_t response_size, gfp_t gfp);
+
+int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
+			 struct scatterlist *out_sgs,
+			 struct scatterlist *in_sgs, bool nowait);
+
+/**
+ * virtsnd_ctl_msg_send_sync() - Simplified sending of synchronous message.
+ * @snd: VirtIO sound device.
+ * @msg: Control message.
+ *
+ * After returning from this function, the message will be deleted. If message
+ * content is still needed, the caller must additionally to
+ * virtsnd_ctl_msg_ref/unref() it.
+ *
+ * The msg_timeout_ms module parameter defines the message completion timeout.
+ * If the message is not completed within this time, the function will return an
+ * error.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ *
+ * The return value is a message status code (VIRTIO_SND_S_XXX) converted to an
+ * appropriate -errno value.
+ */
+static inline int virtsnd_ctl_msg_send_sync(struct virtio_snd *snd,
+					    struct virtio_snd_msg *msg)
+{
+	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, false);
+}
+
+/**
+ * virtsnd_ctl_msg_send_async() - Simplified sending of asynchronous message.
+ * @snd: VirtIO sound device.
+ * @msg: Control message.
+ *
+ * Context: Any context.
+ * Return: 0 on success, -errno on failure.
+ */
+static inline int virtsnd_ctl_msg_send_async(struct virtio_snd *snd,
+					     struct virtio_snd_msg *msg)
+{
+	return virtsnd_ctl_msg_send(snd, msg, NULL, NULL, true);
+}
+
+void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd);
+
+void virtsnd_ctl_msg_complete(struct virtio_snd_msg *msg);
+
+int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
+			   int count, size_t size, void *info);
+
+void virtsnd_ctl_notify_cb(struct virtqueue *vqueue);
+
+#endif /* VIRTIO_SND_MSG_H */
-- 
2.30.1



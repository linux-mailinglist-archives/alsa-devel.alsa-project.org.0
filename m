Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 902977CFC31
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187819F6;
	Thu, 19 Oct 2023 16:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187819F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724796;
	bh=iGuJKIor5oRbLSi9Txu2O8fGizcCo/YmFuUcRmSnzqs=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=STlD9X9wfSA1kGwoPtVelvXcbx9Z09m0GlOx+CidGlRWN5K9OEhk+UVf1t9Ws6iMv
	 glEkLJI+VkjfPJuNM110jFUZe+HW00C6mPMjyr7eeyuKoOBSh3KFLRO/4gN7+n6UCZ
	 jRO5h988n9B+cuZoIyYCQvs8+rMqut3Mr4EDB5iQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F11E2F805DF; Thu, 19 Oct 2023 16:10:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49186F805DF;
	Thu, 19 Oct 2023 16:10:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAF6DF8025F; Wed, 18 Oct 2023 12:48:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03253F80236
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 12:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03253F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hVQ+ce2y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697626115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=y/BxtA4C3nh2F9ZFU3/MLyV6d3jFBhZvUQYcdmVabkI=;
	b=hVQ+ce2ykPf2zGgkrFfyx6d9p9JNs22L23qG/f4i+P5Qcu87WRmNwDykd6JORPVTKx0+LX
	KRUHJCFoookZgDwIh7DgD0/dFJ8dl47u/TN0/VGEvhpVgCBcCtBPLnusQfgPypD6Dakli/
	Xij23ObySIU11Q2WFhCnWwGPBB2OjrY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-ohftq7lkOfmlHhcJXWsfaQ-1; Wed, 18 Oct 2023 06:48:34 -0400
X-MC-Unique: ohftq7lkOfmlHhcJXWsfaQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-66d026cae6eso81518556d6.3
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Oct 2023 03:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697626114; x=1698230914;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/BxtA4C3nh2F9ZFU3/MLyV6d3jFBhZvUQYcdmVabkI=;
        b=ORZHOkHBVFX8gfbfw44DwpHLXgW3o7tvVi50MKaXKRZM9YuBjthXfUZDFpDp3RPFxP
         hTYlcMoepspfS7e2geCqI7l+sZ23W3Mo0tDfCmzrb4HU7pI7hv5sSuwlgEuc7n/nXwpl
         hMHF0ftf+/971bVcv3FXm4SBN5kwnUqWnFZL3GOcQQpq9NWS5vF9M+e/fevwfORlYvk0
         3DS9jypE6c+B/noalXIdnNeDFHEZYoORX3/TYqFE5gHbaoFjtljOK5nd6cMgjRX2GJu+
         oP/4B/9cx0/GKZrZz/HZFQTCoqK183Uiv09Uk8+z1AKV60Epc8HlnZ9E4Sl6xzoN/TBf
         wkGA==
X-Gm-Message-State: AOJu0YxBMThjMZ2KU2v2xKR5D/+DOLXykUTFeasjUmgegwXlySDIUnL1
	j7j1nwi3IphQSr+ZwmmkMFr43VkT5X6Fep4qesBbfJjb9BsZpVX/M10cvlRIStdWebg7U2UVSS8
	3C9iyTTBLBEN56yPxeRV8SvY=
X-Received: by 2002:ad4:574d:0:b0:66d:28a5:d153 with SMTP id
 q13-20020ad4574d000000b0066d28a5d153mr5840144qvx.47.1697626113984;
        Wed, 18 Oct 2023 03:48:33 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IFY2x/imMpOAIHK0o2aLzigLkGid7MQzA7xXM7HSfwmKl52QvwedzXtszkIirkOvXFaE2iDXw==
X-Received: by 2002:ad4:574d:0:b0:66d:28a5:d153 with SMTP id
 q13-20020ad4574d000000b0066d28a5d153mr5840113qvx.47.1697626113548;
        Wed, 18 Oct 2023 03:48:33 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id
 qf5-20020a0562144b8500b0065b24c08994sm1250382qvb.128.2023.10.18.03.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:48:33 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:48:23 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: anton.yakovlev@opensynergy.com, mst@redhat.com
Cc: mvaralar@redhat.com, perex@perex.cz, tiwai@suse.com,
	virtualization@lists.linux-foundation.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pbonzini@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	manos.pitsidianakis@linaro.org, mripard@redhat.com
Subject: [PATCH v2] ALSA: virtio: use copy and fill_silence callbacks
Message-ID: <ZS+392ZzVIoEyv8n@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: mvaralar@redhat.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HHBTMDH3SJFJQRFI2Y4DV5ENH7NR6INK
X-Message-ID-Hash: HHBTMDH3SJFJQRFI2Y4DV5ENH7NR6INK
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:10:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHBTMDH3SJFJQRFI2Y4DV5ENH7NR6INK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This commit replaces the mmap mechanism with the copy() and
fill_silence() callbacks for both capturing and playback for the
virtio-sound driver. This change is required to prevent the updating of
the content of a buffer that is already in the available ring.

The current mechanism splits a dma buffer into descriptors that are
exposed to the device. This dma buffer is shared with the user
application. When the device consumes a buffer, the driver moves the
request from the used ring to available ring.

The driver exposes the buffer to the device without knowing if the
content has been updated from the user. The section 2.8.21.1 of the
virtio spec states that: "The device MAY access the descriptor chains
the driver created and the memory they refer to immediately". If the
device picks up buffers from the available ring just after it is
notified, it happens that the content may be old.

By providing the copy() callback, the driver first updates the content
of the buffer, and then, exposes the buffer to the device by enqueuing
it in the available ring. Thus, device always picks up a buffer that is
updated. During copy(), the number of requests enqueued depends on the
"pos" and "bytes" arguments. The length of each request is period_size
bytes.

For capturing, the driver starts by exposing all the available buffers
to device. After device updates the content of a buffer, it enqueues it
in the used ring. It is only after the copy() for capturing is issued
that the driver re-enqueues the buffer in the available ring.

Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
Changelog:
v1 -> v2:
 * Use snd_pcm_set_managed_buffer_all()for buffer allocation/freeing.
 * Make virtsnd_pcm_msg_send() generic by specifying the offset and size
   for the modified part of the buffer; this way no assumptions need to
   be made.
 * Disable SNDRV_PCM_INFO_NO_REWINDS since now only sequential
   reading/writing of frames is supported.
 * Correct comment at virtsnd_pcm_msg_send().
 * v1 patch at:
   https://lore.kernel.org/lkml/20231016151000.GE119987@fedora/t/

 sound/virtio/virtio_pcm.c     |  7 ++-
 sound/virtio/virtio_pcm.h     |  9 ++--
 sound/virtio/virtio_pcm_msg.c | 93 ++++++++++++++++++++++-------------
 sound/virtio/virtio_pcm_ops.c | 81 +++++++++++++++++++++++++-----
 4 files changed, 137 insertions(+), 53 deletions(-)

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index c10d91fff2fb..66d67eef1bcc 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -104,12 +104,11 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
 	 * only message-based transport.
 	 */
 	vss->hw.info =
-		SNDRV_PCM_INFO_MMAP |
-		SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_BATCH |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_INTERLEAVED |
-		SNDRV_PCM_INFO_PAUSE;
+		SNDRV_PCM_INFO_PAUSE |
+		SNDRV_PCM_INFO_NO_REWINDS;
 
 	if (!info->channels_min || info->channels_min > info->channels_max) {
 		dev_err(&vdev->dev,
@@ -471,7 +470,7 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
 			for (kss = ks->substream; kss; kss = kss->next)
 				vs->substreams[kss->number]->substream = kss;
 
-			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops);
+			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops[i]);
 		}
 
 		snd_pcm_set_managed_buffer_all(vpcm->pcm,
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 062eb8e8f2cf..8b42928a8e01 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -57,7 +57,6 @@ struct virtio_pcm_substream {
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
-	int msg_last_enqueued;
 	unsigned int msg_count;
 	wait_queue_head_t msg_empty;
 };
@@ -90,7 +89,7 @@ struct virtio_pcm {
 	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
 };
 
-extern const struct snd_pcm_ops virtsnd_pcm_ops;
+extern const struct snd_pcm_ops virtsnd_pcm_ops[];
 
 int virtsnd_pcm_validate(struct virtio_device *vdev);
 
@@ -117,7 +116,11 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 
 void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
 
-int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss);
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
+			 unsigned long bytes);
+
+int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss,
+				unsigned long offset, unsigned long bytes);
 
 unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss);
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index aca2dc1989ba..c3d471088d9e 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -155,7 +155,6 @@ int virtsnd_pcm_msg_alloc(struct virtio_pcm_substream *vss,
 			    sizeof(msg->xfer));
 		sg_init_one(&msg->sgs[PCM_MSG_SG_STATUS], &msg->status,
 			    sizeof(msg->status));
-		msg->length = period_bytes;
 		virtsnd_pcm_sg_from(&msg->sgs[PCM_MSG_SG_DATA], sg_num, data,
 				    period_bytes);
 
@@ -189,58 +188,70 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
  *
  * All messages are organized in an ordered circular list. Each time the
  * function is called, all currently non-enqueued messages are added to the
- * virtqueue. For this, the function keeps track of two values:
- *
- *   msg_last_enqueued = index of the last enqueued message,
- *   msg_count = # of pending messages in the virtqueue.
+ * virtqueue. For this, the function uses offset and bytes to calculate the
+ * messages that need to be added.
  *
  * Context: Any context. Expects the tx/rx queue and the VirtIO substream
  *          spinlocks to be held by caller.
  * Return: 0 on success, -errno on failure.
  */
-int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
+int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
+			 unsigned long bytes)
 {
-	struct snd_pcm_runtime *runtime = vss->substream->runtime;
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_device *vdev = snd->vdev;
 	struct virtqueue *vqueue = virtsnd_pcm_queue(vss)->vqueue;
-	int i;
-	int n;
+	unsigned long period_bytes = snd_pcm_lib_period_bytes(vss->substream);
+	unsigned long start, end, i;
+	unsigned int msg_count = vss->msg_count;
 	bool notify = false;
+	int rc;
 
-	i = (vss->msg_last_enqueued + 1) % runtime->periods;
-	n = runtime->periods - vss->msg_count;
+	start = offset / period_bytes;
+	end = (offset + bytes - 1) / period_bytes;
 
-	for (; n; --n, i = (i + 1) % runtime->periods) {
+	for (i = start; i <= end; i++) {
 		struct virtio_pcm_msg *msg = vss->msgs[i];
 		struct scatterlist *psgs[] = {
 			&msg->sgs[PCM_MSG_SG_XFER],
 			&msg->sgs[PCM_MSG_SG_DATA],
 			&msg->sgs[PCM_MSG_SG_STATUS]
 		};
-		int rc;
-
-		msg->xfer.stream_id = cpu_to_le32(vss->sid);
-		memset(&msg->status, 0, sizeof(msg->status));
-
-		if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
-			rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
-					       GFP_ATOMIC);
-		else
-			rc = virtqueue_add_sgs(vqueue, psgs, 1, 2, msg,
-					       GFP_ATOMIC);
-
-		if (rc) {
-			dev_err(&vdev->dev,
-				"SID %u: failed to send I/O message\n",
-				vss->sid);
-			return rc;
+		unsigned long n;
+
+		n = period_bytes - (offset % period_bytes);
+		if (n > bytes)
+			n = bytes;
+
+		msg->length += n;
+		if (msg->length == period_bytes) {
+			msg->xfer.stream_id = cpu_to_le32(vss->sid);
+			memset(&msg->status, 0, sizeof(msg->status));
+
+			if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK)
+				rc = virtqueue_add_sgs(vqueue, psgs, 2, 1, msg,
+						       GFP_ATOMIC);
+			else
+				rc = virtqueue_add_sgs(vqueue, psgs, 1, 2, msg,
+						       GFP_ATOMIC);
+
+			if (rc) {
+				dev_err(&vdev->dev,
+					"SID %u: failed to send I/O message\n",
+					vss->sid);
+				return rc;
+			}
+
+			vss->msg_count++;
 		}
 
-		vss->msg_last_enqueued = i;
-		vss->msg_count++;
+		offset = 0;
+		bytes -= n;
 	}
 
+	if (msg_count == vss->msg_count)
+		return 0;
+
 	if (!(vss->features & (1U << VIRTIO_SND_PCM_F_MSG_POLLING)))
 		notify = virtqueue_kick_prepare(vqueue);
 
@@ -250,6 +261,22 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss)
 	return 0;
 }
 
+int virtsnd_pcm_msg_send_locked(struct virtio_pcm_substream *vss,
+				unsigned long offset, unsigned long bytes)
+{
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	unsigned long flags;
+	int rc;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	spin_lock(&vss->lock);
+	rc = virtsnd_pcm_msg_send(vss, offset, bytes);
+	spin_unlock(&vss->lock);
+	spin_unlock_irqrestore(&queue->lock, flags);
+
+	return rc;
+}
+
 /**
  * virtsnd_pcm_msg_pending_num() - Returns the number of pending I/O messages.
  * @vss: VirtIO substream.
@@ -309,6 +336,8 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 	if (vss->hw_ptr >= vss->buffer_bytes)
 		vss->hw_ptr -= vss->buffer_bytes;
 
+	msg->length = 0;
+
 	vss->xfer_xrun = false;
 	vss->msg_count--;
 
@@ -320,8 +349,6 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 					le32_to_cpu(msg->status.latency_bytes));
 
 		schedule_work(&vss->elapsed_period);
-
-		virtsnd_pcm_msg_send(vss);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index f8bfb87624be..4569b285f520 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -282,7 +282,6 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 
 		vss->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
 		vss->hw_ptr = 0;
-		vss->msg_last_enqueued = -1;
 	} else {
 		struct snd_pcm_runtime *runtime = substream->runtime;
 		unsigned int buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
@@ -324,7 +323,7 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 	struct virtio_snd_queue *queue;
 	struct virtio_snd_msg *msg;
 	unsigned long flags;
-	int rc;
+	int rc = 0;
 
 	switch (command) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -333,7 +332,8 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 		spin_lock_irqsave(&queue->lock, flags);
 		spin_lock(&vss->lock);
-		rc = virtsnd_pcm_msg_send(vss);
+		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+			rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
 		if (!rc)
 			vss->xfer_enabled = true;
 		spin_unlock(&vss->lock);
@@ -450,15 +450,70 @@ virtsnd_pcm_pointer(struct snd_pcm_substream *substream)
 	return hw_ptr;
 }
 
+static int virtsnd_pcm_pb_silence(struct snd_pcm_substream *substream,
+				  int channel, unsigned long pos,
+				  unsigned long bytes)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	snd_pcm_format_set_silence(runtime->format, runtime->dma_area + pos,
+				   bytes_to_samples(runtime, bytes));
+
+	return virtsnd_pcm_msg_send_locked(vss, pos, bytes);
+}
+
+static int virtsnd_pcm_pb_copy(struct snd_pcm_substream *substream, int channel,
+			       unsigned long pos, struct iov_iter *iter,
+			       unsigned long bytes)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (copy_from_iter(runtime->dma_area + pos, bytes, iter) != bytes)
+		return -EFAULT;
+
+	return virtsnd_pcm_msg_send_locked(vss, pos, bytes);
+}
+
+static int virtsnd_pcm_cp_copy(struct snd_pcm_substream *substream, int channel,
+			       unsigned long pos, struct iov_iter *iter,
+			       unsigned long bytes)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (copy_to_iter(runtime->dma_area + pos, bytes, iter) != bytes)
+		return -EFAULT;
+
+	return virtsnd_pcm_msg_send_locked(vss, pos, bytes);
+}
+
 /* PCM substream operators map. */
-const struct snd_pcm_ops virtsnd_pcm_ops = {
-	.open = virtsnd_pcm_open,
-	.close = virtsnd_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = virtsnd_pcm_hw_params,
-	.hw_free = virtsnd_pcm_hw_free,
-	.prepare = virtsnd_pcm_prepare,
-	.trigger = virtsnd_pcm_trigger,
-	.sync_stop = virtsnd_pcm_sync_stop,
-	.pointer = virtsnd_pcm_pointer,
+const struct snd_pcm_ops virtsnd_pcm_ops[] = {
+	{
+		.open = virtsnd_pcm_open,
+		.close = virtsnd_pcm_close,
+		.ioctl = snd_pcm_lib_ioctl,
+		.hw_params = virtsnd_pcm_hw_params,
+		.hw_free = virtsnd_pcm_hw_free,
+		.prepare = virtsnd_pcm_prepare,
+		.trigger = virtsnd_pcm_trigger,
+		.sync_stop = virtsnd_pcm_sync_stop,
+		.pointer = virtsnd_pcm_pointer,
+		.copy = virtsnd_pcm_pb_copy,
+		.fill_silence = virtsnd_pcm_pb_silence,
+	},
+	{
+		.open = virtsnd_pcm_open,
+		.close = virtsnd_pcm_close,
+		.ioctl = snd_pcm_lib_ioctl,
+		.hw_params = virtsnd_pcm_hw_params,
+		.hw_free = virtsnd_pcm_hw_free,
+		.prepare = virtsnd_pcm_prepare,
+		.trigger = virtsnd_pcm_trigger,
+		.sync_stop = virtsnd_pcm_sync_stop,
+		.pointer = virtsnd_pcm_pointer,
+		.copy = virtsnd_pcm_cp_copy,
+	},
 };

base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
-- 
2.41.0


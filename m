Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EE432A6B6
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 17:51:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A635517A3;
	Tue,  2 Mar 2021 17:50:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A635517A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614703891;
	bh=beGSNPYgsqbvDkgDcjCWyv8rFnC10UEkspcdnJUryes=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0JO7uqbORqFa72Kq7HV8fKwhspcIEioIqxGoFbOxtwJn07Um3qwiw6Nv7MTxuNem
	 q1I/CVTpDKuyjgd92xZF6SOdrMRGmZw4eixON/RJqc5ZFrMehZCwUD8x17CPcqW73Y
	 EySHfnq0MrFC2P2zYpB6InGw/5Hh8GCYNSzlen+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97001F804B2;
	Tue,  2 Mar 2021 17:47:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FC07F804D1; Tue,  2 Mar 2021 17:47:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.opensynergy.com (mx1.opensynergy.com [217.66.60.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BED4F804B2
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 17:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BED4F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com
 header.b="a+R6KRRN"
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain
 [127.0.0.1])
 by mx1.opensynergy.com (Proxmox) with ESMTP id BF74CA17B7;
 Tue,  2 Mar 2021 17:47:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:from:from:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=srmailgate02; bh=oloDjkjzKDbw
 os4MxdLk87O7uGAQKjkxOcMs4YnKOOM=; b=a+R6KRRNEH3yTxu3tysZUYdqF9oy
 +q3hUWu9E2j9lBgsNMbG7/oWOZ3p8yB1ptgBn/vIkPxSnJm9on+I0gZBVGrSBpE9
 C9Ox+Njx5AmcDL/wb9zZuZ9FUeuZDrRUx8iadApo/IEoaa6o5g0Z/AAA3mjvMr8l
 eJU8VA2pra2VHfwstUZ79UGbi1M4kBn6p+0OqMjFK09wvKxC19JRRkRKsd3HbXbM
 JHaghgUE+GuJuWPLFFHXLuUGo/4uz2UHaiRGpwhKYlYUdVwgKGmNfVX0uxUponTo
 oDgY6U7HpQkvmqkm6q4ie0PKwE2q/4QPYwI37NqwL/v6FSjPw2ssVj7kdg==
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
To: <virtualization@lists.linux-foundation.org>,
 <alsa-devel@alsa-project.org>, <virtio-dev@lists.oasis-open.org>
Subject: [PATCH v7 6/9] ALSA: virtio: PCM substream operators
Date: Tue, 2 Mar 2021 17:47:06 +0100
Message-ID: <20210302164709.3142702-7-anton.yakovlev@opensynergy.com>
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

Introduce the operators required for the operation of substreams.

Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
---
 sound/virtio/Makefile         |   3 +-
 sound/virtio/virtio_pcm.c     |   2 +
 sound/virtio/virtio_pcm.h     |   5 +
 sound/virtio/virtio_pcm_ops.c | 445 ++++++++++++++++++++++++++++++++++
 4 files changed, 454 insertions(+), 1 deletion(-)
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
index 2dcd763efa29..c10d91fff2fb 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -470,6 +470,8 @@ int virtsnd_pcm_build_devs(struct virtio_snd *snd)
 
 			for (kss = ks->substream; kss; kss = kss->next)
 				vs->substreams[kss->number]->substream = kss;
+
+			snd_pcm_set_ops(vpcm->pcm, i, &virtsnd_pcm_ops);
 		}
 
 		snd_pcm_set_managed_buffer_all(vpcm->pcm,
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 6722f1139666..efd0228746cf 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -29,6 +29,8 @@ struct virtio_pcm_msg;
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
  * @xfer_enabled: Data transfer state (0 - off, 1 - on).
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
+ * @stopped: True if the substream is stopped and must be released on the device
+ *           side.
  * @msgs: Allocated I/O messages.
  * @nmsgs: Number of allocated I/O messages.
  * @msg_last_enqueued: Index of the last I/O message added to the virtqueue.
@@ -49,6 +51,7 @@ struct virtio_pcm_substream {
 	size_t hw_ptr;
 	bool xfer_enabled;
 	bool xfer_xrun;
+	bool stopped;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
 	int msg_last_enqueued;
@@ -80,6 +83,8 @@ struct virtio_pcm {
 	struct virtio_pcm_stream streams[SNDRV_PCM_STREAM_LAST + 1];
 };
 
+extern const struct snd_pcm_ops virtsnd_pcm_ops;
+
 int virtsnd_pcm_validate(struct virtio_device *vdev);
 
 int virtsnd_pcm_parse_cfg(struct virtio_snd *snd);
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
new file mode 100644
index 000000000000..0682a2df6c8c
--- /dev/null
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio-snd: Virtio sound device
+ * Copyright (C) 2021 OpenSynergy GmbH
+ */
+#include <sound/pcm_params.h>
+
+#include "virtio_card.h"
+
+/*
+ * I/O messages lifetime
+ * ---------------------
+ *
+ * Allocation:
+ *   Messages are initially allocated in the ops->hw_params() after the size and
+ *   number of periods have been successfully negotiated.
+ *
+ * Freeing:
+ *   Messages can be safely freed after the queue has been successfully flushed
+ *   (RELEASE command in the ops->sync_stop()) and the ops->hw_free() has been
+ *   called.
+ *
+ *   When the substream stops, the ops->sync_stop() waits until the device has
+ *   completed all pending messages. This wait can be interrupted either by a
+ *   signal or due to a timeout. In this case, the device can still access
+ *   messages even after calling ops->hw_free(). It can also issue an interrupt,
+ *   and the interrupt handler will also try to access message structures.
+ *
+ *   Therefore, freeing of already allocated messages occurs:
+ *
+ *   - in ops->hw_params(), if this operator was called several times in a row,
+ *     or if ops->hw_free() failed to free messages previously;
+ *
+ *   - in ops->hw_free(), if the queue has been successfully flushed;
+ *
+ *   - in dev->release().
+ */
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
+	struct virtio_pcm_stream *vs = &vpcm->streams[substream->stream];
+	struct virtio_pcm_substream *vss = vs->substreams[substream->number];
+
+	substream->runtime->hw = vss->hw;
+	substream->private_data = vss;
+
+	snd_pcm_hw_constraint_integer(substream->runtime,
+				      SNDRV_PCM_HW_PARAM_PERIODS);
+
+	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+
+	/*
+	 * If the substream has already been used, then the I/O queue may be in
+	 * an invalid state. Just in case, we do a check and try to return the
+	 * queue to its original state, if necessary.
+	 */
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
+ * virtsnd_pcm_dev_set_params() - Set the parameters of the PCM substream on
+ *                                the device side.
+ * @vss: VirtIO PCM substream.
+ * @buffer_bytes: Size of the hardware buffer.
+ * @period_bytes: Size of the hardware period.
+ * @channels: Selected number of channels.
+ * @format: Selected sample format (SNDRV_PCM_FORMAT_XXX).
+ * @rate: Selected frame rate.
+ *
+ * Context: Any context that permits to sleep.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_dev_set_params(struct virtio_pcm_substream *vss,
+				      unsigned int buffer_bytes,
+				      unsigned int period_bytes,
+				      unsigned int channels,
+				      snd_pcm_format_t format,
+				      unsigned int rate)
+{
+	struct virtio_snd_msg *msg;
+	struct virtio_snd_pcm_set_params *request;
+	unsigned int i;
+	int vformat = -1;
+	int vrate = -1;
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
+	return virtsnd_ctl_msg_send_sync(vss->snd, msg);
+}
+
+/**
+ * virtsnd_pcm_hw_params() - Set the parameters of the PCM substream.
+ * @substream: Kernel ALSA substream.
+ * @hw_params: Hardware parameters.
+ *
+ * Context: Process context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *hw_params)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_device *vdev = vss->snd->vdev;
+	int rc;
+
+	if (virtsnd_pcm_msg_pending_num(vss)) {
+		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
+			vss->sid);
+		return -EBADFD;
+	}
+
+	rc = virtsnd_pcm_dev_set_params(vss, params_buffer_bytes(hw_params),
+					params_period_bytes(hw_params),
+					params_channels(hw_params),
+					params_format(hw_params),
+					params_rate(hw_params));
+	if (rc)
+		return rc;
+
+	/*
+	 * Free previously allocated messages if ops->hw_params() is called
+	 * several times in a row, or if ops->hw_free() failed to free messages.
+	 */
+	virtsnd_pcm_msg_free(vss);
+
+	return virtsnd_pcm_msg_alloc(vss, params_periods(hw_params),
+				     params_period_bytes(hw_params));
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
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+
+	/* If the queue is flushed, we can safely free the messages here. */
+	if (!virtsnd_pcm_msg_pending_num(vss))
+		virtsnd_pcm_msg_free(vss);
+
+	return 0;
+}
+
+/**
+ * virtsnd_pcm_prepare() - Prepare the PCM substream.
+ * @substream: Kernel ALSA substream.
+ *
+ * Context: Process context.
+ * Return: 0 on success, -errno on failure.
+ */
+static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_device *vdev = vss->snd->vdev;
+	struct virtio_snd_msg *msg;
+
+	if (virtsnd_pcm_msg_pending_num(vss)) {
+		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
+			vss->sid);
+		return -EBADFD;
+	}
+
+	vss->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
+	vss->hw_ptr = 0;
+	vss->xfer_xrun = false;
+	vss->msg_last_enqueued = -1;
+	vss->msg_count = 0;
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
+	struct virtio_snd_queue *queue;
+	struct virtio_snd_msg *msg;
+	unsigned long flags;
+	int rc;
+
+	switch (command) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		queue = virtsnd_pcm_queue(vss);
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
+	case SNDRV_PCM_TRIGGER_STOP:
+		vss->stopped = true;
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		spin_lock_irqsave(&vss->lock, flags);
+		vss->xfer_enabled = false;
+		spin_unlock_irqrestore(&vss->lock, flags);
+
+		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_STOP,
+						GFP_KERNEL);
+		if (!msg)
+			return -ENOMEM;
+
+		return virtsnd_ctl_msg_send_sync(snd, msg);
+	default:
+		return -EINVAL;
+	}
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
+	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	int rc;
+
+	cancel_work_sync(&vss->elapsed_period);
+
+	if (!vss->stopped)
+		return 0;
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
+					      !virtsnd_pcm_msg_pending_num(vss),
+					      js);
+	if (rc <= 0) {
+		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
+			 vss->sid);
+
+		return !rc ? -ETIMEDOUT : rc;
+	}
+
+	vss->stopped = false;
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
+		hw_ptr = bytes_to_frames(substream->runtime, vss->hw_ptr);
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
2.30.1



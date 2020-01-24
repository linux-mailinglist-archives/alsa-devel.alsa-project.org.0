Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B96C6148E9D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 20:19:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E3DC16A8;
	Fri, 24 Jan 2020 20:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E3DC16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579893549;
	bh=NfZXWZNNb1rmAubxwUxwHWP9vSXFoNfy/PGukmojw5o=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PoDQp65Eyp9jFlSwhhrj6BjeBIKOaY90vOB0yxrUFqz25BFJc255fJdfgPoViyZ+D
	 SU9hB0i3J/LIRnLOT+XG6iaOibTjQLVidlcjZEc+cGS8dWF+PKDHOR/Z4v5MOItvJB
	 AGFPO8F71rlBUMEY61o74E6qGlzSRaWO/MeL2H1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 813B9F802E0;
	Fri, 24 Jan 2020 20:12:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C6FCF800DE; Fri, 24 Jan 2020 20:12:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F2DEF800DE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 20:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F2DEF800DE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 11:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="260337213"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2020 11:04:32 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 Jan 2020 20:04:08 +0100
Message-Id: <20200124190413.18154-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124190413.18154-1-cezary.rojewski@intel.com>
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 07/12] ASoC: SOF: Implement Probe IPC API
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add all required types and methods to support each and every request
that driver could sent to firmware. Probe is one of SOF firmware
features which allows for data extraction and injection directly from
or to DMA stream.

Exposes eight IPCs:
- addition and removal of injection DMAs
- addition and removal of probe points
- info retrieval of injection DMAs and probe points
- probe initialization and cleanup

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/sof/header.h    |  11 ++
 sound/soc/sof/Makefile        |   2 +-
 sound/soc/sof/intel/hda-ipc.c |   4 +-
 sound/soc/sof/probe.c         | 287 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/probe.h         |  85 ++++++++++
 sound/soc/sof/sof-priv.h      |   3 +
 6 files changed, 390 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/probe.c
 create mode 100644 sound/soc/sof/probe.h

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index bf3edd9c08b4..b79479575cc8 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -51,6 +51,7 @@
 #define SOF_IPC_GLB_TRACE_MSG			SOF_GLB_TYPE(0x9U)
 #define SOF_IPC_GLB_GDB_DEBUG                   SOF_GLB_TYPE(0xAU)
 #define SOF_IPC_GLB_TEST_MSG			SOF_GLB_TYPE(0xBU)
+#define SOF_IPC_GLB_PROBE			SOF_GLB_TYPE(0xCU)
 
 /*
  * DSP Command Message Types
@@ -102,6 +103,16 @@
 #define SOF_IPC_STREAM_VORBIS_PARAMS		SOF_CMD_TYPE(0x010)
 #define SOF_IPC_STREAM_VORBIS_FREE		SOF_CMD_TYPE(0x011)
 
+/* probe */
+#define SOF_IPC_PROBE_INIT			SOF_CMD_TYPE(0x001)
+#define SOF_IPC_PROBE_DEINIT			SOF_CMD_TYPE(0x002)
+#define SOF_IPC_PROBE_DMA_ADD			SOF_CMD_TYPE(0x003)
+#define SOF_IPC_PROBE_DMA_INFO			SOF_CMD_TYPE(0x004)
+#define SOF_IPC_PROBE_DMA_REMOVE		SOF_CMD_TYPE(0x005)
+#define SOF_IPC_PROBE_POINT_ADD		SOF_CMD_TYPE(0x006)
+#define SOF_IPC_PROBE_POINT_INFO		SOF_CMD_TYPE(0x007)
+#define SOF_IPC_PROBE_POINT_REMOVE		SOF_CMD_TYPE(0x008)
+
 /* trace */
 #define SOF_IPC_TRACE_DMA_PARAMS		SOF_CMD_TYPE(0x001)
 #define SOF_IPC_TRACE_DMA_POSITION		SOF_CMD_TYPE(0x002)
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index ac83589e3a9c..60f7f13218a7 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -3,7 +3,7 @@
 ccflags-y += -DDEBUG
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
-		control.o trace.o utils.o sof-audio.o
+		control.o probe.o trace.o utils.o sof-audio.o
 
 snd-sof-pci-objs := sof-pci-dev.o
 snd-sof-acpi-objs := sof-acpi-dev.o
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 1837f66e361f..922052883b0a 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -106,7 +106,9 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 		ret = reply.error;
 	} else {
 		/* reply correct size ? */
-		if (reply.hdr.size != msg->reply_size) {
+		if (reply.hdr.size != msg->reply_size &&
+			/* getter payload is never known upfront */
+			!(reply.hdr.cmd & SOF_IPC_GLB_PROBE)) {
 			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
 				msg->reply_size, reply.hdr.size);
 			ret = -EINVAL;
diff --git a/sound/soc/sof/probe.c b/sound/soc/sof/probe.c
new file mode 100644
index 000000000000..0089f08630cf
--- /dev/null
+++ b/sound/soc/sof/probe.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2019 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include "sof-priv.h"
+#include "probe.h"
+
+/**
+ * sof_ipc_probe_init - initialize data probing
+ * @sdev:		SOF sound device
+ * @buffer_size:	DMA buffer size to set for extractor
+ *
+ * Host chooses whether extraction is supported or not by providing
+ * valid stream tag to DSP. Once specified, stream described by that
+ * tag will be tied to DSP for extraction for the entire lifetime of
+ * probe.
+ *
+ * Probing is initialized only once and each INIT request must be
+ * matched by DEINIT call.
+ */
+int sof_ipc_probe_init(struct snd_sof_dev *sdev,
+		u32 stream_tag, size_t buffer_size)
+{
+	struct sof_ipc_probe_dma_add_params *msg;
+	struct sof_ipc_reply reply;
+	size_t size;
+	int ret;
+
+	size = struct_size(msg, dma, 1);
+	msg = kmalloc(size, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->hdr.size = sizeof(msg);
+	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_INIT;
+	msg->num_elems = 1;
+	msg->dma[0].stream_tag = stream_tag;
+	msg->dma[0].dma_buffer_size = buffer_size;
+
+	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg, msg->hdr.size,
+			&reply, sizeof(reply));
+	kfree(msg);
+	return ret;
+}
+EXPORT_SYMBOL(sof_ipc_probe_init);
+
+/**
+ * sof_ipc_probe_deinit - cleanup after data probing
+ * @sdev:	SOF sound device
+ *
+ * Host sends DEINIT request to free previously initialized probe
+ * on DSP side once it is no longer needed. DEINIT only when there
+ * are no probes connected and with all injectors detached.
+ */
+int sof_ipc_probe_deinit(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc_cmd_hdr msg;
+	struct sof_ipc_reply reply;
+
+	msg.size = sizeof(msg);
+	msg.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DEINIT;
+
+	return sof_ipc_tx_message(sdev->ipc, msg.cmd, &msg, msg.size,
+			&reply, sizeof(reply));
+}
+EXPORT_SYMBOL(sof_ipc_probe_deinit);
+
+static int sof_ipc_probe_info(struct snd_sof_dev *sdev, unsigned int cmd,
+		void **params, size_t *num_params)
+{
+	struct sof_ipc_probe_info_params msg = {0};
+	struct sof_ipc_probe_info_params *reply;
+	size_t bytes;
+	int ret;
+
+	*params = NULL;
+	*num_params = 0;
+
+	reply = kzalloc(SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	if (!reply)
+		return -ENOMEM;
+	msg.rhdr.hdr.size = sizeof(msg);
+	msg.rhdr.hdr.cmd = SOF_IPC_GLB_PROBE | cmd;
+
+	ret = sof_ipc_tx_message(sdev->ipc, msg.rhdr.hdr.cmd, &msg,
+			msg.rhdr.hdr.size, reply, SOF_IPC_MSG_MAX_SIZE);
+	if (ret < 0 || reply->rhdr.error < 0)
+		goto exit;
+
+	if (!reply->num_elems)
+		goto exit;
+
+	bytes = reply->num_elems * sizeof(reply->dma[0]);
+	*params = kmemdup(&reply->dma[0], bytes, GFP_KERNEL);
+	if (!*params) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+	*num_params = msg.num_elems;
+
+exit:
+	kfree(reply);
+	return ret;
+}
+
+/**
+ * sof_ipc_probe_dma_info - retrieve list of active injection dmas
+ * @sdev:	SOF sound device
+ * @dma:	Returned list of active dmas
+ * @num_dma:	Returned count of active dmas
+ *
+ * Host sends DMA_INFO request to obtain list of injection dmas it
+ * can use to transfer data over with.
+ *
+ * Note that list contains only injection dmas as there is only one
+ * extractor (dma) and it is always assigned on probing init.
+ * DSP knows exactly where data from extraction probes is going to,
+ * which is not the case for injection where multiple streams
+ * could be engaged.
+ */
+int sof_ipc_probe_dma_info(struct snd_sof_dev *sdev,
+		struct sof_probe_dma **dma, size_t *num_dma)
+{
+	return sof_ipc_probe_info(sdev, SOF_IPC_PROBE_DMA_INFO,
+			(void **)dma, num_dma);
+}
+EXPORT_SYMBOL(sof_ipc_probe_dma_info);
+
+/**
+ * sof_ipc_probe_dma_add - attach to specified dmas
+ * @sdev:	SOF sound device
+ * @dma:	List of streams (dmas) to attach to
+ * @num_dma:	Number of elements in @dma
+ *
+ * Contrary to extraction, injection streams are never assigned
+ * on init. Before attempting any data injection, host is responsible
+ * for specifying streams which will be later used to transfer data
+ * to connected probe points.
+ */
+int sof_ipc_probe_dma_add(struct snd_sof_dev *sdev,
+		struct sof_probe_dma *dma, size_t num_dma)
+{
+	struct sof_ipc_probe_dma_add_params *msg;
+	struct sof_ipc_reply reply;
+	size_t bytes = sizeof(*dma) * num_dma;
+	int ret;
+
+	msg = kmalloc(sizeof(*msg) + bytes, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+	msg->hdr.size = sizeof(*msg);
+	msg->num_elems = num_dma;
+	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DMA_ADD;
+	memcpy(&msg->dma[0], dma, bytes);
+
+	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg,
+			msg->hdr.size + bytes, &reply, sizeof(reply));
+	kfree(msg);
+	return ret;
+}
+EXPORT_SYMBOL(sof_ipc_probe_dma_add);
+
+/**
+ * sof_ipc_probe_dma_remove - detach from specified dmas
+ * @sdev:		SOF sound device
+ * @stream_tag:	List of stream tags to detach from
+ * @num_stream_tag:	Number of elements in @stream_tag
+ *
+ * Host sends DMA_REMOVE request to free previously attached stream
+ * from being occupied for injection. Each detach operation should
+ * match equivalent DMA_ADD. Detach only when all probes tied to
+ * given stream have been disconnected.
+ */
+int sof_ipc_probe_dma_remove(struct snd_sof_dev *sdev,
+		unsigned int *stream_tag, size_t num_stream_tag)
+{
+	struct sof_ipc_probe_dma_remove_params *msg;
+	struct sof_ipc_reply reply;
+	size_t bytes = sizeof(*stream_tag) * num_stream_tag;
+	int ret;
+
+	msg = kmalloc(sizeof(*msg) + bytes, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+	msg->hdr.size = sizeof(*msg);
+	msg->num_elems = num_stream_tag;
+	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DMA_REMOVE;
+	memcpy(&msg->stream_tag[0], stream_tag, bytes);
+
+	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg,
+			msg->hdr.size + bytes, &reply, sizeof(reply));
+	kfree(msg);
+	return ret;
+}
+EXPORT_SYMBOL(sof_ipc_probe_dma_remove);
+
+/**
+ * sof_ipc_probe_points_info - retrieve list of active probe points
+ * @sdev:	SOF sound device
+ * @desc:	Returned list of active probes
+ * @num_desc:	Returned count of active probes
+ *
+ * Host sends PROBE_POINT_INFO request to obtain list of active probe
+ * points, valid for disconnection when given probe is no longer
+ * required.
+ */
+int sof_ipc_probe_points_info(struct snd_sof_dev *sdev,
+		struct sof_probe_point_desc **desc, size_t *num_desc)
+{
+	return sof_ipc_probe_info(sdev, SOF_IPC_PROBE_POINT_INFO,
+				 (void **)desc, num_desc);
+}
+EXPORT_SYMBOL(sof_ipc_probe_points_info);
+
+/**
+ * sof_ipc_probe_points_add - connect specified probes
+ * @sdev:	SOF sound device
+ * @desc:	List of probe points to connect
+ * @num_desc:	Number of elements in @desc
+ *
+ * Dynamically connects to provided set of endpoints. Immediately
+ * after connection is established, host must be prepared to
+ * transfer data from or to target stream given the probing purpose.
+ *
+ * Each probe point should be removed using PROBE_POINT_REMOVE
+ * request when no longer needed.
+ */
+int sof_ipc_probe_points_add(struct snd_sof_dev *sdev,
+		struct sof_probe_point_desc *desc, size_t num_desc)
+{
+	struct sof_ipc_probe_point_add_params *msg;
+	struct sof_ipc_reply reply;
+	size_t bytes = sizeof(*desc) * num_desc;
+	int ret;
+
+	msg = kmalloc(sizeof(*msg) + bytes, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+	msg->hdr.size = sizeof(*msg);
+	msg->num_elems = num_desc;
+	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_POINT_ADD;
+	memcpy(&msg->desc[0], desc, bytes);
+
+	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg,
+			msg->hdr.size + bytes, &reply, sizeof(reply));
+	kfree(msg);
+	return ret;
+}
+EXPORT_SYMBOL(sof_ipc_probe_points_add);
+
+/**
+ * sof_ipc_probe_points_remove - disconnect specified probes
+ * @sdev:	SOF sound device
+ * @desc:	List of probe points to disconnect
+ * @num_desc:	Number of elements in @desc
+ *
+ * Removes previously connected probes from list of active probe
+ * points and frees all resources on DSP side.
+ */
+int sof_ipc_probe_points_remove(struct snd_sof_dev *sdev,
+		unsigned int *buffer_id, size_t num_buffer_id)
+{
+	struct sof_ipc_probe_point_remove_params *msg;
+	struct sof_ipc_reply reply;
+	size_t bytes = sizeof(*buffer_id) * num_buffer_id;
+	int ret;
+
+	msg = kmalloc(sizeof(*msg) + bytes, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+	msg->hdr.size = sizeof(*msg);
+	msg->num_elems = num_buffer_id;
+	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_POINT_REMOVE;
+	memcpy(&msg->buffer_id[0], buffer_id, bytes);
+
+	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg,
+			msg->hdr.size + bytes, &reply, sizeof(reply));
+	kfree(msg);
+	return ret;
+}
+EXPORT_SYMBOL(sof_ipc_probe_points_remove);
diff --git a/sound/soc/sof/probe.h b/sound/soc/sof/probe.h
new file mode 100644
index 000000000000..a5cc24405e7e
--- /dev/null
+++ b/sound/soc/sof/probe.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2019 Intel Corporation. All rights reserved.
+ *
+ * Author: Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#ifndef __SOF_PROBE_H
+#define __SOF_PROBE_H
+
+#include <sound/sof/header.h>
+
+struct snd_sof_dev;
+
+#define SOF_PROBE_INVALID_NODE_ID UINT_MAX
+
+struct sof_probe_dma {
+	unsigned int stream_tag;
+	unsigned int dma_buffer_size;
+} __packed;
+
+enum sof_connection_purpose {
+	SOF_CONNECTION_PURPOSE_EXTRACT = 1,
+	SOF_CONNECTION_PURPOSE_INJECT,
+};
+
+struct sof_probe_point_desc {
+	unsigned int buffer_id;
+	unsigned int purpose;
+	unsigned int stream_tag;
+} __packed;
+
+struct sof_ipc_probe_dma_add_params {
+	struct sof_ipc_cmd_hdr hdr;
+	unsigned int num_elems;
+	struct sof_probe_dma dma[0];
+} __packed;
+
+struct sof_ipc_probe_info_params {
+	struct sof_ipc_reply rhdr;
+	unsigned int num_elems;
+	union {
+		struct sof_probe_dma dma[0];
+		struct sof_probe_point_desc desc[0];
+	};
+} __packed;
+
+struct sof_ipc_probe_dma_remove_params {
+	struct sof_ipc_cmd_hdr hdr;
+	unsigned int num_elems;
+	unsigned int stream_tag[0];
+} __packed;
+
+struct sof_ipc_probe_point_add_params {
+	struct sof_ipc_cmd_hdr hdr;
+	unsigned int num_elems;
+	struct sof_probe_point_desc desc[0];
+} __packed;
+
+struct sof_ipc_probe_point_remove_params {
+	struct sof_ipc_cmd_hdr hdr;
+	unsigned int num_elems;
+	unsigned int buffer_id[0];
+} __packed;
+
+int sof_ipc_probe_init(struct snd_sof_dev *sdev,
+		u32 stream_tag, size_t buffer_size);
+int sof_ipc_probe_deinit(struct snd_sof_dev *sdev);
+int sof_ipc_probe_dma_info(struct snd_sof_dev *sdev,
+		struct sof_probe_dma **dma, size_t *num_dma);
+int sof_ipc_probe_dma_add(struct snd_sof_dev *sdev,
+		struct sof_probe_dma *dma, size_t num_dma);
+int sof_ipc_probe_dma_remove(struct snd_sof_dev *sdev,
+		unsigned int *stream_tag, size_t num_stream_tag);
+int sof_ipc_probe_points_info(struct snd_sof_dev *sdev,
+		struct sof_probe_point_desc **desc, size_t *num_desc);
+int sof_ipc_probe_points_add(struct snd_sof_dev *sdev,
+		struct sof_probe_point_desc *desc, size_t num_desc);
+int sof_ipc_probe_points_remove(struct snd_sof_dev *sdev,
+		unsigned int *buffer_id, size_t num_id);
+
+#endif
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 00084471d0de..d9188b82acdc 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -405,6 +405,9 @@ struct snd_sof_dev {
 	wait_queue_head_t waitq;
 	int code_loading;
 
+	/* probes */
+	unsigned int extractor;
+
 	/* DMA for Trace */
 	struct snd_dma_buffer dmatb;
 	struct snd_dma_buffer dmatp;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEA1613413
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 11:56:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 046861673;
	Mon, 31 Oct 2022 11:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 046861673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667213778;
	bh=n6ORNpwKxXhSoZp9at4ndm0cJYD7pZ+W4OYe/f/q2O4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1r8akUfwnG+PNKZ3CZFe3ZRty3KYn9qUdvG6obh58+hwNruhJNCXbXURNluK++ie
	 rsfrmoiALR4mf5JPtrwdcimqtjcgNH4CNHpAr3LBkxIXEzFYUJu32ic4qqkzUlM2Gx
	 RhTeiRyexu8638hwu3diHTVbsfcMjtd6sFWt4pFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86A9FF8055B;
	Mon, 31 Oct 2022 11:54:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1AA6F8055A; Mon, 31 Oct 2022 11:54:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C1DDF8021D
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C1DDF8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RmiQqjRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667213671; x=1698749671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n6ORNpwKxXhSoZp9at4ndm0cJYD7pZ+W4OYe/f/q2O4=;
 b=RmiQqjRztqpfCMyHXOcFUvol8Kip3HSpPNkk++BEZEdiosYYll1JZIWP
 SGbACXVHZ8FrKLjCfVkFmPYjZqkmRNFhYb+7NUnC9BKgSu3FnaRLuv6X9
 1laN5hKKThiUZU+97OItvFHqHVUGdu6yBv+s1Xf0Yi01E1SEC73k+hpL7
 9vjyWXF1eH3TIdBvZki8JTXSkATV68D0ozbsowWBcMhsexkOEYtJSdLF4
 ESAiBrpJgEiBb0/OfPMp/6hr3+pimOVJ4P2JLgwXAJe3pS/wiHxsIeLav
 FEnxwF+VIJo70HKY9NVbVLbxXZRheanZmRsYd6vZrRIIs6cBqXynl7cHR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="308868464"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="308868464"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="633488010"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="633488010"
Received: from vbhutani-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.109])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:18 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	jyri.sarha@intel.com
Subject: [PATCH 2/5] ASoC: SOF: probes: Separate IPC3 operations to a separate
 file
Date: Mon, 31 Oct 2022 12:51:38 +0200
Message-Id: <20221031105141.19037-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031105141.19037-1-peter.ujfalusi@linux.intel.com>
References: <20221031105141.19037-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

From: Jyri Sarha <jyri.sarha@intel.com>

Declare an IPC ops struct for probes client device and move IPC3
functions behind it.

Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/Makefile                 |   2 +-
 sound/soc/sof/sof-client-probes-ipc3.c | 236 ++++++++++++++++++++++++
 sound/soc/sof/sof-client-probes.c      | 239 ++-----------------------
 sound/soc/sof/sof-client-probes.h      |  21 +++
 4 files changed, 272 insertions(+), 226 deletions(-)
 create mode 100644 sound/soc/sof/sof-client-probes-ipc3.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index eab7cc53f71a..6991a58474b9 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -26,7 +26,7 @@ snd-sof-of-objs := sof-of-dev.o
 
 snd-sof-ipc-flood-test-objs := sof-client-ipc-flood-test.o
 snd-sof-ipc-msg-injector-objs := sof-client-ipc-msg-injector.o
-snd-sof-probes-objs := sof-client-probes.o
+snd-sof-probes-objs := sof-client-probes.o sof-client-probes-ipc3.o
 
 snd-sof-nocodec-objs := nocodec.o
 
diff --git a/sound/soc/sof/sof-client-probes-ipc3.c b/sound/soc/sof/sof-client-probes-ipc3.c
new file mode 100644
index 000000000000..ef768db5f04d
--- /dev/null
+++ b/sound/soc/sof/sof-client-probes-ipc3.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2019-2022 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+// Code moved to this file by:
+//  Jyri Sarha <jyri.sarha@intel.com>
+//
+
+#include <linux/stddef.h>
+#include <sound/soc.h>
+#include <sound/sof/header.h>
+#include "sof-client.h"
+#include "sof-client-probes.h"
+
+struct sof_probe_dma {
+	unsigned int stream_tag;
+	unsigned int dma_buffer_size;
+} __packed;
+
+struct sof_ipc_probe_dma_add_params {
+	struct sof_ipc_cmd_hdr hdr;
+	unsigned int num_elems;
+	struct sof_probe_dma dma[];
+} __packed;
+
+struct sof_ipc_probe_info_params {
+	struct sof_ipc_reply rhdr;
+	unsigned int num_elems;
+	union {
+		DECLARE_FLEX_ARRAY(struct sof_probe_dma, dma);
+		DECLARE_FLEX_ARRAY(struct sof_probe_point_desc, desc);
+	};
+} __packed;
+
+struct sof_ipc_probe_point_add_params {
+	struct sof_ipc_cmd_hdr hdr;
+	unsigned int num_elems;
+	struct sof_probe_point_desc desc[];
+} __packed;
+
+struct sof_ipc_probe_point_remove_params {
+	struct sof_ipc_cmd_hdr hdr;
+	unsigned int num_elems;
+	unsigned int buffer_id[];
+} __packed;
+
+/**
+ * ipc3_probes_init - initialize data probing
+ * @cdev:		SOF client device
+ * @stream_tag:		Extractor stream tag
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
+static int ipc3_probes_init(struct sof_client_dev *cdev, u32 stream_tag,
+			    size_t buffer_size)
+{
+	struct sof_ipc_probe_dma_add_params *msg;
+	size_t size = struct_size(msg, dma, 1);
+	struct sof_ipc_reply reply;
+	int ret;
+
+	msg = kmalloc(size, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+	msg->hdr.size = size;
+	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_INIT;
+	msg->num_elems = 1;
+	msg->dma[0].stream_tag = stream_tag;
+	msg->dma[0].dma_buffer_size = buffer_size;
+
+	ret = sof_client_ipc_tx_message(cdev, msg, &reply, sizeof(reply));
+	kfree(msg);
+	return ret;
+}
+
+/**
+ * ipc3_probes_deinit - cleanup after data probing
+ * @cdev:		SOF client device
+ *
+ * Host sends DEINIT request to free previously initialized probe
+ * on DSP side once it is no longer needed. DEINIT only when there
+ * are no probes connected and with all injectors detached.
+ */
+static int ipc3_probes_deinit(struct sof_client_dev *cdev)
+{
+	struct sof_ipc_cmd_hdr msg;
+	struct sof_ipc_reply reply;
+
+	msg.size = sizeof(msg);
+	msg.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DEINIT;
+
+	return sof_client_ipc_tx_message(cdev, &msg, &reply, sizeof(reply));
+}
+
+static int ipc3_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
+			    void **params, size_t *num_params)
+{
+	size_t max_msg_size = sof_client_get_ipc_max_payload_size(cdev);
+	struct sof_ipc_probe_info_params msg = {{{0}}};
+	struct sof_ipc_probe_info_params *reply;
+	size_t bytes;
+	int ret;
+
+	*params = NULL;
+	*num_params = 0;
+
+	reply = kzalloc(max_msg_size, GFP_KERNEL);
+	if (!reply)
+		return -ENOMEM;
+	msg.rhdr.hdr.size = sizeof(msg);
+	msg.rhdr.hdr.cmd = SOF_IPC_GLB_PROBE | cmd;
+
+	ret = sof_client_ipc_tx_message(cdev, &msg, reply, max_msg_size);
+	if (ret < 0 || reply->rhdr.error < 0)
+		goto exit;
+
+	if (!reply->num_elems)
+		goto exit;
+
+	if (cmd == SOF_IPC_PROBE_DMA_INFO)
+		bytes = sizeof(reply->dma[0]);
+	else
+		bytes = sizeof(reply->desc[0]);
+	bytes *= reply->num_elems;
+	*params = kmemdup(&reply->dma[0], bytes, GFP_KERNEL);
+	if (!*params) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+	*num_params = reply->num_elems;
+
+exit:
+	kfree(reply);
+	return ret;
+}
+
+/**
+ * ipc3_probes_points_info - retrieve list of active probe points
+ * @cdev:		SOF client device
+ * @desc:	Returned list of active probes
+ * @num_desc:	Returned count of active probes
+ *
+ * Host sends PROBE_POINT_INFO request to obtain list of active probe
+ * points, valid for disconnection when given probe is no longer
+ * required.
+ */
+static int ipc3_probes_points_info(struct sof_client_dev *cdev,
+				   struct sof_probe_point_desc **desc,
+				   size_t *num_desc)
+{
+	return ipc3_probes_info(cdev, SOF_IPC_PROBE_POINT_INFO,
+			       (void **)desc, num_desc);
+}
+
+/**
+ * ipc3_probes_points_add - connect specified probes
+ * @cdev:		SOF client device
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
+static int ipc3_probes_points_add(struct sof_client_dev *cdev,
+				  struct sof_probe_point_desc *desc,
+				  size_t num_desc)
+{
+	struct sof_ipc_probe_point_add_params *msg;
+	size_t size = struct_size(msg, desc, num_desc);
+	struct sof_ipc_reply reply;
+	int ret;
+
+	msg = kmalloc(size, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+	msg->hdr.size = size;
+	msg->num_elems = num_desc;
+	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_POINT_ADD;
+	memcpy(&msg->desc[0], desc, size - sizeof(*msg));
+
+	ret = sof_client_ipc_tx_message(cdev, msg, &reply, sizeof(reply));
+	kfree(msg);
+	return ret;
+}
+
+/**
+ * ipc3_probes_points_remove - disconnect specified probes
+ * @cdev:		SOF client device
+ * @buffer_id:		List of probe points to disconnect
+ * @num_buffer_id:	Number of elements in @desc
+ *
+ * Removes previously connected probes from list of active probe
+ * points and frees all resources on DSP side.
+ */
+static int ipc3_probes_points_remove(struct sof_client_dev *cdev,
+				     unsigned int *buffer_id,
+				     size_t num_buffer_id)
+{
+	struct sof_ipc_probe_point_remove_params *msg;
+	size_t size = struct_size(msg, buffer_id, num_buffer_id);
+	struct sof_ipc_reply reply;
+	int ret;
+
+	msg = kmalloc(size, GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+	msg->hdr.size = size;
+	msg->num_elems = num_buffer_id;
+	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_POINT_REMOVE;
+	memcpy(&msg->buffer_id[0], buffer_id, size - sizeof(*msg));
+
+	ret = sof_client_ipc_tx_message(cdev, msg, &reply, sizeof(reply));
+	kfree(msg);
+	return ret;
+}
+
+const struct sof_probes_ipc_ops ipc3_probe_ops =  {
+	.init = ipc3_probes_init,
+	.deinit = ipc3_probes_deinit,
+	.points_info = ipc3_probes_points_info,
+	.points_add = ipc3_probes_points_add,
+	.points_remove = ipc3_probes_points_remove,
+};
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index e767e53f53d1..af655366b758 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -37,226 +37,9 @@ struct sof_probes_priv {
 	struct snd_soc_card card;
 
 	const struct sof_probes_host_ops *host_ops;
+	const struct sof_probes_ipc_ops *ipc_ops;
 };
 
-struct sof_probe_point_desc {
-	unsigned int buffer_id;
-	unsigned int purpose;
-	unsigned int stream_tag;
-} __packed;
-
-struct sof_probe_dma {
-	unsigned int stream_tag;
-	unsigned int dma_buffer_size;
-} __packed;
-
-struct sof_ipc_probe_dma_add_params {
-	struct sof_ipc_cmd_hdr hdr;
-	unsigned int num_elems;
-	struct sof_probe_dma dma[];
-} __packed;
-
-struct sof_ipc_probe_info_params {
-	struct sof_ipc_reply rhdr;
-	unsigned int num_elems;
-	union {
-		DECLARE_FLEX_ARRAY(struct sof_probe_dma, dma);
-		DECLARE_FLEX_ARRAY(struct sof_probe_point_desc, desc);
-	};
-} __packed;
-
-struct sof_ipc_probe_point_add_params {
-	struct sof_ipc_cmd_hdr hdr;
-	unsigned int num_elems;
-	struct sof_probe_point_desc desc[];
-} __packed;
-
-struct sof_ipc_probe_point_remove_params {
-	struct sof_ipc_cmd_hdr hdr;
-	unsigned int num_elems;
-	unsigned int buffer_id[];
-} __packed;
-
-/**
- * sof_probes_init - initialize data probing
- * @cdev:		SOF client device
- * @stream_tag:		Extractor stream tag
- * @buffer_size:	DMA buffer size to set for extractor
- *
- * Host chooses whether extraction is supported or not by providing
- * valid stream tag to DSP. Once specified, stream described by that
- * tag will be tied to DSP for extraction for the entire lifetime of
- * probe.
- *
- * Probing is initialized only once and each INIT request must be
- * matched by DEINIT call.
- */
-static int sof_probes_init(struct sof_client_dev *cdev, u32 stream_tag,
-			   size_t buffer_size)
-{
-	struct sof_ipc_probe_dma_add_params *msg;
-	size_t size = struct_size(msg, dma, 1);
-	struct sof_ipc_reply reply;
-	int ret;
-
-	msg = kmalloc(size, GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-	msg->hdr.size = size;
-	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_INIT;
-	msg->num_elems = 1;
-	msg->dma[0].stream_tag = stream_tag;
-	msg->dma[0].dma_buffer_size = buffer_size;
-
-	ret = sof_client_ipc_tx_message(cdev, msg, &reply, sizeof(reply));
-	kfree(msg);
-	return ret;
-}
-
-/**
- * sof_probes_deinit - cleanup after data probing
- * @cdev:		SOF client device
- *
- * Host sends DEINIT request to free previously initialized probe
- * on DSP side once it is no longer needed. DEINIT only when there
- * are no probes connected and with all injectors detached.
- */
-static int sof_probes_deinit(struct sof_client_dev *cdev)
-{
-	struct sof_ipc_cmd_hdr msg;
-	struct sof_ipc_reply reply;
-
-	msg.size = sizeof(msg);
-	msg.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DEINIT;
-
-	return sof_client_ipc_tx_message(cdev, &msg, &reply, sizeof(reply));
-}
-
-static int sof_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
-			   void **params, size_t *num_params)
-{
-	size_t max_msg_size = sof_client_get_ipc_max_payload_size(cdev);
-	struct sof_ipc_probe_info_params msg = {{{0}}};
-	struct sof_ipc_probe_info_params *reply;
-	size_t bytes;
-	int ret;
-
-	*params = NULL;
-	*num_params = 0;
-
-	reply = kzalloc(max_msg_size, GFP_KERNEL);
-	if (!reply)
-		return -ENOMEM;
-	msg.rhdr.hdr.size = sizeof(msg);
-	msg.rhdr.hdr.cmd = SOF_IPC_GLB_PROBE | cmd;
-
-	ret = sof_client_ipc_tx_message(cdev, &msg, reply, max_msg_size);
-	if (ret < 0 || reply->rhdr.error < 0)
-		goto exit;
-
-	if (!reply->num_elems)
-		goto exit;
-
-	if (cmd == SOF_IPC_PROBE_DMA_INFO)
-		bytes = sizeof(reply->dma[0]);
-	else
-		bytes = sizeof(reply->desc[0]);
-	bytes *= reply->num_elems;
-	*params = kmemdup(&reply->dma[0], bytes, GFP_KERNEL);
-	if (!*params) {
-		ret = -ENOMEM;
-		goto exit;
-	}
-	*num_params = reply->num_elems;
-
-exit:
-	kfree(reply);
-	return ret;
-}
-
-/**
- * sof_probes_points_info - retrieve list of active probe points
- * @cdev:		SOF client device
- * @desc:	Returned list of active probes
- * @num_desc:	Returned count of active probes
- *
- * Host sends PROBE_POINT_INFO request to obtain list of active probe
- * points, valid for disconnection when given probe is no longer
- * required.
- */
-static int sof_probes_points_info(struct sof_client_dev *cdev,
-				  struct sof_probe_point_desc **desc,
-				  size_t *num_desc)
-{
-	return sof_probes_info(cdev, SOF_IPC_PROBE_POINT_INFO,
-			       (void **)desc, num_desc);
-}
-
-/**
- * sof_probes_points_add - connect specified probes
- * @cdev:		SOF client device
- * @desc:	List of probe points to connect
- * @num_desc:	Number of elements in @desc
- *
- * Dynamically connects to provided set of endpoints. Immediately
- * after connection is established, host must be prepared to
- * transfer data from or to target stream given the probing purpose.
- *
- * Each probe point should be removed using PROBE_POINT_REMOVE
- * request when no longer needed.
- */
-static int sof_probes_points_add(struct sof_client_dev *cdev,
-				 struct sof_probe_point_desc *desc,
-				 size_t num_desc)
-{
-	struct sof_ipc_probe_point_add_params *msg;
-	size_t size = struct_size(msg, desc, num_desc);
-	struct sof_ipc_reply reply;
-	int ret;
-
-	msg = kmalloc(size, GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-	msg->hdr.size = size;
-	msg->num_elems = num_desc;
-	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_POINT_ADD;
-	memcpy(&msg->desc[0], desc, size - sizeof(*msg));
-
-	ret = sof_client_ipc_tx_message(cdev, msg, &reply, sizeof(reply));
-	kfree(msg);
-	return ret;
-}
-
-/**
- * sof_probes_points_remove - disconnect specified probes
- * @cdev:		SOF client device
- * @buffer_id:		List of probe points to disconnect
- * @num_buffer_id:	Number of elements in @desc
- *
- * Removes previously connected probes from list of active probe
- * points and frees all resources on DSP side.
- */
-static int sof_probes_points_remove(struct sof_client_dev *cdev,
-				    unsigned int *buffer_id, size_t num_buffer_id)
-{
-	struct sof_ipc_probe_point_remove_params *msg;
-	size_t size = struct_size(msg, buffer_id, num_buffer_id);
-	struct sof_ipc_reply reply;
-	int ret;
-
-	msg = kmalloc(size, GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-	msg->hdr.size = size;
-	msg->num_elems = num_buffer_id;
-	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_POINT_REMOVE;
-	memcpy(&msg->buffer_id[0], buffer_id, size - sizeof(*msg));
-
-	ret = sof_client_ipc_tx_message(cdev, msg, &reply, sizeof(reply));
-	kfree(msg);
-	return ret;
-}
-
 static int sof_probes_compr_startup(struct snd_compr_stream *cstream,
 				    struct snd_soc_dai *dai)
 {
@@ -290,23 +73,24 @@ static int sof_probes_compr_shutdown(struct snd_compr_stream *cstream,
 	struct sof_client_dev *cdev = snd_soc_card_get_drvdata(card);
 	struct sof_probes_priv *priv = cdev->data;
 	const struct sof_probes_host_ops *ops = priv->host_ops;
+	const struct sof_probes_ipc_ops *ipc = priv->ipc_ops;
 	struct sof_probe_point_desc *desc;
 	size_t num_desc;
 	int i, ret;
 
 	/* disconnect all probe points */
-	ret = sof_probes_points_info(cdev, &desc, &num_desc);
+	ret = ipc->points_info(cdev, &desc, &num_desc);
 	if (ret < 0) {
 		dev_err(dai->dev, "Failed to get probe points: %d\n", ret);
 		goto exit;
 	}
 
 	for (i = 0; i < num_desc; i++)
-		sof_probes_points_remove(cdev, &desc[i].buffer_id, 1);
+		ipc->points_remove(cdev, &desc[i].buffer_id, 1);
 	kfree(desc);
 
 exit:
-	ret = sof_probes_deinit(cdev);
+	ret = ipc->deinit(cdev);
 	if (ret < 0)
 		dev_err(dai->dev, "Failed to deinit probe: %d\n", ret);
 
@@ -329,6 +113,7 @@ static int sof_probes_compr_set_params(struct snd_compr_stream *cstream,
 	struct snd_compr_runtime *rtd = cstream->runtime;
 	struct sof_probes_priv *priv = cdev->data;
 	const struct sof_probes_host_ops *ops = priv->host_ops;
+	const struct sof_probes_ipc_ops *ipc = priv->ipc_ops;
 	int ret;
 
 	cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
@@ -341,7 +126,7 @@ static int sof_probes_compr_set_params(struct snd_compr_stream *cstream,
 	if (ret)
 		return ret;
 
-	ret = sof_probes_init(cdev, priv->extractor_stream_tag, rtd->dma_bytes);
+	ret = ipc->init(cdev, priv->extractor_stream_tag, rtd->dma_bytes);
 	if (ret < 0) {
 		dev_err(dai->dev, "Failed to init probe: %d\n", ret);
 		return ret;
@@ -420,6 +205,7 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 	struct sof_probes_priv *priv = cdev->data;
 	struct device *dev = &cdev->auxdev.dev;
 	struct sof_probe_point_desc *desc;
+	const struct sof_probes_ipc_ops *ipc = priv->ipc_ops;
 	int remaining, offset;
 	size_t num_desc;
 	char *buf;
@@ -440,7 +226,7 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 		goto exit;
 	}
 
-	ret = sof_probes_points_info(cdev, &desc, &num_desc);
+	ret = ipc->points_info(cdev, &desc, &num_desc);
 	if (ret < 0)
 		goto exit;
 
@@ -476,6 +262,7 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 {
 	struct sof_client_dev *cdev = file->private_data;
 	struct sof_probes_priv *priv = cdev->data;
+	const struct sof_probes_ipc_ops *ipc = priv->ipc_ops;
 	struct device *dev = &cdev->auxdev.dev;
 	struct sof_probe_point_desc *desc;
 	u32 num_elems, *array;
@@ -506,7 +293,7 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 		goto exit;
 	}
 
-	ret = sof_probes_points_add(cdev, desc, bytes / sizeof(*desc));
+	ret = ipc->points_add(cdev, desc, bytes / sizeof(*desc));
 	if (!ret)
 		ret = count;
 
@@ -534,6 +321,7 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 {
 	struct sof_client_dev *cdev = file->private_data;
 	struct sof_probes_priv *priv = cdev->data;
+	const struct sof_probes_ipc_ops *ipc = priv->ipc_ops;
 	struct device *dev = &cdev->auxdev.dev;
 	int ret, err;
 	u32 *array;
@@ -553,7 +341,7 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 		goto exit;
 	}
 
-	ret = sof_probes_points_remove(cdev, &array[1], array[0]);
+	ret = ipc->points_remove(cdev, &array[1], array[0]);
 	if (!ret)
 		ret = count;
 
@@ -643,6 +431,7 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	}
 
 	priv->host_ops = ops;
+	priv->ipc_ops = &ipc3_probe_ops;
 	cdev->data = priv;
 
 	/* register probes component driver and dai */
diff --git a/sound/soc/sof/sof-client-probes.h b/sound/soc/sof/sof-client-probes.h
index 9e43f3c444f8..14bf468fbfb2 100644
--- a/sound/soc/sof/sof-client-probes.h
+++ b/sound/soc/sof/sof-client-probes.h
@@ -28,4 +28,25 @@ struct sof_probes_host_ops {
 		       struct snd_soc_dai *dai);
 };
 
+struct sof_probe_point_desc {
+	unsigned int buffer_id;
+	unsigned int purpose;
+	unsigned int stream_tag;
+} __packed;
+
+struct sof_probes_ipc_ops {
+	int (*init)(struct sof_client_dev *cdev, u32 stream_tag,
+		    size_t buffer_size);
+	int (*deinit)(struct sof_client_dev *cdev);
+	int (*points_info)(struct sof_client_dev *cdev,
+			   struct sof_probe_point_desc **desc,
+			   size_t *num_desc);
+	int (*points_add)(struct sof_client_dev *cdev,
+			  struct sof_probe_point_desc *desc,
+			  size_t num_desc);
+	int (*points_remove)(struct sof_client_dev *cdev,
+			     unsigned int *buffer_id, size_t num_buffer_id);
+};
+
+extern const struct sof_probes_ipc_ops ipc3_probe_ops;
 #endif
-- 
2.38.1


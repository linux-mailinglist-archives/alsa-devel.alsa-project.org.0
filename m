Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C859613416
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 11:57:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEFF81640;
	Mon, 31 Oct 2022 11:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEFF81640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667213822;
	bh=limiPvqzQXX/7Brs0BUo+Sup2ix2IbuzOK3aJ9tSvuc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DEDm1j0/szHrYN4qULPSaaV2FEMubW3ppYv3MhQNK6GXrLop85SGjgeX+lAZ4A3na
	 lLlSjBhzB/TeQdcdr/bTCpaoGiRKh4tW5vIMbBwYfaJPwf6v8FclbctSJXzzPhI4EZ
	 1UieetktrETgks52X/GA0IhU2QZQQ9mCZuI5zIZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C562EF80579;
	Mon, 31 Oct 2022 11:54:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3C9EF804FF; Mon, 31 Oct 2022 11:54:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8F7FF804FF
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:54:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F7FF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QxdBiV7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667213673; x=1698749673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=limiPvqzQXX/7Brs0BUo+Sup2ix2IbuzOK3aJ9tSvuc=;
 b=QxdBiV7LFCmNu9ONXPzBoPYfOnioqw1HfvtHAdJe2ezNL27zs6rxT8J2
 SVRgJ1gNDEm4ZRH2Wrjqs9t6N6CwoLTlcT3C80riiocVJYJal2MyStC6F
 m7kdJrx6oSVsyYFEkyeEcGKDBjiqd1eY8BxCNw843PyNBveP2tIlv5HdE
 QHTuLeDEh3f06Ng7Ez7Bn8RFOk9KfHKeRasLFGuOj90nC2VUKSuEoxh4O
 K36+xBlh7vhpI2JaYSDEoWH+9ftmvJqcG8yWePi5u1C11AuDhOh55O2Gn
 JWIu+odl5emCT96AZIuIPt8o1AgF62XDq3R2CUhxSe0B9MGM694f2e10Y g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="308868505"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="308868505"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="633488104"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="633488104"
Received: from vbhutani-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.109])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:28 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	jyri.sarha@intel.com
Subject: [PATCH 5/5] ASoC: SOF: IPC4: probes: Implement IPC4 ops for probes
 client device
Date: Mon, 31 Oct 2022 12:51:41 +0200
Message-Id: <20221031105141.19037-6-peter.ujfalusi@linux.intel.com>
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

Implement IPC operations for IPC4 messaging and add doxygen
documentation for the functions.

Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/Makefile                 |   8 +-
 sound/soc/sof/sof-client-probes-ipc4.c | 281 +++++++++++++++++++++++++
 sound/soc/sof/sof-client-probes.c      |  32 +--
 sound/soc/sof/sof-client-probes.h      |  13 ++
 4 files changed, 318 insertions(+), 16 deletions(-)
 create mode 100644 sound/soc/sof/sof-client-probes-ipc4.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 6991a58474b9..308d87639916 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -26,7 +26,13 @@ snd-sof-of-objs := sof-of-dev.o
 
 snd-sof-ipc-flood-test-objs := sof-client-ipc-flood-test.o
 snd-sof-ipc-msg-injector-objs := sof-client-ipc-msg-injector.o
-snd-sof-probes-objs := sof-client-probes.o sof-client-probes-ipc3.o
+snd-sof-probes-objs := sof-client-probes.o
+ifneq ($(CONFIG_SND_SOC_SOF_IPC3),)
+snd-sof-probes-objs += sof-client-probes-ipc3.o
+endif
+ifneq ($(CONFIG_SND_SOC_SOF_INTEL_IPC4),)
+snd-sof-probes-objs += sof-client-probes-ipc4.o
+endif
 
 snd-sof-nocodec-objs := nocodec.o
 
diff --git a/sound/soc/sof/sof-client-probes-ipc4.c b/sound/soc/sof/sof-client-probes-ipc4.c
new file mode 100644
index 000000000000..66fa7c2f390a
--- /dev/null
+++ b/sound/soc/sof/sof-client-probes-ipc4.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2019-2022 Intel Corporation. All rights reserved.
+//
+// Author: Jyri Sarha <jyri.sarha@intel.com>
+//
+
+#include <sound/soc.h>
+#include <sound/sof/ipc4/header.h>
+#include <uapi/sound/sof/header.h>
+#include "sof-priv.h"
+#include "ipc4-priv.h"
+#include "sof-client.h"
+#include "sof-client-probes.h"
+
+enum sof_ipc4_dma_type {
+	SOF_IPC4_DMA_HDA_HOST_OUTPUT = 0,
+	SOF_IPC4_DMA_HDA_HOST_INPUT = 1,
+	SOF_IPC4_DMA_HDA_LINK_OUTPUT = 8,
+	SOF_IPC4_DMA_HDA_LINK_INPUT = 9,
+	SOF_IPC4_DMA_DMIC_LINK_INPUT = 11,
+	SOF_IPC4_DMA_I2S_LINK_OUTPUT = 12,
+	SOF_IPC4_DMA_I2S_LINK_INPUT = 13,
+};
+
+enum sof_ipc4_probe_runtime_param {
+	SOF_IPC4_PROBE_INJECTION_DMA = 1,
+	SOF_IPC4_PROBE_INJECTION_DMA_DETACH,
+	SOF_IPC4_PROBE_POINTS,
+	SOF_IPC4_PROBE_POINTS_DISCONNECT,
+};
+
+struct sof_ipc4_probe_gtw_cfg {
+	u32 node_id;
+	u32 dma_buffer_size;
+} __packed __aligned(4);
+
+#define SOF_IPC4_PROBE_NODE_ID_INDEX(x)		((x) & GENMASK(7, 0))
+#define SOF_IPC4_PROBE_NODE_ID_TYPE(x)		(((x) << 8) & GENMASK(12, 8))
+
+struct sof_ipc4_probe_cfg {
+	struct sof_ipc4_base_module_cfg base;
+	struct sof_ipc4_probe_gtw_cfg gtw_cfg;
+} __packed __aligned(4);
+
+enum sof_ipc4_probe_type {
+	SOF_IPC4_PROBE_TYPE_INPUT = 0,
+	SOF_IPC4_PROBE_TYPE_OUTPUT,
+	SOF_IPC4_PROBE_TYPE_INTERNAL
+};
+
+struct sof_ipc4_probe_point {
+	u32 point_id;
+	u32 purpose;
+	u32 stream_tag;
+} __packed __aligned(4);
+
+#define INVALID_PIPELINE_ID      0xFF
+
+/**
+ * sof_ipc4_probe_get_module_info - Get IPC4 module info for probe module
+ * @cdev:		SOF client device
+ * @return:		Pointer to IPC4 probe module info
+ *
+ * Look up the IPC4 probe module info based on the hard coded uuid and
+ * store the value for the future calls.
+ */
+static struct sof_man4_module *sof_ipc4_probe_get_module_info(struct sof_client_dev *cdev)
+{
+	struct sof_probes_priv *priv = cdev->data;
+	struct device *dev = &cdev->auxdev.dev;
+	static const guid_t probe_uuid =
+		GUID_INIT(0x7CAD0808, 0xAB10, 0xCD23,
+			  0xEF, 0x45, 0x12, 0xAB, 0x34, 0xCD, 0x56, 0xEF);
+
+	if (!priv->ipc_priv) {
+		struct sof_ipc4_fw_module *fw_module =
+			sof_client_ipc4_find_module(cdev, &probe_uuid);
+
+		if (!fw_module) {
+			dev_err(dev, "%s: no matching uuid found", __func__);
+			return NULL;
+		}
+
+		priv->ipc_priv = &fw_module->man4_module_entry;
+	}
+
+	return (struct sof_man4_module *)priv->ipc_priv;
+}
+
+/**
+ * ipc4_probes_init - initialize data probing
+ * @cdev:		SOF client device
+ * @stream_tag:		Extractor stream tag
+ * @buffer_size:	DMA buffer size to set for extractor
+ * @return:		0 on success, negative error code on error
+ *
+ * Host chooses whether extraction is supported or not by providing
+ * valid stream tag to DSP. Once specified, stream described by that
+ * tag will be tied to DSP for extraction for the entire lifetime of
+ * probe.
+ *
+ * Probing is initialized only once and each INIT request must be
+ * matched by DEINIT call.
+ */
+static int ipc4_probes_init(struct sof_client_dev *cdev, u32 stream_tag,
+			    size_t buffer_size)
+{
+	struct sof_man4_module *mentry = sof_ipc4_probe_get_module_info(cdev);
+	struct sof_ipc4_msg msg;
+	struct sof_ipc4_probe_cfg cfg;
+
+	if (!mentry)
+		return -ENODEV;
+
+	memset(&cfg, '\0', sizeof(cfg));
+	cfg.gtw_cfg.node_id = SOF_IPC4_PROBE_NODE_ID_INDEX(stream_tag - 1) |
+		SOF_IPC4_PROBE_NODE_ID_TYPE(SOF_IPC4_DMA_HDA_HOST_INPUT);
+
+	cfg.gtw_cfg.dma_buffer_size = buffer_size;
+
+	msg.primary = mentry->id;
+	msg.primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_INIT_INSTANCE);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg.extension = SOF_IPC4_MOD_EXT_DST_MOD_INSTANCE(INVALID_PIPELINE_ID);
+	msg.extension |= SOF_IPC4_MOD_EXT_CORE_ID(0);
+
+	msg.data_size = sizeof(cfg);
+	msg.data_ptr = &cfg;
+
+	return sof_client_ipc_tx_message(cdev, &msg, NULL, 0);
+}
+
+/**
+ * ipc4_probes_deinit - cleanup after data probing
+ * @cdev:		SOF client device
+ * @return:		0 on success, negative error code on error
+ *
+ * Host sends DEINIT request to free previously initialized probe
+ * on DSP side once it is no longer needed. DEINIT only when there
+ * are no probes connected and with all injectors detached.
+ */
+static int ipc4_probes_deinit(struct sof_client_dev *cdev)
+{
+	struct sof_man4_module *mentry = sof_ipc4_probe_get_module_info(cdev);
+	struct sof_ipc4_msg msg;
+
+	msg.primary = mentry->id;
+	msg.primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_DELETE_INSTANCE);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg.extension = SOF_IPC4_MOD_EXT_DST_MOD_INSTANCE(INVALID_PIPELINE_ID);
+	msg.extension |= SOF_IPC4_MOD_EXT_CORE_ID(0);
+
+	msg.data_size = 0;
+	msg.data_ptr = NULL;
+
+	return sof_client_ipc_tx_message(cdev, &msg, NULL, 0);
+}
+
+/**
+ * ipc4_probes_points_info - retrieve list of active probe points
+ * @cdev:	SOF client device
+ * @desc:	Returned list of active probes
+ * @num_desc:	Returned count of active probes
+ * @return:	0 on success, negative error code on error
+ *
+ * Dummy implementation returning empty list of probes.
+ */
+static int ipc4_probes_points_info(struct sof_client_dev *cdev,
+				   struct sof_probe_point_desc **desc,
+				   size_t *num_desc)
+{
+	/* TODO: Firmware side implementation needed first */
+	*desc = NULL;
+	*num_desc = 0;
+	return 0;
+}
+
+/**
+ * ipc4_probes_points_add - connect specified probes
+ * @cdev:	SOF client device
+ * @desc:	List of probe points to connect
+ * @num_desc:	Number of elements in @desc
+ * @return:	0 on success, negative error code on error
+ *
+ * Translates the generic probe point presentation to an IPC4
+ * message to dynamically connect the provided set of endpoints.
+ */
+static int ipc4_probes_points_add(struct sof_client_dev *cdev,
+				  struct sof_probe_point_desc *desc,
+				  size_t num_desc)
+{
+	struct sof_man4_module *mentry = sof_ipc4_probe_get_module_info(cdev);
+	struct sof_ipc4_probe_point *points;
+	struct sof_ipc4_msg msg;
+	int i, ret;
+
+	/* The sof_probe_point_desc and sof_ipc4_probe_point structs
+	 * are of same size and even the integers are the same in the
+	 * same order, and similar meaning, but since there is no
+	 * performance issue I wrote the conversion explicitly open for
+	 * future development.
+	 */
+	points = kcalloc(num_desc, sizeof(*points), GFP_KERNEL);
+	if (!points)
+		return -ENOMEM;
+
+	for (i = 0; i < num_desc; i++) {
+		points[i].point_id = desc[i].buffer_id;
+		points[i].purpose = desc[i].purpose;
+		points[i].stream_tag = desc[i].stream_tag;
+	}
+
+	msg.primary = mentry->id;
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+
+	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_PROBE_POINTS);
+
+	msg.data_size = sizeof(*points) * num_desc;
+	msg.data_ptr = points;
+
+	ret = sof_client_ipc_set_get_data(cdev, &msg, true);
+
+	kfree(points);
+
+	return ret;
+}
+
+/**
+ * ipc4_probes_points_remove - disconnect specified probes
+ * @cdev:		SOF client device
+ * @buffer_id:		List of probe points to disconnect
+ * @num_buffer_id:	Number of elements in @desc
+ * @return:		0 on success, negative error code on error
+ *
+ * Converts the generic buffer_id to IPC4 probe_point_id and remove
+ * the probe points with an IPC4 for message.
+ */
+static int ipc4_probes_points_remove(struct sof_client_dev *cdev,
+				     unsigned int *buffer_id, size_t num_buffer_id)
+{
+	struct sof_man4_module *mentry = sof_ipc4_probe_get_module_info(cdev);
+	struct sof_ipc4_msg msg;
+	u32 *probe_point_ids;
+	int i, ret;
+
+	probe_point_ids = kcalloc(num_buffer_id, sizeof(*probe_point_ids),
+				  GFP_KERNEL);
+	if (!probe_point_ids)
+		return -ENOMEM;
+
+	for (i = 0; i < num_buffer_id; i++)
+		probe_point_ids[i] = buffer_id[i];
+
+	msg.primary = mentry->id;
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+
+	msg.extension =
+		SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_PROBE_POINTS_DISCONNECT);
+
+	msg.data_size = num_buffer_id * sizeof(*probe_point_ids);
+	msg.data_ptr = probe_point_ids;
+
+	ret = sof_client_ipc_set_get_data(cdev, &msg, true);
+
+	kfree(probe_point_ids);
+
+	return ret;
+}
+
+const struct sof_probes_ipc_ops ipc4_probe_ops =  {
+	.init = ipc4_probes_init,
+	.deinit = ipc4_probes_deinit,
+	.points_info = ipc4_probes_points_info,
+	.points_add = ipc4_probes_points_add,
+	.points_remove = ipc4_probes_points_remove,
+};
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index af655366b758..d08395182b1a 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -30,16 +30,6 @@ static bool __read_mostly sof_probes_enabled;
 module_param_named(enable, sof_probes_enabled, bool, 0444);
 MODULE_PARM_DESC(enable, "Enable SOF probes support");
 
-struct sof_probes_priv {
-	struct dentry *dfs_points;
-	struct dentry *dfs_points_remove;
-	u32 extractor_stream_tag;
-	struct snd_soc_card card;
-
-	const struct sof_probes_host_ops *host_ops;
-	const struct sof_probes_ipc_ops *ipc_ops;
-};
-
 static int sof_probes_compr_startup(struct snd_compr_stream *cstream,
 				    struct snd_soc_dai *dai)
 {
@@ -409,10 +399,6 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	if (!sof_probes_enabled)
 		return -ENXIO;
 
-	/* only ipc3 is supported */
-	if (sof_client_get_ipc_type(cdev) != SOF_IPC)
-		return -ENXIO;
-
 	if (!dev->platform_data) {
 		dev_err(dev, "missing platform data\n");
 		return -ENODEV;
@@ -431,7 +417,23 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	}
 
 	priv->host_ops = ops;
-	priv->ipc_ops = &ipc3_probe_ops;
+
+	switch (sof_client_get_ipc_type(cdev)) {
+#ifdef CONFIG_SND_SOC_SOF_INTEL_IPC4
+	case SOF_INTEL_IPC4:
+		priv->ipc_ops = &ipc4_probe_ops;
+		break;
+#endif
+#ifdef CONFIG_SND_SOC_SOF_IPC3
+	case SOF_IPC:
+		priv->ipc_ops = &ipc3_probe_ops;
+		break;
+#endif
+	default:
+		dev_err(dev, "Matching IPC ops not found.");
+		return -ENODEV;
+	}
+
 	cdev->data = priv;
 
 	/* register probes component driver and dai */
diff --git a/sound/soc/sof/sof-client-probes.h b/sound/soc/sof/sof-client-probes.h
index 14bf468fbfb2..da04d65b8d99 100644
--- a/sound/soc/sof/sof-client-probes.h
+++ b/sound/soc/sof/sof-client-probes.h
@@ -49,4 +49,17 @@ struct sof_probes_ipc_ops {
 };
 
 extern const struct sof_probes_ipc_ops ipc3_probe_ops;
+extern const struct sof_probes_ipc_ops ipc4_probe_ops;
+
+struct sof_probes_priv {
+	struct dentry *dfs_points;
+	struct dentry *dfs_points_remove;
+	u32 extractor_stream_tag;
+	struct snd_soc_card card;
+	void *ipc_priv;
+
+	const struct sof_probes_host_ops *host_ops;
+	const struct sof_probes_ipc_ops *ipc_ops;
+};
+
 #endif
-- 
2.38.1


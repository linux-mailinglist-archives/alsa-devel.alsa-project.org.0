Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1987640927
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:16:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BC8185D;
	Fri,  2 Dec 2022 16:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BC8185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994194;
	bh=iA3BYuG6HBd6gbReisCxP6CXflqm/Bhc9mWBC0gI6n0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3/Pc8pRUbskG3koitA6HA7Psfi0OaMICIWVzVWeGI62zlzZ43iRJ6NmFAOsiXqZb
	 cuV+3KZg/H3+GEsmZaEv3hKzL6HzwTj83sEhuyZwIiCFDV1k4olfAYuGjabv6JTET7
	 l0/B+vQnxwkcdQ+AHQyZRbi63cEQA74AptRqmO50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A88F804E2;
	Fri,  2 Dec 2022 16:13:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B29D0F804FC; Fri,  2 Dec 2022 16:13:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78E4CF8057B
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78E4CF8057B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g73Wi29h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993913; x=1701529913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iA3BYuG6HBd6gbReisCxP6CXflqm/Bhc9mWBC0gI6n0=;
 b=g73Wi29hbWp3dvKqn9BYGJ63/KwoNu2t5mHcUx7XOfUbl8piTfYpYSJv
 RWGFV2CiJYhg+3hElcy349YyOUWzvHg2iqRhd2D4T+ppPrI91jEjHgNXf
 3K6Dg4bRgYqpWH9M+EOqAeQgFCT7TpboiFXwRot+ZxI8d7IwpBiR+2w1C
 Rae0KNBWCg2LP4/pkEoDZEXLmxGK+RabwyS6BRIw7iuiKyYoJKDExTVg+
 XLpMjTT7+QqKkIGt0qZdMZi9fkXQIO11aLcZQ8fz7GTOnpy/9n5NwnAB0
 1t0qnktOaD9a6Lm+8xsFh/JC2lWggZ3gkXBgeStOg1skiRuSSzt4r720p g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251786"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251786"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504727"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504727"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:49 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 09/16] ASoC: Intel: avs: Add data probing requests
Date: Fri,  2 Dec 2022 16:28:34 +0100
Message-Id: <20221202152841.672536-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Data probing is a cAVS firmware functionality that allows for data
extraction and injection directly from or to DMA stream. To support it,
new functions and types are added. These facilitate communication
with the firmware.

Total of eight IPCs:
- probe module initialization and cleanup
- addition and removal of probe points
- addition and removal of injection DMAs
- dumping list of currently connected probe points or enlisted DMAs

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile   |  2 +-
 sound/soc/intel/avs/messages.c | 78 ++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/messages.h | 53 +++++++++++++++++++++++
 sound/soc/intel/avs/probes.c   | 46 ++++++++++++++++++++
 4 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/probes.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index a211a0b7b4a8..1c6924a1ebca 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -10,7 +10,7 @@ snd-soc-avs-objs += trace.o
 CFLAGS_trace.o := -I$(src)
 
 ifneq ($(CONFIG_DEBUG_FS),)
-snd-soc-avs-objs += debugfs.o
+snd-soc-avs-objs += probes.o debugfs.o
 endif
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index f734d49e42be..e11ae4246416 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -722,4 +722,82 @@ int avs_ipc_set_system_time(struct avs_dev *adev)
 	return avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
 					AVS_BASEFW_SYSTEM_TIME, (u8 *)&sys_time, sizeof(sys_time));
 }
+
+int avs_ipc_probe_get_dma(struct avs_dev *adev, struct avs_probe_dma **dmas, size_t *num_dmas)
+{
+	size_t payload_size;
+	u32 module_id;
+	u8 *payload;
+	int ret;
+
+	module_id = avs_get_module_id(adev, &AVS_PROBE_MOD_UUID);
+
+	ret = avs_ipc_get_large_config(adev, module_id, AVS_PROBE_INST_ID, AVS_PROBE_INJECTION_DMA,
+				       NULL, 0, &payload, &payload_size);
+	if (ret)
+		return ret;
+
+	*dmas = (struct avs_probe_dma *)payload;
+	*num_dmas = payload_size / sizeof(**dmas);
+
+	return 0;
+}
+
+int avs_ipc_probe_attach_dma(struct avs_dev *adev, struct avs_probe_dma *dmas, size_t num_dmas)
+{
+	u32 module_id = avs_get_module_id(adev, &AVS_PROBE_MOD_UUID);
+
+	return avs_ipc_set_large_config(adev, module_id, AVS_PROBE_INST_ID, AVS_PROBE_INJECTION_DMA,
+					(u8 *)dmas, array_size(sizeof(*dmas), num_dmas));
+}
+
+int avs_ipc_probe_detach_dma(struct avs_dev *adev, union avs_connector_node_id *node_ids,
+			     size_t num_node_ids)
+{
+	u32 module_id = avs_get_module_id(adev, &AVS_PROBE_MOD_UUID);
+
+	return avs_ipc_set_large_config(adev, module_id, AVS_PROBE_INST_ID,
+					AVS_PROBE_INJECTION_DMA_DETACH, (u8 *)node_ids,
+					array_size(sizeof(*node_ids), num_node_ids));
+}
+
+int avs_ipc_probe_get_points(struct avs_dev *adev, struct avs_probe_point_desc **descs,
+			     size_t *num_descs)
+{
+	size_t payload_size;
+	u32 module_id;
+	u8 *payload;
+	int ret;
+
+	module_id = avs_get_module_id(adev, &AVS_PROBE_MOD_UUID);
+
+	ret = avs_ipc_get_large_config(adev, module_id, AVS_PROBE_INST_ID, AVS_PROBE_POINTS, NULL,
+				       0, &payload, &payload_size);
+	if (ret)
+		return ret;
+
+	*descs = (struct avs_probe_point_desc *)payload;
+	*num_descs = payload_size / sizeof(**descs);
+
+	return 0;
+}
+
+int avs_ipc_probe_connect_points(struct avs_dev *adev, struct avs_probe_point_desc *descs,
+				 size_t num_descs)
+{
+	u32 module_id = avs_get_module_id(adev, &AVS_PROBE_MOD_UUID);
+
+	return avs_ipc_set_large_config(adev, module_id, AVS_PROBE_INST_ID, AVS_PROBE_POINTS,
+					(u8 *)descs, array_size(sizeof(*descs), num_descs));
+}
+
+int avs_ipc_probe_disconnect_points(struct avs_dev *adev, union avs_probe_point_id *ids,
+				    size_t num_ids)
+{
+	u32 module_id = avs_get_module_id(adev, &AVS_PROBE_MOD_UUID);
+
+	return avs_ipc_set_large_config(adev, module_id, AVS_PROBE_INST_ID,
+					AVS_PROBE_POINTS_DISCONNECT, (u8 *)ids,
+					array_size(sizeof(*ids), num_ids));
+}
 #endif
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 02b3b7a74783..9dd835527e02 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -802,4 +802,57 @@ int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
 				   const struct avs_audio_format *src_fmt,
 				   const struct avs_audio_format *sink_fmt);
 
+#define AVS_PROBE_INST_ID	0
+
+enum avs_probe_runtime_param {
+	AVS_PROBE_INJECTION_DMA = 1,
+	AVS_PROBE_INJECTION_DMA_DETACH,
+	AVS_PROBE_POINTS,
+	AVS_PROBE_POINTS_DISCONNECT,
+};
+
+struct avs_probe_dma {
+	union avs_connector_node_id node_id;
+	u32 dma_buffer_size;
+} __packed;
+
+enum avs_probe_type {
+	AVS_PROBE_TYPE_INPUT = 0,
+	AVS_PROBE_TYPE_OUTPUT,
+	AVS_PROBE_TYPE_INTERNAL
+};
+
+union avs_probe_point_id {
+	u32 value;
+	struct {
+		u32 module_id:16;
+		u32 instance_id:8;
+		u32 type:2;
+		u32 index:6;
+	} id;
+} __packed;
+
+enum avs_connection_purpose {
+	AVS_CONNECTION_PURPOSE_EXTRACT = 0,
+	AVS_CONNECTION_PURPOSE_INJECT,
+	AVS_CONNECTION_PURPOSE_INJECT_REEXTRACT,
+};
+
+struct avs_probe_point_desc {
+	union avs_probe_point_id id;
+	u32 purpose;
+	union avs_connector_node_id node_id;
+} __packed;
+
+int avs_ipc_probe_get_dma(struct avs_dev *adev, struct avs_probe_dma **dmas, size_t *num_dmas);
+int avs_ipc_probe_attach_dma(struct avs_dev *adev, struct avs_probe_dma *dmas, size_t num_dmas);
+int avs_ipc_probe_detach_dma(struct avs_dev *adev, union avs_connector_node_id *node_ids,
+			     size_t num_node_ids);
+int avs_ipc_probe_get_points(struct avs_dev *adev, struct avs_probe_point_desc **descs,
+			     size_t *num_descs);
+int avs_ipc_probe_connect_points(struct avs_dev *adev, struct avs_probe_point_desc *descs,
+				 size_t num_descs);
+int avs_ipc_probe_disconnect_points(struct avs_dev *adev, union avs_probe_point_id *ids,
+				    size_t num_ids);
+
 #endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
new file mode 100644
index 000000000000..339bad6fec22
--- /dev/null
+++ b/sound/soc/intel/avs/probes.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include "avs.h"
+#include "messages.h"
+
+__maybe_unused
+static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id node_id,
+			      size_t buffer_size)
+
+{
+	struct avs_probe_cfg cfg = {{0}};
+	struct avs_module_entry mentry;
+	u16 dummy;
+
+	avs_get_module_entry(adev, &AVS_PROBE_MOD_UUID, &mentry);
+
+	/*
+	 * Probe module uses no cycles, audio data format and input and output
+	 * frame sizes are unused. It is also not owned by any pipeline.
+	 */
+	cfg.base.ibs = 1;
+	/* BSS module descriptor is always segment of index=2. */
+	cfg.base.is_pages = mentry.segments[2].flags.length;
+	cfg.gtw_cfg.node_id = node_id;
+	cfg.gtw_cfg.dma_buffer_size = buffer_size;
+
+	return avs_dsp_init_module(adev, mentry.module_id, INVALID_PIPELINE_ID, 0, 0, &cfg,
+				   sizeof(cfg), &dummy);
+}
+
+__maybe_unused
+static void avs_dsp_delete_probe(struct avs_dev *adev)
+{
+	struct avs_module_entry mentry;
+
+	avs_get_module_entry(adev, &AVS_PROBE_MOD_UUID, &mentry);
+
+	/* There is only ever one probe module instance. */
+	avs_dsp_delete_module(adev, mentry.module_id, 0, INVALID_PIPELINE_ID, 0);
+}
-- 
2.25.1


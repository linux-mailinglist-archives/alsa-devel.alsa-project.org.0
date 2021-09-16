Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B61040D787
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 12:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8A06186E;
	Thu, 16 Sep 2021 12:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8A06186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631788534;
	bh=TQDR3NEJoQlVdY9ee/mcfbGDbbbTkh299c+k6Znbd28=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gzsGevgmhFFii+GlYy5GZDffEk092ywFe4gOi1tKAh0qx0Lx0nb6wH6h7B2p3FqB8
	 u8IXgtID7TNSLPpHm7FinOrT7bDJOSQ/BHlkGRpMww0TbYJZnR1PAS9sU35nEwL12v
	 yz04CRwWwr8mCs/1E3MVi5qmPH3X3U/o7GS9T2s0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 344DFF8032B;
	Thu, 16 Sep 2021 12:33:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8158F80117; Thu, 16 Sep 2021 12:33:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B62EFF804AE
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 12:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B62EFF804AE
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202031862"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="202031862"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="545473535"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 4/6] ASoC: SOF: probe: Merge and clean up the probe and
 compress files
Date: Thu, 16 Sep 2021 13:32:09 +0300
Message-Id: <20210916103211.1573-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
References: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The probe debug functionality is implemented via compress support and it
was spread across two set of files:
probe.c/h
compress.c/h

Merge the two files into sof-probes.s/h and clean them up by removing
unused struct definitions, functions. We can also move most of the
functions static as they are only used internally.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Makefile                  |   3 +-
 sound/soc/sof/compress.c                | 152 -------------
 sound/soc/sof/compress.h                |  19 --
 sound/soc/sof/core.c                    |   2 +-
 sound/soc/sof/debug.c                   |   2 +-
 sound/soc/sof/intel/hda-dai.c           |   2 +-
 sound/soc/sof/pcm.c                     |   2 +-
 sound/soc/sof/probe.h                   |  85 -------
 sound/soc/sof/{probe.c => sof-probes.c} | 280 +++++++++++++++---------
 sound/soc/sof/sof-probes.h              |  38 ++++
 10 files changed, 221 insertions(+), 364 deletions(-)
 delete mode 100644 sound/soc/sof/compress.c
 delete mode 100644 sound/soc/sof/compress.h
 delete mode 100644 sound/soc/sof/probe.h
 rename sound/soc/sof/{probe.c => sof-probes.c} (52%)
 create mode 100644 sound/soc/sof/sof-probes.h

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 606d8137cd98..bdea0faac117 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -2,7 +2,8 @@
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o utils.o sof-audio.o
-snd-sof-$(CONFIG_SND_SOC_SOF_DEBUG_PROBES) += probe.o compress.o
+
+snd-sof-$(CONFIG_SND_SOC_SOF_DEBUG_PROBES) += sof-probes.o
 
 snd-sof-pci-objs := sof-pci-dev.o
 snd-sof-acpi-objs := sof-acpi-dev.o
diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
deleted file mode 100644
index 3d12851dc6b3..000000000000
--- a/sound/soc/sof/compress.c
+++ /dev/null
@@ -1,152 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-//
-// This file is provided under a dual BSD/GPLv2 license.  When using or
-// redistributing this file, you may do so under either license.
-//
-// Copyright(c) 2019-2020 Intel Corporation. All rights reserved.
-//
-// Author: Cezary Rojewski <cezary.rojewski@intel.com>
-//
-
-#include <sound/soc.h>
-#include "compress.h"
-#include "ops.h"
-#include "probe.h"
-
-static int sof_probe_compr_open(struct snd_compr_stream *cstream,
-				struct snd_soc_dai *dai)
-{
-	struct snd_sof_dev *sdev =
-				snd_soc_component_get_drvdata(dai->component);
-	int ret;
-
-	ret = snd_sof_probe_compr_assign(sdev, cstream, dai);
-	if (ret < 0) {
-		dev_err(dai->dev, "Failed to assign probe stream: %d\n", ret);
-		return ret;
-	}
-
-	sdev->extractor_stream_tag = ret;
-	return 0;
-}
-
-static int sof_probe_compr_free(struct snd_compr_stream *cstream,
-				struct snd_soc_dai *dai)
-{
-	struct snd_sof_dev *sdev =
-				snd_soc_component_get_drvdata(dai->component);
-	struct sof_probe_point_desc *desc;
-	size_t num_desc;
-	int i, ret;
-
-	/* disconnect all probe points */
-	ret = sof_ipc_probe_points_info(sdev, &desc, &num_desc);
-	if (ret < 0) {
-		dev_err(dai->dev, "Failed to get probe points: %d\n", ret);
-		goto exit;
-	}
-
-	for (i = 0; i < num_desc; i++)
-		sof_ipc_probe_points_remove(sdev, &desc[i].buffer_id, 1);
-	kfree(desc);
-
-exit:
-	ret = sof_ipc_probe_deinit(sdev);
-	if (ret < 0)
-		dev_err(dai->dev, "Failed to deinit probe: %d\n", ret);
-
-	sdev->extractor_stream_tag = SOF_PROBE_INVALID_NODE_ID;
-	snd_compr_free_pages(cstream);
-
-	return snd_sof_probe_compr_free(sdev, cstream, dai);
-}
-
-static int sof_probe_compr_set_params(struct snd_compr_stream *cstream,
-				      struct snd_compr_params *params,
-				      struct snd_soc_dai *dai)
-{
-	struct snd_compr_runtime *rtd = cstream->runtime;
-	struct snd_sof_dev *sdev =
-				snd_soc_component_get_drvdata(dai->component);
-	int ret;
-
-	cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
-	cstream->dma_buffer.dev.dev = sdev->dev;
-	ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_sof_probe_compr_set_params(sdev, cstream, params, dai);
-	if (ret < 0)
-		return ret;
-
-	ret = sof_ipc_probe_init(sdev, sdev->extractor_stream_tag,
-				 rtd->dma_bytes);
-	if (ret < 0) {
-		dev_err(dai->dev, "Failed to init probe: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int sof_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
-				   struct snd_soc_dai *dai)
-{
-	struct snd_sof_dev *sdev =
-				snd_soc_component_get_drvdata(dai->component);
-
-	return snd_sof_probe_compr_trigger(sdev, cstream, cmd, dai);
-}
-
-static int sof_probe_compr_pointer(struct snd_compr_stream *cstream,
-				   struct snd_compr_tstamp *tstamp,
-				   struct snd_soc_dai *dai)
-{
-	struct snd_sof_dev *sdev =
-				snd_soc_component_get_drvdata(dai->component);
-
-	return snd_sof_probe_compr_pointer(sdev, cstream, tstamp, dai);
-}
-
-struct snd_soc_cdai_ops sof_probe_compr_ops = {
-	.startup	= sof_probe_compr_open,
-	.shutdown	= sof_probe_compr_free,
-	.set_params	= sof_probe_compr_set_params,
-	.trigger	= sof_probe_compr_trigger,
-	.pointer	= sof_probe_compr_pointer,
-};
-EXPORT_SYMBOL(sof_probe_compr_ops);
-
-static int sof_probe_compr_copy(struct snd_soc_component *component,
-				struct snd_compr_stream *cstream,
-				char __user *buf, size_t count)
-{
-	struct snd_compr_runtime *rtd = cstream->runtime;
-	unsigned int offset, n;
-	void *ptr;
-	int ret;
-
-	if (count > rtd->buffer_size)
-		count = rtd->buffer_size;
-
-	div_u64_rem(rtd->total_bytes_transferred, rtd->buffer_size, &offset);
-	ptr = rtd->dma_area + offset;
-	n = rtd->buffer_size - offset;
-
-	if (count < n) {
-		ret = copy_to_user(buf, ptr, count);
-	} else {
-		ret = copy_to_user(buf, ptr, n);
-		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
-	}
-
-	if (ret)
-		return count - ret;
-	return count;
-}
-
-const struct snd_compress_ops sof_probe_compressed_ops = {
-	.copy		= sof_probe_compr_copy,
-};
-EXPORT_SYMBOL(sof_probe_compressed_ops);
diff --git a/sound/soc/sof/compress.h b/sound/soc/sof/compress.h
deleted file mode 100644
index f49b3ddb4403..000000000000
--- a/sound/soc/sof/compress.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
-/*
- * This file is provided under a dual BSD/GPLv2 license.  When using or
- * redistributing this file, you may do so under either license.
- *
- * Copyright(c) 2019-2020 Intel Corporation. All rights reserved.
- *
- * Author: Cezary Rojewski <cezary.rojewski@intel.com>
- */
-
-#ifndef __SOF_COMPRESS_H
-#define __SOF_COMPRESS_H
-
-#include <sound/compress_driver.h>
-
-extern struct snd_soc_cdai_ops sof_probe_compr_ops;
-extern const struct snd_compress_ops sof_probe_compressed_ops;
-
-#endif
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 6be4f159ee35..b8989f926f8f 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -15,7 +15,7 @@
 #include "sof-priv.h"
 #include "ops.h"
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
-#include "probe.h"
+#include "sof-probes.h"
 #endif
 
 /* see SOF_DBG_ flags */
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index a51a928ea40a..d85ca9f3fc38 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -20,7 +20,7 @@
 #include "ops.h"
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
-#include "probe.h"
+#include "sof-probes.h"
 
 /**
  * strsplit_u32 - Split string into sequence of u32 tokens
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 46fb8add237e..2f54a659b78a 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -17,7 +17,7 @@
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
-#include "../compress.h"
+#include "../sof-probes.h"
 #endif
 
 struct hda_pipe_params {
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 2cfc0e24fec1..b4280459e5db 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -17,7 +17,7 @@
 #include "sof-audio.h"
 #include "ops.h"
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
-#include "compress.h"
+#include "sof-probes.h"
 #endif
 
 /* Create DMA buffer page table for DSP */
diff --git a/sound/soc/sof/probe.h b/sound/soc/sof/probe.h
deleted file mode 100644
index 5e159ab239fa..000000000000
--- a/sound/soc/sof/probe.h
+++ /dev/null
@@ -1,85 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
-/*
- * This file is provided under a dual BSD/GPLv2 license.  When using or
- * redistributing this file, you may do so under either license.
- *
- * Copyright(c) 2019-2020 Intel Corporation. All rights reserved.
- *
- * Author: Cezary Rojewski <cezary.rojewski@intel.com>
- */
-
-#ifndef __SOF_PROBE_H
-#define __SOF_PROBE_H
-
-#include <sound/sof/header.h>
-
-struct snd_sof_dev;
-
-#define SOF_PROBE_INVALID_NODE_ID UINT_MAX
-
-struct sof_probe_dma {
-	unsigned int stream_tag;
-	unsigned int dma_buffer_size;
-} __packed;
-
-enum sof_connection_purpose {
-	SOF_CONNECTION_PURPOSE_EXTRACT = 1,
-	SOF_CONNECTION_PURPOSE_INJECT,
-};
-
-struct sof_probe_point_desc {
-	unsigned int buffer_id;
-	unsigned int purpose;
-	unsigned int stream_tag;
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
-		struct sof_probe_dma dma[0];
-		struct sof_probe_point_desc desc[0];
-	};
-} __packed;
-
-struct sof_ipc_probe_dma_remove_params {
-	struct sof_ipc_cmd_hdr hdr;
-	unsigned int num_elems;
-	unsigned int stream_tag[];
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
-int sof_ipc_probe_init(struct snd_sof_dev *sdev,
-		u32 stream_tag, size_t buffer_size);
-int sof_ipc_probe_deinit(struct snd_sof_dev *sdev);
-int sof_ipc_probe_dma_info(struct snd_sof_dev *sdev,
-		struct sof_probe_dma **dma, size_t *num_dma);
-int sof_ipc_probe_dma_add(struct snd_sof_dev *sdev,
-		struct sof_probe_dma *dma, size_t num_dma);
-int sof_ipc_probe_dma_remove(struct snd_sof_dev *sdev,
-		unsigned int *stream_tag, size_t num_stream_tag);
-int sof_ipc_probe_points_info(struct snd_sof_dev *sdev,
-		struct sof_probe_point_desc **desc, size_t *num_desc);
-int sof_ipc_probe_points_add(struct snd_sof_dev *sdev,
-		struct sof_probe_point_desc *desc, size_t num_desc);
-int sof_ipc_probe_points_remove(struct snd_sof_dev *sdev,
-		unsigned int *buffer_id, size_t num_buffer_id);
-
-#endif
diff --git a/sound/soc/sof/probe.c b/sound/soc/sof/sof-probes.c
similarity index 52%
rename from sound/soc/sof/probe.c
rename to sound/soc/sof/sof-probes.c
index 14509f4d3f86..e394fc524445 100644
--- a/sound/soc/sof/probe.c
+++ b/sound/soc/sof/sof-probes.c
@@ -3,13 +3,46 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2019-2020 Intel Corporation. All rights reserved.
-//
+// Copyright(c) 2019-2021 Intel Corporation. All rights reserved.
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
 
+#include <sound/soc.h>
+#include "ops.h"
 #include "sof-priv.h"
-#include "probe.h"
+#include "sof-probes.h"
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
+		struct sof_probe_dma dma[0];
+		struct sof_probe_point_desc desc[0];
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
 
 /**
  * sof_ipc_probe_init - initialize data probing
@@ -25,8 +58,8 @@
  * Probing is initialized only once and each INIT request must be
  * matched by DEINIT call.
  */
-int sof_ipc_probe_init(struct snd_sof_dev *sdev,
-		u32 stream_tag, size_t buffer_size)
+static int sof_ipc_probe_init(struct snd_sof_dev *sdev, u32 stream_tag,
+			      size_t buffer_size)
 {
 	struct sof_ipc_probe_dma_add_params *msg;
 	struct sof_ipc_reply reply;
@@ -47,7 +80,6 @@ int sof_ipc_probe_init(struct snd_sof_dev *sdev,
 	kfree(msg);
 	return ret;
 }
-EXPORT_SYMBOL(sof_ipc_probe_init);
 
 /**
  * sof_ipc_probe_deinit - cleanup after data probing
@@ -57,7 +89,7 @@ EXPORT_SYMBOL(sof_ipc_probe_init);
  * on DSP side once it is no longer needed. DEINIT only when there
  * are no probes connected and with all injectors detached.
  */
-int sof_ipc_probe_deinit(struct snd_sof_dev *sdev)
+static int sof_ipc_probe_deinit(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc_cmd_hdr msg;
 	struct sof_ipc_reply reply;
@@ -68,10 +100,9 @@ int sof_ipc_probe_deinit(struct snd_sof_dev *sdev)
 	return sof_ipc_tx_message(sdev->ipc, msg.cmd, &msg, msg.size,
 			&reply, sizeof(reply));
 }
-EXPORT_SYMBOL(sof_ipc_probe_deinit);
 
 static int sof_ipc_probe_info(struct snd_sof_dev *sdev, unsigned int cmd,
-		void **params, size_t *num_params)
+			      void **params, size_t *num_params)
 {
 	struct sof_ipc_probe_info_params msg = {{{0}}};
 	struct sof_ipc_probe_info_params *reply;
@@ -112,97 +143,6 @@ static int sof_ipc_probe_info(struct snd_sof_dev *sdev, unsigned int cmd,
 	return ret;
 }
 
-/**
- * sof_ipc_probe_dma_info - retrieve list of active injection dmas
- * @sdev:	SOF sound device
- * @dma:	Returned list of active dmas
- * @num_dma:	Returned count of active dmas
- *
- * Host sends DMA_INFO request to obtain list of injection dmas it
- * can use to transfer data over with.
- *
- * Note that list contains only injection dmas as there is only one
- * extractor (dma) and it is always assigned on probing init.
- * DSP knows exactly where data from extraction probes is going to,
- * which is not the case for injection where multiple streams
- * could be engaged.
- */
-int sof_ipc_probe_dma_info(struct snd_sof_dev *sdev,
-		struct sof_probe_dma **dma, size_t *num_dma)
-{
-	return sof_ipc_probe_info(sdev, SOF_IPC_PROBE_DMA_INFO,
-			(void **)dma, num_dma);
-}
-EXPORT_SYMBOL(sof_ipc_probe_dma_info);
-
-/**
- * sof_ipc_probe_dma_add - attach to specified dmas
- * @sdev:	SOF sound device
- * @dma:	List of streams (dmas) to attach to
- * @num_dma:	Number of elements in @dma
- *
- * Contrary to extraction, injection streams are never assigned
- * on init. Before attempting any data injection, host is responsible
- * for specifying streams which will be later used to transfer data
- * to connected probe points.
- */
-int sof_ipc_probe_dma_add(struct snd_sof_dev *sdev,
-		struct sof_probe_dma *dma, size_t num_dma)
-{
-	struct sof_ipc_probe_dma_add_params *msg;
-	struct sof_ipc_reply reply;
-	size_t size = struct_size(msg, dma, num_dma);
-	int ret;
-
-	msg = kmalloc(size, GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-	msg->hdr.size = size;
-	msg->num_elems = num_dma;
-	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DMA_ADD;
-	memcpy(&msg->dma[0], dma, size - sizeof(*msg));
-
-	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg, msg->hdr.size,
-			&reply, sizeof(reply));
-	kfree(msg);
-	return ret;
-}
-EXPORT_SYMBOL(sof_ipc_probe_dma_add);
-
-/**
- * sof_ipc_probe_dma_remove - detach from specified dmas
- * @sdev:		SOF sound device
- * @stream_tag:		List of stream tags to detach from
- * @num_stream_tag:	Number of elements in @stream_tag
- *
- * Host sends DMA_REMOVE request to free previously attached stream
- * from being occupied for injection. Each detach operation should
- * match equivalent DMA_ADD. Detach only when all probes tied to
- * given stream have been disconnected.
- */
-int sof_ipc_probe_dma_remove(struct snd_sof_dev *sdev,
-		unsigned int *stream_tag, size_t num_stream_tag)
-{
-	struct sof_ipc_probe_dma_remove_params *msg;
-	struct sof_ipc_reply reply;
-	size_t size = struct_size(msg, stream_tag, num_stream_tag);
-	int ret;
-
-	msg = kmalloc(size, GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-	msg->hdr.size = size;
-	msg->num_elems = num_stream_tag;
-	msg->hdr.cmd = SOF_IPC_GLB_PROBE | SOF_IPC_PROBE_DMA_REMOVE;
-	memcpy(&msg->stream_tag[0], stream_tag, size - sizeof(*msg));
-
-	ret = sof_ipc_tx_message(sdev->ipc, msg->hdr.cmd, msg, msg->hdr.size,
-			&reply, sizeof(reply));
-	kfree(msg);
-	return ret;
-}
-EXPORT_SYMBOL(sof_ipc_probe_dma_remove);
-
 /**
  * sof_ipc_probe_points_info - retrieve list of active probe points
  * @sdev:	SOF sound device
@@ -214,7 +154,8 @@ EXPORT_SYMBOL(sof_ipc_probe_dma_remove);
  * required.
  */
 int sof_ipc_probe_points_info(struct snd_sof_dev *sdev,
-		struct sof_probe_point_desc **desc, size_t *num_desc)
+			      struct sof_probe_point_desc **desc,
+			      size_t *num_desc)
 {
 	return sof_ipc_probe_info(sdev, SOF_IPC_PROBE_POINT_INFO,
 				 (void **)desc, num_desc);
@@ -235,7 +176,7 @@ EXPORT_SYMBOL(sof_ipc_probe_points_info);
  * request when no longer needed.
  */
 int sof_ipc_probe_points_add(struct snd_sof_dev *sdev,
-		struct sof_probe_point_desc *desc, size_t num_desc)
+			     struct sof_probe_point_desc *desc, size_t num_desc)
 {
 	struct sof_ipc_probe_point_add_params *msg;
 	struct sof_ipc_reply reply;
@@ -267,7 +208,7 @@ EXPORT_SYMBOL(sof_ipc_probe_points_add);
  * points and frees all resources on DSP side.
  */
 int sof_ipc_probe_points_remove(struct snd_sof_dev *sdev,
-		unsigned int *buffer_id, size_t num_buffer_id)
+				unsigned int *buffer_id, size_t num_buffer_id)
 {
 	struct sof_ipc_probe_point_remove_params *msg;
 	struct sof_ipc_reply reply;
@@ -288,3 +229,136 @@ int sof_ipc_probe_points_remove(struct snd_sof_dev *sdev,
 	return ret;
 }
 EXPORT_SYMBOL(sof_ipc_probe_points_remove);
+
+static int sof_probe_compr_open(struct snd_compr_stream *cstream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+	int ret;
+
+	ret = snd_sof_probe_compr_assign(sdev, cstream, dai);
+	if (ret < 0) {
+		dev_err(dai->dev, "Failed to assign probe stream: %d\n", ret);
+		return ret;
+	}
+
+	sdev->extractor_stream_tag = ret;
+	return 0;
+}
+
+static int sof_probe_compr_free(struct snd_compr_stream *cstream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+	struct sof_probe_point_desc *desc;
+	size_t num_desc;
+	int i, ret;
+
+	/* disconnect all probe points */
+	ret = sof_ipc_probe_points_info(sdev, &desc, &num_desc);
+	if (ret < 0) {
+		dev_err(dai->dev, "Failed to get probe points: %d\n", ret);
+		goto exit;
+	}
+
+	for (i = 0; i < num_desc; i++)
+		sof_ipc_probe_points_remove(sdev, &desc[i].buffer_id, 1);
+	kfree(desc);
+
+exit:
+	ret = sof_ipc_probe_deinit(sdev);
+	if (ret < 0)
+		dev_err(dai->dev, "Failed to deinit probe: %d\n", ret);
+
+	sdev->extractor_stream_tag = SOF_PROBE_INVALID_NODE_ID;
+	snd_compr_free_pages(cstream);
+
+	return snd_sof_probe_compr_free(sdev, cstream, dai);
+}
+
+static int sof_probe_compr_set_params(struct snd_compr_stream *cstream,
+				      struct snd_compr_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+	struct snd_compr_runtime *rtd = cstream->runtime;
+	int ret;
+
+	cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
+	cstream->dma_buffer.dev.dev = sdev->dev;
+	ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_sof_probe_compr_set_params(sdev, cstream, params, dai);
+	if (ret < 0)
+		return ret;
+
+	ret = sof_ipc_probe_init(sdev, sdev->extractor_stream_tag,
+				 rtd->dma_bytes);
+	if (ret < 0) {
+		dev_err(dai->dev, "Failed to init probe: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sof_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+
+	return snd_sof_probe_compr_trigger(sdev, cstream, cmd, dai);
+}
+
+static int sof_probe_compr_pointer(struct snd_compr_stream *cstream,
+				   struct snd_compr_tstamp *tstamp,
+				   struct snd_soc_dai *dai)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+
+	return snd_sof_probe_compr_pointer(sdev, cstream, tstamp, dai);
+}
+
+struct snd_soc_cdai_ops sof_probe_compr_ops = {
+	.startup	= sof_probe_compr_open,
+	.shutdown	= sof_probe_compr_free,
+	.set_params	= sof_probe_compr_set_params,
+	.trigger	= sof_probe_compr_trigger,
+	.pointer	= sof_probe_compr_pointer,
+};
+EXPORT_SYMBOL(sof_probe_compr_ops);
+
+static int sof_probe_compr_copy(struct snd_soc_component *component,
+				struct snd_compr_stream *cstream,
+				char __user *buf, size_t count)
+{
+	struct snd_compr_runtime *rtd = cstream->runtime;
+	unsigned int offset, n;
+	void *ptr;
+	int ret;
+
+	if (count > rtd->buffer_size)
+		count = rtd->buffer_size;
+
+	div_u64_rem(rtd->total_bytes_transferred, rtd->buffer_size, &offset);
+	ptr = rtd->dma_area + offset;
+	n = rtd->buffer_size - offset;
+
+	if (count < n) {
+		ret = copy_to_user(buf, ptr, count);
+	} else {
+		ret = copy_to_user(buf, ptr, n);
+		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
+	}
+
+	if (ret)
+		return count - ret;
+	return count;
+}
+
+const struct snd_compress_ops sof_probe_compressed_ops = {
+	.copy		= sof_probe_compr_copy,
+};
+EXPORT_SYMBOL(sof_probe_compressed_ops);
diff --git a/sound/soc/sof/sof-probes.h b/sound/soc/sof/sof-probes.h
new file mode 100644
index 000000000000..35e1dd8d9e03
--- /dev/null
+++ b/sound/soc/sof/sof-probes.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2019-2021 Intel Corporation. All rights reserved.
+ * Author: Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#ifndef __SOF_PROBES_H
+#define __SOF_PROBES_H
+
+#include <sound/compress_driver.h>
+#include <sound/sof/header.h>
+
+struct snd_sof_dev;
+
+#define SOF_PROBE_INVALID_NODE_ID UINT_MAX
+
+struct sof_probe_point_desc {
+	unsigned int buffer_id;
+	unsigned int purpose;
+	unsigned int stream_tag;
+} __packed;
+
+int sof_ipc_probe_points_info(struct snd_sof_dev *sdev,
+			      struct sof_probe_point_desc **desc,
+			      size_t *num_desc);
+int sof_ipc_probe_points_add(struct snd_sof_dev *sdev,
+			     struct sof_probe_point_desc *desc,
+			     size_t num_desc);
+int sof_ipc_probe_points_remove(struct snd_sof_dev *sdev,
+				unsigned int *buffer_id, size_t num_buffer_id);
+
+extern struct snd_soc_cdai_ops sof_probe_compr_ops;
+extern const struct snd_compress_ops sof_probe_compressed_ops;
+
+#endif
-- 
2.33.0


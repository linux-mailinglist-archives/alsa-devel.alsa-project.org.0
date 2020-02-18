Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D11628C2
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:44:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D355016A6;
	Tue, 18 Feb 2020 15:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D355016A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582037061;
	bh=F7wbkszk7D1kZLHVDNWnFAquIiAwT2mGwFgbsx7wNqg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1GkabHDTDY5CgGsdtg1egqOhCftCBPmpiWazOKvvg4VJsm6D6RjnlqiJY3DoAT12
	 hM5miTZzAzwIjz6wKYedWAsGoY10t9QapoSc5ODzpbGqufDVdQR+WSLuD4058FYsZb
	 D6MsszqPTuQPlU2cajw3KWvYszbaYHqk9kWMczz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA16CF8028D;
	Tue, 18 Feb 2020 15:40:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 190DAF8027B; Tue, 18 Feb 2020 15:40:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7029F80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:40:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7029F80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 06:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="235549859"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2020 06:40:07 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 5/9] ASoC: SOF: Generic probe compress operations
Date: Tue, 18 Feb 2020 15:39:20 +0100
Message-Id: <20200218143924.10565-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218143924.10565-1-cezary.rojewski@intel.com>
References: <20200218143924.10565-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

Define system-agnostic probe compress flow which serves as a base for
actual, hardware-dependent implementations.
As per firmware spec, maximum of one extraction stream is allowed, while
for injection, there can be plenty.

Apart from probe_pointer, all probe compress operations are mandatory.
Copy operation is defined as unified as its flow should be shared across
all SOF systems.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v4:
- 'probe' source added in patch "ASoC: SOF: Implement Probe IPC API" now
  only compiled if SND_SOC_SOF_DEBUG_PROBES is enabled. Said kconfig
  initial declaration has been moved to that patch too
- 'extractor_stream_tag' field now decorated with _DEBUG_PROBES to
  account for the change above

Changes in v3:
- 'extractor' field has been relocated to this patch from: "[PATCH v3
  07/11] ASoC: SOF: Implement Probe IPC API"
- 'extractor' field has been renamed to 'extractor_stream_tag'
- _DEBUG_PROBES kconfig moved outside of _DEVELOPER_SUPPORT block


 sound/soc/sof/Kconfig    |   1 +
 sound/soc/sof/Makefile   |   2 +-
 sound/soc/sof/compress.c | 141 +++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/compress.h |  29 ++++++++
 sound/soc/sof/core.c     |   6 ++
 sound/soc/sof/ops.h      |  43 ++++++++++++
 sound/soc/sof/sof-priv.h |  25 +++++++
 7 files changed, 246 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/compress.c
 create mode 100644 sound/soc/sof/compress.h

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 65c3cfbcb812..4dda4b62509f 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -43,6 +43,7 @@ config SND_SOC_SOF_OF
 
 config SND_SOC_SOF_DEBUG_PROBES
 	bool "SOF enable data probing"
+	select SND_SOC_COMPRESS
 	help
 	  This option enables the data probing feature that can be used to
 	  gather data directly from specific points of the audio pipeline.
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 18d7cab9046e..8eca2f85c90e 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -2,7 +2,7 @@
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o utils.o sof-audio.o
-snd-sof-$(CONFIG_SND_SOC_SOF_DEBUG_PROBES) += probe.o
+snd-sof-$(CONFIG_SND_SOC_SOF_DEBUG_PROBES) += probe.o compress.o
 
 snd-sof-pci-objs := sof-pci-dev.o
 snd-sof-acpi-objs := sof-acpi-dev.o
diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
new file mode 100644
index 000000000000..e87cc81a0599
--- /dev/null
+++ b/sound/soc/sof/compress.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2019-2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <sound/soc.h>
+#include "compress.h"
+#include "ops.h"
+#include "probe.h"
+
+int sof_probe_compr_open(struct snd_compr_stream *cstream,
+		struct snd_soc_dai *dai)
+{
+	struct snd_sof_dev *sdev =
+				snd_soc_component_get_drvdata(dai->component);
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
+EXPORT_SYMBOL(sof_probe_compr_open);
+
+int sof_probe_compr_free(struct snd_compr_stream *cstream,
+		struct snd_soc_dai *dai)
+{
+	struct snd_sof_dev *sdev =
+				snd_soc_component_get_drvdata(dai->component);
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
+EXPORT_SYMBOL(sof_probe_compr_free);
+
+int sof_probe_compr_set_params(struct snd_compr_stream *cstream,
+		struct snd_compr_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_compr_runtime *rtd = cstream->runtime;
+	struct snd_sof_dev *sdev =
+				snd_soc_component_get_drvdata(dai->component);
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
+EXPORT_SYMBOL(sof_probe_compr_set_params);
+
+int sof_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
+		struct snd_soc_dai *dai)
+{
+	struct snd_sof_dev *sdev =
+				snd_soc_component_get_drvdata(dai->component);
+
+	return snd_sof_probe_compr_trigger(sdev, cstream, cmd, dai);
+}
+EXPORT_SYMBOL(sof_probe_compr_trigger);
+
+int sof_probe_compr_pointer(struct snd_compr_stream *cstream,
+		struct snd_compr_tstamp *tstamp, struct snd_soc_dai *dai)
+{
+	struct snd_sof_dev *sdev =
+				snd_soc_component_get_drvdata(dai->component);
+
+	return snd_sof_probe_compr_pointer(sdev, cstream, tstamp, dai);
+}
+EXPORT_SYMBOL(sof_probe_compr_pointer);
+
+int sof_probe_compr_copy(struct snd_compr_stream *cstream,
+		char __user *buf, size_t count)
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
+EXPORT_SYMBOL(sof_probe_compr_copy);
diff --git a/sound/soc/sof/compress.h b/sound/soc/sof/compress.h
new file mode 100644
index 000000000000..dccc9e008f81
--- /dev/null
+++ b/sound/soc/sof/compress.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2019-2020 Intel Corporation. All rights reserved.
+ *
+ * Author: Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#ifndef __SOF_COMPRESS_H
+#define __SOF_COMPRESS_H
+
+#include <sound/compress_driver.h>
+
+int sof_probe_compr_open(struct snd_compr_stream *cstream,
+		struct snd_soc_dai *dai);
+int sof_probe_compr_free(struct snd_compr_stream *cstream,
+		struct snd_soc_dai *dai);
+int sof_probe_compr_set_params(struct snd_compr_stream *cstream,
+		struct snd_compr_params *params, struct snd_soc_dai *dai);
+int sof_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
+		struct snd_soc_dai *dai);
+int sof_probe_compr_pointer(struct snd_compr_stream *cstream,
+		struct snd_compr_tstamp *tstamp, struct snd_soc_dai *dai);
+int sof_probe_compr_copy(struct snd_compr_stream *cstream,
+		char __user *buf, size_t count);
+
+#endif
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 1d07450aff77..91acfae7935c 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -14,6 +14,9 @@
 #include <sound/sof.h>
 #include "sof-priv.h"
 #include "ops.h"
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+#include "probe.h"
+#endif
 
 /* see SOF_DBG_ flags */
 int sof_core_debug;
@@ -292,6 +295,9 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	sdev->pdata = plat_data;
 	sdev->first_boot = true;
 	sdev->fw_state = SOF_FW_BOOT_NOT_STARTED;
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+	sdev->extractor_stream_tag = SOF_PROBE_INVALID_NODE_ID;
+#endif
 	dev_set_drvdata(dev, sdev);
 
 	/* check all mandatory ops */
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 7f532bcc8e9d..a771500ac442 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -393,6 +393,49 @@ snd_sof_pcm_platform_pointer(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+static inline int
+snd_sof_probe_compr_assign(struct snd_sof_dev *sdev,
+		struct snd_compr_stream *cstream, struct snd_soc_dai *dai)
+{
+	return sof_ops(sdev)->probe_assign(sdev, cstream, dai);
+}
+
+static inline int
+snd_sof_probe_compr_free(struct snd_sof_dev *sdev,
+		struct snd_compr_stream *cstream, struct snd_soc_dai *dai)
+{
+	return sof_ops(sdev)->probe_free(sdev, cstream, dai);
+}
+
+static inline int
+snd_sof_probe_compr_set_params(struct snd_sof_dev *sdev,
+		struct snd_compr_stream *cstream,
+		struct snd_compr_params *params, struct snd_soc_dai *dai)
+{
+	return sof_ops(sdev)->probe_set_params(sdev, cstream, params, dai);
+}
+
+static inline int
+snd_sof_probe_compr_trigger(struct snd_sof_dev *sdev,
+		struct snd_compr_stream *cstream, int cmd,
+		struct snd_soc_dai *dai)
+{
+	return sof_ops(sdev)->probe_trigger(sdev, cstream, cmd, dai);
+}
+
+static inline int
+snd_sof_probe_compr_pointer(struct snd_sof_dev *sdev,
+		struct snd_compr_stream *cstream,
+		struct snd_compr_tstamp *tstamp, struct snd_soc_dai *dai)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->probe_pointer)
+		return sof_ops(sdev)->probe_pointer(sdev, cstream, tstamp, dai);
+
+	return 0;
+}
+#endif
+
 /* machine driver */
 static inline int
 snd_sof_machine_register(struct snd_sof_dev *sdev, void *pdata)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 00084471d0de..5d16f668d16a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -170,6 +170,27 @@ struct snd_sof_dsp_ops {
 	snd_pcm_uframes_t (*pcm_pointer)(struct snd_sof_dev *sdev,
 					 struct snd_pcm_substream *substream); /* optional */
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+	/* Except for probe_pointer, all probe ops are mandatory */
+	int (*probe_assign)(struct snd_sof_dev *sdev,
+			struct snd_compr_stream *cstream,
+			struct snd_soc_dai *dai); /* mandatory */
+	int (*probe_free)(struct snd_sof_dev *sdev,
+			struct snd_compr_stream *cstream,
+			struct snd_soc_dai *dai); /* mandatory */
+	int (*probe_set_params)(struct snd_sof_dev *sdev,
+			struct snd_compr_stream *cstream,
+			struct snd_compr_params *params,
+			struct snd_soc_dai *dai); /* mandatory */
+	int (*probe_trigger)(struct snd_sof_dev *sdev,
+			struct snd_compr_stream *cstream, int cmd,
+			struct snd_soc_dai *dai); /* mandatory */
+	int (*probe_pointer)(struct snd_sof_dev *sdev,
+			struct snd_compr_stream *cstream,
+			struct snd_compr_tstamp *tstamp,
+			struct snd_soc_dai *dai); /* optional */
+#endif
+
 	/* host read DSP stream data */
 	void (*ipc_msg_data)(struct snd_sof_dev *sdev,
 			     struct snd_pcm_substream *substream,
@@ -405,6 +426,10 @@ struct snd_sof_dev {
 	wait_queue_head_t waitq;
 	int code_loading;
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
+	unsigned int extractor_stream_tag;
+#endif
+
 	/* DMA for Trace */
 	struct snd_dma_buffer dmatb;
 	struct snd_dma_buffer dmatp;
-- 
2.17.1


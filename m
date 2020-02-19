Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E3216387F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:24:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C8CA16D0;
	Wed, 19 Feb 2020 01:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C8CA16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071892;
	bh=lIYrMd7weE1pCRX51rDh9R2PCjCwG9cEERc6prQF5aY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=U3kwffCVmduwR8jAsYJEM1oA4LWHkGrvSJYGN4kCZQgsA49TlGrsayQmkBMRq5Pez
	 szDQA94QSgUYY2tJFW3J74WcYWk7VJAeF7kySCrIFIXtrLIgZBU7SnfJglVBgFbdjm
	 +ORbMuYCPlBGUHLT4t4wrXlBD0yZNAHwFsjqYpE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 019BEF8036A;
	Wed, 19 Feb 2020 01:10:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A4C2F80363; Wed, 19 Feb 2020 01:10:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C8BAF80368
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C8BAF80368
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFB5F1FB;
 Tue, 18 Feb 2020 16:10:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5111B3F68F;
 Tue, 18 Feb 2020 16:10:52 -0800 (PST)
Date: Wed, 19 Feb 2020 00:10:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Applied "ASoC: SOF: Generic probe compress operations" to the asoc
 tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The patch

   ASoC: SOF: Generic probe compress operations

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From e145e9af231adff081e0e16e1dacfb6e3c4e968f Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 18 Feb 2020 15:39:20 +0100
Subject: [PATCH] ASoC: SOF: Generic probe compress operations

Define system-agnostic probe compress flow which serves as a base for
actual, hardware-dependent implementations.
As per firmware spec, maximum of one extraction stream is allowed, while
for injection, there can be plenty.

Apart from probe_pointer, all probe compress operations are mandatory.
Copy operation is defined as unified as its flow should be shared across
all SOF systems.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200218143924.10565-6-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
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
2.20.1


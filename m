Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E72253791
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BFC717AA;
	Wed, 26 Aug 2020 20:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BFC717AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467911;
	bh=GCSitL2Wl+WpX5vatCk4wtl4RDpJJxASAF/bpR3nfaM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hL4kUns40A+fzoAJdjCSHZlGX8lsfGgI20nJp3Tq+BDk2XmS2W/FVV5SvC1v4X2l2
	 sgZlJldY9u3YwIEbtOZgtqilnrDoP+OCnlDcJgDwXeniorW4u79LDyZ1KOdjfUGuNF
	 pCmq+pa+1kPZHfbiZAvMZSBv0/iMlXUOgXi2K/i0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC077F802FF;
	Wed, 26 Aug 2020 20:46:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48C86F802DC; Wed, 26 Aug 2020 20:46:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EF3AF80299
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF3AF80299
IronPort-SDR: 6pq4zGeq++wmt+W0Oy+4QrxuGkW8TZM4e9TLvFf9ZslefXmy+N/3lJmeEwJJhGI43sOonv7tFk
 nUA0nIqsPI3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174418623"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="174418623"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:48 -0700
IronPort-SDR: eeFSmetMbMREonCjnf259Y+/l4KX/mdtnmV8vq3cuMgb1P5I9yB0a6Ba9HlPouDMI/PFHD4a9m
 /IaohjoMP/rg==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="500347344"
Received: from sghoshal-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.145.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 11:45:48 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/8] ASoC: SOF: Intel: hda: Add sof_tgl_ops for TGL platforms
Date: Wed, 26 Aug 2020 11:45:31 -0700
Message-Id: <20200826184532.1612070-8-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
References: <20200826184532.1612070-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

Separate the dsp ops for TGL ops to specify the use of ICCMAX
FW boot sequence in the run op. All other ops are identical.
Also separate the TGL descriptors into a separate file to make
it easier to follow.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Makefile  |   2 +-
 sound/soc/sof/intel/cnl.c     |  23 +-----
 sound/soc/sof/intel/hda-ipc.h |   4 +
 sound/soc/sof/intel/hda.h     |   1 +
 sound/soc/sof/intel/tgl.c     | 137 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-pci-dev.c   |   2 +-
 6 files changed, 147 insertions(+), 22 deletions(-)
 create mode 100644 sound/soc/sof/intel/tgl.c

diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index f7e9358f1f06..72d85b25df7d 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -8,7 +8,7 @@ snd-sof-intel-ipc-objs := intel-ipc.o
 snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-bus.o \
-				 apl.o cnl.o
+				 apl.o cnl.o tgl.o
 snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-compress.o
 
 snd-sof-intel-hda-objs := hda-codec.o
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 95234ae59e42..70f14b2aa954 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -29,7 +29,7 @@ static const struct snd_sof_debugfs_map cnl_dsp_debugfs[] = {
 static void cnl_ipc_host_done(struct snd_sof_dev *sdev);
 static void cnl_ipc_dsp_done(struct snd_sof_dev *sdev);
 
-static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
+irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
 	u32 hipci;
@@ -163,8 +163,7 @@ static bool cnl_compact_ipc_compress(struct snd_sof_ipc_msg *msg,
 	return false;
 }
 
-static int cnl_ipc_send_msg(struct snd_sof_dev *sdev,
-			    struct snd_sof_ipc_msg *msg)
+int cnl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct sof_ipc_cmd_hdr *hdr;
@@ -211,7 +210,7 @@ static int cnl_ipc_send_msg(struct snd_sof_dev *sdev,
 	return 0;
 }
 
-static void cnl_ipc_dump(struct snd_sof_dev *sdev)
+void cnl_ipc_dump(struct snd_sof_dev *sdev)
 {
 	u32 hipcctl;
 	u32 hipcida;
@@ -369,22 +368,6 @@ const struct sof_intel_dsp_desc icl_chip_info = {
 };
 EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
-const struct sof_intel_dsp_desc tgl_chip_info = {
-	/* Tigerlake */
-	.cores_num = 4,
-	.init_core_mask = 1,
-	.cores_mask = HDA_DSP_CORE_MASK(0),
-	.ipc_req = CNL_DSP_REG_HIPCIDR,
-	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
-	.ipc_ack = CNL_DSP_REG_HIPCIDA,
-	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
-	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
-	.rom_init_timeout	= 300,
-	.ssp_count = ICL_SSP_COUNT,
-	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
-};
-EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-
 const struct sof_intel_dsp_desc ehl_chip_info = {
 	/* Elkhartlake */
 	.cores_num = 4,
diff --git a/sound/soc/sof/intel/hda-ipc.h b/sound/soc/sof/intel/hda-ipc.h
index ade4c3191a39..10fbca5939db 100644
--- a/sound/soc/sof/intel/hda-ipc.h
+++ b/sound/soc/sof/intel/hda-ipc.h
@@ -48,4 +48,8 @@
 #define HDA_PM_PG_STREAMING	BIT(1)
 #define HDA_PM_PG_RSVD		BIT(0)
 
+irqreturn_t cnl_ipc_irq_thread(int irq, void *context);
+int cnl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
+void cnl_ipc_dump(struct snd_sof_dev *sdev);
+
 #endif
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index a2e6050f0ef0..5ee2f8354051 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -733,6 +733,7 @@ extern struct snd_soc_dai_driver skl_dai[];
  */
 extern const struct snd_sof_dsp_ops sof_apl_ops;
 extern const struct snd_sof_dsp_ops sof_cnl_ops;
+extern const struct snd_sof_dsp_ops sof_tgl_ops;
 
 extern const struct sof_intel_dsp_desc apl_chip_info;
 extern const struct sof_intel_dsp_desc cnl_chip_info;
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
new file mode 100644
index 000000000000..d0e84b7747a0
--- /dev/null
+++ b/sound/soc/sof/intel/tgl.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Authors: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+//
+
+/*
+ * Hardware interface for audio DSP on Tigerlake.
+ */
+
+#include "../ops.h"
+#include "hda.h"
+#include "hda-ipc.h"
+#include "../sof-audio.h"
+
+static const struct snd_sof_debugfs_map tgl_dsp_debugfs[] = {
+	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
+};
+
+/* Tigerlake ops */
+const struct snd_sof_dsp_ops sof_tgl_ops = {
+	/* probe and remove */
+	.probe		= hda_dsp_probe,
+	.remove		= hda_dsp_remove,
+
+	/* Register IO */
+	.write		= sof_io_write,
+	.read		= sof_io_read,
+	.write64	= sof_io_write64,
+	.read64		= sof_io_read64,
+
+	/* Block IO */
+	.block_read	= sof_block_read,
+	.block_write	= sof_block_write,
+
+	/* doorbell */
+	.irq_thread	= cnl_ipc_irq_thread,
+
+	/* ipc */
+	.send_msg	= cnl_ipc_send_msg,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
+	.get_window_offset = hda_dsp_ipc_get_window_offset,
+
+	.ipc_msg_data	= hda_ipc_msg_data,
+	.ipc_pcm_params	= hda_ipc_pcm_params,
+
+	/* machine driver */
+	.machine_select = hda_machine_select,
+	.machine_register = sof_machine_register,
+	.machine_unregister = sof_machine_unregister,
+	.set_mach_params = hda_set_mach_params,
+
+	/* debug */
+	.debug_map	= tgl_dsp_debugfs,
+	.debug_map_count	= ARRAY_SIZE(tgl_dsp_debugfs),
+	.dbg_dump	= hda_dsp_dump,
+	.ipc_dump	= cnl_ipc_dump,
+
+	/* stream callbacks */
+	.pcm_open	= hda_dsp_pcm_open,
+	.pcm_close	= hda_dsp_pcm_close,
+	.pcm_hw_params	= hda_dsp_pcm_hw_params,
+	.pcm_hw_free	= hda_dsp_stream_hw_free,
+	.pcm_trigger	= hda_dsp_pcm_trigger,
+	.pcm_pointer	= hda_dsp_pcm_pointer,
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_PROBES)
+	/* probe callbacks */
+	.probe_assign	= hda_probe_compr_assign,
+	.probe_free	= hda_probe_compr_free,
+	.probe_set_params	= hda_probe_compr_set_params,
+	.probe_trigger	= hda_probe_compr_trigger,
+	.probe_pointer	= hda_probe_compr_pointer,
+#endif
+
+	/* firmware loading */
+	.load_firmware = snd_sof_load_firmware_raw,
+
+	/* pre/post fw run */
+	.pre_fw_run = hda_dsp_pre_fw_run,
+	.post_fw_run = hda_dsp_post_fw_run,
+
+	/* dsp core power up/down */
+	.core_power_up = hda_dsp_enable_core,
+	.core_power_down = hda_dsp_core_reset_power_down,
+
+	/* firmware run */
+	.run = hda_dsp_cl_boot_firmware_iccmax,
+
+	/* trace callback */
+	.trace_init = hda_dsp_trace_init,
+	.trace_release = hda_dsp_trace_release,
+	.trace_trigger = hda_dsp_trace_trigger,
+
+	/* DAI drivers */
+	.drv		= skl_dai,
+	.num_drv	= SOF_SKL_NUM_DAIS,
+
+	/* PM */
+	.suspend		= hda_dsp_suspend,
+	.resume			= hda_dsp_resume,
+	.runtime_suspend	= hda_dsp_runtime_suspend,
+	.runtime_resume		= hda_dsp_runtime_resume,
+	.runtime_idle		= hda_dsp_runtime_idle,
+	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
+	.set_power_state	= hda_dsp_set_power_state,
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+
+	.arch_ops = &sof_xtensa_arch_ops,
+};
+EXPORT_SYMBOL_NS(sof_tgl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+
+const struct sof_intel_dsp_desc tgl_chip_info = {
+	/* Tigerlake */
+	.cores_num = 4,
+	.init_core_mask = 1,
+	.cores_mask = HDA_DSP_CORE_MASK(0),
+	.ipc_req = CNL_DSP_REG_HIPCIDR,
+	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
+	.ipc_ack = CNL_DSP_REG_HIPCIDA,
+	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
+	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 300,
+	.ssp_count = ICL_SSP_COUNT,
+	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+};
+EXPORT_SYMBOL_NS(tgl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 7b85c88cba9c..ec62d9337d68 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -221,7 +221,7 @@ static const struct sof_dev_desc tgl_desc = {
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-tgl.ri",
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
-	.ops = &sof_cnl_ops,
+	.ops = &sof_tgl_ops,
 };
 #endif
 
-- 
2.25.1


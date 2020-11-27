Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1515A2C6A08
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 17:46:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31CDF1686;
	Fri, 27 Nov 2020 17:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31CDF1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606495571;
	bh=+bXIAUU6GpUwQ0nUjWOb9tA+9MKb7SCmGq9+mJHDPwA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J0mU/wYS3vtLpHXgxpDmLkBHA7UO4n1veGVJewixFaULdnc3peLa7yuJKzkO12HbF
	 rvvDGjXw1JHJFhsQmP1H2vI9lfYkvMZXUQDvxBWd7+amIAIQb6Z5nYp4uiEkq9bVv8
	 FmSZf1EAqgRMrD68TkAdUedycx1l6j2bZxdTdrIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9643F8029B;
	Fri, 27 Nov 2020 17:43:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 022AEF804D2; Fri, 27 Nov 2020 17:43:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46F71F8029B
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 17:43:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46F71F8029B
IronPort-SDR: Hlzw/t/l9N2fTkrmNsy0nmPKVNJ9u0YPCq0gDXf9B1WLKBmKPoB6HB70CRDs/GWpYrLGr6QucR
 mbxtiFG2aewA==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="234020294"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="234020294"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 08:43:05 -0800
IronPort-SDR: vGhm7+AAJxvVdAq0C8pm3ALf62kzrxGqcnis51Mx/QkidK90hJzYArZnNMZ69pimps/n3qPShV
 AtfrAr/NMwvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="403933367"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 27 Nov 2020 08:43:02 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 5/5] ASoC: SOF: Intel: hda: add sof_icl_ops for ICL platforms
Date: Fri, 27 Nov 2020 18:40:22 +0200
Message-Id: <20201127164022.2498406-6-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127164022.2498406-1-kai.vehmanen@linux.intel.com>
References: <20201127164022.2498406-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Fred Oh <fred.oh@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Fred Oh <fred.oh@linux.intel.com>

Separate the dsp ops for ICL ops to specify the use of ICCMAX
FW boot sequence in the run op. All other ops are identical with TGL
except post_fw_run. The recommended HW programming sequence for ICL
is to power up core 3 and keep it in stall if HPRO is enabled.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/Makefile     |   2 +-
 sound/soc/sof/intel/cnl.c        |  16 ----
 sound/soc/sof/intel/hda-loader.c |  61 +++++++++++++
 sound/soc/sof/intel/hda.h        |   4 +
 sound/soc/sof/intel/icl.c        | 145 +++++++++++++++++++++++++++++++
 sound/soc/sof/sof-pci-dev.c      |   2 +-
 6 files changed, 212 insertions(+), 18 deletions(-)
 create mode 100644 sound/soc/sof/intel/icl.c

diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 72d85b25df7d..2589111c2fae 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -8,7 +8,7 @@ snd-sof-intel-ipc-objs := intel-ipc.o
 snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-bus.o \
-				 apl.o cnl.o tgl.o
+				 apl.o cnl.o tgl.o icl.o
 snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-compress.o
 
 snd-sof-intel-hda-objs := hda-codec.o
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 158c38743731..e38db519f38d 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -349,22 +349,6 @@ const struct sof_intel_dsp_desc cnl_chip_info = {
 };
 EXPORT_SYMBOL_NS(cnl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
 
-const struct sof_intel_dsp_desc icl_chip_info = {
-	/* Icelake */
-	.cores_num = 4,
-	.init_core_mask = 1,
-	.host_managed_cores_mask = GENMASK(3, 0),
-	.ipc_req = CNL_DSP_REG_HIPCIDR,
-	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
-	.ipc_ack = CNL_DSP_REG_HIPCIDA,
-	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
-	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
-	.rom_init_timeout	= 300,
-	.ssp_count = ICL_SSP_COUNT,
-	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
-};
-EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
-
 const struct sof_intel_dsp_desc ehl_chip_info = {
 	/* Elkhartlake */
 	.cores_num = 4,
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 52101b1a3dac..02c3ff897274 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -472,6 +472,46 @@ int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	return hda_dsp_ctrl_clock_power_gating(sdev, true);
 }
 
+/*
+ * post fw run operations for ICL,
+ * Core 3 will be powered up and in stall when HPRO is enabled
+ */
+int hda_dsp_post_fw_run_icl(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	int ret;
+
+	if (sdev->first_boot) {
+		ret = hda_sdw_startup(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error: could not startup SoundWire links\n");
+			return ret;
+		}
+	}
+
+	hda_sdw_int_enable(sdev, true);
+
+	/*
+	 * The recommended HW programming sequence for ICL is to
+	 * power up core 3 and keep it in stall if HPRO is enabled.
+	 * Major difference between ICL and TGL, on ICL core 3 is managed by
+	 * the host whereas on TGL it is handled by the firmware.
+	 */
+	if (!hda->clk_config_lpro) {
+		ret = snd_sof_dsp_core_power_up(sdev, BIT(3));
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: dsp core power up failed on core 3\n");
+			return ret;
+		}
+
+		snd_sof_dsp_stall(sdev, BIT(3));
+	}
+
+	/* re-enable clock gating and power gating */
+	return hda_dsp_ctrl_clock_power_gating(sdev, true);
+}
+
 int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
 					 const struct sof_ext_man_elem_header *hdr)
 {
@@ -509,3 +549,24 @@ int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
 
 	return 0;
 }
+
+int hda_dsp_core_stall_icl(struct snd_sof_dev *sdev, unsigned int core_mask)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
+
+	/* make sure core_mask in host managed cores */
+	core_mask &= chip->host_managed_cores_mask;
+	if (!core_mask) {
+		dev_err(sdev->dev, "error: core_mask is not in host managed cores\n");
+		return -EINVAL;
+	}
+
+	/* stall core */
+	snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
+					 HDA_DSP_REG_ADSPCS,
+					 HDA_DSP_ADSPCS_CSTALL_MASK(core_mask),
+					 HDA_DSP_ADSPCS_CSTALL_MASK(core_mask));
+
+	return 0;
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index d1df579e52aa..9ec8ae0fd649 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -615,11 +615,14 @@ int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
  */
 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev);
 int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev);
+int hda_dsp_cl_boot_firmware_iccmax_icl(struct snd_sof_dev *sdev);
 int hda_dsp_cl_boot_firmware_skl(struct snd_sof_dev *sdev);
 
 /* pre and post fw run ops */
 int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev);
 int hda_dsp_post_fw_run(struct snd_sof_dev *sdev);
+int hda_dsp_post_fw_run_icl(struct snd_sof_dev *sdev);
+int hda_dsp_core_stall_icl(struct snd_sof_dev *sdev, unsigned int core_mask);
 
 /* parse platform specific ext manifest ops */
 int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
@@ -740,6 +743,7 @@ extern struct snd_soc_dai_driver skl_dai[];
 extern const struct snd_sof_dsp_ops sof_apl_ops;
 extern const struct snd_sof_dsp_ops sof_cnl_ops;
 extern const struct snd_sof_dsp_ops sof_tgl_ops;
+extern const struct snd_sof_dsp_ops sof_icl_ops;
 
 extern const struct sof_intel_dsp_desc apl_chip_info;
 extern const struct sof_intel_dsp_desc cnl_chip_info;
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
new file mode 100644
index 000000000000..e9d5a0a58504
--- /dev/null
+++ b/sound/soc/sof/intel/icl.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Fred Oh <fred.oh@linux.intel.com>
+//
+
+/*
+ * Hardware interface for audio DSP on IceLake.
+ */
+
+#include <linux/kernel.h>
+#include <linux/kconfig.h>
+#include <linux/export.h>
+#include <linux/bits.h>
+#include "../ops.h"
+#include "hda.h"
+#include "hda-ipc.h"
+#include "../sof-audio.h"
+
+static const struct snd_sof_debugfs_map icl_dsp_debugfs[] = {
+	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
+};
+
+/* Icelake ops */
+const struct snd_sof_dsp_ops sof_icl_ops = {
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
+	.debug_map	= icl_dsp_debugfs,
+	.debug_map_count	= ARRAY_SIZE(icl_dsp_debugfs),
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
+	.post_fw_run = hda_dsp_post_fw_run_icl,
+
+	/* parse platform specific extended manifest */
+	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
+
+	/* dsp core power up/down */
+	.core_power_up = hda_dsp_enable_core,
+	.core_power_down = hda_dsp_core_reset_power_down,
+
+	/* firmware run */
+	.run = hda_dsp_cl_boot_firmware_iccmax,
+	.stall = hda_dsp_core_stall_icl,
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
+EXPORT_SYMBOL_NS(sof_icl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+
+const struct sof_intel_dsp_desc icl_chip_info = {
+	/* Icelake */
+	.cores_num = 4,
+	.init_core_mask = 1,
+	.host_managed_cores_mask = GENMASK(3, 0),
+	.ipc_req = CNL_DSP_REG_HIPCIDR,
+	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
+	.ipc_ack = CNL_DSP_REG_HIPCIDA,
+	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
+	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 300,
+	.ssp_count = ICL_SSP_COUNT,
+	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+};
+EXPORT_SYMBOL_NS(icl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index f2a107481336..153d66d5c948 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -209,7 +209,7 @@ static const struct sof_dev_desc icl_desc = {
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-icl.ri",
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
-	.ops = &sof_cnl_ops,
+	.ops = &sof_icl_ops,
 };
 #endif
 
-- 
2.28.0


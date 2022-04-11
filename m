Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F23B14FC5B3
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:21:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AFB21786;
	Mon, 11 Apr 2022 22:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AFB21786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708516;
	bh=Kik+9+SfKKI4E1TR9yQB/5ZfFMhtkMxzroJYBMB2ajo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IgmuQRhyYYP+4Bf6u+EpFJQtMSFXKF3imIPpUvrW+6vgk74HtEMI0S6p6JIkyXb+5
	 DTN46JQMZgbmj9PA6SvPi4p0kbEnnkcSbIjeqY6cL2r/qQdmpynqSdWBFCVa0C3pA3
	 j6q47AfyxYSaJ9A7wrJJXIPY8q3ypUpWtF5oc0j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7272EF8052D;
	Mon, 11 Apr 2022 22:18:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4374F80543; Mon, 11 Apr 2022 22:18:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20393F804FC
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20393F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k7nDK/2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708283; x=1681244283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kik+9+SfKKI4E1TR9yQB/5ZfFMhtkMxzroJYBMB2ajo=;
 b=k7nDK/2hy/o7pvaCTvUp/oPA8VnZPY2UaaCnwTC5qj/04Hva2ytgNpXU
 oZIE0Lx5apQO3TBJfJbFvrKqvlbwkDmxo0rnTcnu3yA5ijRJIXTvLf08Y
 689quq9/aHLYlfgDfHSAXxnwjIYre8dnLy+2THdVQ46d2viHs6HSPVWhr
 noHz+tr5tHhmInAiELwJoli9YoHquIhdukUjNzz9dllqzJtW3PZS5ObF7
 cT8F5ctcTDh7fQlvPJpWWYRljaKvArwSFaAi3BCbTl0l1wHhdzRylhmeh
 NEuK1JnZmeZhJ3n3JNawjWHlzQc955HvmAUWJvWd5z9nzOZj7joFpkejK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090839"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090839"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135682"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/16] ASoC: SOF: Intel: hda: use common ops across platforms
Date: Mon, 11 Apr 2022 15:17:20 -0500
Message-Id: <20220411201727.77971-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The dsp_ops are mostly common between platforms. Introduce a common
structure and an init function to set platform-specific values.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/core.c                 |   5 +-
 sound/soc/sof/intel/Makefile         |   2 +-
 sound/soc/sof/intel/apl.c            | 104 +++++---------------------
 sound/soc/sof/intel/cnl.c            | 106 +++++---------------------
 sound/soc/sof/intel/hda-common-ops.c | 107 ++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h            |   7 +-
 sound/soc/sof/intel/icl.c            | 108 +++++----------------------
 sound/soc/sof/intel/pci-apl.c        |   2 +
 sound/soc/sof/intel/pci-cnl.c        |   3 +
 sound/soc/sof/intel/pci-icl.c        |   2 +
 sound/soc/sof/intel/pci-tgl.c        |   6 +-
 sound/soc/sof/intel/tgl.c            | 108 +++++----------------------
 sound/soc/sof/ops.h                  |   6 +-
 13 files changed, 211 insertions(+), 355 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-common-ops.c

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 27a98867f999..d981a1c3fb05 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -342,6 +342,7 @@ static void sof_probe_work(struct work_struct *work)
 int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 {
 	struct snd_sof_dev *sdev;
+	int ret;
 
 	sdev = devm_kzalloc(dev, sizeof(*sdev), GFP_KERNEL);
 	if (!sdev)
@@ -358,7 +359,9 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	dev_set_drvdata(dev, sdev);
 
 	/* init ops, if necessary */
-	sof_ops_init(sdev);
+	ret = sof_ops_init(sdev);
+	if (ret < 0)
+		return ret;
 
 	/* check all mandatory ops */
 	if (!sof_ops(sdev) || !sof_ops(sdev)->probe || !sof_ops(sdev)->run ||
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 1f473d4d8416..b9d51dc39ffa 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -6,7 +6,7 @@ snd-sof-acpi-intel-bdw-objs := bdw.o
 snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-bus.o \
-				 apl.o cnl.o tgl.o icl.o
+				 apl.o cnl.o tgl.o icl.o hda-common-ops.o
 snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-probes.o
 
 snd-sof-intel-hda-objs := hda-codec.o
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 518d543591b5..eb471602dae7 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -26,108 +26,40 @@ static const struct snd_sof_debugfs_map apl_dsp_debugfs[] = {
 };
 
 /* apollolake ops */
-struct snd_sof_dsp_ops sof_apl_ops = {
-	/* probe/remove/shutdown */
-	.probe		= hda_dsp_probe,
-	.remove		= hda_dsp_remove,
-	.shutdown	= hda_dsp_shutdown,
-
-	/* Register IO */
-	.write		= sof_io_write,
-	.read		= sof_io_read,
-	.write64	= sof_io_write64,
-	.read64		= sof_io_read64,
+struct snd_sof_dsp_ops sof_apl_ops;
+EXPORT_SYMBOL_NS(sof_apl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
+int sof_apl_ops_init(struct snd_sof_dev *sdev)
+{
+	/* common defaults */
+	memcpy(&sof_apl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
 
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
+	/* probe/remove/shutdown */
+	sof_apl_ops.shutdown	= hda_dsp_shutdown;
 
 	/* doorbell */
-	.irq_thread	= hda_dsp_ipc_irq_thread,
+	sof_apl_ops.irq_thread	= hda_dsp_ipc_irq_thread;
 
 	/* ipc */
-	.send_msg	= hda_dsp_ipc_send_msg,
-	.fw_ready	= sof_fw_ready,
-	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
-	.get_window_offset = hda_dsp_ipc_get_window_offset,
-
-	.ipc_msg_data	= hda_ipc_msg_data,
-	.set_stream_data_offset = hda_set_stream_data_offset,
-
-	/* machine driver */
-	.machine_select = hda_machine_select,
-	.machine_register = sof_machine_register,
-	.machine_unregister = sof_machine_unregister,
-	.set_mach_params = hda_set_mach_params,
+	sof_apl_ops.send_msg	= hda_dsp_ipc_send_msg;
 
 	/* debug */
-	.debug_map	= apl_dsp_debugfs,
-	.debug_map_count	= ARRAY_SIZE(apl_dsp_debugfs),
-	.dbg_dump	= hda_dsp_dump,
-	.ipc_dump	= hda_ipc_dump,
-	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
-
-	/* stream callbacks */
-	.pcm_open	= hda_dsp_pcm_open,
-	.pcm_close	= hda_dsp_pcm_close,
-	.pcm_hw_params	= hda_dsp_pcm_hw_params,
-	.pcm_hw_free	= hda_dsp_stream_hw_free,
-	.pcm_trigger	= hda_dsp_pcm_trigger,
-	.pcm_pointer	= hda_dsp_pcm_pointer,
-	.pcm_ack	= hda_dsp_pcm_ack,
-
-	/* firmware loading */
-	.load_firmware = snd_sof_load_firmware_raw,
+	sof_apl_ops.debug_map	= apl_dsp_debugfs;
+	sof_apl_ops.debug_map_count	= ARRAY_SIZE(apl_dsp_debugfs);
+	sof_apl_ops.ipc_dump	= hda_ipc_dump;
 
 	/* firmware run */
-	.run = hda_dsp_cl_boot_firmware,
+	sof_apl_ops.run = hda_dsp_cl_boot_firmware;
 
 	/* pre/post fw run */
-	.pre_fw_run = hda_dsp_pre_fw_run,
-	.post_fw_run = hda_dsp_post_fw_run,
-
-	/* parse platform specific extended manifest */
-	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
+	sof_apl_ops.post_fw_run = hda_dsp_post_fw_run;
 
 	/* dsp core get/put */
-	.core_get = hda_dsp_core_get,
-
-	/* trace callback */
-	.trace_init = hda_dsp_trace_init,
-	.trace_release = hda_dsp_trace_release,
-	.trace_trigger = hda_dsp_trace_trigger,
-
-	/* client ops */
-	.register_ipc_clients = hda_register_clients,
-	.unregister_ipc_clients = hda_unregister_clients,
-
-	/* DAI drivers */
-	.drv		= skl_dai,
-	.num_drv	= SOF_SKL_NUM_DAIS,
+	sof_apl_ops.core_get = hda_dsp_core_get;
 
-	/* PM */
-	.suspend		= hda_dsp_suspend,
-	.resume			= hda_dsp_resume,
-	.runtime_suspend	= hda_dsp_runtime_suspend,
-	.runtime_resume		= hda_dsp_runtime_resume,
-	.runtime_idle		= hda_dsp_runtime_idle,
-	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
-	.set_power_state	= hda_dsp_set_power_state,
-
-	/* ALSA HW info flags */
-	.hw_info =	SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
-
-	.dsp_arch_ops = &sof_xtensa_arch_ops,
+	return 0;
 };
-EXPORT_SYMBOL_NS(sof_apl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_apl_ops_init, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc apl_chip_info = {
 	/* Apollolake */
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 81fe490c7f77..21168ebc02cc 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -244,108 +244,40 @@ void cnl_ipc_dump(struct snd_sof_dev *sdev)
 }
 
 /* cannonlake ops */
-struct snd_sof_dsp_ops sof_cnl_ops = {
-	/* probe/remove/shutdown */
-	.probe		= hda_dsp_probe,
-	.remove		= hda_dsp_remove,
-	.shutdown	= hda_dsp_shutdown,
-
-	/* Register IO */
-	.write		= sof_io_write,
-	.read		= sof_io_read,
-	.write64	= sof_io_write64,
-	.read64		= sof_io_read64,
+struct snd_sof_dsp_ops sof_cnl_ops;
+EXPORT_SYMBOL_NS(sof_cnl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
+int sof_cnl_ops_init(struct snd_sof_dev *sdev)
+{
+	/* common defaults */
+	memcpy(&sof_cnl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
 
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
+	/* probe/remove/shutdown */
+	sof_cnl_ops.shutdown	= hda_dsp_shutdown;
 
 	/* doorbell */
-	.irq_thread	= cnl_ipc_irq_thread,
+	sof_cnl_ops.irq_thread	= cnl_ipc_irq_thread;
 
 	/* ipc */
-	.send_msg	= cnl_ipc_send_msg,
-	.fw_ready	= sof_fw_ready,
-	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
-	.get_window_offset = hda_dsp_ipc_get_window_offset,
-
-	.ipc_msg_data	= hda_ipc_msg_data,
-	.set_stream_data_offset = hda_set_stream_data_offset,
-
-	/* machine driver */
-	.machine_select = hda_machine_select,
-	.machine_register = sof_machine_register,
-	.machine_unregister = sof_machine_unregister,
-	.set_mach_params = hda_set_mach_params,
+	sof_cnl_ops.send_msg	= cnl_ipc_send_msg;
 
 	/* debug */
-	.debug_map	= cnl_dsp_debugfs,
-	.debug_map_count	= ARRAY_SIZE(cnl_dsp_debugfs),
-	.dbg_dump	= hda_dsp_dump,
-	.ipc_dump	= cnl_ipc_dump,
-	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
-
-	/* stream callbacks */
-	.pcm_open	= hda_dsp_pcm_open,
-	.pcm_close	= hda_dsp_pcm_close,
-	.pcm_hw_params	= hda_dsp_pcm_hw_params,
-	.pcm_hw_free	= hda_dsp_stream_hw_free,
-	.pcm_trigger	= hda_dsp_pcm_trigger,
-	.pcm_pointer	= hda_dsp_pcm_pointer,
-	.pcm_ack	= hda_dsp_pcm_ack,
-
-	/* firmware loading */
-	.load_firmware = snd_sof_load_firmware_raw,
+	sof_cnl_ops.debug_map	= cnl_dsp_debugfs;
+	sof_cnl_ops.debug_map_count	= ARRAY_SIZE(cnl_dsp_debugfs);
+	sof_cnl_ops.ipc_dump	= cnl_ipc_dump;
 
 	/* pre/post fw run */
-	.pre_fw_run = hda_dsp_pre_fw_run,
-	.post_fw_run = hda_dsp_post_fw_run,
+	sof_cnl_ops.post_fw_run = hda_dsp_post_fw_run;
 
-	/* parse platform specific extended manifest */
-	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
+	/* firmware run */
+	sof_cnl_ops.run = hda_dsp_cl_boot_firmware;
 
 	/* dsp core get/put */
-	.core_get = hda_dsp_core_get,
+	sof_cnl_ops.core_get = hda_dsp_core_get;
 
-	/* firmware run */
-	.run = hda_dsp_cl_boot_firmware,
-
-	/* trace callback */
-	.trace_init = hda_dsp_trace_init,
-	.trace_release = hda_dsp_trace_release,
-	.trace_trigger = hda_dsp_trace_trigger,
-
-	/* client ops */
-	.register_ipc_clients = hda_register_clients,
-	.unregister_ipc_clients = hda_unregister_clients,
-
-	/* DAI drivers */
-	.drv		= skl_dai,
-	.num_drv	= SOF_SKL_NUM_DAIS,
-
-	/* PM */
-	.suspend		= hda_dsp_suspend,
-	.resume			= hda_dsp_resume,
-	.runtime_suspend	= hda_dsp_runtime_suspend,
-	.runtime_resume		= hda_dsp_runtime_resume,
-	.runtime_idle		= hda_dsp_runtime_idle,
-	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
-	.set_power_state	= hda_dsp_set_power_state,
-
-	/* ALSA HW info flags */
-	.hw_info =	SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
-
-	.dsp_arch_ops = &sof_xtensa_arch_ops,
+	return 0;
 };
-EXPORT_SYMBOL_NS(sof_cnl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_cnl_ops_init, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc cnl_chip_info = {
 	/* Cannonlake */
diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
new file mode 100644
index 000000000000..257eace4a563
--- /dev/null
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+//
+
+/*
+ * common ops for SKL+ HDAudio platforms
+ */
+
+#include "../sof-priv.h"
+#include "hda.h"
+#include "../sof-audio.h"
+
+struct snd_sof_dsp_ops sof_hda_common_ops = {
+	/* probe/remove/shutdown */
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
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
+	/* ipc */
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
+	.get_window_offset = hda_dsp_ipc_get_window_offset,
+
+	.ipc_msg_data	= hda_ipc_msg_data,
+	.set_stream_data_offset = hda_set_stream_data_offset,
+
+	/* machine driver */
+	.machine_select = hda_machine_select,
+	.machine_register = sof_machine_register,
+	.machine_unregister = sof_machine_unregister,
+	.set_mach_params = hda_set_mach_params,
+
+	/* debug */
+	.dbg_dump	= hda_dsp_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
+
+	/* stream callbacks */
+	.pcm_open	= hda_dsp_pcm_open,
+	.pcm_close	= hda_dsp_pcm_close,
+	.pcm_hw_params	= hda_dsp_pcm_hw_params,
+	.pcm_hw_free	= hda_dsp_stream_hw_free,
+	.pcm_trigger	= hda_dsp_pcm_trigger,
+	.pcm_pointer	= hda_dsp_pcm_pointer,
+	.pcm_ack	= hda_dsp_pcm_ack,
+
+	/* firmware loading */
+	.load_firmware = snd_sof_load_firmware_raw,
+
+	/* pre/post fw run */
+	.pre_fw_run = hda_dsp_pre_fw_run,
+
+	/* firmware run */
+	.run = hda_dsp_cl_boot_firmware,
+
+	/* parse platform specific extended manifest */
+	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
+
+	/* dsp core get/put */
+
+	/* trace callback */
+	.trace_init = hda_dsp_trace_init,
+	.trace_release = hda_dsp_trace_release,
+	.trace_trigger = hda_dsp_trace_trigger,
+
+	/* client ops */
+	.register_ipc_clients = hda_register_clients,
+	.unregister_ipc_clients = hda_unregister_clients,
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
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
+};
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index c7e248280527..5d083ebbb886 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -687,14 +687,19 @@ extern struct snd_soc_dai_driver skl_dai[];
 /*
  * Platform Specific HW abstraction Ops.
  */
+extern struct snd_sof_dsp_ops sof_hda_common_ops;
+
 extern struct snd_sof_dsp_ops sof_apl_ops;
+int sof_apl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_cnl_ops;
+int sof_cnl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_tgl_ops;
+int sof_tgl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_icl_ops;
+int sof_icl_ops_init(struct snd_sof_dev *sdev);
 
 extern const struct sof_intel_dsp_desc apl_chip_info;
 extern const struct sof_intel_dsp_desc cnl_chip_info;
-extern const struct sof_intel_dsp_desc skl_chip_info;
 extern const struct sof_intel_dsp_desc icl_chip_info;
 extern const struct sof_intel_dsp_desc tgl_chip_info;
 extern const struct sof_intel_dsp_desc tglh_chip_info;
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index da1e6dc4dc85..148d03f4164b 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -88,109 +88,41 @@ static int icl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 }
 
 /* Icelake ops */
-struct snd_sof_dsp_ops sof_icl_ops = {
-	/* probe/remove/shutdown */
-	.probe		= hda_dsp_probe,
-	.remove		= hda_dsp_remove,
-	.shutdown	= hda_dsp_shutdown,
-
-	/* Register IO */
-	.write		= sof_io_write,
-	.read		= sof_io_read,
-	.write64	= sof_io_write64,
-	.read64		= sof_io_read64,
+struct snd_sof_dsp_ops sof_icl_ops;
+EXPORT_SYMBOL_NS(sof_icl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
+int sof_icl_ops_init(struct snd_sof_dev *sdev)
+{
+	/* common defaults */
+	memcpy(&sof_icl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
 
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
+	/* probe/remove/shutdown */
+	sof_icl_ops.shutdown	= hda_dsp_shutdown;
 
 	/* doorbell */
-	.irq_thread	= cnl_ipc_irq_thread,
+	sof_icl_ops.irq_thread	= cnl_ipc_irq_thread;
 
 	/* ipc */
-	.send_msg	= cnl_ipc_send_msg,
-	.fw_ready	= sof_fw_ready,
-	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
-	.get_window_offset = hda_dsp_ipc_get_window_offset,
-
-	.ipc_msg_data	= hda_ipc_msg_data,
-	.set_stream_data_offset = hda_set_stream_data_offset,
-
-	/* machine driver */
-	.machine_select = hda_machine_select,
-	.machine_register = sof_machine_register,
-	.machine_unregister = sof_machine_unregister,
-	.set_mach_params = hda_set_mach_params,
+	sof_icl_ops.send_msg	= cnl_ipc_send_msg;
 
 	/* debug */
-	.debug_map	= icl_dsp_debugfs,
-	.debug_map_count	= ARRAY_SIZE(icl_dsp_debugfs),
-	.dbg_dump	= hda_dsp_dump,
-	.ipc_dump	= cnl_ipc_dump,
-	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
-
-	/* stream callbacks */
-	.pcm_open	= hda_dsp_pcm_open,
-	.pcm_close	= hda_dsp_pcm_close,
-	.pcm_hw_params	= hda_dsp_pcm_hw_params,
-	.pcm_hw_free	= hda_dsp_stream_hw_free,
-	.pcm_trigger	= hda_dsp_pcm_trigger,
-	.pcm_pointer	= hda_dsp_pcm_pointer,
-	.pcm_ack	= hda_dsp_pcm_ack,
-
-	/* firmware loading */
-	.load_firmware = snd_sof_load_firmware_raw,
+	sof_icl_ops.debug_map	= icl_dsp_debugfs;
+	sof_icl_ops.debug_map_count	= ARRAY_SIZE(icl_dsp_debugfs);
+	sof_icl_ops.ipc_dump	= cnl_ipc_dump;
 
 	/* pre/post fw run */
-	.pre_fw_run = hda_dsp_pre_fw_run,
-	.post_fw_run = icl_dsp_post_fw_run,
+	sof_icl_ops.post_fw_run = icl_dsp_post_fw_run;
 
-	/* parse platform specific extended manifest */
-	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
+	/* firmware run */
+	sof_icl_ops.run = hda_dsp_cl_boot_firmware_iccmax;
+	sof_icl_ops.stall = icl_dsp_core_stall;
 
 	/* dsp core get/put */
-	.core_get = hda_dsp_core_get,
+	sof_icl_ops.core_get = hda_dsp_core_get;
 
-	/* firmware run */
-	.run = hda_dsp_cl_boot_firmware_iccmax,
-	.stall = icl_dsp_core_stall,
-
-	/* trace callback */
-	.trace_init = hda_dsp_trace_init,
-	.trace_release = hda_dsp_trace_release,
-	.trace_trigger = hda_dsp_trace_trigger,
-
-	/* client ops */
-	.register_ipc_clients = hda_register_clients,
-	.unregister_ipc_clients = hda_unregister_clients,
-
-	/* DAI drivers */
-	.drv		= skl_dai,
-	.num_drv	= SOF_SKL_NUM_DAIS,
-
-	/* PM */
-	.suspend		= hda_dsp_suspend,
-	.resume			= hda_dsp_resume,
-	.runtime_suspend	= hda_dsp_runtime_suspend,
-	.runtime_resume		= hda_dsp_runtime_resume,
-	.runtime_idle		= hda_dsp_runtime_idle,
-	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
-	.set_power_state	= hda_dsp_set_power_state,
-
-	/* ALSA HW info flags */
-	.hw_info =	SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
-
-	.dsp_arch_ops = &sof_xtensa_arch_ops,
+	return 0;
 };
-EXPORT_SYMBOL_NS(sof_icl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_icl_ops_init, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc icl_chip_info = {
 	/* Icelake */
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index 1f0e509738dc..2de3658eb817 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -43,6 +43,7 @@ static const struct sof_dev_desc bxt_desc = {
 	},
 	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
 	.ops = &sof_apl_ops,
+	.ops_init = sof_apl_ops_init,
 };
 
 static const struct sof_dev_desc glk_desc = {
@@ -69,6 +70,7 @@ static const struct sof_dev_desc glk_desc = {
 	},
 	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
 	.ops = &sof_apl_ops,
+	.ops_init = sof_apl_ops_init,
 };
 
 /* PCI IDs */
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index 858e8a1bf564..87e587aef9c9 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -44,6 +44,7 @@ static const struct sof_dev_desc cnl_desc = {
 	},
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
+	.ops_init = sof_cnl_ops_init,
 };
 
 static const struct sof_dev_desc cfl_desc = {
@@ -71,6 +72,7 @@ static const struct sof_dev_desc cfl_desc = {
 	},
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
+	.ops_init = sof_cnl_ops_init,
 };
 
 static const struct sof_dev_desc cml_desc = {
@@ -98,6 +100,7 @@ static const struct sof_dev_desc cml_desc = {
 	},
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
+	.ops_init = sof_cnl_ops_init,
 };
 
 /* PCI IDs */
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 21bcd5d34b18..1c7f16ce531e 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -44,6 +44,7 @@ static const struct sof_dev_desc icl_desc = {
 	},
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
 	.ops = &sof_icl_ops,
+	.ops_init = sof_icl_ops_init,
 };
 
 static const struct sof_dev_desc jsl_desc = {
@@ -70,6 +71,7 @@ static const struct sof_dev_desc jsl_desc = {
 	},
 	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
+	.ops_init = sof_cnl_ops_init,
 };
 
 /* PCI IDs */
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index caefd3000d51..478f9d051c4c 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -44,6 +44,7 @@ static const struct sof_dev_desc tgl_desc = {
 	},
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
+	.ops_init = sof_tgl_ops_init,
 };
 
 static const struct sof_dev_desc tglh_desc = {
@@ -71,6 +72,7 @@ static const struct sof_dev_desc tglh_desc = {
 	},
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
+	.ops_init = sof_tgl_ops_init,
 };
 
 static const struct sof_dev_desc ehl_desc = {
@@ -97,6 +99,7 @@ static const struct sof_dev_desc ehl_desc = {
 	},
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
+	.ops_init = sof_tgl_ops_init,
 };
 
 static const struct sof_dev_desc adls_desc = {
@@ -124,6 +127,7 @@ static const struct sof_dev_desc adls_desc = {
 	},
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
+	.ops_init = sof_tgl_ops_init,
 };
 
 static const struct sof_dev_desc adl_desc = {
@@ -151,6 +155,7 @@ static const struct sof_dev_desc adl_desc = {
 	},
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
+	.ops_init = sof_tgl_ops_init,
 };
 
 /* PCI IDs */
@@ -195,4 +200,3 @@ module_pci_driver(snd_sof_pci_intel_tgl_driver);
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
-
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 2bb32bbce426..18e01db882f3 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -59,109 +59,41 @@ static int tgl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 }
 
 /* Tigerlake ops */
-struct snd_sof_dsp_ops sof_tgl_ops = {
-	/* probe/remove/shutdown */
-	.probe		= hda_dsp_probe,
-	.remove		= hda_dsp_remove,
-	.shutdown	= hda_dsp_shutdown,
-
-	/* Register IO */
-	.write		= sof_io_write,
-	.read		= sof_io_read,
-	.write64	= sof_io_write64,
-	.read64		= sof_io_read64,
+struct snd_sof_dsp_ops sof_tgl_ops;
+EXPORT_SYMBOL_NS(sof_tgl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
+int sof_tgl_ops_init(struct snd_sof_dev *sdev)
+{
+	/* common defaults */
+	memcpy(&sof_tgl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
 
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
+	/* probe/remove/shutdown */
+	sof_tgl_ops.shutdown	= hda_dsp_shutdown;
 
 	/* doorbell */
-	.irq_thread	= cnl_ipc_irq_thread,
+	sof_tgl_ops.irq_thread	= cnl_ipc_irq_thread;
 
 	/* ipc */
-	.send_msg	= cnl_ipc_send_msg,
-	.fw_ready	= sof_fw_ready,
-	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
-	.get_window_offset = hda_dsp_ipc_get_window_offset,
-
-	.ipc_msg_data	= hda_ipc_msg_data,
-	.set_stream_data_offset = hda_set_stream_data_offset,
-
-	/* machine driver */
-	.machine_select = hda_machine_select,
-	.machine_register = sof_machine_register,
-	.machine_unregister = sof_machine_unregister,
-	.set_mach_params = hda_set_mach_params,
+	sof_tgl_ops.send_msg	= cnl_ipc_send_msg;
 
 	/* debug */
-	.debug_map	= tgl_dsp_debugfs,
-	.debug_map_count	= ARRAY_SIZE(tgl_dsp_debugfs),
-	.dbg_dump	= hda_dsp_dump,
-	.ipc_dump	= cnl_ipc_dump,
-	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
-
-	/* stream callbacks */
-	.pcm_open	= hda_dsp_pcm_open,
-	.pcm_close	= hda_dsp_pcm_close,
-	.pcm_hw_params	= hda_dsp_pcm_hw_params,
-	.pcm_hw_free	= hda_dsp_stream_hw_free,
-	.pcm_trigger	= hda_dsp_pcm_trigger,
-	.pcm_pointer	= hda_dsp_pcm_pointer,
-	.pcm_ack	= hda_dsp_pcm_ack,
-
-	/* firmware loading */
-	.load_firmware = snd_sof_load_firmware_raw,
+	sof_tgl_ops.debug_map	= tgl_dsp_debugfs;
+	sof_tgl_ops.debug_map_count	= ARRAY_SIZE(tgl_dsp_debugfs);
+	sof_tgl_ops.ipc_dump	= cnl_ipc_dump;
 
 	/* pre/post fw run */
-	.pre_fw_run = hda_dsp_pre_fw_run,
-	.post_fw_run = hda_dsp_post_fw_run,
+	sof_tgl_ops.post_fw_run = hda_dsp_post_fw_run;
 
-	/* parse platform specific extended manifest */
-	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
+	/* firmware run */
+	sof_tgl_ops.run = hda_dsp_cl_boot_firmware_iccmax;
 
 	/* dsp core get/put */
-	.core_get = tgl_dsp_core_get,
-	.core_put = tgl_dsp_core_put,
+	sof_tgl_ops.core_get = tgl_dsp_core_get;
+	sof_tgl_ops.core_put = tgl_dsp_core_put;
 
-	/* firmware run */
-	.run = hda_dsp_cl_boot_firmware_iccmax,
-
-	/* trace callback */
-	.trace_init = hda_dsp_trace_init,
-	.trace_release = hda_dsp_trace_release,
-	.trace_trigger = hda_dsp_trace_trigger,
-
-	/* client ops */
-	.register_ipc_clients = hda_register_clients,
-	.unregister_ipc_clients = hda_unregister_clients,
-
-	/* DAI drivers */
-	.drv		= skl_dai,
-	.num_drv	= SOF_SKL_NUM_DAIS,
-
-	/* PM */
-	.suspend		= hda_dsp_suspend,
-	.resume			= hda_dsp_resume,
-	.runtime_suspend	= hda_dsp_runtime_suspend,
-	.runtime_resume		= hda_dsp_runtime_resume,
-	.runtime_idle		= hda_dsp_runtime_idle,
-	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
-	.set_power_state	= hda_dsp_set_power_state,
-
-	/* ALSA HW info flags */
-	.hw_info =	SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
-
-	.dsp_arch_ops = &sof_xtensa_arch_ops,
+	return 0;
 };
-EXPORT_SYMBOL_NS(sof_tgl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_tgl_ops_init, SND_SOC_SOF_INTEL_HDA_COMMON);
 
 const struct sof_intel_dsp_desc tgl_chip_info = {
 	/* Tigerlake , Alderlake */
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index d866a96ba0d9..aa64e3bd645f 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -21,10 +21,12 @@
 #define sof_ops(sdev) \
 	((sdev)->pdata->desc->ops)
 
-static inline void sof_ops_init(struct snd_sof_dev *sdev)
+static inline int sof_ops_init(struct snd_sof_dev *sdev)
 {
 	if (sdev->pdata->desc->ops_init)
-		sdev->pdata->desc->ops_init(sdev);
+		return sdev->pdata->desc->ops_init(sdev);
+
+	return 0;
 }
 
 /* Mandatory operations are verified during probing */
-- 
2.30.2


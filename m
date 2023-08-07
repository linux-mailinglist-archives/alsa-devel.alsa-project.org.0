Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5AD7730FC
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:13:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CCA1847;
	Mon,  7 Aug 2023 23:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CCA1847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442804;
	bh=h9vTfNUKoIAlI8CBUB6L8NrKMmeSYOyjgRZRNh5aE+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ldqfrMhoA0zYaapMG6jMUuat2wYXjWBoaj/938a0bigrUiUMBhqH17Oa5aTH8IIEb
	 alXBqOZ1LIIbLZCf+I0vIVfI00FasNo6qMiWLaBtlW0q1+2by3VwMbizDoKVlakFxZ
	 93MHIQxV/xDQBpAhN0waQ1laA9op4Zj9jbR0tQnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB637F80548; Mon,  7 Aug 2023 23:10:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34200F8055B;
	Mon,  7 Aug 2023 23:10:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1087F805A9; Mon,  7 Aug 2023 23:10:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86A07F80535
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86A07F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QSsvPyc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442621; x=1722978621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h9vTfNUKoIAlI8CBUB6L8NrKMmeSYOyjgRZRNh5aE+E=;
  b=QSsvPyc1gpyyyX5dJbNzVZbmDUj/AZ+mvqu67+nz2DLQNU/WZq2htpjh
   9KgHAFujyRQPdui4Vi9qNJabZy2OioX/7s1w8RYULSJgc6u30GeJpvLGg
   /89QpYW1809lSCftPH4y063pGFp2bP2TKTY63/i9w+jt9Y/Uo8qhiir4Y
   4STPQXCa1LqL+GnzHBJzJmGRqFyg4g3UlOFEaXWqqJugdSZ271bJeeUYI
   HIJB7Mx8Weo7hJuS+1wKTV3e0ZfZGRDIb2MaofGhE4+Ej18U3qgZaim7v
   HM6CA2ZoO4Gq3YN2aB9o+H9QJjrGVp1dy7rrwU5AZj8ELD6CGgKZrb7CF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244338"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244338"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465195"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465195"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 07/20] ASoC: SOF: Intel: split MTL and LNL operations
Date: Mon,  7 Aug 2023 16:09:46 -0500
Message-Id: <20230807210959.506849-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DZUC3I65SPXDOG7QGAKHADGBQ5RPE74H
X-Message-ID-Hash: DZUC3I65SPXDOG7QGAKHADGBQ5RPE74H
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It was just a matter of time before we found a case where we needed
separate ops for MTL and LNL. For LNL we need to set the DMIC/SSP
OFLEN bit in the probe and resume steps, and this can only be done
cleanly with separate ops.

The function prototypes in mtl.h were added in the same order as their
implementation in mtl.c.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.h     |  2 ++
 sound/soc/sof/intel/lnl.c     | 67 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/mtl.c     | 22 ++++++------
 sound/soc/sof/intel/mtl.h     | 22 ++++++++++--
 sound/soc/sof/intel/pci-lnl.c |  5 ++-
 5 files changed, 102 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index fae3be291861..17164fc42501 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -845,6 +845,8 @@ extern struct snd_sof_dsp_ops sof_icl_ops;
 int sof_icl_ops_init(struct snd_sof_dev *sdev);
 extern struct snd_sof_dsp_ops sof_mtl_ops;
 int sof_mtl_ops_init(struct snd_sof_dev *sdev);
+extern struct snd_sof_dsp_ops sof_lnl_ops;
+int sof_lnl_ops_init(struct snd_sof_dev *sdev);
 
 extern const struct sof_intel_dsp_desc skl_chip_info;
 extern const struct sof_intel_dsp_desc apl_chip_info;
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 535a0fd36f38..65a78d9511e9 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -19,6 +19,73 @@
 #include "hda.h"
 #include <sound/hda-mlink.h>
 
+/* LunarLake ops */
+struct snd_sof_dsp_ops sof_lnl_ops;
+EXPORT_SYMBOL_NS(sof_lnl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+
+static const struct snd_sof_debugfs_map lnl_dsp_debugfs[] = {
+	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
+};
+
+int sof_lnl_ops_init(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc4_fw_data *ipc4_data;
+
+	/* common defaults */
+	memcpy(&sof_lnl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
+
+	/* shutdown */
+	sof_lnl_ops.shutdown = hda_dsp_shutdown;
+
+	/* doorbell */
+	sof_lnl_ops.irq_thread = mtl_ipc_irq_thread;
+
+	/* ipc */
+	sof_lnl_ops.send_msg = mtl_ipc_send_msg;
+	sof_lnl_ops.get_mailbox_offset = mtl_dsp_ipc_get_mailbox_offset;
+	sof_lnl_ops.get_window_offset = mtl_dsp_ipc_get_window_offset;
+
+	/* debug */
+	sof_lnl_ops.debug_map = lnl_dsp_debugfs;
+	sof_lnl_ops.debug_map_count = ARRAY_SIZE(lnl_dsp_debugfs);
+	sof_lnl_ops.dbg_dump = mtl_dsp_dump;
+	sof_lnl_ops.ipc_dump = mtl_ipc_dump;
+
+	/* pre/post fw run */
+	sof_lnl_ops.pre_fw_run = mtl_dsp_pre_fw_run;
+	sof_lnl_ops.post_fw_run = mtl_dsp_post_fw_run;
+
+	/* parse platform specific extended manifest */
+	sof_lnl_ops.parse_platform_ext_manifest = NULL;
+
+	/* dsp core get/put */
+	/* TODO: add core_get and core_put */
+
+	sof_lnl_ops.get_stream_position = mtl_dsp_get_stream_hda_link_position;
+
+	sdev->private = devm_kzalloc(sdev->dev, sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
+	if (!sdev->private)
+		return -ENOMEM;
+
+	ipc4_data = sdev->private;
+	ipc4_data->manifest_fw_hdr_offset = SOF_MAN4_FW_HDR_OFFSET;
+
+	ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
+
+	/* External library loading support */
+	ipc4_data->load_library = hda_dsp_ipc4_load_library;
+
+	/* set DAI ops */
+	hda_set_dai_drv_ops(sdev, &sof_lnl_ops);
+
+	sof_lnl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
+
+	return 0;
+};
+EXPORT_SYMBOL_NS(sof_lnl_ops_init, SND_SOC_SOF_INTEL_HDA_COMMON);
+
 /* Check if an SDW IRQ occurred */
 static bool lnl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 30fe77fd87bf..be3155f98944 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -91,7 +91,7 @@ static bool mtl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 	return false;
 }
 
-static int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	struct sof_ipc4_msg *msg_data = msg->msg_data;
@@ -230,7 +230,7 @@ int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 }
 
 /* pre fw run operations */
-static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
+int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 	u32 dsphfpwrsts;
@@ -279,7 +279,7 @@ static int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-static int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
+int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 {
 	int ret;
 
@@ -301,7 +301,7 @@ static int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
+void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
 	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
 	u32 romdbgsts;
@@ -495,7 +495,7 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	return ret;
 }
 
-static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
+irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 {
 	struct sof_ipc4_msg notification_data = {{ 0 }};
 	struct snd_sof_dev *sdev = context;
@@ -578,17 +578,17 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 	return IRQ_HANDLED;
 }
 
-static int mtl_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
+int mtl_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	return MTL_DSP_MBOX_UPLINK_OFFSET;
 }
 
-static int mtl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+int mtl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
 	return MTL_SRAM_WINDOW_OFFSET(id);
 }
 
-static void mtl_ipc_dump(struct snd_sof_dev *sdev)
+void mtl_ipc_dump(struct snd_sof_dev *sdev)
 {
 	u32 hipcidr, hipcidd, hipcida, hipctdr, hipctdd, hipctda, hipcctl;
 
@@ -612,9 +612,9 @@ static int mtl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 	return mtl_enable_interrupts(sdev, false);
 }
 
-static u64 mtl_dsp_get_stream_hda_link_position(struct snd_sof_dev *sdev,
-						struct snd_soc_component *component,
-						struct snd_pcm_substream *substream)
+u64 mtl_dsp_get_stream_hda_link_position(struct snd_sof_dev *sdev,
+					 struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
 {
 	struct hdac_stream *hstream = substream->runtime->private_data;
 	u32 llp_l, llp_u;
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 2794fe6e8139..02181490f12a 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -82,10 +82,28 @@
 #define MTL_DSP_REG_HfIMRIS1		0x162088
 #define MTL_DSP_REG_HfIMRIS1_IU_MASK	BIT(0)
 
+bool mtl_dsp_check_ipc_irq(struct snd_sof_dev *sdev);
+int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
+
 void mtl_enable_ipc_interrupts(struct snd_sof_dev *sdev);
 void mtl_disable_ipc_interrupts(struct snd_sof_dev *sdev);
-bool mtl_dsp_check_ipc_irq(struct snd_sof_dev *sdev);
 
 int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable);
-int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
+
+int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev);
+int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev);
+void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
+
 int mtl_power_down_dsp(struct snd_sof_dev *sdev);
+int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
+
+irqreturn_t mtl_ipc_irq_thread(int irq, void *context);
+
+int mtl_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev);
+int mtl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id);
+
+void mtl_ipc_dump(struct snd_sof_dev *sdev);
+
+u64 mtl_dsp_get_stream_hda_link_position(struct snd_sof_dev *sdev,
+					 struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream);
diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index 55c757737a95..1b12c280edb4 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -42,9 +42,8 @@ static const struct sof_dev_desc lnl_desc = {
 		[SOF_INTEL_IPC4] = "sof-lnl.ri",
 	},
 	.nocodec_tplg_filename = "sof-lnl-nocodec.tplg",
-	/* the MTL ops are still used for now */
-	.ops = &sof_mtl_ops,
-	.ops_init = sof_mtl_ops_init,
+	.ops = &sof_lnl_ops,
+	.ops_init = sof_lnl_ops_init,
 };
 
 /* PCI IDs */
-- 
2.39.2


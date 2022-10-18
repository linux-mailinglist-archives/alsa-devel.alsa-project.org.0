Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D33602B70
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99CEE8F28;
	Tue, 18 Oct 2022 14:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99CEE8F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095251;
	bh=UAVA7IWRk0z31t8ze/o9BeuTJFLfNwHtnL2qplQrzfc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d2k096Oz+VvBIQd0dl8Y0ceZGd67hTJlQmcpjRTeeW35SRLt1MqJKL7oaMlIQSgU5
	 6tAKBpmnGeVaVNk7NbpvoA0Bz7hEELdvt2f11FKY/AaW88NyOTTbGP5cNQSuG1B+S1
	 SYIDuK/FSPJrYxlKnUMsXRHCwd60SLYsprIw3BzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2CFAF805D2;
	Tue, 18 Oct 2022 14:09:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8E87F805B1; Tue, 18 Oct 2022 14:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D82F8057E
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D82F8057E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EvWyn5n6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094977; x=1697630977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UAVA7IWRk0z31t8ze/o9BeuTJFLfNwHtnL2qplQrzfc=;
 b=EvWyn5n60+v8nPIp/rnzJ6oxAxKldhBymnqVYwt4HMenaL1Ekd0kzOyN
 45sGnvKougkHpiCFIkwpeJCAb77rE9R/FLuhIIltpBCFYdjK1KwAW4HMQ
 FTNPp3nftAJe3eapYFQQZ69gPYHqxZJsTMW2emQZaQbNDJdD+xX0wZ5PV
 LJL9gKJUVqMnPWXjeIGCR8M/huWhVZ+YNM2kDJ7m7gL3VxD5QwLHvaqlE
 ZwVGOcDQbRvXl5GIyDPRB/Lg65Ntbp/vSNbHCjaGx3ek+bn3Z3lLeaKUC
 Hpd7K1TTIE4yZrus6gnVCUYnxX80wcbdo5GsXgOvCn9NF26at7sJxh1eQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293453006"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293453006"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:34 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579758032"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579758032"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 15/19] ASoC: SOF: Intel: Add ipc4 library loading
 implementation
Date: Tue, 18 Oct 2022 15:09:12 +0300
Message-Id: <20221018120916.19820-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Intel HDA platforms the library loading is done via DMA and an IPC
message is also need to be sent to initiate the downloading of the new
library.

Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/ipc4/header.h  |  4 ++
 sound/soc/sof/intel/apl.c        |  3 ++
 sound/soc/sof/intel/cnl.c        |  3 ++
 sound/soc/sof/intel/hda-loader.c | 66 ++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h        |  3 ++
 sound/soc/sof/intel/icl.c        |  3 ++
 sound/soc/sof/intel/mtl.c        |  3 ++
 sound/soc/sof/intel/tgl.c        |  3 ++
 8 files changed, 88 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 99efe0ef1784..622193be7ac4 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -185,6 +185,10 @@ enum sof_ipc4_pipeline_state {
 #define SOF_IPC4_GLB_PIPE_STATE_MASK		GENMASK(15, 0)
 #define SOF_IPC4_GLB_PIPE_STATE(x)		((x) << SOF_IPC4_GLB_PIPE_STATE_SHIFT)
 
+/* load library ipc msg */
+#define SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID_SHIFT	16
+#define SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID(x)	((x) << SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID_SHIFT)
+
 enum sof_ipc4_channel_config {
 	/* one channel only. */
 	SOF_IPC4_CHANNEL_CONFIG_MONO,
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 1549ca7587a4..d93b4ead3c37 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -62,6 +62,9 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 
 		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_1_5;
 
+		/* External library loading support */
+		ipc4_data->load_library = hda_dsp_ipc4_load_library;
+
 		/* doorbell */
 		sof_apl_ops.irq_thread	= hda_dsp_ipc4_irq_thread;
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 19d0b1909bfd..f1e74b49deda 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -389,6 +389,9 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 
 		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_1_8;
 
+		/* External library loading support */
+		ipc4_data->load_library = hda_dsp_ipc4_load_library;
+
 		/* doorbell */
 		sof_cnl_ops.irq_thread	= cnl_ipc4_irq_thread;
 
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 5ed524e166d2..38204541fc5d 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -19,7 +19,9 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 #include <sound/sof.h>
+#include <sound/sof/ipc4/header.h>
 #include "ext_manifest.h"
+#include "../ipc4-priv.h"
 #include "../ops.h"
 #include "../sof-priv.h"
 #include "hda.h"
@@ -518,6 +520,70 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
+			      struct sof_ipc4_fw_library *fw_lib, bool reload)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct hdac_ext_stream *hext_stream;
+	struct firmware stripped_firmware;
+	struct sof_ipc4_msg msg = {};
+	struct snd_dma_buffer dmab;
+	int ret, ret1;
+
+	/* IMR booting will restore the libraries as well, skip the loading */
+	if (reload && hda->booted_from_imr)
+		return 0;
+
+	/* the fw_lib has been verified during loading, we can trust the validity here */
+	stripped_firmware.data = fw_lib->sof_fw.fw->data + fw_lib->sof_fw.payload_offset;
+	stripped_firmware.size = fw_lib->sof_fw.fw->size - fw_lib->sof_fw.payload_offset;
+
+	/* prepare DMA for code loader stream */
+	hext_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT,
+					    stripped_firmware.size,
+					    &dmab, SNDRV_PCM_STREAM_PLAYBACK);
+	if (IS_ERR(hext_stream)) {
+		dev_err(sdev->dev, "%s: DMA prepare failed\n", __func__);
+		return PTR_ERR(hext_stream);
+	}
+
+	memcpy(dmab.area, stripped_firmware.data, stripped_firmware.size);
+
+	msg.primary = hext_stream->hstream.stream_tag - 1;
+	msg.primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_LOAD_LIBRARY);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
+	msg.primary |= SOF_IPC4_GLB_LOAD_LIBRARY_LIB_ID(fw_lib->id);
+
+	ret = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_START);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: DMA trigger start failed\n", __func__);
+		goto cleanup;
+	}
+
+	ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+
+	ret1 = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
+	if (ret1 < 0) {
+		dev_err(sdev->dev, "%s: DMA trigger stop failed\n", __func__);
+		if (!ret)
+			ret = ret1;
+	}
+
+cleanup:
+	/* clean up even in case of error and return the first error */
+	ret1 = hda_cl_cleanup(sdev, &dmab, hext_stream);
+	if (ret1 < 0) {
+		dev_err(sdev->dev, "%s: Code loader DSP cleanup failed\n", __func__);
+
+		/* set return value to indicate cleanup failure */
+		if (!ret)
+			ret = ret1;
+	}
+
+	return ret;
+}
+
 /* pre fw run operations */
 int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index d004bcbb6326..4b9f3819f644 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -857,4 +857,7 @@ int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 void hda_ipc4_dump(struct snd_sof_dev *sdev);
 extern struct sdw_intel_ops sdw_callback;
 
+struct sof_ipc4_fw_library;
+int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
+			      struct sof_ipc4_fw_library *fw_lib, bool reload);
 #endif
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 6d5877108a3d..f95b2ec57077 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -130,6 +130,9 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 
 		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
 
+		/* External library loading support */
+		ipc4_data->load_library = hda_dsp_ipc4_load_library;
+
 		/* doorbell */
 		sof_icl_ops.irq_thread	= cnl_ipc4_irq_thread;
 
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 10298532816f..459da05f4d7a 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -641,6 +641,9 @@ int sof_mtl_ops_init(struct snd_sof_dev *sdev)
 
 	ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
 
+	/* External library loading support */
+	ipc4_data->load_library = hda_dsp_ipc4_load_library;
+
 	/* set DAI ops */
 	hda_set_dai_drv_ops(sdev, &sof_mtl_ops);
 
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 9ae2890e9dac..143447f7c1ac 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -85,6 +85,9 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 
 		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
 
+		/* External library loading support */
+		ipc4_data->load_library = hda_dsp_ipc4_load_library;
+
 		/* doorbell */
 		sof_tgl_ops.irq_thread	= cnl_ipc4_irq_thread;
 
-- 
2.38.0


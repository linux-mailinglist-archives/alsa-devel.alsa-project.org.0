Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA52C69AE
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 17:45:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA9D31865;
	Fri, 27 Nov 2020 17:44:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA9D31865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606495527;
	bh=m6z6pcHZc/eJbyOee6TpYDABmKmI39BDhSf6uciWo0M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RGJLP24FDxsYGMmojDwKfLwUopsOBeGD7iT63a0Cfu6kfLVNxcPWcera8uysvu+y4
	 ZsqkpljbTu9Azv39xb/35FzlmlqHr79r/o9Mw7ZVFVyjSO1yAgZkW21lIVqIYuw8vK
	 3t/iaFlM6B+Ma6NqN4/8wDEkxnl40oiFan/3Xq4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07473F804C1;
	Fri, 27 Nov 2020 17:43:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E107F8019D; Fri, 27 Nov 2020 17:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42DA7F8015F
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 17:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42DA7F8015F
IronPort-SDR: hc8fi2qUDhTI0kBE2K5JNH2nfCZfuQbRAJtRw4oQHRpPnQSvg9jn2So89sOXEeJIpHy3E1Zvqb
 hTY5dA3HBaXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="234020279"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="234020279"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 08:42:55 -0800
IronPort-SDR: oVG6c/OlSVrZR5q7Nwfyry1t9rTzMQmU+Ns0/G6iV7SdZpjLTc1zQVb2CMU66afeMSUeeKuwsc
 PXahTb5zRkHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="403933349"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 27 Nov 2020 08:42:53 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/5] ASoC: SOF: Intel: hda: define parse_platform_ext_manifest
 op
Date: Fri, 27 Nov 2020 18:40:19 +0200
Message-Id: <20201127164022.2498406-3-kai.vehmanen@linux.intel.com>
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

Define the parse_platform_ext_manifest() op for HDA platforms to parse
the SOF_EXT_MAN_CAVS_CONFIG_CAVS_LPRO config item to determine if the FW
is configured for LPRO. The default clock configuration is assumed to be
HPRO in the absence of this item in the extended manifest.
New member clk_config_lpro is added to struct sof_intel_hda_dev to store
the FW clock config information and that this will be used later to perform
platform-specific operations in the post_fw_run op.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/apl.c          |  3 +++
 sound/soc/sof/intel/cnl.c          |  3 +++
 sound/soc/sof/intel/ext_manifest.h | 33 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda-loader.c   | 35 ++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h          |  7 ++++++
 sound/soc/sof/intel/tgl.c          |  3 +++
 6 files changed, 84 insertions(+)
 create mode 100644 sound/soc/sof/intel/ext_manifest.h

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 4eeade2e77f7..fc29b91b8932 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -92,6 +92,9 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.pre_fw_run = hda_dsp_pre_fw_run,
 	.post_fw_run = hda_dsp_post_fw_run,
 
+	/* parse platform specific extended manifest */
+	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
+
 	/* dsp core power up/down */
 	.core_power_up = hda_dsp_enable_core,
 	.core_power_down = hda_dsp_core_reset_power_down,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index a5d3258104c0..158c38743731 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -294,6 +294,9 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.pre_fw_run = hda_dsp_pre_fw_run,
 	.post_fw_run = hda_dsp_post_fw_run,
 
+	/* parse platform specific extended manifest */
+	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
+
 	/* dsp core power up/down */
 	.core_power_up = hda_dsp_enable_core,
 	.core_power_down = hda_dsp_core_reset_power_down,
diff --git a/sound/soc/sof/intel/ext_manifest.h b/sound/soc/sof/intel/ext_manifest.h
new file mode 100644
index 000000000000..a30e25b4e655
--- /dev/null
+++ b/sound/soc/sof/intel/ext_manifest.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ */
+
+/*
+ * Intel extended manifest is a extra place to store Intel cavs specific
+ * metadata about firmware, for example LPRO/HPRO configuration is
+ * Intel cavs specific. This part of output binary is not signed.
+ */
+
+#ifndef __INTEL_CAVS_EXT_MANIFEST_H__
+#define __INTEL_CAVS_EXT_MANIFEST_H__
+
+#include <sound/sof/ext_manifest.h>
+
+/* EXT_MAN_ELEM_PLATFORM_CONFIG_DATA elements identificators */
+enum sof_cavs_config_elem_type {
+	SOF_EXT_MAN_CAVS_CONFIG_EMPTY		= 0,
+	SOF_EXT_MAN_CAVS_CONFIG_CAVS_LPRO	= 1,
+};
+
+/* EXT_MAN_ELEM_PLATFORM_CONFIG_DATA elements */
+struct sof_ext_man_cavs_config_data {
+	struct sof_ext_man_elem_header hdr;
+
+	struct sof_config_elem elems[];
+} __packed;
+
+#endif /* __INTEL_CAVS_EXT_MANIFEST_H__ */
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 2707a16c6a4d..73806223abd1 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -19,6 +19,7 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 #include <sound/sof.h>
+#include "ext_manifest.h"
 #include "../ops.h"
 #include "hda.h"
 
@@ -470,3 +471,37 @@ int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	/* re-enable clock gating and power gating */
 	return hda_dsp_ctrl_clock_power_gating(sdev, true);
 }
+
+int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
+					 const struct sof_ext_man_elem_header *hdr)
+{
+	const struct sof_ext_man_cavs_config_data *config_data =
+		container_of(hdr, struct sof_ext_man_cavs_config_data, hdr);
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	int i, elem_num;
+
+	/* calculate total number of config data elements */
+	elem_num = (hdr->size - sizeof(struct sof_ext_man_elem_header))
+		   / sizeof(struct sof_config_elem);
+	if (elem_num <= 0) {
+		dev_err(sdev->dev, "cavs config data is inconsistent: %d\n", elem_num);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < elem_num; i++)
+		switch (config_data->elems[i].token) {
+		case SOF_EXT_MAN_CAVS_CONFIG_EMPTY:
+			/* skip empty token */
+			break;
+		case SOF_EXT_MAN_CAVS_CONFIG_CAVS_LPRO:
+			hda->clk_config_lpro = config_data->elems[i].value;
+			dev_dbg(sdev->dev, "FW clock config: %s\n",
+				hda->clk_config_lpro ? "LPRO" : "HPRO");
+			break;
+		default:
+			dev_warn(sdev->dev, "unsupported token type: %d\n",
+				 config_data->elems[i].token);
+		}
+
+	return 0;
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 75954e642c5e..d1df579e52aa 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -447,6 +447,9 @@ struct sof_intel_hda_dev {
 
 	/* sdw context allocated by SoundWire driver */
 	struct sdw_intel_ctx *sdw;
+
+	/* FW clock config, 0:HPRO, 1:LPRO */
+	bool clk_config_lpro;
 };
 
 static inline struct hdac_bus *sof_to_bus(struct snd_sof_dev *s)
@@ -618,6 +621,10 @@ int hda_dsp_cl_boot_firmware_skl(struct snd_sof_dev *sdev);
 int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev);
 int hda_dsp_post_fw_run(struct snd_sof_dev *sdev);
 
+/* parse platform specific ext manifest ops */
+int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
+					 const struct sof_ext_man_elem_header *hdr);
+
 /*
  * HDA Controller Operations.
  */
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index bdcc66d0df78..2252ca38ff4b 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -84,6 +84,9 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 	.pre_fw_run = hda_dsp_pre_fw_run,
 	.post_fw_run = hda_dsp_post_fw_run,
 
+	/* parse platform specific extended manifest */
+	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
+
 	/* dsp core power up/down */
 	.core_power_up = hda_dsp_enable_core,
 	.core_power_down = hda_dsp_core_reset_power_down,
-- 
2.28.0


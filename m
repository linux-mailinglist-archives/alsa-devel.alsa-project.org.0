Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA2046C3D3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 20:42:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADDC82542;
	Tue,  7 Dec 2021 20:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADDC82542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638906158;
	bh=x7zfsLrySyg//uyAkYTRYyumsVOPIZlc/LubwBIqN3o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NMVMzCLQ4l6XiLecIGe/mCf0yBF+KwLZOKk1eQnfB6c+bVcjVUmD5ySi1M+KlU/Gp
	 qV2DZ92wJT8qM1kOt9HyvGGIXqjV6IE99msO52nyTAJLjuhscQrvCGv+n5JQOTK4HX
	 7+hQtAZ6cDU0niLOQ5SoLLPOTSY66akDZktXExKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A42ACF804CF;
	Tue,  7 Dec 2021 20:40:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD241F80507; Tue,  7 Dec 2021 20:40:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36E51F80431
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 20:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E51F80431
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236407804"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="236407804"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:08 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="479641152"
Received: from nthiag2-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.17])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: SOF: Intel: ICL: move ICL-specific ops to icl.c
Date: Tue,  7 Dec 2021 13:39:41 -0600
Message-Id: <20211207193947.71080-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
References: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <bard.liao@intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Move the ICL specific ops to icl.c. Also introduce a
macro ICL_DSP_HPRO_CORE_ID to define the core that
should be powered up when HPRO is enabled.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 64 ------------------------------
 sound/soc/sof/intel/hda.h        |  2 -
 sound/soc/sof/intel/icl.c        | 67 +++++++++++++++++++++++++++++++-
 3 files changed, 65 insertions(+), 68 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 40201e5ac201..bfb0e374ebab 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -481,49 +481,6 @@ int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	return hda_dsp_ctrl_clock_power_gating(sdev, true);
 }
 
-/*
- * post fw run operations for ICL,
- * Core 3 will be powered up and in stall when HPRO is enabled
- */
-int hda_dsp_post_fw_run_icl(struct snd_sof_dev *sdev)
-{
-	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
-	int ret;
-
-	if (sdev->first_boot) {
-		ret = hda_sdw_startup(sdev);
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: could not startup SoundWire links\n");
-			return ret;
-		}
-	}
-
-	hda_sdw_int_enable(sdev, true);
-
-	/*
-	 * The recommended HW programming sequence for ICL is to
-	 * power up core 3 and keep it in stall if HPRO is enabled.
-	 * Major difference between ICL and TGL, on ICL core 3 is managed by
-	 * the host whereas on TGL it is handled by the firmware.
-	 */
-	if (!hda->clk_config_lpro) {
-		ret = hda_dsp_enable_core(sdev, BIT(3));
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: dsp core power up failed on core 3\n");
-			return ret;
-		}
-
-		sdev->enabled_cores_mask |= BIT(3);
-		sdev->dsp_core_ref_count[3]++;
-
-		snd_sof_dsp_stall(sdev, BIT(3));
-	}
-
-	/* re-enable clock gating and power gating */
-	return hda_dsp_ctrl_clock_power_gating(sdev, true);
-}
-
 int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
 					 const struct sof_ext_man_elem_header *hdr)
 {
@@ -561,24 +518,3 @@ int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-
-int hda_dsp_core_stall_icl(struct snd_sof_dev *sdev, unsigned int core_mask)
-{
-	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
-	const struct sof_intel_dsp_desc *chip = hda->desc;
-
-	/* make sure core_mask in host managed cores */
-	core_mask &= chip->host_managed_cores_mask;
-	if (!core_mask) {
-		dev_err(sdev->dev, "error: core_mask is not in host managed cores\n");
-		return -EINVAL;
-	}
-
-	/* stall core */
-	snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
-					 HDA_DSP_REG_ADSPCS,
-					 HDA_DSP_ADSPCS_CSTALL_MASK(core_mask),
-					 HDA_DSP_ADSPCS_CSTALL_MASK(core_mask));
-
-	return 0;
-}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 72e78c449aa8..e2055b6c8139 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -618,8 +618,6 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev);
 /* pre and post fw run ops */
 int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev);
 int hda_dsp_post_fw_run(struct snd_sof_dev *sdev);
-int hda_dsp_post_fw_run_icl(struct snd_sof_dev *sdev);
-int hda_dsp_core_stall_icl(struct snd_sof_dev *sdev, unsigned int core_mask);
 
 /* parse platform specific ext manifest ops */
 int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 343c1af7c453..f75e3983969f 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -18,12 +18,75 @@
 #include "hda-ipc.h"
 #include "../sof-audio.h"
 
+#define ICL_DSP_HPRO_CORE_ID 3
+
 static const struct snd_sof_debugfs_map icl_dsp_debugfs[] = {
 	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
 	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
 	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
 };
 
+static int icl_dsp_core_stall(struct snd_sof_dev *sdev, unsigned int core_mask)
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
+	snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPCS,
+					 HDA_DSP_ADSPCS_CSTALL_MASK(core_mask),
+					 HDA_DSP_ADSPCS_CSTALL_MASK(core_mask));
+
+	return 0;
+}
+
+/*
+ * post fw run operation for ICL.
+ * Core 3 will be powered up and in stall when HPRO is enabled
+ */
+static int icl_dsp_post_fw_run(struct snd_sof_dev *sdev)
+{
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	int ret;
+
+	if (sdev->first_boot) {
+		ret = hda_sdw_startup(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: could not startup SoundWire links\n");
+			return ret;
+		}
+	}
+
+	hda_sdw_int_enable(sdev, true);
+
+	/*
+	 * The recommended HW programming sequence for ICL is to
+	 * power up core 3 and keep it in stall if HPRO is enabled.
+	 */
+	if (!hda->clk_config_lpro) {
+		ret = hda_dsp_enable_core(sdev, BIT(ICL_DSP_HPRO_CORE_ID));
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: dsp core power up failed on core %d\n",
+				ICL_DSP_HPRO_CORE_ID);
+			return ret;
+		}
+
+		sdev->enabled_cores_mask |= BIT(ICL_DSP_HPRO_CORE_ID);
+		sdev->dsp_core_ref_count[ICL_DSP_HPRO_CORE_ID]++;
+
+		snd_sof_dsp_stall(sdev, BIT(ICL_DSP_HPRO_CORE_ID));
+	}
+
+	/* re-enable clock gating and power gating */
+	return hda_dsp_ctrl_clock_power_gating(sdev, true);
+}
+
 /* Icelake ops */
 const struct snd_sof_dsp_ops sof_icl_ops = {
 	/* probe/remove/shutdown */
@@ -93,7 +156,7 @@ const struct snd_sof_dsp_ops sof_icl_ops = {
 
 	/* pre/post fw run */
 	.pre_fw_run = hda_dsp_pre_fw_run,
-	.post_fw_run = hda_dsp_post_fw_run_icl,
+	.post_fw_run = icl_dsp_post_fw_run,
 
 	/* parse platform specific extended manifest */
 	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
@@ -103,7 +166,7 @@ const struct snd_sof_dsp_ops sof_icl_ops = {
 
 	/* firmware run */
 	.run = hda_dsp_cl_boot_firmware_iccmax,
-	.stall = hda_dsp_core_stall_icl,
+	.stall = icl_dsp_core_stall,
 
 	/* trace callback */
 	.trace_init = hda_dsp_trace_init,
-- 
2.25.1


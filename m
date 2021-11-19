Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A549457717
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 20:36:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCEB1178F;
	Fri, 19 Nov 2021 20:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCEB1178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637350611;
	bh=OQ8EwPIaliQT0uigWI0tHCO6c/48brU3Hl4tKnXyq9s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q9xvpguNAq09Xw+TTs4qyXmQ2vGEy4DkDyy+dqy1Xo/FjhZmZtuf76zYoY4o7xIBh
	 ZbWAA84U+Hzkk+ASzxWzcMo/ey/JSGUff5QcRJUnBmP3QTCR4WiKZXCCMnmgU050pg
	 2x4q6YNHe+cB/X27JT9l8RVQfnhlnkRV6eqOyVho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F4CF804FE;
	Fri, 19 Nov 2021 20:34:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D17CF80217; Fri, 19 Nov 2021 20:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F6A4F80115
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 20:34:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F6A4F80115
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="215192492"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="215192492"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 11:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="473651218"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 19 Nov 2021 11:34:14 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 05/10] ASoC: SOF: Intel: CNL/ICL/APL: set core_get/core_put ops
Date: Fri, 19 Nov 2021 21:26:16 +0200
Message-Id: <20211119192621.4096077-6-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
References: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Set core_get/put ops for CNL/ICL platforms. These platforms
do not support enabling/disabling secondary cores
dynamically. So skip sending the IPC to power off the
cores in the core_put op.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     |  1 +
 sound/soc/sof/intel/cnl.c     |  1 +
 sound/soc/sof/intel/hda-dsp.c | 44 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/intel/icl.c     |  1 +
 5 files changed, 48 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 917f78cf6daf..569668b2186f 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -104,6 +104,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	/* dsp core power up/down */
 	.core_power_up = hda_dsp_enable_core,
 	.core_power_down = hda_dsp_core_reset_power_down,
+	.core_get = hda_dsp_core_get,
 
 	/* trace callback */
 	.trace_init = hda_dsp_trace_init,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 3957e2b3db32..be6b6500b907 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -306,6 +306,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	/* dsp core power up/down */
 	.core_power_up = hda_dsp_enable_core,
 	.core_power_down = hda_dsp_core_reset_power_down,
+	.core_get = hda_dsp_core_get,
 
 	/* firmware run */
 	.run = hda_dsp_cl_boot_firmware,
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 287dc0eb6686..b2f6dcd1c23d 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -962,3 +962,47 @@ void hda_dsp_d0i3_work(struct work_struct *work)
 				    "error: failed to set DSP state %d substate %d\n",
 				    target_state.state, target_state.substate);
 }
+
+int hda_dsp_core_get(struct snd_sof_dev *sdev, int core)
+{
+	struct sof_ipc_pm_core_config pm_core_config = {
+		.hdr = {
+			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
+			.size = sizeof(pm_core_config),
+		},
+		.enable_mask = sdev->enabled_cores_mask | BIT(core),
+	};
+	int ret, ret1;
+
+	/* power up core */
+	ret = hda_dsp_enable_core(sdev, BIT(core));
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to power up core %d with err: %d\n",
+			core, ret);
+		return ret;
+	}
+
+	/* No need to send IPC for primary core or if FW boot is not complete */
+	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE || core == SOF_DSP_PRIMARY_CORE)
+		return 0;
+
+	/* Now notify DSP for secondary cores */
+	ret = sof_ipc_tx_message(sdev->ipc, pm_core_config.hdr.cmd,
+				 &pm_core_config, sizeof(pm_core_config),
+				 &pm_core_config, sizeof(pm_core_config));
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to enable secondary core '%d' failed with %d\n",
+			core, ret);
+		goto power_down;
+	}
+
+	return ret;
+
+power_down:
+	/* power down core if it is host managed and return the original error if this fails too */
+	ret1 = hda_dsp_core_reset_power_down(sdev, BIT(core));
+	if (ret1 < 0)
+		dev_err(sdev->dev, "failed to power down core: %d with err: %d\n", core, ret1);
+
+	return ret;
+}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 1195018a1f4f..646f5d4dc882 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -496,6 +496,7 @@ int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 				  unsigned int core_mask);
+int hda_dsp_core_get(struct snd_sof_dev *sdev, int core);
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
 
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 0b2cc331d55b..e3472868f49a 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -100,6 +100,7 @@ const struct snd_sof_dsp_ops sof_icl_ops = {
 	/* dsp core power up/down */
 	.core_power_up = hda_dsp_enable_core,
 	.core_power_down = hda_dsp_core_reset_power_down,
+	.core_get = hda_dsp_core_get,
 
 	/* firmware run */
 	.run = hda_dsp_cl_boot_firmware_iccmax,
-- 
2.33.0


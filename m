Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E8D457716
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 20:36:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C783E1784;
	Fri, 19 Nov 2021 20:35:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C783E1784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637350587;
	bh=h3XTpnsy+argQ0YGtXjRf24+PDMPzymbYI5Sq1V0N/w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dkJ2bTsBwVkqV7Yh2/ogP+wGMbrExyEM4XLmilYLPedUb+HUOgb/AlloOiu5H5uCy
	 NtQr2DlVHceVMHMFMneCVHtmBkWrJawZkVSlD0P9+CIXKgJNDj7mBGad/Xj8JND8Cw
	 Cqis0wpB8z1R/iGQFbSWZ9yD7EORwzthI0/WwudM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00641F804C3;
	Fri, 19 Nov 2021 20:34:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06B92F804C3; Fri, 19 Nov 2021 20:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47E09F80217
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 20:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47E09F80217
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="215192481"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="215192481"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 11:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="473651182"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 19 Nov 2021 11:34:12 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 04/10] ASoC: SOF: Intel: TGL: set core_get/put ops
Date: Fri, 19 Nov 2021 21:26:15 +0200
Message-Id: <20211119192621.4096077-5-kai.vehmanen@linux.intel.com>
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

Set core_get/put() ops for TGL. When core_get()
is requested for a core, its ref_count is incremented
and the PM_CORE_ENABLE IPC sent to the firmware to
power up the core if the current ref_count is 1.
Conversely, the ref_count is decremented in core_put()
and an IPC is sent to the DSP to power off the core
if the ref_count is 0.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/tgl.c | 42 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 48da8e7a67bc..51011b0b8c11 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -20,6 +20,46 @@ static const struct snd_sof_debugfs_map tgl_dsp_debugfs[] = {
 	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
 };
 
+static int tgl_dsp_core_get(struct snd_sof_dev *sdev, int core)
+{
+	struct sof_ipc_pm_core_config pm_core_config = {
+		.hdr = {
+			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
+			.size = sizeof(pm_core_config),
+		},
+		.enable_mask = sdev->enabled_cores_mask | BIT(core),
+	};
+
+	/* power up primary core if not already powered up and return */
+	if (core == SOF_DSP_PRIMARY_CORE)
+		return hda_dsp_enable_core(sdev, BIT(core));
+
+	/* notify DSP for secondary cores */
+	return sof_ipc_tx_message(sdev->ipc, pm_core_config.hdr.cmd,
+				 &pm_core_config, sizeof(pm_core_config),
+				 &pm_core_config, sizeof(pm_core_config));
+}
+
+static int tgl_dsp_core_put(struct snd_sof_dev *sdev, int core)
+{
+	struct sof_ipc_pm_core_config pm_core_config = {
+		.hdr = {
+			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
+			.size = sizeof(pm_core_config),
+		},
+		.enable_mask = sdev->enabled_cores_mask & ~BIT(core),
+	};
+
+	/* power down primary core and return */
+	if (core == SOF_DSP_PRIMARY_CORE)
+		return hda_dsp_core_reset_power_down(sdev, BIT(core));
+
+	/* notify DSP for secondary cores */
+	return sof_ipc_tx_message(sdev->ipc, pm_core_config.hdr.cmd,
+				 &pm_core_config, sizeof(pm_core_config),
+				 &pm_core_config, sizeof(pm_core_config));
+}
+
 /* Tigerlake ops */
 const struct snd_sof_dsp_ops sof_tgl_ops = {
 	/* probe/remove/shutdown */
@@ -96,6 +136,8 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 	/* dsp core power up/down */
 	.core_power_up = hda_dsp_enable_core,
 	.core_power_down = hda_dsp_core_reset_power_down,
+	.core_get = tgl_dsp_core_get,
+	.core_put = tgl_dsp_core_put,
 
 	/* firmware run */
 	.run = hda_dsp_cl_boot_firmware_iccmax,
-- 
2.33.0


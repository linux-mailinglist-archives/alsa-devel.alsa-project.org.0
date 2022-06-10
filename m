Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0514545F61
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E96F1FEE;
	Fri, 10 Jun 2022 10:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E96F1FEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654850296;
	bh=poqxcVlyb35nPsRN08CWTSN9K3tM+emwBa6OJg84uMw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSeYkHOv+aVZuFodRTHC5EaxVy6Ugo5myUuC06vz5hHcmRo8Advu4wX+BoBKAc6/M
	 XKMN6f7jgL3uXu6Un0fYqBQGEZcUTQ9MO2E1FB2IVz4H69jJWXT0mN0YkJbPnNxlVw
	 90rBHtcP0XUjVrU4k4IzkaxcwEayBPckEdnVWVjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B23A5F80549;
	Fri, 10 Jun 2022 10:35:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4372AF804CF; Fri, 10 Jun 2022 10:35:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CA12F804CF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA12F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YLAARtqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654850129; x=1686386129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=poqxcVlyb35nPsRN08CWTSN9K3tM+emwBa6OJg84uMw=;
 b=YLAARtqxecg3mShnpoJ8wXebrNXKGLfzcSbIJ+LhsKwAnyxjyMsp28pL
 y1pEKCRgKChS1awcYqTnNfsP3QiGfldBCGzFhWzHHfi2lz5kpAYv2C4Ik
 ARoxylvYqgbBv39yV5SF7SPZmmPpORlLkWJZvzglWK1hrHApQSg7SiKsc
 ZweuF85COJT9a5JCI0zQzdlRFdZO/Iol2xND1D1Qb1SLuwe73J41qCICP
 IzAUkWQU3PSFAx5QD/ROPp1QgMDniu6XMb58MxAIkzwF8nONFd1iiPr7X
 N5DbwQquG2EANBkUWd1H8QWbqx6WDDH57KjXDItiA3YQyPBbUvvsxK+gM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302936648"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302936648"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638020892"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 5/6] ASoC: SOF: Intel: Switch to use the generic
 pm_ops.set_core_state
Date: Fri, 10 Jun 2022 11:35:48 +0300
Message-Id: <20220610083549.16773-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
References: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Instead of craft and send an IPC(3) message in hda_dsp_core_get(),
tgl_dsp_core_get() and tgl_dsp_core_put(), use the generic ops for handling
the IPC dependent implementation of core power on/off.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 15 ++++++---------
 sound/soc/sof/intel/tgl.c     | 30 ++++++++++--------------------
 2 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index e24eea725acb..263ad455e283 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -940,13 +940,7 @@ void hda_dsp_d0i3_work(struct work_struct *work)
 
 int hda_dsp_core_get(struct snd_sof_dev *sdev, int core)
 {
-	struct sof_ipc_pm_core_config pm_core_config = {
-		.hdr = {
-			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
-			.size = sizeof(pm_core_config),
-		},
-		.enable_mask = sdev->enabled_cores_mask | BIT(core),
-	};
+	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 	int ret, ret1;
 
 	/* power up core */
@@ -961,9 +955,12 @@ int hda_dsp_core_get(struct snd_sof_dev *sdev, int core)
 	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE || core == SOF_DSP_PRIMARY_CORE)
 		return 0;
 
+	/* No need to continue the set_core_state ops is not available */
+	if (!pm_ops->set_core_state)
+		return 0;
+
 	/* Now notify DSP for secondary cores */
-	ret = sof_ipc_tx_message(sdev->ipc, &pm_core_config, sizeof(pm_core_config),
-				 &pm_core_config, sizeof(pm_core_config));
+	ret = pm_ops->set_core_state(sdev, core, true);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to enable secondary core '%d' failed with %d\n",
 			core, ret);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 1ddc492f1b13..dcad7c382de6 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -24,40 +24,30 @@ static const struct snd_sof_debugfs_map tgl_dsp_debugfs[] = {
 
 static int tgl_dsp_core_get(struct snd_sof_dev *sdev, int core)
 {
-	struct sof_ipc_pm_core_config pm_core_config = {
-		.hdr = {
-			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
-			.size = sizeof(pm_core_config),
-		},
-		.enable_mask = sdev->enabled_cores_mask | BIT(core),
-	};
+	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 
 	/* power up primary core if not already powered up and return */
 	if (core == SOF_DSP_PRIMARY_CORE)
 		return hda_dsp_enable_core(sdev, BIT(core));
 
-	/* notify DSP for secondary cores */
-	return sof_ipc_tx_message(sdev->ipc, &pm_core_config, sizeof(pm_core_config),
-				 &pm_core_config, sizeof(pm_core_config));
+	if (pm_ops->set_core_state)
+		return pm_ops->set_core_state(sdev, core, true);
+
+	return 0;
 }
 
 static int tgl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 {
-	struct sof_ipc_pm_core_config pm_core_config = {
-		.hdr = {
-			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
-			.size = sizeof(pm_core_config),
-		},
-		.enable_mask = sdev->enabled_cores_mask & ~BIT(core),
-	};
+	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 
 	/* power down primary core and return */
 	if (core == SOF_DSP_PRIMARY_CORE)
 		return hda_dsp_core_reset_power_down(sdev, BIT(core));
 
-	/* notify DSP for secondary cores */
-	return sof_ipc_tx_message(sdev->ipc, &pm_core_config, sizeof(pm_core_config),
-				 &pm_core_config, sizeof(pm_core_config));
+	if (pm_ops->set_core_state)
+		return pm_ops->set_core_state(sdev, core, false);
+
+	return 0;
 }
 
 /* Tigerlake ops */
-- 
2.36.1


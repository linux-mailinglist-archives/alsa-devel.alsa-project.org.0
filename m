Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A2545771F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 20:39:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D93461790;
	Fri, 19 Nov 2021 20:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D93461790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637350749;
	bh=Onfs5Icmck1MBjj5S/AGV7W+A1rvgoSqA0vXDhlWNP8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHlY3DgNbhBcBahODC46OMatKmmvz9cduW23MahXwdfOUw4DeszZnX3JQQKejsoH2
	 8s7Ot/E/gZE51fvIISFbOtgYHrOOw1EQNIOQyMT7nmMWLKie2t4WDCPIvtvjkQOGBX
	 1rJH1gSRM1zp+oKzJUtAwU5ie3C8LVl6Txd2XFGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D50EF80539;
	Fri, 19 Nov 2021 20:34:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80F97F80533; Fri, 19 Nov 2021 20:34:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA3C9F80519
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 20:34:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA3C9F80519
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="221697780"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="221697780"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 11:34:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="473651277"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 19 Nov 2021 11:34:25 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 08/10] ASoC: SOF: hda: don't use the core op for power
 up/power down
Date: Fri, 19 Nov 2021 21:26:19 +0200
Message-Id: <20211119192621.4096077-9-kai.vehmanen@linux.intel.com>
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

The core_power_up/down() ops will be deprecated. Use the
HDA platform-specific functions for powering up/down
the cores during probe/suspend/remove. The enabled_cores_mask
and the core ref_count's are manually updated in each of
these functions.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c    |  8 ++++++--
 sound/soc/sof/intel/hda-loader.c | 24 +++++++++++++++++-------
 sound/soc/sof/intel/hda.c        |  4 ++--
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index b2f6dcd1c23d..916a257ea96b 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -614,7 +614,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 #endif
-	int ret;
+	int ret, j;
 
 	hda_sdw_int_enable(sdev, false);
 
@@ -629,13 +629,17 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 #endif
 
 	/* power down DSP */
-	ret = snd_sof_dsp_core_power_down(sdev, chip->host_managed_cores_mask);
+	ret = hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to power down core during suspend\n");
 		return ret;
 	}
 
+	/* reset ref counts for all cores */
+	for (j = 0; j < chip->cores_num; j++)
+		sdev->dsp_core_ref_count[j] = 0;
+
 	/* disable ppcap interrupt */
 	hda_dsp_ctrl_ppcap_enable(sdev, false);
 	hda_dsp_ctrl_ppcap_int_enable(sdev, false);
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index abad6d0ceb83..40201e5ac201 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -88,12 +88,13 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 	unsigned int status;
-	u32 flags;
+	unsigned long mask;
+	u32 flags, j;
 	int ret;
 	int i;
 
 	/* step 1: power up corex */
-	ret = snd_sof_dsp_core_power_up(sdev, chip->host_managed_cores_mask);
+	ret = hda_dsp_enable_core(sdev, chip->host_managed_cores_mask);
 	if (ret < 0) {
 		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev, "error: dsp core 0/1 power up failed\n");
@@ -148,8 +149,8 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 				       chip->ipc_ack_mask);
 
 	/* step 5: power down cores that are no longer needed */
-	ret = snd_sof_dsp_core_power_down(sdev, chip->host_managed_cores_mask &
-					  ~(chip->init_core_mask));
+	ret = hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask &
+					   ~(chip->init_core_mask));
 	if (ret < 0) {
 		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
@@ -168,8 +169,14 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 					HDA_DSP_REG_POLL_INTERVAL_US,
 					chip->rom_init_timeout *
 					USEC_PER_MSEC);
-	if (!ret)
+	if (!ret) {
+		/* set enabled cores mask and increment ref count for cores in init_core_mask */
+		sdev->enabled_cores_mask |= chip->init_core_mask;
+		mask = sdev->enabled_cores_mask;
+		for_each_set_bit(j, &mask, SOF_MAX_DSP_NUM_CORES)
+			sdev->dsp_core_ref_count[j]++;
 		return 0;
+	}
 
 	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 		dev_err(sdev->dev,
@@ -184,7 +191,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 		flags &= ~SOF_DBG_DUMP_OPTIONAL;
 
 	snd_sof_dsp_dbg_dump(sdev, flags);
-	snd_sof_dsp_core_power_down(sdev, chip->host_managed_cores_mask);
+	hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 
 	return ret;
 }
@@ -501,12 +508,15 @@ int hda_dsp_post_fw_run_icl(struct snd_sof_dev *sdev)
 	 * the host whereas on TGL it is handled by the firmware.
 	 */
 	if (!hda->clk_config_lpro) {
-		ret = snd_sof_dsp_core_power_up(sdev, BIT(3));
+		ret = hda_dsp_enable_core(sdev, BIT(3));
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: dsp core power up failed on core 3\n");
 			return ret;
 		}
 
+		sdev->enabled_cores_mask |= BIT(3);
+		sdev->dsp_core_ref_count[3]++;
+
 		snd_sof_dsp_stall(sdev, BIT(3));
 	}
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 3c69e8fcd43b..1e1e9659ea86 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1034,9 +1034,9 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 int hda_dsp_remove(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	const struct sof_intel_dsp_desc *chip = hda->desc;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
-	const struct sof_intel_dsp_desc *chip = hda->desc;
 
 	/* cancel any attempt for DSP D0I3 */
 	cancel_delayed_work_sync(&hda->d0i3_work);
@@ -1061,7 +1061,7 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 
 	/* disable cores */
 	if (chip)
-		snd_sof_dsp_core_power_down(sdev, chip->host_managed_cores_mask);
+		hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 
 	/* disable DSP */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-- 
2.33.0


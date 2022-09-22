Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 918315E6E95
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:40:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3184284B;
	Thu, 22 Sep 2022 23:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3184284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882831;
	bh=6fyWPQfVvq6tl0Bn9dxLQo91RA3ihWwfwaS4ZD6DqRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7mXIpeUEyQ6wUzfsPZeNkgl3QMtRMlPsUqD9WUd7As0AKg9gPBmOqq5C3dbzudDR
	 VcCLgvQq5hxnozqSnVILiFnutdUacGAkEztbA1LsMyzwixTN7Vx5Q+ZU5D1iefdWJU
	 6oWVw76y+y9OEdOAjMimCSEMSayRYtZUxucDFHo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49D90F8057C;
	Thu, 22 Sep 2022 23:37:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30C18F8055A; Thu, 22 Sep 2022 23:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27E87F80107
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27E87F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Euoj/FIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882623; x=1695418623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6fyWPQfVvq6tl0Bn9dxLQo91RA3ihWwfwaS4ZD6DqRQ=;
 b=Euoj/FIkD8O1kpH+PqyzKzHbeBkmid5QYJTk0Xu4WQrbRfiiGg067Jo6
 TgPfO2zczDVa5lckx5feMpWdXxAsIFvkxNNm7dQ8jX5+sdBSU/IF5zORk
 BkpFse6UVGhLyvg8g5MTN6ZNoH5rZNmTVbsogdmB33PJ1fau2eRPBlMj+
 vFoUJ1m09mSOvRMTxGRcsWfe5B5fWKB9QoDARmvpWlxekCL2/OMe0X0Ua
 EMif7KrlgVmNyoo/lW/FKrLOPcKWP3WfrRCtTviaSzlSSh6TAWSoUgpKJ
 otpNVlP915YU57dJFV2FJInSP/TKu/02HCRdPABvzFeLyOXLat53LQNMo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386725803"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="386725803"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745550867"
Received: from jpwarner-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.13.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:52 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/10] ASoC: SOF: Intel: MTL: reuse the common ops for PM
Date: Thu, 22 Sep 2022 14:36:43 -0700
Message-Id: <20220922213644.666315-10-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
References: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Now that the disabling of interrupts and powering down the DSP has been
abstracted, re-use the common ops for PM for MTL as well.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 150 --------------------------------------
 1 file changed, 150 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 107c1f42f421..eb4e00af74a3 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -579,150 +579,6 @@ static int mtl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 	return MTL_SRAM_WINDOW_OFFSET(id);
 }
 
-static int mtl_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
-{
-	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
-	const struct sof_intel_dsp_desc *chip = hda->desc;
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	struct hdac_bus *bus = sof_to_bus(sdev);
-#endif
-	u32 dsphfdsscs;
-	u32 cpa;
-	int ret;
-	int i;
-
-	mtl_disable_ipc_interrupts(sdev);
-	ret = mtl_disable_interrupts(sdev);
-	if (ret)
-		return ret;
-
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	hda_codec_jack_wake_enable(sdev, runtime_suspend);
-	/* power down all hda link */
-	snd_hdac_ext_bus_link_power_down_all(bus);
-#endif
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFPWRCTL,
-				MTL_HFPWRCTL_WPDSPHPXPG, 0);
-
-	/* Set the DSP subsystem power down */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, MTL_HFDSSCS,
-				MTL_HFDSSCS_SPA_MASK, 0);
-
-	/* Wait for unstable CPA read (1 then 0 then 1) just after setting SPA bit */
-	usleep_range(1000, 1010);
-
-	/* poll with timeout to check if operation successful */
-	cpa = MTL_HFDSSCS_CPA_MASK;
-	dsphfdsscs = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFDSSCS);
-	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_HFDSSCS, dsphfdsscs,
-					    (dsphfdsscs & cpa) == 0, HDA_DSP_REG_POLL_INTERVAL_US,
-					HDA_DSP_RESET_TIMEOUT_US);
-	if (ret < 0)
-		dev_err(sdev->dev, "failed to disable DSP subsystem\n");
-
-	/* reset ref counts for all cores */
-	for (i = 0; i < chip->cores_num; i++)
-		sdev->dsp_core_ref_count[i] = 0;
-
-	/* TODO: need to reset controller? */
-
-	/* display codec can be powered off after link reset */
-	hda_codec_i915_display_power(sdev, false);
-
-	return 0;
-}
-
-static int mtl_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = target_state,
-		.substate = target_state == SOF_DSP_PM_D0 ?
-				SOF_HDA_DSP_PM_D0I3 : 0,
-	};
-	int ret;
-
-	ret = mtl_suspend(sdev, false);
-	if (ret < 0)
-		return ret;
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int mtl_dsp_runtime_suspend(struct snd_sof_dev *sdev)
-{
-	const struct sof_dsp_power_state target_state = {
-		.state = SOF_DSP_PM_D3,
-	};
-	int ret;
-
-	ret = mtl_suspend(sdev, true);
-	if (ret < 0)
-		return ret;
-
-	return snd_sof_dsp_set_power_state(sdev, &target_state);
-}
-
-static int mtl_resume(struct snd_sof_dev *sdev, bool runtime_resume)
-{
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct hdac_ext_link *hlink = NULL;
-#endif
-
-	/* display codec must be powered before link reset */
-	hda_codec_i915_display_power(sdev, true);
-
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* check jack status */
-	if (runtime_resume) {
-		hda_codec_jack_wake_enable(sdev, false);
-		if (sdev->system_suspend_target == SOF_SUSPEND_NONE)
-			hda_codec_jack_check(sdev);
-	}
-
-	/* turn off the links that were off before suspend */
-	list_for_each_entry(hlink, &bus->hlink_list, list) {
-		if (!hlink->ref_count)
-			snd_hdac_ext_bus_link_power_down(hlink);
-	}
-
-	/* check dma status and clean up CORB/RIRB buffers */
-	if (!bus->cmd_dma_state)
-		snd_hdac_bus_stop_cmd_io(bus);
-#endif
-
-	return 0;
-}
-
-static int mtl_dsp_resume(struct snd_sof_dev *sdev)
-{
-	const struct sof_dsp_power_state target_state = {
-		.state = SOF_DSP_PM_D0,
-		.substate = SOF_HDA_DSP_PM_D0I0,
-	};
-	int ret;
-
-	ret = mtl_resume(sdev, false);
-	if (ret < 0)
-		return ret;
-
-	return snd_sof_dsp_set_power_state(sdev, &target_state);
-}
-
-static int mtl_dsp_runtime_resume(struct snd_sof_dev *sdev)
-{
-	const struct sof_dsp_power_state target_state = {
-		.state = SOF_DSP_PM_D0,
-	};
-	int ret;
-
-	ret = mtl_resume(sdev, true);
-	if (ret < 0)
-		return ret;
-
-	return snd_sof_dsp_set_power_state(sdev, &target_state);
-}
-
 static void mtl_ipc_dump(struct snd_sof_dev *sdev)
 {
 	u32 hipcctl;
@@ -785,12 +641,6 @@ int sof_mtl_ops_init(struct snd_sof_dev *sdev)
 	/* dsp core get/put */
 	/* TODO: add core_get and core_put */
 
-	/* PM */
-	sof_mtl_ops.suspend = mtl_dsp_suspend;
-	sof_mtl_ops.resume = mtl_dsp_resume;
-	sof_mtl_ops.runtime_suspend = mtl_dsp_runtime_suspend;
-	sof_mtl_ops.runtime_resume = mtl_dsp_runtime_resume;
-
 	sdev->private = devm_kzalloc(sdev->dev, sizeof(struct sof_ipc4_fw_data), GFP_KERNEL);
 	if (!sdev->private)
 		return -ENOMEM;
-- 
2.25.1


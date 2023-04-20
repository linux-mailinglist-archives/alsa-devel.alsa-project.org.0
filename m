Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B266D6E90C8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:47:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43EEFEC5;
	Thu, 20 Apr 2023 12:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43EEFEC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681987658;
	bh=jf3/62dezEQvXpzzP6exCEdsUN2vaXseTEYALqbEX8o=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ArScI518dPKDm5fxmkhde7u00r0NvaQNrs2WHSxSVPxoKiUDW1STxvMWDVYUcj9j4
	 nFnFR7Nq+fJJDBcgPzJ8CZyEFXzWok1G7uMgbntnOm25IhdjyUPn5RxhpS53u5SGYl
	 DR3rFP2PMYqXMY5IZtWNnGk7Yon9BB0cKtgFTp3U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EA6F80149;
	Thu, 20 Apr 2023 12:46:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF0ACF80155; Thu, 20 Apr 2023 12:46:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78A1BF80053
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 12:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A1BF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FklTiiwf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681987597; x=1713523597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jf3/62dezEQvXpzzP6exCEdsUN2vaXseTEYALqbEX8o=;
  b=FklTiiwfZK1I86QGEGry7gvc+QXDCOijHGfxp9Mp5twCDJnqAqNo/zwo
   dDBeOKVhoys39o9v7GRNOaU4KMAcJ7gNEZQN79j9jAt3P6yIHnyIp84gw
   WEQFB6ikWhq0cOTIWvwpkdLnqMu/58DwqJ2ePkLez1UsVCzRMIoiVhIzQ
   aeQ1bWK2i9/IKH9Ia6qY8/yfCbq5axCCKTvnLWFztWliaCQvZ84jTqb+j
   OL5tApx5Yr2bDQi1TKYQOwu/kT82+6SqDZYkimC7ebS6jGShAeZrN8QJy
   2Wm2MJtiANJ+mPBlT8BPrRbwCV/tnmWK3w4YJZEYRxYHV0WJXismxp2fQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345705976"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200";
   d="scan'208";a="345705976"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 03:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="724385052"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200";
   d="scan'208";a="724385052"
Received: from draj-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.32.253])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 03:46:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: Split the set_power_op for IPC3 and IPC4
Date: Thu, 20 Apr 2023 13:47:14 +0300
Message-Id: <20230420104714.29573-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GMJMYMX4KNE7TGNGEZM6ZN6M5DYAZHPR
X-Message-ID-Hash: GMJMYMX4KNE7TGNGEZM6ZN6M5DYAZHPR
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMJMYMX4KNE7TGNGEZM6ZN6M5DYAZHPR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Suspending to S0iX with IPC3 requires the PM_GATE IPC to be sent again
to stop the DMA trace. But with IPC4, this is not needed as the trace is
stopped with the LARGE_CONFIG_SET IPC. Also, sending the MOD_D0IX IPC to
set the D0I3 state again when the DSP is in D0I3 already results in an
imbalance in PM runtime states in the firmware. So split the
set_power_state ops for IPC3 and IPC4 to avoid sending the MOD_D0IX IPC
when the DSP is already in D0I3 with IPC4.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Mark,

last minute patch for 6.4 as the issue this patch addressing was discovered
and fixed recently for IPC4.

Regards,
Peter

 sound/soc/sof/intel/apl.c            |  4 ++
 sound/soc/sof/intel/cnl.c            |  4 ++
 sound/soc/sof/intel/hda-common-ops.c |  1 -
 sound/soc/sof/intel/hda-dsp.c        | 60 ++++++++++++++++++----------
 sound/soc/sof/intel/hda.h            |  6 ++-
 sound/soc/sof/intel/icl.c            |  4 ++
 sound/soc/sof/intel/mtl.c            |  2 +
 sound/soc/sof/intel/tgl.c            |  4 ++
 8 files changed, 60 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 0e7a7e4ad976..e1f25a8f0c32 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -48,6 +48,8 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_apl_ops.ipc_dump	= hda_ipc_dump;
+
+		sof_apl_ops.set_power_state = hda_dsp_set_power_state_ipc3;
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
@@ -73,6 +75,8 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_apl_ops.ipc_dump	= hda_ipc4_dump;
+
+		sof_apl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
 	}
 
 	/* set DAI driver ops */
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index a08a77fa946b..a95222e53ecf 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -395,6 +395,8 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_cnl_ops.ipc_dump	= cnl_ipc_dump;
+
+		sof_cnl_ops.set_power_state = hda_dsp_set_power_state_ipc3;
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
@@ -420,6 +422,8 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_cnl_ops.ipc_dump	= cnl_ipc4_dump;
+
+		sof_cnl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
 	}
 
 	/* set DAI driver ops */
diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 397303b3ac9d..8e1cd0babd32 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -89,7 +89,6 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
 	.runtime_resume		= hda_dsp_runtime_resume,
 	.runtime_idle		= hda_dsp_runtime_idle,
 	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
-	.set_power_state	= hda_dsp_set_power_state,
 
 	/* ALSA HW info flags */
 	.hw_info =	SNDRV_PCM_INFO_MMAP |
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 77df536cf901..44f39a520bb3 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -574,31 +574,11 @@ static void hda_dsp_state_log(struct snd_sof_dev *sdev)
  * is called again either because of a new IPC sent to the DSP or
  * during system suspend/resume.
  */
-int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
-			    const struct sof_dsp_power_state *target_state)
+static int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
+				   const struct sof_dsp_power_state *target_state)
 {
 	int ret = 0;
 
-	/*
-	 * When the DSP is already in D0I3 and the target state is D0I3,
-	 * it could be the case that the DSP is in D0I3 during S0
-	 * and the system is suspending to S0Ix. Therefore,
-	 * hda_dsp_set_D0_state() must be called to disable trace DMA
-	 * by sending the PM_GATE IPC to the FW.
-	 */
-	if (target_state->substate == SOF_HDA_DSP_PM_D0I3 &&
-	    sdev->system_suspend_target == SOF_SUSPEND_S0IX)
-		goto set_state;
-
-	/*
-	 * For all other cases, return without doing anything if
-	 * the DSP is already in the target state.
-	 */
-	if (target_state->state == sdev->dsp_power_state.state &&
-	    target_state->substate == sdev->dsp_power_state.substate)
-		return 0;
-
-set_state:
 	switch (target_state->state) {
 	case SOF_DSP_PM_D0:
 		ret = hda_dsp_set_D0_state(sdev, target_state);
@@ -630,6 +610,42 @@ int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 	return ret;
 }
 
+int hda_dsp_set_power_state_ipc3(struct snd_sof_dev *sdev,
+				 const struct sof_dsp_power_state *target_state)
+{
+	/*
+	 * When the DSP is already in D0I3 and the target state is D0I3,
+	 * it could be the case that the DSP is in D0I3 during S0
+	 * and the system is suspending to S0Ix. Therefore,
+	 * hda_dsp_set_D0_state() must be called to disable trace DMA
+	 * by sending the PM_GATE IPC to the FW.
+	 */
+	if (target_state->substate == SOF_HDA_DSP_PM_D0I3 &&
+	    sdev->system_suspend_target == SOF_SUSPEND_S0IX)
+		return hda_dsp_set_power_state(sdev, target_state);
+
+	/*
+	 * For all other cases, return without doing anything if
+	 * the DSP is already in the target state.
+	 */
+	if (target_state->state == sdev->dsp_power_state.state &&
+	    target_state->substate == sdev->dsp_power_state.substate)
+		return 0;
+
+	return hda_dsp_set_power_state(sdev, target_state);
+}
+
+int hda_dsp_set_power_state_ipc4(struct snd_sof_dev *sdev,
+				 const struct sof_dsp_power_state *target_state)
+{
+	/* Return without doing anything if the DSP is already in the target state */
+	if (target_state->state == sdev->dsp_power_state.state &&
+	    target_state->substate == sdev->dsp_power_state.substate)
+		return 0;
+
+	return hda_dsp_set_power_state(sdev, target_state);
+}
+
 /*
  * Audio DSP states may transform as below:-
  *
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 0e0cfa81a8f2..c4befacde23e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -584,8 +584,10 @@ void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
 bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask);
 
-int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
-			    const struct sof_dsp_power_state *target_state);
+int hda_dsp_set_power_state_ipc3(struct snd_sof_dev *sdev,
+				 const struct sof_dsp_power_state *target_state);
+int hda_dsp_set_power_state_ipc4(struct snd_sof_dev *sdev,
+				 const struct sof_dsp_power_state *target_state);
 
 int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state);
 int hda_dsp_resume(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 435941a1692f..0f249efc6a5a 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -116,6 +116,8 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_icl_ops.ipc_dump	= cnl_ipc_dump;
+
+		sof_icl_ops.set_power_state = hda_dsp_set_power_state_ipc3;
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
@@ -141,6 +143,8 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_icl_ops.ipc_dump	= cnl_ipc4_dump;
+
+		sof_icl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
 	}
 
 	/* debug */
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 9f969e07fc27..46caf3ccde66 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -668,6 +668,8 @@ int sof_mtl_ops_init(struct snd_sof_dev *sdev)
 	/* set DAI ops */
 	hda_set_dai_drv_ops(sdev, &sof_mtl_ops);
 
+	sof_mtl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
+
 	return 0;
 };
 EXPORT_SYMBOL_NS(sof_mtl_ops_init, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 58ac3a46e6a7..2713b7dc7931 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -71,6 +71,8 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_tgl_ops.ipc_dump	= cnl_ipc_dump;
+
+		sof_tgl_ops.set_power_state = hda_dsp_set_power_state_ipc3;
 	}
 
 	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
@@ -96,6 +98,8 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_tgl_ops.ipc_dump	= cnl_ipc4_dump;
+
+		sof_tgl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
 	}
 
 	/* set DAI driver ops */
-- 
2.40.0


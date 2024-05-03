Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0078BAE1B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D62E8E80;
	Fri,  3 May 2024 15:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D62E8E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714744431;
	bh=+wN3yZnCk76F76EBrwtUp3XcashJbQ3AWpKItiCqS/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JvV7AuH2rxRyhXMh4O9FVa1YryzfDcij4SG0xAYZievE8PWvjpy/rY3p8QL0Omcf4
	 ksZ6cCpoZk2uN+i01Jiw63tjTLsDE/CJtb3tLcPfnEjCytzd6gpAT2k+xlL5ElDbRG
	 bBOb4VRZ9cdsElFn6HYtoTHtu73VDtOAYybEj3O8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9882BF805EA; Fri,  3 May 2024 15:52:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C02B7F805ED;
	Fri,  3 May 2024 15:52:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 759D2F80579; Fri,  3 May 2024 15:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DFBAF80266
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DFBAF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SLzrl0PM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744358; x=1746280358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+wN3yZnCk76F76EBrwtUp3XcashJbQ3AWpKItiCqS/o=;
  b=SLzrl0PMnv1v4eQRt/Dm2VdTbqTN9Y0k5ASSeZv59eeOYS6ZVKbQ+R8w
   AU6FZGyRTvgAoYvWkHqMTUBcurb5LuTo/PjxbQE6azplCu2f179vfpKy9
   4yT0KkRx5Sp0/bl6v501Vk4kS5xeOEb2DVcTaKlCABn176216shyqjYCU
   mAgAY3U42htqDWcljDJVFGYJjY6xUTvhEivyXQa1laoS3aeoTdgKYZvlJ
   0h36eQLiUFL2d23JkQH/UzOkiqpcK9FVjl8ZP0ZIucu+hvvRTFKNd1C7g
   vWza+lprDZe5QygvKF0ajEKheG6/LmV2icKlshbyW9yS/JW6NSEgmma6v
   Q==;
X-CSE-ConnectionGUID: 7fXC+oL6RBmEif/BTzwpzg==
X-CSE-MsgGUID: RhLya3KLQfiklpVbL8rh8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029413"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="28029413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:35 -0700
X-CSE-ConnectionGUID: bPUE7Pn3RLyNsJe375LLFg==
X-CSE-MsgGUID: j0OQ6yVdQ96RLx7SDsIlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27548725"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 2/7] ASoC: SOF: Intel: regroup all SoundWire/Intel functions
 in hda.c
Date: Fri,  3 May 2024 08:52:16 -0500
Message-Id: <20240503135221.229202-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C73PUFYG6NJXFIJHKDGZJJV2SEAXV3WG
X-Message-ID-Hash: C73PUFYG6NJXFIJHKDGZJJV2SEAXV3WG
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C73PUFYG6NJXFIJHKDGZJJV2SEAXV3WG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To avoid circular dependencies between SOF/Intel and SoundWire/Intel,
we need to split the top-level hda.c from the rest of the code. This
patch first regroups all SoundWire related code in hda.c.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 40 --------------------------------
 sound/soc/sof/intel/hda.c        | 39 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index dc88b7ea599e..d0474522ea76 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -15,7 +15,6 @@
  * Hardware interface for HDA DSP code loader
  */
 
-#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
@@ -651,45 +650,6 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 	return ret;
 }
 
-/* pre fw run operations */
-int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev)
-{
-	/* disable clock gating and power gating */
-	return hda_dsp_ctrl_clock_power_gating(sdev, false);
-}
-
-/* post fw run operations */
-int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
-{
-	int ret;
-
-	if (sdev->first_boot) {
-		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
-
-		ret = hda_sdw_startup(sdev);
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: could not startup SoundWire links\n");
-			return ret;
-		}
-
-		/* Check if IMR boot is usable */
-		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT) &&
-		    (sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT ||
-		     sdev->pdata->ipc_type == SOF_IPC_TYPE_4)) {
-			hdev->imrboot_supported = true;
-			debugfs_create_bool("skip_imr_boot",
-					    0644, sdev->debugfs_root,
-					    &hdev->skip_imr_boot);
-		}
-	}
-
-	hda_sdw_int_enable(sdev, true);
-
-	/* re-enable clock gating and power gating */
-	return hda_dsp_ctrl_clock_power_gating(sdev, true);
-}
-
 int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
 					 const struct sof_ext_man_elem_header *hdr)
 {
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index d4f039ed4ad4..e86236d35fe8 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -545,6 +545,45 @@ static inline bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 
 #endif /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 
+/* pre fw run operations */
+int hda_dsp_pre_fw_run(struct snd_sof_dev *sdev)
+{
+	/* disable clock gating and power gating */
+	return hda_dsp_ctrl_clock_power_gating(sdev, false);
+}
+
+/* post fw run operations */
+int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	if (sdev->first_boot) {
+		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+
+		ret = hda_sdw_startup(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"error: could not startup SoundWire links\n");
+			return ret;
+		}
+
+		/* Check if IMR boot is usable */
+		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT) &&
+		    (sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT ||
+		     sdev->pdata->ipc_type == SOF_IPC_TYPE_4)) {
+			hdev->imrboot_supported = true;
+			debugfs_create_bool("skip_imr_boot",
+					    0644, sdev->debugfs_root,
+					    &hdev->skip_imr_boot);
+		}
+	}
+
+	hda_sdw_int_enable(sdev, true);
+
+	/* re-enable clock gating and power gating */
+	return hda_dsp_ctrl_clock_power_gating(sdev, true);
+}
+
 /*
  * Debug
  */
-- 
2.40.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB38050A9DF
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57F6716DB;
	Thu, 21 Apr 2022 22:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57F6716DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650572506;
	bh=pzDQg58v854+HCfGJxwB3c+JsLXFM5KjF5Q8LCnAAps=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PVa9hOy5p96TdgUwmkqEcEJg7GSPIBzVc+sObBThyprJ/ySbrzjnHBuOhJPQT97uo
	 dcOmXL0IKFx7bbVRPpoalSHw8/GKJ+0iJE/yZ6MUDulKrQ6H2YT490EPWS/RfGJz2C
	 1vI3RIG6MMURAlr52E2xJw1EEvq3wKQMPzq3kBRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDEBCF804F1;
	Thu, 21 Apr 2022 22:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFFDFF804DA; Thu, 21 Apr 2022 22:20:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65D79F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D79F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MVUHIwSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650572451; x=1682108451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pzDQg58v854+HCfGJxwB3c+JsLXFM5KjF5Q8LCnAAps=;
 b=MVUHIwSRL2bbzIOWla4YLtjII1cE4d2MT+IluLysC48yd2Ok6467TpeN
 YlYvPW3QXjRqtt2ZHynOn7I/kbeHpR496n3I5QBf/nC+w8gXeg2o/Oral
 HI09Qmc5nfaoXDRDgUjdVs8sJit8N1HVBnz4ip0UNebncp5DeODB2hcf9
 ghlgvy6ENvSuUonKCtGBhKnqxYEHHC01TRi70Jpnjx7qG+xdPw8E7bPnn
 N6W1Xx1g1UkX4mMZ3i0NnvEEioQip5E0J/BdqakWkalYXwTyyZ4ggbMRq
 bLngabEwXS4cMH8JuMA7A/1MHE++lwiRHW1sM2RFFhtCBQUXh7CjnmPQ+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="262070441"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="262070441"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:20:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577448526"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:20:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda: Revisit IMR boot sequence
Date: Thu, 21 Apr 2022 15:20:31 -0500
Message-Id: <20220421202031.1548362-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The sequence for IMR boot is essentially the same as normal boot with the
difference that instead of DMA from host the firmware is loaded from IMR.

Re-structure the code to use the existing sequence and also add fallback
handling in case the IMR boot fails.

Introduce a new flag to make the IMR boot support check simpler.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 76 ++++++++++++++++----------------
 sound/soc/sof/intel/hda.h        |  6 ++-
 sound/soc/sof/intel/icl.c        |  7 +++
 3 files changed, 50 insertions(+), 39 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 78ceb5a2cbc0c..7d4436f079c65 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -99,14 +99,14 @@ struct hdac_ext_stream *hda_cl_stream_prepare(struct snd_sof_dev *sdev, unsigned
  * status on core 1, so power up core 1 also momentarily, keep it in
  * reset/stall and then turn it off
  */
-static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
+static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
-	unsigned int status;
+	unsigned int status, target_status;
+	u32 flags, ipc_hdr, j;
 	unsigned long mask;
 	char *dump_msg;
-	u32 flags, j;
 	int ret;
 
 	/* step 1: power up corex */
@@ -119,10 +119,12 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 
 	hda_ssp_set_cbp_cfp(sdev);
 
-	/* step 2: purge FW request */
-	snd_sof_dsp_write(sdev, HDA_DSP_BAR, chip->ipc_req,
-			  chip->ipc_req_mask | (HDA_DSP_IPC_PURGE_FW |
-			  ((stream_tag - 1) << 9)));
+	/* step 2: Send ROM_CONTROL command (stream_tag is ignored for IMR boot) */
+	ipc_hdr = chip->ipc_req_mask | HDA_DSP_ROM_IPC_CONTROL;
+	if (!imr_boot)
+		ipc_hdr |= HDA_DSP_ROM_IPC_PURGE_FW | ((stream_tag - 1) << 9);
+
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR, chip->ipc_req, ipc_hdr);
 
 	/* step 3: unset core 0 reset state & unstall/run core 0 */
 	ret = hda_dsp_core_run(sdev, BIT(0));
@@ -169,11 +171,20 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 	/* step 6: enable IPC interrupts */
 	hda_dsp_ipc_int_enable(sdev);
 
-	/* step 7: wait for ROM init */
+	/*
+	 * step 7:
+	 * - Cold/Full boot: wait for ROM init to proceed to download the firmware
+	 * - IMR boot: wait for ROM firmware entered (firmware booted up from IMR)
+	 */
+	if (imr_boot)
+		target_status = HDA_DSP_ROM_FW_ENTERED;
+	else
+		target_status = HDA_DSP_ROM_INIT;
+
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
 					chip->rom_status_reg, status,
 					((status & HDA_DSP_ROM_STS_MASK)
-						== HDA_DSP_ROM_INIT),
+						== target_status),
 					HDA_DSP_REG_POLL_INTERVAL_US,
 					chip->rom_init_timeout *
 					USEC_PER_MSEC);
@@ -358,32 +369,11 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 
 static int hda_dsp_boot_imr(struct snd_sof_dev *sdev)
 {
-	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
-	const struct sof_intel_dsp_desc *chip = hda->desc;
-	unsigned long mask;
-	u32 j;
 	int ret;
 
-	/* power up & unstall/run the cores to run the firmware */
-	ret = hda_dsp_enable_core(sdev, chip->init_core_mask);
-	if (ret < 0) {
-		dev_err(sdev->dev, "dsp core start failed %d\n", ret);
-		return -EIO;
-	}
-
-	/* set enabled cores mask and increment ref count for cores in init_core_mask */
-	sdev->enabled_cores_mask |= chip->init_core_mask;
-	mask = sdev->enabled_cores_mask;
-	for_each_set_bit(j, &mask, SOF_MAX_DSP_NUM_CORES)
-		sdev->dsp_core_ref_count[j]++;
-
-	hda_ssp_set_cbp_cfp(sdev);
-
-	/* enable IPC interrupts */
-	hda_dsp_ipc_int_enable(sdev);
-
-	/* process wakes */
-	hda_sdw_process_wakeen(sdev);
+	ret = cl_dsp_init(sdev, 0, true);
+	if (ret >= 0)
+		hda_sdw_process_wakeen(sdev);
 
 	return ret;
 }
@@ -399,11 +389,14 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	struct snd_dma_buffer dmab;
 	int ret, ret1, i;
 
-	if ((sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT) &&
-	    !(sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT)) &&
-	    !sdev->first_boot) {
+	if (hda->imrboot_supported && !sdev->first_boot) {
 		dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
-		return hda_dsp_boot_imr(sdev);
+		hda->boot_iteration = 0;
+		ret = hda_dsp_boot_imr(sdev);
+		if (ret >= 0)
+			return ret;
+
+		dev_warn(sdev->dev, "IMR restore failed, trying to cold boot\n");
 	}
 
 	chip_info = desc->chip_info;
@@ -437,7 +430,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 			"Attempting iteration %d of Core En/ROM load...\n", i);
 
 		hda->boot_iteration = i + 1;
-		ret = cl_dsp_init(sdev, hext_stream->hstream.stream_tag);
+		ret = cl_dsp_init(sdev, hext_stream->hstream.stream_tag, false);
 
 		/* don't retry anymore if successful */
 		if (!ret)
@@ -525,12 +518,19 @@ int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	int ret;
 
 	if (sdev->first_boot) {
+		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+
 		ret = hda_sdw_startup(sdev);
 		if (ret < 0) {
 			dev_err(sdev->dev,
 				"error: could not startup SoundWire links\n");
 			return ret;
 		}
+
+		/* Check if IMR boot is usable */
+		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT) &&
+		    sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT)
+			hdev->imrboot_supported = true;
 	}
 
 	hda_sdw_int_enable(sdev, true);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 7827ea4fdacb3..6e05c77594809 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -210,7 +210,9 @@
 #define HDA_DSP_ROM_USER_EXCEPTION		0xBEEF0000
 #define HDA_DSP_ROM_UNEXPECTED_RESET		0xDECAF000
 #define HDA_DSP_ROM_NULL_FW_ENTRY		0x4c4c4e55
-#define HDA_DSP_IPC_PURGE_FW			0x01004000
+
+#define HDA_DSP_ROM_IPC_CONTROL			0x01000000
+#define HDA_DSP_ROM_IPC_PURGE_FW		0x00004000
 
 /* various timeout values */
 #define HDA_DSP_PU_TIMEOUT		50
@@ -416,6 +418,8 @@ enum sof_hda_D0_substate {
 
 /* represents DSP HDA controller frontend - i.e. host facing control */
 struct sof_intel_hda_dev {
+	bool imrboot_supported;
+
 	int boot_iteration;
 
 	struct hda_bus hbus;
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 8dd5626969344..f845064c3589a 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -56,11 +56,18 @@ static int icl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	int ret;
 
 	if (sdev->first_boot) {
+		struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
+
 		ret = hda_sdw_startup(sdev);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: could not startup SoundWire links\n");
 			return ret;
 		}
+
+		/* Check if IMR boot is usable */
+		if (!sof_debug_check_flag(SOF_DBG_IGNORE_D3_PERSISTENT) &&
+		    sdev->fw_ready.flags & SOF_IPC_INFO_D3_PERSISTENT)
+			hdev->imrboot_supported = true;
 	}
 
 	hda_sdw_int_enable(sdev, true);
-- 
2.30.2


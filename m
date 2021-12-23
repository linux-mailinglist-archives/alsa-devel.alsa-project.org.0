Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D341447E269
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:39:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81B2517E6;
	Thu, 23 Dec 2021 12:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81B2517E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259544;
	bh=+XolmdYY3GtWHRw2Xygi3HDFlIyKlBdrEVo5rYJDfvA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cwZoq5o2WIMfnk8rId5ebCQaKUbXCjUyJenAoUoNsT3B+vzyPYdgJtfiu3WOKo8rt
	 IqN+Y6ozvo90yhY1Ii9th3ok4sGxDBNk+NZ3rVDlndi3jxJNb6QCiaKMFg0imJZOay
	 DqFpbQLIu36WUb395U/bdSq+3r/JIVgAXHww+DZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89B6EF8051B;
	Thu, 23 Dec 2021 12:36:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1405CF80511; Thu, 23 Dec 2021 12:36:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB2DF80104
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB2DF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cxXwzpnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259387; x=1671795387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+XolmdYY3GtWHRw2Xygi3HDFlIyKlBdrEVo5rYJDfvA=;
 b=cxXwzpnAGBomU8q2j3bZCqrPiu1fikX2ELhbenCs2oTZE69tbBADBwDv
 otuqWcEoF0bYnKR0fLDH71jgOYoK59OexSLWolABGPc58jjOtqlmqSFtu
 d0AGgAWpaCqdnsKr9CEHQqPa920qNoIaUw8/YS0qXMHHx3YS02ogv1U1d
 lNEnMmD2SFXkT1U67szawWmVKVYmKtZN+74LaAFl+hQCw8J/3VtPVK4BZ
 G7HRRamxkxLoanWDYv8/kXVBh8QDpNY1QfmUHRXlNPvVzVz3JzdmIeTaG
 JG0e0ywF/r+91Csuf3bN71KaJMlSAFeTgXvTHhOM+Wd8C0UIz+vQwzbz+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180815"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180815"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065094"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:21 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 06/20] ASoC: SOF: Add a 'message' parameter to
 snd_sof_dsp_dbg_dump()
Date: Thu, 23 Dec 2021 13:36:14 +0200
Message-Id: <20211223113628.18582-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

When snd_sof_dsp_dbg_dump() is called we have an explanatory message to
give some hint on the reason why we have the dump on the caller level.

Pass this message to snd_sof_dsp_dbg_dump() and handle the print according
to the dump rules.

This way we can finally print information on the HDA boot iteration if all
dumps are enabled.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/debug.c            |  9 +++++++--
 sound/soc/sof/intel/hda-loader.c | 15 +++++++++------
 sound/soc/sof/loader.c           |  8 ++++----
 sound/soc/sof/ops.c              |  5 ++---
 sound/soc/sof/ops.h              |  2 +-
 5 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 9e4a128b5918..cf7d95c33afe 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -955,7 +955,7 @@ static void snd_sof_dbg_print_fw_state(struct snd_sof_dev *sdev)
 	dev_err(sdev->dev, "fw_state: UNKNOWN (%d)\n", sdev->fw_state);
 }
 
-void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags)
+void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, const char *msg, u32 flags)
 {
 	bool print_all = sof_debug_check_flag(SOF_DBG_PRINT_ALL_DUMPS);
 
@@ -964,11 +964,15 @@ void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags)
 
 	if (sof_ops(sdev)->dbg_dump && !sdev->dbg_dump_printed) {
 		dev_err(sdev->dev, "------------[ DSP dump start ]------------\n");
+		if (msg)
+			dev_err(sdev->dev, "%s\n", msg);
 		snd_sof_dbg_print_fw_state(sdev);
 		sof_ops(sdev)->dbg_dump(sdev, flags);
 		dev_err(sdev->dev, "------------[ DSP dump end ]------------\n");
 		if (!print_all)
 			sdev->dbg_dump_printed = true;
+	} else if (msg) {
+		dev_err(sdev->dev, "%s\n", msg);
 	}
 }
 EXPORT_SYMBOL(snd_sof_dsp_dbg_dump);
@@ -997,7 +1001,8 @@ void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
 
 	/* dump vital information to the logs */
 	snd_sof_ipc_dump(sdev);
-	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
+	snd_sof_dsp_dbg_dump(sdev, "Firmware exception",
+			     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 	snd_sof_trace_notify_for_error(sdev);
 }
 EXPORT_SYMBOL(snd_sof_handle_fw_exception);
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 8ef16f1082e3..33306d2023a7 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -88,6 +88,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 	unsigned int status;
 	unsigned long mask;
+	char *dump_msg;
 	u32 flags, j;
 	int ret;
 	int i;
@@ -189,9 +190,12 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 		flags &= ~SOF_DBG_DUMP_OPTIONAL;
 
-	snd_sof_dsp_dbg_dump(sdev, flags);
+	dump_msg = kasprintf(GFP_KERNEL, "Boot iteration failed: %d/%d",
+			     hda->boot_iteration, HDA_FW_BOOT_ATTEMPTS);
+	snd_sof_dsp_dbg_dump(sdev, dump_msg, flags);
 	hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 
+	kfree(dump_msg);
 	return ret;
 }
 
@@ -421,12 +425,11 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 */
 	hda->boot_iteration = HDA_FW_BOOT_ATTEMPTS;
 	ret = cl_copy_fw(sdev, stream);
-	if (!ret) {
+	if (!ret)
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
-	} else {
-		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX);
-		dev_err(sdev->dev, "error: load fw failed ret: %d\n", ret);
-	}
+	else
+		snd_sof_dsp_dbg_dump(sdev, "Firmware download failed",
+				     SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX);
 
 cleanup:
 	/*
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index c04646647637..8977a65b5704 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -820,8 +820,8 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	/* boot the firmware on the DSP */
 	ret = snd_sof_dsp_run(sdev);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to start DSP\n");
-		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_MBOX | SOF_DBG_DUMP_PCI);
+		snd_sof_dsp_dbg_dump(sdev, "Failed to start DSP",
+				     SOF_DBG_DUMP_MBOX | SOF_DBG_DUMP_PCI);
 		return ret;
 	}
 
@@ -835,8 +835,8 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 				 sdev->fw_state > SOF_FW_BOOT_IN_PROGRESS,
 				 msecs_to_jiffies(sdev->boot_timeout));
 	if (ret == 0) {
-		dev_err(sdev->dev, "error: firmware boot failure\n");
-		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX |
+		snd_sof_dsp_dbg_dump(sdev, "Firmware boot failure due to timeout",
+				     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX |
 				     SOF_DBG_DUMP_TEXT | SOF_DBG_DUMP_PCI);
 		sof_set_fw_state(sdev, SOF_FW_BOOT_FAILED);
 		return -EIO;
diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index 9abf7a8e55e0..edfd080a3e4f 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -171,12 +171,11 @@ void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset, bool non_recoverabl
 	 * if all dumps should be printed
 	 */
 	if (non_recoverable || sof_debug_check_flag(SOF_DBG_PRINT_ALL_DUMPS)) {
-		dev_err(sdev->dev, "DSP panic!\n");
-
 		/* We want to see the DSP panic! */
 		sdev->dbg_dump_printed = false;
 
-		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
+		snd_sof_dsp_dbg_dump(sdev, "DSP panic!",
+				     SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 		snd_sof_trace_notify_for_error(sdev);
 	}
 }
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index bca7d35536e4..ffe7456e7713 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -274,7 +274,7 @@ snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
 }
 
 /* debug */
-void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags);
+void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, const char *msg, u32 flags);
 
 static inline int snd_sof_debugfs_add_region_item(struct snd_sof_dev *sdev,
 		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
-- 
2.34.1


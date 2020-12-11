Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA12D7397
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 11:13:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 245CE1738;
	Fri, 11 Dec 2020 11:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 245CE1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607681623;
	bh=Jsa689ZtQF0iYDCjhbyzgH/uf/tUTyPIELOogAfEPlI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J8Ee1kfbLx1JZI1EMwC2iKyFUDKoSEEaiblwxyF/XnBakuQ73WtEKKkJ95bNMEn2R
	 C8zg/LQVD8IzF5mEWnFydhS521QtQH5JS5fd9tDcBr5Lbj01oQ6YzJ7Hr/tJydGPOB
	 i6162rZY+iq6f06CP/lrohlf+uPlAd1IzwaqAEFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B723F804D8;
	Fri, 11 Dec 2020 11:10:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33318F804CA; Fri, 11 Dec 2020 11:10:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44975F8026A
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 11:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44975F8026A
IronPort-SDR: WcpdqzyiRAG3yCCCR795CXe7upB7KWzBnBUgU6UjGdXyArtavv0FehRQaSZNKUYtSx54+WjSzf
 d1VTcfzwyRvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174554262"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="174554262"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 02:10:32 -0800
IronPort-SDR: 9baPQKH5ewOvbL8mP3YZGfyU3EE3Nr/fEO3KAqKr9DcS+O7kLaOc9enWmnEDp/zvuwSWHzx6pw
 eni4J/8hyvQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="376451005"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga007.jf.intel.com with ESMTP; 11 Dec 2020 02:10:30 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: Intel: hda: fix the condition passed to
 sof_dev_dbg_or_err
Date: Fri, 11 Dec 2020 12:07:43 +0200
Message-Id: <20201211100743.3188821-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211100743.3188821-1-kai.vehmanen@linux.intel.com>
References: <20201211100743.3188821-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

The condition boot_iteration == HDA_FW_BOOT_ATTEMPTS to determine
the log level for the DSP status dump would only work in the case of DSP
init failure after maximum number of attempts to initialize the DSP. If
DSP init succeeds in less than HDA_FW_BOOT_ATTEMPTS attempts and FW
loading fails, the ROM status dump would end up getting logged as debug
instead of an error.

So, add a new flag, SOF_DBG_DUMP_LOG_ERROR, to explicitly specify
the log level for DSP status dump.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 12 ++++++++++--
 sound/soc/sof/intel/hda.c        | 10 ++++------
 sound/soc/sof/loader.c           |  2 +-
 sound/soc/sof/sof-priv.h         |  2 ++
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index c4dcbe500635..ed773696b495 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -88,6 +88,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
 	unsigned int status;
+	u32 flags;
 	int ret;
 	int i;
 
@@ -175,7 +176,13 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 			__func__);
 
 err:
-	hda_dsp_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX);
+	flags = SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX;
+
+	/* force error log level after max boot attempts */
+	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
+		flags |= SOF_DBG_DUMP_FORCE_ERR_LEVEL;
+
+	hda_dsp_dump(sdev, flags);
 	hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 
 	return ret;
@@ -411,7 +418,8 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	if (!ret) {
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
 	} else {
-		hda_dsp_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX);
+		hda_dsp_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX |
+			     SOF_DBG_DUMP_FORCE_ERR_LEVEL);
 		dev_err(sdev->dev, "error: load fw failed ret: %d\n", ret);
 	}
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index bb4128a72a42..509a9b256423 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -416,9 +416,8 @@ void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags)
 }
 
 /* dump the first 8 dwords representing the extended ROM status */
-static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev)
+static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev, u32 flags)
 {
-	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	char msg[128];
 	int len = 0;
 	u32 value;
@@ -429,14 +428,13 @@ static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev)
 		len += snprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
 	}
 
-	sof_dev_dbg_or_err(sdev->dev, hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS,
+	sof_dev_dbg_or_err(sdev->dev, flags & SOF_DBG_DUMP_FORCE_ERR_LEVEL,
 			   "extended rom status: %s", msg);
 
 }
 
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
-	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[HDA_DSP_STACK_DUMP_SIZE];
@@ -456,11 +454,11 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 		snd_sof_get_status(sdev, status, panic, &xoops, &panic_info,
 				   stack, HDA_DSP_STACK_DUMP_SIZE);
 	} else {
-		sof_dev_dbg_or_err(sdev->dev, hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS,
+		sof_dev_dbg_or_err(sdev->dev, flags & SOF_DBG_DUMP_FORCE_ERR_LEVEL,
 				   "status = 0x%8.8x panic = 0x%8.8x\n",
 				   status, panic);
 
-		hda_dsp_dump_ext_rom_status(sdev);
+		hda_dsp_dump_ext_rom_status(sdev, flags);
 		hda_dsp_get_status(sdev);
 	}
 }
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index df39f477239a..08a17abb63ff 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -857,7 +857,7 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	if (ret == 0) {
 		dev_err(sdev->dev, "error: firmware boot failure\n");
 		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX |
-			SOF_DBG_DUMP_TEXT | SOF_DBG_DUMP_PCI);
+			SOF_DBG_DUMP_TEXT | SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_FORCE_ERR_LEVEL);
 		sdev->fw_state = SOF_FW_BOOT_FAILED;
 		return -EIO;
 	}
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index ba317d3b8e53..68da8f797403 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -28,6 +28,8 @@
 #define SOF_DBG_DUMP_MBOX		BIT(1)
 #define SOF_DBG_DUMP_TEXT		BIT(2)
 #define SOF_DBG_DUMP_PCI		BIT(3)
+#define SOF_DBG_DUMP_FORCE_ERR_LEVEL	BIT(4) /* used to dump dsp status with error log level */
+
 
 /* global debug state set by SOF_DBG_ flags */
 extern int sof_core_debug;
-- 
2.29.2


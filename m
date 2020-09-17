Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A60A426D9CB
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 13:04:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 341391689;
	Thu, 17 Sep 2020 13:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 341391689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600340657;
	bh=sJY+wj2LS9JRrOTn6ggEmuq6taIbive3WRFDInSzZ4o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DUDcU/WRWyoA7vUt4uUJ8azLlDWfFGYXw6CNUZJVchkCVXX11C4fzKgHxYWQz4B74
	 bFoeP3DBV1LB/AaABWiTXil9xXxrF+ci6tphHFoVosQzjIPfrm2DZUY4whCoM2sCKO
	 8+sucIz8h7aZryBL+ZIc37zyAYoISZTJRsp373Wg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF450F80307;
	Thu, 17 Sep 2020 12:58:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BD45F802FB; Thu, 17 Sep 2020 12:58:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74E06F80276
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74E06F80276
IronPort-SDR: 3tEjWrDXMvSCQlxP8jO727rwWZRfUKg+6GoeGM+mXOKSbS3j4QVEJdW+O7hUa9l6nFzsqaHj0u
 0CMqO0sSrjJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="157075369"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="157075369"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:58:19 -0700
IronPort-SDR: gjXs2hrcOS5ymcTYSMcMSoFMKvYO4gXSg94FbwxFJ+nPiZyVi68q19RvWHW6Ky2r1/vjnkTNTH
 V9p1eEz6uGEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="320177369"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2020 03:58:18 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 8/8] ASoC: SOF: Intel: hda: reduce verbosity of boot error logs
Date: Thu, 17 Sep 2020 13:56:33 +0300
Message-Id: <20200917105633.2579047-9-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
References: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Previous commits reduced the verbosity of errors during boot
iterations, but there are still a couple remaining which generate
false positives. Errors should only be logged when after last attempt
to download firmware failed.

Duplicating logs and assigning them different levels based on the
iteration number isn't really elegant, use macro as suggested by
Guennadi.

Suggested-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 16 +++++++++-------
 sound/soc/sof/intel/hda.c        | 12 +++++++++---
 sound/soc/sof/intel/hda.h        |  2 ++
 sound/soc/sof/sof-priv.h         |  8 ++++++++
 4 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index dfbfc89ffe70..2707a16c6a4d 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -82,7 +82,7 @@ static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsig
  * status on core 1, so power up core 1 also momentarily, keep it in
  * reset/stall and then turn it off
  */
-static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
+static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
@@ -93,7 +93,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 	/* step 1: power up corex */
 	ret = hda_dsp_core_power_up(sdev, chip->host_managed_cores_mask);
 	if (ret < 0) {
-		if (iteration == HDA_FW_BOOT_ATTEMPTS)
+		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev, "error: dsp core 0/1 power up failed\n");
 		goto err;
 	}
@@ -116,7 +116,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 	/* step 3: unset core 0 reset state & unstall/run core 0 */
 	ret = hda_dsp_core_run(sdev, BIT(0));
 	if (ret < 0) {
-		if (iteration == HDA_FW_BOOT_ATTEMPTS)
+		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
 				"error: dsp core start failed %d\n", ret);
 		ret = -EIO;
@@ -132,7 +132,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 					    HDA_DSP_INIT_TIMEOUT_US);
 
 	if (ret < 0) {
-		if (iteration == HDA_FW_BOOT_ATTEMPTS)
+		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
 				"error: %s: timeout for HIPCIE done\n",
 				__func__);
@@ -148,7 +148,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 	/* step 5: power down corex */
 	ret = hda_dsp_core_power_down(sdev, chip->host_managed_cores_mask & ~(BIT(0)));
 	if (ret < 0) {
-		if (iteration == HDA_FW_BOOT_ATTEMPTS)
+		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
 				"error: dsp core x power down failed\n");
 		goto err;
@@ -168,7 +168,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, int iteration)
 	if (!ret)
 		return 0;
 
-	if (iteration == HDA_FW_BOOT_ATTEMPTS)
+	if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 		dev_err(sdev->dev,
 			"error: %s: timeout HDA_DSP_SRAM_REG_ROM_STATUS read\n",
 			__func__);
@@ -328,6 +328,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 
 int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct snd_sof_pdata *plat_data = sdev->pdata;
 	const struct sof_dev_desc *desc = plat_data->desc;
 	const struct sof_intel_dsp_desc *chip_info;
@@ -364,7 +365,8 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		dev_dbg(sdev->dev,
 			"Attempting iteration %d of Core En/ROM load...\n", i);
 
-		ret = cl_dsp_init(sdev, stream->hstream.stream_tag, i + 1);
+		hda->boot_iteration = i + 1;
+		ret = cl_dsp_init(sdev, stream->hstream.stream_tag);
 
 		/* don't retry anymore if successful */
 		if (!ret)
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 882527119c70..bb4128a72a42 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -418,6 +418,7 @@ void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags)
 /* dump the first 8 dwords representing the extended ROM status */
 static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	char msg[128];
 	int len = 0;
 	u32 value;
@@ -428,11 +429,14 @@ static void hda_dsp_dump_ext_rom_status(struct snd_sof_dev *sdev)
 		len += snprintf(msg + len, sizeof(msg) - len, " 0x%x", value);
 	}
 
-	dev_err(sdev->dev, "error: extended rom status:%s", msg);
+	sof_dev_dbg_or_err(sdev->dev, hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS,
+			   "extended rom status: %s", msg);
+
 }
 
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct sof_ipc_dsp_oops_xtensa xoops;
 	struct sof_ipc_panic_info panic_info;
 	u32 stack[HDA_DSP_STACK_DUMP_SIZE];
@@ -452,8 +456,10 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 		snd_sof_get_status(sdev, status, panic, &xoops, &panic_info,
 				   stack, HDA_DSP_STACK_DUMP_SIZE);
 	} else {
-		dev_err(sdev->dev, "error: status = 0x%8.8x panic = 0x%8.8x\n",
-			status, panic);
+		sof_dev_dbg_or_err(sdev->dev, hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS,
+				   "status = 0x%8.8x panic = 0x%8.8x\n",
+				   status, panic);
+
 		hda_dsp_dump_ext_rom_status(sdev);
 		hda_dsp_get_status(sdev);
 	}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index f0f8f95c082b..badb308aed81 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -274,6 +274,7 @@
 #define BXT_D0I3_DELAY 5000
 
 #define FW_CL_STREAM_NUMBER		0x1
+#define HDA_FW_BOOT_ATTEMPTS	3
 
 /* ADSPCS - Audio DSP Control & Status */
 
@@ -416,6 +417,7 @@ enum sof_hda_D0_substate {
 
 /* represents DSP HDA controller frontend - i.e. host facing control */
 struct sof_intel_hda_dev {
+	int boot_iteration;
 
 	struct hda_bus hbus;
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1c51d99f0459..0aed2a7ab858 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -578,4 +578,12 @@ int intel_pcm_close(struct snd_sof_dev *sdev,
 
 int sof_machine_check(struct snd_sof_dev *sdev);
 
+#define sof_dev_dbg_or_err(dev, is_err, fmt, ...)			\
+	do {								\
+		if (is_err)						\
+			dev_err(dev, "error: " fmt, __VA_ARGS__);	\
+		else							\
+			dev_dbg(dev, fmt, __VA_ARGS__);			\
+	} while (0)
+
 #endif
-- 
2.27.0


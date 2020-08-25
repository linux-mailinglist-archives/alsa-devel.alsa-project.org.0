Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6D1252479
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 01:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01CCE16C3;
	Wed, 26 Aug 2020 01:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01CCE16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598399612;
	bh=ZsWyUcX4mYjYKF7gKvuQAMF1qLLqFI9qBhSjI9Mtrls=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VCeYD/ipUU0NT6S5nxPUPLU7IuJq6QIehmW6zAWtOXxkP0+eP7bZlnrNYnSXfHf3/
	 5578eVkUzL3bOZL+aZ9T75RDoiLKJtui2a5gTm3yUjFP4mHFi6PJ7FZ2G3Rt49TcFN
	 ErrhDfgsXhVo230AO3lYlVquthjKnMUU48b5OAHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 890CFF80269;
	Wed, 26 Aug 2020 01:51:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0133CF8028A; Wed, 26 Aug 2020 01:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C06EF80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C06EF80143
IronPort-SDR: JvPA7bCIKfHKdh373HxuOooZw1SbVS38SLwV18Evpcr3owDBn2/NA2zXJC3XIEr5AsTTB02Z6j
 Iwry7hC0pbNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157253457"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="157253457"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:56 -0700
IronPort-SDR: Hera2q80A+6MJmpMFZaUBAZ5OEadrhDOXNyMT4Tj+LYWKJFq+SEOi/xEIWPMHUFwXR9qEnqngk
 ZvtpjFJWrBcA==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="443818983"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:55 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: SOF: Intel: hda: report error only for the last ROM
 init iteration
Date: Tue, 25 Aug 2020 16:50:34 -0700
Message-Id: <20200825235040.1586478-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
References: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

The FW boot sequence includes multiple attempts for ROM init.
When it does take more than one attempt, we should not log the
errors encountered during the failed attempts and only log them
during the final iteration.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 42 +++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 441d05cda604..9cb219b87b3e 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -79,7 +79,7 @@ static int cl_stream_prepare(struct snd_sof_dev *sdev, unsigned int format,
  * reset/stall and then turn it off
  */
 static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
-		       u32 fwsize, int stream_tag)
+		       u32 fwsize, int stream_tag, int iteration)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
@@ -90,7 +90,8 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 	/* step 1: power up corex */
 	ret = hda_dsp_core_power_up(sdev, chip->cores_mask);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: dsp core 0/1 power up failed\n");
+		if (iteration == HDA_FW_BOOT_ATTEMPTS)
+			dev_err(sdev->dev, "error: dsp core 0/1 power up failed\n");
 		goto err;
 	}
 
@@ -112,7 +113,9 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 	/* step 3: unset core 0 reset state & unstall/run core 0 */
 	ret = hda_dsp_core_run(sdev, HDA_DSP_CORE_MASK(0));
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: dsp core start failed %d\n", ret);
+		if (iteration == HDA_FW_BOOT_ATTEMPTS)
+			dev_err(sdev->dev,
+				"error: dsp core start failed %d\n", ret);
 		ret = -EIO;
 		goto err;
 	}
@@ -126,8 +129,10 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 					    HDA_DSP_INIT_TIMEOUT_US);
 
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: %s: timeout for HIPCIE done\n",
-			__func__);
+		if (iteration == HDA_FW_BOOT_ATTEMPTS)
+			dev_err(sdev->dev,
+				"error: %s: timeout for HIPCIE done\n",
+				__func__);
 		goto err;
 	}
 
@@ -141,7 +146,9 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 	ret = hda_dsp_core_power_down(sdev,
 				  chip->cores_mask & ~(HDA_DSP_CORE_MASK(0)));
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: dsp core x power down failed\n");
+		if (iteration == HDA_FW_BOOT_ATTEMPTS)
+			dev_err(sdev->dev,
+				"error: dsp core x power down failed\n");
 		goto err;
 	}
 
@@ -159,9 +166,10 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, const void *fwdata,
 	if (!ret)
 		return 0;
 
-	dev_err(sdev->dev,
-		"error: %s: timeout HDA_DSP_SRAM_REG_ROM_STATUS read\n",
-		__func__);
+	if (iteration == HDA_FW_BOOT_ATTEMPTS)
+		dev_err(sdev->dev,
+			"error: %s: timeout HDA_DSP_SRAM_REG_ROM_STATUS read\n",
+			__func__);
 
 err:
 	hda_dsp_dump(sdev, SOF_DBG_REGS | SOF_DBG_PCI | SOF_DBG_MBOX);
@@ -329,25 +337,25 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 
 	/* try ROM init a few times before giving up */
 	for (i = 0; i < HDA_FW_BOOT_ATTEMPTS; i++) {
+		dev_dbg(sdev->dev,
+			"Attempting iteration %d of Core En/ROM load...\n", i);
+
 		ret = cl_dsp_init(sdev, stripped_firmware.data,
-				  stripped_firmware.size, tag);
+				  stripped_firmware.size, tag, i + 1);
 
 		/* don't retry anymore if successful */
 		if (!ret)
 			break;
+	}
 
-		dev_dbg(sdev->dev, "iteration %d of Core En/ROM load failed: %d\n",
+	if (i == HDA_FW_BOOT_ATTEMPTS) {
+		dev_err(sdev->dev, "error: dsp init failed after %d attempts with err: %d\n",
 			i, ret);
-		dev_dbg(sdev->dev, "Error code=0x%x: FW status=0x%x\n",
+		dev_err(sdev->dev, "ROM error=0x%x: FW status=0x%x\n",
 			snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 					 HDA_DSP_SRAM_REG_ROM_ERROR),
 			snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 					 HDA_DSP_SRAM_REG_ROM_STATUS));
-	}
-
-	if (i == HDA_FW_BOOT_ATTEMPTS) {
-		dev_err(sdev->dev, "error: dsp init failed after %d attempts with err: %d\n",
-			i, ret);
 		goto cleanup;
 	}
 
-- 
2.25.1


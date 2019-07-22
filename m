Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FF7022A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:22:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4FD17F3;
	Mon, 22 Jul 2019 16:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4FD17F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563805320;
	bh=GX0Yi+Zw1SNf0xgBfbZ8ZrTAAJDwBKK+WJeRZp14Tuk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DD1YrG1B/ZLU1TBnA0qfzwM4Pcqx1l05C+GzYm+5xd8Zo0w5Ye5QhoV7Y/ulgBFM+
	 Uyp1TSl3Kf7uCZJ5xdK+5+NiR1h7m08NIOgR2GnFTKIa2/snAN4AFa5ycHpZRhJ3il
	 44VkpXHNFM2Uwi1PdvS7Z/K9GQAJZinjYdDGMObM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1DFFF805F8;
	Mon, 22 Jul 2019 16:14:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8642F804FD; Mon, 22 Jul 2019 16:14:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D21D0F8045F
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D21D0F8045F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733282"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:50 -0500
Message-Id: <20190722141402.7194-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 09/21] ASoC: SOF: remove unused state variable
	in suspend function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Fred Oh <fred.oh@linux.intel.com>

Remove unused and no plan to use variable from suspend function.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 10 +++++-----
 sound/soc/sof/intel/hda.h     |  4 ++--
 sound/soc/sof/ops.h           |  9 ++++-----
 sound/soc/sof/pm.c            |  4 ++--
 sound/soc/sof/sof-priv.h      |  5 ++---
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 91de4785b6a3..4315896b3f07 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -282,7 +282,7 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 			HDA_DSP_REG_HIPCCTL_BUSY | HDA_DSP_REG_HIPCCTL_DONE, 0);
 }
 
-static int hda_suspend(struct snd_sof_dev *sdev, int state)
+static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	const struct sof_intel_dsp_desc *chip = hda->desc;
@@ -431,19 +431,19 @@ int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state)
+int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 {
 	/* stop hda controller and power dsp off */
-	return hda_suspend(sdev, state);
+	return hda_suspend(sdev, true);
 }
 
-int hda_dsp_suspend(struct snd_sof_dev *sdev, int state)
+int hda_dsp_suspend(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int ret;
 
 	/* stop hda controller and power dsp off */
-	ret = hda_suspend(sdev, state);
+	ret = hda_suspend(sdev, false);
 	if (ret < 0) {
 		dev_err(bus->dev, "error: suspending dsp\n");
 		return ret;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index d9c17146200b..84d5fd021ccb 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -453,9 +453,9 @@ int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
 
-int hda_dsp_suspend(struct snd_sof_dev *sdev, int state);
+int hda_dsp_suspend(struct snd_sof_dev *sdev);
 int hda_dsp_resume(struct snd_sof_dev *sdev);
-int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state);
+int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_idle(struct snd_sof_dev *sdev);
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index ee87053953ff..3aa1576b19bd 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -128,10 +128,10 @@ static inline int snd_sof_dsp_resume(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static inline int snd_sof_dsp_suspend(struct snd_sof_dev *sdev, int state)
+static inline int snd_sof_dsp_suspend(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->suspend)
-		return sof_ops(sdev)->suspend(sdev, state);
+		return sof_ops(sdev)->suspend(sdev);
 
 	return 0;
 }
@@ -144,11 +144,10 @@ static inline int snd_sof_dsp_runtime_resume(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static inline int snd_sof_dsp_runtime_suspend(struct snd_sof_dev *sdev,
-					      int state)
+static inline int snd_sof_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->runtime_suspend)
-		return sof_ops(sdev)->runtime_suspend(sdev, state);
+		return sof_ops(sdev)->runtime_suspend(sdev);
 
 	return 0;
 }
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 48c6d78d72e2..e23beaeefe00 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -377,9 +377,9 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 	/* power down all DSP cores */
 	if (runtime_suspend)
-		ret = snd_sof_dsp_runtime_suspend(sdev, 0);
+		ret = snd_sof_dsp_runtime_suspend(sdev);
 	else
-		ret = snd_sof_dsp_suspend(sdev, 0);
+		ret = snd_sof_dsp_suspend(sdev);
 	if (ret < 0)
 		dev_err(sdev->dev,
 			"error: failed to power down DSP during suspend %d\n",
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index a6ec9115a9fb..b8c9274ccf42 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -171,10 +171,9 @@ struct snd_sof_dsp_ops {
 	int (*post_fw_run)(struct snd_sof_dev *sof_dev); /* optional */
 
 	/* DSP PM */
-	int (*suspend)(struct snd_sof_dev *sof_dev, int state); /* optional */
+	int (*suspend)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*resume)(struct snd_sof_dev *sof_dev); /* optional */
-	int (*runtime_suspend)(struct snd_sof_dev *sof_dev,
-			       int state); /* optional */
+	int (*runtime_suspend)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*runtime_resume)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*runtime_idle)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*set_hw_params_upon_resume)(struct snd_sof_dev *sdev); /* optional */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

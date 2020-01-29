Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE8114D2D5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 23:10:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6947B167D;
	Wed, 29 Jan 2020 23:09:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6947B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580335819;
	bh=TDT8JMSM4ynUd4JE7264/iR0EJOX1SNYmMbglStsXvs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCrborVuIpq9v+PmWBM4DI3ZQzydct6uQFaabuJj9eBAJCX57n6ospbBGTwuzehOq
	 Ugr/vAS2ZnsGoKehE4GV05mq5g9t431VlIgxcCKuFfotpUD68lmFnVpYC15GDUeV3T
	 XLCdMyq8Xh4PB78xC5ORurGy+gtgXAHSBejJTTbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A16B8F80276;
	Wed, 29 Jan 2020 23:08:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA50CF80273; Wed, 29 Jan 2020 23:07:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05B27F80218
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 23:07:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05B27F80218
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 14:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; d="scan'208";a="402122363"
Received: from kjhudson-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.70.93])
 by orsmga005.jf.intel.com with ESMTP; 29 Jan 2020 14:07:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 29 Jan 2020 16:07:19 -0600
Message-Id: <20200129220726.31792-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/9] ASoC: SOF: pm: Unify suspend/resume
	routines
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Unify the suspend/resume routines for both the D0I3/D3
DSP targets in sof_suspend()/sof_resume().

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pm.c | 91 ++++++++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 52 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index a0cde053b61a..5b186bceedb9 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -50,6 +50,7 @@ static void sof_cache_debugfs(struct snd_sof_dev *sdev)
 static int sof_resume(struct device *dev, bool runtime_resume)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	enum sof_d0_substate old_d0_substate = sdev->d0_substate;
 	int ret;
 
 	/* do nothing if dsp resume callbacks are not set */
@@ -60,6 +61,17 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	if (sdev->first_boot)
 		return 0;
 
+	/* resume from D0I3 */
+	if (!runtime_resume && old_d0_substate == SOF_DSP_D0I3) {
+		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I0);
+		if (ret < 0 && ret != -ENOTSUPP) {
+			dev_err(sdev->dev,
+				"error: failed to resume from D0I3 %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	/*
 	 * if the runtime_resume flag is set, call the runtime_resume routine
 	 * or else call the system resume routine
@@ -74,6 +86,10 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		return ret;
 	}
 
+	/* Nothing further to do if resuming from D0I3 */
+	if (!runtime_resume && old_d0_substate == SOF_DSP_D0I3)
+		return 0;
+
 	sdev->fw_state = SOF_FW_BOOT_PREPARE;
 
 	/* load the firmware */
@@ -140,10 +156,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		return 0;
 
 	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE)
-		goto power_down;
-
-	/* release trace */
-	snd_sof_release_trace(sdev);
+		goto suspend;
 
 	/* set restore_stream for all streams during system suspend */
 	if (!runtime_suspend) {
@@ -156,6 +169,22 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		}
 	}
 
+	if (snd_sof_dsp_d0i3_on_suspend(sdev)) {
+		/* suspend to D0i3 */
+		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I3);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to enter D0I3, %d\n",
+				ret);
+			return ret;
+		}
+
+		/* Skip to platform-specific suspend if DSP is entering D0I3 */
+		goto suspend;
+	}
+
+	/* release trace */
+	snd_sof_release_trace(sdev);
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
 	/* cache debugfs contents during runtime suspend */
 	if (runtime_suspend)
@@ -179,13 +208,13 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 			 ret);
 	}
 
-power_down:
+suspend:
 
 	/* return if the DSP was not probed successfully */
 	if (sdev->fw_state == SOF_FW_BOOT_NOT_STARTED)
 		return 0;
 
-	/* power down all DSP cores */
+	/* platform-specific suspend */
 	if (runtime_suspend)
 		ret = snd_sof_dsp_runtime_suspend(sdev);
 	else
@@ -195,6 +224,10 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 			"error: failed to power down DSP during suspend %d\n",
 			ret);
 
+	/* Do not reset FW state if DSP is in D0I3 */
+	if (sdev->d0_substate == SOF_DSP_D0I3)
+		return ret;
+
 	/* reset FW state */
 	sdev->fw_state = SOF_FW_BOOT_NOT_STARTED;
 
@@ -275,58 +308,12 @@ EXPORT_SYMBOL(snd_sof_set_d0_substate);
 
 int snd_sof_resume(struct device *dev)
 {
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	int ret;
-
-	if (snd_sof_dsp_d0i3_on_suspend(sdev)) {
-		/* resume from D0I3 */
-		dev_dbg(sdev->dev, "DSP will exit from D0i3...\n");
-		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I0);
-		if (ret == -ENOTSUPP) {
-			/* fallback to resume from D3 */
-			dev_dbg(sdev->dev, "D0i3 not supported, fall back to resume from D3...\n");
-			goto d3_resume;
-		} else if (ret < 0) {
-			dev_err(sdev->dev, "error: failed to exit from D0I3 %d\n",
-				ret);
-			return ret;
-		}
-
-		/* platform-specific resume from D0i3 */
-		return snd_sof_dsp_resume(sdev);
-	}
-
-d3_resume:
-	/* resume from D3 */
 	return sof_resume(dev, false);
 }
 EXPORT_SYMBOL(snd_sof_resume);
 
 int snd_sof_suspend(struct device *dev)
 {
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	int ret;
-
-	if (snd_sof_dsp_d0i3_on_suspend(sdev)) {
-		/* suspend to D0i3 */
-		dev_dbg(sdev->dev, "DSP is trying to enter D0i3...\n");
-		ret = snd_sof_set_d0_substate(sdev, SOF_DSP_D0I3);
-		if (ret == -ENOTSUPP) {
-			/* fallback to D3 suspend */
-			dev_dbg(sdev->dev, "D0i3 not supported, fall back to D3...\n");
-			goto d3_suspend;
-		} else if (ret < 0) {
-			dev_err(sdev->dev, "error: failed to enter D0I3, %d\n",
-				ret);
-			return ret;
-		}
-
-		/* platform-specific suspend to D0i3 */
-		return snd_sof_dsp_suspend(sdev);
-	}
-
-d3_suspend:
-	/* suspend to D3 */
 	return sof_suspend(dev, false);
 }
 EXPORT_SYMBOL(snd_sof_suspend);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

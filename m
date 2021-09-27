Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326A84193DF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 14:10:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8B5B16BB;
	Mon, 27 Sep 2021 14:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8B5B16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632744629;
	bh=z6j/JAKde6kLhJVL/ntG4qZ7ONtDJA06S5nthDCMCwc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qwTNHB5Kit8D9c3zV39aIc1yZcIWlifxAG8QRYomwI9/orC5ia+oH1+wSa6gqW+6V
	 vmkP2K5l8nGaCmeAGk8j6aU59d3cLUDMdeeBdYGqVRvW6mZsLyX8RQ/QbvOYUKsIrq
	 ybKbuhWhKZojxGQwAD/9X6d27hzrzpaWoinBLB+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F6BF80539;
	Mon, 27 Sep 2021 14:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F922F80529; Mon, 27 Sep 2021 14:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2C50F8050F
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 14:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2C50F8050F
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="221260532"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="221260532"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553164487"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.251.220.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH v3 12/12] ASoC: SOF: topology: Add kernel parameter for
 topology verification
Date: Mon, 27 Sep 2021 15:05:17 +0300
Message-Id: <20210927120517.20505-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
References: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

Add a kernel debug flag to enable a one-shot topology
verification for all pipelines including the dynamic
ones. If the debug flag is set, all the topology
component loading will be verified during the complete
callback.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pm.c        |  4 ++--
 sound/soc/sof/sof-audio.c | 37 +++++++++++++++++++++++++------------
 sound/soc/sof/sof-audio.h |  4 ++--
 sound/soc/sof/sof-priv.h  |  1 +
 sound/soc/sof/topology.c  | 17 ++++++++++++++++-
 5 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index ea27567d2fe4..9ec091130323 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -157,7 +157,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	}
 
 	/* restore pipelines */
-	ret = sof_set_up_pipelines(sdev->dev);
+	ret = sof_set_up_pipelines(sdev->dev, false);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to restore pipeline after resume %d\n",
@@ -208,7 +208,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (target_state == SOF_DSP_PM_D0)
 		goto suspend;
 
-	sof_tear_down_pipelines(dev);
+	sof_tear_down_pipelines(dev, false);
 
 	/* release trace */
 	snd_sof_release_trace(sdev);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 7b4dd64576fa..c4cabe26b157 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -589,7 +589,7 @@ const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
 	return NULL;
 }
 
-int sof_set_up_pipelines(struct device *dev)
+int sof_set_up_pipelines(struct device *dev, bool verify)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
@@ -599,7 +599,7 @@ int sof_set_up_pipelines(struct device *dev)
 	/* restore pipeline components */
 	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
 		/* only set up the widgets belonging to static pipelines */
-		if (swidget->dynamic_pipeline_widget)
+		if (!verify && swidget->dynamic_pipeline_widget)
 			continue;
 
 		/* update DAI config. The IPC will be sent in sof_widget_setup() */
@@ -630,8 +630,8 @@ int sof_set_up_pipelines(struct device *dev)
 	list_for_each_entry(sroute, &sdev->route_list, list) {
 
 		/* only set up routes belonging to static pipelines */
-		if (sroute->src_widget->dynamic_pipeline_widget ||
-		    sroute->sink_widget->dynamic_pipeline_widget)
+		if (!verify && (sroute->src_widget->dynamic_pipeline_widget ||
+				sroute->sink_widget->dynamic_pipeline_widget))
 			continue;
 
 		ret = sof_route_setup_ipc(sdev, sroute);
@@ -646,7 +646,7 @@ int sof_set_up_pipelines(struct device *dev)
 		switch (swidget->id) {
 		case snd_soc_dapm_scheduler:
 			/* only complete static pipelines */
-			if (swidget->dynamic_pipeline_widget)
+			if (!verify && swidget->dynamic_pipeline_widget)
 				continue;
 
 			swidget->complete =
@@ -661,24 +661,37 @@ int sof_set_up_pipelines(struct device *dev)
 }
 
 /*
- * This function doesn't free widgets. It only resets the set up status for all routes and
- * use_count for all widgets.
+ * This function doesn't free widgets during suspend. It only resets the set up status for all
+ * routes and use_count for all widgets.
  */
-void sof_tear_down_pipelines(struct device *dev)
+int sof_tear_down_pipelines(struct device *dev, bool verify)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
+	int ret;
 
 	/*
-	 * No need to protect swidget->use_count and sroute->setup as this function is called only
-	 * during the suspend callback and all streams should be suspended by then
+	 * This function is called during suspend and for one-time topology verification during
+	 * first boot. In both cases, there is no need to protect swidget->use_count and
+	 * sroute->setup because during suspend all streams are suspended and during topology
+	 * loading the sound card unavailable to open PCMs.
 	 */
-	list_for_each_entry(swidget, &sdev->widget_list, list)
-		swidget->use_count = 0;
+	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
+		if (!verify) {
+			swidget->use_count = 0;
+			continue;
+		}
+
+		ret = sof_widget_free(sdev, swidget);
+		if (ret < 0)
+			return ret;
+	}
 
 	list_for_each_entry(sroute, &sdev->route_list, list)
 		sroute->setup = false;
+
+	return 0;
 }
 
 /*
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 8d1fc6a8d7d0..149b3dbcddd1 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -246,8 +246,8 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
 
 /* PM */
-int sof_set_up_pipelines(struct device *dev);
-void sof_tear_down_pipelines(struct device *dev);
+int sof_set_up_pipelines(struct device *dev, bool verify);
+int sof_tear_down_pipelines(struct device *dev, bool verify);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
 bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6b1dbae3344c..e5a4426414b3 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -23,6 +23,7 @@
 /* debug flags */
 #define SOF_DBG_ENABLE_TRACE	BIT(0)
 #define SOF_DBG_RETAIN_CTX	BIT(1)	/* prevent DSP D3 on FW exception */
+#define SOF_DBG_VERIFY_TPLG	BIT(2) /* verify topology during load */
 
 #define SOF_DBG_DUMP_REGS		BIT(0)
 #define SOF_DBG_DUMP_MBOX		BIT(1)
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d8eb238e5229..44d60081bc26 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3452,8 +3452,23 @@ static int sof_complete(struct snd_soc_component *scomp)
 		}
 	}
 
+	/* verify topology components loading including dynamic pipelines */
+	if (sof_core_debug & SOF_DBG_VERIFY_TPLG) {
+		ret = sof_set_up_pipelines(scomp->dev, true);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: topology verification failed %d\n", ret);
+			return ret;
+		}
+
+		ret = sof_tear_down_pipelines(scomp->dev, true);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: topology tear down pipelines failed %d\n", ret);
+			return ret;
+		}
+	}
+
 	/* set up static pipelines */
-	return sof_set_up_pipelines(scomp->dev);
+	return sof_set_up_pipelines(scomp->dev, false);
 }
 
 /* manifest - optional to inform component of manifest */
-- 
2.33.0


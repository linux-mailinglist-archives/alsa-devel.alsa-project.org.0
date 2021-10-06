Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8686423C78
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29F1115E2;
	Wed,  6 Oct 2021 13:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29F1115E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633519105;
	bh=QmnI2gM9Ndp1Ld5cFV/q7E2UV9nqlG8JWHWjiwVMuBk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZhcIOSBFBCX2XcNSzo593kXxaX5IUIrWqS5dtBTw5AXS6K77iS1akSwZiyXv/N28Q
	 BWmsEMsaYADEJ/QZMMelmCA/A093wN+kMBHdO8OZieMSAnfKZH8KL9fWpuwU+6dJnN
	 2mIYkc0r6At4JabkQbbnq2zHCnRQ52PICmJnILWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B61BBF80229;
	Wed,  6 Oct 2021 13:17:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B0F3F80240; Wed,  6 Oct 2021 13:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12C7BF800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12C7BF800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="225861161"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="225861161"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:16:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="478079483"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:16:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: pipelines: Harmonize all functions to use struct
 snd_sof_dev
Date: Wed,  6 Oct 2021 14:16:51 +0300
Message-Id: <20211006111651.10027-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
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

First thing the pipelines function which have "struct device *dev" as
parameter do is:
struct snd_sof_dev *sdev = dev_get_drvdata(dev);

and in all cases the passed dev is actually coming from sdev->dev.

Skip this steps and pass directly the sdev to all pipelines related
functions as few of them already does this.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/pm.c        |  4 ++--
 sound/soc/sof/sof-audio.c | 12 +++++-------
 sound/soc/sof/sof-audio.h |  8 ++++----
 sound/soc/sof/topology.c  | 16 +++++++---------
 4 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 77a3496d3dbd..e65f4f4d6df9 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -157,7 +157,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	}
 
 	/* restore pipelines */
-	ret = sof_set_up_pipelines(sdev->dev, false);
+	ret = sof_set_up_pipelines(sdev, false);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to restore pipeline after resume %d\n",
@@ -208,7 +208,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (target_state == SOF_DSP_PM_D0)
 		goto suspend;
 
-	sof_tear_down_pipelines(dev, false);
+	sof_tear_down_pipelines(sdev, false);
 
 	/* release trace */
 	snd_sof_release_trace(sdev);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 262cb3ad4674..7cbe757c1fe2 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -203,7 +203,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 		break;
 	case snd_soc_dapm_scheduler:
 		pipeline = swidget->private;
-		ret = sof_load_pipeline_ipc(sdev->dev, pipeline, &r);
+		ret = sof_load_pipeline_ipc(sdev, pipeline, &r);
 		break;
 	default:
 		hdr = swidget->private;
@@ -428,7 +428,7 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, in
 		if (pipe_widget->complete)
 			continue;
 
-		pipe_widget->complete = snd_sof_complete_pipeline(sdev->dev, pipe_widget);
+		pipe_widget->complete = snd_sof_complete_pipeline(sdev, pipe_widget);
 		if (pipe_widget->complete < 0) {
 			ret = pipe_widget->complete;
 			goto widget_free;
@@ -593,9 +593,8 @@ const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
 	return NULL;
 }
 
-int sof_set_up_pipelines(struct device *dev, bool verify)
+int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 {
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
 	int ret;
@@ -654,7 +653,7 @@ int sof_set_up_pipelines(struct device *dev, bool verify)
 				continue;
 
 			swidget->complete =
-				snd_sof_complete_pipeline(dev, swidget);
+				snd_sof_complete_pipeline(sdev, swidget);
 			break;
 		default:
 			break;
@@ -668,9 +667,8 @@ int sof_set_up_pipelines(struct device *dev, bool verify)
  * This function doesn't free widgets during suspend. It only resets the set up status for all
  * routes and use_count for all widgets.
  */
-int sof_tear_down_pipelines(struct device *dev, bool verify)
+int sof_tear_down_pipelines(struct snd_sof_dev *sdev, bool verify)
 {
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
 	int ret;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 149b3dbcddd1..fe2ffe02fdfb 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -181,10 +181,10 @@ void snd_sof_control_notify(struct snd_sof_dev *sdev,
  * be freed by snd_soc_unregister_component,
  */
 int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file);
-int snd_sof_complete_pipeline(struct device *dev,
+int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
 			      struct snd_sof_widget *swidget);
 
-int sof_load_pipeline_ipc(struct device *dev,
+int sof_load_pipeline_ipc(struct snd_sof_dev *sdev,
 			  struct sof_ipc_pipe_new *pipeline,
 			  struct sof_ipc_comp_reply *r);
 int sof_pipeline_core_enable(struct snd_sof_dev *sdev,
@@ -246,8 +246,8 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
 
 /* PM */
-int sof_set_up_pipelines(struct device *dev, bool verify);
-int sof_tear_down_pipelines(struct device *dev, bool verify);
+int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify);
+int sof_tear_down_pipelines(struct snd_sof_dev *sdev, bool verify);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
 bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 534f004f6162..696c254f101c 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1690,11 +1690,10 @@ static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
 /*
  * Pipeline Topology
  */
-int sof_load_pipeline_ipc(struct device *dev,
+int sof_load_pipeline_ipc(struct snd_sof_dev *sdev,
 			  struct sof_ipc_pipe_new *pipeline,
 			  struct sof_ipc_comp_reply *r)
 {
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	int ret = sof_core_enable(sdev, pipeline->core);
 
 	if (ret < 0)
@@ -1703,7 +1702,7 @@ int sof_load_pipeline_ipc(struct device *dev,
 	ret = sof_ipc_tx_message(sdev->ipc, pipeline->hdr.cmd, pipeline,
 				 sizeof(*pipeline), r, sizeof(*r));
 	if (ret < 0)
-		dev_err(dev, "error: load pipeline ipc failure\n");
+		dev_err(sdev->dev, "error: load pipeline ipc failure\n");
 
 	return ret;
 }
@@ -3373,15 +3372,14 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
-int snd_sof_complete_pipeline(struct device *dev,
+int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
 			      struct snd_sof_widget *swidget)
 {
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct sof_ipc_pipe_ready ready;
 	struct sof_ipc_reply reply;
 	int ret;
 
-	dev_dbg(dev, "tplg: complete pipeline %s id %d\n",
+	dev_dbg(sdev->dev, "tplg: complete pipeline %s id %d\n",
 		swidget->widget->name, swidget->comp_id);
 
 	memset(&ready, 0, sizeof(ready));
@@ -3460,13 +3458,13 @@ static int sof_complete(struct snd_soc_component *scomp)
 
 	/* verify topology components loading including dynamic pipelines */
 	if (sof_core_debug & SOF_DBG_VERIFY_TPLG) {
-		ret = sof_set_up_pipelines(scomp->dev, true);
+		ret = sof_set_up_pipelines(sdev, true);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: topology verification failed %d\n", ret);
 			return ret;
 		}
 
-		ret = sof_tear_down_pipelines(scomp->dev, true);
+		ret = sof_tear_down_pipelines(sdev, true);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: topology tear down pipelines failed %d\n", ret);
 			return ret;
@@ -3474,7 +3472,7 @@ static int sof_complete(struct snd_soc_component *scomp)
 	}
 
 	/* set up static pipelines */
-	return sof_set_up_pipelines(scomp->dev, false);
+	return sof_set_up_pipelines(sdev, false);
 }
 
 /* manifest - optional to inform component of manifest */
-- 
2.33.0


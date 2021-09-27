Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E34193E4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 14:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828AD1684;
	Mon, 27 Sep 2021 14:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828AD1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632744695;
	bh=Eg93b53qC81C4tYPvsg/nK4Dauvk/rUg6Wr16nbQEd8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kDZwAJvvJRNjQxJr/0Yv8A/Ajfalnt92o1ck4qvMQnpgD1GmyTSHQRAUXl5c7a6tl
	 67USWn1Hb1UNZ0K7P5CQ1IL3xaUMkx4FC8pn1wmgkgP34MRCEOD8VqsLVCjo3lZ6GS
	 xhKsuYzov9ooX/aIlsbDBDqBp4uDG468dNu/aTN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B89D0F8053D;
	Mon, 27 Sep 2021 14:07:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EFB5F801F7; Mon, 27 Sep 2021 14:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2784CF8026D
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 14:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2784CF8026D
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="221260473"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="221260473"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553164389"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.251.220.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH v3 04/12] ASoC: SOF: sof-audio: add helpers for widgets,
 kcontrols and dai config set up
Date: Mon, 27 Sep 2021 15:05:09 +0300
Message-Id: <20210927120517.20505-5-peter.ujfalusi@linux.intel.com>
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

Refactor the existing code to use helper functions to
set up/free widgets, send dai config and set up kcontrols for
widgets. These will be reused later on for setting up widgets in
the connected DAPM widgets list for a particular PCM when the
dynamic pipeline feature is implemented.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 234 +++++++++++++++++++-------------------
 1 file changed, 116 insertions(+), 118 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 989912f2b739..a4b9bb99bced 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -11,6 +11,116 @@
 #include "sof-audio.h"
 #include "ops.h"
 
+static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
+{
+	int ipc_cmd, ctrl_type;
+	int ret;
+
+	/* reset readback offset for scontrol */
+	scontrol->readback_offset = 0;
+
+	/* notify DSP of kcontrol values */
+	switch (scontrol->cmd) {
+	case SOF_CTRL_CMD_VOLUME:
+	case SOF_CTRL_CMD_ENUM:
+	case SOF_CTRL_CMD_SWITCH:
+		ipc_cmd = SOF_IPC_COMP_SET_VALUE;
+		ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_SET;
+		break;
+	case SOF_CTRL_CMD_BINARY:
+		ipc_cmd = SOF_IPC_COMP_SET_DATA;
+		ctrl_type = SOF_CTRL_TYPE_DATA_SET;
+		break;
+	default:
+		return 0;
+	}
+
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, ipc_cmd, ctrl_type, scontrol->cmd, true);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed kcontrol value set for widget: %d\n",
+			scontrol->comp_id);
+
+	return ret;
+}
+
+static int sof_dai_config_setup(struct snd_sof_dev *sdev, struct snd_sof_dai *dai)
+{
+	struct sof_ipc_dai_config *config;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	config = &dai->dai_config[dai->current_config];
+	if (!config) {
+		dev_err(sdev->dev, "error: no config for DAI %s\n", dai->name);
+		return -EINVAL;
+	}
+
+	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				 &reply, sizeof(reply));
+
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed to set dai config for %s\n", dai->name);
+
+	return ret;
+}
+
+static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct sof_ipc_pipe_new *pipeline;
+	struct sof_ipc_comp_reply r;
+	struct sof_ipc_cmd_hdr *hdr;
+	struct sof_ipc_comp *comp;
+	struct snd_sof_dai *dai;
+	size_t ipc_size;
+	int ret;
+
+	/* skip if there is no private data */
+	if (!swidget->private)
+		return 0;
+
+	ret = sof_pipeline_core_enable(sdev, swidget);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to enable target core: %d for widget %s\n",
+			ret, swidget->widget->name);
+		return ret;
+	}
+
+	switch (swidget->id) {
+	case snd_soc_dapm_dai_in:
+	case snd_soc_dapm_dai_out:
+		ipc_size = sizeof(struct sof_ipc_comp_dai) + sizeof(struct sof_ipc_comp_ext);
+		comp = kzalloc(ipc_size, GFP_KERNEL);
+		if (!comp)
+			return -ENOMEM;
+
+		dai = swidget->private;
+		memcpy(comp, &dai->comp_dai, sizeof(struct sof_ipc_comp_dai));
+
+		/* append extended data to the end of the component */
+		memcpy((u8 *)comp + sizeof(struct sof_ipc_comp_dai), &swidget->comp_ext,
+		       sizeof(swidget->comp_ext));
+
+		ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd, comp, ipc_size, &r, sizeof(r));
+		kfree(comp);
+		break;
+	case snd_soc_dapm_scheduler:
+		pipeline = swidget->private;
+		ret = sof_load_pipeline_ipc(sdev->dev, pipeline, &r);
+		break;
+	default:
+		hdr = swidget->private;
+		ret = sof_ipc_tx_message(sdev->ipc, hdr->cmd, swidget->private, hdr->size,
+					 &r, sizeof(r));
+		break;
+	}
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed to load widget %s\n", swidget->widget->name);
+	else
+		dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
+
+	return ret;
+}
+
 /*
  * helper to determine if there are only D0i3 compatible
  * streams active
@@ -97,46 +207,13 @@ static int sof_restore_kcontrols(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_control *scontrol;
-	int ipc_cmd, ctrl_type;
 	int ret = 0;
 
 	/* restore kcontrol values */
 	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-		/* reset readback offset for scontrol after resuming */
-		scontrol->readback_offset = 0;
-
-		/* notify DSP of kcontrol values */
-		switch (scontrol->cmd) {
-		case SOF_CTRL_CMD_VOLUME:
-		case SOF_CTRL_CMD_ENUM:
-		case SOF_CTRL_CMD_SWITCH:
-			ipc_cmd = SOF_IPC_COMP_SET_VALUE;
-			ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_SET;
-			ret = snd_sof_ipc_set_get_comp_data(scontrol,
-							    ipc_cmd, ctrl_type,
-							    scontrol->cmd,
-							    true);
-			break;
-		case SOF_CTRL_CMD_BINARY:
-			ipc_cmd = SOF_IPC_COMP_SET_DATA;
-			ctrl_type = SOF_CTRL_TYPE_DATA_SET;
-			ret = snd_sof_ipc_set_get_comp_data(scontrol,
-							    ipc_cmd, ctrl_type,
-							    scontrol->cmd,
-							    true);
-			break;
-
-		default:
-			break;
-		}
-
-		if (ret < 0) {
-			dev_err(dev,
-				"error: failed kcontrol value set for widget: %d\n",
-				scontrol->comp_id);
-
+		ret = sof_kcontrol_setup(sdev, scontrol);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -163,77 +240,14 @@ int sof_restore_pipelines(struct device *dev)
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
-	struct sof_ipc_pipe_new *pipeline;
 	struct snd_sof_dai *dai;
-	struct sof_ipc_cmd_hdr *hdr;
-	struct sof_ipc_comp *comp;
-	size_t ipc_size;
 	int ret;
 
 	/* restore pipeline components */
 	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
-		struct sof_ipc_comp_reply r;
-
-		/* skip if there is no private data */
-		if (!swidget->private)
-			continue;
-
-		ret = sof_pipeline_core_enable(sdev, swidget);
-		if (ret < 0) {
-			dev_err(dev,
-				"error: failed to enable target core: %d\n",
-				ret);
-
-			return ret;
-		}
-
-		switch (swidget->id) {
-		case snd_soc_dapm_dai_in:
-		case snd_soc_dapm_dai_out:
-			ipc_size = sizeof(struct sof_ipc_comp_dai) +
-				   sizeof(struct sof_ipc_comp_ext);
-			comp = kzalloc(ipc_size, GFP_KERNEL);
-			if (!comp)
-				return -ENOMEM;
-
-			dai = swidget->private;
-			memcpy(comp, &dai->comp_dai,
-			       sizeof(struct sof_ipc_comp_dai));
-
-			/* append extended data to the end of the component */
-			memcpy((u8 *)comp + sizeof(struct sof_ipc_comp_dai),
-			       &swidget->comp_ext, sizeof(swidget->comp_ext));
-
-			ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd,
-						 comp, ipc_size,
-						 &r, sizeof(r));
-			kfree(comp);
-			break;
-		case snd_soc_dapm_scheduler:
-
-			/*
-			 * During suspend, all DSP cores are powered off.
-			 * Therefore upon resume, create the pipeline comp
-			 * and power up the core that the pipeline is
-			 * scheduled on.
-			 */
-			pipeline = swidget->private;
-			ret = sof_load_pipeline_ipc(dev, pipeline, &r);
-			break;
-		default:
-			hdr = swidget->private;
-			ret = sof_ipc_tx_message(sdev->ipc, hdr->cmd,
-						 swidget->private, hdr->size,
-						 &r, sizeof(r));
-			break;
-		}
-		if (ret < 0) {
-			dev_err(dev,
-				"error: failed to load widget type %d with ID: %d\n",
-				swidget->widget->id, swidget->comp_id);
-
+		ret = sof_widget_setup(sdev, swidget);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	/* restore pipeline connections */
@@ -266,15 +280,8 @@ int sof_restore_pipelines(struct device *dev)
 
 	/* restore dai links */
 	list_for_each_entry_reverse(dai, &sdev->dai_list, list) {
-		struct sof_ipc_reply reply;
 		struct sof_ipc_dai_config *config = &dai->dai_config[dai->current_config];
 
-		if (!config) {
-			dev_err(dev, "error: no config for DAI %s\n",
-				dai->name);
-			continue;
-		}
-
 		/*
 		 * The link DMA channel would be invalidated for running
 		 * streams but not for streams that were in the PAUSED
@@ -284,18 +291,9 @@ int sof_restore_pipelines(struct device *dev)
 		if (config->type == SOF_DAI_INTEL_HDA)
 			config->hda.link_dma_ch = DMA_CHAN_INVALID;
 
-		ret = sof_ipc_tx_message(sdev->ipc,
-					 config->hdr.cmd, config,
-					 config->hdr.size,
-					 &reply, sizeof(reply));
-
-		if (ret < 0) {
-			dev_err(dev,
-				"error: failed to set dai config for %s\n",
-				dai->name);
-
+		ret = sof_dai_config_setup(sdev, dai);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	/* complete pipeline */
-- 
2.33.0


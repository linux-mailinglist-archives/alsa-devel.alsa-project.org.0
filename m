Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1977A4DCD0F
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:57:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 917BB1A00;
	Thu, 17 Mar 2022 18:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 917BB1A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539877;
	bh=Jnwx6bT6fSpQMaGnu5xMc5DOpIdmZ8vxyY/YFGTnTj4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eO3PKm7fLppEX+3LRlTGGdBPbQJdcO4DFgYhu0nc3AkZQG40ky8YtVX1KSmTFVEaA
	 uuCoRIaCX697q8EgMX4KhnuyXJKFVzODwZu29e+eFoZGScoq2Ev4zUsbc+QwEIKrvQ
	 kZAeO8HiyVMXY0Mrbp/16BxPOIu4lysWXFcp86TI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1703F805B3;
	Thu, 17 Mar 2022 18:52:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85E0BF80520; Thu, 17 Mar 2022 18:52:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C8E6F8052E
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C8E6F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SEJUUI/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539519; x=1679075519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jnwx6bT6fSpQMaGnu5xMc5DOpIdmZ8vxyY/YFGTnTj4=;
 b=SEJUUI/+uxGrFQE3tJx6sHnm0o8mpzMy3l57I3S9Ymtm5Aer89OaiWd8
 mxWrhNRD+d4gSzRGPMqPGsGVydzS6iR1hQVVmfh5Hf3QSYMywACJWu4tX
 NtdtBFsqBjnkjRGvnwLeZE/1izKM1bQr140o7g7iEwQHAMtAuqsp1WNoV
 MOwkkcDHwBnlH3b2sMWPAY8hlif26wWNsnboaNypVZQ/Q++LUHZu5y/UI
 lwy4eYNy+fj78VPTaoPXfThG0ed3d3Ig98IshHa51dA40Zdl2bRxBqS/P
 VuiRdZS99iPVg8eLCJyu3lgoqwEY2OKP9bL9Ug+iCEOrTuNdQnt7HkybC g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492936"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492936"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431159"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:24 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/19] ASoC: SOF: topology: Add ops for setting up and tearing
 down pipelines
Date: Thu, 17 Mar 2022 10:50:43 -0700
Message-Id: <20220317175044.1752400-19-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

Introduce two new ops, set_up_all_pipelines and tear_down_all_pipelines
in struct ipc_tplg_ops and define these for IPC3.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 197 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/pm.c            |  17 +--
 sound/soc/sof/sof-audio.c     | 186 --------------------------------
 sound/soc/sof/sof-audio.h     |   6 +-
 sound/soc/sof/topology.c      |  55 +++++-----
 5 files changed, 235 insertions(+), 226 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 55be97ee816b..3ac65dacc7b9 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2057,6 +2057,201 @@ static int sof_ipc3_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	return ret;
 }
 
+static int sof_ipc3_set_up_all_pipelines(struct snd_sof_dev *sdev, bool verify)
+{
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
+	struct snd_sof_widget *swidget;
+	struct snd_sof_route *sroute;
+	int ret;
+
+	/* restore pipeline components */
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		/* only set up the widgets belonging to static pipelines */
+		if (!verify && swidget->dynamic_pipeline_widget)
+			continue;
+
+		/*
+		 * For older firmware, skip scheduler widgets in this loop,
+		 * sof_widget_setup() will be called in the 'complete pipeline' loop
+		 */
+		if (v->abi_version < SOF_ABI_VER(3, 19, 0) &&
+		    swidget->id == snd_soc_dapm_scheduler)
+			continue;
+
+		/* update DAI config. The IPC will be sent in sof_widget_setup() */
+		if (WIDGET_IS_DAI(swidget->id)) {
+			struct snd_sof_dai *dai = swidget->private;
+			struct sof_dai_private_data *private;
+			struct sof_ipc_dai_config *config;
+
+			if (!dai || !dai->private)
+				continue;
+			private = dai->private;
+			if (!private->dai_config)
+				continue;
+
+			config = private->dai_config;
+			/*
+			 * The link DMA channel would be invalidated for running
+			 * streams but not for streams that were in the PAUSED
+			 * state during suspend. So invalidate it here before setting
+			 * the dai config in the DSP.
+			 */
+			if (config->type == SOF_DAI_INTEL_HDA)
+				config->hda.link_dma_ch = DMA_CHAN_INVALID;
+		}
+
+		ret = sof_widget_setup(sdev, swidget);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* restore pipeline connections */
+	list_for_each_entry(sroute, &sdev->route_list, list) {
+		/* only set up routes belonging to static pipelines */
+		if (!verify && (sroute->src_widget->dynamic_pipeline_widget ||
+				sroute->sink_widget->dynamic_pipeline_widget))
+			continue;
+
+		/*
+		 * For virtual routes, both sink and source are not buffer. IPC3 only supports
+		 * connections between a buffer and a component. Ignore the rest.
+		 */
+		if (sroute->src_widget->id != snd_soc_dapm_buffer &&
+		    sroute->sink_widget->id != snd_soc_dapm_buffer)
+			continue;
+
+		ret = sof_route_setup(sdev, sroute->src_widget->widget,
+				      sroute->sink_widget->widget);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: route set up failed\n", __func__);
+			return ret;
+		}
+	}
+
+	/* complete pipeline */
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		switch (swidget->id) {
+		case snd_soc_dapm_scheduler:
+			/* only complete static pipelines */
+			if (!verify && swidget->dynamic_pipeline_widget)
+				continue;
+
+			if (v->abi_version < SOF_ABI_VER(3, 19, 0)) {
+				ret = sof_widget_setup(sdev, swidget);
+				if (ret < 0)
+					return ret;
+			}
+
+			swidget->complete = sof_ipc3_complete_pipeline(sdev, swidget);
+			if (swidget->complete < 0)
+				return swidget->complete;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Free the PCM, its associated widgets and set the prepared flag to false for all PCMs that
+ * did not get suspended(ex: paused streams) so the widgets can be set up again during resume.
+ */
+static int sof_tear_down_left_over_pipelines(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_widget *swidget;
+	struct snd_sof_pcm *spcm;
+	int dir, ret;
+
+	/*
+	 * free all PCMs and their associated DAPM widgets if their connected DAPM widget
+	 * list is not NULL. This should only be true for paused streams at this point.
+	 * This is equivalent to the handling of FE DAI suspend trigger for running streams.
+	 */
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		for_each_pcm_streams(dir) {
+			struct snd_pcm_substream *substream = spcm->stream[dir].substream;
+
+			if (!substream || !substream->runtime)
+				continue;
+
+			if (spcm->stream[dir].list) {
+				ret = sof_pcm_stream_free(sdev, substream, spcm, dir, true);
+				if (ret < 0)
+					return ret;
+			}
+		}
+	}
+
+	/*
+	 * free any left over DAI widgets. This is equivalent to the handling of suspend trigger
+	 * for the BE DAI for running streams.
+	 */
+	list_for_each_entry(swidget, &sdev->widget_list, list)
+		if (WIDGET_IS_DAI(swidget->id) && swidget->use_count == 1) {
+			ret = sof_widget_free(sdev, swidget);
+			if (ret < 0)
+				return ret;
+		}
+
+	return 0;
+}
+
+/*
+ * For older firmware, this function doesn't free widgets for static pipelines during suspend.
+ * It only resets use_count for all widgets.
+ */
+static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verify)
+{
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
+	struct snd_sof_widget *swidget;
+	struct snd_sof_route *sroute;
+	int ret;
+
+	/*
+	 * This function is called during suspend and for one-time topology verification during
+	 * first boot. In both cases, there is no need to protect swidget->use_count and
+	 * sroute->setup because during suspend all running streams are suspended and during
+	 * topology loading the sound card unavailable to open PCMs.
+	 */
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (swidget->dynamic_pipeline_widget)
+			continue;
+
+		/* Do not free widgets for static pipelines with FW ABI older than 3.19 */
+		if (!verify && !swidget->dynamic_pipeline_widget &&
+		    v->abi_version < SOF_ABI_VER(3, 19, 0)) {
+			swidget->use_count = 0;
+			swidget->complete = 0;
+			continue;
+		}
+
+		ret = sof_widget_free(sdev, swidget);
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * Tear down all pipelines associated with PCMs that did not get suspended
+	 * and unset the prepare flag so that they can be set up again during resume.
+	 * Skip this step for older firmware.
+	 */
+	if (!verify && v->abi_version >= SOF_ABI_VER(3, 19, 0)) {
+		ret = sof_tear_down_left_over_pipelines(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev, "failed to tear down paused pipelines\n");
+			return ret;
+		}
+	}
+
+	list_for_each_entry(sroute, &sdev->route_list, list)
+		sroute->setup = false;
+
+	return 0;
+}
+
 /* token list for each topology object */
 static enum sof_tokens host_token_list[] = {
 	SOF_CORE_TOKENS,
@@ -2164,4 +2359,6 @@ const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.widget_free = sof_ipc3_widget_free,
 	.widget_setup = sof_ipc3_widget_setup,
 	.dai_config = sof_ipc3_dai_config,
+	.set_up_all_pipelines = sof_ipc3_set_up_all_pipelines,
+	.tear_down_all_pipelines = sof_ipc3_tear_down_all_pipelines,
 };
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 10adbbd0a9cd..1c319582ca6f 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -71,6 +71,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 	u32 old_state = sdev->dsp_power_state.state;
 	int ret;
 
@@ -144,12 +145,12 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	}
 
 	/* restore pipelines */
-	ret = sof_set_up_pipelines(sdev, false);
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to restore pipeline after resume %d\n",
-			ret);
-		return ret;
+	if (tplg_ops->set_up_all_pipelines) {
+		ret = tplg_ops->set_up_all_pipelines(sdev, false);
+		if (ret < 0) {
+			dev_err(sdev->dev, "Failed to restore pipeline after resume %d\n", ret);
+			return ret;
+		}
 	}
 
 	/* Notify clients not managed by pm framework about core resume */
@@ -169,6 +170,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 	pm_message_t pm_state;
 	u32 target_state = 0;
 	int ret;
@@ -204,7 +206,8 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		goto suspend;
 	}
 
-	sof_tear_down_pipelines(sdev, false);
+	if (tplg_ops->tear_down_all_pipelines)
+		tplg_ops->tear_down_all_pipelines(sdev, false);
 
 	/* release trace */
 	snd_sof_release_trace(sdev);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 8885709f40df..b4ee65cf9841 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -498,96 +498,6 @@ int sof_set_hw_params_upon_resume(struct device *dev)
 	return snd_sof_dsp_hw_params_upon_resume(sdev);
 }
 
-int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
-{
-	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
-	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
-	struct snd_sof_widget *swidget;
-	struct snd_sof_route *sroute;
-	int ret;
-
-	/* restore pipeline components */
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		/* only set up the widgets belonging to static pipelines */
-		if (!verify && swidget->dynamic_pipeline_widget)
-			continue;
-
-		/*
-		 * For older firmware, skip scheduler widgets in this loop,
-		 * sof_widget_setup() will be called in the 'complete pipeline' loop
-		 */
-		if (v->abi_version < SOF_ABI_VER(3, 19, 0) &&
-		    swidget->id == snd_soc_dapm_scheduler)
-			continue;
-
-		/* update DAI config. The IPC will be sent in sof_widget_setup() */
-		if (WIDGET_IS_DAI(swidget->id)) {
-			struct snd_sof_dai *dai = swidget->private;
-			struct sof_dai_private_data *private = dai->private;
-			struct sof_ipc_dai_config *config;
-
-			if (!dai || !private || !private->dai_config)
-				continue;
-
-			config = private->dai_config;
-			/*
-			 * The link DMA channel would be invalidated for running
-			 * streams but not for streams that were in the PAUSED
-			 * state during suspend. So invalidate it here before setting
-			 * the dai config in the DSP.
-			 */
-			if (config->type == SOF_DAI_INTEL_HDA)
-				config->hda.link_dma_ch = DMA_CHAN_INVALID;
-		}
-
-		ret = sof_widget_setup(sdev, swidget);
-		if (ret < 0)
-			return ret;
-	}
-
-	/* restore pipeline connections */
-	list_for_each_entry(sroute, &sdev->route_list, list) {
-
-		/* only set up routes belonging to static pipelines */
-		if (!verify && (sroute->src_widget->dynamic_pipeline_widget ||
-				sroute->sink_widget->dynamic_pipeline_widget))
-			continue;
-
-		ret = ipc_tplg_ops->route_setup(sdev, sroute);
-		if (ret < 0) {
-			dev_err(sdev->dev, "%s: restore pipeline connections failed\n", __func__);
-			return ret;
-		}
-	}
-
-	/* complete pipeline */
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		switch (swidget->id) {
-		case snd_soc_dapm_scheduler:
-			/* only complete static pipelines */
-			if (!verify && swidget->dynamic_pipeline_widget)
-				continue;
-
-			if (v->abi_version < SOF_ABI_VER(3, 19, 0)) {
-				ret = sof_widget_setup(sdev, swidget);
-				if (ret < 0)
-					return ret;
-			}
-
-			if (ipc_tplg_ops->pipeline_complete) {
-				swidget->complete = ipc_tplg_ops->pipeline_complete(sdev, swidget);
-				if (swidget->complete < 0)
-					return swidget->complete;
-			}
-			break;
-		default:
-			break;
-		}
-	}
-
-	return 0;
-}
-
 int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
 			struct snd_sof_pcm *spcm, int dir, bool free_widget_list)
 {
@@ -618,102 +528,6 @@ int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *subs
 	return ret;
 }
 
-/*
- * Free the PCM, its associated widgets and set the prepared flag to false for all PCMs that
- * did not get suspended(ex: paused streams) so the widgets can be set up again during resume.
- */
-static int sof_tear_down_left_over_pipelines(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_widget *swidget;
-	struct snd_sof_pcm *spcm;
-	int dir, ret;
-
-	/*
-	 * free all PCMs and their associated DAPM widgets if their connected DAPM widget
-	 * list is not NULL. This should only be true for paused streams at this point.
-	 * This is equivalent to the handling of FE DAI suspend trigger for running streams.
-	 */
-	list_for_each_entry(spcm, &sdev->pcm_list, list)
-		for_each_pcm_streams(dir) {
-			struct snd_pcm_substream *substream = spcm->stream[dir].substream;
-
-			if (!substream || !substream->runtime)
-				continue;
-
-			if (spcm->stream[dir].list) {
-				ret = sof_pcm_stream_free(sdev, substream, spcm, dir, true);
-				if (ret < 0)
-					return ret;
-			}
-		}
-
-	/*
-	 * free any left over DAI widgets. This is equivalent to the handling of suspend trigger
-	 * for the BE DAI for running streams.
-	 */
-	list_for_each_entry(swidget, &sdev->widget_list, list)
-		if (WIDGET_IS_DAI(swidget->id) && swidget->use_count == 1) {
-			ret = sof_widget_free(sdev, swidget);
-			if (ret < 0)
-				return ret;
-		}
-
-	return 0;
-}
-
-/*
- * For older firmware, this function doesn't free widgets for static pipelines during suspend.
- * It only resets use_count for all widgets.
- */
-int sof_tear_down_pipelines(struct snd_sof_dev *sdev, bool verify)
-{
-	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
-	struct snd_sof_widget *swidget;
-	struct snd_sof_route *sroute;
-	int ret;
-
-	/*
-	 * This function is called during suspend and for one-time topology verification during
-	 * first boot. In both cases, there is no need to protect swidget->use_count and
-	 * sroute->setup because during suspend all running streams are suspended and during
-	 * topology loading the sound card unavailable to open PCMs.
-	 */
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		if (swidget->dynamic_pipeline_widget)
-			continue;
-
-		/* Do not free widgets for static pipelines with FW ABI older than 3.19 */
-		if (!verify && !swidget->dynamic_pipeline_widget &&
-		    v->abi_version < SOF_ABI_VER(3, 19, 0)) {
-			swidget->use_count = 0;
-			swidget->complete = 0;
-			continue;
-		}
-
-		ret = sof_widget_free(sdev, swidget);
-		if (ret < 0)
-			return ret;
-	}
-
-	/*
-	 * Tear down all pipelines associated with PCMs that did not get suspended
-	 * and unset the prepare flag so that they can be set up again during resume.
-	 * Skip this step for older firmware.
-	 */
-	if (!verify && v->abi_version >= SOF_ABI_VER(3, 19, 0)) {
-		ret = sof_tear_down_left_over_pipelines(sdev);
-		if (ret < 0) {
-			dev_err(sdev->dev, "failed to tear down paused pipelines\n");
-			return ret;
-		}
-	}
-
-	list_for_each_entry(sroute, &sdev->route_list, list)
-		sroute->setup = false;
-
-	return 0;
-}
-
 /*
  * Generic object lookup APIs.
  */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 777da321e2aa..b9a9956b5baa 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -117,6 +117,8 @@ struct sof_ipc_tplg_widget_ops {
  * @widget_setup: Function pointer for setting up setup in the DSP
  * @widget_free: Function pointer for freeing widget in the DSP
  * @dai_config: Function pointer for sending DAI config IPC to the DSP
+ * @set_up_all_pipelines: Function pointer for setting up all topology pipelines
+ * @tear_down_all_pipelines: Function pointer for tearing down all topology pipelines
  */
 struct sof_ipc_tplg_ops {
 	const struct sof_ipc_tplg_widget_ops *widget;
@@ -130,6 +132,8 @@ struct sof_ipc_tplg_ops {
 	int (*widget_free)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 	int (*dai_config)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
 			  unsigned int flags, struct snd_sof_dai_config_data *data);
+	int (*set_up_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
+	int (*tear_down_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
 };
 
 /** struct snd_sof_tuple - Tuple info
@@ -429,8 +433,6 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set);
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
 
 /* PM */
-int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify);
-int sof_tear_down_pipelines(struct snd_sof_dev *sdev, bool verify);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
 bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 367fbe2d5b31..9e6545dd415c 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1797,29 +1797,15 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	    sink_swidget->id == snd_soc_dapm_output)
 		goto err;
 
-	/*
-	 * For virtual routes, both sink and source are not
-	 * buffer. Since only buffer linked to component is supported by
-	 * FW, others are reported as error, add check in route function,
-	 * do not send it to FW when both source and sink are not buffer
-	 */
-	if (source_swidget->id != snd_soc_dapm_buffer &&
-	    sink_swidget->id != snd_soc_dapm_buffer) {
-		dev_dbg(scomp->dev, "warning: neither Linked source component %s nor sink component %s is of buffer type, ignoring link\n",
-			route->source, route->sink);
-		goto err;
-	} else {
-		sroute->route = route;
-		dobj->private = sroute;
-		sroute->src_widget = source_swidget;
-		sroute->sink_widget = sink_swidget;
-
-		/* add route to route list */
-		list_add(&sroute->list, &sdev->route_list);
+	sroute->route = route;
+	dobj->private = sroute;
+	sroute->src_widget = source_swidget;
+	sroute->sink_widget = sink_swidget;
 
-		return 0;
-	}
+	/* add route to route list */
+	list_add(&sroute->list, &sdev->route_list);
 
+	return 0;
 err:
 	kfree(sroute);
 	return ret;
@@ -1918,21 +1904,28 @@ static int sof_complete(struct snd_soc_component *scomp)
 
 	/* verify topology components loading including dynamic pipelines */
 	if (sof_debug_check_flag(SOF_DBG_VERIFY_TPLG)) {
-		ret = sof_set_up_pipelines(sdev, true);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: topology verification failed %d\n", ret);
-			return ret;
-		}
+		if (ipc_tplg_ops->set_up_all_pipelines && ipc_tplg_ops->tear_down_all_pipelines) {
+			ret = ipc_tplg_ops->set_up_all_pipelines(sdev, true);
+			if (ret < 0) {
+				dev_err(sdev->dev, "Failed to set up all topology pipelines: %d\n",
+					ret);
+				return ret;
+			}
 
-		ret = sof_tear_down_pipelines(sdev, true);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: topology tear down pipelines failed %d\n", ret);
-			return ret;
+			ret = ipc_tplg_ops->tear_down_all_pipelines(sdev, true);
+			if (ret < 0) {
+				dev_err(sdev->dev, "Failed to tear down topology pipelines: %d\n",
+					ret);
+				return ret;
+			}
 		}
 	}
 
 	/* set up static pipelines */
-	return sof_set_up_pipelines(sdev, false);
+	if (ipc_tplg_ops->set_up_all_pipelines)
+		return ipc_tplg_ops->set_up_all_pipelines(sdev, false);
+
+	return 0;
 }
 
 /* manifest - optional to inform component of manifest */
-- 
2.25.1


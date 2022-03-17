Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 799654DCD10
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:58:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AAC71AA7;
	Thu, 17 Mar 2022 18:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AAC71AA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539895;
	bh=3WhlAcg6vKx9GuYzLzKN0v8vT66/Uj5AKZpU2z/yvV4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sij58pMjR4xn48hGUQ9j72EPsBf7J8H/ufBGQZubSFupV3pybJRvUAblkyb+ZACwV
	 1dWZatkCWvjELIwa6Gti7p0NiIiso3CJLokN0H8hGoyUXAf9/BxLfdQ9N8HdLzbtfe
	 DTZhZHsKagEZnNvAd69E263ERhzetkYrykxa/FkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6571FF805BE;
	Thu, 17 Mar 2022 18:52:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA798F8053B; Thu, 17 Mar 2022 18:52:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9FBDF80526
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9FBDF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Xuh6CRmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539518; x=1679075518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3WhlAcg6vKx9GuYzLzKN0v8vT66/Uj5AKZpU2z/yvV4=;
 b=Xuh6CRmwDX0/+4V4M6W8r+Ppqn2Ve9bpsyHMOw68rNOOXuYMAq05zuO2
 fxx+piFQfpXS1spK+FrGO2Uq7y7XvrSyTtDpMyoVRtHBnygQgQQlZBgxL
 c7NOH8X7duyCqiYt9cGgT3NlKqKfLOa9G+bnTHNYLgraUcDJdOgpQhYEc
 fdWSYCnAWzWpNYSdrPTQteyRM7HjB9fcChY92i/NSLDHobfzjCvly1Ky2
 WEoPczwheDXLP36ukWL2keFQ1HD3k0DD37HdAflaexOHt0dWhkQ9jHz0I
 z7Wo+Q8vRSyBHsK9LIYfx+UDjugEtMxWRsh1pwspVFRCIslKQ0Bvh1Kte w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492932"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492932"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431157"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/19] ASoC: SOF: Add dai_link_fixup PCM op for IPC3
Date: Thu, 17 Mar 2022 10:50:41 -0700
Message-Id: <20220317175044.1752400-17-ranjani.sridharan@linux.intel.com>
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

Define the dai_link_fixup PCM op for IPC3 and use it

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3-pcm.c | 186 +++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/pcm.c      | 174 +-----------------------------------
 2 files changed, 189 insertions(+), 171 deletions(-)

diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index d83d54540bbe..58b75943cf6d 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -179,8 +179,194 @@ static int sof_ipc3_pcm_trigger(struct snd_soc_component *component,
 				  sizeof(stream), &reply, sizeof(reply));
 }
 
+static void ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const char *link_name,
+					    struct snd_pcm_hw_params *params)
+{
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *dai;
+	int i;
+
+	/*
+	 * Search for all matching DAIs as we can have both playback and capture DAI
+	 * associated with the same link.
+	 */
+	list_for_each_entry(dai, &sdev->dai_list, list) {
+		if (!dai->name || strcmp(link_name, dai->name))
+			continue;
+		for (i = 0; i < dai->number_configs; i++) {
+			struct sof_dai_private_data *private = dai->private;
+
+			config = &private->dai_config[i];
+			if (config->ssp.fsync_rate == params_rate(params)) {
+				dev_dbg(sdev->dev, "DAI config %d matches pcm hw params\n", i);
+				dai->current_config = i;
+				break;
+			}
+		}
+	}
+}
+
+static int sof_ipc3_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
+				       struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
+	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_sof_dai *dai = snd_sof_find_dai(component, (char *)rtd->dai_link->name);
+	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_dai_private_data *private;
+	struct snd_soc_dpcm *dpcm;
+
+	if (!dai) {
+		dev_err(component->dev, "%s: No DAI found with name %s\n", __func__,
+			rtd->dai_link->name);
+		return -EINVAL;
+	}
+
+	private = dai->private;
+	if (!private) {
+		dev_err(component->dev, "%s: No private data found for DAI %s\n", __func__,
+			rtd->dai_link->name);
+		return -EINVAL;
+	}
+
+	/* read format from topology */
+	snd_mask_none(fmt);
+
+	switch (private->comp_dai->config.frame_fmt) {
+	case SOF_IPC_FRAME_S16_LE:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+		break;
+	case SOF_IPC_FRAME_S24_4LE:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+		break;
+	case SOF_IPC_FRAME_S32_LE:
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+		break;
+	default:
+		dev_err(component->dev, "No available DAI format!\n");
+		return -EINVAL;
+	}
+
+	/* read rate and channels from topology */
+	switch (private->dai_config->type) {
+	case SOF_DAI_INTEL_SSP:
+		/* search for config to pcm params match, if not found use default */
+		ssp_dai_config_pcm_params_match(sdev, (char *)rtd->dai_link->name, params);
+
+		rate->min = private->dai_config[dai->current_config].ssp.fsync_rate;
+		rate->max = private->dai_config[dai->current_config].ssp.fsync_rate;
+		channels->min = private->dai_config[dai->current_config].ssp.tdm_slots;
+		channels->max = private->dai_config[dai->current_config].ssp.tdm_slots;
+
+		dev_dbg(component->dev, "rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev, "channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+
+		break;
+	case SOF_DAI_INTEL_DMIC:
+		/* DMIC only supports 16 or 32 bit formats */
+		if (private->comp_dai->config.frame_fmt == SOF_IPC_FRAME_S24_4LE) {
+			dev_err(component->dev, "Invalid fmt %d for DAI type %d\n",
+				private->comp_dai->config.frame_fmt,
+				private->dai_config->type);
+		}
+		break;
+	case SOF_DAI_INTEL_HDA:
+		/*
+		 * HDAudio does not follow the default trigger
+		 * sequence due to firmware implementation
+		 */
+		for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm) {
+			struct snd_soc_pcm_runtime *fe = dpcm->fe;
+
+			fe->dai_link->trigger[SNDRV_PCM_STREAM_PLAYBACK] =
+				SND_SOC_DPCM_TRIGGER_POST;
+		}
+		break;
+	case SOF_DAI_INTEL_ALH:
+		/*
+		 * Dai could run with different channel count compared with
+		 * front end, so get dai channel count from topology
+		 */
+		channels->min = private->dai_config->alh.channels;
+		channels->max = private->dai_config->alh.channels;
+		break;
+	case SOF_DAI_IMX_ESAI:
+		rate->min = private->dai_config->esai.fsync_rate;
+		rate->max = private->dai_config->esai.fsync_rate;
+		channels->min = private->dai_config->esai.tdm_slots;
+		channels->max = private->dai_config->esai.tdm_slots;
+
+		dev_dbg(component->dev, "rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev, "channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_MEDIATEK_AFE:
+		rate->min = private->dai_config->afe.rate;
+		rate->max = private->dai_config->afe.rate;
+		channels->min = private->dai_config->afe.channels;
+		channels->max = private->dai_config->afe.channels;
+
+		dev_dbg(component->dev, "rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev, "channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_IMX_SAI:
+		rate->min = private->dai_config->sai.fsync_rate;
+		rate->max = private->dai_config->sai.fsync_rate;
+		channels->min = private->dai_config->sai.tdm_slots;
+		channels->max = private->dai_config->sai.tdm_slots;
+
+		dev_dbg(component->dev, "rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev, "channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_AMD_BT:
+		rate->min = private->dai_config->acpbt.fsync_rate;
+		rate->max = private->dai_config->acpbt.fsync_rate;
+		channels->min = private->dai_config->acpbt.tdm_slots;
+		channels->max = private->dai_config->acpbt.tdm_slots;
+
+		dev_dbg(component->dev,
+			"AMD_BT rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev, "AMD_BT channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_AMD_SP:
+		rate->min = private->dai_config->acpsp.fsync_rate;
+		rate->max = private->dai_config->acpsp.fsync_rate;
+		channels->min = private->dai_config->acpsp.tdm_slots;
+		channels->max = private->dai_config->acpsp.tdm_slots;
+
+		dev_dbg(component->dev,
+			"AMD_SP rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev, "AMD_SP channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_AMD_DMIC:
+		rate->min = private->dai_config->acpdmic.fsync_rate;
+		rate->max = private->dai_config->acpdmic.fsync_rate;
+		channels->min = private->dai_config->acpdmic.tdm_slots;
+		channels->max = private->dai_config->acpdmic.tdm_slots;
+
+		dev_dbg(component->dev,
+			"AMD_DMIC rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev, "AMD_DMIC channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	default:
+		dev_err(component->dev, "Invalid DAI type %d\n", private->dai_config->type);
+		break;
+	}
+
+	return 0;
+}
+
 const struct sof_ipc_pcm_ops ipc3_pcm_ops = {
 	.hw_params = sof_ipc3_pcm_hw_params,
 	.hw_free = sof_ipc3_pcm_hw_free,
 	.trigger = sof_ipc3_pcm_trigger,
+	.dai_link_fixup = sof_ipc3_pcm_dai_link_fixup,
 };
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index dc55a04a1588..658cd8966c9a 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -556,33 +556,6 @@ static int sof_pcm_new(struct snd_soc_component *component,
 	return 0;
 }
 
-static void ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const char *link_name,
-					    struct snd_pcm_hw_params *params)
-{
-	struct sof_ipc_dai_config *config;
-	struct snd_sof_dai *dai;
-	int i;
-
-	/*
-	 * Search for all matching DAIs as we can have both playback and capture DAI
-	 * associated with the same link.
-	 */
-	list_for_each_entry(dai, &sdev->dai_list, list) {
-		if (!dai->name || strcmp(link_name, dai->name))
-			continue;
-		for (i = 0; i < dai->number_configs; i++) {
-			struct sof_dai_private_data *private = dai->private;
-
-			config = &private->dai_config[i];
-			if (config->ssp.fsync_rate == params_rate(params)) {
-				dev_dbg(sdev->dev, "DAI config %d matches pcm hw params\n", i);
-				dai->current_config = i;
-				break;
-			}
-		}
-	}
-}
-
 /* fixup the BE DAI link to match any values from topology */
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params)
 {
@@ -596,8 +569,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct sof_dai_private_data *private = dai->private;
-	struct snd_soc_dpcm *dpcm;
+	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
 
 	/* no topology exists for this BE, try a common configuration */
 	if (!dai) {
@@ -618,148 +590,8 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		return 0;
 	}
 
-	/* read format from topology */
-	snd_mask_none(fmt);
-
-	switch (private->comp_dai->config.frame_fmt) {
-	case SOF_IPC_FRAME_S16_LE:
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
-		break;
-	case SOF_IPC_FRAME_S24_4LE:
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-		break;
-	case SOF_IPC_FRAME_S32_LE:
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
-		break;
-	default:
-		dev_err(component->dev, "error: No available DAI format!\n");
-		return -EINVAL;
-	}
-
-	/* read rate and channels from topology */
-	switch (private->dai_config->type) {
-	case SOF_DAI_INTEL_SSP:
-		/* search for config to pcm params match, if not found use default */
-		ssp_dai_config_pcm_params_match(sdev, (char *)rtd->dai_link->name, params);
-
-		rate->min = private->dai_config[dai->current_config].ssp.fsync_rate;
-		rate->max = private->dai_config[dai->current_config].ssp.fsync_rate;
-		channels->min = private->dai_config[dai->current_config].ssp.tdm_slots;
-		channels->max = private->dai_config[dai->current_config].ssp.tdm_slots;
-
-		dev_dbg(component->dev,
-			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
-		dev_dbg(component->dev,
-			"channels_min: %d channels_max: %d\n",
-			channels->min, channels->max);
-
-		break;
-	case SOF_DAI_INTEL_DMIC:
-		/* DMIC only supports 16 or 32 bit formats */
-		if (private->comp_dai->config.frame_fmt == SOF_IPC_FRAME_S24_4LE) {
-			dev_err(component->dev,
-				"error: invalid fmt %d for DAI type %d\n",
-				private->comp_dai->config.frame_fmt,
-				private->dai_config->type);
-		}
-		break;
-	case SOF_DAI_INTEL_HDA:
-		/*
-		 * HDAudio does not follow the default trigger
-		 * sequence due to firmware implementation
-		 */
-		for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm) {
-			struct snd_soc_pcm_runtime *fe = dpcm->fe;
-
-			fe->dai_link->trigger[SNDRV_PCM_STREAM_PLAYBACK] =
-				SND_SOC_DPCM_TRIGGER_POST;
-		}
-		break;
-	case SOF_DAI_INTEL_ALH:
-		/*
-		 * Dai could run with different channel count compared with
-		 * front end, so get dai channel count from topology
-		 */
-		channels->min = private->dai_config->alh.channels;
-		channels->max = private->dai_config->alh.channels;
-		break;
-	case SOF_DAI_IMX_ESAI:
-		rate->min = private->dai_config->esai.fsync_rate;
-		rate->max = private->dai_config->esai.fsync_rate;
-		channels->min = private->dai_config->esai.tdm_slots;
-		channels->max = private->dai_config->esai.tdm_slots;
-
-		dev_dbg(component->dev,
-			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
-		dev_dbg(component->dev,
-			"channels_min: %d channels_max: %d\n",
-			channels->min, channels->max);
-		break;
-	case SOF_DAI_MEDIATEK_AFE:
-		rate->min = private->dai_config->afe.rate;
-		rate->max = private->dai_config->afe.rate;
-		channels->min = private->dai_config->afe.channels;
-		channels->max = private->dai_config->afe.channels;
-
-		dev_dbg(component->dev,
-			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
-		dev_dbg(component->dev,
-			"channels_min: %d channels_max: %d\n",
-			channels->min, channels->max);
-		break;
-	case SOF_DAI_IMX_SAI:
-		rate->min = private->dai_config->sai.fsync_rate;
-		rate->max = private->dai_config->sai.fsync_rate;
-		channels->min = private->dai_config->sai.tdm_slots;
-		channels->max = private->dai_config->sai.tdm_slots;
-
-		dev_dbg(component->dev,
-			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
-		dev_dbg(component->dev,
-			"channels_min: %d channels_max: %d\n",
-			channels->min, channels->max);
-		break;
-	case SOF_DAI_AMD_BT:
-		rate->min = private->dai_config->acpbt.fsync_rate;
-		rate->max = private->dai_config->acpbt.fsync_rate;
-		channels->min = private->dai_config->acpbt.tdm_slots;
-		channels->max = private->dai_config->acpbt.tdm_slots;
-
-		dev_dbg(component->dev,
-			"AMD_BT rate_min: %d rate_max: %d\n", rate->min, rate->max);
-		dev_dbg(component->dev,
-			"AMD_BT channels_min: %d channels_max: %d\n",
-			channels->min, channels->max);
-		break;
-	case SOF_DAI_AMD_SP:
-		rate->min = private->dai_config->acpsp.fsync_rate;
-		rate->max = private->dai_config->acpsp.fsync_rate;
-		channels->min = private->dai_config->acpsp.tdm_slots;
-		channels->max = private->dai_config->acpsp.tdm_slots;
-
-		dev_dbg(component->dev,
-			"AMD_SP rate_min: %d rate_max: %d\n", rate->min, rate->max);
-		dev_dbg(component->dev,
-			"AMD_SP channels_min: %d channels_max: %d\n",
-			channels->min, channels->max);
-		break;
-	case SOF_DAI_AMD_DMIC:
-		rate->min = private->dai_config->acpdmic.fsync_rate;
-		rate->max = private->dai_config->acpdmic.fsync_rate;
-		channels->min = private->dai_config->acpdmic.tdm_slots;
-		channels->max = private->dai_config->acpdmic.tdm_slots;
-
-		dev_dbg(component->dev,
-			"AMD_DMIC rate_min: %d rate_max: %d\n", rate->min, rate->max);
-		dev_dbg(component->dev,
-			"AMD_DMIC channels_min: %d channels_max: %d\n",
-			channels->min, channels->max);
-		break;
-	default:
-		dev_err(component->dev, "error: invalid DAI type %d\n",
-			private->dai_config->type);
-		break;
-	}
+	if (pcm_ops->dai_link_fixup)
+		return pcm_ops->dai_link_fixup(rtd, params);
 
 	return 0;
 }
-- 
2.25.1


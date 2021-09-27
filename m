Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6064A4193DB
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 14:09:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF86416BB;
	Mon, 27 Sep 2021 14:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF86416BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632744571;
	bh=pEhYkOGak99s0gMhzRN874fiK+L8XRXsw3xzuGUe48M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AsUNdr4Rx/RfRYrEVJQrSCyXN7jNtayNvotNBkYmjh3FXTq5Dx66rDbjZ1lPYX9+8
	 NLuz7B+TD39Ihs/wQndcyRvA62+q0GuXQTsRFP4KVRK7kV14KIRDaoM87QIwzxGinH
	 Q2TXZBs2TW09uEE7COtIxuyNEGAUYPxdul+RaCO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F7C3F8051C;
	Mon, 27 Sep 2021 14:05:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0162F80511; Mon, 27 Sep 2021 14:05:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28785F804ED
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 14:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28785F804ED
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="221260519"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="221260519"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553164455"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.251.220.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH v3 10/12] ASoC: SOF: Intel: hda: make sure DAI widget is set
 up before IPC
Date: Mon, 27 Sep 2021 15:05:15 +0300
Message-Id: <20210927120517.20505-11-peter.ujfalusi@linux.intel.com>
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

With the implementation of the dynamic pipeline feature, widgets
will only be setup when a PCM is opened during the
hw_params ioctl. The BE hw_params callback is responsible for
sending the DAI_CONFIG for the DAI widgets in the DSP.
With dynamic pipelines, the DAI widgets will need to set up
first before sending the DAI_CONFIG IPC in the BE hw_params.

Update the BE hw_params/hw_free callbacks for all ALH, HDA and SSP
DAIs to set up/free the DAI widget before/after DAI_CONFIG IPC.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 174 ++++++++++++++++++++-------------
 sound/soc/sof/intel/hda.c     | 177 +++++++++++++++++++++++++---------
 sound/soc/sof/intel/hda.h     |   5 +
 sound/soc/sof/sof-audio.c     |   1 +
 sound/soc/sof/sof-audio.h     |   2 +-
 sound/soc/sof/topology.c      |   3 -
 6 files changed, 243 insertions(+), 119 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 2f54a659b78a..59d6750c6a20 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -155,49 +155,68 @@ static int hda_link_dma_params(struct hdac_ext_stream *stream,
 	return 0;
 }
 
-/* Send DAI_CONFIG IPC to the DAI that matches the dai_name and direction */
-static int hda_link_config_ipc(struct sof_intel_hda_stream *hda_stream,
-			       const char *dai_name, int channel, int dir)
+/* Update config for the DAI widget */
+static struct sof_ipc_dai_config *hda_dai_update_config(struct snd_soc_dapm_widget *w,
+							int channel)
 {
+	struct snd_sof_widget *swidget = w->dobj.private;
 	struct sof_ipc_dai_config *config;
 	struct snd_sof_dai *sof_dai;
-	struct sof_ipc_reply reply;
-	int ret = 0;
 
-	list_for_each_entry(sof_dai, &hda_stream->sdev->dai_list, list) {
-		if (!sof_dai->cpu_dai_name)
-			continue;
+	if (!swidget)
+		return NULL;
 
-		if (!strcmp(dai_name, sof_dai->cpu_dai_name) &&
-		    dir == sof_dai->comp_dai.direction) {
-			config = sof_dai->dai_config;
+	sof_dai = swidget->private;
 
-			if (!config) {
-				dev_err(hda_stream->sdev->dev,
-					"error: no config for DAI %s\n",
-					sof_dai->name);
-				return -EINVAL;
-			}
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(swidget->scomp->dev, "error: No config for DAI %s\n", w->name);
+		return NULL;
+	}
 
-			/* update config with stream tag */
-			config->hda.link_dma_ch = channel;
+	config = &sof_dai->dai_config[sof_dai->current_config];
 
-			/* send IPC */
-			ret = sof_ipc_tx_message(hda_stream->sdev->ipc,
-						 config->hdr.cmd,
-						 config,
-						 config->hdr.size,
-						 &reply, sizeof(reply));
+	/* update config with stream tag */
+	config->hda.link_dma_ch = channel;
 
-			if (ret < 0)
-				dev_err(hda_stream->sdev->dev,
-					"error: failed to set dai config for %s\n",
-					sof_dai->name);
-			return ret;
-		}
+	return config;
+}
+
+static int hda_link_config_ipc(struct sof_intel_hda_stream *hda_stream,
+			       struct snd_soc_dapm_widget *w, int channel)
+{
+	struct snd_sof_dev *sdev = hda_stream->sdev;
+	struct sof_ipc_dai_config *config;
+	struct sof_ipc_reply reply;
+
+	config = hda_dai_update_config(w, channel);
+	if (!config) {
+		dev_err(sdev->dev, "error: no config for DAI %s\n", w->name);
+		return -ENOENT;
+	}
+
+	/* send DAI_CONFIG IPC */
+	return sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				  &reply, sizeof(reply));
+}
+
+static int hda_link_dai_widget_update(struct sof_intel_hda_stream *hda_stream,
+				      struct snd_soc_dapm_widget *w,
+				      int channel, bool widget_setup)
+{
+	struct snd_sof_dev *sdev = hda_stream->sdev;
+	struct sof_ipc_dai_config *config;
+
+	config = hda_dai_update_config(w, channel);
+	if (!config) {
+		dev_err(sdev->dev, "error: no config for DAI %s\n", w->name);
+		return -ENOENT;
 	}
 
-	return -EINVAL;
+	/* set up/free DAI widget and send DAI_CONFIG IPC */
+	if (widget_setup)
+		return hda_ctrl_dai_widget_setup(w);
+
+	return hda_ctrl_dai_widget_free(w);
 }
 
 static int hda_link_hw_params(struct snd_pcm_substream *substream,
@@ -211,6 +230,7 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct sof_intel_hda_stream *hda_stream;
 	struct hda_pipe_params p_params = {0};
+	struct snd_soc_dapm_widget *w;
 	struct hdac_ext_link *link;
 	int stream_tag;
 	int ret;
@@ -229,9 +249,13 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 
 	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
-	/* update the DSP with the new tag */
-	ret = hda_link_config_ipc(hda_stream, dai->name, stream_tag - 1,
-				  substream->stream);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = dai->playback_widget;
+	else
+		w = dai->capture_widget;
+
+	/* set up the DAI widget and send the DAI_CONFIG with the new tag */
+	ret = hda_link_dai_widget_update(hda_stream, w, stream_tag - 1, true);
 	if (ret < 0)
 		return ret;
 
@@ -287,6 +311,7 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 				snd_soc_dai_get_dma_data(dai, substream);
 	struct sof_intel_hda_stream *hda_stream;
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dapm_widget *w;
 	struct hdac_ext_link *link;
 	struct hdac_stream *hstream;
 	struct hdac_bus *bus;
@@ -321,12 +346,16 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			w = dai->playback_widget;
+		else
+			w = dai->capture_widget;
+
 		/*
 		 * clear link DMA channel. It will be assigned when
 		 * hw_params is set up again after resume.
 		 */
-		ret = hda_link_config_ipc(hda_stream, dai->name,
-					  DMA_CHAN_INVALID, substream->stream);
+		ret = hda_link_config_ipc(hda_stream, w, DMA_CHAN_INVALID);
 		if (ret < 0)
 			return ret;
 
@@ -357,6 +386,7 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	struct hdac_stream *hstream;
 	struct snd_soc_pcm_runtime *rtd;
 	struct hdac_ext_stream *link_dev;
+	struct snd_soc_dapm_widget *w;
 	int ret;
 
 	hstream = substream->runtime->private_data;
@@ -372,9 +402,13 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 
 	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
-	/* free the link DMA channel in the FW */
-	ret = hda_link_config_ipc(hda_stream, dai->name, DMA_CHAN_INVALID,
-				  substream->stream);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = dai->playback_widget;
+	else
+		w = dai->capture_widget;
+
+	/* free the link DMA channel in the FW and the DAI widget */
+	ret = hda_link_dai_widget_update(hda_stream, w, DMA_CHAN_INVALID, false);
 	if (ret < 0)
 		return ret;
 
@@ -406,47 +440,51 @@ static const struct snd_soc_dai_ops hda_link_dai_ops = {
 
 #endif
 
-static int ssp_dai_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params,
-			     struct snd_soc_dai *dai)
+static int ssp_dai_setup_or_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
+				 bool setup)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
-	struct sof_ipc_dai_config *config;
-	struct snd_sof_dai *sof_dai;
-	struct sof_ipc_reply reply;
-	int ret;
+	struct snd_soc_component *component;
+	struct snd_sof_widget *swidget;
+	struct snd_soc_dapm_widget *w;
+	struct sof_ipc_fw_version *v;
+	struct snd_sof_dev *sdev;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = dai->playback_widget;
+	else
+		w = dai->capture_widget;
+
+	swidget = w->dobj.private;
+	component = swidget->scomp;
+	sdev = snd_soc_component_get_drvdata(component);
+	v = &sdev->fw_ready.version;
 
 	/* DAI_CONFIG IPC during hw_params is not supported in older firmware */
 	if (v->abi_version < SOF_ABI_VER(3, 18, 0))
 		return 0;
 
-	list_for_each_entry(sof_dai, &sdev->dai_list, list) {
-		if (!sof_dai->cpu_dai_name || !sof_dai->dai_config)
-			continue;
-
-		if (!strcmp(dai->name, sof_dai->cpu_dai_name) &&
-		    substream->stream == sof_dai->comp_dai.direction) {
-			config = &sof_dai->dai_config[sof_dai->current_config];
+	if (setup)
+		return hda_ctrl_dai_widget_setup(w);
 
-			/* send IPC */
-			ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config,
-						 config->hdr.size, &reply, sizeof(reply));
+	return hda_ctrl_dai_widget_free(w);
+}
 
-			if (ret < 0)
-				dev_err(sdev->dev, "error: failed to set DAI config for %s\n",
-					sof_dai->name);
-			return ret;
-		}
-	}
+static int ssp_dai_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	return ssp_dai_setup_or_free(substream, dai, true);
+}
 
-	return 0;
+static int ssp_dai_hw_free(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	return ssp_dai_setup_or_free(substream, dai, false);
 }
 
 static const struct snd_soc_dai_ops ssp_dai_ops = {
 	.hw_params = ssp_dai_hw_params,
+	.hw_free = ssp_dai_hw_free,
 };
 
 /*
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c11e4c14d875..8e2613a7ea9d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -52,6 +52,86 @@ static const struct sof_intel_dsp_desc
 	return chip_info;
 }
 
+int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	sof_dai = swidget->private;
+
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(sdev->dev, "No config for DAI %s\n", w->name);
+		return -EINVAL;
+	}
+
+	config = &sof_dai->dai_config[sof_dai->current_config];
+
+	/*
+	 * For static pipelines, the DAI widget would already be set up and calling
+	 * sof_widget_setup() simply returns without doing anything.
+	 * For dynamic pipelines, the DAI widget will be set up now.
+	 */
+	ret = sof_widget_setup(sdev, swidget);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed setting up DAI widget %s\n", w->name);
+		return ret;
+	}
+
+	/* send DAI_CONFIG IPC */
+	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				 &reply, sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed setting DAI config for %s\n", w->name);
+		return ret;
+	}
+
+	sof_dai->configured = true;
+
+	return 0;
+}
+
+int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	sof_dai = swidget->private;
+
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(sdev->dev, "error: No config to free DAI %s\n", w->name);
+		return -EINVAL;
+	}
+
+	/* nothing to do if hw_free() is called without restarting the stream after resume. */
+	if (!sof_dai->configured)
+		return 0;
+
+	config = &sof_dai->dai_config[sof_dai->current_config];
+
+	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				 &reply, sizeof(reply));
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed resetting DAI config for %s\n", w->name);
+
+	/*
+	 * Reset the configured_flag and free the widget even if the IPC fails to keep
+	 * the widget use_count balanced
+	 */
+	sof_dai->configured = false;
+
+	return sof_widget_free(sdev, swidget);
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
@@ -64,67 +144,70 @@ static int sdw_clock_stop_quirks = SDW_INTEL_CLK_STOP_BUS_RESET;
 module_param(sdw_clock_stop_quirks, int, 0444);
 MODULE_PARM_DESC(sdw_clock_stop_quirks, "SOF SoundWire clock stop quirks");
 
+static int sdw_dai_config_ipc(struct snd_sof_dev *sdev,
+			      struct snd_soc_dapm_widget *w,
+			      int link_id, int alh_stream_id, int dai_id, bool setup)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+
+	if (!swidget) {
+		dev_err(sdev->dev, "error: No private data for widget %s\n", w->name);
+		return -EINVAL;
+	}
+
+	sof_dai = swidget->private;
+
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(sdev->dev, "error: No config for DAI %s\n", w->name);
+		return -EINVAL;
+	}
+
+	config = &sof_dai->dai_config[sof_dai->current_config];
+
+	/* update config with link and stream ID */
+	config->dai_index = (link_id << 8) | dai_id;
+	config->alh.stream_id = alh_stream_id;
+
+	if (setup)
+		return hda_ctrl_dai_widget_setup(w);
+
+	return hda_ctrl_dai_widget_free(w);
+}
+
 static int sdw_params_stream(struct device *dev,
 			     struct sdw_intel_stream_params_data *params_data)
 {
+	struct snd_pcm_substream *substream = params_data->substream;
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_soc_dai *d = params_data->dai;
-	struct sof_ipc_dai_config config;
-	struct sof_ipc_reply reply;
-	int link_id = params_data->link_id;
-	int alh_stream_id = params_data->alh_stream_id;
-	int ret;
-	u32 size = sizeof(config);
-
-	memset(&config, 0, size);
-	config.hdr.size = size;
-	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
-	config.type = SOF_DAI_INTEL_ALH;
-	config.dai_index = (link_id << 8) | (d->id);
-	config.alh.stream_id = alh_stream_id;
-
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config.hdr.cmd, &config, size, &reply,
-				 sizeof(reply));
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to set DAI hw_params for link %d dai->id %d ALH %d\n",
-			link_id, d->id, alh_stream_id);
-	}
+	struct snd_soc_dapm_widget *w;
 
-	return ret;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = d->playback_widget;
+	else
+		w = d->capture_widget;
+
+	return sdw_dai_config_ipc(sdev, w, params_data->link_id, params_data->alh_stream_id,
+				  d->id, true);
 }
 
 static int sdw_free_stream(struct device *dev,
 			   struct sdw_intel_stream_free_data *free_data)
 {
+	struct snd_pcm_substream *substream = free_data->substream;
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_soc_dai *d = free_data->dai;
-	struct sof_ipc_dai_config config;
-	struct sof_ipc_reply reply;
-	int link_id = free_data->link_id;
-	int ret;
-	u32 size = sizeof(config);
-
-	memset(&config, 0, size);
-	config.hdr.size = size;
-	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
-	config.type = SOF_DAI_INTEL_ALH;
-	config.dai_index = (link_id << 8) | d->id;
-	config.alh.stream_id = 0xFFFF; /* invalid value on purpose */
-
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config.hdr.cmd, &config, size, &reply,
-				 sizeof(reply));
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to free stream for link %d dai->id %d\n",
-			link_id, d->id);
-	}
+	struct snd_soc_dapm_widget *w;
 
-	return ret;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = d->playback_widget;
+	else
+		w = d->capture_widget;
+
+	/* send invalid stream_id */
+	return sdw_dai_config_ipc(sdev, w, free_data->link_id, 0xFFFF, d->id, false);
 }
 
 static const struct sdw_intel_ops sdw_callback = {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 087fa06d5210..9da8ba0ed38d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -733,4 +733,9 @@ void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
 /* PCI driver selection and probe */
 int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id);
 
+struct snd_sof_dai;
+struct sof_ipc_dai_config;
+int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w);
+int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w);
+
 #endif
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 7a4aaabf091e..bf5e7c7019a5 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -163,6 +163,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 			return -ENOMEM;
 
 		dai = swidget->private;
+		dai->configured = false;
 		memcpy(comp, &dai->comp_dai, sizeof(struct sof_ipc_comp_dai));
 
 		/* append extended data to the end of the component */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 6ac623137026..d358d455da1e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -130,11 +130,11 @@ struct snd_sof_route {
 struct snd_sof_dai {
 	struct snd_soc_component *scomp;
 	const char *name;
-	const char *cpu_dai_name;
 
 	struct sof_ipc_comp_dai comp_dai;
 	int number_configs;
 	int current_config;
+	bool configured; /* DAI configured during BE hw_params */
 	struct sof_ipc_dai_config *dai_config;
 	struct list_head list;	/* list in sdev dai list */
 };
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b996b89f2920..d8eb238e5229 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2756,9 +2756,6 @@ static int sof_set_dai_config_multi(struct snd_sof_dev *sdev, u32 size,
 			if (!dai->dai_config)
 				return -ENOMEM;
 
-			/* set cpu_dai_name */
-			dai->cpu_dai_name = link->cpus->dai_name;
-
 			found = 1;
 		}
 	}
-- 
2.33.0


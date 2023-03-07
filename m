Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1716AE1C5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F5F6146F;
	Tue,  7 Mar 2023 15:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F5F6146F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198152;
	bh=dnZTrr18N4eRIdsKsc8gY6H8GnpS3L7/dEmm9cCH2KA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DeVmJUUA8VPrSoQqh6vnWdbF73bmW2OWALPEC1Xof9Gqg6lCflMEXLQKAIh9P4CJc
	 VBofu7fOBQh60LQOI3/auQurhPWsvHlH7ZXeSn40otfcrkllJOe6iWdeTGeAfmdKJf
	 2WHmB23TKhdR4pa282Pr5y1PPuz5L9vUc1G2l5is=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE71F805AC;
	Tue,  7 Mar 2023 15:05:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCB9CF80551; Tue,  7 Mar 2023 15:04:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87962F8052E
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87962F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EGL2jjGI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197886; x=1709733886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dnZTrr18N4eRIdsKsc8gY6H8GnpS3L7/dEmm9cCH2KA=;
  b=EGL2jjGIA0/aC7zr2ZBxs1sH6REFC4+SqZtFMX0kPrnPChPUckkmFk00
   6HyhlJex9cfL+b9MFyvyb9ZX6D3948M096kIPJt50JDv8CMZdAPbIfwPh
   3fpp8iE9lEEdNV6nZe1i/xwjfZz4W9aUZStkw94Isj6C43HmvMDCWmKf6
   TbQ/J+XW6u3ACDfg4EXuMSHapfr9B9dDFUatkqeDj/YmXl9FCGz3lt1dK
   YTvMO9iXOcq/Vsq7xg+wA14IZp5eZCGgkQTKCATj2lx/y4pxhXw4/aHNW
   NmMvSXRJpVJSe+H/tucmEBhCv20CeXYukscjIeAHI6sziSuuEHjbJu/rC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255306"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255306"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706992"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706992"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:42 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 12/14] ASoC: SOF: Intel: hda: Unify DAI drv ops for IPC3 and
 IPC4
Date: Tue,  7 Mar 2023 16:04:33 +0200
Message-Id: <20230307140435.2808-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4YRT3NQBXSLQPI6CTRVS6TAWFLSPYMZU
X-Message-ID-Hash: 4YRT3NQBXSLQPI6CTRVS6TAWFLSPYMZU
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YRT3NQBXSLQPI6CTRVS6TAWFLSPYMZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Define the post_trigger DMA op for IPC3 and unify the DAI driver ops for
IPC3 and IPC4 for HDA DAI's.

Also, use the post_trigger op to stop the paused streams properly in the
hda_dai_suspend() function. This fixes the suspend while paused case for
IPC4 because previously we weren't resetting the pipeline when suspending
the system with some paused streams.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c |  25 ++++
 sound/soc/sof/intel/hda-dai.c     | 183 ++++++------------------------
 sound/soc/sof/intel/hda.h         |   2 +
 3 files changed, 62 insertions(+), 148 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 992c31772593..be109f33715f 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -277,12 +277,37 @@ static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
 	.post_trigger = hda_ipc4_post_trigger
 };
 
+static int hda_ipc3_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
+				 struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+	{
+		struct snd_sof_dai_config_data data = { 0 };
+
+		data.dai_data = DMA_CHAN_INVALID;
+		return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_FREE, &data);
+	}
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_PAUSE, NULL);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct hda_dai_widget_dma_ops hda_ipc3_dma_ops = {
 	.get_hext_stream = hda_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
 	.release_hext_stream = hda_release_hext_stream,
 	.setup_hext_stream = hda_setup_hext_stream,
 	.reset_hext_stream = hda_reset_hext_stream,
+	.trigger = hda_trigger,
+	.post_trigger = hda_ipc3_post_trigger,
 };
 
 #endif
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 60c65ce994a0..4ac6148940ae 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -27,10 +27,8 @@ static bool hda_use_tplg_nhlt;
 module_param_named(sof_use_tplg_nhlt, hda_use_tplg_nhlt, bool, 0444);
 MODULE_PARM_DESC(sof_use_tplg_nhlt, "SOF topology nhlt override");
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
-
-static int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
-			  struct snd_sof_dai_config_data *data)
+int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
+		   struct snd_sof_dai_config_data *data)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
 	struct snd_soc_component *component = swidget->scomp;
@@ -50,6 +48,8 @@ static int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+
 static const struct hda_dai_widget_dma_ops *
 hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
@@ -181,44 +181,6 @@ static int hda_link_dma_prepare(struct snd_pcm_substream *substream, struct snd_
 	return hda_link_dma_hw_params(substream, &rtd->dpcm[stream].hw_params, cpu_dai);
 }
 
-static int hda_link_dma_trigger(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai,
-				int cmd)
-{
-	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, cpu_dai);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct hdac_ext_stream *hext_stream;
-	int ret;
-
-	hext_stream = ops->get_hext_stream(sdev, cpu_dai, substream);
-
-	if (!hext_stream)
-		return 0;
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_stream_start(hext_stream);
-		break;
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_STOP:
-		snd_hdac_ext_stream_clear(hext_stream);
-		ret = hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai);
-		if (ret < 0)
-			return ret;
-
-		break;
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		snd_hdac_ext_stream_clear(hext_stream);
-
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
 static int hda_link_dma_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
@@ -239,20 +201,6 @@ static int hda_link_dma_hw_free(struct snd_pcm_substream *substream, struct snd_
 	return hda_link_dma_cleanup(substream, hext_stream, cpu_dai, codec_dai);
 }
 
-static int hda_dai_widget_update(struct snd_soc_dapm_widget *w,
-				 int channel, bool widget_setup)
-{
-	struct snd_sof_dai_config_data data;
-
-	data.dai_data = channel;
-
-	/* set up/free DAI widget and send DAI_CONFIG IPC */
-	if (widget_setup)
-		return hda_ctrl_dai_widget_setup(w, SOF_DAI_CONFIG_FLAGS_2_STEP_STOP, &data);
-
-	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE, &data);
-}
-
 static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
@@ -314,61 +262,11 @@ static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 	return hda_dai_config(w, flags, &data);
 }
 
-static int hda_dai_hw_free_ipc(int stream, /* direction */
-			       struct snd_soc_dai *dai)
-{
-	struct snd_soc_dapm_widget *w;
-
-	w = snd_soc_dai_get_widget(dai, stream);
-
-	/* free the link DMA channel in the FW and the DAI widget */
-	return hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
-}
-
-static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
-				int cmd, struct snd_soc_dai *dai)
-{
-	struct snd_soc_dapm_widget *w;
-	int ret;
-
-	dev_dbg(dai->dev, "cmd=%d dai %s direction %d\n", cmd,
-		dai->name, substream->stream);
-
-	ret = hda_link_dma_trigger(substream, dai, cmd);
-	if (ret < 0)
-		return ret;
-
-	w = snd_soc_dai_get_widget(dai, substream->stream);
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_STOP:
-		/*
-		 * free DAI widget during stop/suspend to keep widget use_count's balanced.
-		 */
-		ret = hda_dai_hw_free_ipc(substream->stream, dai);
-		if (ret < 0)
-			return ret;
-
-		break;
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_PAUSE, NULL);
-		if (ret < 0)
-			return ret;
-		break;
-
-	default:
-		break;
-	}
-	return 0;
-}
-
 /*
  * In contrast to IPC3, the dai trigger in IPC4 mixes pipeline state changes
  * (over IPC channel) and DMA state change (direct host register changes).
  */
-static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
-				int cmd, struct snd_soc_dai *dai)
+static int hda_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
@@ -437,10 +335,10 @@ static int hda_dai_hw_free(struct snd_pcm_substream *substream,
 	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_FREE, &data);
 }
 
-static const struct snd_soc_dai_ops ipc3_hda_dai_ops = {
+static const struct snd_soc_dai_ops hda_dai_ops = {
 	.hw_params = hda_dai_hw_params,
 	.hw_free = hda_dai_hw_free,
-	.trigger = ipc3_hda_dai_trigger,
+	.trigger = hda_dai_trigger,
 	.prepare = hda_dai_prepare,
 };
 
@@ -463,12 +361,22 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 		 * explicitly during suspend.
 		 */
 		if (hext_stream->link_substream) {
-			struct snd_soc_dai *cpu_dai;
+			const struct hda_dai_widget_dma_ops *ops;
+			struct snd_sof_widget *swidget;
+			struct snd_soc_dapm_widget *w;
 			struct snd_soc_dai *codec_dai;
+			struct snd_soc_dai *cpu_dai;
+			struct snd_sof_dev *sdev;
+			struct snd_sof_dai *sdai;
 
 			rtd = asoc_substream_to_rtd(hext_stream->link_substream);
 			cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 			codec_dai = asoc_rtd_to_codec(rtd, 0);
+			w = snd_soc_dai_get_widget(cpu_dai, hdac_stream(hext_stream)->direction);
+			swidget = w->dobj.private;
+			sdev = snd_soc_component_get_drvdata(swidget->scomp);
+			sdai = swidget->private;
+			ops = sdai->platform_private;
 
 			ret = hda_link_dma_cleanup(hext_stream->link_substream,
 						   hext_stream,
@@ -476,60 +384,39 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			if (ret < 0)
 				return ret;
 
-			/* for consistency with TRIGGER_SUSPEND we free DAI resources */
-			ret = hda_dai_hw_free_ipc(hdac_stream(hext_stream)->direction, cpu_dai);
-			if (ret < 0)
-				return ret;
+			/* for consistency with TRIGGER_SUSPEND  */
+			if (ops->post_trigger) {
+				ret = ops->post_trigger(sdev, cpu_dai,
+							hext_stream->link_substream,
+							SNDRV_PCM_TRIGGER_SUSPEND);
+				if (ret < 0)
+					return ret;
+			}
 		}
 	}
 
 	return 0;
 }
 
-static const struct snd_soc_dai_ops ipc4_hda_dai_ops = {
-	.hw_params = hda_dai_hw_params,
-	.hw_free = hda_dai_hw_free,
-	.trigger = ipc4_hda_dai_trigger,
-	.prepare = hda_dai_prepare,
-};
-
 #endif
 
 void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 {
 	int i;
 
-	switch (sdev->pdata->ipc_type) {
-	case SOF_IPC:
-		for (i = 0; i < ops->num_drv; i++) {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
-			if (strstr(ops->drv[i].name, "iDisp") ||
-			    strstr(ops->drv[i].name, "Analog") ||
-			    strstr(ops->drv[i].name, "Digital"))
-				ops->drv[i].ops = &ipc3_hda_dai_ops;
-#endif
-		}
-		break;
-	case SOF_INTEL_IPC4:
-	{
-		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
-
-		for (i = 0; i < ops->num_drv; i++) {
+	for (i = 0; i < ops->num_drv; i++) {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
-			if (strstr(ops->drv[i].name, "iDisp") ||
-			    strstr(ops->drv[i].name, "Analog") ||
-			    strstr(ops->drv[i].name, "Digital"))
-				ops->drv[i].ops = &ipc4_hda_dai_ops;
+		if (strstr(ops->drv[i].name, "iDisp") ||
+		    strstr(ops->drv[i].name, "Analog") ||
+		    strstr(ops->drv[i].name, "Digital"))
+			ops->drv[i].ops = &hda_dai_ops;
 #endif
-		}
+	}
 
-		if (!hda_use_tplg_nhlt)
-			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
+	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4 && !hda_use_tplg_nhlt) {
+		struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 
-		break;
-	}
-	default:
-		break;
+		ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
 	}
 }
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e0469f86fa63..815f73d3acd2 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -962,5 +962,7 @@ struct hda_dai_widget_dma_ops {
 
 const struct hda_dai_widget_dma_ops *
 hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
+int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
+		   struct snd_sof_dai_config_data *data);
 
 #endif
-- 
2.39.2


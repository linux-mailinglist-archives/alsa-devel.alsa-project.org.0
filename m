Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC766AE1C1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:08:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFA6F1484;
	Tue,  7 Mar 2023 15:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFA6F1484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198130;
	bh=yIdjZZw+aJQ2opazcj5mNwhPv540cBvFTpSB43HLE6M=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z6x0QRI41WzKkp81rZDeH1BnGeCHnI+3XAPt+Hoi1JzeWmRmgbnUJ2TjvWaUO4WXi
	 s1VGXMEYIbRKIBgdTLEl3+Op8Vy7wxYD+0a+ViLXZ0apDKEOIWSm5fa64kpPqDBcjT
	 Fw+MmwOoscdbIFa2kCxWgQf0oWpd14CimlE50BMc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 723E7F805AB;
	Tue,  7 Mar 2023 15:05:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E623F80544; Tue,  7 Mar 2023 15:04:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 304F4F8052E
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 304F4F8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eq+J2PNC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197884; x=1709733884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yIdjZZw+aJQ2opazcj5mNwhPv540cBvFTpSB43HLE6M=;
  b=eq+J2PNCUni+yfNwdM7+8EuGMfx/U+wwVYocVUT4fruxsrSlcGdMOFKY
   8kUOCGp9Mnv3e7OcfPNacVW+Jma9f5zFo3SgqTaX1ApyBvUMRuikpPOQY
   50pwqQSgjVpGYeHGdXqdsytxCaMiP5vPJW+n5cayqNEQtbgY2W88QFpoh
   pOGYRtKEn12HB4IKgx/hFLj1XFZlDMqLA5QZTwFee5nBFTJZQEYd1wsMz
   7WrMDCQIAHhUl38zrapK+csYS1JsujLklpTZUxCOkh5bh+wCzyej1EMM3
   74OwxqAIWtwknuuA8roGkqvtwt9AB0sekxd4FiP/S0L2wtT/NhZP23usP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255298"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255298"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706986"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706986"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:40 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 11/14] ASoC: SOF: Intel: hda-dai: Define DAI widget DMA
 trigger ops for IPC4
Date: Tue,  7 Mar 2023 16:04:32 +0200
Message-Id: <20230307140435.2808-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FAA63PYEO644H6NQWTQYB66ECQ6OI6GF
X-Message-ID-Hash: FAA63PYEO644H6NQWTQYB66ECQ6OI6GF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAA63PYEO644H6NQWTQYB66ECQ6OI6GF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Define and use the SOF widget's DMA pre_trigger/trigger/post_trigger ops in
ipc4_hda_dai_trigger().

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 128 +++++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda-dai.c     |  62 ++++-----------
 2 files changed, 139 insertions(+), 51 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 57db589906db..992c31772593 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -155,7 +155,129 @@ static void hda_reset_hext_stream(struct snd_sof_dev *sdev, struct hdac_ext_stre
 	snd_hdac_ext_stream_reset(hext_stream);
 }
 
-static const struct hda_dai_widget_dma_ops hda_dma_ops = {
+static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
+				struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_sof_widget *pipe_widget;
+	struct sof_ipc4_pipeline *pipeline;
+	struct snd_sof_widget *swidget;
+	struct snd_soc_dapm_widget *w;
+	int ret;
+
+	w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	swidget = w->dobj.private;
+	pipe_widget = swidget->spipe->pipe_widget;
+	pipeline = pipe_widget->private;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
+						  SOF_IPC4_PIPE_PAUSED);
+		if (ret < 0)
+			return ret;
+
+		pipeline->state = SOF_IPC4_PIPE_PAUSED;
+		break;
+	default:
+		dev_err(sdev->dev, "unknown trigger command %d\n", cmd);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hda_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
+		       struct snd_pcm_substream *substream, int cmd)
+{
+	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_hdac_ext_stream_start(hext_stream);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		snd_hdac_ext_stream_clear(hext_stream);
+		break;
+	default:
+		dev_err(sdev->dev, "unknown trigger command %d\n", cmd);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
+				 struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_sof_widget *pipe_widget;
+	struct sof_ipc4_pipeline *pipeline;
+	struct snd_sof_widget *swidget;
+	struct snd_soc_dapm_widget *w;
+	int ret;
+
+	w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	swidget = w->dobj.private;
+	pipe_widget = swidget->spipe->pipe_widget;
+	pipeline = pipe_widget->private;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (pipeline->state != SOF_IPC4_PIPE_PAUSED) {
+			ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
+							  SOF_IPC4_PIPE_PAUSED);
+			if (ret < 0)
+				return ret;
+			pipeline->state = SOF_IPC4_PIPE_PAUSED;
+		}
+
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
+						  SOF_IPC4_PIPE_RUNNING);
+		if (ret < 0)
+			return ret;
+		pipeline->state = SOF_IPC4_PIPE_RUNNING;
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+	{
+		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
+						  SOF_IPC4_PIPE_RESET);
+		if (ret < 0)
+			return ret;
+
+		pipeline->state = SOF_IPC4_PIPE_RESET;
+		break;
+	}
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		break;
+	default:
+		dev_err(sdev->dev, "unknown trigger command %d\n", cmd);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
+	.get_hext_stream = hda_get_hext_stream,
+	.assign_hext_stream = hda_assign_hext_stream,
+	.release_hext_stream = hda_release_hext_stream,
+	.setup_hext_stream = hda_setup_hext_stream,
+	.reset_hext_stream = hda_reset_hext_stream,
+	.pre_trigger = hda_ipc4_pre_trigger,
+	.trigger = hda_trigger,
+	.post_trigger = hda_ipc4_post_trigger
+};
+
+static const struct hda_dai_widget_dma_ops hda_ipc3_dma_ops = {
 	.get_hext_stream = hda_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
 	.release_hext_stream = hda_release_hext_stream,
@@ -177,7 +299,7 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 		struct sof_dai_private_data *private = sdai->private;
 
 		if (private->dai_config->type == SOF_DAI_INTEL_HDA)
-			return &hda_dma_ops;
+			return &hda_ipc3_dma_ops;
 		break;
 	}
 	case SOF_INTEL_IPC4:
@@ -185,7 +307,7 @@ hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidg
 		struct sof_ipc4_copier *ipc4_copier = sdai->private;
 
 		if (ipc4_copier->dai_type == SOF_DAI_INTEL_HDA)
-			return &hda_dma_ops;
+			return &hda_ipc4_dma_ops;
 		break;
 	}
 	default:
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index b726c0225110..60c65ce994a0 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -370,13 +370,9 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 				int cmd, struct snd_soc_dai *dai)
 {
-	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
 	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
-	struct snd_sof_widget *swidget = w->dobj.private;
 	struct hdac_ext_stream *hext_stream;
-	struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
-	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *codec_dai;
 	int ret;
@@ -391,65 +387,35 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 	rtd = asoc_substream_to_rtd(substream);
 	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_stream_start(hext_stream);
-		if (pipeline->state != SOF_IPC4_PIPE_PAUSED) {
-			ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
-							  SOF_IPC4_PIPE_PAUSED);
-			if (ret < 0)
-				return ret;
-			pipeline->state = SOF_IPC4_PIPE_PAUSED;
-		}
-
-		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
-						  SOF_IPC4_PIPE_RUNNING);
+	if (ops->pre_trigger) {
+		ret = ops->pre_trigger(sdev, dai, substream, cmd);
 		if (ret < 0)
 			return ret;
-		pipeline->state = SOF_IPC4_PIPE_RUNNING;
-		break;
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_STOP:
-	{
-		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
-						  SOF_IPC4_PIPE_PAUSED);
+	}
+
+	if (ops->trigger) {
+		ret = ops->trigger(sdev, dai, substream, cmd);
 		if (ret < 0)
 			return ret;
+	}
 
-		pipeline->state = SOF_IPC4_PIPE_PAUSED;
-
-		snd_hdac_ext_stream_clear(hext_stream);
-
-		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
-						  SOF_IPC4_PIPE_RESET);
+	if (ops->post_trigger) {
+		ret = ops->post_trigger(sdev, dai, substream, cmd);
 		if (ret < 0)
 			return ret;
+	}
 
-		pipeline->state = SOF_IPC4_PIPE_RESET;
-
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
 		ret = hda_link_dma_cleanup(substream, hext_stream, dai, codec_dai);
 		if (ret < 0) {
 			dev_err(sdev->dev, "%s: failed to clean up link DMA\n", __func__);
 			return ret;
 		}
 		break;
-	}
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-	{
-		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
-						  SOF_IPC4_PIPE_PAUSED);
-		if (ret < 0)
-			return ret;
-
-		pipeline->state = SOF_IPC4_PIPE_PAUSED;
-
-		snd_hdac_ext_stream_clear(hext_stream);
-		break;
-	}
 	default:
-		dev_err(sdev->dev, "%s: unknown trigger command %d\n", __func__, cmd);
-		return -EINVAL;
+		break;
 	}
 
 	return 0;
-- 
2.39.2


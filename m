Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A119650AA05
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FC4216EC;
	Thu, 21 Apr 2022 22:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FC4216EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573305;
	bh=5kkMMwe2u4pR9/gEZGRHZzX++/oq1lXHkwrXU7hnNgQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oB79MN0bP4jNO8whGPnX6S6sj0x5326NSDq3xJsKjV5VN2br2Tlucs8iSqEWseyl/
	 tSLGLvxz8sgAa1iWPlLFt50ncmx+bowGeN6wOeSyE6ADEFdvXsGEbbcVu/xN7pOMUD
	 fn+gXAtSXM6S9jaaYYZ5FbGFEWdR4AHHdedHFiWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7C85F80508;
	Thu, 21 Apr 2022 22:33:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B925CF8053C; Thu, 21 Apr 2022 22:32:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EA1EF80508
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EA1EF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eiuktKLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573164; x=1682109164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5kkMMwe2u4pR9/gEZGRHZzX++/oq1lXHkwrXU7hnNgQ=;
 b=eiuktKLLVuDtj27yq9qO0ndx5+25qb4kQJdVdAd9DGs0ARLZqdHh9FId
 XF6Cibj/+wxiwNMyU3A0O2jxL+eXvjm4Wum85JL7F3ORUxCoNul4lmUJ0
 iea/qDNMo5eId6RynexxQppz5O/rsLZ3tILmJfKrCCX63yPzR93/fNkch
 4pz5R6BhYFK4Si86qIbwsbBsMiqdsNl21jD2vNYoTlOQsAlKpHo7SfGBp
 N3LE7tuQp0+EWrQVRNn70VE3rlsQVio9oCe+1031ek8eL9ciulO3IDCUK
 HxJR5yPwzsmPnM8kyG/dxnSHGq6ALz9zZx7TyYlm1WnQ+3rouvf/PJk80 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047614"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047614"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455777"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/14] ASoC: SOF: Intel: hda-dai: split link DMA and dai
 operations
Date: Thu, 21 Apr 2022 15:31:53 -0500
Message-Id: <20220421203201.1550328-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The link DMA state management is handled completely on the host side,
while the DAI operations require an IPC. Split the first part in
dedicated helpers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 220 +++++++++++++++++++++-------------
 1 file changed, 138 insertions(+), 82 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 245009809894b..d5ca5b1fefe67 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -176,40 +176,28 @@ static int hda_dai_widget_update(struct snd_soc_dapm_widget *w,
 	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE, &data);
 }
 
-static int hda_dai_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params,
-			     struct snd_soc_dai *dai)
+static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
 {
 	struct hdac_stream *hstream = substream->runtime->private_data;
-	struct hdac_bus *bus = hstream->bus;
 	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hda_pipe_params p_params = {0};
-	struct snd_soc_dapm_widget *w;
+	struct hdac_bus *bus = hstream->bus;
 	struct hdac_ext_link *link;
-	int stream_tag;
-	int ret;
 
 	/* get stored dma data if resuming from system suspend */
-	hext_stream = snd_soc_dai_get_dma_data(dai, substream);
+	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
 	if (!hext_stream) {
 		hext_stream = hda_link_stream_assign(bus, substream);
 		if (!hext_stream)
 			return -EBUSY;
 
-		snd_soc_dai_set_dma_data(dai, substream, (void *)hext_stream);
+		snd_soc_dai_set_dma_data(cpu_dai, substream, (void *)hext_stream);
 	}
 
-	stream_tag = hdac_stream(hext_stream)->stream_tag;
-
-	w = snd_soc_dai_get_widget(dai, substream->stream);
-
-	/* set up the DAI widget and send the DAI_CONFIG with the new tag */
-	ret = hda_dai_widget_update(w, stream_tag - 1, true);
-	if (ret < 0)
-		return ret;
-
 	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
 	if (!link)
 		return -EINVAL;
@@ -232,23 +220,45 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 	return hda_link_dma_params(hext_stream, &p_params);
 }
 
-static int hda_dai_prepare(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
+static int hda_dai_hw_params_update(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params,
+				    struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *hext_stream =
-				snd_soc_dai_get_dma_data(dai, substream);
-	struct snd_sof_dev *sdev =
-				snd_soc_component_get_drvdata(dai->component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	int stream = substream->stream;
+	struct hdac_ext_stream *hext_stream;
+	struct snd_soc_dapm_widget *w;
+	int stream_tag;
 
-	if (hext_stream->link_prepared)
-		return 0;
+	hext_stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (!hext_stream)
+		return -EINVAL;
+
+	stream_tag = hdac_stream(hext_stream)->stream_tag;
 
-	dev_dbg(sdev->dev, "hda: prepare stream dir %d\n", substream->stream);
+	w = snd_soc_dai_get_widget(dai, substream->stream);
 
-	return hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params,
-				  dai);
+	/* set up the DAI widget and send the DAI_CONFIG with the new tag */
+	return hda_dai_widget_update(w, stream_tag - 1, true);
+}
+
+static int hda_dai_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = hda_link_dma_hw_params(substream, params);
+	if (ret < 0)
+		return ret;
+
+	return hda_dai_hw_params_update(substream, params, dai);
+}
+
+static int hda_link_dma_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	int stream = substream->stream;
+
+	return hda_link_dma_hw_params(substream, &rtd->dpcm[stream].hw_params);
 }
 
 static int hda_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
@@ -269,31 +279,44 @@ static int hda_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 	return ret;
 }
 
-static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
-				int cmd, struct snd_soc_dai *dai)
+static int ipc3_hda_dai_prepare(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
 {
 	struct hdac_ext_stream *hext_stream =
 				snd_soc_dai_get_dma_data(dai, substream);
-	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dapm_widget *w;
-	struct hdac_ext_link *link;
-	struct hdac_stream *hstream;
-	struct hdac_bus *bus;
-	int stream_tag;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	int stream = substream->stream;
 	int ret;
 
-	hstream = substream->runtime->private_data;
-	bus = hstream->bus;
-	rtd = asoc_substream_to_rtd(substream);
+	if (hext_stream->link_prepared)
+		return 0;
 
-	link = snd_hdac_ext_bus_get_link(bus, asoc_rtd_to_codec(rtd, 0)->component->name);
-	if (!link)
-		return -EINVAL;
+	dev_dbg(sdev->dev, "%s: prepare stream dir %d\n", __func__, substream->stream);
 
-	dev_dbg(dai->dev, "In %s cmd=%d\n", __func__, cmd);
+	ret = hda_link_dma_prepare(substream);
+	if (ret < 0)
+		return ret;
 
-	w = snd_soc_dai_get_widget(dai, substream->stream);
+	return hda_dai_hw_params_update(substream, &rtd->dpcm[stream].hw_params, dai);
+}
+
+static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
+	struct hdac_ext_link *link;
+	struct hdac_bus *bus = hstream->bus;
+	int stream_tag;
+
+	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	if (!link)
+		return -EINVAL;
 
+	dev_dbg(cpu_dai->dev, "%s: cmd=%d\n", __func__, cmd);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
@@ -303,13 +326,6 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 		snd_hdac_ext_link_stream_clear(hext_stream);
 
-		/*
-		 * free DAI widget during stop/suspend to keep widget use_count's balanced.
-		 */
-		ret = hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
-		if (ret < 0)
-			return ret;
-
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			stream_tag = hdac_stream(hext_stream)->stream_tag;
 			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
@@ -320,50 +336,69 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		snd_hdac_ext_link_stream_clear(hext_stream);
 
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
+				int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_dapm_widget *w;
+	int ret;
+
+	ret = hda_link_dma_trigger(substream, cmd);
+	if (ret < 0)
+		return ret;
+
+	w = snd_soc_dai_get_widget(dai, substream->stream);
+
+	dev_dbg(dai->dev, "%s: cmd=%d\n", __func__, cmd);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		/*
+		 * free DAI widget during stop/suspend to keep widget use_count's balanced.
+		 */
+		ret = hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
+		if (ret < 0)
+			return ret;
+
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		ret = hda_dai_config_pause_push_ipc(w);
 		if (ret < 0)
 			return ret;
 		break;
+
 	default:
-		return -EINVAL;
+		break;
 	}
 	return 0;
 }
 
-static int hda_dai_hw_free(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
+static int hda_link_dma_hw_free(struct snd_pcm_substream *substream)
 {
-	unsigned int stream_tag;
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct sof_intel_hda_stream *hda_stream;
-	struct hdac_bus *bus;
-	struct hdac_ext_link *link;
-	struct hdac_stream *hstream;
-	struct snd_soc_pcm_runtime *rtd;
+	struct hdac_bus *bus = hstream->bus;
 	struct hdac_ext_stream *hext_stream;
-	struct snd_soc_dapm_widget *w;
-	int ret;
-
-	hstream = substream->runtime->private_data;
-	bus = hstream->bus;
-	rtd = asoc_substream_to_rtd(substream);
-	hext_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct hdac_ext_link *link;
+	int stream_tag;
 
+	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
 	if (!hext_stream) {
-		dev_dbg(dai->dev,
+		dev_dbg(cpu_dai->dev,
 			"%s: hext_stream is not assigned\n", __func__);
 		return -EINVAL;
 	}
 
-	hda_stream = hstream_to_sof_hda_stream(hext_stream);
-
-	w = snd_soc_dai_get_widget(dai, substream->stream);
-
-	/* free the link DMA channel in the FW and the DAI widget */
-	ret = hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
-	if (ret < 0)
-		return ret;
-
-	link = snd_hdac_ext_bus_get_link(bus, asoc_rtd_to_codec(rtd, 0)->component->name);
+	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
 	if (!link)
 		return -EINVAL;
 
@@ -372,21 +407,42 @@ static int hda_dai_hw_free(struct snd_pcm_substream *substream,
 		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
 	}
 
-	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
 	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
 	hext_stream->link_prepared = 0;
 
 	/* free the host DMA channel reserved by hostless streams */
+	hda_stream = hstream_to_sof_hda_stream(hext_stream);
 	hda_stream->host_reserved = 0;
 
 	return 0;
 }
 
+static int hda_dai_hw_free(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct snd_soc_dapm_widget *w;
+	int ret;
+
+	ret = hda_link_dma_hw_free(substream);
+	if (ret < 0)
+		return ret;
+
+	w = snd_soc_dai_get_widget(dai, substream->stream);
+
+	/* free the link DMA channel in the FW and the DAI widget */
+	ret = hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops ipc3_hda_dai_ops = {
 	.hw_params = hda_dai_hw_params,
 	.hw_free = hda_dai_hw_free,
 	.trigger = ipc3_hda_dai_trigger,
-	.prepare = hda_dai_prepare,
+	.prepare = ipc3_hda_dai_prepare,
 };
 
 #endif
-- 
2.30.2


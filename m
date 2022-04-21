Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0F50AA07
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:35:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6671916ED;
	Thu, 21 Apr 2022 22:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6671916ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573326;
	bh=wuwZsOTag0+OVWlYEGuQCRRouZ9tDkDnyGH5uZ+AjpI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mGypWBjHc1nmCRDiJUBwpLDlpZHXupXDC7vW0M9wOeG+0kyKTTlmp4ye82fdz9Wpo
	 qWGEfFXyQlF1duXFnZ7Kps03gcRbfAV9UuMfMOOWUjik0kfDjetGWQzUFuL+K/uefx
	 Uq+VySXmpkSirBKru+pCZh3qQChSK4KOhfdqese4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 848D1F8050F;
	Thu, 21 Apr 2022 22:33:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E380DF80539; Thu, 21 Apr 2022 22:32:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A2F3F80506
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A2F3F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EmRn6B+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573164; x=1682109164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wuwZsOTag0+OVWlYEGuQCRRouZ9tDkDnyGH5uZ+AjpI=;
 b=EmRn6B+SdbCrbjqroR1JqcDbYiLB88T3wG/FGgK52w6uAGPf/EwJEo1R
 l3DUHLekURzuOZoxpnE96CYSccjiZHMAuHz0rj99jVaPCWelG7UindmUT
 ZoFMzXWMO2mnqGvqouPWqnyc4lC80K+SiUrZlNO/AixzBGXrGmfSg/BzG
 SyQtBQzwbd8/+qiwN9PdWwqCJ81BsjwGDC/9ykW0URdPD44K0/1mlIwhN
 YKZ1wxz7+s9Le/TaSAbpb8S4aNTcDFiGrhzJBoEVTwfp7Ybzplh04L5NS
 S150L0NSQYST0wwcZP8TU9jrjCtZV2h0L4o3//sL6mI66CakTXw5TgOim w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047618"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047618"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455781"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/14] ASoC: SOF: Intel: hda-dai: regroup dai and link DMA
 operations
Date: Thu, 21 Apr 2022 15:31:54 -0500
Message-Id: <20220421203201.1550328-8-pierre-louis.bossart@linux.intel.com>
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

Just code move with no functionality change, to clearly separate out
the 'dai' operation from the link DMA ones.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 203 +++++++++++++++++-----------------
 1 file changed, 102 insertions(+), 101 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index d5ca5b1fefe67..20eb4097ce753 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -162,20 +162,6 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 	return 0;
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
 static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
@@ -220,6 +206,108 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	return hda_link_dma_params(hext_stream, &p_params);
 }
 
+static int hda_link_dma_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	int stream = substream->stream;
+
+	return hda_link_dma_hw_params(substream, &rtd->dpcm[stream].hw_params);
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
+
+	dev_dbg(cpu_dai->dev, "%s: cmd=%d\n", __func__, cmd);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_hdac_ext_link_stream_start(hext_stream);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		snd_hdac_ext_link_stream_clear(hext_stream);
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			stream_tag = hdac_stream(hext_stream)->stream_tag;
+			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+		}
+
+		hext_stream->link_prepared = 0;
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		snd_hdac_ext_link_stream_clear(hext_stream);
+
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int hda_link_dma_hw_free(struct snd_pcm_substream *substream)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct sof_intel_hda_stream *hda_stream;
+	struct hdac_bus *bus = hstream->bus;
+	struct hdac_ext_stream *hext_stream;
+	struct hdac_ext_link *link;
+	int stream_tag;
+
+	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
+	if (!hext_stream) {
+		dev_dbg(cpu_dai->dev, "%s: hext_stream is not assigned\n", __func__);
+		return -EINVAL;
+	}
+
+	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	if (!link)
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		stream_tag = hdac_stream(hext_stream)->stream_tag;
+		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+	}
+
+	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
+	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
+	hext_stream->link_prepared = 0;
+
+	/* free the host DMA channel reserved by hostless streams */
+	hda_stream = hstream_to_sof_hda_stream(hext_stream);
+	hda_stream->host_reserved = 0;
+
+	return 0;
+}
+
+static int hda_dai_widget_update(struct snd_soc_dapm_widget *w,
+				 int channel, bool widget_setup)
+{
+	struct snd_sof_dai_config_data data;
+
+	data.dai_data = channel;
+
+	/* set up/free DAI widget and send DAI_CONFIG IPC */
+	if (widget_setup)
+		return hda_ctrl_dai_widget_setup(w, SOF_DAI_CONFIG_FLAGS_2_STEP_STOP, &data);
+
+	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE, &data);
+}
+
 static int hda_dai_hw_params_update(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params,
 				    struct snd_soc_dai *dai)
@@ -253,13 +341,6 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 	return hda_dai_hw_params_update(substream, params, dai);
 }
 
-static int hda_link_dma_prepare(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	int stream = substream->stream;
-
-	return hda_link_dma_hw_params(substream, &rtd->dpcm[stream].hw_params);
-}
 
 static int hda_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 {
@@ -301,47 +382,6 @@ static int ipc3_hda_dai_prepare(struct snd_pcm_substream *substream,
 	return hda_dai_hw_params_update(substream, &rtd->dpcm[stream].hw_params, dai);
 }
 
-static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
-{
-	struct hdac_stream *hstream = substream->runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
-	struct hdac_ext_link *link;
-	struct hdac_bus *bus = hstream->bus;
-	int stream_tag;
-
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
-	if (!link)
-		return -EINVAL;
-
-	dev_dbg(cpu_dai->dev, "%s: cmd=%d\n", __func__, cmd);
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_link_stream_start(hext_stream);
-		break;
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_STOP:
-		snd_hdac_ext_link_stream_clear(hext_stream);
-
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			stream_tag = hdac_stream(hext_stream)->stream_tag;
-			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-		}
-
-		hext_stream->link_prepared = 0;
-		break;
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		snd_hdac_ext_link_stream_clear(hext_stream);
-
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
 
 static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 				int cmd, struct snd_soc_dai *dai)
@@ -379,45 +419,6 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int hda_link_dma_hw_free(struct snd_pcm_substream *substream)
-{
-	struct hdac_stream *hstream = substream->runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct sof_intel_hda_stream *hda_stream;
-	struct hdac_bus *bus = hstream->bus;
-	struct hdac_ext_stream *hext_stream;
-	struct hdac_ext_link *link;
-	int stream_tag;
-
-	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
-	if (!hext_stream) {
-		dev_dbg(cpu_dai->dev,
-			"%s: hext_stream is not assigned\n", __func__);
-		return -EINVAL;
-	}
-
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
-	if (!link)
-		return -EINVAL;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		stream_tag = hdac_stream(hext_stream)->stream_tag;
-		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-	}
-
-	snd_soc_dai_set_dma_data(cpu_dai, substream, NULL);
-	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
-	hext_stream->link_prepared = 0;
-
-	/* free the host DMA channel reserved by hostless streams */
-	hda_stream = hstream_to_sof_hda_stream(hext_stream);
-	hda_stream->host_reserved = 0;
-
-	return 0;
-}
-
 static int hda_dai_hw_free(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
-- 
2.30.2


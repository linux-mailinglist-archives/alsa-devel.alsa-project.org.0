Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E601D4AEA68
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 07:32:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8627B183E;
	Wed,  9 Feb 2022 07:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8627B183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644388361;
	bh=eRJSn7xE0NTgOaP0bo1+waSiWVAgLAWIXHAFYe4CChQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uQF6NvYgUCxQxoQ+L4DHsioAxjTEhkOuqwPPsP92W2CouSusLt9716UanOgFBCSq8
	 HPbNUOvQxTp5OqeI3Pr5LrVvK1URSDar/c74l5VAK6Kb4ZAmE3tBA9HRXnIXSh0XZL
	 Nj/Toa+TUSJ1+6g49MPZTtAFQq7bIy3cZ6PEWW90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E750EF8016B;
	Wed,  9 Feb 2022 07:31:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0A31F8014B; Wed,  9 Feb 2022 07:31:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_135,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16568F8016A
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 07:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16568F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="K2A3t7wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644388286; x=1675924286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eRJSn7xE0NTgOaP0bo1+waSiWVAgLAWIXHAFYe4CChQ=;
 b=K2A3t7wYUCL0vH2WiThe+RgNCi1MJ5R6cQJIahWRWPYdOonllcMAkRBX
 I3z6WUwRH6cCwIahiLPwND8rAsvcTT4BhHFbIf5j9TjLLxqa8i4GAWabH
 HI2B9kuMA4FiWXZc4WZolZzSFSjy4Gf7JRx6sfsf9wedIDt7iTh9wJkgI
 SBMDh6mcOiTw1/l57V1Ivb+neo4ivl5TRN5JO6YDBdUEr5cdm+k/Qg4CY
 VQqT8jXUaBg4v7tjjlkz+ptG/xFprSUuPV+8blsx/9/l+XlsJ1tlyUiSE
 Try9rKgNUjkfmmEuEgPdJCcECg5JJfLkclW/7YDD5LRHzOZI+g0ahf/rz g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248893398"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="248893398"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:31:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="540959642"
Received: from vmanav-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:31:09 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hdac_ext_stream: consistent prefixes for
 variables/members
Date: Wed,  9 Feb 2022 08:31:04 +0200
Message-Id: <20220209063104.9971-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The existing code maximizes confusion by using 'stream' and 'hstream'
variables of different types, e.g:

struct hdac_stream *stream;
struct hdac_ext_stream *stream;
struct hdac_stream *hstream;
struct hdac_ext_stream *hstream;

This confusion is partly inherited from legacy code but SOF
contributors added their own creative spin, e.g.

struct hdac_ext_stream *link_dev;
struct hdac_ext_stream *dsp_stream;
struct hdac_ext_stream hda_stream;

and my personal favorite:

stream = &hda_stream->hda_stream;

This patch suggests a consistent naming across all Intel code related
to HDAudio stream management. The convention is - by hierarchical
order:

struct sof_intel_hda_stream *hda_stream;
struct hdac_ext_stream *hext_stream;
struct hdac_stream *hstream;

No functionality change - just renaming of variables/members.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c    |  92 +++++++++++------------
 sound/soc/sof/intel/hda-dsp.c    |  14 ++--
 sound/soc/sof/intel/hda-ipc.c    |  10 +--
 sound/soc/sof/intel/hda-loader.c |  50 ++++++-------
 sound/soc/sof/intel/hda-pcm.c    |  12 +--
 sound/soc/sof/intel/hda-probes.c |  34 ++++-----
 sound/soc/sof/intel/hda-stream.c | 122 +++++++++++++++----------------
 sound/soc/sof/intel/hda-trace.c  |   6 +-
 sound/soc/sof/intel/hda.h        |  17 +++--
 9 files changed, 179 insertions(+), 178 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 28a54145c150..af0c85e4e299 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -62,7 +62,7 @@ static struct hdac_ext_stream *
 	const struct sof_intel_dsp_desc *chip;
 	struct snd_sof_dev *sdev;
 	struct hdac_ext_stream *res = NULL;
-	struct hdac_stream *stream = NULL;
+	struct hdac_stream *hstream = NULL;
 
 	int stream_dir = substream->stream;
 
@@ -72,39 +72,39 @@ static struct hdac_ext_stream *
 	}
 
 	spin_lock_irq(&bus->reg_lock);
-	list_for_each_entry(stream, &bus->stream_list, list) {
-		struct hdac_ext_stream *hstream =
-			stream_to_hdac_ext_stream(stream);
-		if (stream->direction != substream->stream)
+	list_for_each_entry(hstream, &bus->stream_list, list) {
+		struct hdac_ext_stream *hext_stream =
+			stream_to_hdac_ext_stream(hstream);
+		if (hstream->direction != substream->stream)
 			continue;
 
-		hda_stream = hstream_to_sof_hda_stream(hstream);
+		hda_stream = hstream_to_sof_hda_stream(hext_stream);
 		sdev = hda_stream->sdev;
 		chip = get_chip_info(sdev->pdata);
 
 		/* check if link is available */
-		if (!hstream->link_locked) {
+		if (!hext_stream->link_locked) {
 			/*
 			 * choose the first available link for platforms that do not have the
 			 * PROCEN_FMT_QUIRK set.
 			 */
 			if (!(chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK)) {
-				res = hstream;
+				res = hext_stream;
 				break;
 			}
 
-			if (stream->opened) {
+			if (hstream->opened) {
 				/*
 				 * check if the stream tag matches the stream
 				 * tag of one of the connected FEs
 				 */
 				if (hda_check_fes(rtd, stream_dir,
-						  stream->stream_tag)) {
-					res = hstream;
+						  hstream->stream_tag)) {
+					res = hext_stream;
 					break;
 				}
 			} else {
-				res = hstream;
+				res = hext_stream;
 
 				/*
 				 * This must be a hostless stream.
@@ -132,17 +132,17 @@ static struct hdac_ext_stream *
 	return res;
 }
 
-static int hda_link_dma_params(struct hdac_ext_stream *stream,
+static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 			       struct hda_pipe_params *params)
 {
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	unsigned char stream_tag = hstream->stream_tag;
 	struct hdac_bus *bus = hstream->bus;
 	struct hdac_ext_link *link;
 	unsigned int format_val;
 
-	snd_hdac_ext_stream_decouple(bus, stream, true);
-	snd_hdac_ext_link_stream_reset(stream);
+	snd_hdac_ext_stream_decouple(bus, hext_stream, true);
+	snd_hdac_ext_link_stream_reset(hext_stream);
 
 	format_val = snd_hdac_calc_stream_format(params->s_freq, params->ch,
 						 params->format,
@@ -151,9 +151,9 @@ static int hda_link_dma_params(struct hdac_ext_stream *stream,
 	dev_dbg(bus->dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
 
-	snd_hdac_ext_link_stream_setup(stream, format_val);
+	snd_hdac_ext_link_stream_setup(hext_stream, format_val);
 
-	if (stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (hext_stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
 		list_for_each_entry(link, &bus->hlink_list, list) {
 			if (link->index == params->link_index)
 				snd_hdac_ext_link_set_stream_id(link,
@@ -161,7 +161,7 @@ static int hda_link_dma_params(struct hdac_ext_stream *stream,
 		}
 	}
 
-	stream->link_prepared = 1;
+	hext_stream->link_prepared = 1;
 
 	return 0;
 }
@@ -218,7 +218,7 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 {
 	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct hdac_bus *bus = hstream->bus;
-	struct hdac_ext_stream *link_dev;
+	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct sof_intel_hda_stream *hda_stream;
@@ -229,18 +229,18 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	/* get stored dma data if resuming from system suspend */
-	link_dev = snd_soc_dai_get_dma_data(dai, substream);
-	if (!link_dev) {
-		link_dev = hda_link_stream_assign(bus, substream);
-		if (!link_dev)
+	hext_stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (!hext_stream) {
+		hext_stream = hda_link_stream_assign(bus, substream);
+		if (!hext_stream)
 			return -EBUSY;
 
-		snd_soc_dai_set_dma_data(dai, substream, (void *)link_dev);
+		snd_soc_dai_set_dma_data(dai, substream, (void *)hext_stream);
 	}
 
-	stream_tag = hdac_stream(link_dev)->stream_tag;
+	stream_tag = hdac_stream(hext_stream)->stream_tag;
 
-	hda_stream = hstream_to_sof_hda_stream(link_dev);
+	hda_stream = hstream_to_sof_hda_stream(hext_stream);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		w = dai->playback_widget;
@@ -257,7 +257,7 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	/* set the hdac_stream in the codec dai */
-	snd_soc_dai_set_stream(codec_dai, hdac_stream(link_dev), substream->stream);
+	snd_soc_dai_set_stream(codec_dai, hdac_stream(hext_stream), substream->stream);
 
 	p_params.s_fmt = snd_pcm_format_width(params_format(params));
 	p_params.ch = params_channels(params);
@@ -271,20 +271,20 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	else
 		p_params.link_bps = codec_dai->driver->capture.sig_bits;
 
-	return hda_link_dma_params(link_dev, &p_params);
+	return hda_link_dma_params(hext_stream, &p_params);
 }
 
 static int hda_link_pcm_prepare(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *link_dev =
+	struct hdac_ext_stream *hext_stream =
 				snd_soc_dai_get_dma_data(dai, substream);
 	struct snd_sof_dev *sdev =
 				snd_soc_component_get_drvdata(dai->component);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
-	if (link_dev->link_prepared)
+	if (hext_stream->link_prepared)
 		return 0;
 
 	dev_dbg(sdev->dev, "hda: prepare stream dir %d\n", substream->stream);
@@ -326,7 +326,7 @@ static int hda_link_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 				int cmd, struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *link_dev =
+	struct hdac_ext_stream *hext_stream =
 				snd_soc_dai_get_dma_data(dai, substream);
 	struct sof_intel_hda_stream *hda_stream;
 	struct snd_soc_pcm_runtime *rtd;
@@ -345,7 +345,7 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 	if (!link)
 		return -EINVAL;
 
-	hda_stream = hstream_to_sof_hda_stream(link_dev);
+	hda_stream = hstream_to_sof_hda_stream(hext_stream);
 
 	dev_dbg(dai->dev, "In %s cmd=%d\n", __func__, cmd);
 
@@ -354,11 +354,11 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_link_stream_start(link_dev);
+		snd_hdac_ext_link_stream_start(hext_stream);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		snd_hdac_ext_link_stream_clear(link_dev);
+		snd_hdac_ext_link_stream_clear(hext_stream);
 
 		/*
 		 * free DAI widget during stop/suspend to keep widget use_count's balanced.
@@ -368,14 +368,14 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 			return ret;
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			stream_tag = hdac_stream(link_dev)->stream_tag;
+			stream_tag = hdac_stream(hext_stream)->stream_tag;
 			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
 		}
 
-		link_dev->link_prepared = 0;
+		hext_stream->link_prepared = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		snd_hdac_ext_link_stream_clear(link_dev);
+		snd_hdac_ext_link_stream_clear(hext_stream);
 
 		ret = hda_link_dai_config_pause_push_ipc(w);
 		if (ret < 0)
@@ -396,22 +396,22 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	struct hdac_ext_link *link;
 	struct hdac_stream *hstream;
 	struct snd_soc_pcm_runtime *rtd;
-	struct hdac_ext_stream *link_dev;
+	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_dapm_widget *w;
 	int ret;
 
 	hstream = substream->runtime->private_data;
 	bus = hstream->bus;
 	rtd = asoc_substream_to_rtd(substream);
-	link_dev = snd_soc_dai_get_dma_data(dai, substream);
+	hext_stream = snd_soc_dai_get_dma_data(dai, substream);
 
-	if (!link_dev) {
+	if (!hext_stream) {
 		dev_dbg(dai->dev,
-			"%s: link_dev is not assigned\n", __func__);
+			"%s: hext_stream is not assigned\n", __func__);
 		return -EINVAL;
 	}
 
-	hda_stream = hstream_to_sof_hda_stream(link_dev);
+	hda_stream = hstream_to_sof_hda_stream(hext_stream);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		w = dai->playback_widget;
@@ -428,13 +428,13 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		stream_tag = hdac_stream(link_dev)->stream_tag;
+		stream_tag = hdac_stream(hext_stream)->stream_tag;
 		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
 	}
 
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
-	snd_hdac_ext_stream_release(link_dev, HDAC_EXT_STREAM_TYPE_LINK);
-	link_dev->link_prepared = 0;
+	snd_hdac_ext_stream_release(hext_stream, HDAC_EXT_STREAM_TYPE_LINK);
+	hext_stream->link_prepared = 0;
 
 	/* free the host DMA channel reserved by hostless streams */
 	hda_stream->host_reserved = 0;
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 916a257ea96b..0fe522549c91 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -904,7 +904,7 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_soc_pcm_runtime *rtd;
-	struct hdac_ext_stream *stream;
+	struct hdac_ext_stream *hext_stream;
 	struct hdac_ext_link *link;
 	struct hdac_stream *s;
 	const char *name;
@@ -912,7 +912,7 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 
 	/* set internal flag for BE */
 	list_for_each_entry(s, &bus->stream_list, list) {
-		stream = stream_to_hdac_ext_stream(s);
+		hext_stream = stream_to_hdac_ext_stream(s);
 
 		/*
 		 * clear stream. This should already be taken care for running
@@ -920,20 +920,20 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 		 * streams do not get suspended, so this needs to be done
 		 * explicitly during suspend.
 		 */
-		if (stream->link_substream) {
-			rtd = asoc_substream_to_rtd(stream->link_substream);
+		if (hext_stream->link_substream) {
+			rtd = asoc_substream_to_rtd(hext_stream->link_substream);
 			name = asoc_rtd_to_codec(rtd, 0)->component->name;
 			link = snd_hdac_ext_bus_get_link(bus, name);
 			if (!link)
 				return -EINVAL;
 
-			stream->link_prepared = 0;
+			hext_stream->link_prepared = 0;
 
-			if (hdac_stream(stream)->direction ==
+			if (hdac_stream(hext_stream)->direction ==
 				SNDRV_PCM_STREAM_CAPTURE)
 				continue;
 
-			stream_tag = hdac_stream(stream)->stream_tag;
+			stream_tag = hdac_stream(hext_stream)->stream_tag;
 			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
 		}
 	}
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index f0cf8019d72d..a8c452144168 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -255,13 +255,13 @@ int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 
 		hda_stream = container_of(hstream,
 					  struct sof_intel_hda_stream,
-					  hda_stream.hstream);
+					  hext_stream.hstream);
 
 		/* The stream might already be closed */
 		if (!hstream)
 			return -ESTRPIPE;
 
-		sof_mailbox_read(sdev, hda_stream->stream.posn_offset, p, sz);
+		sof_mailbox_read(sdev, hda_stream->sof_intel_stream.posn_offset, p, sz);
 	}
 
 	return 0;
@@ -277,17 +277,17 @@ int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
 	size_t posn_offset = reply->posn_offset;
 
 	hda_stream = container_of(hstream, struct sof_intel_hda_stream,
-				  hda_stream.hstream);
+				  hext_stream.hstream);
 
 	/* check for unaligned offset or overflow */
 	if (posn_offset > sdev->stream_box.size ||
 	    posn_offset % sizeof(struct sof_ipc_stream_posn) != 0)
 		return -EINVAL;
 
-	hda_stream->stream.posn_offset = sdev->stream_box.offset + posn_offset;
+	hda_stream->sof_intel_stream.posn_offset = sdev->stream_box.offset + posn_offset;
 
 	dev_dbg(sdev->dev, "pcm: stream dir %d, posn mailbox offset is %zu",
-		substream->stream, hda_stream->stream.posn_offset);
+		substream->stream, hda_stream->sof_intel_stream.posn_offset);
 
 	return 0;
 }
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 6af3325b7e40..3c0d7cbdf174 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -47,18 +47,18 @@ static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsig
 						 unsigned int size, struct snd_dma_buffer *dmab,
 						 int direction)
 {
-	struct hdac_ext_stream *dsp_stream;
+	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	int ret;
 
-	dsp_stream = hda_dsp_stream_get(sdev, direction, 0);
+	hext_stream = hda_dsp_stream_get(sdev, direction, 0);
 
-	if (!dsp_stream) {
+	if (!hext_stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
 		return ERR_PTR(-ENODEV);
 	}
-	hstream = &dsp_stream->hstream;
+	hstream = &hext_stream->hstream;
 	hstream->substream = NULL;
 
 	/* allocate DMA buffer */
@@ -73,21 +73,21 @@ static struct hdac_ext_stream *cl_stream_prepare(struct snd_sof_dev *sdev, unsig
 	hstream->bufsize = size;
 
 	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
-		ret = hda_dsp_iccmax_stream_hw_params(sdev, dsp_stream, dmab, NULL);
+		ret = hda_dsp_iccmax_stream_hw_params(sdev, hext_stream, dmab, NULL);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: iccmax stream prepare failed: %d\n", ret);
 			goto error;
 		}
 	} else {
-		ret = hda_dsp_stream_hw_params(sdev, dsp_stream, dmab, NULL);
+		ret = hda_dsp_stream_hw_params(sdev, hext_stream, dmab, NULL);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: hdac prepare failed: %d\n", ret);
 			goto error;
 		}
-		hda_dsp_stream_spib_config(sdev, dsp_stream, HDA_DSP_SPIB_ENABLE, size);
+		hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_ENABLE, size);
 	}
 
-	return dsp_stream;
+	return hext_stream;
 
 error:
 	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
@@ -209,9 +209,9 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 }
 
 static int cl_trigger(struct snd_sof_dev *sdev,
-		      struct hdac_ext_stream *stream, int cmd)
+		      struct hdac_ext_stream *hext_stream, int cmd)
 {
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 
 	/* code loader is special case that reuses stream ops */
@@ -231,19 +231,19 @@ static int cl_trigger(struct snd_sof_dev *sdev,
 		hstream->running = true;
 		return 0;
 	default:
-		return hda_dsp_stream_trigger(sdev, stream, cmd);
+		return hda_dsp_stream_trigger(sdev, hext_stream, cmd);
 	}
 }
 
 static int cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
-		      struct hdac_ext_stream *stream)
+		      struct hdac_ext_stream *hext_stream)
 {
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	int ret = 0;
 
 	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
-		ret = hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
+		ret = hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
 	else
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
 					SOF_HDA_SD_CTL_DMA_START, 0);
@@ -267,12 +267,12 @@ static int cl_cleanup(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 	return ret;
 }
 
-static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream)
+static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream)
 {
 	unsigned int reg;
 	int ret, status;
 
-	ret = cl_trigger(sdev, stream, SNDRV_PCM_TRIGGER_START);
+	ret = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_START);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: DMA trigger start failed\n");
 		return ret;
@@ -296,7 +296,7 @@ static int cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream)
 			__func__);
 	}
 
-	ret = cl_trigger(sdev, stream, SNDRV_PCM_TRIGGER_STOP);
+	ret = cl_trigger(sdev, hext_stream, SNDRV_PCM_TRIGGER_STOP);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: DMA trigger stop failed\n");
 		if (!status)
@@ -392,7 +392,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *plat_data = sdev->pdata;
 	const struct sof_dev_desc *desc = plat_data->desc;
 	const struct sof_intel_dsp_desc *chip_info;
-	struct hdac_ext_stream *stream;
+	struct hdac_ext_stream *hext_stream;
 	struct firmware stripped_firmware;
 	int ret, ret1, i;
 
@@ -417,11 +417,11 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	init_waitqueue_head(&sdev->boot_wait);
 
 	/* prepare DMA for code loader stream */
-	stream = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
-				   &sdev->dmab, SNDRV_PCM_STREAM_PLAYBACK);
-	if (IS_ERR(stream)) {
+	hext_stream = cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT, stripped_firmware.size,
+					&sdev->dmab, SNDRV_PCM_STREAM_PLAYBACK);
+	if (IS_ERR(hext_stream)) {
 		dev_err(sdev->dev, "error: dma prepare for fw loading failed\n");
-		return PTR_ERR(stream);
+		return PTR_ERR(hext_stream);
 	}
 
 	memcpy(sdev->dmab.area, stripped_firmware.data,
@@ -433,7 +433,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 			"Attempting iteration %d of Core En/ROM load...\n", i);
 
 		hda->boot_iteration = i + 1;
-		ret = cl_dsp_init(sdev, stream->hstream.stream_tag);
+		ret = cl_dsp_init(sdev, hext_stream->hstream.stream_tag);
 
 		/* don't retry anymore if successful */
 		if (!ret)
@@ -472,7 +472,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 * Continue with code loading and firmware boot
 	 */
 	hda->boot_iteration = HDA_FW_BOOT_ATTEMPTS;
-	ret = cl_copy_fw(sdev, stream);
+	ret = cl_copy_fw(sdev, hext_stream);
 	if (!ret)
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
 	else
@@ -485,7 +485,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 * This should be done even if firmware loading fails.
 	 * If the cleanup also fails, we return the initial error
 	 */
-	ret1 = cl_cleanup(sdev, &sdev->dmab, stream);
+	ret1 = cl_cleanup(sdev, &sdev->dmab, hext_stream);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: Code loader DSP cleanup failed\n");
 
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index d78aa5d8552d..eec83ca557a1 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -96,7 +96,7 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 			  struct sof_ipc_stream_params *ipc_params)
 {
 	struct hdac_stream *hstream = substream->runtime->private_data;
-	struct hdac_ext_stream *stream = stream_to_hdac_ext_stream(hstream);
+	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct snd_dma_buffer *dmab;
 	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
@@ -118,7 +118,7 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 			(params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP) &&
 			(params->flags & SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP);
 
-	ret = hda_dsp_stream_hw_params(sdev, stream, dmab, params);
+	ret = hda_dsp_stream_hw_params(sdev, hext_stream, dmab, params);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: hdac prepare failed: %d\n", ret);
 		return ret;
@@ -126,9 +126,9 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 
 	/* enable SPIB when rewinds are disabled */
 	if (hda_disable_rewinds)
-		hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_ENABLE, 0);
+		hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_ENABLE, 0);
 	else
-		hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
+		hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
 
 	/* update no_stream_position flag for ipc params */
 	if (hda && hda->no_ipc_position) {
@@ -174,9 +174,9 @@ int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream, int cmd)
 {
 	struct hdac_stream *hstream = substream->runtime->private_data;
-	struct hdac_ext_stream *stream = stream_to_hdac_ext_stream(hstream);
+	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
 
-	return hda_dsp_stream_trigger(sdev, stream, cmd);
+	return hda_dsp_stream_trigger(sdev, hext_stream, cmd);
 }
 
 snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/intel/hda-probes.c b/sound/soc/sof/intel/hda-probes.c
index fe2f3f7d236b..35e548da3609 100644
--- a/sound/soc/sof/intel/hda-probes.c
+++ b/sound/soc/sof/intel/hda-probes.c
@@ -23,34 +23,34 @@ int hda_probe_compr_assign(struct snd_sof_dev *sdev,
 			   struct snd_compr_stream *cstream,
 			   struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *stream;
+	struct hdac_ext_stream *hext_stream;
 
-	stream = hda_dsp_stream_get(sdev, cstream->direction, 0);
-	if (!stream)
+	hext_stream = hda_dsp_stream_get(sdev, cstream->direction, 0);
+	if (!hext_stream)
 		return -EBUSY;
 
-	hdac_stream(stream)->curr_pos = 0;
-	hdac_stream(stream)->cstream = cstream;
-	cstream->runtime->private_data = stream;
+	hdac_stream(hext_stream)->curr_pos = 0;
+	hdac_stream(hext_stream)->cstream = cstream;
+	cstream->runtime->private_data = hext_stream;
 
-	return hdac_stream(stream)->stream_tag;
+	return hdac_stream(hext_stream)->stream_tag;
 }
 
 int hda_probe_compr_free(struct snd_sof_dev *sdev,
 			 struct snd_compr_stream *cstream,
 			 struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *stream = hda_compr_get_stream(cstream);
+	struct hdac_ext_stream *hext_stream = hda_compr_get_stream(cstream);
 	int ret;
 
 	ret = hda_dsp_stream_put(sdev, cstream->direction,
-				 hdac_stream(stream)->stream_tag);
+				 hdac_stream(hext_stream)->stream_tag);
 	if (ret < 0) {
 		dev_dbg(sdev->dev, "stream put failed: %d\n", ret);
 		return ret;
 	}
 
-	hdac_stream(stream)->cstream = NULL;
+	hdac_stream(hext_stream)->cstream = NULL;
 	cstream->runtime->private_data = NULL;
 
 	return 0;
@@ -61,8 +61,8 @@ int hda_probe_compr_set_params(struct snd_sof_dev *sdev,
 			       struct snd_compr_params *params,
 			       struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *stream = hda_compr_get_stream(cstream);
-	struct hdac_stream *hstream = hdac_stream(stream);
+	struct hdac_ext_stream *hext_stream = hda_compr_get_stream(cstream);
+	struct hdac_stream *hstream = hdac_stream(hext_stream);
 	struct snd_dma_buffer *dmab;
 	u32 bits, rate;
 	int bps, ret;
@@ -80,7 +80,7 @@ int hda_probe_compr_set_params(struct snd_sof_dev *sdev,
 	hstream->period_bytes = cstream->runtime->fragment_size;
 	hstream->no_period_wakeup = 0;
 
-	ret = hda_dsp_stream_hw_params(sdev, stream, dmab, NULL);
+	ret = hda_dsp_stream_hw_params(sdev, hext_stream, dmab, NULL);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: hdac prepare failed: %d\n", ret);
 		return ret;
@@ -93,9 +93,9 @@ int hda_probe_compr_trigger(struct snd_sof_dev *sdev,
 			    struct snd_compr_stream *cstream, int cmd,
 			    struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *stream = hda_compr_get_stream(cstream);
+	struct hdac_ext_stream *hext_stream = hda_compr_get_stream(cstream);
 
-	return hda_dsp_stream_trigger(sdev, stream, cmd);
+	return hda_dsp_stream_trigger(sdev, hext_stream, cmd);
 }
 
 int hda_probe_compr_pointer(struct snd_sof_dev *sdev,
@@ -103,11 +103,11 @@ int hda_probe_compr_pointer(struct snd_sof_dev *sdev,
 			    struct snd_compr_tstamp *tstamp,
 			    struct snd_soc_dai *dai)
 {
-	struct hdac_ext_stream *stream = hda_compr_get_stream(cstream);
+	struct hdac_ext_stream *hext_stream = hda_compr_get_stream(cstream);
 	struct snd_soc_pcm_stream *pstream;
 
 	pstream = &dai->driver->capture;
-	tstamp->copied_total = hdac_stream(stream)->curr_pos;
+	tstamp->copied_total = hdac_stream(hext_stream)->curr_pos;
 	tstamp->sampling_rate = snd_pcm_rate_bit_to_rate(pstream->rates);
 
 	return 0;
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index ba60807fbd8f..daeb64c495e4 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -57,7 +57,7 @@ static char *hda_hstream_dbg_get_stream_info_str(struct hdac_stream *hstream)
  */
 static int hda_setup_bdle(struct snd_sof_dev *sdev,
 			  struct snd_dma_buffer *dmab,
-			  struct hdac_stream *stream,
+			  struct hdac_stream *hstream,
 			  struct sof_intel_dsp_bdl **bdlp,
 			  int offset, int size, int ioc)
 {
@@ -68,7 +68,7 @@ static int hda_setup_bdle(struct snd_sof_dev *sdev,
 		dma_addr_t addr;
 		int chunk;
 
-		if (stream->frags >= HDA_DSP_MAX_BDL_ENTRIES) {
+		if (hstream->frags >= HDA_DSP_MAX_BDL_ENTRIES) {
 			dev_err(sdev->dev, "error: stream frags exceeded\n");
 			return -EINVAL;
 		}
@@ -91,11 +91,11 @@ static int hda_setup_bdle(struct snd_sof_dev *sdev,
 		size -= chunk;
 		bdl->ioc = (size || !ioc) ? 0 : cpu_to_le32(0x01);
 		bdl++;
-		stream->frags++;
+		hstream->frags++;
 		offset += chunk;
 
 		dev_vdbg(sdev->dev, "bdl, frags:%d, chunk size:0x%x;\n",
-			 stream->frags, chunk);
+			 hstream->frags, chunk);
 	}
 
 	*bdlp = bdl;
@@ -108,47 +108,47 @@ static int hda_setup_bdle(struct snd_sof_dev *sdev,
  */
 int hda_dsp_stream_setup_bdl(struct snd_sof_dev *sdev,
 			     struct snd_dma_buffer *dmab,
-			     struct hdac_stream *stream)
+			     struct hdac_stream *hstream)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct sof_intel_dsp_bdl *bdl;
 	int i, offset, period_bytes, periods;
 	int remain, ioc;
 
-	period_bytes = stream->period_bytes;
+	period_bytes = hstream->period_bytes;
 	dev_dbg(sdev->dev, "%s: period_bytes:0x%x\n", __func__, period_bytes);
 	if (!period_bytes)
-		period_bytes = stream->bufsize;
+		period_bytes = hstream->bufsize;
 
-	periods = stream->bufsize / period_bytes;
+	periods = hstream->bufsize / period_bytes;
 
 	dev_dbg(sdev->dev, "%s: periods:%d\n", __func__, periods);
 
-	remain = stream->bufsize % period_bytes;
+	remain = hstream->bufsize % period_bytes;
 	if (remain)
 		periods++;
 
 	/* program the initial BDL entries */
-	bdl = (struct sof_intel_dsp_bdl *)stream->bdl.area;
+	bdl = (struct sof_intel_dsp_bdl *)hstream->bdl.area;
 	offset = 0;
-	stream->frags = 0;
+	hstream->frags = 0;
 
 	/*
 	 * set IOC if don't use position IPC
 	 * and period_wakeup needed.
 	 */
 	ioc = hda->no_ipc_position ?
-	      !stream->no_period_wakeup : 0;
+	      !hstream->no_period_wakeup : 0;
 
 	for (i = 0; i < periods; i++) {
 		if (i == (periods - 1) && remain)
 			/* set the last small entry */
 			offset = hda_setup_bdle(sdev, dmab,
-						stream, &bdl, offset,
+						hstream, &bdl, offset,
 						remain, 0);
 		else
 			offset = hda_setup_bdle(sdev, dmab,
-						stream, &bdl, offset,
+						hstream, &bdl, offset,
 						period_bytes, ioc);
 	}
 
@@ -156,10 +156,10 @@ int hda_dsp_stream_setup_bdl(struct snd_sof_dev *sdev,
 }
 
 int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
-			       struct hdac_ext_stream *stream,
+			       struct hdac_ext_stream *hext_stream,
 			       int enable, u32 size)
 {
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	u32 mask;
 
 	if (!sdev->bar[HDA_DSP_SPIB_BAR]) {
@@ -175,7 +175,7 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 				enable << hstream->index);
 
 	/* set the SPIB value */
-	sof_io_write(sdev, stream->spib_addr, size);
+	sof_io_write(sdev, hext_stream->spib_addr, size);
 
 	return 0;
 }
@@ -186,7 +186,7 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sof_intel_hda_stream *hda_stream;
-	struct hdac_ext_stream *stream = NULL;
+	struct hdac_ext_stream *hext_stream = NULL;
 	struct hdac_stream *s;
 
 	spin_lock_irq(&bus->reg_lock);
@@ -194,10 +194,10 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 	/* get an unused stream */
 	list_for_each_entry(s, &bus->stream_list, list) {
 		if (s->direction == direction && !s->opened) {
-			stream = stream_to_hdac_ext_stream(s);
-			hda_stream = container_of(stream,
+			hext_stream = stream_to_hdac_ext_stream(s);
+			hda_stream = container_of(hext_stream,
 						  struct sof_intel_hda_stream,
-						  hda_stream);
+						  hext_stream);
 			/* check if the host DMA channel is reserved */
 			if (hda_stream->host_reserved)
 				continue;
@@ -210,11 +210,11 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 	spin_unlock_irq(&bus->reg_lock);
 
 	/* stream found ? */
-	if (!stream) {
+	if (!hext_stream) {
 		dev_err(sdev->dev, "error: no free %s streams\n",
 			direction == SNDRV_PCM_STREAM_PLAYBACK ?
 			"playback" : "capture");
-		return stream;
+		return hext_stream;
 	}
 
 	hda_stream->flags = flags;
@@ -229,7 +229,7 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 					HDA_VS_INTEL_EM2,
 					HDA_VS_INTEL_EM2_L1SEN, 0);
 
-	return stream;
+	return hext_stream;
 }
 
 /* free a stream */
@@ -237,7 +237,7 @@ int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sof_intel_hda_stream *hda_stream;
-	struct hdac_ext_stream *stream;
+	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *s;
 	bool dmi_l1_enable = true;
 	bool found = false;
@@ -249,8 +249,8 @@ int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 	 * that are DMI L1 incompatible.
 	 */
 	list_for_each_entry(s, &bus->stream_list, list) {
-		stream = stream_to_hdac_ext_stream(s);
-		hda_stream = container_of(stream, struct sof_intel_hda_stream, hda_stream);
+		hext_stream = stream_to_hdac_ext_stream(s);
+		hda_stream = container_of(hext_stream, struct sof_intel_hda_stream, hext_stream);
 
 		if (!s->opened)
 			continue;
@@ -319,9 +319,9 @@ static int hda_dsp_stream_reset(struct snd_sof_dev *sdev, struct hdac_stream *hs
 }
 
 int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
-			   struct hdac_ext_stream *stream, int cmd)
+			   struct hdac_ext_stream *hext_stream, int cmd)
 {
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	u32 dma_start = SOF_HDA_SD_CTL_DMA_START;
 	int ret = 0;
@@ -396,17 +396,17 @@ int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
 }
 
 /* minimal recommended programming for ICCMAX stream */
-int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream,
+int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream,
 				    struct snd_dma_buffer *dmab,
 				    struct snd_pcm_hw_params *params)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	int ret;
 	u32 mask = 0x1 << hstream->index;
 
-	if (!stream) {
+	if (!hext_stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
 		return -ENODEV;
 	}
@@ -467,20 +467,20 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
  * and normal stream.
  */
 int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
-			     struct hdac_ext_stream *stream,
+			     struct hdac_ext_stream *hext_stream,
 			     struct snd_dma_buffer *dmab,
 			     struct snd_pcm_hw_params *params)
 {
 	const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
 	int ret;
 	u32 dma_start = SOF_HDA_SD_CTL_DMA_START;
 	u32 mask;
 	u32 run;
 
-	if (!stream) {
+	if (!hext_stream) {
 		dev_err(sdev->dev, "error: no stream available\n");
 		return -ENODEV;
 	}
@@ -659,28 +659,28 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 			   struct snd_pcm_substream *substream)
 {
-	struct hdac_stream *stream = substream->runtime->private_data;
-	struct hdac_ext_stream *link_dev = container_of(stream,
-							struct hdac_ext_stream,
-							hstream);
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct hdac_ext_stream *hext_stream = container_of(hstream,
+							 struct hdac_ext_stream,
+							 hstream);
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	u32 mask = 0x1 << stream->index;
+	u32 mask = 0x1 << hstream->index;
 	int ret;
 
-	ret = hda_dsp_stream_reset(sdev, stream);
+	ret = hda_dsp_stream_reset(sdev, hstream);
 	if (ret < 0)
 		return ret;
 
 	spin_lock_irq(&bus->reg_lock);
 	/* couple host and link DMA if link DMA channel is idle */
-	if (!link_dev->link_locked)
+	if (!hext_stream->link_locked)
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
 					SOF_HDA_REG_PP_PPCTL, mask, 0);
 	spin_unlock_irq(&bus->reg_lock);
 
-	hda_dsp_stream_spib_config(sdev, link_dev, HDA_DSP_SPIB_DISABLE, 0);
+	hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
 
-	stream->substream = NULL;
+	hstream->substream = NULL;
 
 	return 0;
 }
@@ -808,7 +808,7 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct hdac_ext_stream *stream;
+	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct sof_intel_hda_dev *sof_hda = bus_to_sof_hda(bus);
@@ -872,27 +872,27 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 
 		hda_stream->sdev = sdev;
 
-		stream = &hda_stream->hda_stream;
+		hext_stream = &hda_stream->hext_stream;
 
-		stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
+		hext_stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
 			SOF_HDA_PPHC_BASE + SOF_HDA_PPHC_INTERVAL * i;
 
-		stream->pplc_addr = sdev->bar[HDA_DSP_PP_BAR] +
+		hext_stream->pplc_addr = sdev->bar[HDA_DSP_PP_BAR] +
 			SOF_HDA_PPLC_BASE + SOF_HDA_PPLC_MULTI * num_total +
 			SOF_HDA_PPLC_INTERVAL * i;
 
 		/* do we support SPIB */
 		if (sdev->bar[HDA_DSP_SPIB_BAR]) {
-			stream->spib_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
+			hext_stream->spib_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
 				SOF_HDA_SPIB_BASE + SOF_HDA_SPIB_INTERVAL * i +
 				SOF_HDA_SPIB_SPIB;
 
-			stream->fifo_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
+			hext_stream->fifo_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
 				SOF_HDA_SPIB_BASE + SOF_HDA_SPIB_INTERVAL * i +
 				SOF_HDA_SPIB_MAXFIFO;
 		}
 
-		hstream = &stream->hstream;
+		hstream = &hext_stream->hstream;
 		hstream->bus = bus;
 		hstream->sd_int_sta_mask = 1 << i;
 		hstream->index = i;
@@ -927,28 +927,28 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 
 		hda_stream->sdev = sdev;
 
-		stream = &hda_stream->hda_stream;
+		hext_stream = &hda_stream->hext_stream;
 
 		/* we always have DSP support */
-		stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
+		hext_stream->pphc_addr = sdev->bar[HDA_DSP_PP_BAR] +
 			SOF_HDA_PPHC_BASE + SOF_HDA_PPHC_INTERVAL * i;
 
-		stream->pplc_addr = sdev->bar[HDA_DSP_PP_BAR] +
+		hext_stream->pplc_addr = sdev->bar[HDA_DSP_PP_BAR] +
 			SOF_HDA_PPLC_BASE + SOF_HDA_PPLC_MULTI * num_total +
 			SOF_HDA_PPLC_INTERVAL * i;
 
 		/* do we support SPIB */
 		if (sdev->bar[HDA_DSP_SPIB_BAR]) {
-			stream->spib_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
+			hext_stream->spib_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
 				SOF_HDA_SPIB_BASE + SOF_HDA_SPIB_INTERVAL * i +
 				SOF_HDA_SPIB_SPIB;
 
-			stream->fifo_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
+			hext_stream->fifo_addr = sdev->bar[HDA_DSP_SPIB_BAR] +
 				SOF_HDA_SPIB_BASE + SOF_HDA_SPIB_INTERVAL * i +
 				SOF_HDA_SPIB_MAXFIFO;
 		}
 
-		hstream = &stream->hstream;
+		hstream = &hext_stream->hstream;
 		hstream->bus = bus;
 		hstream->sd_int_sta_mask = 1 << i;
 		hstream->index = i;
@@ -983,7 +983,7 @@ void hda_dsp_stream_free(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hdac_stream *s, *_s;
-	struct hdac_ext_stream *stream;
+	struct hdac_ext_stream *hext_stream;
 	struct sof_intel_hda_stream *hda_stream;
 
 	/* free position buffer */
@@ -1003,9 +1003,9 @@ void hda_dsp_stream_free(struct snd_sof_dev *sdev)
 		if (s->bdl.area)
 			snd_dma_free_pages(&s->bdl);
 		list_del(&s->list);
-		stream = stream_to_hdac_ext_stream(s);
-		hda_stream = container_of(stream, struct sof_intel_hda_stream,
-					  hda_stream);
+		hext_stream = stream_to_hdac_ext_stream(s);
+		hda_stream = container_of(hext_stream, struct sof_intel_hda_stream,
+					  hext_stream);
 		devm_kfree(sdev->dev, hda_stream);
 	}
 }
diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index 1791ec045a54..755ef1d835e0 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -22,14 +22,14 @@
 static int hda_dsp_trace_prepare(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
-	struct hdac_ext_stream *stream = hda->dtrace_stream;
-	struct hdac_stream *hstream = &stream->hstream;
+	struct hdac_ext_stream *hext_stream = hda->dtrace_stream;
+	struct hdac_stream *hstream = &hext_stream->hstream;
 	int ret;
 
 	hstream->period_bytes = 0;/* initialize period_bytes */
 	hstream->bufsize = dmab->bytes;
 
-	ret = hda_dsp_stream_hw_params(sdev, stream, dmab, NULL);
+	ret = hda_dsp_stream_hw_params(sdev, hext_stream, dmab, NULL);
 	if (ret < 0)
 		dev_err(sdev->dev, "error: hdac prepare failed: %d\n", ret);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2390561906dd..324418582044 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -471,14 +471,14 @@ static inline struct hda_bus *sof_to_hbus(struct snd_sof_dev *s)
 
 struct sof_intel_hda_stream {
 	struct snd_sof_dev *sdev;
-	struct hdac_ext_stream hda_stream;
-	struct sof_intel_stream stream;
+	struct hdac_ext_stream hext_stream;
+	struct sof_intel_stream sof_intel_stream;
 	int host_reserved; /* reserve host DMA channel */
 	u32 flags;
 };
 
 #define hstream_to_sof_hda_stream(hstream) \
-	container_of(hstream, struct sof_intel_hda_stream, hda_stream)
+	container_of(hstream, struct sof_intel_hda_stream, hext_stream)
 
 #define bus_to_sof_hda(bus) \
 	container_of(bus, struct sof_intel_hda_dev, hbus.core)
@@ -545,18 +545,19 @@ int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substrea
 int hda_dsp_stream_init(struct snd_sof_dev *sdev);
 void hda_dsp_stream_free(struct snd_sof_dev *sdev);
 int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
-			     struct hdac_ext_stream *stream,
+			     struct hdac_ext_stream *hext_stream,
 			     struct snd_dma_buffer *dmab,
 			     struct snd_pcm_hw_params *params);
-int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_stream *stream,
+int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev,
+				    struct hdac_ext_stream *hext_stream,
 				    struct snd_dma_buffer *dmab,
 				    struct snd_pcm_hw_params *params);
 int hda_dsp_stream_trigger(struct snd_sof_dev *sdev,
-			   struct hdac_ext_stream *stream, int cmd);
+			   struct hdac_ext_stream *hext_stream, int cmd);
 irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context);
 int hda_dsp_stream_setup_bdl(struct snd_sof_dev *sdev,
 			     struct snd_dma_buffer *dmab,
-			     struct hdac_stream *stream);
+			     struct hdac_stream *hstream);
 bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev);
 bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev);
 
@@ -564,7 +565,7 @@ struct hdac_ext_stream *
 	hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags);
 int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag);
 int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
-			       struct hdac_ext_stream *stream,
+			       struct hdac_ext_stream *hext_stream,
 			       int enable, u32 size);
 
 int hda_ipc_msg_data(struct snd_sof_dev *sdev,
-- 
2.35.1


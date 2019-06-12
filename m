Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4797342D75
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD57217B4;
	Wed, 12 Jun 2019 19:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD57217B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560360497;
	bh=6/nHoOsKYrLfGx45SNI41ZhAkLgAQ9wuUkUsLHgrWTw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWVre58sugJmQwKqVPHtJxh7sAzbyBSfkT+TI1erjhhD6VvvCYGBZfnCz+SiS2ibo
	 fEVEFVGppPfKV8yz0IFhyzFUbZ9hzFKDaZsbeKjJTVSfDiO/ZPs+ObTF6U8Wq9v+97
	 rMP1rwtKf0/7p5lSOFM+i3V1Ft/GF09zz2AZnZVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3828F896EA;
	Wed, 12 Jun 2019 19:24:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1192FF89736; Wed, 12 Jun 2019 19:24:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1AFDF896EA
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1AFDF896EA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:23:54 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2019 10:23:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:23:36 -0500
Message-Id: <20190612172347.22338-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
References: <20190612172347.22338-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 04/15] ASoC: SOF: Intel: hda: assign link DMA
	channel at run-time
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The recommended HDA HW programming sequence for setting
the DMA format requires that the link DMA and host DMA
channels be coupled before setting the format. This
change means that host DMA or link DMA channels be
reserved even if only one is used.

Statically assigned link DMA channels would mean that
all the corresponding host DMA channels will need to be
reserved, leaving only a few channels available at run-time.
So, the suggestion here is to switch to dynamically assigning
both host DMA channels and link DMA channels are run-time.

The host DMA channel is assigned when the pcm
is opened as before. While choosing the link DMA channel,
if the host DMA channel corresponding to the link DMA channel
is already taken, the proposed method checks to make
sure that the BE is connected to the FE that has been assigned
this host DMA channel. Once the link DMA channel is assigned,
an IPC is sent to the DSP to set the link DMA channel.

The link DMA channel is freed during hw_free() and also in the
SUSPEND trigger callback. It will be re-assigned when hw_params
are set upon resume.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 284 ++++++++++++++++++++++------------
 sound/soc/sof/sof-priv.h      |   2 +
 sound/soc/sof/topology.c      |  51 +-----
 3 files changed, 189 insertions(+), 148 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index e1decf25aeac..c270fd7a0878 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -30,62 +30,84 @@ struct hda_pipe_params {
 };
 
 /*
- * Unlike GP dma, there is a set of stream registers in hda controller
- * to control the link dma channels. Each register controls one link
- * dma channel and the relation is fixed. To make sure FW uses correct
- * link dma channels, host allocates stream registers and sends the
- * corresponding link dma channels to FW to allocate link dma channel
- *
- * FIXME: this API is abused in the sense that tx_num and rx_num are
- * passed as arguments, not returned. We need to find a better way to
- * retrieve the stream tag allocated for the link DMA
+ * This function checks if the host dma channel corresponding
+ * to the link DMA stream_tag argument is assigned to one
+ * of the FEs connected to the BE DAI.
  */
-static int hda_link_dma_get_channels(struct snd_soc_dai *dai,
-				     unsigned int *tx_num,
-				     unsigned int *tx_slot,
-				     unsigned int *rx_num,
-				     unsigned int *rx_slot)
+static bool hda_check_fes(struct snd_soc_pcm_runtime *rtd,
+			  int dir, int stream_tag)
 {
-	struct hdac_bus *bus;
-	struct hdac_ext_stream *stream;
-	struct snd_pcm_substream substream;
-	struct snd_sof_dev *sdev =
-		snd_soc_component_get_drvdata(dai->component);
-
-	bus = sof_to_bus(sdev);
-
-	memset(&substream, 0, sizeof(substream));
-	if (*tx_num == 1) {
-		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
-		stream = snd_hdac_ext_stream_assign(bus, &substream,
-						    HDAC_EXT_STREAM_TYPE_LINK);
-		if (!stream) {
-			dev_err(bus->dev, "error: failed to find a free hda ext stream for playback");
-			return -EBUSY;
-		}
+	struct snd_pcm_substream *fe_substream;
+	struct hdac_stream *fe_hstream;
+	struct snd_soc_dpcm *dpcm;
+
+	for_each_dpcm_fe(rtd, dir, dpcm) {
+		fe_substream = snd_soc_dpcm_get_substream(dpcm->fe, dir);
+		fe_hstream = fe_substream->runtime->private_data;
+		if (fe_hstream->stream_tag == stream_tag)
+			return true;
+	}
 
-		snd_soc_dai_set_dma_data(dai, &substream, stream);
-		*tx_slot = hdac_stream(stream)->stream_tag - 1;
+	return false;
+}
+
+static struct hdac_ext_stream *
+	hda_link_stream_assign(struct hdac_bus *bus,
+			       struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sof_intel_hda_stream *hda_stream;
+	struct hdac_ext_stream *res = NULL;
+	struct hdac_stream *stream = NULL;
 
-		dev_dbg(bus->dev, "link dma channel %d for playback", *tx_slot);
+	int stream_dir = substream->stream;
+
+	if (!bus->ppcap) {
+		dev_err(bus->dev, "stream type not supported\n");
+		return NULL;
 	}
 
-	if (*rx_num == 1) {
-		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
-		stream = snd_hdac_ext_stream_assign(bus, &substream,
-						    HDAC_EXT_STREAM_TYPE_LINK);
-		if (!stream) {
-			dev_err(bus->dev, "error: failed to find a free hda ext stream for capture");
-			return -EBUSY;
+	list_for_each_entry(stream, &bus->stream_list, list) {
+		struct hdac_ext_stream *hstream =
+			stream_to_hdac_ext_stream(stream);
+		if (stream->direction != substream->stream)
+			continue;
+
+		hda_stream = hstream_to_sof_hda_stream(hstream);
+
+		/* check if available */
+		if (!hstream->link_locked) {
+			if (stream->opened) {
+				/*
+				 * check if the stream tag matches the stream
+				 * tag of one of the connected FEs
+				 */
+				if (hda_check_fes(rtd, stream_dir,
+						  stream->stream_tag)) {
+					res = hstream;
+					break;
+				}
+			} else {
+				res = hstream;
+				break;
+			}
 		}
+	}
 
-		snd_soc_dai_set_dma_data(dai, &substream, stream);
-		*rx_slot = hdac_stream(stream)->stream_tag - 1;
-
-		dev_dbg(bus->dev, "link dma channel %d for capture", *rx_slot);
+	if (res) {
+		/*
+		 * Decouple host and link DMA. The decoupled flag
+		 * is updated in snd_hdac_ext_stream_decouple().
+		 */
+		if (!res->decoupled)
+			snd_hdac_ext_stream_decouple(bus, res, true);
+		spin_lock_irq(&bus->reg_lock);
+		res->link_locked = 1;
+		res->link_substream = substream;
+		spin_unlock_irq(&bus->reg_lock);
 	}
 
-	return 0;
+	return res;
 }
 
 static int hda_link_dma_params(struct hdac_ext_stream *stream,
@@ -122,6 +144,51 @@ static int hda_link_dma_params(struct hdac_ext_stream *stream,
 	return 0;
 }
 
+/* Send DAI_CONFIG IPC to the DAI that matches the dai_name and direction */
+static int hda_link_config_ipc(struct sof_intel_hda_stream *hda_stream,
+			       const char *dai_name, int channel, int dir)
+{
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+	struct sof_ipc_reply reply;
+	int ret = 0;
+
+	list_for_each_entry(sof_dai, &hda_stream->sdev->dai_list, list) {
+		if (!sof_dai->cpu_dai_name)
+			continue;
+
+		if (!strcmp(dai_name, sof_dai->cpu_dai_name) &&
+		    dir == sof_dai->comp_dai.direction) {
+			config = sof_dai->dai_config;
+
+			if (!config) {
+				dev_err(hda_stream->sdev->dev,
+					"error: no config for DAI %s\n",
+					sof_dai->name);
+				return -EINVAL;
+			}
+
+			/* update config with stream tag */
+			config->hda.link_dma_ch = channel;
+
+			/* send IPC */
+			ret = sof_ipc_tx_message(hda_stream->sdev->ipc,
+						 config->hdr.cmd,
+						 config,
+						 config->hdr.size,
+						 &reply, sizeof(reply));
+
+			if (ret < 0)
+				dev_err(hda_stream->sdev->dev,
+					"error: failed to set dai config for %s\n",
+					sof_dai->name);
+			return ret;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int hda_link_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params,
 			      struct snd_soc_dai *dai)
@@ -135,20 +202,31 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	struct hda_pipe_params p_params = {0};
 	struct hdac_ext_link *link;
 	int stream_tag;
+	int ret;
 
-	link_dev = snd_soc_dai_get_dma_data(dai, substream);
+	link_dev = hda_link_stream_assign(bus, substream);
+	if (!link_dev)
+		return -EBUSY;
+
+	stream_tag = hdac_stream(link_dev)->stream_tag;
+
+	hda_stream = hstream_to_sof_hda_stream(link_dev);
+
+	/* update the DSP with the new tag */
+	ret = hda_link_config_ipc(hda_stream, dai->name, stream_tag - 1,
+				  substream->stream);
+	if (ret < 0)
+		return ret;
+
+	snd_soc_dai_set_dma_data(dai, substream, (void *)link_dev);
 
-	hda_stream = container_of(link_dev, struct sof_intel_hda_stream,
-				  hda_stream);
 	hda_stream->hw_params_upon_resume = 0;
 
 	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
 	if (!link)
 		return -EINVAL;
 
-	stream_tag = hdac_stream(link_dev)->stream_tag;
-
-	/* set the stream tag in the codec dai dma params  */
+	/* set the stream tag in the codec dai dma params */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		snd_soc_dai_set_tdm_slot(codec_dai, stream_tag, 0, 0, 0);
 	else
@@ -181,8 +259,7 @@ static int hda_link_pcm_prepare(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	int stream = substream->stream;
 
-	hda_stream = container_of(link_dev, struct sof_intel_hda_stream,
-				  hda_stream);
+	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
 	/* setup hw_params again only if resuming from system suspend */
 	if (!hda_stream->hw_params_upon_resume)
@@ -199,8 +276,24 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 {
 	struct hdac_ext_stream *link_dev =
 				snd_soc_dai_get_dma_data(dai, substream);
+	struct sof_intel_hda_stream *hda_stream;
+	struct snd_soc_pcm_runtime *rtd;
+	struct hdac_ext_link *link;
+	struct hdac_stream *hstream;
+	struct hdac_bus *bus;
+	int stream_tag;
 	int ret;
 
+	hstream = substream->runtime->private_data;
+	bus = hstream->bus;
+	rtd = snd_pcm_substream_chip(substream);
+
+	link = snd_hdac_ext_bus_get_link(bus, rtd->codec_dai->component->name);
+	if (!link)
+		return -EINVAL;
+
+	hda_stream = hstream_to_sof_hda_stream(link_dev);
+
 	dev_dbg(dai->dev, "In %s cmd=%d\n", __func__, cmd);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -217,8 +310,22 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		snd_hdac_ext_link_stream_start(link_dev);
 		break;
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+		/*
+		 * clear and release link DMA channel. It will be assigned when
+		 * hw_params is set up again after resume.
+		 */
+		ret = hda_link_config_ipc(hda_stream, dai->name,
+					  DMA_CHAN_INVALID, substream->stream);
+		if (ret < 0)
+			return ret;
+		stream_tag = hdac_stream(link_dev)->stream_tag;
+		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+		snd_hdac_ext_stream_release(link_dev,
+					    HDAC_EXT_STREAM_TYPE_LINK);
+
+		/* fallthrough */
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		snd_hdac_ext_link_stream_clear(link_dev);
 		break;
@@ -228,62 +335,38 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/*
- * FIXME: This API is also abused since it's used for two purposes.
- * when the substream argument is NULL this function is used for cleanups
- * that aren't necessarily required, and called explicitly by handling
- * ASoC core structures, which is not recommended.
- * This part will be reworked in follow-up patches.
- */
 static int hda_link_hw_free(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
-	const char *name;
 	unsigned int stream_tag;
+	struct sof_intel_hda_stream *hda_stream;
 	struct hdac_bus *bus;
 	struct hdac_ext_link *link;
 	struct hdac_stream *hstream;
-	struct hdac_ext_stream *stream;
 	struct snd_soc_pcm_runtime *rtd;
 	struct hdac_ext_stream *link_dev;
-	struct snd_pcm_substream pcm_substream;
-
-	memset(&pcm_substream, 0, sizeof(pcm_substream));
-	if (substream) {
-		hstream = substream->runtime->private_data;
-		bus = hstream->bus;
-		rtd = snd_pcm_substream_chip(substream);
-		link_dev = snd_soc_dai_get_dma_data(dai, substream);
-		snd_hdac_ext_stream_decouple(bus, link_dev, false);
-		name = rtd->codec_dai->component->name;
-		link = snd_hdac_ext_bus_get_link(bus, name);
-		if (!link)
-			return -EINVAL;
-
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			stream_tag = hdac_stream(link_dev)->stream_tag;
-			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-		}
+	int ret;
 
-		link_dev->link_prepared = 0;
-	} else {
-		/* release all hda streams when dai link is unloaded */
-		pcm_substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
-		stream = snd_soc_dai_get_dma_data(dai, &pcm_substream);
-		if (stream) {
-			snd_soc_dai_set_dma_data(dai, &pcm_substream, NULL);
-			snd_hdac_ext_stream_release(stream,
-						    HDAC_EXT_STREAM_TYPE_LINK);
-		}
+	hstream = substream->runtime->private_data;
+	bus = hstream->bus;
+	rtd = snd_pcm_substream_chip(substream);
+	link_dev = snd_soc_dai_get_dma_data(dai, substream);
+	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
-		pcm_substream.stream = SNDRV_PCM_STREAM_CAPTURE;
-		stream = snd_soc_dai_get_dma_data(dai, &pcm_substream);
-		if (stream) {
-			snd_soc_dai_set_dma_data(dai, &pcm_substream, NULL);
-			snd_hdac_ext_stream_release(stream,
-						    HDAC_EXT_STREAM_TYPE_LINK);
-		}
-	}
+	/* free the link DMA channel in the FW */
+	ret = hda_link_config_ipc(hda_stream, dai->name, DMA_CHAN_INVALID,
+				  substream->stream);
+	if (ret < 0)
+		return ret;
+
+	link = snd_hdac_ext_bus_get_link(bus, rtd->codec_dai->component->name);
+	if (!link)
+		return -EINVAL;
+
+	stream_tag = hdac_stream(link_dev)->stream_tag;
+	snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+	snd_hdac_ext_stream_release(link_dev, HDAC_EXT_STREAM_TYPE_LINK);
+	link_dev->link_prepared = 0;
 
 	return 0;
 }
@@ -293,7 +376,6 @@ static const struct snd_soc_dai_ops hda_link_dai_ops = {
 	.hw_free = hda_link_hw_free,
 	.trigger = hda_link_pcm_trigger,
 	.prepare = hda_link_pcm_prepare,
-	.get_channel_map = hda_link_dma_get_channels,
 };
 #endif
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 10e061a5c39c..f6b8522471c9 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -60,6 +60,8 @@
 	(IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE) || \
 	 IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST))
 
+#define DMA_CHAN_INVALID	0xFFFFFFFF
+
 struct snd_sof_dev;
 struct snd_sof_ipc_msg;
 struct snd_sof_ipc;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 178256e338b1..432ae343f960 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2591,9 +2591,7 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
  */
 static int sof_link_hda_process(struct snd_sof_dev *sdev,
 				struct snd_soc_dai_link *link,
-				struct sof_ipc_dai_config *config,
-				int tx_slot,
-				int rx_slot)
+				struct sof_ipc_dai_config *config)
 {
 	struct sof_ipc_reply reply;
 	u32 size = sizeof(*config);
@@ -2606,22 +2604,11 @@ static int sof_link_hda_process(struct snd_sof_dev *sdev,
 			continue;
 
 		if (strcmp(link->name, sof_dai->name) == 0) {
-			if (sof_dai->comp_dai.direction ==
-			    SNDRV_PCM_STREAM_PLAYBACK) {
-				if (!link->dpcm_playback)
-					return -EINVAL;
-
-				config->hda.link_dma_ch = tx_slot;
-			} else {
-				if (!link->dpcm_capture)
-					return -EINVAL;
-
-				config->hda.link_dma_ch = rx_slot;
-			}
-
 			config->dai_index = sof_dai->comp_dai.dai_index;
 			found = 1;
 
+			config->hda.link_dma_ch = DMA_CHAN_INVALID;
+
 			/* save config in dai component */
 			sof_dai->dai_config = kmemdup(config, size, GFP_KERNEL);
 			if (!sof_dai->dai_config)
@@ -2667,10 +2654,6 @@ static int sof_link_hda_load(struct snd_soc_component *scomp, int index,
 	struct snd_soc_tplg_private *private = &cfg->priv;
 	struct snd_soc_dai *dai;
 	u32 size = sizeof(*config);
-	u32 tx_num = 0;
-	u32 tx_slot = 0;
-	u32 rx_num = 0;
-	u32 rx_slot = 0;
 	int ret;
 
 	/* init IPC */
@@ -2694,22 +2677,7 @@ static int sof_link_hda_load(struct snd_soc_component *scomp, int index,
 		return -EINVAL;
 	}
 
-	if (link->dpcm_playback)
-		tx_num = 1;
-
-	if (link->dpcm_capture)
-		rx_num = 1;
-
-	ret = snd_soc_dai_get_channel_map(dai, &tx_num, &tx_slot,
-					  &rx_num, &rx_slot);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to get dma channel for HDA%d\n",
-			config->dai_index);
-
-		return ret;
-	}
-
-	ret = sof_link_hda_process(sdev, link, config, tx_slot, rx_slot);
+	ret = sof_link_hda_process(sdev, link, config);
 	if (ret < 0)
 		dev_err(sdev->dev, "error: failed to process hda dai link %s",
 			link->name);
@@ -2837,17 +2805,6 @@ static int sof_link_hda_unload(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
-	/*
-	 * FIXME: this call to hw_free is mainly to release the link DMA ID.
-	 * This is abusing the API and handling SOC internals is not
-	 * recommended. This part will be reworked.
-	 */
-	if (dai->driver->ops->hw_free)
-		ret = dai->driver->ops->hw_free(NULL, dai);
-	if (ret < 0)
-		dev_err(sdev->dev, "error: failed to free hda resource for %s\n",
-			link->name);
-
 	return ret;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

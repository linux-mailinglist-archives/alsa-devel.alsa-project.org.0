Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FD146D20A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:21:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0102667;
	Wed,  8 Dec 2021 12:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0102667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962489;
	bh=OXybttWd5TSwmTFNgZgcoodMoZahF0FxbKSw2XP/3vU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZGnHvNtdYUwm+0DcdF4FeNNo1UX+uwBuOLjjr9NLBOwYJtAKaEyqwNgsc0nDyqhV
	 Rq8kX2UkqmOHZ9UcpUswoYFBknNFMsNTDAaWYUPSwxk84Ab/qQ6WBZvHTyoY5OGT/x
	 qldFi0/aWXkPjzO7nLM0pzzyg3Wr/sErDGmJKkko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61B74F805F1;
	Wed,  8 Dec 2021 12:12:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292FBF805F9; Wed,  8 Dec 2021 12:12:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3399DF805F1
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3399DF805F1
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548456"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600442"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:19 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 26/37] ASoC: Intel: avs: Generic PCM FE operations
Date: Wed,  8 Dec 2021 12:12:50 +0100
Message-Id: <20211208111301.1817725-27-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

Each stream in AVS is represented by FE and BE domain. FE path stands
for HOST part of the stream while BE stands for LINK (hardware) one.
While BE portion is interface specific, FE is not. Handle all standard
DAI operations to implement FE part of the stream.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c      | 351 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.c |   2 -
 2 files changed, 351 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 9c6b3938c542..c868da4751e7 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <sound/hda_register.h>
 #include <sound/hdaudio_ext.h>
+#include <sound/pcm_params.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include <sound/soc-component.h>
@@ -29,6 +30,356 @@ struct avs_pcm_dma_data {
 	struct hdac_ext_stream *host_stream;
 };
 
+static struct avs_tplg_path_template *
+avs_pcm_find_path_template(struct snd_soc_dai *dai,
+			   struct snd_soc_component *component,
+			   bool fe, int direction)
+{
+	struct snd_soc_dapm_widget *dw;
+	struct snd_soc_dapm_path *dp;
+	enum snd_soc_dapm_direction dir;
+
+	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+		dw = dai->capture_widget;
+		dir = fe ? SND_SOC_DAPM_DIR_OUT : SND_SOC_DAPM_DIR_IN;
+	} else {
+		dw = dai->playback_widget;
+		dir = fe ? SND_SOC_DAPM_DIR_IN : SND_SOC_DAPM_DIR_OUT;
+	}
+
+	dp = list_first_entry_or_null(&dw->edges[dir], typeof(*dp), list_node[dir]);
+	if (!dp)
+		return NULL;
+
+	/* Get the other widget, with actual path template data */
+	dw = (dp->source == dw) ? dp->sink : dp->source;
+
+	return dw->priv;
+}
+
+static int avs_pcm_hw_params(struct avs_dev *adev,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *fe_hw_params,
+			     struct snd_pcm_hw_params *be_hw_params,
+			     struct snd_soc_dai *dai, int dma_id)
+{
+	struct avs_pcm_dma_data *data;
+	struct avs_path *path;
+	int ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	dev_dbg(dai->dev, "%s FE hw_params str %p rtd %p",
+		__func__, substream, substream->runtime);
+	dev_dbg(dai->dev, "rate %d chn %d vbd %d bd %d\n",
+		params_rate(fe_hw_params), params_channels(fe_hw_params),
+		params_width(fe_hw_params),
+		params_physical_width(fe_hw_params));
+
+	dev_dbg(dai->dev, "%s BE hw_params str %p rtd %p",
+		__func__, substream, substream->runtime);
+	dev_dbg(dai->dev, "rate %d chn %d vbd %d bd %d\n",
+		params_rate(be_hw_params), params_channels(be_hw_params),
+		params_width(be_hw_params),
+		params_physical_width(be_hw_params));
+
+	path = avs_path_create(adev, dma_id, data->template, fe_hw_params, be_hw_params);
+	if (IS_ERR(path)) {
+		ret = PTR_ERR(path);
+		dev_err(dai->dev, "create BE path failed: %d\n", ret);
+		return ret;
+	}
+
+	data->path = path;
+	return 0;
+}
+
+static int avs_pcm_fe_hw_params(struct avs_dev *adev,
+				struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *fe_hw_params,
+				struct snd_soc_dai *dai, int dma_id)
+{
+	struct snd_pcm_hw_params *be_hw_params = NULL;
+	struct snd_soc_pcm_runtime *fe, *be;
+	struct snd_soc_dpcm *dpcm;
+
+	fe = asoc_substream_to_rtd(substream);
+	for_each_dpcm_be(fe, substream->stream, dpcm) {
+		be = dpcm->be;
+		be_hw_params = &be->dpcm[substream->stream].hw_params;
+	}
+
+	return avs_pcm_hw_params(adev, substream, fe_hw_params, be_hw_params,
+				 dai, dma_id);
+}
+
+static int avs_dai_prepare(struct avs_dev *adev,
+			   struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct avs_pcm_dma_data *data;
+	int ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (!data->path)
+		return 0;
+
+	ret = avs_path_reset(data->path);
+	if (ret < 0) {
+		dev_err(dai->dev, "reset path failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = avs_path_pause(data->path);
+	if (ret < 0)
+		dev_err(dai->dev, "pause path failed: %d\n", ret);
+	return ret;
+}
+
+static const unsigned int rates[] = {
+	8000, 11025, 12000, 16000,
+	22050, 24000, 32000, 44100,
+	48000, 64000, 88200, 96000,
+	128000, 176400, 192000,
+};
+
+static const struct snd_pcm_hw_constraint_list hw_rates = {
+	.count = ARRAY_SIZE(rates),
+	.list = rates,
+	.mask = 0,
+};
+
+static int avs_dai_fe_startup(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct avs_tplg_path_template *template;
+	struct avs_pcm_dma_data *data;
+	struct hdac_bus *bus = &adev->base.core;
+	struct hdac_ext_stream *estream;
+
+	template = avs_pcm_find_path_template(dai, dai->component, true,
+					      substream->stream);
+	if (!template) {
+		dev_err(dai->dev, "no %s path for dai %s, invalid tplg?\n",
+			snd_pcm_stream_str(substream), dai->name);
+		return -EINVAL;
+	}
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	estream = snd_hdac_ext_stream_assign(bus, substream,
+					     HDAC_EXT_STREAM_TYPE_HOST);
+	if (!estream) {
+		kfree(data);
+		return -EBUSY;
+	}
+
+	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	/* avoid wrap-around with wall-clock */
+	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME,
+				     20, 178000000);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &hw_rates);
+
+	dev_dbg(dai->dev, "%s fe STARTUP tag %d str %p",
+		__func__, hdac_stream(estream)->stream_tag, substream);
+
+	data->host_stream = estream;
+	data->template = template;
+	snd_soc_dai_set_dma_data(dai, substream, data);
+	snd_pcm_set_sync(substream);
+
+	return 0;
+}
+
+static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct avs_pcm_dma_data *data;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	snd_hdac_ext_stream_release(data->host_stream, HDAC_EXT_STREAM_TYPE_HOST);
+	kfree(data);
+}
+
+static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *hw_params,
+				struct snd_soc_dai *dai)
+{
+	struct avs_pcm_dma_data *data;
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct hdac_stream *hstream;
+	int ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (data->path)
+		return 0;
+
+	hstream = hdac_stream(data->host_stream);
+	hstream->bufsize = 0;
+	hstream->period_bytes = 0;
+	hstream->format_val = 0;
+
+	ret = avs_pcm_fe_hw_params(adev, substream, hw_params, dai,
+				   hstream->stream_tag - 1);
+	if (ret)
+		goto create_err;
+
+	ret = avs_path_bind(data->path);
+	if (ret < 0) {
+		dev_err(dai->dev, "bind FE <-> BE failed: %d\n", ret);
+		goto bind_err;
+	}
+
+	return 0;
+
+bind_err:
+	avs_path_free(data->path);
+	data->path = NULL;
+create_err:
+	snd_pcm_lib_free_pages(substream);
+	return ret;
+}
+
+static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct avs_pcm_dma_data *data;
+	struct hdac_stream *hstream;
+	int ret;
+
+	dev_dbg(dai->dev, "%s fe HW_FREE str %p rtd %p",
+		__func__, substream, substream->runtime);
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (!data->path)
+		return 0;
+
+	hstream = hdac_stream(data->host_stream);
+
+	ret = avs_path_unbind(data->path);
+	if (ret < 0)
+		dev_err(dai->dev, "unbind FE <-> BE failed: %d\n", ret);
+
+	avs_path_free(data->path);
+	data->path = NULL;
+	snd_hdac_stream_cleanup(hstream);
+	hstream->prepared = false;
+
+	ret = snd_pcm_lib_free_pages(substream);
+	if (ret < 0)
+		dev_dbg(dai->dev, "Failed to free pages!\n");
+
+	return ret;
+}
+
+static int avs_dai_fe_prepare(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct avs_pcm_dma_data *data;
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct hdac_stream *hstream;
+	struct hdac_bus *bus;
+	unsigned int format_val;
+	int ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	hstream = hdac_stream(data->host_stream);
+
+	if (hstream->prepared)
+		return 0;
+
+	bus = hstream->bus;
+	snd_hdac_ext_stream_decouple(bus, data->host_stream, true);
+	snd_hdac_stream_reset(hstream);
+
+	format_val = snd_hdac_calc_stream_format(runtime->rate,
+						 runtime->channels,
+						 runtime->format,
+						 runtime->sample_bits, 0);
+
+	ret = snd_hdac_stream_set_params(hstream, format_val);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_hdac_stream_setup(hstream);
+	if (ret < 0)
+		return ret;
+
+	ret = avs_dai_prepare(adev, substream, dai);
+	if (ret)
+		return ret;
+
+	hstream->prepared = true;
+	return 0;
+}
+
+static int avs_dai_fe_trigger(struct snd_pcm_substream *substream,
+			      int cmd, struct snd_soc_dai *dai)
+{
+	struct avs_pcm_dma_data *data;
+	struct hdac_stream *hstream;
+	struct hdac_bus *bus;
+	unsigned long flags;
+	int ret = 0;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	hstream = hdac_stream(data->host_stream);
+	bus = hstream->bus;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		spin_lock_irqsave(&bus->reg_lock, flags);
+		snd_hdac_stream_start(hstream, true);
+		spin_unlock_irqrestore(&bus->reg_lock, flags);
+
+		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
+		if (ret < 0)
+			dev_err(dai->dev, "run FE path failed: %d\n", ret);
+		break;
+
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = avs_path_pause(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "pause FE path failed: %d\n", ret);
+
+		spin_lock_irqsave(&bus->reg_lock, flags);
+		snd_hdac_stream_stop(hstream);
+		spin_unlock_irqrestore(&bus->reg_lock, flags);
+
+		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
+			ret = avs_path_reset(data->path);
+			if (ret < 0)
+				dev_err(dai->dev, "reset FE path failed: %d\n", ret);
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+const struct snd_soc_dai_ops avs_dai_fe_ops = {
+	.startup = avs_dai_fe_startup,
+	.shutdown = avs_dai_fe_shutdown,
+	.hw_params = avs_dai_fe_hw_params,
+	.hw_free = avs_dai_fe_hw_free,
+	.prepare = avs_dai_fe_prepare,
+	.trigger = avs_dai_fe_trigger,
+};
+
 static ssize_t topology_name_read(struct file *file, char __user *user_buf,
 				  size_t count, loff_t *ppos)
 {
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index ae267a3b7127..64f2a1e0c68a 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -15,8 +15,6 @@
 #include "avs.h"
 #include "topology.h"
 
-const struct snd_soc_dai_ops avs_dai_fe_ops;
-
 /* Vendor tuples manipulation helpers */
 #define avs_tplg_vendor_array_at(array, offset) \
 	((struct snd_soc_tplg_vendor_array *)((u8 *)array + offset))
-- 
2.25.1


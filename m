Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E080B528168
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:05:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 457C3168C;
	Mon, 16 May 2022 12:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 457C3168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652695513;
	bh=KS5EzSsrJx+RkNzfJ7dno8fMoJihQEeBSQ/MjQpJfNw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enZJMDg6rOZDg3XciWoGU9aTfD7WM24hNpGuBW7lcrgFHseAJDA3wHH3oczjHjwwb
	 NEqybY4d+E4Q9C+y8UXymj3fzdNKszY0cdbB4eCUFrRjeDKc9pNPyIJBsxUANCeFO5
	 RhTEDEtnt+FEifU9WJdI59DXjtgYfNeQhV3/rHqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BBC9F80542;
	Mon, 16 May 2022 12:02:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BF52F80171; Mon, 16 May 2022 12:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73949F8012F
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73949F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TMqmRR9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652695326; x=1684231326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KS5EzSsrJx+RkNzfJ7dno8fMoJihQEeBSQ/MjQpJfNw=;
 b=TMqmRR9gKXp0pCMdmKkapCrCjSkMgl1FNPaxtuMmF49svdrrRMzYBqWY
 Tg38cWs4XSI9qj312DnlNyl7SgzTCiSZoedOWAGTPwKE0Mr/xgKOf2zVr
 l9gXT0uAJ2p4sOVomi2AORVLAFQTJq9Pk6rCxPuEaDKRhFDEDRQuOJ6GL
 2l+TJYkBxgF7yWRW8BaC1p9Rja2xCYsPCDk7bPNFL1TUHD0BDkXkxzygU
 3o9Tk66E3T5C2KdwIQx29tJBSJfndDlgPAw+7ZwXdCJiU0CQVfcy3Hjx4
 BkqgO6mMuOfLuDkyly5ROGQSnsvzAAofG/+i3oobJbOAXa3F6vahZXTYB g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333846282"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333846282"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="522382548"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 16 May 2022 03:01:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 03/15] ASoC: Intel: avs: Generic PCM FE operations
Date: Mon, 16 May 2022 12:11:04 +0200
Message-Id: <20220516101116.190192-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516101116.190192-1-cezary.rojewski@intel.com>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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
 sound/soc/intel/avs/pcm.c      | 338 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.c |   2 -
 2 files changed, 338 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index cda2ec6f5da3..9d01ed37c11e 100644
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
@@ -29,6 +30,343 @@ struct avs_dma_data {
 	struct hdac_ext_stream *host_stream;
 };
 
+static struct avs_tplg_path_template *
+avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
+{
+	struct snd_soc_dapm_widget *dw;
+	struct snd_soc_dapm_path *dp;
+	enum snd_soc_dapm_direction dir;
+
+	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+		dw = dai->capture_widget;
+		dir = is_fe ? SND_SOC_DAPM_DIR_OUT : SND_SOC_DAPM_DIR_IN;
+	} else {
+		dw = dai->playback_widget;
+		dir = is_fe ? SND_SOC_DAPM_DIR_IN : SND_SOC_DAPM_DIR_OUT;
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
+static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai, bool is_fe)
+{
+	struct avs_tplg_path_template *template;
+	struct avs_dma_data *data;
+
+	template = avs_dai_find_path_template(dai, is_fe, substream->stream);
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
+	data->template = template;
+	snd_soc_dai_set_dma_data(dai, substream, data);
+
+	return 0;
+}
+
+static int avs_dai_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *fe_hw_params,
+			     struct snd_pcm_hw_params *be_hw_params, struct snd_soc_dai *dai,
+			     int dma_id)
+{
+	struct avs_dma_data *data;
+	struct avs_path *path;
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	int ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	dev_dbg(dai->dev, "%s FE hw_params str %p rtd %p",
+		__func__, substream, substream->runtime);
+	dev_dbg(dai->dev, "rate %d chn %d vbd %d bd %d\n",
+		params_rate(fe_hw_params), params_channels(fe_hw_params),
+		params_width(fe_hw_params), params_physical_width(fe_hw_params));
+
+	dev_dbg(dai->dev, "%s BE hw_params str %p rtd %p",
+		__func__, substream, substream->runtime);
+	dev_dbg(dai->dev, "rate %d chn %d vbd %d bd %d\n",
+		params_rate(be_hw_params), params_channels(be_hw_params),
+		params_width(be_hw_params), params_physical_width(be_hw_params));
+
+	path = avs_path_create(adev, dma_id, data->template, fe_hw_params, be_hw_params);
+	if (IS_ERR(path)) {
+		ret = PTR_ERR(path);
+		dev_err(dai->dev, "create path failed: %d\n", ret);
+		return ret;
+	}
+
+	data->path = path;
+	return 0;
+}
+
+static int avs_dai_prepare(struct avs_dev *adev, struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
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
+static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct avs_dma_data *data;
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct hdac_bus *bus = &adev->base.core;
+	struct hdac_ext_stream *host_stream;
+	int ret;
+
+	ret = avs_dai_startup(substream, dai, true);
+	if (ret)
+		return ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	host_stream = snd_hdac_ext_stream_assign(bus, substream, HDAC_EXT_STREAM_TYPE_HOST);
+	if (!host_stream) {
+		kfree(data);
+		return -EBUSY;
+	}
+
+	data->host_stream = host_stream;
+	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	/* avoid wrap-around with wall-clock */
+	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_TIME, 20, 178000000);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hw_rates);
+	snd_pcm_set_sync(substream);
+
+	dev_dbg(dai->dev, "%s fe STARTUP tag %d str %p",
+		__func__, hdac_stream(host_stream)->stream_tag, substream);
+
+	return 0;
+}
+
+static void avs_dai_fe_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	snd_hdac_ext_stream_release(data->host_stream, HDAC_EXT_STREAM_TYPE_HOST);
+	kfree(data);
+}
+
+static int avs_dai_fe_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
+{
+	struct snd_pcm_hw_params *be_hw_params = NULL;
+	struct snd_soc_pcm_runtime *fe, *be;
+	struct snd_soc_dpcm *dpcm;
+	struct avs_dma_data *data;
+	struct hdac_ext_stream *host_stream;
+	int ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (data->path)
+		return 0;
+
+	host_stream = data->host_stream;
+
+	hdac_stream(host_stream)->bufsize = 0;
+	hdac_stream(host_stream)->period_bytes = 0;
+	hdac_stream(host_stream)->format_val = 0;
+
+	fe = asoc_substream_to_rtd(substream);
+	for_each_dpcm_be(fe, substream->stream, dpcm) {
+		be = dpcm->be;
+		be_hw_params = &be->dpcm[substream->stream].hw_params;
+	}
+
+	ret = avs_dai_hw_params(substream, hw_params, be_hw_params, dai,
+				hdac_stream(host_stream)->stream_tag - 1);
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
+static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+	struct hdac_ext_stream *host_stream;
+	int ret;
+
+	dev_dbg(dai->dev, "%s fe HW_FREE str %p rtd %p",
+		__func__, substream, substream->runtime);
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (!data->path)
+		return 0;
+
+	host_stream = data->host_stream;
+
+	ret = avs_path_unbind(data->path);
+	if (ret < 0)
+		dev_err(dai->dev, "unbind FE <-> BE failed: %d\n", ret);
+
+	avs_path_free(data->path);
+	data->path = NULL;
+	snd_hdac_stream_cleanup(hdac_stream(host_stream));
+	hdac_stream(host_stream)->prepared = false;
+
+	ret = snd_pcm_lib_free_pages(substream);
+	if (ret < 0)
+		dev_dbg(dai->dev, "Failed to free pages!\n");
+
+	return ret;
+}
+
+static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct avs_dma_data *data;
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct hdac_ext_stream *host_stream;
+	struct hdac_bus *bus;
+	unsigned int format_val;
+	int ret;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	host_stream = data->host_stream;
+
+	if (hdac_stream(host_stream)->prepared)
+		return 0;
+
+	bus = hdac_stream(host_stream)->bus;
+	snd_hdac_ext_stream_decouple(bus, data->host_stream, true);
+	snd_hdac_stream_reset(hdac_stream(host_stream));
+
+	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
+						 runtime->sample_bits, 0);
+
+	ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_hdac_stream_setup(hdac_stream(host_stream));
+	if (ret < 0)
+		return ret;
+
+	ret = avs_dai_prepare(adev, substream, dai);
+	if (ret)
+		return ret;
+
+	hdac_stream(host_stream)->prepared = true;
+	return 0;
+}
+
+static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+	struct hdac_ext_stream *host_stream;
+	struct hdac_bus *bus;
+	unsigned long flags;
+	int ret = 0;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	host_stream = data->host_stream;
+	bus = hdac_stream(host_stream)->bus;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		spin_lock_irqsave(&bus->reg_lock, flags);
+		snd_hdac_stream_start(hdac_stream(host_stream), true);
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
+		snd_hdac_stream_stop(hdac_stream(host_stream));
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
 static ssize_t topology_name_read(struct file *file, char __user *user_buf, size_t count,
 				  loff_t *ppos)
 {
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index d3fd5e145ee1..4ea799658ed9 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -15,8 +15,6 @@
 #include "avs.h"
 #include "topology.h"
 
-const struct snd_soc_dai_ops avs_dai_fe_ops;
-
 /* Get pointer to vendor array at the specified offset. */
 #define avs_tplg_vendor_array_at(array, offset) \
 	((struct snd_soc_tplg_vendor_array *)((u8 *)array + offset))
-- 
2.25.1


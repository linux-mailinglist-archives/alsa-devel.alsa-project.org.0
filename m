Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F056946D20F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:22:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99FD32689;
	Wed,  8 Dec 2021 12:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99FD32689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962536;
	bh=H+qEZmoLQsHqStyDMRPXYlq7EtYSIppK0ml9uofPCFw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IacvYC9maUdzGuFpLLSFlOHJ0X5NpCAXSUXj6gMjIQPSUOB1CjINcmXHahNuiHt/z
	 Ape2aQbpaHm7dENykpZAANntivY1vZWVTsI5kw5tlhqfAPb52VO8FpliYFyHNoEZGL
	 0RlrEhXJbsj345P34/A/46ntrsnnH0JnLbxpbyjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C33BF80607;
	Wed,  8 Dec 2021 12:12:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D9BAF80600; Wed,  8 Dec 2021 12:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37E78F805FA
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E78F805FA
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548471"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548471"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600483"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:26 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 28/37] ASoC: Intel: avs: HDA PCM BE operations
Date: Wed,  8 Dec 2021 12:12:52 +0100
Message-Id: <20211208111301.1817725-29-cezary.rojewski@intel.com>
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

HDA streaming in DSP world means enlisting HDAudio links as BE
interfaces. Another difference when compared to its DMIC and I2S friends
is lack of NHLT blob usage - no additional hardware configuration is
needed.

Similarly to SSP component, HDA populates its DAIs dynamically, here by
the means of codec->pcm_list_head. Allows for cutting the number of soc
components required to support the interface.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h |   1 +
 sound/soc/intel/avs/pcm.c | 350 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 351 insertions(+)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 90c3a4e83666..74194d8c04fe 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -257,5 +257,6 @@ extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 int avs_dmic_platform_register(struct avs_dev *adev, const char *name);
 int avs_ssp_platform_register(struct avs_dev *adev, const char *name,
 			      unsigned long port_mask, unsigned long *tdms);
+int avs_hda_platform_register(struct avs_dev *adev, const char *name);
 
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index e8900155cd34..e013b3bd14b3 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -281,6 +281,156 @@ static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.trigger = avs_dai_nonhda_be_trigger,
 };
 
+static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *hw_params,
+				    struct snd_soc_dai *dai)
+{
+	struct avs_pcm_dma_data *data;
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct hdac_ext_stream *estream;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (data->path)
+		return 0;
+
+	estream = substream->runtime->private_data;
+
+	return avs_pcm_be_hw_params(adev, substream, hw_params, dai,
+				    hdac_stream(estream)->stream_tag - 1);
+}
+
+static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct avs_pcm_dma_data *data;
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct hdac_ext_stream *estream;
+	struct hdac_ext_link *link;
+	struct hda_codec *codec;
+
+	dev_dbg(dai->dev, "%s: %s\n", __func__, dai->name);
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (!data->path)
+		return 0;
+
+	estream = substream->runtime->private_data;
+	estream->link_prepared = false;
+	avs_path_free(data->path);
+	data->path = NULL;
+
+	/* clear link to stream mapping */
+	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	link = snd_hdac_ext_bus_link_at(&codec->bus->core, codec->core.addr);
+	if (!link)
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		struct hdac_stream *hstream = hdac_stream(estream);
+
+		snd_hdac_ext_link_clear_stream_id(link, hstream->stream_tag);
+	}
+
+	return 0;
+}
+
+static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct hdac_ext_stream *estream = runtime->private_data;
+	struct hdac_ext_link *link;
+	struct hda_codec *codec;
+	struct hdac_bus *bus;
+	unsigned int format_val;
+	int ret;
+
+	if (estream->link_prepared)
+		return 0;
+
+	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	bus = &codec->bus->core;
+	format_val = snd_hdac_calc_stream_format(runtime->rate,
+						 runtime->channels,
+						 runtime->format,
+						 runtime->sample_bits, 0);
+
+	snd_hdac_ext_stream_decouple(bus, estream, true);
+	snd_hdac_ext_link_stream_reset(estream);
+	snd_hdac_ext_link_stream_setup(estream, format_val);
+
+	link = snd_hdac_ext_bus_link_at(bus, codec->core.addr);
+	if (!link)
+		return -EINVAL;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		struct hdac_stream *hstream = hdac_stream(estream);
+
+		snd_hdac_ext_link_set_stream_id(link, hstream->stream_tag);
+	}
+
+	ret = avs_dai_prepare(to_avs_dev(dai->dev), substream, dai);
+	if (ret)
+		return ret;
+
+	estream->link_prepared = true;
+	return 0;
+}
+
+static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream,
+				  int cmd, struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *estream;
+	struct avs_pcm_dma_data *data;
+	int ret = 0;
+
+	dev_dbg(dai->dev, "entry %s cmd=%d\n", __func__, cmd);
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	estream = substream->runtime->private_data;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_hdac_ext_link_stream_start(estream);
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
+		snd_hdac_ext_link_stream_clear(estream);
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
+static const struct snd_soc_dai_ops avs_dai_hda_be_ops = {
+	.startup = avs_dai_nonhda_be_startup,
+	.shutdown = avs_dai_nonhda_be_shutdown,
+	.hw_params = avs_dai_hda_be_hw_params,
+	.hw_free = avs_dai_hda_be_hw_free,
+	.prepare = avs_dai_hda_be_prepare,
+	.trigger = avs_dai_hda_be_trigger,
+};
+
 static const unsigned int rates[] = {
 	8000, 11025, 12000, 16000,
 	22050, 24000, 32000, 44100,
@@ -888,3 +1038,203 @@ int avs_ssp_platform_register(struct avs_dev *adev, const char *name,
 	return avs_soc_component_register(adev->dev, name, &avs_component_driver,
 					  cpus, cpu_count);
 }
+
+/* HD-Audio CPU DAI template */
+static const struct snd_soc_dai_driver hda_cpu_dai = {
+	.ops = &avs_dai_hda_be_ops,
+	.playback = {
+		.channels_min	= 1,
+		.channels_max	= 8,
+		.rates		= SNDRV_PCM_RATE_8000_192000,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
+				  SNDRV_PCM_FMTBIT_S24_LE |
+				  SNDRV_PCM_FMTBIT_S32_LE,
+	},
+	.capture = {
+		.channels_min	= 1,
+		.channels_max	= 8,
+		.rates		= SNDRV_PCM_RATE_8000_192000,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
+				  SNDRV_PCM_FMTBIT_S24_LE |
+				  SNDRV_PCM_FMTBIT_S32_LE,
+	},
+};
+
+static void avs_component_hda_unregister_dais(struct snd_soc_component *component)
+{
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_dai *dai, *save;
+	struct hda_codec *codec;
+	char name[32];
+
+	mach = dev_get_platdata(component->card->dev);
+	codec = mach->pdata;
+	sprintf(name, "%s-cpu", dev_name(&codec->core.dev));
+
+	for_each_component_dais_safe(component, dai, save) {
+		if (!strstr(dai->driver->name, name))
+			continue;
+
+		if (dai->playback_widget)
+			snd_soc_dapm_free_widget(dai->playback_widget);
+		if (dai->capture_widget)
+			snd_soc_dapm_free_widget(dai->capture_widget);
+		snd_soc_unregister_dai(dai);
+	}
+}
+
+static int avs_component_hda_probe(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm;
+	struct snd_soc_dai_driver *dais;
+	struct snd_soc_acpi_mach *mach;
+	struct hda_codec *codec;
+	struct hda_pcm *pcm;
+	const char *cname;
+	int pcm_count = 0, ret, i;
+
+	mach = dev_get_platdata(component->card->dev);
+	if (!mach)
+		return -EINVAL;
+
+	codec = mach->pdata;
+	if (list_empty(&codec->pcm_list_head))
+		return -EINVAL;
+	list_for_each_entry(pcm, &codec->pcm_list_head, list)
+		pcm_count++;
+
+	dais = devm_kcalloc(component->dev, pcm_count, sizeof(*dais),
+			    GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
+	cname = dev_name(&codec->core.dev);
+	dapm = snd_soc_component_get_dapm(component);
+	pcm = list_first_entry(&codec->pcm_list_head, struct hda_pcm, list);
+
+	for (i = 0; i < pcm_count; i++, pcm = list_next_entry(pcm, list)) {
+		struct snd_soc_dai *dai;
+
+		memcpy(&dais[i], &hda_cpu_dai, sizeof(*dais));
+		dais[i].id = i;
+		dais[i].name = devm_kasprintf(component->dev, GFP_KERNEL,
+					      "%s-cpu%d", cname, i);
+		if (!dais[i].name) {
+			ret = -ENOMEM;
+			goto exit;
+		}
+
+		if (pcm->stream[0].substreams) {
+			dais[i].playback.stream_name =
+				devm_kasprintf(component->dev, GFP_KERNEL,
+					       "%s-cpu%d Tx", cname, i);
+			if (!dais[i].playback.stream_name) {
+				ret = -ENOMEM;
+				goto exit;
+			}
+		}
+
+		if (pcm->stream[1].substreams) {
+			dais[i].capture.stream_name =
+				devm_kasprintf(component->dev, GFP_KERNEL,
+					       "%s-cpu%d Rx", cname, i);
+			if (!dais[i].capture.stream_name) {
+				ret = -ENOMEM;
+				goto exit;
+			}
+		}
+
+		dai = snd_soc_register_dai(component, &dais[i], false);
+		if (!dai) {
+			dev_err(component->dev, "register dai for %s failed\n",
+				pcm->name);
+			ret = -EINVAL;
+			goto exit;
+		}
+
+		ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
+		if (ret < 0) {
+			dev_err(component->dev, "create widgets failed: %d\n",
+				ret);
+			goto exit;
+		}
+	}
+
+	ret = avs_component_probe(component);
+exit:
+	if (ret)
+		avs_component_hda_unregister_dais(component);
+
+	return ret;
+}
+
+static void avs_component_hda_remove(struct snd_soc_component *component)
+{
+	avs_component_hda_unregister_dais(component);
+	avs_component_remove(component);
+}
+
+static int avs_component_hda_open(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct hdac_ext_stream *estream;
+	struct hda_codec *codec;
+
+	/* handling no BE paths here */
+	if (!rtd->dai_link->no_pcm)
+		return avs_component_open(component, substream);
+
+	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	estream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
+					     HDAC_EXT_STREAM_TYPE_LINK);
+	if (!estream)
+		return -EBUSY;
+
+	substream->runtime->private_data = estream;
+	return 0;
+}
+
+static int avs_component_hda_close(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct hdac_ext_stream *estream;
+
+	/* handling no BE paths here */
+	if (!rtd->dai_link->no_pcm)
+		return 0;
+
+	estream = substream->runtime->private_data;
+	snd_hdac_ext_stream_release(estream, HDAC_EXT_STREAM_TYPE_LINK);
+	substream->runtime->private_data = NULL;
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver avs_hda_component_driver = {
+	.name			= "avs-hda-pcm",
+	.probe			= avs_component_hda_probe,
+	.remove			= avs_component_hda_remove,
+	.open			= avs_component_hda_open,
+	.close			= avs_component_hda_close,
+	.pointer		= avs_component_pointer,
+	.mmap			= avs_component_mmap,
+	.pcm_construct		= avs_component_construct,
+	/*
+	 * hda platform component's probe() is dependent on
+	 * codec->pcm_list_head, it needs to be initialized after codec
+	 * component. remove_order is here for completeness sake
+	 */
+	.probe_order		= SND_SOC_COMP_ORDER_LATE,
+	.remove_order		= SND_SOC_COMP_ORDER_EARLY,
+	.module_get_upon_open	= 1,
+	.topology_name_prefix	= "intel/avs",
+	.non_legacy_dai_naming	= true,
+};
+
+int avs_hda_platform_register(struct avs_dev *adev, const char *name)
+{
+	return avs_soc_component_register(adev->dev, name,
+					  &avs_hda_component_driver, NULL, 0);
+}
-- 
2.25.1


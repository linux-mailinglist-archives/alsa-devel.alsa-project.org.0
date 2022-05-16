Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E66528167
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:05:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB7616B5;
	Mon, 16 May 2022 12:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB7616B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652695500;
	bh=KJGRpht/OLf43Jc0/e9jNetyueHwjrsTWxUS2sSOdME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iBj20Jr3NmyVm/EPB0RKpbDLlxBkJTgFRFGF0wNB5Nk8Nn1DA9/UFj7k04471QBCe
	 6/4PDyNRLQPo5ZgYGNOFIPzsRstw3caGxivtve1uGhgiMLQAnip+ix136KGysEiVyJ
	 oxRZcOx3oW0M7svhoMruPc5VFsDHJWLD1qeCP99c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71DC8F8053B;
	Mon, 16 May 2022 12:02:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BFB5F80534; Mon, 16 May 2022 12:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A71F801D5
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A71F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VG43qWEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652695327; x=1684231327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KJGRpht/OLf43Jc0/e9jNetyueHwjrsTWxUS2sSOdME=;
 b=VG43qWEOq/HrQcfz6VOSewDEVFlJWMJR6a6rhavSVZyVi7vy5c1eSVip
 gyTR+Oj6VwV/0tRUye1HzsFZoXuAkdzVd6KS9xj33TNbuBVon1mSWdGhf
 /N2x/Kh+QzTxkmuDZVXhFd7W3iECL0lbmXvcVrHAir4eweWvH0XF6TWyr
 UGtcoWO8g50RI0ADh/3DaiijY9gfIx4Lu9vgYhds5f/8bEwvd1YsqPdCZ
 Ude0WQ6WDPC7XJ6NDupCjdPgre/Jt2dCQ9FtUSKXeSGzVjqZZNh3WtlM7
 gAn647ZVUHVAXrtzuyV8ISYtwDpDF1Ts/j6eSlM7BcHb8ZMRCNks4zUso g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333846302"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333846302"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="522382594"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 16 May 2022 03:01:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 05/15] ASoC: Intel: avs: HDA PCM BE operations
Date: Mon, 16 May 2022 12:11:06 +0200
Message-Id: <20220516101116.190192-6-cezary.rojewski@intel.com>
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

HDA streaming in DSP world means enlisting HDAudio links as BE
interfaces. Another difference when compared to its DMIC and I2S friends
is lack of NHLT blob usage - no additional hardware configuration is
needed.

Similarly to I2S component, HDA populates its DAIs dynamically, here by
the means of codec->pcm_list_head. Allows for cutting the number of soc
components required to support the interface.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h |   1 +
 sound/soc/intel/avs/pcm.c | 349 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 350 insertions(+)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index b4fd67fac17d..e628f78d1864 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -273,5 +273,6 @@ extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 int avs_dmic_platform_register(struct avs_dev *adev, const char *name);
 int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned long port_mask,
 			      unsigned long *tdms);
+int avs_hda_platform_register(struct avs_dev *adev, const char *name);
 
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 079fa19f7d7b..668f533578a6 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -245,6 +245,155 @@ static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.trigger = avs_dai_nonhda_be_trigger,
 };
 
+static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return avs_dai_startup(substream, dai, false);
+}
+
+static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return avs_dai_nonhda_be_shutdown(substream, dai);
+}
+
+static int avs_dai_hda_be_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+	struct hdac_ext_stream *link_stream;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (data->path)
+		return 0;
+
+	link_stream = substream->runtime->private_data;
+
+	return avs_dai_be_hw_params(substream, hw_params, dai,
+				    hdac_stream(link_stream)->stream_tag - 1);
+}
+
+static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct hdac_ext_stream *link_stream;
+	struct hdac_ext_link *link;
+	struct hda_codec *codec;
+
+	dev_dbg(dai->dev, "%s: %s\n", __func__, dai->name);
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (!data->path)
+		return 0;
+
+	link_stream = substream->runtime->private_data;
+	link_stream->link_prepared = false;
+	avs_path_free(data->path);
+	data->path = NULL;
+
+	/* clear link <-> stream mapping */
+	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	link = snd_hdac_ext_bus_link_at(&codec->bus->core, codec->core.addr);
+	if (!link)
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		snd_hdac_ext_link_clear_stream_id(link, hdac_stream(link_stream)->stream_tag);
+
+	return 0;
+}
+
+static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct hdac_ext_stream *link_stream = runtime->private_data;
+	struct hdac_ext_link *link;
+	struct hda_codec *codec;
+	struct hdac_bus *bus;
+	unsigned int format_val;
+	int ret;
+
+	if (link_stream->link_prepared)
+		return 0;
+
+	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	bus = &codec->bus->core;
+	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
+						 runtime->sample_bits, 0);
+
+	snd_hdac_ext_stream_decouple(bus, link_stream, true);
+	snd_hdac_ext_link_stream_reset(link_stream);
+	snd_hdac_ext_link_stream_setup(link_stream, format_val);
+
+	link = snd_hdac_ext_bus_link_at(bus, codec->core.addr);
+	if (!link)
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		snd_hdac_ext_link_set_stream_id(link, hdac_stream(link_stream)->stream_tag);
+
+	ret = avs_dai_prepare(to_avs_dev(dai->dev), substream, dai);
+	if (ret)
+		return ret;
+
+	link_stream->link_prepared = true;
+	return 0;
+}
+
+static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
+				  struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *link_stream;
+	struct avs_dma_data *data;
+	int ret = 0;
+
+	dev_dbg(dai->dev, "entry %s cmd=%d\n", __func__, cmd);
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	link_stream = substream->runtime->private_data;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_hdac_ext_link_stream_start(link_stream);
+
+		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
+		if (ret < 0)
+			dev_err(dai->dev, "run BE path failed: %d\n", ret);
+		break;
+
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = avs_path_pause(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
+
+		snd_hdac_ext_link_stream_clear(link_stream);
+
+		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
+			ret = avs_path_reset(data->path);
+			if (ret < 0)
+				dev_err(dai->dev, "reset BE path failed: %d\n", ret);
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
+	.startup = avs_dai_hda_be_startup,
+	.shutdown = avs_dai_hda_be_shutdown,
+	.hw_params = avs_dai_hda_be_hw_params,
+	.hw_free = avs_dai_hda_be_hw_free,
+	.prepare = avs_dai_hda_be_prepare,
+	.trigger = avs_dai_hda_be_trigger,
+};
+
 static const unsigned int rates[] = {
 	8000, 11025, 12000, 16000,
 	22050, 24000, 32000, 44100,
@@ -831,3 +980,203 @@ int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned l
 plat_register:
 	return avs_soc_component_register(adev->dev, name, &avs_component_driver, cpus, cpu_count);
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
+	struct hdac_ext_stream *link_stream;
+	struct hda_codec *codec;
+
+	/* only BE DAI links are handled here */
+	if (!rtd->dai_link->no_pcm)
+		return avs_component_open(component, substream);
+
+	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
+	link_stream = snd_hdac_ext_stream_assign(&codec->bus->core, substream,
+					     HDAC_EXT_STREAM_TYPE_LINK);
+	if (!link_stream)
+		return -EBUSY;
+
+	substream->runtime->private_data = link_stream;
+	return 0;
+}
+
+static int avs_component_hda_close(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct hdac_ext_stream *link_stream;
+
+	/* only BE DAI links are handled here */
+	if (!rtd->dai_link->no_pcm)
+		return 0;
+
+	link_stream = substream->runtime->private_data;
+	snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9C528164
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4028C16A5;
	Mon, 16 May 2022 12:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4028C16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652695469;
	bh=v9Oy3M6qVpi9RQ+ICLK4FNOi8eIZA530mpjwNEP1pZY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rAIFHyiq+mJeAjpCvgXfnm+1r7+Wz+LWiKp5NZhPPOxjT2TURnZZDlrdzsZQVIgBH
	 2eYjH6ID+jGPuGUD71PDnMXaoT0lF7/vxzs3gQmKx0rg0HJmK4+GU78PFsB2OvMKqU
	 qf3AlVnW2B5yFsSf8mvVXRQNn4DW5g5bZBJ0KlL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D419F8052D;
	Mon, 16 May 2022 12:02:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1A6EF8052E; Mon, 16 May 2022 12:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0063AF800D8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0063AF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bCZ26c6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652695327; x=1684231327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v9Oy3M6qVpi9RQ+ICLK4FNOi8eIZA530mpjwNEP1pZY=;
 b=bCZ26c6jNqbcaz+u9sEx3cf6RCYNK5y+X6waLX+7aB6n5xxQuZGzs0OP
 DQtneshbLa7B1gWMhrgsxaaRwlKwLKjLk/YEXPpKrxgkanYBDIhzpkzmI
 d5uAwuTXI2STsiaSaMdJtb09XzUI981q42bUfUmd25TaW+HkKwmHmYJuc
 2xypJNJ9GNUggKOovuDsnKRx3gIAsnVgdjflPS3nxjvR7rnZl8T163aji
 ET2KhcQlxNQYUD1XpuFVPuFGbvE+Ry152nS9/3XE21jT8nLMhVPgDwPEL
 D/pp1r0xcqnl9zzuJQwXmdXz/1ym25KN4EOh4rCy6iWJ64uDqeXJ8L/JS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333846294"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333846294"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="522382568"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 16 May 2022 03:01:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 04/15] ASoC: Intel: avs: non-HDA PCM BE operations
Date: Mon, 16 May 2022 12:11:05 +0200
Message-Id: <20220516101116.190192-5-cezary.rojewski@intel.com>
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

DMIC and I2S interfaces differ in DMA operations from the HDAudio
interface. With that in mind, implement all DAI operations to handle
non-HDA BE interfaces.

To prevent code duplication in newly added code, I2S platform
registering is dynamic - makes use of specified port_mask and TDMs
array to populate as many DAIs as required.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h |   4 +
 sound/soc/intel/avs/pcm.c | 222 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 225 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 14b4a780a91c..b4fd67fac17d 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -270,4 +270,8 @@ struct avs_soc_component {
 
 extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 
+int avs_dmic_platform_register(struct avs_dev *adev, const char *name);
+int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned long port_mask,
+			      unsigned long *tdms);
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 9d01ed37c11e..079fa19f7d7b 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -112,6 +112,23 @@ static int avs_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *be_hw_params, struct snd_soc_dai *dai,
+				int dma_id)
+{
+	struct snd_pcm_hw_params *fe_hw_params = NULL;
+	struct snd_soc_pcm_runtime *fe, *be;
+	struct snd_soc_dpcm *dpcm;
+
+	be = asoc_substream_to_rtd(substream);
+	for_each_dpcm_fe(be, substream->stream, dpcm) {
+		fe = dpcm->fe;
+		fe_hw_params = &fe->dpcm[substream->stream].hw_params;
+	}
+
+	return avs_dai_hw_params(substream, fe_hw_params, be_hw_params, dai, dma_id);
+}
+
 static int avs_dai_prepare(struct avs_dev *adev, struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
@@ -134,6 +151,100 @@ static int avs_dai_prepare(struct avs_dev *adev, struct snd_pcm_substream *subst
 	return ret;
 }
 
+static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return avs_dai_startup(substream, dai, false);
+}
+
+static void avs_dai_nonhda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(data);
+}
+
+static int avs_dai_nonhda_be_hw_params(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (data->path)
+		return 0;
+
+	/* Actual port-id comes from topology. */
+	return avs_dai_be_hw_params(substream, hw_params, dai, 0);
+}
+
+static int avs_dai_nonhda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+
+	dev_dbg(dai->dev, "%s: %s\n", __func__, dai->name);
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+	if (data->path) {
+		avs_path_free(data->path);
+		data->path = NULL;
+	}
+
+	return 0;
+}
+
+static int avs_dai_nonhda_be_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	return avs_dai_prepare(to_avs_dev(dai->dev), substream, dai);
+}
+
+static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cmd,
+				     struct snd_soc_dai *dai)
+{
+	struct avs_dma_data *data;
+	int ret = 0;
+
+	data = snd_soc_dai_get_dma_data(dai, substream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
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
+static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
+	.startup = avs_dai_nonhda_be_startup,
+	.shutdown = avs_dai_nonhda_be_shutdown,
+	.hw_params = avs_dai_nonhda_be_hw_params,
+	.hw_free = avs_dai_nonhda_be_hw_free,
+	.prepare = avs_dai_nonhda_be_prepare,
+	.trigger = avs_dai_nonhda_be_trigger,
+};
+
 static const unsigned int rates[] = {
 	8000, 11025, 12000, 16000,
 	22050, 24000, 32000, 44100,
@@ -589,7 +700,6 @@ static const struct snd_soc_component_driver avs_component_driver = {
 	.non_legacy_dai_naming	= true,
 };
 
-__maybe_unused
 static int avs_soc_component_register(struct device *dev, const char *name,
 				      const struct snd_soc_component_driver *drv,
 				      struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
@@ -611,3 +721,113 @@ static int avs_soc_component_register(struct device *dev, const char *name,
 
 	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
 }
+
+static struct snd_soc_dai_driver dmic_cpu_dais[] = {
+{
+	.name = "DMIC Pin",
+	.ops = &avs_dai_nonhda_be_ops,
+	.capture = {
+		.stream_name	= "DMIC Rx",
+		.channels_min	= 1,
+		.channels_max	= 4,
+		.rates		= SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_48000,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+	},
+},
+{
+	.name = "DMIC WoV Pin",
+	.ops = &avs_dai_nonhda_be_ops,
+	.capture = {
+		.stream_name	= "DMIC WoV Rx",
+		.channels_min	= 1,
+		.channels_max	= 4,
+		.rates		= SNDRV_PCM_RATE_16000,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+	},
+},
+};
+
+int avs_dmic_platform_register(struct avs_dev *adev, const char *name)
+{
+	return avs_soc_component_register(adev->dev, name, &avs_component_driver, dmic_cpu_dais,
+					  ARRAY_SIZE(dmic_cpu_dais));
+}
+
+static const struct snd_soc_dai_driver i2s_dai_template = {
+	.ops = &avs_dai_nonhda_be_ops,
+	.playback = {
+		.channels_min	= 1,
+		.channels_max	= 8,
+		.rates		= SNDRV_PCM_RATE_8000_192000 |
+				  SNDRV_PCM_RATE_KNOT,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
+				  SNDRV_PCM_FMTBIT_S24_LE |
+				  SNDRV_PCM_FMTBIT_S32_LE,
+	},
+	.capture = {
+		.channels_min	= 1,
+		.channels_max	= 8,
+		.rates		= SNDRV_PCM_RATE_8000_192000 |
+				  SNDRV_PCM_RATE_KNOT,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
+				  SNDRV_PCM_FMTBIT_S24_LE |
+				  SNDRV_PCM_FMTBIT_S32_LE,
+	},
+};
+
+int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned long port_mask,
+			      unsigned long *tdms)
+{
+	struct snd_soc_dai_driver *cpus, *dai;
+	size_t ssp_count, cpu_count;
+	int i, j;
+
+	ssp_count = adev->hw_cfg.i2s_caps.ctrl_count;
+	cpu_count = hweight_long(port_mask);
+	if (tdms)
+		for_each_set_bit(i, &port_mask, ssp_count)
+			cpu_count += hweight_long(tdms[i]);
+
+	cpus = devm_kzalloc(adev->dev, sizeof(*cpus) * cpu_count, GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	dai = cpus;
+	for_each_set_bit(i, &port_mask, ssp_count) {
+		memcpy(dai, &i2s_dai_template, sizeof(*dai));
+
+		dai->name =
+			devm_kasprintf(adev->dev, GFP_KERNEL, "SSP%d Pin", i);
+		dai->playback.stream_name =
+			devm_kasprintf(adev->dev, GFP_KERNEL, "ssp%d Tx", i);
+		dai->capture.stream_name =
+			devm_kasprintf(adev->dev, GFP_KERNEL, "ssp%d Rx", i);
+
+		if (!dai->name || !dai->playback.stream_name || !dai->capture.stream_name)
+			return -ENOMEM;
+		dai++;
+	}
+
+	if (!tdms)
+		goto plat_register;
+
+	for_each_set_bit(i, &port_mask, ssp_count) {
+		for_each_set_bit(j, &tdms[i], ssp_count) {
+			memcpy(dai, &i2s_dai_template, sizeof(*dai));
+
+			dai->name =
+				devm_kasprintf(adev->dev, GFP_KERNEL, "SSP%d:%d Pin", i, j);
+			dai->playback.stream_name =
+				devm_kasprintf(adev->dev, GFP_KERNEL, "ssp%d:%d Tx", i, j);
+			dai->capture.stream_name =
+				devm_kasprintf(adev->dev, GFP_KERNEL, "ssp%d:%d Rx", i, j);
+
+			if (!dai->name || !dai->playback.stream_name || !dai->capture.stream_name)
+				return -ENOMEM;
+			dai++;
+		}
+	}
+
+plat_register:
+	return avs_soc_component_register(adev->dev, name, &avs_component_driver, cpus, cpu_count);
+}
-- 
2.25.1


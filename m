Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D1F604EFD
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 19:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CE90AE14;
	Wed, 19 Oct 2022 19:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CE90AE14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666201158;
	bh=XsQ15TFza76An6GR6XAFGjPRVbHgNP+tkalwppMswQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDl0MmiA0i20I2cNUEcCNm8MJ4ZkjHGi5wfuT3JHcYJV/MUCKRmYCph1eU9xskPKu
	 aZFW0u6pl/Ks9ZSeeECqXC/R5ETF5s0LjAMzdqsm+fT3BaSVgIGHatCr6NN3ck00tG
	 eYgdyUYCvkiUDMoG/hGl8a3ZsSkSRokBT2X/4JFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BACECF8054A;
	Wed, 19 Oct 2022 19:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BEF6F80543; Wed, 19 Oct 2022 19:37:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8314EF80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 19:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8314EF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WG2jB8/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666201054; x=1697737054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsQ15TFza76An6GR6XAFGjPRVbHgNP+tkalwppMswQ8=;
 b=WG2jB8/a/RoYqsiVeDe1+K3EbtsVBoka2cklz65UHV8dTRAiPJg8OoPk
 ptgx9R55cSTxCvBqm3mEm0dmul1i6rd0Sw1zVCbtzq/ERv9YXkw6UaPXG
 Bm909ThGdXrdbj7xMBqAkjE/oIIkHrfIfMJwgBBGnhYiN9Xa5FmJ7qVmB
 qEt9PcG9ovpe1Io88W8pOGs+RqDOlUmvVvr61zF7gi4BBbHvX3b4cNYnB
 z73vTVSrm7i0UZrRAehNkJgifcb8kaTfr1/2G7woIKXXAluwT+PSEM/aC
 ukzI/Zkbhq94198Q5hKw3JNyxvYtDKifDzeL38B4voI8WHnfOdh5pmyvD Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333045659"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="333045659"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 10:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771898525"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="771898525"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 10:37:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/8] ASoC: Intel: avs: Introduce PCM power management routines
Date: Wed, 19 Oct 2022 19:53:11 +0200
Message-Id: <20221019175317.1540919-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019175317.1540919-1-cezary.rojewski@intel.com>
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Implement suspend/resume() operations for component drivers. For most
scenarios, the PM flow is similar to standard streaming one, except for
the part where the position register are being saved and the lack of PCM
pages freeing. To reduce code duplication, all avs_dai_suspend_XXX() and
avs_dai_resume_XXX() functions reuse their non-PM equivalents.

Given that path binding/unbinding happens only in FE part of the stream,
the order of suspend() goes:

1. hw_free() all FE DAIs, paths are unbound here
2. hw_free() all BE DAIs

Consequently, for resume() its:

1. hw_params() all BE DAIs
2. hw_params() all FE DAIs, paths are bound here
3. prepare() all BE DAIs
4. prepare() all FE DAIs

As component->suspend/resume() do not provide substream pointer, store
it ourselves so that the PM flow has all the necessary information to
proceed.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio_ext.h |   5 +
 sound/soc/intel/avs/pcm.c   | 227 +++++++++++++++++++++++++++++++++++-
 2 files changed, 228 insertions(+), 4 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 83aed26ab143..6598e238b9c5 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -66,6 +66,11 @@ struct hdac_ext_stream {
 
 	u32 dpib;
 	u32 lpib;
+	u32 pphcllpl;
+	u32 pphcllpu;
+	u32 pphcldpl;
+	u32 pphcldpu;
+
 	bool decoupled:1;
 	bool link_locked:1;
 	bool link_prepared;
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index d584e955216c..55f213d5bab9 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -28,6 +28,8 @@ struct avs_dma_data {
 	 * host stream assigned
 	 */
 	struct hdac_ext_stream *host_stream;
+
+	struct snd_pcm_substream *substream;
 };
 
 static struct avs_tplg_path_template *
@@ -55,7 +57,8 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 	return dw->priv;
 }
 
-static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai, bool is_fe)
+static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai, bool is_fe,
+			   const struct snd_soc_dai_ops *ops)
 {
 	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
@@ -71,6 +74,7 @@ static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	if (!data)
 		return -ENOMEM;
 
+	data->substream = substream;
 	data->template = template;
 	snd_soc_dai_set_dma_data(dai, substream, data);
 
@@ -151,9 +155,11 @@ static int avs_dai_prepare(struct avs_dev *adev, struct snd_pcm_substream *subst
 	return ret;
 }
 
+static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops;
+
 static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	return avs_dai_startup(substream, dai, false);
+	return avs_dai_startup(substream, dai, false, &avs_dai_nonhda_be_ops);
 }
 
 static void avs_dai_nonhda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
@@ -245,9 +251,11 @@ static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.trigger = avs_dai_nonhda_be_trigger,
 };
 
+static const struct snd_soc_dai_ops avs_dai_hda_be_ops;
+
 static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	return avs_dai_startup(substream, dai, false);
+	return avs_dai_startup(substream, dai, false, &avs_dai_hda_be_ops);
 }
 
 static void avs_dai_hda_be_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
@@ -407,6 +415,8 @@ static const struct snd_pcm_hw_constraint_list hw_rates = {
 	.mask = 0,
 };
 
+const struct snd_soc_dai_ops avs_dai_fe_ops;
+
 static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -416,7 +426,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 	struct hdac_ext_stream *host_stream;
 	int ret;
 
-	ret = avs_dai_startup(substream, dai, true);
+	ret = avs_dai_startup(substream, dai, true, &avs_dai_fe_ops);
 	if (ret)
 		return ret;
 
@@ -758,6 +768,211 @@ static void avs_component_remove(struct snd_soc_component *component)
 	}
 }
 
+static int avs_dai_resume_hw_params(struct snd_soc_dai *dai, struct avs_dma_data *data)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_soc_pcm_runtime *rtd;
+	int ret;
+
+	substream = data->substream;
+	rtd = snd_pcm_substream_chip(substream);
+
+	ret = dai->driver->ops->hw_params(substream, &rtd->dpcm[substream->stream].hw_params, dai);
+	if (ret)
+		dev_err(dai->dev, "hw_params on resume failed: %d\n", ret);
+
+	return ret;
+}
+
+static int avs_dai_resume_fe_prepare(struct snd_soc_dai *dai, struct avs_dma_data *data)
+{
+	struct hdac_ext_stream *host_stream;
+	struct hdac_bus *bus;
+	int ret;
+
+	host_stream = data->host_stream;
+	bus = hdac_stream(host_stream)->bus;
+
+	/* Set DRSM before programming stream and position registers. */
+	snd_hdac_ext_stream_drsm_enable(bus, true, hdac_stream(host_stream)->index);
+
+	ret = dai->driver->ops->prepare(data->substream, dai);
+	if (ret) {
+		dev_err(dai->dev, "prepare FE on resume failed: %d\n", ret);
+		return ret;
+	}
+
+	writel(host_stream->pphcllpl, host_stream->pphc_addr + AZX_REG_PPHCLLPL);
+	writel(host_stream->pphcllpu, host_stream->pphc_addr + AZX_REG_PPHCLLPU);
+	writel(host_stream->pphcldpl, host_stream->pphc_addr + AZX_REG_PPHCLDPL);
+	writel(host_stream->pphcldpu, host_stream->pphc_addr + AZX_REG_PPHCLDPU);
+
+	/* As per HW spec recommendation, program LPIB and DPIB to the same value. */
+	snd_hdac_ext_stream_set_lpib(host_stream, host_stream->lpib);
+	snd_hdac_ext_stream_set_dpibr(bus, host_stream, host_stream->lpib);
+
+	return 0;
+}
+
+static int avs_dai_resume_be_prepare(struct snd_soc_dai *dai, struct avs_dma_data *data)
+{
+	int ret;
+
+	ret = dai->driver->ops->prepare(data->substream, dai);
+	if (ret) {
+		dev_err(dai->dev, "prepare BE on resume failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int avs_dai_suspend_fe_hw_free(struct snd_soc_dai *dai, struct avs_dma_data *data)
+{
+	struct hdac_ext_stream *host_stream;
+	struct snd_soc_pcm_runtime *rtd;
+	int ret;
+
+	rtd = snd_pcm_substream_chip(data->substream);
+	host_stream = data->host_stream;
+
+	/* Store position addresses so we can resume from them later on. */
+	host_stream->lpib = snd_hdac_stream_get_pos_lpib(hdac_stream(host_stream));
+	host_stream->pphcllpl = readl(host_stream->pphc_addr + AZX_REG_PPHCLLPL);
+	host_stream->pphcllpu = readl(host_stream->pphc_addr + AZX_REG_PPHCLLPU);
+	host_stream->pphcldpl = readl(host_stream->pphc_addr + AZX_REG_PPHCLDPL);
+	host_stream->pphcldpu = readl(host_stream->pphc_addr + AZX_REG_PPHCLDPU);
+
+	if (!rtd->dai_link->ignore_suspend) {
+		ret = __avs_dai_fe_hw_free(data->substream, dai);
+		if (ret < 0) {
+			dev_err(dai->dev, "hw_free FE on suspend failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int avs_dai_suspend_be_hw_free(struct snd_soc_dai *dai, struct avs_dma_data *data)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	int ret;
+
+	rtd = snd_pcm_substream_chip(data->substream);
+
+	if (!rtd->dai_link->ignore_suspend) {
+		ret = dai->driver->ops->hw_free(data->substream, dai);
+		if (ret < 0) {
+			dev_err(dai->dev, "hw_free BE on suspend failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int avs_component_pm_op(struct snd_soc_component *component, bool be,
+			       int (*op)(struct snd_soc_dai *, struct avs_dma_data *))
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct avs_dma_data *data;
+	struct snd_soc_dai *dai;
+	int ret;
+
+	for_each_component_dais(component, dai) {
+		data = dai->playback_dma_data;
+		if (data) {
+			rtd = snd_pcm_substream_chip(data->substream);
+			if (rtd->dai_link->no_pcm == be) {
+				ret = op(dai, data);
+				if (ret < 0)
+					return ret;
+			}
+		}
+
+		data = dai->capture_dma_data;
+		if (data) {
+			rtd = snd_pcm_substream_chip(data->substream);
+			if (rtd->dai_link->no_pcm == be) {
+				ret = op(dai, data);
+				if (ret < 0)
+					return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int avs_component_resume_hw_params(struct snd_soc_component *component, bool be)
+{
+	return avs_component_pm_op(component, be, &avs_dai_resume_hw_params);
+}
+
+static int avs_component_resume_prepare(struct snd_soc_component *component, bool be)
+{
+	int (*prepare_cb)(struct snd_soc_dai *dai, struct avs_dma_data *data);
+
+	if (be)
+		prepare_cb = &avs_dai_resume_be_prepare;
+	else
+		prepare_cb = &avs_dai_resume_fe_prepare;
+
+	return avs_component_pm_op(component, be, prepare_cb);
+}
+
+static int avs_component_suspend_hw_free(struct snd_soc_component *component, bool be)
+{
+	int (*hw_free_cb)(struct snd_soc_dai *dai, struct avs_dma_data *data);
+
+	if (be)
+		hw_free_cb = &avs_dai_suspend_be_hw_free;
+	else
+		hw_free_cb = &avs_dai_suspend_fe_hw_free;
+
+	return avs_component_pm_op(component, be, hw_free_cb);
+}
+
+static int avs_component_suspend(struct snd_soc_component *component)
+{
+	int ret;
+
+	/*
+	 * When freeing paths, FEs need to be first as they perform
+	 * path unbinding.
+	 */
+	ret = avs_component_suspend_hw_free(component, false);
+	if (ret)
+		return ret;
+
+	return avs_component_suspend_hw_free(component, true);
+}
+
+static int avs_component_resume(struct snd_soc_component *component)
+{
+	int ret;
+
+	/*
+	 * When creating paths, FEs need to be last as they perform
+	 * path binding.
+	 */
+	ret = avs_component_resume_hw_params(component, true);
+	if (ret)
+		return ret;
+
+	ret = avs_component_resume_hw_params(component, false);
+	if (ret)
+		return ret;
+
+	/* It is expected that the LINK stream is prepared first. */
+	ret = avs_component_resume_prepare(component, true);
+	if (ret)
+		return ret;
+
+	return avs_component_resume_prepare(component, false);
+}
+
 static int avs_component_open(struct snd_soc_component *component,
 			      struct snd_pcm_substream *substream)
 {
@@ -846,6 +1061,8 @@ static const struct snd_soc_component_driver avs_component_driver = {
 	.name			= "avs-pcm",
 	.probe			= avs_component_probe,
 	.remove			= avs_component_remove,
+	.suspend		= avs_component_suspend,
+	.resume			= avs_component_resume,
 	.open			= avs_component_open,
 	.pointer		= avs_component_pointer,
 	.mmap			= avs_component_mmap,
@@ -1161,6 +1378,8 @@ static const struct snd_soc_component_driver avs_hda_component_driver = {
 	.name			= "avs-hda-pcm",
 	.probe			= avs_component_hda_probe,
 	.remove			= avs_component_hda_remove,
+	.suspend		= avs_component_suspend,
+	.resume			= avs_component_resume,
 	.open			= avs_component_hda_open,
 	.close			= avs_component_hda_close,
 	.pointer		= avs_component_pointer,
-- 
2.25.1


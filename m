Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD86D5BD1
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 11:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44562843;
	Tue,  4 Apr 2023 11:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44562843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680600290;
	bh=4iZ04NT03uDG8xbiaCpZHlY8ChVwNLO/N9i0xsFtr3E=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=swRtFr3Ovi6zSPfwJvtIeiiaxZFMnDvDLF0N+1fwzSjSRGyqHqnsGJFIihU/HgRbh
	 dTvJ0VLSdZGbBRgH0+wXFMnet2UQeW6g2S4e1LTfVI+WexzlcROQ5VKiFifL/eX5sw
	 tEDTtdr73oTQOf02XZxAzun24o700EOka5npjSm0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B5D6F80171;
	Tue,  4 Apr 2023 11:23:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A21AF8028B; Tue,  4 Apr 2023 11:22:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83B47F8024C
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 11:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83B47F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F6aB2lc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680600057; x=1712136057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4iZ04NT03uDG8xbiaCpZHlY8ChVwNLO/N9i0xsFtr3E=;
  b=F6aB2lc2ZkI1es9uMPuM+bLsmeziCLPMh6BUKwwvNoYlIpl3R+sJ7RNG
   txTh/OUPYyXhzbQUEt+75LJwaqC74ISPSUUrE2hbZmbvx2Wbk3V9n4QxM
   EHK5TeQCT1D2maSEEEMU9QJPkBT/PhHsiHb/j0P4gE2in538nXjsMB5UA
   ++X+JGXw9w8h1CwBI+paYx58Jn6MgwCU0NRVIFZt55Vrn0QFlSeJPXNJS
   4CtfUUO91XLnBF381nhSCc/WIgmtvQ5No5VUqVM8Djxfx/DZ8aWqYOq+I
   6Vc8lnp/Yz6AaM/gMqAWlOnTdvQgGf3enz/seeS9A94r62BdEdnVnT0lP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="339620579"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="339620579"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688820018"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="688820018"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 02:20:51 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 05/12] ASoC: SOF: Intel: hda: Add support for DSPless mode
Date: Tue,  4 Apr 2023 12:21:08 +0300
Message-Id: <20230404092115.27949-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
References: <20230404092115.27949-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KF5VWRBHG6IOZ24YVC6LX425QM4BZUAE
X-Message-ID-Hash: KF5VWRBHG6IOZ24YVC6LX425QM4BZUAE
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KF5VWRBHG6IOZ24YVC6LX425QM4BZUAE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Via the SOF_DBG_DSPLESS_MODE sof_debug flag the SOF stack can be asked to
not use the DSP for audio.

The use of DSPless mode is governed by the sdev->dspless_mode_selected
flag which is only going to be set if the user sets sof_debug=0x8000 and
the platform advertises that the DSPless mode is supported on them.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 33 +++++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda-dai.c     | 25 ++++++++++++++++++-----
 sound/soc/sof/intel/hda-pcm.c     | 24 +++++++++++++++-------
 sound/soc/sof/intel/hda-stream.c  | 34 ++++++++++++++++---------------
 sound/soc/sof/intel/hda.c         | 19 ++++++++++-------
 5 files changed, 99 insertions(+), 36 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index de48f13259f1..4b39cecacd68 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -319,13 +319,44 @@ static const struct hda_dai_widget_dma_ops hda_ipc3_dma_ops = {
 	.post_trigger = hda_ipc3_post_trigger,
 };
 
+static struct hdac_ext_stream *
+hda_dspless_get_hext_stream(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
+			    struct snd_pcm_substream *substream)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+
+	return stream_to_hdac_ext_stream(hstream);
+}
+
+static void hda_dspless_setup_hext_stream(struct snd_sof_dev *sdev,
+					  struct hdac_ext_stream *hext_stream,
+					  unsigned int format_val)
+{
+	/*
+	 * Save the format_val which was adjusted by the maxbps of the codec.
+	 * This information is not available on the FE side since there we are
+	 * using dummy_codec.
+	 */
+	hext_stream->hstream.format_val = format_val;
+}
+
+static const struct hda_dai_widget_dma_ops hda_dspless_dma_ops = {
+	.get_hext_stream = hda_dspless_get_hext_stream,
+	.setup_hext_stream = hda_dspless_setup_hext_stream,
+};
+
 #endif
 
 const struct hda_dai_widget_dma_ops *
 hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
-	struct snd_sof_dai *sdai = swidget->private;
+	struct snd_sof_dai *sdai;
+
+	if (sdev->dspless_mode_selected)
+		return &hda_dspless_dma_ops;
+
+	sdai = swidget->private;
 
 	switch (sdev->pdata->ipc_type) {
 	case SOF_IPC:
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 46a17afdd1ea..0435b7f251aa 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -31,11 +31,18 @@ int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 		   struct snd_sof_dai_config_data *data)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_soc_component *component = swidget->scomp;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	const struct sof_ipc_tplg_ops *tplg_ops;
+	struct snd_soc_component *component;
+	struct snd_sof_dev *sdev;
 	int ret;
 
+	if (!swidget)
+		return 0;
+
+	component = swidget->scomp;
+	sdev = snd_soc_component_get_drvdata(component);
+	tplg_ops = sof_ipc_get_ops(sdev, tplg);
+
 	if (tplg_ops && tplg_ops->dai_config) {
 		ret = tplg_ops->dai_config(sdev, swidget, flags, data);
 		if (ret < 0) {
@@ -56,13 +63,21 @@ hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
 	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_sof_dai *sdai = swidget->private;
+	struct snd_sof_dai *sdai;
+
+	/*
+	 * The swidget parameter of hda_select_dai_widget_ops() is ignored in
+	 * case of DSPless mode
+	 */
+	if (sdev->dspless_mode_selected)
+		return hda_select_dai_widget_ops(sdev, NULL);
+
+	sdai = swidget->private;
 
 	/* select and set the DAI widget ops if not set already */
 	if (!sdai->platform_private) {
 		const struct hda_dai_widget_dma_ops *ops =
 			hda_select_dai_widget_ops(sdev, swidget);
-
 		if (!ops)
 			return NULL;
 
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index dc0b359ed9b6..981e7b699bdb 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -101,18 +101,23 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct snd_dma_buffer *dmab;
 	int ret;
-	u32 size, rate, bits;
-
-	size = params_buffer_bytes(params);
-	rate = hda_dsp_get_mult_div(sdev, params_rate(params));
-	bits = hda_dsp_get_bits(sdev, params_width(params));
 
 	hstream->substream = substream;
 
 	dmab = substream->runtime->dma_buffer_p;
 
-	hstream->format_val = rate | bits | (params_channels(params) - 1);
-	hstream->bufsize = size;
+	/*
+	 * Use the codec required format val (which is link_bps adjusted) when
+	 * the DSP is not in use
+	 */
+	if (!sdev->dspless_mode_selected) {
+		u32 rate = hda_dsp_get_mult_div(sdev, params_rate(params));
+		u32 bits = hda_dsp_get_bits(sdev, params_width(params));
+
+		hstream->format_val = rate | bits | (params_channels(params) - 1);
+	}
+
+	hstream->bufsize = params_buffer_bytes(params);
 	hstream->period_bytes = params_period_bytes(params);
 	hstream->no_period_wakeup  =
 			(params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP) &&
@@ -249,6 +254,11 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
+	/* Only S16 and S32 supported by HDA hardware when used without DSP */
+	if (sdev->dspless_mode_selected)
+		snd_pcm_hw_constraint_mask64(substream->runtime, SNDRV_PCM_HW_PARAM_FORMAT,
+					     SNDRV_PCM_FMTBIT_S16 | SNDRV_PCM_FMTBIT_S32);
+
 	/* binding pcm substream to hda stream */
 	substream->runtime->private_data = &dsp_stream->hstream;
 	return 0;
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 50e92996f928..87e31a65b314 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -503,11 +503,12 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 
 	hstream = &hext_stream->hstream;
 	sd_offset = SOF_STREAM_SD_OFFSET(hstream);
+	mask = BIT(hstream->index);
 
-	/* decouple host and link DMA */
-	mask = 0x1 << hstream->index;
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-				mask, mask);
+	/* decouple host and link DMA if the DSP is used */
+	if (!sdev->dspless_mode_selected)
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+					mask, mask);
 
 	/* clear stream status */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, sd_offset,
@@ -608,11 +609,10 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	 *    enable decoupled mode
 	 */
 
-	if (chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK) {
+	if (!sdev->dspless_mode_selected && (chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK))
 		/* couple host and link DMA, disable DSP features */
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
 					mask, 0);
-	}
 
 	/* program stream format */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
@@ -620,11 +620,10 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 				SOF_HDA_ADSP_REG_SD_FORMAT,
 				0xffff, hstream->format_val);
 
-	if (chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK) {
+	if (!sdev->dspless_mode_selected && (chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK))
 		/* decouple host and link DMA, enable DSP features */
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
 					mask, mask);
-	}
 
 	/* program last valid index */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
@@ -677,20 +676,23 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 	struct hdac_ext_stream *hext_stream = container_of(hstream,
 							 struct hdac_ext_stream,
 							 hstream);
-	struct hdac_bus *bus = sof_to_bus(sdev);
-	u32 mask = 0x1 << hstream->index;
 	int ret;
 
 	ret = hda_dsp_stream_reset(sdev, hstream);
 	if (ret < 0)
 		return ret;
 
-	spin_lock_irq(&bus->reg_lock);
-	/* couple host and link DMA if link DMA channel is idle */
-	if (!hext_stream->link_locked)
-		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
-					SOF_HDA_REG_PP_PPCTL, mask, 0);
-	spin_unlock_irq(&bus->reg_lock);
+	if (!sdev->dspless_mode_selected) {
+		struct hdac_bus *bus = sof_to_bus(sdev);
+		u32 mask = BIT(hstream->index);
+
+		spin_lock_irq(&bus->reg_lock);
+		/* couple host and link DMA if link DMA channel is idle */
+		if (!hext_stream->link_locked)
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
+						SOF_HDA_REG_PP_PPCTL, mask, 0);
+		spin_unlock_irq(&bus->reg_lock);
+	}
 
 	hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 19aad4141a78..a14733aa7a60 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -47,32 +47,34 @@
 static u32 hda_get_interface_mask(struct snd_sof_dev *sdev)
 {
 	const struct sof_intel_dsp_desc *chip;
-	u32 interface_mask = 0;
+	u32 interface_mask[2] = { 0 };
 
 	chip = get_chip_info(sdev->pdata);
 	switch (chip->hw_ip_version) {
 	case SOF_INTEL_TANGIER:
 	case SOF_INTEL_BAYTRAIL:
 	case SOF_INTEL_BROADWELL:
-		interface_mask = BIT(SOF_DAI_INTEL_SSP);
+		interface_mask[0] =  BIT(SOF_DAI_INTEL_SSP);
 		break;
 	case SOF_INTEL_CAVS_1_5:
 	case SOF_INTEL_CAVS_1_5_PLUS:
-		interface_mask = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
-				 BIT(SOF_DAI_INTEL_HDA);
+		interface_mask[0] = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
+				    BIT(SOF_DAI_INTEL_HDA);
+		interface_mask[1] = BIT(SOF_DAI_INTEL_HDA);
 		break;
 	case SOF_INTEL_CAVS_1_8:
 	case SOF_INTEL_CAVS_2_0:
 	case SOF_INTEL_CAVS_2_5:
 	case SOF_INTEL_ACE_1_0:
-		interface_mask = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
-				 BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
+		interface_mask[0] = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
+				    BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
+		interface_mask[1] = BIT(SOF_DAI_INTEL_HDA);
 		break;
 	default:
 		break;
 	}
 
-	return interface_mask;
+	return interface_mask[sdev->dspless_mode_selected];
 }
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
@@ -1058,6 +1060,9 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	hdev->no_ipc_position = sof_ops(sdev)->pcm_pointer ? 1 : 0;
 #endif
 
+	if (sdev->dspless_mode_selected)
+		hdev->no_ipc_position = 1;
+
 	/* set up HDA base */
 	bus = sof_to_bus(sdev);
 	ret = hda_init(sdev);
-- 
2.40.0


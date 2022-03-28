Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEAB4E9D55
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 19:20:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B52618E9;
	Mon, 28 Mar 2022 19:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B52618E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648488039;
	bh=HVVgxdaANNjrD07eAoFCsQWVFNvS6XAuYzoaMxqDZl0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGElmlmi74UVI9NqpZ/3j34SOYv01/A32mpWplngEG2+S1m0+ARu85W9GI1M4LKwE
	 1ynZUPjKKiy/4xRiIWvwWBxw4JS+2Mo/InihuqRJ5VFbaStZNEcMCOVz4+d4kgz/g9
	 ZW+i3PrEdX0Oi1YTjwkoyE0glV8QmKqP0WiqdHOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEEB8F8056F;
	Mon, 28 Mar 2022 19:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB1EBF80517; Mon, 28 Mar 2022 19:16:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7790F8051E
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 19:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7790F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fMdA1zUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648487786; x=1680023786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HVVgxdaANNjrD07eAoFCsQWVFNvS6XAuYzoaMxqDZl0=;
 b=fMdA1zUbcf+YT+AC3UdDiGMijHXQy3eoR2shcnbS2jreO8MPZ51E+hlu
 8MxBydk84av6M0DstAjI1s8Olj/C7xVqsWxk2pcd5J3crBPIYCisKfwje
 VSAVGo4LfjBwhCfy4UjZptBxY/lSVjIh5c+vwPO3Ndof6UBkLkJLX1TK0
 BJaqITQc7njzBZG8HKqGf0nIFDYjokFiL1AIvS5lbIuiFS5rvtNEFfnjW
 fqpZBSEhEI+j7zVN9r6pjAzYqU7x7Yafg0jZ68Hdc50uvDWtY6FXvs/D6
 WcsIpTza+wqQeSzerwGgo7Qg2NrMXt5w9zwo+K5v0ZIEXFRU1s7P0AZDv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345494577"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="345494577"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649141572"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2022 10:14:24 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 14/14] ASoC: Intel: avs: Configure modules according to their
 type
Date: Mon, 28 Mar 2022 19:24:10 +0200
Message-Id: <20220328172410.761309-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328172410.761309-1-cezary.rojewski@intel.com>
References: <20220328172410.761309-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Each module on DSP side serves a processing purpose. Depending on its
purpose, it needs different information during its initialization. Add
functions responsible for creating instances of specific module types
given the information coming from the topology file.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig    |   1 +
 sound/soc/intel/avs/avs.h  |   1 +
 sound/soc/intel/avs/path.c | 378 ++++++++++++++++++++++++++++++++++++-
 sound/soc/intel/avs/path.h |   1 +
 4 files changed, 380 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 5da3ce1535af..c364ddf22267 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -217,6 +217,7 @@ config SND_SOC_INTEL_AVS
 	select SND_SOC_TOPOLOGY
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
+	select SND_INTEL_NHLT
 	help
 	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 45372b394862..c57a07a18d8e 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -106,6 +106,7 @@ struct avs_dev {
 
 	struct completion fw_ready;
 
+	struct nhlt_acpi_table *nhlt;
 	struct list_head comp_list;
 	struct mutex comp_list_mutex;
 	struct list_head path_list;
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index b5c0f89add4f..8c5d2672a081 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -113,6 +113,375 @@ avs_path_find_variant(struct avs_dev *adev,
 	return NULL;
 }
 
+__maybe_unused
+static bool avs_dma_type_is_host(u32 dma_type)
+{
+	return dma_type == AVS_DMA_HDA_HOST_OUTPUT ||
+	       dma_type == AVS_DMA_HDA_HOST_INPUT;
+}
+
+__maybe_unused
+static bool avs_dma_type_is_link(u32 dma_type)
+{
+	return !avs_dma_type_is_host(dma_type);
+}
+
+__maybe_unused
+static bool avs_dma_type_is_output(u32 dma_type)
+{
+	return dma_type == AVS_DMA_HDA_HOST_OUTPUT ||
+	       dma_type == AVS_DMA_HDA_LINK_OUTPUT ||
+	       dma_type == AVS_DMA_I2S_LINK_OUTPUT;
+}
+
+__maybe_unused
+static bool avs_dma_type_is_input(u32 dma_type)
+{
+	return !avs_dma_type_is_output(dma_type);
+}
+
+static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct nhlt_acpi_table *nhlt = adev->nhlt;
+	struct avs_tplg_module *t = mod->template;
+	struct avs_copier_cfg *cfg;
+	struct nhlt_specific_cfg *ep_blob;
+	union avs_connector_node_id node_id = {0};
+	size_t cfg_size, data_size = 0;
+	void *data = NULL;
+	u32 dma_type;
+	int ret;
+
+	dma_type = t->cfg_ext->copier.dma_type;
+	node_id.dma_type = dma_type;
+
+	switch (dma_type) {
+		struct avs_audio_format *fmt;
+		int direction;
+
+	case AVS_DMA_I2S_LINK_OUTPUT:
+	case AVS_DMA_I2S_LINK_INPUT:
+		if (avs_dma_type_is_input(dma_type))
+			direction = SNDRV_PCM_STREAM_CAPTURE;
+		else
+			direction = SNDRV_PCM_STREAM_PLAYBACK;
+
+		if (t->cfg_ext->copier.blob_fmt)
+			fmt = t->cfg_ext->copier.blob_fmt;
+		else if (direction == SNDRV_PCM_STREAM_CAPTURE)
+			fmt = t->in_fmt;
+		else
+			fmt = t->cfg_ext->copier.out_fmt;
+
+		ep_blob = intel_nhlt_get_endpoint_blob(adev->dev,
+			nhlt, t->cfg_ext->copier.vindex.i2s.instance,
+			NHLT_LINK_SSP, fmt->valid_bit_depth, fmt->bit_depth,
+			fmt->num_channels, fmt->sampling_freq, direction,
+			NHLT_DEVICE_I2S);
+		if (!ep_blob) {
+			dev_err(adev->dev, "no I2S ep_blob found\n");
+			return -ENOENT;
+		}
+
+		data = ep_blob->caps;
+		data_size = ep_blob->size;
+		/* I2S gateway's vindex is statically assigned in topology */
+		node_id.vindex = t->cfg_ext->copier.vindex.val;
+
+		break;
+
+	case AVS_DMA_DMIC_LINK_INPUT:
+		direction = SNDRV_PCM_STREAM_CAPTURE;
+
+		if (t->cfg_ext->copier.blob_fmt)
+			fmt = t->cfg_ext->copier.blob_fmt;
+		else
+			fmt = t->in_fmt;
+
+		ep_blob = intel_nhlt_get_endpoint_blob(adev->dev, nhlt, 0,
+				NHLT_LINK_DMIC, fmt->valid_bit_depth,
+				fmt->bit_depth, fmt->num_channels,
+				fmt->sampling_freq, direction, NHLT_DEVICE_DMIC);
+		if (!ep_blob) {
+			dev_err(adev->dev, "no DMIC ep_blob found\n");
+			return -ENOENT;
+		}
+
+		data = ep_blob->caps;
+		data_size = ep_blob->size;
+		/* DMIC gateway's vindex is statically assigned in topology */
+		node_id.vindex = t->cfg_ext->copier.vindex.val;
+
+		break;
+
+	case AVS_DMA_HDA_HOST_OUTPUT:
+	case AVS_DMA_HDA_HOST_INPUT:
+		/* HOST gateway's vindex is dynamically assigned with DMA id */
+		node_id.vindex = mod->owner->owner->dma_id;
+		break;
+
+	case AVS_DMA_HDA_LINK_OUTPUT:
+	case AVS_DMA_HDA_LINK_INPUT:
+		node_id.vindex = t->cfg_ext->copier.vindex.val |
+				 mod->owner->owner->dma_id;
+		break;
+
+	case INVALID_OBJECT_ID:
+	default:
+		node_id = INVALID_NODE_ID;
+		break;
+	}
+
+	cfg_size = sizeof(*cfg) + data_size;
+	/* Every config-BLOB contains gateway attributes. */
+	if (data_size)
+		cfg_size -= sizeof(cfg->gtw_cfg.config.attrs);
+
+	cfg = kzalloc(cfg_size, GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	cfg->base.cpc = t->cfg_base->cpc;
+	cfg->base.ibs = t->cfg_base->ibs;
+	cfg->base.obs = t->cfg_base->obs;
+	cfg->base.is_pages = t->cfg_base->is_pages;
+	cfg->base.audio_fmt = *t->in_fmt;
+	cfg->out_fmt = *t->cfg_ext->copier.out_fmt;
+	cfg->feature_mask = t->cfg_ext->copier.feature_mask;
+	cfg->gtw_cfg.node_id = node_id;
+	cfg->gtw_cfg.dma_buffer_size = t->cfg_ext->copier.dma_buffer_size;
+	/* config_length in DWORDs */
+	cfg->gtw_cfg.config_length = DIV_ROUND_UP(data_size, 4);
+	if (data)
+		memcpy(&cfg->gtw_cfg.config, data, data_size);
+
+	mod->gtw_attrs = cfg->gtw_cfg.config.attrs;
+
+	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				  t->core_id, t->domain, cfg, cfg_size,
+				  &mod->instance_id);
+	kfree(cfg);
+	return ret;
+}
+
+static int avs_updown_mix_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_updown_mixer_cfg cfg;
+	int i;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.out_channel_config = t->cfg_ext->updown_mix.out_channel_config;
+	cfg.coefficients_select = t->cfg_ext->updown_mix.coefficients_select;
+	for (i = 0; i < AVS_CHANNELS_MAX; i++)
+		cfg.coefficients[i] = t->cfg_ext->updown_mix.coefficients[i];
+	cfg.channel_map = t->cfg_ext->updown_mix.channel_map;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_src_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_src_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.out_freq = t->cfg_ext->src.out_freq;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_asrc_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_asrc_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.out_freq = t->cfg_ext->asrc.out_freq;
+	cfg.mode = t->cfg_ext->asrc.mode;
+	cfg.disable_jitter_buffer = t->cfg_ext->asrc.disable_jitter_buffer;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_aec_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_aec_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.ref_fmt = *t->cfg_ext->aec.ref_fmt;
+	cfg.out_fmt = *t->cfg_ext->aec.out_fmt;
+	cfg.cpc_lp_mode = t->cfg_ext->aec.cpc_lp_mode;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_mux_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_mux_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.ref_fmt = *t->cfg_ext->mux.ref_fmt;
+	cfg.out_fmt = *t->cfg_ext->mux.out_fmt;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_wov_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_wov_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.cpc_lp_mode = t->cfg_ext->wov.cpc_lp_mode;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_micsel_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_micsel_cfg cfg;
+
+	cfg.base.cpc = t->cfg_base->cpc;
+	cfg.base.ibs = t->cfg_base->ibs;
+	cfg.base.obs = t->cfg_base->obs;
+	cfg.base.is_pages = t->cfg_base->is_pages;
+	cfg.base.audio_fmt = *t->in_fmt;
+	cfg.out_fmt = *t->cfg_ext->micsel.out_fmt;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_modbase_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_modcfg_base cfg;
+
+	cfg.cpc = t->cfg_base->cpc;
+	cfg.ibs = t->cfg_base->ibs;
+	cfg.obs = t->cfg_base->obs;
+	cfg.is_pages = t->cfg_base->is_pages;
+	cfg.audio_fmt = *t->in_fmt;
+
+	return avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				   t->core_id, t->domain, &cfg, sizeof(cfg),
+				   &mod->instance_id);
+}
+
+static int avs_modext_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_tplg_modcfg_ext *tcfg = t->cfg_ext;
+	struct avs_modcfg_ext *cfg;
+	size_t cfg_size, num_pins;
+	int ret, i;
+
+	num_pins = tcfg->generic.num_input_pins + tcfg->generic.num_output_pins;
+	cfg_size = sizeof(*cfg) + sizeof(*cfg->pin_fmts) * num_pins;
+
+	cfg = kzalloc(cfg_size, GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	cfg->base.cpc = t->cfg_base->cpc;
+	cfg->base.ibs = t->cfg_base->ibs;
+	cfg->base.obs = t->cfg_base->obs;
+	cfg->base.is_pages = t->cfg_base->is_pages;
+	cfg->base.audio_fmt = *t->in_fmt;
+	cfg->num_input_pins = tcfg->generic.num_input_pins;
+	cfg->num_output_pins = tcfg->generic.num_output_pins;
+
+	/* configure pin formats */
+	for (i = 0; i < num_pins; i++) {
+		struct avs_tplg_pin_format *tpin = &tcfg->generic.pin_fmts[i];
+		struct avs_pin_format *pin = &cfg->pin_fmts[i];
+
+		pin->pin_index = tpin->pin_index;
+		pin->iobs = tpin->iobs;
+		pin->audio_fmt = *tpin->fmt;
+	}
+
+	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
+				  t->core_id, t->domain, cfg, cfg_size,
+				  &mod->instance_id);
+	kfree(cfg);
+	return ret;
+}
+
+static int avs_path_module_type_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	const guid_t *type = &mod->template->cfg_ext->type;
+
+	if (guid_equal(type, &AVS_MIXIN_MOD_UUID) ||
+	    guid_equal(type, &AVS_MIXOUT_MOD_UUID) ||
+	    guid_equal(type, &AVS_KPBUFF_MOD_UUID))
+		return avs_modbase_create(adev, mod);
+	if (guid_equal(type, &AVS_COPIER_MOD_UUID))
+		return avs_copier_create(adev, mod);
+	if (guid_equal(type, &AVS_MICSEL_MOD_UUID))
+		return avs_micsel_create(adev, mod);
+	if (guid_equal(type, &AVS_MUX_MOD_UUID))
+		return avs_mux_create(adev, mod);
+	if (guid_equal(type, &AVS_UPDWMIX_MOD_UUID))
+		return avs_updown_mix_create(adev, mod);
+	if (guid_equal(type, &AVS_SRCINTC_MOD_UUID))
+		return avs_src_create(adev, mod);
+	if (guid_equal(type, &AVS_AEC_MOD_UUID))
+		return avs_aec_create(adev, mod);
+	if (guid_equal(type, &AVS_ASRC_MOD_UUID))
+		return avs_asrc_create(adev, mod);
+	if (guid_equal(type, &AVS_INTELWOV_MOD_UUID))
+		return avs_wov_create(adev, mod);
+
+	if (guid_equal(type, &AVS_PROBE_MOD_UUID)) {
+		dev_err(adev->dev, "Probe module can't be instantiated by topology");
+		return -EINVAL;
+	}
+
+	return avs_modext_create(adev, mod);
+}
+
 static void avs_path_module_free(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	kfree(mod);
@@ -124,7 +493,7 @@ avs_path_module_create(struct avs_dev *adev,
 		       struct avs_tplg_module *template)
 {
 	struct avs_path_module *mod;
-	int module_id;
+	int module_id, ret;
 
 	module_id = avs_get_module_id(adev, &template->cfg_ext->type);
 	if (module_id < 0)
@@ -139,6 +508,13 @@ avs_path_module_create(struct avs_dev *adev,
 	mod->owner = owner;
 	INIT_LIST_HEAD(&mod->node);
 
+	ret = avs_path_module_type_create(adev, mod);
+	if (ret) {
+		dev_err(adev->dev, "module-type create failed: %d\n", ret);
+		kfree(mod);
+		return ERR_PTR(ret);
+	}
+
 	return mod;
 }
 
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index 04a06473f04b..197222c5e008 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -38,6 +38,7 @@ struct avs_path_pipeline {
 struct avs_path_module {
 	u16 module_id;
 	u16 instance_id;
+	union avs_gtw_attributes gtw_attrs;
 
 	struct avs_tplg_module *template;
 	struct avs_path_pipeline *owner;
-- 
2.25.1


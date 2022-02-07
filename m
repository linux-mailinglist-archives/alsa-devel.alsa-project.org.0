Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D65104ABF89
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:26:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7833D1774;
	Mon,  7 Feb 2022 14:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7833D1774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644240374;
	bh=FHKLs+MTczIT9bx4yqOn7DzDCe/Sd4pwHSnf+xXVJuw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xp2QORVOPuu+60QzVN/GgCzBq2kv1jwNuxZE1eHF2VL3cVoXrKwz7PcTV0NgQ4QfL
	 7mPe6pV3IxygriL9S+hFZCkVRrSfxxGE/SPFuFfysy0WDW1LQjOPIiV6a+qRa3YuCm
	 qbjUZWG91n3BItt1OBuXoddso50FaTwNF+8ZiE34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76E64F80524;
	Mon,  7 Feb 2022 14:24:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E83FF8051A; Mon,  7 Feb 2022 14:24:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD82FF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:24:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD82FF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fa+VeKUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644240243; x=1675776243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FHKLs+MTczIT9bx4yqOn7DzDCe/Sd4pwHSnf+xXVJuw=;
 b=fa+VeKUaz/eMj6RU9c3h6lZYXR6MNW270B8By8/zr/7lJHGorh6rVUJx
 fWDXGOkgU+ml/Yy8ZrQ5imiRq87fBs09m/0wHTsvtLZqLzrXz8DzFp/K2
 YcAA8fm5z6Bl0MdtsulELDWh+WlbeFq/tYqORwr3CP+OLViOKnBwsYOfd
 oJ14OiIelm9J6LTHjLQo7lM0+4fy+jBSPSL9iSibWiRa5rWYOtvs19DBp
 jxoGdEqIdN68HGkesynh7nhIHq4waW7c3JeAH4oO+H1gKZOB9mNCBcPkx
 KLLFQ9eKPuVMDSpyj5DfACLnRpUMrYBDSDQpYeevU/PM5yRO1bWL/7GmB w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312011512"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="312011512"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:23:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="677751288"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 05:23:56 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 03/13] ASoC: Intel: avs: Parse module-extension tuples
Date: Mon,  7 Feb 2022 14:25:21 +0100
Message-Id: <20220207132532.3782412-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207132532.3782412-1-cezary.rojewski@intel.com>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
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

Anything that goes beyond module base config is an extension config. It
covers all fields for all specific module types available in ADSP
firmware. Add parsing helpers to support loading such information from
the topology file.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 297 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h |  59 +++++++
 2 files changed, 356 insertions(+)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 4b8b415ca006..6c682fed9f5f 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -344,6 +344,7 @@ avs_parse_##name##_ptr(struct snd_soc_component *comp, void *elem, void *object,
 
 AVS_DEFINE_PTR_PARSER(audio_format, struct avs_audio_format, fmts);
 AVS_DEFINE_PTR_PARSER(modcfg_base, struct avs_tplg_modcfg_base, modcfgs_base);
+AVS_DEFINE_PTR_PARSER(modcfg_ext, struct avs_tplg_modcfg_ext, modcfgs_ext);
 
 static int
 parse_audio_format_bitfield(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
@@ -593,3 +594,299 @@ static int avs_tplg_parse_modcfgs_base(struct snd_soc_component *comp,
 				AVS_TKN_MODCFG_BASE_ID_U32,
 				modcfg_base_parsers, ARRAY_SIZE(modcfg_base_parsers));
 }
+
+static const struct avs_tplg_token_parser modcfg_ext_parsers[] = {
+	{
+		.token = AVS_TKN_MODCFG_EXT_TYPE_UUID,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_UUID,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, type),
+		.parse = avs_parse_uuid_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_OUT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.out_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_FEATURE_MASK_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.feature_mask),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_VINDEX_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.vindex),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_DMA_TYPE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.dma_type),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_DMABUFF_SIZE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.dma_buffer_size),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_CPR_BLOB_FMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, copier.blob_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_MICSEL_OUT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, micsel.out_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_INTELWOV_CPC_LP_MODE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, wov.cpc_lp_mode),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_SRC_OUT_FREQ_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, src.out_freq),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_MUX_REF_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, mux.ref_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_MUX_OUT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, mux.out_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_AEC_REF_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, aec.ref_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_AEC_OUT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, aec.out_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MODCFG_AEC_CPC_LP_MODE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, aec.cpc_lp_mode),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_ASRC_OUT_FREQ_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, asrc.out_freq),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_ASRC_MODE_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, asrc.mode),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_ASRC_DISABLE_JITTER_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, asrc.disable_jitter_buffer),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_OUT_CHAN_CFG_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.out_channel_config),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_SELECT_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients_select),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_0_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[0]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_1_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[1]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_2_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[2]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_3_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[3]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_4_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[4]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_5_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[5]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_6_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[6]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_7_S32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.coefficients[7]),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_UPDOWN_MIX_CHAN_MAP_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, updown_mix.channel_map),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_EXT_NUM_INPUT_PINS_U16,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_SHORT,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, generic.num_input_pins),
+		.parse = avs_parse_short_token,
+	},
+	{
+		.token = AVS_TKN_MODCFG_EXT_NUM_OUTPUT_PINS_U16,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_SHORT,
+		.offset = offsetof(struct avs_tplg_modcfg_ext, generic.num_output_pins),
+		.parse = avs_parse_short_token,
+	},
+};
+
+static const struct avs_tplg_token_parser pin_format_parsers[] = {
+	{
+		.token = AVS_TKN_PIN_FMT_INDEX_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pin_format, pin_index),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_PIN_FMT_IOBS_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pin_format, iobs),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_PIN_FMT_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pin_format, fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+};
+
+static int avs_tplg_parse_modcfg_ext(struct snd_soc_component *comp,
+				     struct avs_tplg_modcfg_ext *cfg,
+				     struct snd_soc_tplg_vendor_array *tuples,
+				     u32 block_size)
+{
+	u32 esize;
+	int ret;
+
+	/* See where pin block starts. */
+	ret = avs_tplg_vendor_entry_size(tuples, block_size,
+					 AVS_TKN_PIN_FMT_INDEX_U32, &esize);
+	if (ret)
+		return ret;
+
+	ret = avs_parse_tokens(comp, cfg, modcfg_ext_parsers,
+			       ARRAY_SIZE(modcfg_ext_parsers), tuples, esize);
+	if (ret)
+		return ret;
+
+	block_size -= esize;
+	/* Parse trailing in/out pin formats if any. */
+	if (block_size) {
+		struct avs_tplg_pin_format *pins;
+		u32 num_pins;
+
+		num_pins = cfg->generic.num_input_pins + cfg->generic.num_output_pins;
+		if (!num_pins)
+			return -EINVAL;
+
+		pins = devm_kcalloc(comp->card->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+		if (!pins)
+			return -ENOMEM;
+
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+		ret = parse_dictionary_entries(comp, tuples, block_size,
+					       pins, num_pins, sizeof(*pins),
+					       AVS_TKN_PIN_FMT_INDEX_U32,
+					       pin_format_parsers,
+					       ARRAY_SIZE(pin_format_parsers));
+		if (ret)
+			return ret;
+		cfg->generic.pin_fmts = pins;
+	}
+
+	return 0;
+}
+
+static int avs_tplg_parse_modcfgs_ext(struct snd_soc_component *comp,
+				      struct snd_soc_tplg_vendor_array *tuples,
+				      u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+	int ret, i;
+
+	ret = parse_dictionary_header(comp, tuples, (void **)&tplg->modcfgs_ext,
+				      &tplg->num_modcfgs_ext,
+				      sizeof(*tplg->modcfgs_ext),
+				      AVS_TKN_MANIFEST_NUM_MODCFGS_EXT_U32);
+	if (ret)
+		return ret;
+
+	block_size -= le32_to_cpu(tuples->size);
+	/* With header parsed, move on to parsing entries. */
+	tuples = avs_tplg_vendor_array_next(tuples);
+
+	for (i = 0; i < tplg->num_modcfgs_ext; i++) {
+		struct avs_tplg_modcfg_ext *cfg = &tplg->modcfgs_ext[i];
+		u32 esize;
+
+		ret = avs_tplg_vendor_entry_size(tuples, block_size,
+						 AVS_TKN_MODCFG_EXT_ID_U32, &esize);
+		if (ret)
+			return ret;
+
+		ret = avs_tplg_parse_modcfg_ext(comp, cfg, tuples, esize);
+		if (ret)
+			return ret;
+
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	}
+
+	return 0;
+}
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index a3ab5d15c9ee..ce51fd7a99de 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -27,6 +27,8 @@ struct avs_tplg {
 	u32 num_fmts;
 	struct avs_tplg_modcfg_base *modcfgs_base;
 	u32 num_modcfgs_base;
+	struct avs_tplg_modcfg_ext *modcfgs_ext;
+	u32 num_modcfgs_ext;
 };
 
 struct avs_tplg_library {
@@ -41,4 +43,61 @@ struct avs_tplg_modcfg_base {
 	u32 is_pages;
 };
 
+struct avs_tplg_pin_format {
+	u32 pin_index;
+	u32 iobs;
+	struct avs_audio_format *fmt;
+};
+
+struct avs_tplg_modcfg_ext {
+	guid_t type;
+
+	union {
+		struct {
+			u16 num_input_pins;
+			u16 num_output_pins;
+			struct avs_tplg_pin_format *pin_fmts;
+		} generic;
+		struct {
+			struct avs_audio_format *out_fmt;
+			struct avs_audio_format *blob_fmt; /* optional override */
+			u32 feature_mask;
+			union avs_virtual_index vindex;
+			u32 dma_type;
+			u32 dma_buffer_size;
+			u32 config_length;
+			/* config_data part of priv data */
+		} copier;
+		struct {
+			u32 out_channel_config;
+			u32 coefficients_select;
+			s32 coefficients[AVS_CHANNELS_MAX];
+			u32 channel_map;
+		} updown_mix;
+		struct {
+			u32 out_freq;
+		} src;
+		struct {
+			u32 out_freq;
+			u8 mode;
+			u8 disable_jitter_buffer;
+		} asrc;
+		struct {
+			u32 cpc_lp_mode;
+		} wov;
+		struct {
+			struct avs_audio_format *ref_fmt;
+			struct avs_audio_format *out_fmt;
+			u32 cpc_lp_mode;
+		} aec;
+		struct {
+			struct avs_audio_format *ref_fmt;
+			struct avs_audio_format *out_fmt;
+		} mux;
+		struct {
+			struct avs_audio_format *out_fmt;
+		} micsel;
+	};
+};
+
 #endif
-- 
2.25.1


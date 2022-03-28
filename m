Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A6D4E9D50
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 19:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FAC418E8;
	Mon, 28 Mar 2022 19:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FAC418E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648487971;
	bh=JozjEFYT0n5R2/ELtQW5VthZtkWkVtC1XHvhYosr5T8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2gUdy8g9/sQ6WlaFrGg1T//ebTRSNALF40NU/amD2dKU53RNNEOCe9hnfBWBAly8
	 fTbQeBzifj+hbBcgEpr455QIviCdBuGysRZpScIiezQHSDy730dfZjBQAoO7MA25Ee
	 169gm3NXnG9jOfp7nXS7eDTUZjkT+0Jkl9ffodH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D2A9F8051D;
	Mon, 28 Mar 2022 19:16:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6488DF8024C; Mon, 28 Mar 2022 19:16:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27874F8024C
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 19:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27874F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BHVP2Gi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648487779; x=1680023779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JozjEFYT0n5R2/ELtQW5VthZtkWkVtC1XHvhYosr5T8=;
 b=BHVP2Gi85ipF2z6+0rop/EVulT+1jvCdyHgQyGnhirZl5txt11DP1qRX
 FZvt2luoGSyZ2l95t8yDc07Bnncq+q6BSlupb014ycah2s9OA8ej4C0Il
 wSVnxK0DMFOxat42YmV6wt56SUkly9Y1p7s7oMkpXQ84kRX3mPwzzuwQw
 iKeApC1I6rsQhZ5ht1Oilv+uqoSToAeFKgvVTI/oKGaOuwY1uMva7VBfG
 g70vNwHOLv2sO5ajS1lWEKl2CnlJ7SzdCUXWlskTPwZeUq5ufRE5tChP0
 dsjyjIGeCxMeVYv02yjFaG8ZqUK5gOlv83gE7fOuNWrjQQJyIRMzSc1XE A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345494473"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="345494473"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649141483"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2022 10:13:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 05/14] ASoC: Intel: avs: Parse pipeline and module tuples
Date: Mon, 28 Mar 2022 19:24:01 +0200
Message-Id: <20220328172410.761309-6-cezary.rojewski@intel.com>
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

Shape of a path on DSP side, that is, the number and the layout of its
pipelines and modules is paramount for streaming to be efficient and low
power-consuming. Add parsing helpers to support loading such information
from the topology file.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 177 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h |  31 ++++++
 2 files changed, 208 insertions(+)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 3d87ce508134..5eaa8d91ce97 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1004,3 +1004,180 @@ static int avs_tplg_parse_bindings(struct snd_soc_component *comp,
 				AVS_TKN_BINDING_ID_U32,
 				binding_parsers, ARRAY_SIZE(binding_parsers));
 }
+
+static const struct avs_tplg_token_parser module_parsers[] = {
+	{
+		.token = AVS_TKN_MOD_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_MOD_MODCFG_BASE_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, cfg_base),
+		.parse = avs_parse_modcfg_base_ptr,
+	},
+	{
+		.token = AVS_TKN_MOD_IN_AFMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, in_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_MOD_CORE_ID_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_module, core_id),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MOD_PROC_DOMAIN_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_module, domain),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_MOD_MODCFG_EXT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, cfg_ext),
+		.parse = avs_parse_modcfg_ext_ptr,
+	},
+};
+
+static struct avs_tplg_module *
+avs_tplg_module_create(struct snd_soc_component *comp, struct avs_tplg_pipeline *owner,
+		       struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
+{
+	struct avs_tplg_module *module;
+	int ret;
+
+	module = devm_kzalloc(comp->card->dev, sizeof(*module), GFP_KERNEL);
+	if (!module)
+		return ERR_PTR(-ENOMEM);
+
+	ret = avs_parse_tokens(comp, module, module_parsers,
+			       ARRAY_SIZE(module_parsers), tuples, block_size);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	module->owner = owner;
+	INIT_LIST_HEAD(&module->node);
+
+	return module;
+}
+
+static const struct avs_tplg_token_parser pipeline_parsers[] = {
+	{
+		.token = AVS_TKN_PPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pipeline, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_PPL_PPLCFG_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pipeline, cfg),
+		.parse = avs_parse_pplcfg_ptr,
+	},
+	{
+		.token = AVS_TKN_PPL_NUM_BINDING_IDS_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pipeline, num_bindings),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static const struct avs_tplg_token_parser bindings_parsers[] = {
+	{
+		.token = AVS_TKN_PPL_BINDING_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = 0, /* to treat pipeline->bindings as dictionary */
+		.parse = avs_parse_binding_ptr,
+	},
+};
+
+static struct avs_tplg_pipeline *
+avs_tplg_pipeline_create(struct snd_soc_component *comp, struct avs_tplg_path *owner,
+			 struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
+{
+	struct avs_tplg_pipeline *pipeline;
+	u32 modblk_size, offset;
+	int ret;
+
+	pipeline = devm_kzalloc(comp->card->dev, sizeof(*pipeline), GFP_KERNEL);
+	if (!pipeline)
+		return ERR_PTR(-ENOMEM);
+
+	pipeline->owner = owner;
+	INIT_LIST_HEAD(&pipeline->mod_list);
+
+	/* Pipeline header MUST be followed by at least one module. */
+	ret = avs_tplg_vendor_array_lookup(tuples, block_size,
+					   AVS_TKN_MOD_ID_U32, &offset);
+	if (!ret && !offset)
+		ret = -EINVAL;
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* Process header which precedes module sections. */
+	ret = avs_parse_tokens(comp, pipeline, pipeline_parsers,
+			       ARRAY_SIZE(pipeline_parsers), tuples, offset);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	block_size -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	/* Optionally, binding sections follow module ones. */
+	ret = avs_tplg_vendor_array_lookup_next(tuples, block_size,
+						AVS_TKN_PPL_BINDING_ID_U32, &offset);
+	if (ret) {
+		if (ret != -ENOENT)
+			return ERR_PTR(ret);
+
+		/* Does header information match actual block layout? */
+		if (pipeline->num_bindings)
+			return ERR_PTR(-EINVAL);
+
+		modblk_size = block_size;
+	} else {
+		pipeline->bindings = devm_kcalloc(comp->card->dev, pipeline->num_bindings,
+						  sizeof(*pipeline->bindings), GFP_KERNEL);
+		if (!pipeline->bindings)
+			return ERR_PTR(-ENOMEM);
+
+		modblk_size = offset;
+	}
+
+	block_size -= modblk_size;
+	do {
+		struct avs_tplg_module *module;
+		u32 esize;
+
+		ret = avs_tplg_vendor_entry_size(tuples, modblk_size,
+						 AVS_TKN_MOD_ID_U32, &esize);
+		if (ret)
+			return ERR_PTR(ret);
+
+		module = avs_tplg_module_create(comp, pipeline, tuples, esize);
+		if (IS_ERR(module)) {
+			dev_err(comp->dev, "parse module failed: %ld\n",
+				PTR_ERR(module));
+			return ERR_CAST(module);
+		}
+
+		list_add_tail(&module->node, &pipeline->mod_list);
+		modblk_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	} while (modblk_size > 0);
+
+	/* What's left is optional range of bindings. */
+	ret = parse_dictionary_entries(comp, tuples, block_size, pipeline->bindings,
+				       pipeline->num_bindings, sizeof(*pipeline->bindings),
+				       AVS_TKN_PPL_BINDING_ID_U32,
+				       bindings_parsers, ARRAY_SIZE(bindings_parsers));
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pipeline;
+}
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 7199d30cdab8..0a19302cef1a 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -128,4 +128,35 @@ struct avs_tplg_binding {
 	u8 is_sink;
 };
 
+struct avs_tplg_path {
+	u32 id;
+};
+
+struct avs_tplg_pipeline {
+	u32 id;
+
+	struct avs_tplg_pplcfg *cfg;
+	struct avs_tplg_binding **bindings;
+	u32 num_bindings;
+	struct list_head mod_list;
+
+	struct avs_tplg_path *owner;
+	/* Path pipelines management. */
+	struct list_head node;
+};
+
+struct avs_tplg_module {
+	u32 id;
+
+	struct avs_tplg_modcfg_base *cfg_base;
+	struct avs_audio_format *in_fmt;
+	u8 core_id;
+	u8 domain;
+	struct avs_tplg_modcfg_ext *cfg_ext;
+
+	struct avs_tplg_pipeline *owner;
+	/* Pipeline modules management. */
+	struct list_head node;
+};
+
 #endif
-- 
2.25.1


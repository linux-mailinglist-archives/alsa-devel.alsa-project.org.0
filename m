Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 499CB84DE34
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 11:25:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7043BA4A;
	Thu,  8 Feb 2024 11:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7043BA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707387903;
	bh=Ijx58OQhojtbDA551bO8hxBwQdbcSqQTMPdTmAIPi04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YnZyX8EYWEO2zQlnQ3rvtJ1WSZJiOWM9wNP3P0ub98LHY0NNVI+imnNIZHxkNc95E
	 lGFVXAx5Ya4uyRNVPzTYcXpy0eLJmfWVepdrIxREwhMMBwmNCX22uv2iFFdUCyPb1Z
	 zyDMlbggj7og3AHGLzpww8x5LLmdfhmBPB9vAqWM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14AA0F805F8; Thu,  8 Feb 2024 11:23:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28233F805F4;
	Thu,  8 Feb 2024 11:23:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DFF8F805CB; Thu,  8 Feb 2024 11:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE960F801D5
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 11:23:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE960F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JvwZRd7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707387820; x=1738923820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ijx58OQhojtbDA551bO8hxBwQdbcSqQTMPdTmAIPi04=;
  b=JvwZRd7frkHQL6JdG0gYuyf8gIp5S06JB7gCkTfBngq+jzj9s1LfTNjp
   g9jiZnsJE7cxTPupjWL5DhPJEjwGQ5vN+HZtPdv9g3VVWdmB2l+pThgl0
   drv/NTdI4V3CM/vliik0wyO4qJYk21Odc8GjGwb5R5IbQAlq1ZF8xZNwd
   7jxZBCjTZ0QG1Io+Aj5wR348xs7IDtYGXh0rapNzFhXxIgXsRj7h6ejCv
   88PKTf4IgqH8Ngh67AEgPD1XDppQBAojcV2kUW7NKR0lp58F0MAtr8h+e
   SJdd2ZhwpaU5nMT4cxuZiF5yB/EDwHNmz04ylIbs2dpJ8aIve4/WhBxDf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18699140"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400";
   d="scan'208";a="18699140"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 02:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400";
   d="scan'208";a="1913802"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2024 02:23:34 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 2/3] ASoC: Intel: avs: Add topology parsing support for
 initial config
Date: Thu,  8 Feb 2024 11:23:59 +0100
Message-Id: <20240208102400.2497791-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
References: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q3OYXN3GEEWTA4Y7ORLYCTTSZQDJCRS5
X-Message-ID-Hash: Q3OYXN3GEEWTA4Y7ORLYCTTSZQDJCRS5
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q3OYXN3GEEWTA4Y7ORLYCTTSZQDJCRS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add topology parsing for initial config.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---

Changes in v2:
 - Actually use block_size parameter passed to
   avs_tplg_parse_initial_configs()

---
 sound/soc/intel/avs/topology.c | 164 ++++++++++++++++++++++++++++++++-
 sound/soc/intel/avs/topology.h |  13 +++
 2 files changed, 175 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 48b3c67c91032..13061bd1488bb 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1118,6 +1118,21 @@ static const struct avs_tplg_token_parser module_parsers[] = {
 		.offset = offsetof(struct avs_tplg_module, ctl_id),
 		.parse = avs_parse_byte_token,
 	},
+	{
+		.token = AVS_TKN_MOD_INIT_CONFIG_NUM_IDS_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, num_config_ids),
+		.parse = avs_parse_byte_token,
+	},
+};
+
+static const struct avs_tplg_token_parser init_config_parsers[] = {
+	{
+		.token = AVS_TKN_MOD_INIT_CONFIG_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = 0,
+		.parse = avs_parse_word_token,
+	},
 };
 
 static struct avs_tplg_module *
@@ -1125,17 +1140,50 @@ avs_tplg_module_create(struct snd_soc_component *comp, struct avs_tplg_pipeline
 		       struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
 {
 	struct avs_tplg_module *module;
+	u32 esize;
 	int ret;
 
+	/* See where config id block starts. */
+	ret = avs_tplg_vendor_entry_size(tuples, block_size,
+					 AVS_TKN_MOD_INIT_CONFIG_ID_U32, &esize);
+	if (ret)
+		return ERR_PTR(ret);
+
 	module = devm_kzalloc(comp->card->dev, sizeof(*module), GFP_KERNEL);
 	if (!module)
 		return ERR_PTR(-ENOMEM);
 
 	ret = avs_parse_tokens(comp, module, module_parsers,
-			       ARRAY_SIZE(module_parsers), tuples, block_size);
+			       ARRAY_SIZE(module_parsers), tuples, esize);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
+	block_size -= esize;
+	/* Parse trailing config ids if any. */
+	if (block_size) {
+		u32 num_config_ids = module->num_config_ids;
+		u32 *config_ids;
+
+		if (!num_config_ids)
+			return ERR_PTR(-EINVAL);
+
+		config_ids = devm_kcalloc(comp->card->dev, num_config_ids, sizeof(*config_ids),
+					   GFP_KERNEL);
+		if (!config_ids)
+			return ERR_PTR(-ENOMEM);
+
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+		ret = parse_dictionary_entries(comp, tuples, block_size,
+					       config_ids, num_config_ids, sizeof(*config_ids),
+					       AVS_TKN_MOD_INIT_CONFIG_ID_U32,
+					       init_config_parsers,
+					       ARRAY_SIZE(init_config_parsers));
+		if (ret)
+			return ERR_PTR(ret);
+
+		module->config_ids = config_ids;
+	}
+
 	module->owner = owner;
 	INIT_LIST_HEAD(&module->node);
 
@@ -1416,6 +1464,82 @@ avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *o
 	return template;
 }
 
+static const struct avs_tplg_token_parser mod_init_config_parsers[] = {
+	{
+		.token = AVS_TKN_MOD_INIT_CONFIG_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_init_config, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_INIT_CONFIG_PARAM_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_init_config, param),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_INIT_CONFIG_LENGTH_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_init_config, length),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
+					   struct snd_soc_tplg_vendor_array *tuples,
+					   u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+	int ret, i;
+
+	/* Parse tuple section telling how many init configs there are. */
+	ret = parse_dictionary_header(comp, tuples, (void **)&tplg->init_configs,
+				      &tplg->num_init_configs,
+				      sizeof(*tplg->init_configs),
+				      AVS_TKN_MANIFEST_NUM_INIT_CONFIGS_U32);
+	if (ret)
+		return ret;
+
+	block_size -= le32_to_cpu(tuples->size);
+	/* With header parsed, move on to parsing entries. */
+	tuples = avs_tplg_vendor_array_next(tuples);
+
+	for (i = 0; i < tplg->num_init_configs && block_size > 0; i++) {
+		struct avs_tplg_init_config *config = &tplg->init_configs[i];
+		struct snd_soc_tplg_vendor_array *tmp;
+		void *init_config_data;
+		u32 esize;
+
+		/*
+		 * Usually to get section length we search for first token of next group of data,
+		 * but in this case we can't as tuples are followed by raw data.
+		 */
+		tmp = avs_tplg_vendor_array_next(tuples);
+		esize = le32_to_cpu(tuples->size) + le32_to_cpu(tmp->size);
+
+		ret = parse_dictionary_entries(comp, tuples, esize, config, 1, sizeof(*config),
+					       AVS_TKN_MOD_INIT_CONFIG_ID_U32,
+					       mod_init_config_parsers,
+					       ARRAY_SIZE(mod_init_config_parsers));
+
+		block_size -= esize;
+
+		/* handle raw data section */
+		init_config_data = (void *)tuples + esize;
+		esize = config->length;
+
+		config->data = devm_kmemdup(comp->card->dev, init_config_data, esize, GFP_KERNEL);
+		if (!config->data)
+			return -ENOMEM;
+
+		tuples = init_config_data + esize;
+		block_size -= esize;
+	}
+
+	return 0;
+}
+
 static int avs_route_load(struct snd_soc_component *comp, int index,
 			  struct snd_soc_dapm_route *route)
 {
@@ -1571,6 +1695,7 @@ static int avs_manifest(struct snd_soc_component *comp, int index,
 	struct snd_soc_tplg_vendor_array *tuples = manifest->priv.array;
 	struct avs_soc_component *acomp = to_avs_soc_component(comp);
 	size_t remaining = le32_to_cpu(manifest->priv.size);
+	bool has_init_config = true;
 	u32 offset;
 	int ret;
 
@@ -1668,8 +1793,43 @@ static int avs_manifest(struct snd_soc_component *comp, int index,
 	remaining -= offset;
 	tuples = avs_tplg_vendor_array_at(tuples, offset);
 
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_CONDPATH_TMPLS_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "condpath lookup failed: %d\n", ret);
+		return ret;
+	}
+
 	/* Bindings dictionary. */
-	return avs_tplg_parse_bindings(comp, tuples, remaining);
+	ret = avs_tplg_parse_bindings(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_INIT_CONFIGS_U32, &offset);
+	if (ret == -ENOENT) {
+		dev_dbg(comp->dev, "init config lookup failed: %d\n", ret);
+		has_init_config = false;
+	} else if (ret) {
+		dev_err(comp->dev, "init config lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	if (!has_init_config)
+		return 0;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	/* Initial configs dictionary. */
+	ret = avs_tplg_parse_initial_configs(comp, tuples, remaining);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 #define AVS_CONTROL_OPS_VOLUME	257
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 6e1c8e9b24964..6a59dd766603f 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -33,6 +33,9 @@ struct avs_tplg {
 	u32 num_pplcfgs;
 	struct avs_tplg_binding *bindings;
 	u32 num_bindings;
+	u32 num_condpath_tmpls;
+	struct avs_tplg_init_config *init_configs;
+	u32 num_init_configs;
 
 	struct list_head path_tmpl_list;
 };
@@ -147,6 +150,14 @@ struct avs_tplg_path_template {
 	struct list_head node;
 };
 
+struct avs_tplg_init_config {
+	u32 id;
+
+	u8 param;
+	size_t length;
+	void *data;
+};
+
 struct avs_tplg_path {
 	u32 id;
 
@@ -183,6 +194,8 @@ struct avs_tplg_module {
 	u8 domain;
 	struct avs_tplg_modcfg_ext *cfg_ext;
 	u32 ctl_id;
+	u32 num_config_ids;
+	u32 *config_ids;
 
 	struct avs_tplg_pipeline *owner;
 	/* Pipeline modules management. */
-- 
2.34.1


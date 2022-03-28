Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BCA4E9D4F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 19:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BF9418CC;
	Mon, 28 Mar 2022 19:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BF9418CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648487955;
	bh=7RsI+zeFCAMYJ01Qzpb5Ioy0ojkcgRd6iAI6ENwsB+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BIJ6saYCkJzh1b4RAlhuPAjXMf5dN038BgYbydVLlG1fWqHI7fq72Qfz3gueUkRJd
	 gIu+USNeItC1MZo7eezPndLVGZ1iLaa5Gg3ENB9IpPnCdnXFxvhTxiglrUwJkrUvYv
	 w+3nXlvQsd5Sot29dFxKjWPFcl0Wjrdt//3JZdeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE782F80537;
	Mon, 28 Mar 2022 19:16:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F49EF8051F; Mon, 28 Mar 2022 19:16:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6F52F804DA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 19:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6F52F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GSTynNxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648487780; x=1680023780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7RsI+zeFCAMYJ01Qzpb5Ioy0ojkcgRd6iAI6ENwsB+s=;
 b=GSTynNxz3mIx1tY+Bksx1jxHBNW+wo++t2uiLhIWCosTQId/1ItnNJO5
 5bfzsTyccT7ZHc5HHPKUC0dsC5HPo3GJAXmoyWkrpNKn06tiThZt8rs1q
 GBOV5eSa90u//oPK2qbrk5uaGPMqToMprKBZa/j6U9+H0H4vgJcoQx/VP
 zGsvgFz4Sck2pH38XbBWEEEzxM5ciOg3SQRIRBN8LvT+WuPmjhSmNzdMM
 W3lSfmWZcZ/29VJCXxMsqRA/i0dQqpk7QPcQRzXK2s1GjXG9WnJCklUWX
 RJkEUugKJiwqsPO+HwYdCYuMlZuwZsgoOlyM9Gk/6nm40MDmpJQnCJx8K g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345494485"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="345494485"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:14:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649141494"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2022 10:14:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 06/14] ASoC: Intel: avs: Parse path and path templates tuples
Date: Mon, 28 Mar 2022 19:24:02 +0200
Message-Id: <20220328172410.761309-7-cezary.rojewski@intel.com>
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

Path template is similar to path description found in skylake-driver
and it describes how given path shall look like in runtime - number of
modules and pipelines that shape it and how they are laid out. It is
tied to DAPM widget's (representing either a FE or a BE) private data.

Depending on the number of audio formats supported, each path template
may carry one or more descriptions of given path. During runtime, when
audio format is known, description matching said format is selected and
used when instantiating path on ADSP firmware side through IPCs.

Add parsing helpers to support loading such information from the
topology file.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 158 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h |  27 ++++++
 2 files changed, 185 insertions(+)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 5eaa8d91ce97..243ec27e7ec7 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1181,3 +1181,161 @@ avs_tplg_pipeline_create(struct snd_soc_component *comp, struct avs_tplg_path *o
 
 	return pipeline;
 }
+
+static const struct avs_tplg_token_parser path_parsers[] = {
+	{
+		.token = AVS_TKN_PATH_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_PATH_FE_FMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, fe_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+	{
+		.token = AVS_TKN_PATH_BE_FMT_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, be_fmt),
+		.parse = avs_parse_audio_format_ptr,
+	},
+};
+
+static struct avs_tplg_path *
+avs_tplg_path_create(struct snd_soc_component *comp, struct avs_tplg_path_template *owner,
+		     struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
+		     const struct avs_tplg_token_parser *parsers, u32 num_parsers)
+{
+	struct avs_tplg_pipeline *pipeline;
+	struct avs_tplg_path *path;
+	u32 offset;
+	int ret;
+
+	path = devm_kzalloc(comp->card->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return ERR_PTR(-ENOMEM);
+
+	path->owner = owner;
+	INIT_LIST_HEAD(&path->ppl_list);
+	INIT_LIST_HEAD(&path->node);
+
+	/* Path header MAY be followed by one or more pipelines. */
+	ret = avs_tplg_vendor_array_lookup(tuples, block_size,
+					   AVS_TKN_PPL_ID_U32, &offset);
+	if (ret == -ENOENT)
+		offset = block_size;
+	else if (ret)
+		return ERR_PTR(ret);
+	else if (!offset)
+		return ERR_PTR(-EINVAL);
+
+	/* Process header which precedes pipeline sections. */
+	ret = avs_parse_tokens(comp, path, parsers, num_parsers, tuples, offset);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	block_size -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+	while (block_size > 0) {
+		u32 esize;
+
+		ret = avs_tplg_vendor_entry_size(tuples, block_size,
+						 AVS_TKN_PPL_ID_U32, &esize);
+		if (ret)
+			return ERR_PTR(ret);
+
+		pipeline = avs_tplg_pipeline_create(comp, path, tuples, esize);
+		if (IS_ERR(pipeline)) {
+			dev_err(comp->dev, "parse pipeline failed: %ld\n",
+				PTR_ERR(pipeline));
+			return ERR_CAST(pipeline);
+		}
+
+		list_add_tail(&pipeline->node, &path->ppl_list);
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	}
+
+	return path;
+}
+
+static const struct avs_tplg_token_parser path_tmpl_parsers[] = {
+	{
+		.token = AVS_TKN_PATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path_template, id),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static int parse_path_template(struct snd_soc_component *comp,
+			       struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
+			       struct avs_tplg_path_template *template,
+			       const struct avs_tplg_token_parser *tmpl_tokens, u32 num_tmpl_tokens,
+			       const struct avs_tplg_token_parser *path_tokens, u32 num_path_tokens)
+{
+	struct avs_tplg_path *path;
+	u32 offset;
+	int ret;
+
+	/* Path template header MUST be followed by at least one path variant. */
+	ret = avs_tplg_vendor_array_lookup(tuples, block_size,
+					   AVS_TKN_PATH_ID_U32, &offset);
+	if (ret)
+		return ret;
+
+	/* Process header which precedes path variants sections. */
+	ret = avs_parse_tokens(comp, template, tmpl_tokens, num_tmpl_tokens, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	block_size -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+	do {
+		u32 esize;
+
+		ret = avs_tplg_vendor_entry_size(tuples, block_size,
+						 AVS_TKN_PATH_ID_U32, &esize);
+		if (ret)
+			return ret;
+
+		path = avs_tplg_path_create(comp, template, tuples, esize, path_tokens,
+					    num_path_tokens);
+		if (IS_ERR(path)) {
+			dev_err(comp->dev, "parse path failed: %ld\n", PTR_ERR(path));
+			return PTR_ERR(path);
+		}
+
+		list_add_tail(&path->node, &template->path_list);
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	} while (block_size > 0);
+
+	return 0;
+}
+
+static struct avs_tplg_path_template *
+avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *owner,
+			      struct snd_soc_tplg_vendor_array *tuples, u32 block_size)
+{
+	struct avs_tplg_path_template *template;
+	int ret;
+
+	template = devm_kzalloc(comp->card->dev, sizeof(*template), GFP_KERNEL);
+	if (!template)
+		return ERR_PTR(-ENOMEM);
+
+	template->owner = owner; /* Used to access component tplg is assigned to. */
+	INIT_LIST_HEAD(&template->path_list);
+	INIT_LIST_HEAD(&template->node);
+
+	ret = parse_path_template(comp, tuples, block_size, template, path_tmpl_parsers,
+				  ARRAY_SIZE(path_tmpl_parsers), path_parsers,
+				  ARRAY_SIZE(path_parsers));
+	if (ret)
+		return ERR_PTR(ret);
+
+	return template;
+}
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 0a19302cef1a..3067d63cfcf7 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -33,6 +33,8 @@ struct avs_tplg {
 	u32 num_pplcfgs;
 	struct avs_tplg_binding *bindings;
 	u32 num_bindings;
+
+	struct list_head path_tmpl_list;
 };
 
 struct avs_tplg_library {
@@ -128,8 +130,33 @@ struct avs_tplg_binding {
 	u8 is_sink;
 };
 
+struct avs_tplg_path_template_id {
+	u32 id;
+	char tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+};
+
+struct avs_tplg_path_template {
+	u32 id;
+
+	struct list_head path_list;
+
+	struct avs_tplg *owner;
+	/* Driver path templates management. */
+	struct list_head node;
+};
+
 struct avs_tplg_path {
 	u32 id;
+
+	/* Path format requirements. */
+	struct avs_audio_format *fe_fmt;
+	struct avs_audio_format *be_fmt;
+
+	struct list_head ppl_list;
+
+	struct avs_tplg_path_template *owner;
+	/* Path template path-variants management. */
+	struct list_head node;
 };
 
 struct avs_tplg_pipeline {
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9210E4ABF8C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:26:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4079D1754;
	Mon,  7 Feb 2022 14:25:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4079D1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644240401;
	bh=XDjaVRCrwfbpyeDhHM4QlTN1XyDRWuPJjSbHdSCJCus=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tob4PmmY9rI9q32RXdXLpmWcvgs0uuD5/cNdur7jxoEcOxo3JBTs9oddPbUR29VNo
	 X5pApClsSf287qXVX6CPb4q1mO4LNkL+vzoCbHmPz9k/eyW749Xri5qAw+drY6x3x/
	 TbBpu18838v2wdPFBEvL644/STNafPuxtRbqZYgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2FB9F80533;
	Mon,  7 Feb 2022 14:24:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DBEAF80240; Mon,  7 Feb 2022 14:24:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACA08F80240
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:24:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA08F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HvZ3jfPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644240249; x=1675776249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XDjaVRCrwfbpyeDhHM4QlTN1XyDRWuPJjSbHdSCJCus=;
 b=HvZ3jfPT6uuZqDfCmIFtaRdtOdaI6KZMYIrXJrUoIF4iBRlo6JV/71jR
 ssHIfsA7FhxyxVMyUwCCaVnxjggaLTeq0cbEkZthmMgGLFVXivIdtwRCm
 mVXoDwJSO5UOuuzydsfdX/lEEvWmYzJt0iXDSlB9EOG0M3Nisoe/UDeRe
 5YdWHN0qUHX4fpgzPbgngMDCYrhuPJMe7j3c5sZbfrqEqjeYUkksw1REY
 1VzGTw4NozHfOpq62cq96D4ZKfaFixQ2bR4AwbGcOs4LKFGY+UPNGaVIY
 8H/8BfV8SOH7zU0nS4C2TXMPBZDtujoQBV5lkOfrsGrf4lfh3Deeas6F0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312011554"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="312011554"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:24:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="677751314"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 05:24:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 06/13] ASoC: Intel: avs: Parse path and path templates tuples
Date: Mon,  7 Feb 2022 14:25:24 +0100
Message-Id: <20220207132532.3782412-7-cezary.rojewski@intel.com>
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

Path template is a pattern like its name suggests. It is tied to DAPM
widget which represents a FE or a BE and is used during path
instantiation when substream is opened for streaming. It carries a range
of available variants - actual implementation of a runtime path on
AudioDSP side. Only one variant of given path template can be
instantiated at a time and selection is based off of audio format
provided from userspace and currently selected one on the codec.

Add parsing helpers to support loading such information from the
topology file.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 158 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h |  27 ++++++
 2 files changed, 185 insertions(+)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 8889ceae19b9..92f7b9a361e1 100644
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
+	template->owner = owner; /* Used when building sysfs hierarchy. */
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
index b68c73afcde3..383931ab1d77 100644
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
@@ -129,8 +131,33 @@ struct avs_tplg_binding {
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


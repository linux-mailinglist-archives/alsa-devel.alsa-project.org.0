Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F75E4EDAC5
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 15:44:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C69001A98;
	Thu, 31 Mar 2022 15:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C69001A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648734297;
	bh=s1W7+ewhoG6bbq3Q6knIEUw9a+/uZ/sgGvvyBl5LrGs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V16p/crMTNnOtMBl1907DCDxj+LgA8+EP4TaBuzT78aNmmYUrjSxWRqhKXcb2tyhW
	 sawnz36pp/hjpvd9oMoIyrm0QWnDLmEaGtKJa7jn8ZSe3C+exdKZ2gpcv2xqWxM9JG
	 RpN7ku5mMnAdd0xbNoE0pA8w3UpljlvfixRsGf84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 034F8F80537;
	Thu, 31 Mar 2022 15:42:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BA6FF80529; Thu, 31 Mar 2022 15:42:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B733F8051A
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 15:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B733F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ee4fUhyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648734146; x=1680270146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s1W7+ewhoG6bbq3Q6knIEUw9a+/uZ/sgGvvyBl5LrGs=;
 b=ee4fUhyCrXhvMcbYriTO56WlR8sqTapM61sblMaNM3ERuVBAFd1o0L54
 a0JS7mkv+mPIV7yiryBn07CUvDi8tADl17CoUY1q1m5uMvSNrY5H1Pz1r
 a9+r+AVA1G0BQWSpy0RJpHtEG4eIWeBcM20In1dcVygtyjIQNyVTYNY2O
 zfDZxZzJENk1Li1TOGyVcfrX282CGImAH8fxuIIMJYTReEO0mGyUszA+3
 1VvRy7lWp4cfv65toLWDhpjBcywjssPmnuVXTGhkMOrgcY7rjLYzqzvoH
 4OwKB9i6eOVdLsm1TiuDiPKALRBYIDVmidzVGCyt0UAIBtfM6VoPZfQ6E A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259819131"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259819131"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="522349151"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 31 Mar 2022 06:42:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 04/14] ASoC: Intel: avs: Parse pplcfg and binding tuples
Date: Thu, 31 Mar 2022 15:52:36 +0200
Message-Id: <20220331135246.993089-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331135246.993089-1-cezary.rojewski@intel.com>
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
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

Path in ADSP firmware is represented by one or more pipelines. Just like
modules, these are described by a config structure. Add parsing helpers
to support loading such information from the topology file.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 114 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h |  28 ++++++++
 2 files changed, 142 insertions(+)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index d13e27dd655e..3d87ce508134 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -345,6 +345,8 @@ avs_parse_##name##_ptr(struct snd_soc_component *comp, void *elem, void *object,
 AVS_DEFINE_PTR_PARSER(audio_format, struct avs_audio_format, fmts);
 AVS_DEFINE_PTR_PARSER(modcfg_base, struct avs_tplg_modcfg_base, modcfgs_base);
 AVS_DEFINE_PTR_PARSER(modcfg_ext, struct avs_tplg_modcfg_ext, modcfgs_ext);
+AVS_DEFINE_PTR_PARSER(pplcfg, struct avs_tplg_pplcfg, pplcfgs);
+AVS_DEFINE_PTR_PARSER(binding, struct avs_tplg_binding, bindings);
 
 static int
 parse_audio_format_bitfield(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
@@ -890,3 +892,115 @@ static int avs_tplg_parse_modcfgs_ext(struct snd_soc_component *comp,
 
 	return 0;
 }
+
+static const struct avs_tplg_token_parser pplcfg_parsers[] = {
+	{
+		.token = AVS_TKN_PPLCFG_REQ_SIZE_U16,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_SHORT,
+		.offset = offsetof(struct avs_tplg_pplcfg, req_size),
+		.parse = avs_parse_short_token,
+	},
+	{
+		.token = AVS_TKN_PPLCFG_PRIORITY_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_pplcfg, priority),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_PPLCFG_LOW_POWER_BOOL,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BOOL,
+		.offset = offsetof(struct avs_tplg_pplcfg, lp),
+		.parse = avs_parse_bool_token,
+	},
+	{
+		.token = AVS_TKN_PPLCFG_ATTRIBUTES_U16,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_SHORT,
+		.offset = offsetof(struct avs_tplg_pplcfg, attributes),
+		.parse = avs_parse_short_token,
+	},
+	{
+		.token = AVS_TKN_PPLCFG_TRIGGER_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_pplcfg, trigger),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static int avs_tplg_parse_pplcfgs(struct snd_soc_component *comp,
+				  struct snd_soc_tplg_vendor_array *tuples,
+				  u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+
+	return parse_dictionary(comp, tuples, block_size, (void **)&tplg->pplcfgs,
+				&tplg->num_pplcfgs, sizeof(*tplg->pplcfgs),
+				AVS_TKN_MANIFEST_NUM_PPLCFGS_U32,
+				AVS_TKN_PPLCFG_ID_U32,
+				pplcfg_parsers, ARRAY_SIZE(pplcfg_parsers));
+}
+
+static const struct avs_tplg_token_parser binding_parsers[] = {
+	{
+		.token = AVS_TKN_BINDING_TARGET_TPLG_NAME_STRING,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		.offset = offsetof(struct avs_tplg_binding, target_tplg_name),
+		.parse = parse_link_formatted_string,
+	},
+	{
+		.token = AVS_TKN_BINDING_TARGET_PATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_binding, target_path_tmpl_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_TARGET_PPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_binding, target_ppl_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_TARGET_MOD_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_binding, target_mod_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_TARGET_MOD_PIN_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_binding, target_mod_pin),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_MOD_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_binding, mod_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_MOD_PIN_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_binding, mod_pin),
+		.parse = avs_parse_byte_token,
+	},
+	{
+		.token = AVS_TKN_BINDING_IS_SINK_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_binding, is_sink),
+		.parse = avs_parse_byte_token,
+	},
+};
+
+static int avs_tplg_parse_bindings(struct snd_soc_component *comp,
+				   struct snd_soc_tplg_vendor_array *tuples,
+				   u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+
+	return parse_dictionary(comp, tuples, block_size, (void **)&tplg->bindings,
+				&tplg->num_bindings, sizeof(*tplg->bindings),
+				AVS_TKN_MANIFEST_NUM_BINDINGS_U32,
+				AVS_TKN_BINDING_ID_U32,
+				binding_parsers, ARRAY_SIZE(binding_parsers));
+}
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index ce51fd7a99de..7199d30cdab8 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -29,6 +29,10 @@ struct avs_tplg {
 	u32 num_modcfgs_base;
 	struct avs_tplg_modcfg_ext *modcfgs_ext;
 	u32 num_modcfgs_ext;
+	struct avs_tplg_pplcfg *pplcfgs;
+	u32 num_pplcfgs;
+	struct avs_tplg_binding *bindings;
+	u32 num_bindings;
 };
 
 struct avs_tplg_library {
@@ -100,4 +104,28 @@ struct avs_tplg_modcfg_ext {
 	};
 };
 
+/* Specifies path behaviour during PCM ->trigger(START) command. */
+enum avs_tplg_trigger {
+	AVS_TPLG_TRIGGER_AUTO = 0,
+};
+
+struct avs_tplg_pplcfg {
+	u16 req_size;
+	u8 priority;
+	bool lp;
+	u16 attributes;
+	enum avs_tplg_trigger trigger;
+};
+
+struct avs_tplg_binding {
+	char target_tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	u32 target_path_tmpl_id;
+	u32 target_ppl_id;
+	u32 target_mod_id;
+	u8 target_mod_pin;
+	u32 mod_id;
+	u8 mod_pin;
+	u8 is_sink;
+};
+
 #endif
-- 
2.25.1


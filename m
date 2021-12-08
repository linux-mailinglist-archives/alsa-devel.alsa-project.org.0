Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B489646D200
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:19:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DAB61663;
	Wed,  8 Dec 2021 12:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DAB61663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962360;
	bh=xLtR2CxL0cNJhiLi0LgNLqwDeMwCwc5Cycu7yl+ar30=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pALYKLiJMOkVUhwXIsnTOObJVPEzzBcTFuH6JEsO8nriqakBnSqi6avbF03C3iqJB
	 fnkQf4F/nyOOpsj0whvIn32VNU6P3q97zH4Ryipuey+i2K4x3kfDCHjIog4NjXV8sC
	 61uh1/p46bTtSq/2RLD942Y7JpQqQgnYidOesxGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B580FF805B3;
	Wed,  8 Dec 2021 12:12:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F13B6F805CA; Wed,  8 Dec 2021 12:12:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B04BF805AC
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B04BF805AC
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548397"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548397"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600287"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:11:57 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 20/37] ASoC: Intel: avs: Conditional-path support
Date: Wed,  8 Dec 2021 12:12:44 +0100
Message-Id: <20211208111301.1817725-21-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

Compared to standard paths, conditional paths are not invoked by the
means of FE being opened by userspace and thus their variant selection
is not FE/BE audio format based. These are a side effect of standard path
creation if specific criteria are met.

Algorithm is implemented to walk on all existing runtime paths and match
them against conditions provided by topology. These conditions are based
on source and sink path formats, rather than formats provided from
userspace app or present on the codec. If match is found, new path is
created and tied to those which brought it into existence: source and
sink path. If any of its parents perishes, so does the conditional path.

Conditional paths are used to enable any complex, modern audio scenario
which involves usage of KPB, AEC and WoV modules and more.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/intel/avs/tokens.h |  16 ++
 sound/soc/intel/avs/path.c            | 275 ++++++++++++++++++++++++++
 sound/soc/intel/avs/path.h            |  13 ++
 sound/soc/intel/avs/topology.c        | 139 ++++++++++++-
 sound/soc/intel/avs/topology.h        |  12 ++
 5 files changed, 454 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index 3621227b89b9..d8aed26e06c8 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -19,6 +19,7 @@ enum avs_tplg_token {
 	AVS_TKN_MANIFEST_NUM_MODCFGS_EXT_U32		= 6,
 	AVS_TKN_MANIFEST_NUM_PPLCFGS_U32		= 7,
 	AVS_TKN_MANIFEST_NUM_BINDINGS_U32		= 8,
+	AVS_TKN_MANIFEST_NUM_CONDPATH_TMPLS_U32		= 9,
 
 	/* struct avs_tplg_library */
 	AVS_TKN_LIBRARY_ID_U32				= 101,
@@ -122,6 +123,21 @@ enum avs_tplg_token {
 	AVS_TKN_PATH_FE_FMT_ID_U32			= 1902,
 	AVS_TKN_PATH_BE_FMT_ID_U32			= 1903,
 
+	/* struct avs_tplg_path_template (conditional) */
+	AVS_TKN_CONDPATH_TMPL_ID_U32			= 1801,
+	AVS_TKN_CONDPATH_TMPL_SOURCE_TPLG_NAME_STRING	= 2002,
+	AVS_TKN_CONDPATH_TMPL_SOURCE_PATH_TMPL_ID_U32	= 2003,
+	AVS_TKN_CONDPATH_TMPL_SINK_TPLG_NAME_STRING	= 2004,
+	AVS_TKN_CONDPATH_TMPL_SINK_PATH_TMPL_ID_U32	= 2005,
+	AVS_TKN_CONDPATH_TMPL_COND_TYPE_U32		= 2006,
+	AVS_TKN_CONDPATH_TMPL_OVERRIDABLE_BOOL		= 2007,
+	AVS_TKN_CONDPATH_TMPL_PRIORITY_U8		= 2008,
+
+	/* struct avs_tplg_path (conditional) */
+	AVS_TKN_CONDPATH_ID_U32				= 1901,
+	AVS_TKN_CONDPATH_SOURCE_PATH_ID_U32		= 2102,
+	AVS_TKN_CONDPATH_SINK_PATH_ID_U32		= 2103,
+
 	/* struct avs_tplg_pin_format */
 	AVS_TKN_PIN_FMT_INDEX_U32			= 2201,
 	AVS_TKN_PIN_FMT_IOBS_U32			= 2202,
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index b27ec9686a9b..a7c391eed7b9 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -113,6 +113,79 @@ avs_path_find_variant(struct avs_dev *adev,
 	return NULL;
 }
 
+static struct avs_tplg_path *
+avs_condpath_find_variant(struct avs_dev *adev,
+			  struct avs_tplg_path_template *template,
+			  struct avs_path *source, struct avs_path *sink)
+{
+	struct avs_tplg_path *variant;
+
+	list_for_each_entry(variant, &template->path_list, node) {
+		if (variant->source_path_id == source->template->id &&
+		    variant->sink_path_id == sink->template->id)
+			return variant;
+	}
+
+	return NULL;
+}
+
+static bool avs_tplg_path_template_id_equal(struct avs_tplg_path_template_id *id,
+					    struct avs_tplg_path_template_id *id2)
+{
+	return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
+}
+
+static struct avs_path *
+avs_condpath_find_match(struct avs_dev *adev,
+			struct avs_tplg_path_template *template,
+			struct avs_path *path, int dir)
+{
+	struct avs_tplg_path_template_id *id, *id2;
+
+	if (dir) {
+		id = &template->source;
+		id2 = &template->sink;
+	} else {
+		id = &template->sink;
+		id2 = &template->source;
+	}
+
+	/* Check whether this path is either source or sink of condpath template. */
+	if (id->id != path->template->owner->id ||
+	    strcmp(id->tplg_name, path->template->owner->owner->name))
+		return NULL;
+
+	/* Unidirectional condpaths are allowed. */
+	if (avs_tplg_path_template_id_equal(id, id2))
+		return path;
+
+	/* Now find the counterpart */
+	return avs_path_find_path(adev, id2->tplg_name, id2->id);
+}
+
+static struct avs_path *
+avs_condpath_find_conflict(struct avs_dev *adev, u32 cond_type,
+			   struct avs_path *path, int dir)
+{
+	struct avs_path *pos, *target;
+
+	if (cond_type != AVS_COND_TYPE_NONE) {
+		spin_lock(&adev->path_list_lock);
+		list_for_each_entry(pos, &adev->path_list, node) {
+			if (pos->template->owner->cond_type != cond_type)
+				continue;
+			target = dir ? pos->source : pos->sink;
+			if (path == target) {
+				spin_unlock(&adev->path_list_lock);
+				return pos;
+			}
+		}
+		spin_unlock(&adev->path_list_lock);
+	}
+
+	return NULL;
+}
+
 __maybe_unused
 static bool avs_dma_type_is_host(u32 dma_type)
 {
@@ -724,6 +797,10 @@ static int avs_path_init(struct avs_dev *adev, struct avs_path *path,
 	path->dma_id = dma_id;
 	INIT_LIST_HEAD(&path->ppl_list);
 	INIT_LIST_HEAD(&path->node);
+	INIT_LIST_HEAD(&path->source_list);
+	INIT_LIST_HEAD(&path->sink_list);
+	INIT_LIST_HEAD(&path->source_node);
+	INIT_LIST_HEAD(&path->sink_node);
 
 	/* create all the pipelines */
 	list_for_each_entry(tppl, &template->ppl_list, node) {
@@ -810,6 +887,162 @@ static struct avs_path *avs_path_create_unlocked(struct avs_dev *adev, u32 dma_i
 	return ERR_PTR(ret);
 }
 
+static void avs_condpath_free(struct avs_dev *adev, struct avs_path *path)
+{
+	int ret;
+
+	list_del(&path->source_node);
+	list_del(&path->sink_node);
+
+	ret = avs_path_reset(path);
+	if (ret < 0)
+		dev_err(adev->dev, "reset condpath failed: %d\n", ret);
+
+	ret = avs_path_unbind(path);
+	if (ret < 0)
+		dev_err(adev->dev, "unbind condpath failed: %d\n", ret);
+
+	avs_path_free_unlocked(path);
+}
+
+static struct avs_path *avs_condpath_create(struct avs_dev *adev, u32 dma_id,
+					    struct avs_tplg_path *template,
+					    struct avs_path *source,
+					    struct avs_path *sink)
+{
+	struct avs_path *path;
+	int ret;
+
+	path = avs_path_create_unlocked(adev, dma_id, template);
+	if (IS_ERR(path))
+		return path;
+
+	ret = avs_path_bind(path);
+	if (ret)
+		goto err;
+
+	ret = avs_path_reset(path);
+	if (ret)
+		goto err;
+
+	path->source = source;
+	path->sink = sink;
+	list_add_tail(&path->source_node, &source->source_list);
+	list_add_tail(&path->sink_node, &sink->sink_list);
+
+	return path;
+err:
+	avs_path_free_unlocked(path);
+	return ERR_PTR(ret);
+}
+
+static int avs_condpath_walk(struct avs_dev *adev, struct avs_path *path, int dir)
+{
+	struct avs_tplg_path_template *template;
+	struct avs_soc_component *acomp;
+	struct avs_tplg_path *variant;
+	struct avs_path **other, *conflict;
+	struct avs_path *source, *sink;
+	struct avs_path *cpath;
+	unsigned long type, types = 0;
+	int max, i;
+
+	if (dir) {
+		source = path;
+		other = &sink;
+	} else {
+		sink = path;
+		other = &source;
+	}
+
+	/* First create all non-conflicting condpaths. */
+	list_for_each_entry(acomp, &adev->comp_list, node) {
+		for (i = 0; i < acomp->tplg->num_condpath_tmpls; i++) {
+			template = &acomp->tplg->condpath_tmpls[i];
+
+			/* Do not create unidirectional condpaths twice */
+			if (avs_tplg_path_template_id_equal(&template->source,
+							    &template->sink) && dir)
+				continue;
+
+			if (template->cond_type != AVS_COND_TYPE_NONE) {
+				/* Save conflicting types to check later on. */
+				types |= BIT(template->cond_type);
+				continue;
+			}
+
+			*other = avs_condpath_find_match(adev, template, path, dir);
+			if (!*other)
+				continue;
+			variant = avs_condpath_find_variant(adev, template, source, sink);
+			if (!variant)
+				continue;
+
+			cpath = avs_condpath_create(adev, 0, variant, source, sink);
+			if (IS_ERR(cpath))
+				return PTR_ERR(cpath);
+		}
+	}
+	/* Now deal with exclusive condpaths. */
+	for_each_set_bit(type, &types, 32) {
+		variant = NULL;
+		*other = NULL;
+
+		conflict = avs_condpath_find_conflict(adev, type, path, dir);
+		if (conflict) {
+			/* Does existing conflict allow for override? */
+			if (!conflict->template->owner->overridable)
+				continue;
+			max = conflict->template->owner->priority;
+		} else {
+			max = -1;
+		}
+
+		/* Find best match - with highest priority. */
+		list_for_each_entry(acomp, &adev->comp_list, node) {
+			for (i = 0; i < acomp->tplg->num_condpath_tmpls; i++) {
+				template = &acomp->tplg->condpath_tmpls[i];
+
+				/* Do not create unidirectional condpaths twice */
+				if (avs_tplg_path_template_id_equal(&template->source,
+								    &template->sink) && dir)
+					continue;
+
+				if (template->cond_type != type || template->priority <= max)
+					continue;
+
+				*other = avs_condpath_find_match(adev, template, path, dir);
+				if (!*other)
+					continue;
+				variant = avs_condpath_find_variant(adev, template, source,
+								    sink);
+				if (variant)
+					max = template->priority;
+			}
+		}
+
+		if (variant) {
+			cpath = avs_condpath_create(adev, 0, variant, source, sink);
+			if (IS_ERR(cpath))
+				return PTR_ERR(cpath);
+		}
+	}
+
+	return 0;
+}
+
+/* caller responsible for holding adev->path_mutex */
+static int avs_condpath_walk_all(struct avs_dev *adev, struct avs_path *path)
+{
+	int ret;
+
+	ret = avs_condpath_walk(adev, path, 1);
+	if (ret)
+		return ret;
+
+	return avs_condpath_walk(adev, path, 0);
+}
+
 struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
 				 struct avs_tplg_path_template *template,
 				 struct snd_pcm_hw_params *fe_params,
@@ -817,6 +1050,7 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
 {
 	struct avs_tplg_path *variant;
 	struct avs_path *path;
+	int ret;
 
 	variant = avs_path_find_variant(adev, template, fe_params, be_params);
 	if (!variant) {
@@ -830,7 +1064,16 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
 	mutex_lock(&adev->comp_list_mutex);
 
 	path = avs_path_create_unlocked(adev, dma_id, variant);
+	if (IS_ERR(path))
+		goto exit;
+
+	ret = avs_condpath_walk_all(adev, path);
+	if (ret) {
+		avs_path_free_unlocked(path);
+		path = ERR_PTR(ret);
+	}
 
+exit:
 	mutex_unlock(&adev->comp_list_mutex);
 	mutex_unlock(&adev->path_mutex);
 
@@ -839,10 +1082,19 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
 
 void avs_path_free(struct avs_path *path)
 {
+	struct avs_path *cpath, *csave;
 	struct avs_dev *adev = path->owner;
 
 	mutex_lock(&adev->path_mutex);
+
+	/* Free all condpaths this path spawned. */
+	list_for_each_entry_safe(cpath, csave, &path->source_list, source_node)
+		avs_condpath_free(path->owner, cpath);
+	list_for_each_entry_safe(cpath, csave, &path->sink_list, sink_node)
+		avs_condpath_free(path->owner, cpath);
+
 	avs_path_free_unlocked(path);
+
 	mutex_unlock(&adev->path_mutex);
 }
 
@@ -965,12 +1217,19 @@ int avs_path_reset(struct avs_path *path)
 int avs_path_pause(struct avs_path *path)
 {
 	struct avs_path_pipeline *ppl;
+	struct avs_path *cpath;
 	struct avs_dev *adev = path->owner;
 	int ret;
 
 	if (path->state == AVS_PPL_STATE_PAUSED)
 		return 0;
 
+	/* if either source or sink stops, so do attached conditional paths */
+	list_for_each_entry(cpath, &path->source_list, source_node)
+		avs_path_pause(cpath);
+	list_for_each_entry(cpath, &path->sink_list, sink_node)
+		avs_path_pause(cpath);
+
 	list_for_each_entry_reverse(ppl, &path->ppl_list, node) {
 		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
 						 AVS_PPL_STATE_PAUSED);
@@ -988,6 +1247,7 @@ int avs_path_pause(struct avs_path *path)
 int avs_path_run(struct avs_path *path, int trigger)
 {
 	struct avs_path_pipeline *ppl;
+	struct avs_path *cpath;
 	struct avs_dev *adev = path->owner;
 	int ret;
 
@@ -1008,5 +1268,20 @@ int avs_path_run(struct avs_path *path, int trigger)
 	}
 
 	path->state = AVS_PPL_STATE_RUNNING;
+
+	/* granular pipeline triggering not intended for conditional paths */
+	if (trigger == AVS_TPLG_TRIGGER_AUTO) {
+		/* run conditional paths only if source and sink are both running */
+		list_for_each_entry(cpath, &path->source_list, source_node)
+			if (cpath->source->state == AVS_PPL_STATE_RUNNING &&
+			    cpath->sink->state == AVS_PPL_STATE_RUNNING)
+				avs_path_run(cpath, trigger);
+
+		list_for_each_entry(cpath, &path->sink_list, sink_node)
+			if (cpath->source->state == AVS_PPL_STATE_RUNNING &&
+			    cpath->sink->state == AVS_PPL_STATE_RUNNING)
+				avs_path_run(cpath, trigger);
+	}
+
 	return 0;
 }
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index c30ff44c07ca..ea754001b4f3 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -13,11 +13,24 @@
 #include "avs.h"
 #include "topology.h"
 
+#define AVS_COND_TYPE_NONE	0
+#define AVS_COND_TYPE_AECREF	1
+
 struct avs_path {
 	u32 dma_id;
 	struct list_head ppl_list;
 	u32 state;
 
+	/* condpath navigation for standard paths */
+	struct list_head source_list;
+	struct list_head sink_list;
+
+	/* conditional path fields */
+	struct avs_path *source;
+	struct avs_path *sink;
+	struct list_head source_node;
+	struct list_head sink_node;
+
 	struct avs_tplg_path *template;
 	struct avs_dev *owner;
 	/* device path management */
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index c33e1b415f52..ae267a3b7127 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1171,6 +1171,27 @@ static const struct avs_tplg_token_parser path_parsers[] = {
 	},
 };
 
+static const struct avs_tplg_token_parser condpath_parsers[] = {
+	{
+		.token = AVS_TKN_CONDPATH_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_SOURCE_PATH_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, source_path_id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_SINK_PATH_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path, sink_path_id),
+		.parse = avs_parse_word_token,
+	},
+};
+
 static struct avs_tplg_path *
 avs_tplg_path_create(struct snd_soc_component *comp, struct avs_tplg_path_template *owner,
 		     struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
@@ -1238,6 +1259,57 @@ static const struct avs_tplg_token_parser path_tmpl_parsers[] = {
 	},
 };
 
+static const struct avs_tplg_token_parser condpath_tmpl_parsers[] = {
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path_template, id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_SOURCE_TPLG_NAME_STRING,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		.offset = offsetof(struct avs_tplg_path_template, source.tplg_name),
+		.parse = avs_parse_string_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_SOURCE_PATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path_template, source.id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_SINK_TPLG_NAME_STRING,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		.offset = offsetof(struct avs_tplg_path_template, sink.tplg_name),
+		.parse = avs_parse_string_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_SINK_PATH_TMPL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path_template, sink.id),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_COND_TYPE_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_path_template, cond_type),
+		.parse = avs_parse_word_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_OVERRIDABLE_BOOL,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BOOL,
+		.offset = offsetof(struct avs_tplg_path_template, overridable),
+		.parse = avs_parse_bool_token,
+	},
+	{
+		.token = AVS_TKN_CONDPATH_TMPL_PRIORITY_U8,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_BYTE,
+		.offset = offsetof(struct avs_tplg_path_template, priority),
+		.parse = avs_parse_byte_token,
+	},
+};
+
 static int parse_path_template(struct snd_soc_component *comp,
 			       struct snd_soc_tplg_vendor_array *tuples, u32 block_size,
 			       struct avs_tplg_path_template *template,
@@ -1308,6 +1380,56 @@ avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *o
 	return template;
 }
 
+static int avs_tplg_parse_condpath_templates(struct snd_soc_component *comp,
+					     struct snd_soc_tplg_vendor_array *tuples,
+					     u32 block_size)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg = acomp->tplg;
+	int ret, i;
+
+	ret = parse_dictionary_header(comp, tuples, (void **)&tplg->condpath_tmpls,
+				      &tplg->num_condpath_tmpls,
+				      sizeof(*tplg->condpath_tmpls),
+				      AVS_TKN_MANIFEST_NUM_CONDPATH_TMPLS_U32);
+	if (ret)
+		return ret;
+
+	block_size -= le32_to_cpu(tuples->size);
+	/* With header parsed, move on to parsing entries. */
+	tuples = avs_tplg_vendor_array_next(tuples);
+
+	for (i = 0; i < tplg->num_condpath_tmpls; i++) {
+		struct avs_tplg_path_template *template;
+		u32 esize;
+
+		template = &tplg->condpath_tmpls[i];
+		template->owner = tplg; /* Used when building sysfs hierarchy. */
+		INIT_LIST_HEAD(&template->path_list);
+		INIT_LIST_HEAD(&template->node);
+
+		ret = avs_tplg_vendor_entry_size(tuples, block_size,
+						 AVS_TKN_CONDPATH_TMPL_ID_U32, &esize);
+		if (ret)
+			return ret;
+
+		ret = parse_path_template(comp, tuples, esize, template,
+					  condpath_tmpl_parsers,
+					  ARRAY_SIZE(condpath_tmpl_parsers),
+					  condpath_parsers,
+					  ARRAY_SIZE(condpath_parsers));
+		if (ret < 0) {
+			dev_err(comp->dev, "parse condpath_tmpl: %d failed: %d\n", i, ret);
+			return ret;
+		}
+
+		block_size -= esize;
+		tuples = avs_tplg_vendor_array_at(tuples, esize);
+	}
+
+	return 0;
+}
+
 static int avs_route_load(struct snd_soc_component *comp, int index,
 			  struct snd_soc_dapm_route *route)
 {
@@ -1512,8 +1634,23 @@ static int avs_manifest(struct snd_soc_component *comp, int index,
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
+	/* Condpaths dictionary. */
+	return avs_tplg_parse_condpath_templates(comp, tuples, remaining);
 }
 
 static struct snd_soc_tplg_ops avs_tplg_ops = {
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 6058d868f802..3d229f11fc93 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -33,6 +33,8 @@ struct avs_tplg {
 	u32 num_pplcfgs;
 	struct avs_tplg_binding *bindings;
 	u32 num_bindings;
+	struct avs_tplg_path_template *condpath_tmpls;
+	u32 num_condpath_tmpls;
 
 	struct list_head path_tmpl_list;
 };
@@ -139,6 +141,13 @@ struct avs_tplg_path_template_id {
 struct avs_tplg_path_template {
 	u32 id;
 
+	/* Conditional path. */
+	struct avs_tplg_path_template_id source;
+	struct avs_tplg_path_template_id sink;
+	u32 cond_type;
+	bool overridable;
+	u8 priority;
+
 	struct list_head path_list;
 
 	struct avs_tplg *owner;
@@ -152,6 +161,9 @@ struct avs_tplg_path {
 	/* Path format requirements. */
 	struct avs_audio_format *fe_fmt;
 	struct avs_audio_format *be_fmt;
+	/* Condpath path-variant requirements. */
+	u32 source_path_id;
+	u32 sink_path_id;
 
 	struct list_head ppl_list;
 
-- 
2.25.1


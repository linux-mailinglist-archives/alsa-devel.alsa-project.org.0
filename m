Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D78474EDAD4
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 15:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78C061739;
	Thu, 31 Mar 2022 15:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78C061739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648734410;
	bh=gdUlhBmuIeI3/ouGV5W0tbLrSX4BClenfDAUfQD0EOE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P/o5GWG/9H5lyhkN04snhJ30rQAOQj10/YX/1cBlQ7d/NJkIw3ZjaIG/x4Tjp0c3s
	 3vUSycES2ULCIR+mKhZcpWxHddbSdGKPMtaXWJp7Id1bRxFz1GdDM0U6mquya/mwAC
	 XFsgo6pxljQP/0b76Zs9ZzTn55A0x2WsboEZwsPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F537F80579;
	Thu, 31 Mar 2022 15:42:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFD7AF80570; Thu, 31 Mar 2022 15:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 994CDF80566
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 15:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 994CDF80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g4eF3WZf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648734170; x=1680270170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gdUlhBmuIeI3/ouGV5W0tbLrSX4BClenfDAUfQD0EOE=;
 b=g4eF3WZfC2nWxRi4ze8PVfb3uNi/D83XeIalmA7VXjZ3Om+Rf35TAlnm
 DO4I43DOPKHi44KqnswQw8ykgWnWT/wYD7mJF3L0/cijDcQ8C7CKI15U2
 pCzyTfuqd6EcjAKQVktfsMNfy0s3qlJi9SSoSYNf2jJo/Y8O0oUlgS6jN
 Fvb2W4pzRd/DAwFDkPMr1k0zU8vPznXoOAGHjhtfvEr36i5zugaMQlE5v
 mznLE7iOJlRvYRygNn5KjPYdg/BH3HJVSszQm9Ls5IBm1G0sgbPWQfLIh
 gUcGwo1k3has9O/RWBx3j3TeW2XmsgRCAYt46ie0OjNtL8Fub1ljMeO5c g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259819215"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259819215"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="522349276"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 31 Mar 2022 06:42:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 12/14] ASoC: Intel: avs: Arm paths after creating them
Date: Thu, 31 Mar 2022 15:52:44 +0200
Message-Id: <20220331135246.993089-13-cezary.rojewski@intel.com>
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

Creating the pipelines and instantiating the modules alone is
insufficient to have a fully operational stream. Before it can be run,
stream components need to be bound. Add arming functions to ensure all
necessary operations are completed before path is yielded back to the
avs_path_create() caller.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 180 +++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 7febd5118a5d..13006c24ebf8 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -13,6 +13,73 @@
 #include "path.h"
 #include "topology.h"
 
+/* Must be called with adev->comp_list_mutex held. */
+static struct avs_tplg *
+avs_path_find_tplg(struct avs_dev *adev, const char *name)
+{
+	struct avs_soc_component *acomp;
+
+	list_for_each_entry(acomp, &adev->comp_list, node)
+		if (!strcmp(acomp->tplg->name, name))
+			return acomp->tplg;
+	return NULL;
+}
+
+static struct avs_path_module *
+avs_path_find_module(struct avs_path_pipeline *ppl, u32 template_id)
+{
+	struct avs_path_module *mod;
+
+	list_for_each_entry(mod, &ppl->mod_list, node)
+		if (mod->template->id == template_id)
+			return mod;
+	return NULL;
+}
+
+static struct avs_path_pipeline *
+avs_path_find_pipeline(struct avs_path *path, u32 template_id)
+{
+	struct avs_path_pipeline *ppl;
+
+	list_for_each_entry(ppl, &path->ppl_list, node)
+		if (ppl->template->id == template_id)
+			return ppl;
+	return NULL;
+}
+
+static struct avs_path *
+avs_path_find_path(struct avs_dev *adev, const char *name, u32 template_id)
+{
+	struct avs_tplg_path_template *pos, *template = NULL;
+	struct avs_tplg *tplg;
+	struct avs_path *path;
+
+	tplg = avs_path_find_tplg(adev, name);
+	if (!tplg)
+		return NULL;
+
+	list_for_each_entry(pos, &tplg->path_tmpl_list, node) {
+		if (pos->id == template_id) {
+			template = pos;
+			break;
+		}
+	}
+	if (!template)
+		return NULL;
+
+	spin_lock(&adev->path_list_lock);
+	/* Only one variant of given path template may be instantiated at a time. */
+	list_for_each_entry(path, &adev->path_list, node) {
+		if (path->template->owner == template) {
+			spin_unlock(&adev->path_list_lock);
+			return path;
+		}
+	}
+
+	spin_unlock(&adev->path_list_lock);
+	return NULL;
+}
+
 static bool avs_test_hw_params(struct snd_pcm_hw_params *params,
 			       struct avs_audio_format *fmt)
 {
@@ -75,6 +142,58 @@ avs_path_module_create(struct avs_dev *adev,
 	return mod;
 }
 
+static int avs_path_binding_arm(struct avs_dev *adev, struct avs_path_binding *binding)
+{
+	struct avs_path_module *this_mod, *target_mod;
+	struct avs_path_pipeline *target_ppl;
+	struct avs_path *target_path;
+	struct avs_tplg_binding *t;
+
+	t = binding->template;
+	this_mod = avs_path_find_module(binding->owner,
+					t->mod_id);
+	if (!this_mod) {
+		dev_err(adev->dev, "path mod %d not found\n", t->mod_id);
+		return -EINVAL;
+	}
+
+	/* update with target_tplg_name too */
+	target_path = avs_path_find_path(adev, t->target_tplg_name,
+					 t->target_path_tmpl_id);
+	if (!target_path) {
+		dev_err(adev->dev, "target path %s:%d not found\n",
+			t->target_tplg_name, t->target_path_tmpl_id);
+		return -EINVAL;
+	}
+
+	target_ppl = avs_path_find_pipeline(target_path,
+					    t->target_ppl_id);
+	if (!target_ppl) {
+		dev_err(adev->dev, "target ppl %d not found\n", t->target_ppl_id);
+		return -EINVAL;
+	}
+
+	target_mod = avs_path_find_module(target_ppl, t->target_mod_id);
+	if (!target_mod) {
+		dev_err(adev->dev, "target mod %d not found\n", t->target_mod_id);
+		return -EINVAL;
+	}
+
+	if (t->is_sink) {
+		binding->sink = this_mod;
+		binding->sink_pin = t->mod_pin;
+		binding->source = target_mod;
+		binding->source_pin = t->target_mod_pin;
+	} else {
+		binding->sink = target_mod;
+		binding->sink_pin = t->target_mod_pin;
+		binding->source = this_mod;
+		binding->source_pin = t->mod_pin;
+	}
+
+	return 0;
+}
+
 static void avs_path_binding_free(struct avs_dev *adev, struct avs_path_binding *binding)
 {
 	kfree(binding);
@@ -97,6 +216,38 @@ static struct avs_path_binding *avs_path_binding_create(struct avs_dev *adev,
 	return binding;
 }
 
+static int avs_path_pipeline_arm(struct avs_dev *adev,
+				 struct avs_path_pipeline *ppl)
+{
+	struct avs_path_module *mod;
+
+	list_for_each_entry(mod, &ppl->mod_list, node) {
+		struct avs_path_module *source, *sink;
+		int ret;
+
+		/*
+		 * Only one module (so it's implicitly last) or it is the last
+		 * one, either way we don't have next module to bind it to.
+		 */
+		if (mod == list_last_entry(&ppl->mod_list,
+					   struct avs_path_module, node))
+			break;
+
+		/* bind current module to next module on list */
+		source = mod;
+		sink = list_next_entry(mod, node);
+		if (!source || !sink)
+			return -EINVAL;
+
+		ret = avs_ipc_bind(adev, source->module_id, source->instance_id,
+				   sink->module_id, sink->instance_id, 0, 0);
+		if (ret)
+			return AVS_IPC_RET(ret);
+	}
+
+	return 0;
+}
+
 static void avs_path_pipeline_free(struct avs_dev *adev,
 				   struct avs_path_pipeline *ppl)
 {
@@ -212,6 +363,31 @@ static int avs_path_init(struct avs_dev *adev, struct avs_path *path,
 	return 0;
 }
 
+static int avs_path_arm(struct avs_dev *adev, struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_path_binding *binding;
+	int ret;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		/*
+		 * Arm all ppl bindings before binding internal modules
+		 * as it costs no IPCs which isn't true for the latter.
+		 */
+		list_for_each_entry(binding, &ppl->binding_list, node) {
+			ret = avs_path_binding_arm(adev, binding);
+			if (ret < 0)
+				return ret;
+		}
+
+		ret = avs_path_pipeline_arm(adev, ppl);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void avs_path_free_unlocked(struct avs_path *path)
 {
 	struct avs_path_pipeline *ppl, *save;
@@ -240,6 +416,10 @@ static struct avs_path *avs_path_create_unlocked(struct avs_dev *adev, u32 dma_i
 	if (ret < 0)
 		goto err;
 
+	ret = avs_path_arm(adev, path);
+	if (ret < 0)
+		goto err;
+
 	path->state = AVS_PPL_STATE_INVALID;
 	return path;
 err:
-- 
2.25.1


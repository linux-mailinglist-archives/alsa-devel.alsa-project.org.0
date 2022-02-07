Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840C4ABF95
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20D6B17DA;
	Mon,  7 Feb 2022 14:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20D6B17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644240475;
	bh=KLhOVSOjQ5uRsnZhFwzK0GUpUSj2OglB4X3KDRmWXEc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jDEfrThnl1pq2vxq1GH9yRmex9AYia2VYYt1fbV/X+9YCJW8nErWpwClUSEVElw48
	 mLcIiEjxOBfE/q1zs4BwqUAqzejs96KK3fH763dVSpMs6YTRteQaA4+xvtS6EwsYwb
	 gsA2qmpROiSbwE3PppSO2jPNUNDnaclvT/hd6uis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2863BF80558;
	Mon,  7 Feb 2022 14:24:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82A2BF8052E; Mon,  7 Feb 2022 14:24:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAC12F8052E
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC12F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V649MUtD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644240259; x=1675776259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KLhOVSOjQ5uRsnZhFwzK0GUpUSj2OglB4X3KDRmWXEc=;
 b=V649MUtDaWVe6CVBeZ5oJ6dH5ikn1tAUQge0RbWaX0dfKzTtNtbkKCV+
 artVsvqN76D2jLoB5Hm4yaGpPmBi4wA0KChb7dtOdg3PY2vJqfSVEv4Jf
 6XVitsJopqHZqZHsPnnTbHkbLn54SNndf2XoTRXch1JkvrDmda0Ctxahu
 rv1Wt6JJSUQa0dyGPKrCnvqyEIbAGTc4cIaqfma3joNvgJpRf3sREwE2q
 hlzAR9/f+ck+a+sCbtoTlwmQtKMsJ6qmYj9BKG7ikfG2WSQIQAgFO61Jg
 7phA0fO6zzl0KEHfpJCClQIopju7/LABm9XKO+NYjjvLpj5Ifl0aA3T+1 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312011583"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="312011583"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:24:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="677751340"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 05:24:14 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 09/13] ASoC: Intel: avs: Path creation and freeing
Date: Mon,  7 Feb 2022 14:25:27 +0100
Message-Id: <20220207132532.3782412-10-cezary.rojewski@intel.com>
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

To implement ASoC PCM operations, DSP path handling is needed. With path
template concept present, information carried by topology file can be
converted into runtime path representation. Each may be composed of
several pipelines and each pipeline can contain a number of processing
modules inside. Number of templates and variants found within topology
may vastly outnumber the total amount of pipelines and modules supported
by AudioDSP firmware simultaneously (in runtime) so none of the IDs are
specified in the topology. These are assigned dynamically when needed
and account for limitations described by FIRMWARE_CONFIG and
HARDWARE_CONFIG basefw parameters.

Paths are created on ->hw_params() and are freed on ->hw_free() ALSA PCM
operations. This choice is based on firmware expectations - need for
complete set of information when attempting to instantiate pipelines and
modules on AudioDSP side. With DMA and audio format provided, search
mechanism tests all path variants available in given path template until
a matching variant is found. Once found, information already available
is combined with all avs_tplg_* pieces pointed by matching path variant.
This finally allows to begin a cascade of IPCs which goes is to reserve
resources and prepare DSP for upcoming audio streaming.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile |   2 +-
 sound/soc/intel/avs/avs.h    |   6 +
 sound/soc/intel/avs/path.c   | 287 +++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/path.h   |   6 +
 4 files changed, 300 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/path.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 5e12a3a89e64..952f51977656 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
-		    topology.o
+		    topology.o path.o
 snd-soc-avs-objs += cldma.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index b0c17c45d7c6..313001b0455f 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -91,6 +91,12 @@ struct avs_dev {
 	char **lib_names;
 
 	struct completion fw_ready;
+
+	struct list_head comp_list;
+	struct mutex comp_list_mutex;
+	struct list_head path_list;
+	spinlock_t path_list_lock;
+	struct mutex path_mutex;
 };
 
 /* from hda_bus to avs_dev */
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
new file mode 100644
index 000000000000..272d868bedc9
--- /dev/null
+++ b/sound/soc/intel/avs/path.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <sound/intel-nhlt.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "avs.h"
+#include "path.h"
+#include "topology.h"
+
+static bool avs_test_hw_params(struct snd_pcm_hw_params *params,
+			       struct avs_audio_format *fmt)
+{
+	return (params_rate(params) == fmt->sampling_freq &&
+		params_channels(params) == fmt->num_channels &&
+		params_physical_width(params) == fmt->bit_depth &&
+		params_width(params) == fmt->valid_bit_depth);
+}
+
+static struct avs_tplg_path *
+avs_path_find_variant(struct avs_dev *adev,
+		      struct avs_tplg_path_template *template,
+		      struct snd_pcm_hw_params *fe_params,
+		      struct snd_pcm_hw_params *be_params)
+{
+	struct avs_tplg_path *variant;
+
+	list_for_each_entry(variant, &template->path_list, node) {
+		dev_dbg(adev->dev, "check FE rate %d chn %d vbd %d bd %d\n",
+			variant->fe_fmt->sampling_freq, variant->fe_fmt->num_channels,
+			variant->fe_fmt->valid_bit_depth, variant->fe_fmt->bit_depth);
+		dev_dbg(adev->dev, "check BE rate %d chn %d vbd %d bd %d\n",
+			variant->be_fmt->sampling_freq, variant->be_fmt->num_channels,
+			variant->be_fmt->valid_bit_depth, variant->be_fmt->bit_depth);
+
+		if (variant->fe_fmt && avs_test_hw_params(fe_params, variant->fe_fmt) &&
+		    variant->be_fmt && avs_test_hw_params(be_params, variant->be_fmt))
+			return variant;
+	}
+
+	return NULL;
+}
+
+static void avs_path_module_free(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	kfree(mod);
+}
+
+static struct avs_path_module *
+avs_path_module_create(struct avs_dev *adev,
+		       struct avs_path_pipeline *owner,
+		       struct avs_tplg_module *template)
+{
+	struct avs_path_module *mod;
+	int module_id;
+
+	module_id = avs_get_module_id(adev, &template->cfg_ext->type);
+	if (module_id < 0)
+		return ERR_PTR(module_id);
+
+	mod = kzalloc(sizeof(*mod), GFP_KERNEL);
+	if (!mod)
+		return ERR_PTR(-ENOMEM);
+
+	mod->template = template;
+	mod->module_id = module_id;
+	mod->owner = owner;
+	INIT_LIST_HEAD(&mod->node);
+
+	return mod;
+}
+
+static void avs_path_binding_free(struct avs_dev *adev, struct avs_path_binding *binding)
+{
+	kfree(binding);
+}
+
+static struct avs_path_binding *avs_path_binding_create(struct avs_dev *adev,
+							struct avs_path_pipeline *owner,
+							struct avs_tplg_binding *t)
+{
+	struct avs_path_binding *binding;
+
+	binding = kzalloc(sizeof(*binding), GFP_KERNEL);
+	if (!binding)
+		return ERR_PTR(-ENOMEM);
+
+	binding->template = t;
+	binding->owner = owner;
+	INIT_LIST_HEAD(&binding->node);
+
+	return binding;
+}
+
+static void avs_path_pipeline_free(struct avs_dev *adev,
+				   struct avs_path_pipeline *ppl)
+{
+	struct avs_path_binding *binding, *bsave;
+	struct avs_path_module *mod, *save;
+
+	list_for_each_entry_safe(binding, bsave, &ppl->binding_list, node) {
+		list_del(&binding->node);
+		avs_path_binding_free(adev, binding);
+	}
+
+	avs_dsp_delete_pipeline(adev, ppl->instance_id);
+
+	/* Unload resources occupied by owned modules */
+	list_for_each_entry_safe(mod, save, &ppl->mod_list, node) {
+		avs_dsp_delete_module(adev, mod->module_id, mod->instance_id,
+				      mod->owner->instance_id,
+				      mod->template->core_id);
+		avs_path_module_free(adev, mod);
+	}
+
+	list_del(&ppl->node);
+	kfree(ppl);
+}
+
+static struct avs_path_pipeline *
+avs_path_pipeline_create(struct avs_dev *adev, struct avs_path *owner,
+			 struct avs_tplg_pipeline *template)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_tplg_pplcfg *cfg = template->cfg;
+	struct avs_tplg_module *tmod;
+	int ret, i;
+
+	ppl = kzalloc(sizeof(*ppl), GFP_KERNEL);
+	if (!ppl)
+		return ERR_PTR(-ENOMEM);
+
+	ppl->template = template;
+	ppl->owner = owner;
+	INIT_LIST_HEAD(&ppl->binding_list);
+	INIT_LIST_HEAD(&ppl->mod_list);
+	INIT_LIST_HEAD(&ppl->node);
+
+	ret = avs_dsp_create_pipeline(adev, cfg->req_size, cfg->priority,
+				      cfg->lp, cfg->attributes,
+				      &ppl->instance_id);
+	if (ret) {
+		dev_err(adev->dev, "error creating pipeline %d\n", ret);
+		kfree(ppl);
+		return ERR_PTR(ret);
+	}
+
+	list_for_each_entry(tmod, &template->mod_list, node) {
+		struct avs_path_module *mod;
+
+		mod = avs_path_module_create(adev, ppl, tmod);
+		if (IS_ERR(mod)) {
+			ret = PTR_ERR(mod);
+			dev_err(adev->dev, "error creating module %d\n", ret);
+			goto init_err;
+		}
+
+		list_add_tail(&mod->node, &ppl->mod_list);
+	}
+
+	for (i = 0; i < template->num_bindings; i++) {
+		struct avs_path_binding *binding;
+
+		binding = avs_path_binding_create(adev, ppl, template->bindings[i]);
+		if (IS_ERR(binding)) {
+			ret = PTR_ERR(binding);
+			dev_err(adev->dev, "error creating binding %d\n", ret);
+			goto init_err;
+		}
+
+		list_add_tail(&binding->node, &ppl->binding_list);
+	}
+
+	return ppl;
+
+init_err:
+	avs_path_pipeline_free(adev, ppl);
+	return ERR_PTR(ret);
+}
+
+static int avs_path_init(struct avs_dev *adev, struct avs_path *path,
+			 struct avs_tplg_path *template, u32 dma_id)
+{
+	struct avs_tplg_pipeline *tppl;
+
+	path->owner = adev;
+	path->template = template;
+	path->dma_id = dma_id;
+	INIT_LIST_HEAD(&path->ppl_list);
+	INIT_LIST_HEAD(&path->node);
+
+	/* create all the pipelines */
+	list_for_each_entry(tppl, &template->ppl_list, node) {
+		struct avs_path_pipeline *ppl;
+
+		ppl = avs_path_pipeline_create(adev, path, tppl);
+		if (IS_ERR(ppl))
+			return PTR_ERR(ppl);
+
+		list_add_tail(&ppl->node, &path->ppl_list);
+	}
+
+	spin_lock(&adev->path_list_lock);
+	list_add_tail(&path->node, &adev->path_list);
+	spin_unlock(&adev->path_list_lock);
+
+	return 0;
+}
+
+static void avs_path_free_unlocked(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl, *save;
+
+	spin_lock(&path->owner->path_list_lock);
+	list_del(&path->node);
+	spin_unlock(&path->owner->path_list_lock);
+
+	list_for_each_entry_safe(ppl, save, &path->ppl_list, node)
+		avs_path_pipeline_free(path->owner, ppl);
+
+	kfree(path);
+}
+
+static struct avs_path *avs_path_create_unlocked(struct avs_dev *adev, u32 dma_id,
+						 struct avs_tplg_path *template)
+{
+	struct avs_soc_component *acomp;
+	struct avs_path *path;
+	int ret;
+
+	acomp = to_avs_soc_component(template->owner->owner->comp);
+
+	path = kzalloc(sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return ERR_PTR(-ENOMEM);
+
+	ret = avs_path_init(adev, path, template, dma_id);
+	if (ret < 0)
+		goto err;
+
+	path->state = AVS_PPL_STATE_INVALID;
+	return path;
+err:
+	avs_path_free_unlocked(path);
+	return ERR_PTR(ret);
+}
+
+void avs_path_free(struct avs_path *path)
+{
+	struct avs_dev *adev = path->owner;
+
+	mutex_lock(&adev->path_mutex);
+	avs_path_free_unlocked(path);
+	mutex_unlock(&adev->path_mutex);
+}
+
+struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
+				 struct avs_tplg_path_template *template,
+				 struct snd_pcm_hw_params *fe_params,
+				 struct snd_pcm_hw_params *be_params)
+{
+	struct avs_tplg_path *variant;
+	struct avs_path *path;
+
+	variant = avs_path_find_variant(adev, template, fe_params, be_params);
+	if (!variant) {
+		dev_err(adev->dev, "no matching variant found\n");
+		return ERR_PTR(-ENOENT);
+	}
+
+	/* Serialize path and its components creation. */
+	mutex_lock(&adev->path_mutex);
+	/* Satisfy needs of avs_path_find_tplg(). */
+	mutex_lock(&adev->comp_list_mutex);
+
+	path = avs_path_create_unlocked(adev, dma_id, variant);
+
+	mutex_unlock(&adev->comp_list_mutex);
+	mutex_unlock(&adev->path_mutex);
+
+	return path;
+}
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index ecfb687fdf36..3843e5a062a1 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -57,4 +57,10 @@ struct avs_path_binding {
 	struct list_head node;
 };
 
+void avs_path_free(struct avs_path *path);
+struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
+				 struct avs_tplg_path_template *template,
+				 struct snd_pcm_hw_params *fe_params,
+				 struct snd_pcm_hw_params *be_params);
+
 #endif
-- 
2.25.1


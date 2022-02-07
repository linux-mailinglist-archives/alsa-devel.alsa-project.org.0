Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA554ABF91
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:27:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3124C1745;
	Mon,  7 Feb 2022 14:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3124C1745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644240443;
	bh=Q9juU6vSnvsHaSLg08p6dICrWYKAT7JVo6hXeUuNL0Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E6R6PfOqdJWkanVIiXG8o4Tf/bNspzu0VXz6gXxLnf1rB7O7BoLceuxiXH5g/rDK/
	 cuuw12asWYfP0o3JLxzhmxUsbjPChlvlN7l6aoBmJpxUX4up3FVZkDm4HSbUQsl47u
	 hc7rQ5QrDj2wXW+fxjzCGfgMgNNZ+J2LyYbv8eGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A441F8023B;
	Mon,  7 Feb 2022 14:24:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94092F8023B; Mon,  7 Feb 2022 14:24:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCDD6F8023B
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCDD6F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hfVTBSZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644240253; x=1675776253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q9juU6vSnvsHaSLg08p6dICrWYKAT7JVo6hXeUuNL0Y=;
 b=hfVTBSZe3C6KscEisCcJv/FpVdoG3Fuce2CxcN8Q2pNGeMrb1uSZL/Jj
 8iRlglThgfZUP8SAh6VEIyECPor5UdMOyEd4X8QO07l7xvKU9bgWQ+wLT
 2EdHBJUkXbvqNR7A3hGjE4MAolfwN81a3KxLMYNqfG0HgjG8dmUF+IQEm
 vw8iNY8vTdfufBHaDGWU3IbeLgiadLL2Ff6J+n48IB9q+2+qYjBwWnaSp
 ku9UXGQsWp8HwvJSm75tnp23OaeaOALgICXJLVnNuWgpfeydnzAtcBC4A
 UbvG2beRj7r9HQ19Nmhlix5qTw4xx6OG4krVrBnzeGsUq8JlZCFs2ReOV Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312011569"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="312011569"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:24:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="677751323"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 05:24:08 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 07/13] ASoC: Intel: avs: Add topology loading operations
Date: Mon,  7 Feb 2022 14:25:25 +0100
Message-Id: <20220207132532.3782412-8-cezary.rojewski@intel.com>
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

AVS topology is split into two major parts: dictionaries - found within
ASoC topology manifest - and path templates - found within DAPM widget
private data. Add custom handlers for a range of operations available
in struct snd_soc_tplg_ops to allow for actually loading the topology
file.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig        |   1 +
 sound/soc/intel/avs/Makefile   |   3 +-
 sound/soc/intel/avs/avs.h      |   2 +
 sound/soc/intel/avs/topology.c | 259 +++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h |   5 +
 5 files changed, 269 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 96aa702d831d..f0688c3d76a7 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -216,6 +216,7 @@ config SND_SOC_INTEL_AVS
 	depends on SND_SOC_INTEL_SKYLAKE_FAMILY=n
 	default n
 	select SND_SOC_ACPI
+	select SND_SOC_TOPOLOGY
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
 	help
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index f842bfc5e97e..5e12a3a89e64 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o
+snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
+		    topology.o
 snd-soc-avs-objs += cldma.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 61842720c894..b0c17c45d7c6 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -237,4 +237,6 @@ struct avs_soc_component {
 #define to_avs_soc_component(comp) \
 	container_of(comp, struct avs_soc_component, base)
 
+extern const struct snd_soc_dai_ops avs_dai_fe_ops;
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 92f7b9a361e1..d7390359c39c 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -6,6 +6,7 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <linux/firmware.h>
 #include <linux/uuid.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
@@ -14,6 +15,8 @@
 #include "avs.h"
 #include "topology.h"
 
+const struct snd_soc_dai_ops avs_dai_fe_ops;
+
 /* Get pointer to vendor array at the specified offset. */
 #define avs_tplg_vendor_array_at(array, offset) \
 	((struct snd_soc_tplg_vendor_array *)((u8 *)array + offset))
@@ -1339,3 +1342,259 @@ avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *o
 
 	return template;
 }
+
+static int avs_route_load(struct snd_soc_component *comp, int index,
+			  struct snd_soc_dapm_route *route)
+{
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
+	size_t len = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
+	char buf[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	u32 port;
+
+	/* See parse_link_formatted_string() for dynamic naming when(s). */
+	if (hweight_long(mach->link_mask) == 1) {
+		port = __ffs(mach->link_mask);
+
+		snprintf(buf, len, route->source, port);
+		strncpy((char *)route->source, buf, len);
+		snprintf(buf, len, route->sink, port);
+		strncpy((char *)route->sink, buf, len);
+		if (route->control) {
+			snprintf(buf, len, route->control, port);
+			strncpy((char *)route->control, buf, len);
+		}
+	}
+
+	return 0;
+}
+
+static int avs_widget_load(struct snd_soc_component *comp, int index,
+			   struct snd_soc_dapm_widget *w,
+			   struct snd_soc_tplg_dapm_widget *dw)
+{
+	struct snd_soc_acpi_mach *mach;
+	struct avs_tplg_path_template *template;
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	struct avs_tplg *tplg;
+
+	if (!le32_to_cpu(dw->priv.size))
+		return 0;
+
+	tplg = acomp->tplg;
+	mach = dev_get_platdata(comp->card->dev);
+
+	/* See parse_link_formatted_string() for dynamic naming when(s). */
+	if (hweight_long(mach->link_mask) == 1) {
+		kfree(w->name);
+		/* ->name is freed later by soc_tplg_dapm_widget_create() */
+		w->name = kasprintf(GFP_KERNEL, dw->name, __ffs(mach->link_mask));
+		if (!w->name)
+			return -ENOMEM;
+	}
+
+	template = avs_tplg_path_template_create(comp, tplg, dw->priv.array,
+						 le32_to_cpu(dw->priv.size));
+	if (IS_ERR(template)) {
+		dev_err(comp->dev, "widget %s load failed: %ld\n", dw->name,
+			PTR_ERR(template));
+		return PTR_ERR(template);
+	}
+
+	w->priv = template; /* link path information to widget */
+	list_add_tail(&template->node, &tplg->path_tmpl_list);
+	return 0;
+}
+
+static int avs_dai_load(struct snd_soc_component *comp, int index,
+			struct snd_soc_dai_driver *dai_drv, struct snd_soc_tplg_pcm *pcm,
+			struct snd_soc_dai *dai)
+{
+	if (pcm)
+		dai_drv->ops = &avs_dai_fe_ops;
+	return 0;
+}
+
+static int avs_link_load(struct snd_soc_component *comp, int index, struct snd_soc_dai_link *link,
+			 struct snd_soc_tplg_link_config *cfg)
+{
+	/* Stream control handled by IPCs. */
+	link->nonatomic = true;
+
+	if (!link->no_pcm) {
+		/* Open LINK (BE) pipes last and close them first to prevent xruns. */
+		link->trigger[0] = SND_SOC_DPCM_TRIGGER_PRE;
+		link->trigger[1] = SND_SOC_DPCM_TRIGGER_PRE;
+	}
+
+	return 0;
+}
+
+static const struct avs_tplg_token_parser manifest_parsers[] = {
+	{
+		.token = AVS_TKN_MANIFEST_NAME_STRING,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
+		.offset = offsetof(struct avs_tplg, name),
+		.parse = parse_link_formatted_string,
+	},
+	{
+		.token = AVS_TKN_MANIFEST_VERSION_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg, version),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static int avs_manifest(struct snd_soc_component *comp, int index,
+			struct snd_soc_tplg_manifest *manifest)
+{
+	struct snd_soc_tplg_vendor_array *tuples = manifest->priv.array;
+	struct avs_soc_component *acomp = to_avs_soc_component(comp);
+	size_t remaining = le32_to_cpu(manifest->priv.size);
+	u32 offset;
+	int ret;
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_LIBRARIES_U32, &offset);
+	/* Manifest MUST begin with a header. */
+	if (!ret && !offset)
+		ret = -EINVAL;
+	if (ret) {
+		dev_err(comp->dev, "incorrect manifest format: %d\n", ret);
+		return ret;
+	}
+
+	/* Process header which precedes any of the dictionaries. */
+	ret = avs_parse_tokens(comp, acomp->tplg, manifest_parsers,
+			       ARRAY_SIZE(manifest_parsers), tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_AFMTS_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "audio formats lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Libraries dictionary. */
+	ret = avs_tplg_parse_libraries(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_MODCFGS_BASE_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "modcfgs_base lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Audio formats dictionary. */
+	ret = avs_tplg_parse_audio_formats(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_MODCFGS_EXT_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "modcfgs_ext lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Module configs-base dictionary. */
+	ret = avs_tplg_parse_modcfgs_base(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_PPLCFGS_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "pplcfgs lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Module configs-ext dictionary. */
+	ret = avs_tplg_parse_modcfgs_ext(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	ret = avs_tplg_vendor_array_lookup(tuples, remaining,
+					   AVS_TKN_MANIFEST_NUM_BINDINGS_U32, &offset);
+	if (ret) {
+		dev_err(comp->dev, "bindings lookup failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Pipeline configs dictionary. */
+	ret = avs_tplg_parse_pplcfgs(comp, tuples, offset);
+	if (ret < 0)
+		return ret;
+
+	remaining -= offset;
+	tuples = avs_tplg_vendor_array_at(tuples, offset);
+
+	/* Bindings dictionary. */
+	return avs_tplg_parse_bindings(comp, tuples, remaining);
+}
+
+static struct snd_soc_tplg_ops avs_tplg_ops = {
+	.dapm_route_load	= avs_route_load,
+	.widget_load		= avs_widget_load,
+	.dai_load		= avs_dai_load,
+	.link_load		= avs_link_load,
+	.manifest		= avs_manifest,
+};
+
+struct avs_tplg *avs_tplg_new(struct snd_soc_component *comp)
+{
+	struct avs_tplg *tplg;
+
+	tplg = devm_kzalloc(comp->card->dev, sizeof(*tplg), GFP_KERNEL);
+	if (!tplg)
+		return NULL;
+
+	tplg->comp = comp;
+	INIT_LIST_HEAD(&tplg->path_tmpl_list);
+
+	return tplg;
+}
+
+int avs_load_topology(struct snd_soc_component *comp, const char *filename)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = request_firmware(&fw, filename, comp->dev);
+	if (ret < 0) {
+		dev_err(comp->dev, "request topology \"%s\" failed: %d\n", filename, ret);
+		return ret;
+	}
+
+	ret = snd_soc_tplg_component_load(comp, &avs_tplg_ops, fw);
+	if (ret < 0)
+		dev_err(comp->dev, "load topology \"%s\" failed: %d\n", filename, ret);
+
+	release_firmware(fw);
+	return ret;
+}
+
+int avs_remove_topology(struct snd_soc_component *comp)
+{
+	snd_soc_tplg_component_remove(comp);
+
+	return 0;
+}
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 383931ab1d77..6058d868f802 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -187,4 +187,9 @@ struct avs_tplg_module {
 	struct list_head node;
 };
 
+struct avs_tplg *avs_tplg_new(struct snd_soc_component *comp);
+
+int avs_load_topology(struct snd_soc_component *comp, const char *filename);
+int avs_remove_topology(struct snd_soc_component *comp);
+
 #endif
-- 
2.25.1


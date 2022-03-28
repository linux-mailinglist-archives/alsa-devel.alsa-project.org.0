Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598644E9D46
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 19:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBE4718C7;
	Mon, 28 Mar 2022 19:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBE4718C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648487905;
	bh=onHat81phYIDEekYXC87+cH5rVIRRVEh9J+0swo5qjA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bus4fT9eyQWVEHYK5Ergi+Mkz2or3l44sLw0RiBp0Gk6I3iUh30PW06zJIQVdla2l
	 GfFVSPIjx9PfWwxdzGWipkQzTgGt5iOhIqX8T7AP1JnRzapa9G/dHAn0Wru5N7r3q1
	 d1al02qc/w7argLwd5eEV29Gv1AE0dv2KVUvBs1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCDEAF80529;
	Mon, 28 Mar 2022 19:16:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 279A7F80524; Mon, 28 Mar 2022 19:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE7DAF80516
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 19:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE7DAF80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X/FKdR8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648487780; x=1680023780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=onHat81phYIDEekYXC87+cH5rVIRRVEh9J+0swo5qjA=;
 b=X/FKdR8HEwqVW3ZXmRqVxdrRDd7Mm+Egu80/8muIOwjRuB/hAT5e4INQ
 2XBoJkJ7gjX8U0ldMMoMibLl2YczIwx8EnNBHd72FAgXLkRmu6bXvReBu
 /EacnabXaTwW8gg0Hwk6eZ3l/NSirFNMoJdpXXnSRSLdJLwQRyIc6HyGo
 asW+Y9zqO0M7skf3eKWldEeAtYXAI/LbON9qrmqGKBmZb8hQWRavNp13C
 GQ9XReedZpOF8qZoxE7LZlnzvlM1RRABZJtKfYB9KBDvpRZRN41bhlifQ
 9ZeQ4GJIHAdri6mqZ8nlnUKhW/v/49SAy3jro8SsaaPSefVETF4fMhwXE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="345494497"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="345494497"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="649141498"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga002.fm.intel.com with ESMTP; 28 Mar 2022 10:14:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 07/14] ASoC: Intel: avs: Add topology loading operations
Date: Mon, 28 Mar 2022 19:24:03 +0200
Message-Id: <20220328172410.761309-8-cezary.rojewski@intel.com>
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

AVS topology is split into two major parts: dictionaries - found within
ASoC topology manifest - and path templates.

Add custom handlers for a range of operations available in struct
snd_soc_tplg_ops to allow for actually loading the topology file.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig        |   1 +
 sound/soc/intel/avs/Makefile   |   3 +-
 sound/soc/intel/avs/avs.h      |   2 +
 sound/soc/intel/avs/topology.c | 246 ++++++++++++++++++++++++++++++---
 sound/soc/intel/avs/topology.h |   5 +
 5 files changed, 235 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index d025ca0c77fa..5da3ce1535af 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -214,6 +214,7 @@ config SND_SOC_INTEL_AVS
 	depends on PCI && ACPI
 	depends on COMMON_CLK
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
index 77bbaf292b01..dcdd3d92a158 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -258,4 +258,6 @@ struct avs_soc_component {
 #define to_avs_soc_component(comp) \
 	container_of(comp, struct avs_soc_component, base)
 
+extern const struct snd_soc_dai_ops avs_dai_fe_ops;
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 243ec27e7ec7..739669153f6d 100644
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
@@ -369,26 +372,6 @@ parse_audio_format_bitfield(struct snd_soc_component *comp, void *elem, void *ob
 	return 0;
 }
 
-static int parse_link_formatted_string(struct snd_soc_component *comp, void *elem,
-				       void *object, u32 offset)
-{
-	struct snd_soc_tplg_vendor_string_elem *tuple = elem;
-	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
-	char *val = (char *)((u8 *)object + offset);
-
-	/*
-	 * Dynamic naming - string formats, e.g.: ssp%d - supported only for
-	 * topologies describing single device e.g.: an I2S codec on SSP0.
-	 */
-	if (hweight_long(mach->link_mask) != 1)
-		return avs_parse_string_token(comp, elem, object, offset);
-
-	snprintf(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, tuple->string,
-		 __ffs(mach->link_mask));
-
-	return 0;
-}
-
 static int
 parse_dictionary_header(struct snd_soc_component *comp,
 			struct snd_soc_tplg_vendor_array *tuples,
@@ -945,7 +928,7 @@ static const struct avs_tplg_token_parser binding_parsers[] = {
 		.token = AVS_TKN_BINDING_TARGET_TPLG_NAME_STRING,
 		.type = SND_SOC_TPLG_TUPLE_TYPE_STRING,
 		.offset = offsetof(struct avs_tplg_binding, target_tplg_name),
-		.parse = parse_link_formatted_string,
+		.parse = avs_parse_string_token,
 	},
 	{
 		.token = AVS_TKN_BINDING_TARGET_PATH_TMPL_ID_U32,
@@ -1339,3 +1322,224 @@ avs_tplg_path_template_create(struct snd_soc_component *comp, struct avs_tplg *o
 
 	return template;
 }
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
+	if (!link->no_pcm) {
+		/* Stream control handled by IPCs. */
+		link->nonatomic = true;
+
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
+		.parse = avs_parse_string_token,
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
index 3067d63cfcf7..68e5f6312353 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -186,4 +186,9 @@ struct avs_tplg_module {
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


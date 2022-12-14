Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBA64C77D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 11:56:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 500F023BD;
	Wed, 14 Dec 2022 11:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 500F023BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671015373;
	bh=F2JkXPvPSM32Z5ITvXuQdYx1CrBn4FsylYTmHweDuPM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NfrLoTmZzeKOeXKF+Pc9+BZJBvUyMGZR6L6Lr4yS8GEPYR0Xgxf5YjoeDRemMEfyi
	 fD/eBzRH3movGcDmqNRQ/FlwOQdGkrwcYPcHCO5WTsX+3z/wfwuOawOAX/zrOWP22+
	 xZP14M7OiniEAKgtYguIG+pc6WAcNlgjMUv4uL5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D32BCF80535;
	Wed, 14 Dec 2022 11:54:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32F5DF8053A; Wed, 14 Dec 2022 11:54:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ED4DF80535
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 11:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED4DF80535
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UNjvp8kJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671015261; x=1702551261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2JkXPvPSM32Z5ITvXuQdYx1CrBn4FsylYTmHweDuPM=;
 b=UNjvp8kJ+ZjqkZcI96AxrylxYmig1xdutIIB/MzUBMiYObGMWok1cAjO
 bNiISZ5GsXU3TVwAs80EcGMJ5s6lEh/PheDvtmMRgs1KEaBaxt2DWlEU+
 ifn5XOnbB9o2tmBcKVETkM2uXyucK3XlX6IUbjYSQJE03C5OlwRjJzlpJ
 3gVSRW8dtuS48QeAkqvb1FmhZ63IyjXDv54CHFsD5y+RSNNpBr3dcZbWB
 PzRDUr0YkrHr5OoV7BtQ2aOJb7CnedSQjK1A3wMvqMfpdYOXYRVWaIHYX
 RgI0Y4ko0+2s/Fz3ixSZLwoNsu9liOiFoQk2l6Pn0dOqajx69O8AcuMZJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="318412917"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="318412917"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 02:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="679653326"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="679653326"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 14 Dec 2022 02:54:15 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/4] ASoC: Intel: avs: Parse control tuples
Date: Wed, 14 Dec 2022 19:54:59 +0100
Message-Id: <20221214185500.3896902-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214185500.3896902-1-amadeuszx.slawinski@linux.intel.com>
References: <20221214185500.3896902-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add callback to handle loading of kcontrol and linking it to active
widget. In order to link kcontrol to specific modules add additional
field to module data, as well as specify control id in kcontrol data.

Co-authored-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/uapi/sound/intel/avs/tokens.h |  4 ++
 sound/soc/intel/avs/control.c         | 10 ++++
 sound/soc/intel/avs/topology.c        | 76 +++++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h        |  3 ++
 4 files changed, 93 insertions(+)

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index 754f02b2f444..4ffe546aa409 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -108,6 +108,7 @@ enum avs_tplg_token {
 	AVS_TKN_MOD_CORE_ID_U8				= 1704,
 	AVS_TKN_MOD_PROC_DOMAIN_U8			= 1705,
 	AVS_TKN_MOD_MODCFG_EXT_ID_U32			= 1706,
+	AVS_TKN_MOD_KCONTROL_ID_U32			= 1707,
 
 	/* struct avs_tplg_path_template */
 	AVS_TKN_PATH_TMPL_ID_U32			= 1801,
@@ -121,6 +122,9 @@ enum avs_tplg_token {
 	AVS_TKN_PIN_FMT_INDEX_U32			= 2201,
 	AVS_TKN_PIN_FMT_IOBS_U32			= 2202,
 	AVS_TKN_PIN_FMT_AFMT_ID_U32			= 2203,
+
+	/* struct avs_tplg_kcontrol */
+	AVS_TKN_KCONTROL_ID_U32				= 2301,
 };
 
 #endif
diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index 92b3aad0baca..a8b14b784f8a 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -23,6 +23,16 @@ static struct avs_dev *avs_get_kcontrol_adev(struct snd_kcontrol *kcontrol)
 
 static struct avs_path_module *avs_get_kcontrol_module(struct avs_dev *adev, u32 id)
 {
+	struct avs_path *path;
+	struct avs_path_pipeline *ppl;
+	struct avs_path_module *mod;
+
+	list_for_each_entry(path, &adev->path_list, node)
+		list_for_each_entry(ppl, &path->ppl_list, node)
+			list_for_each_entry(mod, &ppl->mod_list, node)
+				if (mod->template->ctl_id && mod->template->ctl_id == id)
+					return mod;
+
 	return NULL;
 }
 
diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index e845eaf0a1e7..5fee7a8ec06a 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -13,6 +13,7 @@
 #include <sound/soc-topology.h>
 #include <uapi/sound/intel/avs/tokens.h>
 #include "avs.h"
+#include "control.h"
 #include "topology.h"
 
 /* Get pointer to vendor array at the specified offset. */
@@ -1070,6 +1071,12 @@ static const struct avs_tplg_token_parser module_parsers[] = {
 		.offset = offsetof(struct avs_tplg_module, cfg_ext),
 		.parse = avs_parse_modcfg_ext_ptr,
 	},
+	{
+		.token = AVS_TKN_MOD_KCONTROL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_tplg_module, ctl_id),
+		.parse = avs_parse_byte_token,
+	},
 };
 
 static struct avs_tplg_module *
@@ -1435,6 +1442,16 @@ static int avs_widget_load(struct snd_soc_component *comp, int index,
 	return 0;
 }
 
+static int avs_widget_ready(struct snd_soc_component *comp, int index,
+			    struct snd_soc_dapm_widget *w,
+			    struct snd_soc_tplg_dapm_widget *dw)
+{
+	struct avs_tplg_path_template *template = w->priv;
+
+	template->w = w;
+	return 0;
+}
+
 static int avs_dai_load(struct snd_soc_component *comp, int index,
 			struct snd_soc_dai_driver *dai_drv, struct snd_soc_tplg_pcm *pcm,
 			struct snd_soc_dai *dai)
@@ -1586,9 +1603,68 @@ static int avs_manifest(struct snd_soc_component *comp, int index,
 	return avs_tplg_parse_bindings(comp, tuples, remaining);
 }
 
+#define AVS_CONTROL_OPS_VOLUME	257
+
+static const struct snd_soc_tplg_kcontrol_ops avs_control_ops[] = {
+	{
+		.id = AVS_CONTROL_OPS_VOLUME,
+		.get = avs_control_volume_get,
+		.put = avs_control_volume_put,
+	},
+};
+
+static const struct avs_tplg_token_parser control_parsers[] = {
+	{
+		.token = AVS_TKN_KCONTROL_ID_U32,
+		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
+		.offset = offsetof(struct avs_control_data, id),
+		.parse = avs_parse_word_token,
+	},
+};
+
+static int
+avs_control_load(struct snd_soc_component *comp, int index, struct snd_kcontrol_new *ctmpl,
+		 struct snd_soc_tplg_ctl_hdr *hdr)
+{
+	struct snd_soc_tplg_vendor_array *tuples;
+	struct snd_soc_tplg_mixer_control *tmc;
+	struct avs_control_data *ctl_data;
+	struct soc_mixer_control *mc;
+	size_t block_size;
+	int ret;
+
+	switch (hdr->type) {
+	case SND_SOC_TPLG_TYPE_MIXER:
+		tmc = container_of(hdr, typeof(*tmc), hdr);
+		tuples = tmc->priv.array;
+		block_size = le32_to_cpu(tmc->priv.size);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ctl_data = devm_kzalloc(comp->card->dev, sizeof(*ctl_data), GFP_KERNEL);
+	if (!ctl_data)
+		return -ENOMEM;
+
+	ret = parse_dictionary_entries(comp, tuples, block_size, ctl_data, 1, sizeof(*ctl_data),
+				       AVS_TKN_KCONTROL_ID_U32, control_parsers,
+				       ARRAY_SIZE(control_parsers));
+	if (ret)
+		return ret;
+
+	mc = (struct soc_mixer_control *)ctmpl->private_value;
+	mc->dobj.private = ctl_data;
+	return 0;
+}
+
 static struct snd_soc_tplg_ops avs_tplg_ops = {
+	.io_ops			= avs_control_ops,
+	.io_ops_count		= ARRAY_SIZE(avs_control_ops),
+	.control_load		= avs_control_load,
 	.dapm_route_load	= avs_route_load,
 	.widget_load		= avs_widget_load,
+	.widget_ready		= avs_widget_ready,
 	.dai_load		= avs_dai_load,
 	.link_load		= avs_link_load,
 	.manifest		= avs_manifest,
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 68e5f6312353..6e1c8e9b2496 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -138,6 +138,8 @@ struct avs_tplg_path_template_id {
 struct avs_tplg_path_template {
 	u32 id;
 
+	struct snd_soc_dapm_widget *w;
+
 	struct list_head path_list;
 
 	struct avs_tplg *owner;
@@ -180,6 +182,7 @@ struct avs_tplg_module {
 	u8 core_id;
 	u8 domain;
 	struct avs_tplg_modcfg_ext *cfg_ext;
+	u32 ctl_id;
 
 	struct avs_tplg_pipeline *owner;
 	/* Pipeline modules management. */
-- 
2.25.1


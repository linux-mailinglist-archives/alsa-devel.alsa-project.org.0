Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FF054AD57
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 11:27:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1E317C9;
	Tue, 14 Jun 2022 11:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1E317C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655198875;
	bh=vUYP6YL4V1fTp4iSJfs6k3Q3/LHdkSF1j1gaIU3NO4E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W85x95g62XK6wAZSATDHuS/uNoKM3eUPMXIwGAw6FO0+6bUf688d1z+LGCRwTWFsF
	 nX2Jnvhl7vyR0khlPkFOrqj+RCMIvPnIkPyDZ+6IUGxbilO8w+5p8jIihf2DXRXxwT
	 XYWLbJkoKFq43rUhfMDs2UBpN8LoSiGGtJMrdNWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 653FBF80165;
	Tue, 14 Jun 2022 11:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5A8AF80139; Tue, 14 Jun 2022 11:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E725F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 11:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E725F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PuuG+eVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655198808; x=1686734808;
 h=from:to:cc:subject:date:message-id;
 bh=vUYP6YL4V1fTp4iSJfs6k3Q3/LHdkSF1j1gaIU3NO4E=;
 b=PuuG+eVo7QEaj2paAP60fcAsdz2WPX/xxXKrMKsTcDOtGIOO1cGBXymo
 CrTP3rH1hvrsCSFAqW0L0SjsnRnlJ22Pd2/1tyxPNsDGLxyLE4orvgLQL
 W6FgsVZplR/CLoatIyZ7E+f6IBO56ifT57/lw7FlQb/z1Ib4m5TS9RCj2
 ZbEHaJ0ZOzUo2eoE/jdBNHVKBQcCAHwda5SMqZTeoohPjaALr7rG8rVsE
 gVahHdK2XDU/K5RqlBBjRBxcq1MeEsaDtLHm/2w8ozbECgFVqk1DDsj1N
 o2IwsgU8hKLxDhoicqqqrB4zFSEuXR+XIHzdbm1qNVqZLI8E4gXqKf6PS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279602264"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="279602264"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 02:26:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="830310817"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 02:26:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: SOF: ipc4-topology: add SoundWire/ALH aggregation
 support
Date: Tue, 14 Jun 2022 17:26:30 +0800
Message-Id: <20220614092630.20144-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

Some SoundWire hardware topologies rely on different amplifiers or
capture devices connected on different links. These devices need to be
'aggregated', remain synchronized and be handled as a single logical
device.

In the IPC3 solution, the aggregation for amplifiers was handled by a
firmware 'demux' component. In the IPC4 solution, the demux component is
not needed, the gateway component can handle multiple ALH/DMA transfers
at the same time. This change makes the topology slightly more complicated
in that only one ALH DAI will be connected in the topology with the
gateway. The other DAIs that are part of the 'aggregated' dailink are not
shown in the DAPM graph as connected to the gateway, but they will however
be activated thanks to a feature in soc-dapm.c where events are forwarded
to all DAIs in the dailink (see soc_dapm_stream_event).

The topology also sets the same stream name for all widgets, dais and
dailinks, so a search for the stream name helps identify cases where
SoundWire/ALH aggregation is needed.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 68 ++++++++++++++++++++++++++++++++---
 sound/soc/sof/ipc4-topology.h | 11 ++++++
 2 files changed, 74 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index cb0f0823b8eb..3c949298e007 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -19,6 +19,8 @@
 #define SOF_IPC4_GAIN_PARAM_ID  0
 #define SOF_IPC4_TPLG_ABI_SIZE 6
 
+static DEFINE_IDA(alh_group_ida);
+
 static const struct sof_topology_token ipc4_sched_tokens[] = {
 	{SOF_TKN_SCHED_LP_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc4_pipeline, lp_mode)}
@@ -478,7 +480,9 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	switch (ipc4_copier->dai_type) {
 	case SOF_DAI_INTEL_ALH:
 	{
+		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 		struct sof_ipc4_alh_configuration_blob *blob;
+		struct snd_sof_widget *w;
 
 		blob = kzalloc(sizeof(*blob), GFP_KERNEL);
 		if (!blob) {
@@ -486,6 +490,14 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 			goto err;
 		}
 
+		list_for_each_entry(w, &sdev->widget_list, list) {
+			if (w->widget->sname &&
+			    strcmp(w->widget->sname, swidget->widget->sname))
+				continue;
+
+			blob->alh_cfg.count++;
+		}
+
 		ipc4_copier->copier_config = (uint32_t *)blob;
 		ipc4_copier->data.gtw_cfg.config_length = sizeof(*blob) >> 2;
 		break;
@@ -844,6 +856,17 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 		struct snd_sof_dai *dai = swidget->private;
 
 		ipc4_copier = dai->private;
+		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
+			struct sof_ipc4_alh_configuration_blob *blob;
+			unsigned int group_id;
+
+			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
+			if (blob->alh_cfg.count > 1) {
+				group_id = SOF_IPC4_NODE_INDEX(ipc4_copier->data.gtw_cfg.node_id) -
+					   ALH_MULTI_GTW_BASE;
+				ida_free(&alh_group_ida, group_id);
+			}
+		}
 	}
 
 	if (ipc4_copier) {
@@ -973,6 +996,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	struct sof_ipc4_copier_data *copier_data;
 	struct snd_pcm_hw_params *ref_params;
 	struct sof_ipc4_copier *ipc4_copier;
+	struct snd_sof_dai *dai;
 	struct snd_mask *fmt;
 	int out_sample_valid_bits;
 	size_t ref_audio_fmt_size;
@@ -1022,7 +1046,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	case snd_soc_dapm_dai_in:
 	case snd_soc_dapm_dai_out:
 	{
-		struct snd_sof_dai *dai = swidget->private;
+		dai = swidget->private;
 
 		ipc4_copier = (struct sof_ipc4_copier *)dai->private;
 		copier_data = &ipc4_copier->data;
@@ -1077,22 +1101,56 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		 */
 		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
 			struct sof_ipc4_alh_configuration_blob *blob;
+			struct sof_ipc4_copier_data *alh_data;
+			struct sof_ipc4_copier *alh_copier;
+			struct snd_sof_widget *w;
+			u32 ch_mask = 0;
 			u32 ch_map;
 			int i;
 
 			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
-			/* TODO: add aggregation mode support */
-			blob->alh_cfg.count = 1;
-			blob->alh_cfg.mapping[0].alh_id = copier_data->gtw_cfg.node_id;
+
 			blob->gw_attr.lp_buffer_alloc = 0;
 
 			/* Get channel_mask from ch_map */
 			ch_map = copier_data->base_config.audio_fmt.ch_map;
 			for (i = 0; ch_map; i++) {
 				if ((ch_map & 0xf) != 0xf)
-					blob->alh_cfg.mapping[0].channel_mask |= BIT(i);
+					ch_mask |= BIT(i);
 				ch_map >>= 4;
 			}
+
+			/*
+			 * Set each gtw_cfg.node_id to blob->alh_cfg.mapping[]
+			 * for all widgets with the same stream name
+			 */
+			i = 0;
+			list_for_each_entry(w, &sdev->widget_list, list) {
+				if (w->widget->sname &&
+				    strcmp(w->widget->sname, swidget->widget->sname))
+					continue;
+
+				dai = w->private;
+				alh_copier = (struct sof_ipc4_copier *)dai->private;
+				alh_data = &alh_copier->data;
+				blob->alh_cfg.mapping[i].alh_id = alh_data->gtw_cfg.node_id;
+				blob->alh_cfg.mapping[i].channel_mask = ch_mask;
+				i++;
+			}
+			if (blob->alh_cfg.count > 1) {
+				int group_id;
+
+				group_id = ida_alloc_max(&alh_group_ida, ALH_MULTI_GTW_COUNT,
+							 GFP_KERNEL);
+
+				if (group_id < 0)
+					return group_id;
+
+				/* add multi-gateway base */
+				group_id += ALH_MULTI_GTW_BASE;
+				copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
+				copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(group_id);
+			}
 		}
 	}
 	}
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 1a9c0627bae9..3bc2fe38c733 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -42,6 +42,17 @@
 
 #define ALH_MAX_NUMBER_OF_GTW   16
 
+/*
+ * The base of multi-gateways. Multi-gateways addressing starts from
+ * ALH_MULTI_GTW_BASE and there are ALH_MULTI_GTW_COUNT multi-sources
+ * and ALH_MULTI_GTW_COUNT multi-sinks available.
+ * Addressing is continuous from ALH_MULTI_GTW_BASE to
+ * ALH_MULTI_GTW_BASE + ALH_MULTI_GTW_COUNT - 1.
+ */
+#define ALH_MULTI_GTW_BASE	0x50
+/* A magic number from FW */
+#define ALH_MULTI_GTW_COUNT	8
+
 /**
  * struct sof_ipc4_pipeline - pipeline config data
  * @priority: Priority of this pipeline
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0115441FE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:34:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F4D20B6;
	Thu,  9 Jun 2022 05:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F4D20B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745647;
	bh=eJHHENmS81kLiFNJoJqQ+BQoOnqe8u5h7HAQnYJcADQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ji7mlLU1LYu6CU2WwixR11rPWf2eNcxLqjg6v/GQXaC4RxCDGwTfwQYRDvj86da/a
	 hwz7UQOP4OfO2/jZzzWap2tpzdqLKaRprYStxohG1D/Y9z8SSGhWJx8kNAoKMQcmH6
	 zwUh1djqct3lXsMB/mbxa+neU4r3EfwywisQoceQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2977CF805E5;
	Thu,  9 Jun 2022 05:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9014AF805C1; Thu,  9 Jun 2022 05:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3581F80559
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3581F80559
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Efywg4+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745245; x=1686281245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eJHHENmS81kLiFNJoJqQ+BQoOnqe8u5h7HAQnYJcADQ=;
 b=Efywg4+IeINGxyoDc66gAdjutConOHFqMaMD5PBWF/XOlj+AMo0HEgxl
 lVYL8vprIkf6KqwLk65iQNFY9C0o2PQhJ6jLBcSnmK9oKMmcrwHPERJv9
 YAx5PP5IRc+Pvkv0dlchP6RuZ5gbTh79w4o16UEpoZQK2xuaDR+N9Y2He
 oYHfNWkIqVrHnyk8AABMkB7l8I4v5w/yyx9GaMbcOL2ootd1UHlJZJEqT
 nHxt8rzfAzXZ+pPDRHe3EMt/xHp4vOAP6TW3HxYOWYpQeutn146zWe64i
 QQZ4de/ze2hRF7MbxhhICCMKvGcRbc74vVpCfjxi8f1ExtZJ8PineDOFg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219574"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219574"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260257"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:01 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 21/23] ASoC: SOF: ipc4-topology: Add support for SSP/DMIC DAI's
Date: Wed,  8 Jun 2022 20:26:41 -0700
Message-Id: <20220609032643.916882-22-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

The copier config for SSP and DMIC type DAI copiers needs to be parsed
and matched with the runtime hw_config from the NHLT table. Along with
this, also add the change to set the node_id for these copier types.

Co-developed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 148 ++++++++++++++++++++++++++++++++--
 sound/soc/sof/ipc4-topology.h |   6 ++
 2 files changed, 146 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 27ad48990383..9f055c187b72 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -9,6 +9,7 @@
 #include <uapi/sound/sof/tokens.h>
 #include <sound/pcm_params.h>
 #include <sound/sof/ext_manifest4.h>
+#include <sound/intel-nhlt.h>
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "ipc4-priv.h"
@@ -473,14 +474,30 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 		node_type, ipc4_copier->dai_type, ipc4_copier->dai_index);
 
 	ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_NODE_TYPE(node_type);
-	ipc4_copier->gtw_attr = kzalloc(sizeof(*ipc4_copier->gtw_attr), GFP_KERNEL);
-	if (!ipc4_copier->gtw_attr) {
-		ret = -ENOMEM;
-		goto err;
-	}
 
-	ipc4_copier->copier_config = (uint32_t *)ipc4_copier->gtw_attr;
-	ipc4_copier->data.gtw_cfg.config_length = sizeof(struct sof_ipc4_gtw_attributes) >> 2;
+	switch (ipc4_copier->dai_type) {
+	case SOF_DAI_INTEL_SSP:
+		/* set SSP DAI index as the node_id */
+		ipc4_copier->data.gtw_cfg.node_id |=
+			SOF_IPC4_NODE_INDEX_INTEL_SSP(ipc4_copier->dai_index);
+		break;
+	case SOF_DAI_INTEL_DMIC:
+		/* set DMIC DAI index as the node_id */
+		ipc4_copier->data.gtw_cfg.node_id |=
+			SOF_IPC4_NODE_INDEX_INTEL_DMIC(ipc4_copier->dai_index);
+		break;
+	default:
+		ipc4_copier->gtw_attr = kzalloc(sizeof(*ipc4_copier->gtw_attr), GFP_KERNEL);
+		if (!ipc4_copier->gtw_attr) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		ipc4_copier->copier_config = (uint32_t *)ipc4_copier->gtw_attr;
+		ipc4_copier->data.gtw_cfg.config_length =
+			sizeof(struct sof_ipc4_gtw_attributes) >> 2;
+		break;
+	}
 
 	dai->scomp = scomp;
 	dai->private = ipc4_copier;
@@ -516,7 +533,9 @@ static void sof_ipc4_widget_free_comp_dai(struct snd_sof_widget *swidget)
 	kfree(available_fmt->dma_buffer_size);
 	kfree(available_fmt->base_config);
 	kfree(available_fmt->out_audio_fmt);
-	kfree(ipc4_copier->copier_config);
+	if (ipc4_copier->dai_type != SOF_DAI_INTEL_SSP &&
+	    ipc4_copier->dai_type != SOF_DAI_INTEL_DMIC)
+		kfree(ipc4_copier->copier_config);
 	kfree(dai->private);
 	kfree(dai);
 	swidget->private = NULL;
@@ -822,6 +841,112 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 	ida_free(&fw_module->m_ida, swidget->instance_id);
 }
 
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
+static int snd_sof_get_hw_config_params(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
+					int *sample_rate, int *channel_count, int *bit_depth)
+{
+	struct snd_soc_tplg_hw_config *hw_config;
+	struct snd_sof_dai_link *slink;
+	bool dai_link_found = false;
+	bool hw_cfg_found = false;
+	int i;
+
+	/* get current hw_config from link */
+	list_for_each_entry(slink, &sdev->dai_link_list, list) {
+		if (!strcmp(slink->link->name, dai->name)) {
+			dai_link_found = true;
+			break;
+		}
+	}
+
+	if (!dai_link_found) {
+		dev_err(sdev->dev, "%s: no DAI link found for DAI %s\n", __func__, dai->name);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < slink->num_hw_configs; i++) {
+		hw_config = &slink->hw_configs[i];
+		if (dai->current_config == le32_to_cpu(hw_config->id)) {
+			hw_cfg_found = true;
+			break;
+		}
+	}
+
+	if (!hw_cfg_found) {
+		dev_err(sdev->dev, "%s: no matching hw_config found for DAI %s\n", __func__,
+			dai->name);
+		return -EINVAL;
+	}
+
+	*bit_depth = le32_to_cpu(hw_config->tdm_slot_width);
+	*channel_count = le32_to_cpu(hw_config->tdm_slots);
+	*sample_rate = le32_to_cpu(hw_config->fsync_rate);
+
+	dev_dbg(sdev->dev, "%s: sample rate: %d sample width: %d channels: %d\n",
+		__func__, *sample_rate, *bit_depth, *channel_count);
+
+	return 0;
+}
+
+static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
+					  struct snd_pcm_hw_params *params, u32 dai_index,
+					  u32 linktype, u8 dir, u32 **dst, u32 *len)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct nhlt_specific_cfg *cfg;
+	int sample_rate, channel_count;
+	int bit_depth, ret;
+	u32 nhlt_type;
+
+	/* convert to NHLT type */
+	switch (linktype) {
+	case SOF_DAI_INTEL_DMIC:
+		nhlt_type = NHLT_LINK_DMIC;
+		bit_depth = params_width(params);
+		channel_count = params_channels(params);
+		sample_rate = params_rate(params);
+		break;
+	case SOF_DAI_INTEL_SSP:
+		nhlt_type = NHLT_LINK_SSP;
+		ret = snd_sof_get_hw_config_params(sdev, dai, &sample_rate, &channel_count,
+						   &bit_depth);
+		if (ret < 0)
+			return ret;
+		break;
+	default:
+		return 0;
+	}
+
+	dev_dbg(sdev->dev, "%s: dai index %d nhlt type %d direction %d\n",
+		__func__, dai_index, nhlt_type, dir);
+
+	/* find NHLT blob with matching params */
+	cfg = intel_nhlt_get_endpoint_blob(sdev->dev, ipc4_data->nhlt, dai_index, nhlt_type,
+					   bit_depth, bit_depth, channel_count, sample_rate,
+					   dir, 0);
+
+	if (!cfg) {
+		dev_err(sdev->dev,
+			"no matching blob for sample rate: %d sample width: %d channels: %d\n",
+			sample_rate, bit_depth, channel_count);
+		return -EINVAL;
+	}
+
+	/* config length should be in dwords */
+	*len = cfg->size >> 2;
+	*dst = (u32 *)cfg->caps;
+
+	return 0;
+}
+#else
+static int snd_sof_get_nhlt_endpoint_data(struct snd_sof_dev *sdev, struct snd_sof_dai *dai,
+					  struct snd_pcm_hw_params *params, u32 dai_index,
+					  u32 linktype, u8 dir, u32 **dst, u32 *len)
+{
+	return 0;
+}
+#endif
+
 static int
 sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			       struct snd_pcm_hw_params *fe_params,
@@ -906,6 +1031,13 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 		ref_params = pipeline_params;
 
+		ret = snd_sof_get_nhlt_endpoint_data(sdev, dai, fe_params, ipc4_copier->dai_index,
+						     ipc4_copier->dai_type, dir,
+						     &ipc4_copier->copier_config,
+						     &copier_data->gtw_cfg.config_length);
+		if (ret < 0)
+			return ret;
+
 		break;
 	}
 	default:
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 0cadf04efa6a..64d836f05bad 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -31,6 +31,12 @@
 #define SOF_IPC4_NODE_INDEX(x)	((x) & SOF_IPC4_NODE_INDEX_MASK)
 #define SOF_IPC4_NODE_TYPE(x)  ((x) << 8)
 
+/* Node ID for SSP type DAI copiers */
+#define SOF_IPC4_NODE_INDEX_INTEL_SSP(x) (((x) & 0xf) << 4)
+
+/* Node ID for DMIC type DAI copiers */
+#define SOF_IPC4_NODE_INDEX_INTEL_DMIC(x) (((x) & 0x7) << 5)
+
 #define SOF_IPC4_GAIN_ALL_CHANNELS_MASK 0xffffffff
 #define SOF_IPC4_VOL_ZERO_DB	0x7fffffff
 
-- 
2.25.1


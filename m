Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 624AB544204
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD18D20E0;
	Thu,  9 Jun 2022 05:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD18D20E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745679;
	bh=dkZPhMWLGu+Pn6jHs6ylCsOZoNe7E1NbBnq3Isbfa5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hwc8GTpvdGraiD6nDaCDMzBohQ06SCBXzm4YnopmVTv+jLf6uh2v2UC1d6HR3odJG
	 QmEPfydqAQM8769m+wq9K4t68SWaUQUbaAoNYcMygLSY8nwleRZCfV87ML+ytT06pN
	 LYThhsOkyXDl3w4F7NMzC8fCkY9Ujp5rWwvuP3aM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E193F805EA;
	Thu,  9 Jun 2022 05:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AAAEF8055A; Thu,  9 Jun 2022 05:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89701F80568
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89701F80568
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VW6usQzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745246; x=1686281246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dkZPhMWLGu+Pn6jHs6ylCsOZoNe7E1NbBnq3Isbfa5E=;
 b=VW6usQzALQ2T69E6O1gNtSQvilIl9a7HuYo8mznF9n0dKJ3y92KTjCTg
 PJAQBywK8VgB4Znme5CQXSKJy+EOR/zZscW6O0eYgcYWtHmMYu5/d4EIm
 dbuCIXl72exPI0FYyuekrUGHd0U9u1PdZ3gmqICATyfubNPPgD5gY0mqy
 Y2RP8yyMd2ECzYU+9Db/xmb9h8h9HqR7btvWyfUUu1ESJEx40JPn9e/xd
 kAxObFwjiTiv4M87/WsKKRrMACPOK0bYdIPcl7AyDvuEE/TncVR9zlebe
 4Nicn893D6VdRv3pjJpX4KsAoy+GkfS0mRW8JJNxiKyrXbQ4Syt38tewN A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219577"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219577"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260263"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:01 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 23/23] ASoC: SOF: IPC4: add sdw blob
Date: Wed,  8 Jun 2022 20:26:43 -0700
Message-Id: <20220609032643.916882-24-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Add IPC4 SoundWire blob. It includes a common IPC4 gateway and a multiple
ALH configuration struct which is used for storing the aggregated
SoundWire stream information.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 44 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.h | 25 ++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index d5cb08ec1af1..cb0f0823b8eb 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -476,6 +476,20 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_NODE_TYPE(node_type);
 
 	switch (ipc4_copier->dai_type) {
+	case SOF_DAI_INTEL_ALH:
+	{
+		struct sof_ipc4_alh_configuration_blob *blob;
+
+		blob = kzalloc(sizeof(*blob), GFP_KERNEL);
+		if (!blob) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		ipc4_copier->copier_config = (uint32_t *)blob;
+		ipc4_copier->data.gtw_cfg.config_length = sizeof(*blob) >> 2;
+		break;
+	}
 	case SOF_DAI_INTEL_SSP:
 		/* set SSP DAI index as the node_id */
 		ipc4_copier->data.gtw_cfg.node_id |=
@@ -1053,6 +1067,36 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	if (ret < 0)
 		return ret;
 
+	switch (swidget->id) {
+	case snd_soc_dapm_dai_in:
+	case snd_soc_dapm_dai_out:
+	{
+		/*
+		 * Only SOF_DAI_INTEL_ALH needs copier_data to set blob.
+		 * That's why only ALH dai's blob is set after sof_ipc4_init_audio_fmt
+		 */
+		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
+			struct sof_ipc4_alh_configuration_blob *blob;
+			u32 ch_map;
+			int i;
+
+			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
+			/* TODO: add aggregation mode support */
+			blob->alh_cfg.count = 1;
+			blob->alh_cfg.mapping[0].alh_id = copier_data->gtw_cfg.node_id;
+			blob->gw_attr.lp_buffer_alloc = 0;
+
+			/* Get channel_mask from ch_map */
+			ch_map = copier_data->base_config.audio_fmt.ch_map;
+			for (i = 0; ch_map; i++) {
+				if ((ch_map & 0xf) != 0xf)
+					blob->alh_cfg.mapping[0].channel_mask |= BIT(i);
+				ch_map >>= 4;
+			}
+		}
+	}
+	}
+
 	/* modify the input params for the next widget */
 	fmt = hw_param_mask(pipeline_params, SNDRV_PCM_HW_PARAM_FORMAT);
 	out_sample_valid_bits =
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 64d836f05bad..1a9c0627bae9 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -40,6 +40,8 @@
 #define SOF_IPC4_GAIN_ALL_CHANNELS_MASK 0xffffffff
 #define SOF_IPC4_VOL_ZERO_DB	0x7fffffff
 
+#define ALH_MAX_NUMBER_OF_GTW   16
+
 /**
  * struct sof_ipc4_pipeline - pipeline config data
  * @priority: Priority of this pipeline
@@ -112,6 +114,29 @@ struct sof_ipc4_gtw_attributes {
 	uint32_t rsvd : 30;
 };
 
+/** struct sof_ipc4_alh_multi_gtw_cfg: ALH gateway cfg data
+ * @count: Number of streams (valid items in mapping array)
+ * @alh_id: ALH stream id of a single ALH stream aggregated
+ * @channel_mask: Channel mask
+ * @mapping: ALH streams
+ */
+struct sof_ipc4_alh_multi_gtw_cfg {
+	uint32_t count;
+	struct {
+		uint32_t alh_id;
+		uint32_t channel_mask;
+	} mapping[ALH_MAX_NUMBER_OF_GTW];
+} __packed;
+
+/** struct sof_ipc4_alh_configuration_blob: ALH blob
+ * @gw_attr: Gateway attributes
+ * @alh_cfg: ALH configuration data
+ */
+struct sof_ipc4_alh_configuration_blob {
+	struct sof_ipc4_gtw_attributes gw_attr;
+	struct sof_ipc4_alh_multi_gtw_cfg alh_cfg;
+};
+
 /**
  * struct sof_ipc4_copier - copier config data
  * @data: IPC copier data
-- 
2.25.1


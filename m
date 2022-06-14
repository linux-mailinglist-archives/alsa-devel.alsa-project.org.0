Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7C54AB31
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 09:53:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3434E16C9;
	Tue, 14 Jun 2022 09:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3434E16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655193209;
	bh=T67UtWvDyGthp1796tRKZiHBAeBbfVZryhAs1qnzMbg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z6bvhmUsU3sQlEZzRt6PcNtN4zKReieVCGSnlTr07gmsD/MC2I5pP9Z1xSw88NVz6
	 unj+wJuodBjIGv7kjLk7ZUan9eWER9XumkEFo1qWs3IpU6PZ8ht71ogymOzRxa+lWc
	 gMjvfVNu3HfWr2QsGOhX8gl3ZoErJjhHCtzRufZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1D9FF800D8;
	Tue, 14 Jun 2022 09:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CEB4F800D8; Tue, 14 Jun 2022 09:52:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC97EF800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 09:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC97EF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DaC1T0mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655193142; x=1686729142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T67UtWvDyGthp1796tRKZiHBAeBbfVZryhAs1qnzMbg=;
 b=DaC1T0mNZxuKN6CTWJqj9Z9r8XK+P5Bj2SF8AmdZ3W8CgfTSvbfaJW7D
 sb12xYsMRZqXMszB5dCw2ARd8DmTjY+4pyB9z74Kfpc43RGQzW2Lvu8w+
 lPzHv0gtsFLLqM/9qmgfKyzRNRnHMljo6G9kfCLzm+U4a7deAqSBsS3sU
 NelYz1nLrH7x2yH/42HSvysmJKS3qIrqHdQCIxhxGCjh/wJpGUnwvYZbW
 9+lsx0G2O2I7UzLFKDL3VcobD6iyufSBuGXVH894xg4Kq4w8JB9wp2CTs
 /XmuLkRaurerdB+M39U6yieksn8ER31229N+eBa0JrqKfPHgfXqMAoTtu g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="261574555"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="261574555"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:52:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="673745301"
Received: from gkuik-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.239])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:52:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, AjitKumar.Pandey@amd.com
Subject: [PATCH] ASoC: SOF: topology: add code to parse config params for
 ACPDMIC dai
Date: Tue, 14 Jun 2022 10:52:51 +0300
Message-Id: <20220614075251.21499-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

Add sof_ipc_dai_acpdmic_params and tokens to parse dmic channels and
rate params from topology file

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/dai-amd.h     |  7 +++++++
 include/sound/sof/dai.h         |  2 +-
 include/uapi/sound/sof/tokens.h |  4 ++++
 sound/soc/sof/ipc3-pcm.c        |  8 ++++----
 sound/soc/sof/ipc3-topology.c   | 25 +++++++++++++++++++------
 sound/soc/sof/sof-audio.h       |  1 +
 sound/soc/sof/topology.c        |  4 ++++
 7 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/include/sound/sof/dai-amd.h b/include/sound/sof/dai-amd.h
index 90d09dbdd709..92f45c180b7c 100644
--- a/include/sound/sof/dai-amd.h
+++ b/include/sound/sof/dai-amd.h
@@ -18,4 +18,11 @@ struct sof_ipc_dai_acp_params {
 	uint32_t fsync_rate;    /* FSYNC frequency in Hz */
 	uint32_t tdm_slots;
 } __packed;
+
+/* ACPDMIC Configuration Request - SOF_IPC_DAI_AMD_CONFIG */
+struct sof_ipc_dai_acpdmic_params {
+	uint32_t pdm_rate;
+	uint32_t pdm_ch;
+} __packed;
+
 #endif
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index a818a0f0a226..21d98f31a9ca 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -111,7 +111,7 @@ struct sof_ipc_dai_config {
 		struct sof_ipc_dai_sai_params sai;
 		struct sof_ipc_dai_acp_params acpbt;
 		struct sof_ipc_dai_acp_params acpsp;
-		struct sof_ipc_dai_acp_params acpdmic;
+		struct sof_ipc_dai_acpdmic_params acpdmic;
 		struct sof_ipc_dai_mtk_afe_params afe;
 	};
 } __packed;
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index f7b2019065ad..5caf75cadaf8 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -157,6 +157,10 @@
 /* MIXER */
 #define SOF_TKN_MIXER_TYPE			1700
 
+/* ACPDMIC */
+#define SOF_TKN_AMD_ACPDMIC_RATE		1800
+#define SOF_TKN_AMD_ACPDMIC_CH			1801
+
 /* CAVS AUDIO FORMAT */
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_RATE	1900
 #define SOF_TKN_CAVS_AUDIO_FORMAT_IN_BIT_DEPTH	1901
diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index c8774a891d6f..b97e63d3724a 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -344,10 +344,10 @@ static int sof_ipc3_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 			channels->min, channels->max);
 		break;
 	case SOF_DAI_AMD_DMIC:
-		rate->min = private->dai_config->acpdmic.fsync_rate;
-		rate->max = private->dai_config->acpdmic.fsync_rate;
-		channels->min = private->dai_config->acpdmic.tdm_slots;
-		channels->max = private->dai_config->acpdmic.tdm_slots;
+		rate->min = private->dai_config->acpdmic.pdm_rate;
+		rate->max = private->dai_config->acpdmic.pdm_rate;
+		channels->min = private->dai_config->acpdmic.pdm_ch;
+		channels->max = private->dai_config->acpdmic.pdm_ch;
 
 		dev_dbg(component->dev,
 			"AMD_DMIC rate_min: %d rate_max: %d\n", rate->min, rate->max);
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index d20e71be8b8e..28d3c1414572 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -266,6 +266,16 @@ static const struct sof_topology_token afe_tokens[] = {
 		offsetof(struct sof_ipc_dai_mtk_afe_params, format)},
 };
 
+/* ACPDMIC */
+static const struct sof_topology_token acpdmic_tokens[] = {
+	{SOF_TKN_AMD_ACPDMIC_RATE,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_acpdmic_params, pdm_rate)},
+	{SOF_TKN_AMD_ACPDMIC_CH,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_acpdmic_params, pdm_ch)},
+};
+
 /* Core tokens */
 static const struct sof_topology_token core_tokens[] = {
 	{SOF_TKN_COMP_CORE_ID, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -300,6 +310,7 @@ static const struct sof_token_info ipc3_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_ESAI_TOKENS] = {"ESAI tokens", esai_tokens, ARRAY_SIZE(esai_tokens)},
 	[SOF_SAI_TOKENS] = {"SAI tokens", sai_tokens, ARRAY_SIZE(sai_tokens)},
 	[SOF_AFE_TOKENS] = {"AFE tokens", afe_tokens, ARRAY_SIZE(afe_tokens)},
+	[SOF_ACPDMIC_TOKENS] = {"ACPDMIC tokens", acpdmic_tokens, ARRAY_SIZE(acpdmic_tokens)},
 };
 
 /**
@@ -1120,20 +1131,22 @@ static int sof_link_acp_dmic_load(struct snd_soc_component *scomp, struct snd_so
 	struct snd_soc_tplg_hw_config *hw_config = slink->hw_configs;
 	struct sof_dai_private_data *private = dai->private;
 	u32 size = sizeof(*config);
+	int ret;
 
        /* handle master/slave and inverted clocks */
 	sof_dai_set_format(hw_config, config);
 
-	/* init IPC */
-	memset(&config->acpdmic, 0, sizeof(config->acpdmic));
 	config->hdr.size = size;
 
-	config->acpdmic.fsync_rate = le32_to_cpu(hw_config->fsync_rate);
-	config->acpdmic.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
+	/* parse the required set of ACPDMIC tokens based on num_hw_cfgs */
+	ret = sof_update_ipc_object(scomp, &config->acpdmic, SOF_ACPDMIC_TOKENS, slink->tuples,
+				    slink->num_tuples, size, slink->num_hw_configs);
+	if (ret < 0)
+		return ret;
 
 	dev_info(scomp->dev, "ACP_DMIC config ACP%d channel %d rate %d\n",
-		 config->dai_index, config->acpdmic.tdm_slots,
-		 config->acpdmic.fsync_rate);
+		 config->dai_index, config->acpdmic.pdm_ch,
+		 config->acpdmic.pdm_rate);
 
 	dai->number_configs = 1;
 	dai->current_config = 0;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 79486266081f..4284ea2f3a1f 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -236,6 +236,7 @@ enum sof_tokens {
 	SOF_AUDIO_FMT_NUM_TOKENS,
 	SOF_COPIER_FORMAT_TOKENS,
 	SOF_GAIN_TOKENS,
+	SOF_ACPDMIC_TOKENS,
 
 	/* this should be the last */
 	SOF_TOKEN_COUNT,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 1893c590f2f0..7e54eb1bf77b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1739,6 +1739,10 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 		token_id = SOF_AFE_TOKENS;
 		num_tuples += token_list[SOF_AFE_TOKENS].count;
 		break;
+	case SOF_DAI_AMD_DMIC:
+		token_id = SOF_ACPDMIC_TOKENS;
+		num_tuples += token_list[SOF_ACPDMIC_TOKENS].count;
+		break;
 	default:
 		break;
 	}
-- 
2.36.1


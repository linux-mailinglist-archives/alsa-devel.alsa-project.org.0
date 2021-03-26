Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E834ACF3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 17:57:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3EB0167D;
	Fri, 26 Mar 2021 17:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3EB0167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616777855;
	bh=lJZkuQgYEB4banDQovQBHxw1PywmgdzQNTlup1KK4Xc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p8/i0E8DKMmLry2vaZ+egSIjsLdrppJN6FPvjDCYIeGAzH8mh/10HatpUyribi0p2
	 tAIr5Q/OzLhSyUlRRZUHisc3XSIqQnbOb8zvpXtI0a5n5aXkVkSvIxCjxFuLIXibny
	 Ymleb/NkuSORPflk0vRDwZQfE+ZK8cvYg3wYkuvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60CEBF801D5;
	Fri, 26 Mar 2021 17:56:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 046E0F801D5; Fri, 26 Mar 2021 17:56:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9795F80103
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 17:55:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9795F80103
IronPort-SDR: S7T7qSQXUdCVAvW4ytDI2wAE73XHYTOmSpDRSThiSNFeUHT14ytUcYFfoY7o0dpa42xT8FpyYM
 n2jDts6y/OmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="255177078"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="255177078"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 09:55:54 -0700
IronPort-SDR: dPXccel84wx/avAuOrM6kFuYhIW0mEFHEhV01Pvzh9oCeDfReGKdFb3mfT0AsXKLetbb/ee2wG
 66PC58bHvM0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="409978149"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 26 Mar 2021 09:55:51 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: SOF: parse multiple SSP DAI and hw configs
Date: Fri, 26 Mar 2021 18:51:48 +0200
Message-Id: <20210326165150.255533-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

ASoC parses multiple hw_configs defined in topology. However currently
in SOF only the first config is used and others are discarded. First
change SOF driver to parse and save possible multiple configs in ssp
case. Also save the default config value provided by ASoC. Functionality
with only one defined config stays the same.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/pcm.c       |   8 +-
 sound/soc/sof/sof-audio.h |   2 +
 sound/soc/sof/topology.c  | 190 ++++++++++++++++++++++----------------
 3 files changed, 116 insertions(+), 84 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 61c3fe17342d..c3dc533f2627 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -673,10 +673,10 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	/* read rate and channels from topology */
 	switch (dai->dai_config->type) {
 	case SOF_DAI_INTEL_SSP:
-		rate->min = dai->dai_config->ssp.fsync_rate;
-		rate->max = dai->dai_config->ssp.fsync_rate;
-		channels->min = dai->dai_config->ssp.tdm_slots;
-		channels->max = dai->dai_config->ssp.tdm_slots;
+		rate->min = dai->dai_config[dai->current_config].ssp.fsync_rate;
+		rate->max = dai->dai_config[dai->current_config].ssp.fsync_rate;
+		channels->min = dai->dai_config[dai->current_config].ssp.tdm_slots;
+		channels->max = dai->dai_config[dai->current_config].ssp.tdm_slots;
 
 		dev_dbg(component->dev,
 			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index dc930fc2f4b5..dc274e63ed9a 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -112,6 +112,8 @@ struct snd_sof_dai {
 	const char *cpu_dai_name;
 
 	struct sof_ipc_comp_dai comp_dai;
+	int number_configs;
+	int current_config;
 	struct sof_ipc_dai_config *dai_config;
 	struct list_head list;	/* list in sdev dai list */
 };
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 10f99620eb31..036202768b75 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2811,12 +2811,14 @@ static void sof_dai_set_format(struct snd_soc_tplg_hw_config *hw_config,
  * name. Note that the function can only be used for the case that all DAIs
  * have a common DAI config for now.
  */
-static int sof_set_dai_config(struct snd_sof_dev *sdev, u32 size,
-			      struct snd_soc_dai_link *link,
-			      struct sof_ipc_dai_config *config)
+static int sof_set_dai_config_multi(struct snd_sof_dev *sdev, u32 size,
+				    struct snd_soc_dai_link *link,
+				    struct sof_ipc_dai_config *config,
+				    int num_conf, int curr_conf)
 {
 	struct snd_sof_dai *dai;
 	int found = 0;
+	int i;
 
 	list_for_each_entry(dai, &sdev->dai_list, list) {
 		if (!dai->name)
@@ -2832,19 +2834,27 @@ static int sof_set_dai_config(struct snd_sof_dev *sdev, u32 size,
 			 * dai config's dai_index match to the component's
 			 * dai_index.
 			 */
-			config->dai_index = dai->comp_dai.dai_index;
+			for (i = 0; i < num_conf; i++)
+				config[i].dai_index = dai->comp_dai.dai_index;
 
+			dev_dbg(sdev->dev, "set DAI config for %s index %d\n",
+				dai->name, config[curr_conf].dai_index);
 			/* send message to DSP */
 			ret = sof_ipc_tx_message(sdev->ipc,
-						 config->hdr.cmd, config, size,
+						 config[curr_conf].hdr.cmd,
+						 &config[curr_conf], size,
 						 &reply, sizeof(reply));
 
 			if (ret < 0) {
-				dev_err(sdev->dev, "error: failed to set DAI config for %s index %d\n",
-					dai->name, config->dai_index);
+				dev_err(sdev->dev,
+					"error: failed to set DAI config for %s index %d\n",
+					dai->name, config[curr_conf].dai_index);
 				return ret;
 			}
-			dai->dai_config = kmemdup(config, size, GFP_KERNEL);
+
+			dai->number_configs = num_conf;
+			dai->current_config = curr_conf;
+			dai->dai_config = kmemdup(config, size * num_conf, GFP_KERNEL);
 			if (!dai->dai_config)
 				return -ENOMEM;
 
@@ -2868,64 +2878,81 @@ static int sof_set_dai_config(struct snd_sof_dev *sdev, u32 size,
 	return 0;
 }
 
+static int sof_set_dai_config(struct snd_sof_dev *sdev, u32 size,
+			      struct snd_soc_dai_link *link,
+			      struct sof_ipc_dai_config *config)
+{
+	return sof_set_dai_config_multi(sdev, size, link, config, 1, 0);
+}
+
 static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 			     struct snd_soc_dai_link *link,
 			     struct snd_soc_tplg_link_config *cfg,
 			     struct snd_soc_tplg_hw_config *hw_config,
-			     struct sof_ipc_dai_config *config)
+			     struct sof_ipc_dai_config *config, int curr_conf)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &cfg->priv;
+	int num_conf = le32_to_cpu(cfg->num_hw_configs);
 	u32 size = sizeof(*config);
 	int ret;
+	int i;
 
-	/* handle master/slave and inverted clocks */
-	sof_dai_set_format(hw_config, config);
-
-	/* init IPC */
-	memset(&config->ssp, 0, sizeof(struct sof_ipc_dai_ssp_params));
-	config->hdr.size = size;
+	/*
+	 * Parse common data, we should have 1 common data per hw_config.
+	 */
+	ret = sof_parse_token_sets(scomp, &config->ssp, ssp_tokens,
+				   ARRAY_SIZE(ssp_tokens), private->array,
+				   le32_to_cpu(private->size),
+				   num_conf, size);
 
-	ret = sof_parse_tokens(scomp, &config->ssp, ssp_tokens,
-			       ARRAY_SIZE(ssp_tokens), private->array,
-			       le32_to_cpu(private->size));
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse ssp tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
 
-	config->ssp.mclk_rate = le32_to_cpu(hw_config->mclk_rate);
-	config->ssp.bclk_rate = le32_to_cpu(hw_config->bclk_rate);
-	config->ssp.fsync_rate = le32_to_cpu(hw_config->fsync_rate);
-	config->ssp.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
-	config->ssp.tdm_slot_width = le32_to_cpu(hw_config->tdm_slot_width);
-	config->ssp.mclk_direction = hw_config->mclk_direction;
-	config->ssp.rx_slots = le32_to_cpu(hw_config->rx_slots);
-	config->ssp.tx_slots = le32_to_cpu(hw_config->tx_slots);
+	/* process all possible hw configs */
+	for (i = 0; i < num_conf; i++) {
 
-	dev_dbg(scomp->dev, "tplg: config SSP%d fmt 0x%x mclk %d bclk %d fclk %d width (%d)%d slots %d mclk id %d quirks %d\n",
-		config->dai_index, config->format,
-		config->ssp.mclk_rate, config->ssp.bclk_rate,
-		config->ssp.fsync_rate, config->ssp.sample_valid_bits,
-		config->ssp.tdm_slot_width, config->ssp.tdm_slots,
-		config->ssp.mclk_id, config->ssp.quirks);
-
-	/* validate SSP fsync rate and channel count */
-	if (config->ssp.fsync_rate < 8000 || config->ssp.fsync_rate > 192000) {
-		dev_err(scomp->dev, "error: invalid fsync rate for SSP%d\n",
-			config->dai_index);
-		return -EINVAL;
-	}
+		/* handle master/slave and inverted clocks */
+		sof_dai_set_format(&hw_config[i], &config[i]);
 
-	if (config->ssp.tdm_slots < 1 || config->ssp.tdm_slots > 8) {
-		dev_err(scomp->dev, "error: invalid channel count for SSP%d\n",
-			config->dai_index);
-		return -EINVAL;
+		config[i].hdr.size = size;
+
+		/* copy differentiating hw configs to ipc structs */
+		config[i].ssp.mclk_rate = le32_to_cpu(hw_config[i].mclk_rate);
+		config[i].ssp.bclk_rate = le32_to_cpu(hw_config[i].bclk_rate);
+		config[i].ssp.fsync_rate = le32_to_cpu(hw_config[i].fsync_rate);
+		config[i].ssp.tdm_slots = le32_to_cpu(hw_config[i].tdm_slots);
+		config[i].ssp.tdm_slot_width = le32_to_cpu(hw_config[i].tdm_slot_width);
+		config[i].ssp.mclk_direction = hw_config[i].mclk_direction;
+		config[i].ssp.rx_slots = le32_to_cpu(hw_config[i].rx_slots);
+		config[i].ssp.tx_slots = le32_to_cpu(hw_config[i].tx_slots);
+
+		dev_dbg(scomp->dev, "tplg: config SSP%d fmt 0x%x mclk %d bclk %d fclk %d width (%d)%d slots %d mclk id %d quirks %d\n",
+			config[i].dai_index, config[i].format,
+			config[i].ssp.mclk_rate, config[i].ssp.bclk_rate,
+			config[i].ssp.fsync_rate, config[i].ssp.sample_valid_bits,
+			config[i].ssp.tdm_slot_width, config[i].ssp.tdm_slots,
+			config[i].ssp.mclk_id, config[i].ssp.quirks);
+
+		/* validate SSP fsync rate and channel count */
+		if (config[i].ssp.fsync_rate < 8000 || config[i].ssp.fsync_rate > 192000) {
+			dev_err(scomp->dev, "error: invalid fsync rate for SSP%d\n",
+				config[i].dai_index);
+			return -EINVAL;
+		}
+
+		if (config[i].ssp.tdm_slots < 1 || config[i].ssp.tdm_slots > 8) {
+			dev_err(scomp->dev, "error: invalid channel count for SSP%d\n",
+				config[i].dai_index);
+			return -EINVAL;
+		}
 	}
 
 	/* set config for all DAI's with name matching the link name */
-	ret = sof_set_dai_config(sdev, size, link, config);
+	ret = sof_set_dai_config_multi(sdev, size, link, config, num_conf, curr_conf);
 	if (ret < 0)
 		dev_err(scomp->dev, "error: failed to save DAI config for SSP%d\n",
 			config->dai_index);
@@ -3216,11 +3243,13 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 			 struct snd_soc_tplg_link_config *cfg)
 {
 	struct snd_soc_tplg_private *private = &cfg->priv;
-	struct sof_ipc_dai_config config;
 	struct snd_soc_tplg_hw_config *hw_config;
-	int num_hw_configs;
+	struct sof_ipc_dai_config common_config;
+	struct sof_ipc_dai_config *config;
+	int curr_conf;
+	int num_conf;
 	int ret;
-	int i = 0;
+	int i;
 
 	if (!link->platforms) {
 		dev_err(scomp->dev, "error: no platforms\n");
@@ -3257,13 +3286,11 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 		return -EINVAL;
 	}
 
-	/* Send BE DAI link configurations to DSP */
-	memset(&config, 0, sizeof(config));
+	memset(&common_config, 0, sizeof(common_config));
 
 	/* get any common DAI tokens */
-	ret = sof_parse_tokens(scomp, &config, dai_link_tokens,
-			       ARRAY_SIZE(dai_link_tokens), private->array,
-			       le32_to_cpu(private->size));
+	ret = sof_parse_tokens(scomp, &common_config, dai_link_tokens, ARRAY_SIZE(dai_link_tokens),
+			       private->array, le32_to_cpu(private->size));
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse link tokens failed %d\n",
 			le32_to_cpu(private->size));
@@ -3274,71 +3301,74 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	 * DAI links are expected to have at least 1 hw_config.
 	 * But some older topologies might have no hw_config for HDA dai links.
 	 */
-	num_hw_configs = le32_to_cpu(cfg->num_hw_configs);
-	if (!num_hw_configs) {
-		if (config.type != SOF_DAI_INTEL_HDA) {
+	hw_config = cfg->hw_config;
+	num_conf = le32_to_cpu(cfg->num_hw_configs);
+	if (!num_conf) {
+		if (common_config.type != SOF_DAI_INTEL_HDA) {
 			dev_err(scomp->dev, "error: unexpected DAI config count %d!\n",
 				le32_to_cpu(cfg->num_hw_configs));
 			return -EINVAL;
 		}
+		num_conf = 1;
+		curr_conf = 0;
 	} else {
 		dev_dbg(scomp->dev, "tplg: %d hw_configs found, default id: %d!\n",
 			cfg->num_hw_configs, le32_to_cpu(cfg->default_hw_config_id));
 
-		for (i = 0; i < num_hw_configs; i++) {
-			if (cfg->hw_config[i].id == cfg->default_hw_config_id)
+		for (curr_conf = 0; curr_conf < num_conf; curr_conf++) {
+			if (hw_config[curr_conf].id == cfg->default_hw_config_id)
 				break;
 		}
 
-		if (i == num_hw_configs) {
+		if (curr_conf == num_conf) {
 			dev_err(scomp->dev, "error: default hw_config id: %d not found!\n",
 				le32_to_cpu(cfg->default_hw_config_id));
 			return -EINVAL;
 		}
 	}
 
-	/* configure dai IPC message */
-	hw_config = &cfg->hw_config[i];
+	/* Reserve memory for all hw configs, eventually freed by widget */
+	config = kcalloc(num_conf, sizeof(*config), GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
 
-	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
-	config.format = le32_to_cpu(hw_config->fmt);
+	/* Copy common data to all config ipc structs */
+	for (i = 0; i < num_conf; i++) {
+		config[i].hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
+		config[i].format = hw_config[i].fmt;
+		config[i].type = common_config.type;
+		config[i].dai_index = common_config.dai_index;
+	}
 
 	/* now load DAI specific data and send IPC - type comes from token */
-	switch (config.type) {
+	switch (common_config.type) {
 	case SOF_DAI_INTEL_SSP:
-		ret = sof_link_ssp_load(scomp, index, link, cfg, hw_config,
-					&config);
+		ret = sof_link_ssp_load(scomp, index, link, cfg, hw_config, config, curr_conf);
 		break;
 	case SOF_DAI_INTEL_DMIC:
-		ret = sof_link_dmic_load(scomp, index, link, cfg, hw_config,
-					 &config);
+		ret = sof_link_dmic_load(scomp, index, link, cfg, hw_config + curr_conf, config);
 		break;
 	case SOF_DAI_INTEL_HDA:
-		ret = sof_link_hda_load(scomp, index, link, cfg, hw_config,
-					&config);
+		ret = sof_link_hda_load(scomp, index, link, cfg, hw_config + curr_conf, config);
 		break;
 	case SOF_DAI_INTEL_ALH:
-		ret = sof_link_alh_load(scomp, index, link, cfg, hw_config,
-					&config);
+		ret = sof_link_alh_load(scomp, index, link, cfg, hw_config + curr_conf, config);
 		break;
 	case SOF_DAI_IMX_SAI:
-		ret = sof_link_sai_load(scomp, index, link, cfg, hw_config,
-					&config);
+		ret = sof_link_sai_load(scomp, index, link, cfg, hw_config + curr_conf, config);
 		break;
 	case SOF_DAI_IMX_ESAI:
-		ret = sof_link_esai_load(scomp, index, link, cfg, hw_config,
-					 &config);
+		ret = sof_link_esai_load(scomp, index, link, cfg, hw_config + curr_conf, config);
 		break;
 	default:
-		dev_err(scomp->dev, "error: invalid DAI type %d\n",
-			config.type);
+		dev_err(scomp->dev, "error: invalid DAI type %d\n", common_config.type);
 		ret = -EINVAL;
 		break;
 	}
-	if (ret < 0)
-		return ret;
 
-	return 0;
+	kfree(config);
+
+	return ret;
 }
 
 static int sof_link_hda_unload(struct snd_sof_dev *sdev,

base-commit: e49bcf4f5579828d4d77e5fcc9cb799db69d1f85
-- 
2.31.0


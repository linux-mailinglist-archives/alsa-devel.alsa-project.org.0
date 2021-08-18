Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BCB3EFE64
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 09:58:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E28E166F;
	Wed, 18 Aug 2021 09:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E28E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629273524;
	bh=hoXlkSc84CTPjy7s6ZcDJbVyo2wuhJcJBQY2DUJhJck=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QiHpnEx2MmL3pmi0DkECQAUCNZInOxT05FXKvXufm900wmx6YAIRFrJNfAzSXvs6G
	 CGM8/0sGdwTdw55YrwLb1p0SPQwztsl7iNmVVApESmb85Sdi0uhVWRGrz1GxsAnb9C
	 noRQn/42U1Roy+OHlUe0ldb/V9g/UEymw8LVlQbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8FB7F80515;
	Wed, 18 Aug 2021 09:55:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 993D3F80517; Wed, 18 Aug 2021 09:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBCEEF804FF
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBCEEF804FF
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195855551"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="195855551"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="676974989"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 00:55:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/11] ASoC: Intel: Skylake: Support multiple format configs
Date: Wed, 18 Aug 2021 09:57:39 +0200
Message-Id: <20210818075742.1515155-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, jairaj.arava@intel.com,
 upstream@semihalf.com, harshapriya.n@intel.com, cujomalainey@google.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>, hdegoede@redhat.com,
 broonie@kernel.org, jenny.tc@intel.com, lma@semihalf.com,
 vamshi.krishna.gopal@intel.com, Kareem Shaik <kareem.m.shaik@intel.com>
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

From: Kareem Shaik <kareem.m.shaik@intel.com>

A module can have two kinds of set params, as per topology requirements.
For example, one pre-init and one post-init. But currently, there is
support for just one type, as the format_config.

This patch extends the format_configs to 4, so as to be able to support
pre-init, post-init and post-bind type of set params, for the same
module, simultaneously.

Signed-off-by: Kareem Shaik <kareem.m.shaik@intel.com>
Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/snd_sst_tokens.h    |  6 +-
 sound/soc/intel/skylake/skl-messages.c | 19 +++--
 sound/soc/intel/skylake/skl-topology.c | 99 +++++++++++++++++---------
 sound/soc/intel/skylake/skl-topology.h |  5 +-
 4 files changed, 82 insertions(+), 47 deletions(-)

diff --git a/include/uapi/sound/snd_sst_tokens.h b/include/uapi/sound/snd_sst_tokens.h
index 8ba0112e5336..ff3748e9308a 100644
--- a/include/uapi/sound/snd_sst_tokens.h
+++ b/include/uapi/sound/snd_sst_tokens.h
@@ -233,6 +233,8 @@
  *
  * %SKL_TKN_U32_ASTATE_CLK_SRC: Clock source for A-State entry
  *
+ * %SKL_TKN_U32_FMT_CFG_IDX:    Format config index
+ *
  * module_id and loadable flags dont have tokens as these values will be
  * read from the DSP FW manifest
  *
@@ -324,7 +326,9 @@ enum SKL_TKNS {
 	SKL_TKN_U32_ASTATE_COUNT,
 	SKL_TKN_U32_ASTATE_KCPS,
 	SKL_TKN_U32_ASTATE_CLK_SRC,
-	SKL_TKN_MAX = SKL_TKN_U32_ASTATE_CLK_SRC,
+
+	SKL_TKN_U32_FMT_CFG_IDX = 96,
+	SKL_TKN_MAX = SKL_TKN_U32_FMT_CFG_IDX,
 };
 
 #endif
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 79c6cf2c14bf..7257acf0b6ee 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -479,15 +479,15 @@ static void skl_set_base_module_format(struct skl_dev *skl,
 static void skl_copy_copier_caps(struct skl_module_cfg *mconfig,
 				struct skl_cpr_cfg *cpr_mconfig)
 {
-	if (mconfig->formats_config.caps_size == 0)
+	if (mconfig->formats_config[SKL_PARAM_INIT].caps_size == 0)
 		return;
 
 	memcpy(cpr_mconfig->gtw_cfg.config_data,
-			mconfig->formats_config.caps,
-			mconfig->formats_config.caps_size);
+			mconfig->formats_config[SKL_PARAM_INIT].caps,
+			mconfig->formats_config[SKL_PARAM_INIT].caps_size);
 
 	cpr_mconfig->gtw_cfg.config_length =
-			(mconfig->formats_config.caps_size) / 4;
+			(mconfig->formats_config[SKL_PARAM_INIT].caps_size) / 4;
 }
 
 #define SKL_NON_GATEWAY_CPR_NODE_ID 0xFFFFFFFF
@@ -749,13 +749,12 @@ static void skl_set_algo_format(struct skl_dev *skl,
 	struct skl_base_cfg *base_cfg = (struct skl_base_cfg *)algo_mcfg;
 
 	skl_set_base_module_format(skl, mconfig, base_cfg);
-
-	if (mconfig->formats_config.caps_size == 0)
+	if (mconfig->formats_config[SKL_PARAM_INIT].caps_size == 0)
 		return;
 
 	memcpy(algo_mcfg->params,
-			mconfig->formats_config.caps,
-			mconfig->formats_config.caps_size);
+			mconfig->formats_config[SKL_PARAM_INIT].caps,
+			mconfig->formats_config[SKL_PARAM_INIT].caps_size);
 
 }
 
@@ -786,7 +785,7 @@ static u16 skl_get_module_param_size(struct skl_dev *skl,
 	switch (mconfig->m_type) {
 	case SKL_MODULE_TYPE_COPIER:
 		param_size = sizeof(struct skl_cpr_cfg);
-		param_size += mconfig->formats_config.caps_size;
+		param_size += mconfig->formats_config[SKL_PARAM_INIT].caps_size;
 		return param_size;
 
 	case SKL_MODULE_TYPE_SRCINT:
@@ -797,7 +796,7 @@ static u16 skl_get_module_param_size(struct skl_dev *skl,
 
 	case SKL_MODULE_TYPE_ALGO:
 		param_size = sizeof(struct skl_base_cfg);
-		param_size += mconfig->formats_config.caps_size;
+		param_size += mconfig->formats_config[SKL_PARAM_INIT].caps_size;
 		return param_size;
 
 	case SKL_MODULE_TYPE_BASE_OUTFMT:
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 51fb594bb172..04fbf83f3835 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -292,7 +292,7 @@ static int skl_tplg_update_be_blob(struct snd_soc_dapm_widget *w,
 	struct skl_module_iface *m_iface = &m_cfg->module->formats[fmt_idx];
 
 	/* check if we already have blob */
-	if (m_cfg->formats_config.caps_size > 0)
+	if (m_cfg->formats_config[SKL_PARAM_INIT].caps_size > 0)
 		return 0;
 
 	dev_dbg(skl->dev, "Applying default cfg blob\n");
@@ -328,8 +328,8 @@ static int skl_tplg_update_be_blob(struct snd_soc_dapm_widget *w,
 	cfg = skl_get_ep_blob(skl, m_cfg->vbus_id, link_type,
 					s_fmt, ch, s_freq, dir, dev_type);
 	if (cfg) {
-		m_cfg->formats_config.caps_size = cfg->size;
-		m_cfg->formats_config.caps = (u32 *) &cfg->caps;
+		m_cfg->formats_config[SKL_PARAM_INIT].caps_size = cfg->size;
+		m_cfg->formats_config[SKL_PARAM_INIT].caps = (u32 *)&cfg->caps;
 	} else {
 		dev_err(skl->dev, "Blob NULL for id %x type %d dirn %d\n",
 					m_cfg->vbus_id, link_type, dir);
@@ -386,9 +386,9 @@ static int skl_tplg_set_module_params(struct snd_soc_dapm_widget *w,
 	struct skl_algo_data *bc;
 	struct skl_specific_cfg *sp_cfg;
 
-	if (mconfig->formats_config.caps_size > 0 &&
-		mconfig->formats_config.set_params == SKL_PARAM_SET) {
-		sp_cfg = &mconfig->formats_config;
+	if (mconfig->formats_config[SKL_PARAM_SET].caps_size > 0 &&
+	    mconfig->formats_config[SKL_PARAM_SET].set_params == SKL_PARAM_SET) {
+		sp_cfg = &mconfig->formats_config[SKL_PARAM_SET];
 		ret = skl_set_module_params(skl, sp_cfg->caps,
 					sp_cfg->caps_size,
 					sp_cfg->param_id, mconfig);
@@ -438,8 +438,10 @@ static int skl_tplg_set_module_init_data(struct snd_soc_dapm_widget *w)
 			if (bc->set_params != SKL_PARAM_INIT)
 				continue;
 
-			mconfig->formats_config.caps = (u32 *)bc->params;
-			mconfig->formats_config.caps_size = bc->size;
+			mconfig->formats_config[SKL_PARAM_INIT].caps =
+							(u32 *)bc->params;
+			mconfig->formats_config[SKL_PARAM_INIT].caps_size =
+								bc->size;
 
 			break;
 		}
@@ -798,9 +800,10 @@ static int skl_tplg_set_module_bind_params(struct snd_soc_dapm_widget *w,
 			return 0;
 	}
 
-	if (mconfig->formats_config.caps_size > 0 &&
-		mconfig->formats_config.set_params == SKL_PARAM_BIND) {
-		sp_cfg = &mconfig->formats_config;
+	if (mconfig->formats_config[SKL_PARAM_BIND].caps_size > 0 &&
+	    mconfig->formats_config[SKL_PARAM_BIND].set_params ==
+								SKL_PARAM_BIND) {
+		sp_cfg = &mconfig->formats_config[SKL_PARAM_BIND];
 		ret = skl_set_module_params(skl, sp_cfg->caps,
 					sp_cfg->caps_size,
 					sp_cfg->param_id, mconfig);
@@ -1496,7 +1499,8 @@ static int skl_tplg_mic_control_get(struct snd_kcontrol *kcontrol,
 static int skl_fill_mic_sel_params(struct skl_module_cfg *mconfig,
 	struct skl_mic_sel_config *mic_cfg, struct device *dev)
 {
-	struct skl_specific_cfg *sp_cfg = &mconfig->formats_config;
+	struct skl_specific_cfg *sp_cfg =
+				&mconfig->formats_config[SKL_PARAM_INIT];
 
 	sp_cfg->caps_size = sizeof(struct skl_mic_sel_config);
 	sp_cfg->set_params = SKL_PARAM_SET;
@@ -1849,8 +1853,8 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 					pipe_fmt->freq, pipe->direction,
 					dev_type);
 	if (cfg) {
-		mconfig->formats_config.caps_size = cfg->size;
-		mconfig->formats_config.caps = (u32 *) &cfg->caps;
+		mconfig->formats_config[SKL_PARAM_INIT].caps_size = cfg->size;
+		mconfig->formats_config[SKL_PARAM_INIT].caps = (u32 *)&cfg->caps;
 	} else {
 		dev_err(dai->dev, "Blob NULL for id:%d type:%d dirn:%d ch:%d, freq:%d, fmt:%d\n",
 			mconfig->vbus_id, link_type, params->stream,
@@ -2567,19 +2571,26 @@ static int skl_tplg_get_token(struct device *dev,
 
 		break;
 
+	case SKL_TKN_U32_FMT_CFG_IDX:
+		if (tkn_elem->value > SKL_MAX_PARAMS_TYPES)
+			return -EINVAL;
+
+		mconfig->fmt_cfg_idx = tkn_elem->value;
+		break;
+
 	case SKL_TKN_U32_CAPS_SIZE:
-		mconfig->formats_config.caps_size =
+		mconfig->formats_config[mconfig->fmt_cfg_idx].caps_size =
 			tkn_elem->value;
 
 		break;
 
 	case SKL_TKN_U32_CAPS_SET_PARAMS:
-		mconfig->formats_config.set_params =
+		mconfig->formats_config[mconfig->fmt_cfg_idx].set_params =
 				tkn_elem->value;
 		break;
 
 	case SKL_TKN_U32_CAPS_PARAMS_ID:
-		mconfig->formats_config.param_id =
+		mconfig->formats_config[mconfig->fmt_cfg_idx].param_id =
 				tkn_elem->value;
 		break;
 
@@ -2793,6 +2804,7 @@ static int skl_tplg_get_pvt_data_v4(struct snd_soc_tplg_dapm_widget *tplg_w,
 	struct skl_dfw_v4_module *dfw =
 				(struct skl_dfw_v4_module *)tplg_w->priv.data;
 	int ret;
+	int idx = mconfig->fmt_cfg_idx;
 
 	dev_dbg(dev, "Parsing Skylake v4 widget topology data\n");
 
@@ -2826,7 +2838,7 @@ static int skl_tplg_get_pvt_data_v4(struct snd_soc_tplg_dapm_widget *tplg_w,
 	mconfig->dev_type = dfw->dev_type;
 	mconfig->hw_conn_type = dfw->hw_conn_type;
 	mconfig->time_slot = dfw->time_slot;
-	mconfig->formats_config.caps_size = dfw->caps.caps_size;
+	mconfig->formats_config[idx].caps_size = dfw->caps.caps_size;
 
 	mconfig->m_in_pin = devm_kcalloc(dev,
 				MAX_IN_QUEUE, sizeof(*mconfig->m_in_pin),
@@ -2847,21 +2859,39 @@ static int skl_tplg_get_pvt_data_v4(struct snd_soc_tplg_dapm_widget *tplg_w,
 				    dfw->is_dynamic_out_pin,
 				    mconfig->module->max_output_pins);
 
-	if (mconfig->formats_config.caps_size) {
-		mconfig->formats_config.set_params = dfw->caps.set_params;
-		mconfig->formats_config.param_id = dfw->caps.param_id;
-		mconfig->formats_config.caps =
-		devm_kzalloc(dev, mconfig->formats_config.caps_size,
+	if (mconfig->formats_config[idx].caps_size) {
+		mconfig->formats_config[idx].set_params = dfw->caps.set_params;
+		mconfig->formats_config[idx].param_id = dfw->caps.param_id;
+		mconfig->formats_config[idx].caps =
+		devm_kzalloc(dev, mconfig->formats_config[idx].caps_size,
 			     GFP_KERNEL);
-		if (!mconfig->formats_config.caps)
+		if (!mconfig->formats_config[idx].caps)
 			return -ENOMEM;
-		memcpy(mconfig->formats_config.caps, dfw->caps.caps,
+		memcpy(mconfig->formats_config[idx].caps, dfw->caps.caps,
 		       dfw->caps.caps_size);
 	}
 
 	return 0;
 }
 
+static int skl_tplg_get_caps_data(struct device *dev, char *data,
+				  struct skl_module_cfg *mconfig)
+{
+	int idx = mconfig->fmt_cfg_idx;
+
+	if (mconfig->formats_config[idx].caps_size > 0) {
+		mconfig->formats_config[idx].caps =
+			devm_kzalloc(dev, mconfig->formats_config[idx].caps_size,
+				     GFP_KERNEL);
+		if (!mconfig->formats_config[idx].caps)
+			return -ENOMEM;
+		memcpy(mconfig->formats_config[idx].caps, data,
+		       mconfig->formats_config[idx].caps_size);
+	}
+
+	return mconfig->formats_config[idx].caps_size;
+}
+
 /*
  * Parse the private data for the token and corresponding value.
  * The private data can have multiple data blocks. So, a data block
@@ -2922,18 +2952,14 @@ static int skl_tplg_get_pvt_data(struct snd_soc_tplg_dapm_widget *tplg_w,
 		if (block_type == SKL_TYPE_TUPLE) {
 			ret = skl_tplg_get_tokens(dev, data,
 					skl, mconfig, block_size);
-
-			if (ret < 0)
-				return ret;
-
-			--num_blocks;
 		} else {
-			if (mconfig->formats_config.caps_size > 0)
-				memcpy(mconfig->formats_config.caps, data,
-					mconfig->formats_config.caps_size);
-			--num_blocks;
-			ret = mconfig->formats_config.caps_size;
+			ret = skl_tplg_get_caps_data(dev, data, mconfig);
 		}
+
+		if (ret < 0)
+			return ret;
+
+		--num_blocks;
 		off += ret;
 	}
 
@@ -3024,6 +3050,9 @@ static int skl_tplg_widget_load(struct snd_soc_component *cmpnt, int index,
 	 */
 	mconfig->id.module_id = -1;
 
+	/* To provide backward compatibility, set default as SKL_PARAM_INIT */
+	mconfig->fmt_cfg_idx = SKL_PARAM_INIT;
+
 	/* Parse private data for tuples */
 	ret = skl_tplg_get_pvt_data(tplg_w, skl, bus->dev, mconfig);
 	if (ret < 0)
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index ad230fd64758..ef332c83d5c0 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -81,6 +81,8 @@ enum skl_s_freq {
 	SKL_FS_INVALID
 };
 
+#define SKL_MAX_PARAMS_TYPES	4
+
 enum skl_widget_type {
 	SKL_WIDGET_VMIXER = 1,
 	SKL_WIDGET_MIXER = 2,
@@ -371,6 +373,7 @@ struct skl_module_cfg {
 	struct skl_module *module;
 	int res_idx;
 	int fmt_idx;
+	int fmt_cfg_idx;
 	u8 domain;
 	bool homogenous_inputs;
 	bool homogenous_outputs;
@@ -401,7 +404,7 @@ struct skl_module_cfg {
 	enum skl_hw_conn_type  hw_conn_type;
 	enum skl_module_state m_state;
 	struct skl_pipe *pipe;
-	struct skl_specific_cfg formats_config;
+	struct skl_specific_cfg formats_config[SKL_MAX_PARAMS_TYPES];
 	struct skl_pipe_mcfg mod_cfg[SKL_MAX_MODULES_IN_PIPE];
 };
 
-- 
2.25.1


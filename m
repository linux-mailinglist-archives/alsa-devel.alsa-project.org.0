Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F795763ED
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:56:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EBD91841;
	Fri, 15 Jul 2022 16:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EBD91841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657897007;
	bh=69CHWb0eaIZwzPCQYTKtYOkSQwLWjpZVntAt9GTI5rQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YWebAYGacJs7kx+1x0S9X5rSXwPl5y1d5rDJJ86onUYKdjT4k0T3dK5kACJFVBDZN
	 0u2S4E9239UenVvBWQhlTM9z82cdMxg7Kq2j4PW5l7Eg6LRszokkcpqlCfGAaT9QoR
	 LE/1Wzs2UOg5QPyhJDrEzTNLfJCMZlovRwQa2Wys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D61FDF805A8;
	Fri, 15 Jul 2022 16:53:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B37EF80568; Fri, 15 Jul 2022 16:53:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E34C9F80544
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E34C9F80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U7tnqpbV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896779; x=1689432779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=69CHWb0eaIZwzPCQYTKtYOkSQwLWjpZVntAt9GTI5rQ=;
 b=U7tnqpbVYVi7eYz9c/LY4dyAH8oMHKzT6AHpp0VlgOFH0HUY6OPUpf+G
 a6TDyV4c+Azaxeh11rM5Q0DbSokAIbdTDkX5cDaYMGD86ZAIPAinVBMXx
 VP6Ht8Py9P4fEMuidZXVzYSmZ48ZUwVuwftAPLaN4/kNwLX7Mke3NwCSS
 5+LeuxE+BgTyuctMor6HJVxkfb3WJ2Hq1ShRar8Znp/a79tO1RnnLZVtv
 QAggrvJC4bJIn2q/juBSjnF2zU4EV2lQxs4uglhmRxdHH9rGAVbV8UR61
 B0h47HW2DQyCGf7V0/bLxe6xJpM21XwcGjxHqHRXxAZQwSu08u70g1baP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311476908"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="311476908"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923533118"
Received: from jmurope-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.14.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/11] ASoC: SOF: add ipc4 SRC module support
Date: Fri, 15 Jul 2022 09:52:09 -0500
Message-Id: <20220715145216.277003-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
References: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

SRC module only needs two parameters : base module config
and sink rate. This patch adds prepare and setup for SRC
widgets.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 114 +++++++++++++++++++++++++++++++++-
 sound/soc/sof/ipc4-topology.h |  14 +++++
 2 files changed, 127 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f77091918118..47291fa3f166 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -111,6 +111,12 @@ static const struct sof_topology_token gain_tokens[] = {
 		get_token_u32, offsetof(struct sof_ipc4_gain_data, init_val)},
 };
 
+/* SRC */
+static const struct sof_topology_token src_tokens[] = {
+	{SOF_TKN_SRC_RATE_OUT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_src, sink_rate)},
+};
+
 static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_DAI_TOKENS] = {"DAI tokens", dai_tokens, ARRAY_SIZE(dai_tokens)},
 	[SOF_PIPELINE_TOKENS] = {"Pipeline tokens", pipeline_tokens, ARRAY_SIZE(pipeline_tokens)},
@@ -134,6 +140,7 @@ static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_AUDIO_FMT_NUM_TOKENS] = {"IPC4 Audio format number tokens",
 		ipc4_audio_fmt_num_tokens, ARRAY_SIZE(ipc4_audio_fmt_num_tokens)},
 	[SOF_GAIN_TOKENS] = {"Gain tokens", gain_tokens, ARRAY_SIZE(gain_tokens)},
+	[SOF_SRC_TOKENS] = {"SRC tokens", src_tokens, ARRAY_SIZE(src_tokens)},
 };
 
 static void sof_ipc4_dbg_audio_format(struct device *dev,
@@ -740,6 +747,58 @@ static int sof_ipc4_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 	return ret;
 }
 
+static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc4_src *src;
+	int ret;
+
+	dev_dbg(scomp->dev, "Updating IPC structure for %s\n", swidget->widget->name);
+
+	src = kzalloc(sizeof(*src), GFP_KERNEL);
+	if (!src)
+		return -ENOMEM;
+
+	swidget->private = src;
+
+	/* The out_audio_fmt in topology is ignored as it is not required by SRC */
+	ret = sof_ipc4_get_audio_fmt(scomp, swidget, &src->available_fmt, false);
+	if (ret)
+		goto err;
+
+	ret = sof_update_ipc_object(scomp, src, SOF_SRC_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(src), 1);
+	if (ret) {
+		dev_err(scomp->dev, "Parsing SRC tokens failed\n");
+		goto err;
+	}
+
+	dev_dbg(scomp->dev, "SRC sink rate %d\n", src->sink_rate);
+
+	ret = sof_ipc4_widget_setup_msg(swidget, &src->msg);
+	if (ret)
+		goto err;
+
+	return 0;
+err:
+	sof_ipc4_free_audio_fmt(&src->available_fmt);
+	kfree(src);
+	swidget->private = NULL;
+	return ret;
+}
+
+static void sof_ipc4_widget_free_comp_src(struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_src *src = swidget->private;
+
+	if (!src)
+		return;
+
+	sof_ipc4_free_audio_fmt(&src->available_fmt);
+	kfree(swidget->private);
+	swidget->private = NULL;
+}
+
 static void sof_ipc4_widget_free_comp_mixer(struct snd_sof_widget *swidget)
 {
 	struct sof_ipc4_mixer *mixer = swidget->private;
@@ -1305,6 +1364,37 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	return 0;
 }
 
+static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
+				       struct snd_pcm_hw_params *fe_params,
+				       struct snd_sof_platform_stream_params *platform_params,
+				       struct snd_pcm_hw_params *pipeline_params, int dir)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc4_src *src = swidget->private;
+	struct snd_interval *rate;
+	int ret;
+
+	src->available_fmt.ref_audio_fmt = &src->available_fmt.base_config->audio_fmt;
+
+	/* output format is not required to be sent to the FW for SRC */
+	ret = sof_ipc4_init_audio_fmt(sdev, swidget, &src->base_config,
+				      NULL, pipeline_params, &src->available_fmt,
+				      sizeof(src->base_config));
+	if (ret < 0)
+		return ret;
+
+	/* update pipeline memory usage */
+	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &src->base_config);
+
+	/* update pipeline_params for sink widgets */
+	rate = hw_param_interval(pipeline_params, SNDRV_PCM_HW_PARAM_RATE);
+	rate->min = src->sink_rate;
+	rate->max = rate->min;
+
+	return 0;
+}
+
 static int sof_ipc4_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
 {
 	struct sof_ipc4_control_data *control_data;
@@ -1360,7 +1450,6 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	u32 ipc_size = 0;
 	int ret;
 
-
 	switch (swidget->id) {
 	case snd_soc_dapm_scheduler:
 		pipeline = swidget->private;
@@ -1415,6 +1504,16 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		msg = &mixer->msg;
 		break;
 	}
+	case snd_soc_dapm_src:
+	{
+		struct sof_ipc4_src *src = swidget->private;
+
+		ipc_size = sizeof(struct sof_ipc4_base_module_cfg) + sizeof(src->sink_rate);
+		ipc_data = src;
+
+		msg = &src->msg;
+		break;
+	}
 	default:
 		dev_err(sdev->dev, "widget type %d not supported", swidget->id);
 		return -EINVAL;
@@ -1762,6 +1861,15 @@ static enum sof_tokens mixer_token_list[] = {
 	SOF_COMP_EXT_TOKENS,
 };
 
+static enum sof_tokens src_token_list[] = {
+	SOF_COMP_TOKENS,
+	SOF_SRC_TOKENS,
+	SOF_AUDIO_FMT_NUM_TOKENS,
+	SOF_IN_AUDIO_FORMAT_TOKENS,
+	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+};
+
 static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL,
@@ -1790,6 +1898,10 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 				mixer_token_list, ARRAY_SIZE(mixer_token_list),
 				NULL, sof_ipc4_prepare_mixer_module,
 				NULL},
+	[snd_soc_dapm_src] = {sof_ipc4_widget_setup_comp_src, sof_ipc4_widget_free_comp_src,
+				src_token_list, ARRAY_SIZE(src_token_list),
+				NULL, sof_ipc4_prepare_src_module,
+				NULL},
 };
 
 const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 3bc2fe38c733..56ab80e722ce 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -242,4 +242,18 @@ struct sof_ipc4_mixer {
 	struct sof_ipc4_msg msg;
 };
 
+/**
+ * struct sof_ipc4_src SRC config data
+ * @base_config: IPC base config data
+ * @sink_rate: Output rate for sink module
+ * @available_fmt: Available audio format
+ * @msg: IPC4 message struct containing header and data info
+ */
+struct sof_ipc4_src {
+	struct sof_ipc4_base_module_cfg base_config;
+	uint32_t sink_rate;
+	struct sof_ipc4_available_audio_format available_fmt;
+	struct sof_ipc4_msg msg;
+};
+
 #endif
-- 
2.34.1


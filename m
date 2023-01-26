Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5F267C969
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 12:07:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24548E12;
	Thu, 26 Jan 2023 12:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24548E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674731265;
	bh=LT+PAcjm7d57hkH2/6nYDqvElwEeNEyKWXRMecpzszM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=KkaoZnA57GkljFVbiMraaxeVqbAxxJ+jOHJH0z4EZT4Ks3xL0TeFJBBZ8gfoGI2Os
	 KIKWl4dqymtUgvSyfcoBZb8ujn1nSyl7V+rywcY+1yJMjFVupzUsXeFIDrPULAF9qr
	 tua7D1ytc9jiXe8Sj0lhNshYBKfqwjEAg9Uyq4c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2C0CF800AE;
	Thu, 26 Jan 2023 12:06:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C84B4F8027D; Thu, 26 Jan 2023 12:06:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEFBDF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 12:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEFBDF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WH/tK4wF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674731197; x=1706267197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LT+PAcjm7d57hkH2/6nYDqvElwEeNEyKWXRMecpzszM=;
 b=WH/tK4wFhRdgpSJXqmqS1jPerzs+ru7hPp6uUXhjCcqXUg9Nva2ikxmM
 iBunHm1bXxX9eD9J7+/tEMiDTBxRk2+441Wt5zBzE9xijv0i5ujIlJ64j
 +BtXymNei1H7LQdRr4k049YziZLiTfjiKeW+JFWzcRJP/qaScD+08ZEVQ
 +QgtYLZK+qnQxDTPyBW4tkzdi1ZFDP/U1l3L9mEEy5UPPoDemJLCjAUX4
 VDJnKy/coZWYIJt+7uwGGETPLxACAfnYYqmu69+gyn4Ju/+ghPjy5NoKl
 iFBCWCkS0hSoj2OliTI7O+QuQ0JNC0tmfqCh5+zxWIas2kzgjR0lAsKm6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="328037396"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="328037396"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 03:06:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="731368941"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="731368941"
Received: from mericx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.29.93])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 03:06:30 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4-topology: add buffer type support
Date: Thu, 26 Jan 2023 13:06:37 +0200
Message-Id: <20230126110637.25542-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The corresponding IPC4 module of snd_soc_dapm_buffer widget is module
-to-module copier.
The module-to-module copier is a buffer-like component with demuxing
capabilities.
Rename the host_token_list to common_copier_token_list since it will
be used by host copier and module-to-module copier.
The setup callback is almost the same as sof_ipc4_widget_setup_pcm except
the gtw_cfg data, and the free callback is exactly the same as
sof_ipc4_widget_free_comp_pcm. To reduce the duplication, the commit
reuses the setup and free callbacks.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 57 ++++++++++++++++++++++++++++++-----
 sound/soc/sof/ipc4-topology.h |  2 ++
 2 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 59f4d42f9011..a807a6952e42 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -354,6 +354,13 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 		goto free_available_fmt;
 	}
 
+	/*
+	 * This callback is used by host copier and module-to-module copier,
+	 * and only host copier needs to set gtw_cfg.
+	 */
+	if (!WIDGET_IS_AIF(swidget->id))
+		goto skip_gtw_cfg;
+
 	ret = sof_update_ipc_object(scomp, available_fmt->dma_buffer_size,
 				    SOF_COPIER_GATEWAY_CFG_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(u32),
@@ -380,7 +387,7 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	}
 	dev_dbg(scomp->dev, "host copier '%s' node_type %u\n", swidget->widget->name, node_type);
 
-	ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_NODE_TYPE(node_type);
+skip_gtw_cfg:
 	ipc4_copier->gtw_attr = kzalloc(sizeof(*ipc4_copier->gtw_attr), GFP_KERNEL);
 	if (!ipc4_copier->gtw_attr) {
 		ret = -ENOMEM;
@@ -391,6 +398,21 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	ipc4_copier->data.gtw_cfg.config_length =
 		sizeof(struct sof_ipc4_gtw_attributes) >> 2;
 
+	switch (swidget->id) {
+	case snd_soc_dapm_aif_in:
+	case snd_soc_dapm_aif_out:
+		ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_NODE_TYPE(node_type);
+		break;
+	case snd_soc_dapm_buffer:
+		ipc4_copier->data.gtw_cfg.node_id = SOF_IPC4_INVALID_NODE_ID;
+		ipc4_copier->ipc_config_size = 0;
+		break;
+	default:
+		dev_err(scomp->dev, "invalid widget type %d\n", swidget->id);
+		ret = -EINVAL;
+		goto free_gtw_attr;
+	}
+
 	/* set up module info and message header */
 	ret = sof_ipc4_widget_setup_msg(swidget, &ipc4_copier->msg);
 	if (ret)
@@ -951,7 +973,7 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 	pipeline = pipe_widget->private;
 	pipeline->mem_usage = 0;
 
-	if (WIDGET_IS_AIF(swidget->id)) {
+	if (WIDGET_IS_AIF(swidget->id) || swidget->id == snd_soc_dapm_buffer) {
 		ipc4_copier = swidget->private;
 	} else if (WIDGET_IS_DAI(swidget->id)) {
 		struct snd_sof_dai *dai = swidget->private;
@@ -1177,6 +1199,22 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 		break;
 	}
+	case snd_soc_dapm_buffer:
+	{
+		ipc4_copier = (struct sof_ipc4_copier *)swidget->private;
+		copier_data = &ipc4_copier->data;
+		available_fmt = &ipc4_copier->available_fmt;
+
+		/*
+		 * base_config->audio_fmt represent the input audio formats. Use
+		 * the input format as the reference to match pcm params
+		 */
+		available_fmt->ref_audio_fmt = &available_fmt->base_config->audio_fmt;
+		ref_audio_fmt_size = sizeof(struct sof_ipc4_base_module_cfg);
+		ref_params = pipeline_params;
+
+		break;
+	}
 	default:
 		dev_err(sdev->dev, "unsupported type %d for copier %s",
 			swidget->id, swidget->widget->name);
@@ -1465,6 +1503,7 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		break;
 	case snd_soc_dapm_aif_in:
 	case snd_soc_dapm_aif_out:
+	case snd_soc_dapm_buffer:
 	{
 		struct sof_ipc4_copier *ipc4_copier = swidget->private;
 
@@ -1970,7 +2009,7 @@ static int sof_ipc4_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 	return 0;
 }
 
-static enum sof_tokens host_token_list[] = {
+static enum sof_tokens common_copier_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
 	SOF_AUDIO_FORMAT_BUFFER_SIZE_TOKENS,
@@ -2026,12 +2065,12 @@ static enum sof_tokens src_token_list[] = {
 
 static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
-				  host_token_list, ARRAY_SIZE(host_token_list), NULL,
-				  sof_ipc4_prepare_copier_module,
+				  common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
+				  NULL, sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_aif_out] = {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
-				  host_token_list, ARRAY_SIZE(host_token_list), NULL,
-				  sof_ipc4_prepare_copier_module,
+				  common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
+				  NULL, sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_dai_in] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
 				 dai_token_list, ARRAY_SIZE(dai_token_list), NULL,
@@ -2041,6 +2080,10 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 				  dai_token_list, ARRAY_SIZE(dai_token_list), NULL,
 				  sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
+	[snd_soc_dapm_buffer] = {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
+				 common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
+				 NULL, sof_ipc4_prepare_copier_module,
+				 sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline,
 				    sof_ipc4_widget_free_comp_pipeline,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL,
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 0aa87a8add5d..8dbbf69b0eb7 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -53,6 +53,8 @@
 
 #define ALH_MAX_NUMBER_OF_GTW   16
 
+#define SOF_IPC4_INVALID_NODE_ID	0xffffffff
+
 /*
  * The base of multi-gateways. Multi-gateways addressing starts from
  * ALH_MULTI_GTW_BASE and there are ALH_MULTI_GTW_COUNT multi-sources
-- 
2.39.1


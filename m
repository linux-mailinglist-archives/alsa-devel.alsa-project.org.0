Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C060156C12B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 22:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 199FD84A;
	Fri,  8 Jul 2022 22:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 199FD84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657310850;
	bh=GSUT6IVbJiVs4lOBi6Jv423aLiPJI66fO0vSzbGbjyw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HlmsnLe804jklKo6crixvCUFelsoJRzbPPV6oDGhInMElkwnNy1B5m2GEAC8xA3Sk
	 cYnUrWl0FFQQmki8GU397+ChqLzfK+vV6ZdlM/mdPseIfZ/xMcEcGZMzxEd+kPukJU
	 6lhUyzgh+M1mCGygQTDt7zNN85MRNbQKzKChDonw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78EB2F80539;
	Fri,  8 Jul 2022 22:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13524F80542; Fri,  8 Jul 2022 22:05:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E91AF80539
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 22:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E91AF80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IJWxrqvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657310750; x=1688846750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GSUT6IVbJiVs4lOBi6Jv423aLiPJI66fO0vSzbGbjyw=;
 b=IJWxrqvdlh7LiNtUafSDeg+Nfx5YJTkDfW3qYIaSCbNq2wFRLCNou7DN
 QKQTv9kncTHlOTIWTX5dI3tyNXkMNqTw5jU/jtWhfGT5Cuec0jW5ySxHl
 LpB4Z8BdRXwyPZD/pN03EbCHCJfiVdoSwgtHm7k6WnAeGu6t+o2Y2YmBi
 8sTE+N7QPeyEjDwXU1l26WHcYe6HfCdcizB4t8zCn83jLgrc0C/y6m0gX
 aYjkpCAD58fvoNYXqC5twCCG9d5r3KRxIaTE2RXFbZDfZAspHVidjnEyv
 v9sgGdH7k6t97rGxWvhky1iFKuzln7dAwzXMEYkp+SU96cFxxdFrhmaHZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="284378847"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="284378847"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:05:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="651691930"
Received: from gcisnero-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.87.49])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 13:05:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: ipc4-topology: free memories allocated in
 sof_ipc4_get_audio_fmt
Date: Fri,  8 Jul 2022 15:05:16 -0500
Message-Id: <20220708200516.26853-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708200516.26853-1-pierre-louis.bossart@linux.intel.com>
References: <20220708200516.26853-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Libin Yang <libin.yang@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Libin Yang <libin.yang@intel.com>

Free the memories allocated in sof_ipc4_get_audio_fmt in error handling
and ipc_free()

Fixes: 2cabd02b6090 ("ASoC: SOF: ipc4-topology: Add support for parsing AIF_IN/AIF_OUT widgets")
Fixes: abfb536bd116 ("ASoC: SOF: ipc4-topology: Add support for parsing DAI_IN/DAI_OUT widgets")
Fixes: 4f838ab20812 ("ASoC: SOF: ipc4-topology: Add support for parsing and preparing pga widgets")
Fixes: 4d4ba014ac4b ("ASoC: SOF: ipc4-topology: Add support for parsing mixer widgets")
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 48 ++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 2d157ea79db5..22ea628d78d0 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -263,6 +263,16 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 	return ret;
 }
 
+/* release the memory allocated in sof_ipc4_get_audio_fmt */
+static void sof_ipc4_free_audio_fmt(struct sof_ipc4_available_audio_format *available_fmt)
+
+{
+	kfree(available_fmt->base_config);
+	available_fmt->base_config = NULL;
+	kfree(available_fmt->out_audio_fmt);
+	available_fmt->out_audio_fmt = NULL;
+}
+
 static void sof_ipc4_widget_free_comp(struct snd_sof_widget *swidget)
 {
 	kfree(swidget->private);
@@ -341,7 +351,7 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 						 GFP_KERNEL);
 	if (!available_fmt->dma_buffer_size) {
 		ret = -ENOMEM;
-		goto free_copier;
+		goto free_available_fmt;
 	}
 
 	ret = sof_update_ipc_object(scomp, available_fmt->dma_buffer_size,
@@ -392,6 +402,8 @@ static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 	kfree(ipc4_copier->gtw_attr);
 err:
 	kfree(available_fmt->dma_buffer_size);
+free_available_fmt:
+	sof_ipc4_free_audio_fmt(available_fmt);
 free_copier:
 	kfree(ipc4_copier);
 	swidget->private = NULL;
@@ -440,7 +452,7 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 						 GFP_KERNEL);
 	if (!available_fmt->dma_buffer_size) {
 		ret = -ENOMEM;
-		goto free_copier;
+		goto free_available_fmt;
 	}
 
 	ret = sof_update_ipc_object(scomp, available_fmt->dma_buffer_size,
@@ -540,6 +552,8 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	kfree(ipc4_copier->copier_config);
 err:
 	kfree(available_fmt->dma_buffer_size);
+free_available_fmt:
+	sof_ipc4_free_audio_fmt(available_fmt);
 free_copier:
 	kfree(ipc4_copier);
 	dai->private = NULL;
@@ -677,11 +691,24 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 
 	return 0;
 err:
+	sof_ipc4_free_audio_fmt(&gain->available_fmt);
 	kfree(gain);
 	swidget->private = NULL;
 	return ret;
 }
 
+static void sof_ipc4_widget_free_comp_pga(struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_gain *gain = swidget->private;
+
+	if (!gain)
+		return;
+
+	sof_ipc4_free_audio_fmt(&gain->available_fmt);
+	kfree(swidget->private);
+	swidget->private = NULL;
+}
+
 static int sof_ipc4_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
@@ -707,11 +734,24 @@ static int sof_ipc4_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 
 	return 0;
 err:
+	sof_ipc4_free_audio_fmt(&mixer->available_fmt);
 	kfree(mixer);
 	swidget->private = NULL;
 	return ret;
 }
 
+static void sof_ipc4_widget_free_comp_mixer(struct snd_sof_widget *swidget)
+{
+	struct sof_ipc4_mixer *mixer = swidget->private;
+
+	if (!mixer)
+		return;
+
+	sof_ipc4_free_audio_fmt(&mixer->available_fmt);
+	kfree(swidget->private);
+	swidget->private = NULL;
+}
+
 static void
 sof_ipc4_update_pipeline_mem_usage(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
 				   struct sof_ipc4_base_module_cfg *base_config)
@@ -1746,11 +1786,11 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline, sof_ipc4_widget_free_comp,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL,
 				    NULL, NULL},
-	[snd_soc_dapm_pga] = {sof_ipc4_widget_setup_comp_pga, sof_ipc4_widget_free_comp,
+	[snd_soc_dapm_pga] = {sof_ipc4_widget_setup_comp_pga, sof_ipc4_widget_free_comp_pga,
 			      pga_token_list, ARRAY_SIZE(pga_token_list), NULL,
 			      sof_ipc4_prepare_gain_module,
 			      sof_ipc4_unprepare_generic_module},
-	[snd_soc_dapm_mixer] = {sof_ipc4_widget_setup_comp_mixer, sof_ipc4_widget_free_comp,
+	[snd_soc_dapm_mixer] = {sof_ipc4_widget_setup_comp_mixer, sof_ipc4_widget_free_comp_mixer,
 				mixer_token_list, ARRAY_SIZE(mixer_token_list),
 				NULL, sof_ipc4_prepare_mixer_module,
 				sof_ipc4_unprepare_generic_module},
-- 
2.34.1


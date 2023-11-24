Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6248E7F75D8
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 14:58:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76AEBE8B;
	Fri, 24 Nov 2023 14:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76AEBE8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700834315;
	bh=cRtP+/fvLp2mZi9KFWBi6Hcoa/TFerpYhlbAz1Ua5uY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QbUkKlHzmBmaQIBGsk4owRrG7X1pTRb0BML3AOrKBtfP1mBBpnsC3DekfP0z3WtA2
	 3a3tJ2316t7XOuBb56KEHcsfXvghp6thRfbaM+dBq+gtAVxoPRtViZcijvIg7Ks+qI
	 X9Z11Hv38zG9GCKmcvG87ZllsI7mX+XwIFk2fLtc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 720E1F805EE; Fri, 24 Nov 2023 14:57:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92408F805D3;
	Fri, 24 Nov 2023 14:57:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D082BF805A8; Fri, 24 Nov 2023 14:57:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C2DBF80249
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 14:57:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C2DBF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mVwzq/tU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700834245; x=1732370245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cRtP+/fvLp2mZi9KFWBi6Hcoa/TFerpYhlbAz1Ua5uY=;
  b=mVwzq/tUA/9iCj44ROMYZsS37Wfy8lpWrzc4wYV1y5qkkn3gL6Q/HZHG
   n7yEgC+Z+sUDilZu4enHe8L8HChvUZFSYIUE513wzfj35B57dX6f8AmLv
   ZOdU56/BTm5MkvDbu0lDp93bCWlOK5sITeveMedKfxlKdzqamROLDLMYS
   lHrdMD0mogo01eAdC8JAZ93+XQPEZRfzSo7akNn8IzMf+gp4M8Cn1Ur02
   b6xHJJx/fEUwziY4YRILpyEGWejX42J2BgiBZdcuisZP3r3NM5NJI+v19
   eN/NPXe5AggnZNRCHoVPnqDmYnq1/3ehFK7w9UZYfwkn6Cx3Blvc8yTW4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372590358"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="372590358"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 05:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858397227"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="858397227"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 05:57:12 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: ipc4-topology: Add core_mask in struct
 snd_sof_pipeline
Date: Fri, 24 Nov 2023 15:57:42 +0200
Message-ID: <20231124135743.24674-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
References: <20231124135743.24674-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6VOESRVQ7QHK5Y22DFRFUA6LIYSW4JBZ
X-Message-ID-Hash: 6VOESRVQ7QHK5Y22DFRFUA6LIYSW4JBZ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VOESRVQ7QHK5Y22DFRFUA6LIYSW4JBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

With IPC4, a pipeline may contain multiple modules in the data
processing domain and they can be scheduled to run on different cores.
Add a new field in struct snd_sof_pipeline to keep track of all the
cores that are associated with the modules in the pipeline. Set the
pipeline core mask for IPC3 when initializing the pipeline widget IPC
structure. For IPC4, set the core mark when initializing the pipeline
widget and initializing processing modules in the data processing domain.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 2 ++
 sound/soc/sof/ipc4-topology.c | 9 +++++++++
 sound/soc/sof/sof-audio.h     | 2 ++
 3 files changed, 13 insertions(+)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 7a4932c152a9..8c999e7721f2 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -505,6 +505,7 @@ static int sof_ipc3_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 static int sof_ipc3_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	struct sof_ipc_pipe_new *pipeline;
 	struct snd_sof_widget *comp_swidget;
 	int ret;
@@ -557,6 +558,7 @@ static int sof_ipc3_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 		swidget->dynamic_pipeline_widget);
 
 	swidget->core = pipeline->core;
+	spipe->core_mask |= BIT(pipeline->core);
 
 	return 0;
 
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b24a64377f68..19f36db30979 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -656,6 +656,7 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct sof_ipc4_pipeline *pipeline;
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	int ret;
 
 	pipeline = kzalloc(sizeof(*pipeline), GFP_KERNEL);
@@ -670,6 +671,7 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 	}
 
 	swidget->core = pipeline->core_id;
+	spipe->core_mask |= BIT(pipeline->core_id);
 
 	if (pipeline->use_chain_dma) {
 		dev_dbg(scomp->dev, "Set up chain DMA for %s\n", swidget->widget->name);
@@ -797,6 +799,7 @@ static int sof_ipc4_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
 static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	struct sof_ipc4_src *src;
 	int ret;
 
@@ -819,6 +822,8 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
 		goto err;
 	}
 
+	spipe->core_mask |= BIT(swidget->core);
+
 	dev_dbg(scomp->dev, "SRC sink rate %d\n", src->sink_rate);
 
 	ret = sof_ipc4_widget_setup_msg(swidget, &src->msg);
@@ -864,6 +869,7 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct sof_ipc4_fw_module *fw_module;
+	struct snd_sof_pipeline *spipe = swidget->spipe;
 	struct sof_ipc4_process *process;
 	void *cfg;
 	int ret;
@@ -920,6 +926,9 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
 
 	sof_ipc4_widget_update_kcontrol_module_id(swidget);
 
+	/* set pipeline core mask to keep track of the core the module is scheduled to run on */
+	spipe->core_mask |= BIT(swidget->core);
+
 	return 0;
 free_base_cfg_ext:
 	kfree(process->base_config_ext);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 99c940b22538..8874ee5f557f 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -481,6 +481,7 @@ struct snd_sof_widget {
  * @paused_count: Count of number of PCM's that have started and have currently paused this
 		  pipeline
  * @complete: flag used to indicate that pipeline set up is complete.
+ * @core_mask: Mask containing target cores for all modules in the pipeline
  * @list: List item in sdev pipeline_list
  */
 struct snd_sof_pipeline {
@@ -488,6 +489,7 @@ struct snd_sof_pipeline {
 	int started_count;
 	int paused_count;
 	int complete;
+	unsigned long core_mask;
 	struct list_head list;
 };
 
-- 
2.42.1


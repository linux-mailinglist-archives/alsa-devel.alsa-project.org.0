Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6D045771B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 20:37:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CB2717B0;
	Fri, 19 Nov 2021 20:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CB2717B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637350663;
	bh=l2qNrLP69aXSBZWnHQC/trQxGn1D3zLn5A2kuL3uqyg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UcY8uw9FUG0+iO4Ji2CLQ+K04n/7bKY48lRWppCkhnAVyaJzQFotRXutcwDCDrdBb
	 b6zIKvu4yCtMbGBnsrM7siuKcKcm0Tce/OgEKoFpxApLZxDLplw34Zix/aU17PG1iV
	 09sSfPkjLAr/yEyJQ6O/SX3+XmiZQOnwFDmLsq2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D7CFF8051D;
	Fri, 19 Nov 2021 20:34:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8831F8051B; Fri, 19 Nov 2021 20:34:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A0CF80516
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 20:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A0CF80516
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="234716037"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="234716037"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 11:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="473651304"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 19 Nov 2021 11:34:28 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 09/10] ASoC: SOF: add support for dynamic pipelines with
 multi-core
Date: Fri, 19 Nov 2021 21:26:20 +0200
Message-Id: <20211119192621.4096077-10-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
References: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

This patch adds support for dynamic pipelines with multi-core
by using the platform-specific core_get/put() ops to
power up/down a core when a widget is set up/freed.

Along with this, a few redundant functions are removed:
1. sof_pipeline_core_enable() is no longer needed as the
pipeline core will be set up when the pipeline widget
is set up
2. sof_core_enable() is replaced with snd_sof_core_get()
4. core_power_up/down() DSP ops are deprecated and replaced with
core get/put ops.
5. Core power down in sof_widget_unload() during topology
removal is also removed as it is not really needed. For dynamic
pipelines, the cores will be powered off when they are not used.
For static pipelines, the cores will be powered off in the device
remove callback.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/apl.c |  4 +-
 sound/soc/sof/intel/cnl.c |  4 +-
 sound/soc/sof/intel/icl.c |  4 +-
 sound/soc/sof/intel/tgl.c |  4 +-
 sound/soc/sof/ops.h       | 32 +--------------
 sound/soc/sof/sof-audio.c | 67 +++++++++++++++++++++++++------
 sound/soc/sof/sof-audio.h |  2 -
 sound/soc/sof/sof-priv.h  |  4 --
 sound/soc/sof/topology.c  | 83 ---------------------------------------
 9 files changed, 59 insertions(+), 145 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 569668b2186f..1baf0fddeb3d 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -101,9 +101,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	/* parse platform specific extended manifest */
 	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
 
-	/* dsp core power up/down */
-	.core_power_up = hda_dsp_enable_core,
-	.core_power_down = hda_dsp_core_reset_power_down,
+	/* dsp core get/put */
 	.core_get = hda_dsp_core_get,
 
 	/* trace callback */
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index be6b6500b907..d455272bfc8e 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -303,9 +303,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	/* parse platform specific extended manifest */
 	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
 
-	/* dsp core power up/down */
-	.core_power_up = hda_dsp_enable_core,
-	.core_power_down = hda_dsp_core_reset_power_down,
+	/* dsp core get/put */
 	.core_get = hda_dsp_core_get,
 
 	/* firmware run */
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index e3472868f49a..6c5422157ec8 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -97,9 +97,7 @@ const struct snd_sof_dsp_ops sof_icl_ops = {
 	/* parse platform specific extended manifest */
 	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
 
-	/* dsp core power up/down */
-	.core_power_up = hda_dsp_enable_core,
-	.core_power_down = hda_dsp_core_reset_power_down,
+	/* dsp core get/put */
 	.core_get = hda_dsp_core_get,
 
 	/* firmware run */
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 51011b0b8c11..237e92e790b7 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -133,9 +133,7 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 	/* parse platform specific extended manifest */
 	.parse_platform_ext_manifest = hda_dsp_ext_man_get_cavs_config_data,
 
-	/* dsp core power up/down */
-	.core_power_up = hda_dsp_enable_core,
-	.core_power_down = hda_dsp_core_reset_power_down,
+	/* dsp core get/put */
 	.core_get = tgl_dsp_core_get,
 	.core_put = tgl_dsp_core_put,
 
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 61dc2768b000..a0648a13e3eb 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -72,37 +72,7 @@ static inline int snd_sof_dsp_reset(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-/* dsp core power up/power down */
-static inline int snd_sof_dsp_core_power_up(struct snd_sof_dev *sdev,
-					    unsigned int core_mask)
-{
-	int ret = 0;
-
-	core_mask &= ~sdev->enabled_cores_mask;
-	if (sof_ops(sdev)->core_power_up && core_mask) {
-		ret = sof_ops(sdev)->core_power_up(sdev, core_mask);
-		if (!ret)
-			sdev->enabled_cores_mask |= core_mask;
-	}
-
-	return ret;
-}
-
-static inline int snd_sof_dsp_core_power_down(struct snd_sof_dev *sdev,
-					      unsigned int core_mask)
-{
-	int ret = 0;
-
-	core_mask &= sdev->enabled_cores_mask;
-	if (sof_ops(sdev)->core_power_down && core_mask) {
-		ret = sof_ops(sdev)->core_power_down(sdev, core_mask);
-		if (!ret)
-			sdev->enabled_cores_mask &= ~core_mask;
-	}
-
-	return ret;
-}
-
+/* dsp core get/put */
 static inline int snd_sof_dsp_core_get(struct snd_sof_dev *sdev, int core)
 {
 	if (core > sdev->num_cores - 1) {
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 669d5c924f6b..0f2566f7c094 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -106,7 +106,7 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 		.id = swidget->comp_id,
 	};
 	struct sof_ipc_reply reply;
-	int ret;
+	int ret, ret1, core;
 
 	if (!swidget->private)
 		return 0;
@@ -115,10 +115,17 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (--swidget->use_count)
 		return 0;
 
+	core = swidget->core;
+
 	switch (swidget->id) {
 	case snd_soc_dapm_scheduler:
+	{
+		const struct sof_ipc_pipe_new *pipeline = swidget->private;
+
+		core = pipeline->core;
 		ipc_free.hdr.cmd |= SOF_IPC_TPLG_PIPE_FREE;
 		break;
+	}
 	case snd_soc_dapm_buffer:
 		ipc_free.hdr.cmd |= SOF_IPC_TPLG_BUFFER_FREE;
 		break;
@@ -127,20 +134,32 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 		break;
 	}
 
+	/* continue to disable core even if IPC fails */
 	ret = sof_ipc_tx_message(sdev->ipc, ipc_free.hdr.cmd, &ipc_free, sizeof(ipc_free),
 				 &reply, sizeof(reply));
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(sdev->dev, "error: failed to free widget %s\n", swidget->widget->name);
-		swidget->use_count++;
-		return ret;
+
+	/*
+	 * disable widget core. continue to route setup status and complete flag
+	 * even if this fails and return the appropriate error
+	 */
+	ret1 = snd_sof_dsp_core_put(sdev, core);
+	if (ret1 < 0) {
+		dev_err(sdev->dev, "error: failed to disable target core: %d for widget %s\n",
+			core, swidget->widget->name);
+		if (!ret)
+			ret = ret1;
 	}
 
 	/* reset route setup status for all routes that contain this widget */
 	sof_reset_route_setup_status(sdev, swidget);
 	swidget->complete = 0;
-	dev_dbg(sdev->dev, "widget %s freed\n", swidget->widget->name);
 
-	return 0;
+	if (!ret)
+		dev_dbg(sdev->dev, "widget %s freed\n", swidget->widget->name);
+
+	return ret;
 }
 EXPORT_SYMBOL(sof_widget_free);
 
@@ -153,6 +172,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	struct snd_sof_dai *dai;
 	size_t ipc_size;
 	int ret;
+	int core;
 
 	/* skip if there is no private data */
 	if (!swidget->private)
@@ -162,10 +182,18 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (++swidget->use_count > 1)
 		return 0;
 
-	ret = sof_pipeline_core_enable(sdev, swidget);
+	/* set core ID */
+	core = swidget->core;
+	if (swidget->id == snd_soc_dapm_scheduler) {
+		pipeline = swidget->private;
+		core = pipeline->core;
+	}
+
+	/* enable widget core */
+	ret = snd_sof_dsp_core_get(sdev, core);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to enable target core: %d for widget %s\n",
-			ret, swidget->widget->name);
+		dev_err(sdev->dev, "error: failed to enable target core for widget %s\n",
+			swidget->widget->name);
 		goto use_count_dec;
 	}
 
@@ -174,8 +202,10 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	case snd_soc_dapm_dai_out:
 		ipc_size = sizeof(struct sof_ipc_comp_dai) + sizeof(struct sof_ipc_comp_ext);
 		comp = kzalloc(ipc_size, GFP_KERNEL);
-		if (!comp)
-			return -ENOMEM;
+		if (!comp) {
+			ret = -ENOMEM;
+			goto core_put;
+		}
 
 		dai = swidget->private;
 		dai->configured = false;
@@ -190,13 +220,18 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed to load widget %s\n",
 				swidget->widget->name);
-			goto use_count_dec;
+			goto core_put;
 		}
 
 		ret = sof_dai_config_setup(sdev, dai);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed to load dai config for DAI %s\n",
 				swidget->widget->name);
+
+			/*
+			 * widget use_count and core ref_count will both be decremented by
+			 * sof_widget_free()
+			 */
 			sof_widget_free(sdev, swidget);
 			return ret;
 		}
@@ -214,7 +249,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	}
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to load widget %s\n", swidget->widget->name);
-		goto use_count_dec;
+		goto core_put;
 	}
 
 	/* restore kcontrols for widget */
@@ -222,6 +257,10 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to restore kcontrols for widget %s\n",
 			swidget->widget->name);
+		/*
+		 * widget use_count and core ref_count will both be decremented by
+		 * sof_widget_free()
+		 */
 		sof_widget_free(sdev, swidget);
 		return ret;
 	}
@@ -230,6 +269,8 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 
 	return 0;
 
+core_put:
+	snd_sof_dsp_core_put(sdev, core);
 use_count_dec:
 	swidget->use_count--;
 	return ret;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 6c591b7a531c..389d56ac3aba 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -184,8 +184,6 @@ void snd_sof_control_notify(struct snd_sof_dev *sdev,
 int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file);
 int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
 			      struct snd_sof_widget *swidget);
-int sof_pipeline_core_enable(struct snd_sof_dev *sdev,
-			     const struct snd_sof_widget *swidget);
 
 /*
  * Stream IPC
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index f7c86a72ac10..a9c5197617f1 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -130,10 +130,6 @@ struct snd_sof_dsp_ops {
 	int (*run)(struct snd_sof_dev *sof_dev); /* mandatory */
 	int (*stall)(struct snd_sof_dev *sof_dev, unsigned int core_mask); /* optional */
 	int (*reset)(struct snd_sof_dev *sof_dev); /* optional */
-	int (*core_power_up)(struct snd_sof_dev *sof_dev,
-			     unsigned int core_mask); /* optional */
-	int (*core_power_down)(struct snd_sof_dev *sof_dev,
-			       unsigned int core_mask); /* optional */
 	int (*core_get)(struct snd_sof_dev *sof_dev, int core); /* optional */
 	int (*core_put)(struct snd_sof_dev *sof_dev, int core); /* optional */
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3a49d7910326..63948bb30710 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1346,69 +1346,6 @@ static int sof_control_unload(struct snd_soc_component *scomp,
  * DAI Topology
  */
 
-/* Static DSP core power management so far, should be extended in the future */
-static int sof_core_enable(struct snd_sof_dev *sdev, int core)
-{
-	struct sof_ipc_pm_core_config pm_core_config = {
-		.hdr = {
-			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
-			.size = sizeof(pm_core_config),
-		},
-		.enable_mask = sdev->enabled_cores_mask | BIT(core),
-	};
-	int ret;
-
-	if (sdev->enabled_cores_mask & BIT(core))
-		return 0;
-
-	/* power up the core if it is host managed */
-	ret = snd_sof_dsp_core_power_up(sdev, BIT(core));
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: %d powering up core %d\n",
-			ret, core);
-		return ret;
-	}
-
-	/* Now notify DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, pm_core_config.hdr.cmd,
-				 &pm_core_config, sizeof(pm_core_config),
-				 &pm_core_config, sizeof(pm_core_config));
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: core %d enable ipc failure %d\n",
-			core, ret);
-		goto err;
-	}
-	return ret;
-err:
-	/* power down core if it is host managed and return the original error if this fails too */
-	if (snd_sof_dsp_core_power_down(sdev, BIT(core)) < 0)
-		dev_err(sdev->dev, "error: powering down core %d\n", core);
-
-	return ret;
-}
-
-int sof_pipeline_core_enable(struct snd_sof_dev *sdev,
-			     const struct snd_sof_widget *swidget)
-{
-	const struct sof_ipc_pipe_new *pipeline;
-	int ret;
-
-	if (swidget->id == snd_soc_dapm_scheduler) {
-		pipeline = swidget->private;
-	} else {
-		pipeline = snd_sof_pipeline_find(sdev, swidget->pipeline_id);
-		if (!pipeline)
-			return -ENOENT;
-	}
-
-	/* First enable the pipeline core */
-	ret = sof_core_enable(sdev, pipeline->core);
-	if (ret < 0)
-		return ret;
-
-	return sof_core_enable(sdev, swidget->core);
-}
-
 static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 				  struct snd_soc_dapm_widget *w,
 				  struct snd_soc_tplg_dapm_widget *tw,
@@ -2485,10 +2422,8 @@ static int sof_route_unload(struct snd_soc_component *scomp,
 static int sof_widget_unload(struct snd_soc_component *scomp,
 			     struct snd_soc_dobj *dobj)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct snd_kcontrol_new *kc;
 	struct snd_soc_dapm_widget *widget;
-	struct sof_ipc_pipe_new *pipeline;
 	struct snd_sof_control *scontrol;
 	struct snd_sof_widget *swidget;
 	struct soc_mixer_control *sm;
@@ -2515,24 +2450,6 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 			list_del(&dai->list);
 		}
 		break;
-	case snd_soc_dapm_scheduler:
-
-		/* power down the pipeline schedule core */
-		pipeline = swidget->private;
-
-		/*
-		 * Runtime PM should still function normally if topology loading fails and
-		 * it's components are unloaded. Do not power down the primary core so that the
-		 * CTX_SAVE IPC can succeed during runtime suspend.
-		 */
-		if (pipeline->core == SOF_DSP_PRIMARY_CORE)
-			break;
-
-		ret = snd_sof_dsp_core_power_down(sdev, 1 << pipeline->core);
-		if (ret < 0)
-			dev_err(scomp->dev, "error: powering down pipeline schedule core %d\n",
-				pipeline->core);
-		break;
 	default:
 		break;
 	}
-- 
2.33.0


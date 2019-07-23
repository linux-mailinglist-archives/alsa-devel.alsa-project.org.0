Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B125771B00
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 17:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B26D18C1;
	Tue, 23 Jul 2019 17:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B26D18C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563894150;
	bh=rbdzojcgsISBJClC/oisaA1pV9jfbz2A7ISrE/X7ZPg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V82AHHvVLA3iB+iUZDjc8Ss2iAurzmNVYcHK6V7trGVIMkmDLIBGGjjk4C0ihC6WE
	 3i8w3cGBQg5rqGcCvqImpu96n0b6eJKLIrhq96aeK5zsPWB6bB6yTvgkqxBabm93Qr
	 9a4G+ivVJW9uWa5tJUC0ZUYuYIDMZwxneWdK/X1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06CF5F80481;
	Tue, 23 Jul 2019 16:59:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B564F8049B; Tue, 23 Jul 2019 16:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7847EF8044B
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 16:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7847EF8044B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 07:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="171977220"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 23 Jul 2019 07:59:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 23 Jul 2019 16:58:51 +0200
Message-Id: <20190723145854.8527-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723145854.8527-1-cezary.rojewski@intel.com>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [RESEND PATCH v2 4/7] ASoC: Intel: Skylake: Remove
	memory available check
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Current memory availability check is a stub, while actual memory
management takes place in firmware. Leave this task to firmware entirely
and remove redundant code.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 59 --------------------------
 sound/soc/intel/skylake/skl.h          |  6 ---
 2 files changed, 65 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 2af311150543..53a024c0464d 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -109,49 +109,6 @@ static int is_skl_dsp_widget_type(struct snd_soc_dapm_widget *w,
 	}
 }
 
-/*
- * Each pipelines needs memory to be allocated. Check if we have free memory
- * from available pool.
- */
-static bool skl_is_pipe_mem_avail(struct skl_dev *skl,
-				struct skl_module_cfg *mconfig)
-{
-	if (skl->resource.mem + mconfig->pipe->memory_pages >
-				skl->resource.max_mem) {
-		dev_err(skl->dev,
-				"%s: module_id %d instance %d\n", __func__,
-				mconfig->id.module_id,
-				mconfig->id.instance_id);
-		dev_err(skl->dev,
-				"exceeds ppl memory available %d mem %d\n",
-				skl->resource.max_mem, skl->resource.mem);
-		return false;
-	} else {
-		return true;
-	}
-}
-
-/*
- * Add the mem to the mem pool. This is freed when pipe is deleted.
- * Note: DSP does actual memory management we only keep track for complete
- * pool
- */
-static void skl_tplg_alloc_pipe_mem(struct skl_dev *skl,
-				struct skl_module_cfg *mconfig)
-{
-	skl->resource.mem += mconfig->pipe->memory_pages;
-}
-
-/*
- * Free the memory when tearing down
- */
-static void
-skl_tplg_free_pipe_mem(struct skl_dev *skl, struct skl_module_cfg *mconfig)
-{
-	skl->resource.mem -= mconfig->pipe->memory_pages;
-}
-
-
 static void skl_dump_mconfig(struct skl_dev *skl, struct skl_module_cfg *mcfg)
 {
 	struct skl_module_iface *iface = &mcfg->module->formats[0];
@@ -681,7 +638,6 @@ skl_tplg_get_pipe_config(struct skl_dev *skl, struct skl_module_cfg *mconfig)
 /*
  * Mixer module represents a pipeline. So in the Pre-PMU event of mixer we
  * need create the pipeline. So we do following:
- *   - check the resources
  *   - Create the pipeline
  *   - Initialize the modules in pipeline
  *   - finally bind all modules together
@@ -700,9 +656,6 @@ static int skl_tplg_mixer_dapm_pre_pmu_event(struct snd_soc_dapm_widget *w,
 	if (ret < 0)
 		return ret;
 
-	if (!skl_is_pipe_mem_avail(skl, mconfig))
-		return -ENOMEM;
-
 	/*
 	 * Create a list of modules for pipe.
 	 * This list contains modules from source to sink
@@ -711,8 +664,6 @@ static int skl_tplg_mixer_dapm_pre_pmu_event(struct snd_soc_dapm_widget *w,
 	if (ret < 0)
 		return ret;
 
-	skl_tplg_alloc_pipe_mem(skl, mconfig);
-
 	/* Init all pipe modules from source to sink */
 	ret = skl_tplg_init_pipe_modules(skl, s_pipe);
 	if (ret < 0)
@@ -1207,7 +1158,6 @@ static int skl_tplg_mixer_dapm_pre_pmd_event(struct snd_soc_dapm_widget *w,
 
 /*
  * in the Post-PMD event of mixer we need to do following:
- *   - Free the mem used
  *   - Unbind the modules within the pipeline
  *   - Delete the pipeline (modules are not required to be explicitly
  *     deleted, pipeline delete is enough here
@@ -1224,8 +1174,6 @@ static int skl_tplg_mixer_dapm_post_pmd_event(struct snd_soc_dapm_widget *w,
 	if (s_pipe->state == SKL_PIPE_INVALID)
 		return -EINVAL;
 
-	skl_tplg_free_pipe_mem(skl, mconfig);
-
 	list_for_each_entry(w_module, &s_pipe->w_list, node) {
 		if (list_empty(&skl->bind_list))
 			break;
@@ -2921,8 +2869,6 @@ void skl_cleanup_resources(struct skl_dev *skl)
 	if (!card || !card->instantiated)
 		return;
 
-	skl->resource.mem = 0;
-
 	list_for_each_entry(w, &card->widgets, list) {
 		if (is_skl_dsp_widget_type(w, skl->dev) && w->priv != NULL)
 			skl_clear_pin_config(soc_component, w);
@@ -3619,9 +3565,6 @@ static void skl_tplg_set_pipe_type(struct skl_dev *skl, struct skl_pipe *pipe)
 		pipe->passthru = false;
 }
 
-/* This will be read from topology manifest, currently defined here */
-#define SKL_FW_MAX_MEM 1000000
-
 /*
  * SKL topology init routine
  */
@@ -3656,8 +3599,6 @@ int skl_tplg_init(struct snd_soc_component *component, struct hdac_bus *bus)
 		return -EINVAL;
 	}
 
-	skl->resource.max_mem = SKL_FW_MAX_MEM;
-
 	skl->tplg = fw;
 	ret = skl_tplg_create_pipe_widget_list(component);
 	if (ret < 0)
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 21c33c1af934..600a61f79b0a 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -41,11 +41,6 @@
 #define AZX_VS_EM2_DUM			BIT(23)
 #define AZX_REG_VS_EM2_L1SEN		BIT(13)
 
-struct skl_dsp_resource {
-	u32 max_mem;
-	u32 mem;
-};
-
 struct skl_debug;
 
 struct skl_astate_param {
@@ -75,7 +70,6 @@ struct skl_dev {
 
 	struct nhlt_acpi_table *nhlt; /* nhlt ptr */
 
-	struct skl_dsp_resource resource;
 	struct list_head ppl_list;
 	struct list_head bind_list;
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

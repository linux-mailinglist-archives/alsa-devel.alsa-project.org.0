Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6085FDAC
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 22:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BA81695;
	Thu,  4 Jul 2019 22:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BA81695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562270737;
	bh=TUb1qPvPChsWZxLA9p+s/s6xP9dWyylPLc974z9pxZ4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=euLgZjzpUG1ahLiQU2DteECEtRzSfbraLQLLbHQNDgOoHgr7vgWWEe1rvpgNLPGv7
	 y0ZTLcybNVuamr4yLGwqKvIHwMYXC8a9qH4KF7nCex6tF8Usd/0j3S/8lT9Dw6qFdN
	 l5pkOH+qBOL2y2wg/j2oszLGn4t8gnxRrgdoA3kM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B0A3F80141;
	Thu,  4 Jul 2019 22:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0DADF80141; Thu,  4 Jul 2019 22:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_35,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0593DF8013F
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 22:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0593DF8013F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 13:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,452,1557212400"; d="scan'208";a="166329288"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jul 2019 13:02:36 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  4 Jul 2019 22:01:02 +0200
Message-Id: <20190704200106.11289-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190704200106.11289-1-cezary.rojewski@intel.com>
References: <20190704200106.11289-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 3/7] ASoC: Intel: Skylake: Remove MCPS
	available check
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

The entire logic for MCPS calculation and DSP scheduling is found
within DSP firmware. Currently driver implements simplistic, inaccurate
logic itself which may prevent pipeline creation despite firmware being
completely fine its parameters.

Remove that logic and leave the MCPS calculation to DSP alone.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 67 +-------------------------
 sound/soc/intel/skylake/skl.h          |  2 -
 2 files changed, 1 insertion(+), 68 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index abf860109607..2af311150543 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -142,54 +142,6 @@ static void skl_tplg_alloc_pipe_mem(struct skl_dev *skl,
 	skl->resource.mem += mconfig->pipe->memory_pages;
 }
 
-/*
- * Pipeline needs needs DSP CPU resources for computation, this is
- * quantified in MCPS (Million Clocks Per Second) required for module/pipe
- *
- * Each pipelines needs mcps to be allocated. Check if we have mcps for this
- * pipe.
- */
-
-static bool skl_is_pipe_mcps_avail(struct skl_dev *skl,
-				struct skl_module_cfg *mconfig)
-{
-	u8 res_idx = mconfig->res_idx;
-	struct skl_module_res *res = &mconfig->module->resources[res_idx];
-
-	if (skl->resource.mcps + res->cps > skl->resource.max_mcps) {
-		dev_err(skl->dev,
-			"%s: module_id %d instance %d\n", __func__,
-			mconfig->id.module_id, mconfig->id.instance_id);
-		dev_err(skl->dev,
-			"exceeds ppl mcps available %d > mem %d\n",
-			skl->resource.max_mcps, skl->resource.mcps);
-		return false;
-	} else {
-		return true;
-	}
-}
-
-static void skl_tplg_alloc_pipe_mcps(struct skl_dev *skl,
-				struct skl_module_cfg *mconfig)
-{
-	u8 res_idx = mconfig->res_idx;
-	struct skl_module_res *res = &mconfig->module->resources[res_idx];
-
-	skl->resource.mcps += res->cps;
-}
-
-/*
- * Free the mcps when tearing down
- */
-static void
-skl_tplg_free_pipe_mcps(struct skl_dev *skl, struct skl_module_cfg *mconfig)
-{
-	u8 res_idx = mconfig->res_idx;
-	struct skl_module_res *res = &mconfig->module->resources[res_idx];
-
-	skl->resource.mcps -= res->cps;
-}
-
 /*
  * Free the memory when tearing down
  */
@@ -582,10 +534,6 @@ skl_tplg_init_pipe_modules(struct skl_dev *skl, struct skl_pipe *pipe)
 		mconfig->fmt_idx = mconfig->mod_cfg[cfg_idx].fmt_idx;
 		mconfig->res_idx = mconfig->mod_cfg[cfg_idx].res_idx;
 
-		/* check resource available */
-		if (!skl_is_pipe_mcps_avail(skl, mconfig))
-			return -ENOMEM;
-
 		if (mconfig->module->loadable && skl->dsp->fw_ops.load_mod) {
 			ret = skl->dsp->fw_ops.load_mod(skl->dsp,
 				mconfig->id.module_id, mconfig->guid);
@@ -627,7 +575,7 @@ skl_tplg_init_pipe_modules(struct skl_dev *skl, struct skl_pipe *pipe)
 			skl_put_pvt_id(skl, uuid_mod, &mconfig->id.pvt_id);
 			goto err;
 		}
-		skl_tplg_alloc_pipe_mcps(skl, mconfig);
+
 		ret = skl_tplg_set_module_params(w, skl);
 		if (ret < 0)
 			goto err;
@@ -752,10 +700,6 @@ static int skl_tplg_mixer_dapm_pre_pmu_event(struct snd_soc_dapm_widget *w,
 	if (ret < 0)
 		return ret;
 
-	/* check resource available */
-	if (!skl_is_pipe_mcps_avail(skl, mconfig))
-		return -EBUSY;
-
 	if (!skl_is_pipe_mem_avail(skl, mconfig))
 		return -ENOMEM;
 
@@ -768,7 +712,6 @@ static int skl_tplg_mixer_dapm_pre_pmu_event(struct snd_soc_dapm_widget *w,
 		return ret;
 
 	skl_tplg_alloc_pipe_mem(skl, mconfig);
-	skl_tplg_alloc_pipe_mcps(skl, mconfig);
 
 	/* Init all pipe modules from source to sink */
 	ret = skl_tplg_init_pipe_modules(skl, s_pipe);
@@ -1264,7 +1207,6 @@ static int skl_tplg_mixer_dapm_pre_pmd_event(struct snd_soc_dapm_widget *w,
 
 /*
  * in the Post-PMD event of mixer we need to do following:
- *   - Free the mcps used
  *   - Free the mem used
  *   - Unbind the modules within the pipeline
  *   - Delete the pipeline (modules are not required to be explicitly
@@ -1282,7 +1224,6 @@ static int skl_tplg_mixer_dapm_post_pmd_event(struct snd_soc_dapm_widget *w,
 	if (s_pipe->state == SKL_PIPE_INVALID)
 		return -EINVAL;
 
-	skl_tplg_free_pipe_mcps(skl, mconfig);
 	skl_tplg_free_pipe_mem(skl, mconfig);
 
 	list_for_each_entry(w_module, &s_pipe->w_list, node) {
@@ -1317,8 +1258,6 @@ static int skl_tplg_mixer_dapm_post_pmd_event(struct snd_soc_dapm_widget *w,
 	list_for_each_entry(w_module, &s_pipe->w_list, node) {
 		dst_module = w_module->w->priv;
 
-		if (mconfig->m_state >= SKL_MODULE_INIT_DONE)
-			skl_tplg_free_pipe_mcps(skl, dst_module);
 		if (src_module == NULL) {
 			src_module = dst_module;
 			continue;
@@ -1340,7 +1279,6 @@ static int skl_tplg_mixer_dapm_post_pmd_event(struct snd_soc_dapm_widget *w,
 
 /*
  * in the Post-PMD event of PGA we need to do following:
- *   - Free the mcps used
  *   - Stop the pipeline
  *   - In source pipe is connected, unbind with source pipelines
  */
@@ -2984,7 +2922,6 @@ void skl_cleanup_resources(struct skl_dev *skl)
 		return;
 
 	skl->resource.mem = 0;
-	skl->resource.mcps = 0;
 
 	list_for_each_entry(w, &card->widgets, list) {
 		if (is_skl_dsp_widget_type(w, skl->dev) && w->priv != NULL)
@@ -3683,7 +3620,6 @@ static void skl_tplg_set_pipe_type(struct skl_dev *skl, struct skl_pipe *pipe)
 }
 
 /* This will be read from topology manifest, currently defined here */
-#define SKL_MAX_MCPS 30000000
 #define SKL_FW_MAX_MEM 1000000
 
 /*
@@ -3720,7 +3656,6 @@ int skl_tplg_init(struct snd_soc_component *component, struct hdac_bus *bus)
 		return -EINVAL;
 	}
 
-	skl->resource.max_mcps = SKL_MAX_MCPS;
 	skl->resource.max_mem = SKL_FW_MAX_MEM;
 
 	skl->tplg = fw;
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 0d281f9e9128..9c5858c48f6f 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -41,9 +41,7 @@
 #define AZX_REG_VS_EM2_L1SEN		BIT(13)
 
 struct skl_dsp_resource {
-	u32 max_mcps;
 	u32 max_mem;
-	u32 mcps;
 	u32 mem;
 };
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

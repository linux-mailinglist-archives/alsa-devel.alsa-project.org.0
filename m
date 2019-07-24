Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72C737C8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 21:23:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6391B193A;
	Wed, 24 Jul 2019 21:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6391B193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563996183;
	bh=f0mPVcnfGQYx0M/mwxcRquCWcjhwb/HcqG/0eQ7x9mE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IzqAhjU7ErGzObuvWUc4iOBOoBl9oaO7nzqcSKxMU10Le5pi2eJ+fPJ2Kk1vSTSu+
	 FgemDMYwtR3liZwVqrlHphlqIBADavRaVoamSlUsluaqZMO3OrAYIEeutRwgvqQsGN
	 SgSPp46KS5wXPjpcI1/VGV22RpEMBadgqoCC82I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF737F80506;
	Wed, 24 Jul 2019 21:18:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 322B6F803D5; Wed, 24 Jul 2019 21:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_35,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 076DAF803D1
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 21:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 076DAF803D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="faNHzSGs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=j9aXXnE0lgUgC0n3HLBR5IujbExl6PlvVCGk7a1C9xA=; b=faNHzSGsQKYs
 OfImwBCRh3oC2ONFqraSy/FXGpnWjk+eNgmaKvaHlON68Rg2ijXRcRr4iyLa8ex+VhayIpVJDwnke
 mO4hCjqEy9tK9QGdX5aZ18KfmkCWU+M0HjoH4Xc2TbhLFQtCc5KVv2Ki1h0N/fYbxAxya40qR6O1E
 dikak=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqMls-0008Vs-90; Wed, 24 Jul 2019 19:17:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 840892742BC5; Wed, 24 Jul 2019 20:17:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20190723145854.8527-4-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190724191751.840892742BC5@ypsilon.sirena.org.uk>
Date: Wed, 24 Jul 2019 20:17:51 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: Intel: Skylake: Remove MCPS available
	check" to the asoc tree
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

The patch

   ASoC: Intel: Skylake: Remove MCPS available check

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f2a167ca681d21aa46f127032cc005879c328823 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 23 Jul 2019 16:58:50 +0200
Subject: [PATCH] ASoC: Intel: Skylake: Remove MCPS available check

The entire logic for MCPS calculation and DSP scheduling is found
within DSP firmware. Currently driver implements simplistic, inaccurate
logic itself which may prevent pipeline creation despite firmware being
completely fine its parameters.

Remove that logic and leave the MCPS calculation to DSP alone.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20190723145854.8527-4-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
index d3d84f4125d9..21c33c1af934 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -42,9 +42,7 @@
 #define AZX_REG_VS_EM2_L1SEN		BIT(13)
 
 struct skl_dsp_resource {
-	u32 max_mcps;
 	u32 max_mem;
-	u32 mcps;
 	u32 mem;
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

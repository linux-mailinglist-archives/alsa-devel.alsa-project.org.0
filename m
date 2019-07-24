Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A686F737C4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 21:22:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4281B1941;
	Wed, 24 Jul 2019 21:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4281B1941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563996138;
	bh=CUt5stpbt6kBg5AAxJIIO19cuCoBTCm7tY3xBw/JbZo=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nLt0jWHjMCC8rzRYpisRh7tLdLtEK1r/ZYdFez43KAezhJad2Kp6TKeHXD9pjtTT+
	 Qr+U1l34JkEUHtZ9MG6OlGdoo0k9ykJ1GPYaF9n4UW1UyvU5ckTFzpxK9CwW8Iyk5/
	 +bVyiZKXYNZ/9Ra81eU2n3Xmn1qRab/D3kkYIsH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11830F804CC;
	Wed, 24 Jul 2019 21:18:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12F07F8048F; Wed, 24 Jul 2019 21:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA046F803D7
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 21:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA046F803D7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="voPjc/k3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=blikKFn3yVBa+FE6B2N+TzTfMs74Lq7gcL5CAKkxG5A=; b=voPjc/k3Syzs
 KBJuP75UGXVJRS9W1unw3vvDh8iWg0EGnJtnXd1jcyEG8uGULHXv1kSHA+wK1UucmEq8g/mUFlfeT
 jq8bXFlOW51kGshA2oUNPy69GaPAgJPjmqAlkxr1EMbMshNn7FTEaHFK7IgmZBZlIQSROGMQ/yAEg
 O6mzY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqMlr-0008Vn-PQ; Wed, 24 Jul 2019 19:17:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 446EE2742BAE; Wed, 24 Jul 2019 20:17:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20190723145854.8527-5-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190724191751.446EE2742BAE@ypsilon.sirena.org.uk>
Date: Wed, 24 Jul 2019 20:17:51 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: Intel: Skylake: Remove memory available
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

   ASoC: Intel: Skylake: Remove memory available check

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

From e5c29dc5221c328b6e54c5b2aba1feca4003c051 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 23 Jul 2019 16:58:51 +0200
Subject: [PATCH] ASoC: Intel: Skylake: Remove memory available check

Current memory availability check is a stub, while actual memory
management takes place in firmware. Leave this task to firmware entirely
and remove redundant code.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20190723145854.8527-5-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

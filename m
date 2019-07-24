Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A079737BD
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 21:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F8518F0;
	Wed, 24 Jul 2019 21:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F8518F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563996029;
	bh=b8qsaBSb4sby8QVJVkCPV5nHrwd9fqF+OZlBSWBprr8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZWP6/Vj53zMNU/gHVr6Bn4vSYFdQ8IEOqyt45vfHBJ6ZbRFA7vu4/n6OKn3M5g3e9
	 4VJeiHG1rpKSZ7HF7SyamWt56SD1u0+Ks1ywJiSSpjYo+22wuuyTiNq65JrBeYFX26
	 wmU5GHU3xvYa7Hm7WV1eDkmFFHEn0cmnd7sVADdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 559ACF803D1;
	Wed, 24 Jul 2019 21:18:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00B0BF8026F; Wed, 24 Jul 2019 21:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82E82F800E8
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 21:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82E82F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qV8mNaTZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=JPt8nOw1RXsnkzAwfF545hODc1cYfJwe8EczzplZnQU=; b=qV8mNaTZuVuC
 BtEs4AXtFutYIMkmo+AdxXB09azvdhvjqWMFEqCHhIVpUuE+i91eYIK+j8W9ZxAXo/435cg1jA7+z
 r6y+b85sJz+KtgHjfec+y45B/Qjn/zTHsooxZhL3+Kr7YZ4/gBW0265viQLuTPGOFZRHiT3JRyHXH
 dC1Rk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqMlr-0008Vj-H5; Wed, 24 Jul 2019 19:17:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C64902742B60; Wed, 24 Jul 2019 20:17:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20190723145854.8527-7-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190724191750.C64902742B60@ypsilon.sirena.org.uk>
Date: Wed, 24 Jul 2019 20:17:50 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: Intel: Skylake: Make MCPS and CPS
	params obsolete" to the asoc tree
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

   ASoC: Intel: Skylake: Make MCPS and CPS params obsolete

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

From 84b71067ea840fadee32588aa3967d0d8c4e0b9a Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 23 Jul 2019 16:58:53 +0200
Subject: [PATCH] ASoC: Intel: Skylake: Make MCPS and CPS params obsolete

As per FW Interface Modules Configuration, init instance IPC request
requires base initial module configuration. This configuration structure
is made of:
- cpc (chunks per cycle)
- ibs (input buffer size)
- obs (output buffer size)
- is_pages (memory pages required)
- audio_fmt (self explanatory)

Skylake topology accepts following tokens: MCPS, CPS and CPC. All of
these are directly connected. Moreover, assigning one of these allows
to calculate the remaining two. In simplest scenario and assuming 1ms
scheduling, following is true:

CPS = CPC times 1000
MCPS = CPS times 1000 000
Note: these calculations vary depending on scenario and scheduling
requirements.

Given the current implementation, userspace is allowed to provide
different values for all three causing informational chaos. On top of
that, struct skl_base_cfg which represents base module configuration,
incorrectly takes CPS param instead of CPC.

This ambiguity may lead to user unintentionally providing improper
values to DSP firmware and thus impacting module scheduling in
unexpected fashion. Fix by making MCPS and CPS topology params obsolete
and relying solely on CPC value.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20190723145854.8527-7-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-debug.c    |  6 ++++--
 sound/soc/intel/skylake/skl-messages.c |  2 +-
 sound/soc/intel/skylake/skl-topology.c | 15 ++++++---------
 sound/soc/intel/skylake/skl-topology.h |  4 +---
 4 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-debug.c b/sound/soc/intel/skylake/skl-debug.c
index c43aa4081232..fb232428109f 100644
--- a/sound/soc/intel/skylake/skl-debug.c
+++ b/sound/soc/intel/skylake/skl-debug.c
@@ -66,6 +66,8 @@ static ssize_t module_read(struct file *file, char __user *user_buf,
 			   size_t count, loff_t *ppos)
 {
 	struct skl_module_cfg *mconfig = file->private_data;
+	struct skl_module *module = mconfig->module;
+	struct skl_module_res *res = &module->resources[mconfig->res_idx];
 	char *buf;
 	ssize_t ret;
 
@@ -79,8 +81,8 @@ static ssize_t module_read(struct file *file, char __user *user_buf,
 			mconfig->id.pvt_id);
 
 	ret += snprintf(buf + ret, MOD_BUF - ret,
-			"Resources:\n\tMCPS %#x\n\tIBS %#x\n\tOBS %#x\t\n",
-			mconfig->mcps, mconfig->ibs, mconfig->obs);
+			"Resources:\n\tCPC %#x\n\tIBS %#x\n\tOBS %#x\t\n",
+			res->cpc, res->ibs, res->obs);
 
 	ret += snprintf(buf + ret, MOD_BUF - ret,
 			"Module data:\n\tCore %d\n\tIn queue %d\n\t"
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 07762543fb13..e8cc710f092b 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -477,7 +477,7 @@ static void skl_set_base_module_format(struct skl_dev *skl,
 
 	base_cfg->audio_fmt.interleaving = format->interleaving_style;
 
-	base_cfg->cps = res->cps;
+	base_cfg->cpc = res->cpc;
 	base_cfg->ibs = res->ibs;
 	base_cfg->obs = res->obs;
 	base_cfg->is_pages = res->is_pages;
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 53a024c0464d..118866cd5075 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -2205,10 +2205,6 @@ static int skl_tplg_fill_res_tkn(struct device *dev,
 		return -EINVAL;
 
 	switch (tkn_elem->token) {
-	case SKL_TKN_MM_U32_CPS:
-		res->cps = tkn_elem->value;
-		break;
-
 	case SKL_TKN_MM_U32_DMA_SIZE:
 		res->dma_buffer_size = tkn_elem->value;
 		break;
@@ -2229,10 +2225,6 @@ static int skl_tplg_fill_res_tkn(struct device *dev,
 		res->ibs = tkn_elem->value;
 		break;
 
-	case SKL_TKN_U32_MAX_MCPS:
-		res->cps = tkn_elem->value;
-		break;
-
 	case SKL_TKN_MM_U32_RES_PIN_ID:
 	case SKL_TKN_MM_U32_PIN_BUF:
 		ret = skl_tplg_manifest_pin_res_tkn(dev, tkn_elem, res,
@@ -2241,6 +2233,11 @@ static int skl_tplg_fill_res_tkn(struct device *dev,
 			return ret;
 		break;
 
+	case SKL_TKN_MM_U32_CPS:
+	case SKL_TKN_U32_MAX_MCPS:
+		/* ignore unused tokens */
+		break;
+
 	default:
 		dev_err(dev, "Not a res type token: %d", tkn_elem->token);
 		return -EINVAL;
@@ -2693,7 +2690,7 @@ static int skl_tplg_get_pvt_data_v4(struct snd_soc_tplg_dapm_widget *tplg_w,
 		return ret;
 	mconfig->id.module_id = -1;
 	mconfig->id.instance_id = dfw->instance_id;
-	mconfig->module->resources[0].cps = dfw->max_mcps;
+	mconfig->module->resources[0].cpc = dfw->max_mcps / 1000;
 	mconfig->module->resources[0].ibs = dfw->ibs;
 	mconfig->module->resources[0].obs = dfw->obs;
 	mconfig->core_id = dfw->core_id;
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index e2a2fc5c5545..99a0277191ca 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -101,7 +101,7 @@ struct skl_audio_data_format {
 } __packed;
 
 struct skl_base_cfg {
-	u32 cps;
+	u32 cpc;
 	u32 ibs;
 	u32 obs;
 	u32 is_pages;
@@ -343,7 +343,6 @@ struct skl_module_pin_resources {
 struct skl_module_res {
 	u8 id;
 	u32 is_pages;
-	u32 cps;
 	u32 ibs;
 	u32 obs;
 	u32 dma_buffer_size;
@@ -384,7 +383,6 @@ struct skl_module_cfg {
 	u8 out_queue_mask;
 	u8 in_queue;
 	u8 out_queue;
-	u32 mcps;
 	u32 ibs;
 	u32 obs;
 	u8 is_loadable;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

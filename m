Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6071B08
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 17:04:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAE6E1743;
	Tue, 23 Jul 2019 17:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAE6E1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563894263;
	bh=KL9mQMnug3g2hFaBzViQW7BuBLXC6qb0ZsBduPRcTnM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hH55Ec1U8hRamyIJuppV8pHLQfoCq5cL4XBRUmpwDOLfr2gftUEiM3Fvtme5hhCJ8
	 wILA1wpF/glqRXYLBAoDTgzffVCJMahMrycSEtsA4jP+zGawUKOPKlOwKcbGzOHMkb
	 eTTAA0hrLN7L9dK41z0CM2WzmXPXtELqZR3L4I8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B60EEF80528;
	Tue, 23 Jul 2019 16:59:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C442F8049C; Tue, 23 Jul 2019 16:59:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B7D7F8011C
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 16:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B7D7F8011C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 07:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="171977233"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 23 Jul 2019 07:59:20 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 23 Jul 2019 16:58:53 +0200
Message-Id: <20190723145854.8527-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190723145854.8527-1-cezary.rojewski@intel.com>
References: <20190723145854.8527-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [RESEND PATCH v2 6/7] ASoC: Intel: Skylake: Make MCPS
	and CPS params obsolete
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
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

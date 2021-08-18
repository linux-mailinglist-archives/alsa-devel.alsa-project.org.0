Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D29103EFE62
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 09:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 598381686;
	Wed, 18 Aug 2021 09:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 598381686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629273485;
	bh=1qLflFj88eE1NClXqNBtjfeBukBSuE0M+n2XUtHsmhk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuFvAKlYfMP42+zJtC2cYEtNfq/78rj1fzulWyjkVjHvMn2ZRyakeZQETI0s9q+hE
	 wwWXN32qGydPkY6iLoFhx/E1/kPHFfTlh2ikcd3EAkbp3jdb5u2sycpt/zEdvq23rc
	 CeDlm3gKOUSIpBd3lHGis7HzMYn4aoxZvY2F2v8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E2ECF80507;
	Wed, 18 Aug 2021 09:55:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE240F804ED; Wed, 18 Aug 2021 09:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55F79F804E7
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F79F804E7
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195855540"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="195855540"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="676974957"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 00:55:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/11] ASoC: Intel: Skylake: Simplify m_state for loadable
 modules
Date: Wed, 18 Aug 2021 09:57:38 +0200
Message-Id: <20210818075742.1515155-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, jairaj.arava@intel.com,
 upstream@semihalf.com, harshapriya.n@intel.com, cujomalainey@google.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>, hdegoede@redhat.com,
 broonie@kernel.org, jenny.tc@intel.com, lma@semihalf.com,
 vamshi.krishna.gopal@intel.com
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

From: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>

States SKL_MODULE_LOADED and SKL_MODULE_UNLOADED are redundant with
'loadable' flag in struct skl_module. Additionally
skl_tplg_mixer_dapm_post_pmd_event() sets m_state always to
SKL_MODULE_UNINIT so next unload function isn't called for such modules.

Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 5 +----
 sound/soc/intel/skylake/skl-topology.h | 6 ++----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index a35ee9d47d6d..51fb594bb172 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -498,8 +498,6 @@ skl_tplg_init_pipe_modules(struct skl_dev *skl, struct skl_pipe *pipe)
 				mconfig->id.module_id, mconfig->guid);
 			if (ret < 0)
 				return ret;
-
-			mconfig->m_state = SKL_MODULE_LOADED;
 		}
 
 		/* prepare the DMA if the module is gateway cpr */
@@ -558,8 +556,7 @@ static int skl_tplg_unload_pipe_modules(struct skl_dev *skl,
 		mconfig  = w_module->w->priv;
 		uuid_mod = (guid_t *)mconfig->guid;
 
-		if (mconfig->module->loadable && skl->dsp->fw_ops.unload_mod &&
-			mconfig->m_state > SKL_MODULE_UNINIT) {
+		if (mconfig->module->loadable && skl->dsp->fw_ops.unload_mod) {
 			ret = skl->dsp->fw_ops.unload_mod(skl->dsp,
 						mconfig->id.module_id);
 			if (ret < 0)
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index fb011862fb24..ad230fd64758 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -311,10 +311,8 @@ struct skl_pipe {
 
 enum skl_module_state {
 	SKL_MODULE_UNINIT = 0,
-	SKL_MODULE_LOADED = 1,
-	SKL_MODULE_INIT_DONE = 2,
-	SKL_MODULE_BIND_DONE = 3,
-	SKL_MODULE_UNLOADED = 4,
+	SKL_MODULE_INIT_DONE = 1,
+	SKL_MODULE_BIND_DONE = 2,
 };
 
 enum d0i3_capability {
-- 
2.25.1


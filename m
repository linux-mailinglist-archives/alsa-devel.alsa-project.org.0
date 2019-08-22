Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0187199F94
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:13:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 600BF1671;
	Thu, 22 Aug 2019 21:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 600BF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501209;
	bh=YhivMD0SdCyibVd9pQDlqtqxIUwC3B3bb8KN7JRg6Cg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DSaWV2uV4qDfDZg6DbvCAt/4647His+5ZPtm31M02/xRjwlfbdKnfmn1pubzJzhjN
	 dJm6reePv8OaHmuEjEx92dLj1i5Y7E98jggyi27j+jJaSOSRivcCytkkeXwDyZitWI
	 Sjfr0JIX5PW7wEY8YBYiptgiNuCYNBKqJE1CO+YM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC1EF80633;
	Thu, 22 Aug 2019 21:05:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE7B3F80641; Thu, 22 Aug 2019 21:05:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DB69F803F3
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DB69F803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524290"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:02 +0200
Message-Id: <20190822190425.23001-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 12/35] ASoC: Intel: Skylake: Reuse sst_dsp_free
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

Skylake is sst_dsp descendant. Rather than bypassing framework's flow,
embrace it. sst_dsp_free invokes sst specific handler internally so
nothing is missed.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/cnl-sst-dsp.c | 1 -
 sound/soc/intel/skylake/skl-sst-dsp.c | 1 -
 sound/soc/intel/skylake/skl-sst.c     | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.c b/sound/soc/intel/skylake/cnl-sst-dsp.c
index 189c1c7086e3..48b465939ef8 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.c
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.c
@@ -215,7 +215,6 @@ void cnl_dsp_free(struct sst_dsp *dsp)
 	sst_ipc_fini(&skl->ipc);
 	cnl_ipc_int_disable(dsp);
 
-	free_irq(dsp->irq, dsp);
 	cnl_dsp_disable_core(dsp, SKL_DSP_CORE0_MASK);
 }
 EXPORT_SYMBOL_GPL(cnl_dsp_free);
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
index 348e69226e46..1c4ecbcd7db7 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.c
+++ b/sound/soc/intel/skylake/skl-sst-dsp.c
@@ -468,7 +468,6 @@ void skl_dsp_free(struct sst_dsp *dsp)
 	sst_ipc_fini(&skl->ipc);
 	skl_ipc_int_disable(dsp);
 
-	free_irq(dsp->irq, dsp);
 	skl_dsp_disable_core(dsp, SKL_DSP_CORE0_MASK);
 }
 EXPORT_SYMBOL_GPL(skl_dsp_free);
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 72ee3d8a1d7d..e55523826346 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -622,7 +622,7 @@ void skl_sst_dsp_cleanup(struct skl_dev *skl)
 	skl_clear_module_table(dsp);
 
 	skl_freeup_uuid_list(skl);
-	dsp->ops->free(dsp);
+	sst_dsp_free(dsp);
 
 	if (skl->boot_complete && dsp->cl_dev.bufsize) {
 		dsp->cl_dev.ops.cl_cleanup_controller(dsp);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

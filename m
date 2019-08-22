Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D5299F88
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC9581668;
	Thu, 22 Aug 2019 21:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC9581668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501123;
	bh=WLQhOT04mnvQJB0xVO4e1Jt5OteSdTS2u8wjc9UiN/0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ii+N/jTqXEHVMlvx13B3BHrI/2xf3+7nAXcg806NdgYA5ZNG8NHGFsD9ohYoxSqrY
	 ktbgLoJ0cfLPbV038C2htAPkAWJpGy3RIJajInZNEgEhAwv4cGOdLRBuKLbHgrxT7u
	 psjhfkuMHYtWS/G1ZHvJY/kPQnoln6hHF5/qYujY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28B19F805FB;
	Thu, 22 Aug 2019 21:05:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC9DF8060F; Thu, 22 Aug 2019 21:05:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C30F805E0
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C30F805E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524252"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:03:58 +0200
Message-Id: <20190822190425.23001-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 08/35] ASoC: Intel: Skylake: Inline ipc free
	operations
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

skl_ipc_free and its equivalents are simple wrappers. Let's inline them,
making room for cleanup mechanism unification.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c     |  1 -
 sound/soc/intel/skylake/cnl-sst-dsp.c | 12 +++++-------
 sound/soc/intel/skylake/cnl-sst-dsp.h |  1 -
 sound/soc/intel/skylake/cnl-sst.c     |  1 -
 sound/soc/intel/skylake/skl-sst-dsp.c |  5 ++++-
 sound/soc/intel/skylake/skl-sst-ipc.c | 13 -------------
 sound/soc/intel/skylake/skl-sst-ipc.h |  1 -
 sound/soc/intel/skylake/skl-sst.c     |  1 -
 8 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index cc9507d4702b..68f400cfb390 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -599,7 +599,6 @@ void bxt_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl)
 	if (skl->dsp->fw)
 		release_firmware(skl->dsp->fw);
 	skl_freeup_uuid_list(skl);
-	skl_ipc_free(&skl->ipc);
 	skl->dsp->ops->free(skl->dsp);
 }
 EXPORT_SYMBOL_GPL(bxt_sst_dsp_cleanup);
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.c b/sound/soc/intel/skylake/cnl-sst-dsp.c
index 3ef1b194add1..189c1c7086e3 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.c
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.c
@@ -14,9 +14,9 @@
  */
 #include <linux/device.h>
 #include "../common/sst-dsp.h"
-#include "../common/sst-ipc.h"
 #include "../common/sst-dsp-priv.h"
 #include "cnl-sst-dsp.h"
+#include "skl.h"
 
 /* various timeout values */
 #define CNL_DSP_PU_TO		50
@@ -209,10 +209,13 @@ irqreturn_t cnl_dsp_sst_interrupt(int irq, void *dev_id)
 
 void cnl_dsp_free(struct sst_dsp *dsp)
 {
+	struct skl_dev *skl = dsp->thread_context;
+
+	cnl_ipc_op_int_disable(dsp);
+	sst_ipc_fini(&skl->ipc);
 	cnl_ipc_int_disable(dsp);
 
 	free_irq(dsp->irq, dsp);
-	cnl_ipc_op_int_disable(dsp);
 	cnl_dsp_disable_core(dsp, SKL_DSP_CORE0_MASK);
 }
 EXPORT_SYMBOL_GPL(cnl_dsp_free);
@@ -259,8 +262,3 @@ bool cnl_ipc_int_status(struct sst_dsp *ctx)
 							CNL_ADSPIS_IPC;
 }
 
-void cnl_ipc_free(struct sst_generic_ipc *ipc)
-{
-	cnl_ipc_op_int_disable(ipc->dsp);
-	sst_ipc_fini(ipc);
-}
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index 50f4a53a607c..b1417639bc1c 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -92,7 +92,6 @@ void cnl_ipc_int_disable(struct sst_dsp *ctx);
 void cnl_ipc_op_int_enable(struct sst_dsp *ctx);
 void cnl_ipc_op_int_disable(struct sst_dsp *ctx);
 bool cnl_ipc_int_status(struct sst_dsp *ctx);
-void cnl_ipc_free(struct sst_generic_ipc *ipc);
 
 int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 		     const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index a2b3bce631fc..76b23ea7802e 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -470,7 +470,6 @@ void cnl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl)
 		release_firmware(skl->dsp->fw);
 
 	skl_freeup_uuid_list(skl);
-	cnl_ipc_free(&skl->ipc);
 
 	skl->dsp->ops->free(skl->dsp);
 }
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
index 15acbe80711e..e0807db225f4 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.c
+++ b/sound/soc/intel/skylake/skl-sst-dsp.c
@@ -463,10 +463,13 @@ int skl_dsp_acquire_irq(struct sst_dsp *sst)
 
 void skl_dsp_free(struct sst_dsp *dsp)
 {
+	struct skl_dev *skl = dsp->thread_context;
+
+	skl_ipc_op_int_disable(dsp);
+	sst_ipc_fini(&skl->ipc);
 	skl_ipc_int_disable(dsp);
 
 	free_irq(dsp->irq, dsp);
-	skl_ipc_op_int_disable(dsp);
 	skl_dsp_disable_core(dsp, SKL_DSP_CORE0_MASK);
 }
 EXPORT_SYMBOL_GPL(skl_dsp_free);
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 4875a518dd54..2700f882103d 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -620,19 +620,6 @@ int skl_ipc_init(struct device *dev, struct skl_dev *skl)
 	return 0;
 }
 
-void skl_ipc_free(struct sst_generic_ipc *ipc)
-{
-	/* Disable IPC DONE interrupt */
-	sst_dsp_shim_update_bits(ipc->dsp, SKL_ADSP_REG_HIPCCTL,
-		SKL_ADSP_REG_HIPCCTL_DONE, 0);
-
-	/* Disable IPC BUSY interrupt */
-	sst_dsp_shim_update_bits(ipc->dsp, SKL_ADSP_REG_HIPCCTL,
-		SKL_ADSP_REG_HIPCCTL_BUSY, 0);
-
-	sst_ipc_fini(ipc);
-}
-
 int skl_ipc_create_pipeline(struct sst_generic_ipc *ipc,
 		u16 ppl_mem_size, u8 ppl_type, u8 instance_id, u8 lp_mode)
 {
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.h b/sound/soc/intel/skylake/skl-sst-ipc.h
index eefa52f7f97a..fb150e656379 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.h
+++ b/sound/soc/intel/skylake/skl-sst-ipc.h
@@ -275,7 +275,6 @@ void skl_ipc_op_int_disable(struct sst_dsp *ctx);
 void skl_ipc_int_disable(struct sst_dsp *dsp);
 
 bool skl_ipc_int_status(struct sst_dsp *dsp);
-void skl_ipc_free(struct sst_generic_ipc *ipc);
 int skl_ipc_init(struct device *dev, struct skl_dev *skl);
 void skl_clear_module_cnt(struct sst_dsp *ctx);
 
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 163590682e1a..72ab579ddd27 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -620,7 +620,6 @@ void skl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl)
 		release_firmware(skl->dsp->fw);
 	skl_clear_module_table(skl->dsp);
 	skl_freeup_uuid_list(skl);
-	skl_ipc_free(&skl->ipc);
 	skl->dsp->ops->free(skl->dsp);
 	if (skl->boot_complete) {
 		skl->dsp->cl_dev.ops.cl_cleanup_controller(skl->dsp);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

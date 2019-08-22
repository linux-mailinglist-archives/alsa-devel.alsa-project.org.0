Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BDB99F92
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E40F5950;
	Thu, 22 Aug 2019 21:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E40F5950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501160;
	bh=CaXYkP+YVniQg+hNUHdkbp6888pmHQtJr2giTXc6f8I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXKVEGLBHMLyAYILPb/4QlUtFLuE39J3M9y23v77r78MwSzvnrSIuvqYwcJlw4iOq
	 bTEMaHUd4lPkv6m6ij1SBIZv6icW7wuBdKKVcGnDjro/dcjGE341J1sCfBnLvlvEtE
	 qds3MdINtV9V6bD617m423W2i89mhTCaeVByLG9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F77F806E8;
	Thu, 22 Aug 2019 21:05:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 186E0F80641; Thu, 22 Aug 2019 21:05:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C343F803D5
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C343F803D5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524259"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:03:59 +0200
Message-Id: <20190822190425.23001-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 09/35] ASoC: Intel: Skylake: Unify driver
	cleanup mechanism
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

Driver cleanup process is similar for all platforms and sst_ops::free
provides enough customization already. Unify them. Also remove redundant
disable interrupt calls from new cleanup method. This is yet another
checkpoint in quest for simplification or, perhaps a removal of
skl_dsp_ops.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c      | 11 -----------
 sound/soc/intel/skylake/cnl-sst-dsp.h  |  1 -
 sound/soc/intel/skylake/cnl-sst.c      | 11 -----------
 sound/soc/intel/skylake/skl-messages.c | 10 +---------
 sound/soc/intel/skylake/skl-sst-dsp.h  |  2 --
 sound/soc/intel/skylake/skl-sst.c      | 20 ++++++++++++--------
 sound/soc/intel/skylake/skl.h          |  2 +-
 7 files changed, 14 insertions(+), 43 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 68f400cfb390..4e5fb7684415 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -592,16 +592,5 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 }
 EXPORT_SYMBOL_GPL(bxt_sst_dsp_init);
 
-void bxt_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl)
-{
-
-	skl_release_library(skl->lib_info, skl->lib_count);
-	if (skl->dsp->fw)
-		release_firmware(skl->dsp->fw);
-	skl_freeup_uuid_list(skl);
-	skl->dsp->ops->free(skl->dsp);
-}
-EXPORT_SYMBOL_GPL(bxt_sst_dsp_cleanup);
-
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Broxton IPC driver");
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index b1417639bc1c..f3d320b05eb5 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -96,6 +96,5 @@ bool cnl_ipc_int_status(struct sst_dsp *ctx);
 int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 		     const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
 		     struct skl_dev **dsp);
-void cnl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl);
 
 #endif /*__CNL_SST_DSP_H__*/
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 76b23ea7802e..5143200579aa 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -464,16 +464,5 @@ int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 }
 EXPORT_SYMBOL_GPL(cnl_sst_dsp_init);
 
-void cnl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl)
-{
-	if (skl->dsp->fw)
-		release_firmware(skl->dsp->fw);
-
-	skl_freeup_uuid_list(skl);
-
-	skl->dsp->ops->free(skl->dsp);
-}
-EXPORT_SYMBOL_GPL(cnl_sst_dsp_cleanup);
-
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Cannonlake IPC driver");
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index e4ac1ae777e0..8fd682872d0c 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -172,49 +172,41 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.id = 0x9d70,
 		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
-		.cleanup = skl_sst_dsp_cleanup
 	},
 	{
 		.id = 0x9d71,
 		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
-		.cleanup = skl_sst_dsp_cleanup
 	},
 	{
 		.id = 0x5a98,
 		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
-		.cleanup = bxt_sst_dsp_cleanup
 	},
 	{
 		.id = 0x3198,
 		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
-		.cleanup = bxt_sst_dsp_cleanup
 	},
 	{
 		.id = 0x9dc8,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
-		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
 		.id = 0xa348,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
-		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
 		.id = 0x02c8,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
-		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
 		.id = 0x06c8,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
-		.cleanup = cnl_sst_dsp_cleanup
 	},
 };
 
@@ -282,7 +274,7 @@ int skl_free_dsp(struct skl_dev *skl)
 	/* disable  ppcap interrupt */
 	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
 
-	skl->dsp_ops->cleanup(bus->dev, skl);
+	skl_sst_dsp_cleanup(skl);
 
 	kfree(skl->hw_cfg.i2s_caps.ctrl_base_addr);
 	kfree(skl->cores.state);
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 2129627e6255..21d376692503 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -226,8 +226,6 @@ int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 		const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
 		struct skl_dev **dsp);
-void skl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl);
-void bxt_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl);
 int bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo,
 		int lib_count);
 
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 72ab579ddd27..a7a285ea24e1 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -613,17 +613,21 @@ int skl_sst_init_fw(struct skl_dev *skl)
 }
 EXPORT_SYMBOL_GPL(skl_sst_init_fw);
 
-void skl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl)
+void skl_sst_dsp_cleanup(struct skl_dev *skl)
 {
+	struct sst_dsp *dsp = skl->dsp;
+
+	skl_release_library(skl->lib_info, skl->lib_count);
+	if (dsp->fw)
+		release_firmware(dsp->fw);
+	skl_clear_module_table(dsp);
 
-	if (skl->dsp->fw)
-		release_firmware(skl->dsp->fw);
-	skl_clear_module_table(skl->dsp);
 	skl_freeup_uuid_list(skl);
-	skl->dsp->ops->free(skl->dsp);
-	if (skl->boot_complete) {
-		skl->dsp->cl_dev.ops.cl_cleanup_controller(skl->dsp);
-		skl_cldma_int_disable(skl->dsp);
+	dsp->ops->free(dsp);
+
+	if (skl->boot_complete && dsp->cl_dev.bufsize) {
+		dsp->cl_dev.ops.cl_cleanup_controller(dsp);
+		skl_cldma_int_disable(dsp);
 	}
 }
 EXPORT_SYMBOL_GPL(skl_sst_dsp_cleanup);
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 71e69f52b7ab..62e2f2d450e4 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -160,7 +160,6 @@ struct skl_dsp_ops {
 			int irq, const char *fw_name,
 			struct skl_dsp_loader_ops loader_ops,
 			struct skl_dev **skl_sst);
-	void (*cleanup)(struct device *dev, struct skl_dev *skl);
 };
 
 int skl_platform_unregister(struct device *dev);
@@ -174,6 +173,7 @@ int skl_nhlt_update_topology_bin(struct skl_dev *skl);
 int skl_init_dsp(struct skl_dev *skl);
 int skl_free_dsp(struct skl_dev *skl);
 int skl_sst_init_fw(struct skl_dev *skl);
+void skl_sst_dsp_cleanup(struct skl_dev *skl);
 int skl_suspend_late_dsp(struct skl_dev *skl);
 int skl_suspend_dsp(struct skl_dev *skl);
 int skl_resume_dsp(struct skl_dev *skl);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

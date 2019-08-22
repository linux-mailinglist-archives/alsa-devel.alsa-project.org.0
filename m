Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE199F79
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:10:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B05A166B;
	Thu, 22 Aug 2019 21:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B05A166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501054;
	bh=oIT++pjm3/EJVfYLyFUv/V5bGrknWCKqtGQCHL+u8gA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ItddY/rozsBmN+AxyJVoKVN9hLaeFyvyJ29Lp3mUCOQ0zhEnaarA/0o8+j6T0SdUt
	 cszcvhaxrOnF++vqmMjCjI5o4exl88veMoVFuVD5giZCNOXbkbFi/esltmFcZC1zUf
	 gNMijcIN6TA1vPyEHOmOMtc2tBEibQP/6GfRJnUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1887F80672;
	Thu, 22 Aug 2019 21:05:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C4C8F8060D; Thu, 22 Aug 2019 21:05:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63552F80391
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63552F80391
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524229"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:03:54 +0200
Message-Id: <20190822190425.23001-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 04/35] ASoC: Intel: Skylake: Unify firmware
	loading mechanism
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

There are certain operations we want to do before and after firmware
loading e.g.: disabling/ enabling power and clock gating. To make code
coherent, provide skl_init_fw as a unified way for loading dsp firmware.

In consequence, this change provides CNL load library support during fw
initialization which was previously missing.

skl_dsp_fw_ops already takes care of fw and library load customization.
New post-load additions in form of fw and hw config assignments make
this change even more welcome.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c      | 27 -----------------
 sound/soc/intel/skylake/cnl-sst-dsp.h  |  1 -
 sound/soc/intel/skylake/cnl-sst.c      | 19 ------------
 sound/soc/intel/skylake/skl-messages.c |  8 -----
 sound/soc/intel/skylake/skl-pcm.c      | 22 ++------------
 sound/soc/intel/skylake/skl-sst-dsp.c  |  1 +
 sound/soc/intel/skylake/skl-sst-dsp.h  |  2 --
 sound/soc/intel/skylake/skl-sst.c      | 41 ++++++++++++++++++++++----
 sound/soc/intel/skylake/skl.h          |  2 +-
 9 files changed, 40 insertions(+), 83 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 92a82e6b5fe6..5bece3a6d741 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -591,33 +591,6 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 }
 EXPORT_SYMBOL_GPL(bxt_sst_dsp_init);
 
-int bxt_sst_init_fw(struct device *dev, struct skl_dev *skl)
-{
-	int ret;
-	struct sst_dsp *sst = skl->dsp;
-
-	ret = sst->fw_ops.load_fw(sst);
-	if (ret < 0) {
-		dev_err(dev, "Load base fw failed: %x\n", ret);
-		return ret;
-	}
-
-	skl_dsp_init_core_state(sst);
-
-	if (skl->lib_count > 1) {
-		ret = sst->fw_ops.load_library(sst, skl->lib_info,
-						skl->lib_count);
-		if (ret < 0) {
-			dev_err(dev, "Load Library failed : %x\n", ret);
-			return ret;
-		}
-	}
-	skl->is_first_boot = false;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(bxt_sst_init_fw);
-
 void bxt_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl)
 {
 
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index 7bd4d2a8fdfa..50f4a53a607c 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -97,7 +97,6 @@ void cnl_ipc_free(struct sst_generic_ipc *ipc);
 int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 		     const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
 		     struct skl_dev **dsp);
-int cnl_sst_init_fw(struct device *dev, struct skl_dev *skl);
 void cnl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl);
 
 #endif /*__CNL_SST_DSP_H__*/
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 4f64f097e9ae..8984653d925d 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -453,25 +453,6 @@ int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 }
 EXPORT_SYMBOL_GPL(cnl_sst_dsp_init);
 
-int cnl_sst_init_fw(struct device *dev, struct skl_dev *skl)
-{
-	int ret;
-	struct sst_dsp *sst = skl->dsp;
-
-	ret = skl->dsp->fw_ops.load_fw(sst);
-	if (ret < 0) {
-		dev_err(dev, "load base fw failed: %d", ret);
-		return ret;
-	}
-
-	skl_dsp_init_core_state(sst);
-
-	skl->is_first_boot = false;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(cnl_sst_init_fw);
-
 void cnl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl)
 {
 	if (skl->dsp->fw)
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index d28b4887de27..cc949904717e 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -173,7 +173,6 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.num_cores = 2,
 		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
-		.init_fw = skl_sst_init_fw,
 		.cleanup = skl_sst_dsp_cleanup
 	},
 	{
@@ -181,7 +180,6 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.num_cores = 2,
 		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
-		.init_fw = skl_sst_init_fw,
 		.cleanup = skl_sst_dsp_cleanup
 	},
 	{
@@ -189,7 +187,6 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.num_cores = 2,
 		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
-		.init_fw = bxt_sst_init_fw,
 		.cleanup = bxt_sst_dsp_cleanup
 	},
 	{
@@ -197,7 +194,6 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.num_cores = 2,
 		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
-		.init_fw = bxt_sst_init_fw,
 		.cleanup = bxt_sst_dsp_cleanup
 	},
 	{
@@ -205,7 +201,6 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
-		.init_fw = cnl_sst_init_fw,
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
@@ -213,7 +208,6 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
-		.init_fw = cnl_sst_init_fw,
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
@@ -221,7 +215,6 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
-		.init_fw = cnl_sst_init_fw,
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 	{
@@ -229,7 +222,6 @@ static const struct skl_dsp_ops dsp_ops[] = {
 		.num_cores = 4,
 		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
-		.init_fw = cnl_sst_init_fw,
 		.cleanup = cnl_sst_dsp_cleanup
 	},
 };
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 7f287424af9b..1dbab3eac0e5 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1408,7 +1408,6 @@ static int skl_platform_soc_probe(struct snd_soc_component *component)
 {
 	struct hdac_bus *bus = dev_get_drvdata(component->dev);
 	struct skl_dev *skl = bus_to_skl(bus);
-	const struct skl_dsp_ops *ops;
 	int ret;
 
 	pm_runtime_get_sync(component->dev);
@@ -1424,25 +1423,10 @@ static int skl_platform_soc_probe(struct snd_soc_component *component)
 			return ret;
 		}
 
-		/* load the firmwares, since all is set */
-		ops = skl_get_dsp_ops(skl->pci->device);
-		if (!ops)
-			return -EIO;
-
-		/*
-		 * Disable dynamic clock and power gating during firmware
-		 * and library download
-		 */
-		skl->enable_miscbdcge(component->dev, false);
-		skl->clock_power_gating(component->dev, false);
-
-		ret = ops->init_fw(component->dev, skl);
-		skl->enable_miscbdcge(component->dev, true);
-		skl->clock_power_gating(component->dev, true);
-		if (ret < 0) {
-			dev_err(component->dev, "Failed to boot first fw: %d\n", ret);
+		ret = skl_sst_init_fw(skl);
+		if (ret < 0)
 			return ret;
-		}
+
 		skl_populate_modules(skl);
 		skl->update_d0i3c = skl_update_d0i3c;
 
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
index 225706d148d8..0eecf26986f9 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.c
+++ b/sound/soc/intel/skylake/skl-sst-dsp.c
@@ -44,6 +44,7 @@ void skl_dsp_init_core_state(struct sst_dsp *ctx)
 		skl->cores.usage_count[i] = 0;
 	}
 }
+EXPORT_SYMBOL_GPL(skl_dsp_init_core_state);
 
 /* Get the mask for all enabled cores */
 unsigned int skl_dsp_get_enabled_cores(struct sst_dsp *ctx)
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index cdfec0fca577..4da240582454 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -226,8 +226,6 @@ int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 		const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
 		struct skl_dev **dsp);
-int skl_sst_init_fw(struct device *dev, struct skl_dev *skl);
-int bxt_sst_init_fw(struct device *dev, struct skl_dev *skl);
 void skl_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl);
 void bxt_sst_dsp_cleanup(struct device *dev, struct skl_dev *skl);
 
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 8af7546def1f..8a8ecb9a4fc6 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -555,30 +555,59 @@ int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 }
 EXPORT_SYMBOL_GPL(skl_sst_dsp_init);
 
-int skl_sst_init_fw(struct device *dev, struct skl_dev *skl)
+int skl_sst_init_fw(struct skl_dev *skl)
 {
-	int ret;
 	struct sst_dsp *sst = skl->dsp;
+	struct device *dev = skl->dev;
+	int (*lp_check)(struct sst_dsp *dsp, bool state);
+	int ret;
+
+	lp_check = skl->ipc.ops.check_dsp_lp_on;
+	skl->enable_miscbdcge(dev, false);
+	skl->clock_power_gating(dev, false);
 
 	ret = sst->fw_ops.load_fw(sst);
 	if (ret < 0) {
 		dev_err(dev, "Load base fw failed : %d\n", ret);
-		return ret;
+		goto exit;
+	}
+
+	if (!skl->is_first_boot)
+		goto library_load;
+	/* Disable power check during cfg setup */
+	skl->ipc.ops.check_dsp_lp_on = NULL;
+
+	ret = skl_ipc_fw_cfg_get(&skl->ipc, &skl->fw_cfg);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get fw cfg: %d\n", ret);
+		goto exit;
+	}
+
+	ret = skl_ipc_hw_cfg_get(&skl->ipc, &skl->hw_cfg);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get hw cfg: %d\n", ret);
+		goto exit;
 	}
 
 	skl_dsp_init_core_state(sst);
 
+library_load:
 	if (skl->lib_count > 1) {
 		ret = sst->fw_ops.load_library(sst, skl->lib_info,
 						skl->lib_count);
 		if (ret < 0) {
-			dev_err(dev, "Load Library failed : %x\n", ret);
-			return ret;
+			dev_err(dev, "Load library failed : %x\n", ret);
+			goto exit;
 		}
 	}
+
 	skl->is_first_boot = false;
+exit:
+	skl->ipc.ops.check_dsp_lp_on = lp_check;
+	skl->enable_miscbdcge(dev, true);
+	skl->clock_power_gating(dev, true);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(skl_sst_init_fw);
 
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 972de5ddf2b7..1f86543fe954 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -161,7 +161,6 @@ struct skl_dsp_ops {
 			int irq, const char *fw_name,
 			struct skl_dsp_loader_ops loader_ops,
 			struct skl_dev **skl_sst);
-	int (*init_fw)(struct device *dev, struct skl_dev *skl);
 	void (*cleanup)(struct device *dev, struct skl_dev *skl);
 };
 
@@ -175,6 +174,7 @@ struct nhlt_specific_cfg *skl_get_ep_blob(struct skl_dev *skl, u32 instance,
 int skl_nhlt_update_topology_bin(struct skl_dev *skl);
 int skl_init_dsp(struct skl_dev *skl);
 int skl_free_dsp(struct skl_dev *skl);
+int skl_sst_init_fw(struct skl_dev *skl);
 int skl_suspend_late_dsp(struct skl_dev *skl);
 int skl_suspend_dsp(struct skl_dev *skl);
 int skl_resume_dsp(struct skl_dev *skl);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

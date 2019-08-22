Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA8899FB4
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:18:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B0B847;
	Thu, 22 Aug 2019 21:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B0B847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501491;
	bh=cThwNRfuZv3Ior0g/1Vs+C4KbTjOsXY8N6EYtD/UmqQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fN77XSqCM8NEUKV3j7OvumkYxZdGaEkxIKZV9FMBPPcp4IYw8KrXcj4MeWIw0q2pS
	 Rmhpn6MVidEpS0v4GuRo+tv9OTZbubOt+slbkk/+dYyhvt1Dpskoop6aUvKeFKBflR
	 X3aeCaBUWbj3lQ7GZTOggkgXXFOerfRspZkcB2Y4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C83FF80753;
	Thu, 22 Aug 2019 21:06:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6424F806E9; Thu, 22 Aug 2019 21:05:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 188D6F805A1
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 188D6F805A1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524395"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:07 +0200
Message-Id: <20190822190425.23001-18-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 17/35] ASoC: Intel: Skylake: Remove
	skl_dsp_loader_ops
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

With all fields deprecated, yet another struct can be removed. Let's do
so and don't forget about any functions or fields tied to its existence.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/sst-dsp-priv.h   |  1 -
 sound/soc/intel/skylake/bxt-sst.c       |  5 ++--
 sound/soc/intel/skylake/cnl-sst-dsp.h   |  3 +-
 sound/soc/intel/skylake/cnl-sst.c       |  5 ++--
 sound/soc/intel/skylake/skl-messages.c  | 40 +------------------------
 sound/soc/intel/skylake/skl-sst-dsp.h   | 24 ++-------------
 sound/soc/intel/skylake/skl-sst-utils.c |  3 +-
 sound/soc/intel/skylake/skl-sst.c       |  5 ++--
 sound/soc/intel/skylake/skl.h           |  2 --
 9 files changed, 12 insertions(+), 76 deletions(-)

diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 8a7009937d59..0fe9bebcfb38 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -306,7 +306,6 @@ struct sst_dsp {
 	const char *fw_name;
 
 	/* To allocate CL dma buffers */
-	struct skl_dsp_loader_ops dsp_ops;
 	struct skl_dsp_fw_ops fw_ops;
 	int sst_state;
 	struct skl_cl_dev cl_dev;
diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 45da02f74f4d..c7961050c2ee 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -546,14 +546,13 @@ static struct sst_pdata skl_dev = {
 };
 
 int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-			const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
-			struct skl_dev **dsp)
+			const char *fw_name, struct skl_dev **dsp)
 {
 	struct skl_dev *skl;
 	struct sst_dsp *sst;
 	int ret;
 
-	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp_ops, dsp, &skl_dev);
+	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp, &skl_dev);
 	if (ret < 0) {
 		dev_err(dev, "%s: no device\n", __func__);
 		return ret;
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index 30b586acc858..70da4f312f53 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -94,7 +94,6 @@ void cnl_ipc_op_int_disable(struct sst_dsp *ctx);
 bool cnl_ipc_int_status(struct sst_dsp *ctx);
 
 int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		     const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
-		     struct skl_dev **dsp);
+		     const char *fw_name, struct skl_dev **dsp);
 
 #endif /*__CNL_SST_DSP_H__*/
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 4d9a4d5886f4..2f10076cc906 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -423,14 +423,13 @@ static struct sst_pdata cnl_dev = {
 };
 
 int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		     const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
-		     struct skl_dev **dsp)
+		     const char *fw_name, struct skl_dev **dsp)
 {
 	struct skl_dev *cnl;
 	struct sst_dsp *sst;
 	int ret;
 
-	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp_ops, dsp, &cnl_dev);
+	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp, &cnl_dev);
 	if (ret < 0) {
 		dev_err(dev, "%s: no device\n", __func__);
 		return ret;
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 20ab980fe8a1..6fbceec67b53 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -140,72 +140,37 @@ int skl_dsp_cleanup(struct device *dev,
 	return 0;
 }
 
-static struct skl_dsp_loader_ops skl_get_loader_ops(void)
-{
-	struct skl_dsp_loader_ops loader_ops;
-
-	memset(&loader_ops, 0, sizeof(struct skl_dsp_loader_ops));
-
-	loader_ops.alloc_dma_buf = skl_alloc_dma_buf;
-	loader_ops.free_dma_buf = skl_free_dma_buf;
-
-	return loader_ops;
-};
-
-static struct skl_dsp_loader_ops bxt_get_loader_ops(void)
-{
-	struct skl_dsp_loader_ops loader_ops;
-
-	memset(&loader_ops, 0, sizeof(loader_ops));
-
-	loader_ops.alloc_dma_buf = skl_alloc_dma_buf;
-	loader_ops.free_dma_buf = skl_free_dma_buf;
-	loader_ops.prepare = skl_dsp_prepare;
-	loader_ops.trigger = skl_dsp_trigger;
-	loader_ops.cleanup = skl_dsp_cleanup;
-
-	return loader_ops;
-};
-
 static const struct skl_dsp_ops dsp_ops[] = {
 	{
 		.id = 0x9d70,
-		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
 	},
 	{
 		.id = 0x9d71,
-		.loader_ops = skl_get_loader_ops,
 		.init = skl_sst_dsp_init,
 	},
 	{
 		.id = 0x5a98,
-		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
 	},
 	{
 		.id = 0x3198,
-		.loader_ops = bxt_get_loader_ops,
 		.init = bxt_sst_dsp_init,
 	},
 	{
 		.id = 0x9dc8,
-		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
 	},
 	{
 		.id = 0xa348,
-		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
 	},
 	{
 		.id = 0x02c8,
-		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
 	},
 	{
 		.id = 0x06c8,
-		.loader_ops = bxt_get_loader_ops,
 		.init = cnl_sst_dsp_init,
 	},
 };
@@ -226,7 +191,6 @@ int skl_init_dsp(struct skl_dev *skl)
 {
 	void __iomem *mmio_base;
 	struct hdac_bus *bus = skl_to_bus(skl);
-	struct skl_dsp_loader_ops loader_ops;
 	int irq = bus->irq;
 	const struct skl_dsp_ops *ops;
 	int ret;
@@ -248,10 +212,8 @@ int skl_init_dsp(struct skl_dev *skl)
 		goto unmap_mmio;
 	}
 
-	loader_ops = ops->loader_ops();
 	ret = ops->init(bus->dev, mmio_base, irq,
-				skl->fw_name, loader_ops,
-				&skl);
+				skl->fw_name, &skl);
 
 	if (ret < 0)
 		goto unmap_mmio;
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 97e16a602331..9f2dae92c1c9 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -150,22 +150,6 @@ struct skl_dsp_fw_ops {
 
 };
 
-struct skl_dsp_loader_ops {
-	int stream_tag;
-
-	int (*alloc_dma_buf)(struct device *dev,
-		struct snd_dma_buffer *dmab, size_t size);
-	int (*free_dma_buf)(struct device *dev,
-		struct snd_dma_buffer *dmab);
-	int (*prepare)(struct device *dev, unsigned int format,
-				unsigned int byte_size,
-				struct snd_dma_buffer *bufp);
-	int (*trigger)(struct device *dev, bool start, int stream_tag);
-
-	int (*cleanup)(struct device *dev, struct snd_dma_buffer *dmab,
-				 int stream_tag);
-};
-
 #define MAX_INSTANCE_BUFF 2
 
 struct uuid_module {
@@ -227,11 +211,9 @@ int skl_dsp_put_core(struct sst_dsp *ctx, unsigned int core_id);
 
 int skl_dsp_boot(struct sst_dsp *ctx);
 int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
-		struct skl_dev **dsp);
+		const char *fw_name, struct skl_dev **dsp);
 int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
-		struct skl_dev **dsp);
+		const char *fw_name, struct skl_dev **dsp);
 int bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo,
 		int lib_count);
 
@@ -248,7 +230,7 @@ int skl_dsp_strip_extended_manifest(struct firmware *fw);
 void skl_dsp_set_astate_cfg(struct skl_dev *skl, u32 cnt, void *data);
 
 int skl_sst_ctx_init(struct device *dev, int irq, const char *fw_name,
-		struct skl_dsp_loader_ops dsp_ops, struct skl_dev **dsp,
+		struct skl_dev **dsp,
 		struct sst_pdata *pdata);
 int skl_prepare_lib_load(struct skl_dev *skl, struct skl_lib_info *linfo,
 			struct firmware *stripped_fw,
diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
index 8e03a10855c4..bbe67e298efe 100644
--- a/sound/soc/intel/skylake/skl-sst-utils.c
+++ b/sound/soc/intel/skylake/skl-sst-utils.c
@@ -355,7 +355,7 @@ int skl_dsp_strip_extended_manifest(struct firmware *fw)
 }
 
 int skl_sst_ctx_init(struct device *dev, int irq, const char *fw_name,
-	struct skl_dsp_loader_ops dsp_ops, struct skl_dev **dsp,
+	struct skl_dev **dsp,
 	struct sst_pdata *pdata)
 {
 	struct skl_dev *skl = *dsp;
@@ -375,7 +375,6 @@ int skl_sst_ctx_init(struct device *dev, int irq, const char *fw_name,
 
 	sst = skl->dsp;
 	sst->fw_name = fw_name;
-	sst->dsp_ops = dsp_ops;
 	init_waitqueue_head(&skl->mod_load_wait);
 	INIT_LIST_HEAD(&sst->module_list);
 
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 6bb003add9e2..e9a7b2509b35 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -517,14 +517,13 @@ static struct sst_pdata skl_dev = {
 };
 
 int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		const char *fw_name, struct skl_dsp_loader_ops dsp_ops,
-		struct skl_dev **dsp)
+		const char *fw_name, struct skl_dev **dsp)
 {
 	struct skl_dev *skl;
 	struct sst_dsp *sst;
 	int ret;
 
-	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp_ops, dsp, &skl_dev);
+	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp, &skl_dev);
 	if (ret < 0) {
 		dev_err(dev, "%s: no device\n", __func__);
 		return ret;
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 62e2f2d450e4..beeef67cb55f 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -155,10 +155,8 @@ struct skl_machine_pdata {
 
 struct skl_dsp_ops {
 	int id;
-	struct skl_dsp_loader_ops (*loader_ops)(void);
 	int (*init)(struct device *dev, void __iomem *mmio_base,
 			int irq, const char *fw_name,
-			struct skl_dsp_loader_ops loader_ops,
 			struct skl_dev **skl_sst);
 };
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

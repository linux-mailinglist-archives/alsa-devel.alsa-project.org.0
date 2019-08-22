Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681E9A001
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C44DC1698;
	Thu, 22 Aug 2019 21:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C44DC1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501991;
	bh=QbqmV5tY0IXDNtMlPIXQnWApr9ldg9WGyFjiEsXdCaA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qTuvrQPUR7IJwuJN88Dx61bYhabsyl3sZAbokTZVBEHM4A/OBjuQw4Pf2rKD596fy
	 oDKfoCmqvwExnfGeO2ONz5Tl63fPn5LDiFrheo2HwylhIRHwpL0xlWBqk/kI6rnqBl
	 D72VcaO6ikBnRTO/dG7KwZgXDykpkXg8S/SAzi0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECD9EF80C5A;
	Thu, 22 Aug 2019 21:06:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04EF5F8071D; Thu, 22 Aug 2019 21:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDFCEF8065D
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDFCEF8065D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524597"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:27 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:19 +0200
Message-Id: <20190822190425.23001-30-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 29/35] ASoC: Intel: Skylake: Flip SST
	initialization order
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

To this date Skylake SST were following ill flow of initialization by
bypassing sst_dsp_new -> sst_ops::init order. Fix that by flipping
invocation order of handlers engaged in Skylake initialization.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c      | 15 ++++-----------
 sound/soc/intel/skylake/cnl-sst-dsp.h  |  2 +-
 sound/soc/intel/skylake/cnl-sst.c      | 15 ++++-----------
 sound/soc/intel/skylake/skl-messages.c |  4 ++--
 sound/soc/intel/skylake/skl-sst-dsp.h  |  4 ++--
 sound/soc/intel/skylake/skl-sst.c      | 15 ++++-----------
 sound/soc/intel/skylake/skl.c          |  2 +-
 sound/soc/intel/skylake/skl.h          |  4 ++--
 8 files changed, 20 insertions(+), 41 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 06da822790a5..286da9fbc4de 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -538,24 +538,17 @@ struct sst_ops apl_sst_ops = {
 	.read = sst_shim32_read,
 	.ram_read = sst_memcpy_fromio_32,
 	.ram_write = sst_memcpy_toio_32,
+	.init = bxt_sst_dsp_init,
 	.free = skl_dsp_free,
 };
 
-static struct sst_pdata skl_dev = {
-	.ops = &apl_sst_ops,
-};
-
-int bxt_sst_dsp_init(struct skl_dev *skl, const char *fw_name)
+int bxt_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
 {
-	struct sst_dsp *sst;
+	struct skl_dev *skl = sst->thread_context;
 	void __iomem *mmio;
 	int ret;
 
-	ret = skl_sst_ctx_init(skl, fw_name, &skl_dev);
-	if (ret)
-		return ret;
-
-	sst = skl->dsp;
+	skl->dsp = sst;
 	sst->fw_ops = bxt_fw_ops;
 	mmio = pci_ioremap_bar(skl->pci, 4);
 	if (!mmio)
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index 02e070fae2ce..7810ae11954a 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -87,6 +87,6 @@ void cnl_ipc_op_int_enable(struct sst_dsp *ctx);
 void cnl_ipc_op_int_disable(struct sst_dsp *ctx);
 bool cnl_ipc_int_status(struct sst_dsp *ctx);
 
-int cnl_sst_dsp_init(struct skl_dev *skl, const char *fw_name);
+int cnl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata);
 
 #endif /*__CNL_SST_DSP_H__*/
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index c4dbf6655097..a6113d8afcbb 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -415,24 +415,17 @@ struct sst_ops cnl_sst_ops = {
 	.read = sst_shim32_read,
 	.ram_read = sst_memcpy_fromio_32,
 	.ram_write = sst_memcpy_toio_32,
+	.init = cnl_sst_dsp_init,
 	.free = cnl_dsp_free,
 };
 
-static struct sst_pdata cnl_dev = {
-	.ops = &cnl_sst_ops,
-};
-
-int cnl_sst_dsp_init(struct skl_dev *cnl, const char *fw_name)
+int cnl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
 {
-	struct sst_dsp *sst;
+	struct skl_dev *cnl = sst->thread_context;
 	void __iomem *mmio;
 	int ret;
 
-	ret = skl_sst_ctx_init(cnl, fw_name, &cnl_dev);
-	if (ret < 0)
-		return ret;
-
-	sst = cnl->dsp;
+	cnl->dsp = sst;
 	sst->fw_ops = cnl_fw_ops;
 	mmio = pci_ioremap_bar(cnl->pci, 4);
 	if (!mmio)
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 8c352255ff45..372c5fb83ddb 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -187,7 +187,7 @@ const struct skl_dsp_ops *skl_get_dsp_ops(int pci_id)
 	return NULL;
 }
 
-int skl_init_dsp(struct skl_dev *skl)
+int skl_init_dsp(struct skl_dev *skl, struct sst_pdata *pdata)
 {
 	struct hdac_bus *bus = skl_to_bus(skl);
 	const struct skl_dsp_ops *ops;
@@ -201,7 +201,7 @@ int skl_init_dsp(struct skl_dev *skl)
 	if (!ops)
 		return -EIO;
 
-	ret = ops->init(skl, skl->fw_name);
+	ret = skl_sst_ctx_init(skl, skl->fw_name, pdata);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index b647e60d7a6d..8483c60f29ba 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -206,8 +206,8 @@ int skl_dsp_get_core(struct sst_dsp *ctx, unsigned int core_id);
 int skl_dsp_put_core(struct sst_dsp *ctx, unsigned int core_id);
 
 int skl_dsp_boot(struct sst_dsp *ctx);
-int skl_sst_dsp_init(struct skl_dev *skl, const char *fw_name);
-int bxt_sst_dsp_init(struct skl_dev *skl, const char *fw_name);
+int skl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata);
+int bxt_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata);
 int bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo,
 		int lib_count);
 
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 122c07290440..e0f2bf828541 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -509,24 +509,17 @@ struct sst_ops skl_sst_ops = {
 	.read = sst_shim32_read,
 	.ram_read = sst_memcpy_fromio_32,
 	.ram_write = sst_memcpy_toio_32,
+	.init = skl_sst_dsp_init,
 	.free = skl_dsp_free,
 };
 
-static struct sst_pdata skl_dev = {
-	.ops = &skl_sst_ops,
-};
-
-int skl_sst_dsp_init(struct skl_dev *skl, const char *fw_name)
+int skl_sst_dsp_init(struct sst_dsp *sst, struct sst_pdata *pdata)
 {
-	struct sst_dsp *sst;
+	struct skl_dev *skl = sst->thread_context;
 	void __iomem *mmio;
 	int ret;
 
-	ret = skl_sst_ctx_init(skl, fw_name, &skl_dev);
-	if (ret < 0)
-		return ret;
-
-	sst = skl->dsp;
+	skl->dsp = sst;
 	sst->fw_ops = skl_fw_ops;
 	mmio = pci_ioremap_bar(skl->pci, 4);
 	if (!mmio)
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 53a6befd5d68..39442c80a179 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -1072,7 +1072,7 @@ static int skl_probe(struct pci_dev *pci,
 		goto out_nhlt_free;
 	}
 
-	err = skl_init_dsp(skl);
+	err = skl_init_dsp(skl, desc);
 	if (err < 0) {
 		dev_dbg(bus->dev, "error failed to register dsp\n");
 		goto out_nhlt_free;
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 2f2b5a141abf..f4cd5ccc1ff9 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -159,7 +159,7 @@ struct skl_machine_pdata {
 
 struct skl_dsp_ops {
 	int id;
-	int (*init)(struct skl_dev *skl, const char *fw_name);
+	int (*init)(struct sst_dsp *dsp, struct sst_pdata *pdata);
 };
 
 int skl_platform_unregister(struct device *dev);
@@ -170,7 +170,7 @@ struct nhlt_specific_cfg *skl_get_ep_blob(struct skl_dev *skl, u32 instance,
 					u32 s_rate, u8 dirn, u8 dev_type);
 
 int skl_nhlt_update_topology_bin(struct skl_dev *skl);
-int skl_init_dsp(struct skl_dev *skl);
+int skl_init_dsp(struct skl_dev *skl, struct sst_pdata *pdata);
 int skl_free_dsp(struct skl_dev *skl);
 int skl_sst_init_fw(struct skl_dev *skl);
 void skl_sst_dsp_cleanup(struct skl_dev *skl);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

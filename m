Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8C99FD9
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B7051677;
	Thu, 22 Aug 2019 21:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B7051677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501861;
	bh=UvIagVZAOYwKB19MvbcVw5Dodx0e6vRTruxH8iFKTvw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dmm8ep1ngX620KF6xWUg3fo2lB9T6t7wwYBm3efAXObikcCxB4qURujX0OUwbOV3F
	 oCFblHFvYx8UuPeR1lZbUKE/NmEwjrCUokGVqRVCkzf4yLiyVz7m25wmDGyHlyNUj7
	 qJ6hTQ8KVHKP47AphENgA9PmtOzy2GiiVNWDzxgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95023F8086D;
	Thu, 22 Aug 2019 21:06:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CDB1F80715; Thu, 22 Aug 2019 21:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35BADF8065B
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35BADF8065B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524560"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:23 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:16 +0200
Message-Id: <20190822190425.23001-27-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 26/35] ASoC: Intel: Skylake: Simplify all
	sst_dsp_init declarations
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

SST initializers for Skylake, Apollolake and Cannonlake descendants have
many redundant parameters within their declaration. Simplify them.
Currently, this involves duplication the PCI ioremap code. This will be
addresses on a later note, but is needed to keep SSTs sane during
initialization overhaul.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c      | 19 +++++++++----------
 sound/soc/intel/skylake/cnl-sst-dsp.h  |  3 +--
 sound/soc/intel/skylake/cnl-sst.c      | 19 +++++++++----------
 sound/soc/intel/skylake/skl-messages.c | 26 ++++----------------------
 sound/soc/intel/skylake/skl-sst-dsp.h  |  6 ++----
 sound/soc/intel/skylake/skl-sst.c      | 22 ++++++++++------------
 sound/soc/intel/skylake/skl.h          |  5 ++---
 7 files changed, 37 insertions(+), 63 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index e72cd63eb113..a547fb84eee9 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -545,30 +545,29 @@ static struct sst_pdata skl_dev = {
 	.ops = &skl_ops,
 };
 
-int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-			const char *fw_name, struct skl_dev **dsp)
+int bxt_sst_dsp_init(struct skl_dev *skl, const char *fw_name)
 {
-	struct skl_dev *skl;
 	struct sst_dsp *sst;
+	void __iomem *mmio;
 	int ret;
 
-	skl = *dsp;
 	ret = skl_sst_ctx_init(skl, fw_name, &skl_dev);
-	if (ret < 0) {
-		dev_err(dev, "%s: no device\n", __func__);
+	if (ret)
 		return ret;
-	}
 
 	sst = skl->dsp;
 	sst->fw_ops = bxt_fw_ops;
-	sst->addr.lpe = mmio_base;
-	sst->addr.shim = mmio_base;
+	mmio = pci_ioremap_bar(skl->pci, 4);
+	if (!mmio)
+		return -ENXIO;
+	sst->addr.lpe = mmio;
+	sst->addr.shim = mmio;
 
 	sst_dsp_mailbox_init(sst,
 		(BXT_ADSP_SRAM0_BASE + SKL_FW_REGS_SIZE), SKL_MAILBOX_SIZE,
 		BXT_ADSP_SRAM1_BASE, SKL_MAILBOX_SIZE);
 
-	ret = skl_ipc_init(dev, skl);
+	ret = skl_ipc_init(skl->dev, skl);
 	if (ret) {
 		skl_dsp_free(sst);
 		return ret;
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index a465cc42b7e8..02e070fae2ce 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -87,7 +87,6 @@ void cnl_ipc_op_int_enable(struct sst_dsp *ctx);
 void cnl_ipc_op_int_disable(struct sst_dsp *ctx);
 bool cnl_ipc_int_status(struct sst_dsp *ctx);
 
-int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		     const char *fw_name, struct skl_dev **dsp);
+int cnl_sst_dsp_init(struct skl_dev *skl, const char *fw_name);
 
 #endif /*__CNL_SST_DSP_H__*/
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 93b98281083c..5be0a8eb154d 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -422,30 +422,29 @@ static struct sst_pdata cnl_dev = {
 	.ops = &cnl_ops,
 };
 
-int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		     const char *fw_name, struct skl_dev **dsp)
+int cnl_sst_dsp_init(struct skl_dev *cnl, const char *fw_name)
 {
-	struct skl_dev *cnl;
 	struct sst_dsp *sst;
+	void __iomem *mmio;
 	int ret;
 
-	cnl = *dsp;
 	ret = skl_sst_ctx_init(cnl, fw_name, &cnl_dev);
-	if (ret < 0) {
-		dev_err(dev, "%s: no device\n", __func__);
+	if (ret < 0)
 		return ret;
-	}
 
 	sst = cnl->dsp;
 	sst->fw_ops = cnl_fw_ops;
-	sst->addr.lpe = mmio_base;
-	sst->addr.shim = mmio_base;
+	mmio = pci_ioremap_bar(cnl->pci, 4);
+	if (!mmio)
+		return -ENXIO;
+	sst->addr.lpe = mmio;
+	sst->addr.shim = mmio;
 
 	sst_dsp_mailbox_init(sst,
 		(CNL_ADSP_SRAM0_BASE + SKL_FW_REGS_SIZE), SKL_MAILBOX_SIZE,
 		CNL_ADSP_SRAM1_BASE, SKL_MAILBOX_SIZE);
 
-	ret = cnl_ipc_init(dev, cnl);
+	ret = cnl_ipc_init(cnl->dev, cnl);
 	if (ret) {
 		skl_dsp_free(sst);
 		return ret;
diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index 6fbceec67b53..8c352255ff45 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -189,9 +189,7 @@ const struct skl_dsp_ops *skl_get_dsp_ops(int pci_id)
 
 int skl_init_dsp(struct skl_dev *skl)
 {
-	void __iomem *mmio_base;
 	struct hdac_bus *bus = skl_to_bus(skl);
-	int irq = bus->irq;
 	const struct skl_dsp_ops *ops;
 	int ret;
 
@@ -199,34 +197,18 @@ int skl_init_dsp(struct skl_dev *skl)
 	snd_hdac_ext_bus_ppcap_enable(bus, true);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
 
-	/* read the BAR of the ADSP MMIO */
-	mmio_base = pci_ioremap_bar(skl->pci, 4);
-	if (mmio_base == NULL) {
-		dev_err(bus->dev, "ioremap error\n");
-		return -ENXIO;
-	}
-
 	ops = skl_get_dsp_ops(skl->pci->device);
-	if (!ops) {
-		ret = -EIO;
-		goto unmap_mmio;
-	}
-
-	ret = ops->init(bus->dev, mmio_base, irq,
-				skl->fw_name, &skl);
+	if (!ops)
+		return -EIO;
 
+	ret = ops->init(skl, skl->fw_name);
 	if (ret < 0)
-		goto unmap_mmio;
+		return ret;
 
 	skl->dsp_ops = ops;
 	dev_dbg(bus->dev, "dsp registration status=%d\n", ret);
 
 	return 0;
-
-unmap_mmio:
-	iounmap(mmio_base);
-
-	return ret;
 }
 
 int skl_free_dsp(struct skl_dev *skl)
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index e14d76ed0100..b647e60d7a6d 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -206,10 +206,8 @@ int skl_dsp_get_core(struct sst_dsp *ctx, unsigned int core_id);
 int skl_dsp_put_core(struct sst_dsp *ctx, unsigned int core_id);
 
 int skl_dsp_boot(struct sst_dsp *ctx);
-int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		const char *fw_name, struct skl_dev **dsp);
-int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		const char *fw_name, struct skl_dev **dsp);
+int skl_sst_dsp_init(struct skl_dev *skl, const char *fw_name);
+int bxt_sst_dsp_init(struct skl_dev *skl, const char *fw_name);
 int bxt_load_library(struct sst_dsp *ctx, struct skl_lib_info *linfo,
 		int lib_count);
 
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index f8aecd2ca8bb..8ae7fe73534e 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -516,36 +516,34 @@ static struct sst_pdata skl_dev = {
 	.ops = &skl_ops,
 };
 
-int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
-		const char *fw_name, struct skl_dev **dsp)
+int skl_sst_dsp_init(struct skl_dev *skl, const char *fw_name)
 {
-	struct skl_dev *skl;
 	struct sst_dsp *sst;
+	void __iomem *mmio;
 	int ret;
 
-	skl = *dsp;
 	ret = skl_sst_ctx_init(skl, fw_name, &skl_dev);
-	if (ret < 0) {
-		dev_err(dev, "%s: no device\n", __func__);
+	if (ret < 0)
 		return ret;
-	}
 
 	sst = skl->dsp;
-	sst->addr.lpe = mmio_base;
-	sst->addr.shim = mmio_base;
+	sst->fw_ops = skl_fw_ops;
+	mmio = pci_ioremap_bar(skl->pci, 4);
+	if (!mmio)
+		return -ENXIO;
+	sst->addr.lpe = mmio;
+	sst->addr.shim = mmio;
 
 	sst_dsp_mailbox_init(sst,
 		(SKL_ADSP_SRAM0_BASE + SKL_FW_REGS_SIZE), SKL_MAILBOX_SIZE,
 		SKL_ADSP_SRAM1_BASE, SKL_MAILBOX_SIZE);
 
-	ret = skl_ipc_init(dev, skl);
+	ret = skl_ipc_init(skl->dev, skl);
 	if (ret) {
 		skl_dsp_free(sst);
 		return ret;
 	}
 
-	sst->fw_ops = skl_fw_ops;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(skl_sst_dsp_init);
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index beeef67cb55f..9f5aa53df9f8 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -12,6 +12,7 @@
 #ifndef __SOUND_SOC_SKL_H
 #define __SOUND_SOC_SKL_H
 
+#include <linux/pci.h>
 #include <sound/hda_register.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_codec.h>
@@ -155,9 +156,7 @@ struct skl_machine_pdata {
 
 struct skl_dsp_ops {
 	int id;
-	int (*init)(struct device *dev, void __iomem *mmio_base,
-			int irq, const char *fw_name,
-			struct skl_dev **skl_sst);
+	int (*init)(struct skl_dev *skl, const char *fw_name);
 };
 
 int skl_platform_unregister(struct device *dev);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

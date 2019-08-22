Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750C99FD7
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:23:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 104291688;
	Thu, 22 Aug 2019 21:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 104291688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501816;
	bh=c1vDNIxr8lOirTn12nsDzLaeqWCETth9eOSDLsZaUS8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VTybuCAOEzuL6fXYzw6+JeqFSO0Cm0rBKzkdbjSqxQysF8ADvfq+P2U1Z9B0ni/tD
	 b9os/sHcIkyZuhTWuFIkwF4OrG1aY7ELCYXfqc91rmGIVPv3c34N2KA1gOUEgdAWNt
	 2knYj4cV3eTkS6GDTEQowZRsnjMfhCFjxWDopgdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 797C2F8085E;
	Thu, 22 Aug 2019 21:06:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAF07F80714; Thu, 22 Aug 2019 21:05:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A59E1F8065A
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A59E1F8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524549"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:21 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:15 +0200
Message-Id: <20190822190425.23001-26-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 25/35] ASoC: Intel: Skylake: Simplify
	skl_sst_ctx_init declaration
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

'irq' and 'dsp' are redundant parameters of skl_sst_ctx_init. Simplify
its declaration and update each invokes. This yet another step In quest
for simplification of Skylake initialization process.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c       |  4 ++--
 sound/soc/intel/skylake/cnl-sst.c       |  4 ++--
 sound/soc/intel/skylake/skl-sst-dsp.h   |  3 +--
 sound/soc/intel/skylake/skl-sst-utils.c | 18 +++++++-----------
 sound/soc/intel/skylake/skl-sst.c       |  4 ++--
 sound/soc/intel/skylake/skl.c           |  1 +
 6 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 5b46215fbc0f..e72cd63eb113 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -552,13 +552,13 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	struct sst_dsp *sst;
 	int ret;
 
-	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp, &skl_dev);
+	skl = *dsp;
+	ret = skl_sst_ctx_init(skl, fw_name, &skl_dev);
 	if (ret < 0) {
 		dev_err(dev, "%s: no device\n", __func__);
 		return ret;
 	}
 
-	skl = *dsp;
 	sst = skl->dsp;
 	sst->fw_ops = bxt_fw_ops;
 	sst->addr.lpe = mmio_base;
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 47b991c03742..93b98281083c 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -429,13 +429,13 @@ int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	struct sst_dsp *sst;
 	int ret;
 
-	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp, &cnl_dev);
+	cnl = *dsp;
+	ret = skl_sst_ctx_init(cnl, fw_name, &cnl_dev);
 	if (ret < 0) {
 		dev_err(dev, "%s: no device\n", __func__);
 		return ret;
 	}
 
-	cnl = *dsp;
 	sst = cnl->dsp;
 	sst->fw_ops = cnl_fw_ops;
 	sst->addr.lpe = mmio_base;
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 3c92b1d849e4..e14d76ed0100 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -225,8 +225,7 @@ int skl_dsp_strip_extended_manifest(struct firmware *fw);
 
 void skl_dsp_set_astate_cfg(struct skl_dev *skl, u32 cnt, void *data);
 
-int skl_sst_ctx_init(struct device *dev, int irq, const char *fw_name,
-		struct skl_dev **dsp,
+int skl_sst_ctx_init(struct skl_dev *skl, const char *fw_name,
 		struct sst_pdata *pdata);
 int skl_prepare_lib_load(struct skl_dev *skl, struct skl_lib_info *linfo,
 			struct firmware *stripped_fw,
diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
index ac0a0e4c2d68..a4ad213d34e0 100644
--- a/sound/soc/intel/skylake/skl-sst-utils.c
+++ b/sound/soc/intel/skylake/skl-sst-utils.c
@@ -354,30 +354,26 @@ int skl_dsp_strip_extended_manifest(struct firmware *fw)
 	return 0;
 }
 
-int skl_sst_ctx_init(struct device *dev, int irq, const char *fw_name,
-	struct skl_dev **dsp,
+int skl_sst_ctx_init(struct skl_dev *skl, const char *fw_name,
 	struct sst_pdata *pdata)
 {
-	struct skl_dev *skl = *dsp;
 	struct sst_dsp *sst;
+	struct device *dev = skl->dev;
 
 	pdata->id = skl->pci->device;
-	pdata->irq = irq;
+	pdata->irq = skl->pci->irq;
 	pdata->dma_base = -1;
-	skl->dev = dev;
 	pdata->dsp = skl;
 	INIT_LIST_HEAD(&skl->uuid_list);
-	skl->dsp = sst_dsp_new(dev, pdata);
-	if (!skl->dsp) {
-		dev_err(skl->dev, "%s: no device\n", __func__);
+	sst = sst_dsp_new(dev, pdata);
+	if (!sst) {
+		dev_err(dev, "%s: no device\n", __func__);
 		return -ENODEV;
 	}
 
-	sst = skl->dsp;
+	skl->dsp = sst;
 	sst->fw_name = fw_name;
 	init_waitqueue_head(&skl->mod_load_wait);
-	INIT_LIST_HEAD(&sst->module_list);
-
 	skl->is_first_boot = true;
 
 	return 0;
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index c823936ffd34..f8aecd2ca8bb 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -523,13 +523,13 @@ int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	struct sst_dsp *sst;
 	int ret;
 
-	ret = skl_sst_ctx_init(dev, irq, fw_name, dsp, &skl_dev);
+	skl = *dsp;
+	ret = skl_sst_ctx_init(skl, fw_name, &skl_dev);
 	if (ret < 0) {
 		dev_err(dev, "%s: no device\n", __func__);
 		return ret;
 	}
 
-	skl = *dsp;
 	sst = skl->dsp;
 	sst->addr.lpe = mmio_base;
 	sst->addr.shim = mmio_base;
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 141dbbf975ac..54e1f957121d 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -890,6 +890,7 @@ static int skl_create(struct pci_dev *pci,
 	snd_hdac_ext_bus_init(bus, &pci->dev, &bus_core_ops, ext_ops);
 	bus->use_posbuf = 1;
 	skl->pci = pci;
+	skl->dev = &pci->dev;
 	INIT_WORK(&skl->probe_work, skl_probe_work);
 	bus->bdl_pos_adj = 0;
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

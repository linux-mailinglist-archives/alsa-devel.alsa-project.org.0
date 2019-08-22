Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD799F9A
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:14:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D4CB165D;
	Thu, 22 Aug 2019 21:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D4CB165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501286;
	bh=oNoD3BBqoAk40QE0BXiUS7Huk4FpCeMAb43ynuNJiKw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VuAW5Of3XKBwFilvAHe1Q0gUYHKujBPbiEQ5qjWdZ05BdJ0H42PDUH/VAoc6WgqXj
	 w56bf+Tgg3cAuC+Ln4uekdOSlDTCqx1cE/BBotHjjauvz7YiGTREipLJr82veJXVzD
	 4cZoNziVO8ogtxqibEHlCwocr9wfV9igJgo9VOaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA2CAF8070D;
	Thu, 22 Aug 2019 21:06:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FB01F8065D; Thu, 22 Aug 2019 21:05:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB4EEF800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB4EEF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524273"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:01 +0200
Message-Id: <20190822190425.23001-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 11/35] ASoC: Intel: Merge sst_dsp_device into
	sst_pdata
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

With all core ops united, sst_dsp_device is a stub struct. Merge it with
sst_pdata and thus making it dsp-platform info struct. As sst_pdata is
targeted to become a sole initialization struct for DSP drivers, update
its definition to contain fw_name and machine board list too.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/baytrail/sst-baytrail-ipc.c | 10 +++-------
 sound/soc/intel/common/sst-dsp-priv.h       |  1 -
 sound/soc/intel/common/sst-dsp.h            | 17 ++++-------------
 sound/soc/intel/common/sst-firmware.c       |  8 +++-----
 sound/soc/intel/haswell/sst-haswell-ipc.c   | 10 +++-------
 sound/soc/intel/skylake/bxt-sst.c           |  2 +-
 sound/soc/intel/skylake/cnl-sst-dsp.h       |  2 +-
 sound/soc/intel/skylake/cnl-sst.c           |  2 +-
 sound/soc/intel/skylake/skl-sst-dsp.c       |  8 ++++----
 sound/soc/intel/skylake/skl-sst-dsp.h       |  6 +++---
 sound/soc/intel/skylake/skl-sst-utils.c     |  6 +++---
 sound/soc/intel/skylake/skl-sst.c           |  2 +-
 12 files changed, 27 insertions(+), 47 deletions(-)

diff --git a/sound/soc/intel/baytrail/sst-baytrail-ipc.c b/sound/soc/intel/baytrail/sst-baytrail-ipc.c
index 23d65ad38e19..efa78e33caf2 100644
--- a/sound/soc/intel/baytrail/sst-baytrail-ipc.c
+++ b/sound/soc/intel/baytrail/sst-baytrail-ipc.c
@@ -556,10 +556,6 @@ struct sst_dsp *sst_byt_get_dsp(struct sst_byt *byt)
 	return byt->dsp;
 }
 
-static struct sst_dsp_device byt_dev = {
-	.ops = &sst_byt_ops,
-};
-
 int sst_byt_dsp_suspend_late(struct device *dev, struct sst_pdata *pdata)
 {
 	struct sst_byt *byt = pdata->dsp;
@@ -701,10 +697,11 @@ int sst_byt_dsp_init(struct device *dev, struct sst_pdata *pdata)
 
 	INIT_LIST_HEAD(&byt->stream_list);
 	init_waitqueue_head(&byt->boot_wait);
-	byt_dev.thread_context = byt;
+	pdata->dsp = byt;
+	pdata->ops = &sst_byt_ops;
 
 	/* init SST shim */
-	byt->dsp = sst_dsp_new(dev, &byt_dev, pdata);
+	byt->dsp = sst_dsp_new(dev, pdata);
 	if (byt->dsp == NULL) {
 		err = -ENODEV;
 		goto dsp_new_err;
@@ -741,7 +738,6 @@ int sst_byt_dsp_init(struct device *dev, struct sst_pdata *pdata)
 	dev_info(byt->dev, "Build date: %s %s\n",
 		 init.build_info.date, init.build_info.time);
 
-	pdata->dsp = byt;
 	byt->fw = byt_sst_fw;
 
 	return 0;
diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 7ec477108948..8a7009937d59 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -259,7 +259,6 @@ struct sst_dsp {
 	/* Shared for all platforms */
 
 	/* runtime */
-	struct sst_dsp_device *sst_dev;
 	spinlock_t spinlock;	/* IPC locking */
 	struct mutex mutex;	/* DSP FW lock */
 	struct device *dev;
diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
index 05fa1ca72f46..63c29bb45cf1 100644
--- a/sound/soc/intel/common/sst-dsp.h
+++ b/sound/soc/intel/common/sst-dsp.h
@@ -167,17 +167,6 @@
 
 struct sst_dsp;
 
-/*
- * SST Device.
- *
- * This structure is populated by the SST core driver.
- */
-struct sst_dsp_device {
-	/* Mandatory fields */
-	struct sst_ops *ops;
-	void *thread_context;
-};
-
 /*
  * SST Platform Data.
  */
@@ -203,13 +192,15 @@ struct sst_pdata {
 
 	/* DSP */
 	u32 id;
+	const char *fw_name;
+	struct sst_ops *ops;
+	struct snd_soc_acpi_mach *boards;
 	void *dsp;
 };
 
 #if IS_ENABLED(CONFIG_DW_DMAC_CORE)
 /* Initialization */
-struct sst_dsp *sst_dsp_new(struct device *dev,
-	struct sst_dsp_device *sst_dev, struct sst_pdata *pdata);
+struct sst_dsp *sst_dsp_new(struct device *dev, struct sst_pdata *pdata);
 void sst_dsp_free(struct sst_dsp *sst);
 #endif
 
diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
index c18236ca77f4..6b6af11c32c3 100644
--- a/sound/soc/intel/common/sst-firmware.c
+++ b/sound/soc/intel/common/sst-firmware.c
@@ -1200,8 +1200,7 @@ u32 sst_dsp_get_offset(struct sst_dsp *dsp, u32 offset,
 }
 EXPORT_SYMBOL_GPL(sst_dsp_get_offset);
 
-struct sst_dsp *sst_dsp_new(struct device *dev,
-	struct sst_dsp_device *sst_dev, struct sst_pdata *pdata)
+struct sst_dsp *sst_dsp_new(struct device *dev, struct sst_pdata *pdata)
 {
 	struct sst_dsp *sst;
 	int err;
@@ -1216,11 +1215,10 @@ struct sst_dsp *sst_dsp_new(struct device *dev,
 	mutex_init(&sst->mutex);
 	sst->dev = dev;
 	sst->dma_dev = pdata->dma_dev;
-	sst->thread_context = sst_dev->thread_context;
-	sst->sst_dev = sst_dev;
+	sst->thread_context = pdata->dsp;
 	sst->id = pdata->id;
 	sst->irq = pdata->irq;
-	sst->ops = sst_dev->ops;
+	sst->ops = pdata->ops;
 	sst->pdata = pdata;
 	INIT_LIST_HEAD(&sst->used_block_list);
 	INIT_LIST_HEAD(&sst->free_block_list);
diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c b/sound/soc/intel/haswell/sst-haswell-ipc.c
index e25358d19aae..61c4d674940e 100644
--- a/sound/soc/intel/haswell/sst-haswell-ipc.c
+++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
@@ -2045,10 +2045,6 @@ int sst_hsw_module_set_param(struct sst_hsw *hsw,
 	return ret;
 }
 
-static struct sst_dsp_device hsw_dev = {
-	.ops = &haswell_ops,
-};
-
 static void hsw_tx_msg(struct sst_generic_ipc *ipc, struct ipc_message *msg)
 {
 	/* send the message */
@@ -2126,10 +2122,11 @@ int sst_hsw_dsp_init(struct device *dev, struct sst_pdata *pdata)
 
 	INIT_LIST_HEAD(&hsw->stream_list);
 	init_waitqueue_head(&hsw->boot_wait);
-	hsw_dev.thread_context = hsw;
+	pdata->dsp = hsw;
+	pdata->ops = &haswell_ops;
 
 	/* init SST shim */
-	hsw->dsp = sst_dsp_new(dev, &hsw_dev, pdata);
+	hsw->dsp = sst_dsp_new(dev, pdata);
 	if (hsw->dsp == NULL) {
 		ret = -ENODEV;
 		goto dsp_new_err;
@@ -2189,7 +2186,6 @@ int sst_hsw_dsp_init(struct device *dev, struct sst_pdata *pdata)
 		goto boot_err;
 	}
 
-	pdata->dsp = hsw;
 	return 0;
 
 boot_err:
diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 8faffec4e943..e3614acff34d 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -543,7 +543,7 @@ static struct sst_ops skl_ops = {
 	.free = skl_dsp_free,
 };
 
-static struct sst_dsp_device skl_dev = {
+static struct sst_pdata skl_dev = {
 	.ops = &skl_ops,
 };
 
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index f3d320b05eb5..30b586acc858 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -9,7 +9,7 @@
 #define __CNL_SST_DSP_H__
 
 struct sst_dsp;
-struct sst_dsp_device;
+struct sst_pdata;
 struct sst_generic_ipc;
 
 /* Intel HD Audio General DSP Registers */
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 02d8e72d2d5a..84dc6b82831d 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -419,7 +419,7 @@ static struct sst_ops cnl_ops = {
 	.free = cnl_dsp_free,
 };
 
-static struct sst_dsp_device cnl_dev = {
+static struct sst_pdata cnl_dev = {
 	.ops = &cnl_ops,
 };
 
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.c b/sound/soc/intel/skylake/skl-sst-dsp.c
index 8d98089e3177..348e69226e46 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.c
+++ b/sound/soc/intel/skylake/skl-sst-dsp.c
@@ -419,7 +419,7 @@ int skl_dsp_sleep(struct sst_dsp *ctx)
 EXPORT_SYMBOL_GPL(skl_dsp_sleep);
 
 struct sst_dsp *skl_dsp_ctx_init(struct device *dev,
-		struct sst_dsp_device *sst_dev, int irq)
+		struct sst_pdata *pdata, int irq)
 {
 	int ret;
 	struct sst_dsp *sst;
@@ -431,10 +431,10 @@ struct sst_dsp *skl_dsp_ctx_init(struct device *dev,
 	spin_lock_init(&sst->spinlock);
 	mutex_init(&sst->mutex);
 	sst->dev = dev;
-	sst->sst_dev = sst_dev;
+	sst->pdata = pdata;
 	sst->irq = irq;
-	sst->ops = sst_dev->ops;
-	sst->thread_context = sst_dev->thread_context;
+	sst->ops = pdata->ops;
+	sst->thread_context = pdata->dsp;
 
 	/* Initialise SST Audio DSP */
 	if (sst->ops->init) {
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 21d376692503..ba37433e4efa 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -15,7 +15,7 @@
 #include "skl-sst-cldma.h"
 
 struct sst_dsp;
-struct sst_dsp_device;
+struct sst_pdata;
 struct skl_lib_info;
 struct skl_dev;
 
@@ -197,7 +197,7 @@ int skl_cldma_wait_interruptible(struct sst_dsp *ctx);
 
 void skl_dsp_set_state_locked(struct sst_dsp *ctx, int state);
 struct sst_dsp *skl_dsp_ctx_init(struct device *dev,
-		struct sst_dsp_device *sst_dev, int irq);
+		struct sst_pdata *pdata, int irq);
 int skl_dsp_acquire_irq(struct sst_dsp *sst);
 bool is_skl_dsp_running(struct sst_dsp *ctx);
 
@@ -243,7 +243,7 @@ void skl_dsp_set_astate_cfg(struct skl_dev *skl, u32 cnt, void *data);
 
 int skl_sst_ctx_init(struct device *dev, int irq, const char *fw_name,
 		struct skl_dsp_loader_ops dsp_ops, struct skl_dev **dsp,
-		struct sst_dsp_device *skl_dev);
+		struct sst_pdata *pdata);
 int skl_prepare_lib_load(struct skl_dev *skl, struct skl_lib_info *linfo,
 			struct firmware *stripped_fw,
 			unsigned int hdr_offset, int index);
diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
index d43cbf4a71ef..9061a9b17ea0 100644
--- a/sound/soc/intel/skylake/skl-sst-utils.c
+++ b/sound/soc/intel/skylake/skl-sst-utils.c
@@ -355,15 +355,15 @@ int skl_dsp_strip_extended_manifest(struct firmware *fw)
 
 int skl_sst_ctx_init(struct device *dev, int irq, const char *fw_name,
 	struct skl_dsp_loader_ops dsp_ops, struct skl_dev **dsp,
-	struct sst_dsp_device *skl_dev)
+	struct sst_pdata *pdata)
 {
 	struct skl_dev *skl = *dsp;
 	struct sst_dsp *sst;
 
 	skl->dev = dev;
-	skl_dev->thread_context = skl;
+	pdata->dsp = skl;
 	INIT_LIST_HEAD(&skl->uuid_list);
-	skl->dsp = skl_dsp_ctx_init(dev, skl_dev, irq);
+	skl->dsp = skl_dsp_ctx_init(dev, pdata, irq);
 	if (!skl->dsp) {
 		dev_err(skl->dev, "%s: no device\n", __func__);
 		return -ENODEV;
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 9fd3cf30e87c..72ee3d8a1d7d 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -512,7 +512,7 @@ static struct sst_ops skl_ops = {
 	.free = skl_dsp_free,
 };
 
-static struct sst_dsp_device skl_dev = {
+static struct sst_pdata skl_dev = {
 	.ops = &skl_ops,
 };
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

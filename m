Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30370284650
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 08:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE578176B;
	Tue,  6 Oct 2020 08:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE578176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601967194;
	bh=otf7jyDGuB7Nb6y2wbh15QwR4f32VvwpG7lE8Qo08II=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XKOXbWf8RHvkzuRC7O/Z5vVA1yKDvyklbSDeIIQV9K2NJD5/Ezjp1da085EtyOGUQ
	 lhMKeWMtji/YSENWkPlyRmCbgjhG+sZzdIH5pHOkmA/BqnXzDyy6+jnrkZlhTWbW6L
	 iGKmU3QjLVsR6A0fhVtGTpXhMcZps8n0+WSzSrDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CFBFF802F8;
	Tue,  6 Oct 2020 08:50:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBE29F802EC; Tue,  6 Oct 2020 08:50:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42C15F8028E
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 08:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42C15F8028E
IronPort-SDR: OExLv+NyVHK8Vf2sxntxPTnaaY/9wHiqVL8rW6p1YWWT61we25WfBFgdqJ8Ad/pymJbC7M6oXY
 1Ac/ySNJh2Sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="249091270"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="249091270"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 23:50:07 -0700
IronPort-SDR: XeLUsPZz563VYCNKivwMCS8vT95xmj8fpKMr71RbWPVaKLF01h/OT23QG3EG3d6op6f3OQY+fb
 vAYLgEXHX9TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="315491194"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 05 Oct 2020 23:50:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 05/13] ASoC: Intel: Remove SST ACPI component
Date: Tue,  6 Oct 2020 08:48:59 +0200
Message-Id: <20201006064907.16277-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006064907.16277-1-cezary.rojewski@intel.com>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

baytrail and haswell solutions present within sound/soc/intel are the
only users of sst-acpi componenent and with them removed it becomes
redundant so remove it too.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/Kconfig           |   6 -
 sound/soc/intel/common/Makefile   |   2 -
 sound/soc/intel/common/sst-acpi.c | 236 ------------------------------
 3 files changed, 244 deletions(-)
 delete mode 100644 sound/soc/intel/common/sst-acpi.c

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 41f9c286b34c..a9940e81c5cd 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -31,12 +31,6 @@ config SND_SST_IPC_ACPI
 	# This option controls the ACPI-based IPC for HiFi2 platforms
 	# (Baytrail, Cherrytrail)
 
-config SND_SOC_INTEL_SST_ACPI
-	tristate
-	# This option controls ACPI-based probing on
-	# Haswell/Broadwell/Baytrail legacy and will be set
-	# when these platforms are enabled
-
 config SND_SOC_INTEL_SST
 	tristate
 
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 2674c9790fa1..f4d41d284e67 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sst-dsp-objs := sst-dsp.o
-snd-soc-sst-acpi-objs := sst-acpi.o
 snd-soc-sst-ipc-objs := sst-ipc.o
 snd-soc-sst-firmware-objs := sst-firmware.o
 snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-match.o \
@@ -14,6 +13,5 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-hda-match.o
 
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
-obj-$(CONFIG_SND_SOC_INTEL_SST_ACPI) += snd-soc-sst-acpi.o
 obj-$(CONFIG_SND_SOC_INTEL_SST_FIRMWARE) += snd-soc-sst-firmware.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
diff --git a/sound/soc/intel/common/sst-acpi.c b/sound/soc/intel/common/sst-acpi.c
deleted file mode 100644
index 5854868650b9..000000000000
--- a/sound/soc/intel/common/sst-acpi.c
+++ /dev/null
@@ -1,236 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Intel SST loader on ACPI systems
- *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
- */
-
-#include <linux/acpi.h>
-#include <linux/device.h>
-#include <linux/firmware.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-
-#include "sst-dsp.h"
-#include <sound/soc-acpi.h>
-#include <sound/soc-acpi-intel-match.h>
-
-#define SST_LPT_DSP_DMA_ADDR_OFFSET	0x0F0000
-#define SST_WPT_DSP_DMA_ADDR_OFFSET	0x0FE000
-#define SST_LPT_DSP_DMA_SIZE		(1024 - 1)
-
-/* Descriptor for setting up SST platform data */
-struct sst_acpi_desc {
-	const char *drv_name;
-	struct snd_soc_acpi_mach *machines;
-	/* Platform resource indexes. Must set to -1 if not used */
-	int resindex_lpe_base;
-	int resindex_pcicfg_base;
-	int resindex_fw_base;
-	int irqindex_host_ipc;
-	int resindex_dma_base;
-	/* Unique number identifying the SST core on platform */
-	int sst_id;
-	/* DMA only valid when resindex_dma_base != -1*/
-	int dma_engine;
-	int dma_size;
-};
-
-struct sst_acpi_priv {
-	struct platform_device *pdev_mach;
-	struct platform_device *pdev_pcm;
-	struct sst_pdata sst_pdata;
-	struct sst_acpi_desc *desc;
-	struct snd_soc_acpi_mach *mach;
-};
-
-static void sst_acpi_fw_cb(const struct firmware *fw, void *context)
-{
-	struct platform_device *pdev = context;
-	struct device *dev = &pdev->dev;
-	struct sst_acpi_priv *sst_acpi = platform_get_drvdata(pdev);
-	struct sst_pdata *sst_pdata = &sst_acpi->sst_pdata;
-	struct sst_acpi_desc *desc = sst_acpi->desc;
-	struct snd_soc_acpi_mach *mach = sst_acpi->mach;
-
-	sst_pdata->fw = fw;
-	if (!fw) {
-		dev_err(dev, "Cannot load firmware %s\n", mach->fw_filename);
-		return;
-	}
-
-	/* register PCM and DAI driver */
-	sst_acpi->pdev_pcm =
-		platform_device_register_data(dev, desc->drv_name, -1,
-					      sst_pdata, sizeof(*sst_pdata));
-	if (IS_ERR(sst_acpi->pdev_pcm)) {
-		dev_err(dev, "Cannot register device %s. Error %d\n",
-			desc->drv_name, (int)PTR_ERR(sst_acpi->pdev_pcm));
-	}
-
-	return;
-}
-
-static int sst_acpi_probe(struct platform_device *pdev)
-{
-	const struct acpi_device_id *id;
-	struct device *dev = &pdev->dev;
-	struct sst_acpi_priv *sst_acpi;
-	struct sst_pdata *sst_pdata;
-	struct snd_soc_acpi_mach *mach;
-	struct sst_acpi_desc *desc;
-	struct resource *mmio;
-	int ret = 0;
-
-	sst_acpi = devm_kzalloc(dev, sizeof(*sst_acpi), GFP_KERNEL);
-	if (sst_acpi == NULL)
-		return -ENOMEM;
-
-	id = acpi_match_device(dev->driver->acpi_match_table, dev);
-	if (!id)
-		return -ENODEV;
-
-	desc = (struct sst_acpi_desc *)id->driver_data;
-	mach = snd_soc_acpi_find_machine(desc->machines);
-	if (mach == NULL) {
-		dev_err(dev, "No matching ASoC machine driver found\n");
-		return -ENODEV;
-	}
-
-	sst_pdata = &sst_acpi->sst_pdata;
-	sst_pdata->id = desc->sst_id;
-	sst_pdata->dma_dev = dev;
-	sst_acpi->desc = desc;
-	sst_acpi->mach = mach;
-
-	sst_pdata->resindex_dma_base = desc->resindex_dma_base;
-	if (desc->resindex_dma_base >= 0) {
-		sst_pdata->dma_engine = desc->dma_engine;
-		sst_pdata->dma_base = desc->resindex_dma_base;
-		sst_pdata->dma_size = desc->dma_size;
-	}
-
-	if (desc->irqindex_host_ipc >= 0)
-		sst_pdata->irq = platform_get_irq(pdev, desc->irqindex_host_ipc);
-
-	if (desc->resindex_lpe_base >= 0) {
-		mmio = platform_get_resource(pdev, IORESOURCE_MEM,
-					     desc->resindex_lpe_base);
-		if (mmio) {
-			sst_pdata->lpe_base = mmio->start;
-			sst_pdata->lpe_size = resource_size(mmio);
-		}
-	}
-
-	if (desc->resindex_pcicfg_base >= 0) {
-		mmio = platform_get_resource(pdev, IORESOURCE_MEM,
-					     desc->resindex_pcicfg_base);
-		if (mmio) {
-			sst_pdata->pcicfg_base = mmio->start;
-			sst_pdata->pcicfg_size = resource_size(mmio);
-		}
-	}
-
-	if (desc->resindex_fw_base >= 0) {
-		mmio = platform_get_resource(pdev, IORESOURCE_MEM,
-					     desc->resindex_fw_base);
-		if (mmio) {
-			sst_pdata->fw_base = mmio->start;
-			sst_pdata->fw_size = resource_size(mmio);
-		}
-	}
-
-	platform_set_drvdata(pdev, sst_acpi);
-	mach->pdata = sst_pdata;
-
-	/* register machine driver */
-	sst_acpi->pdev_mach =
-		platform_device_register_data(dev, mach->drv_name, -1,
-					      mach, sizeof(*mach));
-	if (IS_ERR(sst_acpi->pdev_mach))
-		return PTR_ERR(sst_acpi->pdev_mach);
-
-	/* continue SST probing after firmware is loaded */
-	ret = request_firmware_nowait(THIS_MODULE, true, mach->fw_filename,
-				      dev, GFP_KERNEL, pdev, sst_acpi_fw_cb);
-	if (ret)
-		platform_device_unregister(sst_acpi->pdev_mach);
-
-	return ret;
-}
-
-static int sst_acpi_remove(struct platform_device *pdev)
-{
-	struct sst_acpi_priv *sst_acpi = platform_get_drvdata(pdev);
-	struct sst_pdata *sst_pdata = &sst_acpi->sst_pdata;
-
-	platform_device_unregister(sst_acpi->pdev_mach);
-	if (!IS_ERR_OR_NULL(sst_acpi->pdev_pcm))
-		platform_device_unregister(sst_acpi->pdev_pcm);
-	release_firmware(sst_pdata->fw);
-
-	return 0;
-}
-
-static struct sst_acpi_desc sst_acpi_haswell_desc = {
-	.drv_name = "haswell-pcm-audio",
-	.machines = snd_soc_acpi_intel_haswell_machines,
-	.resindex_lpe_base = 0,
-	.resindex_pcicfg_base = 1,
-	.resindex_fw_base = -1,
-	.irqindex_host_ipc = 0,
-	.sst_id = SST_DEV_ID_LYNX_POINT,
-	.dma_engine = SST_DMA_TYPE_DW,
-	.resindex_dma_base = SST_LPT_DSP_DMA_ADDR_OFFSET,
-	.dma_size = SST_LPT_DSP_DMA_SIZE,
-};
-
-static struct sst_acpi_desc sst_acpi_broadwell_desc = {
-	.drv_name = "haswell-pcm-audio",
-	.machines = snd_soc_acpi_intel_broadwell_machines,
-	.resindex_lpe_base = 0,
-	.resindex_pcicfg_base = 1,
-	.resindex_fw_base = -1,
-	.irqindex_host_ipc = 0,
-	.sst_id = SST_DEV_ID_WILDCAT_POINT,
-	.dma_engine = SST_DMA_TYPE_DW,
-	.resindex_dma_base = SST_WPT_DSP_DMA_ADDR_OFFSET,
-	.dma_size = SST_LPT_DSP_DMA_SIZE,
-};
-
-#if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI)
-static struct sst_acpi_desc sst_acpi_baytrail_desc = {
-	.drv_name = "baytrail-pcm-audio",
-	.machines = snd_soc_acpi_intel_baytrail_legacy_machines,
-	.resindex_lpe_base = 0,
-	.resindex_pcicfg_base = 1,
-	.resindex_fw_base = 2,
-	.irqindex_host_ipc = 5,
-	.sst_id = SST_DEV_ID_BYT,
-	.resindex_dma_base = -1,
-};
-#endif
-
-static const struct acpi_device_id sst_acpi_match[] = {
-	{ "INT33C8", (unsigned long)&sst_acpi_haswell_desc },
-	{ "INT3438", (unsigned long)&sst_acpi_broadwell_desc },
-#if !IS_ENABLED(CONFIG_SND_SST_IPC_ACPI)
-	{ "80860F28", (unsigned long)&sst_acpi_baytrail_desc },
-#endif
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, sst_acpi_match);
-
-static struct platform_driver sst_acpi_driver = {
-	.probe = sst_acpi_probe,
-	.remove = sst_acpi_remove,
-	.driver = {
-		.name = "sst-acpi",
-		.acpi_match_table = ACPI_PTR(sst_acpi_match),
-	},
-};
-module_platform_driver(sst_acpi_driver);
-
-MODULE_AUTHOR("Jarkko Nikula <jarkko.nikula@linux.intel.com>");
-MODULE_DESCRIPTION("Intel SST loader on ACPI systems");
-MODULE_LICENSE("GPL v2");
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4641E9DF2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 08:18:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE6A21709;
	Mon,  1 Jun 2020 08:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE6A21709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590992300;
	bh=e/Co2RuT9YniQPC5SbfCj7xRdmjctbsa59h75CA5Ps8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jA4r5K5C+YzuME9+RWEi14Pt+lHH3BAk1HZa/PbJem1w4f4OGlgwGtq0hgQjkSSEj
	 SHvSMUKMsM/q9lE/VwEwIOGGrRIzZKJvduyEuF2kKJSuI5yBMnYIWwDkr4cKvlrEKz
	 olrSOR64qbS/DUFunjuIM9FDQcs7x6hEnkM4gLOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25A7DF80259;
	Mon,  1 Jun 2020 08:15:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C228F800B8; Mon,  1 Jun 2020 08:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951B4F800B8
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 08:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951B4F800B8
IronPort-SDR: C1l/DTZ5TK5Ty4i4pa3M1kdiglkjpYhRdQzehWpEnNvk30qEABGqK2LPZa1ZYPzkhx4ZSw1v7w
 itWQOWx09lYA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 23:15:45 -0700
IronPort-SDR: UywREoZ1+NkUAFu3l4vKAZuCfj+ThWtbjZotFveJk5UsnJ1TxsBLIcIgcbSiGROlECLI74MSOR
 c0N3zg9YjXtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="470208635"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 31 May 2020 23:15:41 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 1/6] soundwire: intel: cleanups for indirections/logs
Date: Mon,  1 Jun 2020 02:20:57 +0800
Message-Id: <20200531182102.27840-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200531182102.27840-1-yung-chuan.liao@linux.intel.com>
References: <20200531182102.27840-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The code can be simplified a bit to have a more consistent use of
'dev' and 'bus', as well as move definitions around. This will help
make the major changes in follow-up patches easier to review.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c      | 68 +++++++++++++++++-----------------
 drivers/soundwire/intel.h      | 11 ++++++
 drivers/soundwire/intel_init.c |  1 +
 3 files changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 1eda63f488f5..10e55c708694 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -92,23 +92,12 @@
 #define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
 #define SDW_ALH_STRMZCFG_CHN		GENMASK(19, 16)
 
-#define SDW_INTEL_QUIRK_MASK_BUS_DISABLE	BIT(1)
-
 enum intel_pdi_type {
 	INTEL_PDI_IN = 0,
 	INTEL_PDI_OUT = 1,
 	INTEL_PDI_BD = 2,
 };
 
-struct sdw_intel {
-	struct sdw_cdns cdns;
-	int instance;
-	struct sdw_intel_link_res *link_res;
-#ifdef CONFIG_DEBUG_FS
-	struct dentry *debugfs;
-#endif
-};
-
 #define cdns_to_intel(_cdns) container_of(_cdns, struct sdw_intel, cdns)
 
 /*
@@ -1083,41 +1072,47 @@ static int intel_init(struct sdw_intel *sdw)
 /*
  * probe and init
  */
-static int intel_probe(struct platform_device *pdev)
+static int intel_master_probe(struct platform_device *pdev)
 {
 	struct sdw_cdns_stream_config config;
+	struct device *dev = &pdev->dev;
 	struct sdw_intel *sdw;
+	struct sdw_bus *bus;
 	int ret;
 
-	sdw = devm_kzalloc(&pdev->dev, sizeof(*sdw), GFP_KERNEL);
+	sdw = devm_kzalloc(dev, sizeof(*sdw), GFP_KERNEL);
 	if (!sdw)
 		return -ENOMEM;
 
+	bus = &sdw->cdns.bus;
+
 	sdw->instance = pdev->id;
-	sdw->link_res = dev_get_platdata(&pdev->dev);
-	sdw->cdns.dev = &pdev->dev;
+	sdw->link_res = dev_get_platdata(dev);
+	sdw->cdns.dev = dev;
 	sdw->cdns.registers = sdw->link_res->registers;
 	sdw->cdns.instance = sdw->instance;
 	sdw->cdns.msg_count = 0;
-	sdw->cdns.bus.link_id = pdev->id;
+	bus->link_id = pdev->id;
 
 	sdw_cdns_probe(&sdw->cdns);
 
 	/* Set property read ops */
 	sdw_intel_ops.read_prop = intel_prop_read;
-	sdw->cdns.bus.ops = &sdw_intel_ops;
+	bus->ops = &sdw_intel_ops;
 
+	/* set driver data, accessed by snd_soc_dai_get_drvdata() */
 	platform_set_drvdata(pdev, sdw);
 
-	ret = sdw_bus_master_add(&sdw->cdns.bus, &pdev->dev, pdev->dev.fwnode);
+	ret = sdw_bus_master_add(bus, dev, dev->fwnode);
 	if (ret) {
-		dev_err(&pdev->dev, "sdw_bus_master_add fail: %d\n", ret);
+		dev_err(dev, "sdw_bus_master_add fail: %d\n", ret);
 		return ret;
 	}
 
-	if (sdw->cdns.bus.prop.hw_disabled) {
-		dev_info(&pdev->dev, "SoundWire master %d is disabled, ignoring\n",
-			 sdw->cdns.bus.link_id);
+	if (bus->prop.hw_disabled) {
+		dev_info(dev,
+			 "SoundWire master %d is disabled, will be ignored\n",
+			 bus->link_id);
 		return 0;
 	}
 
@@ -1139,28 +1134,28 @@ static int intel_probe(struct platform_device *pdev)
 				   sdw_cdns_irq, sdw_cdns_thread,
 				   IRQF_SHARED, KBUILD_MODNAME, &sdw->cdns);
 	if (ret < 0) {
-		dev_err(sdw->cdns.dev, "unable to grab IRQ %d, disabling device\n",
+		dev_err(dev, "unable to grab IRQ %d, disabling device\n",
 			sdw->link_res->irq);
 		goto err_init;
 	}
 
 	ret = sdw_cdns_enable_interrupt(&sdw->cdns, true);
 	if (ret < 0) {
-		dev_err(sdw->cdns.dev, "cannot enable interrupts\n");
+		dev_err(dev, "cannot enable interrupts\n");
 		goto err_init;
 	}
 
 	ret = sdw_cdns_exit_reset(&sdw->cdns);
 	if (ret < 0) {
-		dev_err(sdw->cdns.dev, "unable to exit bus reset sequence\n");
+		dev_err(dev, "unable to exit bus reset sequence\n");
 		goto err_interrupt;
 	}
 
 	/* Register DAIs */
 	ret = intel_register_dai(sdw);
 	if (ret) {
-		dev_err(sdw->cdns.dev, "DAI registration failed: %d\n", ret);
-		snd_soc_unregister_component(sdw->cdns.dev);
+		dev_err(dev, "DAI registration failed: %d\n", ret);
+		snd_soc_unregister_component(dev);
 		goto err_interrupt;
 	}
 
@@ -1172,33 +1167,36 @@ static int intel_probe(struct platform_device *pdev)
 	sdw_cdns_enable_interrupt(&sdw->cdns, false);
 	free_irq(sdw->link_res->irq, sdw);
 err_init:
-	sdw_bus_master_delete(&sdw->cdns.bus);
+	sdw_bus_master_delete(bus);
 	return ret;
 }
 
-static int intel_remove(struct platform_device *pdev)
+static int intel_master_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct sdw_intel *sdw;
+	struct sdw_bus *bus;
 
 	sdw = platform_get_drvdata(pdev);
 
-	if (!sdw->cdns.bus.prop.hw_disabled) {
+	bus = &sdw->cdns.bus;
+
+	if (!bus->prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
 		sdw_cdns_enable_interrupt(&sdw->cdns, false);
 		free_irq(sdw->link_res->irq, sdw);
-		snd_soc_unregister_component(sdw->cdns.dev);
+		snd_soc_unregister_component(dev);
 	}
-	sdw_bus_master_delete(&sdw->cdns.bus);
+	sdw_bus_master_delete(bus);
 
 	return 0;
 }
 
 static struct platform_driver sdw_intel_drv = {
-	.probe = intel_probe,
-	.remove = intel_remove,
+	.probe = intel_master_probe,
+	.remove = intel_master_remove,
 	.driver = {
 		.name = "int-sdw",
-
 	},
 };
 
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 7b4af8018e1a..001968c362cd 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -27,4 +27,15 @@ struct sdw_intel_link_res {
 	struct device *dev;
 };
 
+struct sdw_intel {
+	struct sdw_cdns cdns;
+	int instance;
+	struct sdw_intel_link_res *link_res;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs;
+#endif
+};
+
+#define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
+
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 947345d5c960..de0405359db5 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw_intel.h>
+#include "cadence_master.h"
 #include "intel.h"
 
 #define SDW_LINK_TYPE		4 /* from Intel ACPI documentation */
-- 
2.17.1


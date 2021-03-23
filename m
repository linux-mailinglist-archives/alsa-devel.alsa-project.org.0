Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7100234540E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 01:45:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6CAA15E2;
	Tue, 23 Mar 2021 01:44:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6CAA15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616460322;
	bh=p+2aLzWvsuC8u9E6fqoNXeWq+va1jZCjTkY1XutRL8c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LsH/l3Gt6upjFo20ROR1s6pFb69znpyaokck/Cr3drX+/w5+zQa+8dwwv2JhFkE7Q
	 2QEQd+W6dw7KjvqowPf5bg5+ZmmDCTFcQT/qRm/XEHK3AeJHbcJnv1bGQCFU8Rl7C0
	 8zcsTauYkcCqmqCJ2S7k3SCwLt9kiTECyrD2PSLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE62F801D5;
	Tue, 23 Mar 2021 01:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 908F9F8016B; Tue, 23 Mar 2021 01:43:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7055F80107
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 01:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7055F80107
IronPort-SDR: TjGKSfDq5dgOLUr14c3PQ7ixm+jymtQfr1Z2jgB1KO7TuV0rfFM0/bBqRe7rMCRaNVHd3/B6eN
 R3dn+J//UTcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="251730596"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="251730596"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:43:42 -0700
IronPort-SDR: XFym6FtbM3Bosl/a9AkBpySQFikEkzTzftzqLRofiMlDEl8DdNgUe0OF9PPeJ0KCnTAtRohkdQ
 sBL3gOM77o+w==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="607533582"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:43:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: intel: move to auxiliary bus
Date: Tue, 23 Mar 2021 08:43:25 +0800
Message-Id: <20210323004325.19727-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Now that the auxiliary_bus exists, there's no reason to use platform
devices as children of a PCI device any longer.

This patch refactors the code by extending a basic auxiliary device
with Intel link-specific structures that need to be passed between
controller and link levels. This refactoring is much cleaner with no
need for cross-pointers between device and link structures.

Note that the auxiliary bus API has separate init and add steps, which
requires more attention in the error unwinding paths. The main loop
needs to deal with kfree() and auxiliary_device_uninit() for the
current iteration before jumping to the common label which releases
everything allocated in prior iterations.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/Kconfig           |   1 +
 drivers/soundwire/intel.c           |  52 ++++----
 drivers/soundwire/intel.h           |  14 +-
 drivers/soundwire/intel_init.c      | 190 +++++++++++++++++++---------
 include/linux/soundwire/sdw_intel.h |   6 +-
 5 files changed, 175 insertions(+), 88 deletions(-)

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index 016e74230bb7..2b7795233282 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -25,6 +25,7 @@ config SOUNDWIRE_INTEL
 	tristate "Intel SoundWire Master driver"
 	select SOUNDWIRE_CADENCE
 	select SOUNDWIRE_GENERIC_ALLOCATION
+	select AUXILIARY_BUS
 	depends on ACPI && SND_SOC
 	help
 	  SoundWire Intel Master driver.
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index d2254ee2fee2..039a101982c9 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
 #include <sound/pcm_params.h>
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
@@ -1331,9 +1331,10 @@ static int intel_init(struct sdw_intel *sdw)
 /*
  * probe and init
  */
-static int intel_master_probe(struct platform_device *pdev)
+static int intel_link_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &auxdev->dev;
+	struct sdw_intel_link_dev *ldev = auxiliary_dev_to_sdw_intel_link_dev(auxdev);
 	struct sdw_intel *sdw;
 	struct sdw_cdns *cdns;
 	struct sdw_bus *bus;
@@ -1346,14 +1347,14 @@ static int intel_master_probe(struct platform_device *pdev)
 	cdns = &sdw->cdns;
 	bus = &cdns->bus;
 
-	sdw->instance = pdev->id;
-	sdw->link_res = dev_get_platdata(dev);
+	sdw->instance = auxdev->id;
+	sdw->link_res = &ldev->link_res;
 	cdns->dev = dev;
 	cdns->registers = sdw->link_res->registers;
 	cdns->instance = sdw->instance;
 	cdns->msg_count = 0;
 
-	bus->link_id = pdev->id;
+	bus->link_id = auxdev->id;
 
 	sdw_cdns_probe(cdns);
 
@@ -1386,10 +1387,10 @@ static int intel_master_probe(struct platform_device *pdev)
 	return 0;
 }
 
-int intel_master_startup(struct platform_device *pdev)
+int intel_link_startup(struct auxiliary_device *auxdev)
 {
 	struct sdw_cdns_stream_config config;
-	struct device *dev = &pdev->dev;
+	struct device *dev = &auxdev->dev;
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
@@ -1526,9 +1527,9 @@ int intel_master_startup(struct platform_device *pdev)
 	return ret;
 }
 
-static int intel_master_remove(struct platform_device *pdev)
+static void intel_link_remove(struct auxiliary_device *auxdev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &auxdev->dev;
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
@@ -1544,19 +1545,17 @@ static int intel_master_remove(struct platform_device *pdev)
 		snd_soc_unregister_component(dev);
 	}
 	sdw_bus_master_delete(bus);
-
-	return 0;
 }
 
-int intel_master_process_wakeen_event(struct platform_device *pdev)
+int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &auxdev->dev;
 	struct sdw_intel *sdw;
 	struct sdw_bus *bus;
 	void __iomem *shim;
 	u16 wake_sts;
 
-	sdw = platform_get_drvdata(pdev);
+	sdw = dev_get_drvdata(dev);
 	bus = &sdw->cdns.bus;
 
 	if (bus->prop.hw_disabled) {
@@ -1978,17 +1977,22 @@ static const struct dev_pm_ops intel_pm = {
 	SET_RUNTIME_PM_OPS(intel_suspend_runtime, intel_resume_runtime, NULL)
 };
 
-static struct platform_driver sdw_intel_drv = {
-	.probe = intel_master_probe,
-	.remove = intel_master_remove,
+static const struct auxiliary_device_id intel_link_id_table[] = {
+	{ .name = "soundwire_intel.link" },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, intel_link_id_table);
+
+static struct auxiliary_driver sdw_intel_drv = {
+	.probe = intel_link_probe,
+	.remove = intel_link_remove,
 	.driver = {
-		.name = "intel-sdw",
+		/* auxiliary_driver_register() sets .name to be the modname */
 		.pm = &intel_pm,
-	}
+	},
+	.id_table = intel_link_id_table
 };
-
-module_platform_driver(sdw_intel_drv);
+module_auxiliary_driver(sdw_intel_drv);
 
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_ALIAS("platform:intel-sdw");
-MODULE_DESCRIPTION("Intel Soundwire Master Driver");
+MODULE_DESCRIPTION("Intel Soundwire Link Driver");
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 06bac8ba14e9..0b47b148da3f 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -7,7 +7,6 @@
 /**
  * struct sdw_intel_link_res - Soundwire Intel link resource structure,
  * typically populated by the controller driver.
- * @pdev: platform_device
  * @mmio_base: mmio base of SoundWire registers
  * @registers: Link IO registers base
  * @shim: Audio shim pointer
@@ -23,7 +22,6 @@
  * @list: used to walk-through all masters exposed by the same controller
  */
 struct sdw_intel_link_res {
-	struct platform_device *pdev;
 	void __iomem *mmio_base; /* not strictly needed, useful for debug */
 	void __iomem *registers;
 	void __iomem *shim;
@@ -48,7 +46,15 @@ struct sdw_intel {
 #endif
 };
 
-int intel_master_startup(struct platform_device *pdev);
-int intel_master_process_wakeen_event(struct platform_device *pdev);
+int intel_link_startup(struct auxiliary_device *auxdev);
+int intel_link_process_wakeen_event(struct auxiliary_device *auxdev);
+
+struct sdw_intel_link_dev {
+	struct auxiliary_device auxdev;
+	struct sdw_intel_link_res link_res;
+};
+
+#define auxiliary_dev_to_sdw_intel_link_dev(auxiliary_dev) \
+	container_of(auxiliary_dev, struct sdw_intel_link_dev, auxdev)
 
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 05b726cdfebc..3cb74060ccae 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -12,7 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw_intel.h>
 #include "cadence_master.h"
@@ -24,28 +24,65 @@
 #define SDW_LINK_BASE		0x30000
 #define SDW_LINK_SIZE		0x10000
 
+static void intel_link_auxdev_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct sdw_intel_link_dev *ldev = auxiliary_dev_to_sdw_intel_link_dev(auxdev);
+
+	kfree(ldev);
+}
+
+static int intel_link_dev_init(struct sdw_intel_link_dev *ldev,
+			       struct device *parent,
+			       struct fwnode_handle *fwnode,
+			       const char *name,
+			       int link_id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = &ldev->auxdev;
+	auxdev->name = name;
+	auxdev->dev.parent = parent;
+	auxdev->dev.fwnode = fwnode;
+	auxdev->dev.release = intel_link_auxdev_release;
+
+	/* we don't use an IDA since we already have a link ID */
+	auxdev->id = link_id;
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret < 0)
+		dev_err(parent, "failed to initialize link dev %s link_id %d\n",
+			name, link_id);
+
+	return ret;
+}
+
+static void intel_link_dev_unregister(struct sdw_intel_link_dev *ldev)
+{
+	auxiliary_device_delete(&ldev->auxdev);
+	auxiliary_device_uninit(&ldev->auxdev);
+}
+
 static int sdw_intel_cleanup(struct sdw_intel_ctx *ctx)
 {
-	struct sdw_intel_link_res *link = ctx->links;
+	struct sdw_intel_link_dev *ldev;
 	u32 link_mask;
 	int i;
 
-	if (!link)
-		return 0;
-
 	link_mask = ctx->link_mask;
 
-	for (i = 0; i < ctx->count; i++, link++) {
+	for (i = 0; i < ctx->count; i++) {
 		if (!(link_mask & BIT(i)))
 			continue;
 
-		if (link->pdev) {
-			pm_runtime_disable(&link->pdev->dev);
-			platform_device_unregister(link->pdev);
-		}
+		ldev = ctx->ldev[i];
 
-		if (!link->clock_stop_quirks)
-			pm_runtime_put_noidle(link->dev);
+		pm_runtime_disable(&ldev->auxdev.dev);
+		intel_link_dev_unregister(ldev);
+
+		if (!ldev->link_res.clock_stop_quirks)
+			pm_runtime_put_noidle(ldev->link_res.dev);
 	}
 
 	return 0;
@@ -91,9 +128,8 @@ EXPORT_SYMBOL_NS(sdw_intel_thread, SOUNDWIRE_INTEL_INIT);
 static struct sdw_intel_ctx
 *sdw_intel_probe_controller(struct sdw_intel_res *res)
 {
-	struct platform_device_info pdevinfo;
-	struct platform_device *pdev;
 	struct sdw_intel_link_res *link;
+	struct sdw_intel_link_dev *ldev;
 	struct sdw_intel_ctx *ctx;
 	struct acpi_device *adev;
 	struct sdw_slave *slave;
@@ -103,6 +139,7 @@ static struct sdw_intel_ctx
 	int num_slaves = 0;
 	int count;
 	int i;
+	int ret;
 
 	if (!res)
 		return NULL;
@@ -116,35 +153,72 @@ static struct sdw_intel_ctx
 	count = res->count;
 	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
 
-	ctx = devm_kzalloc(&adev->dev, sizeof(*ctx), GFP_KERNEL);
+	/*
+	 * we need to alloc/free memory manually and can't use devm:
+	 * this routine may be called from a workqueue, and not from
+	 * the parent .probe.
+	 * If devm_ was used, the memory might never be freed on errors.
+	 */
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return NULL;
 
 	ctx->count = count;
-	ctx->links = devm_kcalloc(&adev->dev, ctx->count,
-				  sizeof(*ctx->links), GFP_KERNEL);
-	if (!ctx->links)
+
+	/*
+	 * allocate the array of pointers. The link-specific data is allocated
+	 * as part of the first loop below and released with the auxiliary_device_uninit().
+	 * If some links are disabled, the link pointer will remain NULL. Given that the
+	 * number of links is small, this is simpler than using a list to keep track of links.
+	 */
+	ctx->ldev = kcalloc(ctx->count, sizeof(*ctx->ldev), GFP_KERNEL);
+	if (!ctx->ldev) {
+		kfree(ctx);
 		return NULL;
+	}
 
-	ctx->count = count;
 	ctx->mmio_base = res->mmio_base;
 	ctx->link_mask = res->link_mask;
 	ctx->handle = res->handle;
 	mutex_init(&ctx->shim_lock);
 
-	link = ctx->links;
 	link_mask = ctx->link_mask;
 
 	INIT_LIST_HEAD(&ctx->link_list);
 
-	/* Create SDW Master devices */
-	for (i = 0; i < count; i++, link++) {
-		if (!(link_mask & BIT(i))) {
-			dev_dbg(&adev->dev,
-				"Link %d masked, will not be enabled\n", i);
+	for (i = 0; i < count; i++) {
+		if (!(link_mask & BIT(i)))
 			continue;
+
+		/* Alloc and init devices */
+		ldev = kzalloc(sizeof(*ldev), GFP_KERNEL);
+		if (!ldev)
+			goto err;
+
+		/*
+		 * keep a handle on the allocated memory, to be used in all other functions.
+		 * Since the same pattern is used to skip links that are not enabled, there is
+		 * not need to check if ctx->ldev[i] is NULL later on.
+		 */
+		ctx->ldev[i] = ldev;
+
+		ret = intel_link_dev_init(ldev,
+					  res->parent,
+					  acpi_fwnode_handle(adev),
+					  "link", /* prefixed by core with "soundwire_intel." */
+					  i);
+		if (ret < 0) {
+			/*
+			 * We need to free the memory allocated in the current iteration
+			 */
+			kfree(ldev);
+
+			goto err;
 		}
 
+		link = &ldev->link_res;
+
+		/* now set link information */
 		link->mmio_base = res->mmio_base;
 		link->registers = res->mmio_base + SDW_LINK_BASE
 			+ (SDW_LINK_SIZE * i);
@@ -159,24 +233,16 @@ static struct sdw_intel_ctx
 		link->shim_mask = &ctx->shim_mask;
 		link->link_mask = link_mask;
 
-		memset(&pdevinfo, 0, sizeof(pdevinfo));
-
-		pdevinfo.parent = res->parent;
-		pdevinfo.name = "intel-sdw";
-		pdevinfo.id = i;
-		pdevinfo.fwnode = acpi_fwnode_handle(adev);
-		pdevinfo.data = link;
-		pdevinfo.size_data = sizeof(*link);
-
-		pdev = platform_device_register_full(&pdevinfo);
-		if (IS_ERR(pdev)) {
-			dev_err(&adev->dev,
-				"platform device creation failed: %ld\n",
-				PTR_ERR(pdev));
+		ret = auxiliary_device_add(&ldev->auxdev);
+		if (ret < 0) {
+			dev_err(&adev->dev, "failed to add link dev %s link_id %d\n",
+				ldev->auxdev.name, i);
+			/* ldev will be freed with the put_device() and .release sequence */
+			auxiliary_device_uninit(&ldev->auxdev);
 			goto err;
 		}
-		link->pdev = pdev;
-		link->cdns = platform_get_drvdata(pdev);
+
+		link->cdns = dev_get_drvdata(&ldev->auxdev.dev);
 
 		list_add_tail(&link->list, &ctx->link_list);
 		bus = &link->cdns->bus;
@@ -185,8 +251,7 @@ static struct sdw_intel_ctx
 			num_slaves++;
 	}
 
-	ctx->ids = devm_kcalloc(&adev->dev, num_slaves,
-				sizeof(*ctx->ids), GFP_KERNEL);
+	ctx->ids = kcalloc(num_slaves, sizeof(*ctx->ids), GFP_KERNEL);
 	if (!ctx->ids)
 		goto err;
 
@@ -204,8 +269,14 @@ static struct sdw_intel_ctx
 	return ctx;
 
 err:
-	ctx->count = i;
-	sdw_intel_cleanup(ctx);
+	while (i--) {
+		if (!(link_mask & BIT(i)))
+			continue;
+		ldev = ctx->ldev[i];
+		intel_link_dev_unregister(ldev);
+	}
+	kfree(ctx->ldev);
+	kfree(ctx);
 	return NULL;
 }
 
@@ -213,7 +284,7 @@ static int
 sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
 {
 	struct acpi_device *adev;
-	struct sdw_intel_link_res *link;
+	struct sdw_intel_link_dev *ldev;
 	u32 caps;
 	u32 link_mask;
 	int i;
@@ -232,27 +303,28 @@ sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
 		return -EINVAL;
 	}
 
-	if (!ctx->links)
+	if (!ctx->ldev)
 		return -EINVAL;
 
-	link = ctx->links;
 	link_mask = ctx->link_mask;
 
 	/* Startup SDW Master devices */
-	for (i = 0; i < ctx->count; i++, link++) {
+	for (i = 0; i < ctx->count; i++) {
 		if (!(link_mask & BIT(i)))
 			continue;
 
-		intel_master_startup(link->pdev);
+		ldev = ctx->ldev[i];
 
-		if (!link->clock_stop_quirks) {
+		intel_link_startup(&ldev->auxdev);
+
+		if (!ldev->link_res.clock_stop_quirks) {
 			/*
 			 * we need to prevent the parent PCI device
 			 * from entering pm_runtime suspend, so that
 			 * power rails to the SoundWire IP are not
 			 * turned off.
 			 */
-			pm_runtime_get_noresume(link->dev);
+			pm_runtime_get_noresume(ldev->link_res.dev);
 		}
 	}
 
@@ -297,27 +369,31 @@ EXPORT_SYMBOL_NS(sdw_intel_startup, SOUNDWIRE_INTEL_INIT);
 void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 {
 	sdw_intel_cleanup(ctx);
+	kfree(ctx->ids);
+	kfree(ctx->ldev);
+	kfree(ctx);
 }
 EXPORT_SYMBOL_NS(sdw_intel_exit, SOUNDWIRE_INTEL_INIT);
 
 void sdw_intel_process_wakeen_event(struct sdw_intel_ctx *ctx)
 {
-	struct sdw_intel_link_res *link;
+	struct sdw_intel_link_dev *ldev;
 	u32 link_mask;
 	int i;
 
-	if (!ctx->links)
+	if (!ctx->ldev)
 		return;
 
-	link = ctx->links;
 	link_mask = ctx->link_mask;
 
 	/* Startup SDW Master devices */
-	for (i = 0; i < ctx->count; i++, link++) {
+	for (i = 0; i < ctx->count; i++) {
 		if (!(link_mask & BIT(i)))
 			continue;
 
-		intel_master_process_wakeen_event(link->pdev);
+		ldev = ctx->ldev[i];
+
+		intel_link_process_wakeen_event(&ldev->auxdev);
 	}
 }
 EXPORT_SYMBOL_NS(sdw_intel_process_wakeen_event, SOUNDWIRE_INTEL_INIT);
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 3a5446ac014a..1ebea7764011 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -58,7 +58,7 @@ struct sdw_intel_acpi_info {
 	u32 link_mask;
 };
 
-struct sdw_intel_link_res;
+struct sdw_intel_link_dev;
 
 /* Intel clock-stop/pm_runtime quirk definitions */
 
@@ -109,7 +109,7 @@ struct sdw_intel_slave_id {
  * Controller
  * @num_slaves: total number of devices exposed across all enabled links
  * @handle: ACPI parent handle
- * @links: information for each link (controller-specific and kept
+ * @ldev: information for each link (controller-specific and kept
  * opaque here)
  * @ids: array of slave_id, representing Slaves exposed across all enabled
  * links
@@ -123,7 +123,7 @@ struct sdw_intel_ctx {
 	u32 link_mask;
 	int num_slaves;
 	acpi_handle handle;
-	struct sdw_intel_link_res *links;
+	struct sdw_intel_link_dev **ldev;
 	struct sdw_intel_slave_id *ids;
 	struct list_head link_list;
 	struct mutex shim_lock; /* lock for access to shared SHIM registers */
-- 
2.17.1


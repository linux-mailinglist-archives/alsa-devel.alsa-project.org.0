Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C320534F640
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 03:32:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E34B167E;
	Wed, 31 Mar 2021 03:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E34B167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617154356;
	bh=AfbQWDv9vqSuEWiLokkjHfu1eKDmTm45FQaXp2Ea64w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ftvn8u4V0715boFlWPN+Wec6IJqOveUhLB6vjvuSdRUbLDqfzw59rZ18fTOe3n/zf
	 d9x/qYVm/pfBDsEto5/SLJSdIHGeV+Im6+gbeHQmVYsIkNLLZPtzVi3CJQRZBR1qJv
	 3KrN29rUqAePWevAZTM17zw6uoZWDdiZSEQ+h+c0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82EF6F8016E;
	Wed, 31 Mar 2021 03:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C387F80166; Wed, 31 Mar 2021 03:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7FDEF8013F
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 03:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7FDEF8013F
IronPort-SDR: W7En6mtiD8EhD2zc/yb3C0EQ6ceURQF1zlkyGPcugCy5ocfeTU0YiCqB+gLqkRL7YcrjzzeZ5v
 2Ltb6f/IXrTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179021815"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="179021815"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 18:30:52 -0700
IronPort-SDR: mQ+5x0b2r0MhP7MuBkdgRkpRR34bC8U4q8LD97Wx4CpH69sT7bw6G4QscBlCE1tHdX5+RT/6zM
 5cQAgCOS4+6A==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="411896362"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 18:30:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2] soundwire: intel: move to auxiliary bus
Date: Wed, 31 Mar 2021 09:30:37 +0800
Message-Id: <20210331013037.14873-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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
v2:
 - add link_dev_register for all kzalloc, device_init, and device_add.
---
 drivers/soundwire/Kconfig           |   1 +
 drivers/soundwire/intel.c           |  56 ++++---
 drivers/soundwire/intel.h           |  14 +-
 drivers/soundwire/intel_init.c      | 228 +++++++++++++++++++---------
 include/linux/soundwire/sdw_intel.h |   6 +-
 5 files changed, 200 insertions(+), 105 deletions(-)

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
index fd95f94630b1..c11e3d8cd308 100644
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
@@ -1327,11 +1327,14 @@ static int intel_init(struct sdw_intel *sdw)
 }
 
 /*
- * probe and init
+ * probe and init (aux_dev_id argument is required by function prototype but not used)
  */
-static int intel_master_probe(struct platform_device *pdev)
+static int intel_link_probe(struct auxiliary_device *auxdev,
+			    const struct auxiliary_device_id *aux_dev_id)
+
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &auxdev->dev;
+	struct sdw_intel_link_dev *ldev = auxiliary_dev_to_sdw_intel_link_dev(auxdev);
 	struct sdw_intel *sdw;
 	struct sdw_cdns *cdns;
 	struct sdw_bus *bus;
@@ -1344,14 +1347,14 @@ static int intel_master_probe(struct platform_device *pdev)
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
 
@@ -1384,10 +1387,10 @@ static int intel_master_probe(struct platform_device *pdev)
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
@@ -1524,9 +1527,9 @@ int intel_master_startup(struct platform_device *pdev)
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
@@ -1542,19 +1545,17 @@ static int intel_master_remove(struct platform_device *pdev)
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
@@ -1976,17 +1977,22 @@ static const struct dev_pm_ops intel_pm = {
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
index 05b726cdfebc..5b32a2ffd376 100644
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
@@ -24,28 +24,108 @@
 #define SDW_LINK_BASE		0x30000
 #define SDW_LINK_SIZE		0x10000
 
+static void intel_link_dev_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct sdw_intel_link_dev *ldev = auxiliary_dev_to_sdw_intel_link_dev(auxdev);
+
+	kfree(ldev);
+}
+
+/* alloc, init and add link devices */
+static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *res,
+							  struct sdw_intel_ctx *ctx,
+							  struct fwnode_handle *fwnode,
+							  const char *name,
+							  int link_id)
+{
+	struct sdw_intel_link_dev *ldev;
+	struct sdw_intel_link_res *link;
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	ldev = kzalloc(sizeof(*ldev), GFP_KERNEL);
+	if (!ldev)
+		return ERR_PTR(-ENOMEM);
+
+	auxdev = &ldev->auxdev;
+	auxdev->name = name;
+	auxdev->dev.parent = res->parent;
+	auxdev->dev.fwnode = fwnode;
+	auxdev->dev.release = intel_link_dev_release;
+
+	/* we don't use an IDA since we already have a link ID */
+	auxdev->id = link_id;
+
+	/*
+	 * keep a handle on the allocated memory, to be used in all other functions.
+	 * Since the same pattern is used to skip links that are not enabled, there is
+	 * no need to check if ctx->ldev[i] is NULL later on.
+	 */
+	ctx->ldev[link_id] = ldev;
+
+	/* Add link information used in the driver probe */
+	link = &ldev->link_res;
+	link->mmio_base = res->mmio_base;
+	link->registers = res->mmio_base + SDW_LINK_BASE
+		+ (SDW_LINK_SIZE * link_id);
+	link->shim = res->mmio_base + SDW_SHIM_BASE;
+	link->alh = res->mmio_base + SDW_ALH_BASE;
+
+	link->ops = res->ops;
+	link->dev = res->dev;
+
+	link->clock_stop_quirks = res->clock_stop_quirks;
+	link->shim_lock = &ctx->shim_lock;
+	link->shim_mask = &ctx->shim_mask;
+	link->link_mask = ctx->link_mask;
+
+	/* now follow the two-step init/add sequence */
+	ret = auxiliary_device_init(auxdev);
+	if (ret < 0) {
+		dev_err(res->parent, "failed to initialize link dev %s link_id %d\n",
+			name, link_id);
+		kfree(ldev);
+		return ERR_PTR(ret);
+	}
+
+	ret = auxiliary_device_add(&ldev->auxdev);
+	if (ret < 0) {
+		dev_err(res->parent, "failed to add link dev %s link_id %d\n",
+			ldev->auxdev.name, link_id);
+		/* ldev will be freed with the put_device() and .release sequence */
+		auxiliary_device_uninit(&ldev->auxdev);
+		return ERR_PTR(ret);
+	}
+
+	return ldev;
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
@@ -91,9 +171,8 @@ EXPORT_SYMBOL_NS(sdw_intel_thread, SOUNDWIRE_INTEL_INIT);
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
@@ -116,67 +195,60 @@ static struct sdw_intel_ctx
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
-		}
 
-		link->mmio_base = res->mmio_base;
-		link->registers = res->mmio_base + SDW_LINK_BASE
-			+ (SDW_LINK_SIZE * i);
-		link->shim = res->mmio_base + SDW_SHIM_BASE;
-		link->alh = res->mmio_base + SDW_ALH_BASE;
-
-		link->ops = res->ops;
-		link->dev = res->dev;
-
-		link->clock_stop_quirks = res->clock_stop_quirks;
-		link->shim_lock = &ctx->shim_lock;
-		link->shim_mask = &ctx->shim_mask;
-		link->link_mask = link_mask;
-
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
+		/*
+		 * init and add a device for each link
+		 *
+		 * The name of the device will be soundwire_intel.link.[i],
+		 * with the "soundwire_intel" module prefix automatically added
+		 * by the auxiliary bus core.
+		 */
+		ldev = intel_link_dev_register(res,
+					       ctx,
+					       acpi_fwnode_handle(adev),
+					       "link",
+					       i);
+		if (IS_ERR(ldev))
 			goto err;
-		}
-		link->pdev = pdev;
-		link->cdns = platform_get_drvdata(pdev);
+
+		link = &ldev->link_res;
+		link->cdns = dev_get_drvdata(&ldev->auxdev.dev);
 
 		list_add_tail(&link->list, &ctx->link_list);
 		bus = &link->cdns->bus;
@@ -185,8 +257,7 @@ static struct sdw_intel_ctx
 			num_slaves++;
 	}
 
-	ctx->ids = devm_kcalloc(&adev->dev, num_slaves,
-				sizeof(*ctx->ids), GFP_KERNEL);
+	ctx->ids = kcalloc(num_slaves, sizeof(*ctx->ids), GFP_KERNEL);
 	if (!ctx->ids)
 		goto err;
 
@@ -204,8 +275,14 @@ static struct sdw_intel_ctx
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
 
@@ -213,7 +290,7 @@ static int
 sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
 {
 	struct acpi_device *adev;
-	struct sdw_intel_link_res *link;
+	struct sdw_intel_link_dev *ldev;
 	u32 caps;
 	u32 link_mask;
 	int i;
@@ -232,27 +309,28 @@ sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
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
 
@@ -297,27 +375,31 @@ EXPORT_SYMBOL_NS(sdw_intel_startup, SOUNDWIRE_INTEL_INIT);
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


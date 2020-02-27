Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9757172B68
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 23:35:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E1F016C9;
	Thu, 27 Feb 2020 23:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E1F016C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582842917;
	bh=7pvnTa14nJsds6BGLtqQKMI7Vr8MzF7M36UccJNJN2Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YZWjdyLCmhZ3r19hx6+LaGez8rY2XKErvGCKMIf3u+o/1a+9n0bd5dpbAp/ULO01s
	 trdcQoqdmiO34f7J2Owq4WlISHmLyxTxkA4cTQFa6biwIM3mAhvwiTw673Cy27joEj
	 FlwJVg/dE8h66laGP3EJJASBGzOTA0j5m0fF/0nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1257EF8027D;
	Thu, 27 Feb 2020 23:32:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2031F80260; Thu, 27 Feb 2020 23:32:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODYSUB_5,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15982F80142
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 23:32:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15982F80142
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 14:32:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="411194822"
Received: from azeira-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.147.250])
 by orsmga005.jf.intel.com with ESMTP; 27 Feb 2020 14:32:23 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] soundwire: intel: transition to sdw_master_device/driver
 support
Date: Thu, 27 Feb 2020 16:32:00 -0600
Message-Id: <20200227223206.5020-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
References: <20200227223206.5020-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Use sdw_master_device and driver instead of platform devices

In addition, rather than a plain-vanilla init/exit, this patch
provides 3 steps in the initialization (ACPI scan, probe, startup)
which makes it easier to detect platform support for SoundWire,
allocate required resources as early as possible, and conversely help
make the startup() callback lighter-weight with only hardware register
setup.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c      |  97 ++++++-----
 drivers/soundwire/intel.h      |   8 +-
 drivers/soundwire/intel_init.c | 284 +++++++++++++++++++++++++--------
 3 files changed, 286 insertions(+), 103 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index a327669c757b..5a583382cec4 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -11,12 +11,12 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/platform_device.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
+#include <linux/soundwire/sdw_type.h>
 #include "cadence_master.h"
 #include "bus.h"
 #include "intel.h"
@@ -92,8 +92,6 @@
 #define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
 #define SDW_ALH_STRMZCFG_CHN		GENMASK(19, 16)
 
-#define SDW_INTEL_QUIRK_MASK_BUS_DISABLE	BIT(1)
-
 enum intel_pdi_type {
 	INTEL_PDI_IN = 0,
 	INTEL_PDI_OUT = 1,
@@ -1083,24 +1081,23 @@ static int intel_init(struct sdw_intel *sdw)
 /*
  * probe and init
  */
-static int intel_probe(struct platform_device *pdev)
+static int intel_master_probe(struct sdw_master_device *md, void *link_ctx)
 {
-	struct sdw_cdns_stream_config config;
 	struct sdw_intel *sdw;
 	int ret;
 
-	sdw = devm_kzalloc(&pdev->dev, sizeof(*sdw), GFP_KERNEL);
+	sdw = devm_kzalloc(&md->dev, sizeof(*sdw), GFP_KERNEL);
 	if (!sdw)
 		return -ENOMEM;
 
-	sdw->instance = pdev->id;
-	sdw->link_res = dev_get_platdata(&pdev->dev);
-	sdw->cdns.dev = &pdev->dev;
+	sdw->instance = md->link_id;
+	sdw->link_res = link_ctx;
+	sdw->cdns.dev = &md->dev;
 	sdw->cdns.registers = sdw->link_res->registers;
-	sdw->cdns.instance = sdw->instance;
+	sdw->cdns.instance = md->link_id;
 	sdw->cdns.msg_count = 0;
-	sdw->cdns.bus.dev = &pdev->dev;
-	sdw->cdns.bus.link_id = pdev->id;
+	sdw->cdns.bus.dev = &md->dev;
+	sdw->cdns.bus.link_id = md->link_id;
 
 	sdw_cdns_probe(&sdw->cdns);
 
@@ -1108,16 +1105,52 @@ static int intel_probe(struct platform_device *pdev)
 	sdw_intel_ops.read_prop = intel_prop_read;
 	sdw->cdns.bus.ops = &sdw_intel_ops;
 
-	platform_set_drvdata(pdev, sdw);
+	md->pdata = sdw;
+
+	/* set driver data, accessed by snd_soc_dai_set_drvdata() */
+	dev_set_drvdata(&md->dev, &sdw->cdns);
 
 	ret = sdw_add_bus_master(&sdw->cdns.bus);
 	if (ret) {
-		dev_err(&pdev->dev, "sdw_add_bus_master fail: %d\n", ret);
+		dev_err(&md->dev, "sdw_add_bus_master fail: %d\n", ret);
 		return ret;
 	}
 
+	if (sdw->cdns.bus.prop.hw_disabled)
+		dev_info(&md->dev,
+			 "SoundWire master %d is disabled, will be ignored\n",
+			 sdw->cdns.bus.link_id);
+
+	/* Acquire IRQ */
+	ret = request_threaded_irq(sdw->link_res->irq,
+				   sdw_cdns_irq, sdw_cdns_thread,
+				   IRQF_SHARED, KBUILD_MODNAME, &sdw->cdns);
+	if (ret < 0) {
+		dev_err(sdw->cdns.dev, "unable to grab IRQ %d, disabling device\n",
+			sdw->link_res->irq);
+		goto err_init;
+	}
+
+	complete(&md->probe_complete);
+
+	return 0;
+
+err_init:
+	sdw_delete_bus_master(&sdw->cdns.bus);
+	return ret;
+}
+
+static int intel_master_startup(struct sdw_master_device *md)
+{
+	struct sdw_cdns_stream_config config;
+	struct sdw_intel *sdw;
+	int ret;
+
+	sdw = md->pdata;
+
 	if (sdw->cdns.bus.prop.hw_disabled) {
-		dev_info(&pdev->dev, "SoundWire master %d is disabled, ignoring\n",
+		dev_info(&md->dev,
+			 "SoundWire master %d is disabled, ignoring\n",
 			 sdw->cdns.bus.link_id);
 		return 0;
 	}
@@ -1135,16 +1168,6 @@ static int intel_probe(struct platform_device *pdev)
 
 	intel_pdi_ch_update(sdw);
 
-	/* Acquire IRQ */
-	ret = request_threaded_irq(sdw->link_res->irq,
-				   sdw_cdns_irq, sdw_cdns_thread,
-				   IRQF_SHARED, KBUILD_MODNAME, &sdw->cdns);
-	if (ret < 0) {
-		dev_err(sdw->cdns.dev, "unable to grab IRQ %d, disabling device\n",
-			sdw->link_res->irq);
-		goto err_init;
-	}
-
 	ret = sdw_cdns_enable_interrupt(&sdw->cdns, true);
 	if (ret < 0) {
 		dev_err(sdw->cdns.dev, "cannot enable interrupts\n");
@@ -1171,17 +1194,17 @@ static int intel_probe(struct platform_device *pdev)
 
 err_interrupt:
 	sdw_cdns_enable_interrupt(&sdw->cdns, false);
-	free_irq(sdw->link_res->irq, sdw);
 err_init:
+	free_irq(sdw->link_res->irq, sdw);
 	sdw_delete_bus_master(&sdw->cdns.bus);
 	return ret;
 }
 
-static int intel_remove(struct platform_device *pdev)
+static int intel_master_remove(struct sdw_master_device *md)
 {
 	struct sdw_intel *sdw;
 
-	sdw = platform_get_drvdata(pdev);
+	sdw = md->pdata;
 
 	if (!sdw->cdns.bus.prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
@@ -1194,17 +1217,19 @@ static int intel_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver sdw_intel_drv = {
-	.probe = intel_probe,
-	.remove = intel_remove,
-	.driver = {
-		.name = "int-sdw",
 
+static struct sdw_master_driver intel_sdw_driver = {
+	.driver = {
+		.name = "intel-master",
+		.owner = THIS_MODULE,
+		.bus = &sdw_bus_type,
 	},
+	.probe = intel_master_probe,
+	.startup = intel_master_startup,
+	.remove = intel_master_remove,
 };
-
-module_platform_driver(sdw_intel_drv);
+module_sdw_master_driver(intel_sdw_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_ALIAS("platform:int-sdw");
+MODULE_ALIAS("sdw:intel-master");
 MODULE_DESCRIPTION("Intel Soundwire Master Driver");
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 38b7c125fb10..795d6213eba5 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -7,7 +7,7 @@
 /**
  * struct sdw_intel_link_res - Soundwire Intel link resource structure,
  * typically populated by the controller driver.
- * @pdev: platform_device
+ * @md: master device
  * @mmio_base: mmio base of SoundWire registers
  * @registers: Link IO registers base
  * @shim: Audio shim pointer
@@ -17,7 +17,7 @@
  * @dev: device implementing hw_params and free callbacks
  */
 struct sdw_intel_link_res {
-	struct platform_device *pdev;
+	struct sdw_master_device *md;
 	void __iomem *mmio_base; /* not strictly needed, useful for debug */
 	void __iomem *registers;
 	void __iomem *shim;
@@ -27,4 +27,8 @@ struct sdw_intel_link_res {
 	struct device *dev;
 };
 
+#define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
+
+#define SDW_INTEL_MASTER_PROBE_TIMEOUT 2000
+
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 4b769409f6f8..a6ff7d2ae8be 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -11,7 +11,7 @@
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
 #include "intel.h"
 
@@ -23,22 +23,51 @@
 #define SDW_LINK_BASE		0x30000
 #define SDW_LINK_SIZE		0x10000
 
-static int link_mask;
-module_param_named(sdw_link_mask, link_mask, int, 0444);
+static int ctrl_link_mask;
+module_param_named(sdw_link_mask, ctrl_link_mask, int, 0444);
 MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
 
-static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)
+static bool is_link_enabled(struct fwnode_handle *fw_node, int i)
+{
+	struct fwnode_handle *link;
+	char name[32];
+	u32 quirk_mask = 0;
+
+	/* Find master handle */
+	snprintf(name, sizeof(name),
+		 "mipi-sdw-link-%d-subproperties", i);
+
+	link = fwnode_get_named_child_node(fw_node, name);
+	if (!link)
+		return false;
+
+	fwnode_property_read_u32(link,
+				 "intel-quirk-mask",
+				 &quirk_mask);
+
+	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
+		return false;
+
+	return true;
+}
+
+static int sdw_intel_cleanup(struct sdw_intel_ctx *ctx)
 {
 	struct sdw_intel_link_res *link = ctx->links;
+	u32 link_mask;
 	int i;
 
 	if (!link)
 		return 0;
 
-	for (i = 0; i < ctx->count; i++) {
-		if (link->pdev)
-			platform_device_unregister(link->pdev);
-		link++;
+	link_mask = ctx->link_mask;
+
+	for (i = 0; i < ctx->count; i++, link++) {
+		if (link_mask && !(link_mask & BIT(i)))
+			continue;
+
+		if (!IS_ERR_OR_NULL(link->md))
+			device_unregister(&link->md->dev);
 	}
 
 	kfree(ctx->links);
@@ -47,112 +76,208 @@ static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)
 	return 0;
 }
 
-static struct sdw_intel_ctx
-*sdw_intel_add_controller(struct sdw_intel_res *res)
+static int
+sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 {
-	struct platform_device_info pdevinfo;
-	struct platform_device *pdev;
-	struct sdw_intel_link_res *link;
-	struct sdw_intel_ctx *ctx;
 	struct acpi_device *adev;
 	int ret, i;
 	u8 count;
-	u32 caps;
 
-	if (acpi_bus_get_device(res->handle, &adev))
-		return NULL;
+	if (acpi_bus_get_device(info->handle, &adev))
+		return -EINVAL;
 
 	/* Found controller, find links supported */
 	count = 0;
 	ret = fwnode_property_read_u8_array(acpi_fwnode_handle(adev),
 					    "mipi-sdw-master-count", &count, 1);
 
-	/* Don't fail on error, continue and use hw value */
+	/*
+	 * In theory we could check the number of links supported in
+	 * hardware, but in that step we cannot assume SoundWire IP is
+	 * powered.
+	 *
+	 * In addition, if the BIOS doesn't even provide this
+	 * 'master-count' property then all the inits based on link
+	 * masks will fail as well.
+	 *
+	 * We will check the hardware capabilities in the startup() step
+	 */
+
 	if (ret) {
 		dev_err(&adev->dev,
 			"Failed to read mipi-sdw-master-count: %d\n", ret);
-		count = SDW_MAX_LINKS;
+		return -EINVAL;
 	}
 
-	/* Check SNDWLCAP.LCOUNT */
-	caps = ioread32(res->mmio_base + SDW_SHIM_BASE + SDW_SHIM_LCAP);
-	caps &= GENMASK(2, 0);
-
-	/* Check HW supported vs property value and use min of two */
-	count = min_t(u8, caps, count);
-
 	/* Check count is within bounds */
 	if (count > SDW_MAX_LINKS) {
 		dev_err(&adev->dev, "Link count %d exceeds max %d\n",
 			count, SDW_MAX_LINKS);
-		return NULL;
+		return -EINVAL;
 	} else if (!count) {
 		dev_warn(&adev->dev, "No SoundWire links detected\n");
-		return NULL;
+		return -EINVAL;
 	}
+	dev_dbg(&adev->dev, "ACPI reports %d SDW Link devices\n", count);
 
+	info->count = count;
+
+	for (i = 0; i < count; i++) {
+		if (ctrl_link_mask && !(ctrl_link_mask & BIT(i))) {
+			dev_dbg(&adev->dev,
+				"Link %d masked, will not be enabled\n", i);
+			continue;
+		}
+
+		if (!is_link_enabled(acpi_fwnode_handle(adev), i)) {
+			dev_dbg(&adev->dev,
+				"Link %d not selected in firmware\n", i);
+			continue;
+		}
+
+		info->link_mask |= BIT(i);
+	}
+
+	return 0;
+}
+
+static struct sdw_intel_ctx
+*sdw_intel_probe_controller(struct sdw_intel_res *res)
+{
+	struct sdw_intel_link_res *link;
+	struct sdw_intel_ctx *ctx;
+	struct acpi_device *adev;
+	struct sdw_master_device *md;
+	unsigned long time;
+	u32 link_mask;
+	int count;
+	int i;
+
+	if (!res)
+		return NULL;
+
+	if (acpi_bus_get_device(res->handle, &adev))
+		return NULL;
+
+	if (!res->count)
+		return NULL;
+
+	count = res->count;
 	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return NULL;
 
-	ctx->count = count;
-	ctx->links = kcalloc(ctx->count, sizeof(*ctx->links), GFP_KERNEL);
+	ctx->links = kcalloc(count, sizeof(*ctx->links), GFP_KERNEL);
 	if (!ctx->links)
 		goto link_err;
 
+	ctx->count = count;
+	ctx->mmio_base = res->mmio_base;
+	ctx->link_mask = res->link_mask;
+	ctx->handle = res->handle;
+
 	link = ctx->links;
+	link_mask = ctx->link_mask;
 
 	/* Create SDW Master devices */
-	for (i = 0; i < count; i++) {
-		if (link_mask && !(link_mask & BIT(i))) {
-			dev_dbg(&adev->dev,
-				"Link %d masked, will not be enabled\n", i);
-			link++;
+	for (i = 0; i < count; i++, link++) {
+		if (link_mask && !(link_mask & BIT(i)))
 			continue;
-		}
 
+		link->mmio_base = res->mmio_base;
 		link->registers = res->mmio_base + SDW_LINK_BASE
-					+ (SDW_LINK_SIZE * i);
+			+ (SDW_LINK_SIZE * i);
 		link->shim = res->mmio_base + SDW_SHIM_BASE;
 		link->alh = res->mmio_base + SDW_ALH_BASE;
-
+		link->irq = res->irq;
 		link->ops = res->ops;
 		link->dev = res->dev;
+		link->clock_stop_quirks = res->clock_stop_quirks;
 
-		memset(&pdevinfo, 0, sizeof(pdevinfo));
+		md = sdw_master_device_add("intel-master",
+					   res->parent,
+					   acpi_fwnode_handle(adev),
+					   i,
+					   link);
 
-		pdevinfo.parent = res->parent;
-		pdevinfo.name = "int-sdw";
-		pdevinfo.id = i;
-		pdevinfo.fwnode = acpi_fwnode_handle(adev);
+		if (IS_ERR(md)) {
+			dev_err(&adev->dev, "Could not create link %d\n", i);
+			goto err;
+		}
 
-		pdev = platform_device_register_full(&pdevinfo);
-		if (IS_ERR(pdev)) {
-			dev_err(&adev->dev,
-				"platform device creation failed: %ld\n",
-				PTR_ERR(pdev));
-			goto pdev_err;
+		/*
+		 * we need to wait for the bus to be probed so that we
+		 * can report ACPI information to the upper layers
+		 */
+		time = wait_for_completion_timeout(&md->probe_complete,
+				msecs_to_jiffies(SDW_INTEL_MASTER_PROBE_TIMEOUT));
+		if (!time) {
+			dev_err(&adev->dev, "Master %d probe timed out\n", i);
+			goto err;
 		}
 
-		link->pdev = pdev;
-		link++;
+		link->md = md;
 	}
 
 	return ctx;
 
-pdev_err:
-	sdw_intel_cleanup_pdev(ctx);
+err:
+	ctx->count = i;
+	sdw_intel_cleanup(ctx);
 link_err:
 	kfree(ctx);
 	return NULL;
 }
 
+static int
+sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
+{
+	struct acpi_device *adev;
+	struct sdw_intel_link_res *link;
+	struct sdw_master_device *md;
+	u32 caps;
+	u32 link_mask;
+	int i;
+
+	if (acpi_bus_get_device(ctx->handle, &adev))
+		return -EINVAL;
+
+	/* Check SNDWLCAP.LCOUNT */
+	caps = ioread32(ctx->mmio_base + SDW_SHIM_BASE + SDW_SHIM_LCAP);
+	caps &= GENMASK(2, 0);
+
+	/* Check HW supported vs property value */
+	if (caps < ctx->count) {
+		dev_err(&adev->dev,
+			"BIOS master count is larger than hardware capabilities\n");
+		return -EINVAL;
+	}
+
+	if (!ctx->links)
+		return -EINVAL;
+
+	link = ctx->links;
+	link_mask = ctx->link_mask;
+
+	/* Startup SDW Master devices */
+	for (i = 0; i < ctx->count; i++, link++) {
+		if (link_mask && !(link_mask & BIT(i)))
+			continue;
+
+		md = link->md;
+
+		sdw_master_device_startup(md);
+	}
+
+	return 0;
+}
+
 static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 				     void *cdata, void **return_value)
 {
-	struct sdw_intel_res *res = cdata;
+	struct sdw_intel_acpi_info *info = cdata;
 	struct acpi_device *adev;
 	acpi_status status;
 	u64 adr;
@@ -166,7 +291,7 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 		return AE_NOT_FOUND;
 	}
 
-	res->handle = handle;
+	info->handle = handle;
 
 	/*
 	 * On some Intel platforms, multiple children of the HDAS
@@ -183,36 +308,65 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 }
 
 /**
- * sdw_intel_init() - SoundWire Intel init routine
+ * sdw_intel_acpi_scan() - SoundWire Intel init routine
  * @parent_handle: ACPI parent handle
- * @res: resource data
+ * @info: description of what firmware/DSDT tables expose
  *
- * This scans the namespace and creates SoundWire link controller devices
- * based on the info queried.
+ * This scans the namespace and queries firmware to figure out which
+ * links to enable. A follow-up use of sdw_intel_probe() and
+ * sdw_intel_startup() is required for creation of devices and bus
+ * startup
  */
-void *sdw_intel_init(acpi_handle *parent_handle, struct sdw_intel_res *res)
+int sdw_intel_acpi_scan(acpi_handle *parent_handle,
+			struct sdw_intel_acpi_info *info)
 {
 	acpi_status status;
 
 	status = acpi_walk_namespace(ACPI_TYPE_DEVICE,
 				     parent_handle, 1,
 				     sdw_intel_acpi_cb,
-				     NULL, res, NULL);
+				     NULL, info, NULL);
 	if (ACPI_FAILURE(status))
-		return NULL;
+		return -ENODEV;
 
-	return sdw_intel_add_controller(res);
+	return sdw_intel_scan_controller(info);
 }
+EXPORT_SYMBOL(sdw_intel_acpi_scan);
 
+/**
+ * sdw_intel_probe() - SoundWire Intel probe routine
+ * @res: resource data
+ *
+ * This creates SoundWire Master and Slave devices below the controller.
+ * All the information necessary is stored in the context, and the res
+ * argument pointer can be freed after this step.
+ */
+struct sdw_intel_ctx
+*sdw_intel_probe(struct sdw_intel_res *res)
+{
+	return sdw_intel_probe_controller(res);
+}
+EXPORT_SYMBOL(sdw_intel_probe);
+
+/**
+ * sdw_intel_startup() - SoundWire Intel startup
+ * @ctx: SoundWire context allocated in the probe
+ *
+ */
+int sdw_intel_startup(struct sdw_intel_ctx *ctx)
+{
+	return sdw_intel_startup_controller(ctx);
+}
+EXPORT_SYMBOL(sdw_intel_startup);
 /**
  * sdw_intel_exit() - SoundWire Intel exit
- * @arg: callback context
+ * @ctx: SoundWire context allocated in the probe
  *
  * Delete the controller instances created and cleanup
  */
 void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 {
-	sdw_intel_cleanup_pdev(ctx);
+	sdw_intel_cleanup(ctx);
 	kfree(ctx);
 }
 EXPORT_SYMBOL(sdw_intel_exit);
-- 
2.20.1


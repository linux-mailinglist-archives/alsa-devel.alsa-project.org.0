Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7095117BF6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 01:00:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D1AD166B;
	Tue, 10 Dec 2019 00:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D1AD166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575936043;
	bh=GVHj9Wnsqdv94iJP2rvSTf3Dtg8+1Jbra6C5l20IUUo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nerRfMyodvGU8pWA/qk5ApO8W09XNNaerly4v4O4vK4y0I1IlXqTNbru1ZWufv/P+
	 a2TrYPzkbORAe9Atk2XROkWjznQVzHtFt5JyUgtY7LCUCdQoPDqA/PN6YXbdBwdAwm
	 j16VTNthJMiBr6VRJh2ctGqYF7h/4cJ/swmagr/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A180F8027D;
	Tue, 10 Dec 2019 00:55:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B925F80276; Tue, 10 Dec 2019 00:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76E0BF80255
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 00:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76E0BF80255
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 15:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="210273647"
Received: from bbower-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.65.172])
 by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 15:55:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 17:55:13 -0600
Message-Id: <20191209235520.18727-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209235520.18727-1-pierre-louis.bossart@linux.intel.com>
References: <20191209235520.18727-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v4 05/11] soundwire: intel: update interfaces
	between ASoC and SoundWire
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The current interfaces between ASoC and SoundWire are limited by the
platform_device infrastructure to an init() and exit() (mapped to the
platform driver.probe and .remove)

To help with the platform detection, machine driver selection and
management of power dependencies between DSP and SoundWire IP, the
ASoC side requires:

a) an ACPI scan helper, to report if any devices are exposed in the
DSDT tables, and if any links are disabled by the BIOS.

b) a probe helper that allocates the resources without actually
starting the bus.

c) a startup helper which does start the bus when all power
dependencies are settled.

d) an exit helper to free all resources

e) an interrupt_enable/disable helper, typically invoked after the
startup helper but also used in suspend routines.

This patch moves all required interfaces to sdw_intel.h, mainly to
allow SoundWire and ASoC parts to be merged separately once the header
files are shared between trees.

To avoid compilation issues, the conflicts in intel_init.c are blindly
removed. This would in theory prevent the code from working, but since
there are no users of the Intel Soundwire driver this has no
impact. Functionality will be restored when the removal of platform
devices is complete.

Support for SoundWire + SOF builds will only be provided once all the
required pieces are upstream.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.h           |  9 ++--
 drivers/soundwire/intel_init.c      | 30 +++--------
 include/linux/soundwire/sdw_intel.h | 77 +++++++++++++++++++++++++++--
 3 files changed, 85 insertions(+), 31 deletions(-)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index d923b6262330..e4cc1d3804ff 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -5,17 +5,20 @@
 #define __SDW_INTEL_LOCAL_H
 
 /**
- * struct sdw_intel_link_res - Soundwire link resources
+ * struct sdw_intel_link_res - Soundwire Intel link resource structure,
+ * typically populated by the controller driver.
+ * @pdev: platform_device
+ * @mmio_base: mmio base of SoundWire registers
  * @registers: Link IO registers base
  * @shim: Audio shim pointer
  * @alh: ALH (Audio Link Hub) pointer
  * @irq: Interrupt line
  * @ops: Shim callback ops
  * @arg: Shim callback ops argument
- *
- * This is set as pdata for each link instance.
  */
 struct sdw_intel_link_res {
+	struct platform_device *pdev;
+	void __iomem *mmio_base; /* not strictly needed, useful for debug */
 	void __iomem *registers;
 	void __iomem *shim;
 	void __iomem *alh;
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 2a2b4d8df462..f8ae199094d3 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -27,19 +27,9 @@ static int link_mask;
 module_param_named(sdw_link_mask, link_mask, int, 0444);
 MODULE_PARM_DESC(sdw_link_mask, "Intel link mask (one bit per link)");
 
-struct sdw_link_data {
-	struct sdw_intel_link_res res;
-	struct platform_device *pdev;
-};
-
-struct sdw_intel_ctx {
-	int count;
-	struct sdw_link_data *links;
-};
-
 static int sdw_intel_cleanup_pdev(struct sdw_intel_ctx *ctx)
 {
-	struct sdw_link_data *link = ctx->links;
+	struct sdw_intel_link_res *link = ctx->links;
 	int i;
 
 	if (!link)
@@ -62,7 +52,7 @@ static struct sdw_intel_ctx
 {
 	struct platform_device_info pdevinfo;
 	struct platform_device *pdev;
-	struct sdw_link_data *link;
+	struct sdw_intel_link_res *link;
 	struct sdw_intel_ctx *ctx;
 	struct acpi_device *adev;
 	int ret, i;
@@ -123,14 +113,12 @@ static struct sdw_intel_ctx
 			continue;
 		}
 
-		link->res.irq = res->irq;
-		link->res.registers = res->mmio_base + SDW_LINK_BASE
+		link->registers = res->mmio_base + SDW_LINK_BASE
 					+ (SDW_LINK_SIZE * i);
-		link->res.shim = res->mmio_base + SDW_SHIM_BASE;
-		link->res.alh = res->mmio_base + SDW_ALH_BASE;
+		link->shim = res->mmio_base + SDW_SHIM_BASE;
+		link->alh = res->mmio_base + SDW_ALH_BASE;
 
-		link->res.ops = res->ops;
-		link->res.arg = res->arg;
+		link->ops = res->ops;
 
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 
@@ -138,8 +126,6 @@ static struct sdw_intel_ctx
 		pdevinfo.name = "int-sdw";
 		pdevinfo.id = i;
 		pdevinfo.fwnode = acpi_fwnode_handle(adev);
-		pdevinfo.data = &link->res;
-		pdevinfo.size_data = sizeof(link->res);
 
 		pdev = platform_device_register_full(&pdevinfo);
 		if (IS_ERR(pdev)) {
@@ -224,10 +210,8 @@ EXPORT_SYMBOL(sdw_intel_init);
  *
  * Delete the controller instances created and cleanup
  */
-void sdw_intel_exit(void *arg)
+void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 {
-	struct sdw_intel_ctx *ctx = arg;
-
 	sdw_intel_cleanup_pdev(ctx);
 	kfree(ctx);
 }
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index c9427cb6020b..034eca8df748 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -16,24 +16,91 @@ struct sdw_intel_ops {
 };
 
 /**
- * struct sdw_intel_res - Soundwire Intel resource structure
+ * struct sdw_intel_acpi_info - Soundwire Intel information found in ACPI tables
+ * @handle: ACPI controller handle
+ * @count: link count found with "sdw-master-count" property
+ * @link_mask: bit-wise mask listing links enabled by BIOS menu
+ *
+ * this structure could be expanded to e.g. provide all the _ADR
+ * information in case the link_mask is not sufficient to identify
+ * platform capabilities.
+ */
+struct sdw_intel_acpi_info {
+	acpi_handle handle;
+	int count;
+	u32 link_mask;
+};
+
+struct sdw_intel_link_res;
+
+/**
+ * struct sdw_intel_ctx - context allocated by the controller
+ * driver probe
+ * @count: link count
+ * @mmio_base: mmio base of SoundWire registers, only used to check
+ * hardware capabilities after all power dependencies are settled.
+ * @link_mask: bit-wise mask listing SoundWire links reported by the
+ * Controller
+ * @handle: ACPI parent handle
+ * @links: information for each link (controller-specific and kept
+ * opaque here)
+ */
+struct sdw_intel_ctx {
+	int count;
+	void __iomem *mmio_base;
+	u32 link_mask;
+	acpi_handle handle;
+	struct sdw_intel_link_res *links;
+};
+
+/**
+ * struct sdw_intel_res - Soundwire Intel global resource structure,
+ * typically populated by the DSP driver
+ *
+ * @count: link count
  * @mmio_base: mmio base of SoundWire registers
  * @irq: interrupt number
  * @handle: ACPI parent handle
  * @parent: parent device
  * @ops: callback ops
- * @arg: callback arg
+ * @dev: device implementing hwparams and free callbacks
+ * @link_mask: bit-wise mask listing links selected by the DSP driver
+ * This mask may be a subset of the one reported by the controller since
+ * machine-specific quirks are handled in the DSP driver.
  */
 struct sdw_intel_res {
+	int count;
 	void __iomem *mmio_base;
 	int irq;
 	acpi_handle handle;
 	struct device *parent;
 	const struct sdw_intel_ops *ops;
-	void *arg;
+	struct device *dev;
+	u32 link_mask;
 };
 
-void *sdw_intel_init(acpi_handle *parent_handle, struct sdw_intel_res *res);
-void sdw_intel_exit(void *arg);
+/*
+ * On Intel platforms, the SoundWire IP has dependencies on power
+ * rails shared with the DSP, and the initialization steps are split
+ * in three. First an ACPI scan to check what the firmware describes
+ * in DSDT tables, then an allocation step (with no hardware
+ * configuration but with all the relevant devices created) and last
+ * the actual hardware configuration. The final stage is a global
+ * interrupt enable which is controlled by the DSP driver. Splitting
+ * these phases helps simplify the boot flow and make early decisions
+ * on e.g. which machine driver to select (I2S mode, HDaudio or
+ * SoundWire).
+ */
+int sdw_intel_acpi_scan(acpi_handle *parent_handle,
+			struct sdw_intel_acpi_info *info);
+
+struct sdw_intel_ctx *
+sdw_intel_probe(struct sdw_intel_res *res);
+
+int sdw_intel_startup(struct sdw_intel_ctx *ctx);
+
+void sdw_intel_exit(struct sdw_intel_ctx *ctx);
+
+void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable);
 
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

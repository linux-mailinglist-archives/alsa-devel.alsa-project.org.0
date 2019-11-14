Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A8DFCD2E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:20:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF70D167C;
	Thu, 14 Nov 2019 19:19:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF70D167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573755610;
	bh=lb6XoW7XFoPyvfYh1YdPCV8ZrsAxbhmrTeOcqVWP2mk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdDXSBvOI1ncEo3U+jreR46BZ+LthT6iaWRsGCJxLdKw154BOLVaVAbnMsUZh0uFl
	 THplB4aXRWf81Dluyyx91rvTLQR86VKdI29Z240C8nX3UAXYXp1uRnd2Cl3ls/bGp3
	 fB2vB/Ahgn5LwXbNwsl5/N6FzPk6q0lAcn57cD4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A6EBF800FD;
	Thu, 14 Nov 2019 19:17:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F72AF80104; Thu, 14 Nov 2019 19:17:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 577BEF800CD
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 577BEF800CD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="195123366"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2019 10:17:28 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 12:16:41 -0600
Message-Id: <20191114181702.22254-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
References: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 01/22] soundwire: intel/cadence: fix
	timeouts in MSI mode
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The existing code uses one pair of interrupt handler/thread per link
but at the hardware level the interrupt is shared. This works fine for
legacy PCI interrupts, but leads to timeouts in MSI (Message-Signaled
Interrupt) mode, likely due to edges being lost.

This patch unifies interrupt handling for all links with a single
threaded IRQ handler. The handler is simplified to the bare minimum of
detecting a SoundWire interrupt, and the thread takes care of dealing
with interrupt sources. This partition follows the model used for the
SOF IPC on HDaudio platforms, where similar timeout issues were
noticed and doing all the interrupt handling/clearing in the thread
improved reliability/stability.

Validation results with 4 links active in parallel show a night-and-day
improvement with no timeouts noticed even during stress tests. Latency
and quality of service are not affected by the change - mostly because
events on a SoundWire link are throttled by the bus frame rate
(typically 8..48kHz).

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c  | 17 ++++++-----
 drivers/soundwire/cadence_master.h  |  4 +++
 drivers/soundwire/intel.c           | 27 ++++-------------
 drivers/soundwire/intel.h           |  2 ++
 drivers/soundwire/intel_init.c      | 45 ++++++++++++++++++++++++++++-
 include/linux/soundwire/sdw_intel.h |  4 +++
 6 files changed, 69 insertions(+), 30 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index fed21e2b2277..362fb6e49bfe 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -17,6 +17,7 @@
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <linux/workqueue.h>
 #include "bus.h"
 #include "cadence_master.h"
 
@@ -745,7 +746,7 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 			     CDNS_MCP_INT_SLAVE_MASK, 0);
 
 		int_status &= ~CDNS_MCP_INT_SLAVE_MASK;
-		ret = IRQ_WAKE_THREAD;
+		schedule_work(&cdns->work);
 	}
 
 	cdns_writel(cdns, CDNS_MCP_INTSTAT, int_status);
@@ -754,13 +755,14 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 EXPORT_SYMBOL(sdw_cdns_irq);
 
 /**
- * sdw_cdns_thread() - Cadence irq thread handler
- * @irq: irq number
- * @dev_id: irq context
+ * To update slave status in a work since we will need to handle
+ * other interrupts eg. CDNS_MCP_INT_RX_WL during the update slave
+ * process.
  */
-irqreturn_t sdw_cdns_thread(int irq, void *dev_id)
+static void cdns_update_slave_status_work(struct work_struct *work)
 {
-	struct sdw_cdns *cdns = dev_id;
+	struct sdw_cdns *cdns =
+		container_of(work, struct sdw_cdns, work);
 	u32 slave0, slave1;
 
 	dev_dbg_ratelimited(cdns->dev, "Slave status change\n");
@@ -777,9 +779,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id)
 	cdns_updatel(cdns, CDNS_MCP_INTMASK,
 		     CDNS_MCP_INT_SLAVE_MASK, CDNS_MCP_INT_SLAVE_MASK);
 
-	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL(sdw_cdns_thread);
 
 /*
  * init routines
@@ -1187,6 +1187,7 @@ int sdw_cdns_probe(struct sdw_cdns *cdns)
 	init_completion(&cdns->tx_complete);
 	cdns->bus.port_ops = &cdns_port_ops;
 
+	INIT_WORK(&cdns->work, cdns_update_slave_status_work);
 	return 0;
 }
 EXPORT_SYMBOL(sdw_cdns_probe);
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 001457cbe5ad..0f108fd31fd9 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -126,6 +126,10 @@ struct sdw_cdns {
 
 	bool link_up;
 	unsigned int msg_count;
+
+	struct work_struct work;
+
+	struct list_head list;
 };
 
 #define bus_to_cdns(_bus) container_of(_bus, struct sdw_cdns, bus)
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index cad1c0b64ee3..23c5c3f9d30d 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1095,6 +1095,7 @@ static int intel_master_probe(struct sdw_master_device *md, void *link_ctx)
 	sdw->cdns.msg_count = 0;
 	sdw->cdns.bus.dev = &md->dev;
 	sdw->cdns.bus.link_id = md->link_id;
+	sdw->link_res->cdns = &sdw->cdns;
 
 	sdw_cdns_probe(&sdw->cdns);
 
@@ -1113,27 +1114,12 @@ static int intel_master_probe(struct sdw_master_device *md, void *link_ctx)
 		return ret;
 	}
 
-	if (sdw->cdns.bus.prop.hw_disabled) {
-		dev_info(&md->dev, "SoundWire master %d is disabled, ignoring\n",
+	if (sdw->cdns.bus.prop.hw_disabled)
+		dev_info(&md->dev,
+			 "SoundWire master %d is disabled, will be ignored\n",
 			 sdw->cdns.bus.link_id);
-		return 0;
-	}
-
-	/* Acquire IRQ */
-	ret = request_threaded_irq(sdw->link_res->irq,
-				   sdw_cdns_irq, sdw_cdns_thread,
-				   IRQF_SHARED, KBUILD_MODNAME, &sdw->cdns);
-	if (ret < 0) {
-		dev_err(sdw->cdns.dev, "unable to grab IRQ %d, disabling device\n",
-			sdw->link_res->irq);
-		goto err_init;
-	}
 
 	return 0;
-
-err_init:
-	sdw_delete_bus_master(&sdw->cdns.bus);
-	return ret;
 }
 
 static int intel_master_startup(struct sdw_master_device *md)
@@ -1145,7 +1131,8 @@ static int intel_master_startup(struct sdw_master_device *md)
 	sdw = md->pdata;
 
 	if (sdw->cdns.bus.prop.hw_disabled) {
-		dev_info(&md->dev, "SoundWire master %d is disabled, ignoring\n",
+		dev_info(&md->dev,
+			 "SoundWire master %d is disabled, ignoring\n",
 			 sdw->cdns.bus.link_id);
 		return 0;
 	}
@@ -1190,7 +1177,6 @@ static int intel_master_startup(struct sdw_master_device *md)
 err_interrupt:
 	sdw_cdns_enable_interrupt(&sdw->cdns, false);
 err_init:
-	free_irq(sdw->link_res->irq, sdw);
 	sdw_delete_bus_master(&sdw->cdns.bus);
 	return ret;
 }
@@ -1204,7 +1190,6 @@ static int intel_master_remove(struct sdw_master_device *md)
 	if (!sdw->cdns.bus.prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
 		sdw_cdns_enable_interrupt(&sdw->cdns, false);
-		free_irq(sdw->link_res->irq, sdw);
 		snd_soc_unregister_component(sdw->cdns.dev);
 	}
 	sdw_delete_bus_master(&sdw->cdns.bus);
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index cfab2f00214d..2ae4fa748686 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -25,6 +25,8 @@ struct sdw_intel_link_res {
 	int irq;
 	const struct sdw_intel_ops *ops;
 	struct device *dev;
+	struct sdw_cdns *cdns;
+	struct list_head list;
 };
 
 #define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 14ffe9ce2929..ed2a83989c72 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -11,8 +11,10 @@
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/interrupt.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
+#include "cadence_master.h"
 #include "intel.h"
 
 #define SDW_LINK_TYPE		4 /* from Intel ACPI documentation */
@@ -161,6 +163,32 @@ void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable)
 }
 EXPORT_SYMBOL(sdw_intel_enable_irq);
 
+static irqreturn_t sdw_intel_irq(int irq, void *dev_id)
+{
+	struct sdw_intel_ctx *ctx = dev_id;
+	u32 int_status;
+
+	int_status = readl(ctx->mmio_base + HDA_DSP_REG_ADSPIS2);
+	if (int_status & HDA_DSP_REG_ADSPIC2_SNDW) {
+		sdw_intel_enable_irq(ctx->mmio_base, false);
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_NONE;
+}
+
+static irqreturn_t sdw_intel_thread(int irq, void *dev_id)
+{
+	struct sdw_intel_ctx *ctx = dev_id;
+	struct sdw_intel_link_res *link;
+
+	list_for_each_entry(link, &ctx->link_list, list)
+		sdw_cdns_irq(irq, link->cdns);
+
+	sdw_intel_enable_irq(ctx->mmio_base, true);
+	return IRQ_HANDLED;
+}
+
 static struct sdw_intel_ctx
 *sdw_intel_probe_controller(struct sdw_intel_res *res)
 {
@@ -171,6 +199,7 @@ static struct sdw_intel_ctx
 	u32 link_mask;
 	int count;
 	int i;
+	int ret;
 
 	if (!res)
 		return NULL;
@@ -196,10 +225,13 @@ static struct sdw_intel_ctx
 	ctx->mmio_base = res->mmio_base;
 	ctx->link_mask = res->link_mask;
 	ctx->handle = res->handle;
+	ctx->irq = res->irq;
 
 	link = ctx->links;
 	link_mask = ctx->link_mask;
 
+	INIT_LIST_HEAD(&ctx->link_list);
+
 	/* Create SDW Master devices */
 	for (i = 0; i < count; i++, link++) {
 		if (link_mask && !(link_mask & BIT(i)))
@@ -220,12 +252,22 @@ static struct sdw_intel_ctx
 			+ (SDW_LINK_SIZE * i);
 		link->shim = res->mmio_base + SDW_SHIM_BASE;
 		link->alh = res->mmio_base + SDW_ALH_BASE;
-		link->irq = res->irq;
 		link->ops = res->ops;
 		link->dev = res->dev;
 
 		/* let the SoundWire master driver to its probe */
 		md->driver->probe(md, link);
+
+		list_add_tail(&link->list, &ctx->link_list);
+	}
+
+	ret = request_threaded_irq(ctx->irq,
+				   sdw_intel_irq, sdw_intel_thread,
+				   IRQF_SHARED, KBUILD_MODNAME, ctx);
+	if (ret < 0) {
+		dev_err(&adev->dev, "unable to grab IRQ %d, disabling device\n",
+			res->irq);
+		goto err;
 	}
 
 	return ctx;
@@ -373,6 +415,7 @@ EXPORT_SYMBOL(sdw_intel_startup);
  */
 void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 {
+	free_irq(ctx->irq, ctx);
 	sdw_intel_cleanup(ctx);
 	kfree(ctx);
 }
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 3ccb38d48eef..9a9ce9fd1d71 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -68,6 +68,8 @@ struct sdw_intel_link_res;
  * @handle: ACPI parent handle
  * @links: information for each link (controller-specific and kept
  * opaque here)
+ * @irq: shared interrupts for all links
+ * @link_list: list to handle interrupts across all links
  */
 struct sdw_intel_ctx {
 	int count;
@@ -75,6 +77,8 @@ struct sdw_intel_ctx {
 	u32 link_mask;
 	acpi_handle handle;
 	struct sdw_intel_link_res *links;
+	int irq;
+	struct list_head link_list;
 };
 
 /**
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

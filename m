Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E3D172B87
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 23:37:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C13E416E6;
	Thu, 27 Feb 2020 23:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C13E416E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582843058;
	bh=eh6KcMDhAXj6B2MMUnCR+PZeLlQUQjI1dXo6v5G10xM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxu32XLQGTp3zX5SIrWHnDChSxdsULRDbd6V8WaARuHF1MLoiFNYbZ7TjiKt5LUNO
	 6c3+IE+dn5ddGejq2CWsf/e2qjeweleXswHzpKRkeOyv17cwFstO3X1oJA/h4xl1wV
	 XSesjfLz1CcbW1B09HxcmhI5RBKw8oVkp91qL5dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DFD3F802BD;
	Thu, 27 Feb 2020 23:32:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4C38F8028C; Thu, 27 Feb 2020 23:32:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0CFAF8013E
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 23:32:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0CFAF8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 14:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="411194852"
Received: from azeira-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.147.250])
 by orsmga005.jf.intel.com with ESMTP; 27 Feb 2020 14:32:30 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/8] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
Date: Thu, 27 Feb 2020 16:32:03 -0600
Message-Id: <20200227223206.5020-6-pierre-louis.bossart@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The existing code uses one pair of interrupt handler/thread per link
but at the hardware level the interrupt is shared. This works fine for
legacy PCI interrupts, but leads to timeouts in MSI (Message-Signaled
Interrupt) mode, likely due to edges being lost.

This patch unifies interrupt handling for all links. The dedicated
handler is removed since we use a common one for all shared interrupt
sources, and the thread function takes care of dealing with interrupt
sources. This partition follows the model used for the SOF IPC on
HDaudio platforms, where similar timeout issues were noticed and doing
all the interrupt handling/clearing in the thread improved
reliability/stability.

Validation results with 4 links active in parallel show a night-and-day
improvement with no timeouts noticed even during stress tests. Latency
and quality of service are not affected by the change - mostly because
events on a SoundWire link are throttled by the bus frame rate
(typically 8..48kHz).

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 18 ++++++++++--------
 drivers/soundwire/cadence_master.h |  4 ++++
 drivers/soundwire/intel.c          | 17 +----------------
 drivers/soundwire/intel.h          |  4 ++++
 drivers/soundwire/intel_init.c     | 20 +++++++++++++++++++-
 5 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 9bec270d0fa4..bd868746ad22 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -17,6 +17,7 @@
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <linux/workqueue.h>
 #include "bus.h"
 #include "cadence_master.h"
 
@@ -776,7 +777,7 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 			     CDNS_MCP_INT_SLAVE_MASK, 0);
 
 		int_status &= ~CDNS_MCP_INT_SLAVE_MASK;
-		ret = IRQ_WAKE_THREAD;
+		schedule_work(&cdns->work);
 	}
 
 	cdns_writel(cdns, CDNS_MCP_INTSTAT, int_status);
@@ -785,13 +786,15 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 EXPORT_SYMBOL(sdw_cdns_irq);
 
 /**
- * sdw_cdns_thread() - Cadence irq thread handler
- * @irq: irq number
- * @dev_id: irq context
+ * To update slave status in a work since we will need to handle
+ * other interrupts eg. CDNS_MCP_INT_RX_WL during the update slave
+ * process.
+ * @work: cdns worker thread
  */
-irqreturn_t sdw_cdns_thread(int irq, void *dev_id)
+static void cdns_update_slave_status_work(struct work_struct *work)
 {
-	struct sdw_cdns *cdns = dev_id;
+	struct sdw_cdns *cdns =
+		container_of(work, struct sdw_cdns, work);
 	u32 slave0, slave1;
 
 	dev_dbg_ratelimited(cdns->dev, "Slave status change\n");
@@ -808,9 +811,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id)
 	cdns_updatel(cdns, CDNS_MCP_INTMASK,
 		     CDNS_MCP_INT_SLAVE_MASK, CDNS_MCP_INT_SLAVE_MASK);
 
-	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL(sdw_cdns_thread);
 
 /*
  * init routines
@@ -1226,6 +1227,7 @@ int sdw_cdns_probe(struct sdw_cdns *cdns)
 	init_completion(&cdns->tx_complete);
 	cdns->bus.port_ops = &cdns_port_ops;
 
+	INIT_WORK(&cdns->work, cdns_update_slave_status_work);
 	return 0;
 }
 EXPORT_SYMBOL(sdw_cdns_probe);
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 2de1b2493ffc..ce68ffe757fd 100644
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
index 5a583382cec4..d5533564195a 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1098,6 +1098,7 @@ static int intel_master_probe(struct sdw_master_device *md, void *link_ctx)
 	sdw->cdns.msg_count = 0;
 	sdw->cdns.bus.dev = &md->dev;
 	sdw->cdns.bus.link_id = md->link_id;
+	sdw->link_res->cdns = &sdw->cdns;
 
 	sdw_cdns_probe(&sdw->cdns);
 
@@ -1121,23 +1122,9 @@ static int intel_master_probe(struct sdw_master_device *md, void *link_ctx)
 			 "SoundWire master %d is disabled, will be ignored\n",
 			 sdw->cdns.bus.link_id);
 
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
 	complete(&md->probe_complete);
 
 	return 0;
-
-err_init:
-	sdw_delete_bus_master(&sdw->cdns.bus);
-	return ret;
 }
 
 static int intel_master_startup(struct sdw_master_device *md)
@@ -1195,7 +1182,6 @@ static int intel_master_startup(struct sdw_master_device *md)
 err_interrupt:
 	sdw_cdns_enable_interrupt(&sdw->cdns, false);
 err_init:
-	free_irq(sdw->link_res->irq, sdw);
 	sdw_delete_bus_master(&sdw->cdns.bus);
 	return ret;
 }
@@ -1209,7 +1195,6 @@ static int intel_master_remove(struct sdw_master_device *md)
 	if (!sdw->cdns.bus.prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
 		sdw_cdns_enable_interrupt(&sdw->cdns, false);
-		free_irq(sdw->link_res->irq, sdw);
 		snd_soc_unregister_component(sdw->cdns.dev);
 	}
 	sdw_delete_bus_master(&sdw->cdns.bus);
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 795d6213eba5..2027ad5d0e8a 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -15,6 +15,8 @@
  * @irq: Interrupt line
  * @ops: Shim callback ops
  * @dev: device implementing hw_params and free callbacks
+ * @cdns: Cadence master descriptor
+ * @list: used to walk-through all masters exposed by the same controller
  */
 struct sdw_intel_link_res {
 	struct sdw_master_device *md;
@@ -25,6 +27,8 @@ struct sdw_intel_link_res {
 	int irq;
 	const struct sdw_intel_ops *ops;
 	struct device *dev;
+	struct sdw_cdns *cdns;
+	struct list_head list;
 };
 
 #define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 01c8b390887b..954b21b4712d 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -9,10 +9,12 @@
 
 #include <linux/acpi.h>
 #include <linux/export.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
+#include "cadence_master.h"
 #include "intel.h"
 
 #define SDW_LINK_TYPE		4 /* from Intel ACPI documentation */
@@ -165,6 +167,19 @@ void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable)
 }
 EXPORT_SYMBOL_NS(sdw_intel_enable_irq, SOUNDWIRE_INTEL_INIT);
 
+irqreturn_t sdw_intel_thread(int irq, void *dev_id)
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
+EXPORT_SYMBOL(sdw_intel_thread);
+
 static struct sdw_intel_ctx
 *sdw_intel_probe_controller(struct sdw_intel_res *res)
 {
@@ -205,6 +220,8 @@ static struct sdw_intel_ctx
 	link = ctx->links;
 	link_mask = ctx->link_mask;
 
+	INIT_LIST_HEAD(&ctx->link_list);
+
 	/* Create SDW Master devices */
 	for (i = 0; i < count; i++, link++) {
 		if (link_mask && !(link_mask & BIT(i)))
@@ -215,7 +232,6 @@ static struct sdw_intel_ctx
 			+ (SDW_LINK_SIZE * i);
 		link->shim = res->mmio_base + SDW_SHIM_BASE;
 		link->alh = res->mmio_base + SDW_ALH_BASE;
-		link->irq = res->irq;
 		link->ops = res->ops;
 		link->dev = res->dev;
 		link->clock_stop_quirks = res->clock_stop_quirks;
@@ -243,6 +259,8 @@ static struct sdw_intel_ctx
 		}
 
 		link->md = md;
+
+		list_add_tail(&link->list, &ctx->link_list);
 	}
 
 	return ctx;
-- 
2.20.1


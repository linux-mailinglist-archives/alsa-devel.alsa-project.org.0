Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E1206BC4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 07:34:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3537E17EC;
	Wed, 24 Jun 2020 07:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3537E17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592976895;
	bh=Y+OWiOA4ZHY0FQI9BgcYm6lTS4GAt3paeMmRcySkwdM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j8zrUhRxUBeFyzDV1GLAYqJU349EYWV7RjMoyTZQ9kkjnZX6ILTy7RCrBWBlZJ3B3
	 06xdehlFprSYAeJqDrgA/Hg20a0Xx70/z461eksNzzIW+uJ6xnBGb6GkX6GFflmbB5
	 GeKZ7FC1tWmOPpP5YIdD6vcO+Kz7l+EohgR+IaYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72552F802E3;
	Wed, 24 Jun 2020 07:30:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A9A9F802A7; Wed, 24 Jun 2020 07:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 089E9F802A7
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 07:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 089E9F802A7
IronPort-SDR: 5nF55f9wiiGk2/II8i/VetqeQPB/eBfHVc+2t6W2PJ4j7eOhZSDsL+8hgFdpMxrwW2QPzbGi7P
 RCUYYh2sjJug==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="131776163"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="131776163"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 22:30:32 -0700
IronPort-SDR: Z5Iadnu2KaKjmogVNI3kgNszshfqW3iVsKaX5W/UvZXbK4Kl0I4GiYusmQEd21K6MBvcoJ4Muf
 bDz0XBbshRww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="452513549"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005.jf.intel.com with ESMTP; 23 Jun 2020 22:30:28 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
Date: Wed, 24 Jun 2020 01:35:44 +0800
Message-Id: <20200623173546.21870-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
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
 drivers/soundwire/intel.c          | 15 ---------------
 drivers/soundwire/intel.h          |  4 ++++
 drivers/soundwire/intel_init.c     | 19 +++++++++++++++++++
 5 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 613dbd415b91..24eafe0aa1c3 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -17,6 +17,7 @@
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <linux/workqueue.h>
 #include "bus.h"
 #include "cadence_master.h"
 
@@ -790,7 +791,7 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 			     CDNS_MCP_INT_SLAVE_MASK, 0);
 
 		int_status &= ~CDNS_MCP_INT_SLAVE_MASK;
-		ret = IRQ_WAKE_THREAD;
+		schedule_work(&cdns->work);
 	}
 
 	cdns_writel(cdns, CDNS_MCP_INTSTAT, int_status);
@@ -799,13 +800,15 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
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
@@ -822,9 +825,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id)
 	cdns_updatel(cdns, CDNS_MCP_INTMASK,
 		     CDNS_MCP_INT_SLAVE_MASK, CDNS_MCP_INT_SLAVE_MASK);
 
-	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL(sdw_cdns_thread);
 
 /*
  * init routines
@@ -1427,6 +1428,7 @@ int sdw_cdns_probe(struct sdw_cdns *cdns)
 	init_completion(&cdns->tx_complete);
 	cdns->bus.port_ops = &cdns_port_ops;
 
+	INIT_WORK(&cdns->work, cdns_update_slave_status_work);
 	return 0;
 }
 EXPORT_SYMBOL(sdw_cdns_probe);
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index b410656f8194..7638858397df 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -129,6 +129,10 @@ struct sdw_cdns {
 
 	bool link_up;
 	unsigned int msg_count;
+
+	struct work_struct work;
+
+	struct list_head list;
 };
 
 #define bus_to_cdns(_bus) container_of(_bus, struct sdw_cdns, bus)
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 0a4fc7f65743..06c553d94890 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1258,21 +1258,7 @@ static int intel_master_probe(struct platform_device *pdev)
 			 "SoundWire master %d is disabled, will be ignored\n",
 			 bus->link_id);
 
-	/* Acquire IRQ */
-	ret = request_threaded_irq(sdw->link_res->irq,
-				   sdw_cdns_irq, sdw_cdns_thread,
-				   IRQF_SHARED, KBUILD_MODNAME, cdns);
-	if (ret < 0) {
-		dev_err(dev, "unable to grab IRQ %d, disabling device\n",
-			sdw->link_res->irq);
-		goto err_init;
-	}
-
 	return 0;
-
-err_init:
-	sdw_bus_master_delete(bus);
-	return ret;
 }
 
 int intel_master_startup(struct platform_device *pdev)
@@ -1344,7 +1330,6 @@ static int intel_master_remove(struct platform_device *pdev)
 	if (!bus->prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
 		sdw_cdns_enable_interrupt(cdns, false);
-		free_irq(sdw->link_res->irq, sdw);
 		snd_soc_unregister_component(dev);
 	}
 	sdw_bus_master_delete(bus);
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index d6bdd4d63e08..bf127c88eb51 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -17,6 +17,8 @@
  * @dev: device implementing hw_params and free callbacks
  * @shim_lock: mutex to handle access to shared SHIM registers
  * @shim_mask: global pointer to check SHIM register initialization
+ * @cdns: Cadence master descriptor
+ * @list: used to walk-through all masters exposed by the same controller
  */
 struct sdw_intel_link_res {
 	struct platform_device *pdev;
@@ -29,6 +31,8 @@ struct sdw_intel_link_res {
 	struct device *dev;
 	struct mutex *shim_lock; /* protect shared registers */
 	u32 *shim_mask;
+	struct sdw_cdns *cdns;
+	struct list_head list;
 };
 
 struct sdw_intel {
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index ad3175272e88..63b3beda443d 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -9,6 +9,7 @@
 
 #include <linux/acpi.h>
 #include <linux/export.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -166,6 +167,19 @@ void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable)
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
@@ -209,6 +223,8 @@ static struct sdw_intel_ctx
 	link = ctx->links;
 	link_mask = ctx->link_mask;
 
+	INIT_LIST_HEAD(&ctx->link_list);
+
 	/* Create SDW Master devices */
 	for (i = 0; i < count; i++, link++) {
 		if (!(link_mask & BIT(i))) {
@@ -246,6 +262,9 @@ static struct sdw_intel_ctx
 			goto err;
 		}
 		link->pdev = pdev;
+		link->cdns = platform_get_drvdata(pdev);
+
+		list_add_tail(&link->list, &ctx->link_list);
 	}
 
 	return ctx;
-- 
2.17.1


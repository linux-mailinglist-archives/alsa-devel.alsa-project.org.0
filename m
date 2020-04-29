Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA621BF089
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 08:48:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A80951677;
	Thu, 30 Apr 2020 08:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A80951677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588229307;
	bh=WryodMwVF0rRWiuGKMD4EUGlDV3GVHnZlqkRQddXFXg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8Z1Ch4gqgIe7WdhIrmzs/RC0mS6KSDiYpYWlAyJC9X2M6ytaPkEZmveuh96F/ytC
	 swgPEvBENW2iAqfZmjOK2Zui41+5rMfnsIxgpdQTHp/9CIHDnoyGJkyupK4mBfRWbr
	 agTFRGzuht2FYsvToU+9tr2AXpkztEOv0AIYExfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69E02F80299;
	Thu, 30 Apr 2020 08:46:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3C36F800E5; Thu, 30 Apr 2020 08:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FF11F800E5
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 08:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF11F800E5
IronPort-SDR: xz+FBdt3uprGnorRjmuVlr0UMrafotFlEv90n+oUO9UnO8zbQ+X33Z1mpmzkSXchNVZ84UXde9
 pk6346tXNLTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 23:46:37 -0700
IronPort-SDR: EQtOCt5eBesmLQbG5D1fSWZ+Ch5cYQn4VzLEXlzBsb2ya/YKXgrcpTAjGdSYr5g7PIsYDgzVxz
 R2qNHZTi2UmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; d="scan'208";a="249662780"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2020 23:46:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/3] soundwire: bus: rename sdw_bus_master_add/delete,
 add arguments
Date: Thu, 30 Apr 2020 02:51:43 +0800
Message-Id: <20200429185145.12891-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.de,
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

In preparation for future extensions, rename functions to use
sdw_bus_master prefix and add a parent and fwnode argument to
sdw_bus_master_add to help with device registration in follow-up
patches.

No functionality change, just renames and additional arguments.

The Intel code is currently unused, the two additional arguments are
only needed for compilation.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 Documentation/driver-api/soundwire/summary.rst |  7 ++++---
 drivers/soundwire/bus.c                        | 15 +++++++++------
 drivers/soundwire/intel.c                      |  9 +++++----
 drivers/soundwire/qcom.c                       |  6 +++---
 include/linux/soundwire/sdw.h                  |  5 +++--
 5 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/Documentation/driver-api/soundwire/summary.rst b/Documentation/driver-api/soundwire/summary.rst
index 8193125a2bfb..01dcb954f6d7 100644
--- a/Documentation/driver-api/soundwire/summary.rst
+++ b/Documentation/driver-api/soundwire/summary.rst
@@ -101,10 +101,11 @@ Following is the Bus API to register the SoundWire Bus:
 
 .. code-block:: c
 
-	int sdw_add_bus_master(struct sdw_bus *bus)
+	int sdw_bus_master_add(struct sdw_bus *bus,
+				struct device *parent,
+				struct fwnode_handle)
 	{
-		if (!bus->dev)
-			return -ENODEV;
+		sdw_master_device_add(bus, parent, fwnode);
 
 		mutex_init(&bus->lock);
 		INIT_LIST_HEAD(&bus->slaves);
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 488c3c9e4947..18024ff770f8 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -10,13 +10,16 @@
 #include "bus.h"
 
 /**
- * sdw_add_bus_master() - add a bus Master instance
+ * sdw_bus_master_add() - add a bus Master instance
  * @bus: bus instance
+ * @parent: parent device
+ * @fwnode: firmware node handle
  *
  * Initializes the bus instance, read properties and create child
  * devices.
  */
-int sdw_add_bus_master(struct sdw_bus *bus)
+int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
+		       struct fwnode_handle *fwnode)
 {
 	struct sdw_master_prop *prop = NULL;
 	int ret;
@@ -107,7 +110,7 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 
 	return 0;
 }
-EXPORT_SYMBOL(sdw_add_bus_master);
+EXPORT_SYMBOL(sdw_bus_master_add);
 
 static int sdw_delete_slave(struct device *dev, void *data)
 {
@@ -131,18 +134,18 @@ static int sdw_delete_slave(struct device *dev, void *data)
 }
 
 /**
- * sdw_delete_bus_master() - delete the bus master instance
+ * sdw_bus_master_delete() - delete the bus master instance
  * @bus: bus to be deleted
  *
  * Remove the instance, delete the child devices.
  */
-void sdw_delete_bus_master(struct sdw_bus *bus)
+void sdw_bus_master_delete(struct sdw_bus *bus)
 {
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
 
 	sdw_bus_debugfs_exit(bus);
 }
-EXPORT_SYMBOL(sdw_delete_bus_master);
+EXPORT_SYMBOL(sdw_bus_master_delete);
 
 /*
  * SDW IO Calls
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index ed8d576bf5dc..1b600f423d8b 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1110,9 +1110,10 @@ static int intel_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sdw);
 
-	ret = sdw_add_bus_master(&sdw->cdns.bus);
+	/* 2nd and 3rd arguments are just added for compilation */
+	ret = sdw_bus_master_add(&sdw->cdns.bus, NULL, NULL);
 	if (ret) {
-		dev_err(&pdev->dev, "sdw_add_bus_master fail: %d\n", ret);
+		dev_err(&pdev->dev, "sdw_bus_master_add fail: %d\n", ret);
 		return ret;
 	}
 
@@ -1173,7 +1174,7 @@ static int intel_probe(struct platform_device *pdev)
 	sdw_cdns_enable_interrupt(&sdw->cdns, false);
 	free_irq(sdw->link_res->irq, sdw);
 err_init:
-	sdw_delete_bus_master(&sdw->cdns.bus);
+	sdw_bus_master_delete(&sdw->cdns.bus);
 	return ret;
 }
 
@@ -1189,7 +1190,7 @@ static int intel_remove(struct platform_device *pdev)
 		free_irq(sdw->link_res->irq, sdw);
 		snd_soc_unregister_component(sdw->cdns.dev);
 	}
-	sdw_delete_bus_master(&sdw->cdns.bus);
+	sdw_bus_master_delete(&sdw->cdns.bus);
 
 	return 0;
 }
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e08a17c13f92..401811d6627e 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -821,7 +821,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	ret = sdw_add_bus_master(&ctrl->bus);
+	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
 			ret);
@@ -840,7 +840,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	return 0;
 
 err_master_add:
-	sdw_delete_bus_master(&ctrl->bus);
+	sdw_bus_master_delete(&ctrl->bus);
 err_clk:
 	clk_disable_unprepare(ctrl->hclk);
 err_init:
@@ -851,7 +851,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
-	sdw_delete_bus_master(&ctrl->bus);
+	sdw_bus_master_delete(&ctrl->bus);
 	clk_disable_unprepare(ctrl->hclk);
 
 	return 0;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 00f5826092e3..2003e8c55538 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -832,8 +832,9 @@ struct sdw_bus {
 	bool multi_link;
 };
 
-int sdw_add_bus_master(struct sdw_bus *bus);
-void sdw_delete_bus_master(struct sdw_bus *bus);
+int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
+		       struct fwnode_handle *fwnode);
+void sdw_bus_master_delete(struct sdw_bus *bus);
 
 /**
  * sdw_port_config: Master or Slave Port configuration
-- 
2.17.1


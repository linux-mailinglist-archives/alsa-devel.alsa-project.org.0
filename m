Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8471D8F4C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 07:43:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CA0517C6;
	Tue, 19 May 2020 07:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CA0517C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589866995;
	bh=nqa8As8qbS2BHjr/hhEL85+WVNnRvvvXeCc/1NXQ0i8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iA7JvRBNQXHscUZSfkM5mVLsD93mG8+eBAn4Nu2C9uEZYLjdQbk+2pFRkYCikfcXz
	 Csszm24E2NLcoq40P+35lv1RsVZ72iD0S3ww89/lEIN+Q28/E5Yg2b5ArVrnKbbnz0
	 DVXPgBX5y4i1IalUG/ddmK2gC01YKp08OQkjqtxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C10F2F802C2;
	Tue, 19 May 2020 07:38:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5025F8025E; Tue, 19 May 2020 07:38:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81054F8025E
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 07:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81054F8025E
IronPort-SDR: JJ40k79UQHXLnyaBnVCnrKlF3rTD54IIn1a72UvWd71SOPWjAft/Mc7xLw1lKy5oW8bTMg7U9o
 ZUJi2lW/1J2Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 22:38:29 -0700
IronPort-SDR: 7npQDKArIOpl2T6RIyzFgUTxC7a7NA3h7toIWcaMXLSidSKXSNIToIveBq5zrYpYSzUL2VxAA0
 +7x9ykiCc3vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; d="scan'208";a="288836600"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga004.fm.intel.com with ESMTP; 18 May 2020 22:38:25 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 4/5] soundwire: bus_type: add sdw_master_device support
Date: Tue, 19 May 2020 01:43:21 +0800
Message-Id: <20200518174322.31561-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
References: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
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

In the existing SoundWire code, Master Devices are not explicitly
represented - only SoundWire Slave Devices are exposed (the use of
capital letters follows the SoundWire specification conventions).

With the existing code, the bus is handled without using a proper device,
and bus->dev typically points to a platform device. The right thing to
do as discussed in multiple reviews is use a device for each bus.

The sdw_master_device addition is done with minimal internal plumbing
and not exposed externally. The existing API based on
sdw_bus_master_add() and sdw_bus_master_delete() will deal with the
sdw_master_device life cycle, which minimizes changes to existing
drivers.

Note that the Intel code will be modified in follow-up patches (no
impact on any platform since the connection with ASoC is not supported
upstream so far).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/Makefile    |  2 +-
 drivers/soundwire/bus.c       | 14 ++++--
 drivers/soundwire/bus.h       |  3 ++
 drivers/soundwire/intel.c     |  1 -
 drivers/soundwire/master.c    | 81 +++++++++++++++++++++++++++++++++++
 drivers/soundwire/qcom.c      |  1 -
 include/linux/soundwire/sdw.h | 17 +++++++-
 7 files changed, 112 insertions(+), 7 deletions(-)
 create mode 100644 drivers/soundwire/master.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index e2cdff990e9f..7319918e0aec 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -4,7 +4,7 @@
 #
 
 #Bus Objs
-soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
+soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o
 obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
 
 ifdef CONFIG_DEBUG_FS
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 2d24f183061d..c31a1c2788a9 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -37,14 +37,21 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	struct sdw_master_prop *prop = NULL;
 	int ret;
 
-	if (!bus->dev) {
-		pr_err("SoundWire bus has no device\n");
+	if (!parent) {
+		pr_err("SoundWire parent device is not set\n");
 		return -ENODEV;
 	}
 
 	ret = sdw_get_id(bus);
 	if (ret) {
-		dev_err(bus->dev, "Failed to get bus id\n");
+		dev_err(parent, "Failed to get bus id\n");
+		return ret;
+	}
+
+	ret = sdw_master_device_add(bus, parent, fwnode);
+	if (ret) {
+		dev_err(parent, "Failed to add master device at link %d\n",
+			bus->link_id);
 		return ret;
 	}
 
@@ -161,6 +168,7 @@ static int sdw_delete_slave(struct device *dev, void *data)
 void sdw_bus_master_delete(struct sdw_bus *bus)
 {
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+	sdw_master_device_del(bus);
 
 	sdw_bus_debugfs_exit(bus);
 	ida_free(&sdw_ida, bus->id);
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 204204a26db8..93ab0234a491 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -19,6 +19,9 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
 int sdw_of_find_slaves(struct sdw_bus *bus);
 void sdw_extract_slave_id(struct sdw_bus *bus,
 			  u64 addr, struct sdw_slave_id *id);
+int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
+			  struct fwnode_handle *fwnode);
+int sdw_master_device_del(struct sdw_bus *bus);
 
 #ifdef CONFIG_DEBUG_FS
 void sdw_bus_debugfs_init(struct sdw_bus *bus);
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 210459390046..3562f2106e30 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1099,7 +1099,6 @@ static int intel_probe(struct platform_device *pdev)
 	sdw->cdns.registers = sdw->link_res->registers;
 	sdw->cdns.instance = sdw->instance;
 	sdw->cdns.msg_count = 0;
-	sdw->cdns.bus.dev = &pdev->dev;
 	sdw->cdns.bus.link_id = pdev->id;
 
 	sdw_cdns_probe(&sdw->cdns);
diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
new file mode 100644
index 000000000000..6be0a027def7
--- /dev/null
+++ b/drivers/soundwire/master.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2019-2020 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/acpi.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include "bus.h"
+
+static void sdw_master_device_release(struct device *dev)
+{
+	struct sdw_master_device *md = dev_to_sdw_master_device(dev);
+
+	kfree(md);
+}
+
+struct device_type sdw_master_type = {
+	.name =		"soundwire_master",
+	.release =	sdw_master_device_release,
+};
+
+/**
+ * sdw_master_device_add() - create a Linux Master Device representation.
+ * @bus: SDW bus instance
+ * @parent: parent device
+ * @fwnode: firmware node handle
+ */
+int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
+			  struct fwnode_handle *fwnode)
+{
+	struct sdw_master_device *md;
+	int ret;
+
+	if (!parent)
+		return -EINVAL;
+
+	md = kzalloc(sizeof(*md), GFP_KERNEL);
+	if (!md)
+		return -ENOMEM;
+
+	md->dev.bus = &sdw_bus_type;
+	md->dev.type = &sdw_master_type;
+	md->dev.parent = parent;
+	md->dev.of_node = parent->of_node;
+	md->dev.fwnode = fwnode;
+	md->dev.dma_mask = parent->dma_mask;
+
+	dev_set_name(&md->dev, "sdw-master-%d", bus->id);
+
+	ret = device_register(&md->dev);
+	if (ret) {
+		dev_err(parent, "Failed to add master: ret %d\n", ret);
+		/*
+		 * On err, don't free but drop ref as this will be freed
+		 * when release method is invoked.
+		 */
+		put_device(&md->dev);
+		goto device_register_err;
+	}
+
+	/* add shortcuts to improve code readability/compactness */
+	md->bus = bus;
+	bus->dev = &md->dev;
+	bus->md = md;
+
+device_register_err:
+	return ret;
+}
+
+/**
+ * sdw_master_device_del() - delete a Linux Master Device representation.
+ * @bus: bus handle
+ *
+ * This function is the dual of sdw_master_device_add()
+ */
+int sdw_master_device_del(struct sdw_bus *bus)
+{
+	device_unregister(bus->dev);
+
+	return 0;
+}
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 401811d6627e..1c335ab1cd3f 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -784,7 +784,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	mutex_init(&ctrl->port_lock);
 	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
 
-	ctrl->bus.dev = dev;
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index a32cb26f1815..7658d9698dd5 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -632,6 +632,19 @@ struct sdw_slave {
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
 
+/**
+ * struct sdw_master_device - SoundWire 'Master Device' representation
+ * @dev: Linux device for this Master
+ * @bus: Bus handle shortcut
+ */
+struct sdw_master_device {
+	struct device dev;
+	struct sdw_bus *bus;
+};
+
+#define dev_to_sdw_master_device(d)	\
+	container_of(d, struct sdw_master_device, dev)
+
 struct sdw_driver {
 	const char *name;
 
@@ -787,7 +800,8 @@ struct sdw_master_ops {
 
 /**
  * struct sdw_bus - SoundWire bus
- * @dev: Master linux device
+ * @dev: Shortcut to &bus->md->dev to avoid changing the entire code.
+ * @md: Master device
  * @link_id: Link id number, can be 0 to N, unique for each Master
  * @id: bus system-wide unique id
  * @slaves: list of Slaves on this bus
@@ -813,6 +827,7 @@ struct sdw_master_ops {
  */
 struct sdw_bus {
 	struct device *dev;
+	struct sdw_master_device *md;
 	unsigned int link_id;
 	int id;
 	struct list_head slaves;
-- 
2.17.1


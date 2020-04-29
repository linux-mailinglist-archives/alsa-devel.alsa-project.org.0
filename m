Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B65781BF091
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 08:50:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D490168E;
	Thu, 30 Apr 2020 08:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D490168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588229401;
	bh=Zrb3iGUulkD3L3a88P9F6EZpZAUS2j3LGLQ/W6XfbZk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=riV6WLD24+pT71ErWh8tu/CG03ozhkbxB5LBEq9ZsHZQwGIG1O/vNUdlgaWynjGeb
	 u8YxtZguoALWqLs/7Y4W/bDEPFfAyf66sBaYVGm+248r97S7GQkKptNtCW/sLUnvzX
	 qrLFplAYNlaegho5JbyUBqHi0Y+ihmkmwfbud88g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99E16F802A2;
	Thu, 30 Apr 2020 08:46:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04014F80290; Thu, 30 Apr 2020 08:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3528EF80292
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 08:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3528EF80292
IronPort-SDR: 0eFZin9D8Gf4/4Op/G3zkoDjFCPcjoUVAJ1ww2pCoseLFFQabTwu7vCnsBinq9t6Znj6mWHaTI
 1jRepMn1Otcw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 23:46:45 -0700
IronPort-SDR: sWE2BURnu8GLHMTvnWamUpSzLF+VZi1DlhV/vvPMm0TWLYsDzgmnT+cBoQN30/PGxHZBXdE62Q
 RSHMjAoe9P/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; d="scan'208";a="249662792"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2020 23:46:41 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/3] soundwire: bus_type: add sdw_master_device support
Date: Thu, 30 Apr 2020 02:51:45 +0800
Message-Id: <20200429185145.12891-4-yung-chuan.liao@linux.intel.com>
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

In the existing SoundWire code, Master Devices are not explicitly
represented - only SoundWire Slave Devices are exposed (the use of
capital letters follows the SoundWire specification conventions).

The SoundWire Master Device provides the clock, synchronization
information and command/control channels. When multiple links are
supported, a Controller may expose more than one Master Device; they
are typically embedded inside a larger audio cluster (be it in an
SOC/chipset or an external audio codec), and we need to describe it
using the Linux device and driver model.

This transition will avoid abusing platform devices and allow for
better sysfs support without the reference count issues mentioned in
the initial reviews.

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
 drivers/soundwire/bus.c       | 12 ++++--
 drivers/soundwire/bus.h       |  3 ++
 drivers/soundwire/master.c    | 79 +++++++++++++++++++++++++++++++++++
 drivers/soundwire/qcom.c      |  1 -
 include/linux/soundwire/sdw.h | 17 +++++++-
 6 files changed, 108 insertions(+), 6 deletions(-)
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
index 18024ff770f8..7eb1e6efd567 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -24,9 +24,14 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	struct sdw_master_prop *prop = NULL;
 	int ret;
 
-	if (!bus->dev) {
-		pr_err("SoundWire bus has no device\n");
-		return -ENODEV;
+	if (!bus)
+		return -EINVAL;
+
+	ret = sdw_master_device_add(bus, parent, fwnode);
+	if (ret) {
+		dev_err(parent, "Failed to add master device at link %d\n",
+			bus->link_id);
+		return ret;
 	}
 
 	if (!bus->ops) {
@@ -142,6 +147,7 @@ static int sdw_delete_slave(struct device *dev, void *data)
 void sdw_bus_master_delete(struct sdw_bus *bus)
 {
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+	sdw_master_device_del(bus);
 
 	sdw_bus_debugfs_exit(bus);
 }
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
diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
new file mode 100644
index 000000000000..2eeb2d7f56e0
--- /dev/null
+++ b/drivers/soundwire/master.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2019-2020 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/acpi.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include "bus.h"
+
+/* nothing to free but this function is mandatory */
+static void sdw_master_device_release(struct device *dev)
+{
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
+	if (!bus)
+		return -EINVAL;
+
+	/*
+	 * Unlike traditional devices, there's no allocation here since the
+	 * sdw_master_device is embedded in the bus structure.
+	 */
+	md = &bus->md;
+	md->dev.bus = &sdw_bus_type;
+	md->dev.type = &sdw_master_type;
+	md->dev.parent = parent;
+	md->dev.of_node = parent->of_node;
+	md->dev.fwnode = fwnode;
+	md->dev.dma_mask = parent->dma_mask;
+
+	dev_set_name(&md->dev, "sdw-master-%d", bus->link_id);
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
index 2003e8c55538..071adf2b463f 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -632,6 +632,19 @@ struct sdw_slave {
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
 
+/**
+ * struct sdw_master_device - SoundWire 'Master Device' representation
+ * @dev: Linux device for this Master
+ * @bus: Bus handle shortcut to improve readability (same as container_of)
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
+ * @dev: shortcut to &md->dev to improve readability
+ * @md: Master device
  * @link_id: Link id number, can be 0 to N, unique for each Master
  * @slaves: list of Slaves on this bus
  * @assigned: Bitmap for Slave device numbers.
@@ -812,6 +826,7 @@ struct sdw_master_ops {
  */
 struct sdw_bus {
 	struct device *dev;
+	struct sdw_master_device md;
 	unsigned int link_id;
 	struct list_head slaves;
 	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
-- 
2.17.1


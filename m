Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455561AD923
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 10:53:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CD4E1671;
	Fri, 17 Apr 2020 10:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CD4E1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587113590;
	bh=O7b0VO7NWMnG5ZVtpTqC6jGUWi/C41VYtTm0agCNDoQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rao4aiZjuYQgD/MnyvXjiJkxSoVVI6pkcsl0xE6DBuDtoVLNGRZPM0BBOU+hkl/NW
	 0OrWjBNL9oKinBgGkI/8IbytR2oF9cdNWFu5zpxTyh85Lrppmk6/e64xt4qujj8JJe
	 g/IxvNaTYe0RWw4L+m+XNs74k+Dy7Q+fI1odU6gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30004F80266;
	Fri, 17 Apr 2020 10:50:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B980F80229; Fri, 17 Apr 2020 10:50:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B87EF80229
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 10:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B87EF80229
IronPort-SDR: HHz6txx2INVzq/ufNCyuz2tIWkxeixW7wcWMukzM09/Uk7ZLPGxZlcethaSa9c6fa48mpQtWQ3
 wGnk0zqN4SBQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 01:50:33 -0700
IronPort-SDR: eeJIs9XPAQRfCPDjU9lk+dP9r4ZJtNJuzU561RCKZZOSEY/VF/a3p3BJulRwaZBhrwl9qjTwoW
 Ul8pY69T3sFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="454661444"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 17 Apr 2020 01:50:29 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RFC 1/5] soundwire: bus_type: add sdw_master_device support
Date: Fri, 17 Apr 2020 04:55:20 +0800
Message-Id: <20200416205524.2043-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
References: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com
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
using the Linux device and driver model.  This will allow for
configuration functions to account for external dependencies such as
power rails, clock sources or wake-up mechanisms. This transition will
also allow for better sysfs support without the reference count issues
mentioned in the initial reviews.

In this patch, we convert the existing code to use an explicit
sdw_slave_type, then define a sdw_master_device structure.

A parent (such as the Intel audio controller or its equivalent on
Qualcomm devices) would use sdw_master_device_add() to create the
device, the master device would be released when
sdw_master_device_del() is invoked by the parent.

The 'Master Device' device can be configured with optional link ops,
in case an implementation needs link-specific resources allocated or
power-management capabilities. The .add/.del callbacks are handled
internally by the SoundWire core, while the optional
.startup/.process_wake need to be called by the parent directly (using
wrappers). The uevent handling is moved to the slave side since it's
not relevant for master devices.

Additional callbacks will be added in the future for e.g. autonomous
clock stop modes.

Credits to Jaroslav Kysela <perex@perex.cz> for the idea of using link_ops.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/Makefile         |   2 +-
 drivers/soundwire/bus.h            |   2 +
 drivers/soundwire/bus_type.c       |  19 ++--
 drivers/soundwire/master.c         | 167 +++++++++++++++++++++++++++++
 drivers/soundwire/slave.c          |   8 +-
 include/linux/soundwire/sdw.h      |  60 +++++++++++
 include/linux/soundwire/sdw_type.h |  10 +-
 7 files changed, 258 insertions(+), 10 deletions(-)
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
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 204204a26db8..99943d40222a 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -173,4 +173,6 @@ sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
 
 void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
 
+int sdw_slave_uevent(struct device *dev, struct kobj_uevent_env *env);
+
 #endif /* __SDW_BUS_H */
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 17f096dd6806..2c1a19caba51 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -33,13 +33,21 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
 
 static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_driver *drv = drv_to_sdw_driver(ddrv);
+	struct sdw_slave *slave;
+	struct sdw_driver *drv;
+	int ret = 0;
+
+	if (is_sdw_slave(dev)) {
+		slave = dev_to_sdw_dev(dev);
+		drv = drv_to_sdw_driver(ddrv);
 
-	return !!sdw_get_device_id(slave, drv);
+		ret = !!sdw_get_device_id(slave, drv);
+	}
+	return ret;
 }
 
-int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
+static int sdw_slave_modalias(const struct sdw_slave *slave, char *buf,
+			      size_t size)
 {
 	/* modalias is sdw:m<mfg_id>p<part_id> */
 
@@ -47,7 +55,7 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
 			slave->id.mfg_id, slave->id.part_id);
 }
 
-static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
+int sdw_slave_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	char modalias[32];
@@ -63,7 +71,6 @@ static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
 struct bus_type sdw_bus_type = {
 	.name = "soundwire",
 	.match = sdw_bus_match,
-	.uevent = sdw_uevent,
 };
 EXPORT_SYMBOL_GPL(sdw_bus_type);
 
diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
new file mode 100644
index 000000000000..094518817601
--- /dev/null
+++ b/drivers/soundwire/master.c
@@ -0,0 +1,167 @@
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
+ * @parent: the parent Linux device (e.g. a PCI device)
+ * @fwnode: the parent fwnode (e.g. an ACPI companion device to the parent)
+ * @link_ops: link-specific ops (optional)
+ * @link_id: link index as defined by MIPI DisCo specification
+ * @pdata: private data (e.g. register base, offsets, platform quirks, etc).
+ *
+ * The link_ops argument can be NULL, it is only used when link-specific
+ * initializations and power-management are required.
+ */
+struct sdw_master_device
+*sdw_master_device_add(struct device *parent,
+		       struct fwnode_handle *fwnode,
+		       struct sdw_link_ops *link_ops,
+		       int link_id,
+		       void *pdata)
+{
+	struct sdw_master_device *md;
+	int ret;
+
+	md = kzalloc(sizeof(*md), GFP_KERNEL);
+	if (!md)
+		return ERR_PTR(-ENOMEM);
+
+	md->link_id = link_id;
+	md->pdata = pdata;
+	md->link_ops = link_ops;
+
+	md->dev.parent = parent;
+	md->dev.fwnode = fwnode;
+	md->dev.bus = &sdw_bus_type;
+	md->dev.type = &sdw_master_type;
+	md->dev.dma_mask = md->dev.parent->dma_mask;
+	dev_set_name(&md->dev, "sdw-master-%d", md->link_id);
+
+	if (link_ops && link_ops->driver) {
+		/*
+		 * A driver is only needed for ASoC integration (need
+		 * driver->name) and for link-specific power management
+		 * w/ a pm_dev_ops structure.
+		 *
+		 * The driver needs to be registered by the parent
+		 */
+		md->dev.driver = link_ops->driver;
+	}
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
+	if (link_ops && link_ops->add) {
+		ret = link_ops->add(md, pdata);
+		if (ret < 0) {
+			dev_err(&md->dev, "link_ops add callback failed: %d\n",
+				ret);
+			goto link_add_err;
+		}
+	}
+
+	return md;
+
+link_add_err:
+	device_unregister(&md->dev);
+device_register_err:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(sdw_master_device_add);
+
+/**
+ * sdw_master_device_del() - delete a Linux Master Device representation.
+ * @md: the master device
+ *
+ * This function is the dual of sdw_master_device_add(), itreleases
+ * all link-specific resources and unregisters the device.
+ */
+int sdw_master_device_del(struct sdw_master_device *md)
+{
+	int ret = 0;
+
+	if (md && md->link_ops && md->link_ops->del) {
+		ret = md->link_ops->del(md);
+		if (ret < 0) {
+			dev_err(&md->dev, "link_ops del callback failed: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	device_unregister(&md->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(sdw_master_device_del);
+
+/**
+ * sdw_master_device_startup() - startup hardware
+ *
+ * @md: Linux Soundwire master device
+ */
+int sdw_master_device_startup(struct sdw_master_device *md)
+{
+	struct sdw_link_ops *link_ops;
+	int ret = 0;
+
+	if (IS_ERR_OR_NULL(md))
+		return -EINVAL;
+
+	link_ops = md->link_ops;
+
+	if (link_ops && link_ops->startup)
+		ret = link_ops->startup(md);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(sdw_master_device_startup);
+
+/**
+ * sdw_master_device_process_wake_event() - handle external wake
+ * event, e.g. handled at the PCI level
+ *
+ * @md: Linux Soundwire master device
+ */
+int sdw_master_device_process_wake_event(struct sdw_master_device *md)
+{
+	struct sdw_link_ops *link_ops;
+	int ret = 0;
+
+	if (IS_ERR_OR_NULL(md))
+		return -EINVAL;
+
+	link_ops = md->link_ops;
+
+	if (link_ops && link_ops->process_wake_event)
+		ret = link_ops->process_wake_event(md);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(sdw_master_device_process_wake_event);
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index aace57fae7f8..ed068a004bd9 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -14,6 +14,12 @@ static void sdw_slave_release(struct device *dev)
 	kfree(slave);
 }
 
+struct device_type sdw_slave_type = {
+	.name =		"sdw_slave",
+	.release =	sdw_slave_release,
+	.uevent =	sdw_slave_uevent,
+};
+
 static int sdw_slave_add(struct sdw_bus *bus,
 			 struct sdw_slave_id *id, struct fwnode_handle *fwnode)
 {
@@ -41,9 +47,9 @@ static int sdw_slave_add(struct sdw_bus *bus,
 			     id->class_id, id->unique_id);
 	}
 
-	slave->dev.release = sdw_slave_release;
 	slave->dev.bus = &sdw_bus_type;
 	slave->dev.of_node = of_node_get(to_of_node(fwnode));
+	slave->dev.type = &sdw_slave_type;
 	slave->bus = bus;
 	slave->status = SDW_SLAVE_UNATTACHED;
 	init_completion(&slave->enumeration_complete);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 00f5826092e3..ecd070df4ae9 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -632,6 +632,53 @@ struct sdw_slave {
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
 
+struct sdw_link_ops;
+
+/**
+ * struct sdw_master_device - SoundWire 'Master Device' representation
+ *
+ * @dev: Linux device for this Master
+ * @bus: Bus handle
+ * @link_ops: link-specific ops, initialized with sdw_master_device_add()
+ * @link_id: link index as defined by MIPI DisCo specification
+ * @pdata: private data typically provided with sdw_master_device_add()
+ *
+ * link_ops can be NULL when link-level initializations and power-management
+ * are not desired.
+ */
+struct sdw_master_device {
+	struct device dev;
+	struct sdw_bus *bus;
+	struct sdw_link_ops *link_ops;
+	int link_id;
+	void *pdata;
+};
+
+/**
+ * struct sdw_link_ops - SoundWire link-specific ops
+ * @add: initializations and allocation (hardware may not be enabled yet)
+ * @startup: initialization handled after the hardware is enabled, all
+ * clock/power dependencies are available
+ * @del: free all remaining resources
+ * @process_wake_event: handle external wake
+ * @driver: raw structure used for name/PM hooks.
+ *
+ * This optional structure is provided for link specific
+ * operations. All members are optional, but if .add() is supported the
+ * dual .del() function shall be used to release all resources allocated
+ * in .add().
+ */
+struct sdw_link_ops {
+	int (*add)(struct sdw_master_device *md, void *link_ctx);
+	int (*startup)(struct sdw_master_device *md);
+	int (*del)(struct sdw_master_device *md);
+	int (*process_wake_event)(struct sdw_master_device *md);
+	struct device_driver *driver;
+};
+
+#define dev_to_sdw_master_device(d)	\
+	container_of(d, struct sdw_master_device, dev)
+
 struct sdw_driver {
 	const char *name;
 
@@ -835,6 +882,19 @@ struct sdw_bus {
 int sdw_add_bus_master(struct sdw_bus *bus);
 void sdw_delete_bus_master(struct sdw_bus *bus);
 
+struct sdw_master_device
+*sdw_master_device_add(struct device *parent,
+		       struct fwnode_handle *fwnode,
+		       struct sdw_link_ops *master_ops,
+		       int link_id,
+		       void *pdata);
+
+int sdw_master_device_del(struct sdw_master_device *md);
+
+int sdw_master_device_startup(struct sdw_master_device *md);
+
+int sdw_master_device_process_wake_event(struct sdw_master_device *md);
+
 /**
  * sdw_port_config: Master or Slave Port configuration
  *
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index aaa7f4267c14..990857eddff8 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -5,6 +5,13 @@
 #define __SOUNDWIRE_TYPES_H
 
 extern struct bus_type sdw_bus_type;
+extern struct device_type sdw_slave_type;
+extern struct device_type sdw_master_type;
+
+static inline int is_sdw_slave(const struct device *dev)
+{
+	return dev->type == &sdw_slave_type;
+}
 
 #define drv_to_sdw_driver(_drv) container_of(_drv, struct sdw_driver, driver)
 
@@ -14,8 +21,6 @@ extern struct bus_type sdw_bus_type;
 int __sdw_register_driver(struct sdw_driver *drv, struct module *owner);
 void sdw_unregister_driver(struct sdw_driver *drv);
 
-int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
-
 /**
  * module_sdw_driver() - Helper macro for registering a Soundwire driver
  * @__sdw_driver: soundwire slave driver struct
@@ -27,4 +32,5 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 #define module_sdw_driver(__sdw_driver) \
 	module_driver(__sdw_driver, sdw_register_driver, \
 			sdw_unregister_driver)
+
 #endif /* __SOUNDWIRE_TYPES_H */
-- 
2.17.1


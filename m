Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 113FF172B61
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 23:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EFEC16D5;
	Thu, 27 Feb 2020 23:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EFEC16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582842895;
	bh=cxJXnJFhaxMHjqgurIx5E58SpCEoAYsIy8WnPue8wtg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUqkY3l6HpOmqyjheqoCsPK6M0xmnnCOlVEHLqAmzaR8Tn720oSsuejEHqXkf9ERO
	 wBCKiIMKkZWhCVH2CrKfXSM4W1uRmuAJYmRrqSgYvWSNE6o8DRtVVDzX8XqLQDQi92
	 ZEsjoknmX4Tqb6VfA/VEbK8eCZL3ZN98Z21B9Kxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0796DF80125;
	Thu, 27 Feb 2020 23:32:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3BD1F80278; Thu, 27 Feb 2020 23:32:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEBC6F80125
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 23:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEBC6F80125
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 14:32:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="411194797"
Received: from azeira-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.147.250])
 by orsmga005.jf.intel.com with ESMTP; 27 Feb 2020 14:32:21 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
Date: Thu, 27 Feb 2020 16:31:59 -0600
Message-Id: <20200227223206.5020-2-pierre-louis.bossart@linux.intel.com>
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
sdw_slave_type, then define new objects (sdw_master_device and
sdw_master_driver).

A parent (such as the Intel audio controller or its equivalent on
Qualcomm devices) would use sdw_master_device_add() to create the
device, passing a driver name as a parameter. The master device would
be released when device_unregister() is invoked by the parent.

Note that since there is no standard for the Master host-facing
interface, so the bus matching relies on a simple string matching (as
previously done with platform devices).

The 'Master Device' driver exposes callbacks for
probe/startup/shutdown/remove/process_wake. The startup and process
wake need to be called by the parent directly (using wrappers), while
the probe/shutdown/remove are handled by the SoundWire bus core upon
device creation and release.

Additional callbacks will be added in the future for e.g. autonomous
clock stop modes.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Makefile         |   2 +-
 drivers/soundwire/bus_type.c       | 141 +++++++++++++++++++++++++++--
 drivers/soundwire/master.c         | 100 ++++++++++++++++++++
 drivers/soundwire/slave.c          |   7 +-
 include/linux/soundwire/sdw.h      |  76 ++++++++++++++++
 include/linux/soundwire/sdw_type.h |  36 +++++++-
 6 files changed, 351 insertions(+), 11 deletions(-)
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
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 17f096dd6806..e610f1d3b840 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -33,13 +33,33 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
 
 static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_driver *drv = drv_to_sdw_driver(ddrv);
+	struct sdw_slave *slave;
+	struct sdw_driver *drv;
+	struct sdw_master_device *md;
+	struct sdw_master_driver *mdrv;
+	int ret = 0;
 
-	return !!sdw_get_device_id(slave, drv);
+	if (is_sdw_slave(dev)) {
+		slave = dev_to_sdw_dev(dev);
+		drv = drv_to_sdw_driver(ddrv);
+
+		ret = !!sdw_get_device_id(slave, drv);
+	} else {
+		md = dev_to_sdw_master_device(dev);
+		mdrv = drv_to_sdw_master_driver(ddrv);
+
+		/*
+		 * we don't have any hardware information so
+		 * match with a hopefully unique string
+		 */
+		ret = !strncmp(md->master_name, mdrv->driver.name,
+			       strlen(md->master_name));
+	}
+	return ret;
 }
 
-int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
+static int sdw_slave_modalias(const struct sdw_slave *slave, char *buf,
+			      size_t size)
 {
 	/* modalias is sdw:m<mfg_id>p<part_id> */
 
@@ -47,12 +67,31 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
 			slave->id.mfg_id, slave->id.part_id);
 }
 
+static int sdw_master_modalias(const struct sdw_master_device *md,
+			       char *buf, size_t size)
+{
+	/* modalias is sdw:<string> since we don't have any hardware info */
+
+	return snprintf(buf, size, "sdw:%s\n",
+			md->master_name);
+}
+
 static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct sdw_slave *slave;
+	struct sdw_master_device *md;
 	char modalias[32];
 
-	sdw_slave_modalias(slave, modalias, sizeof(modalias));
+	if (is_sdw_slave(dev)) {
+		slave = dev_to_sdw_dev(dev);
+
+		sdw_slave_modalias(slave, modalias, sizeof(modalias));
+
+	} else {
+		md = dev_to_sdw_master_device(dev);
+
+		sdw_master_modalias(md, modalias, sizeof(modalias));
+	}
 
 	if (add_uevent_var(env, "MODALIAS=%s", modalias))
 		return -ENOMEM;
@@ -113,8 +152,6 @@ static int sdw_drv_probe(struct device *dev)
 	slave->probed = true;
 	complete(&slave->probe_complete);
 
-	dev_dbg(dev, "probe complete\n");
-
 	return 0;
 }
 
@@ -181,6 +218,94 @@ void sdw_unregister_driver(struct sdw_driver *drv)
 }
 EXPORT_SYMBOL_GPL(sdw_unregister_driver);
 
+static int sdw_master_drv_probe(struct device *dev)
+{
+	struct sdw_master_device *md = dev_to_sdw_master_device(dev);
+	struct sdw_master_driver *mdrv = drv_to_sdw_master_driver(dev->driver);
+	int ret;
+
+	/*
+	 * attach to power domain but don't turn on (last arg)
+	 */
+	ret = dev_pm_domain_attach(dev, false);
+	if (ret)
+		return ret;
+
+	ret = mdrv->probe(md, md->pdata);
+	if (ret) {
+		dev_err(dev, "Probe of %s failed: %d\n",
+			mdrv->driver.name, ret);
+		dev_pm_domain_detach(dev, false);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sdw_master_drv_remove(struct device *dev)
+{
+	struct sdw_master_device *md = dev_to_sdw_master_device(dev);
+	struct sdw_master_driver *mdrv = drv_to_sdw_master_driver(dev->driver);
+	int ret = 0;
+
+	if (mdrv->remove)
+		ret = mdrv->remove(md);
+
+	dev_pm_domain_detach(dev, false);
+
+	return ret;
+}
+
+static void sdw_master_drv_shutdown(struct device *dev)
+{
+	struct sdw_master_device *md = dev_to_sdw_master_device(dev);
+	struct sdw_master_driver *mdrv = drv_to_sdw_master_driver(dev->driver);
+
+	if (mdrv->shutdown)
+		mdrv->shutdown(md);
+}
+
+/**
+ * __sdw_register_master_driver() - register a SoundWire Master driver
+ * @mdrv: 'Master driver' to register
+ * @owner: owning module/driver
+ *
+ * Return: zero on success, else a negative error code.
+ */
+int __sdw_register_master_driver(struct sdw_master_driver *mdrv,
+				 struct module *owner)
+{
+	mdrv->driver.bus = &sdw_bus_type;
+
+	if (!mdrv->probe) {
+		pr_err("driver %s didn't provide SDW probe routine\n",
+		       mdrv->driver.name);
+		return -EINVAL;
+	}
+
+	mdrv->driver.owner = owner;
+	mdrv->driver.probe = sdw_master_drv_probe;
+
+	if (mdrv->remove)
+		mdrv->driver.remove = sdw_master_drv_remove;
+
+	if (mdrv->shutdown)
+		mdrv->driver.shutdown = sdw_master_drv_shutdown;
+
+	return driver_register(&mdrv->driver);
+}
+EXPORT_SYMBOL_GPL(__sdw_register_master_driver);
+
+/**
+ * sdw_unregister_master_driver() - unregisters the SoundWire Master driver
+ * @mdrv: driver to unregister
+ */
+void sdw_unregister_master_driver(struct sdw_master_driver *mdrv)
+{
+	driver_unregister(&mdrv->driver);
+}
+EXPORT_SYMBOL_GPL(sdw_unregister_master_driver);
+
 static int __init sdw_bus_init(void)
 {
 	sdw_debugfs_init();
diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
new file mode 100644
index 000000000000..1f3c376327f9
--- /dev/null
+++ b/drivers/soundwire/master.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: (GPL-2.0)
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
+struct sdw_master_device
+*sdw_master_device_add(const char *master_name,
+		       struct device *parent,
+		       struct fwnode_handle *fwnode,
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
+	md->master_name = master_name;
+
+	init_completion(&md->probe_complete);
+
+	md->dev.parent = parent;
+	md->dev.fwnode = fwnode;
+	md->dev.bus = &sdw_bus_type;
+	md->dev.type = &sdw_master_type;
+	md->dev.dma_mask = md->dev.parent->dma_mask;
+	dev_set_name(&md->dev, "sdw-master-%d", md->link_id);
+
+	ret = device_register(&md->dev);
+	if (ret) {
+		dev_err(parent, "Failed to add master: ret %d\n", ret);
+		/*
+		 * On err, don't free but drop ref as this will be freed
+		 * when release method is invoked.
+		 */
+		put_device(&md->dev);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return md;
+}
+EXPORT_SYMBOL_GPL(sdw_master_device_add);
+
+int sdw_master_device_startup(struct sdw_master_device *md)
+{
+	struct sdw_master_driver *mdrv;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR_OR_NULL(md))
+		return -EINVAL;
+
+	dev = &md->dev;
+	mdrv = drv_to_sdw_master_driver(dev->driver);
+
+	if (mdrv && mdrv->startup)
+		ret = mdrv->startup(md);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(sdw_master_device_startup);
+
+int sdw_master_device_process_wake_event(struct sdw_master_device *md)
+{
+	struct sdw_master_driver *mdrv;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR_OR_NULL(md))
+		return -EINVAL;
+
+	dev = &md->dev;
+	mdrv = drv_to_sdw_master_driver(dev->driver);
+
+	if (mdrv && mdrv->process_wake_event)
+		ret = mdrv->process_wake_event(md);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(sdw_master_device_process_wake_event);
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index aace57fae7f8..7ca4f2d9bfa6 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -14,6 +14,11 @@ static void sdw_slave_release(struct device *dev)
 	kfree(slave);
 }
 
+struct device_type sdw_slave_type = {
+	.name =		"sdw_slave",
+	.release =	sdw_slave_release,
+};
+
 static int sdw_slave_add(struct sdw_bus *bus,
 			 struct sdw_slave_id *id, struct fwnode_handle *fwnode)
 {
@@ -41,9 +46,9 @@ static int sdw_slave_add(struct sdw_bus *bus,
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
index ee349a4c5349..a64fde620ae6 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -630,6 +630,31 @@ struct sdw_slave {
 
 #define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
 
+/**
+ * struct sdw_master_device - SoundWire 'Master Device' representation
+ *
+ * @dev: Linux device for this Master
+ * @master_name: Linux driver name
+ * @driver: Linux driver for this Master (set by SoundWire core during probe)
+ * @probe_complete: used by parent if synchronous probe behavior is needed
+ * @link_id: link index as defined by MIPI DisCo specification
+ * @pm_runtime_suspended: flag to restore pm_runtime state after system resume
+ * @pdata: private data typically provided with sdw_master_device_add()
+ */
+
+struct sdw_master_device {
+	struct device dev;
+	const char *master_name;
+	struct sdw_master_driver *driver;
+	struct completion probe_complete;
+	int link_id;
+	bool pm_runtime_suspended;
+	void *pdata;
+};
+
+#define dev_to_sdw_master_device(d)	\
+	container_of(d, struct sdw_master_device, dev)
+
 struct sdw_driver {
 	const char *name;
 
@@ -644,6 +669,26 @@ struct sdw_driver {
 	struct device_driver driver;
 };
 
+/**
+ * struct sdw_master_driver - SoundWire 'Master Device' driver
+ *
+ * @probe: initializations and allocation (hardware may not be enabled yet)
+ * @startup: initialization handled after the hardware is enabled, all
+ * clock/power dependencies are available (optional)
+ * @shutdown: cleanups before hardware is disabled (optional)
+ * @remove: free all remaining resources
+ * @process_wake_event: handle external wake (optional)
+ * @driver: baseline structure used for name/PM hooks.
+ */
+struct sdw_master_driver {
+	int (*probe)(struct sdw_master_device *md, void *link_ctx);
+	int (*startup)(struct sdw_master_device *md);
+	int (*shutdown)(struct sdw_master_device *md);
+	int (*remove)(struct sdw_master_device *md);
+	int (*process_wake_event)(struct sdw_master_device *md);
+	struct device_driver driver;
+};
+
 #define SDW_SLAVE_ENTRY(_mfg_id, _part_id, _drv_data) \
 	{ .mfg_id = (_mfg_id), .part_id = (_part_id), \
 	  .driver_data = (unsigned long)(_drv_data) }
@@ -833,6 +878,37 @@ struct sdw_bus {
 int sdw_add_bus_master(struct sdw_bus *bus);
 void sdw_delete_bus_master(struct sdw_bus *bus);
 
+/**
+ * sdw_master_device_add() - create a Linux Master Device representation.
+ *
+ * @master_name: Linux driver name
+ * @parent: the parent Linux device (e.g. a PCI device)
+ * @fwnode: the parent fwnode (e.g. an ACPI companion device to the parent)
+ * @link_id: link index as defined by MIPI DisCo specification
+ * @pdata: private data (e.g. register base, offsets, platform quirks, etc).
+ */
+struct sdw_master_device
+*sdw_master_device_add(const char *master_name,
+		       struct device *parent,
+		       struct fwnode_handle *fwnode,
+		       int link_id,
+		       void *pdata);
+
+/**
+ * sdw_master_device_startup() - startup hardware
+ *
+ * @md: Linux Soundwire master device
+ */
+int sdw_master_device_startup(struct sdw_master_device *md);
+
+/**
+ * sdw_master_device_process_wake_event() - handle external wake
+ * event, e.g. handled at the PCI level
+ *
+ * @md: Linux Soundwire master device
+ */
+int sdw_master_device_process_wake_event(struct sdw_master_device *md);
+
 /**
  * sdw_port_config: Master or Slave Port configuration
  *
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index aaa7f4267c14..331ba58bda27 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -5,16 +5,36 @@
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
 
 #define sdw_register_driver(drv) \
 	__sdw_register_driver(drv, THIS_MODULE)
 
+static inline int is_sdw_master_device(const struct device *dev)
+{
+	return dev->type == &sdw_master_type;
+}
+
+#define drv_to_sdw_master_driver(_drv) \
+	container_of(_drv, struct sdw_master_driver, driver)
+
+#define sdw_register_master_driver(drv) \
+	__sdw_register_master_driver(drv, THIS_MODULE)
+
 int __sdw_register_driver(struct sdw_driver *drv, struct module *owner);
 void sdw_unregister_driver(struct sdw_driver *drv);
 
-int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
+int __sdw_register_master_driver(struct sdw_master_driver *mdrv,
+				 struct module *owner);
+void sdw_unregister_master_driver(struct sdw_master_driver *mdrv);
 
 /**
  * module_sdw_driver() - Helper macro for registering a Soundwire driver
@@ -27,4 +47,18 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 #define module_sdw_driver(__sdw_driver) \
 	module_driver(__sdw_driver, sdw_register_driver, \
 			sdw_unregister_driver)
+
+/**
+ * module_sdw_master_driver() - Helper macro for registering a Soundwire
+ * Master driver
+ * @__sdw_master_driver: soundwire Master driver struct
+ *
+ * Helper macro for Soundwire Master drivers which do not do anything special in
+ * module init/exit. This eliminates a lot of boilerplate. Each module may only
+ * use this macro once, and calling it replaces module_init() and module_exit()
+ */
+#define module_sdw_master_driver(__sdw_master_driver) \
+	module_driver(__sdw_master_driver, sdw_register_master_driver, \
+			sdw_unregister_master_driver)
+
 #endif /* __SOUNDWIRE_TYPES_H */
-- 
2.20.1


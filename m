Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA50136CB
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 03:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1E50188A;
	Sat,  4 May 2019 03:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1E50188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556931756;
	bh=mpggSVKqYtoPmFPqWQ/w9XGs4z3XyyxjsuJ0a/m0XNI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ExWy3scyEpddR1AfzZQ3X7oEJONniJlXP13rx3NjxjipwJszVKc5UUNmcWE6bhIiy
	 5IV8edsNGbZJaW7XaqOU/bPOtOw7WLDlTtB3FKeJNyrx7vpy5SeRH8QINWgJR5rgR9
	 1H+jAjIJLpiGR49r7ztuQS+HXNnjR8FS1DcGXDfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E45BF896CB;
	Sat,  4 May 2019 03:00:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0995EF896B9; Sat,  4 May 2019 03:00:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1866EF80720
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 03:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1866EF80720
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 18:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="148114198"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga007.fm.intel.com with ESMTP; 03 May 2019 18:00:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 20:00:24 -0500
Message-Id: <20190504010030.29233-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 1/7] soundwire: Add sysfs support for
	master(s)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For each master N, add a device sdw-master:N and add the
master properties as attributes.

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Makefile    |   3 +-
 drivers/soundwire/bus.c       |   6 ++
 drivers/soundwire/sysfs.c     | 162 ++++++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h |  10 +++
 4 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soundwire/sysfs.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 5817beaca0e1..787f1cbf342c 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -3,7 +3,8 @@
 #
 
 #Bus Objs
-soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
+soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o \
+			sysfs.o
 obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
 
 #Cadence Objs
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe745830a261..38de7071e135 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -49,6 +49,10 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 		}
 	}
 
+	ret = sdw_sysfs_bus_init(bus);
+	if (ret < 0)
+		dev_warn(bus->dev, "Bus sysfs init failed:%d\n", ret);
+
 	/*
 	 * Device numbers in SoundWire are 0 through 15. Enumeration device
 	 * number (0), Broadcast device number (15), Group numbers (12 and
@@ -129,6 +133,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
  */
 void sdw_delete_bus_master(struct sdw_bus *bus)
 {
+	sdw_sysfs_bus_exit(bus);
+
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
 }
 EXPORT_SYMBOL(sdw_delete_bus_master);
diff --git a/drivers/soundwire/sysfs.c b/drivers/soundwire/sysfs.c
new file mode 100644
index 000000000000..7b6c3826a73a
--- /dev/null
+++ b/drivers/soundwire/sysfs.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2015-19 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include "bus.h"
+
+struct sdw_master_sysfs {
+	struct device dev;
+	struct sdw_bus *bus;
+};
+
+#define to_sdw_device(_dev) \
+	container_of(_dev, struct sdw_master_sysfs, dev)
+
+/*
+ * The sysfs for properties reflects the MIPI description as given
+ * in the MIPI DisCo spec
+ *
+ * Base file is:
+ *	sdw-master-N
+ *      |---- revision
+ *      |---- clk_stop_modes
+ *      |---- max_clk_freq
+ *      |---- clk_freq
+ *      |---- clk_gears
+ *      |---- default_row
+ *      |---- default_col
+ *      |---- dynamic_shape
+ *      |---- err_threshold
+ */
+
+#define sdw_master_attr(field, format_string)				\
+static ssize_t field##_show(struct device *dev,				\
+			    struct device_attribute *attr,		\
+			    char *buf)					\
+{									\
+	struct sdw_master_sysfs *master = to_sdw_device(dev);		\
+	return sprintf(buf, format_string, master->bus->prop.field);	\
+}									\
+static DEVICE_ATTR_RO(field)
+
+sdw_master_attr(revision, "0x%x\n");
+sdw_master_attr(clk_stop_modes, "0x%x\n");
+sdw_master_attr(max_clk_freq, "%d\n");
+sdw_master_attr(default_row, "%d\n");
+sdw_master_attr(default_col, "%d\n");
+sdw_master_attr(default_frame_rate, "%d\n");
+sdw_master_attr(dynamic_frame, "%d\n");
+sdw_master_attr(err_threshold, "%d\n");
+
+static ssize_t clock_frequencies_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct sdw_master_sysfs *master = to_sdw_device(dev);
+	ssize_t size = 0;
+	int i;
+
+	for (i = 0; i < master->bus->prop.num_clk_freq; i++)
+		size += sprintf(buf + size, "%8d ",
+				master->bus->prop.clk_freq[i]);
+	size += sprintf(buf + size, "\n");
+
+	return size;
+}
+static DEVICE_ATTR_RO(clock_frequencies);
+
+static ssize_t clock_gears_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct sdw_master_sysfs *master = to_sdw_device(dev);
+	ssize_t size = 0;
+	int i;
+
+	for (i = 0; i < master->bus->prop.num_clk_gears; i++)
+		size += sprintf(buf + size, "%8d ",
+				master->bus->prop.clk_gears[i]);
+	size += sprintf(buf + size, "\n");
+
+	return size;
+}
+static DEVICE_ATTR_RO(clock_gears);
+
+static struct attribute *master_node_attrs[] = {
+	&dev_attr_revision.attr,
+	&dev_attr_clk_stop_modes.attr,
+	&dev_attr_max_clk_freq.attr,
+	&dev_attr_default_row.attr,
+	&dev_attr_default_col.attr,
+	&dev_attr_default_frame_rate.attr,
+	&dev_attr_dynamic_frame.attr,
+	&dev_attr_err_threshold.attr,
+	&dev_attr_clock_frequencies.attr,
+	&dev_attr_clock_gears.attr,
+	NULL,
+};
+
+static const struct attribute_group sdw_master_node_group = {
+	.attrs = master_node_attrs,
+};
+
+static const struct attribute_group *sdw_master_node_groups[] = {
+	&sdw_master_node_group,
+	NULL
+};
+
+static void sdw_device_release(struct device *dev)
+{
+	struct sdw_master_sysfs *master = to_sdw_device(dev);
+
+	kfree(master);
+}
+
+static struct device_type sdw_device_type = {
+	.name =	"sdw_device",
+	.release = sdw_device_release,
+};
+
+int sdw_sysfs_bus_init(struct sdw_bus *bus)
+{
+	struct sdw_master_sysfs *master;
+	int err;
+
+	if (bus->sysfs) {
+		dev_err(bus->dev, "SDW sysfs is already initialized\n");
+		return -EIO;
+	}
+
+	master = kzalloc(sizeof(*master), GFP_KERNEL);
+	if (!master)
+		return -ENOMEM;
+
+	bus->sysfs = master;
+	master->bus = bus;
+	master->dev.type = &sdw_device_type;
+	master->dev.bus = &sdw_bus_type;
+	master->dev.parent = bus->dev;
+	master->dev.groups = sdw_master_node_groups;
+	dev_set_name(&master->dev, "sdw-master:%x", bus->link_id);
+
+	err = device_register(&master->dev);
+	if (err)
+		put_device(&master->dev);
+
+	return err;
+}
+
+void sdw_sysfs_bus_exit(struct sdw_bus *bus)
+{
+	struct sdw_master_sysfs *master = bus->sysfs;
+
+	if (!master)
+		return;
+
+	master->bus = NULL;
+	put_device(&master->dev);
+	bus->sysfs = NULL;
+}
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 3b231472464a..b64d46fed0c8 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -402,6 +402,14 @@ int sdw_slave_read_dp0(struct sdw_slave *slave,
 		       struct fwnode_handle *port,
 		       struct sdw_dp0_prop *dp0);
 
+/*
+ * SDW sysfs APIs
+ */
+struct sdw_master_sysfs;
+
+int sdw_sysfs_bus_init(struct sdw_bus *bus);
+void sdw_sysfs_bus_exit(struct sdw_bus *bus);
+
 /*
  * SDW Slave Structures and APIs
  */
@@ -731,6 +739,7 @@ struct sdw_master_ops {
  * @m_rt_list: List of Master instance of all stream(s) running on Bus. This
  * is used to compute and program bus bandwidth, clock, frame shape,
  * transport and port parameters
+ * @sysfs: Bus sysfs
  * @defer_msg: Defer message
  * @clk_stop_timeout: Clock stop timeout computed
  * @bank_switch_timeout: Bank switch timeout computed
@@ -750,6 +759,7 @@ struct sdw_bus {
 	struct sdw_bus_params params;
 	struct sdw_master_prop prop;
 	struct list_head m_rt_list;
+	struct sdw_master_sysfs *sysfs;
 	struct sdw_defer defer_msg;
 	unsigned int clk_stop_timeout;
 	u32 bank_switch_timeout;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

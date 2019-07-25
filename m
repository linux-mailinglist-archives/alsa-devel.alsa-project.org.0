Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5F775B8B
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 01:44:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 137A81B02;
	Fri, 26 Jul 2019 01:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 137A81B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564098262;
	bh=+yKZUGOEJuu3Bwa85NKdy6la9WBHP6TA/4GcTMgJiqQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=so61WwkeQo4E9NFBuXHNowJpVMSHpinFSvEnXCYahWBUxxSw3r8JgPLgiAZuKX5mE
	 vA86T7fbMGixJ6+s1Da1TZSe2SjAju9qt1YyAlJD1v3+A2ctteglyEiJhRilfu8KLG
	 0MGG+pT0IJo6k7wwTLS3Xozkt4N+scYO6vr8tKis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C83ACF804CB;
	Fri, 26 Jul 2019 01:41:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2964FF80481; Fri, 26 Jul 2019 01:41:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25B74F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 01:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B74F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 16:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="369874633"
Received: from amrutaku-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.230.75])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 16:40:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 18:39:53 -0500
Message-Id: <20190725234032.21152-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 01/40] soundwire: add debugfs support
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

Add base debugfs mechanism for SoundWire bus by creating soundwire
root and master-N and slave-x hierarchy.

Also add SDW Slave SCP, DP0 and DP-N register debug file.

Registers not implemented will print as "XX"

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. The main change
is the use of scnprintf to avoid known issues with snprintf.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Makefile    |   4 +-
 drivers/soundwire/bus.c       |   6 ++
 drivers/soundwire/bus.h       |  24 ++++++
 drivers/soundwire/bus_type.c  |   3 +
 drivers/soundwire/debugfs.c   | 156 ++++++++++++++++++++++++++++++++++
 drivers/soundwire/slave.c     |   1 +
 include/linux/soundwire/sdw.h |   4 +
 7 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soundwire/debugfs.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index fd99a831b92a..88990cac48a7 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -4,7 +4,9 @@
 #
 
 #Bus Objs
-soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
+soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o \
+			debugfs.o
+
 obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
 
 #Cadence Objs
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe745830a261..5ad4109dc72f 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -49,6 +49,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 		}
 	}
 
+	bus->debugfs = sdw_bus_debugfs_init(bus);
+
 	/*
 	 * Device numbers in SoundWire are 0 through 15. Enumeration device
 	 * number (0), Broadcast device number (15), Group numbers (12 and
@@ -109,6 +111,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct sdw_bus *bus = slave->bus;
 
+	sdw_slave_debugfs_exit(slave->debugfs);
+
 	mutex_lock(&bus->bus_lock);
 
 	if (slave->dev_num) /* clear dev_num if assigned */
@@ -130,6 +134,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 void sdw_delete_bus_master(struct sdw_bus *bus)
 {
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+
+	sdw_bus_debugfs_exit(bus->debugfs);
 }
 EXPORT_SYMBOL(sdw_delete_bus_master);
 
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 3048ca153f22..06ac4adb0074 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -18,6 +18,30 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
 void sdw_extract_slave_id(struct sdw_bus *bus,
 			  u64 addr, struct sdw_slave_id *id);
 
+#ifdef CONFIG_DEBUG_FS
+struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus);
+void sdw_bus_debugfs_exit(struct dentry *d);
+struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave);
+void sdw_slave_debugfs_exit(struct dentry *d);
+void sdw_debugfs_init(void);
+void sdw_debugfs_exit(void);
+#else
+struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus)
+{ return NULL; }
+
+void sdw_bus_debugfs_exit(struct dentry *d) {}
+
+struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave)
+{ return NULL; }
+
+void sdw_slave_debugfs_exit(struct dentry *d) {}
+
+void sdw_debugfs_init(void) {}
+
+void sdw_debugfs_exit(void) {}
+
+#endif
+
 enum {
 	SDW_MSG_FLAG_READ = 0,
 	SDW_MSG_FLAG_WRITE,
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 2655602f0cfb..4a465f55039f 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -6,6 +6,7 @@
 #include <linux/pm_domain.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include "bus.h"
 
 /**
  * sdw_get_device_id - find the matching SoundWire device id
@@ -177,11 +178,13 @@ EXPORT_SYMBOL_GPL(sdw_unregister_driver);
 
 static int __init sdw_bus_init(void)
 {
+	sdw_debugfs_init();
 	return bus_register(&sdw_bus_type);
 }
 
 static void __exit sdw_bus_exit(void)
 {
+	sdw_debugfs_exit();
 	bus_unregister(&sdw_bus_type);
 }
 
diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
new file mode 100644
index 000000000000..8d86e100516e
--- /dev/null
+++ b/drivers/soundwire/debugfs.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2017-19 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/mod_devicetable.h>
+#include <linux/slab.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include "bus.h"
+
+#ifdef CONFIG_DEBUG_FS
+struct dentry *sdw_debugfs_root;
+#endif
+
+struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus)
+{
+	struct dentry *d;
+	char name[16];
+
+	if (!sdw_debugfs_root)
+		return NULL;
+
+	/* create the debugfs master-N */
+	snprintf(name, sizeof(name), "master-%d", bus->link_id);
+	d = debugfs_create_dir(name, sdw_debugfs_root);
+
+	return d;
+}
+
+void sdw_bus_debugfs_exit(struct dentry *d)
+{
+	debugfs_remove_recursive(d);
+}
+
+#define RD_BUF (3 * PAGE_SIZE)
+
+static ssize_t sdw_sprintf(struct sdw_slave *slave,
+			   char *buf, size_t pos, unsigned int reg)
+{
+	int value;
+
+	value = sdw_read(slave, reg);
+
+	if (value < 0)
+		return scnprintf(buf + pos, RD_BUF - pos, "%3x\tXX\n", reg);
+	else
+		return scnprintf(buf + pos, RD_BUF - pos,
+				"%3x\t%2x\n", reg, value);
+}
+
+static ssize_t sdw_slave_reg_read(struct file *file, char __user *user_buf,
+				  size_t count, loff_t *ppos)
+{
+	struct sdw_slave *slave = file->private_data;
+	unsigned int reg;
+	char *buf;
+	ssize_t ret;
+	int i, j;
+
+	buf = kzalloc(RD_BUF, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP0\n");
+
+	for (i = 0; i < 6; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
+	ret += sdw_sprintf(slave, buf, ret, SDW_DP0_CHANNELEN);
+	for (i = SDW_DP0_SAMPLECTRL1; i <= SDW_DP0_LANECTRL; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
+	ret += sdw_sprintf(slave, buf, ret,
+			SDW_DP0_CHANNELEN + SDW_BANK1_OFFSET);
+	for (i = SDW_DP0_SAMPLECTRL1 + SDW_BANK1_OFFSET;
+			i <= SDW_DP0_LANECTRL + SDW_BANK1_OFFSET; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nSCP\n");
+	for (i = SDW_SCP_INT1; i <= SDW_SCP_BANKDELAY; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+	for (i = SDW_SCP_DEVID_0; i <= SDW_SCP_DEVID_5; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
+	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_FRAMECTRL_B0);
+	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_NEXTFRAME_B0);
+
+	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
+	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_FRAMECTRL_B1);
+	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_NEXTFRAME_B1);
+
+	for (i = 1; i < 14; i++) {
+		ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP%d\n", i);
+		reg = SDW_DPN_INT(i);
+		for (j = 0; j < 6; j++)
+			ret += sdw_sprintf(slave, buf, ret, reg + j);
+
+		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
+		reg = SDW_DPN_CHANNELEN_B0(i);
+		for (j = 0; j < 9; j++)
+			ret += sdw_sprintf(slave, buf, ret, reg + j);
+
+		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
+		reg = SDW_DPN_CHANNELEN_B1(i);
+		for (j = 0; j < 9; j++)
+			ret += sdw_sprintf(slave, buf, ret, reg + j);
+	}
+
+	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
+	kfree(buf);
+
+	return ret;
+}
+
+static const struct file_operations sdw_slave_reg_fops = {
+	.open = simple_open,
+	.read = sdw_slave_reg_read,
+	.llseek = default_llseek,
+};
+
+struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave)
+{
+	struct dentry *master;
+	struct dentry *d;
+	char name[32];
+
+	master = slave->bus->debugfs;
+
+	/* create the debugfs slave-name */
+	snprintf(name, sizeof(name), "%s", dev_name(&slave->dev));
+	d = debugfs_create_dir(name, master);
+
+	debugfs_create_file("registers", 0400, d, slave, &sdw_slave_reg_fops);
+
+	return d;
+}
+
+void sdw_slave_debugfs_exit(struct dentry *d)
+{
+	debugfs_remove_recursive(d);
+}
+
+void sdw_debugfs_init(void)
+{
+	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
+}
+
+void sdw_debugfs_exit(void)
+{
+	debugfs_remove_recursive(sdw_debugfs_root);
+}
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index f39a5815e25d..34d8bb995f45 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -56,6 +56,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 		mutex_unlock(&bus->bus_lock);
 		put_device(&slave->dev);
 	}
+	slave->debugfs = sdw_slave_debugfs_init(slave);
 
 	return ret;
 }
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 3b231472464a..a49028e9d666 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -544,6 +544,7 @@ struct sdw_slave_ops {
  * @bus: Bus handle
  * @ops: Slave callback ops
  * @prop: Slave properties
+ * @debugfs: Slave debugfs
  * @node: node for bus list
  * @port_ready: Port ready completion flag for each Slave port
  * @dev_num: Device Number assigned by Bus
@@ -555,6 +556,7 @@ struct sdw_slave {
 	struct sdw_bus *bus;
 	const struct sdw_slave_ops *ops;
 	struct sdw_slave_prop prop;
+	struct dentry *debugfs;
 	struct list_head node;
 	struct completion *port_ready;
 	u16 dev_num;
@@ -731,6 +733,7 @@ struct sdw_master_ops {
  * @m_rt_list: List of Master instance of all stream(s) running on Bus. This
  * is used to compute and program bus bandwidth, clock, frame shape,
  * transport and port parameters
+ * @debugfs: Bus debugfs
  * @defer_msg: Defer message
  * @clk_stop_timeout: Clock stop timeout computed
  * @bank_switch_timeout: Bank switch timeout computed
@@ -750,6 +753,7 @@ struct sdw_bus {
 	struct sdw_bus_params params;
 	struct sdw_master_prop prop;
 	struct list_head m_rt_list;
+	struct dentry *debugfs;
 	struct sdw_defer defer_msg;
 	unsigned int clk_stop_timeout;
 	u32 bank_switch_timeout;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

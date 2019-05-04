Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F41B136D0
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 03:06:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE9A7189E;
	Sat,  4 May 2019 03:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE9A7189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556931964;
	bh=0AEy39jA8tayFeLGmeT/FHYZfQ2ACoRyslb8GA6FJZI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oIc+GHmPDxA7e5m3JDKNOtIk/hAAmEEfK7Kxy6Y4P7xJjKO6gr6mMh0bFO0rDFCGd
	 N2u0fBRvZgYWuurTwyVjpoLqUURVGFXr8/gjtzIOhsiPkiDcRbmcGxrYYJtshQuuMt
	 hNg0Jh9bVUVpvNDq4+7x8Z7kFbbcuTf83GDMy6+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67AF2F8973E;
	Sat,  4 May 2019 03:01:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28064F89732; Sat,  4 May 2019 03:01:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1F0DF8972A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 03:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1F0DF8972A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 18:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="148114232"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga007.fm.intel.com with ESMTP; 03 May 2019 18:00:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 20:00:28 -0500
Message-Id: <20190504010030.29233-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 5/7] soundwire: add debugfs support
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

Add base debugfs mechanism for SoundWire bus by creating soundwire
root and master-N and slave-x hierarchy.

Also add SDW Slave SCP, DP0 and DP-N register debug file.

Registers not implemented will print as "XX"

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. The main change
is the use of scnprintf to avoid known issues with snprintf.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Makefile    |   3 +-
 drivers/soundwire/bus.c       |   5 +
 drivers/soundwire/bus.h       |  28 +++++
 drivers/soundwire/bus_type.c  |   3 +
 drivers/soundwire/debugfs.c   | 214 ++++++++++++++++++++++++++++++++++
 drivers/soundwire/slave.c     |   1 +
 include/linux/soundwire/sdw.h |   9 ++
 7 files changed, 262 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soundwire/debugfs.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index a72a29731a28..f2c425fa15bd 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -4,7 +4,8 @@
 
 #Bus Objs
 soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o \
-			sysfs.o sysfs_slave_dp0.o sysfs_slave_dpn.o
+			sysfs.o sysfs_slave_dp0.o sysfs_slave_dpn.o  \
+			debugfs.o
 obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
 
 #Cadence Objs
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index dd9181693554..b79eba321b71 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -53,6 +53,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 	if (ret < 0)
 		dev_warn(bus->dev, "Bus sysfs init failed:%d\n", ret);
 
+	bus->debugfs = sdw_bus_debugfs_init(bus);
+
 	/*
 	 * Device numbers in SoundWire are 0 through 15. Enumeration device
 	 * number (0), Broadcast device number (15), Group numbers (12 and
@@ -114,6 +116,7 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	struct sdw_bus *bus = slave->bus;
 
 	sdw_sysfs_slave_exit(slave);
+	sdw_slave_debugfs_exit(slave->debugfs);
 
 	mutex_lock(&bus->bus_lock);
 
@@ -136,6 +139,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 void sdw_delete_bus_master(struct sdw_bus *bus)
 {
 	sdw_sysfs_bus_exit(bus);
+	if (bus->debugfs)
+		sdw_bus_debugfs_exit(bus->debugfs);
 
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
 }
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 0707e68a8d21..f0b1f4f9d7b2 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -20,6 +20,34 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
 
 extern const struct attribute_group *sdw_slave_dev_attr_groups[];
 
+#ifdef CONFIG_DEBUG_FS
+struct sdw_bus_debugfs *sdw_bus_debugfs_init(struct sdw_bus *bus);
+void sdw_bus_debugfs_exit(struct sdw_bus_debugfs *d);
+struct dentry *sdw_bus_debugfs_get_root(struct sdw_bus_debugfs *d);
+struct sdw_slave_debugfs *sdw_slave_debugfs_init(struct sdw_slave *slave);
+void sdw_slave_debugfs_exit(struct sdw_slave_debugfs *d);
+void sdw_debugfs_init(void);
+void sdw_debugfs_exit(void);
+#else
+struct sdw_bus_debugfs *sdw_bus_debugfs_init(struct sdw_bus *bus)
+{ return NULL; }
+
+void sdw_bus_debugfs_exit(struct sdw_bus_debugfs *d) {}
+
+struct dentry *sdw_bus_debugfs_get_root(struct sdw_bus_debugfs *d)
+{ return NULL; }
+
+struct sdw_slave_debugfs *sdw_slave_debugfs_init(struct sdw_slave *slave)
+{ return NULL; }
+
+void sdw_slave_debugfs_exit(struct sdw_slave_debugfs *d) {}
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
index f68fe45c1037..f28c1a2446af 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -6,6 +6,7 @@
 #include <linux/pm_domain.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include "bus.h"
 
 /**
  * sdw_get_device_id - find the matching SoundWire device id
@@ -182,11 +183,13 @@ EXPORT_SYMBOL_GPL(sdw_unregister_driver);
 
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
index 000000000000..8a8b4df95c46
--- /dev/null
+++ b/drivers/soundwire/debugfs.c
@@ -0,0 +1,214 @@
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
+struct sdw_bus_debugfs {
+	struct sdw_bus *bus;
+
+	struct dentry *fs;
+};
+
+struct sdw_bus_debugfs *sdw_bus_debugfs_init(struct sdw_bus *bus)
+{
+	struct sdw_bus_debugfs *d;
+	char name[16];
+
+	if (!sdw_debugfs_root)
+		return NULL;
+
+	d = kzalloc(sizeof(*d), GFP_KERNEL);
+	if (!d)
+		return NULL;
+
+	/* create the debugfs master-N */
+	snprintf(name, sizeof(name), "master-%d", bus->link_id);
+	d->fs = debugfs_create_dir(name, sdw_debugfs_root);
+	if (IS_ERR_OR_NULL(d->fs)) {
+		dev_err(bus->dev, "debugfs root creation failed\n");
+		goto err;
+	}
+
+	d->bus = bus;
+
+	return d;
+
+err:
+	kfree(d);
+	return NULL;
+}
+
+void sdw_bus_debugfs_exit(struct sdw_bus_debugfs *d)
+{
+	debugfs_remove_recursive(d->fs);
+	kfree(d);
+}
+
+struct dentry *sdw_bus_debugfs_get_root(struct sdw_bus_debugfs *d)
+{
+	if (d)
+		return d->fs;
+	return NULL;
+}
+EXPORT_SYMBOL(sdw_bus_debugfs_get_root);
+
+struct sdw_slave_debugfs {
+	struct sdw_slave *slave;
+
+	struct dentry *fs;
+};
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
+struct sdw_slave_debugfs *sdw_slave_debugfs_init(struct sdw_slave *slave)
+{
+	struct sdw_bus_debugfs *master;
+	struct sdw_slave_debugfs *d;
+	char name[32];
+
+	master = slave->bus->debugfs;
+	if (!master)
+		return NULL;
+
+	d = kzalloc(sizeof(*d), GFP_KERNEL);
+	if (!d)
+		return NULL;
+
+	/* create the debugfs slave-name */
+	snprintf(name, sizeof(name), "%s", dev_name(&slave->dev));
+	d->fs = debugfs_create_dir(name, master->fs);
+	if (IS_ERR_OR_NULL(d->fs)) {
+		dev_err(&slave->dev, "slave debugfs root creation failed\n");
+		goto err;
+	}
+
+	d->slave = slave;
+
+	debugfs_create_file("registers", 0400, d->fs,
+			    slave, &sdw_slave_reg_fops);
+
+	return d;
+
+err:
+	kfree(d);
+	return NULL;
+}
+
+void sdw_slave_debugfs_exit(struct sdw_slave_debugfs *d)
+{
+	debugfs_remove_recursive(d->fs);
+	kfree(d);
+}
+
+void sdw_debugfs_init(void)
+{
+	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
+	if (IS_ERR_OR_NULL(sdw_debugfs_root)) {
+		pr_warn("SoundWire: Failed to create debugfs directory\n");
+		sdw_debugfs_root = NULL;
+		return;
+	}
+}
+
+void sdw_debugfs_exit(void)
+{
+	debugfs_remove_recursive(sdw_debugfs_root);
+}
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index bad73a267fdd..e41332a7f340 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -57,6 +57,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 		mutex_unlock(&bus->bus_lock);
 		put_device(&slave->dev);
 	}
+	slave->debugfs = sdw_slave_debugfs_init(slave);
 
 	return ret;
 }
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index fae3a3ad6e68..3684ca106408 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -547,6 +547,8 @@ struct sdw_slave_ops {
 			 enum sdw_port_prep_ops pre_ops);
 };
 
+struct sdw_slave_debugfs;
+
 /**
  * struct sdw_slave - SoundWire Slave
  * @id: MIPI device ID
@@ -556,6 +558,7 @@ struct sdw_slave_ops {
  * @ops: Slave callback ops
  * @prop: Slave properties
  * @sysfs: Sysfs interface
+ * @debugfs: Slave debugfs
  * @node: node for bus list
  * @port_ready: Port ready completion flag for each Slave port
  * @dev_num: Device Number assigned by Bus
@@ -568,6 +571,7 @@ struct sdw_slave {
 	const struct sdw_slave_ops *ops;
 	struct sdw_slave_prop prop;
 	struct sdw_slave_sysfs *sysfs;
+	struct sdw_slave_debugfs *debugfs;
 	struct list_head node;
 	struct completion *port_ready;
 	u16 dev_num;
@@ -728,6 +732,8 @@ struct sdw_master_ops {
 
 };
 
+struct sdw_bus_debugfs;
+
 /**
  * struct sdw_bus - SoundWire bus
  * @dev: Master linux device
@@ -742,8 +748,10 @@ struct sdw_master_ops {
  * @params: Current bus parameters
  * @prop: Master properties
  * @m_rt_list: List of Master instance of all stream(s) running on Bus. This
+ * @rt_list: List of Master instance of all stream(s) running on Bus. This
  * is used to compute and program bus bandwidth, clock, frame shape,
  * transport and port parameters
+ * @debugfs: Bus debugfs
  * @sysfs: Bus sysfs
  * @defer_msg: Defer message
  * @clk_stop_timeout: Clock stop timeout computed
@@ -765,6 +773,7 @@ struct sdw_bus {
 	struct sdw_master_prop prop;
 	struct list_head m_rt_list;
 	struct sdw_master_sysfs *sysfs;
+	struct sdw_bus_debugfs *debugfs;
 	struct sdw_defer defer_msg;
 	unsigned int clk_stop_timeout;
 	u32 bank_switch_timeout;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

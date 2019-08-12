Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8738ABBA
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 02:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FBDA1664;
	Tue, 13 Aug 2019 02:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FBDA1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565654601;
	bh=tK7tA0eItvO6xNJMl8Rg3f0vLpoGOqt9M+OazBblmV4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmr1RdfYAD0Qd2ozjpt2h6WR2nZgsjMXVrMrMAAVWTmDgj6RksC6PS5LALY4pSt8c
	 Hy/rUxtyQSnSnigBmcLBTZq3E1ZutaRx1PPl+PY5Oh1i6Gqmmck2q+f5ciFgM2/Vqa
	 vyKGY+Rb56zIkLMKq33QKXBi+dFFACfLBs7wiHhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D192CF805E2;
	Tue, 13 Aug 2019 02:00:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A6B0F80518; Tue, 13 Aug 2019 02:00:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC9F8F80213
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 01:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC9F8F80213
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 16:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,379,1559545200"; d="scan'208";a="177639023"
Received: from firin-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.252.205.59])
 by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2019 16:59:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 12 Aug 2019 18:59:40 -0500
Message-Id: <20190812235942.7120-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
References: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v2 1/3] soundwire: add debugfs support
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
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Makefile    |   4 +
 drivers/soundwire/bus.c       |   6 ++
 drivers/soundwire/bus.h       |  16 ++++
 drivers/soundwire/bus_type.c  |   3 +
 drivers/soundwire/debugfs.c   | 151 ++++++++++++++++++++++++++++++++++
 drivers/soundwire/slave.c     |   1 +
 include/linux/soundwire/sdw.h |   8 ++
 7 files changed, 189 insertions(+)
 create mode 100644 drivers/soundwire/debugfs.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 45b7e5001653..563894e5ecaf 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -7,6 +7,10 @@
 soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
 obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
 
+ifdef CONFIG_DEBUG_FS
+soundwire-bus-objs += debugfs.o
+endif
+
 #Cadence Objs
 soundwire-cadence-objs := cadence_master.o
 obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 49f64b2115b9..348d391fc37c 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -49,6 +49,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 		}
 	}
 
+	sdw_bus_debugfs_init(bus);
+
 	/*
 	 * Device numbers in SoundWire are 0 through 15. Enumeration device
 	 * number (0), Broadcast device number (15), Group numbers (12 and
@@ -109,6 +111,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct sdw_bus *bus = slave->bus;
 
+	sdw_slave_debugfs_exit(slave);
+
 	mutex_lock(&bus->bus_lock);
 
 	if (slave->dev_num) /* clear dev_num if assigned */
@@ -130,6 +134,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 void sdw_delete_bus_master(struct sdw_bus *bus)
 {
 	device_for_each_child(bus->dev, NULL, sdw_delete_slave);
+
+	sdw_bus_debugfs_exit(bus);
 }
 EXPORT_SYMBOL(sdw_delete_bus_master);
 
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 3048ca153f22..0898c88ee887 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -18,6 +18,22 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
 void sdw_extract_slave_id(struct sdw_bus *bus,
 			  u64 addr, struct sdw_slave_id *id);
 
+#ifdef CONFIG_DEBUG_FS
+void sdw_bus_debugfs_init(struct sdw_bus *bus);
+void sdw_bus_debugfs_exit(struct sdw_bus *bus);
+void sdw_slave_debugfs_init(struct sdw_slave *slave);
+void sdw_slave_debugfs_exit(struct sdw_slave *slave);
+void sdw_debugfs_init(void);
+void sdw_debugfs_exit(void);
+#else
+static inline void sdw_bus_debugfs_init(struct sdw_bus *bus) {}
+static inline void sdw_bus_debugfs_exit(struct sdw_bus *bus) {}
+static inline void sdw_slave_debugfs_init(struct sdw_slave *slave) {}
+static inline void sdw_slave_debugfs_exit(struct sdw_slave *slave) {}
+static inline void sdw_debugfs_init(void) {}
+static inline void sdw_debugfs_exit(void) {}
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
index 000000000000..fb1140e82b86
--- /dev/null
+++ b/drivers/soundwire/debugfs.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright(c) 2017-2019 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/mod_devicetable.h>
+#include <linux/slab.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include "bus.h"
+
+static struct dentry *sdw_debugfs_root;
+
+void sdw_bus_debugfs_init(struct sdw_bus *bus)
+{
+	char name[16];
+
+	if (!sdw_debugfs_root)
+		return;
+
+	/* create the debugfs master-N */
+	snprintf(name, sizeof(name), "master-%d", bus->link_id);
+	bus->debugfs = debugfs_create_dir(name, sdw_debugfs_root);
+}
+
+void sdw_bus_debugfs_exit(struct sdw_bus *bus)
+{
+	debugfs_remove_recursive(bus->debugfs);
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
+static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
+{
+	struct sdw_slave *slave = s_file->private;
+	char *buf;
+	ssize_t ret;
+	int i, j;
+
+	buf = kzalloc(RD_BUF, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
+
+	/* DP0 non-banked registers */
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP0\n");
+	for (i = SDW_DP0_INT; i <= SDW_DP0_PREPARECTRL; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+
+	/* DP0 Bank 0 registers */
+	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
+	ret += sdw_sprintf(slave, buf, ret, SDW_DP0_CHANNELEN);
+	for (i = SDW_DP0_SAMPLECTRL1; i <= SDW_DP0_LANECTRL; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+
+	/* DP0 Bank 1 registers */
+	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
+	ret += sdw_sprintf(slave, buf, ret,
+			SDW_DP0_CHANNELEN + SDW_BANK1_OFFSET);
+	for (i = SDW_DP0_SAMPLECTRL1 + SDW_BANK1_OFFSET;
+			i <= SDW_DP0_LANECTRL + SDW_BANK1_OFFSET; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+
+	/* SCP registers */
+	ret += scnprintf(buf + ret, RD_BUF - ret, "\nSCP\n");
+	for (i = SDW_SCP_INT1; i <= SDW_SCP_BANKDELAY; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+	for (i = SDW_SCP_DEVID_0; i <= SDW_SCP_DEVID_5; i++)
+		ret += sdw_sprintf(slave, buf, ret, i);
+
+	/*
+	 * SCP Bank 0/1 registers are read-only and cannot be
+	 * retrieved from the Slave. The Master typically keeps track
+	 * of the current frame size so the information can be found
+	 * in other places
+	 */
+
+	/* DP1..14 registers */
+	for (i = 1; SDW_VALID_PORT_RANGE(i); i++) {
+
+		/* DPi registers */
+		ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP%d\n", i);
+		for (j = SDW_DPN_INT(i); j <= SDW_DPN_PREPARECTRL(i); j++)
+			ret += sdw_sprintf(slave, buf, ret, j);
+
+		/* DPi Bank0 registers */
+		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
+		for (j = SDW_DPN_CHANNELEN_B0(i);
+		     j <= SDW_DPN_LANECTRL_B0(i); j++)
+			ret += sdw_sprintf(slave, buf, ret, j);
+
+		/* DPi Bank1 registers */
+		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
+		for (j = SDW_DPN_CHANNELEN_B1(i);
+		     j <= SDW_DPN_LANECTRL_B1(i); j++)
+			ret += sdw_sprintf(slave, buf, ret, j);
+	}
+
+	seq_printf(s_file, "%s", buf);
+	kfree(buf);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(sdw_slave_reg);
+
+void sdw_slave_debugfs_init(struct sdw_slave *slave)
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
+	slave->debugfs = d;
+}
+
+void sdw_slave_debugfs_exit(struct sdw_slave *slave)
+{
+	debugfs_remove_recursive(slave->debugfs);
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
index f39a5815e25d..4b522f6d1238 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -56,6 +56,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 		mutex_unlock(&bus->bus_lock);
 		put_device(&slave->dev);
 	}
+	sdw_slave_debugfs_init(slave);
 
 	return ret;
 }
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 3b231472464a..13638a39e24a 100644
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
@@ -555,6 +556,9 @@ struct sdw_slave {
 	struct sdw_bus *bus;
 	const struct sdw_slave_ops *ops;
 	struct sdw_slave_prop prop;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs;
+#endif
 	struct list_head node;
 	struct completion *port_ready;
 	u16 dev_num;
@@ -731,6 +735,7 @@ struct sdw_master_ops {
  * @m_rt_list: List of Master instance of all stream(s) running on Bus. This
  * is used to compute and program bus bandwidth, clock, frame shape,
  * transport and port parameters
+ * @debugfs: Bus debugfs
  * @defer_msg: Defer message
  * @clk_stop_timeout: Clock stop timeout computed
  * @bank_switch_timeout: Bank switch timeout computed
@@ -750,6 +755,9 @@ struct sdw_bus {
 	struct sdw_bus_params params;
 	struct sdw_master_prop prop;
 	struct list_head m_rt_list;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs;
+#endif
 	struct sdw_defer defer_msg;
 	unsigned int clk_stop_timeout;
 	u32 bank_switch_timeout;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

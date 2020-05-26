Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9571D9215
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 10:34:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB281725;
	Tue, 19 May 2020 10:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB281725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589877255;
	bh=aGn/r+OWx7FJch4RSQUj1h35bxX0Q2ggbb8f/xhQ4Ag=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WuGUcU+szJRZp0RApHqU5lHk+qvWxTMySTZe+08ZCovTVvLvk6Uy18SERnOZ4Py5f
	 mXaJA3nQd2CSxeGmPcxdaaMuUOYvXEf2r2iNHIzUme1vAfSGakJyWOiSE+z+0ou/b7
	 7rayK2HphJsPTAWw6MlTmBZHCOKPK4inasTxm24c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C4DBF800C9;
	Tue, 19 May 2020 10:31:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 233E5F802A2; Tue, 19 May 2020 10:30:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D57DF800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 10:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D57DF800C9
IronPort-SDR: /yMXz5sNqtV/4vIQhQyhnuumTfwNAn9QCgBlJg1SrBO3C6ulf/p+eVWaiMGEPfANOmFA17FbrN
 h7km8exlr1Aw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 01:30:50 -0700
IronPort-SDR: h4lHrinJ9Ag9SykPBqrv+PUDQgZjHpbaJ+UVePZpyDjNG0Ko0Mn7ewhJMLEVocg0DuBeAYn6UQ
 WelHWAYnipEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; d="scan'208";a="264234026"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga003.jf.intel.com with ESMTP; 19 May 2020 01:30:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/3] soundwire: add Slave sysfs support
Date: Tue, 19 May 2020 04:35:51 +0800
Message-Id: <20200518203551.2053-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518203551.2053-1-yung-chuan.liao@linux.intel.com>
References: <20200518203551.2053-1-yung-chuan.liao@linux.intel.com>
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

Expose MIPI DisCo Slave properties in sysfs.

For Slave properties and Data Port 0, the attributes are managed with
simple devm_ support.

A Slave Device may have more than one Data Port (DPN), and each Data
Port can be sink or source. The attributes are created dynamically
using pre-canned macros, but still use devm_ with a name attribute
group to avoid creating kobjects - as requested by GregKH. In the
_show function, we use container_of() to retrieve port number and
direction required to extract the information.

Audio modes are not supported for now. Depending on the discussions
the SoundWire Device Class, we may add it later as is or follow the
new specification.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-soundwire-slave     |  91 ++++++
 drivers/soundwire/Makefile                    |   3 +-
 drivers/soundwire/bus.c                       |   1 +
 drivers/soundwire/bus.h                       |   1 +
 drivers/soundwire/bus_type.c                  |   9 +-
 drivers/soundwire/sysfs_local.h               |  14 +
 drivers/soundwire/sysfs_slave.c               | 215 +++++++++++++
 drivers/soundwire/sysfs_slave_dpn.c           | 300 ++++++++++++++++++
 8 files changed, 631 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-slave
 create mode 100644 drivers/soundwire/sysfs_local.h
 create mode 100644 drivers/soundwire/sysfs_slave.c
 create mode 100644 drivers/soundwire/sysfs_slave_dpn.c

diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-slave b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
new file mode 100644
index 000000000000..db4c9511d1aa
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
@@ -0,0 +1,91 @@
+What:		/sys/bus/soundwire/devices/sdw:.../dev-properties/mipi_revision
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/wake_capable
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/test_mode_capable
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/clk_stop_mode1
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/simple_clk_stop_capable
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/clk_stop_timeout
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/ch_prep_timeout
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/reset_behave
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/high_PHY_capable
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/paging_support
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/bank_delay_support
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/p15_behave
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/master_count
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/source_ports
+		/sys/bus/soundwire/devices/sdw:.../dev-properties/sink_ports
+
+Date:		May 2020
+
+Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+		Bard Liao <yung-chuan.liao@linux.intel.com>
+		Vinod Koul <vkoul@kernel.org>
+
+Description:	SoundWire Slave DisCo properties.
+		These properties are defined by MIPI DisCo Specification
+		for SoundWire. They define various properties of the
+		SoundWire Slave and are used by the bus to configure
+		the Slave
+
+
+What:		/sys/bus/soundwire/devices/sdw:.../dp0/max_word
+		/sys/bus/soundwire/devices/sdw:.../dp0/min_word
+		/sys/bus/soundwire/devices/sdw:.../dp0/words
+		/sys/bus/soundwire/devices/sdw:.../dp0/BRA_flow_controlled
+		/sys/bus/soundwire/devices/sdw:.../dp0/simple_ch_prep_sm
+		/sys/bus/soundwire/devices/sdw:.../dp0/imp_def_interrupts
+
+Date:		May 2020
+
+Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+		Bard Liao <yung-chuan.liao@linux.intel.com>
+		Vinod Koul <vkoul@kernel.org>
+
+Description:	SoundWire Slave Data Port-0 DisCo properties.
+		These properties are defined by MIPI DisCo Specification
+		for the SoundWire. They define various properties of the
+		Data port 0 are used by the bus to configure the Data Port 0.
+
+
+What:		/sys/bus/soundwire/devices/sdw:.../dpN_src/max_word
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/min_word
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/words
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/type
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/max_grouping
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/simple_ch_prep_sm
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/ch_prep_timeout
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/imp_def_interrupts
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/min_ch
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/max_ch
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/channels
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/ch_combinations
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/max_async_buffer
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/block_pack_mode
+		/sys/bus/soundwire/devices/sdw:.../dpN_src/port_encoding
+
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/max_word
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/min_word
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/words
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/type
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/max_grouping
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/simple_ch_prep_sm
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/ch_prep_timeout
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/imp_def_interrupts
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/min_ch
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/max_ch
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/channels
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/ch_combinations
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/max_async_buffer
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/block_pack_mode
+		/sys/bus/soundwire/devices/sdw:.../dpN_sink/port_encoding
+
+Date:		May 2020
+
+Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+		Bard Liao <yung-chuan.liao@linux.intel.com>
+		Vinod Koul <vkoul@kernel.org>
+
+Description:	SoundWire Slave Data Source/Sink Port-N DisCo properties.
+		These properties are defined by MIPI DisCo Specification
+		for SoundWire. They define various properties of the
+		Source/Sink Data port N and are used by the bus to configure
+		the Data Port N.
diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 7319918e0aec..9b0aeee94876 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -4,7 +4,8 @@
 #
 
 #Bus Objs
-soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o
+soundwire-bus-objs := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o  \
+			sysfs_slave.o sysfs_slave_dpn.o
 obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
 
 ifdef CONFIG_DEBUG_FS
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 11cfe435e4a8..24ba77226376 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -8,6 +8,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
 #include "bus.h"
+#include "sysfs_local.h"
 
 static DEFINE_IDA(sdw_ida);
 
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 93ab0234a491..82484f741168 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -175,5 +175,6 @@ sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
 #define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
 
 void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
+int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 
 #endif /* __SDW_BUS_H */
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 2c1a19caba51..de9a671802b8 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -7,6 +7,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
 #include "bus.h"
+#include "sysfs_local.h"
 
 /**
  * sdw_get_device_id - find the matching SoundWire device id
@@ -46,8 +47,7 @@ static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
 	return ret;
 }
 
-static int sdw_slave_modalias(const struct sdw_slave *slave, char *buf,
-			      size_t size)
+int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
 {
 	/* modalias is sdw:m<mfg_id>p<part_id> */
 
@@ -105,6 +105,11 @@ static int sdw_drv_probe(struct device *dev)
 	if (slave->ops && slave->ops->read_prop)
 		slave->ops->read_prop(slave);
 
+	/* init the sysfs as we have properties now */
+	ret = sdw_slave_sysfs_init(slave);
+	if (ret < 0)
+		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
+
 	/*
 	 * Check for valid clk_stop_timeout, use DisCo worst case value of
 	 * 300ms
diff --git a/drivers/soundwire/sysfs_local.h b/drivers/soundwire/sysfs_local.h
new file mode 100644
index 000000000000..ff60adee3c41
--- /dev/null
+++ b/drivers/soundwire/sysfs_local.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright(c) 2015-2020 Intel Corporation. */
+
+#ifndef __SDW_SYSFS_LOCAL_H
+#define __SDW_SYSFS_LOCAL_H
+
+/*
+ * SDW sysfs APIs -
+ */
+
+int sdw_slave_sysfs_init(struct sdw_slave *slave);
+int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave);
+
+#endif /* __SDW_SYSFS_LOCAL_H */
diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
new file mode 100644
index 000000000000..ae6d241eca50
--- /dev/null
+++ b/drivers/soundwire/sysfs_slave.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2015-2020 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include "bus.h"
+#include "sysfs_local.h"
+
+/*
+ * Slave sysfs
+ */
+
+/*
+ * The sysfs for Slave reflects the MIPI description as given
+ * in the MIPI DisCo spec
+ *
+ * Base file is device
+ *	|---- modalias
+ *	|---- dev-properties
+ *		|---- mipi_revision
+ *		|---- wake_capable
+ *		|---- test_mode_capable
+ *		|---- clk_stop_mode1
+ *		|---- simple_clk_stop_capable
+ *		|---- clk_stop_timeout
+ *		|---- ch_prep_timeout
+ *		|---- reset_behave
+ *		|---- high_PHY_capable
+ *		|---- paging_support
+ *		|---- bank_delay_support
+ *		|---- p15_behave
+ *		|---- master_count
+ *		|---- source_ports
+ *		|---- sink_ports
+ *	|---- dp0
+ *		|---- max_word
+ *		|---- min_word
+ *		|---- words
+ *		|---- BRA_flow_controlled
+ *		|---- simple_ch_prep_sm
+ *		|---- imp_def_interrupts
+ *	|---- dpN_<sink/src>
+ *		|---- max_word
+ *		|---- min_word
+ *		|---- words
+ *		|---- type
+ *		|---- max_grouping
+ *		|---- simple_ch_prep_sm
+ *		|---- ch_prep_timeout
+ *		|---- imp_def_interrupts
+ *		|---- min_ch
+ *		|---- max_ch
+ *		|---- channels
+ *		|---- ch_combinations
+ *		|---- max_async_buffer
+ *		|---- block_pack_mode
+ *		|---- port_encoding
+ *
+ */
+
+#define sdw_slave_attr(field, format_string)			\
+static ssize_t field##_show(struct device *dev,			\
+			    struct device_attribute *attr,	\
+			    char *buf)				\
+{								\
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);		\
+	return sprintf(buf, format_string, slave->prop.field);	\
+}								\
+static DEVICE_ATTR_RO(field)
+
+sdw_slave_attr(mipi_revision, "0x%x\n");
+sdw_slave_attr(wake_capable, "%d\n");
+sdw_slave_attr(test_mode_capable, "%d\n");
+sdw_slave_attr(clk_stop_mode1, "%d\n");
+sdw_slave_attr(simple_clk_stop_capable, "%d\n");
+sdw_slave_attr(clk_stop_timeout, "%d\n");
+sdw_slave_attr(ch_prep_timeout, "%d\n");
+sdw_slave_attr(reset_behave, "%d\n");
+sdw_slave_attr(high_PHY_capable, "%d\n");
+sdw_slave_attr(paging_support, "%d\n");
+sdw_slave_attr(bank_delay_support, "%d\n");
+sdw_slave_attr(p15_behave, "%d\n");
+sdw_slave_attr(master_count, "%d\n");
+sdw_slave_attr(source_ports, "0x%x\n");
+sdw_slave_attr(sink_ports, "0x%x\n");
+
+static ssize_t modalias_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+
+	return sdw_slave_modalias(slave, buf, 256);
+}
+static DEVICE_ATTR_RO(modalias);
+
+static struct attribute *slave_attrs[] = {
+	&dev_attr_modalias.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(slave);
+
+static struct attribute *slave_dev_attrs[] = {
+	&dev_attr_mipi_revision.attr,
+	&dev_attr_wake_capable.attr,
+	&dev_attr_test_mode_capable.attr,
+	&dev_attr_clk_stop_mode1.attr,
+	&dev_attr_simple_clk_stop_capable.attr,
+	&dev_attr_clk_stop_timeout.attr,
+	&dev_attr_ch_prep_timeout.attr,
+	&dev_attr_reset_behave.attr,
+	&dev_attr_high_PHY_capable.attr,
+	&dev_attr_paging_support.attr,
+	&dev_attr_bank_delay_support.attr,
+	&dev_attr_p15_behave.attr,
+	&dev_attr_master_count.attr,
+	&dev_attr_source_ports.attr,
+	&dev_attr_sink_ports.attr,
+	NULL,
+};
+
+/*
+ * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
+ * for device-level properties
+ */
+static struct attribute_group sdw_slave_dev_attr_group = {
+	.attrs	= slave_dev_attrs,
+	.name = "dev-properties",
+};
+
+/*
+ * DP0 sysfs
+ */
+
+#define sdw_dp0_attr(field, format_string)				\
+static ssize_t field##_show(struct device *dev,				\
+			    struct device_attribute *attr,		\
+			    char *buf)					\
+{									\
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);			\
+	return sprintf(buf, format_string, slave->prop.dp0_prop->field);\
+}									\
+static DEVICE_ATTR_RO(field)
+
+sdw_dp0_attr(max_word, "%d\n");
+sdw_dp0_attr(min_word, "%d\n");
+sdw_dp0_attr(BRA_flow_controlled, "%d\n");
+sdw_dp0_attr(simple_ch_prep_sm, "%d\n");
+sdw_dp0_attr(imp_def_interrupts, "0x%x\n");
+
+static ssize_t words_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	ssize_t size = 0;
+	int i;
+
+	for (i = 0; i < slave->prop.dp0_prop->num_words; i++)
+		size += sprintf(buf + size, "%d ",
+				slave->prop.dp0_prop->words[i]);
+	size += sprintf(buf + size, "\n");
+
+	return size;
+}
+static DEVICE_ATTR_RO(words);
+
+static struct attribute *dp0_attrs[] = {
+	&dev_attr_max_word.attr,
+	&dev_attr_min_word.attr,
+	&dev_attr_words.attr,
+	&dev_attr_BRA_flow_controlled.attr,
+	&dev_attr_simple_ch_prep_sm.attr,
+	&dev_attr_imp_def_interrupts.attr,
+	NULL,
+};
+
+/*
+ * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
+ * for dp0-level properties
+ */
+static const struct attribute_group dp0_group = {
+	.attrs = dp0_attrs,
+	.name = "dp0",
+};
+
+int sdw_slave_sysfs_init(struct sdw_slave *slave)
+{
+	int ret;
+
+	ret = devm_device_add_groups(&slave->dev, slave_groups);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_device_add_group(&slave->dev, &sdw_slave_dev_attr_group);
+	if (ret < 0)
+		return ret;
+
+	if (slave->prop.dp0_prop) {
+		ret = devm_device_add_group(&slave->dev, &dp0_group);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (slave->prop.source_ports || slave->prop.sink_ports) {
+		ret = sdw_slave_sysfs_dpn_init(slave);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
diff --git a/drivers/soundwire/sysfs_slave_dpn.c b/drivers/soundwire/sysfs_slave_dpn.c
new file mode 100644
index 000000000000..c175a7d08815
--- /dev/null
+++ b/drivers/soundwire/sysfs_slave_dpn.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2015-2020 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include "bus.h"
+#include "sysfs_local.h"
+
+struct dpn_attribute {
+	struct device_attribute	dev_attr;
+	int N;
+	int dir;
+	const char *format_string;
+};
+
+/*
+ * Since we can't use ARRAY_SIZE, hard-code number of dpN attributes.
+ * This needs to be updated when adding new attributes - an error will be
+ * flagged on a mismatch.
+ */
+#define SDW_DPN_ATTRIBUTES 15
+
+#define sdw_dpn_attribute_alloc(field)					\
+static int field##_attribute_alloc(struct device *dev,			\
+				struct attribute **res,			\
+				int N, int dir,				\
+				const char *format_string)		\
+{									\
+	struct dpn_attribute *dpn_attr;					\
+									\
+	dpn_attr = devm_kzalloc(dev, sizeof(*dpn_attr), GFP_KERNEL);	\
+	if (!dpn_attr)							\
+		return -ENOMEM;						\
+	dpn_attr->N = N;						\
+	dpn_attr->dir = dir;						\
+	dpn_attr->format_string = format_string;			\
+	dpn_attr->dev_attr.attr.name = __stringify(field);		\
+	dpn_attr->dev_attr.attr.mode = 0444;				\
+	dpn_attr->dev_attr.show = field##_show;				\
+									\
+	*res = &dpn_attr->dev_attr.attr;				\
+									\
+	return 0;							\
+}
+
+#define sdw_dpn_attr(field)						\
+									\
+static ssize_t field##_dpn_show(struct sdw_slave *slave,		\
+				int N,					\
+				int dir,				\
+				const char *format_string,		\
+				char *buf)				\
+{									\
+	struct sdw_dpn_prop *dpn;					\
+	unsigned long mask;						\
+	int bit;							\
+	int i;								\
+									\
+	if (dir) {							\
+		dpn = slave->prop.src_dpn_prop;				\
+		mask = slave->prop.source_ports;			\
+	} else {							\
+		dpn = slave->prop.sink_dpn_prop;			\
+		mask = slave->prop.sink_ports;				\
+	}								\
+									\
+	i = 0;								\
+	for_each_set_bit(bit, &mask, 32) {				\
+		if (bit == N) {						\
+			return sprintf(buf, format_string,		\
+				       dpn[i].field);			\
+		}							\
+		i++;							\
+	}								\
+	return -EINVAL;							\
+}									\
+									\
+static ssize_t field##_show(struct device *dev,				\
+			    struct device_attribute *attr,		\
+			    char *buf)					\
+{									\
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);			\
+	struct dpn_attribute *dpn_attr =				\
+		container_of(attr, struct dpn_attribute, dev_attr);	\
+									\
+	return field##_dpn_show(slave,					\
+				dpn_attr->N, dpn_attr->dir,		\
+				dpn_attr->format_string,		\
+				buf);					\
+}									\
+sdw_dpn_attribute_alloc(field)
+
+sdw_dpn_attr(imp_def_interrupts);
+sdw_dpn_attr(max_word);
+sdw_dpn_attr(min_word);
+sdw_dpn_attr(type);
+sdw_dpn_attr(max_grouping);
+sdw_dpn_attr(simple_ch_prep_sm);
+sdw_dpn_attr(ch_prep_timeout);
+sdw_dpn_attr(max_ch);
+sdw_dpn_attr(min_ch);
+sdw_dpn_attr(max_async_buffer);
+sdw_dpn_attr(block_pack_mode);
+sdw_dpn_attr(port_encoding);
+
+#define sdw_dpn_array_attr(field)					\
+									\
+static ssize_t field##_dpn_show(struct sdw_slave *slave,		\
+				int N,					\
+				int dir,				\
+				const char *format_string,		\
+				char *buf)				\
+{									\
+	struct sdw_dpn_prop *dpn;					\
+	unsigned long mask;						\
+	ssize_t size = 0;						\
+	int bit;							\
+	int i;								\
+	int j;								\
+									\
+	if (dir) {							\
+		dpn = slave->prop.src_dpn_prop;				\
+		mask = slave->prop.source_ports;			\
+	} else {							\
+		dpn = slave->prop.sink_dpn_prop;			\
+		mask = slave->prop.sink_ports;				\
+	}								\
+									\
+	i = 0;								\
+	for_each_set_bit(bit, &mask, 32) {				\
+		if (bit == N) {						\
+			for (j = 0; j < dpn[i].num_##field; j++)	\
+				size += sprintf(buf + size,		\
+						format_string,		\
+						dpn[i].field[j]);	\
+			size += sprintf(buf + size, "\n");		\
+			return size;					\
+		}							\
+		i++;							\
+	}								\
+	return -EINVAL;							\
+}									\
+static ssize_t field##_show(struct device *dev,				\
+			    struct device_attribute *attr,		\
+			    char *buf)					\
+{									\
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);			\
+	struct dpn_attribute *dpn_attr =				\
+		container_of(attr, struct dpn_attribute, dev_attr);	\
+									\
+	return field##_dpn_show(slave,					\
+				dpn_attr->N, dpn_attr->dir,		\
+				dpn_attr->format_string,		\
+				buf);					\
+}									\
+sdw_dpn_attribute_alloc(field)
+
+sdw_dpn_array_attr(words);
+sdw_dpn_array_attr(ch_combinations);
+sdw_dpn_array_attr(channels);
+
+static int add_all_attributes(struct device *dev, int N, int dir)
+{
+	struct attribute **dpn_attrs;
+	struct attribute_group *dpn_group;
+	int i = 0;
+	int ret;
+
+	/* allocate attributes, last one is NULL */
+	dpn_attrs = devm_kcalloc(dev, SDW_DPN_ATTRIBUTES + 1,
+				 sizeof(struct attribute *),
+				 GFP_KERNEL);
+	if (!dpn_attrs)
+		return -ENOMEM;
+
+	ret = max_word_attribute_alloc(dev, &dpn_attrs[i++],
+				       N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = min_word_attribute_alloc(dev, &dpn_attrs[i++],
+				       N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = words_attribute_alloc(dev, &dpn_attrs[i++],
+				    N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = type_attribute_alloc(dev, &dpn_attrs[i++],
+				   N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = max_grouping_attribute_alloc(dev, &dpn_attrs[i++],
+					   N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = simple_ch_prep_sm_attribute_alloc(dev, &dpn_attrs[i++],
+						N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = ch_prep_timeout_attribute_alloc(dev, &dpn_attrs[i++],
+					      N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = imp_def_interrupts_attribute_alloc(dev, &dpn_attrs[i++],
+						 N, dir, "0x%x\n");
+	if (ret < 0)
+		return ret;
+
+	ret = min_ch_attribute_alloc(dev, &dpn_attrs[i++],
+				     N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = max_ch_attribute_alloc(dev, &dpn_attrs[i++],
+				     N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = channels_attribute_alloc(dev, &dpn_attrs[i++],
+				       N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = ch_combinations_attribute_alloc(dev, &dpn_attrs[i++],
+					      N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = max_async_buffer_attribute_alloc(dev, &dpn_attrs[i++],
+					       N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = block_pack_mode_attribute_alloc(dev, &dpn_attrs[i++],
+					      N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	ret = port_encoding_attribute_alloc(dev, &dpn_attrs[i++],
+					    N, dir, "%d\n");
+	if (ret < 0)
+		return ret;
+
+	/* paranioa check for editing mistakes */
+	if (i != SDW_DPN_ATTRIBUTES) {
+		dev_err(dev, "mismatch in attributes, allocated %d got %d\n",
+			SDW_DPN_ATTRIBUTES, i);
+		return -EINVAL;
+	}
+
+	dpn_group = devm_kzalloc(dev, sizeof(*dpn_group), GFP_KERNEL);
+	if (!dpn_group)
+		return -ENOMEM;
+
+	dpn_group->attrs = dpn_attrs;
+	dpn_group->name = devm_kasprintf(dev, GFP_KERNEL, "dp%d_%s",
+					 N, dir ? "src" : "sink");
+	if (!dpn_group->name)
+		return -ENOMEM;
+
+	ret = devm_device_add_group(dev, dpn_group);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave)
+{
+	unsigned long mask;
+	int ret;
+	int i;
+
+	mask = slave->prop.source_ports;
+	for_each_set_bit(i, &mask, 32) {
+		ret = add_all_attributes(&slave->dev, i, 1);
+		if (ret < 0)
+			return ret;
+	}
+
+	mask = slave->prop.sink_ports;
+	for_each_set_bit(i, &mask, 32) {
+		ret = add_all_attributes(&slave->dev, i, 0);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
-- 
2.17.1


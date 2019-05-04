Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DFA136CD
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 03:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F41188B;
	Sat,  4 May 2019 03:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F41188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556931838;
	bh=OqEMWttyISP8+eWah0lRNlUpf7QjUZVFYKEMf/SYF5A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goSlARcNyOXSlt5ZLXXn5/M54PWyTyVxK/f7bV/Re5xVqn+XYVzobqi/a7tE+4Oz9
	 DEiIiTZ2i6Qvg9tdWfxzrkqn6346RaYGoGwxO+m83Qxg1UzAle9jb8If29OffxQX1Y
	 5HyCSzDhr8aNVkjk3JphnnVsoLCnSKYQWabTndr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5868F8972E;
	Sat,  4 May 2019 03:00:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD1CEF896B6; Sat,  4 May 2019 03:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 295E0F896B6
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 03:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 295E0F896B6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 18:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="148114208"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga007.fm.intel.com with ESMTP; 03 May 2019 18:00:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 20:00:25 -0500
Message-Id: <20190504010030.29233-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 2/7] soundwire: add Slave sysfs support
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

Add DisCo Slave properties as device attributes.
Add a device for Data Port 0 which adds Dp0 properties as attributes.
Add devices for Source and Sink Data Ports, and add Dp-N
properties as attributes.

The Slave, DP0 and DPn cases are intentionally handled in separate
files to avoid conflicts with attributes having the same names at
different levels.

Audio modes are not supported for now. Depending on the discussions
the SoundWire Device Class, we may add it later as is or follow the
new specification.

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Makefile          |   2 +-
 drivers/soundwire/bus.c             |   2 +
 drivers/soundwire/bus.h             |   2 +
 drivers/soundwire/bus_type.c        |   5 +
 drivers/soundwire/slave.c           |   1 +
 drivers/soundwire/sysfs.c           | 213 ++++++++++++++++++++++++++++
 drivers/soundwire/sysfs_local.h     |  42 ++++++
 drivers/soundwire/sysfs_slave_dp0.c | 112 +++++++++++++++
 drivers/soundwire/sysfs_slave_dpn.c | 168 ++++++++++++++++++++++
 include/linux/soundwire/sdw.h       |   5 +
 10 files changed, 551 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soundwire/sysfs_local.h
 create mode 100644 drivers/soundwire/sysfs_slave_dp0.c
 create mode 100644 drivers/soundwire/sysfs_slave_dpn.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 787f1cbf342c..a72a29731a28 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -4,7 +4,7 @@
 
 #Bus Objs
 soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o \
-			sysfs.o
+			sysfs.o sysfs_slave_dp0.o sysfs_slave_dpn.o
 obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
 
 #Cadence Objs
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 38de7071e135..dd9181693554 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -113,6 +113,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct sdw_bus *bus = slave->bus;
 
+	sdw_sysfs_slave_exit(slave);
+
 	mutex_lock(&bus->bus_lock);
 
 	if (slave->dev_num) /* clear dev_num if assigned */
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 3048ca153f22..0707e68a8d21 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -18,6 +18,8 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
 void sdw_extract_slave_id(struct sdw_bus *bus,
 			  u64 addr, struct sdw_slave_id *id);
 
+extern const struct attribute_group *sdw_slave_dev_attr_groups[];
+
 enum {
 	SDW_MSG_FLAG_READ = 0,
 	SDW_MSG_FLAG_WRITE,
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 2655602f0cfb..f68fe45c1037 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -97,6 +97,11 @@ static int sdw_drv_probe(struct device *dev)
 	if (slave->ops && slave->ops->read_prop)
 		slave->ops->read_prop(slave);
 
+	/* init the sysfs as we have properties now */
+	ret = sdw_sysfs_slave_init(slave);
+	if (ret < 0)
+		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
+
 	/*
 	 * Check for valid clk_stop_timeout, use DisCo worst case value of
 	 * 300ms
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index f39a5815e25d..bad73a267fdd 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -34,6 +34,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 		     id->class_id, id->unique_id);
 
 	slave->dev.release = sdw_slave_release;
+	slave->dev.groups = sdw_slave_dev_attr_groups;
 	slave->dev.bus = &sdw_bus_type;
 	slave->bus = bus;
 	slave->status = SDW_SLAVE_UNATTACHED;
diff --git a/drivers/soundwire/sysfs.c b/drivers/soundwire/sysfs.c
index 7b6c3826a73a..734e2c8bc5cd 100644
--- a/drivers/soundwire/sysfs.c
+++ b/drivers/soundwire/sysfs.c
@@ -8,6 +8,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
 #include "bus.h"
+#include "sysfs_local.h"
 
 struct sdw_master_sysfs {
 	struct device dev;
@@ -160,3 +161,215 @@ void sdw_sysfs_bus_exit(struct sdw_bus *bus)
 	put_device(&master->dev);
 	bus->sysfs = NULL;
 }
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
+ *	|---- mipi_revision
+ *	|---- wake_capable
+ *	|---- test_mode_capable
+ *	|---- simple_clk_stop_capable
+ *	|---- clk_stop_timeout
+ *	|---- ch_prep_timeout
+ *	|---- reset_behave
+ *	|---- high_PHY_capable
+ *	|---- paging_support
+ *	|---- bank_delay_support
+ *	|---- p15_behave
+ *	|---- master_count
+ *	|---- source_ports
+ *	|---- sink_ports
+ *	|---- dp0
+ *		|---- max_word
+ *		|---- min_word
+ *		|---- words
+ *		|---- flow_controlled
+ *		|---- simple_ch_prep_sm
+ *		|---- device_interrupts
+ *	|---- dpN
+ *		|---- max_word
+ *		|---- min_word
+ *		|---- words
+ *		|---- type
+ *		|---- max_grouping
+ *		|---- simple_ch_prep_sm
+ *		|---- ch_prep_timeout
+ *		|---- device_interrupts
+ *		|---- max_ch
+ *		|---- min_ch
+ *		|---- ch
+ *		|---- ch_combinations
+ *		|---- modes
+ *		|---- max_async_buffer
+ *		|---- block_pack_mode
+ *		|---- port_encoding
+ *		|---- audio_modeM
+ *				|---- bus_min_freq
+ *				|---- bus_max_freq
+ *				|---- bus_freq
+ *				|---- max_freq
+ *				|---- min_freq
+ *				|---- freq
+ *				|---- prep_ch_behave
+ *				|---- glitchless
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
+sdw_slave_attr(source_ports, "%d\n");
+sdw_slave_attr(sink_ports, "%d\n");
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
+	&dev_attr_modalias.attr,
+	NULL,
+};
+
+static struct attribute_group sdw_slave_dev_attr_group = {
+	.attrs	= slave_dev_attrs,
+};
+
+const struct attribute_group *sdw_slave_dev_attr_groups[] = {
+	&sdw_slave_dev_attr_group,
+	NULL
+};
+
+int sdw_sysfs_slave_init(struct sdw_slave *slave)
+{
+	struct sdw_slave_sysfs *sysfs;
+	unsigned int src_dpns, sink_dpns, i, j;
+	int err;
+
+	if (slave->sysfs) {
+		dev_err(&slave->dev, "SDW Slave sysfs is already initialized\n");
+		err = -EIO;
+		goto err_ret;
+	}
+
+	sysfs = kzalloc(sizeof(*sysfs), GFP_KERNEL);
+	if (!sysfs) {
+		err = -ENOMEM;
+		goto err_ret;
+	}
+
+	slave->sysfs = sysfs;
+	sysfs->slave = slave;
+
+	if (slave->prop.dp0_prop) {
+		sysfs->dp0 = sdw_sysfs_slave_dp0_init(slave,
+						      slave->prop.dp0_prop);
+		if (!sysfs->dp0) {
+			err = -ENOMEM;
+			goto err_free_sysfs;
+		}
+	}
+
+	src_dpns = hweight32(slave->prop.source_ports);
+	sink_dpns = hweight32(slave->prop.sink_ports);
+	sysfs->num_dpns = src_dpns + sink_dpns;
+
+	sysfs->dpns = kcalloc(sysfs->num_dpns,
+			      sizeof(**sysfs->dpns), GFP_KERNEL);
+	if (!sysfs->dpns) {
+		err = -ENOMEM;
+		goto err_dp0;
+	}
+
+	for (i = 0; i < src_dpns; i++) {
+		sysfs->dpns[i] =
+			sdw_sysfs_slave_dpn_init(slave,
+						 &slave->prop.src_dpn_prop[i],
+						 true);
+		if (!sysfs->dpns[i]) {
+			err = -ENOMEM;
+			goto err_dpn;
+		}
+	}
+
+	for (j = 0; j < sink_dpns; j++) {
+		sysfs->dpns[i + j] =
+			sdw_sysfs_slave_dpn_init(slave,
+						 &slave->prop.sink_dpn_prop[j],
+						 false);
+		if (!sysfs->dpns[i + j]) {
+			err = -ENOMEM;
+			goto err_dpn;
+		}
+	}
+	return 0;
+
+err_dpn:
+	sdw_sysfs_slave_dpn_exit(sysfs);
+err_dp0:
+	sdw_sysfs_slave_dp0_exit(sysfs);
+err_free_sysfs:
+	kfree(sysfs);
+	sysfs->slave = NULL;
+err_ret:
+	return err;
+}
+
+void sdw_sysfs_slave_exit(struct sdw_slave *slave)
+{
+	struct sdw_slave_sysfs *sysfs = slave->sysfs;
+
+	if (!sysfs)
+		return;
+
+	sdw_sysfs_slave_dpn_exit(sysfs);
+	kfree(sysfs->dpns);
+	sdw_sysfs_slave_dp0_exit(sysfs);
+	kfree(sysfs);
+	slave->sysfs = NULL;
+}
diff --git a/drivers/soundwire/sysfs_local.h b/drivers/soundwire/sysfs_local.h
new file mode 100644
index 000000000000..dd037890117d
--- /dev/null
+++ b/drivers/soundwire/sysfs_local.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* Copyright(c) 2015-19 Intel Corporation. */
+
+#ifndef __SDW_SYSFS_LOCAL_H
+#define __SDW_SYSFS_LOCAL_H
+
+struct sdw_dp0_sysfs {
+	struct device dev;
+	struct sdw_dp0_prop *dp0_prop;
+};
+
+extern struct device_type sdw_dp0_type;
+
+struct sdw_dp0_sysfs
+*sdw_sysfs_slave_dp0_init(struct sdw_slave *slave,
+			  struct sdw_dp0_prop *prop);
+
+void sdw_sysfs_slave_dp0_exit(struct sdw_slave_sysfs *sysfs);
+
+struct sdw_dpn_sysfs {
+	struct device dev;
+	struct sdw_dpn_prop *dpn_prop;
+};
+
+extern struct device_type sdw_dpn_type;
+
+struct sdw_dpn_sysfs
+*sdw_sysfs_slave_dpn_init(struct sdw_slave *slave,
+			  struct sdw_dpn_prop *prop,
+			  bool src);
+
+void sdw_sysfs_slave_dpn_exit(struct sdw_slave_sysfs *sysfs);
+
+struct sdw_slave_sysfs {
+	struct sdw_slave *slave;
+	struct sdw_dp0_sysfs *dp0;
+	unsigned int num_dpns;
+	struct sdw_dpn_sysfs **dpns;
+
+};
+
+#endif /* __SDW_SYSFS_LOCAL_H */
diff --git a/drivers/soundwire/sysfs_slave_dp0.c b/drivers/soundwire/sysfs_slave_dp0.c
new file mode 100644
index 000000000000..4c9994a19199
--- /dev/null
+++ b/drivers/soundwire/sysfs_slave_dp0.c
@@ -0,0 +1,112 @@
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
+#include "sysfs_local.h"
+
+/*
+ * DP0 sysfs
+ */
+
+#define to_sdw_dp0(_dev) \
+	container_of(_dev, struct sdw_dp0_sysfs, dev)
+
+#define sdw_dp0_attr(field, format_string)				\
+static ssize_t field##_show(struct device *dev,				\
+			    struct device_attribute *attr,		\
+			    char *buf)					\
+{									\
+	struct sdw_dp0_sysfs *sysfs = to_sdw_dp0(dev);			\
+	return sprintf(buf, format_string, sysfs->dp0_prop->field);	\
+}									\
+static DEVICE_ATTR_RO(field)
+
+sdw_dp0_attr(min_word, "%d\n");
+sdw_dp0_attr(max_word, "%d\n");
+sdw_dp0_attr(BRA_flow_controlled, "%d\n");
+sdw_dp0_attr(simple_ch_prep_sm, "%d\n");
+sdw_dp0_attr(imp_def_interrupts, "0x%x\n");
+
+static ssize_t word_bits_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct sdw_dp0_sysfs *sysfs = to_sdw_dp0(dev);
+	ssize_t size = 0;
+	int i;
+
+	for (i = 0; i < sysfs->dp0_prop->num_words; i++)
+		size += sprintf(buf + size, "%d ", sysfs->dp0_prop->words[i]);
+	size += sprintf(buf + size, "\n");
+
+	return size;
+}
+static DEVICE_ATTR_RO(word_bits);
+
+static struct attribute *dp0_attrs[] = {
+	&dev_attr_min_word.attr,
+	&dev_attr_max_word.attr,
+	&dev_attr_BRA_flow_controlled.attr,
+	&dev_attr_simple_ch_prep_sm.attr,
+	&dev_attr_imp_def_interrupts.attr,
+	&dev_attr_word_bits.attr,
+	NULL,
+};
+
+static const struct attribute_group dp0_group = {
+	.attrs = dp0_attrs,
+};
+
+static const struct attribute_group *dp0_groups[] = {
+	&dp0_group,
+	NULL
+};
+
+static void sdw_dp0_release(struct device *dev)
+{
+	struct sdw_dp0_sysfs *sysfs = to_sdw_dp0(dev);
+
+	kfree(sysfs);
+}
+
+struct device_type sdw_dp0_type = {
+	.name =	"sdw_dp0",
+	.release = sdw_dp0_release,
+};
+
+struct sdw_dp0_sysfs
+*sdw_sysfs_slave_dp0_init(struct sdw_slave *slave,
+			  struct sdw_dp0_prop *prop)
+{
+	struct sdw_dp0_sysfs *dp0;
+	int err;
+
+	dp0 = kzalloc(sizeof(*dp0), GFP_KERNEL);
+	if (!dp0)
+		return NULL;
+
+	dp0->dev.type = &sdw_dp0_type;
+	dp0->dev.parent = &slave->dev;
+	dp0->dev.groups = dp0_groups;
+	dev_set_name(&dp0->dev, "dp0");
+	dp0->dp0_prop = prop;
+
+	err = device_register(&dp0->dev);
+	if (err) {
+		put_device(&dp0->dev);
+		dp0 = NULL;
+	}
+
+	return dp0;
+}
+
+void sdw_sysfs_slave_dp0_exit(struct sdw_slave_sysfs *sysfs)
+{
+	if (sysfs->dp0)
+		put_device(&sysfs->dp0->dev);
+}
diff --git a/drivers/soundwire/sysfs_slave_dpn.c b/drivers/soundwire/sysfs_slave_dpn.c
new file mode 100644
index 000000000000..a200898e8b5f
--- /dev/null
+++ b/drivers/soundwire/sysfs_slave_dpn.c
@@ -0,0 +1,168 @@
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
+#include "sysfs_local.h"
+
+/*
+ * DP-N properties
+ */
+
+#define to_sdw_dpn(_dev) \
+	container_of(_dev, struct sdw_dpn_sysfs, dev)
+
+#define sdw_dpn_attr(field, format_string)				\
+static ssize_t field##_show(struct device *dev,				\
+			    struct device_attribute *attr,		\
+			    char *buf)					\
+{									\
+	struct sdw_dpn_sysfs *sysfs = to_sdw_dpn(dev);			\
+	return sprintf(buf, format_string, sysfs->dpn_prop->field);	\
+}									\
+static DEVICE_ATTR_RO(field)
+
+sdw_dpn_attr(max_word, "%d\n");
+sdw_dpn_attr(min_word, "%d\n");
+sdw_dpn_attr(max_grouping, "%d\n");
+sdw_dpn_attr(imp_def_interrupts, "%d\n");
+sdw_dpn_attr(max_ch, "%d\n");
+sdw_dpn_attr(min_ch, "%d\n");
+sdw_dpn_attr(modes, "%d\n");
+sdw_dpn_attr(max_async_buffer, "%d\n");
+sdw_dpn_attr(block_pack_mode, "%d\n");
+sdw_dpn_attr(port_encoding, "%d\n");
+sdw_dpn_attr(simple_ch_prep_sm, "%d\n");
+sdw_dpn_attr(ch_prep_timeout, "%d\n");
+
+static ssize_t words_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct sdw_dpn_sysfs *sysfs = to_sdw_dpn(dev);
+	ssize_t size = 0;
+	int i;
+
+	for (i = 0; i < sysfs->dpn_prop->num_words; i++)
+		size += sprintf(buf + size, "%d ", sysfs->dpn_prop->words[i]);
+	size += sprintf(buf + size, "\n");
+
+	return size;
+}
+static DEVICE_ATTR_RO(words);
+
+static ssize_t channels_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct sdw_dpn_sysfs *sysfs = to_sdw_dpn(dev);
+	ssize_t size = 0;
+	int i;
+
+	for (i = 0; i < sysfs->dpn_prop->num_ch; i++)
+		size += sprintf(buf + size, "%d ", sysfs->dpn_prop->ch[i]);
+	size += sprintf(buf + size, "\n");
+
+	return size;
+}
+static DEVICE_ATTR_RO(channels);
+
+static ssize_t ch_combinations_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct sdw_dpn_sysfs *sysfs = to_sdw_dpn(dev);
+	ssize_t size = 0;
+	int i;
+
+	for (i = 0; i < sysfs->dpn_prop->num_ch_combinations; i++)
+		size += sprintf(buf + size, "%d ",
+				sysfs->dpn_prop->ch_combinations[i]);
+	size += sprintf(buf + size, "\n");
+
+	return size;
+}
+static DEVICE_ATTR_RO(ch_combinations);
+
+static struct attribute *dpn_attrs[] = {
+	&dev_attr_max_word.attr,
+	&dev_attr_min_word.attr,
+	&dev_attr_max_grouping.attr,
+	&dev_attr_imp_def_interrupts.attr,
+	&dev_attr_max_ch.attr,
+	&dev_attr_min_ch.attr,
+	&dev_attr_modes.attr,
+	&dev_attr_max_async_buffer.attr,
+	&dev_attr_block_pack_mode.attr,
+	&dev_attr_port_encoding.attr,
+	&dev_attr_simple_ch_prep_sm.attr,
+	&dev_attr_ch_prep_timeout.attr,
+	&dev_attr_words.attr,
+	&dev_attr_channels.attr,
+	&dev_attr_ch_combinations.attr,
+	NULL,
+};
+
+static const struct attribute_group dpn_group = {
+	.attrs = dpn_attrs,
+};
+
+static const struct attribute_group *dpn_groups[] = {
+	&dpn_group,
+	NULL
+};
+
+static void sdw_dpn_release(struct device *dev)
+{
+	struct sdw_dpn_sysfs *sysfs = to_sdw_dpn(dev);
+
+	kfree(sysfs);
+}
+
+struct device_type sdw_dpn_type = {
+	.name =	"sdw_dpn",
+	.release = sdw_dpn_release,
+};
+
+struct sdw_dpn_sysfs
+*sdw_sysfs_slave_dpn_init(struct sdw_slave *slave,
+			  struct sdw_dpn_prop *prop,
+			  bool src)
+{
+	struct sdw_dpn_sysfs *dpn;
+	int err;
+
+	dpn = kzalloc(sizeof(*dpn), GFP_KERNEL);
+	if (!dpn)
+		return NULL;
+
+	dpn->dev.type = &sdw_dpn_type;
+	dpn->dev.parent = &slave->dev;
+	dpn->dev.groups = dpn_groups;
+	dpn->dpn_prop = prop;
+
+	if (src)
+		dev_set_name(&dpn->dev, "src-dp%x", prop->num);
+	else
+		dev_set_name(&dpn->dev, "sink-dp%x", prop->num);
+
+	err = device_register(&dpn->dev);
+	if (err) {
+		put_device(&dpn->dev);
+		dpn = NULL;
+	}
+
+	return dpn;
+}
+
+void sdw_sysfs_slave_dpn_exit(struct sdw_slave_sysfs *sysfs)
+{
+	int i;
+
+	for (i = 0; i < sysfs->num_dpns; i++) {
+		if (sysfs->dpns[i])
+			put_device(&sysfs->dpns[i]->dev);
+	}
+}
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b64d46fed0c8..fae3a3ad6e68 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -405,10 +405,13 @@ int sdw_slave_read_dp0(struct sdw_slave *slave,
 /*
  * SDW sysfs APIs
  */
+struct sdw_slave_sysfs;
 struct sdw_master_sysfs;
 
 int sdw_sysfs_bus_init(struct sdw_bus *bus);
 void sdw_sysfs_bus_exit(struct sdw_bus *bus);
+int sdw_sysfs_slave_init(struct sdw_slave *slave);
+void sdw_sysfs_slave_exit(struct sdw_slave *slave);
 
 /*
  * SDW Slave Structures and APIs
@@ -552,6 +555,7 @@ struct sdw_slave_ops {
  * @bus: Bus handle
  * @ops: Slave callback ops
  * @prop: Slave properties
+ * @sysfs: Sysfs interface
  * @node: node for bus list
  * @port_ready: Port ready completion flag for each Slave port
  * @dev_num: Device Number assigned by Bus
@@ -563,6 +567,7 @@ struct sdw_slave {
 	struct sdw_bus *bus;
 	const struct sdw_slave_ops *ops;
 	struct sdw_slave_prop prop;
+	struct sdw_slave_sysfs *sysfs;
 	struct list_head node;
 	struct completion *port_ready;
 	u16 dev_num;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

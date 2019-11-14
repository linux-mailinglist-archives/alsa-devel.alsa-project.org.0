Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A434BFCCCC
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:07:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BFE1612;
	Thu, 14 Nov 2019 19:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BFE1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573754826;
	bh=ZXYevfbPT8W4/8yU/zPSYYKRkare9WZCYEZ10EIaxAg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UcKtweuR/HFyTRS5+9Gg7TkoPBPZfPT31az9VKvdbkQXBsViRXjJqZjpdZ0TDv8GF
	 Z5NQ+XL9WLvTKEgyLr0hxGwsiG1/cJCa+rGW7xUdLFyj0cln+tApRzTOdVhwEaQeOS
	 Uq1wo+gKNOZdvkjod5ef9j14zD8fljs6gJ6n876Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C94CF8015A;
	Thu, 14 Nov 2019 19:00:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68771F80123; Thu, 14 Nov 2019 19:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AACABF80108
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:00:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AACABF80108
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:00:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="207871568"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga003.jf.intel.com with ESMTP; 14 Nov 2019 10:00:03 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 11:59:26 -0600
Message-Id: <20191114175933.21992-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114175933.21992-1-pierre-louis.bossart@linux.intel.com>
References: <20191114175933.21992-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 08/15] soundwire: add initial definitions
	for sdw_master_device
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

Since we want an explicit support for the SoundWire Master device, add
the definitions, following the Grey Bus example.

Unlike for the Slave device, we do not set a variable when dealing
with the master uevent.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Makefile         |  2 +-
 drivers/soundwire/bus_type.c       |  7 +++-
 drivers/soundwire/master.c         | 62 ++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h      | 35 +++++++++++++++++
 include/linux/soundwire/sdw_type.h |  9 +++++
 5 files changed, 112 insertions(+), 3 deletions(-)
 create mode 100644 drivers/soundwire/master.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 563894e5ecaf..89b29819dd3a 100644
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
index 5c18c21545b5..df1271f6db61 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -59,9 +59,12 @@ int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
 
 		if (add_uevent_var(env, "MODALIAS=%s", modalias))
 			return -ENOMEM;
+	} else if (is_sdw_md(dev)) {
+		/* this should not happen but throw an error */
+		dev_warn(dev, "uevent for Master device, unsupported\n");
+		return -EINVAL;
 	} else {
-		/* only Slave device type supported */
-		dev_warn(dev, "uevent for unknown Soundwire type\n");
+		dev_warn(dev, "uevent for unknown device\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
new file mode 100644
index 000000000000..6210098c892b
--- /dev/null
+++ b/drivers/soundwire/master.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2019 Intel Corporation.
+
+#include <linux/device.h>
+#include <linux/acpi.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include "bus.h"
+
+static void sdw_md_release(struct device *dev)
+{
+	struct sdw_master_device *md = to_sdw_master_device(dev);
+
+	kfree(md);
+}
+
+struct device_type sdw_md_type = {
+	.name =		"soundwire_master",
+	.release =	sdw_md_release,
+};
+
+struct sdw_master_device *sdw_md_add(struct sdw_md_driver *driver,
+				     struct device *parent,
+				     struct fwnode_handle *fwnode,
+				     int link_id)
+{
+	struct sdw_master_device *md;
+	int ret;
+
+	if (!driver->probe) {
+		dev_err(parent, "mandatory probe callback missing\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	md = kzalloc(sizeof(*md), GFP_KERNEL);
+	if (!md)
+		return ERR_PTR(-ENOMEM);
+
+	md->link_id = link_id;
+
+	md->driver = driver;
+
+	md->dev.parent = parent;
+	md->dev.fwnode = fwnode;
+	md->dev.bus = &sdw_bus_type;
+	md->dev.type = &sdw_md_type;
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
+	}
+
+	return md;
+}
+EXPORT_SYMBOL(sdw_md_add);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 5b1180f1e6b5..af0a72e7afdf 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -585,6 +585,16 @@ struct sdw_slave {
 #define to_sdw_slave_device(d) \
 	container_of(d, struct sdw_slave, dev)
 
+struct sdw_master_device {
+	struct device dev;
+	int link_id;
+	struct sdw_md_driver *driver;
+	void *pdata; /* core does not touch */
+};
+
+#define to_sdw_master_device(d)	\
+	container_of(d, struct sdw_master_device, dev)
+
 struct sdw_driver {
 	const char *name;
 
@@ -599,6 +609,26 @@ struct sdw_driver {
 	struct device_driver driver;
 };
 
+struct sdw_md_driver {
+	/* initializations and allocations */
+	int (*probe)(struct sdw_master_device *md, void *link_ctx);
+	/* hardware enablement, all clock/power dependencies are available */
+	int (*startup)(struct sdw_master_device *md);
+	/* hardware disabled */
+	int (*shutdown)(struct sdw_master_device *md);
+	/* free all resources */
+	int (*remove)(struct sdw_master_device *md);
+	/*
+	 * enable/disable driver control while in clock-stop mode,
+	 * typically in always-on/D0ix modes. When the driver yields
+	 * control, another entity in the system (typically firmware
+	 * running on an always-on microprocessor) is responsible to
+	 * tracking Slave-initiated wakes
+	 */
+	int (*autonomous_clock_stop_enable)(struct sdw_master_device *md,
+					    bool state);
+};
+
 #define SDW_SLAVE_ENTRY(_mfg_id, _part_id, _drv_data) \
 	{ .mfg_id = (_mfg_id), .part_id = (_part_id), \
 	  .driver_data = (unsigned long)(_drv_data) }
@@ -788,6 +818,11 @@ struct sdw_bus {
 int sdw_add_bus_master(struct sdw_bus *bus);
 void sdw_delete_bus_master(struct sdw_bus *bus);
 
+struct sdw_master_device *sdw_md_add(struct sdw_md_driver *driver,
+				     struct device *parent,
+				     struct fwnode_handle *fwnode,
+				     int link_id);
+
 /**
  * sdw_port_config: Master or Slave Port configuration
  *
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index c681b3426478..463d6d018d56 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -6,15 +6,24 @@
 
 extern struct bus_type sdw_bus_type;
 extern struct device_type sdw_slave_type;
+extern struct device_type sdw_md_type;
 
 static inline int is_sdw_slave(const struct device *dev)
 {
 	return dev->type == &sdw_slave_type;
 }
 
+static inline int is_sdw_md(const struct device *dev)
+{
+	return dev->type == &sdw_md_type;
+}
+
 #define to_sdw_slave_driver(_drv) \
 	container_of(_drv, struct sdw_driver, driver)
 
+#define to_sdw_md_driver(_drv) \
+	container_of(_drv, struct sdw_md_driver, driver)
+
 #define sdw_register_slave_driver(drv) \
 	__sdw_register_slave_driver(drv, THIS_MODULE)
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

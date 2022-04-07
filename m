Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B18364F8A60
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 00:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2612F17A8;
	Fri,  8 Apr 2022 00:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2612F17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649371289;
	bh=7+M8a6kcAiKeskgBjMTmoAJ4Q5qmhVqYibOqT1Y3M1M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WWA6z3FewrY8Lq7ltH7Lzr04wTteAmPkP3D6RS0Slrl4HR5tZavFtPQwOnfzc8sSM
	 HPgD92zjiVXO5BBvn/93eqQl2VcJvv2UKscoya9CkLn/cDKS1pxrZcY+geQ1VS7bJE
	 +4V4yCTNeU+I4vYtwaDj0kLz63X7XCXL4iI9DTUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99441F8026A;
	Fri,  8 Apr 2022 00:40:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88D00F8024C; Fri,  8 Apr 2022 00:40:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 857AFF8012A
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 00:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 857AFF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ESUeVm32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649371221; x=1680907221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7+M8a6kcAiKeskgBjMTmoAJ4Q5qmhVqYibOqT1Y3M1M=;
 b=ESUeVm32iVp5EF7Kra81+UJD7KbH6c4MhBOkdCKf8yR8fLbfQRxKknOW
 F7kkOXfdrQrX3kUH0/oJS+fx/DOZVQolMYBUE+FiwW0EDonbC2+JejaHf
 x9xXgM0ZkdKtMdKeUtaTpmTSRxOFx0+lhhHXvcWPbkdpQO4SM4Ckouvv/
 kFFXbB0nV0HcJvOmn2xmHZtb6KznDX0M+f9zhhLDaYjd0bYiD7nXS+uvc
 vRut3KI2tuP534+iBxR8qEqu4GNBMC+SETlx2ir6qiRcmHieBwVCyXUav
 OhaGbQy/HG+T3OP5+CXmhd4pYHDXmKIoXYhinfSogco/mY7xK3sXLK+lf g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="322145765"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="322145765"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 15:40:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="550267759"
Received: from achordiy-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.88.227])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 15:40:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [RFC PATCH] soundwire: use driver callbacks directly with proper
 locking
Date: Thu,  7 Apr 2022 17:39:32 -0500
Message-Id: <20220407223932.84526-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
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

In the SoundWire probe, we store a pointer from the driver ops into
the 'slave' structure. This can lead to kernel oopses when unbinding
codec drivers, e.g. with the following sequence to remove machine
driver and codec driver.

/sbin/modprobe -r snd_soc_sof_sdw
/sbin/modprobe -r snd_soc_rt711

The full details can be found in the BugLink below, for reference the
two following examples show different cases of driver ops/callbacks
being invoked after the driver .remove().

kernel: BUG: kernel NULL pointer dereference, address: 0000000000000150
kernel: Workqueue: events cdns_update_slave_status_work [soundwire_cadence]
kernel: RIP: 0010:mutex_lock+0x19/0x30
kernel: Call Trace:
kernel:  ? sdw_handle_slave_status+0x426/0xe00 [soundwire_bus 94ff184bf398570c3f8ff7efe9e32529f532e4ae]
kernel:  ? newidle_balance+0x26a/0x400
kernel:  ? cdns_update_slave_status_work+0x1e9/0x200 [soundwire_cadence 1bcf98eebe5ba9833cd433323769ac923c9c6f82]

kernel: BUG: unable to handle page fault for address: ffffffffc07654c8
kernel: Workqueue: pm pm_runtime_work
kernel: RIP: 0010:sdw_bus_prep_clk_stop+0x6f/0x160 [soundwire_bus]
kernel: Call Trace:
kernel:  <TASK>
kernel:  sdw_cdns_clock_stop+0xb5/0x1b0 [soundwire_cadence 1bcf98eebe5ba9833cd433323769ac923c9c6f82]
kernel:  intel_suspend_runtime+0x5f/0x120 [soundwire_intel aca858f7c87048d3152a4a41bb68abb9b663a1dd]
kernel:  ? dpm_sysfs_remove+0x60/0x60

This was not detected earlier in Intel tests since the tests first
remove the parent PCI device and shut down the bus. The sequence
above is a corner case which keeps the bus operational but without a
driver bound.

This patch removes the use the 'slave' ops and uses proper locking to
make sure there are no live callbacks based on a dangling pointer
executed during or after the driver unbinding sequence. In one
specific case, indicated with comments in the code, the device lock is
already taken at a higher level when starting the resume operations.

The issue with the ops pointer has been there since December 2017, but
there were so many changes in the bus handling code that this patch
will not apply cleanly all the way to this initial commit. The changes
can be easily backported though.

Thanks to Dan Williams for his suggestions on an earlier version of
this patch.

BugLink: https://github.com/thesofproject/linux/issues/3531
Fixes: 56d4fe31af77 ("soundwire: Add MIPI DisCo property helpers")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---

This is a follow-up on the initial discussion in https://lore.kernel.org/alsa-devel/d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com/

I could use feedback on whether using device_lock() is appropriate and
test results on non-Intel platforms. Thanks!
Pierre

 drivers/soundwire/bus.c      | 78 ++++++++++++++++++++++++++++--------
 drivers/soundwire/bus_type.c |  6 +--
 drivers/soundwire/stream.c   | 57 +++++++++++++++++---------
 3 files changed, 102 insertions(+), 39 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 8b7a680f388e..545b379a119e 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -7,6 +7,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
 #include "bus.h"
 #include "sysfs_local.h"
 
@@ -846,12 +847,18 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
 				       enum sdw_clk_stop_mode mode,
 				       enum sdw_clk_stop_type type)
 {
-	int ret;
+	struct device *dev = &slave->dev;
+	struct sdw_driver *drv;
 
-	if (slave->ops && slave->ops->clk_stop) {
-		ret = slave->ops->clk_stop(slave, mode, type);
-		if (ret < 0)
-			return ret;
+	/*
+	 * this function can only be called from a pm_runtime
+	 * sequence where the device is already locked
+	 */
+
+	if (dev->driver) {
+		drv = drv_to_sdw_driver(dev->driver);
+		if (drv && drv->ops && drv->ops->clk_stop)
+			return drv->ops->clk_stop(slave, mode, type);
 	}
 
 	return 0;
@@ -1616,14 +1623,25 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		}
 
 		/* Update the Slave driver */
-		if (slave_notify && slave->ops &&
-		    slave->ops->interrupt_callback) {
-			slave_intr.sdca_cascade = sdca_cascade;
-			slave_intr.control_port = clear;
-			memcpy(slave_intr.port, &port_status,
-			       sizeof(slave_intr.port));
-
-			slave->ops->interrupt_callback(slave, &slave_intr);
+		if (slave_notify) {
+			struct device *dev = &slave->dev;
+			struct sdw_driver *drv;
+
+			device_lock(dev);
+
+			if (dev->driver) {
+				drv = drv_to_sdw_driver(dev->driver);
+				if (drv && drv->ops && drv->ops->interrupt_callback) {
+					slave_intr.sdca_cascade = sdca_cascade;
+					slave_intr.control_port = clear;
+					memcpy(slave_intr.port, &port_status,
+					       sizeof(slave_intr.port));
+
+					drv->ops->interrupt_callback(slave, &slave_intr);
+				}
+			}
+
+			device_unlock(dev);
 		}
 
 		/* Ack interrupt */
@@ -1697,7 +1715,12 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 static int sdw_update_slave_status(struct sdw_slave *slave,
 				   enum sdw_slave_status status)
 {
+	struct device *dev = &slave->dev;
+	struct sdw_driver *drv;
 	unsigned long time;
+	int ret = 0;
+
+	device_lock_assert(dev);
 
 	if (!slave->probed) {
 		/*
@@ -1716,10 +1739,13 @@ static int sdw_update_slave_status(struct sdw_slave *slave,
 		}
 	}
 
-	if (!slave->ops || !slave->ops->update_status)
-		return 0;
+	if (dev->driver) {
+		drv = drv_to_sdw_driver(dev->driver);
+		if (drv && drv->ops && drv->ops->update_status)
+			ret = drv->ops->update_status(slave, status);
+	}
 
-	return slave->ops->update_status(slave, status);
+	return ret;
 }
 
 /**
@@ -1828,7 +1854,10 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			break;
 		}
 
+		device_lock(&slave->dev);
 		ret = sdw_update_slave_status(slave, status[i]);
+		device_unlock(&slave->dev);
+
 		if (ret < 0)
 			dev_err(&slave->dev,
 				"Update Slave status failed:%d\n", ret);
@@ -1860,6 +1889,7 @@ EXPORT_SYMBOL(sdw_handle_slave_status);
 void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
 {
 	struct sdw_slave *slave;
+	bool lock;
 	int i;
 
 	/* Check all non-zero devices */
@@ -1878,7 +1908,23 @@ void sdw_clear_slave_status(struct sdw_bus *bus, u32 request)
 		if (slave->status != SDW_SLAVE_UNATTACHED) {
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
 			slave->first_interrupt_done = false;
+
+			lock = device_trylock(&slave->dev);
+
+			/*
+			 * this bus/manager-level function can only be called from
+			 * a resume sequence. If the peripheral device (child of the
+			 *  manager device) is locked, this indicates a resume operation
+			 * initiated by the device core to deal with .remove() or .shutdown()
+			 * at the peripheral level. With the parent-child order enforced
+			 * by PM frameworks on resume, the peripheral resume has not started
+			 * yet, so it's safe to assume the lock will not be released while
+			 * the update_status callback is invoked.
+			 */
 			sdw_update_slave_status(slave, SDW_SLAVE_UNATTACHED);
+
+			if (lock)
+				device_unlock(&slave->dev);
 		}
 
 		/* keep track of request, used in pm_runtime resume */
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 893296f3fe39..91f39c8c119a 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -98,8 +98,6 @@ static int sdw_drv_probe(struct device *dev)
 	if (!id)
 		return -ENODEV;
 
-	slave->ops = drv->ops;
-
 	/*
 	 * attach to power domain but don't turn on (last arg)
 	 */
@@ -118,8 +116,8 @@ static int sdw_drv_probe(struct device *dev)
 	}
 
 	/* device is probed so let's read the properties now */
-	if (slave->ops && slave->ops->read_prop)
-		slave->ops->read_prop(slave);
+	if (drv->ops && drv->ops->read_prop)
+		drv->ops->read_prop(slave);
 
 	/* init the sysfs as we have properties now */
 	ret = sdw_slave_sysfs_init(slave);
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index f273459b2023..7862b4403d14 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
 #include <sound/soc.h>
 #include "bus.h"
 
@@ -401,20 +402,26 @@ static int sdw_do_port_prep(struct sdw_slave_runtime *s_rt,
 			    struct sdw_prepare_ch prep_ch,
 			    enum sdw_port_prep_ops cmd)
 {
-	const struct sdw_slave_ops *ops = s_rt->slave->ops;
-	int ret;
+	struct device *dev = &s_rt->slave->dev;
+	struct sdw_driver *drv;
+	int ret = 0;
 
-	if (ops->port_prep) {
-		ret = ops->port_prep(s_rt->slave, &prep_ch, cmd);
-		if (ret < 0) {
-			dev_err(&s_rt->slave->dev,
-				"Slave Port Prep cmd %d failed: %d\n",
-				cmd, ret);
-			return ret;
+	device_lock(dev);
+
+	if (dev->driver) {
+		drv = drv_to_sdw_driver(dev->driver);
+		if (drv && drv->ops && drv->ops->port_prep) {
+			ret = drv->ops->port_prep(s_rt->slave, &prep_ch, cmd);
+			if (ret < 0)
+				dev_err(&s_rt->slave->dev,
+					"Slave Port Prep cmd %d failed: %d\n",
+					cmd, ret);
 		}
 	}
 
-	return 0;
+	device_unlock(dev);
+
+	return ret;
 }
 
 static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
@@ -578,7 +585,7 @@ static int sdw_notify_config(struct sdw_master_runtime *m_rt)
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_bus *bus = m_rt->bus;
 	struct sdw_slave *slave;
-	int ret = 0;
+	int ret;
 
 	if (bus->ops->set_bus_conf) {
 		ret = bus->ops->set_bus_conf(bus, &bus->params);
@@ -587,19 +594,31 @@ static int sdw_notify_config(struct sdw_master_runtime *m_rt)
 	}
 
 	list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
-		slave = s_rt->slave;
+		struct sdw_driver *drv;
+		struct device *dev;
 
-		if (slave->ops->bus_config) {
-			ret = slave->ops->bus_config(slave, &bus->params);
-			if (ret < 0) {
-				dev_err(bus->dev, "Notify Slave: %d failed\n",
-					slave->dev_num);
-				return ret;
+		slave = s_rt->slave;
+		dev = &slave->dev;
+
+		device_lock(dev);
+
+		if (dev->driver) {
+			drv = drv_to_sdw_driver(dev->driver);
+			if (drv && drv->ops && drv->ops->bus_config) {
+				ret = drv->ops->bus_config(slave, &bus->params);
+				if (ret < 0) {
+					device_unlock(dev);
+					dev_err(bus->dev, "Notify Slave: %d failed\n",
+						slave->dev_num);
+					return ret;
+				}
 			}
 		}
+
+		device_unlock(dev);
 	}
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.30.2


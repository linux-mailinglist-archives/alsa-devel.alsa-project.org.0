Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9922779AC
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 21:48:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A641D180E;
	Thu, 24 Sep 2020 21:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A641D180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600976883;
	bh=9tFLmUA75wPyNhEDLpTm8lxfNvvPtdxMlY36t09nc2c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nFQvQHDZsZMWrMGi5uScBRMvnd6bIkIJd/C/CgS+lpnUewUN/J7EBwhg5HFq4SmLB
	 Sg+UKlUTgczTL51YAvboUYSgbU2kqzbpf1m5W+Qb7Uc9oWiHEJ0DXzcbgYFyJB4bjD
	 S/bJrv96WMU6jY6YN92dg+i5uiE79uJlYRazkKVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFCE7F802DC;
	Thu, 24 Sep 2020 21:45:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEACEF8015F; Thu, 24 Sep 2020 21:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E77DEF80232
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 21:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77DEF80232
IronPort-SDR: Q5aJeMAxmZjHbn59m+ky0LMV+GC9dBf/Tf3bFERXBJlvGoKD94CqX7QQZSD0NXicwEBWYTtUDm
 /D96+r+bgrYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="141336271"
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; d="scan'208";a="141336271"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 12:44:47 -0700
IronPort-SDR: ShEPvySRaEZ3562oAWok7+pKVELFSeZUR/KcLvL5WP6jm9n5QMNTvx8UaynHzde+IJJhjTk0ra
 xNfUT+tmlPQQ==
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; d="scan'208";a="291360682"
Received: from inwhanki-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.115.252])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 12:44:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH v3 2/2] soundwire: sysfs: add slave status and device number
 before probe
Date: Thu, 24 Sep 2020 14:44:30 -0500
Message-Id: <20200924194430.121058-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200924194430.121058-1-pierre-louis.bossart@linux.intel.com>
References: <20200924194430.121058-1-pierre-louis.bossart@linux.intel.com>
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

The MIPI DisCo device properties that are read by the driver from
platform firmware, or hard-coded in the driver, should only be
provided as sysfs entries when a driver probes successfully.

However the device status and device number is updated even when there
is no driver present, and hence can be updated when a Slave device is
detected on the bus without being described in platform firmware and
without any driver registered/probed.

As suggested by GregKH, the attribute group for Slave status and
device number is is added by default upon device registration.

Credits to Vinod Koul for the status_show() function, shared in a
separate patch and used as is here. The status table was modified to
remove an unnecessary enum and status_show() is handled in a different
group attribute than what was suggested by Vinod.

Tested-by: Srinivas Kandgatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Co-developed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../ABI/testing/sysfs-bus-soundwire-slave     | 18 ++++++
 drivers/soundwire/slave.c                     |  2 +
 drivers/soundwire/sysfs_local.h               |  4 ++
 drivers/soundwire/sysfs_slave.c               | 58 ++++++++++++++++++-
 4 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-slave b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
index db4c9511d1aa..d324aa0b678f 100644
--- a/Documentation/ABI/testing/sysfs-bus-soundwire-slave
+++ b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
@@ -1,3 +1,21 @@
+What:		/sys/bus/soundwire/devices/sdw:.../status
+		/sys/bus/soundwire/devices/sdw:.../device_number
+
+Date:		September 2020
+
+Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+		Bard Liao <yung-chuan.liao@linux.intel.com>
+		Vinod Koul <vkoul@kernel.org>
+
+Description:	SoundWire Slave status
+
+		These properties report the Slave status, e.g. if it
+		is UNATTACHED or not, and in the latter case show the
+		device_number. This status information is useful to
+		detect devices exposed by platform firmware but not
+		physically present on the bus, and conversely devices
+		not exposed in platform firmware but enumerated.
+
 What:		/sys/bus/soundwire/devices/sdw:.../dev-properties/mipi_revision
 		/sys/bus/soundwire/devices/sdw:.../dev-properties/wake_capable
 		/sys/bus/soundwire/devices/sdw:.../dev-properties/test_mode_capable
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 19b012310c29..a08f4081c1c4 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -6,6 +6,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
 #include "bus.h"
+#include "sysfs_local.h"
 
 static void sdw_slave_release(struct device *dev)
 {
@@ -51,6 +52,7 @@ int sdw_slave_add(struct sdw_bus *bus,
 	slave->dev.bus = &sdw_bus_type;
 	slave->dev.of_node = of_node_get(to_of_node(fwnode));
 	slave->dev.type = &sdw_slave_type;
+	slave->dev.groups = sdw_slave_status_attr_groups;
 	slave->bus = bus;
 	slave->status = SDW_SLAVE_UNATTACHED;
 	init_completion(&slave->enumeration_complete);
diff --git a/drivers/soundwire/sysfs_local.h b/drivers/soundwire/sysfs_local.h
index ff60adee3c41..7268bc24c538 100644
--- a/drivers/soundwire/sysfs_local.h
+++ b/drivers/soundwire/sysfs_local.h
@@ -8,6 +8,10 @@
  * SDW sysfs APIs -
  */
 
+/* basic attributes to report status of Slave (attachment, dev_num) */
+extern const struct attribute_group *sdw_slave_status_attr_groups[];
+
+/* additional device-managed properties reported after driver probe */
 int sdw_slave_sysfs_init(struct sdw_slave *slave);
 int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave);
 
diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index f510071b0add..b48b6617a396 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -16,9 +16,13 @@
 
 /*
  * The sysfs for Slave reflects the MIPI description as given
- * in the MIPI DisCo spec
+ * in the MIPI DisCo spec.
+ * status and device_number come directly from the MIPI SoundWire
+ * 1.x specification.
  *
  * Base file is device
+ *	|---- status
+ *	|---- device_number
  *	|---- modalias
  *	|---- dev-properties
  *		|---- mipi_revision
@@ -212,3 +216,55 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
 
 	return 0;
 }
+
+/*
+ * the status is shown in capital letters for UNATTACHED and RESERVED
+ * on purpose, to highligh users to the fact that these status values
+ * are not expected.
+ */
+static const char *const slave_status[] = {
+	[SDW_SLAVE_UNATTACHED] =  "UNATTACHED",
+	[SDW_SLAVE_ATTACHED] = "Attached",
+	[SDW_SLAVE_ALERT] = "Alert",
+	[SDW_SLAVE_RESERVED] = "RESERVED",
+};
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+
+	return sprintf(buf, "%s\n", slave_status[slave->status]);
+}
+static DEVICE_ATTR_RO(status);
+
+static ssize_t device_number_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+
+	if (slave->status == SDW_SLAVE_UNATTACHED)
+		return sprintf(buf, "%s", "N/A");
+	else
+		return sprintf(buf, "%d", slave->dev_num);
+}
+static DEVICE_ATTR_RO(device_number);
+
+static struct attribute *slave_status_attrs[] = {
+	&dev_attr_status.attr,
+	&dev_attr_device_number.attr,
+	NULL,
+};
+
+/*
+ * we don't use ATTRIBUTES_GROUP here since the group is used in a
+ * separate file and can't be handled as a static.
+ */
+static const struct attribute_group sdw_slave_status_attr_group = {
+	.attrs	= slave_status_attrs,
+};
+
+const struct attribute_group *sdw_slave_status_attr_groups[] = {
+	&sdw_slave_status_attr_group,
+	NULL
+};
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B57926CAE9
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 22:18:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B71A1660;
	Wed, 16 Sep 2020 22:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B71A1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600287525;
	bh=RBj3SXI8ETXsqYE8jjL5NnNXmjvV8xiyxXacxAtuqhM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XT0ee8G5FaUDx4gUQqFofKF8WoX4KVZd9Gs4eXZaSo/NCyccKVT148/RTvfsF1kCe
	 torXz/Wy2ulo6MImA+S9eSo2iMtpzQ1vqApdBSi6K5vi7KrNIOvea1i6E9pUiVzxfN
	 aWep/uLvLT10aNmDqqgC4AgTJPH4bhZRdU/iyj0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 261BBF802E0;
	Wed, 16 Sep 2020 22:15:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07DF0F8015A; Wed, 16 Sep 2020 22:15:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67893F8015A
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 22:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67893F8015A
IronPort-SDR: AXYF+TwzAKzGnStqJWm5p7Znhn7q/GozQNYWyF2ez+QC20WsW85vFD9xumYR4vSmGfGPKP/Oxk
 bAg+O7iP6KJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139567012"
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; d="scan'208";a="139567012"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 13:15:19 -0700
IronPort-SDR: /jGtSiJGEM/9JoXulE8e7ZkH2FaslUI9I1p+ExoLDipWMmZP4qO1FH0nRH/a9Spnm0myGelYQI
 CMepZoMTjY+Q==
X-IronPort-AV: E=Sophos;i="5.76,434,1592895600"; d="scan'208";a="451997735"
Received: from yipengwa-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.60.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 13:15:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 2/2] soundwire: sysfs: add slave status and device number
 before probe
Date: Wed, 16 Sep 2020 15:15:04 -0500
Message-Id: <20200916201504.52211-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916201504.52211-1-pierre-louis.bossart@linux.intel.com>
References: <20200916201504.52211-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
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

The attr group added for Slave status and device number is not handled
by devm_ routines to avoid errors such as "Resources present before
probing". Since device_del() explicitly removes attribute groups, only
an init function is provided.

Credits to Vinod Koul for the status_show() function, shared in a
separate patch and used as is here. The status table was modified to
remove an unnecessary enum and status_show() is handled in a different
group attribute than what was suggested by Vinod.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Tested-by: Srinivas Kandgatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-soundwire-slave     | 18 ++++++
 drivers/soundwire/slave.c                     |  2 +
 drivers/soundwire/sysfs_local.h               |  4 ++
 drivers/soundwire/sysfs_slave.c               | 64 ++++++++++++++++++-
 4 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-slave b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
index db4c9511d1aa..425adf7b8aec 100644
--- a/Documentation/ABI/testing/sysfs-bus-soundwire-slave
+++ b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
@@ -1,3 +1,21 @@
+What:		/sys/bus/soundwire/devices/sdw:.../dev-status/status
+		/sys/bus/soundwire/devices/sdw:.../dev-status/device_number
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
index 19b012310c29..ee554a215e44 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -6,6 +6,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
 #include "bus.h"
+#include "sysfs_local.h"
 
 static void sdw_slave_release(struct device *dev)
 {
@@ -83,6 +84,7 @@ int sdw_slave_add(struct sdw_bus *bus,
 		return ret;
 	}
 	sdw_slave_debugfs_init(slave);
+	sdw_slave_status_sysfs_init(slave);
 
 	return ret;
 }
diff --git a/drivers/soundwire/sysfs_local.h b/drivers/soundwire/sysfs_local.h
index ff60adee3c41..52f2eabf5b4b 100644
--- a/drivers/soundwire/sysfs_local.h
+++ b/drivers/soundwire/sysfs_local.h
@@ -8,6 +8,10 @@
  * SDW sysfs APIs -
  */
 
+/* basic routine to report status of Slave (attachment, dev_num) */
+int sdw_slave_status_sysfs_init(struct sdw_slave *slave);
+
+/* additional device-managed properties reported after driver probe */
 int sdw_slave_sysfs_init(struct sdw_slave *slave);
 int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave);
 
diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
index f510071b0add..36eaca343601 100644
--- a/drivers/soundwire/sysfs_slave.c
+++ b/drivers/soundwire/sysfs_slave.c
@@ -16,10 +16,14 @@
 
 /*
  * The sysfs for Slave reflects the MIPI description as given
- * in the MIPI DisCo spec
+ * in the MIPI DisCo spec. dev-status properties come directly
+ * from the MIPI SoundWire specification.
  *
  * Base file is device
  *	|---- modalias
+ *	|---- dev-status
+ *		|---- status
+ *		|---- device_number
  *	|---- dev-properties
  *		|---- mipi_revision
  *		|---- wake_capable
@@ -212,3 +216,61 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
 
 	return 0;
 }
+
+/*
+ * the status is shown in capital letters for UNATTACHED and RESERVED
+ * on purpose, to alert users to the fact that these status values are
+ * not expected.
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
+ * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
+ * for device-status
+ */
+static struct attribute_group sdw_slave_status_attr_group = {
+	.attrs	= slave_status_attrs,
+	.name = "dev-status",
+};
+
+/*
+ * We can't use devm_ here, otherwise resources would be added before
+ * the driver probe. The group is removed in device_del() however.
+ */
+
+int sdw_slave_status_sysfs_init(struct sdw_slave *slave)
+{
+	return device_add_group(&slave->dev, &sdw_slave_status_attr_group);
+}
-- 
2.25.1


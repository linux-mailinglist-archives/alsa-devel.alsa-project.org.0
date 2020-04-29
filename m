Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 588011BF08A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 08:48:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017861690;
	Thu, 30 Apr 2020 08:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017861690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588229322;
	bh=Mv7cM1rn5Q4sADrKgwXvCgsSghKGeJtyJVay+I23NXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDPYqXgmgxYMEJa1A0Yweoq1OU0lMGEf75VREH0JxV/nXLYs1TIQqnnqCArCpdO1V
	 A9+6qMXoNZtdxcLxc/3hEPd2OkzmtglvIteH/2Drl42mn4+Vl7SatePjuMnQj8sbex
	 ifq7k+0vGmsk+giTNArSc72J1OXLWZYsU1dJ6pSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08C48F8029A;
	Thu, 30 Apr 2020 08:46:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24DBFF8029A; Thu, 30 Apr 2020 08:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 470FDF80266
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 08:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 470FDF80266
IronPort-SDR: Tv9q84ROguZiNaAnwwCVgPT1FZHoLIlNE8vQe1FSO02wG0+7HQLW8kk6n5kSQHwJTqyVBabjFi
 XWqRh6UcXJVQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 23:46:41 -0700
IronPort-SDR: R6ISdZ2f9XRQ5xgWSTaEngdpVMRVh9/G2mNkjDkKd8nawJkSJtEX+kWnsuImzb8RvA6WitYCJl
 RPDYhyKb3ZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; d="scan'208";a="249662786"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2020 23:46:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/3] soundwire: bus_type: introduce sdw_slave_type and
 sdw_master_type
Date: Thu, 30 Apr 2020 02:51:44 +0800
Message-Id: <20200429185145.12891-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
References: <20200429185145.12891-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.de,
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

this is a preparatory patch before the introduction of the
sdw_master_type. The SoundWire slave support is slightly modified with
the use of a sdw_slave_type, and the uevent handling move to
slave.c (since it's not necessary for the master).

No functionality change other than moving code around.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus_type.c       | 19 +++++++++++++------
 drivers/soundwire/slave.c          |  8 +++++++-
 include/linux/soundwire/sdw_type.h |  9 ++++++++-
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 17f096dd6806..2c1a19caba51 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -33,13 +33,21 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
 
 static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
 {
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
-	struct sdw_driver *drv = drv_to_sdw_driver(ddrv);
+	struct sdw_slave *slave;
+	struct sdw_driver *drv;
+	int ret = 0;
+
+	if (is_sdw_slave(dev)) {
+		slave = dev_to_sdw_dev(dev);
+		drv = drv_to_sdw_driver(ddrv);
 
-	return !!sdw_get_device_id(slave, drv);
+		ret = !!sdw_get_device_id(slave, drv);
+	}
+	return ret;
 }
 
-int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
+static int sdw_slave_modalias(const struct sdw_slave *slave, char *buf,
+			      size_t size)
 {
 	/* modalias is sdw:m<mfg_id>p<part_id> */
 
@@ -47,7 +55,7 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
 			slave->id.mfg_id, slave->id.part_id);
 }
 
-static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
+int sdw_slave_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	char modalias[32];
@@ -63,7 +71,6 @@ static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
 struct bus_type sdw_bus_type = {
 	.name = "soundwire",
 	.match = sdw_bus_match,
-	.uevent = sdw_uevent,
 };
 EXPORT_SYMBOL_GPL(sdw_bus_type);
 
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index aace57fae7f8..ed068a004bd9 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -14,6 +14,12 @@ static void sdw_slave_release(struct device *dev)
 	kfree(slave);
 }
 
+struct device_type sdw_slave_type = {
+	.name =		"sdw_slave",
+	.release =	sdw_slave_release,
+	.uevent =	sdw_slave_uevent,
+};
+
 static int sdw_slave_add(struct sdw_bus *bus,
 			 struct sdw_slave_id *id, struct fwnode_handle *fwnode)
 {
@@ -41,9 +47,9 @@ static int sdw_slave_add(struct sdw_bus *bus,
 			     id->class_id, id->unique_id);
 	}
 
-	slave->dev.release = sdw_slave_release;
 	slave->dev.bus = &sdw_bus_type;
 	slave->dev.of_node = of_node_get(to_of_node(fwnode));
+	slave->dev.type = &sdw_slave_type;
 	slave->bus = bus;
 	slave->status = SDW_SLAVE_UNATTACHED;
 	init_completion(&slave->enumeration_complete);
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index aaa7f4267c14..52eb66cd11bc 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -5,6 +5,13 @@
 #define __SOUNDWIRE_TYPES_H
 
 extern struct bus_type sdw_bus_type;
+extern struct device_type sdw_slave_type;
+extern struct device_type sdw_master_type;
+
+static inline int is_sdw_slave(const struct device *dev)
+{
+	return dev->type == &sdw_slave_type;
+}
 
 #define drv_to_sdw_driver(_drv) container_of(_drv, struct sdw_driver, driver)
 
@@ -14,7 +21,7 @@ extern struct bus_type sdw_bus_type;
 int __sdw_register_driver(struct sdw_driver *drv, struct module *owner);
 void sdw_unregister_driver(struct sdw_driver *drv);
 
-int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
+int sdw_slave_uevent(struct device *dev, struct kobj_uevent_env *env);
 
 /**
  * module_sdw_driver() - Helper macro for registering a Soundwire driver
-- 
2.17.1


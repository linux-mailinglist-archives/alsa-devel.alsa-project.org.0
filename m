Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B531D8F4A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 07:41:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4184217E0;
	Tue, 19 May 2020 07:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4184217E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589866914;
	bh=Mv7cM1rn5Q4sADrKgwXvCgsSghKGeJtyJVay+I23NXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j11ZmsGw+cFSPGs3guL5tAKy5NdxX/tZXtd+Wu2r1lBmfPYsN9579A00cMaRktNq4
	 FFz9v33s5SsWhZTh0sCRKToXkFzOvBIz2w7xyhNE+zv6d6Qk8p3pzyS133BifGDdgS
	 34plVex0QwPuhyb200GJeALZTrRrltT9H/X2BhI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 570E5F80292;
	Tue, 19 May 2020 07:38:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25825F8028F; Tue, 19 May 2020 07:38:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42DFCF80229
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 07:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42DFCF80229
IronPort-SDR: /8UjL3AdCeGRvWW+ANV9hdVIo/H3Dmjh4Qdq1T54nwnotQ1IHUywOonoI+uQxXVdw1rg+wuaeT
 w8XMpGWfsxkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 22:38:20 -0700
IronPort-SDR: lHa8Znfx1O88e98NTvU1zeVfkYqnk1fJelUbCQldmBTjbWNvDWJWmvQEK+jENbUVm+iJw15fF+
 ab5ZMKvPHxnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; d="scan'208";a="288836546"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga004.fm.intel.com with ESMTP; 18 May 2020 22:38:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/5] soundwire: bus_type: introduce sdw_slave_type and
 sdw_master_type
Date: Tue, 19 May 2020 01:43:19 +0800
Message-Id: <20200518174322.31561-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
References: <20200518174322.31561-1-yung-chuan.liao@linux.intel.com>
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


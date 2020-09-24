Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C5D2779AB
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 21:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31F961818;
	Thu, 24 Sep 2020 21:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31F961818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600976842;
	bh=nI/4FdTq0Vs3YkMcJWeA1J/xNQWGYBR63ZeRCP2IsNo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LEp3bR08bkHCK53dtWuEsxbr5/xRzcOl+oTBJyaQoXI+GxIGuUKRY7/D1bKKAJzKd
	 /yoJwmt+Xuc/lm5PGDt/Y8dyTOR3+oNA7KfUn4hoHjmuYPCdAdou8Tk+d9iJuMJYtN
	 u4QNHvZU2MGssI0DCd+lcmcn9DOygP7UOjmoyvJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 195FDF8015F;
	Thu, 24 Sep 2020 21:45:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CC51F80291; Thu, 24 Sep 2020 21:44:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A640DF8015F
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 21:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A640DF8015F
IronPort-SDR: 1sim96l1v0TX+1ealdFuLtR8aR/m5YBEN0AEFJcluTMzNA9SX4gzs5mEoTDGOnBWMAYQTRlh2G
 fbPDk7b2Zthw==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="141336265"
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; d="scan'208";a="141336265"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 12:44:45 -0700
IronPort-SDR: dQ5QbK22qrbR1dLMFSq4+tDOQk/FnlE/jYJ+UfOToLclKh/LfAPVJ+7pQqwzuENG5RMGYiu7m1
 0KZwJsw40YoA==
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; d="scan'208";a="291360650"
Received: from inwhanki-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.115.252])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 12:44:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH v3 1/2] soundwire: bus: add enumerated Slave device to device
 list
Date: Thu, 24 Sep 2020 14:44:29 -0500
Message-Id: <20200924194430.121058-2-pierre-louis.bossart@linux.intel.com>
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

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Currently Slave devices are only added on startup, either from Device
Tree or ACPI entries. However Slave devices that are physically
present on the bus, but not described in platform firmware, will never
be added to the device list. The user/integrator can only know the
list of devices by looking a dynamic debug logs.

This patch suggests adding a Slave device even if there is no matching
DT or ACPI entry, so that we can see this in sysfs entry.

Initial code from Srinivas. Comments, fixes for ACPI probe and edits
of commit message by Pierre.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c      | 9 +++++++++
 drivers/soundwire/bus.h      | 2 ++
 drivers/soundwire/bus_type.c | 9 +++++++++
 drivers/soundwire/slave.c    | 4 ++--
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index e3fe53f38708..f4c7887c3234 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -747,6 +747,15 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 
 		if (!found) {
 			/* TODO: Park this device in Group 13 */
+
+			/*
+			 * add Slave device even if there is no platform
+			 * firmware description. There will be no driver probe
+			 * but the user/integration will be able to see the
+			 * device, enumeration status and device number in sysfs
+			 */
+			sdw_slave_add(bus, &id, NULL);
+
 			dev_err(bus->dev, "Slave Entry not found\n");
 		}
 
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index e0703991aad9..2e049d39c6e5 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -19,6 +19,8 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
 int sdw_of_find_slaves(struct sdw_bus *bus);
 void sdw_extract_slave_id(struct sdw_bus *bus,
 			  u64 addr, struct sdw_slave_id *id);
+int sdw_slave_add(struct sdw_bus *bus, struct sdw_slave_id *id,
+		  struct fwnode_handle *fwnode);
 int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
 			  struct fwnode_handle *fwnode);
 int sdw_master_device_del(struct sdw_bus *bus);
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 6fba55898cf0..575b9bad99d5 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -84,6 +84,15 @@ static int sdw_drv_probe(struct device *dev)
 	const struct sdw_device_id *id;
 	int ret;
 
+	/*
+	 * fw description is mandatory to bind
+	 */
+	if (!dev->fwnode)
+		return -ENODEV;
+
+	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
+		return -ENODEV;
+
 	id = sdw_get_device_id(slave, drv);
 	if (!id)
 		return -ENODEV;
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 4a250d33de5d..19b012310c29 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -20,8 +20,8 @@ struct device_type sdw_slave_type = {
 	.uevent =	sdw_slave_uevent,
 };
 
-static int sdw_slave_add(struct sdw_bus *bus,
-			 struct sdw_slave_id *id, struct fwnode_handle *fwnode)
+int sdw_slave_add(struct sdw_bus *bus,
+		  struct sdw_slave_id *id, struct fwnode_handle *fwnode)
 {
 	struct sdw_slave *slave;
 	int ret;
-- 
2.25.1


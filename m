Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A95738D0
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7572B16D1;
	Wed, 13 Jul 2022 16:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7572B16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657722471;
	bh=ge8z9tQugUy9cTnjB8duw2RGaf7wv9bBNLATuLcW9CY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAM+p1xTI5kOhTc53MeYGa2Ixpe8vhDPRY5OJzMDj5087q62UY8fRWIg3fz3/dYoI
	 fyrNXzO62T0doYJWa7DWoyS+6qyURWynJq2M8pO7A4wPwU6SVNDGqPh3Ob2h0mn7OW
	 l5Tvd5U1oERlxl/xigqCL6iBF3xaHpZjZ8aiBVCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63003F80134;
	Wed, 13 Jul 2022 16:25:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92136F80134; Wed, 13 Jul 2022 16:25:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99D9EF80134
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99D9EF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eLrXQ2V0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657722349; x=1689258349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ge8z9tQugUy9cTnjB8duw2RGaf7wv9bBNLATuLcW9CY=;
 b=eLrXQ2V04dbTS4j8V1sb5EqEgi6HAmIRoc2NoISAmw4kDsz9BDEn4ntc
 8C6guDtLp/OBgfUMvUsh3yWmx0nJBn6CfVRiyqNUtIwEK53E58yAt4hhK
 R/KXjZl9smhkRM5/jWm4SJtr1tqtRwJ0hrkf8UPcNi6ZKmo8kFSDE8OES
 5SXQwcKP1KfuWxRA8TIDFo31dOj5xhIHg6HZUfVOgg1ODXFeAp5wzhQZo
 w9DpHDRLf4JZWPqxVzECyLCjBb0ijvzIU72hOBqPvFvOAW/mKME7ctHRs
 F+nPMZDDZUKwRQ0SQWES6L5qtgyZ2z0WjPb2DVBHaGVWeCUAHq6EbXfpb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="349195674"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="349195674"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:25:42 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="570643756"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:25:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/3] soundwire: bus: allow device number to be unique at
 system level
Date: Wed, 13 Jul 2022 22:25:28 +0800
Message-Id: <20220713142529.17323-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713142529.17323-1-yung-chuan.liao@linux.intel.com>
References: <20220713142529.17323-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

The SoundWire specification allows the device number to be allocated
at will. When a system includes multiple SoundWire links, the device
number scope is limited to the link to which the device is attached.

However, for integration/debug it can be convenient to have a unique
device number across the system. This patch adds a 'dev_num_ida_min'
field at the bus level, which when set will be used to allocate an
IDA.

The allocation happens when a hardware device reports as ATTACHED. If
any error happens during the enumeration, the allocated IDA is not
freed - the device number will be reused if/when the device re-joins
the bus. The IDA is only freed when the Linux device is unregistered.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 23 +++++++++++++++++------
 include/linux/soundwire/sdw.h |  4 ++++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 37638c20c804..8970f8560766 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -12,6 +12,7 @@
 #include "sysfs_local.h"
 
 static DEFINE_IDA(sdw_bus_ida);
+static DEFINE_IDA(sdw_peripheral_ida);
 
 static int sdw_get_id(struct sdw_bus *bus)
 {
@@ -157,9 +158,11 @@ static int sdw_delete_slave(struct device *dev, void *data)
 
 	mutex_lock(&bus->bus_lock);
 
-	if (slave->dev_num) /* clear dev_num if assigned */
+	if (slave->dev_num) { /* clear dev_num if assigned */
 		clear_bit(slave->dev_num, bus->assigned);
-
+		if (bus->dev_num_ida_min)
+			ida_free(&sdw_peripheral_ida, slave->dev_num);
+	}
 	list_del_init(&slave->node);
 	mutex_unlock(&bus->bus_lock);
 
@@ -639,10 +642,18 @@ static int sdw_get_device_num(struct sdw_slave *slave)
 {
 	int bit;
 
-	bit = find_first_zero_bit(slave->bus->assigned, SDW_MAX_DEVICES);
-	if (bit == SDW_MAX_DEVICES) {
-		bit = -ENODEV;
-		goto err;
+	if (slave->bus->dev_num_ida_min) {
+		bit = ida_alloc_range(&sdw_peripheral_ida,
+				      slave->bus->dev_num_ida_min, SDW_MAX_DEVICES,
+				      GFP_KERNEL);
+		if (bit < 0)
+			goto err;
+	} else {
+		bit = find_first_zero_bit(slave->bus->assigned, SDW_MAX_DEVICES);
+		if (bit == SDW_MAX_DEVICES) {
+			bit = -ENODEV;
+			goto err;
+		}
 	}
 
 	/*
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 39058c841469..a2b31d25ea27 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -889,6 +889,9 @@ struct sdw_master_ops {
  * meaningful if multi_link is set. If set to 1, hardware-based
  * synchronization will be used even if a stream only uses a single
  * SoundWire segment.
+ * @dev_num_ida_min: if set, defines the minimum values for the IDA
+ * used to allocate system-unique device numbers. This value needs to be
+ * identical across all SoundWire bus in the system.
  */
 struct sdw_bus {
 	struct device *dev;
@@ -913,6 +916,7 @@ struct sdw_bus {
 	u32 bank_switch_timeout;
 	bool multi_link;
 	int hw_sync_min_links;
+	int dev_num_ida_min;
 };
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
-- 
2.25.1


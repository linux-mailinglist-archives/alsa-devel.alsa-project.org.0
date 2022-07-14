Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0B95740E2
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 03:13:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185371726;
	Thu, 14 Jul 2022 03:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185371726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657761193;
	bh=Y1J5nWNOz+sncSR+Y9wqNIrStrFxV1lay+BampiPlQo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aymJvaTb+aq4OtK5sXBTb3yncLfRYn36+/2KNTX/BXSuktn2G1osH+huenZCL4kF4
	 61ZW9faz6wUXLZa6kr+2DTI1CYf2lmWPiJ/MzYOTRXBBDMI3Ap81h7cd9G4jTEj/X1
	 Q3QymrjSUQd2hipSbWwBMDRrigaSCZSooqNiMZio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B19FFF80557;
	Thu, 14 Jul 2022 03:11:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 811D7F80549; Thu, 14 Jul 2022 03:11:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B42F5F80134
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 03:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B42F5F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XNcYMl1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657761059; x=1689297059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y1J5nWNOz+sncSR+Y9wqNIrStrFxV1lay+BampiPlQo=;
 b=XNcYMl1mlJ01kQyJosMCQFVgg7QHzTiJ2w7ZR8o/JHwtO5iXQi64MKDQ
 XQbuiygRUrwWPTdVt2tJqVb3YT9/YK79JttBG05hqiywSCtE3A3iZD8lb
 LMCvipWCfoop8Ib+N4Vzg0K22vBNXC6WkuxylSv9OmRmNPMS3bNgdmaW6
 NxL5Hm62j1oEyUfVgiVEEsyZI3sponqUBV3HZ6tse0SyXz9LQCe/hh+CQ
 vQ7ku5TOw2TcPz5Uge3/pyx3J1cvkKHN9SihqLZiqHC7YJpm4edi5b0bX
 Ftm4HtmiKrDvyEqIi7MuvmJ2wa6fOYjseHei/Se6JKKi2UbfjAFvdhA1b Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="347066139"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="347066139"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:57 -0700
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="593192532"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/4] soundwire: add sdw_show_ping_status() helper
Date: Thu, 14 Jul 2022 09:10:42 +0800
Message-Id: <20220714011043.46059-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
References: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

This helper provides an optional delay parameter to wait for devices
to resync in case of errors, and checks that devices are indeed
attached on the bus.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 32 ++++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 2772973eebb1..0a99ac791c7e 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -300,6 +300,38 @@ int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
 	return ret;
 }
 
+/**
+ * sdw_show_ping_status() - Direct report of PING status, to be used by Peripheral drivers
+ * @bus: SDW bus
+ * @sync_delay: Delay before reading status
+ */
+void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay)
+{
+	u32 status;
+
+	if (!bus->ops->read_ping_status)
+		return;
+
+	/*
+	 * wait for peripheral to sync if desired. 10-15ms should be more than
+	 * enough in most cases.
+	 */
+	if (sync_delay)
+		usleep_range(10000, 15000);
+
+	mutex_lock(&bus->msg_lock);
+
+	status = bus->ops->read_ping_status(bus);
+
+	mutex_unlock(&bus->msg_lock);
+
+	if (!status)
+		dev_warn(bus->dev, "%s: no peripherals attached\n", __func__);
+	else
+		dev_dbg(bus->dev, "PING status: %#x\n", status);
+}
+EXPORT_SYMBOL(sdw_show_ping_status);
+
 /**
  * sdw_transfer_defer() - Asynchronously transfer message to a SDW Slave device
  * @bus: SDW bus
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index a85cf829bb77..9e4537f409c2 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -926,6 +926,8 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		       struct fwnode_handle *fwnode);
 void sdw_bus_master_delete(struct sdw_bus *bus);
 
+void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay);
+
 /**
  * sdw_port_config: Master or Slave Port configuration
  *
-- 
2.25.1


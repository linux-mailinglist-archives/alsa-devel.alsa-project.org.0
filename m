Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2003297AA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 10:15:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8223716E7;
	Tue,  2 Mar 2021 10:15:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8223716E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614676555;
	bh=wWnxwneO3yIZVlmeyx1QmOH5nRMQiePPN11bELFtFp0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R33qV5ixFg/JNVpJhfT5JGw8UvG/wK+PWlB6JgQVKbanDpGpdGWkJySnkyXDiWDTX
	 uMktOLNobp4mZWIPPgadaoUzKClQ3mkxTPYl/CBOtcG/esTZnZIwMmcYATrW+u/4x/
	 4ehULI1UD18MOS7uzvQE3Nn8q7Lp92/eUnCrTrgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D1AAF8032B;
	Tue,  2 Mar 2021 10:12:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FD09F802E7; Tue,  2 Mar 2021 10:11:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 457AEF80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 10:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 457AEF80227
IronPort-SDR: SFqJEeEH6BILr1uYSYXk/KLpGKsHQNVztZbPTh4dPsevJE2u13OCWAudi58v3MVTENTYufwite
 G+BxkjXyIV9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248158723"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248158723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:37 -0800
IronPort-SDR: +KVbOkpN/rftgmfvv7seDoH6sGMHnFGG91Rcn9Cb0rNif5Lxf4bKGA+51buI2niABi7bMxCLTb
 moylV+hr6PBA==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="506262271"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 01:11:36 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 03/11] soundwire: bus: use consistent tests for return values
Date: Tue,  2 Mar 2021 17:11:14 +0800
Message-Id: <20210302091122.13952-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
References: <20210302091122.13952-1-yung-chuan.liao@linux.intel.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

We use different styles to check the return values of IO related
routines. The majority of the cases use 'if (ret < 0)', align the
remaining cases for consistency.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 129e2afbe98e..23e4c76d0ac2 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -44,13 +44,13 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	}
 
 	ret = sdw_get_id(bus);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(parent, "Failed to get bus id\n");
 		return ret;
 	}
 
 	ret = sdw_master_device_add(bus, parent, fwnode);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(parent, "Failed to add master device at link %d\n",
 			bus->link_id);
 		return ret;
@@ -121,7 +121,7 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 	else
 		ret = -ENOTSUPP; /* No ACPI/DT so error out */
 
-	if (ret) {
+	if (ret < 0) {
 		dev_err(bus->dev, "Finding slaves failed:%d\n", ret);
 		return ret;
 	}
@@ -422,7 +422,7 @@ sdw_bread_no_pm(struct sdw_bus *bus, u16 dev_num, u32 addr)
 
 	ret = sdw_fill_msg(&msg, NULL, addr, 1, dev_num,
 			   SDW_MSG_FLAG_READ, &buf);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	ret = sdw_transfer(bus, &msg);
@@ -440,7 +440,7 @@ sdw_bwrite_no_pm(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value)
 
 	ret = sdw_fill_msg(&msg, NULL, addr, 1, dev_num,
 			   SDW_MSG_FLAG_WRITE, &value);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	return sdw_transfer(bus, &msg);
@@ -454,7 +454,7 @@ int sdw_bread_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr)
 
 	ret = sdw_fill_msg(&msg, NULL, addr, 1, dev_num,
 			   SDW_MSG_FLAG_READ, &buf);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	ret = sdw_transfer_unlocked(bus, &msg);
@@ -472,7 +472,7 @@ int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 val
 
 	ret = sdw_fill_msg(&msg, NULL, addr, 1, dev_num,
 			   SDW_MSG_FLAG_WRITE, &value);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	return sdw_transfer_unlocked(bus, &msg);
@@ -749,7 +749,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 				 * dev_num
 				 */
 				ret = sdw_assign_device_num(slave);
-				if (ret) {
+				if (ret < 0) {
 					dev_err(bus->dev,
 						"Assign dev_num failed:%d\n",
 						ret);
@@ -886,7 +886,7 @@ static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
 
 	ret = sdw_write_no_pm(slave, SDW_SCP_SYSTEMCTRL, val);
 
-	if (ret != 0)
+	if (ret < 0)
 		dev_err(&slave->dev,
 			"Clock Stop prepare failed for slave: %d", ret);
 
@@ -1709,7 +1709,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 	if (status[0] == SDW_SLAVE_ATTACHED) {
 		dev_dbg(bus->dev, "Slave attached, programming device number\n");
 		ret = sdw_program_device_num(bus);
-		if (ret)
+		if (ret < 0)
 			dev_err(bus->dev, "Slave attach failed: %d\n", ret);
 		/*
 		 * programming a device number will have side effects,
@@ -1743,7 +1743,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 
 		case SDW_SLAVE_ALERT:
 			ret = sdw_handle_slave_alerts(slave);
-			if (ret)
+			if (ret < 0)
 				dev_err(&slave->dev,
 					"Slave %d alert handling failed: %d\n",
 					i, ret);
@@ -1762,7 +1762,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			attached_initializing = true;
 
 			ret = sdw_initialize_slave(slave);
-			if (ret)
+			if (ret < 0)
 				dev_err(&slave->dev,
 					"Slave %d initialization failed: %d\n",
 					i, ret);
@@ -1776,7 +1776,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 		}
 
 		ret = sdw_update_slave_status(slave, status[i]);
-		if (ret)
+		if (ret < 0)
 			dev_err(&slave->dev,
 				"Update Slave status failed:%d\n", ret);
 		if (attached_initializing) {
-- 
2.17.1


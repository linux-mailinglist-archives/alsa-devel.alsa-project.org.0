Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1472CD18C
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 09:43:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87A0A1814;
	Thu,  3 Dec 2020 09:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87A0A1814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606985020;
	bh=tht6Ugn7UIw1f/cu9TEFOYP9Gv31LMNXVglJ5UGHdRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LaNeATywlXmbYmDsdC3fZMWWiMtzsRzpBzYKF68glAPu/8sKp8WmlB7ki5kGhmqSu
	 Yand9g0bHKepVpK0oTmrLj5GfzUyBiHR8AO6J1702cZU6h13LgLQuhvElz9uogRZCy
	 NS/aaugZvlNmrqloqhmGLE9+mp+gMbqltgnc2j5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18C91F804F2;
	Thu,  3 Dec 2020 09:40:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7A7AF804FB; Thu,  3 Dec 2020 09:39:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B6ECF804E0
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 09:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B6ECF804E0
IronPort-SDR: MvB3V3bfu8iuA4n3idKCZpopYF0hm+gBos+YOu6P2rzt4lkBHlKACrkzi8k92bl/4QaMhPXDeV
 eXjt2w28YnMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="237276618"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="237276618"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 00:39:46 -0800
IronPort-SDR: VFUREQocESCJFWv1qROt6/HkdNs9EdbGpIBD/PPhuYjztZkGSk4JZBsg4UsMCvUMFJevNOXHji
 K8zp0bMI7Pjg==
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="481881071"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 00:39:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 7/7] soundwire: bus: clarify dev_err/dbg device references
Date: Thu,  3 Dec 2020 04:46:45 +0800
Message-Id: <20201202204645.23891-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
References: <20201202204645.23891-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
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

The SoundWire bus code confuses bus and Slave device levels for
dev_err/dbg logs. That's not impacting functionality but the accuracy
of kernel logs.

We should only use bus->dev for bus-level operations and handling of
Device0. For all other logs where the device number is not zero, we
should use &slave->dev to provide more precisions to the
user/integrator.

Reported-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 63 +++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index c317f41eba4e..7d07cacef740 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -637,6 +637,7 @@ static int sdw_get_device_num(struct sdw_slave *slave)
 
 static int sdw_assign_device_num(struct sdw_slave *slave)
 {
+	struct sdw_bus *bus = slave->bus;
 	int ret, dev_num;
 	bool new_device = false;
 
@@ -647,7 +648,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 			dev_num = sdw_get_device_num(slave);
 			mutex_unlock(&slave->bus->bus_lock);
 			if (dev_num < 0) {
-				dev_err(slave->bus->dev, "Get dev_num failed: %d\n",
+				dev_err(bus->dev, "Get dev_num failed: %d\n",
 					dev_num);
 				return dev_num;
 			}
@@ -660,7 +661,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 	}
 
 	if (!new_device)
-		dev_dbg(slave->bus->dev,
+		dev_dbg(bus->dev,
 			"Slave already registered, reusing dev_num:%d\n",
 			slave->dev_num);
 
@@ -670,7 +671,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 
 	ret = sdw_write_no_pm(slave, SDW_SCP_DEVNUMBER, dev_num);
 	if (ret < 0) {
-		dev_err(&slave->dev, "Program device_num %d failed: %d\n",
+		dev_err(bus->dev, "Program device_num %d failed: %d\n",
 			dev_num, ret);
 		return ret;
 	}
@@ -749,7 +750,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 				 */
 				ret = sdw_assign_device_num(slave);
 				if (ret) {
-					dev_err(slave->bus->dev,
+					dev_err(bus->dev,
 						"Assign dev_num failed:%d\n",
 						ret);
 					return ret;
@@ -789,9 +790,11 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 static void sdw_modify_slave_status(struct sdw_slave *slave,
 				    enum sdw_slave_status status)
 {
-	mutex_lock(&slave->bus->bus_lock);
+	struct sdw_bus *bus = slave->bus;
 
-	dev_vdbg(&slave->dev,
+	mutex_lock(&bus->bus_lock);
+
+	dev_vdbg(bus->dev,
 		 "%s: changing status slave %d status %d new status %d\n",
 		 __func__, slave->dev_num, slave->status, status);
 
@@ -812,7 +815,7 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 		complete(&slave->enumeration_complete);
 	}
 	slave->status = status;
-	mutex_unlock(&slave->bus->bus_lock);
+	mutex_unlock(&bus->bus_lock);
 }
 
 static enum sdw_clk_stop_mode sdw_get_clk_stop_mode(struct sdw_slave *slave)
@@ -1141,7 +1144,7 @@ int sdw_configure_dpn_intr(struct sdw_slave *slave,
 
 	ret = sdw_update(slave, addr, (mask | SDW_DPN_INT_PORT_READY), val);
 	if (ret < 0)
-		dev_err(slave->bus->dev,
+		dev_err(&slave->dev,
 			"SDW_DPN_INTMASK write failed:%d\n", val);
 
 	return ret;
@@ -1272,7 +1275,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 	/* Enable SCP interrupts */
 	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1, val, val);
 	if (ret < 0) {
-		dev_err(slave->bus->dev,
+		dev_err(&slave->dev,
 			"SDW_SCP_INTMASK1 write failed:%d\n", ret);
 		return ret;
 	}
@@ -1287,7 +1290,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 
 	ret = sdw_update_no_pm(slave, SDW_DP0_INTMASK, val, val);
 	if (ret < 0)
-		dev_err(slave->bus->dev,
+		dev_err(&slave->dev,
 			"SDW_DP0_INTMASK read failed:%d\n", ret);
 	return ret;
 }
@@ -1299,7 +1302,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 
 	status = sdw_read_no_pm(slave, SDW_DP0_INT);
 	if (status < 0) {
-		dev_err(slave->bus->dev,
+		dev_err(&slave->dev,
 			"SDW_DP0_INT read failed:%d\n", status);
 		return status;
 	}
@@ -1338,7 +1341,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 		/* clear the interrupts but don't touch reserved and SDCA_CASCADE fields */
 		ret = sdw_write_no_pm(slave, SDW_DP0_INT, clear);
 		if (ret < 0) {
-			dev_err(slave->bus->dev,
+			dev_err(&slave->dev,
 				"SDW_DP0_INT write failed:%d\n", ret);
 			return ret;
 		}
@@ -1346,7 +1349,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 		/* Read DP0 interrupt again */
 		status2 = sdw_read_no_pm(slave, SDW_DP0_INT);
 		if (status2 < 0) {
-			dev_err(slave->bus->dev,
+			dev_err(&slave->dev,
 				"SDW_DP0_INT read failed:%d\n", status2);
 			return status2;
 		}
@@ -1359,7 +1362,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 	} while ((status & SDW_DP0_INTERRUPTS) && (count < SDW_READ_INTR_CLEAR_RETRY));
 
 	if (count == SDW_READ_INTR_CLEAR_RETRY)
-		dev_warn(slave->bus->dev, "Reached MAX_RETRY on DP0 read\n");
+		dev_warn(&slave->dev, "Reached MAX_RETRY on DP0 read\n");
 
 	return ret;
 }
@@ -1377,7 +1380,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 	addr = SDW_DPN_INT(port);
 	status = sdw_read_no_pm(slave, addr);
 	if (status < 0) {
-		dev_err(slave->bus->dev,
+		dev_err(&slave->dev,
 			"SDW_DPN_INT read failed:%d\n", status);
 
 		return status;
@@ -1411,7 +1414,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		/* clear the interrupt but don't touch reserved fields */
 		ret = sdw_write_no_pm(slave, addr, clear);
 		if (ret < 0) {
-			dev_err(slave->bus->dev,
+			dev_err(&slave->dev,
 				"SDW_DPN_INT write failed:%d\n", ret);
 			return ret;
 		}
@@ -1419,7 +1422,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		/* Read DPN interrupt again */
 		status2 = sdw_read_no_pm(slave, addr);
 		if (status2 < 0) {
-			dev_err(slave->bus->dev,
+			dev_err(&slave->dev,
 				"SDW_DPN_INT read failed:%d\n", status2);
 			return status2;
 		}
@@ -1432,7 +1435,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 	} while ((status & SDW_DPN_INTERRUPTS) && (count < SDW_READ_INTR_CLEAR_RETRY));
 
 	if (count == SDW_READ_INTR_CLEAR_RETRY)
-		dev_warn(slave->bus->dev, "Reached MAX_RETRY on port read");
+		dev_warn(&slave->dev, "Reached MAX_RETRY on port read");
 
 	return ret;
 }
@@ -1461,7 +1464,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	/* Read Intstat 1, Intstat 2 and Intstat 3 registers */
 	ret = sdw_read_no_pm(slave, SDW_SCP_INT1);
 	if (ret < 0) {
-		dev_err(slave->bus->dev,
+		dev_err(&slave->dev,
 			"SDW_SCP_INT1 read failed:%d\n", ret);
 		goto io_err;
 	}
@@ -1469,7 +1472,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 
 	ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, buf2);
 	if (ret < 0) {
-		dev_err(slave->bus->dev,
+		dev_err(&slave->dev,
 			"SDW_SCP_INT2/3 read failed:%d\n", ret);
 		goto io_err;
 	}
@@ -1477,7 +1480,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	if (slave->prop.is_sdca) {
 		ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 		if (ret < 0) {
-			dev_err(slave->bus->dev,
+			dev_err(&slave->dev,
 				"SDW_DP0_INT read failed:%d\n", ret);
 			goto io_err;
 		}
@@ -1574,7 +1577,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		/* Ack interrupt */
 		ret = sdw_write_no_pm(slave, SDW_SCP_INT1, clear);
 		if (ret < 0) {
-			dev_err(slave->bus->dev,
+			dev_err(&slave->dev,
 				"SDW_SCP_INT1 write failed:%d\n", ret);
 			goto io_err;
 		}
@@ -1588,7 +1591,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		 */
 		ret = sdw_read_no_pm(slave, SDW_SCP_INT1);
 		if (ret < 0) {
-			dev_err(slave->bus->dev,
+			dev_err(&slave->dev,
 				"SDW_SCP_INT1 read failed:%d\n", ret);
 			goto io_err;
 		}
@@ -1596,7 +1599,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 
 		ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, _buf2);
 		if (ret < 0) {
-			dev_err(slave->bus->dev,
+			dev_err(&slave->dev,
 				"SDW_SCP_INT2/3 read failed:%d\n", ret);
 			goto io_err;
 		}
@@ -1604,7 +1607,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		if (slave->prop.is_sdca) {
 			ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 			if (ret < 0) {
-				dev_err(slave->bus->dev,
+				dev_err(&slave->dev,
 					"SDW_DP0_INT read failed:%d\n", ret);
 				goto io_err;
 			}
@@ -1630,7 +1633,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	} while (stat != 0 && count < SDW_READ_INTR_CLEAR_RETRY);
 
 	if (count == SDW_READ_INTR_CLEAR_RETRY)
-		dev_warn(slave->bus->dev, "Reached MAX_RETRY on alert read\n");
+		dev_warn(&slave->dev, "Reached MAX_RETRY on alert read\n");
 
 io_err:
 	pm_runtime_mark_last_busy(&slave->dev);
@@ -1736,7 +1739,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 		case SDW_SLAVE_ALERT:
 			ret = sdw_handle_slave_alerts(slave);
 			if (ret)
-				dev_err(bus->dev,
+				dev_err(&slave->dev,
 					"Slave %d alert handling failed: %d\n",
 					i, ret);
 			break;
@@ -1755,21 +1758,21 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 
 			ret = sdw_initialize_slave(slave);
 			if (ret)
-				dev_err(bus->dev,
+				dev_err(&slave->dev,
 					"Slave %d initialization failed: %d\n",
 					i, ret);
 
 			break;
 
 		default:
-			dev_err(bus->dev, "Invalid slave %d status:%d\n",
+			dev_err(&slave->dev, "Invalid slave %d status:%d\n",
 				i, status[i]);
 			break;
 		}
 
 		ret = sdw_update_slave_status(slave, status[i]);
 		if (ret)
-			dev_err(slave->bus->dev,
+			dev_err(&slave->dev,
 				"Update Slave status failed:%d\n", ret);
 		if (attached_initializing)
 			complete(&slave->initialization_complete);
-- 
2.17.1


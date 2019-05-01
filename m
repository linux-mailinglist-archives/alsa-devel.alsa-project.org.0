Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A266910AD8
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A1F41731;
	Wed,  1 May 2019 18:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A1F41731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556727293;
	bh=0UouINdxvZrfZjcoNuvL+o+wv2YQVUbZse5uusDKT7A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AIeUDtlEs8kvsEoasDsS8WBQ3RG2k6yE8T0VEtxpJVz0dEukLWW+6QzVCAEwh/DwX
	 hzRBYclabzzP9CaeFEca6+FiBDaU9qMvb4sgq7/+/YMb+S1V6xpZNlBqe6vcIPFwxH
	 XZ1bCy5niwQkPeO9sznVJr8va3LSikPuIsxn1j5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 947A6F89797;
	Wed,  1 May 2019 17:59:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 370FFF89738; Wed,  1 May 2019 17:58:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5333BF8974D
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5333BF8974D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115774"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:45 -0500
Message-Id: <20190501155745.21806-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v4 22/22] soundwire: add missing newlines in
	dynamic debug logs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For some reason the newlines are not used everywhere. Fix as needed.

Reported-by: Joe Perches <joe@perches.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c            |  74 +++++++++----------
 drivers/soundwire/cadence_master.c |  12 ++--
 drivers/soundwire/intel.c          |  12 ++--
 drivers/soundwire/stream.c         | 110 ++++++++++++++---------------
 4 files changed, 104 insertions(+), 104 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index bb697fd68580..fa86957cb615 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -21,12 +21,12 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 	int ret;
 
 	if (!bus->dev) {
-		pr_err("SoundWire bus has no device");
+		pr_err("SoundWire bus has no device\n");
 		return -ENODEV;
 	}
 
 	if (!bus->ops) {
-		dev_err(bus->dev, "SoundWire Bus ops are not set");
+		dev_err(bus->dev, "SoundWire Bus ops are not set\n");
 		return -EINVAL;
 	}
 
@@ -43,7 +43,7 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 	if (bus->ops->read_prop) {
 		ret = bus->ops->read_prop(bus);
 		if (ret < 0) {
-			dev_err(bus->dev, "Bus read properties failed:%d", ret);
+			dev_err(bus->dev, "Bus read properties failed:%d\n", ret);
 			return ret;
 		}
 	}
@@ -296,7 +296,7 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
 		return -EINVAL;
 	} else if (!slave->prop.paging_support) {
 		dev_err(&slave->dev,
-			"address %x needs paging but no support", addr);
+			"address %x needs paging but no support\n", addr);
 		return -EINVAL;
 	}
 
@@ -455,13 +455,13 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 		dev_num = sdw_get_device_num(slave);
 		mutex_unlock(&slave->bus->bus_lock);
 		if (dev_num < 0) {
-			dev_err(slave->bus->dev, "Get dev_num failed: %d",
+			dev_err(slave->bus->dev, "Get dev_num failed: %d\n",
 				dev_num);
 			return dev_num;
 		}
 	} else {
 		dev_info(slave->bus->dev,
-			 "Slave already registered dev_num:%d",
+			 "Slave already registered dev_num:%d\n",
 			 slave->dev_num);
 
 		/* Clear the slave->dev_num to transfer message on device 0 */
@@ -472,7 +472,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 
 	ret = sdw_write(slave, SDW_SCP_DEVNUMBER, dev_num);
 	if (ret < 0) {
-		dev_err(&slave->dev, "Program device_num failed: %d", ret);
+		dev_err(&slave->dev, "Program device_num failed: %d\n", ret);
 		return ret;
 	}
 
@@ -485,7 +485,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 void sdw_extract_slave_id(struct sdw_bus *bus,
 			  u64 addr, struct sdw_slave_id *id)
 {
-	dev_dbg(bus->dev, "SDW Slave Addr: %llx", addr);
+	dev_dbg(bus->dev, "SDW Slave Addr: %llx\n", addr);
 
 	/*
 	 * Spec definition
@@ -505,7 +505,7 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
 	id->class_id = addr & GENMASK(7, 0);
 
 	dev_dbg(bus->dev,
-		"SDW Slave class_id %x, part_id %x, mfg_id %x, unique_id %x, version %x",
+		"SDW Slave class_id %x, part_id %x, mfg_id %x, unique_id %x, version %x\n",
 				id->class_id, id->part_id, id->mfg_id,
 				id->unique_id, id->sdw_version);
 
@@ -562,7 +562,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 				ret = sdw_assign_device_num(slave);
 				if (ret) {
 					dev_err(slave->bus->dev,
-						"Assign dev_num failed:%d",
+						"Assign dev_num failed:%d\n",
 						ret);
 					return ret;
 				}
@@ -573,7 +573,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 
 		if (!found) {
 			/* TODO: Park this device in Group 13 */
-			dev_err(bus->dev, "Slave Entry not found");
+			dev_err(bus->dev, "Slave Entry not found\n");
 		}
 
 		count++;
@@ -618,7 +618,7 @@ int sdw_configure_dpn_intr(struct sdw_slave *slave,
 	ret = sdw_update(slave, addr, (mask | SDW_DPN_INT_PORT_READY), val);
 	if (ret < 0)
 		dev_err(slave->bus->dev,
-			"SDW_DPN_INTMASK write failed:%d", val);
+			"SDW_DPN_INTMASK write failed:%d\n", val);
 
 	return ret;
 }
@@ -642,7 +642,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 	ret = sdw_update(slave, SDW_SCP_INTMASK1, val, val);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
-			"SDW_SCP_INTMASK1 write failed:%d", ret);
+			"SDW_SCP_INTMASK1 write failed:%d\n", ret);
 		return ret;
 	}
 
@@ -657,7 +657,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 	ret = sdw_update(slave, SDW_DP0_INTMASK, val, val);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
-			"SDW_DP0_INTMASK read failed:%d", ret);
+			"SDW_DP0_INTMASK read failed:%d\n", ret);
 		return val;
 	}
 
@@ -672,14 +672,14 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 	status = sdw_read(slave, SDW_DP0_INT);
 	if (status < 0) {
 		dev_err(slave->bus->dev,
-			"SDW_DP0_INT read failed:%d", status);
+			"SDW_DP0_INT read failed:%d\n", status);
 		return status;
 	}
 
 	do {
 
 		if (status & SDW_DP0_INT_TEST_FAIL) {
-			dev_err(&slave->dev, "Test fail for port 0");
+			dev_err(&slave->dev, "Test fail for port 0\n");
 			clear |= SDW_DP0_INT_TEST_FAIL;
 		}
 
@@ -694,7 +694,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 		}
 
 		if (status & SDW_DP0_INT_BRA_FAILURE) {
-			dev_err(&slave->dev, "BRA failed");
+			dev_err(&slave->dev, "BRA failed\n");
 			clear |= SDW_DP0_INT_BRA_FAILURE;
 		}
 
@@ -710,7 +710,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 		ret = sdw_write(slave, SDW_DP0_INT, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
-				"SDW_DP0_INT write failed:%d", ret);
+				"SDW_DP0_INT write failed:%d\n", ret);
 			return ret;
 		}
 
@@ -718,7 +718,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 		status2 = sdw_read(slave, SDW_DP0_INT);
 		if (status2 < 0) {
 			dev_err(slave->bus->dev,
-				"SDW_DP0_INT read failed:%d", status2);
+				"SDW_DP0_INT read failed:%d\n", status2);
 			return status2;
 		}
 		status &= status2;
@@ -729,7 +729,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 	} while (status != 0 && count < SDW_READ_INTR_CLEAR_RETRY);
 
 	if (count == SDW_READ_INTR_CLEAR_RETRY)
-		dev_warn(slave->bus->dev, "Reached MAX_RETRY on DP0 read");
+		dev_warn(slave->bus->dev, "Reached MAX_RETRY on DP0 read\n");
 
 	return ret;
 }
@@ -748,7 +748,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 	status = sdw_read(slave, addr);
 	if (status < 0) {
 		dev_err(slave->bus->dev,
-			"SDW_DPN_INT read failed:%d", status);
+			"SDW_DPN_INT read failed:%d\n", status);
 
 		return status;
 	}
@@ -756,7 +756,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 	do {
 
 		if (status & SDW_DPN_INT_TEST_FAIL) {
-			dev_err(&slave->dev, "Test fail for port:%d", port);
+			dev_err(&slave->dev, "Test fail for port:%d\n", port);
 			clear |= SDW_DPN_INT_TEST_FAIL;
 		}
 
@@ -781,7 +781,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		ret = sdw_write(slave, addr, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
-				"SDW_DPN_INT write failed:%d", ret);
+				"SDW_DPN_INT write failed:%d\n", ret);
 			return ret;
 		}
 
@@ -789,7 +789,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		status2 = sdw_read(slave, addr);
 		if (status2 < 0) {
 			dev_err(slave->bus->dev,
-				"SDW_DPN_INT read failed:%d", status2);
+				"SDW_DPN_INT read failed:%d\n", status2);
 			return status2;
 		}
 		status &= status2;
@@ -820,14 +820,14 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	buf = ret = sdw_read(slave, SDW_SCP_INT1);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
-			"SDW_SCP_INT1 read failed:%d", ret);
+			"SDW_SCP_INT1 read failed:%d\n", ret);
 		return ret;
 	}
 
 	ret = sdw_nread(slave, SDW_SCP_INTSTAT2, 2, buf2);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
-			"SDW_SCP_INT2/3 read failed:%d", ret);
+			"SDW_SCP_INT2/3 read failed:%d\n", ret);
 		return ret;
 	}
 
@@ -837,12 +837,12 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		 * interrupt
 		 */
 		if (buf & SDW_SCP_INT1_PARITY) {
-			dev_err(&slave->dev, "Parity error detected");
+			dev_err(&slave->dev, "Parity error detected\n");
 			clear |= SDW_SCP_INT1_PARITY;
 		}
 
 		if (buf & SDW_SCP_INT1_BUS_CLASH) {
-			dev_err(&slave->dev, "Bus clash error detected");
+			dev_err(&slave->dev, "Bus clash error detected\n");
 			clear |= SDW_SCP_INT1_BUS_CLASH;
 		}
 
@@ -908,7 +908,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		ret = sdw_write(slave, SDW_SCP_INT1, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
-				"SDW_SCP_INT1 write failed:%d", ret);
+				"SDW_SCP_INT1 write failed:%d\n", ret);
 			return ret;
 		}
 
@@ -919,14 +919,14 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		_buf = ret = sdw_read(slave, SDW_SCP_INT1);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
-				"SDW_SCP_INT1 read failed:%d", ret);
+				"SDW_SCP_INT1 read failed:%d\n", ret);
 			return ret;
 		}
 
 		ret = sdw_nread(slave, SDW_SCP_INTSTAT2, 2, _buf2);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
-				"SDW_SCP_INT2/3 read failed:%d", ret);
+				"SDW_SCP_INT2/3 read failed:%d\n", ret);
 			return ret;
 		}
 
@@ -946,7 +946,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	} while (stat != 0 && count < SDW_READ_INTR_CLEAR_RETRY);
 
 	if (count == SDW_READ_INTR_CLEAR_RETRY)
-		dev_warn(slave->bus->dev, "Reached MAX_RETRY on alert read");
+		dev_warn(slave->bus->dev, "Reached MAX_RETRY on alert read\n");
 
 	return ret;
 }
@@ -975,7 +975,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 	if (status[0] == SDW_SLAVE_ATTACHED) {
 		ret = sdw_program_device_num(bus);
 		if (ret)
-			dev_err(bus->dev, "Slave attach failed: %d", ret);
+			dev_err(bus->dev, "Slave attach failed: %d\n", ret);
 	}
 
 	/* Continue to check other slave statuses */
@@ -1003,7 +1003,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			ret = sdw_handle_slave_alerts(slave);
 			if (ret)
 				dev_err(bus->dev,
-					"Slave %d alert handling failed: %d",
+					"Slave %d alert handling failed: %d\n",
 					i, ret);
 			break;
 
@@ -1020,13 +1020,13 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			ret = sdw_initialize_slave(slave);
 			if (ret)
 				dev_err(bus->dev,
-					"Slave %d initialization failed: %d",
+					"Slave %d initialization failed: %d\n",
 					i, ret);
 
 			break;
 
 		default:
-			dev_err(bus->dev, "Invalid slave %d status:%d",
+			dev_err(bus->dev, "Invalid slave %d status:%d\n",
 				i, status[i]);
 			break;
 		}
@@ -1034,7 +1034,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 		ret = sdw_update_slave_status(slave, status[i]);
 		if (ret)
 			dev_err(slave->bus->dev,
-				"Update Slave status failed:%d", ret);
+				"Update Slave status failed:%d\n", ret);
 
 	}
 
diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 5786a2e0be84..0fdc17b995fc 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -346,10 +346,10 @@ cdns_program_scp_addr(struct sdw_cdns *cdns, struct sdw_msg *msg)
 	for (i = 0; i < 2; i++) {
 		if (!(cdns->response_buf[i] & CDNS_MCP_RESP_ACK)) {
 			no_ack = 1;
-			dev_err(cdns->dev, "Program SCP Ack not received");
+			dev_err(cdns->dev, "Program SCP Ack not received\n");
 			if (cdns->response_buf[i] & CDNS_MCP_RESP_NACK) {
 				nack = 1;
-				dev_err(cdns->dev, "Program SCP NACK received");
+				dev_err(cdns->dev, "Program SCP NACK received\n");
 			}
 		}
 	}
@@ -357,11 +357,11 @@ cdns_program_scp_addr(struct sdw_cdns *cdns, struct sdw_msg *msg)
 	/* For NACK, NO ack, don't return err if we are in Broadcast mode */
 	if (nack) {
 		dev_err(cdns->dev,
-			"SCP_addrpage NACKed for Slave %d", msg->dev_num);
+			"SCP_addrpage NACKed for Slave %d\n", msg->dev_num);
 		return SDW_CMD_FAIL;
 	} else if (no_ack) {
 		dev_dbg(cdns->dev,
-			"SCP_addrpage ignored for Slave %d", msg->dev_num);
+			"SCP_addrpage ignored for Slave %d\n", msg->dev_num);
 		return SDW_CMD_IGNORED;
 	}
 
@@ -665,7 +665,7 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
 	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE,
 			     CDNS_MCP_CONFIG_UPDATE_BIT);
 	if (ret < 0)
-		dev_err(cdns->dev, "Config update timedout");
+		dev_err(cdns->dev, "Config update timedout\n");
 
 	return ret;
 }
@@ -853,7 +853,7 @@ int cdns_bus_conf(struct sdw_bus *bus, struct sdw_bus_params *params)
 	int divider;
 
 	if (!params->curr_dr_freq) {
-		dev_err(cdns->dev, "NULL curr_dr_freq");
+		dev_err(cdns->dev, "NULL curr_dr_freq\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 2852ce293fd4..9774dc1e4029 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -238,7 +238,7 @@ static int intel_shim_init(struct sdw_intel *sdw)
 	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
 			      SDW_SHIM_SYNC_SYNCCPU);
 	if (ret < 0)
-		dev_err(sdw->cdns.dev, "Failed to set sync period: %d", ret);
+		dev_err(sdw->cdns.dev, "Failed to set sync period: %d\n", ret);
 
 	return ret;
 }
@@ -456,7 +456,7 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
 	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
 			      SDW_SHIM_SYNC_SYNCGO);
 	if (ret < 0)
-		dev_err(sdw->cdns.dev, "Post bank switch failed: %d", ret);
+		dev_err(sdw->cdns.dev, "Post bank switch failed: %d\n", ret);
 
 	return ret;
 }
@@ -556,7 +556,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (!dma->nr_ports) {
-		dev_err(dai->dev, "ports/resources not available");
+		dev_err(dai->dev, "ports/resources not available\n");
 		return -EINVAL;
 	}
 
@@ -607,7 +607,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	ret = sdw_stream_add_master(&cdns->bus, &sconfig,
 				    pconfig, dma->nr_ports, dma->stream);
 	if (ret) {
-		dev_err(cdns->dev, "add master to stream failed:%d", ret);
+		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
 		goto stream_error;
 	}
 
@@ -635,7 +635,7 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 
 	ret = sdw_stream_remove_master(&cdns->bus, dma->stream);
 	if (ret < 0)
-		dev_err(dai->dev, "remove master from stream %s failed: %d",
+		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
 			dma->stream->name, ret);
 
 	intel_port_cleanup(dma);
@@ -884,7 +884,7 @@ static int intel_probe(struct platform_device *pdev)
 	/* Register DAIs */
 	ret = intel_register_dai(sdw);
 	if (ret) {
-		dev_err(sdw->cdns.dev, "DAI registration failed: %d", ret);
+		dev_err(sdw->cdns.dev, "DAI registration failed: %d\n", ret);
 		snd_soc_unregister_component(sdw->cdns.dev);
 		goto err_dai;
 	}
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index ab64c2c4c33f..166b0c16003f 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -76,14 +76,14 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 	/* Program DPN_OffsetCtrl2 registers */
 	ret = sdw_write(slave, addr1, t_params->offset2);
 	if (ret < 0) {
-		dev_err(bus->dev, "DPN_OffsetCtrl2 register write failed");
+		dev_err(bus->dev, "DPN_OffsetCtrl2 register write failed\n");
 		return ret;
 	}
 
 	/* Program DPN_BlockCtrl3 register */
 	ret = sdw_write(slave, addr2, t_params->blk_pkg_mode);
 	if (ret < 0) {
-		dev_err(bus->dev, "DPN_BlockCtrl3 register write failed");
+		dev_err(bus->dev, "DPN_BlockCtrl3 register write failed\n");
 		return ret;
 	}
 
@@ -102,7 +102,7 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 
 	ret = sdw_write(slave, addr3, wbuf);
 	if (ret < 0) {
-		dev_err(bus->dev, "DPN_SampleCtrl2 register write failed");
+		dev_err(bus->dev, "DPN_SampleCtrl2 register write failed\n");
 		return ret;
 	}
 
@@ -113,7 +113,7 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 
 	ret = sdw_write(slave, addr4, wbuf);
 	if (ret < 0)
-		dev_err(bus->dev, "DPN_HCtrl register write failed");
+		dev_err(bus->dev, "DPN_HCtrl register write failed\n");
 
 	return ret;
 }
@@ -159,7 +159,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 	ret = sdw_update(s_rt->slave, addr1, 0xF, wbuf);
 	if (ret < 0) {
 		dev_err(&s_rt->slave->dev,
-			"DPN_PortCtrl register write failed for port %d",
+			"DPN_PortCtrl register write failed for port %d\n",
 			t_params->port_num);
 		return ret;
 	}
@@ -168,7 +168,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 	ret = sdw_write(s_rt->slave, addr2, (p_params->bps - 1));
 	if (ret < 0) {
 		dev_err(&s_rt->slave->dev,
-			"DPN_BlockCtrl1 register write failed for port %d",
+			"DPN_BlockCtrl1 register write failed for port %d\n",
 			t_params->port_num);
 		return ret;
 	}
@@ -178,7 +178,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 	ret = sdw_write(s_rt->slave, addr3, wbuf);
 	if (ret < 0) {
 		dev_err(&s_rt->slave->dev,
-			"DPN_SampleCtrl1 register write failed for port %d",
+			"DPN_SampleCtrl1 register write failed for port %d\n",
 			t_params->port_num);
 		return ret;
 	}
@@ -187,7 +187,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 	ret = sdw_write(s_rt->slave, addr4, t_params->offset1);
 	if (ret < 0) {
 		dev_err(&s_rt->slave->dev,
-			"DPN_OffsetCtrl1 register write failed for port %d",
+			"DPN_OffsetCtrl1 register write failed for port %d\n",
 			t_params->port_num);
 		return ret;
 	}
@@ -197,7 +197,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 		ret = sdw_write(s_rt->slave, addr5, t_params->blk_grp_ctrl);
 		if (ret < 0) {
 			dev_err(&s_rt->slave->dev,
-				"DPN_BlockCtrl2 reg write failed for port %d",
+				"DPN_BlockCtrl2 reg write failed for port %d\n",
 				t_params->port_num);
 			return ret;
 		}
@@ -208,7 +208,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 		ret = sdw_write(s_rt->slave, addr6, t_params->lane_ctrl);
 		if (ret < 0) {
 			dev_err(&s_rt->slave->dev,
-				"DPN_LaneCtrl register write failed for port %d",
+				"DPN_LaneCtrl register write failed for port %d\n",
 				t_params->port_num);
 			return ret;
 		}
@@ -219,7 +219,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 						     t_params, dpn_prop->type);
 		if (ret < 0)
 			dev_err(&s_rt->slave->dev,
-				"Transport reg write failed for port: %d",
+				"Transport reg write failed for port: %d\n",
 				t_params->port_num);
 	}
 
@@ -316,7 +316,7 @@ static int sdw_enable_disable_slave_ports(struct sdw_bus *bus,
 
 	if (ret < 0)
 		dev_err(&s_rt->slave->dev,
-			"Slave chn_en reg write failed:%d port:%d",
+			"Slave chn_en reg write failed:%d port:%d\n",
 			ret, t_params->port_num);
 
 	return ret;
@@ -342,7 +342,7 @@ static int sdw_enable_disable_master_ports(struct sdw_master_runtime *m_rt,
 							bus->params.next_bank);
 		if (ret < 0) {
 			dev_err(bus->dev,
-				"Master chn_en write failed:%d port:%d",
+				"Master chn_en write failed:%d port:%d\n",
 				ret, t_params->port_num);
 			return ret;
 		}
@@ -400,7 +400,7 @@ static int sdw_do_port_prep(struct sdw_slave_runtime *s_rt,
 		ret = ops->port_prep(s_rt->slave, &prep_ch, cmd);
 		if (ret < 0) {
 			dev_err(&s_rt->slave->dev,
-				"Slave Port Prep cmd %d failed: %d", cmd, ret);
+				"Slave Port Prep cmd %d failed: %d\n", cmd, ret);
 			return ret;
 		}
 	}
@@ -429,7 +429,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 					  prep_ch.num);
 	if (!dpn_prop) {
 		dev_err(bus->dev,
-			"Slave Port:%d properties not found", prep_ch.num);
+			"Slave Port:%d properties not found\n", prep_ch.num);
 		return -EINVAL;
 	}
 
@@ -467,7 +467,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 
 		if (ret < 0) {
 			dev_err(&s_rt->slave->dev,
-				"Slave prep_ctrl reg write failed");
+				"Slave prep_ctrl reg write failed\n");
 			return ret;
 		}
 
@@ -480,7 +480,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 		val &= p_rt->ch_mask;
 		if (!time_left || val) {
 			dev_err(&s_rt->slave->dev,
-				"Chn prep failed for port:%d", prep_ch.num);
+				"Chn prep failed for port:%d\n", prep_ch.num);
 			return -ETIMEDOUT;
 		}
 	}
@@ -515,7 +515,7 @@ static int sdw_prep_deprep_master_ports(struct sdw_master_runtime *m_rt,
 	if (ops->dpn_port_prep) {
 		ret = ops->dpn_port_prep(bus, &prep_ch);
 		if (ret < 0) {
-			dev_err(bus->dev, "Port prepare failed for port:%d",
+			dev_err(bus->dev, "Port prepare failed for port:%d\n",
 				t_params->port_num);
 			return ret;
 		}
@@ -584,7 +584,7 @@ static int sdw_notify_config(struct sdw_master_runtime *m_rt)
 		if (slave->ops->bus_config) {
 			ret = slave->ops->bus_config(slave, &bus->params);
 			if (ret < 0)
-				dev_err(bus->dev, "Notify Slave: %d failed",
+				dev_err(bus->dev, "Notify Slave: %d failed\n",
 					slave->dev_num);
 			return ret;
 		}
@@ -608,13 +608,13 @@ static int sdw_program_params(struct sdw_bus *bus)
 		ret = sdw_program_port_params(m_rt);
 		if (ret < 0) {
 			dev_err(bus->dev,
-				"Program transport params failed: %d", ret);
+				"Program transport params failed: %d\n", ret);
 			return ret;
 		}
 
 		ret = sdw_notify_config(m_rt);
 		if (ret < 0) {
-			dev_err(bus->dev, "Notify bus config failed: %d", ret);
+			dev_err(bus->dev, "Notify bus config failed: %d\n", ret);
 			return ret;
 		}
 
@@ -624,7 +624,7 @@ static int sdw_program_params(struct sdw_bus *bus)
 
 		ret = sdw_enable_disable_ports(m_rt, true);
 		if (ret < 0) {
-			dev_err(bus->dev, "Enable channel failed: %d", ret);
+			dev_err(bus->dev, "Enable channel failed: %d\n", ret);
 			return ret;
 		}
 	}
@@ -679,7 +679,7 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
 		ret = sdw_transfer(bus, wr_msg);
 
 	if (ret < 0) {
-		dev_err(bus->dev, "Slave frame_ctrl reg write failed");
+		dev_err(bus->dev, "Slave frame_ctrl reg write failed\n");
 		goto error;
 	}
 
@@ -719,7 +719,7 @@ static int sdw_ml_sync_bank_switch(struct sdw_bus *bus)
 						bus->bank_switch_timeout);
 
 	if (!time_left) {
-		dev_err(bus->dev, "Controller Timed out on bank switch");
+		dev_err(bus->dev, "Controller Timed out on bank switch\n");
 		return -ETIMEDOUT;
 	}
 
@@ -756,7 +756,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 			ret = ops->pre_bank_switch(bus);
 			if (ret < 0) {
 				dev_err(bus->dev,
-					"Pre bank switch op failed: %d", ret);
+					"Pre bank switch op failed: %d\n", ret);
 				goto msg_unlock;
 			}
 		}
@@ -769,7 +769,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 		 */
 		ret = sdw_bank_switch(bus, stream->m_rt_count);
 		if (ret < 0) {
-			dev_err(bus->dev, "Bank switch failed: %d", ret);
+			dev_err(bus->dev, "Bank switch failed: %d\n", ret);
 			goto error;
 
 		}
@@ -790,12 +790,12 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 			ret = ops->post_bank_switch(bus);
 			if (ret < 0) {
 				dev_err(bus->dev,
-					"Post bank switch op failed: %d", ret);
+					"Post bank switch op failed: %d\n", ret);
 				goto error;
 			}
 		} else if (bus->multi_link && stream->m_rt_count > 1) {
 			dev_err(bus->dev,
-				"Post bank switch ops not implemented");
+				"Post bank switch ops not implemented\n");
 			goto error;
 		}
 
@@ -807,7 +807,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 		ret = sdw_ml_sync_bank_switch(bus);
 		if (ret < 0) {
 			dev_err(bus->dev,
-				"multi link bank switch failed: %d", ret);
+				"multi link bank switch failed: %d\n", ret);
 			goto error;
 		}
 
@@ -1135,13 +1135,13 @@ static int sdw_config_stream(struct device *dev,
 	 */
 	if (stream->params.rate &&
 	    stream->params.rate != stream_config->frame_rate) {
-		dev_err(dev, "rate not matching, stream:%s", stream->name);
+		dev_err(dev, "rate not matching, stream:%s\n", stream->name);
 		return -EINVAL;
 	}
 
 	if (stream->params.bps &&
 	    stream->params.bps != stream_config->bps) {
-		dev_err(dev, "bps not matching, stream:%s", stream->name);
+		dev_err(dev, "bps not matching, stream:%s\n", stream->name);
 		return -EINVAL;
 	}
 
@@ -1161,7 +1161,7 @@ static int sdw_is_valid_port_range(struct device *dev,
 {
 	if (!SDW_VALID_PORT_RANGE(p_rt->num)) {
 		dev_err(dev,
-			"SoundWire: Invalid port number :%d", p_rt->num);
+			"SoundWire: Invalid port number :%d\n", p_rt->num);
 		return -EINVAL;
 	}
 
@@ -1272,7 +1272,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	 */
 	if (!bus->multi_link && stream->m_rt_count > 0) {
 		dev_err(bus->dev,
-			"Multilink not supported, link %d", bus->link_id);
+			"Multilink not supported, link %d\n", bus->link_id);
 		ret = -EINVAL;
 		goto unlock;
 	}
@@ -1280,7 +1280,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	m_rt = sdw_alloc_master_rt(bus, stream_config, stream);
 	if (!m_rt) {
 		dev_err(bus->dev,
-			"Master runtime config failed for stream:%s",
+			"Master runtime config failed for stream:%s\n",
 			stream->name);
 		ret = -ENOMEM;
 		goto unlock;
@@ -1338,7 +1338,7 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	m_rt = sdw_alloc_master_rt(slave->bus, stream_config, stream);
 	if (!m_rt) {
 		dev_err(&slave->dev,
-			"alloc master runtime failed for stream:%s",
+			"alloc master runtime failed for stream:%s\n",
 			stream->name);
 		ret = -ENOMEM;
 		goto error;
@@ -1347,7 +1347,7 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	s_rt = sdw_alloc_slave_rt(slave, stream_config, stream);
 	if (!s_rt) {
 		dev_err(&slave->dev,
-			"Slave runtime config failed for stream:%s",
+			"Slave runtime config failed for stream:%s\n",
 			stream->name);
 		ret = -ENOMEM;
 		goto stream_error;
@@ -1477,7 +1477,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 
 		/* TODO: Support Asynchronous mode */
 		if ((prop->max_freq % stream->params.rate) != 0) {
-			dev_err(bus->dev, "Async mode not supported");
+			dev_err(bus->dev, "Async mode not supported\n");
 			return -EINVAL;
 		}
 
@@ -1489,7 +1489,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d", ret);
+			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			goto restore_params;
 		}
 
@@ -1497,7 +1497,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
-		dev_err(bus->dev, "Bank switch failed: %d", ret);
+		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
 		goto restore_params;
 	}
 
@@ -1507,7 +1507,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 		/* Prepare port(s) on the new clock configuration */
 		ret = sdw_prep_deprep_ports(m_rt, true);
 		if (ret < 0) {
-			dev_err(bus->dev, "Prepare port(s) failed ret = %d",
+			dev_err(bus->dev, "Prepare port(s) failed ret = %d\n",
 				ret);
 			return ret;
 		}
@@ -1534,7 +1534,7 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 	int ret = 0;
 
 	if (!stream) {
-		pr_err("SoundWire: Handle not found for stream");
+		pr_err("SoundWire: Handle not found for stream\n");
 		return -EINVAL;
 	}
 
@@ -1542,7 +1542,7 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 
 	ret = _sdw_prepare_stream(stream);
 	if (ret < 0)
-		pr_err("Prepare for stream:%s failed: %d", stream->name, ret);
+		pr_err("Prepare for stream:%s failed: %d\n", stream->name, ret);
 
 	sdw_release_bus_lock(stream);
 	return ret;
@@ -1562,21 +1562,21 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d", ret);
+			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			return ret;
 		}
 
 		/* Enable port(s) */
 		ret = sdw_enable_disable_ports(m_rt, true);
 		if (ret < 0) {
-			dev_err(bus->dev, "Enable port(s) failed ret: %d", ret);
+			dev_err(bus->dev, "Enable port(s) failed ret: %d\n", ret);
 			return ret;
 		}
 	}
 
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
-		dev_err(bus->dev, "Bank switch failed: %d", ret);
+		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
 		return ret;
 	}
 
@@ -1596,7 +1596,7 @@ int sdw_enable_stream(struct sdw_stream_runtime *stream)
 	int ret = 0;
 
 	if (!stream) {
-		pr_err("SoundWire: Handle not found for stream");
+		pr_err("SoundWire: Handle not found for stream\n");
 		return -EINVAL;
 	}
 
@@ -1604,7 +1604,7 @@ int sdw_enable_stream(struct sdw_stream_runtime *stream)
 
 	ret = _sdw_enable_stream(stream);
 	if (ret < 0)
-		pr_err("Enable for stream:%s failed: %d", stream->name, ret);
+		pr_err("Enable for stream:%s failed: %d\n", stream->name, ret);
 
 	sdw_release_bus_lock(stream);
 	return ret;
@@ -1622,7 +1622,7 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
 		/* Disable port(s) */
 		ret = sdw_enable_disable_ports(m_rt, false);
 		if (ret < 0) {
-			dev_err(bus->dev, "Disable port(s) failed: %d", ret);
+			dev_err(bus->dev, "Disable port(s) failed: %d\n", ret);
 			return ret;
 		}
 	}
@@ -1633,7 +1633,7 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d", ret);
+			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			return ret;
 		}
 	}
@@ -1653,7 +1653,7 @@ int sdw_disable_stream(struct sdw_stream_runtime *stream)
 	int ret = 0;
 
 	if (!stream) {
-		pr_err("SoundWire: Handle not found for stream");
+		pr_err("SoundWire: Handle not found for stream\n");
 		return -EINVAL;
 	}
 
@@ -1661,7 +1661,7 @@ int sdw_disable_stream(struct sdw_stream_runtime *stream)
 
 	ret = _sdw_disable_stream(stream);
 	if (ret < 0)
-		pr_err("Disable for stream:%s failed: %d", stream->name, ret);
+		pr_err("Disable for stream:%s failed: %d\n", stream->name, ret);
 
 	sdw_release_bus_lock(stream);
 	return ret;
@@ -1679,7 +1679,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		/* De-prepare port(s) */
 		ret = sdw_prep_deprep_ports(m_rt, false);
 		if (ret < 0) {
-			dev_err(bus->dev, "De-prepare port(s) failed: %d", ret);
+			dev_err(bus->dev, "De-prepare port(s) failed: %d\n", ret);
 			return ret;
 		}
 
@@ -1690,7 +1690,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		/* Program params */
 		ret = sdw_program_params(bus);
 		if (ret < 0) {
-			dev_err(bus->dev, "Program params failed: %d", ret);
+			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			return ret;
 		}
 
@@ -1712,14 +1712,14 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 	int ret = 0;
 
 	if (!stream) {
-		pr_err("SoundWire: Handle not found for stream");
+		pr_err("SoundWire: Handle not found for stream\n");
 		return -EINVAL;
 	}
 
 	sdw_acquire_bus_lock(stream);
 	ret = _sdw_deprepare_stream(stream);
 	if (ret < 0)
-		pr_err("De-prepare for stream:%d failed: %d", ret, ret);
+		pr_err("De-prepare for stream:%d failed: %d\n", ret, ret);
 
 	sdw_release_bus_lock(stream);
 	return ret;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

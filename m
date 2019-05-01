Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9910A83
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:02:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CCA41695;
	Wed,  1 May 2019 18:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CCA41695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556726562;
	bh=+Gnd/MoqME7K3t7M2nQuI1+FlXEfQedzGjsmJhDk1pI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aCIqaplfyJndIe56lX8ECcXKzpe39p6lJZp4cwNpXeIIFkkQOQSOa8fkXINcQYX7e
	 IS5j9jKfwpGNi/VN7s2W1Nbblbt5ao1V8DTUvr3ZIpIcYBeabnX4wI0x5idwyKMdIF
	 /YYfxbJNghxFgulYuEUq7IHD25rg5hjIgRF7Luds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2272BF89737;
	Wed,  1 May 2019 17:58:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15BEAF8972A; Wed,  1 May 2019 17:58:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E5FFF896CB
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5FFF896CB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115676"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:27 -0500
Message-Id: <20190501155745.21806-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v4 04/22] soundwire: bus: fix alignment issues
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

Use Linux style

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c | 66 ++++++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 688848637099..74e04caa811b 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -172,7 +172,8 @@ static inline int do_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
 }
 
 static inline int do_transfer_defer(struct sdw_bus *bus,
-			struct sdw_msg *msg, struct sdw_defer *defer)
+				    struct sdw_msg *msg,
+				    struct sdw_defer *defer)
 {
 	int retry = bus->prop.err_threshold;
 	enum sdw_command_response resp;
@@ -224,7 +225,7 @@ int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
 	ret = do_transfer(bus, msg);
 	if (ret != 0 && ret != -ENODATA)
 		dev_err(bus->dev, "trf on Slave %d failed:%d\n",
-				msg->dev_num, ret);
+			msg->dev_num, ret);
 
 	if (msg->page)
 		sdw_reset_page(bus, msg->dev_num);
@@ -243,7 +244,7 @@ int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
  * Caller needs to hold the msg_lock lock while calling this
  */
 int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
-				struct sdw_defer *defer)
+		       struct sdw_defer *defer)
 {
 	int ret;
 
@@ -253,7 +254,7 @@ int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
 	ret = do_transfer_defer(bus, msg, defer);
 	if (ret != 0 && ret != -ENODATA)
 		dev_err(bus->dev, "Defer trf on Slave %d failed:%d\n",
-				msg->dev_num, ret);
+			msg->dev_num, ret);
 
 	if (msg->page)
 		sdw_reset_page(bus, msg->dev_num);
@@ -261,9 +262,8 @@ int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
 	return ret;
 }
 
-
 int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
-		u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf)
+		 u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf)
 {
 	memset(msg, 0, sizeof(*msg));
 	msg->addr = addr; /* addr is 16 bit and truncated here */
@@ -321,7 +321,7 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 	int ret;
 
 	ret = sdw_fill_msg(&msg, slave, addr, count,
-			slave->dev_num, SDW_MSG_FLAG_READ, val);
+			   slave->dev_num, SDW_MSG_FLAG_READ, val);
 	if (ret < 0)
 		return ret;
 
@@ -349,7 +349,7 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 	int ret;
 
 	ret = sdw_fill_msg(&msg, slave, addr, count,
-			slave->dev_num, SDW_MSG_FLAG_WRITE, val);
+			   slave->dev_num, SDW_MSG_FLAG_WRITE, val);
 	if (ret < 0)
 		return ret;
 
@@ -456,13 +456,13 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 		mutex_unlock(&slave->bus->bus_lock);
 		if (dev_num < 0) {
 			dev_err(slave->bus->dev, "Get dev_num failed: %d",
-								dev_num);
+				dev_num);
 			return dev_num;
 		}
 	} else {
 		dev_info(slave->bus->dev,
-				"Slave already registered dev_num:%d",
-				slave->dev_num);
+			 "Slave already registered dev_num:%d",
+			 slave->dev_num);
 
 		/* Clear the slave->dev_num to transfer message on device 0 */
 		dev_num = slave->dev_num;
@@ -483,7 +483,7 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 }
 
 void sdw_extract_slave_id(struct sdw_bus *bus,
-			u64 addr, struct sdw_slave_id *id)
+			  u64 addr, struct sdw_slave_id *id)
 {
 	dev_dbg(bus->dev, "SDW Slave Addr: %llx", addr);
 
@@ -523,7 +523,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 
 	/* No Slave, so use raw xfer api */
 	ret = sdw_fill_msg(&msg, NULL, SDW_SCP_DEVID_0,
-			SDW_NUM_DEV_ID_REGISTERS, 0, SDW_MSG_FLAG_READ, buf);
+			   SDW_NUM_DEV_ID_REGISTERS, 0, SDW_MSG_FLAG_READ, buf);
 	if (ret < 0)
 		return ret;
 
@@ -590,7 +590,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 }
 
 static void sdw_modify_slave_status(struct sdw_slave *slave,
-				enum sdw_slave_status status)
+				    enum sdw_slave_status status)
 {
 	mutex_lock(&slave->bus->bus_lock);
 	slave->status = status;
@@ -598,7 +598,7 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 }
 
 int sdw_configure_dpn_intr(struct sdw_slave *slave,
-			int port, bool enable, int mask)
+			   int port, bool enable, int mask)
 {
 	u32 addr;
 	int ret;
@@ -618,7 +618,7 @@ int sdw_configure_dpn_intr(struct sdw_slave *slave,
 	ret = sdw_update(slave, addr, (mask | SDW_DPN_INT_PORT_READY), val);
 	if (ret < 0)
 		dev_err(slave->bus->dev,
-				"SDW_DPN_INTMASK write failed:%d", val);
+			"SDW_DPN_INTMASK write failed:%d", val);
 
 	return ret;
 }
@@ -642,7 +642,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 	ret = sdw_update(slave, SDW_SCP_INTMASK1, val, val);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
-				"SDW_SCP_INTMASK1 write failed:%d", ret);
+			"SDW_SCP_INTMASK1 write failed:%d", ret);
 		return ret;
 	}
 
@@ -657,7 +657,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 	ret = sdw_update(slave, SDW_DP0_INTMASK, val, val);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
-				"SDW_DP0_INTMASK read failed:%d", ret);
+			"SDW_DP0_INTMASK read failed:%d", ret);
 		return val;
 	}
 
@@ -672,7 +672,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 	status = sdw_read(slave, SDW_DP0_INT);
 	if (status < 0) {
 		dev_err(slave->bus->dev,
-				"SDW_DP0_INT read failed:%d", status);
+			"SDW_DP0_INT read failed:%d", status);
 		return status;
 	}
 
@@ -735,7 +735,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 }
 
 static int sdw_handle_port_interrupt(struct sdw_slave *slave,
-		int port, u8 *slave_status)
+				     int port, u8 *slave_status)
 {
 	u8 clear = 0, impl_int_mask;
 	int status, status2, ret, count = 0;
@@ -748,7 +748,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 	status = sdw_read(slave, addr);
 	if (status < 0) {
 		dev_err(slave->bus->dev,
-				"SDW_DPN_INT read failed:%d", status);
+			"SDW_DPN_INT read failed:%d", status);
 
 		return status;
 	}
@@ -782,7 +782,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		ret = sdw_write(slave, addr, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
-					"SDW_DPN_INT write failed:%d", ret);
+				"SDW_DPN_INT write failed:%d", ret);
 			return ret;
 		}
 
@@ -790,7 +790,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		status2 = sdw_read(slave, addr);
 		if (status2 < 0) {
 			dev_err(slave->bus->dev,
-					"SDW_DPN_INT read failed:%d", status2);
+				"SDW_DPN_INT read failed:%d", status2);
 			return status2;
 		}
 		status &= status2;
@@ -821,14 +821,14 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	buf = ret = sdw_read(slave, SDW_SCP_INT1);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
-					"SDW_SCP_INT1 read failed:%d", ret);
+			"SDW_SCP_INT1 read failed:%d", ret);
 		return ret;
 	}
 
 	ret = sdw_nread(slave, SDW_SCP_INTSTAT2, 2, buf2);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
-					"SDW_SCP_INT2/3 read failed:%d", ret);
+			"SDW_SCP_INT2/3 read failed:%d", ret);
 		return ret;
 	}
 
@@ -867,7 +867,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		port = port >> SDW_REG_SHIFT(SDW_SCP_INT1_PORT0_3);
 		for_each_set_bit(bit, &port, 8) {
 			sdw_handle_port_interrupt(slave, bit,
-						&port_status[bit]);
+						  &port_status[bit]);
 
 		}
 
@@ -900,7 +900,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 					(slave->ops->interrupt_callback)) {
 			slave_intr.control_port = clear;
 			memcpy(slave_intr.port, &port_status,
-						sizeof(slave_intr.port));
+			       sizeof(slave_intr.port));
 
 			slave->ops->interrupt_callback(slave, &slave_intr);
 		}
@@ -909,7 +909,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		ret = sdw_write(slave, SDW_SCP_INT1, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
-					"SDW_SCP_INT1 write failed:%d", ret);
+				"SDW_SCP_INT1 write failed:%d", ret);
 			return ret;
 		}
 
@@ -920,14 +920,14 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		_buf = ret = sdw_read(slave, SDW_SCP_INT1);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
-					"SDW_SCP_INT1 read failed:%d", ret);
+				"SDW_SCP_INT1 read failed:%d", ret);
 			return ret;
 		}
 
 		ret = sdw_nread(slave, SDW_SCP_INTSTAT2, 2, _buf2);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
-					"SDW_SCP_INT2/3 read failed:%d", ret);
+				"SDW_SCP_INT2/3 read failed:%d", ret);
 			return ret;
 		}
 
@@ -953,7 +953,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 }
 
 static int sdw_update_slave_status(struct sdw_slave *slave,
-				enum sdw_slave_status status)
+				   enum sdw_slave_status status)
 {
 	if ((slave->ops) && (slave->ops->update_status))
 		return slave->ops->update_status(slave, status);
@@ -967,7 +967,7 @@ static int sdw_update_slave_status(struct sdw_slave *slave,
  * @status: Status for all Slave(s)
  */
 int sdw_handle_slave_status(struct sdw_bus *bus,
-			enum sdw_slave_status status[])
+			    enum sdw_slave_status status[])
 {
 	enum sdw_slave_status prev_status;
 	struct sdw_slave *slave;
@@ -1028,7 +1028,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 
 		default:
 			dev_err(bus->dev, "Invalid slave %d status:%d",
-							i, status[i]);
+				i, status[i]);
 			break;
 		}
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

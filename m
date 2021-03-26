Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B7A34A433
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 10:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748C9167C;
	Fri, 26 Mar 2021 10:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748C9167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616750476;
	bh=289j1rcp3K6kEuioGcyby6LtVcEeF9zEokq0BiTxVMs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b7ZhJ1zdpwtJn4HTue+3zz04HImL2ugpM5BqFg/4KcuvdI0zvNYK1T+uSShrnTQNq
	 L6fzpOOlZEXhotdBU6qBdqCciCujv9d9im4Ykt0kxsC6c2iLwPbGVZhxmpQg2K1ZCb
	 n7SVc0k0EH35DsPmjDHVqR/R2p74Lz4ZhGg7YUsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52671F804F1;
	Fri, 26 Mar 2021 10:16:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3ABEF801EB; Fri, 26 Mar 2021 10:16:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7C4AF8016B
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 10:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C4AF8016B
IronPort-SDR: LMMfq6Q0ZAh1TE7v/y7ahBKNQp4YpolljLYYu23UbGXrB7yhmrV/lrp897ebLpwXEgDye0g58l
 RB3zsGpwFHiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276249432"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="276249432"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:36 -0700
IronPort-SDR: NOvwMtJaoz5WG+xXOYwL/bLRH36ZzvRkA+RNjcEX8tDjTFgc3g7yIyBRPY8UluuCD9t3HwaTac
 VlQWF3x9ztQg==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="416463131"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:33 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 03/11] soundwire: bus: use consistent tests for return
 values
Date: Fri, 26 Mar 2021 17:15:06 +0800
Message-Id: <20210326091514.20751-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
References: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 1c01cc192cbd..d39e5baa3e64 100644
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
 
@@ -1748,7 +1748,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 	if (status[0] == SDW_SLAVE_ATTACHED) {
 		dev_dbg(bus->dev, "Slave attached, programming device number\n");
 		ret = sdw_program_device_num(bus);
-		if (ret)
+		if (ret < 0)
 			dev_err(bus->dev, "Slave attach failed: %d\n", ret);
 		/*
 		 * programming a device number will have side effects,
@@ -1782,7 +1782,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 
 		case SDW_SLAVE_ALERT:
 			ret = sdw_handle_slave_alerts(slave);
-			if (ret)
+			if (ret < 0)
 				dev_err(&slave->dev,
 					"Slave %d alert handling failed: %d\n",
 					i, ret);
@@ -1801,7 +1801,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			attached_initializing = true;
 
 			ret = sdw_initialize_slave(slave);
-			if (ret)
+			if (ret < 0)
 				dev_err(&slave->dev,
 					"Slave %d initialization failed: %d\n",
 					i, ret);
@@ -1815,7 +1815,7 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 		}
 
 		ret = sdw_update_slave_status(slave, status[i]);
-		if (ret)
+		if (ret < 0)
 			dev_err(&slave->dev,
 				"Update Slave status failed:%d\n", ret);
 		if (attached_initializing) {
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4669379D49
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 05:02:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 700ED175A;
	Tue, 11 May 2021 05:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 700ED175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620702175;
	bh=Rk/7OkvocVWDThogkzOqPsl1KtE7LQWXf7R2iox9iq4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iggyxE+Q70I4qKVce3ouZqLQdQzmwEHfDOlYAgXvuPmUMB5/4WqTMcKUyKu4kswp3
	 cJyEK1ZYVFY+JGLKu1nktZo/yxMSJL94HU17T5CsUVso1pk4rNjbi0j541Wn+kkcWH
	 h96q7MBQP6fKa6MKNYMyIwdQrT85urN5vwS+H3Gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0565F8028D;
	Tue, 11 May 2021 05:01:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BEEFF80245; Tue, 11 May 2021 05:01:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44598F80156
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 05:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44598F80156
IronPort-SDR: mlM8VsCqro+EoABWaggCK23Mny2S9+QYNSG2ZLzD+9VkiIoWGdZFO78nTdIdmmH10/LKOwKXmo
 CzGaXTN0RzFQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199409382"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="199409382"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 20:01:03 -0700
IronPort-SDR: QUagwf8OkJ7qJIq/QfDmtLeFx5lThdSRxY+99krvOMQKC8HinGgDB0MxeBBs5a0vAI9ZYrM+Z2
 or95hruRcXDA==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="436431122"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 20:01:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 1/4] soundwire: bus: only use CLOCK_STOP_MODE0 and fix
 confusions
Date: Tue, 11 May 2021 11:00:45 +0800
Message-Id: <20210511030048.25622-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511030048.25622-1-yung-chuan.liao@linux.intel.com>
References: <20210511030048.25622-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

Existing devices and implementations only support the required
CLOCK_STOP_MODE0. All the code related to CLOCK_STOP_MODE1 has not
been tested and is highly questionable, with a clear confusion between
CLOCK_STOP_MODE1 and the simple clock stop state machine.

This patch removes all usages of CLOCK_STOP_MODE1 - which has no
impact on any solution - and fixes the use of the simple clock stop
state machine. The resulting code should be a lot more symmetrical and
easier to maintain.

Note that CLOCK_STOP_MODE1 is not supported in the SoundWire Device
Class specification so it's rather unlikely that we need to re-add
this mode later.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 100 ++++++++++++++--------------------
 include/linux/soundwire/sdw.h |   2 -
 2 files changed, 40 insertions(+), 62 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index a9e0aa72654d..dc4033b6f2e9 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -821,26 +821,6 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 	mutex_unlock(&bus->bus_lock);
 }
 
-static enum sdw_clk_stop_mode sdw_get_clk_stop_mode(struct sdw_slave *slave)
-{
-	enum sdw_clk_stop_mode mode;
-
-	/*
-	 * Query for clock stop mode if Slave implements
-	 * ops->get_clk_stop_mode, else read from property.
-	 */
-	if (slave->ops && slave->ops->get_clk_stop_mode) {
-		mode = slave->ops->get_clk_stop_mode(slave);
-	} else {
-		if (slave->prop.clk_stop_mode1)
-			mode = SDW_CLK_STOP_MODE1;
-		else
-			mode = SDW_CLK_STOP_MODE0;
-	}
-
-	return mode;
-}
-
 static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
 				       enum sdw_clk_stop_mode mode,
 				       enum sdw_clk_stop_type type)
@@ -933,7 +913,6 @@ static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
  */
 int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 {
-	enum sdw_clk_stop_mode slave_mode;
 	bool simple_clk_stop = true;
 	struct sdw_slave *slave;
 	bool is_slave = false;
@@ -955,10 +934,8 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		/* Identify if Slave(s) are available on Bus */
 		is_slave = true;
 
-		slave_mode = sdw_get_clk_stop_mode(slave);
-		slave->curr_clk_stop_mode = slave_mode;
-
-		ret = sdw_slave_clk_stop_callback(slave, slave_mode,
+		ret = sdw_slave_clk_stop_callback(slave,
+						  SDW_CLK_STOP_MODE0,
 						  SDW_CLK_PRE_PREPARE);
 		if (ret < 0) {
 			dev_err(&slave->dev,
@@ -966,22 +943,29 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 			return ret;
 		}
 
-		ret = sdw_slave_clk_stop_prepare(slave,
-						 slave_mode, true);
-		if (ret < 0) {
-			dev_err(&slave->dev,
-				"pre-prepare failed:%d", ret);
-			return ret;
-		}
-
-		if (slave_mode == SDW_CLK_STOP_MODE1)
+		/* Only prepare a Slave device if needed */
+		if (!slave->prop.simple_clk_stop_capable) {
 			simple_clk_stop = false;
+
+			ret = sdw_slave_clk_stop_prepare(slave,
+							 SDW_CLK_STOP_MODE0,
+							 true);
+			if (ret < 0) {
+				dev_err(&slave->dev,
+					"pre-prepare failed:%d", ret);
+				return ret;
+			}
+		}
 	}
 
 	/* Skip remaining clock stop preparation if no Slave is attached */
 	if (!is_slave)
 		return ret;
 
+	/*
+	 * Don't wait for all Slaves to be ready if they follow the simple
+	 * state machine
+	 */
 	if (!simple_clk_stop) {
 		ret = sdw_bus_wait_for_clk_prep_deprep(bus,
 						       SDW_BROADCAST_DEV_NUM);
@@ -998,17 +982,13 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		    slave->status != SDW_SLAVE_ALERT)
 			continue;
 
-		slave_mode = slave->curr_clk_stop_mode;
+		ret = sdw_slave_clk_stop_callback(slave,
+						  SDW_CLK_STOP_MODE0,
+						  SDW_CLK_POST_PREPARE);
 
-		if (slave_mode == SDW_CLK_STOP_MODE1) {
-			ret = sdw_slave_clk_stop_callback(slave,
-							  slave_mode,
-							  SDW_CLK_POST_PREPARE);
-
-			if (ret < 0) {
-				dev_err(&slave->dev,
-					"post-prepare failed:%d", ret);
-			}
+		if (ret < 0) {
+			dev_err(&slave->dev,
+				"post-prepare failed:%d", ret);
 		}
 	}
 
@@ -1059,7 +1039,6 @@ EXPORT_SYMBOL(sdw_bus_clk_stop);
  */
 int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 {
-	enum sdw_clk_stop_mode mode;
 	bool simple_clk_stop = true;
 	struct sdw_slave *slave;
 	bool is_slave = false;
@@ -1081,31 +1060,33 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 		/* Identify if Slave(s) are available on Bus */
 		is_slave = true;
 
-		mode = slave->curr_clk_stop_mode;
-
-		if (mode == SDW_CLK_STOP_MODE1) {
-			simple_clk_stop = false;
-			continue;
-		}
-
-		ret = sdw_slave_clk_stop_callback(slave, mode,
+		ret = sdw_slave_clk_stop_callback(slave, SDW_CLK_STOP_MODE0,
 						  SDW_CLK_PRE_DEPREPARE);
 		if (ret < 0)
 			dev_warn(&slave->dev,
 				 "clk stop deprep failed:%d", ret);
 
-		ret = sdw_slave_clk_stop_prepare(slave, mode,
-						 false);
+		/* Only de-prepare a Slave device if needed */
+		if (!slave->prop.simple_clk_stop_capable) {
+			simple_clk_stop = false;
 
-		if (ret < 0)
-			dev_warn(&slave->dev,
-				 "clk stop deprep failed:%d", ret);
+			ret = sdw_slave_clk_stop_prepare(slave, SDW_CLK_STOP_MODE0,
+							 false);
+
+			if (ret < 0)
+				dev_warn(&slave->dev,
+					 "clk stop deprep failed:%d", ret);
+		}
 	}
 
 	/* Skip remaining clock stop de-preparation if no Slave is attached */
 	if (!is_slave)
 		return 0;
 
+	/*
+	 * Don't wait for all Slaves to be ready if they follow the simple
+	 * state machine
+	 */
 	if (!simple_clk_stop)
 		sdw_bus_wait_for_clk_prep_deprep(bus, SDW_BROADCAST_DEV_NUM);
 
@@ -1117,8 +1098,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 		    slave->status != SDW_SLAVE_ALERT)
 			continue;
 
-		mode = slave->curr_clk_stop_mode;
-		sdw_slave_clk_stop_callback(slave, mode,
+		sdw_slave_clk_stop_callback(slave, SDW_CLK_STOP_MODE0,
 					    SDW_CLK_POST_DEPREPARE);
 	}
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ced07f8fde87..5d93d9949653 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -624,7 +624,6 @@ struct sdw_slave_ops {
 	int (*port_prep)(struct sdw_slave *slave,
 			 struct sdw_prepare_ch *prepare_ch,
 			 enum sdw_port_prep_ops pre_ops);
-	int (*get_clk_stop_mode)(struct sdw_slave *slave);
 	int (*clk_stop)(struct sdw_slave *slave,
 			enum sdw_clk_stop_mode mode,
 			enum sdw_clk_stop_type type);
@@ -675,7 +674,6 @@ struct sdw_slave {
 	struct list_head node;
 	struct completion port_ready[SDW_MAX_PORTS];
 	unsigned int m_port_map[SDW_MAX_PORTS];
-	enum sdw_clk_stop_mode curr_clk_stop_mode;
 	u16 dev_num;
 	u16 dev_num_sticky;
 	bool probed;
-- 
2.17.1


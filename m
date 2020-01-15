Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966F13B681
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 01:17:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D197317CB;
	Wed, 15 Jan 2020 01:16:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D197317CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579047451;
	bh=w9l0F4BQLvB5ECOjv99dAhIHor+Io6nWJqzLDBwCvrU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W57bDwR1otOxZw2JeCoR+Hzd/xvOc17gINsP5W1NjLHgiZYD9VdUY3i8Z+f/sBgmc
	 tnHozhHDbQfN671kl7wZcvSmqL9Fd90j0/EwdCtlH/IJkeWpHSA6HWaKrugDJKolD8
	 BOp5d+R3wLBaxlTM0Cke8pZP8Ku+JcqsU6lZlpxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62AABF802E9;
	Wed, 15 Jan 2020 01:10:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A605CF802DF; Wed, 15 Jan 2020 01:10:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC208F802A9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 01:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC208F802A9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 16:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="273468602"
Received: from emkilgox-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.0.151])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2020 16:09:55 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 14 Jan 2020 18:08:43 -0600
Message-Id: <20200115000844.14695-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115000844.14695-1-pierre-louis.bossart@linux.intel.com>
References: <20200115000844.14695-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 09/10] soundwire: bus: add clock stop helpers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

SoundWire supports two clock stop modes. Add support to handle the
clock stop modes and add pm_runtime calls in the bus.

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c       | 332 ++++++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h |  24 +++
 2 files changed, 356 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 23bc24c8e9d1..3395abd2ed39 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -2,6 +2,7 @@
 // Copyright(c) 2015-17 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/mod_devicetable.h>
 #include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -359,6 +360,52 @@ static int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
 	return sdw_nwrite_no_pm(slave, addr, 1, &value);
 }
 
+static int
+sdw_bread_no_pm(struct sdw_bus *bus, u16 dev_num, u32 addr)
+{
+	struct sdw_msg msg;
+	u8 buf;
+	int ret;
+
+	ret = sdw_fill_msg(&msg, NULL, addr, 1, dev_num,
+			   SDW_MSG_FLAG_READ, &buf);
+	if (ret)
+		return ret;
+
+	ret = sdw_transfer(bus, &msg);
+	if (ret < 0)
+		return ret;
+	else
+		return buf;
+}
+
+static int
+sdw_bwrite_no_pm(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value)
+{
+	struct sdw_msg msg;
+	int ret;
+
+	ret = sdw_fill_msg(&msg, NULL, addr, 1, dev_num,
+			   SDW_MSG_FLAG_WRITE, &value);
+	if (ret)
+		return ret;
+
+	return sdw_transfer(bus, &msg);
+}
+
+static int
+sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
+{
+	u8 buf;
+	int ret;
+
+	ret = sdw_nread_no_pm(slave, addr, 1, &buf);
+	if (ret < 0)
+		return ret;
+	else
+		return buf;
+}
+
 /**
  * sdw_nread() - Read "n" contiguous SDW Slave registers
  * @slave: SDW Slave
@@ -673,6 +720,291 @@ static void sdw_modify_slave_status(struct sdw_slave *slave,
 	mutex_unlock(&slave->bus->bus_lock);
 }
 
+static enum sdw_clk_stop_mode sdw_get_clk_stop_mode(struct sdw_slave *slave)
+{
+	enum sdw_clk_stop_mode mode;
+
+	/*
+	 * Query for clock stop mode if Slave implements
+	 * ops->get_clk_stop_mode, else read from property.
+	 */
+	if (slave->ops && slave->ops->get_clk_stop_mode) {
+		mode = slave->ops->get_clk_stop_mode(slave);
+	} else {
+		if (slave->prop.clk_stop_mode1)
+			mode = SDW_CLK_STOP_MODE1;
+		else
+			mode = SDW_CLK_STOP_MODE0;
+	}
+
+	return mode;
+}
+
+static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
+				       enum sdw_clk_stop_mode mode,
+				       enum sdw_clk_stop_type type)
+{
+	int ret;
+
+	if (slave->ops && slave->ops->clk_stop) {
+		ret = slave->ops->clk_stop(slave, mode, type);
+		if (ret < 0) {
+			dev_err(&slave->dev,
+				"Clk Stop type =%d failed: %d\n", type, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
+				      enum sdw_clk_stop_mode mode,
+				      bool prepare)
+{
+	bool wake_en;
+	u32 val = 0;
+	int ret;
+
+	wake_en = slave->prop.wake_capable;
+
+	if (prepare) {
+		val = SDW_SCP_SYSTEMCTRL_CLK_STP_PREP;
+
+		if (mode == SDW_CLK_STOP_MODE1)
+			val |= SDW_SCP_SYSTEMCTRL_CLK_STP_MODE1;
+
+		if (wake_en)
+			val |= SDW_SCP_SYSTEMCTRL_WAKE_UP_EN;
+	} else {
+		val = sdw_read_no_pm(slave, SDW_SCP_SYSTEMCTRL);
+
+		val &= ~(SDW_SCP_SYSTEMCTRL_CLK_STP_PREP);
+	}
+
+	ret = sdw_write_no_pm(slave, SDW_SCP_SYSTEMCTRL, val);
+
+	if (ret != 0)
+		dev_err(&slave->dev,
+			"Clock Stop prepare failed for slave: %d", ret);
+
+	return ret;
+}
+
+static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
+{
+	int retry = bus->clk_stop_timeout;
+	int val;
+
+	do {
+		val = sdw_bread_no_pm(bus, dev_num, SDW_SCP_STAT) &
+			SDW_SCP_STAT_CLK_STP_NF;
+		if (!val) {
+			dev_info(bus->dev, "clock stop prep/de-prep done slave:%d",
+				 dev_num);
+			return 0;
+		}
+
+		usleep_range(1000, 1500);
+		retry--;
+	} while (retry);
+
+	dev_err(bus->dev, "clock stop prep/de-prep failed slave:%d",
+		dev_num);
+
+	return -ETIMEDOUT;
+}
+
+/**
+ * sdw_bus_prep_clk_stop: prepare Slave(s) for clock stop
+ *
+ * @bus: SDW bus instance
+ *
+ * Query Slave for clock stop mode and prepare for that mode.
+ */
+int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
+{
+	enum sdw_clk_stop_mode slave_mode;
+	bool simple_clk_stop = true;
+	struct sdw_slave *slave;
+	bool is_slave = false;
+	int ret = 0;
+
+	/*
+	 * In order to save on transition time, prepare
+	 * each Slave and then wait for all Slave(s) to be
+	 * prepared for clock stop.
+	 */
+	list_for_each_entry(slave, &bus->slaves, node) {
+		if (!slave->dev_num)
+			continue;
+
+		/* Identify if Slave(s) are available on Bus */
+		is_slave = true;
+
+		if (slave->status != SDW_SLAVE_ATTACHED &&
+		    slave->status != SDW_SLAVE_ALERT)
+			continue;
+
+		slave_mode = sdw_get_clk_stop_mode(slave);
+		slave->curr_clk_stop_mode = slave_mode;
+
+		ret = sdw_slave_clk_stop_callback(slave, slave_mode,
+						  SDW_CLK_PRE_PREPARE);
+		if (ret < 0) {
+			dev_err(&slave->dev,
+				"pre-prepare failed:%d", ret);
+			return ret;
+		}
+
+		ret = sdw_slave_clk_stop_prepare(slave,
+						 slave_mode, true);
+		if (ret < 0) {
+			dev_err(&slave->dev,
+				"pre-prepare failed:%d", ret);
+			return ret;
+		}
+
+		if (slave_mode == SDW_CLK_STOP_MODE1)
+			simple_clk_stop = false;
+	}
+
+	if (is_slave && !simple_clk_stop) {
+		ret = sdw_bus_wait_for_clk_prep_deprep(bus,
+						       SDW_BROADCAST_DEV_NUM);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Inform slaves that prep is done */
+	list_for_each_entry(slave, &bus->slaves, node) {
+		if (!slave->dev_num)
+			continue;
+
+		if (slave->status != SDW_SLAVE_ATTACHED &&
+		    slave->status != SDW_SLAVE_ALERT)
+			continue;
+
+		slave_mode = slave->curr_clk_stop_mode;
+
+		if (slave_mode == SDW_CLK_STOP_MODE1) {
+			ret = sdw_slave_clk_stop_callback(slave,
+							  slave_mode,
+							  SDW_CLK_POST_PREPARE);
+
+			if (ret < 0) {
+				dev_err(&slave->dev,
+					"post-prepare failed:%d", ret);
+			}
+		}
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(sdw_bus_prep_clk_stop);
+
+/**
+ * sdw_bus_clk_stop: stop bus clock
+ *
+ * @bus: SDW bus instance
+ *
+ * After preparing the Slaves for clock stop, stop the clock by broadcasting
+ * write to SCP_CTRL register.
+ */
+int sdw_bus_clk_stop(struct sdw_bus *bus)
+{
+	int ret;
+
+	/*
+	 * broadcast clock stop now, attached Slaves will ACK this,
+	 * unattached will ignore
+	 */
+	ret = sdw_bwrite_no_pm(bus, SDW_BROADCAST_DEV_NUM,
+			       SDW_SCP_CTRL, SDW_SCP_CTRL_CLK_STP_NOW);
+	if (ret < 0) {
+		dev_err(bus->dev,
+			"ClockStopNow Broadcast message failed %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_bus_clk_stop);
+
+/**
+ * sdw_bus_exit_clk_stop: Exit clock stop mode
+ *
+ * @bus: SDW bus instance
+ *
+ * This De-prepares the Slaves by exiting Clock Stop Mode 0. For the Slaves
+ * exiting Clock Stop Mode 1, they will be de-prepared after they enumerate
+ * back.
+ */
+int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
+{
+	enum sdw_clk_stop_mode mode;
+	bool simple_clk_stop = true;
+	struct sdw_slave *slave;
+	bool is_slave = false;
+	int ret;
+
+	/*
+	 * In order to save on transition time, de-prepare
+	 * each Slave and then wait for all Slave(s) to be
+	 * de-prepared after clock resume.
+	 */
+	list_for_each_entry(slave, &bus->slaves, node) {
+		if (!slave->dev_num)
+			continue;
+
+		/* Identify if Slave(s) are available on Bus */
+		is_slave = true;
+
+		if (slave->status != SDW_SLAVE_ATTACHED &&
+		    slave->status != SDW_SLAVE_ALERT)
+			continue;
+
+		mode = slave->curr_clk_stop_mode;
+
+		if (mode == SDW_CLK_STOP_MODE1) {
+			simple_clk_stop = false;
+			continue;
+		}
+
+		ret = sdw_slave_clk_stop_callback(slave, mode,
+						  SDW_CLK_PRE_DEPREPARE);
+		if (ret < 0)
+			dev_warn(&slave->dev,
+				 "clk stop deprep failed:%d", ret);
+
+		ret = sdw_slave_clk_stop_prepare(slave, mode,
+						 false);
+
+		if (ret < 0)
+			dev_warn(&slave->dev,
+				 "clk stop deprep failed:%d", ret);
+	}
+
+	if (is_slave && !simple_clk_stop)
+		sdw_bus_wait_for_clk_prep_deprep(bus, SDW_BROADCAST_DEV_NUM);
+
+	list_for_each_entry(slave, &bus->slaves, node) {
+		if (!slave->dev_num)
+			continue;
+
+		if (slave->status != SDW_SLAVE_ATTACHED &&
+		    slave->status != SDW_SLAVE_ALERT)
+			continue;
+
+		mode = slave->curr_clk_stop_mode;
+		sdw_slave_clk_stop_callback(slave, mode,
+					    SDW_CLK_POST_DEPREPARE);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_bus_exit_clk_stop);
+
 int sdw_configure_dpn_intr(struct sdw_slave *slave,
 			   int port, bool enable, int mask)
 {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b451bb622335..b8427df034ce 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -79,6 +79,21 @@ enum sdw_slave_status {
 	SDW_SLAVE_RESERVED = 3,
 };
 
+/**
+ * enum sdw_clk_stop_type: clock stop operations
+ *
+ * @SDW_CLK_PRE_PREPARE: pre clock stop prepare
+ * @SDW_CLK_POST_PREPARE: post clock stop prepare
+ * @SDW_CLK_PRE_DEPREPARE: pre clock stop de-prepare
+ * @SDW_CLK_POST_DEPREPARE: post clock stop de-prepare
+ */
+enum sdw_clk_stop_type {
+	       SDW_CLK_PRE_PREPARE = 0,
+	       SDW_CLK_POST_PREPARE,
+	       SDW_CLK_PRE_DEPREPARE,
+	       SDW_CLK_POST_DEPREPARE,
+};
+
 /**
  * enum sdw_command_response - Command response as defined by SDW spec
  * @SDW_CMD_OK: cmd was successful
@@ -533,6 +548,11 @@ struct sdw_slave_ops {
 	int (*port_prep)(struct sdw_slave *slave,
 			 struct sdw_prepare_ch *prepare_ch,
 			 enum sdw_port_prep_ops pre_ops);
+	int (*get_clk_stop_mode)(struct sdw_slave *slave);
+	int (*clk_stop)(struct sdw_slave *slave,
+			enum sdw_clk_stop_mode mode,
+			enum sdw_clk_stop_type type);
+
 };
 
 /**
@@ -575,6 +595,7 @@ struct sdw_slave {
 #endif
 	struct list_head node;
 	struct completion *port_ready;
+	enum sdw_clk_stop_mode curr_clk_stop_mode;
 	u16 dev_num;
 	u16 dev_num_sticky;
 	bool probed;
@@ -892,6 +913,9 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream);
 int sdw_enable_stream(struct sdw_stream_runtime *stream);
 int sdw_disable_stream(struct sdw_stream_runtime *stream);
 int sdw_deprepare_stream(struct sdw_stream_runtime *stream);
+int sdw_bus_prep_clk_stop(struct sdw_bus *bus);
+int sdw_bus_clk_stop(struct sdw_bus *bus);
+int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
 
 /* messaging and data APIs */
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

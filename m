Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A8C18211E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 19:46:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 928C8167E;
	Wed, 11 Mar 2020 19:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 928C8167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583952390;
	bh=ZtPqWqylpXvQ2T111WW26cNcf0xdr2KpHrC+gztQJDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBmdfO1jT8xyVX+VnvmsJCur7Wo9KDvaAw2YYgOvNEagHxzYyKPaqVOnAtyOrlbdn
	 Rh/xV2teVxJyNjAzYniGUl9aeFrNqRGlqLkUwwXGe5LzW4gQXdZoyZ+QJkY8AUvWM/
	 ZWlT2/W3GOGeS6lYiCHSdRPyjB5XK3K0jLOluf7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B54B2F802BE;
	Wed, 11 Mar 2020 19:42:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D177BF8028C; Wed, 11 Mar 2020 19:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34ADCF801F8
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 19:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34ADCF801F8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 11:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,541,1574150400"; d="scan'208";a="441776240"
Received: from fjan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.25.157])
 by fmsmga005.fm.intel.com with ESMTP; 11 Mar 2020 11:41:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/16] soundwire: cadence: add clock_stop/restart routines
Date: Wed, 11 Mar 2020 13:41:17 -0500
Message-Id: <20200311184128.4212-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311184128.4212-1-pierre-louis.bossart@linux.intel.com>
References: <20200311184128.4212-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
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

From: Rander Wang <rander.wang@intel.com>

Add support for clock stop and restart, with two configuration
parameters:

1) when entering the ClockStop mode, Slave-initiated wakes can be
prevented.

2) When exiting the ClockStop mode, the caller can request a Bus Reset
(either if all Slaves were configured in ClockStopMode1 or the Master
IP lost context and enumeration is required)

The code handles the case where no Slaves are present by configuring
the IP to treat COMMAND_IGNORED as success.

The exit_reset part can be dealt with in the caller, along with the
required syncArm/syncGo sequence in multi-link mode.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 161 ++++++++++++++++++++++++++++-
 drivers/soundwire/cadence_master.h |   2 +
 2 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 4089c271305a..1ec537b2789f 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -225,12 +225,30 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
 			return 0;
 
 		timeout--;
-		udelay(50);
+		usleep_range(50, 100);
 	} while (timeout != 0);
 
 	return -EAGAIN;
 }
 
+static int cdns_set_wait(struct sdw_cdns *cdns, int offset, u32 mask, u32 value)
+{
+	int timeout = 10;
+	u32 reg_read;
+
+	/* Wait for bit to be set */
+	do {
+		reg_read = readl(cdns->registers + offset);
+		if ((reg_read & mask) == value)
+			return 0;
+
+		timeout--;
+		usleep_range(50, 100);
+	} while (timeout != 0);
+
+	return -ETIMEDOUT;
+}
+
 /*
  * all changes to the MCP_CONFIG, MCP_CONTROL, MCP_CMDCTRL and MCP_PHYCTRL
  * need to be confirmed with a write to MCP_CONFIG_UPDATE
@@ -1231,6 +1249,147 @@ bool sdw_cdns_is_clock_stop(struct sdw_cdns *cdns)
 }
 EXPORT_SYMBOL(sdw_cdns_is_clock_stop);
 
+/**
+ * sdw_cdns_clock_stop: Cadence clock stop configuration routine
+ *
+ * @cdns: Cadence instance
+ * @block_wake: prevent wakes if required by the platform
+ */
+int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake)
+{
+	bool slave_present = false;
+	struct sdw_slave *slave;
+	u32 status;
+	int ret;
+
+	/* Check suspend status */
+	status = cdns_readl(cdns, CDNS_MCP_STAT);
+	if (status & CDNS_MCP_STAT_CLK_STOP) {
+		dev_dbg(cdns->dev, "Clock is already stopped\n");
+		return 1;
+	}
+
+	/*
+	 * For specific platforms, it is required to be able to put
+	 * master into a state in which it ignores wake-up trials
+	 * in clock stop state
+	 */
+	if (block_wake)
+		cdns_updatel(cdns, CDNS_MCP_CONTROL,
+			     CDNS_MCP_CONTROL_BLOCK_WAKEUP,
+			     CDNS_MCP_CONTROL_BLOCK_WAKEUP);
+
+	list_for_each_entry(slave, &cdns->bus.slaves, node) {
+		if (slave->status == SDW_SLAVE_ATTACHED ||
+		    slave->status == SDW_SLAVE_ALERT) {
+			slave_present = true;
+			break;
+		}
+	}
+
+	/*
+	 * This CMD_ACCEPT should be used when there are no devices
+	 * attached on the link when entering clock stop mode. If this is
+	 * not set and there is a broadcast write then the command ignored
+	 * will be treated as a failure
+	 */
+	if (!slave_present)
+		cdns_updatel(cdns, CDNS_MCP_CONTROL,
+			     CDNS_MCP_CONTROL_CMD_ACCEPT,
+			     CDNS_MCP_CONTROL_CMD_ACCEPT);
+	else
+		cdns_updatel(cdns, CDNS_MCP_CONTROL,
+			     CDNS_MCP_CONTROL_CMD_ACCEPT, 0);
+
+	/* commit changes */
+	ret = cdns_config_update(cdns);
+	if (ret < 0) {
+		dev_err(cdns->dev, "%s: config_update failed\n", __func__);
+		return ret;
+	}
+
+	/* Prepare slaves for clock stop */
+	ret = sdw_bus_prep_clk_stop(&cdns->bus);
+	if (ret < 0) {
+		dev_err(cdns->dev, "prepare clock stop failed %d", ret);
+		return ret;
+	}
+
+	/*
+	 * Enter clock stop mode and only report errors if there are
+	 * Slave devices present (ALERT or ATTACHED)
+	 */
+	ret = sdw_bus_clk_stop(&cdns->bus);
+	if (ret < 0 && slave_present && ret != -ENODATA) {
+		dev_err(cdns->dev, "bus clock stop failed %d", ret);
+		return ret;
+	}
+
+	ret = cdns_set_wait(cdns, CDNS_MCP_STAT,
+			    CDNS_MCP_STAT_CLK_STOP,
+			    CDNS_MCP_STAT_CLK_STOP);
+	if (ret < 0)
+		dev_err(cdns->dev, "Clock stop failed %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL(sdw_cdns_clock_stop);
+
+/**
+ * sdw_cdns_clock_restart: Cadence PM clock restart configuration routine
+ *
+ * @cdns: Cadence instance
+ * @bus_reset: context may be lost while in low power modes and the bus
+ * may require a Severe Reset and re-enumeration after a wake.
+ */
+int sdw_cdns_clock_restart(struct sdw_cdns *cdns, bool bus_reset)
+{
+	int ret;
+
+	ret = cdns_clear_bit(cdns, CDNS_MCP_CONTROL,
+			     CDNS_MCP_CONTROL_CLK_STOP_CLR);
+	if (ret < 0) {
+		dev_err(cdns->dev, "Couldn't exit from clock stop\n");
+		return ret;
+	}
+
+	ret = cdns_set_wait(cdns, CDNS_MCP_STAT, CDNS_MCP_STAT_CLK_STOP, 0);
+	if (ret < 0) {
+		dev_err(cdns->dev, "clock stop exit failed %d\n", ret);
+		return ret;
+	}
+
+	cdns_updatel(cdns, CDNS_MCP_CONTROL,
+		     CDNS_MCP_CONTROL_BLOCK_WAKEUP, 0);
+
+	/*
+	 * clear CMD_ACCEPT so that the command ignored
+	 * will be treated as a failure during a broadcast write
+	 */
+	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_ACCEPT, 0);
+
+	if (!bus_reset) {
+
+		/* enable bus operations with clock and data */
+		cdns_updatel(cdns, CDNS_MCP_CONFIG,
+			     CDNS_MCP_CONFIG_OP,
+			     CDNS_MCP_CONFIG_OP_NORMAL);
+
+		ret = cdns_config_update(cdns);
+		if (ret < 0) {
+			dev_err(cdns->dev, "%s: config_update failed\n", __func__);
+			return ret;
+		}
+
+		ret = sdw_bus_exit_clk_stop(&cdns->bus);
+		if (ret < 0)
+			dev_err(cdns->dev, "bus failed to exit clock stop %d\n", ret);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(sdw_cdns_clock_restart);
+
 /**
  * sdw_cdns_probe() - Cadence probe routine
  * @cdns: Cadence instance
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 691faa386889..e8fa5c7e09f4 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -145,6 +145,8 @@ int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
 int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state);
 
 bool sdw_cdns_is_clock_stop(struct sdw_cdns *cdns);
+int sdw_cdns_clock_stop(struct sdw_cdns *cdns, bool block_wake);
+int sdw_cdns_clock_restart(struct sdw_cdns *cdns, bool bus_reset);
 
 #ifdef CONFIG_DEBUG_FS
 void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
-- 
2.20.1


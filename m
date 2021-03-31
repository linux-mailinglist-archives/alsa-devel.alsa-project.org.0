Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A625634F60A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 03:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F1991690;
	Wed, 31 Mar 2021 03:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F1991690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617153396;
	bh=2tGdH2l7LNdKCTuTegdLj9HEHLWbUz/HIC+DSrbUKu8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fVo3jjMPoy+IiopBM9AMsk0VL3wKIS8ydueNIgJg91DwnkUz33xie3ZqbRbVqlnMG
	 OjRQNyCeuYyvyutQZKKQO2igUvVLEwxdQAV104Euonw0WCyZp8NXb6BTxcoJ+8tlra
	 Xs8kYSRd7zXs51irHbOnDG8OesvnyXBUjQOcQhWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3C63F8032B;
	Wed, 31 Mar 2021 03:14:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA933F8026F; Wed, 31 Mar 2021 03:14:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ADD5F80240
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 03:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ADD5F80240
IronPort-SDR: w/aSMEuDEZ7IRv9eewHhbuHIBhiuH51C5zFJprSthgp0mM7B1+BzCS67ercg6f1iHvpmcPfodG
 4+mW0yj1Oluw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191919213"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="191919213"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 18:14:18 -0700
IronPort-SDR: bYcIksVmFp8br8nMo6M9BC3z+tm3rWGb9583LLqWAxV20QaghRLeid/g09dSGG9s6CyGRCj/pu
 1qeiYudvAuxQ==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418414720"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 18:14:15 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/2] soundwire: bus: handle errors in clock stop/start
 sequences
Date: Wed, 31 Mar 2021 09:13:55 +0800
Message-Id: <20210331011355.14313-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331011355.14313-1-yung-chuan.liao@linux.intel.com>
References: <20210331011355.14313-1-yung-chuan.liao@linux.intel.com>
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

If a device lost sync and can no longer ACK a command, it may not be
able to enter a lower-power state but it will still be able to resync
when the clock restarts. In those cases, we want to continue with the
clock stop sequence.

This patch modifies the behavior when -ENODATA is received, with the
error level demoted to a dev_dbg() since it's a recoverable issue.

For consistency the log messages are also modified to be unique and
self-explanatory, and missing logs are also added on clock stop exit.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 70 +++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 9bd83c91a873..ea54a1f02252 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -848,8 +848,9 @@ static int sdw_slave_clk_stop_callback(struct sdw_slave *slave,
 	if (slave->ops && slave->ops->clk_stop) {
 		ret = slave->ops->clk_stop(slave, mode, type);
 		if (ret < 0) {
-			dev_err(&slave->dev,
-				"Clk Stop type =%d failed: %d\n", type, ret);
+			sdw_dev_dbg_or_err(&slave->dev, ret != -ENODATA,
+					   "Clk Stop mode %d type =%d failed: %d\n",
+					   mode, type, ret);
 			return ret;
 		}
 	}
@@ -878,7 +879,8 @@ static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
 	} else {
 		ret = sdw_read_no_pm(slave, SDW_SCP_SYSTEMCTRL);
 		if (ret < 0) {
-			dev_err(&slave->dev, "SDW_SCP_SYSTEMCTRL read failed:%d\n", ret);
+			sdw_dev_dbg_or_err(&slave->dev, ret != -ENODATA,
+					   "SDW_SCP_SYSTEMCTRL read failed:%d\n", ret);
 			return ret;
 		}
 		val = ret;
@@ -888,8 +890,8 @@ static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
 	ret = sdw_write_no_pm(slave, SDW_SCP_SYSTEMCTRL, val);
 
 	if (ret < 0)
-		dev_err(&slave->dev,
-			"Clock Stop prepare failed for slave: %d", ret);
+		sdw_dev_dbg_or_err(&slave->dev, ret != -ENODATA,
+				   "SDW_SCP_SYSTEMCTRL write ignored:%d\n", ret);
 
 	return ret;
 }
@@ -907,7 +909,7 @@ static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
 		}
 		val &= SDW_SCP_STAT_CLK_STP_NF;
 		if (!val) {
-			dev_dbg(bus->dev, "clock stop prep/de-prep done slave:%d",
+			dev_dbg(bus->dev, "clock stop prep/de-prep done slave:%d\n",
 				dev_num);
 			return 0;
 		}
@@ -916,7 +918,7 @@ static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
 		retry--;
 	} while (retry);
 
-	dev_err(bus->dev, "clock stop prep/de-prep failed slave:%d",
+	dev_err(bus->dev, "clock stop prep/de-prep failed slave:%d\n",
 		dev_num);
 
 	return -ETIMEDOUT;
@@ -956,19 +958,18 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		slave_mode = sdw_get_clk_stop_mode(slave);
 		slave->curr_clk_stop_mode = slave_mode;
 
-		ret = sdw_slave_clk_stop_callback(slave, slave_mode,
-						  SDW_CLK_PRE_PREPARE);
+		ret = sdw_slave_clk_stop_callback(slave, slave_mode, SDW_CLK_PRE_PREPARE);
 		if (ret < 0) {
-			dev_err(&slave->dev,
-				"pre-prepare failed:%d", ret);
+			sdw_dev_dbg_or_err(&slave->dev, ret != -ENODATA,
+					   "clock stop pre prepare cb failed:%d\n", ret);
 			return ret;
 		}
 
 		ret = sdw_slave_clk_stop_prepare(slave,
 						 slave_mode, true);
 		if (ret < 0) {
-			dev_err(&slave->dev,
-				"pre-prepare failed:%d", ret);
+			sdw_dev_dbg_or_err(&slave->dev, ret != -ENODATA,
+					   "clock stop prepare failed:%d\n", ret);
 			return ret;
 		}
 
@@ -999,13 +1000,11 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 		slave_mode = slave->curr_clk_stop_mode;
 
 		if (slave_mode == SDW_CLK_STOP_MODE1) {
-			ret = sdw_slave_clk_stop_callback(slave,
-							  slave_mode,
-							  SDW_CLK_POST_PREPARE);
-
+			ret = sdw_slave_clk_stop_callback(slave, slave_mode, SDW_CLK_POST_PREPARE);
 			if (ret < 0) {
-				dev_err(&slave->dev,
-					"post-prepare failed:%d", ret);
+				sdw_dev_dbg_or_err(&slave->dev, ret != -ENODATA,
+						   "clock stop post-prepare cb failed:%d\n", ret);
+				return ret;
 			}
 		}
 	}
@@ -1033,12 +1032,8 @@ int sdw_bus_clk_stop(struct sdw_bus *bus)
 	ret = sdw_bwrite_no_pm(bus, SDW_BROADCAST_DEV_NUM,
 			       SDW_SCP_CTRL, SDW_SCP_CTRL_CLK_STP_NOW);
 	if (ret < 0) {
-		if (ret == -ENODATA)
-			dev_dbg(bus->dev,
-				"ClockStopNow Broadcast msg ignored %d", ret);
-		else
-			dev_err(bus->dev,
-				"ClockStopNow Broadcast msg failed %d", ret);
+		sdw_dev_dbg_or_err(bus->dev, ret != -ENODATA,
+				   "ClockStopNow Broadcast msg failed %d\n", ret);
 		return ret;
 	}
 
@@ -1086,26 +1081,24 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 			continue;
 		}
 
-		ret = sdw_slave_clk_stop_callback(slave, mode,
-						  SDW_CLK_PRE_DEPREPARE);
+		ret = sdw_slave_clk_stop_callback(slave, mode, SDW_CLK_PRE_DEPREPARE);
 		if (ret < 0)
-			dev_warn(&slave->dev,
-				 "clk stop deprep failed:%d", ret);
-
-		ret = sdw_slave_clk_stop_prepare(slave, mode,
-						 false);
+			dev_warn(&slave->dev, "clock stop pre deprepare cb failed:%d\n", ret);
 
+		ret = sdw_slave_clk_stop_prepare(slave, mode, false);
 		if (ret < 0)
-			dev_warn(&slave->dev,
-				 "clk stop deprep failed:%d", ret);
+			dev_warn(&slave->dev, "clock stop deprepare failed:%d\n", ret);
 	}
 
 	/* Skip remaining clock stop de-preparation if no Slave is attached */
 	if (!is_slave)
 		return 0;
 
-	if (!simple_clk_stop)
-		sdw_bus_wait_for_clk_prep_deprep(bus, SDW_BROADCAST_DEV_NUM);
+	if (!simple_clk_stop) {
+		ret = sdw_bus_wait_for_clk_prep_deprep(bus, SDW_BROADCAST_DEV_NUM);
+		if (ret < 0)
+			dev_warn(&slave->dev, "clock stop deprepare wait failed:%d\n", ret);
+	}
 
 	list_for_each_entry(slave, &bus->slaves, node) {
 		if (!slave->dev_num)
@@ -1116,8 +1109,9 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 			continue;
 
 		mode = slave->curr_clk_stop_mode;
-		sdw_slave_clk_stop_callback(slave, mode,
-					    SDW_CLK_POST_DEPREPARE);
+		ret = sdw_slave_clk_stop_callback(slave, mode, SDW_CLK_POST_DEPREPARE);
+		if (ret < 0)
+			dev_warn(&slave->dev, "clock stop post deprepare cb failed:%d\n", ret);
 	}
 
 	return 0;
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2A624F9C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 02:32:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05417165E;
	Fri, 11 Nov 2022 02:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05417165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668130327;
	bh=0p3boPfp645wf/wMw+Y2tkE1nhsOJBG7jEtTIrVuN+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UaeRJjlVf0NIdHspHBrSW4AJxLttZ/Aj6L1vvFZ+ERFyCcbyd7GHtAvrZLGLfutdn
	 usOYAY9sNa+HEogQte/8XXzunKxatdTDJYA0O6aZUHSpaqVbK2t9sEBw2AJF0jvID5
	 VbW94pNh9t29k+7xzXQOVPKEJRUuMNIz4ju9XVYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03521F80163;
	Fri, 11 Nov 2022 02:30:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43698F8056F; Fri, 11 Nov 2022 02:30:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6747FF80507
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 02:29:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6747FF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J7+11eWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668130198; x=1699666198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0p3boPfp645wf/wMw+Y2tkE1nhsOJBG7jEtTIrVuN+w=;
 b=J7+11eWy5XCW7dFYz1SBFrqjbFSBjriblpD8GzKpg1pgGOm7pjjx8Dn1
 3oqyKh8Q3HQ5AsTcjj3W4vwFdfMv2Jx+V+KjSeLon0dK25PHZSch/Zhnu
 o45TFS/zFGphYFBgvrVmMboqO+XyXvsbvfFPi75jzQdLnZ0AUBrIcalWe
 pCAnWPXdjw0hdmtuqE0vOtRJdqlm4CBfN1D77m42g5E85HA564gg8o8j7
 cOfNstKVLT5Dp1x9g3Bm/bJMh91yI1Ugo+mzvU2Eau2cIeOAm9tZ4TdY1
 nR8hUmgCS72fy+XolvUE5GmiuxxF+3NCNbhINYOym/Yo+C/qLxhB9ZFHB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397789741"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="397789741"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="780003256"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="780003256"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:54 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/7] soundwire: intel: add link power management callbacks in
 hw_ops
Date: Fri, 11 Nov 2022 09:31:32 +0800
Message-Id: <20221111013135.38289-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111013135.38289-1-yung-chuan.liao@linux.intel.com>
References: <20221111013135.38289-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

No functionality change, only add indirection for link power
management helpers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           | 23 +++++++++++++----------
 drivers/soundwire/intel.h           | 14 ++++++++++++++
 include/linux/soundwire/sdw_intel.h |  5 +++++
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 6d2fdf3a01fd..2320f1b8a2d1 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1434,6 +1434,9 @@ const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops = {
 	.start_bus_after_clock_stop = intel_start_bus_after_clock_stop,
 	.stop_bus = intel_stop_bus,
 
+	.link_power_up = intel_link_power_up,
+	.link_power_down = intel_link_power_down,
+
 	.pre_bank_switch = intel_pre_bank_switch,
 	.post_bank_switch = intel_post_bank_switch,
 };
@@ -1614,7 +1617,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	bus->multi_link = multi_link;
 
 	/* Initialize shim, controller */
-	ret = intel_link_power_up(sdw);
+	ret = sdw_intel_link_power_up(sdw);
 	if (ret)
 		goto err_init;
 
@@ -1679,7 +1682,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	return 0;
 
 err_power_up:
-	intel_link_power_down(sdw);
+	sdw_intel_link_power_down(sdw);
 err_init:
 	return ret;
 }
@@ -1935,7 +1938,7 @@ static int __maybe_unused intel_resume(struct device *dev)
 			pm_runtime_idle(dev);
 	}
 
-	ret = intel_link_power_up(sdw);
+	ret = sdw_intel_link_power_up(sdw);
 	if (ret) {
 		dev_err(dev, "%s failed: %d\n", __func__, ret);
 		return ret;
@@ -1950,7 +1953,7 @@ static int __maybe_unused intel_resume(struct device *dev)
 	ret = sdw_intel_start_bus(sdw);
 	if (ret < 0) {
 		dev_err(dev, "cannot start bus during resume\n");
-		intel_link_power_down(sdw);
+		sdw_intel_link_power_down(sdw);
 		return ret;
 	}
 
@@ -1989,7 +1992,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
 	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_TEARDOWN) {
-		ret = intel_link_power_up(sdw);
+		ret = sdw_intel_link_power_up(sdw);
 		if (ret) {
 			dev_err(dev, "%s: power_up failed after teardown: %d\n", __func__, ret);
 			return ret;
@@ -2004,13 +2007,13 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 		ret = sdw_intel_start_bus(sdw);
 		if (ret < 0) {
 			dev_err(dev, "%s: cannot start bus after teardown: %d\n", __func__, ret);
-			intel_link_power_down(sdw);
+			sdw_intel_link_power_down(sdw);
 			return ret;
 		}
 
 
 	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
-		ret = intel_link_power_up(sdw);
+		ret = sdw_intel_link_power_up(sdw);
 		if (ret) {
 			dev_err(dev, "%s: power_up failed after bus reset: %d\n", __func__, ret);
 			return ret;
@@ -2019,14 +2022,14 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 		ret = sdw_intel_start_bus_after_reset(sdw);
 		if (ret < 0) {
 			dev_err(dev, "%s: cannot start bus after reset: %d\n", __func__, ret);
-			intel_link_power_down(sdw);
+			sdw_intel_link_power_down(sdw);
 			return ret;
 		}
 	} else if (!clock_stop_quirks) {
 
 		sdw_intel_check_clock_stop(sdw);
 
-		ret = intel_link_power_up(sdw);
+		ret = sdw_intel_link_power_up(sdw);
 		if (ret) {
 			dev_err(dev, "%s: power_up failed: %d\n", __func__, ret);
 			return ret;
@@ -2035,7 +2038,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 		ret = sdw_intel_start_bus_after_clock_stop(sdw);
 		if (ret < 0) {
 			dev_err(dev, "%s: cannot start bus after clock stop: %d\n", __func__, ret);
-			intel_link_power_down(sdw);
+			sdw_intel_link_power_down(sdw);
 			return ret;
 		}
 	} else {
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 99a2d875a331..0f63e7584132 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -118,4 +118,18 @@ static inline int sdw_intel_stop_bus(struct sdw_intel *sdw, bool clock_stop)
 	return -ENOTSUPP;
 }
 
+static inline int sdw_intel_link_power_up(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, link_power_up))
+		return SDW_INTEL_OPS(sdw, link_power_up)(sdw);
+	return -ENOTSUPP;
+}
+
+static inline int sdw_intel_link_power_down(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, link_power_down))
+		return SDW_INTEL_OPS(sdw, link_power_down)(sdw);
+	return -ENOTSUPP;
+}
+
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index cee61bc9af8a..81430201b8b9 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -305,6 +305,8 @@ struct sdw_intel;
  * @start_bus_after_reset: start after reset
  * @start_bus_after_clock_stop: start after mode0 clock stop
  * @stop_bus: stop all bus
+ * @link_power_up: power-up using chip-specific helpers
+ * @link_power_down: power-down with chip-specific helpers
  * @pre_bank_switch: helper for bus management
  * @post_bank_switch: helper for bus management
  */
@@ -320,6 +322,9 @@ struct sdw_intel_hw_ops {
 	int (*start_bus_after_clock_stop)(struct sdw_intel *sdw);
 	int (*stop_bus)(struct sdw_intel *sdw, bool clock_stop);
 
+	int (*link_power_up)(struct sdw_intel *sdw);
+	int (*link_power_down)(struct sdw_intel *sdw);
+
 	int (*pre_bank_switch)(struct sdw_intel *sdw);
 	int (*post_bank_switch)(struct sdw_intel *sdw);
 };
-- 
2.25.1


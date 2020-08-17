Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE297247CCD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 05:29:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882A71710;
	Tue, 18 Aug 2020 05:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882A71710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597721353;
	bh=etfkl56KQe+ez+uNofSSt0E2uFYpSFBVEICZWXIAZS4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XuZZpU26Sl4dPYKJZI2N3CBtXndmQdj45rpNOsJwj0i8bQOJV5+WI3oPzV4DYZ2hU
	 fTcGQYrt19DmJUKEBNmRnD645rHUCtboK6Ur2NX0y2x3xuYynPHiYIOwF2MLtqLBt5
	 C3gEsKZULzkc4mVj93+vijE64Dr87/asvEgzTYYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0989CF802EB;
	Tue, 18 Aug 2020 05:23:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55647F802F9; Tue, 18 Aug 2020 05:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9747AF802EB
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 05:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9747AF802EB
IronPort-SDR: xCUW5yKSXQ0qzbPYQGLuGN3k47kNARBD/mD39e4uaKf1kOHSnHNm2XHEyk4LflUnuOX8siymIu
 O2PYSCXDajzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152243035"
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; d="scan'208";a="152243035"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 20:23:40 -0700
IronPort-SDR: 7+T/VzimqoH9vZhbV7cNZfRvEIwnz1po/IwxM/AXvyTpsKntw7xEjMQ7e2EUaIVzn++gnaCtHW
 rjK1jwJw3stw==
X-IronPort-AV: E=Sophos;i="5.76,325,1592895600"; d="scan'208";a="441084628"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 20:23:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 07/12] soundwire: intel: add CLK_STOP_TEARDOWN for
 pm_runtime suspend
Date: Mon, 17 Aug 2020 23:29:18 +0800
Message-Id: <20200817152923.3259-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
References: <20200817152923.3259-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
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

Now that we have options, add support for TEARDOWN mode (same
functionality as existing code)

All other modes will be added in follow-up patches.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c      | 82 +++++++++++++++++++++-------------
 drivers/soundwire/intel.h      |  2 +
 drivers/soundwire/intel_init.c |  1 +
 3 files changed, 54 insertions(+), 31 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 3f9015dcb693..68c1cdfb7999 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1548,6 +1548,7 @@ static int intel_suspend_runtime(struct device *dev)
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
+	u32 clock_stop_quirks;
 	int ret;
 
 	if (bus->prop.hw_disabled) {
@@ -1556,21 +1557,31 @@ static int intel_suspend_runtime(struct device *dev)
 		return 0;
 	}
 
-	ret = sdw_cdns_enable_interrupt(cdns, false);
-	if (ret < 0) {
-		dev_err(dev, "cannot disable interrupts on suspend\n");
-		return ret;
-	}
+	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
-	ret = intel_link_power_down(sdw);
-	if (ret) {
-		dev_err(dev, "Link power down failed: %d", ret);
-		return ret;
-	}
+	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_TEARDOWN) {
+
+		ret = sdw_cdns_enable_interrupt(cdns, false);
+		if (ret < 0) {
+			dev_err(dev, "cannot disable interrupts on suspend\n");
+			return ret;
+		}
 
-	intel_shim_wake(sdw, false);
+		ret = intel_link_power_down(sdw);
+		if (ret) {
+			dev_err(dev, "Link power down failed: %d", ret);
+			return ret;
+		}
+
+		intel_shim_wake(sdw, false);
+
+	} else {
+		dev_err(dev, "%s clock_stop_quirks %x unsupported\n",
+			__func__, clock_stop_quirks);
+		ret = -EINVAL;
+	}
 
-	return 0;
+	return ret;
 }
 
 static int intel_resume(struct device *dev)
@@ -1645,6 +1656,7 @@ static int intel_resume_runtime(struct device *dev)
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
+	u32 clock_stop_quirks;
 	int ret;
 
 	if (bus->prop.hw_disabled) {
@@ -1653,28 +1665,36 @@ static int intel_resume_runtime(struct device *dev)
 		return 0;
 	}
 
-	ret = intel_init(sdw);
-	if (ret) {
-		dev_err(dev, "%s failed: %d", __func__, ret);
-		return ret;
-	}
+	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
-	/*
-	 * make sure all Slaves are tagged as UNATTACHED and provide
-	 * reason for reinitialization
-	 */
-	sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
+	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_TEARDOWN) {
+		ret = intel_init(sdw);
+		if (ret) {
+			dev_err(dev, "%s failed: %d", __func__, ret);
+			return ret;
+		}
 
-	ret = sdw_cdns_enable_interrupt(cdns, true);
-	if (ret < 0) {
-		dev_err(dev, "cannot enable interrupts during resume\n");
-		return ret;
-	}
+		/*
+		 * make sure all Slaves are tagged as UNATTACHED and provide
+		 * reason for reinitialization
+		 */
+		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
 
-	ret = sdw_cdns_exit_reset(cdns);
-	if (ret < 0) {
-		dev_err(dev, "unable to exit bus reset sequence during resume\n");
-		return ret;
+		ret = sdw_cdns_enable_interrupt(cdns, true);
+		if (ret < 0) {
+			dev_err(dev, "cannot enable interrupts during resume\n");
+			return ret;
+		}
+
+		ret = sdw_cdns_exit_reset(cdns);
+		if (ret < 0) {
+			dev_err(dev, "unable to exit bus reset sequence during resume\n");
+			return ret;
+		}
+	} else {
+		dev_err(dev, "%s clock_stop_quirks %x unsupported\n",
+			__func__, clock_stop_quirks);
+		ret = -EINVAL;
 	}
 
 	return ret;
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 4ea3d262d249..23daab9da329 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -17,6 +17,7 @@
  * @dev: device implementing hw_params and free callbacks
  * @shim_lock: mutex to handle access to shared SHIM registers
  * @shim_mask: global pointer to check SHIM register initialization
+ * @clock_stop_quirks: mask defining requested behavior on pm_suspend
  * @cdns: Cadence master descriptor
  * @list: used to walk-through all masters exposed by the same controller
  */
@@ -31,6 +32,7 @@ struct sdw_intel_link_res {
 	struct device *dev;
 	struct mutex *shim_lock; /* protect shared registers */
 	u32 *shim_mask;
+	u32 clock_stop_quirks;
 	struct sdw_cdns *cdns;
 	struct list_head list;
 };
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index a1f210853545..dd1050743dca 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -249,6 +249,7 @@ static struct sdw_intel_ctx
 		link->ops = res->ops;
 		link->dev = res->dev;
 
+		link->clock_stop_quirks = res->clock_stop_quirks;
 		link->shim_lock = &ctx->shim_lock;
 		link->shim_mask = &ctx->shim_mask;
 
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 403473EF843
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 04:52:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D38FE1688;
	Wed, 18 Aug 2021 04:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D38FE1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629255164;
	bh=ldHlrDYWQFsS+C54ne+yk/uxfMX3FyBLOXpu4/5X+KY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V0BbOjGlYzoGPTc4BM7ZsalFHu9TnaO3z0koVsR6ol3GR3QdmZLzPE5PKDrr+rwGF
	 o0ln5JqObwMidKxEpOQMfxZo8rQl3Sr2xMoyy07ZkKS0sUEM041FeCXUliWEdI/v/n
	 tyG5mwJYgHzh6dtmUGAACxFAUhoNPmqJh/ehQSmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7353F80169;
	Wed, 18 Aug 2021 04:50:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63BA7F804E2; Wed, 18 Aug 2021 04:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC195F80169
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 04:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC195F80169
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="213119370"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="213119370"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 19:50:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="520723316"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 19:50:23 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 3/3] soundwire: intel: conditionally exit clock stop mode
 on system suspend
Date: Wed, 18 Aug 2021 10:49:54 +0800
Message-Id: <20210818024954.16873-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818024954.16873-1-yung-chuan.liao@linux.intel.com>
References: <20210818024954.16873-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

Intel stress tests reported issues with the clock stop mode,
specifically when trying to do a system suspend while the link is
already pm_runtime suspended.

In this case, we need to disable the shim wake, but when the PCI
parent device is also pm_runtime suspended the SHIM registers are not
accessible.

Since this is an invalid corner case, this patch suggests a pm_runtime
resume of the entire bus to full power (parent+child devices) before
the system suspend so that the shim wake can be disabled.

Unlike the suspend operation, the .prepare callbacks are propagated
from root device to leaf devices. By adding a .prepare callback at the
SoundWire link level, we can double-check the pm_runtime status of the
device as well as its parent PCI device. When the problematic
configuration is detected, the device is pm_runtime resumed - which by
construction also resume its parent.

An additional loop is added to resume all child devices. In theory we
only need to restart the link, but doing so will also cause the
physical devices to synchronize and re-initialize, while their Linux
devices remain pm_runtime suspended. It's simpler to make sure the
codec devices are fully resumed so that we don't have to deal with
zombie states.

This additional loop could have been avoided by adding a .prepare
callback in SoundWire codec drivers. Functionally this would have been
equivalent. The rationale for implementing a loop at the link level is
only to reduce the amount of code required to deal at the codec level
with an Intel corner case - in other words keep codec drivers
independent from Intel platform-specific programming sequences.

BugLink: https://github.com/thesofproject/linux/issues/2606
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 105 +++++++++++++++++++++++++++++++++-----
 1 file changed, 93 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 8b42053b171f..f66fcbc33a2f 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1596,6 +1596,87 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
  * PM calls
  */
 
+static int intel_resume_child_device(struct device *dev, void *data)
+{
+	int ret;
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+
+	if (!slave->probed) {
+		dev_dbg(dev, "%s: skipping device, no probed driver\n", __func__);
+		return 0;
+	}
+	if (!slave->dev_num_sticky) {
+		dev_dbg(dev, "%s: skipping device, never detected on bus\n", __func__);
+		return 0;
+	}
+
+	ret = pm_request_resume(dev);
+	if (ret < 0)
+		dev_err(dev, "%s: pm_request_resume failed: %d\n", __func__, ret);
+
+	return ret;
+}
+
+static int __maybe_unused intel_pm_prepare(struct device *dev)
+{
+	struct sdw_cdns *cdns = dev_get_drvdata(dev);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	struct sdw_bus *bus = &cdns->bus;
+	u32 clock_stop_quirks;
+	int ret = 0;
+
+	if (bus->prop.hw_disabled || !sdw->startup_done) {
+		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
+			bus->link_id);
+		return 0;
+	}
+
+	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
+
+	if (pm_runtime_suspended(dev) &&
+	    pm_runtime_suspended(dev->parent) &&
+	    ((clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) ||
+	     !clock_stop_quirks)) {
+		/*
+		 * if we've enabled clock stop, and the parent is suspended, the SHIM registers
+		 * are not accessible and the shim wake cannot be disabled.
+		 * The only solution is to resume the entire bus to full power
+		 */
+
+		/*
+		 * If any operation in this block fails, we keep going since we don't want
+		 * to prevent system suspend from happening and errors should be recoverable
+		 * on resume.
+		 */
+
+		/*
+		 * first resume the device for this link. This will also by construction
+		 * resume the PCI parent device.
+		 */
+		ret = pm_request_resume(dev);
+		if (ret < 0) {
+			dev_err(dev, "%s: pm_request_resume failed: %d\n", __func__, ret);
+			return 0;
+		}
+
+		/*
+		 * Continue resuming the entire bus (parent + child devices) to exit
+		 * the clock stop mode. If there are no devices connected on this link
+		 * this is a no-op.
+		 * The resume to full power could have been implemented with a .prepare
+		 * step in SoundWire codec drivers. This would however require a lot
+		 * of code to handle an Intel-specific corner case. It is simpler in
+		 * practice to add a loop at the link level.
+		 */
+		ret = device_for_each_child(bus->dev, NULL, intel_resume_child_device);
+
+		if (ret < 0)
+			dev_err(dev, "%s: intel_resume_child_device failed: %d\n", __func__, ret);
+	}
+
+	return 0;
+}
+
 static int __maybe_unused intel_suspend(struct device *dev)
 {
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
@@ -1615,19 +1696,18 @@ static int __maybe_unused intel_suspend(struct device *dev)
 
 		clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
-		if ((clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET ||
-		     !clock_stop_quirks) &&
-		    !pm_runtime_suspended(dev->parent)) {
+		if ((clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) ||
+		    !clock_stop_quirks) {
 
-			/*
-			 * if we've enabled clock stop, and the parent
-			 * is still active, disable shim wake. The
-			 * SHIM registers are not accessible if the
-			 * parent is already pm_runtime suspended so
-			 * it's too late to change that configuration
-			 */
-
-			intel_shim_wake(sdw, false);
+			if (pm_runtime_suspended(dev->parent)) {
+				/*
+				 * paranoia check: this should not happen with the .prepare
+				 * resume to full power
+				 */
+				dev_err(dev, "%s: invalid config: parent is suspended\n", __func__);
+			} else {
+				intel_shim_wake(sdw, false);
+			}
 		}
 
 		return 0;
@@ -1992,6 +2072,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 }
 
 static const struct dev_pm_ops intel_pm = {
+	.prepare = intel_pm_prepare,
 	SET_SYSTEM_SLEEP_PM_OPS(intel_suspend, intel_resume)
 	SET_RUNTIME_PM_OPS(intel_suspend_runtime, intel_resume_runtime, NULL)
 };
-- 
2.17.1


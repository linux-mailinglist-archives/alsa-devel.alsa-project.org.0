Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4742487DD
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:38:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D1B81772;
	Tue, 18 Aug 2020 16:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D1B81772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761525;
	bh=SFki5N6j7jJaeuC3VI8kaK8+CF5DwHJgK7OcdJR68V8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NLTyDBjXu8nOvMXWKiMKS6RCs51KwB7xbVTMAxPtIDYwUH7+vC755bMm02aHEl8Jm
	 Lg0j0THeA2feMFmVdu64oBb9/b5VN9WICpapUTcKMb7XfFPjE5eTR9WeGJzFunLPzN
	 m1Mt0TUzvpDACBh+pgt80+GDsimPn3oe6FejgLjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB948F802DD;
	Tue, 18 Aug 2020 16:35:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 357A2F802C2; Tue, 18 Aug 2020 16:35:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 029F5F80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 029F5F80114
IronPort-SDR: bYRh3uLwfJuKHJ8CN9Um3EJipnD/luwK+pZp9pkCC8qZRcHJrRfqS3FB/MLMctztqH6e3kVe+1
 S1Q83X8Y97nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219223486"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="219223486"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:26 -0700
IronPort-SDR: MTYXaxlGYh36CC0VKt3NI3NM3kfNAefenASRMLwGCn6FfnXsaHIGulzU5aE9dXDn0JpkS+VLat
 nDj+DYV/YRAg==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471830419"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 03/11] soundwire: intel: add multi-link support
Date: Tue, 18 Aug 2020 10:41:12 +0800
Message-Id: <20200818024120.20721-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
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

The multi-link support is enabled with a hardware gsync signal
connecting all links. All commands and operations which typically are
handled on an SSP boundary will be deferred further and enabled across
all links with the 'syncGo' sequence.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 120 ++++++++++++++++++++++++++++++++++----
 1 file changed, 110 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index c9ba706e20c6..a3aa8ab49285 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -34,6 +34,7 @@
 #define SDW_INTEL_MASTER_DISABLE_PM_RUNTIME		BIT(0)
 #define SDW_INTEL_MASTER_DISABLE_CLOCK_STOP		BIT(1)
 #define SDW_INTEL_MASTER_DISABLE_PM_RUNTIME_IDLE	BIT(2)
+#define SDW_INTEL_MASTER_DISABLE_MULTI_LINK		BIT(3)
 
 static int md_flags;
 module_param_named(sdw_md_flags, md_flags, int, 0444);
@@ -555,6 +556,19 @@ static int intel_shim_sync_go_unlocked(struct sdw_intel *sdw)
 	return ret;
 }
 
+static int intel_shim_sync_go(struct sdw_intel *sdw)
+{
+	int ret;
+
+	mutex_lock(sdw->link_res->shim_lock);
+
+	ret = intel_shim_sync_go_unlocked(sdw);
+
+	mutex_unlock(sdw->link_res->shim_lock);
+
+	return ret;
+}
+
 /*
  * PDI routines
  */
@@ -1303,10 +1317,7 @@ static int intel_init(struct sdw_intel *sdw)
 
 	intel_shim_init(sdw, clock_stop);
 
-	if (clock_stop)
-		return 0;
-
-	return sdw_cdns_init(&sdw->cdns);
+	return 0;
 }
 
 /*
@@ -1372,6 +1383,7 @@ int intel_master_startup(struct platform_device *pdev)
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
 	int link_flags;
+	bool multi_link;
 	u32 clock_stop_quirks;
 	int ret;
 
@@ -1382,7 +1394,16 @@ int intel_master_startup(struct platform_device *pdev)
 		return 0;
 	}
 
-	/* Initialize shim, controller and Cadence IP */
+	link_flags = md_flags >> (bus->link_id * 8);
+	multi_link = !(link_flags & SDW_INTEL_MASTER_DISABLE_MULTI_LINK);
+	if (!multi_link) {
+		dev_dbg(dev, "Multi-link is disabled\n");
+		bus->multi_link = false;
+	} else {
+		bus->multi_link = true;
+	}
+
+	/* Initialize shim, controller */
 	ret = intel_init(sdw);
 	if (ret)
 		goto err_init;
@@ -1401,12 +1422,33 @@ int intel_master_startup(struct platform_device *pdev)
 		goto err_init;
 	}
 
+	/*
+	 * follow recommended programming flows to avoid timeouts when
+	 * gsync is enabled
+	 */
+	if (multi_link)
+		intel_shim_sync_arm(sdw);
+
+	ret = sdw_cdns_init(cdns);
+	if (ret < 0) {
+		dev_err(dev, "unable to initialize Cadence IP\n");
+		goto err_interrupt;
+	}
+
 	ret = sdw_cdns_exit_reset(cdns);
 	if (ret < 0) {
 		dev_err(dev, "unable to exit bus reset sequence\n");
 		goto err_interrupt;
 	}
 
+	if (multi_link) {
+		ret = intel_shim_sync_go(sdw);
+		if (ret < 0) {
+			dev_err(dev, "sync go failed: %d\n", ret);
+			goto err_interrupt;
+		}
+	}
+
 	/* Register DAIs */
 	ret = intel_register_dai(sdw);
 	if (ret) {
@@ -1418,7 +1460,6 @@ int intel_master_startup(struct platform_device *pdev)
 	intel_debugfs_init(sdw);
 
 	/* Enable runtime PM */
-	link_flags = md_flags >> (bus->link_id * 8);
 	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME)) {
 		pm_runtime_set_autosuspend_delay(dev,
 						 INTEL_MASTER_SUSPEND_DELAY_MS);
@@ -1654,6 +1695,7 @@ static int intel_resume(struct device *dev)
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
 	int link_flags;
+	bool multi_link;
 	int ret;
 
 	if (bus->prop.hw_disabled) {
@@ -1662,6 +1704,9 @@ static int intel_resume(struct device *dev)
 		return 0;
 	}
 
+	link_flags = md_flags >> (bus->link_id * 8);
+	multi_link = !(link_flags & SDW_INTEL_MASTER_DISABLE_MULTI_LINK);
+
 	if (pm_runtime_suspended(dev)) {
 		dev_dbg(dev, "%s: pm_runtime status was suspended, forcing active\n", __func__);
 
@@ -1672,6 +1717,7 @@ static int intel_resume(struct device *dev)
 		pm_runtime_enable(dev);
 
 		link_flags = md_flags >> (bus->link_id * 8);
+
 		if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME_IDLE))
 			pm_runtime_idle(dev);
 	}
@@ -1694,12 +1740,33 @@ static int intel_resume(struct device *dev)
 		return ret;
 	}
 
+	/*
+	 * follow recommended programming flows to avoid timeouts when
+	 * gsync is enabled
+	 */
+	if (multi_link)
+		intel_shim_sync_arm(sdw);
+
+	ret = sdw_cdns_init(&sdw->cdns);
+	if (ret < 0) {
+		dev_err(dev, "unable to initialize Cadence IP during resume\n");
+		return ret;
+	}
+
 	ret = sdw_cdns_exit_reset(cdns);
 	if (ret < 0) {
 		dev_err(dev, "unable to exit bus reset sequence during resume\n");
 		return ret;
 	}
 
+	if (multi_link) {
+		ret = intel_shim_sync_go(sdw);
+		if (ret < 0) {
+			dev_err(dev, "sync go failed during resume\n");
+			return ret;
+		}
+	}
+
 	/*
 	 * after system resume, the pm_runtime suspend() may kick in
 	 * during the enumeration, before any children device force the
@@ -1722,6 +1789,8 @@ static int intel_resume_runtime(struct device *dev)
 	struct sdw_bus *bus = &cdns->bus;
 	u32 clock_stop_quirks;
 	bool clock_stop0;
+	int link_flags;
+	bool multi_link;
 	int status;
 	int ret;
 
@@ -1731,6 +1800,9 @@ static int intel_resume_runtime(struct device *dev)
 		return 0;
 	}
 
+	link_flags = md_flags >> (bus->link_id * 8);
+	multi_link = !(link_flags & SDW_INTEL_MASTER_DISABLE_MULTI_LINK);
+
 	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
 	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_TEARDOWN) {
@@ -1752,11 +1824,32 @@ static int intel_resume_runtime(struct device *dev)
 			return ret;
 		}
 
+		/*
+		 * follow recommended programming flows to avoid
+		 * timeouts when gsync is enabled
+		 */
+		if (multi_link)
+			intel_shim_sync_arm(sdw);
+
+		ret = sdw_cdns_init(&sdw->cdns);
+		if (ret < 0) {
+			dev_err(dev, "unable to initialize Cadence IP during resume\n");
+			return ret;
+		}
+
 		ret = sdw_cdns_exit_reset(cdns);
 		if (ret < 0) {
 			dev_err(dev, "unable to exit bus reset sequence during resume\n");
 			return ret;
 		}
+
+		if (multi_link) {
+			ret = intel_shim_sync_go(sdw);
+			if (ret < 0) {
+				dev_err(dev, "sync go failed during resume\n");
+				return ret;
+			}
+		}
 	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
 		ret = intel_init(sdw);
 		if (ret) {
@@ -1773,11 +1866,18 @@ static int intel_resume_runtime(struct device *dev)
 		 */
 		clock_stop0 = sdw_cdns_is_clock_stop(&sdw->cdns);
 
-		/*
-		 * make sure all Slaves are tagged as UNATTACHED and
-		 * provide reason for reinitialization
-		 */
 		if (!clock_stop0) {
+
+			/*
+			 * Re-initialize the IP since it was powered-off
+			 */
+			sdw_cdns_init(&sdw->cdns);
+
+			/*
+			 * make sure all Slaves are tagged as UNATTACHED and
+			 * provide reason for reinitialization
+			 */
+
 			status = SDW_UNATTACH_REQUEST_MASTER_RESET;
 			sdw_clear_slave_status(bus, status);
 		}
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E84707801
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 04:22:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4123741;
	Thu, 18 May 2023 04:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4123741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684376572;
	bh=sNFf0anZ290+Br3dbHkevwq9kWheG2VgMEYEnF9HzNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ubnCNIMY8Nan6sGaOsdh6wM11uaMfFQ2EYn9onAwvRrPB498xlgm3FrPE0Sdm7NDT
	 zQTABbWoRfZCStOzF7aLjoc0sGtEfqQ4f58DJYL9VX3QKSLHlLxT6dtt0h1SEVmSdX
	 1zEOeXQhcTqGdJabwdBk35Z6YQ08odo9fbE2NzqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1F70F805A1; Thu, 18 May 2023 04:21:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93E29F8057E;
	Thu, 18 May 2023 04:21:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51F15F80549; Thu, 18 May 2023 04:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8718F80272
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 04:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8718F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fRbj1WiB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684376445; x=1715912445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sNFf0anZ290+Br3dbHkevwq9kWheG2VgMEYEnF9HzNg=;
  b=fRbj1WiBJMacSKh9ZpiBsTxpq2HzkNdIleyJz+gjQgG+HgVRNHrYmbW6
   u4JSxjSI4Lg/7w+fvtNw0Sh5GVeBwnLGYuwS+yVDMY2NxVc7ipVu7+XU2
   FSapHQdxqnujHhx3zRjJg7Dp9XWWkKC2sDXBjkNzPIQWtdoeStwUHpZIj
   hHyhJcmCX0zEAEV/foIp0s8X+WLCaEdQqms3XFtjm5URxdCHB1ie49lAe
   n0d43dpcaZVmoXQmQbP36s9u//JE5TS7TwNH1BiwlKkomXKRqHDgTtCXl
   yc/DkjBVdWW0+zxXVm7fUNSn2E/QlqBs3yLtOh5d51tSPX8LI28LJqwEY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336504766"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="336504766"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="826195213"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="826195213"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 19:20:33 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/3] soundwire: intel_bus_common: enable interrupts last
Date: Thu, 18 May 2023 10:41:17 +0800
Message-Id: <20230518024119.164160-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518024119.164160-1-yung-chuan.liao@linux.intel.com>
References: <20230518024119.164160-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MEGXQMCHBC2URMUKPBDGLJFUVJ73T4S4
X-Message-ID-Hash: MEGXQMCHBC2URMUKPBDGLJFUVJ73T4S4
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEGXQMCHBC2URMUKPBDGLJFUVJ73T4S4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

It's not clear why we enabled interrupts in the Cadence IP first. The
logical programming sequence should be to first start the bus, and
only second to enable the interrupts.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_bus_common.c | 61 +++++++++++++---------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/intel_bus_common.c b/drivers/soundwire/intel_bus_common.c
index f180e3bea989..901d4f5736c1 100644
--- a/drivers/soundwire/intel_bus_common.c
+++ b/drivers/soundwire/intel_bus_common.c
@@ -16,12 +16,6 @@ int intel_start_bus(struct sdw_intel *sdw)
 	struct sdw_bus *bus = &cdns->bus;
 	int ret;
 
-	ret = sdw_cdns_enable_interrupt(cdns, true);
-	if (ret < 0) {
-		dev_err(dev, "%s: cannot enable interrupts: %d\n", __func__, ret);
-		return ret;
-	}
-
 	/*
 	 * follow recommended programming flows to avoid timeouts when
 	 * gsync is enabled
@@ -32,30 +26,33 @@ int intel_start_bus(struct sdw_intel *sdw)
 	ret = sdw_cdns_init(cdns);
 	if (ret < 0) {
 		dev_err(dev, "%s: unable to initialize Cadence IP: %d\n", __func__, ret);
-		goto err_interrupt;
+		return ret;
 	}
 
 	ret = sdw_cdns_exit_reset(cdns);
 	if (ret < 0) {
 		dev_err(dev, "%s: unable to exit bus reset sequence: %d\n", __func__, ret);
-		goto err_interrupt;
+		return ret;
 	}
 
 	if (bus->multi_link) {
 		ret = sdw_intel_sync_go(sdw);
 		if (ret < 0) {
 			dev_err(dev, "%s: sync go failed: %d\n", __func__, ret);
-			goto err_interrupt;
+			return ret;
 		}
 	}
+
+	ret = sdw_cdns_enable_interrupt(cdns, true);
+	if (ret < 0) {
+		dev_err(dev, "%s: cannot enable interrupts: %d\n", __func__, ret);
+		return ret;
+	}
+
 	sdw_cdns_check_self_clearing_bits(cdns, __func__,
 					  true, INTEL_MASTER_RESET_ITERATIONS);
 
 	return 0;
-
-err_interrupt:
-	sdw_cdns_enable_interrupt(cdns, false);
-	return ret;
 }
 
 int intel_start_bus_after_reset(struct sdw_intel *sdw)
@@ -86,12 +83,6 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw)
 		status = SDW_UNATTACH_REQUEST_MASTER_RESET;
 		sdw_clear_slave_status(bus, status);
 
-		ret = sdw_cdns_enable_interrupt(cdns, true);
-		if (ret < 0) {
-			dev_err(dev, "cannot enable interrupts during resume\n");
-			return ret;
-		}
-
 		/*
 		 * follow recommended programming flows to avoid
 		 * timeouts when gsync is enabled
@@ -115,31 +106,36 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw)
 	ret = sdw_cdns_clock_restart(cdns, !clock_stop0);
 	if (ret < 0) {
 		dev_err(dev, "unable to restart clock during resume\n");
-		goto err_interrupt;
+		if (!clock_stop0)
+			sdw_cdns_enable_interrupt(cdns, false);
+		return ret;
 	}
 
 	if (!clock_stop0) {
 		ret = sdw_cdns_exit_reset(cdns);
 		if (ret < 0) {
 			dev_err(dev, "unable to exit bus reset sequence during resume\n");
-			goto err_interrupt;
+			return ret;
 		}
 
 		if (bus->multi_link) {
 			ret = sdw_intel_sync_go(sdw);
 			if (ret < 0) {
 				dev_err(sdw->cdns.dev, "sync go failed during resume\n");
-				goto err_interrupt;
+				return ret;
 			}
 		}
+
+		ret = sdw_cdns_enable_interrupt(cdns, true);
+		if (ret < 0) {
+			dev_err(dev, "cannot enable interrupts during resume\n");
+			return ret;
+		}
+
 	}
 	sdw_cdns_check_self_clearing_bits(cdns, __func__, true, INTEL_MASTER_RESET_ITERATIONS);
 
 	return 0;
-
-err_interrupt:
-	sdw_cdns_enable_interrupt(cdns, false);
-	return ret;
 }
 
 void intel_check_clock_stop(struct sdw_intel *sdw)
@@ -158,16 +154,15 @@ int intel_start_bus_after_clock_stop(struct sdw_intel *sdw)
 	struct sdw_cdns *cdns = &sdw->cdns;
 	int ret;
 
-	ret = sdw_cdns_enable_interrupt(cdns, true);
-	if (ret < 0) {
-		dev_err(dev, "%s: cannot enable interrupts: %d\n", __func__, ret);
-		return ret;
-	}
-
 	ret = sdw_cdns_clock_restart(cdns, false);
 	if (ret < 0) {
 		dev_err(dev, "%s: unable to restart clock: %d\n", __func__, ret);
-		sdw_cdns_enable_interrupt(cdns, false);
+		return ret;
+	}
+
+	ret = sdw_cdns_enable_interrupt(cdns, true);
+	if (ret < 0) {
+		dev_err(dev, "%s: cannot enable interrupts: %d\n", __func__, ret);
 		return ret;
 	}
 
-- 
2.25.1


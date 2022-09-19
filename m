Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F76A5BD436
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 19:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32DF0161E;
	Mon, 19 Sep 2022 19:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32DF0161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663610102;
	bh=c6tZxuELr4NSU9kuMAkq1H8+mPlH4jFBJzfU4tnhLOg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kXtNYF9QCiRL03gxuRrBwzcc+GjyG2bM5W9Ktwr8STIwcbDAJqdGB8bBX1JPtOgij
	 VSOWDCJdrOWpTjyA9T4UOcm/aVdWPKWLFVqu6t3/qVgiwEPzkCkEigjf482NKqvI70
	 1FMz8Vv8ecEMlFQhpF7OwFlQ0wT0nMcQqJ6RoL1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFEE6F805A9;
	Mon, 19 Sep 2022 19:51:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 272BEF80579; Mon, 19 Sep 2022 19:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 878C8F800C9
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 19:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 878C8F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YRhBLZil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663609864; x=1695145864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c6tZxuELr4NSU9kuMAkq1H8+mPlH4jFBJzfU4tnhLOg=;
 b=YRhBLZilXeOkhyUjI5eyxe3rJRTkAzAHm0sAdoLqagp93XctKX1jDCBy
 EApoTsBKoVmrXwBWHgBAi6nBt8Tqtu+zfwK5klM2mHFFF7/cMbPL+jcSf
 RY5MUPsRFsWzWozH5v7+rryPGvRinDbBCPayT6r5nHqKgMqZdD3sF5fIN
 qY1cli0E6ZlDCGqrpDwjFbpnNmr5N1gsTPIaQ/8HYg9NFWBO1ZLoKM74h
 LOG28cQc7EOHDdYOe1BScCUgkuSF/mGsigPqWF+jt6l+QAesN2qpGCpuh
 Jp27XuqAjKMTO7kkpIEsET0l9LkKk7Z4XE+m7CJVDFKUfYBQXhjga3GWu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282498883"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="282498883"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:51:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; d="scan'208";a="863658636"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 10:50:59 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 11/11] soundwire: intel: add helper to stop bus
Date: Tue, 20 Sep 2022 01:57:21 +0800
Message-Id: <20220919175721.354679-12-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
References: <20220919175721.354679-1-yung-chuan.liao@linux.intel.com>
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

We have three nearly identical sequences to stop the clock, let's
introduce a helper to reuse the same code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 83 +++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index abe14436d874..15fe083e0402 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1391,6 +1391,38 @@ static int intel_start_bus_after_clock_stop(struct sdw_intel *sdw)
 	return 0;
 }
 
+static int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop)
+{
+	struct device *dev = sdw->cdns.dev;
+	struct sdw_cdns *cdns = &sdw->cdns;
+	bool wake_enable = false;
+	int ret;
+
+	if (clock_stop) {
+		ret = sdw_cdns_clock_stop(cdns, true);
+		if (ret < 0)
+			dev_err(dev, "%s: cannot stop clock: %d\n", __func__, ret);
+		else
+			wake_enable = true;
+	}
+
+	ret = sdw_cdns_enable_interrupt(cdns, false);
+	if (ret < 0) {
+		dev_err(dev, "%s: cannot disable interrupts: %d\n", __func__, ret);
+		return ret;
+	}
+
+	ret = intel_link_power_down(sdw);
+	if (ret) {
+		dev_err(dev, "%s: Link power down failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	intel_shim_wake(sdw, wake_enable);
+
+	return 0;
+}
+
 static int sdw_master_read_intel_prop(struct sdw_bus *bus)
 {
 	struct sdw_master_prop *prop = &bus->prop;
@@ -1790,20 +1822,12 @@ static int __maybe_unused intel_suspend(struct device *dev)
 		return 0;
 	}
 
-	ret = sdw_cdns_enable_interrupt(cdns, false);
+	ret = intel_stop_bus(sdw, false);
 	if (ret < 0) {
-		dev_err(dev, "cannot disable interrupts on suspend\n");
+		dev_err(dev, "%s: cannot stop bus: %d\n", __func__, ret);
 		return ret;
 	}
 
-	ret = intel_link_power_down(sdw);
-	if (ret) {
-		dev_err(dev, "Link power down failed: %d\n", ret);
-		return ret;
-	}
-
-	intel_shim_wake(sdw, false);
-
 	return 0;
 }
 
@@ -1824,44 +1848,19 @@ static int __maybe_unused intel_suspend_runtime(struct device *dev)
 	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
 	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_TEARDOWN) {
-
-		ret = sdw_cdns_enable_interrupt(cdns, false);
+		ret = intel_stop_bus(sdw, false);
 		if (ret < 0) {
-			dev_err(dev, "cannot disable interrupts on suspend\n");
+			dev_err(dev, "%s: cannot stop bus during teardown: %d\n",
+				__func__, ret);
 			return ret;
 		}
-
-		ret = intel_link_power_down(sdw);
-		if (ret) {
-			dev_err(dev, "Link power down failed: %d\n", ret);
-			return ret;
-		}
-
-		intel_shim_wake(sdw, false);
-
-	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET ||
-		   !clock_stop_quirks) {
-		bool wake_enable = true;
-
-		ret = sdw_cdns_clock_stop(cdns, true);
-		if (ret < 0) {
-			dev_err(dev, "cannot enable clock stop on suspend\n");
-			wake_enable = false;
-		}
-
-		ret = sdw_cdns_enable_interrupt(cdns, false);
+	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET || !clock_stop_quirks) {
+		ret = intel_stop_bus(sdw, true);
 		if (ret < 0) {
-			dev_err(dev, "cannot disable interrupts on suspend\n");
-			return ret;
-		}
-
-		ret = intel_link_power_down(sdw);
-		if (ret) {
-			dev_err(dev, "Link power down failed: %d\n", ret);
+			dev_err(dev, "%s: cannot stop bus during clock_stop: %d\n",
+				__func__, ret);
 			return ret;
 		}
-
-		intel_shim_wake(sdw, wake_enable);
 	} else {
 		dev_err(dev, "%s clock_stop_quirks %x unsupported\n",
 			__func__, clock_stop_quirks);
-- 
2.25.1


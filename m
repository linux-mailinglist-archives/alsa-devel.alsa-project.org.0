Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F62487DF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 766D7175F;
	Tue, 18 Aug 2020 16:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 766D7175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761568;
	bh=7MQC96MJjvt/2ZZRzG17Z3jxwXKmYK6OmTJBk/Pow5o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IjUPlfEV8S4HH4cg1s6Nr1S5AiOBCWgiYJdfHXGfIB5ZV5hmHlQwC6yqoEkmTpS8S
	 v0lg73ldU1p4cLhd/GbmrPha6eRn43bTE5yvcq3Q+bi//qRWHYVEdku5N6JcQIoVV4
	 2xpjnVaw/89rsCao9ndYtAElxul2ic10vBmofv0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AD31F802E1;
	Tue, 18 Aug 2020 16:35:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 534A5F802E0; Tue, 18 Aug 2020 16:35:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76294F8029A
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76294F8029A
IronPort-SDR: K7CkCTOR63HkRK3G6WQYtHZ6/zkGYWiSCH3gUFAsX5gYGbYotVHWFP2TcpkEz9u1jCRHNr8qu4
 vBhRe8cxP67Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219223494"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="219223494"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:30 -0700
IronPort-SDR: FFmnMyYXxJ9CjrIDvwTB3+ecLoNwBvQnOICNheJgJ8ev/SrTfF03Jdp8bx+QN8+mMkFmg+W3Yw
 JS22fUDWsESg==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471830485"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 04/11] soundwire: intel: add missing support for all clock
 stop modes
Date: Tue, 18 Aug 2020 10:41:13 +0800
Message-Id: <20200818024120.20721-5-yung-chuan.liao@linux.intel.com>
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

Deal with the BUS_RESET case, which is the default. The only change is
to add support for the exit sequence using the syncArm/syncGo mode for
the exit reset sequence.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 49 +++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index a3aa8ab49285..f4441684bd7e 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1868,11 +1868,6 @@ static int intel_resume_runtime(struct device *dev)
 
 		if (!clock_stop0) {
 
-			/*
-			 * Re-initialize the IP since it was powered-off
-			 */
-			sdw_cdns_init(&sdw->cdns);
-
 			/*
 			 * make sure all Slaves are tagged as UNATTACHED and
 			 * provide reason for reinitialization
@@ -1880,13 +1875,31 @@ static int intel_resume_runtime(struct device *dev)
 
 			status = SDW_UNATTACH_REQUEST_MASTER_RESET;
 			sdw_clear_slave_status(bus, status);
-		}
 
+			ret = sdw_cdns_enable_interrupt(cdns, true);
+			if (ret < 0) {
+				dev_err(dev, "cannot enable interrupts during resume\n");
+				return ret;
+			}
 
-		ret = sdw_cdns_enable_interrupt(cdns, true);
-		if (ret < 0) {
-			dev_err(dev, "cannot enable interrupts during resume\n");
-			return ret;
+			/*
+			 * follow recommended programming flows to avoid
+			 * timeouts when gsync is enabled
+			 */
+			if (multi_link)
+				intel_shim_sync_arm(sdw);
+
+			/*
+			 * Re-initialize the IP since it was powered-off
+			 */
+			sdw_cdns_init(&sdw->cdns);
+
+		} else {
+			ret = sdw_cdns_enable_interrupt(cdns, true);
+			if (ret < 0) {
+				dev_err(dev, "cannot enable interrupts during resume\n");
+				return ret;
+			}
 		}
 
 		ret = sdw_cdns_clock_restart(cdns, !clock_stop0);
@@ -1894,6 +1907,22 @@ static int intel_resume_runtime(struct device *dev)
 			dev_err(dev, "unable to restart clock during resume\n");
 			return ret;
 		}
+
+		if (!clock_stop0) {
+			ret = sdw_cdns_exit_reset(cdns);
+			if (ret < 0) {
+				dev_err(dev, "unable to exit bus reset sequence during resume\n");
+				return ret;
+			}
+
+			if (multi_link) {
+				ret = intel_shim_sync_go(sdw);
+				if (ret < 0) {
+					dev_err(sdw->cdns.dev, "sync go failed during resume\n");
+					return ret;
+				}
+			}
+		}
 	} else if (!clock_stop_quirks) {
 		ret = intel_init(sdw);
 		if (ret) {
-- 
2.17.1


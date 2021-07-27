Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44B3D6E80
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 07:59:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2BCD1EED;
	Tue, 27 Jul 2021 07:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2BCD1EED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627365542;
	bh=RuBzuG8/EjmDuSelbknJJndCn700nyrXWZ2G8Fjzpqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a1ojaHNtcuOGDuyx+c0SrsDYUuZxRW8Z7Kv/EMz7Bhf+Izih6/FwJlbCNutPWetXH
	 G7bJOtSA76I7DExQFprSX0Ez1r/BCm2coGSNcm7ct30d2bnOO8TvEYn/R3mCPeGP/0
	 0me3GbdR/iZs8+lBuaZVLpwS0x4W4wm/PrV9YpfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B72CCF804E1;
	Tue, 27 Jul 2021 07:56:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CC3BF8026C; Tue, 27 Jul 2021 07:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E8B3F804AF
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 07:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E8B3F804AF
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="276163952"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="276163952"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 22:56:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="474302633"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 22:56:23 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 4/4] soundwire: intel: simplify pm_runtime handling in
 suspend/resume
Date: Tue, 27 Jul 2021 13:56:08 +0800
Message-Id: <20210727055608.30247-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
References: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

Since we've introduced a .prepare callback that brings all devices to
full power on S state transitions if the clock-stop mode was used, we
no longer need to special-case when the device was pm_runtime
suspended.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 9d05e158fe0e..ec8d6fcbfc9e 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1610,19 +1610,9 @@ static int __maybe_unused intel_suspend(struct device *dev)
 
 		clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
-		if ((clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET ||
-		     !clock_stop_quirks) &&
-		    !pm_runtime_suspended(dev->parent)) {
-
-			/*
-			 * if we've enabled clock stop, and the parent
-			 * is still active, disable shim wake. The
-			 * SHIM registers are not accessible if the
-			 * parent is already pm_runtime suspended so
-			 * it's too late to change that configuration
-			 */
-
-			intel_shim_wake(sdw, false);
+		if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET || !clock_stop_quirks) {
+			/* this should not happen but throw a log in case of a broken sequence */
+			dev_err(dev, "%s: pm_runtime status is suspended with clock-stop mode\n", __func__);
 		}
 
 		return 0;
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B842D3AE2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 06:40:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6757616D1;
	Wed,  9 Dec 2020 06:39:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6757616D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607492402;
	bh=aISKvo8JlFBoMC4eYBvM6ydr/KH8piLRGBti/vLcCJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRIXIqUem7phyNPoEmYjN2X1gBmHs1fV4shChuSYeqah9Ww1bNgCvY9Z1FtnDWKLD
	 Uurn/4MsH7BpDfP7dzV1UUMdeZtVzS6x7Ap/S/lyCXO3vQ3xL4Y7HPSRZU0dO1PkbR
	 Z4VHNXbYshcqF98RMcbEKoqXaPy1Ru+1X/k8RG6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B9F8F80507;
	Wed,  9 Dec 2020 06:35:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04A2CF804FF; Wed,  9 Dec 2020 06:35:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33FA1F804FB
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 06:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33FA1F804FB
IronPort-SDR: 6UaHJC2t+fWVNLJo7WBGOMR4OD07t5cx7CNJLEDzZopQ+MixwO0mTnS9nvS1anVMxRXO8y0NtC
 CiqvTpj/PpyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153259039"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="153259039"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:39 -0800
IronPort-SDR: bYWD716k4cDeCfx91pPFLM43ykGeJlEJn7Nq7KfuCSMmBAp43mQFYY8alDM3yi6q62bbpaBIbJ
 C+FAgUW5j//A==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="363989593"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:36 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 8/9] soundwire: bus: fix confusion on device used by
 pm_runtime
Date: Wed,  9 Dec 2020 13:34:58 +0800
Message-Id: <20201209053459.5515-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
References: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

Intel stress-tests routinely report IO timeouts and invalid power
management transitions. Upon further analysis, we seem to be using the
wrong devices in pm_runtime calls.

Before reading and writing registers, we first need to make sure the
Slave is fully resumed. The existing code attempts to do such that,
however because of a confusion dating from 2017 and copy/paste, we
end-up resuming the parent only instead of resuming the codec device.

This can lead to accesses to the Slave registers while the bus is
still being configured and the Slave not enumerated, and as a result
IO errors occur.

This is a classic problem, similar confusions happened for HDaudio
between bus and codec device, leading to power management issues.

Fix by using the relevant device for all uses of pm_runtime functions.

Fixes: 60ee9be255712 ('soundwire: bus: add PM/no-PM versions of read/write functions')
Fixes: aa79293517b39 ('soundwire: bus: fix io error when processing alert event')
Fixes: 9d715fa005ebc ('soundwire: Add IO transfer')
Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4eaeeb4090f0..7c4717dd9a34 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -513,16 +513,16 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(slave->bus->dev);
+	ret = pm_runtime_get_sync(&slave->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_noidle(slave->bus->dev);
+		pm_runtime_put_noidle(&slave->dev);
 		return ret;
 	}
 
 	ret = sdw_nread_no_pm(slave, addr, count, val);
 
-	pm_runtime_mark_last_busy(slave->bus->dev);
-	pm_runtime_put(slave->bus->dev);
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put(&slave->dev);
 
 	return ret;
 }
@@ -539,16 +539,16 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(slave->bus->dev);
+	ret = pm_runtime_get_sync(&slave->dev);
 	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_put_noidle(slave->bus->dev);
+		pm_runtime_put_noidle(&slave->dev);
 		return ret;
 	}
 
 	ret = sdw_nwrite_no_pm(slave, addr, count, val);
 
-	pm_runtime_mark_last_busy(slave->bus->dev);
-	pm_runtime_put(slave->bus->dev);
+	pm_runtime_mark_last_busy(&slave->dev);
+	pm_runtime_put(&slave->dev);
 
 	return ret;
 }
@@ -1453,7 +1453,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	ret = pm_runtime_get_sync(&slave->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
-		pm_runtime_put_noidle(slave->bus->dev);
+		pm_runtime_put_noidle(&slave->dev);
 		return ret;
 	}
 
-- 
2.17.1


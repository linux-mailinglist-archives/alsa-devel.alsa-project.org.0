Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4FF2FFD1B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:10:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FEF11AB7;
	Fri, 22 Jan 2021 08:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FEF11AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611299451;
	bh=aISKvo8JlFBoMC4eYBvM6ydr/KH8piLRGBti/vLcCJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBsn17LUTpJqkRz6PUXM69o+pMIsMcx0na3PIVEtDmX0NRaeBoYWjuAS0TOMhQGfw
	 0q+OiClcvn+WURxN8Ajsa36hVt1Ci2wL/Qk/3U6RWgyUoJpEb7Xm+/Immm0rJyT1yC
	 j5UbdNc5QRCjeToDh+ugIA8kA1powHmOZLzWQXw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA489F80508;
	Fri, 22 Jan 2021 08:07:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCAC2F80508; Fri, 22 Jan 2021 08:07:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55627F804E2
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 08:07:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55627F804E2
IronPort-SDR: c8bR+44hB9yfcjaWlu2vGT7y7uPL5JM2UTO1d9QI835bn+3TOtfX5/3o/rICxhpAd6EBgBIRVg
 xVvdpdvpGgFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="158581074"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="158581074"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 23:07:01 -0800
IronPort-SDR: gVId4Dm6yjVptWTSN4ZBxZE2u2jLuFalRA5AEOHGwnkkVOMNVvHE+L2383+RuDkmJrKhWq2tMh
 CRxt6CH2bRaQ==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="427863882"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 23:06:58 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v2 8/9] soundwire: bus: fix confusion on device used by
 pm_runtime
Date: Fri, 22 Jan 2021 15:06:33 +0800
Message-Id: <20210122070634.12825-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122070634.12825-1-yung-chuan.liao@linux.intel.com>
References: <20210122070634.12825-1-yung-chuan.liao@linux.intel.com>
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


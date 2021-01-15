Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C222F7249
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 06:40:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEB9E17AB;
	Fri, 15 Jan 2021 06:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEB9E17AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610689223;
	bh=xDdaMpsrhypGgPrbwSWXy9SXsnGx822B3kjVDXEQaVc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V+t+HbgXtXM0MMGEII+7ZXeb++X1/FPDJ44OZnsxjrdmfIGDyfm72bLGzw1Q8r/3v
	 +gI1eMSKPSoohGR7tByZUSwXRbaa0TqJinpFG2NpCrOWdR+Ba0/8zGaUTMd3QWhyBx
	 h5mJv/cuSput8ULdVH7iu4YAEP8w/Far9vwrRWjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F2CF8026D;
	Fri, 15 Jan 2021 06:38:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 952C0F8026D; Fri, 15 Jan 2021 06:37:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 118ADF8016D
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 06:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 118ADF8016D
IronPort-SDR: 4+Io7e8buTpH9+ypAYvZFZL+fzZ9ANCSBAsMK9KqATX9QaS4ZbFbLmE2+Ew5xYBqgrPJAiIDbv
 MZU+5Jd9OP4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240046286"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="240046286"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:44 -0800
IronPort-SDR: /GwyB3ZhDVFPjQQD538msaTKkPOXuHPagHUk6ZCzHmQjuFKgZq1raBT/Ab1QrxHrdW/lyUJA93
 sccCqziEf4/Q==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="382542441"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:41 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/5] soundwire: cadence: add status in dev_dbg 'State change'
 log
Date: Fri, 15 Jan 2021 13:37:35 +0800
Message-Id: <20210115053738.22630-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
References: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
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

The existing debug log only mentions a state change, without providing
any details. For integration and stress-tests, it's helpful to see in
the dmesg log the reason for the state change.

The value is intended for power users and isn't converted as
human-readable values. But for the record each device has a 4-bit
status:

BIT(0): Unattached
BIT(1): Attached
BIT(2): Alert
BIT(3): Reserved (should not happen)

Example:

[  121.891288] intel-sdw intel-sdw.0: Slave status change: 0x2

<< this shows a Device0 Attached

[  121.891295] soundwire sdw-master-0: Slave attached, programming device number
[  121.891629] soundwire sdw-master-0: SDW Slave Addr: 30025d071101
[  121.891632] soundwire sdw-master-0: SDW Slave class_id 1, part_id 711, mfg_id 25d, unique_id 0, version 3
[  121.892011] intel-sdw intel-sdw.0: Msg ignored for Slave 0
[  121.892013] soundwire sdw-master-0: No more devices to enumerate
[  121.892200] intel-sdw intel-sdw.0: Slave status change: 0x21

<< this shows the device now Attached as Device1 and Unattached as
Device0, i.e. a successful enumeration.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 9fa55164354a..801e1fef59d8 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -734,21 +734,18 @@ static void cdns_read_response(struct sdw_cdns *cdns)
 }
 
 static int cdns_update_slave_status(struct sdw_cdns *cdns,
-				    u32 slave0, u32 slave1)
+				    u64 slave_intstat)
 {
 	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
 	bool is_slave = false;
-	u64 slave;
 	u32 mask;
 	int i, set_status;
 
-	/* combine the two status */
-	slave = ((u64)slave1 << 32) | slave0;
 	memset(status, 0, sizeof(status));
 
 	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
-		mask = (slave >> (i * CDNS_MCP_SLAVE_STATUS_NUM)) &
-				CDNS_MCP_SLAVE_STATUS_BITS;
+		mask = (slave_intstat >> (i * CDNS_MCP_SLAVE_STATUS_NUM)) &
+			CDNS_MCP_SLAVE_STATUS_BITS;
 		if (!mask)
 			continue;
 
@@ -918,13 +915,17 @@ static void cdns_update_slave_status_work(struct work_struct *work)
 	struct sdw_cdns *cdns =
 		container_of(work, struct sdw_cdns, work);
 	u32 slave0, slave1;
-
-	dev_dbg_ratelimited(cdns->dev, "Slave status change\n");
+	u64 slave_intstat;
 
 	slave0 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT0);
 	slave1 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);
 
-	cdns_update_slave_status(cdns, slave0, slave1);
+	/* combine the two status */
+	slave_intstat = ((u64)slave1 << 32) | slave0;
+
+	dev_dbg_ratelimited(cdns->dev, "Slave status change: 0x%llx\n", slave_intstat);
+
+	cdns_update_slave_status(cdns, slave_intstat);
 	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT0, slave0);
 	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave1);
 
-- 
2.17.1


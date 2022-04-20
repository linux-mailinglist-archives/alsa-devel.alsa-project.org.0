Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2865507ED1
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 04:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 520EB18D4;
	Wed, 20 Apr 2022 04:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 520EB18D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650421921;
	bh=2x5p0qshyNJJblwHIKzMWnvRCa7FvV22Ri0Wm88vg/s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ePFJqaacV1y1q+8WqX1Lvd75OhJHIY7kdutTy0CaxDZR12o9rdlupfs46Xg4MsGnL
	 Ls8ycSCnfRgkjNHqd1b22fglkvc50pq2g+wyIEQ6B0dcma8e25CJmG+dtd7LalDD7O
	 zwNA3pH1E/nU/m5l12vH3PJFZ79+8qLg56j4L3Kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B31ECF80128;
	Wed, 20 Apr 2022 04:31:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 942D0F80125; Wed, 20 Apr 2022 04:30:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CF4DF800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 04:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF4DF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="I6p+QkaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650421853; x=1681957853;
 h=from:to:cc:subject:date:message-id;
 bh=2x5p0qshyNJJblwHIKzMWnvRCa7FvV22Ri0Wm88vg/s=;
 b=I6p+QkaZjgUsGwoUULBMDvVzqqcRRORNGRAiDWNgwejGFZ8dajmO1m1E
 OBVsMiDBaBeCCouypEKYLfHztfi+GxJ//Cl5q2D5iOrxS6gmKmgf/ZAEa
 mZvzo1QqnnzgFPSpPO3f/X9f3xtBBjBBIT4g412X8m8z4qcpB7x4uPFKu
 jFioUTN5dewNnzqP3tS44gOKgzt+hzkwJT8ddZUqMtdlST5jnUYnc/1MI
 cZ4fZUHiu3gdkeChj+D2cFVAvpM+k6yKj/9bwKfpx4Gdid5TkwBE0nQQR
 3W/a5I7DPQDaysoYspf2DfZgTLuL9KaemRhNlUkh3XO2fQkpOWpWo562b g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="262778139"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="262778139"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 19:30:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="529554083"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 19:30:46 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: cadence: recheck device0 attachment after status
 change
Date: Wed, 20 Apr 2022 10:30:39 +0800
Message-Id: <20220420023039.14144-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

This patch adds a status check after device0 attachment to solve race
conditions observed during attachment with multiple devices per link

The sequence is the following

1) deviceA attaches as device0

2) the hardware detects a device0 status change and throws an
 interrupt.

3) the interrupt handler schedules the work function

4) the workqueue starts, we read the status
slave0 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT0);
slave1 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);

we deal with the status change and program deviceA device number to a
non-zero value.

5) deviceB attaches as device0, the device0 status seen by the
hardware does not change.

6) we clear the CDNS_MCP_SLAVE_INTSTAT0/1 registers -> we will never detect
deviceB!

This patch suggest re-checking in a loop the device0 status with a
PING frame, i.e. using the real device0 status instead of information
on status changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 558390af44b6..47d59190a96e 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -959,6 +959,8 @@ static void cdns_update_slave_status_work(struct work_struct *work)
 		container_of(work, struct sdw_cdns, work);
 	u32 slave0, slave1;
 	u64 slave_intstat;
+	u32 device0_status;
+	int retry_count = 0;
 
 	slave0 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT0);
 	slave1 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);
@@ -968,10 +970,45 @@ static void cdns_update_slave_status_work(struct work_struct *work)
 
 	dev_dbg_ratelimited(cdns->dev, "Slave status change: 0x%llx\n", slave_intstat);
 
+update_status:
 	cdns_update_slave_status(cdns, slave_intstat);
 	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT0, slave0);
 	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave1);
 
+	/*
+	 * When there is more than one peripheral per link, it's
+	 * possible that a deviceB becomes attached after we deal with
+	 * the attachment of deviceA. Since the hardware does a
+	 * logical AND, the attachment of the second device does not
+	 * change the status seen by the driver.
+	 *
+	 * In that case, clearing the registers above would result in
+	 * the deviceB never being detected - until a change of status
+	 * is observed on the bus.
+	 *
+	 * To avoid this race condition, re-check if any device0 needs
+	 * attention with PING commands. There is no need to check for
+	 * ALERTS since they are not allowed until a non-zero
+	 * device_number is assigned.
+	 */
+
+	device0_status = cdns_readl(cdns, CDNS_MCP_SLAVE_STAT);
+	device0_status &= 3;
+
+	if (device0_status == SDW_SLAVE_ATTACHED) {
+		if (retry_count++ < SDW_MAX_DEVICES) {
+			dev_dbg_ratelimited(cdns->dev,
+					    "Device0 detected after clearing status, iteration %d\n",
+					    retry_count);
+			slave_intstat = CDNS_MCP_SLAVE_INTSTAT_ATTACHED;
+			goto update_status;
+		} else {
+			dev_err_ratelimited(cdns->dev,
+					    "Device0 detected after %d iterations\n",
+					    retry_count);
+		}
+	}
+
 	/* clear and unmask Slave interrupt now */
 	cdns_writel(cdns, CDNS_MCP_INTSTAT, CDNS_MCP_INT_SLAVE_MASK);
 	cdns_updatel(cdns, CDNS_MCP_INTMASK,
-- 
2.17.1


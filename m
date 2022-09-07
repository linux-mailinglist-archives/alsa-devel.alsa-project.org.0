Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9CB5AFFB3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 10:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15B761650;
	Wed,  7 Sep 2022 10:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15B761650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662540943;
	bh=UTBaGbiL322WIgSxdFPNTmtt+LWiX5RGqmSBpbJavs8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VavgM1WeTMWs0vZOUsUnB4gAsuNlfN63UW7cQ3wrqJzk50/uyiX5CVhPF8PP2vHay
	 TlBFjUOe3vKfRGyxTkbs9lVSWzB/lxcVblk2GfNorEhSNER4VyRjB/eIG1/9pGcbY2
	 QoRozzEB0yOnrdmABAoLRijCH+iCn2eSdrWm+k+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFEBF80558;
	Wed,  7 Sep 2022 10:53:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AB2DF80536; Wed,  7 Sep 2022 10:53:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E717F804CA
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 10:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E717F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fWIjgIIS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2876sQ69005118;
 Wed, 7 Sep 2022 03:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=t+rkmWKhbw2VsiGIx98OXne4OR4T75WeNsHgfR4luRs=;
 b=fWIjgIIS2SlZ0v+x8Y9cZQlhmav8waPc+7EQ11zbQHcv2jxTRt0yoASp0oln4bJt9d/y
 HBoEeMxv2VmZNPuN+bo+V9dJ1YaSxt1WMBnHm3gXad8ENN+HWtuGSK1rH/HPOm1Lzz0E
 ZzsGds005Y0dT+5ovsh5X8HcO/2nS+TdOZG5cxkMkgX0i4QmDSo3hdxgiuHoOkWXWr7s
 4zQME3PTVjooKB6fPGExHVlIFoEKinI2S+WfOo3Kr3AgEtCXAiUwdmSpl5T6I+Q4Dals
 4l5WC72330CDZKWmZCseAaI7QAetQ/5gY78blj4yvM6KQa1FQ7XGVDoluYljAry9wGhZ NQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jc4b2dcum-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 03:53:07 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 7 Sep
 2022 03:53:05 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Wed, 7 Sep 2022 03:53:05 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.149])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AC3937C;
 Wed,  7 Sep 2022 08:53:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH v2 4/5] soundwire: cadence: Fix lost ATTACHED interrupts when
 enumerating
Date: Wed, 7 Sep 2022 09:52:58 +0100
Message-ID: <20220907085259.3602-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907085259.3602-1-rf@opensource.cirrus.com>
References: <20220907085259.3602-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7da_1ldsMNPl-OTEaDdYfpFUHjAgr7Ee
X-Proofpoint-ORIG-GUID: 7da_1ldsMNPl-OTEaDdYfpFUHjAgr7Ee
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The correct way to handle interrupts is to clear the bits we
are about to handle _before_ handling them. Thus if the condition
then re-asserts during the handling we won't lose it.

This patch changes cdns_update_slave_status_work() to do this.

The previous code cleared the interrupts after handling them.
The problem with this is that when handling enumeration of devices
the ATTACH statuses can be accidentally cleared and so some or all
of the devices never complete their enumeration.

Thus we can have a situation like this:
- one or more devices are reverting to ID #0

- accumulated status bits indicate some devices attached and some
  on ID #0. (Remember: status bits are sticky until they are handled)

- Because of device on #0 sdw_handle_slave_status() programs the
  device ID and exits without handling the other status, expecting
  to get an ATTACHED from this reprogrammed device.

- The device immediately starts reporting ATTACHED in PINGs, which
  will assert its CDNS_MCP_SLAVE_INTSTAT_ATTACHED bit.

- cdns_update_slave_status_work() clears INTSTAT0/1. If the initial
  status had CDNS_MCP_SLAVE_INTSTAT_ATTACHED bit set it will be
  cleared.

- The ATTACHED change for the device has now been lost.

- cdns_update_slave_status_work() clears CDNS_MCP_INT_SLAVE_MASK so
  if the new ATTACHED state had set it, it will be cleared without
  ever having been handled.

Unless there is some other state change from another device to cause
a new interrupt, the ATTACHED state of the reprogrammed device will
never cause an interrupt so its enumeration will not be completed.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/cadence_master.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 245191d22ccd..3acd7b89c940 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -954,9 +954,22 @@ static void cdns_update_slave_status_work(struct work_struct *work)
 	u32 device0_status;
 	int retry_count = 0;
 
+	/*
+	 * Clear main interrupt first so we don't lose any assertions
+	 * the happen during this function.
+	 */
+	cdns_writel(cdns, CDNS_MCP_INTSTAT, CDNS_MCP_INT_SLAVE_MASK);
+
 	slave0 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT0);
 	slave1 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);
 
+	/*
+	 * Clear the bits before handling so we don't lose any
+	 * bits that re-assert.
+	 */
+	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT0, slave0);
+	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave1);
+
 	/* combine the two status */
 	slave_intstat = ((u64)slave1 << 32) | slave0;
 
@@ -964,8 +977,6 @@ static void cdns_update_slave_status_work(struct work_struct *work)
 
 update_status:
 	cdns_update_slave_status(cdns, slave_intstat);
-	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT0, slave0);
-	cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave1);
 
 	/*
 	 * When there is more than one peripheral per link, it's
@@ -1001,8 +1012,7 @@ static void cdns_update_slave_status_work(struct work_struct *work)
 		}
 	}
 
-	/* clear and unmask Slave interrupt now */
-	cdns_writel(cdns, CDNS_MCP_INTSTAT, CDNS_MCP_INT_SLAVE_MASK);
+	/* unmask Slave interrupt now */
 	cdns_updatel(cdns, CDNS_MCP_INTMASK,
 		     CDNS_MCP_INT_SLAVE_MASK, CDNS_MCP_INT_SLAVE_MASK);
 
-- 
2.30.2


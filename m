Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 485DD5B8C75
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 18:05:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D56611908;
	Wed, 14 Sep 2022 18:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D56611908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663171535;
	bh=I6L7DFQNtoJPK/NeugBA7TpUK4LrxMUszuh+hB3uUvA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QIvGAr1MJVcH6eiXg3ZXuenjU9+bcFUV8uiI7Ma/J9iePVSMC9R/Q+LsuL0yR6K0h
	 xCiJUDyRIQ0e4AYnwfnkSc91o4Fx3Uy5AE2EmJyGnfTT32Tbnzev8iQi3afS0tyhyK
	 Nb+1VVx6m0YB0lEbhq4ckcm1Ota7t5GEMvMzTy5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9052F8053B;
	Wed, 14 Sep 2022 18:03:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5C21F80538; Wed, 14 Sep 2022 18:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDE6FF8014B
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 18:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDE6FF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oVmM4ume"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28EDgEGH005943;
 Wed, 14 Sep 2022 11:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Pgl4azxf90HlSnGT8l1UNSDlf+sSOeBJVYvFNp1rmXo=;
 b=oVmM4umexWUUdAx1RKQXKuDoLsOHFuyRtfw+INigtXdkuwvl/xlj9WIbWzNSRmc2yxD4
 G8cvubXabj1pXUVv3K2aUmXvR760JQ3nuVqOun23lCro6H+NtG68irfDEaaTGdToC3A4
 nMLiVpCoplxLo8GqfWNjS+e3Xj1tIEZaynXMCPcCu+qPTsA2SmQw57pkRePQ06jnHRLI
 MKynTNNfa/S3ZvAj5GngcNXlLeYTZsUowyrxwESV31ylHltLboi4UZEsFS5IWX4hJvdc
 1MHcViVVLTO8GkfgYwbVBBSSLGaFmHq+zs28/P82lR17eeDiiW/BZzDiV0+XkHLEI/VV Rg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jjy05h8em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Sep 2022 11:02:57 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 14 Sep
 2022 11:02:55 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Wed, 14 Sep 2022 11:02:55 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 98ABE46C;
 Wed, 14 Sep 2022 16:02:55 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH v4 1/5] soundwire: cadence: fix updating slave status when a
 bus has multiple peripherals
Date: Wed, 14 Sep 2022 17:02:44 +0100
Message-ID: <20220914160248.1047627-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914160248.1047627-1-rf@opensource.cirrus.com>
References: <20220914160248.1047627-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jBAIM2RRWvGi9lof-wrrAS-KB07Ecdys
X-Proofpoint-ORIG-GUID: jBAIM2RRWvGi9lof-wrrAS-KB07Ecdys
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

From: Simon Trimmer <simont@opensource.cirrus.com>

The cadence IP explicitly reports slave status changes with bits for
each possible change. The function cdns_update_slave_status() attempts
to translate this into the current status of each of the slaves.

However when there are multiple peripherals on a bus any slave that did
not have a status change when the work function ran would not have it's
status updated - the array is initialised to a value that equates to
UNATTACHED and this can cause spurious reports that slaves had dropped
off the bus.

In the case where a slave has no status change or has multiple status
changes the value from the last PING command is used.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 57 +++++++++++++-----------------
 1 file changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 4fbb19557f5e..245191d22ccd 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -782,6 +782,7 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
 	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
 	bool is_slave = false;
 	u32 mask;
+	u32 val;
 	int i, set_status;
 
 	memset(status, 0, sizeof(status));
@@ -789,41 +790,38 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
 	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
 		mask = (slave_intstat >> (i * CDNS_MCP_SLAVE_STATUS_NUM)) &
 			CDNS_MCP_SLAVE_STATUS_BITS;
-		if (!mask)
-			continue;
 
-		is_slave = true;
 		set_status = 0;
 
-		if (mask & CDNS_MCP_SLAVE_INTSTAT_RESERVED) {
-			status[i] = SDW_SLAVE_RESERVED;
-			set_status++;
-		}
-
-		if (mask & CDNS_MCP_SLAVE_INTSTAT_ATTACHED) {
-			status[i] = SDW_SLAVE_ATTACHED;
-			set_status++;
-		}
+		if (mask) {
+			is_slave = true;
 
-		if (mask & CDNS_MCP_SLAVE_INTSTAT_ALERT) {
-			status[i] = SDW_SLAVE_ALERT;
-			set_status++;
-		}
+			if (mask & CDNS_MCP_SLAVE_INTSTAT_RESERVED) {
+				status[i] = SDW_SLAVE_RESERVED;
+				set_status++;
+			}
 
-		if (mask & CDNS_MCP_SLAVE_INTSTAT_NPRESENT) {
-			status[i] = SDW_SLAVE_UNATTACHED;
-			set_status++;
-		}
+			if (mask & CDNS_MCP_SLAVE_INTSTAT_ATTACHED) {
+				status[i] = SDW_SLAVE_ATTACHED;
+				set_status++;
+			}
 
-		/* first check if Slave reported multiple status */
-		if (set_status > 1) {
-			u32 val;
+			if (mask & CDNS_MCP_SLAVE_INTSTAT_ALERT) {
+				status[i] = SDW_SLAVE_ALERT;
+				set_status++;
+			}
 
-			dev_warn_ratelimited(cdns->dev,
-					     "Slave %d reported multiple Status: %d\n",
-					     i, mask);
+			if (mask & CDNS_MCP_SLAVE_INTSTAT_NPRESENT) {
+				status[i] = SDW_SLAVE_UNATTACHED;
+				set_status++;
+			}
+		}
 
-			/* check latest status extracted from PING commands */
+		/*
+		 * check that there was a single reported Slave status and when
+		 * there is not use the latest status extracted from PING commands
+		 */
+		if (set_status != 1) {
 			val = cdns_readl(cdns, CDNS_MCP_SLAVE_STAT);
 			val >>= (i * 2);
 
@@ -842,11 +840,6 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
 				status[i] = SDW_SLAVE_RESERVED;
 				break;
 			}
-
-			dev_warn_ratelimited(cdns->dev,
-					     "Slave %d status updated to %d\n",
-					     i, status[i]);
-
 		}
 	}
 
-- 
2.30.2


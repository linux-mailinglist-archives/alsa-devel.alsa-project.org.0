Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A505A1059
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 14:24:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F7B825;
	Thu, 25 Aug 2022 14:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F7B825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661430274;
	bh=1rC1ga9SRlpAsjmY143bxuV6ZawEJSL8P+qxAjfD+lw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZ4JJECuwDpb/F6HBfV/o3Vi9oG8L5pnNJkgUjn5fZrSdA7A4bBNVXcMBJ780+zET
	 fUuqt0BFCHHlWlsYk5PWlZalVv9fXp2i/5A9qu1l2deMfCVID75s3HdV4hjDOALLTD
	 jXcUwQYrOg8KQdXHsrJHBj/R4v37ViMCSZtS8xII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1309F80528;
	Thu, 25 Aug 2022 14:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BE20F80506; Thu, 25 Aug 2022 14:22:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E277F8025A
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 14:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E277F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ibFyVbbt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P5nj9c003635;
 Thu, 25 Aug 2022 07:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=lrFfeaNaq0qk25xBy3PLt6CJ1MTiZDp2a4Mc7/DICTo=;
 b=ibFyVbbt2GhRhghLUIN3juqWwBmei8RzYMsW06jOJnwJPMWdNYZi68rCYWI/gOiW0akn
 RTuuebA+Jfiy+p7LZeV2bMrhxQchdQ6cWzFbyiF6cD/hF2tlY4BWy2qXEO0Q3DH+80fL
 s8OfXDJNtuPwPz/jk85jv7w07taOcBiKGZwBgO3vXpnlY92SWOgwzieT0fvf1G914rLA
 V4J5cwAUfDW+WPf521p36rtN+p9DMJik8Z8vjHsmEBzknIc7JjLQRpvUsiGBn80ONQlh
 VH7gFwxxTe1wneJUCss0CD99g6dHYBZjpw+zQqOb636JpZ7UxpGWB9dCtN79lI4rOBu+ +w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3j4dgmbu3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 07:22:43 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 25 Aug
 2022 07:22:41 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Thu, 25 Aug 2022 07:22:41 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BCCC0B0E;
 Thu, 25 Aug 2022 12:22:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH 3/3] soundwire: bus: Fix lost UNATTACH when re-enumerating
Date: Thu, 25 Aug 2022 13:22:41 +0100
Message-ID: <20220825122241.273090-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825122241.273090-1-rf@opensource.cirrus.com>
References: <20220825122241.273090-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vVYFBcLd_1lRC5qoVfwSSvPy0OCEKWAe
X-Proofpoint-GUID: vVYFBcLd_1lRC5qoVfwSSvPy0OCEKWAe
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

Rearrange sdw_handle_slave_status() so that any peripherals
on device #0 that are given a device ID are reported as
unattached. The ensures that UNATTACH status is not lost.

Handle unenumerated devices first and update the
sdw_slave_status array to indicate IDs that must have become
UNATTACHED.

Look for UNATTACHED devices after this so we can pick up
peripherals that were UNATTACHED in the original PING status
and those that were still ATTACHED at the time of the PING but
then reverted to unenumerated and were found by
sdw_program_device_num().

As sdw_update_slave_status() is always processing a snapshot of
a PING from some time in the past, it is possible that the status
is changing while sdw_update_slave_status() is running.

A peripheral could report attached in the PING, but detach and
revert to device #0 and then be found in the loop in
sdw_program_device_num(). Previously the code would not have
updated slave->status to UNATTACHED because there was never a
PING with that status. If the slave->status is not updated to
UNATTACHED the next PING will report it as ATTACHED, but its
slave->status is already ATTACHED so the re-attach will not be
properly handled.

This situations happens fairly frequently with multiple
peripherals on a bus that are intentionally reset (for example
after downloading firmware).

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index bb8ce26c68b3..1212148ac251 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -718,7 +718,8 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
 }
 EXPORT_SYMBOL(sdw_extract_slave_id);
 
-static int sdw_program_device_num(struct sdw_bus *bus)
+static int sdw_program_device_num(struct sdw_bus *bus,
+				  enum sdw_slave_status status[])
 {
 	u8 buf[SDW_NUM_DEV_ID_REGISTERS] = {0};
 	struct sdw_slave *slave, *_s;
@@ -776,6 +777,12 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 					return ret;
 				}
 
+				/*
+				 * It could have dropped off the bus since the
+				 * PING response so update the status array.
+				 */
+				status[slave->dev_num] = SDW_SLAVE_UNATTACHED;
+
 				break;
 			}
 		}
@@ -1735,10 +1742,21 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 {
 	enum sdw_slave_status prev_status;
 	struct sdw_slave *slave;
+	bool programmed_dev_num = false;
 	bool attached_initializing;
 	int i, ret = 0;
 
-	/* first check if any Slaves fell off the bus */
+	/* Handle any unenumerated peripherals */
+	if (status[0] == SDW_SLAVE_ATTACHED) {
+		dev_dbg(bus->dev, "Slave attached, programming device number\n");
+		ret = sdw_program_device_num(bus, status);
+		if (ret < 0)
+			dev_warn(bus->dev, "Slave attach failed: %d\n", ret);
+
+		programmed_dev_num = true;
+	}
+
+	/* Check if any fell off the bus */
 	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
 		mutex_lock(&bus->bus_lock);
 		if (test_bit(i, bus->assigned) == false) {
@@ -1764,17 +1782,12 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 		}
 	}
 
-	if (status[0] == SDW_SLAVE_ATTACHED) {
-		dev_dbg(bus->dev, "Slave attached, programming device number\n");
-		ret = sdw_program_device_num(bus);
-		if (ret < 0)
-			dev_err(bus->dev, "Slave attach failed: %d\n", ret);
-		/*
-		 * programming a device number will have side effects,
-		 * so we deal with other devices at a later time
-		 */
-		return ret;
-	}
+	/*
+	 * programming a device number will have side effects,
+	 * so we deal with other devices at a later time
+	 */
+	if (programmed_dev_num)
+		return 0;
 
 	/* Continue to check other slave statuses */
 	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA4867822B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 17:50:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E213E6C0;
	Mon, 23 Jan 2023 17:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E213E6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674492656;
	bh=+wFIhuQNb979ve7ZqQ0IPd4FrK5IU7jPINk4Ee3yrhg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ed9zSBNMZlNY53rvrMi91t0e01ida9lrtFAywMWcfnf+0DUMiq6D/ZXT8CEu02BQX
	 ppZJmMl0N+4Ws9O16IeKyTPPvpbUW8+t0bEKwaJ/frc9JQHHAs7GPVvSss9qANiReq
	 5z7fw9zH2rUsufkBKZ4ycVO68HsWygzDhha+Bi3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34773F80132;
	Mon, 23 Jan 2023 17:49:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72BAEF804F3; Mon, 23 Jan 2023 17:49:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F6B0F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 17:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F6B0F80132
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XK4aeSxX
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NBjTse014286; Mon, 23 Jan 2023 10:49:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0JSJ3PjMpCm51ZHMD5LZ35Bg643Gkiql6yHmBZPBgGg=;
 b=XK4aeSxX3NTUIqY2Q5XN2DqD3KfOxXczhfDnpm2n5/LskydGQs7sPUduNagu7991qk6W
 Vdlt0pqOga6kHI2wYQqt+JuhLHoaj/7YQGga4EnmrIfwojTrgbUL38F3V/bp+Q13HS9f
 8zs6SwVhdFbG5970uUccZysuKGdSQbBdnXPed7eFroGB7pafFBFKDUHM0DL/MukrOkAR
 teHZd7zCr9INFbQLRuNpVv19Z8rQN3E9oV6yEZ8+8XsEpEnToTkxyO3FHEReRZvB8Peb
 Rlznxg0y0aA8jckF8b7KUfpCFFNgD5xPJbsD/IGaaKNwBeAeWPwA+7gI46GTJEfyGx3e 6Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n8dbsknrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 10:49:51 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Mon, 23 Jan
 2023 10:49:49 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Mon, 23 Jan 2023 10:49:49 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8363B11CB;
 Mon, 23 Jan 2023 16:49:49 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH v2 1/2] soundwire: bus: Don't zero page registers after every
 transaction
Date: Mon, 23 Jan 2023 16:49:48 +0000
Message-ID: <20230123164949.245898-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123164949.245898-1-rf@opensource.cirrus.com>
References: <20230123164949.245898-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zvtXg2aWfemLtqXiZujYnELgE3RVT9Ta
X-Proofpoint-GUID: zvtXg2aWfemLtqXiZujYnELgE3RVT9Ta
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Zeroing the page registers at the end of every paged transaction is just
overhead (40% overhead on a 1-register access, 25% on a 4-register
transaction). According to the spec a peripheral that supports paging
should only use the values in the page registers if the address is paged
(address bit 15 set). The core SoundWire code always writes the page
registers at the start of a paged transaction so there will never be a
transaction that uses the stale values from a previous paged transaction.

For peripherals that need large amounts of data to be transferred, for
example firmware or filter coefficients, the overhead of page register
zeroing can become quite significant.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 633d411b64f3..b840322f7f1d 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -247,23 +247,6 @@ static inline int do_transfer_defer(struct sdw_bus *bus,
 	return ret;
 }
 
-static int sdw_reset_page(struct sdw_bus *bus, u16 dev_num)
-{
-	int retry = bus->prop.err_threshold;
-	enum sdw_command_response resp;
-	int ret = 0, i;
-
-	for (i = 0; i <= retry; i++) {
-		resp = bus->ops->reset_page_addr(bus, dev_num);
-		ret = find_response_code(resp);
-		/* if cmd is ok or ignored return */
-		if (ret == 0 || ret == -ENODATA)
-			return ret;
-	}
-
-	return ret;
-}
-
 static int sdw_transfer_unlocked(struct sdw_bus *bus, struct sdw_msg *msg)
 {
 	int ret;
@@ -275,9 +258,6 @@ static int sdw_transfer_unlocked(struct sdw_bus *bus, struct sdw_msg *msg)
 			(msg->flags & SDW_MSG_FLAG_WRITE) ? "write" : "read",
 			msg->addr, msg->len);
 
-	if (msg->page)
-		sdw_reset_page(bus, msg->dev_num);
-
 	return ret;
 }
 
@@ -352,9 +332,6 @@ int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
 		dev_err(bus->dev, "Defer trf on Slave %d failed:%d\n",
 			msg->dev_num, ret);
 
-	if (msg->page)
-		sdw_reset_page(bus, msg->dev_num);
-
 	return ret;
 }
 
-- 
2.30.2


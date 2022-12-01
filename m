Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AE163F24F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 15:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DCA4175C;
	Thu,  1 Dec 2022 15:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DCA4175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669903784;
	bh=TVOgIIJKVvx9htn90bZWjLeGUiBS7b5V0bhHf7WN9VI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fX4QiAdLWqH8zQWyZwNx+9izzNVu5nS1UGc/aSj/2EVy347hOmCRAhWjHLW8RPvT5
	 d8QJCMq27c+6Ub2PDKfmxTDAkEpuW/3AHvkTjXDfchcO2/qP1Msdk9GJJk95xE6icI
	 zZ2Wx0y9NlrUwP44buR1en75S023zsPzP4n5YYNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CEBCF80557;
	Thu,  1 Dec 2022 15:08:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ED8FF804B1; Thu,  1 Dec 2022 15:08:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D972F80118
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 15:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D972F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="peVHfzdA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B17QP4s028766; Thu, 1 Dec 2022 08:08:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=C+gnvUjF+dRHpOoHQk7AZtrMT0JKxATwowGCzKMV1XA=;
 b=peVHfzdA5nNVvvdT/qKLLfpn9R8HMlphHJZyIiNKyK/ECPoC0zQUeCiuIJoDG7jaZEhR
 Xgc5F4bgGZt5aMpCeK0kqGOlmMABgLjHampo+PCDo2ulfNK54psK/5Zr8fAD3v5BP0ey
 X0vGUbS0h70td2oKQtWFexc4rXpvMOIx9FPNSQM0DGPcTdVcpsaO68cS7PNIj5sSuE92
 Ifou4Uuwj4osPcIQFI2V3/rA+M2XAmdD20cHobFVb2KfSQ7e5YBxLdq7BCKQMC6wfDWN
 ODU/0DOak0D14PDXZy3j/eP+vJujIpM4MPLtYWXKibOQ2aAqWOksXhOM9CHTn4UxxKMN FQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3m6k2vrjg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 08:08:14 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 1 Dec
 2022 08:08:13 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 1 Dec 2022 08:08:13 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 33DCEB2F;
 Thu,  1 Dec 2022 14:08:13 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/2] soundwire: bus: Don't zero page registers after every
 transaction
Date: Thu, 1 Dec 2022 14:08:12 +0000
Message-ID: <20221201140813.4062146-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201140813.4062146-1-rf@opensource.cirrus.com>
References: <20221201140813.4062146-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hGhrQlAHdhaZ_-AZRiBj0ImihEhj9gUD
X-Proofpoint-ORIG-GUID: hGhrQlAHdhaZ_-AZRiBj0ImihEhj9gUD
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

Zeroing the page registers at the end of every paged transaction is just
overhead (40% overhead on a 1-register access, 25% on a 4-register
transaction). According to the spec the peripheral should only use the
values in the page registers if the address is paged, and since the page
registers are always overwritten at the start of a paged transaction there
will never be a transaction that uses the stale values from a previous
paged transaction.

For peripherals that need large amounts of data to be transferred, for
example firmware or filter coefficients, the overhead of page register
zeroing can become quite significant.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 76515c33e639..a02edcbfc282 100644
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


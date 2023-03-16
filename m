Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934AB6BD48D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96DD410E1;
	Thu, 16 Mar 2023 16:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96DD410E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678982371;
	bh=+NIXVypj3mPSjYmkKruxPPpCcGhKjct/8+Amql9AO48=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=QPDC3OVpxCDc2EhfhiVPuXEsrkbjrdbQNgFjBvPzXWh+APaIX/75vuZCUKFRb4wb6
	 VxbGqEJN+9caeO1K2zltLm7Sd0Q5Vb2sSd9xS4TIxc50YvCXs5g4DWQ+rk3TXvwhST
	 Ovev7JgmUHPHNTUhE3BCsFOBHPUq0e+dZJa9CRwU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41DBAF804B1;
	Thu, 16 Mar 2023 16:57:52 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH 2/2] soundwire: bus: Update sdw_nread/nwrite_no_pm to handle
 page boundaries
Date: Thu, 16 Mar 2023 15:57:34 +0000
In-Reply-To: <20230316155734.3191577-1-ckeepax@opensource.cirrus.com>
References: <20230316155734.3191577-1-ckeepax@opensource.cirrus.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBK2AGBQ7O6UCVTUR2CGHQNWUECGC7SU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167898227099.26.9813853342986450785@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AD34F80423; Thu, 16 Mar 2023 16:57:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28521F80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28521F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TNPgfDSs
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GFpjVl015162;
	Thu, 16 Mar 2023 10:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=zwa+Kz3z5JsstvJyyjsKd/9rebLnLWbVJ5G8ya5H37k=;
 b=TNPgfDSs79sO1vKqlcoH5bW71KMuMKW0xiODu1gRUUiJCQOz/6O6hnk3tafiC9vMv6Wz
 VaqAAK/4pytrLZbrUDtPkTchkd3dcxPLPstc+D5Gsy1IJNQ8cEDvc8xoQkJ4QTAqmp3l
 4juR8sOZUfiJLgS2Jwyz76Sr6KyFDDEgy6dyLiXuW0JFQmMuCwTyGtPaZ0BPgGzfz7Du
 bY8oCJ/KoS5+6ZCXtHFmHh/nO4Q/W1MW746VUnVxn4gmaTmTDcD50C0ynNXIdnNTZv3a
 GABlEvnoQHEHhgxJ9pEVz9//KFoQqdLz4DN5Bfge8o0A5BJBN0RAMS4kpWbXiLIsooXa yw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pbs2nrxxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 10:57:35 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 16 Mar
 2023 10:57:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 16 Mar 2023 10:57:34 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1EAD311D4;
	Thu, 16 Mar 2023 15:57:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH 2/2] soundwire: bus: Update sdw_nread/nwrite_no_pm to handle
 page boundaries
Date: Thu, 16 Mar 2023 15:57:34 +0000
Message-ID: <20230316155734.3191577-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316155734.3191577-1-ckeepax@opensource.cirrus.com>
References: <20230316155734.3191577-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: p0Dgp2C0Dmwbcqi8GtGVhGNykvjqSFYc
X-Proofpoint-ORIG-GUID: p0Dgp2C0Dmwbcqi8GtGVhGNykvjqSFYc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QBK2AGBQ7O6UCVTUR2CGHQNWUECGC7SU
X-Message-ID-Hash: QBK2AGBQ7O6UCVTUR2CGHQNWUECGC7SU
X-MailFrom: prvs=843980a8d3=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBK2AGBQ7O6UCVTUR2CGHQNWUECGC7SU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently issuing a sdw_nread/nwrite_no_pm across a page boundary
will silently fail to write correctly as nothing updates the page
registers, meaning the same page of the chip will get rewritten
with each successive page of data.

As the sdw_msg structure contains page information it seems
reasonable that a single sdw_msg should always be within one
page. It is also mostly simpler to handle the paging at the
bus level rather than each master having to handle it in their
xfer_msg callback.

As such add handling to the bus code to split up a transfer into
multiple sdw_msg's when they go across page boundaries.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 47 +++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 3c67266f94834..bdd251e871694 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -386,37 +386,42 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
  * Read/Write IO functions.
  */
 
-int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+static int sdw_ntransfer_no_pm(struct sdw_slave *slave, u32 addr, u8 flags,
+			       size_t count, u8 *val)
 {
 	struct sdw_msg msg;
+	size_t size;
 	int ret;
 
-	ret = sdw_fill_msg(&msg, slave, addr, count,
-			   slave->dev_num, SDW_MSG_FLAG_READ, val);
-	if (ret < 0)
-		return ret;
+	while (count) {
+		// Only handle bytes up to next page boundary
+		size = min(count, (SDW_REGADDR + 1) - (addr & SDW_REGADDR));
 
-	ret = sdw_transfer(slave->bus, &msg);
-	if (slave->is_mockup_device)
-		ret = 0;
-	return ret;
+		ret = sdw_fill_msg(&msg, slave, addr, size, slave->dev_num, flags, val);
+		if (ret < 0)
+			return ret;
+
+		ret = sdw_transfer(slave->bus, &msg);
+		if (ret < 0 && !slave->is_mockup_device)
+			return ret;
+
+		addr += size;
+		val += size;
+		count -= size;
+	}
+
+	return 0;
+}
+
+int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+{
+	return sdw_ntransfer_no_pm(slave, addr, SDW_MSG_FLAG_READ, count, val);
 }
 EXPORT_SYMBOL(sdw_nread_no_pm);
 
 int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
-	struct sdw_msg msg;
-	int ret;
-
-	ret = sdw_fill_msg(&msg, slave, addr, count,
-			   slave->dev_num, SDW_MSG_FLAG_WRITE, (u8 *)val);
-	if (ret < 0)
-		return ret;
-
-	ret = sdw_transfer(slave->bus, &msg);
-	if (slave->is_mockup_device)
-		ret = 0;
-	return ret;
+	return sdw_ntransfer_no_pm(slave, addr, SDW_MSG_FLAG_WRITE, count, (u8 *)val);
 }
 EXPORT_SYMBOL(sdw_nwrite_no_pm);
 
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB15BB83A
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Sep 2022 14:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CB101635;
	Sat, 17 Sep 2022 14:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CB101635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663418197;
	bh=XYJA667fLDOhUS1qkdqDyoyMT3NAnXmTi3A4eSDJP8o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lP/fJ57qEUD2Vzdo8qeDl4ykY8fiobl4v6vFMn6ewsY2YmRW+yaVU2AddC4zZhQJQ
	 1dRRi/m+Egn7LGLti2EPOjVl2wXYRQUqMfEas2W2Z2CDdL4rOCzwG6AeOILp/UxAW1
	 OZjylT6pCM+GmohIWJsiC8eqeUEiKwKDa3uAHyVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCE50F800E9;
	Sat, 17 Sep 2022 14:35:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8950FF8028D; Sat, 17 Sep 2022 14:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18B97F800E9
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 14:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18B97F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="B53HZiww"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28HC1ILP026878;
 Sat, 17 Sep 2022 07:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=2hDA1iMB+MkH5X+KpV0Xzrm17zBNNXH45EZO+TrYQ2k=;
 b=B53HZiwwsNkFBLTWJ8spqIo5GkS6Zy6ci8rgAjPbZKWA/1PXUN+s8benA1PNcKSPEZ+L
 iNbR8BK52LCHEdK3/ojODiggM1ozn6pn1ChTXkjqM5H9lfl9XS8GBaTkDPflT1tn/tWE
 rYDcOnGoy7zyZBBlmJU9iWA/KxoSkmWleP/toPzPvm5zBpPGm4n/Dpg+wl1eZyVifzuT
 45fXkOfMw2mZ9XPpMA/RcfVaKe1iiuL958Ik5IFbGizKZP1zsK+7lIov/kLePtVaB45i
 N/vv9zhAjuIU+EeG0zEhgYt1kom6lqO7VAkZrb2sc9mYjpeSflxkzv1bDH48LvPy9Znd 5Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jnanmg60x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Sep 2022 07:35:29 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Sat, 17 Sep
 2022 07:35:27 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Sat, 17 Sep 2022 07:35:27 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.112])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 477EF2BA;
 Sat, 17 Sep 2022 12:35:21 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH] soundwire: cadence: Write to correct address for each FIFO
 chunk
Date: Sat, 17 Sep 2022 13:35:17 +0100
Message-ID: <20220917123517.229153-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: P01lUcnPOM-azedO6NTkqAeUasUKvcgi
X-Proofpoint-ORIG-GUID: P01lUcnPOM-azedO6NTkqAeUasUKvcgi
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

_cdns_xfer_msg() must add the fragment offset to msg->addr to get the
base target address of each FIFO chunk. Otherwise every chunk will
be written to the first 32 register addresses.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/cadence_master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 3ef472049980..ca241bbeadd9 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -569,7 +569,7 @@ _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
 	}
 
 	base = CDNS_MCP_CMD_BASE;
-	addr = msg->addr;
+	addr = msg->addr + offset;
 
 	for (i = 0; i < count; i++) {
 		data = FIELD_PREP(CDNS_MCP_CMD_DEV_ADDR, msg->dev_num);
-- 
2.30.2


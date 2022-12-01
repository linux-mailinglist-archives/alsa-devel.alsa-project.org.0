Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52C63F212
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 14:52:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A39C1756;
	Thu,  1 Dec 2022 14:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A39C1756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669902750;
	bh=8QRL9NcvXXT2RCfjeR5N3+qpmtMq5TcwNhYjRn3m/IA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOHSAmInOQNWu0Db/iO17N+QFfKmjwHz6MNUxLab13m5aNA4E1jc3zFFY8qJfAUOe
	 fASv1m1z4QtY3atTN9oGrruDDe0FxZMcKp9m2mhT9N7IWyQwH93V18W81SYUKTAJwb
	 dmUlVwMABv7SmyvG+hw6IlqG3o0H56dXraDtocbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1504F805C4;
	Thu,  1 Dec 2022 14:49:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D48AF805B6; Thu,  1 Dec 2022 14:49:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 655FDF805B6
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 14:48:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 655FDF805B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="e+C5tD/E"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B15l1vC016609; Thu, 1 Dec 2022 07:48:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Sq7aVdOUXhv799GASybDC0oDppsFxEeabLuPhpHwJW0=;
 b=e+C5tD/EoW0mAzWlfnqJ6/Ne5Q24vNzUPJdGbKt7anCO7HW3HldpKtfQ++3FIxjV8J0M
 OwAuf25tJjinl0Td8ldA0kKN3MxFjZrFPzMTqVBncS2Qy8gMcZIn0p4ooVmqE+Eg1yQ1
 6wzkJ2th/lAQk7BeDePuSlbsGfiDv/zWsTSGDijQt/wh+Ril0qny4bmQBUcchM7JP1uf
 M9Y06VVwdxiPNea3LIeyFqFDmgBDVOr4G9SLM3pCnqPgQt95q6cdzcq2ZZ6/1z3p/jle
 W7LfyQUrEu+iU5wGAaRDxmTloeDJ/rQrpS7MPIqZSZLjuv5mZsgpgcSWY0r+sOWkWuHz cA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3m6k75rhqm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 07:48:50 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 1 Dec
 2022 07:48:46 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 1 Dec 2022 07:48:46 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EC48DB2F;
 Thu,  1 Dec 2022 13:48:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/3] soundwire: cadence: Remove wasted space in response_buf
Date: Thu, 1 Dec 2022 13:48:44 +0000
Message-ID: <20221201134845.4055907-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201134845.4055907-1-rf@opensource.cirrus.com>
References: <20221201134845.4055907-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: gNFKnIwsnYaYG1Uc5sYyKBgrGUK914N_
X-Proofpoint-GUID: gNFKnIwsnYaYG1Uc5sYyKBgrGUK914N_
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

The response_buf was declared much larger (128 entries) than the number
of responses that could ever be written into it (maximum 8).

Reduce response_buf to 8 entries and add checking in cdns_read_response()
to prevent overflowing reponse_buf if CDNS_MCP_RX_FIFO_AVAIL contains
an unexpectedly large number.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/cadence_master.c | 6 ++++++
 drivers/soundwire/cadence_master.h | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 27699f341f2c..95c84d9f0775 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -774,8 +774,14 @@ static void cdns_read_response(struct sdw_cdns *cdns)
 	u32 num_resp, cmd_base;
 	int i;
 
+	BUILD_BUG_ON(ARRAY_SIZE(cdns->response_buf) < CDNS_MCP_CMD_LEN);
+
 	num_resp = cdns_readl(cdns, CDNS_MCP_FIFOSTAT);
 	num_resp &= CDNS_MCP_RX_FIFO_AVAIL;
+	if (num_resp > ARRAY_SIZE(cdns->response_buf)) {
+		dev_warn(cdns->dev, "RX AVAIL %d too long\n", num_resp);
+		num_resp = CDNS_MCP_CMD_LEN;
+	}
 
 	cmd_base = CDNS_MCP_CMD_BASE;
 
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 0434d70d4b1f..c2d817e8e22a 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -117,7 +117,7 @@ struct sdw_cdns {
 	struct sdw_bus bus;
 	unsigned int instance;
 
-	u32 response_buf[0x80];
+	u32 response_buf[8];
 	struct completion tx_complete;
 	struct sdw_defer *defer;
 
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20E640A7E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 17:20:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9725E1884;
	Fri,  2 Dec 2022 17:19:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9725E1884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669998013;
	bh=55sARawPaV4j4smjlWMxmob8AS1DvrcbNH9nsVsmnrw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TizKT/T3zyxc2Dd1iuxwR85Klv8ksHWyAmh/LGu9U0SY6VjpHaBUX4b5kVgM1qmMv
	 zwLUCl+YpOURUiY4z9dWA3SKOta104HT11lssbs9+cVtAdxI/PqCbwZE0bfJntQwXh
	 s1fjqEJSuHy57OBr6OIe5f0Vgd6fUkcvDH1FdNzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 848AEF80564;
	Fri,  2 Dec 2022 17:18:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ECEDF804B3; Fri,  2 Dec 2022 17:18:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1C8AF804B3
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 17:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1C8AF804B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HYCxCbLP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B28j12l022681; Fri, 2 Dec 2022 10:18:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=BE++jpEueF2GegZwNGVzOdbbuVP+vf8cC+Lif4Aj6fo=;
 b=HYCxCbLPyppYyzeG8rj1vuGq/Oi8jz0GcR93F3L0tdyquAMShqFb+KcSp5yG8SaFoY0S
 +d1XJMoj0QYbp22CPSSuvFySXrYIGBz2+4q1UWVJgtbCZHmNxJ15IUvZ0ocTFrJnRmpU
 lEnA34wnsMRUcE11odnTp+LYMZFFt7FZz8DlvxhGgVdaWe46sgxFxw2bCeJu9tGiY6r8
 d+Flpv/KrX2Xy70TkqIkn70zop9bvP5g4twd8iQ0n/Bj03FTKqOsOhrEuklF75b1CRDV
 vnm7QaUsrjkNmMT8cSY1jQvWYeYc1gv0DlEeqlBJEJpa+AoBrgTSsSBrstgH4pkADJsc bg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3m6k2vt0n6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Dec 2022 10:18:14 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 2 Dec
 2022 10:18:12 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Fri, 2 Dec 2022 10:18:12 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9C556B2F;
 Fri,  2 Dec 2022 16:18:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 3/3] soundwire: cadence: Drain the RX FIFO after an IO
 timeout
Date: Fri, 2 Dec 2022 16:18:12 +0000
Message-ID: <20221202161812.4186897-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221202161812.4186897-1-rf@opensource.cirrus.com>
References: <20221202161812.4186897-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JbfrKx6hsDlg3qbXh0BsCbr3l__qe-bI
X-Proofpoint-ORIG-GUID: JbfrKx6hsDlg3qbXh0BsCbr3l__qe-bI
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

If wait_for_completion_timeout() times-out in _cdns_xfer_msg() it
is possible that something could have been written to the RX FIFO.
In this case, we should drain the RX FIFO so that anything in it
doesn't carry over and mess up the next transfer.

Obviously, if we got to this state something went wrong, and we
don't really know the state of everything. The cleanup in this
situation cannot be bullet-proof but we should attempt to avoid
breaking future transaction, if only to reduce the amount of
error noise when debugging the failure from a kernel log.

Note that this patch only implements the draining for blocking
(non-deferred) transfers. The deferred API doesn't have any proper
handling of error conditions and would need some re-design before
implementing cleanup. That is a task for a separate patch...

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes since v1:
The change is "the same" but the function that is moved up the
file has different content because of changes in patch #2
---
 drivers/soundwire/cadence_master.c | 50 ++++++++++++++++--------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index a6635f7f350e..521387322145 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -555,6 +555,29 @@ cdns_fill_msg_resp(struct sdw_cdns *cdns,
 	return SDW_CMD_OK;
 }
 
+static void cdns_read_response(struct sdw_cdns *cdns)
+{
+	u32 num_resp, cmd_base;
+	int i;
+
+	/* RX_FIFO_AVAIL can be 2 entries more than the FIFO size */
+	BUILD_BUG_ON(ARRAY_SIZE(cdns->response_buf) < CDNS_MCP_CMD_LEN + 2);
+
+	num_resp = cdns_readl(cdns, CDNS_MCP_FIFOSTAT);
+	num_resp &= CDNS_MCP_RX_FIFO_AVAIL;
+	if (num_resp > ARRAY_SIZE(cdns->response_buf)) {
+		dev_warn(cdns->dev, "RX AVAIL %d too long\n", num_resp);
+		num_resp = ARRAY_SIZE(cdns->response_buf);
+	}
+
+	cmd_base = CDNS_MCP_CMD_BASE;
+
+	for (i = 0; i < num_resp; i++) {
+		cdns->response_buf[i] = cdns_readl(cdns, cmd_base);
+		cmd_base += CDNS_MCP_CMD_WORD_LEN;
+	}
+}
+
 static enum sdw_command_response
 _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
 	       int offset, int count, bool defer)
@@ -596,6 +619,10 @@ _cdns_xfer_msg(struct sdw_cdns *cdns, struct sdw_msg *msg, int cmd,
 		dev_err(cdns->dev, "IO transfer timed out, cmd %d device %d addr %x len %d\n",
 			cmd, msg->dev_num, msg->addr, msg->len);
 		msg->len = 0;
+
+		/* Drain anything in the RX_FIFO */
+		cdns_read_response(cdns);
+
 		return SDW_CMD_TIMEOUT;
 	}
 
@@ -769,29 +796,6 @@ EXPORT_SYMBOL(cdns_read_ping_status);
  * IRQ handling
  */
 
-static void cdns_read_response(struct sdw_cdns *cdns)
-{
-	u32 num_resp, cmd_base;
-	int i;
-
-	/* RX_FIFO_AVAIL can be 2 entries more than the FIFO size */
-	BUILD_BUG_ON(ARRAY_SIZE(cdns->response_buf) < CDNS_MCP_CMD_LEN + 2);
-
-	num_resp = cdns_readl(cdns, CDNS_MCP_FIFOSTAT);
-	num_resp &= CDNS_MCP_RX_FIFO_AVAIL;
-	if (num_resp > ARRAY_SIZE(cdns->response_buf)) {
-		dev_warn(cdns->dev, "RX AVAIL %d too long\n", num_resp);
-		num_resp = ARRAY_SIZE(cdns->response_buf);
-	}
-
-	cmd_base = CDNS_MCP_CMD_BASE;
-
-	for (i = 0; i < num_resp; i++) {
-		cdns->response_buf[i] = cdns_readl(cdns, cmd_base);
-		cmd_base += CDNS_MCP_CMD_WORD_LEN;
-	}
-}
-
 static int cdns_update_slave_status(struct sdw_cdns *cdns,
 				    u64 slave_intstat)
 {
-- 
2.30.2


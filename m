Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FD863F20D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 14:51:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1009B1748;
	Thu,  1 Dec 2022 14:51:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1009B1748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669902717;
	bh=kD0kEAeoldjlqC1C6apG3EA9mbg2KW87/ZXQsBYFTEM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDUJOxB8CYi57hZQajQjhaBo9ZfEtfP9I9Kgq9tHSeYstc8eb5AMZ4edKyP8aby/9
	 PlWUaa96KTCB0QGVFP5LYXzATo54RSk9lSOdJ9l0xeCq32aCiEZeQECFlx0HHLsc3S
	 s6LkCneHm0RhE1RBT6OFUH39v3o/ekze3Q5eQFiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DABA9F80557;
	Thu,  1 Dec 2022 14:48:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5727F805C0; Thu,  1 Dec 2022 14:48:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78ACBF804D0
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 14:48:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78ACBF804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="q+T7YibB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B15l1vA016609; Thu, 1 Dec 2022 07:48:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=UDUObvTRaFOUdD9rv8GBXPx2j6+kC61QN/WmZ7u8zjc=;
 b=q+T7YibByzd765Cy9Tf6/b7PaEDV5TokX6BcNq0l2al3IS8SoLTy4Rr+G7C29DGNDZD3
 StoDnLZK4PcPNMtCt2rhxmZXCcFQO94zjzSpWS8SXFQoFPbHegfI/3HBgaGLo1MLZm+F
 eAbJOX166t0FuR93mhtE8aMdf+h2Zv8ETIH7TLSBqAIuH+Pe9DFMjM0/ZisjATBIMpi2
 eV7n8GhAQLajEDYIn0aiGkFdf4L5FBP+a07/OUIARZWhnULLOMWx46elWndHIq9A1Zqb
 VQzcYve9BfOLMqPQVsU3j8r0P4zysJgL+sZbz3ZNvzlFeLsJfb4V9sX75gAWmRnXUanI 4Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3m6k75rhqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 07:48:48 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 1 Dec
 2022 07:48:45 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 1 Dec 2022 07:48:45 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D93F1B12;
 Thu,  1 Dec 2022 13:48:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/3] soundwire: cadence: Don't overflow the command FIFOs
Date: Thu, 1 Dec 2022 13:48:43 +0000
Message-ID: <20221201134845.4055907-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201134845.4055907-1-rf@opensource.cirrus.com>
References: <20221201134845.4055907-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lr2PW5dGGM8nM_Q84jPzwDLaJ1nemvP8
X-Proofpoint-GUID: lr2PW5dGGM8nM_Q84jPzwDLaJ1nemvP8
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

The command FIFOs are 8 entries long, so change CDNS_MCP_CMD_LEN to 8.

CDNS_MCP_CMD_LEN was originally 32, which would lead to cdns_xfer_msg()
writing up to 32 commands into the FIFO, so any message longer than 8
commands would fail.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2f52a5177caa ("soundwire: cdns: Add cadence library")
---
 drivers/soundwire/cadence_master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index a1de363eba3f..27699f341f2c 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -127,7 +127,8 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 
 #define CDNS_MCP_CMD_BASE			0x80
 #define CDNS_MCP_RESP_BASE			0x80
-#define CDNS_MCP_CMD_LEN			0x20
+/* FIFO can hold 8 commands */
+#define CDNS_MCP_CMD_LEN			8
 #define CDNS_MCP_CMD_WORD_LEN			0x4
 
 #define CDNS_MCP_CMD_SSP_TAG			BIT(31)
-- 
2.30.2


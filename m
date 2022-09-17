Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D895C5BB935
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Sep 2022 17:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B22F15F9;
	Sat, 17 Sep 2022 17:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B22F15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663429809;
	bh=A9WniNPPq3o5d3/WIUkoNLpzB40HLRBwwfvQ8Dl4zbI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWu+oLcRfPoszz46GIhRSAjPbMkOR9NgvVJ3xzLnPup+aBgp0/cmt6P8jj2YYv4B2
	 06q9cFxXG9S+Lc9eJGUqAOtZiNbJOTSXvNZ+mvl0ZEIhDrvFinQsGU6dMM5XS7AMNI
	 U8iIuc4H4zU3LmVh+aAgGio5zgw+Yw+zvdNBivJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCFC9F8053A;
	Sat, 17 Sep 2022 17:48:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 348F9F80249; Sat, 17 Sep 2022 17:48:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB0B0F80249
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 17:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB0B0F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="bZ6olJVg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28HFmbdC028028;
 Sat, 17 Sep 2022 10:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=vJHaMLJvcCzzgtqNWiXZsB/9X6s3SfKiDcoQeDm4FFM=;
 b=bZ6olJVgI8XqZpFG5M1+zLqLGu31bSekptfqhHSvQGQumrFPJm7BLHXXA9rjjuGUg06V
 OnWi8XYDSncvf8QKEmJAb2KyJypcNJm1zM2HtU6bUCycXBe/nNjtTO7Rv3LKkYKLRxmf
 N3f2tu9qYhlBY5A8XD0fEjR0yuYDkh8btY/W3jl3Qfjt/2c1rvjzCbw/vWraEmdUBJVT
 hfSG5N6kE2ylGK7PDHIYt8T7303ZAI0N+eV+PzmSg8y7FVqdplkz5x8grWBU14KMhhuV
 ccwlBbXoZvSqKUUQPRL+pnCCYSm3D0+UqVjRaimJX0Eb0YliuI6UOncEETU+4dKm/Wu1 Tg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jnbn08bd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Sep 2022 10:48:37 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Sat, 17 Sep
 2022 10:48:35 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Sat, 17 Sep 2022 10:48:35 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.112])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 411482BA;
 Sat, 17 Sep 2022 15:48:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH 2/2] soundwire: cadence: Simplify error paths in
 cdns_xfer_msg()
Date: Sat, 17 Sep 2022 16:48:22 +0100
Message-ID: <20220917154822.690472-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220917154822.690472-1-rf@opensource.cirrus.com>
References: <20220917154822.690472-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VTRd6noz-XehbOX2jNDJSU56AgkzW945
X-Proofpoint-ORIG-GUID: VTRd6noz-XehbOX2jNDJSU56AgkzW945
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

There's no need to goto an exit label to return from cdns_xfer_msg().
It doesn't do any cleanup, only a return statement.

Replace the gotos with returns.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/cadence_master.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 3543a923ee6b..30b8c628fdbd 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -709,17 +709,14 @@ cdns_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg)
 		ret = _cdns_xfer_msg(cdns, msg, cmd, i * CDNS_MCP_CMD_LEN,
 				     CDNS_MCP_CMD_LEN, false);
 		if (ret != SDW_CMD_OK)
-			goto exit;
+			return ret;
 	}
 
 	if (!(msg->len % CDNS_MCP_CMD_LEN))
-		goto exit;
+		return SDW_CMD_OK;
 
-	ret = _cdns_xfer_msg(cdns, msg, cmd, i * CDNS_MCP_CMD_LEN,
-			     msg->len % CDNS_MCP_CMD_LEN, false);
-
-exit:
-	return ret;
+	return _cdns_xfer_msg(cdns, msg, cmd, i * CDNS_MCP_CMD_LEN,
+			      msg->len % CDNS_MCP_CMD_LEN, false);
 }
 EXPORT_SYMBOL(cdns_xfer_msg);
 
-- 
2.30.2


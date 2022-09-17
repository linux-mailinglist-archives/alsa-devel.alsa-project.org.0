Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF45BB933
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Sep 2022 17:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B9D1637;
	Sat, 17 Sep 2022 17:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B9D1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663429781;
	bh=KJ2d1h/ScbAm9LkjGUq+lGDs8/mqJolHtgttuMLeHvs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xfo0s7Cml1I+bCi1RYc32pd9HzPl4qAVvgDN5JMrFeDuVIkbEFh/99iQrleKdq5zJ
	 oTRy8TNj5jLrmYevkvDzV22ByKCmFBvUMPCI0MEjFMyhbAn88PSjLKJZq/mz8w8uvM
	 T0XaRanh7kERriSNKBWzC3zRAgS6/jk61Xf4qYwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 891ECF8047B;
	Sat, 17 Sep 2022 17:48:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9977EF80423; Sat, 17 Sep 2022 17:48:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 198D4F800E5
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 17:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 198D4F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hPLlzzQH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28HEvR6I010074;
 Sat, 17 Sep 2022 10:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=TB36sGrqFlva4VA79Qj0rQIM5Mb0u8akbGYI3B1YqH8=;
 b=hPLlzzQHefNSLHKm2ObwbkV3lI1s+UMuR2lji3azldHAqo6iAaFnJGkf5yp1zxK1XQEH
 wPXLyHCZuKghJPRLfUTzZDXrvoJ0ggsfuk9PPXolGinQTcdc0r6OLjVkEnDbI2h3un6I
 70LaIEGC9NfilsOPV1l7AQuCw3Dc+XTAyG6OZ/e/Tx5A7/pjBAjlU7u3cF7Sc0OD7bzL
 xC4Ai91Pcf2GZ2c9TaK2d6/95NbEZyorRs5tsYeWP8YZ4BTKO+hvHaAjDFJwrO3wRhFM
 31BFPIz6K8LJXK0un8Jno+oDortDnpGIDnd+BwTv+Wxsmuq0Mu+Fec3cK8CxBB4ADxgk qQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jnanmgavj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Sep 2022 10:48:33 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Sat, 17 Sep
 2022 10:48:31 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Sat, 17 Sep 2022 10:48:31 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.112])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EDBB2468;
 Sat, 17 Sep 2022 15:48:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH 1/2] soundwire: cadence: Fix error check in cdns_xfer_msg()
Date: Sat, 17 Sep 2022 16:48:21 +0100
Message-ID: <20220917154822.690472-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eUpNl5-D3xga4PDjQSa0UWmMPdyK_GEb
X-Proofpoint-ORIG-GUID: eUpNl5-D3xga4PDjQSa0UWmMPdyK_GEb
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

_cdns_xfer_msg() returns an sdw_command_response value, not a
negative error code.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/cadence_master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index ca241bbeadd9..3543a923ee6b 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -708,7 +708,7 @@ cdns_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg)
 	for (i = 0; i < msg->len / CDNS_MCP_CMD_LEN; i++) {
 		ret = _cdns_xfer_msg(cdns, msg, cmd, i * CDNS_MCP_CMD_LEN,
 				     CDNS_MCP_CMD_LEN, false);
-		if (ret < 0)
+		if (ret != SDW_CMD_OK)
 			goto exit;
 	}
 
-- 
2.30.2


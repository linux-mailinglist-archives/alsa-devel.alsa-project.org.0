Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7345377D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:30:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B40179C;
	Tue, 16 Nov 2021 17:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B40179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637080228;
	bh=UO8lnk/ahP0yjfaNEthpxrJ7KQH05/Ehej5LipvZ/yA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KOchoaunV6vDGqi4L73MwiRPqw233yMDSr83yGkaqrnbRCsj13lruVxCCblxOdBmq
	 c7/YhLpGx/w/nz01XC2nHou0/mft9OyoSiokkzjM/wpsyTSuCPSsSJkoWqGNr+VXwW
	 fwbKRMdBUwkofFg+3Tf0Di1J3VOUhau7wUGjStJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A1ACF804E0;
	Tue, 16 Nov 2021 17:27:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C438AF804FE; Tue, 16 Nov 2021 17:27:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6872BF802C4
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6872BF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="M3lhuGpS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7fwoA025797;
 Tue, 16 Nov 2021 10:27:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=FEUrRir95EdRlOkdHZ8wD6uApb8cU96x+YvCL8fRpZA=;
 b=M3lhuGpSGxysTKW+9clVz289kgPImduIr69OhSjBCCV2ciLgYwqqk0/xcHuRUtdWxZKv
 Tb9ojHO4X7jT5nDbF0Ez7PdcOCy0sxvWCfJQhOGNequl4Aqq1t8Iphdt5eBIF63C4BeC
 9WsU5NmzVhwmoOtMnIKprE2paz2i6kM0V3mv00U9c37wLGhJmEWnJorcvS8MJYhw2xBN
 0qs4iRSclup8z0PIjC8UJvkbcu14+1wWhwqvXKHfSrP5XGeXmgSkS5kz0QD0B6Ob42qu
 LCKCyRRHDb19pXra4HyTGapfklCOylpPpBOEOUTgscc8IWoSUQte+WdXqhsoFJfNUQz9 /Q== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cbjn01xqf-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:26:59 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:26:57 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:26:57 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.41])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4B90F11DB;
 Tue, 16 Nov 2021 16:26:57 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/4] ASoC: cs42l42: Remove redundant writes to
 RS_PLUG/RS_UNPLUG masks
Date: Tue, 16 Nov 2021 16:26:49 +0000
Message-ID: <20211116162652.45225-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116162652.45225-1-rf@opensource.cirrus.com>
References: <20211116162652.45225-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: y-kATlKPsGLn2Ze-7OYJ5jvrkTrbuxCP
X-Proofpoint-ORIG-GUID: y-kATlKPsGLn2Ze-7OYJ5jvrkTrbuxCP
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

The RS_PLUG and RS_UNPLUG interrupt masks are always written as 1 so
those writes are redundant and can be deleted.

This makes it completely clear in the code that only the TS_PLUG and
TS_UNPLUG masks are being changed.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 92bdc3a355ff..3674f73301dc 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1320,12 +1320,8 @@ static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
 	/* Unmask tip sense interrupts */
 	regmap_update_bits(cs42l42->regmap,
 		CS42L42_TSRS_PLUG_INT_MASK,
-		CS42L42_RS_PLUG_MASK |
-		CS42L42_RS_UNPLUG_MASK |
 		CS42L42_TS_PLUG_MASK |
 		CS42L42_TS_UNPLUG_MASK,
-		(1 << CS42L42_RS_PLUG_SHIFT) |
-		(1 << CS42L42_RS_UNPLUG_SHIFT) |
 		(0 << CS42L42_TS_PLUG_SHIFT) |
 		(0 << CS42L42_TS_UNPLUG_SHIFT));
 }
@@ -1335,12 +1331,8 @@ static void cs42l42_init_hs_type_detect(struct cs42l42_private *cs42l42)
 	/* Mask tip sense interrupts */
 	regmap_update_bits(cs42l42->regmap,
 				CS42L42_TSRS_PLUG_INT_MASK,
-				CS42L42_RS_PLUG_MASK |
-				CS42L42_RS_UNPLUG_MASK |
 				CS42L42_TS_PLUG_MASK |
 				CS42L42_TS_UNPLUG_MASK,
-				(1 << CS42L42_RS_PLUG_SHIFT) |
-				(1 << CS42L42_RS_UNPLUG_SHIFT) |
 				(1 << CS42L42_TS_PLUG_SHIFT) |
 				(1 << CS42L42_TS_UNPLUG_SHIFT));
 
-- 
2.11.0


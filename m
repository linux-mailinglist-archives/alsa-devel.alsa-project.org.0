Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD82842F405
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD2A1775;
	Fri, 15 Oct 2021 15:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD2A1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305276;
	bh=5SuA6+e459BVriFtuooNqukY4+NIVkHGUvZgd2+0hyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z6qggGyxtN2dNh/nBKx/PrVJJ82YTYFg5MjogMhZfs3LR7rcCg3/YOXvFvyTIBNSq
	 CqIteE/qPftnUEFuJohbUbmwgb1o2KnLZHaCrSpMZWYJCrp+aWRYAca6GwNh+il7TC
	 e2i+dL7KpKr+u27BeKpJNerySqvr75A2B5dtWsV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B593DF80536;
	Fri, 15 Oct 2021 15:37:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDFA5F80511; Fri, 15 Oct 2021 15:36:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F977F804EB
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F977F804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pKY1TKMn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F4c2t7023483; 
 Fri, 15 Oct 2021 08:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=RGJD8vABM3n+dz6ADGavc8MFL5Y167NLIR1g7/+WtxM=;
 b=pKY1TKMnwUTBxTCe7Z3401I4oXbscJifJBCmEAhPfDi3qj9zf6A6QtGOzK7KHuO6uDYC
 xMyJPOvQRME4ktpOvg7PqmYripzuh0H2ve1a/Up7NdLpy/3lwAOk4lnZfJH7UlfZ3GFB
 x7xg4wVbuFmopcYKfVpUe6L6YhcXcawLvdOEJUOSWoPLUO4l63yYJ4MWD8dSqHUk4usv
 +JKfs1Tft1y6rABfdnFSQMgp1Y87SwVxHn9KA/mSob8jZazWjxFgLwXVpM3RKG19jzEn
 pbtXUzWT7e1raBBG5AO14LU8594sGxBZkKXh771z3TqO4sbvQAmzKGBMLjXZ1ABPh0gK 5g== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5v-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:25 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9E4F846D;
 Fri, 15 Oct 2021 13:36:25 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 14/16] ASoC: cs42l42: Mark OSC_SWITCH_STATUS register volatile
Date: Fri, 15 Oct 2021 14:36:17 +0100
Message-ID: <20211015133619.4698-15-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ljmEU0sDgK4pl_qnb6vWD1dL_hIHC8qb
X-Proofpoint-GUID: ljmEU0sDgK4pl_qnb6vWD1dL_hIHC8qb
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

OSC_SWITCH_STATUS is a volatile register indicating the current state
of the clock switch logic.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 05b8ae62b20d..8e4a43c5a120 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -52,7 +52,6 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_RSENSE_CTL1,			0x40 },
 	{ CS42L42_RSENSE_CTL2,			0x00 },
 	{ CS42L42_OSC_SWITCH,			0x00 },
-	{ CS42L42_OSC_SWITCH_STATUS,		0x05 },
 	{ CS42L42_RSENSE_CTL3,			0x1B },
 	{ CS42L42_TSENSE_CTL,			0x1B },
 	{ CS42L42_TSRS_INT_DISABLE,		0x00 },
@@ -331,6 +330,7 @@ static bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
 	case CS42L42_DEVID_CD:
 	case CS42L42_DEVID_E:
 	case CS42L42_MCLK_STATUS:
+	case CS42L42_OSC_SWITCH_STATUS:
 	case CS42L42_TRSENSE_STATUS:
 	case CS42L42_HS_DET_STATUS:
 	case CS42L42_ADC_OVFL_STATUS:
-- 
2.11.0


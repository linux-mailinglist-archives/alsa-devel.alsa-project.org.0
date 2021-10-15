Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0042C42F3D8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:39:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DE80170D;
	Fri, 15 Oct 2021 15:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DE80170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305150;
	bh=fzKNmb99UVUuLUgRm2Tzv8Cr5z6y/YNvop2z7JrnL18=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qh1z0YLDQ8OMZGltmpdcE9LKDoADJ9XOFw5f1b1Yw0YydJi1KvSKmjJHvWs6GE2iP
	 NLGV9VGj/wSfuq+bcOdzmFytZr/TtNeWxR5M0W45LDmaEtbT16cyX1V3JljL5T5EBT
	 5/fIARUBRqoUS/CsBkuaarb0Xj0Cks4en/eV0G+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD59FF8012E;
	Fri, 15 Oct 2021 15:36:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0467F80508; Fri, 15 Oct 2021 15:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43CBFF80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CBFF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MR1AJibc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FCfErL009690; 
 Fri, 15 Oct 2021 08:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=mIklA0ahLiJHhtti22wmtbw7urwvSdXiIps9G9njPks=;
 b=MR1AJibc9ABZYWJuo+xoQJhG1T9V9oKU9+5afhCk2zm2M9h3nKxjW4ieVE0Q3OGm8fR6
 LrX0+2m+KFw8EmhnmgyYtz5SQ1WnWOFS23M+afSUSARBbpsNoZ/w6FVJzbcMactuvv2E
 QQuCUgQJQCiP6T7de9T+4kgY9Obw2Kl/PZunbFtq6ZUmOxWcqqEcoyUmfWMpIm025pDW
 YOcmPLfgs8At9yjMaukSDKNIHnurghWc2wumvlTWl9MFE74YWmgOYhRpK9OKFpcGG++f
 HE07L5zphAz//OOkYAtJOYPR5qIKSBfrEzzAL+rl2hAMlUSLquUwb23UdrhTj7gHdu12 5w== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:24 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:22 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9503FB2F;
 Fri, 15 Oct 2021 13:36:22 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 03/16] ASoC: cs42l42: Correct some register default values
Date: Fri, 15 Oct 2021 14:36:06 +0100
Message-ID: <20211015133619.4698-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Q9W2ffRrChfZKcxDCuBfaso0Q_lVsP92
X-Proofpoint-GUID: Q9W2ffRrChfZKcxDCuBfaso0Q_lVsP92
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

Some registers had wrong default values in cs42l42_reg_defaults[].

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
---
 sound/soc/codecs/cs42l42.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index c52393301294..a5c460f2ec8c 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -93,7 +93,7 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_ASP_RX_INT_MASK,		0x1F },
 	{ CS42L42_ASP_TX_INT_MASK,		0x0F },
 	{ CS42L42_CODEC_INT_MASK,		0x03 },
-	{ CS42L42_SRCPL_INT_MASK,		0xFF },
+	{ CS42L42_SRCPL_INT_MASK,		0x7F },
 	{ CS42L42_VPMON_INT_MASK,		0x01 },
 	{ CS42L42_PLL_LOCK_INT_MASK,		0x01 },
 	{ CS42L42_TSRS_PLUG_INT_MASK,		0x0F },
@@ -130,7 +130,7 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_MIXER_CHA_VOL,		0x3F },
 	{ CS42L42_MIXER_ADC_VOL,		0x3F },
 	{ CS42L42_MIXER_CHB_VOL,		0x3F },
-	{ CS42L42_EQ_COEF_IN0,			0x22 },
+	{ CS42L42_EQ_COEF_IN0,			0x00 },
 	{ CS42L42_EQ_COEF_IN1,			0x00 },
 	{ CS42L42_EQ_COEF_IN2,			0x00 },
 	{ CS42L42_EQ_COEF_IN3,			0x00 },
-- 
2.11.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD13E1941
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 18:13:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AFC1169F;
	Thu,  5 Aug 2021 18:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AFC1169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628179992;
	bh=QpShPLflcgoz6Fh3+2mqbu+FD5q8gfwCSS2f3i38X2I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OphxEzMHxMY6+kb0glT8+OrQZESYp8d9wqKWj+fX/iF95sq7HqdarEehm+RP0AGG8
	 K5CE551r+eW+2rElF2ZaWRWF+t+5gevrnqGMYvtmxn5V+OOktanDrHItd/0+pjT97H
	 skxk84WLu8g4+UQ2NRvw10qYth7FlMWOgqRgcvZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C4D3F804E4;
	Thu,  5 Aug 2021 18:11:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7627BF80169; Thu,  5 Aug 2021 18:11:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CABE0F8016D
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 18:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CABE0F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="VZ8pogQh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 175EPV3W027692; 
 Thu, 5 Aug 2021 11:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=PeQp4wAnIMZqw5MsxPEzSfQRQuBOXoms0dnVTKaTwcA=;
 b=VZ8pogQhNlCG7kkhPYeddri98Sha2h+GUKQV9V1M0tXz8yxmGFlJBenPs2u783Rpxdtg
 S0tMBmsa/h/lApZ7hCj4/FWY4SOwCMB/R1ySWqWcCyjk5gvErv0y95Th68D3VYXiDNcx
 bGVOOwdBOkW8VvBVcdp6BuH1wrFTSlXU8RbBI7p8OdKUxOAF8RNYJRt34p6ON7H1h1qh
 GWIw5QHK/5g/TzASp8Voa0HY+g/3Z8cQ7GP18NYbN7JuHpUwSiJ40uvH/yhRrRG9jzYh
 DTEOeJkoQEFMp+66SNRgvF3MMY3/4/sMe5q1SrZZ8o+fc2EDByXJnX08l+014xk/60/2 /g== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a8c61rku6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 05 Aug 2021 11:11:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 5 Aug
 2021 17:11:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 5 Aug 2021 17:11:14 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.37])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0BA5E46E;
 Thu,  5 Aug 2021 16:11:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/8] ASoC: cs42l42: Fix LRCLK frame start edge
Date: Thu, 5 Aug 2021 17:11:05 +0100
Message-ID: <20210805161111.10410-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805161111.10410-1-rf@opensource.cirrus.com>
References: <20210805161111.10410-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EJoAcN1mOFoVAMaB-_GP5EWzItAQDOfk
X-Proofpoint-ORIG-GUID: EJoAcN1mOFoVAMaB-_GP5EWzItAQDOfk
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=896 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050099
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

An I2S frame starts on the falling edge of LRCLK so ASP_STP must
be 0.

At the same time, move other format settings in the same register
from cs42l42_pll_config() to cs42l42_set_dai_fmt() where you'd
expect to find them, and merge into a single write.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
---
 sound/soc/codecs/cs42l42.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index c96549fe6ab2..02486329a570 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -667,15 +667,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 					CS42L42_FSYNC_PULSE_WIDTH_MASK,
 					CS42L42_FRAC1_VAL(fsync - 1) <<
 					CS42L42_FSYNC_PULSE_WIDTH_SHIFT);
-			snd_soc_component_update_bits(component,
-					CS42L42_ASP_FRM_CFG,
-					CS42L42_ASP_5050_MASK,
-					CS42L42_ASP_5050_MASK);
-			/* Set the frame delay to 1.0 SCLK clocks */
-			snd_soc_component_update_bits(component, CS42L42_ASP_FRM_CFG,
-					CS42L42_ASP_FSD_MASK,
-					CS42L42_ASP_FSD_1_0 <<
-					CS42L42_ASP_FSD_SHIFT);
 			/* Set the sample rates (96k or lower) */
 			snd_soc_component_update_bits(component, CS42L42_FS_RATE_EN,
 					CS42L42_FS_EN_MASK,
@@ -775,6 +766,18 @@ static int cs42l42_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	/* interface format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
+		/*
+		 * 5050 mode, frame starts on falling edge of LRCLK,
+		 * frame delayed by 1.0 SCLKs
+		 */
+		snd_soc_component_update_bits(component,
+					      CS42L42_ASP_FRM_CFG,
+					      CS42L42_ASP_STP_MASK |
+					      CS42L42_ASP_5050_MASK |
+					      CS42L42_ASP_FSD_MASK,
+					      CS42L42_ASP_5050_MASK |
+					      (CS42L42_ASP_FSD_1_0 <<
+						CS42L42_ASP_FSD_SHIFT));
 		break;
 	default:
 		return -EINVAL;
-- 
2.11.0


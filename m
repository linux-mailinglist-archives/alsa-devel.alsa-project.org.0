Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75F32A76A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:10:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768BA185A;
	Tue,  2 Mar 2021 18:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768BA185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614705032;
	bh=MnGm5k7nvQ+8gMg3CxvB9sfUTH3hx6lSv/ewpiJAge4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKRg/UDOu7E38CRd2UWDcCMI1OSwuI6yohf1C2EDwIa04+DxSkAkT303Cr14+SoBE
	 YTWmbL6tW9NfiZeLeRYA7JnCJfLkvlPB1gtU/oToGFPbTuS3MvCNV3N84bXMSEW5I7
	 Gf1TbAX0CXrV4XEGlLYnLCbT/SUjCYmvpL0Vhg1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E3D1F804E5;
	Tue,  2 Mar 2021 18:05:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFB44F804B4; Tue,  2 Mar 2021 18:05:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14EA0F802E7
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14EA0F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XczIc32S"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122H1q3R022910; Tue, 2 Mar 2021 11:05:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=BlITpc+8LUc8YUUNDZ/zH8afps/bPW5/12PI8EDBGfg=;
 b=XczIc32Sfb/7lkP3LQfaYc/Y5RlTZYYo96b5SO5yhvfFCGEz9wIxOARbGsVmDouyFus2
 BnlTxmE/sVcHKwPvFzIA8nBLl28KIa4jHjpRQz0QBhIFKQnZCXsZGJQIFaxriMU94osO
 1mUmTHxc6kHX0CcH21NIIazeXwO76XLb+/8a76ej4piPtsxBKvqOV35dQ9+RdRJyhUPt
 j8Opfnx/ehI56qR2trh8ey1bO91tvCFLKX4o99LZM3qq9lRoGwwIVUaY9qNScVhv+4tn
 d3bJD6s3eAizPYX6VcVN4m+ZwHJCVfN6BhZtkgh70t0RbWsbIcIRHzotsQSRdqld5Adt /A== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc6usg9-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Mar 2021 11:05:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Mar 2021
 17:05:02 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 2 Mar 2021 17:05:02 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 85FC511D6;
 Tue,  2 Mar 2021 17:05:02 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>
Subject: [PATCH 13/15] ASoC: cs42l42: Only start PLL if it is needed
Date: Tue, 2 Mar 2021 17:04:52 +0000
Message-ID: <20210302170454.39679-14-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020131
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

From: Richard Fitzgerald <rf@opensource.cirrus.com>

The PLL is only needed for sclk < 11289600 Hz and cs42l42_pll_config()
will not configure it for higher rates. So it must only be enabled
when it is needed.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 5755f8baddbcf..68b5a450623d3 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -855,8 +855,9 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	} else {
 		if (!cs42l42->stream_use) {
 			/* SCLK must be running before codec unmute */
-			snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
-						      CS42L42_PLL_START_MASK, 1);
+			if ((cs42l42->bclk < 11289600) && (cs42l42->sclk < 11289600))
+				snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
+							      CS42L42_PLL_START_MASK, 1);
 
 			/* Mark SCLK as present, turn off internal oscillator */
 			regmap_multi_reg_write(cs42l42->regmap, cs42l42_to_sclk_seq,
-- 
2.30.1


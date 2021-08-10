Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2A3E7C9C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 17:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C82031721;
	Tue, 10 Aug 2021 17:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C82031721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628610157;
	bh=moHAKXMsDK4Zr8BEVxDMHt1+lnmu5OyMiUtFaX3HpPE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mGAt/1zxRQ5dnz83LSQD72ae6QdfFTPqzOe5pRgSGwLIGd9xBoHPvvoJdkE1t79YA
	 v6uMFszZqfJpkRzZnjLIqfmM7WaUT0L2UsMuJ6o7ok6hknajnR0sTEgTfNRnFGhpVe
	 U3y/zUwrLUrreZnPKWgUrfgyRXYu9fWjDIQWmeZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C2A5F80518;
	Tue, 10 Aug 2021 17:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12FFBF802A0; Tue, 10 Aug 2021 17:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9046F8016B
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9046F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LHdV+355"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17AAlVv8027584; 
 Tue, 10 Aug 2021 10:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=1G77KCqb3qWR6iff9g2FFP7dpQlFTfAw5xgISoV0nQY=;
 b=LHdV+355zYmiva9Ul4lIZvbLpNuVUvPesjI9z8jCA9YjIGMyPfd8bCD5wTDrQRx9HkoA
 UwQdi2BtEaU0vSih7IL77r3TrBljOv2u34qnR+T/IHniJeeuZbmm6DcQDxBuQ/e9UXmy
 Hp0QUNSSXhxdVg6w9rzioqmMs4g823lkQlLkn9fEypztLLav6cdMVoQ3flrQxaSci9p7
 qlINOpe+pYLAhctkZMg0B1J6cp3TfSVVeQXoZHOYYaWNTwqkGOVtPuCPQDnUEtXlQiRe
 GS0JpQBZIdWFH0xDy/Fj8qNNuQ6+XpJk3AyogHBGfU7eMds5qcKDBIj3QNyZ7z0HYAf0 UA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3abr0u0e2c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Aug 2021 10:38:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 10 Aug
 2021 16:38:03 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 10 Aug 2021 16:38:03 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.221])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 48FDC2A9;
 Tue, 10 Aug 2021 15:38:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 03/12] ASoC: cs42l42: Always configure both ASP TX channels
Date: Tue, 10 Aug 2021 16:37:50 +0100
Message-ID: <20210810153759.24333-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810153759.24333-1-rf@opensource.cirrus.com>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mRZ0SOKAFpoU2utyZac-bWhJmNwCOkq5
X-Proofpoint-GUID: mRZ0SOKAFpoU2utyZac-bWhJmNwCOkq5
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100099
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

An I2S frame always has two slots (left and right) even when sending
mono. The right channel (channel 2) of ASP TX will always have the
same bit width as the left channel and will always be on the high
phase of LRCLK.

The previous implementation always passed the field masks for both
channels to snd_soc_component_update_bits() but for mono the written value
only contained the settings for channel 1. The result was that for mono
channel 2 was set to 8-bit (which is an invalid configuration) with both
channels on the low phase of LRCLK.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 585e7079de0e ("ASoC: cs42l42: Add Capture Support")
---
 sound/soc/codecs/cs42l42.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index a43cdfb6223b..5dc3a30272a4 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -848,11 +848,10 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	switch(substream->stream) {
 	case SNDRV_PCM_STREAM_CAPTURE:
-		if (channels == 2) {
-			val |= CS42L42_ASP_TX_CH2_AP_MASK;
-			val |= width << CS42L42_ASP_TX_CH2_RES_SHIFT;
-		}
-		val |= width << CS42L42_ASP_TX_CH1_RES_SHIFT;
+		/* channel 2 on high LRCLK */
+		val = CS42L42_ASP_TX_CH2_AP_MASK |
+		      (width << CS42L42_ASP_TX_CH2_RES_SHIFT) |
+		      (width << CS42L42_ASP_TX_CH1_RES_SHIFT);
 
 		snd_soc_component_update_bits(component, CS42L42_ASP_TX_CH_AP_RES,
 				CS42L42_ASP_TX_CH1_AP_MASK | CS42L42_ASP_TX_CH2_AP_MASK |
-- 
2.11.0


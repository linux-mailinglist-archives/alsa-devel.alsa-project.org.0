Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD932A76F
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:12:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F98B18A4;
	Tue,  2 Mar 2021 18:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F98B18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614705123;
	bh=c0syrDsPy1P9AsrNWM7s9JDVLeONlq6YOw67iPnk39g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLVEiSit1lR4wPxDxwZRNc0UqL82uCcxI8AdujfoAHLrp1fSb6Wceb4GzGmQGRwxc
	 OgAnCtcTI4xtoL0zVJgCeODyB8plu8e/kueN9kjMPZIgu9msaJS4TFGl8I3sRvLLNK
	 cQ8uus8mVZKoJwwNy8NijiUkh7qgXQOELFMn8Y4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B169F80518;
	Tue,  2 Mar 2021 18:05:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B635F804BD; Tue,  2 Mar 2021 18:05:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B55EAF8032C
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B55EAF8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="B6aJaQHA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122H1q3S022910; Tue, 2 Mar 2021 11:05:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ooarnE2nUSCDeXk59FI8XH/GTKr4wdSqYy9xhrQFVEw=;
 b=B6aJaQHAv/FPhyGDEvJ/05/q+s86+9ZMBq1oZyTw3Fe8AHZeVNuySEVRGgu1caI8xQGu
 U/ZILiVFx4ag5KjVNmyM5WnjdLtCn84aFEqlVsWL8r1e8pT0bhNAD5i3PvBkZTgFObMu
 CRJyT8wHgn7s5r5RTEQZwPwv7bg9NZTE1wyIop7/g1hfvpLx5F/YK5b6vOoWUxQS9Cin
 nO2bZ/JyZAAHMrD8qgUGwpdWLcgxkaKzlccctrWIOcJ1SNy85Q1k5bcdjtjwbM0YGm6x
 za9+QHOLWepEgu+cC7PoVfVZvlshpZj89YYo1bOlRgJydKgtPLJY5u7mlKScwm1sf3QT Vw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36ymc6usg9-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Mar 2021 11:05:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 2 Mar 2021
 17:05:03 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 2 Mar 2021 17:05:03 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D07C411D0;
 Tue,  2 Mar 2021 17:05:02 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>
Subject: [PATCH 14/15] ASoC: cs42l42: Wait for PLL to lock before switching to
 it
Date: Tue, 2 Mar 2021 17:04:53 +0000
Message-ID: <20210302170454.39679-15-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=952 bulkscore=0 impostorscore=0
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

The PLL should have locked before using it to supply MCLK.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 12 +++++++++++-
 sound/soc/codecs/cs42l42.h |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 68b5a450623d3..96f4e98ceaa0b 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -830,6 +830,7 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 	unsigned int regval;
 	u8 fullScaleVol;
+	int ret;
 
 	if (mute) {
 		/* Mute the headphone */
@@ -855,9 +856,18 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	} else {
 		if (!cs42l42->stream_use) {
 			/* SCLK must be running before codec unmute */
-			if ((cs42l42->bclk < 11289600) && (cs42l42->sclk < 11289600))
+			if ((cs42l42->bclk < 11289600) && (cs42l42->sclk < 11289600)) {
 				snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
 							      CS42L42_PLL_START_MASK, 1);
+				ret = regmap_read_poll_timeout(cs42l42->regmap,
+							       CS42L42_PLL_LOCK_STATUS,
+							       regval,
+							       (regval & 1),
+							       CS42L42_PLL_LOCK_POLL_US,
+							       CS42L42_PLL_LOCK_TIMEOUT_US);
+				if (ret < 0)
+					dev_warn(component->dev, "PLL failed to lock: %d\n", ret);
+			}
 
 			/* Mark SCLK as present, turn off internal oscillator */
 			regmap_multi_reg_write(cs42l42->regmap, cs42l42_to_sclk_seq,
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index a0c87f2326e69..7a5048dfade20 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -756,6 +756,8 @@
 #define CS42L42_NUM_SUPPLIES	5
 #define CS42L42_BOOT_TIME_US	3000
 #define CS42L42_CLOCK_SWITCH_DELAY_US 150
+#define CS42L42_PLL_LOCK_POLL_US	250
+#define CS42L42_PLL_LOCK_TIMEOUT_US	1250
 
 static const char *const cs42l42_supply_names[CS42L42_NUM_SUPPLIES] = {
 	"VA",
-- 
2.30.1


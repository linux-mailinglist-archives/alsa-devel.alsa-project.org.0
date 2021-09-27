Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 021514192EF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 13:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1051693;
	Mon, 27 Sep 2021 13:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1051693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632741390;
	bh=W7AKipCOHDIZSvr0hhRiypGrOB837Kmsh44Yphjovmo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qmYoCN7UMTiZYMZFlhwQS0EFb+Ws+8lKg8dyFEKO5HUNnQ2ragGFHuwOlNknE34dr
	 /c3H6AdM1bXnPXCgumFtDs7PCaxq9DxwGUQapnYfcSnHuafYQ6vCF96g9NREt9LLFK
	 2dEnmrXrJWqVBvxib8GJgmxWDLea4s6YbYYcpnWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFDA8F8026D;
	Mon, 27 Sep 2021 13:15:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8121F8026D; Mon, 27 Sep 2021 13:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63734F80161
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 13:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63734F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fq6u+CC6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RAqgeq021229; 
 Mon, 27 Sep 2021 06:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=XJo4ka3gqx7rJb0J4yKBn1YFN6PiMerkvNWTreoLBRU=;
 b=fq6u+CC6bjsTQMne7KFN4N7oE0EJItTrmAK4lafqaPN8ZPLvNE8wZP2a87hb/jd0C0sB
 OS7qFyuJGVrVLbl6PBXe8SSb8KGz6Y+rdTycL2t+ayUsPEx4aflugc2gZSvd8qnKdhdQ
 wHxAHDCBwggmpJ1wOsukqjZTH+gh/+xYkRMsR71NpyaiixKVH9T5RHZiTrte5sPi3nHn
 MqTtDnEPWK+5bkasTHvXopemnW0lyl4KtqUtn9Tv8fQbuAgDEusoni8cJ2NVjtoLqLaf
 +tHtzdrdQfsMAZFU7OaKs14Nonn5yCRb9GMISwcJHHs5hhhe7F/Mv5RVozDDMvIZymLW Eg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3barbh8ubt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Sep 2021 06:15:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 27 Sep
 2021 12:15:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Mon, 27 Sep 2021 12:15:00 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.205])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 06E48B10;
 Mon, 27 Sep 2021 11:14:59 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH] ASoC: cs42l42: Use two thresholds and increased wait time for
 manual type detection
Date: Mon, 27 Sep 2021 12:14:37 +0100
Message-ID: <20210927111437.18113-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: E3HI_a-C0a0H5ja_pnLI4-z-KQ0EYrzU
X-Proofpoint-ORIG-GUID: E3HI_a-C0a0H5ja_pnLI4-z-KQ0EYrzU
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

Some headsets require very different comparator thresholds for type detection,
as well as longer settling times. In order to detect a larger number of headsets,
use 2 thresholds to give maximum coverage (1.25V and 1.75V), as well as a longer
settling time of 100ms. This will not affect default audotodetect mode
and applies to manual mode type detection only.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 84 +++++++++++++++++++++++++++-----------
 sound/soc/codecs/cs42l42.h |  5 +++
 2 files changed, 66 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 78f8c89410b6..3f202acd4a8e 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1048,7 +1048,8 @@ static struct snd_soc_dai_driver cs42l42_dai = {
 static void cs42l42_manual_hs_type_detect(struct cs42l42_private *cs42l42)
 {
 	unsigned int hs_det_status;
-	unsigned int hs_det_comp;
+	unsigned int hs_det_comp1;
+	unsigned int hs_det_comp2;
 	unsigned int hs_det_sw;
 
 	/* Set hs detect to manual, active mode */
@@ -1063,23 +1064,40 @@ static void cs42l42_manual_hs_type_detect(struct cs42l42_private *cs42l42)
 		(0 << CS42L42_HSBIAS_REF_SHIFT) |
 		(0 << CS42L42_HSDET_AUTO_TIME_SHIFT));
 
+	/* Configure HS DET comparator reference levels. */
+	regmap_update_bits(cs42l42->regmap,
+				CS42L42_HSDET_CTL1,
+				CS42L42_HSDET_COMP1_LVL_MASK |
+				CS42L42_HSDET_COMP2_LVL_MASK,
+				(CS42L42_HSDET_COMP1_LVL_VAL << CS42L42_HSDET_COMP1_LVL_SHIFT) |
+				(CS42L42_HSDET_COMP2_LVL_VAL << CS42L42_HSDET_COMP2_LVL_SHIFT));
+
 	/* Open the SW_HSB_HS3 switch and close SW_HSB_HS4 for a Type 1 headset. */
 	regmap_write(cs42l42->regmap, CS42L42_HS_SWITCH_CTL, CS42L42_HSDET_SW_COMP1);
 
+	msleep(100);
+
 	regmap_read(cs42l42->regmap, CS42L42_HS_DET_STATUS, &hs_det_status);
 
-	hs_det_comp = (hs_det_status & CS42L42_HSDET_COMP1_OUT_MASK) >>
+	hs_det_comp1 = (hs_det_status & CS42L42_HSDET_COMP1_OUT_MASK) >>
 			CS42L42_HSDET_COMP1_OUT_SHIFT;
+	hs_det_comp2 = (hs_det_status & CS42L42_HSDET_COMP2_OUT_MASK) >>
+			CS42L42_HSDET_COMP2_OUT_SHIFT;
 
 	/* Close the SW_HSB_HS3 switch for a Type 2 headset. */
 	regmap_write(cs42l42->regmap, CS42L42_HS_SWITCH_CTL, CS42L42_HSDET_SW_COMP2);
 
+	msleep(100);
+
 	regmap_read(cs42l42->regmap, CS42L42_HS_DET_STATUS, &hs_det_status);
 
-	hs_det_comp |= ((hs_det_status & CS42L42_HSDET_COMP2_OUT_MASK) >>
+	hs_det_comp1 |= ((hs_det_status & CS42L42_HSDET_COMP1_OUT_MASK) >>
+			CS42L42_HSDET_COMP1_OUT_SHIFT) << 1;
+	hs_det_comp2 |= ((hs_det_status & CS42L42_HSDET_COMP2_OUT_MASK) >>
 			CS42L42_HSDET_COMP2_OUT_SHIFT) << 1;
 
-	switch (hs_det_comp) {
+	/* Use Comparator 1 with 1.25V Threshold. */
+	switch (hs_det_comp1) {
 	case CS42L42_HSDET_COMP_TYPE1:
 		cs42l42->hs_type = CS42L42_PLUG_CTIA;
 		hs_det_sw = CS42L42_HSDET_SW_TYPE1;
@@ -1088,14 +1106,26 @@ static void cs42l42_manual_hs_type_detect(struct cs42l42_private *cs42l42)
 		cs42l42->hs_type = CS42L42_PLUG_OMTP;
 		hs_det_sw = CS42L42_HSDET_SW_TYPE2;
 		break;
-	case CS42L42_HSDET_COMP_TYPE3:
-		cs42l42->hs_type = CS42L42_PLUG_HEADPHONE;
-		hs_det_sw = CS42L42_HSDET_SW_TYPE3;
-		break;
 	default:
-		cs42l42->hs_type = CS42L42_PLUG_INVALID;
-		hs_det_sw = CS42L42_HSDET_SW_TYPE4;
-		break;
+		/* Fallback to Comparator 2 with 1.75V Threshold. */
+		switch (hs_det_comp2) {
+		case CS42L42_HSDET_COMP_TYPE1:
+			cs42l42->hs_type = CS42L42_PLUG_CTIA;
+			hs_det_sw = CS42L42_HSDET_SW_TYPE1;
+			break;
+		case CS42L42_HSDET_COMP_TYPE2:
+			cs42l42->hs_type = CS42L42_PLUG_OMTP;
+			hs_det_sw = CS42L42_HSDET_SW_TYPE2;
+			break;
+		case CS42L42_HSDET_COMP_TYPE3:
+			cs42l42->hs_type = CS42L42_PLUG_HEADPHONE;
+			hs_det_sw = CS42L42_HSDET_SW_TYPE3;
+			break;
+		default:
+			cs42l42->hs_type = CS42L42_PLUG_INVALID;
+			hs_det_sw = CS42L42_HSDET_SW_TYPE4;
+			break;
+		}
 	}
 
 	/* Set Switches */
@@ -1112,6 +1142,14 @@ static void cs42l42_manual_hs_type_detect(struct cs42l42_private *cs42l42)
 		(0 << CS42L42_HSDET_SET_SHIFT) |
 		(0 << CS42L42_HSBIAS_REF_SHIFT) |
 		(0 << CS42L42_HSDET_AUTO_TIME_SHIFT));
+
+	/* Configure HS DET comparator reference levels. */
+	regmap_update_bits(cs42l42->regmap,
+				CS42L42_HSDET_CTL1,
+				CS42L42_HSDET_COMP1_LVL_MASK |
+				CS42L42_HSDET_COMP2_LVL_MASK,
+				(CS42L42_HSDET_COMP1_LVL_DEFAULT << CS42L42_HSDET_COMP1_LVL_SHIFT) |
+				(CS42L42_HSDET_COMP2_LVL_DEFAULT << CS42L42_HSDET_COMP2_LVL_SHIFT));
 }
 
 static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
@@ -1134,6 +1172,18 @@ static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
 	cs42l42->hs_type = (hs_det_status & CS42L42_HSDET_TYPE_MASK) >>
 				CS42L42_HSDET_TYPE_SHIFT;
 
+	/* Set hs detect to automatic, disabled mode */
+	regmap_update_bits(cs42l42->regmap,
+		CS42L42_HSDET_CTL2,
+		CS42L42_HSDET_CTRL_MASK |
+		CS42L42_HSDET_SET_MASK |
+		CS42L42_HSBIAS_REF_MASK |
+		CS42L42_HSDET_AUTO_TIME_MASK,
+		(2 << CS42L42_HSDET_CTRL_SHIFT) |
+		(2 << CS42L42_HSDET_SET_SHIFT) |
+		(0 << CS42L42_HSBIAS_REF_SHIFT) |
+		(3 << CS42L42_HSDET_AUTO_TIME_SHIFT));
+
 	/* Run Manual detection if auto detect has not found a headset.
 	 * We Re-Run with Manual Detection if the original detection was invalid or headphones,
 	 * to ensure that a headset mic is detected in all cases.
@@ -1142,18 +1192,6 @@ static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
 		cs42l42->hs_type == CS42L42_PLUG_HEADPHONE) {
 		dev_dbg(cs42l42->component->dev, "Running Manual Detection Fallback\n");
 		cs42l42_manual_hs_type_detect(cs42l42);
-	} else {
-		/* Set hs detect to automatic, disabled mode */
-		regmap_update_bits(cs42l42->regmap,
-			CS42L42_HSDET_CTL2,
-			CS42L42_HSDET_CTRL_MASK |
-			CS42L42_HSDET_SET_MASK |
-			CS42L42_HSBIAS_REF_MASK |
-			CS42L42_HSDET_AUTO_TIME_MASK,
-			(2 << CS42L42_HSDET_CTRL_SHIFT) |
-			(2 << CS42L42_HSDET_SET_SHIFT) |
-			(0 << CS42L42_HSBIAS_REF_SHIFT) |
-			(3 << CS42L42_HSDET_AUTO_TIME_SHIFT));
 	}
 
 	/* Set up button detection */
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 2aeabba73e05..0704c902475f 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -188,6 +188,11 @@
 #define CS42L42_HSDET_COMP2_LVL_SHIFT	4
 #define CS42L42_HSDET_COMP2_LVL_MASK	(15 << CS42L42_HSDET_COMP2_LVL_SHIFT)
 
+#define CS42L42_HSDET_COMP1_LVL_VAL	12 /* 1.25V Comparator */
+#define CS42L42_HSDET_COMP2_LVL_VAL	2  /* 1.75V Comparator */
+#define CS42L42_HSDET_COMP1_LVL_DEFAULT	7  /* 1V Comparator */
+#define CS42L42_HSDET_COMP2_LVL_DEFAULT	7  /* 2V Comparator */
+
 #define CS42L42_HSDET_CTL2		(CS42L42_PAGE_11 + 0x20)
 #define CS42L42_HSDET_AUTO_TIME_SHIFT	0
 #define CS42L42_HSDET_AUTO_TIME_MASK	(3 << CS42L42_HSDET_AUTO_TIME_SHIFT)
-- 
2.25.1


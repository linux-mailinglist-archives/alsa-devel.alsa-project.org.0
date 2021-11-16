Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 698BD453771
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:29:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF526177A;
	Tue, 16 Nov 2021 17:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF526177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637080179;
	bh=WPMFMTwZrSNM8u6JTCQx4iJShBhRnCAA+Pcb1HY+kAA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WMjZpg1fI/zg/Shbkcmk0Jz8tZTTGQrQVzZPXa4LvQffqHV7dF7Wn/6+dpGCKtgnM
	 PS85sK5CoRs363Pbd6nbFc7t0tg2+7/zlBEAcBGuBx/nVPXS8ru/Ucx/Fg+Ntr2gAb
	 BPudEOW2a4gP4hLlkSROT79a4x6ctQWSvwP1kj1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 895FAF804FE;
	Tue, 16 Nov 2021 17:27:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B922F804FB; Tue, 16 Nov 2021 17:27:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3559F80423
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3559F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UeYRcMf6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7fwo9025797;
 Tue, 16 Nov 2021 10:26:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Oy3saM2UmplLoigbbp0tgQUHw4B/9OgUQ+Nm+9/Z7yg=;
 b=UeYRcMf6yhNPUA4Ayc7lknoeUF9kiqvNRFBr34bjdve7s7BZSinjkrPwuKSOcMecQdnT
 uvJu6ZrMhoOS2BZlpDETxthUyUpS2n/P5axc+acr6SBlIYwPTPULqjKPw6Jpya9ON/mR
 CVgi1A4ygQaJSVApoMTFJVeDuMDMbAYVQ9udI38JjdTEGPyxezUqOLQiMN8l4+gE9u0k
 jCnljFoM8hYIPTfXjRGUKPKRuSbxP9nfuHco4AdKyeduGVvJHmnv9H+Vz15ojZ93FmH4
 UYF0Lgd//Vk0fn+qdLmB3RQ4Gp/oy/zWlgPgdwVCTRjZwg+A7f2s5oSCuaZFvky8CerP rg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cbjn01xqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:26:58 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:26:56 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:26:56 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.41])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 69B7915A4;
 Tue, 16 Nov 2021 16:26:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/4] ASoC: cs42l42: Remove redundant writes to DETECT_MODE
Date: Tue, 16 Nov 2021 16:26:46 +0000
Message-ID: <20211116162652.45225-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116162652.45225-1-rf@opensource.cirrus.com>
References: <20211116162652.45225-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eOiCRUncqYGjWDdqektCofz_fSCwtWnx
X-Proofpoint-ORIG-GUID: eOiCRUncqYGjWDdqektCofz_fSCwtWnx
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

There are multiple places where DETECT_MODE is included in a register
write, but in every case it is written as 0. Removing these redundant
writes makes the code less cluttered and also makes it obvious that
DETECT_MODE is never changed.

A single initialization to 0 is added to cs42l42_setup_hs_type_detect().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 56804a3f285e..92bdc3a355ff 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1270,10 +1270,8 @@ static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
 		/* Turn on level detect circuitry */
 		regmap_update_bits(cs42l42->regmap,
 			CS42L42_MISC_DET_CTL,
-			CS42L42_DETECT_MODE_MASK |
 			CS42L42_HSBIAS_CTL_MASK |
 			CS42L42_PDN_MIC_LVL_DET_MASK,
-			(0 << CS42L42_DETECT_MODE_SHIFT) |
 			(3 << CS42L42_HSBIAS_CTL_SHIFT) |
 			(0 << CS42L42_PDN_MIC_LVL_DET_SHIFT));
 
@@ -1300,10 +1298,8 @@ static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
 		/* Make sure button detect and HS bias circuits are off */
 		regmap_update_bits(cs42l42->regmap,
 			CS42L42_MISC_DET_CTL,
-			CS42L42_DETECT_MODE_MASK |
 			CS42L42_HSBIAS_CTL_MASK |
 			CS42L42_PDN_MIC_LVL_DET_MASK,
-			(0 << CS42L42_DETECT_MODE_SHIFT) |
 			(1 << CS42L42_HSBIAS_CTL_SHIFT) |
 			(1 << CS42L42_PDN_MIC_LVL_DET_SHIFT));
 	}
@@ -1351,10 +1347,8 @@ static void cs42l42_init_hs_type_detect(struct cs42l42_private *cs42l42)
 	/* Make sure button detect and HS bias circuits are off */
 	regmap_update_bits(cs42l42->regmap,
 				CS42L42_MISC_DET_CTL,
-				CS42L42_DETECT_MODE_MASK |
 				CS42L42_HSBIAS_CTL_MASK |
 				CS42L42_PDN_MIC_LVL_DET_MASK,
-				(0 << CS42L42_DETECT_MODE_SHIFT) |
 				(1 << CS42L42_HSBIAS_CTL_SHIFT) |
 				(1 << CS42L42_PDN_MIC_LVL_DET_SHIFT));
 
@@ -1398,10 +1392,8 @@ static void cs42l42_init_hs_type_detect(struct cs42l42_private *cs42l42)
 	/* Power up HS bias to 2.7V */
 	regmap_update_bits(cs42l42->regmap,
 				CS42L42_MISC_DET_CTL,
-				CS42L42_DETECT_MODE_MASK |
 				CS42L42_HSBIAS_CTL_MASK |
 				CS42L42_PDN_MIC_LVL_DET_MASK,
-				(0 << CS42L42_DETECT_MODE_SHIFT) |
 				(3 << CS42L42_HSBIAS_CTL_SHIFT) |
 				(1 << CS42L42_PDN_MIC_LVL_DET_SHIFT));
 
@@ -1448,10 +1440,8 @@ static void cs42l42_cancel_hs_type_detect(struct cs42l42_private *cs42l42)
 	/* Ground HS bias */
 	regmap_update_bits(cs42l42->regmap,
 				CS42L42_MISC_DET_CTL,
-				CS42L42_DETECT_MODE_MASK |
 				CS42L42_HSBIAS_CTL_MASK |
 				CS42L42_PDN_MIC_LVL_DET_MASK,
-				(0 << CS42L42_DETECT_MODE_SHIFT) |
 				(1 << CS42L42_HSBIAS_CTL_SHIFT) |
 				(1 << CS42L42_PDN_MIC_LVL_DET_SHIFT));
 
@@ -1829,6 +1819,9 @@ static void cs42l42_setup_hs_type_detect(struct cs42l42_private *cs42l42)
 
 	cs42l42->hs_type = CS42L42_PLUG_INVALID;
 
+	regmap_update_bits(cs42l42->regmap, CS42L42_MISC_DET_CTL,
+			   CS42L42_DETECT_MODE_MASK, 0);
+
 	/* Latch analog controls to VP power domain */
 	regmap_update_bits(cs42l42->regmap, CS42L42_MIC_DET_CTL1,
 			CS42L42_LATCH_TO_VP_MASK |
-- 
2.11.0


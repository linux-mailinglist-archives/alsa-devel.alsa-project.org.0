Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0346540D769
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 12:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A94B1833;
	Thu, 16 Sep 2021 12:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A94B1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631788222;
	bh=/a/gDldCK6Ub83joIpdWPX6sqiGlQtvnrAZyOgS2tXk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W5bFGEIoE/ufpBAwsnqbnkZNupsaPeIgSKvJOLCyhZjPRrNK5p1cm22+tKeTQCgUo
	 r3lTVg8CJyM61josX8Tlo4kbWbr4DM/L3w9DKeAuNEOIj3QcTH3LBrCuKjbG91Q2mY
	 Pn3I+78Q10EtAegKPJOzoNKmJ6M6PZYMIscnQuhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A67BF804E3;
	Thu, 16 Sep 2021 12:28:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40CEFF804E2; Thu, 16 Sep 2021 12:28:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF119F800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 12:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF119F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KiLq9Tsh"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18G4uknd000454; 
 Thu, 16 Sep 2021 05:28:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=40SzkNX6GLKtNlSo7hCO9H+yOX7QLCdUrzmPfLrobG8=;
 b=KiLq9TshDynFMRmYLyVQZKfryYDCSI3OLVTFz/ru2D49UB8v0mhDsmOet8p5pvKchLo0
 p87ORsGKd4ianud1kqpcTTLI6c9EV+jy6bCDGFKXkHmCyUVUJJ7YmdXYX0mT5yHrw1cq
 ZbrDk2k0gl7U/4ZYFu+NmGhvyYlmAVhwovDgi7CZHFWFzAOXvQIaHKuDpaGnMyqeFMxv
 qmCMgrjNl1M2mrUN1h6byNIJhpSADfgAeU1NjnwPq8UO0MX9GhgwytD6INEKFSSCzHqJ
 zjjUT74OCon71byBSH5O7DTMVE/m3Wn3vWfNOkyyrTNFPlI3fKT3GCT2i4NjFUAdSA5s VQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3b3wfv0c75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Sep 2021 05:28:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 16 Sep
 2021 11:28:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 16 Sep 2021 11:28:11 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.230])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BF7BBB2F;
 Thu, 16 Sep 2021 10:28:04 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v1 1/1] ASoC: cs42l42: Implement Manual Type detection as
 fallback
Date: Thu, 16 Sep 2021 11:27:50 +0100
Message-ID: <20210916102750.9212-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916102750.9212-1-vitalyr@opensource.cirrus.com>
References: <20210916102750.9212-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3mhFxjRKBIoR9tPYKLcovRTljvO1E0MD
X-Proofpoint-ORIG-GUID: 3mhFxjRKBIoR9tPYKLcovRTljvO1E0MD
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

Some headsets are not detected correctly by Automatic Type Detection
on cs42l42. Instead, Manual Type Detection can be used to give a
more accurate value.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 104 ++++++++++++++++++++++++++++++++-----
 sound/soc/codecs/cs42l42.h |  54 +++++++++++++++++++
 2 files changed, 146 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index fb1e4c33e27d..c586ebff45f7 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1046,37 +1046,117 @@ static struct snd_soc_dai_driver cs42l42_dai = {
 		.ops = &cs42l42_ops,
 };
 
-static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
+static void cs42l42_manual_hs_type_detect(struct cs42l42_private *cs42l42)
 {
 	unsigned int hs_det_status;
-	unsigned int int_status;
+	unsigned int hs_det_comp;
+	unsigned int hs_det_sw;
 
-	/* Mask the auto detect interrupt */
+	/* Set hs detect to manual, active mode */
 	regmap_update_bits(cs42l42->regmap,
-		CS42L42_CODEC_INT_MASK,
-		CS42L42_PDN_DONE_MASK |
-		CS42L42_HSDET_AUTO_DONE_MASK,
-		(1 << CS42L42_PDN_DONE_SHIFT) |
-		(1 << CS42L42_HSDET_AUTO_DONE_SHIFT));
+		CS42L42_HSDET_CTL2,
+		CS42L42_HSDET_CTRL_MASK |
+		CS42L42_HSDET_SET_MASK |
+		CS42L42_HSBIAS_REF_MASK |
+		CS42L42_HSDET_AUTO_TIME_MASK,
+		(1 << CS42L42_HSDET_CTRL_SHIFT) |
+		(0 << CS42L42_HSDET_SET_SHIFT) |
+		(0 << CS42L42_HSBIAS_REF_SHIFT) |
+		(0 << CS42L42_HSDET_AUTO_TIME_SHIFT));
+
+	/* Open the SW_HSB_HS3 switch and close SW_HSB_HS4 for a Type 1 headset. */
+	regmap_write(cs42l42->regmap, CS42L42_HS_SWITCH_CTL, CS42L42_HSDET_SW_COMP1);
+
+	regmap_read(cs42l42->regmap, CS42L42_HS_DET_STATUS, &hs_det_status);
+
+	hs_det_comp = (hs_det_status & CS42L42_HSDET_COMP1_OUT_MASK) >>
+			CS42L42_HSDET_COMP1_OUT_SHIFT;
+
+	/* Close the SW_HSB_HS3 switch for a Type 2 headset. */
+	regmap_write(cs42l42->regmap, CS42L42_HS_SWITCH_CTL, CS42L42_HSDET_SW_COMP2);
+
+	regmap_read(cs42l42->regmap, CS42L42_HS_DET_STATUS, &hs_det_status);
+
+	hs_det_comp |= ((hs_det_status & CS42L42_HSDET_COMP2_OUT_MASK) >>
+			CS42L42_HSDET_COMP2_OUT_SHIFT) << 1;
+
+	switch (hs_det_comp) {
+	case CS42L42_HSDET_COMP_TYPE1:
+		cs42l42->hs_type = CS42L42_PLUG_CTIA;
+		hs_det_sw = CS42L42_HSDET_SW_TYPE1;
+		break;
+	case CS42L42_HSDET_COMP_TYPE2:
+		cs42l42->hs_type = CS42L42_PLUG_OMTP;
+		hs_det_sw = CS42L42_HSDET_SW_TYPE2;
+		break;
+	case CS42L42_HSDET_COMP_TYPE3:
+		cs42l42->hs_type = CS42L42_PLUG_HEADPHONE;
+		hs_det_sw = CS42L42_HSDET_SW_TYPE3;
+		break;
+	default:
+		cs42l42->hs_type = CS42L42_PLUG_INVALID;
+		hs_det_sw = CS42L42_HSDET_SW_TYPE4;
+		break;
+	}
 
-	/* Set hs detect to automatic, disabled mode */
+	/* Set Switches */
+	regmap_write(cs42l42->regmap, CS42L42_HS_SWITCH_CTL, hs_det_sw);
+
+	/* Set HSDET mode to Manual—Disabled */
 	regmap_update_bits(cs42l42->regmap,
 		CS42L42_HSDET_CTL2,
 		CS42L42_HSDET_CTRL_MASK |
 		CS42L42_HSDET_SET_MASK |
 		CS42L42_HSBIAS_REF_MASK |
 		CS42L42_HSDET_AUTO_TIME_MASK,
-		(2 << CS42L42_HSDET_CTRL_SHIFT) |
-		(2 << CS42L42_HSDET_SET_SHIFT) |
+		(0 << CS42L42_HSDET_CTRL_SHIFT) |
+		(0 << CS42L42_HSDET_SET_SHIFT) |
 		(0 << CS42L42_HSBIAS_REF_SHIFT) |
-		(3 << CS42L42_HSDET_AUTO_TIME_SHIFT));
+		(0 << CS42L42_HSDET_AUTO_TIME_SHIFT));
+}
+
+static void cs42l42_process_hs_type_detect(struct cs42l42_private *cs42l42)
+{
+	unsigned int hs_det_status;
+	unsigned int int_status;
 
 	/* Read and save the hs detection result */
 	regmap_read(cs42l42->regmap, CS42L42_HS_DET_STATUS, &hs_det_status);
 
+	/* Mask the auto detect interrupt */
+	regmap_update_bits(cs42l42->regmap,
+		CS42L42_CODEC_INT_MASK,
+		CS42L42_PDN_DONE_MASK |
+		CS42L42_HSDET_AUTO_DONE_MASK,
+		(1 << CS42L42_PDN_DONE_SHIFT) |
+		(1 << CS42L42_HSDET_AUTO_DONE_SHIFT));
+
+
 	cs42l42->hs_type = (hs_det_status & CS42L42_HSDET_TYPE_MASK) >>
 				CS42L42_HSDET_TYPE_SHIFT;
 
+	/* Run Manual detection if auto detect has not found a headset.
+	 * We Re-Run with Manual Detection if the original detection was invalid or headphones,
+	 * to ensure that a headset mic is detected in all cases.
+	 */
+	if (cs42l42->hs_type == CS42L42_PLUG_INVALID ||
+		cs42l42->hs_type == CS42L42_PLUG_HEADPHONE) {
+		dev_dbg(cs42l42->component->dev, "Running Manual Detection Fallback\n");
+		cs42l42_manual_hs_type_detect(cs42l42);
+	} else {
+		/* Set hs detect to automatic, disabled mode */
+		regmap_update_bits(cs42l42->regmap,
+			CS42L42_HSDET_CTL2,
+			CS42L42_HSDET_CTRL_MASK |
+			CS42L42_HSDET_SET_MASK |
+			CS42L42_HSBIAS_REF_MASK |
+			CS42L42_HSDET_AUTO_TIME_MASK,
+			(2 << CS42L42_HSDET_CTRL_SHIFT) |
+			(2 << CS42L42_HSDET_SET_SHIFT) |
+			(0 << CS42L42_HSBIAS_REF_SHIFT) |
+			(3 << CS42L42_HSDET_AUTO_TIME_SHIFT));
+	}
+
 	/* Set up button detection */
 	if ((cs42l42->hs_type == CS42L42_PLUG_CTIA) ||
 	      (cs42l42->hs_type == CS42L42_PLUG_OMTP)) {
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 8734f6828f3e..2aeabba73e05 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -228,6 +228,60 @@
 #define CS42L42_PLUG_HEADPHONE		2
 #define CS42L42_PLUG_INVALID		3
 
+#define CS42L42_HSDET_SW_COMP1		((0 << CS42L42_SW_GNDHS_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_GNDHS_HS3_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_HS3_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_FILT_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_FILT_HS3_SHIFT) | \
+					 (0 << CS42L42_SW_REF_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_REF_HS3_SHIFT))
+#define CS42L42_HSDET_SW_COMP2		((1 << CS42L42_SW_GNDHS_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_GNDHS_HS3_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_HS3_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_FILT_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_FILT_HS3_SHIFT) | \
+					 (1 << CS42L42_SW_REF_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_REF_HS3_SHIFT))
+#define CS42L42_HSDET_SW_TYPE1		((0 << CS42L42_SW_GNDHS_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_GNDHS_HS3_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_HS3_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_FILT_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_FILT_HS3_SHIFT) | \
+					 (0 << CS42L42_SW_REF_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_REF_HS3_SHIFT))
+#define CS42L42_HSDET_SW_TYPE2		((1 << CS42L42_SW_GNDHS_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_GNDHS_HS3_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_HS3_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_FILT_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_FILT_HS3_SHIFT) | \
+					 (1 << CS42L42_SW_REF_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_REF_HS3_SHIFT))
+#define CS42L42_HSDET_SW_TYPE3		((1 << CS42L42_SW_GNDHS_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_GNDHS_HS3_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_HS3_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_FILT_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_FILT_HS3_SHIFT) | \
+					 (1 << CS42L42_SW_REF_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_REF_HS3_SHIFT))
+#define CS42L42_HSDET_SW_TYPE4		((0 << CS42L42_SW_GNDHS_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_GNDHS_HS3_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_HS4_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_HS3_SHIFT) | \
+					 (0 << CS42L42_SW_HSB_FILT_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_HSB_FILT_HS3_SHIFT) | \
+					 (0 << CS42L42_SW_REF_HS4_SHIFT) | \
+					 (1 << CS42L42_SW_REF_HS3_SHIFT))
+
+#define CS42L42_HSDET_COMP_TYPE1	1
+#define CS42L42_HSDET_COMP_TYPE2	2
+#define CS42L42_HSDET_COMP_TYPE3	0
+#define CS42L42_HSDET_COMP_TYPE4	3
+
 #define CS42L42_HS_CLAMP_DISABLE	(CS42L42_PAGE_11 + 0x29)
 #define CS42L42_HS_CLAMP_DISABLE_SHIFT	0
 #define CS42L42_HS_CLAMP_DISABLE_MASK	(1 << CS42L42_HS_CLAMP_DISABLE_SHIFT)
-- 
2.25.1


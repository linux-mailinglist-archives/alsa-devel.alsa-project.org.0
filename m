Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A014CD695
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 15:41:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ACE91A2C;
	Fri,  4 Mar 2022 15:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ACE91A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646404880;
	bh=cHs/mmRl+RFiYISXWPbbLE5oHem+pZqfeoiFLwysSr4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C5dm7o5EuUCZoEHNauPDpqB+qPRVI2K1BrTWiye5kS4j8plnl5dJMOaspKBoRRq/I
	 WdOm+I5AeEg1Ds+HtOpIc4+gAcbX329HyLaqwuY7Oieo460Qs7Utmmvc7cIM2qi3DF
	 I1vInMqUkyvwwdVW05Z0f5VOYkMXxGssojpE/Kf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06A2FF80224;
	Fri,  4 Mar 2022 15:40:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BF25F80139; Fri,  4 Mar 2022 15:40:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16C5AF800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 15:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16C5AF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dxXP/m1O"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2248TIlJ019088;
 Fri, 4 Mar 2022 08:40:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=bFhXLBMGqICJ9xa4zHe1IgD/QVmyIzhRYAhGIXcq0CU=;
 b=dxXP/m1O4qV6f6lgFmV2P9GFp126XRrB7ogHV29TDLnxAW703vhrcpSkq7bSlvjkd4Z3
 wV9FhLfji9kDnbyhPHkuyOGLVG/BlWr0W8m6gNi4Jplax4E/jKF39+CvkjKG9W/Uf+h+
 zX8Cag0MDQLxGWhKc6co1l7Stfe5NtelgR38k9pAdDwZehoGUdg8t4QlSE8yF/sdM6/G
 EX2a0rtTo8IFhkicBw3f717cUu5kwQkHp5uPebwbKp0bOZqq53NjgZWIXm4AQmdkUgxM
 XJL6ZxlOoiPejG/uH2gUxmZMNw8i7ahho/0Eljd3mMGjQF6lyPEUqxoTyXYY4nJmJtlp bA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3h2td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 08:40:18 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 14:40:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 14:40:17 +0000
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.90.251.79])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 36C747C;
 Fri,  4 Mar 2022 14:40:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: cs42l42: Add warnings about DETECT_MODE and PLL_START
Date: Fri, 4 Mar 2022 14:40:15 +0000
Message-ID: <20220304144015.398656-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: alberyu2hsG-jYvJnT3dm0fL5Q1eubXO
X-Proofpoint-ORIG-GUID: alberyu2hsG-jYvJnT3dm0fL5Q1eubXO
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

DETECT_MODE and PLL_START must be zero while HP_PDN and ADC_PDN are
both 1. If this condition is broken it can discharge FILT+ and it
can then take up to 1 second for FILT+ to recharge.

There is no workaround required for this, simply avoiding settings
and sequences that would break the requirement. The driver already
meets the requirement.

But it is not obvious from reading the code that this requirement
exists, or what is ensuring it is met. So it would not currently be
obvious to someone changing the code that there is certain special
behaviour that must be maintained.

To avoid accidental breakage in the future:

- Add comments into the register definitions to warn about this so
  that anyone changing the code around DETECT_MODE and PLL_START is
  aware of this requirement.

- Add a comment where PLL_START is written to 1 to highlight the
  requirement and why it is satisfied.

- Add a comment in cs42l42_setup_hs_type_detect() when DETECT_MODE is
  initialized.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 13 ++++++++++++-
 sound/soc/codecs/cs42l42.h |  9 ++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index db6ef6cdce15..c8409d50e934 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1012,7 +1012,14 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 		}
 	} else {
 		if (!cs42l42->stream_use) {
-			/* SCLK must be running before codec unmute */
+			/* SCLK must be running before codec unmute.
+			 *
+			 * PLL must not be started with ADC and HP both off
+			 * otherwise the FILT+ supply will not charge properly.
+			 * DAPM widgets power-up before stream unmute so at least
+			 * one of the "DAC" or "ADC" widgets will already have
+			 * powered-up.
+			 */
 			if (pll_ratio_table[cs42l42->pll_config].mclk_src_sel) {
 				snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
 							      CS42L42_PLL_START_MASK, 1);
@@ -1830,6 +1837,10 @@ static void cs42l42_setup_hs_type_detect(struct cs42l42_private *cs42l42)
 
 	cs42l42->hs_type = CS42L42_PLUG_INVALID;
 
+	/*
+	 * DETECT_MODE must always be 0 with ADC and HP both off otherwise the
+	 * FILT+ supply will not charge properly.
+	 */
 	regmap_update_bits(cs42l42->regmap, CS42L42_MISC_DET_CTL,
 			   CS42L42_DETECT_MODE_MASK, 0);
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 244b24d1f5e9..60d3bdf5d7c9 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -491,7 +491,10 @@
 #define CS42L42_TS_UNPLUG		0
 #define CS42L42_TS_TRANS		1
 
-/* Page 0x15 Fractional-N PLL Registers */
+/*
+ * NOTE: PLL_START must be 0 while both ADC_PDN=1 and HP_PDN=1.
+ * Otherwise it will prevent FILT+ from charging properly.
+ */
 #define CS42L42_PLL_CTL1		(CS42L42_PAGE_15 + 0x01)
 #define CS42L42_PLL_START_SHIFT		0
 #define CS42L42_PLL_START_MASK		(1 << CS42L42_PLL_START_SHIFT)
@@ -574,6 +577,10 @@
 #define CS42L42_TIP_SENSE_CTRL_MASK		(3 << \
 					CS42L42_TIP_SENSE_CTRL_SHIFT)
 
+/*
+ * NOTE: DETECT_MODE must be 0 while both ADC_PDN=1 and HP_PDN=1.
+ * Otherwise it will prevent FILT+ from charging properly.
+ */
 #define CS42L42_MISC_DET_CTL		(CS42L42_PAGE_1B + 0x74)
 #define CS42L42_PDN_MIC_LVL_DET_SHIFT	0
 #define CS42L42_PDN_MIC_LVL_DET_MASK	(1 << CS42L42_PDN_MIC_LVL_DET_SHIFT)
-- 
2.30.2


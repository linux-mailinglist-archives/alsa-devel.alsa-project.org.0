Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 655583E7C90
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 17:40:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BED5D1686;
	Tue, 10 Aug 2021 17:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BED5D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628610045;
	bh=8JW0DyI64FJ+5jfB7QwKf+TAG0wT8Rch+E/cbJQRAZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oboI2y6xfpSnN+oRGfdNmmkf/DJl7Oh0CCFsQ2248pe3XW87bcS6ZiSZh11zKAgUT
	 wxVSGrKkPTEyiWHTf4DmkEYYupEjZqpgPZJPbToAMEku79D/ZcOkwbwe0g7ys4uv0E
	 gIUb1UWPWYU7/TT/BfjmeTOlVIAq1DfTnalZS5+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18181F804F2;
	Tue, 10 Aug 2021 17:38:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51D85F800FD; Tue, 10 Aug 2021 17:38:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 957BEF800FD
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 957BEF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DoAcyy5a"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17A75fJQ008310; 
 Tue, 10 Aug 2021 10:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=2JOOQseswmOCdoVq3IxswUus9w/clUdKlpSDXgvTuCw=;
 b=DoAcyy5an05zFaXFKDIPQF4sbnQ7aUFvtjiQGSRsbAqRNQceCk85Ulo6B46ryczm0c5B
 gFri+v6YEKKDNXhqbR2VMKtGNv9B2Pmr94NJKTSzEol76TOVKEfHBadeoL+QxO9b8MsY
 RbmtV2bOREPUsOyoDfLoS1+W8pBBhwfG1dfR/tPx/RG3nbHN/spCUkJiCdZRpcjf14pM
 qWcgdhPaJ4oYipPdN/qSBj2faAbUGySpZY8jnhgOP19fpvxONaUHBITUzbwNaBpIHffl
 Z9dprWCghoOGYDxFy7utrVxRCBDrhf3Y3jQgkYrX1fKZepH7o+ZKF2+/iT8DCPRaroAt AA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3abmrkgkf6-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Aug 2021 10:38:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 10 Aug
 2021 16:38:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 10 Aug 2021 16:38:04 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.221])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D075845D;
 Tue, 10 Aug 2021 15:38:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 05/12] ASoC: cs42l42: Set correct SRC MCLK
Date: Tue, 10 Aug 2021 16:37:52 +0100
Message-ID: <20210810153759.24333-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810153759.24333-1-rf@opensource.cirrus.com>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: f7IVMuOPQZI8IIqqA63UmiB-jNRrbwJs
X-Proofpoint-ORIG-GUID: f7IVMuOPQZI8IIqqA63UmiB-jNRrbwJs
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0
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

According to the datasheet the SRC MCLK must be as near as possible to
(125 * sample rate). This means it should be ~6MHz for rates up to 48k
and ~12MHz for rates above that. As per datasheet table 4-21.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 60 ++++++++++++++++++++++++++++++----------------
 sound/soc/codecs/cs42l42.h |  1 +
 2 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 1893d3694570..14fd70c56891 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -663,22 +663,6 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 					CS42L42_FSYNC_PULSE_WIDTH_MASK,
 					CS42L42_FRAC1_VAL(fsync - 1) <<
 					CS42L42_FSYNC_PULSE_WIDTH_SHIFT);
-			/* Set the sample rates (96k or lower) */
-			snd_soc_component_update_bits(component, CS42L42_FS_RATE_EN,
-					CS42L42_FS_EN_MASK,
-					(CS42L42_FS_EN_IASRC_96K |
-					CS42L42_FS_EN_OASRC_96K) <<
-					CS42L42_FS_EN_SHIFT);
-			/* Set the input/output internal MCLK clock ~12 MHz */
-			snd_soc_component_update_bits(component, CS42L42_IN_ASRC_CLK,
-					CS42L42_CLK_IASRC_SEL_MASK,
-					CS42L42_CLK_IASRC_SEL_12 <<
-					CS42L42_CLK_IASRC_SEL_SHIFT);
-			snd_soc_component_update_bits(component,
-					CS42L42_OUT_ASRC_CLK,
-					CS42L42_CLK_OASRC_SEL_MASK,
-					CS42L42_CLK_OASRC_SEL_12 <<
-					CS42L42_CLK_OASRC_SEL_SHIFT);
 			if (pll_ratio_table[i].mclk_src_sel == 0) {
 				/* Pass the clock straight through */
 				snd_soc_component_update_bits(component,
@@ -741,6 +725,34 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
 	return -EINVAL;
 }
 
+static void cs42l42_src_config(struct snd_soc_component *component, unsigned int sample_rate)
+{
+	unsigned int fs;
+
+	/* SRC MCLK must be as close as possible to 125 * sample rate */
+	if (sample_rate <= 48000)
+		fs = CS42L42_CLK_IASRC_SEL_6;
+	else
+		fs = CS42L42_CLK_IASRC_SEL_12;
+
+	/* Set the sample rates (96k or lower) */
+	snd_soc_component_update_bits(component,
+				      CS42L42_FS_RATE_EN,
+				      CS42L42_FS_EN_MASK,
+				      (CS42L42_FS_EN_IASRC_96K |
+				       CS42L42_FS_EN_OASRC_96K) <<
+				      CS42L42_FS_EN_SHIFT);
+
+	snd_soc_component_update_bits(component,
+				      CS42L42_IN_ASRC_CLK,
+				      CS42L42_CLK_IASRC_SEL_MASK,
+				      fs << CS42L42_CLK_IASRC_SEL_SHIFT);
+	snd_soc_component_update_bits(component,
+				      CS42L42_OUT_ASRC_CLK,
+				      CS42L42_CLK_OASRC_SEL_MASK,
+				      fs << CS42L42_CLK_OASRC_SEL_SHIFT);
+}
+
 static int cs42l42_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = codec_dai->component;
@@ -831,6 +843,7 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 	unsigned int channels = params_channels(params);
 	unsigned int width = (params_width(params) / 8) - 1;
 	unsigned int val = 0;
+	int ret;
 
 	cs42l42->srate = params_rate(params);
 	cs42l42->bclk = snd_soc_params_to_bclk(params);
@@ -884,11 +897,16 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	/* Configure the PLL if this is the first active stream */
-	if (!cs42l42->stream_use)
-		return cs42l42_pll_config(component);
-	else
-		return 0;
+	/* Configure clocking only if this is the first active stream */
+	if (!cs42l42->stream_use) {
+		ret = cs42l42_pll_config(component);
+		if (ret)
+			return ret;
+
+		cs42l42_src_config(component, params_rate(params));
+	}
+
+	return 0;
 }
 
 static int cs42l42_set_sysclk(struct snd_soc_dai *dai,
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 8734f6828f3e..addb6560c649 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -288,6 +288,7 @@
 #define CS42L42_IN_ASRC_CLK		(CS42L42_PAGE_12 + 0x0A)
 #define CS42L42_CLK_IASRC_SEL_SHIFT	0
 #define CS42L42_CLK_IASRC_SEL_MASK	(1 << CS42L42_CLK_IASRC_SEL_SHIFT)
+#define CS42L42_CLK_IASRC_SEL_6		0
 #define CS42L42_CLK_IASRC_SEL_12	1
 
 #define CS42L42_OUT_ASRC_CLK		(CS42L42_PAGE_12 + 0x0B)
-- 
2.11.0


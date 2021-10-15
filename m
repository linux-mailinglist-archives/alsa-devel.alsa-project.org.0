Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC33742F3C3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43A2C16EE;
	Fri, 15 Oct 2021 15:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43A2C16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305112;
	bh=lkrZWS0Tj5w0xK/nlQbLsCMhT8HafRMcX/Rp/Kbvnhc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clvSWJxl/o3AZD64fchn0d6xzInfznFUXdI1lRw6OTrBGZU3A1xMgG49Erdt+Hla6
	 UMDDLlYBpikTc0QeKVmjl91EVzCDnh41jM3S2Fovm/zE/cv2KSsmrTXaKYHfRAVLde
	 P836l2pdV2A7Gx8GRWwFQvng6VJO3DuaRoduRc9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2391AF80508;
	Fri, 15 Oct 2021 15:36:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBFC7F80506; Fri, 15 Oct 2021 15:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6229CF8028D
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6229CF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cKyrsZma"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FCfErM009690; 
 Fri, 15 Oct 2021 08:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=dzQo95A00QtC5PZqcJQ7VCfKoMr/qtiEjfJl9QyDCVQ=;
 b=cKyrsZmay+g3onmVI6nzMpfCfThSARao4p+0nuT+91x+xnVrHSJVyU5f78qz1NGpKK7i
 Js2oGyZuUbrr2st7bCtj6LrLHepYLw3Pn09kM2ERHc8OGHlt1xNRVWN35VuW40VfzLfH
 OYDVyAajUZ1nsbFrRy5SJrKJjdVBQtuYZQIoDGCK/7UC3fepBsRXFCly7h+IDCkuOyM9
 8yEDnJlJG0Dt7X7XqDAUo9sihk1hc1kC2FYQdk5onbqP0V0IYiTQr73W7wtmZC60Qwni
 xUhKuX+YNCiZAnyeM/zTVIR5UYvSGg7qlBLL6auaEsQMULbCQrmbaRaevJptPdZ5UCtR Ew== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5w-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:23 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DB5E946D;
 Fri, 15 Oct 2021 13:36:22 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 04/16] ASoC: cs42l42: Don't set defaults for volatile registers
Date: Fri, 15 Oct 2021 14:36:07 +0100
Message-ID: <20211015133619.4698-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VVTmusYFh5SH1dCBqv6VaAiTwwP83VPM
X-Proofpoint-GUID: VVTmusYFh5SH1dCBqv6VaAiTwwP83VPM
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

Volatile registers don't need a default value.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
---
 sound/soc/codecs/cs42l42.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index a5c460f2ec8c..c4efdc8f5d24 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -41,7 +41,6 @@
 static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_FRZ_CTL,			0x00 },
 	{ CS42L42_SRC_CTL,			0x10 },
-	{ CS42L42_MCLK_STATUS,			0x02 },
 	{ CS42L42_MCLK_CTL,			0x02 },
 	{ CS42L42_SFTRAMP_RATE,			0xA4 },
 	{ CS42L42_I2C_DEBOUNCE,			0x88 },
@@ -57,11 +56,9 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_RSENSE_CTL3,			0x1B },
 	{ CS42L42_TSENSE_CTL,			0x1B },
 	{ CS42L42_TSRS_INT_DISABLE,		0x00 },
-	{ CS42L42_TRSENSE_STATUS,		0x00 },
 	{ CS42L42_HSDET_CTL1,			0x77 },
 	{ CS42L42_HSDET_CTL2,			0x00 },
 	{ CS42L42_HS_SWITCH_CTL,		0xF3 },
-	{ CS42L42_HS_DET_STATUS,		0x00 },
 	{ CS42L42_HS_CLAMP_DISABLE,		0x00 },
 	{ CS42L42_MCLK_SRC_SEL,			0x00 },
 	{ CS42L42_SPDIF_CLK_CFG,		0x00 },
@@ -75,18 +72,6 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_IN_ASRC_CLK,			0x00 },
 	{ CS42L42_OUT_ASRC_CLK,			0x00 },
 	{ CS42L42_PLL_DIV_CFG1,			0x00 },
-	{ CS42L42_ADC_OVFL_STATUS,		0x00 },
-	{ CS42L42_MIXER_STATUS,			0x00 },
-	{ CS42L42_SRC_STATUS,			0x00 },
-	{ CS42L42_ASP_RX_STATUS,		0x00 },
-	{ CS42L42_ASP_TX_STATUS,		0x00 },
-	{ CS42L42_CODEC_STATUS,			0x00 },
-	{ CS42L42_DET_INT_STATUS1,		0x00 },
-	{ CS42L42_DET_INT_STATUS2,		0x00 },
-	{ CS42L42_SRCPL_INT_STATUS,		0x00 },
-	{ CS42L42_VPMON_STATUS,			0x00 },
-	{ CS42L42_PLL_LOCK_STATUS,		0x00 },
-	{ CS42L42_TSRS_PLUG_STATUS,		0x00 },
 	{ CS42L42_ADC_OVFL_INT_MASK,		0x01 },
 	{ CS42L42_MIXER_INT_MASK,		0x0F },
 	{ CS42L42_SRC_INT_MASK,			0x0F },
@@ -105,8 +90,6 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_PLL_CTL3,			0x10 },
 	{ CS42L42_PLL_CAL_RATIO,		0x80 },
 	{ CS42L42_PLL_CTL4,			0x03 },
-	{ CS42L42_LOAD_DET_RCSTAT,		0x00 },
-	{ CS42L42_LOAD_DET_DONE,		0x00 },
 	{ CS42L42_LOAD_DET_EN,			0x00 },
 	{ CS42L42_HSBIAS_SC_AUTOCTL,		0x03 },
 	{ CS42L42_WAKE_CTL,			0xC0 },
@@ -115,8 +98,6 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_MISC_DET_CTL,			0x03 },
 	{ CS42L42_MIC_DET_CTL1,			0x1F },
 	{ CS42L42_MIC_DET_CTL2,			0x2F },
-	{ CS42L42_DET_STATUS1,			0x00 },
-	{ CS42L42_DET_STATUS2,			0x00 },
 	{ CS42L42_DET_INT1_MASK,		0xE0 },
 	{ CS42L42_DET_INT2_MASK,		0xFF },
 	{ CS42L42_HS_BIAS_CTL,			0xC2 },
@@ -182,7 +163,6 @@ static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_ASP_RX_DAI1_CH2_AP_RES,	0x03 },
 	{ CS42L42_ASP_RX_DAI1_CH2_BIT_MSB,	0x00 },
 	{ CS42L42_ASP_RX_DAI1_CH2_BIT_LSB,	0x00 },
-	{ CS42L42_SUB_REVID,			0x03 },
 };
 
 static bool cs42l42_readable_register(struct device *dev, unsigned int reg)
-- 
2.11.0


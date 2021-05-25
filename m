Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 982253909E5
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 21:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 248C61701;
	Tue, 25 May 2021 21:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 248C61701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621972140;
	bh=FEEH7q/0Y+OnpmYJCkg33TTClVre4K2GOF/spTIRxDY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DWW/sCCPcCa/zBud5JMeqYGGS2ERotMKGH+f30KGy7SCaRIvNBQJrQYXVM+BbEohT
	 pXA8QGf7YvLFwS9qYEGlK3ypeQ3WdCzZ2TK9q077o5aO2TtOPC3FJ3XEZ4QBOapITy
	 KTxJwXSmjcnc8PbzUrs/nisKu7fprbE+Wuu2MgU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88D3FF800B6;
	Tue, 25 May 2021 21:47:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F496F800CB; Tue, 25 May 2021 21:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59304F80032
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 21:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59304F80032
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GvOdVDLI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PJhrjX004519; Tue, 25 May 2021 14:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=X9wKfI+BjCifG0ejYaamknVRkJZk+u6uBliDOXD1u1w=;
 b=GvOdVDLIc1fZ5Z4pOHz8c3X87FTQ7yHfT/g5dyeuRQkwhjNSWEQg8j02Iwba+1DcYtS5
 TJ+PnsVQaHnVg9kB0G7t8R0pGfotG9v+NxM6C4rL+swNNz00PeEa3qvxGpdBLNbVPpeH
 Ouj3KhstkXDhwIhL4NSdR8vdRGoP7CYPj2fIQBY2v/Ym/RVXijfx4Ov+NbVA9xgz9bm9
 lZcMDceS79RWHsyio+qaqt5E5tgsK488D+qmaGS/XYuUSc4wwEByGSrTGSrbyCAPlLu5
 b4N/A7nnVJc7F2aah8gMUInDtGPqP5DoERD1YGBz+OJn6v6N0JxrCT9gnZMWIsonJoHt Lw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38r28v2dw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 25 May 2021 14:47:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 25 May
 2021 20:47:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 25 May 2021 20:47:19 +0100
Received: from localhost.localdomain (unknown [141.131.77.13])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6F33E11CD;
 Tue, 25 May 2021 19:47:17 +0000 (UTC)
From: David Rhodes <drhodes@opensource.cirrus.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>,
 <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l3x: Use neutral language in amp drivers
Date: Tue, 25 May 2021 14:44:39 -0500
Message-ID: <20210525194439.2232908-1-drhodes@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FhLbV-SBjyFeJwTafyn-Id5Q3U5e_2Ny
X-Proofpoint-GUID: FhLbV-SBjyFeJwTafyn-Id5Q3U5e_2Ny
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250120
Cc: David Rhodes <drhodes@opensource.cirrus.com>
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

Revise variable names and comments in
cs35l35 and cs35l36 amp drivers.

Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l35.c | 16 ++++++++--------
 sound/soc/codecs/cs35l35.h |  2 +-
 sound/soc/codecs/cs35l36.c | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index f20ed838b958..f4e2dc0ed5cc 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -367,16 +367,16 @@ static int cs35l35_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct snd_soc_component *component = codec_dai->component;
 	struct cs35l35_private *cs35l35 = snd_soc_component_get_drvdata(component);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		regmap_update_bits(cs35l35->regmap, CS35L35_CLK_CTL1,
 				    CS35L35_MS_MASK, 1 << CS35L35_MS_SHIFT);
-		cs35l35->slave_mode = false;
+		cs35l35->clock_consumer = false;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		regmap_update_bits(cs35l35->regmap, CS35L35_CLK_CTL1,
 				    CS35L35_MS_MASK, 0 << CS35L35_MS_SHIFT);
-		cs35l35->slave_mode = true;
+		cs35l35->clock_consumer = true;
 		break;
 	default:
 		return -EINVAL;
@@ -555,8 +555,8 @@ static int cs35l35_hw_params(struct snd_pcm_substream *substream,
 		}
 		sp_sclks = ((cs35l35->sclk / srate) / 4) - 1;
 
-		/* Only certain ratios are supported in I2S Slave Mode */
-		if (cs35l35->slave_mode) {
+		/* Only certain ratios supported when device is a clock consumer */
+		if (cs35l35->clock_consumer) {
 			switch (sp_sclks) {
 			case CS35L35_SP_SCLKS_32FS:
 			case CS35L35_SP_SCLKS_48FS:
@@ -567,7 +567,7 @@ static int cs35l35_hw_params(struct snd_pcm_substream *substream,
 				return -EINVAL;
 			}
 		} else {
-			/* Only certain ratios supported in I2S MASTER Mode */
+			/* Only certain ratios supported when device is a clock provider */
 			switch (sp_sclks) {
 			case CS35L35_SP_SCLKS_32FS:
 			case CS35L35_SP_SCLKS_64FS:
diff --git a/sound/soc/codecs/cs35l35.h b/sound/soc/codecs/cs35l35.h
index ffb154cd962c..2e69fef318e3 100644
--- a/sound/soc/codecs/cs35l35.h
+++ b/sound/soc/codecs/cs35l35.h
@@ -282,7 +282,7 @@ struct  cs35l35_private {
 	int sclk;
 	bool pdm_mode;
 	bool i2s_mode;
-	bool slave_mode;
+	bool clock_consumer;
 	/* GPIO for /RST */
 	struct gpio_desc *reset_gpio;
 	struct completion pdn_done;
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index a038bcec2d17..895ceed12cd9 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -756,14 +756,14 @@ static int cs35l36_set_dai_fmt(struct snd_soc_dai *component_dai,
 {
 	struct cs35l36_private *cs35l36 =
 			snd_soc_component_get_drvdata(component_dai->component);
-	unsigned int asp_fmt, lrclk_fmt, sclk_fmt, slave_mode, clk_frc;
+	unsigned int asp_fmt, lrclk_fmt, sclk_fmt, clock_provider, clk_frc;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		slave_mode = 1;
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		clock_provider = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
-		slave_mode = 0;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		clock_provider = 0;
 		break;
 	default:
 		return -EINVAL;
@@ -771,10 +771,10 @@ static int cs35l36_set_dai_fmt(struct snd_soc_dai *component_dai,
 
 	regmap_update_bits(cs35l36->regmap, CS35L36_ASP_TX_PIN_CTRL,
 				CS35L36_SCLK_MSTR_MASK,
-				slave_mode << CS35L36_SCLK_MSTR_SHIFT);
+				clock_provider << CS35L36_SCLK_MSTR_SHIFT);
 	regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RATE_CTRL,
 				CS35L36_LRCLK_MSTR_MASK,
-				slave_mode << CS35L36_LRCLK_MSTR_SHIFT);
+				clock_provider << CS35L36_LRCLK_MSTR_SHIFT);
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
 	case SND_SOC_DAIFMT_CONT:
-- 
2.25.1


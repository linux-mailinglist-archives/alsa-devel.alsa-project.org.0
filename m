Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E9293179
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 00:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B572C170A;
	Tue, 20 Oct 2020 00:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B572C170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603147716;
	bh=iS7hqFK2jnrr9J8VZe7N/zRkAWByw+2KsnDvn4ViH+Q=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qD6HIeoszfGblnPyZ0xGKy3J1eM5t6SKsNQFF1VbSv5SwlFq2JzOYztPxEsCKon/S
	 jQ2gvIVYWTjCsEP/VzldLWStUqZHi+C47ETTrsPK8IZa7Cg3GHMdn0Do6RJknfmhf3
	 U7bYQlbziH4qFYJMqcghVhAyWs6q7HzWMwCCojxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE0B8F80264;
	Tue, 20 Oct 2020 00:46:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32DF7F80247; Tue, 20 Oct 2020 00:46:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F02EBF80121
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 00:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F02EBF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NGpzTsKw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09JMbaQS013568; Mon, 19 Oct 2020 17:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=nAkdlkp1XIWaxRutmzokLEwxpL7YxdepzJfiflWUwHU=;
 b=NGpzTsKwFzZH8THIV/K4KOqfrtLQfiKLv4RPhV68gnkkCT4EtzEQh3HjjTS97U3l2JM3
 MENWTdQm9jCC6sIwBkC+iJk4ecQDMs6TSWLQT8iViDDdV/NO1SNXQqe/JIcCDPsNZdkY
 Dp27eRjnzCH4lTFZFY9tWXunDGOeL2YoYqJzRQzTsVKJwJpiHPUyZ2mqOpo7IkKrQv33
 A6lPcyHbEAKKr4uXvhW7FhAwRdOfdjlh5rxxBK4dUPya2cxag3VtnPrWF/5dPNcFxM+S
 iw8h+UJnWqAYoBTVFnb/GToPAhU3dlt63TYATIAaN6HUAmZC2jhAVQsc3WiqotayQFLr MQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 347w1qtt2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 19 Oct 2020 17:46:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 19 Oct
 2020 23:46:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 19 Oct 2020 23:46:41 +0100
Received: from localhost.localdomain (unknown [141.131.78.241])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E2AC52AA;
 Mon, 19 Oct 2020 22:46:39 +0000 (UTC)
From: David Rhodes <david.rhodes@cirrus.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>,
 <brian.austin@cirrus.com>, <james.schulman@cirrus.com>,
 <patches@opensource.cirrus.com>, <david.rhodes@cirrus.com>
Subject: [PATCH] ASoC: cs35l3x: Use neutral language in amp drivers
Date: Mon, 19 Oct 2020 17:44:27 -0500
Message-ID: <20201019224427.1700003-1-david.rhodes@cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=917 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010190151
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

Signed-off-by: David Rhodes <david.rhodes@cirrus.com>
---
 sound/soc/codecs/cs35l35.c | 10 +++++-----
 sound/soc/codecs/cs35l35.h |  2 +-
 sound/soc/codecs/cs35l36.c | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index e330427..3774b69 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -372,12 +372,12 @@ static int cs35l35_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_CBM_CFM:
 		regmap_update_bits(cs35l35->regmap, CS35L35_CLK_CTL1,
 				    CS35L35_MS_MASK, 1 << CS35L35_MS_SHIFT);
-		cs35l35->slave_mode = false;
+		cs35l35->clock_mode = false;
 		break;
 	case SND_SOC_DAIFMT_CBS_CFS:
 		regmap_update_bits(cs35l35->regmap, CS35L35_CLK_CTL1,
 				    CS35L35_MS_MASK, 0 << CS35L35_MS_SHIFT);
-		cs35l35->slave_mode = true;
+		cs35l35->clock_mode = true;
 		break;
 	default:
 		return -EINVAL;
@@ -556,8 +556,8 @@ static int cs35l35_hw_params(struct snd_pcm_substream *substream,
 		}
 		sp_sclks = ((cs35l35->sclk / srate) / 4) - 1;
 
-		/* Only certain ratios are supported in I2S Slave Mode */
-		if (cs35l35->slave_mode) {
+		/* Only certain ratios are supported in I2S Device Mode */
+		if (cs35l35->clock_mode) {
 			switch (sp_sclks) {
 			case CS35L35_SP_SCLKS_32FS:
 			case CS35L35_SP_SCLKS_48FS:
@@ -568,7 +568,7 @@ static int cs35l35_hw_params(struct snd_pcm_substream *substream,
 				return -EINVAL;
 			}
 		} else {
-			/* Only certain ratios supported in I2S MASTER Mode */
+			/* Only certain ratios supported in I2S Controller Mode */
 			switch (sp_sclks) {
 			case CS35L35_SP_SCLKS_32FS:
 			case CS35L35_SP_SCLKS_64FS:
diff --git a/sound/soc/codecs/cs35l35.h b/sound/soc/codecs/cs35l35.h
index ffb154c..017fa6d 100644
--- a/sound/soc/codecs/cs35l35.h
+++ b/sound/soc/codecs/cs35l35.h
@@ -282,7 +282,7 @@ struct  cs35l35_private {
 	int sclk;
 	bool pdm_mode;
 	bool i2s_mode;
-	bool slave_mode;
+	bool clock_mode;
 	/* GPIO for /RST */
 	struct gpio_desc *reset_gpio;
 	struct completion pdn_done;
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index e9b5f76..86f5533 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -756,14 +756,14 @@ static int cs35l36_set_dai_fmt(struct snd_soc_dai *component_dai,
 {
 	struct cs35l36_private *cs35l36 =
 			snd_soc_component_get_drvdata(component_dai->component);
-	unsigned int asp_fmt, lrclk_fmt, sclk_fmt, slave_mode, clk_frc;
+	unsigned int asp_fmt, lrclk_fmt, sclk_fmt, clock_mode, clk_frc;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBM_CFM:
-		slave_mode = 1;
+		clock_mode = 1;
 		break;
 	case SND_SOC_DAIFMT_CBS_CFS:
-		slave_mode = 0;
+		clock_mode = 0;
 		break;
 	default:
 		return -EINVAL;
@@ -771,10 +771,10 @@ static int cs35l36_set_dai_fmt(struct snd_soc_dai *component_dai,
 
 	regmap_update_bits(cs35l36->regmap, CS35L36_ASP_TX_PIN_CTRL,
 				CS35L36_SCLK_MSTR_MASK,
-				slave_mode << CS35L36_SCLK_MSTR_SHIFT);
+				clock_mode << CS35L36_SCLK_MSTR_SHIFT);
 	regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RATE_CTRL,
 				CS35L36_LRCLK_MSTR_MASK,
-				slave_mode << CS35L36_LRCLK_MSTR_SHIFT);
+				clock_mode << CS35L36_LRCLK_MSTR_SHIFT);
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
 	case SND_SOC_DAIFMT_CONT:
-- 
1.9.1


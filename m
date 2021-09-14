Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A6040B05B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 16:16:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3113A17D3;
	Tue, 14 Sep 2021 16:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3113A17D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631629009;
	bh=UX3r3hsuVT1HliTmh+DzQJn4KNruvg5uby/lzSUgWwM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tgu1szO82AVkGORZ5rqND/+s/syg80WfS2H7bLe11yJrD6ywAfhSQdCaUp7sVm0Ua
	 GduYe0JG9dnA2sT6oaUmRWDxXJVJhxEMmlb7w20v5fO+gc5WXu4QO4BxseCYNITWp6
	 joO0iZ0jhJbP7pqOT/cmRUiwrSwJI5NyMQ09apZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D6C6F804FB;
	Tue, 14 Sep 2021 16:14:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B0BF804E7; Tue, 14 Sep 2021 16:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEBD4F8025E
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 16:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEBD4F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HbNNGTYt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E5NPuM016714; 
 Tue, 14 Sep 2021 09:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=hNdFsA8ySrhIMYHNMNtpLrI35tcrRfSahtJf8oNdr4I=;
 b=HbNNGTYtuTYzo1nO/DtVJE8f7YbI0wBgiSGS4059CKEH8mbsa5mmBHITZuWtL60O7DmT
 RY1yIsjnlI9AXhiPd8y395FWfZW0BVRRZwREYIstXeyxTCPiSrx8/nr896acM/Qvj80v
 tYDq9nmxenYRVXaZeSlnNLiF3jFNSSO8ToNd3yCyTsPTe+V2SO7bGg/qnb9uoK0+59Lv
 F25evaaJ+SpgvCUaMa2uNUS7UCCA47kv0xY+e1pK4Y63jgi9xMsHGLfgE47AxUE/fU9E
 ipy9ifbYk1cJR/kCHPrNa8nESELkX6zA4cal2geZCig9uVROIfSFAKFVAblg7PCuE/i9 ZQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b2gkx8qtw-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Sep 2021 09:13:53 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 14 Sep
 2021 15:13:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 14 Sep 2021 15:13:49 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B9A8EB38;
 Tue, 14 Sep 2021 14:13:49 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 5/6] ASoC: cs35l41: Fixup the error messages
Date: Tue, 14 Sep 2021 15:13:48 +0100
Message-ID: <20210914141349.30218-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
References: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TqDUiotoA_8ZQWf-FHOqXFQlJUcyBoHg
X-Proofpoint-GUID: TqDUiotoA_8ZQWf-FHOqXFQlJUcyBoHg
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 james.schulman@cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com
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

It is not idiomatic for ASoC to print the function name in the error
messages, however it is expected to show the return code. Update the
error messages to follow these conventions.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 53 +++++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 0d7073bb313ab..cc158fe4b7fe7 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -316,7 +316,7 @@ static int cs35l41_otp_unpack(void *data)
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_OTPID, &otp_id_reg);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Read OTP ID failed\n");
+		dev_err(cs35l41->dev, "Read OTP ID failed: %d\n", ret);
 		goto err_otp_unpack;
 	}
 
@@ -335,7 +335,7 @@ static int cs35l41_otp_unpack(void *data)
 	ret = regmap_bulk_read(cs35l41->regmap, CS35L41_OTP_MEM0, otp_mem,
 						CS35L41_OTP_SIZE_WORDS);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Read OTP Mem failed\n");
+		dev_err(cs35l41->dev, "Read OTP Mem failed: %d\n", ret);
 		goto err_otp_unpack;
 	}
 
@@ -349,12 +349,12 @@ static int cs35l41_otp_unpack(void *data)
 
 	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x00000055);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write Unlock key failed 1/2\n");
+		dev_err(cs35l41->dev, "Write Unlock key failed 1/2: %d\n", ret);
 		goto err_otp_unpack;
 	}
 	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x000000AA);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write Unlock key failed 2/2\n");
+		dev_err(cs35l41->dev, "Write Unlock key failed 2/2: %d\n", ret);
 		goto err_otp_unpack;
 	}
 
@@ -393,7 +393,7 @@ static int cs35l41_otp_unpack(void *data)
 						otp_map[i].shift),
 						otp_val << otp_map[i].shift);
 			if (ret < 0) {
-				dev_err(cs35l41->dev, "Write OTP val failed\n");
+				dev_err(cs35l41->dev, "Write OTP val failed: %d\n", ret);
 				goto err_otp_unpack;
 			}
 		}
@@ -401,12 +401,12 @@ static int cs35l41_otp_unpack(void *data)
 
 	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x000000CC);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write Lock key failed 1/2\n");
+		dev_err(cs35l41->dev, "Write Lock key failed 1/2: %d\n", ret);
 		goto err_otp_unpack;
 	}
 	ret = regmap_write(cs35l41->regmap, CS35L41_TEST_KEY_CTL, 0x00000033);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write Lock key failed 2/2\n");
+		dev_err(cs35l41->dev, "Write Lock key failed 2/2: %d\n", ret);
 		goto err_otp_unpack;
 	}
 	ret = 0;
@@ -745,9 +745,7 @@ static int cs35l41_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
-		dev_warn(cs35l41->dev,
-			"%s: Mixed provider/consumer mode unsupported\n",
-								__func__);
+		dev_warn(cs35l41->dev, "Mixed provider/consumer mode unsupported\n");
 		return -EINVAL;
 	}
 
@@ -758,8 +756,7 @@ static int cs35l41_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		daifmt |= 2 << CS35L41_ASP_FMT_SHIFT;
 		break;
 	default:
-		dev_warn(cs35l41->dev,
-			"%s: Invalid or unsupported DAI format\n", __func__);
+		dev_warn(cs35l41->dev, "Invalid or unsupported DAI format\n");
 		return -EINVAL;
 	}
 
@@ -776,8 +773,7 @@ static int cs35l41_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_NB_NF:
 		break;
 	default:
-		dev_warn(cs35l41->dev,
-			"%s: Invalid DAI clock INV\n", __func__);
+		dev_warn(cs35l41->dev, "Invalid DAI clock INV\n");
 		return -EINVAL;
 	}
 
@@ -824,8 +820,7 @@ static int cs35l41_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (i >= ARRAY_SIZE(cs35l41_fs_rates)) {
-		dev_err(cs35l41->dev, "%s: Unsupported rate: %u\n",
-						__func__, rate);
+		dev_err(cs35l41->dev, "Unsupported rate: %u\n", rate);
 		return -EINVAL;
 	}
 
@@ -1048,7 +1043,7 @@ static int cs35l41_boost_config(struct cs35l41_private *cs35l41,
 			CS35L41_BST_IPK_MASK,
 			bst_ipk_scaled << CS35L41_BST_IPK_SHIFT);
 	if (ret) {
-		dev_err(dev, "Failed to write boost inductor peak current\n");
+		dev_err(dev, "Failed to write boost inductor peak current: %d\n", ret);
 		return ret;
 	}
 
@@ -1067,7 +1062,7 @@ static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 					cs35l41->pdata.bst_cap,
 					cs35l41->pdata.bst_ipk);
 		if (ret) {
-			dev_err(cs35l41->dev, "Error in Boost DT config\n");
+			dev_err(cs35l41->dev, "Error in Boost DT config: %d\n", ret);
 			return ret;
 		}
 	} else {
@@ -1337,13 +1332,13 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, &regid);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Get Device ID failed\n");
+		dev_err(cs35l41->dev, "Get Device ID failed: %d\n", ret);
 		goto err;
 	}
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_REVID, &reg_revid);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Get Revision ID failed\n");
+		dev_err(cs35l41->dev, "Get Revision ID failed: %d\n", ret);
 		goto err;
 	}
 
@@ -1367,7 +1362,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 				ARRAY_SIZE(cs35l41_reva0_errata_patch));
 		if (ret < 0) {
 			dev_err(cs35l41->dev,
-				"Failed to apply A0 errata patch %d\n", ret);
+				"Failed to apply A0 errata patch: %d\n", ret);
 			goto err;
 		}
 		break;
@@ -1377,7 +1372,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 				ARRAY_SIZE(cs35l41_revb0_errata_patch));
 		if (ret < 0) {
 			dev_err(cs35l41->dev,
-				"Failed to apply B0 errata patch %d\n", ret);
+				"Failed to apply B0 errata patch: %d\n", ret);
 			goto err;
 		}
 		break;
@@ -1387,7 +1382,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 				ARRAY_SIZE(cs35l41_revb2_errata_patch));
 		if (ret < 0) {
 			dev_err(cs35l41->dev,
-				"Failed to apply B2 errata patch %d\n", ret);
+				"Failed to apply B2 errata patch: %d\n", ret);
 			goto err;
 		}
 		break;
@@ -1411,33 +1406,33 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 
 	ret = cs35l41_otp_unpack(cs35l41);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "OTP Unpack failed\n");
+		dev_err(cs35l41->dev, "OTP Unpack failed: %d\n", ret);
 		goto err;
 	}
 
 	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_CCM_CORE_CTRL, 0);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write CCM_CORE_CTRL failed\n");
+		dev_err(cs35l41->dev, "Write CCM_CORE_CTRL failed: %d\n", ret);
 		goto err;
 	}
 
 	ret = regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
 				 CS35L41_AMP_EN_MASK, 0);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write CS35L41_PWR_CTRL2 failed\n");
+		dev_err(cs35l41->dev, "Write CS35L41_PWR_CTRL2 failed: %d\n", ret);
 		goto err;
 	}
 
 	ret = regmap_update_bits(cs35l41->regmap, CS35L41_AMP_GAIN_CTRL,
 				 CS35L41_AMP_GAIN_PCM_MASK, 0);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write CS35L41_AMP_GAIN_CTRL failed\n");
+		dev_err(cs35l41->dev, "Write CS35L41_AMP_GAIN_CTRL failed: %d\n", ret);
 		goto err;
 	}
 
 	ret = cs35l41_set_pdata(cs35l41);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "%s: Set pdata failed\n", __func__);
+		dev_err(cs35l41->dev, "Set pdata failed: %d\n", ret);
 		goto err;
 	}
 
@@ -1445,7 +1440,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 					&soc_component_dev_cs35l41,
 					cs35l41_dai, ARRAY_SIZE(cs35l41_dai));
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "%s: Register codec failed\n", __func__);
+		dev_err(cs35l41->dev, "Register codec failed: %d\n", ret);
 		goto err;
 	}
 
-- 
2.11.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A94378CA6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57F7D16F1;
	Mon, 10 May 2021 15:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57F7D16F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620652630;
	bh=5RdqgsBZH1/baxkumnfA3ybcQwPpO80ssMJzaTbFYGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bcrjzl1V/z3ZhngO2yV0rX2nIVEYHg8RkeSM0zl++3P1vlNlDCdokqwLrJcKQ74Uw
	 vIYex8n8GyWadpbMTL6WxMOk8NRXxtmcq4bW1bueVruxsSmIEPg08QSZNuhhV4fmmf
	 K6hMg1I3wsfD2o7WI7Xidd61ZCjng0QMU5/QtwT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9734FF804AB;
	Mon, 10 May 2021 15:14:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CF47F804AB; Mon, 10 May 2021 15:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B40DBF80272
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B40DBF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KzxLf3o4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ADD5ck017163; Mon, 10 May 2021 08:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=8cL2nfKK7y3xbXO8zHyfzojzhEMs0Q9EfFInsEAVUPw=;
 b=KzxLf3o4/1Xr/imX3ioYU7vjC3DQ/2aKV/8zrOgqneUHD2RJC9MSNzEZDDDlz1/AvwFZ
 8NHl0qLLfKLGc7Rj6zJY6TzKbQDf9jjayVZ4h0Trx7T7KHjs2U6L+PwJsDTFuL4Lq0aU
 FM3lUxMphdncIz49fZHTUtLLnbbhZgoSHlRt4rUQsg6hT+yFSFZWAjJRmehySIcRKVp0
 D2KwjE71aRzsI8I6+2G/CzhXg8qhwolBl8fgWW/DoJ+IrqdZC2zSgnq16Fd029KnxnWD
 TJ+cjVQK6m+eSn3XZ4btp/Q1Bt/nAXeIeF873jkP6455dTMOBhtZzgB/TGx0uYYsnmoz rA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38f4x181h2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 May 2021 08:14:00 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 14:13:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 10 May 2021 14:13:57 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B8C2E11CF;
 Mon, 10 May 2021 13:13:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 02/10] ASoC: cs35l32: Minor error paths fixups
Date: Mon, 10 May 2021 14:13:49 +0100
Message-ID: <20210510131357.17170-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: orlbzvhQYxlD4xOIprftaW1HTQixjebw
X-Proofpoint-ORIG-GUID: orlbzvhQYxlD4xOIprftaW1HTQixjebw
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100092
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, james.schulman@cirrus.com,
 david.rhodes@cirrus.com
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

Correct some unchecked re-allocations of ret whilst reading the device
ID and ensure the hardware state is returned to off on the error
paths.

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l32.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index f4067230ac425..7e1047362a901 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -30,6 +30,7 @@
 #include <dt-bindings/sound/cs35l32.h>
 
 #include "cs35l32.h"
+#include "cirrus_legacy.h"
 
 #define CS35L32_NUM_SUPPLIES 2
 static const char *const cs35l32_supply_names[CS35L32_NUM_SUPPLIES] = {
@@ -348,8 +349,7 @@ static int cs35l32_i2c_probe(struct i2c_client *i2c_client,
 	struct cs35l32_private *cs35l32;
 	struct cs35l32_platform_data *pdata =
 		dev_get_platdata(&i2c_client->dev);
-	int ret, i;
-	unsigned int devid = 0;
+	int ret, i, devid;
 	unsigned int reg;
 
 	cs35l32 = devm_kzalloc(&i2c_client->dev, sizeof(*cs35l32), GFP_KERNEL);
@@ -404,40 +404,40 @@ static int cs35l32_i2c_probe(struct i2c_client *i2c_client,
 	/* Reset the Device */
 	cs35l32->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
 		"reset", GPIOD_OUT_LOW);
-	if (IS_ERR(cs35l32->reset_gpio))
-		return PTR_ERR(cs35l32->reset_gpio);
+	if (IS_ERR(cs35l32->reset_gpio)) {
+		ret = PTR_ERR(cs35l32->reset_gpio);
+		goto err_supplies;
+	}
 
 	gpiod_set_value_cansleep(cs35l32->reset_gpio, 1);
 
 	/* initialize codec */
-	ret = regmap_read(cs35l32->regmap, CS35L32_DEVID_AB, &reg);
-	devid = (reg & 0xFF) << 12;
-
-	ret = regmap_read(cs35l32->regmap, CS35L32_DEVID_CD, &reg);
-	devid |= (reg & 0xFF) << 4;
-
-	ret = regmap_read(cs35l32->regmap, CS35L32_DEVID_E, &reg);
-	devid |= (reg & 0xF0) >> 4;
+	devid = cirrus_read_device_id(cs35l32->regmap, CS35L32_DEVID_AB);
+	if (devid < 0) {
+		ret = devid;
+		dev_err(&i2c_client->dev, "Failed to read device ID: %d\n", ret);
+		goto err_disable;
+	}
 
 	if (devid != CS35L32_CHIP_ID) {
 		ret = -ENODEV;
 		dev_err(&i2c_client->dev,
 			"CS35L32 Device ID (%X). Expected %X\n",
 			devid, CS35L32_CHIP_ID);
-		return ret;
+		goto err_disable;
 	}
 
 	ret = regmap_read(cs35l32->regmap, CS35L32_REV_ID, &reg);
 	if (ret < 0) {
 		dev_err(&i2c_client->dev, "Get Revision ID failed\n");
-		return ret;
+		goto err_disable;
 	}
 
 	ret = regmap_register_patch(cs35l32->regmap, cs35l32_monitor_patch,
 				    ARRAY_SIZE(cs35l32_monitor_patch));
 	if (ret < 0) {
 		dev_err(&i2c_client->dev, "Failed to apply errata patch\n");
-		return ret;
+		goto err_disable;
 	}
 
 	dev_info(&i2c_client->dev,
@@ -478,7 +478,7 @@ static int cs35l32_i2c_probe(struct i2c_client *i2c_client,
 			    CS35L32_PDN_AMP);
 
 	/* Clear MCLK Error Bit since we don't have the clock yet */
-	ret = regmap_read(cs35l32->regmap, CS35L32_INT_STATUS_1, &reg);
+	regmap_read(cs35l32->regmap, CS35L32_INT_STATUS_1, &reg);
 
 	ret = devm_snd_soc_register_component(&i2c_client->dev,
 			&soc_component_dev_cs35l32, cs35l32_dai,
@@ -489,6 +489,8 @@ static int cs35l32_i2c_probe(struct i2c_client *i2c_client,
 	return 0;
 
 err_disable:
+	gpiod_set_value_cansleep(cs35l32->reset_gpio, 0);
+err_supplies:
 	regulator_bulk_disable(ARRAY_SIZE(cs35l32->supplies),
 			       cs35l32->supplies);
 	return ret;
-- 
2.11.0


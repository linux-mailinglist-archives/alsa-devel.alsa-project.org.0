Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA8378CA2
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 216BE16D0;
	Mon, 10 May 2021 15:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 216BE16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620652590;
	bh=VcnxZRm+Qslu/ehAKaXmNujuaXr2CLUQRypPOK3Oz84=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KN0Z7+2uiZeP9MRq8NnowPVhEw2qS4L2fhRdvavjI8mxKThNMwfk81BoZIjNgSqtB
	 +sTv2Z+RoiaEoIjb/LwoDjewugd4WfStqosIA97hJGnwbPRzCIn9kcO15s5+PUgO4N
	 1adbeogD4J3ZmIRJk5jF3YTJ2Dd0NzMISxbO71IY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F7C8F804A9;
	Mon, 10 May 2021 15:14:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C89FF80475; Mon, 10 May 2021 15:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56B9CF800B4
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B9CF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ExnqgGEO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ADDl48002119; Mon, 10 May 2021 08:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=YuLDh0segeWIEOUBUtCj3Z2I6mIpBis58Kmy1qEUyeI=;
 b=ExnqgGEOESvHlJVESRcjkPqGoW85h7uhXV4Z1xqzpZFUJ9jZgRV799RmlrekttukwD0O
 Zx8HqBT3VtlXViU865Lz96qE7GQ1pmzEaNF3cQamdZVRiibsVIN6HVSazeN98qqypc8M
 urU0BBWrqjyx+XB8I5s32c2XDpPAuQiNuNlfL7XHd40KF+q4qqKG5u8fR6tXjNuR2Lp9
 TbjZd9lSwHG3PoMLiP9ElWaEIGFIPsm4c4eHG4KenZDjgzM+xhyTIL5/+kRw1SDyCxoX
 zX/vi1m/ESbzWCGPFkFunuaQHLeQZgDfUNna8VPFDOAvV+Mm8Tz6di02mKX0dUXNAGF1 pA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4r60v-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 May 2021 08:14:00 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 14:13:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 10 May 2021 14:13:57 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C0EB711D8;
 Mon, 10 May 2021 13:13:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 04/10] ASoC: cs35l34:  Minor error paths fixups
Date: Mon, 10 May 2021 14:13:51 +0100
Message-ID: <20210510131357.17170-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: q2UHp9g65vhtNeuJOLWS5AopwETgVsRP
X-Proofpoint-ORIG-GUID: q2UHp9g65vhtNeuJOLWS5AopwETgVsRP
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
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
 sound/soc/codecs/cs35l34.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 110ee2d063581..6657cc5db3e87 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -34,6 +34,7 @@
 #include <sound/cs35l34.h>
 
 #include "cs35l34.h"
+#include "cirrus_legacy.h"
 
 #define PDN_DONE_ATTEMPTS 10
 #define CS35L34_START_DELAY 50
@@ -996,9 +997,8 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c_client,
 	struct cs35l34_private *cs35l34;
 	struct cs35l34_platform_data *pdata =
 		dev_get_platdata(&i2c_client->dev);
-	int i;
+	int i, devid;
 	int ret;
-	unsigned int devid = 0;
 	unsigned int reg;
 
 	cs35l34 = devm_kzalloc(&i2c_client->dev, sizeof(*cs35l34), GFP_KERNEL);
@@ -1039,13 +1039,15 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c_client,
 	} else {
 		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
 				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
+		if (!pdata) {
+			ret = -ENOMEM;
+			goto err_regulator;
+		}
 
 		if (i2c_client->dev.of_node) {
 			ret = cs35l34_handle_of_data(i2c_client, pdata);
 			if (ret != 0)
-				return ret;
+				goto err_regulator;
 
 		}
 		cs35l34->pdata = *pdata;
@@ -1059,33 +1061,34 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c_client,
 
 	cs35l34->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
 				"reset-gpios", GPIOD_OUT_LOW);
-	if (IS_ERR(cs35l34->reset_gpio))
-		return PTR_ERR(cs35l34->reset_gpio);
+	if (IS_ERR(cs35l34->reset_gpio)) {
+		ret = PTR_ERR(cs35l34->reset_gpio);
+		goto err_regulator;
+	}
 
 	gpiod_set_value_cansleep(cs35l34->reset_gpio, 1);
 
 	msleep(CS35L34_START_DELAY);
 
-	ret = regmap_read(cs35l34->regmap, CS35L34_DEVID_AB, &reg);
-
-	devid = (reg & 0xFF) << 12;
-	ret = regmap_read(cs35l34->regmap, CS35L34_DEVID_CD, &reg);
-	devid |= (reg & 0xFF) << 4;
-	ret = regmap_read(cs35l34->regmap, CS35L34_DEVID_E, &reg);
-	devid |= (reg & 0xF0) >> 4;
+	devid = cirrus_read_device_id(cs35l34->regmap, CS35L34_DEVID_AB);
+	if (devid < 0) {
+		ret = devid;
+		dev_err(&i2c_client->dev, "Failed to read device ID: %d\n", ret);
+		goto err_reset;
+	}
 
 	if (devid != CS35L34_CHIP_ID) {
 		dev_err(&i2c_client->dev,
 			"CS35l34 Device ID (%X). Expected ID %X\n",
 			devid, CS35L34_CHIP_ID);
 		ret = -ENODEV;
-		goto err_regulator;
+		goto err_reset;
 	}
 
 	ret = regmap_read(cs35l34->regmap, CS35L34_REV_ID, &reg);
 	if (ret < 0) {
 		dev_err(&i2c_client->dev, "Get Revision ID failed\n");
-		goto err_regulator;
+		goto err_reset;
 	}
 
 	dev_info(&i2c_client->dev,
@@ -1110,11 +1113,13 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c_client,
 	if (ret < 0) {
 		dev_err(&i2c_client->dev,
 			"%s: Register component failed\n", __func__);
-		goto err_regulator;
+		goto err_reset;
 	}
 
 	return 0;
 
+err_reset:
+	gpiod_set_value_cansleep(cs35l34->reset_gpio, 0);
 err_regulator:
 	regulator_bulk_disable(cs35l34->num_core_supplies,
 		cs35l34->core_supplies);
-- 
2.11.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D76C378CA1
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AAC916BF;
	Mon, 10 May 2021 15:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AAC916BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620652555;
	bh=bZVqf6KJxapLYDDWMfMVTHsX1t3w55m+dxknESl9oiI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TDra1KywSxrnilMQImU6O8mDI0jIy3xOWldf2cHPgKFNGQf7jpW+iAGsq4QDQyXNW
	 wp8ncrNg7gYM9U1EzyjqtI3Mks6g5TjEQcDx9/OdGUYeWnqBKYtoZF7kSO7wW67mL8
	 sx2UI5SbyI/NgEReiHzjRvOCp3Hp7WyuEa66jOiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FB57F80475;
	Mon, 10 May 2021 15:14:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06207F80475; Mon, 10 May 2021 15:14:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF7DFF8020C
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF7DFF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TNVYFByF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ADDl4C002119; Mon, 10 May 2021 08:14:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=nyRsAm7uMV9MOsc49IfNltwL8dOdSD1dAHlHoMl4I68=;
 b=TNVYFByFbjWx2JRb6OC6e23XlPMDkkZUNHC2SxjwWfUaeUWePaKVaBFwC2CcJQZ1exbw
 0WZwAh+zwj0xJMqsyTeolvcXHHEoQ2MgOse99hOMRtSCMyWgiW577wDuTcZMTumxzHlx
 EO9aNP5ZbahjlpQGom4h5Rk3id3jzoOuRw+NQvK8zAJA/Wv+8YW00A0Cd9RRtOLlcqZe
 c2aViWLLPZ1ToOnOIlETyLqQDgeBnpSD9zdjFK2ZO/cjIE7hIyMtYF+OWX91HpZcm+FZ
 ZOelJPyBlczg5zJ5KU1iXCBmOHkyQSRYF69ZVVwip4gaKeGluq6Q6Y00Q21r/khj4Ihf PA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4r60v-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 May 2021 08:14:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 14:13:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 10 May 2021 14:13:58 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EC65C11D1;
 Mon, 10 May 2021 13:13:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 08/10] ASoC: cs42l73:  Minor error paths fixups
Date: Mon, 10 May 2021 14:13:55 +0100
Message-ID: <20210510131357.17170-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: pBhn6rQQRbo7zmIX2dIo2I7yiXMdH92A
X-Proofpoint-ORIG-GUID: pBhn6rQQRbo7zmIX2dIo2I7yiXMdH92A
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
 sound/soc/codecs/cs42l73.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index c3f974ec78e58..da5d77a5f55bb 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -27,6 +27,7 @@
 #include <sound/tlv.h>
 #include <sound/cs42l73.h>
 #include "cs42l73.h"
+#include "cirrus_legacy.h"
 
 struct sp_config {
 	u8 spc, mmcc, spfs;
@@ -1275,8 +1276,7 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client,
 {
 	struct cs42l73_private *cs42l73;
 	struct cs42l73_platform_data *pdata = dev_get_platdata(&i2c_client->dev);
-	int ret;
-	unsigned int devid = 0;
+	int ret, devid;
 	unsigned int reg;
 	u32 val32;
 
@@ -1326,27 +1326,25 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client,
 	}
 
 	/* initialize codec */
-	ret = regmap_read(cs42l73->regmap, CS42L73_DEVID_AB, &reg);
-	devid = (reg & 0xFF) << 12;
-
-	ret = regmap_read(cs42l73->regmap, CS42L73_DEVID_CD, &reg);
-	devid |= (reg & 0xFF) << 4;
-
-	ret = regmap_read(cs42l73->regmap, CS42L73_DEVID_E, &reg);
-	devid |= (reg & 0xF0) >> 4;
+	devid = cirrus_read_device_id(cs42l73->regmap, CS42L73_DEVID_AB);
+	if (devid < 0) {
+		ret = devid;
+		dev_err(&i2c_client->dev, "Failed to read device ID: %d\n", ret);
+		goto err_reset;
+	}
 
 	if (devid != CS42L73_DEVID) {
 		ret = -ENODEV;
 		dev_err(&i2c_client->dev,
 			"CS42L73 Device ID (%X). Expected %X\n",
 			devid, CS42L73_DEVID);
-		return ret;
+		goto err_reset;
 	}
 
 	ret = regmap_read(cs42l73->regmap, CS42L73_REVID, &reg);
 	if (ret < 0) {
 		dev_err(&i2c_client->dev, "Get Revision ID failed\n");
-		return ret;
+		goto err_reset;
 	}
 
 	dev_info(&i2c_client->dev,
@@ -1356,8 +1354,14 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client,
 			&soc_component_dev_cs42l73, cs42l73_dai,
 			ARRAY_SIZE(cs42l73_dai));
 	if (ret < 0)
-		return ret;
+		goto err_reset;
+
 	return 0;
+
+err_reset:
+	gpio_set_value_cansleep(cs42l73->pdata.reset_gpio, 0);
+
+	return ret;
 }
 
 static const struct of_device_id cs42l73_of_match[] = {
-- 
2.11.0


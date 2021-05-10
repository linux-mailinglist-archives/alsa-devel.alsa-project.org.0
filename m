Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7270378CAD
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:18:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64B10174B;
	Mon, 10 May 2021 15:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64B10174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620652732;
	bh=3PrZEQYeYzwsmdStyPTUGC801O1yp/X5AXu7veB97G4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GMuCXJtZIqb6/xpv/AE28kfeusuo69vQ3nIMXrodbxj2zJPLIz+84NCjmHqM7G9iL
	 PacQihfXCQrX2/e0vzCfHtuPU1zmGtu6kZLG38CRySHtuaVeBfVQwB9Hh7jMprW33V
	 qJWGq5tuJ3ngEDWlZIpK1dmF6TExYLddBW4HHHWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A9E4F804E2;
	Mon, 10 May 2021 15:14:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06EFBF802E7; Mon, 10 May 2021 15:14:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBAFCF80431
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBAFCF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="GfqfoUpz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ADDl4B002119; Mon, 10 May 2021 08:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=5Xz2X9kwZsmC+57mVq+jQmu1eh8u8mOHJI3l2bDqdfU=;
 b=GfqfoUpzsJtOve6zLd6QoAjrR6fvMHdSlHNBOkzRIR2Y7e9ui2JuWUfukmFOGarZz6+f
 BfysJvXEleKw6UV0R2U8oosCvUJK/MDbIAmh2qI741SyTvxgkaRv8+9iOccBzQ5UXo7y
 1A4ffnbkgGKT0Ad+K9bYWt0K68Q6l/hvlCUb2WkGtpu8SIS21N94YWnPZ/IqrH2cHU53
 S5X2f4QlU7aM/HVqzdW8nIW2vOAf7P4opnv1gqa8GPSMG1zw64OYj0RPr+tocfv91olH
 OM2wPn/Zss5fIS14YR3HOLBXz9AFxPsc5emVoVswm20FVTKuvk3zWUUxw1ZJTXX3HxQC zQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4r60v-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 May 2021 08:14:03 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 14:13:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 10 May 2021 14:13:57 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C51D911DB;
 Mon, 10 May 2021 13:13:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 05/10] ASoC: cs35l35:  Minor error paths fixups
Date: Mon, 10 May 2021 14:13:52 +0100
Message-ID: <20210510131357.17170-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: kuvSkuBrjSX-Mq6mN_V2x7E-bIugOhri
X-Proofpoint-ORIG-GUID: kuvSkuBrjSX-Mq6mN_V2x7E-bIugOhri
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=885
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
 sound/soc/codecs/cs35l35.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index f20ed838b9580..554b32f388d9a 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -33,6 +33,7 @@
 #include <linux/completion.h>
 
 #include "cs35l35.h"
+#include "cirrus_legacy.h"
 
 /*
  * Some fields take zero as a valid value so use a high bit flag that won't
@@ -1471,9 +1472,8 @@ static int cs35l35_i2c_probe(struct i2c_client *i2c_client,
 	struct cs35l35_private *cs35l35;
 	struct device *dev = &i2c_client->dev;
 	struct cs35l35_platform_data *pdata = dev_get_platdata(dev);
-	int i;
+	int i, devid;
 	int ret;
-	unsigned int devid = 0;
 	unsigned int reg;
 
 	cs35l35 = devm_kzalloc(dev, sizeof(struct cs35l35_private), GFP_KERNEL);
@@ -1552,13 +1552,12 @@ static int cs35l35_i2c_probe(struct i2c_client *i2c_client,
 		goto err;
 	}
 	/* initialize codec */
-	ret = regmap_read(cs35l35->regmap, CS35L35_DEVID_AB, &reg);
-
-	devid = (reg & 0xFF) << 12;
-	ret = regmap_read(cs35l35->regmap, CS35L35_DEVID_CD, &reg);
-	devid |= (reg & 0xFF) << 4;
-	ret = regmap_read(cs35l35->regmap, CS35L35_DEVID_E, &reg);
-	devid |= (reg & 0xF0) >> 4;
+	devid = cirrus_read_device_id(cs35l35->regmap, CS35L35_DEVID_AB);
+	if (devid < 0) {
+		ret = devid;
+		dev_err(dev, "Failed to read device ID: %d\n", ret);
+		goto err;
+	}
 
 	if (devid != CS35L35_CHIP_ID) {
 		dev_err(dev, "CS35L35 Device ID (%X). Expected ID %X\n",
-- 
2.11.0


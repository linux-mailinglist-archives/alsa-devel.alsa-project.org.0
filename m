Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB882378CA9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:17:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5777E1712;
	Mon, 10 May 2021 15:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5777E1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620652671;
	bh=LoTQ3anNESH+pX9p7sHd8H8pOlo8fXuk/UJqPNc8A60=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARMoyw7EiDyPbxYxTKGW93QTSgxe3Ro9Ri1RDnkcSs9V7tORj09puLiApnlSmSkwX
	 FpTXnbuYEYSS97c2PMVFO0gZt/L4c2PvXIOQGG35sZSja7YIZGwvxgfhwG/7TPcBjJ
	 5BeW+R42DURxueI3zbjH2n/2TsGRDoWX11tQsuOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E8B6F804B4;
	Mon, 10 May 2021 15:14:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA8F5F804AB; Mon, 10 May 2021 15:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C4E5F8027B
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C4E5F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nusHwKGh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ADD5cn017163; Mon, 10 May 2021 08:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=2GV0e3MQBso7VhdrVpeKzynt1wO2jiTI64fXkLTZiwg=;
 b=nusHwKGhDtcaCoWWi6gIoNjUhPmEMNvyej8umXBvHbKZU5yzgDQ6loU4PLNnRCONOjHc
 9EhTXvHaNB1GE2chTz7bA6uip+ZjlG4M5/LHyh6mDzD9Wm/x1gNjt8bZplTXxK7j5i9i
 01oL7fst2rTPNS1ogAnD/4M+eKMKhsqIPbWaCVb7aIqA0mznsDhDSV53+xFyjnHkw4Un
 NbvDRc5LdAAL64ZtP0brZyO7Mr8AkQhF5la3gncJePMV1tIpE8EGnWm5L2HvF+W6/cx5
 FF53YnbQp8PZdkQ7BtwqCMZjqe52rAFUlrMqhEK5VgrPVhn080pSGdjpj/t63un/wU1v Qw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38f4x181h2-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 May 2021 08:14:02 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 14:13:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 10 May 2021 14:13:58 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 13C1B11CF;
 Mon, 10 May 2021 13:13:58 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 10/10] ASoC: cs53l30:  Minor error paths fixups
Date: Mon, 10 May 2021 14:13:57 +0100
Message-ID: <20210510131357.17170-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: dcUBSC67Uuh9xZYgJyiYJuRUvtnVYZZr
X-Proofpoint-ORIG-GUID: dcUBSC67Uuh9xZYgJyiYJuRUvtnVYZZr
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
 sound/soc/codecs/cs53l30.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 3d67cbf9eaaa2..bd33dd048c7ce 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -20,6 +20,7 @@
 #include <sound/tlv.h>
 
 #include "cs53l30.h"
+#include "cirrus_legacy.h"
 
 #define CS53L30_NUM_SUPPLIES 2
 static const char *const cs53l30_supply_names[CS53L30_NUM_SUPPLIES] = {
@@ -920,9 +921,8 @@ static int cs53l30_i2c_probe(struct i2c_client *client,
 	const struct device_node *np = client->dev.of_node;
 	struct device *dev = &client->dev;
 	struct cs53l30_private *cs53l30;
-	unsigned int devid = 0;
 	unsigned int reg;
-	int ret = 0, i;
+	int ret = 0, i, devid;
 	u8 val;
 
 	cs53l30 = devm_kzalloc(dev, sizeof(*cs53l30), GFP_KERNEL);
@@ -951,7 +951,7 @@ static int cs53l30_i2c_probe(struct i2c_client *client,
 						      GPIOD_OUT_LOW);
 	if (IS_ERR(cs53l30->reset_gpio)) {
 		ret = PTR_ERR(cs53l30->reset_gpio);
-		goto error;
+		goto error_supplies;
 	}
 
 	gpiod_set_value_cansleep(cs53l30->reset_gpio, 1);
@@ -968,14 +968,12 @@ static int cs53l30_i2c_probe(struct i2c_client *client,
 	}
 
 	/* Initialize codec */
-	ret = regmap_read(cs53l30->regmap, CS53L30_DEVID_AB, &reg);
-	devid = reg << 12;
-
-	ret = regmap_read(cs53l30->regmap, CS53L30_DEVID_CD, &reg);
-	devid |= reg << 4;
-
-	ret = regmap_read(cs53l30->regmap, CS53L30_DEVID_E, &reg);
-	devid |= (reg & 0xF0) >> 4;
+	devid = cirrus_read_device_id(cs53l30->regmap, CS53L30_DEVID_AB);
+	if (devid < 0) {
+		ret = devid;
+		dev_err(dev, "Failed to read device ID: %d\n", ret);
+		goto error;
+	}
 
 	if (devid != CS53L30_DEVID) {
 		ret = -ENODEV;
@@ -1037,6 +1035,8 @@ static int cs53l30_i2c_probe(struct i2c_client *client,
 	return 0;
 
 error:
+	gpiod_set_value_cansleep(cs53l30->reset_gpio, 0);
+error_supplies:
 	regulator_bulk_disable(ARRAY_SIZE(cs53l30->supplies),
 			       cs53l30->supplies);
 	return ret;
-- 
2.11.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE49378CAC
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:18:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B79C41738;
	Mon, 10 May 2021 15:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B79C41738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620652708;
	bh=YvRqRZLlsMz2vQBxINLc68YaDlyGk5CmGmDvXANhMbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JN7QF0qm+2z/sgXzzt3M3mGFu5Nh4QDiO/d7gwrHBpJ04I6XMxQMeB2u21PMfmeGJ
	 iF/KZpMF7ZIpcLEk0uQfaEowBd0VNxERZBOF5MSFj9aWXH4MoWAjFwQvldzzvSHrjk
	 fri4KfbB5tgdSxYwrLPVhrlueKT8AGF1xlqfmPXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05A62F804E1;
	Mon, 10 May 2021 15:14:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD04BF804AB; Mon, 10 May 2021 15:14:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89CEEF8027D
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89CEEF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NLgkZ9Gt"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ADDl4A002119; Mon, 10 May 2021 08:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=+kTLTXVuYtWf66VeKN914c2iVk3N1EC2mt91R4r3SRM=;
 b=NLgkZ9Gt942P/Is846cH99oG1fKGE7AyFZ+uWBHkwVQQYWeWQNs25KSW8Obv158pMp9L
 JKxcMsAQnRRLQHcY8I5jkLGjJ02sIdE0DCTpzW6TZ1MlVhq91X/TC2P2TkauGomWuXOD
 yO3BmAEFDWJf/lkssw8LBwAIN+qE8AbzMz3BPztGvFWqHpJxVBkcQDnVggdQ8gQWoC/t
 F1gK0ggITrL7X7QSJF+huWGg3yqM8gO6oEJY/lawjXMngaU79iQeQCoA+1E9NkRIHPld
 X/W1JpgNL1FNjN96dZEQhTCdFgoyi9ankmg+JlEpRmLEfhD/oxNX4blIDYogUeAgTQTw EQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4r60v-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 May 2021 08:14:02 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 14:13:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 10 May 2021 14:13:57 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DF6E611CF;
 Mon, 10 May 2021 13:13:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 07/10] ASoC: cs42l42:  Minor error paths fixups
Date: Mon, 10 May 2021 14:13:54 +0100
Message-ID: <20210510131357.17170-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: -jQKq9plI-z3wNBHmgdUYakTyjnUVPeN
X-Proofpoint-ORIG-GUID: -jQKq9plI-z3wNBHmgdUYakTyjnUVPeN
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
 sound/soc/codecs/cs42l42.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index bf982e145e945..594d771336719 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -36,6 +36,7 @@
 #include <dt-bindings/sound/cs42l42.h>
 
 #include "cs42l42.h"
+#include "cirrus_legacy.h"
 
 static const struct reg_default cs42l42_reg_defaults[] = {
 	{ CS42L42_FRZ_CTL,			0x00 },
@@ -1816,8 +1817,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 				       const struct i2c_device_id *id)
 {
 	struct cs42l42_private *cs42l42;
-	int ret, i;
-	unsigned int devid = 0;
+	int ret, i, devid;
 	unsigned int reg;
 
 	cs42l42 = devm_kzalloc(&i2c_client->dev, sizeof(struct cs42l42_private),
@@ -1880,14 +1880,12 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 			"Failed to request IRQ: %d\n", ret);
 
 	/* initialize codec */
-	ret = regmap_read(cs42l42->regmap, CS42L42_DEVID_AB, &reg);
-	devid = (reg & 0xFF) << 12;
-
-	ret = regmap_read(cs42l42->regmap, CS42L42_DEVID_CD, &reg);
-	devid |= (reg & 0xFF) << 4;
-
-	ret = regmap_read(cs42l42->regmap, CS42L42_DEVID_E, &reg);
-	devid |= (reg & 0xF0) >> 4;
+	devid = cirrus_read_device_id(cs42l42->regmap, CS42L42_DEVID_AB);
+	if (devid < 0) {
+		ret = devid;
+		dev_err(&i2c_client->dev, "Failed to read device ID: %d\n", ret);
+		goto err_disable;
+	}
 
 	if (devid != CS42L42_CHIP_ID) {
 		ret = -ENODEV;
-- 
2.11.0


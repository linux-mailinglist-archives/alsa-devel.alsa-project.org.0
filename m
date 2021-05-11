Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737D37A462
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 12:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C80A17A6;
	Tue, 11 May 2021 12:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C80A17A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620728006;
	bh=kUxT1LydhI9QpJw6Wiin34zAVdmMy7g+ghU7xYaPM7Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pOB/SPKMSvlKCud4+KjFyfecmkh5kjf0Mwq2okvEqTuRGTJaUuRqgijp4sqpz1iKT
	 Cp2jlZav1M70Fm6easNKiuVPXVT8e/LqqAB3iXrdF3DFLv7kn4JKxf/TBqdF4Vb1U9
	 RStCmgAkTayRj+OJf4V2Bcm8jK9lUoB6OCx4ggII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB87F80425;
	Tue, 11 May 2021 12:11:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27B82F801D5; Tue, 11 May 2021 12:11:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 408F2F80156
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 12:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 408F2F80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WbDR/9Wi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BA6mg9024838; Tue, 11 May 2021 05:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=Filu6WrA0rciwWBdYhDoXtd1d4rQIvRmlq/5j0gfA20=;
 b=WbDR/9WiKqVqcGkxJoCDNY8NE/3uduHCaM3ywtG0zOn5l+c022nGiGSkLzpMvl9pd/rX
 E3++Xnzzz47CoN2Y2nCvSJAcrHBEO8NtLfqN90yqxXbcjdSagQ8kv9PUtPgHtNQ/QPOz
 /2El+8q3f2ObDNSuFo58KHJmbIX2g5+adhyZnaWRX+6WpenCE6hCvZ5CWrNW8A8CQeu0
 1S5I03nfzf/fV7oJV3fNy6n0v/89B8dAkpqQd+6XbAaeC8fGYXB1zPsDXn0TaOWPMWBs
 RlTnsyYxHBvn6UueBXY7RnNw78XkjryJGP1ZobkvKY3zZ4j2l6jgxPzYDc1zYV4dQjFq FQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4sbe6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 05:10:53 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 11:10:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 11:10:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8702311D7;
 Tue, 11 May 2021 10:10:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: cs42l52: Minor tidy up of error paths
Date: Tue, 11 May 2021 11:10:51 +0100
Message-ID: <20210511101051.17726-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210511101051.17726-1-ckeepax@opensource.cirrus.com>
References: <20210511101051.17726-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: aTONEsHrlr4PbBedrfYhL7p7jL4uLXlf
X-Proofpoint-ORIG-GUID: aTONEsHrlr4PbBedrfYhL7p7jL4uLXlf
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110076
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

Fixup a needlessly initialised variable and an unchecked return
value.

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l52.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 796b894c390fe..88547e2cd53dc 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -1093,7 +1093,7 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client,
 	struct cs42l52_private *cs42l52;
 	struct cs42l52_platform_data *pdata = dev_get_platdata(&i2c_client->dev);
 	int ret;
-	unsigned int devid = 0;
+	unsigned int devid;
 	unsigned int reg;
 	u32 val32;
 
@@ -1163,6 +1163,11 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client,
 			 ret);
 
 	ret = regmap_read(cs42l52->regmap, CS42L52_CHIP, &reg);
+	if (ret) {
+		dev_err(&i2c_client->dev, "Failed to read chip ID: %d\n", ret);
+		return ret;
+	}
+
 	devid = reg & CS42L52_CHIP_ID_MASK;
 	if (devid != CS42L52_CHIP_ID) {
 		ret = -ENODEV;
@@ -1199,11 +1204,8 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client,
 				   CS42L52_IFACE_CTL2_BIAS_LVL,
 				cs42l52->pdata.micbias_lvl);
 
-	ret =  devm_snd_soc_register_component(&i2c_client->dev,
+	return devm_snd_soc_register_component(&i2c_client->dev,
 			&soc_component_dev_cs42l52, &cs42l52_dai, 1);
-	if (ret < 0)
-		return ret;
-	return 0;
 }
 
 static const struct of_device_id cs42l52_of_match[] = {
-- 
2.11.0


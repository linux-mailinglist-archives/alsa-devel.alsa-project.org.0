Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EE232F161
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 18:38:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60ABD18BA;
	Fri,  5 Mar 2021 18:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60ABD18BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614965896;
	bh=kutv4tbZhZ5g1NFVzU6oDhQQLWeJQc9h4Dol18M5mV8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MEjddRRSm3vI13Jx82E8RrjFwb17puDUQrFi2jgpJyz36Ip877s9BTCqkUUn/nBQ5
	 DjshYpeusCwsYc7ooTHUpKOJHuyKFWs7mf6yVxKhNFPodOAOvlcS4KoMbdXcnf1yQf
	 Zii4fjRWJNrQDeiaeUG4wmpQ1FErXUUnioyjwbf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB31FF802E7;
	Fri,  5 Mar 2021 18:35:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C172FF8026A; Fri,  5 Mar 2021 18:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 030A2F80257
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 18:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 030A2F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="iKS+dRiA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125HUg0k001824; Fri, 5 Mar 2021 11:34:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=d/rdx5IyQDbqeis2vUZ+ex3yXt5Jft5sLBdaoiwDShg=;
 b=iKS+dRiAaNC/zXY7FgN+Ko3w7PPaVWPQbid1GZhuFEcxRsV7mHvwXuDQjSgDHvWFrOO4
 LDGLk9rwsLXM9i2UfjT2/dACINTx4B/DBOMtmGSqDgNYXiB/A2AJExdOZD9hdJYqOKOh
 ozg+VTkmTqWWVP6hwtw/qeYdzGQRPinxUJe70TUSUauiylOhvBWGNwJFM77GSaCzN9UK
 dsoSPgPnqSpPuzjdPc6x8QWQUXivmxW10vIC4p3j5jp9Vq4pTza5czuNioolXsH6d2ls
 m4n4mF9Mg3iS/T1x5rY4NNuuNr/xI5sJkg93+M6I+XdIcNv4F8mXVcGVwP9ELVYpgboK kA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36ykctraxk-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 05 Mar 2021 11:34:48 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 5 Mar 2021
 17:34:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:34:47 +0000
Received: from mail1.cirrus.com (unknown [198.61.64.35])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2F1BF11CB;
 Fri,  5 Mar 2021 17:34:47 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH v2 07/15] ASoC: cs42l42: Disable regulators if probe fails
Date: Fri, 5 Mar 2021 17:34:34 +0000
Message-ID: <20210305173442.195740-8-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
References: <20210305173442.195740-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103050090
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

In case of cs42l42_i2c_probe() fail, the regulators were left enabled.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
Changes in v2:
- No changes

 sound/soc/codecs/cs42l42.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 78274537a22af..33c072f71867b 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1750,8 +1750,10 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 	/* Reset the Device */
 	cs42l42->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
 		"reset", GPIOD_OUT_LOW);
-	if (IS_ERR(cs42l42->reset_gpio))
-		return PTR_ERR(cs42l42->reset_gpio);
+	if (IS_ERR(cs42l42->reset_gpio)) {
+		ret = PTR_ERR(cs42l42->reset_gpio);
+		goto err_disable;
+	}
 
 	if (cs42l42->reset_gpio) {
 		dev_dbg(&i2c_client->dev, "Found reset GPIO\n");
@@ -1785,13 +1787,13 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 		dev_err(&i2c_client->dev,
 			"CS42L42 Device ID (%X). Expected %X\n",
 			devid, CS42L42_CHIP_ID);
-		return ret;
+		goto err_disable;
 	}
 
 	ret = regmap_read(cs42l42->regmap, CS42L42_REVID, &reg);
 	if (ret < 0) {
 		dev_err(&i2c_client->dev, "Get Revision ID failed\n");
-		return ret;
+		goto err_disable;
 	}
 
 	dev_info(&i2c_client->dev,
@@ -1817,7 +1819,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 	if (i2c_client->dev.of_node) {
 		ret = cs42l42_handle_device_data(i2c_client, cs42l42);
 		if (ret != 0)
-			return ret;
+			goto err_disable;
 	}
 
 	/* Setup headset detection */
-- 
2.30.1


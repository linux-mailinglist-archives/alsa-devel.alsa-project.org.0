Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0ED37A45F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 12:12:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92D5B1797;
	Tue, 11 May 2021 12:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92D5B1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620727970;
	bh=sDrJZDTLFAGHOxfWCH6iOvVSMX9IXZ2lImjLJIqTB08=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BIniFI++KSKEDnQKVFKSs5tnLYy2ZPzeomG2deDw/CrFUEYsp6KlMhMuhE0GQULYj
	 OGsv/SC/QkRw+9q4zKccvwQhw4vtFzv0MTFDd6D07rpKv1kFjFMh0ecN8dXdQSDr4g
	 8xXCGuSPXWPcgVFleonqZ8CEyU3vUwYa8O7hn1yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2176FF80245;
	Tue, 11 May 2021 12:11:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC04BF8016B; Tue, 11 May 2021 12:11:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3216FF80163
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 12:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3216FF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gamET6BB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BA6mgA024838; Tue, 11 May 2021 05:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=D46d4ZxaniF8UuiqOhiq71lUzxgKLmF9th1bwNsDOQw=;
 b=gamET6BB/pha6kkQUJBUHItqO8AHtVylq1wT1kowJXHrg7EcRJWFpp4yE5YLmEd2Qce4
 DYn1rdoNr/CD3ja9Ry5ObzKhCePahbktQ+cPiUc5/qblDAEas0XsXNa4mXuZwKkg32fG
 gsjCde6ekfyTe6BZgGxFhCC2avihMtt1VljR8ZnBOqlHuzPlz4O5guxN3IqwhELgvRyJ
 QqxhO/QNZ3DXcaIFlUpz1Hj/MOazEkn3AKJmcQSxRPXNnX9YN6ZDI7AjBjQ8XsZi+en8
 8TnOgCHofVLEWe4As7e+IVO3m2lyFs//BK99dI5T5LKHJu0xCSVO2VqTjFLON6/BwZbO Bw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4sbe6-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 05:10:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 11:10:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 11:10:51 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7F43511D1;
 Tue, 11 May 2021 10:10:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: cs4265: Minor tidy up of error paths
Date: Tue, 11 May 2021 11:10:50 +0100
Message-ID: <20210511101051.17726-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210511101051.17726-1-ckeepax@opensource.cirrus.com>
References: <20210511101051.17726-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: gXBMLx4GTNUMvXGSvdz9YSUoFdFBPgAx
X-Proofpoint-ORIG-GUID: gXBMLx4GTNUMvXGSvdz9YSUoFdFBPgAx
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

Fixup a needlessly initialised variable and an unchecked return value.

Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs4265.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index d76be44f46b40..cffd6111afaca 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -573,7 +573,7 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 			     const struct i2c_device_id *id)
 {
 	struct cs4265_private *cs4265;
-	int ret = 0;
+	int ret;
 	unsigned int devid = 0;
 	unsigned int reg;
 
@@ -602,6 +602,11 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 	i2c_set_clientdata(i2c_client, cs4265);
 
 	ret = regmap_read(cs4265->regmap, CS4265_CHIP_ID, &reg);
+	if (ret) {
+		dev_err(&i2c_client->dev, "Failed to read chip ID: %d\n", ret);
+		return ret;
+	}
+
 	devid = reg & CS4265_CHIP_ID_MASK;
 	if (devid != CS4265_CHIP_ID_VAL) {
 		ret = -ENODEV;
@@ -616,10 +621,9 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 
 	regmap_write(cs4265->regmap, CS4265_PWRCTL, 0x0F);
 
-	ret = devm_snd_soc_register_component(&i2c_client->dev,
+	return devm_snd_soc_register_component(&i2c_client->dev,
 			&soc_component_cs4265, cs4265_dai,
 			ARRAY_SIZE(cs4265_dai));
-	return ret;
 }
 
 static const struct of_device_id cs4265_of_match[] = {
-- 
2.11.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0537AD87
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 20:00:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E116018AD;
	Tue, 11 May 2021 19:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E116018AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620756043;
	bh=hlJ5PiHWfmQkSjGNsTOjPaEoWWYj2P7a+7hc5E9dhOw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9JxQ9B7ju39+N8PhLQrQxBBkpE+OLqKyVIa0Z/WQSPMk5BPcRn2ITbXaw/nUgAoR
	 T6Lx4cEXDVYrK+MLJvKPgOh7f82qDBkobXqMUZf4qgsWm42OjOitRSylQ0iKWURg7w
	 d7ptS16LQBmi/3xLePJ4ibJ57g+hxLMfw9VGIkpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E84F804AF;
	Tue, 11 May 2021 19:57:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0820EF80475; Tue, 11 May 2021 19:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CD8AF8013A
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 19:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CD8AF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dnUzhzLc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BHvKv3028332; Tue, 11 May 2021 12:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=VUgP11qyqxEo4+q4DELogDEUKERUvulZRLUXW7iacII=;
 b=dnUzhzLc/jM2mb6qetuKaRAlQ9PNLGv9Fri2gjl4PzNNFPoQvkTmK4pglx/c1eBxucRj
 rTa0/Fio6UHuxreP/ubkQG0L2RGULzEdySVVcGn5OleeaxJSqpkAyCGXm5MKjsIZn0+q
 y0xVESEY2PZQxLPaJqtwRZHPBh4rVg8iOMtFjuujPz/Att+mLDpeH9jKhXG4ukUa87ti
 GzChwb3L6jTnGrpx/18AWNpByXFJ7MWW8RYwaB7SxrnS1+l3q/fmoY9PT9SecihaFwBu
 Hcqal7OqQLe9mq9ksII/UFeEv+KzcBB8dBaVK5sYL+9nUAMJhSjPdlhnqLBOd+X7qUDr DQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38f2d4sy5v-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 11 May 2021 12:57:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 18:57:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 18:57:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0AE6B11CD;
 Tue, 11 May 2021 17:57:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: cs42l52: Minor tidy up of error paths
Date: Tue, 11 May 2021 18:57:18 +0100
Message-ID: <20210511175718.15416-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210511175718.15416-1-ckeepax@opensource.cirrus.com>
References: <20210511175718.15416-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: -SYyJygOds_QKdLBAGDhnR4eOhYoogP2
X-Proofpoint-ORIG-GUID: -SYyJygOds_QKdLBAGDhnR4eOhYoogP2
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110121
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
 sound/soc/codecs/cs42l56.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index c44a5cdb796ec..7cdffdf6b8cf0 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1175,7 +1175,7 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client,
 	struct cs42l56_platform_data *pdata =
 		dev_get_platdata(&i2c_client->dev);
 	int ret, i;
-	unsigned int devid = 0;
+	unsigned int devid;
 	unsigned int alpha_rev, metal_rev;
 	unsigned int reg;
 
@@ -1245,6 +1245,11 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client,
 	}
 
 	ret = regmap_read(cs42l56->regmap, CS42L56_CHIP_ID_1, &reg);
+	if (ret) {
+		dev_err(&i2c_client->dev, "Failed to read chip ID: %d\n", ret);
+		return ret;
+	}
+
 	devid = reg & CS42L56_CHIP_ID_MASK;
 	if (devid != CS42L56_DEVID) {
 		dev_err(&i2c_client->dev,
-- 
2.11.0


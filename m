Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B1542F3C1
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 15:38:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 771B016AF;
	Fri, 15 Oct 2021 15:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 771B016AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634305097;
	bh=qUq1HxqYC8jKLbw+A0S4MLiVaaMDEOpqYAt9jzDenHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lv+uUGOfh4nIzGRQbBLDNuMYt20EUabaBlzf7+3410OMgu1irAJM5mwOPAf0fJ0H/
	 zjoEOYOMaUNofFGpMfxw+4PSKWRabRlCf7WPMi9Lu7kP+11Ak/rvSSwE7IU3qrlcfp
	 kXwNUsZBxpxJUnBGFmO6FOonfGO72Fheb5s+3HGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D2CF80167;
	Fri, 15 Oct 2021 15:36:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38A91F80507; Fri, 15 Oct 2021 15:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F423F80290
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 15:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F423F80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="V26f+WAO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FCfErN009690; 
 Fri, 15 Oct 2021 08:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=NZ1y1vHKxSWxoIA9oRp13eOqEB4AqI7vO8Ocv/KaWwA=;
 b=V26f+WAOa3edVyxI449Ngabv6wnXk0GH81TuXwuXtfwp/qhBPEePgOOyNunYFFNs8djm
 vwUnn/dvTAmQpiu4/3kHdPQs85uaQPEGMHw4NAbOpl+DXh9MS1yK0SCQKJ3wRSdf/ycU
 /PUDQFzRIIdmmngTEG5PZyepELk81XGXZvvLRNgoxCXeJ8K63UTXDgbXKZZ7izawee6e
 HOfRsHx/cyl51/Y5W+++kk9nGjU/9MUef498JH2eINliwEiCS8IxmKGn3TGlK6DgZ8p4
 SqW0UyjCWFt8ijAkiuNhWwlwF4GEpH6kbAZyNMyX4ODyLvbqfgncO8QPZHhibdjRvEj/ mA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bq1gagp5w-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Oct 2021 08:36:26 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 15 Oct
 2021 14:36:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Fri, 15 Oct 2021 14:36:23 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.254])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6B07411DA;
 Fri, 15 Oct 2021 13:36:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 06/16] ASoC: cs42l42: Reset GPIO is mandatory
Date: Fri, 15 Oct 2021 14:36:09 +0100
Message-ID: <20211015133619.4698-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211015133619.4698-1-rf@opensource.cirrus.com>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: S-9aqI3ecKkvULeCgr7cqZhNpKSv2h-3
X-Proofpoint-GUID: S-9aqI3ecKkvULeCgr7cqZhNpKSv2h-3
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The hard RESET must be used to correctly power-up the cs42l42, as
described in the datasheet.

The code was getting the GPIO with devm_gpiod_get_optional(). Change
this to devm_gpiod_get().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 0ecf2129ea45..629a0783e693 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2034,17 +2034,14 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client,
 	}
 
 	/* Reset the Device */
-	cs42l42->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-		"reset", GPIOD_OUT_LOW);
+	cs42l42->reset_gpio = devm_gpiod_get(&i2c_client->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(cs42l42->reset_gpio)) {
 		ret = PTR_ERR(cs42l42->reset_gpio);
+		dev_err(&i2c_client->dev, "Failed to request reset gpio: %d\n", ret);
 		goto err_disable;
 	}
 
-	if (cs42l42->reset_gpio) {
-		dev_dbg(&i2c_client->dev, "Found reset GPIO\n");
-		gpiod_set_value_cansleep(cs42l42->reset_gpio, 1);
-	}
+	gpiod_set_value_cansleep(cs42l42->reset_gpio, 1);
 	usleep_range(CS42L42_BOOT_TIME_US, CS42L42_BOOT_TIME_US * 2);
 
 	/* Request IRQ */
-- 
2.11.0


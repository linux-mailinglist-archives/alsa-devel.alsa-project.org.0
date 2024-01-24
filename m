Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01183AD5D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:31:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08B1B828;
	Wed, 24 Jan 2024 16:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08B1B828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706110286;
	bh=t5tlNEvlXgAxKg4SMJL4JOiD4JdYo0qP/3NyA5o+14E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=am+dLralwFNDHlYi3lLBOIPklDELGLfZ3fEBhoPPgJPx09BiXG105dCg/O/kWMLmb
	 c5ZGK56i0h7mL6v7LPweONTIKz7t3xLuer0nPmzy6fBdPpPow+/OqgQ1AysQ/gO62+
	 YYLu/uyCUACiBTFqt6cqmtoa0WbtvzbfxP4YHEVk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5608BF805C9; Wed, 24 Jan 2024 16:30:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52794F805BF;
	Wed, 24 Jan 2024 16:30:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BC77F80494; Wed, 24 Jan 2024 16:30:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAC0FF8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC0FF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=EE/CxP9H
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O8MvMm030107;
	Wed, 24 Jan 2024 09:30:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=T04BEboBcsX0FcHCR9rWpO+dAdCpJVUhGdtiAcCuucc=; b=
	EE/CxP9Hh7gakcwOtkYUpMdpf+PgtEoZJuAYEiI6YdJouXb7xn96CnC9gaSEk4OA
	1/xTylo8tW1MaTmG0iXlNYmt3Hp7Z2FrGPWYXlHaZvh945/kaVYW5OoJFLy71ga5
	Wxbauun9nADMllMhi3Ui6ZH6kNfw5K2mzc1xgkkN+0mKMTAdbGMX6OAcUzam700X
	2nWZXBEXcsB/Calv9vTEG9Zviy8W38YjP9udqzotIMy3Ex/vEI9gE1OiO/J8N2sY
	IzJJY8y7isJaQZ2Tui4ug6gsYJMPUbJ1NtFh4GyAIb279jds0zFxu6vknwo4NsUG
	fLAwpFGbAS78lguYJEBsfw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9ryqc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:30:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:30:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:30:16 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BE07282024A;
	Wed, 24 Jan 2024 15:30:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <lee@kernel.org>, <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: [PATCH v2 5/6] mfd: cs42l43: Add some missing dev_err_probes
Date: Wed, 24 Jan 2024 15:30:15 +0000
Message-ID: <20240124153016.1541616-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
References: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OeqhVnh9doqIPa-YSbmx56hpop6DrezP
X-Proofpoint-ORIG-GUID: OeqhVnh9doqIPa-YSbmx56hpop6DrezP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: K73UDBVM4QDO2OLPYBS5XYSBVLKF5SN3
X-Message-ID-Hash: K73UDBVM4QDO2OLPYBS5XYSBVLKF5SN3
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K73UDBVM4QDO2OLPYBS5XYSBVLKF5SN3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use of dev_err_probe was missed in the i2c and sdw parts of the code,
update the missing parts.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 drivers/mfd/cs42l43-i2c.c | 9 +++------
 drivers/mfd/cs42l43-sdw.c | 9 +++------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index 7162274a0b551..c9e4ea76149a8 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -38,7 +38,6 @@ static const struct regmap_config cs42l43_i2c_regmap = {
 static int cs42l43_i2c_probe(struct i2c_client *i2c)
 {
 	struct cs42l43 *cs42l43;
-	int ret;
 
 	cs42l43 = devm_kzalloc(&i2c->dev, sizeof(*cs42l43), GFP_KERNEL);
 	if (!cs42l43)
@@ -50,11 +49,9 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 	cs42l43->attached = true;
 
 	cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
-	if (IS_ERR(cs42l43->regmap)) {
-		ret = PTR_ERR(cs42l43->regmap);
-		dev_err(cs42l43->dev, "Failed to allocate regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(cs42l43->regmap))
+		return dev_err_probe(cs42l43->dev, PTR_ERR(cs42l43->regmap),
+				     "Failed to allocate regmap\n");
 
 	return cs42l43_dev_probe(cs42l43);
 }
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index d6962a5a35f65..65f7b1d782486 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -171,7 +171,6 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 {
 	struct cs42l43 *cs42l43;
 	struct device *dev = &sdw->dev;
-	int ret;
 
 	cs42l43 = devm_kzalloc(dev, sizeof(*cs42l43), GFP_KERNEL);
 	if (!cs42l43)
@@ -181,11 +180,9 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 	cs42l43->sdw = sdw;
 
 	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
-	if (IS_ERR(cs42l43->regmap)) {
-		ret = PTR_ERR(cs42l43->regmap);
-		dev_err(cs42l43->dev, "Failed to allocate regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(cs42l43->regmap))
+		return dev_err_probe(cs42l43->dev, PTR_ERR(cs42l43->regmap),
+				     "Failed to allocate regmap\n");
 
 	return cs42l43_dev_probe(cs42l43);
 }
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E483ACEF
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:14:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44437DFA;
	Wed, 24 Jan 2024 16:14:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44437DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706109277;
	bh=ATN4BkgH0lZOB8gE/0EB0dUVYI+ZIu03Xpg1E9oDN64=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m6uGMYeunOk8/WsgVBAqpjDNJ7nZRJUdIgF+nRtBvrPeU0Lb02m0DWM+Cf0jDQrV7
	 1iy6maU3iX4mnSJ2sIdTf0cCUybqWmIRwAx1rB4lR9+VnilOcXou40W2luPl6hIt5l
	 VuiGXhbnY78h3/HKbWwYnjwqbU1RrJF2/ZXggp4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5762FF8065A; Wed, 24 Jan 2024 16:13:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C05F8022B;
	Wed, 24 Jan 2024 16:12:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1938CF80589; Wed, 24 Jan 2024 16:12:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D266F802BE
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D266F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=orjibm9X
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O7L4cx000450;
	Wed, 24 Jan 2024 09:12:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=AwR6C1+x9dj3mRA8FTLGca+Bnav8YT0q1yASPkfi4B4=; b=
	orjibm9X5zCK/LUY41SQhw4sg1ora4sqoreJnMqIfld/Fspf7+jqKYAAC9mTMzWi
	C3xSmnCQspJ8JR1g8nATJ+323ouaqueiXGTt+IPpDT6bBao1UoLgJEB+wocyWUt1
	p3/mU0u/B6w6jQzK2kYAD2bRkLRYnJiuQ9ZTcqC9WuPi6cBAQ3tL1yfOikP/dQYf
	3mHng2P963xgcXSJtrKgk93vlOMS/TecmgK+j9uB6Iiw6DG4idmufB7bJ99kdJlZ
	Az2hN6osI6nIbrBbjSJGaw36ZTHL2HijPylJ9oMMrW2QqD9i7KGiaKib5BcMRju7
	7Nri7YuJrRJ1EUzfwaWQEw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhgxx7-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:12:27 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:12:22 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:12:22 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 47882820249;
	Wed, 24 Jan 2024 15:12:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <lee@kernel.org>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 4/6] mfd: cs42l43: Add some missing dev_err_probes
Date: Wed, 24 Jan 2024 15:12:20 +0000
Message-ID: <20240124151222.1448570-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
References: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: N7EMzrEFe-zMAcG550JDnS65412RnVn2
X-Proofpoint-GUID: N7EMzrEFe-zMAcG550JDnS65412RnVn2
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FUKKHGGVIDNHLSQ57GPEKOAQ4SSXAQMS
X-Message-ID-Hash: FUKKHGGVIDNHLSQ57GPEKOAQ4SSXAQMS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUKKHGGVIDNHLSQ57GPEKOAQ4SSXAQMS/>
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


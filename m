Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 221F477F53B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 13:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D445286E;
	Thu, 17 Aug 2023 13:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D445286E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692271744;
	bh=U3Brb+GoO+zoOuqQCJ9gYqATB4nSIKAEzTA3lYioYwA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZeYGiQT+e5UhIfxQrQW9T7WGgc/ZBAAV3V81cSb0OQ19PvYzL8lAkr+OCSJwGEeM9
	 DeqrD5Ob+4S7rB9edQjtgWeZn6oXkZ3J79gs8Sd/+r8a8xEBfUEOw4RgFy/TryTKMe
	 lzwPfhJuut7B5YSxBtl284OaIHwra112ej7fhJDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45BFAF8055C; Thu, 17 Aug 2023 13:27:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB50F8055C;
	Thu, 17 Aug 2023 13:27:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67464F80551; Thu, 17 Aug 2023 13:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9B4DF8016A
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 13:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9B4DF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=pqn0Gz21
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37HBMpDm018403;
	Thu, 17 Aug 2023 06:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=cJhm+19aqjGyHFplA6rx/pJkqmR6MgcxkXDRw5sXF6s=; b=
	pqn0Gz21TSI4bhAxzanvx9RQO+GsfPoAj0GhXy+wMWx2+65oL1mhrx0m1wepdVJQ
	zawTCzsdIQHdfllxEM1jQZcobUdM+BB0eDDkkrXkcU+/WwzB3MCCOVsyQfyOqAd3
	hnKAP0IZ5MgRv6PchfJYIqSfLdEQ1ss4XLa1PcIEMoejjZJusbpe9UOSWiNnbCtT
	eTez8S6kKrr9io8svLpwBUtgeUUsDP5sI6cuUm6iIINJOxE94IKlyyPcmYM0gzvQ
	tUb48WFyuyMkE1OAwr2SuuXSz/uhJieggYUbRv2kXUF2j/gfbk/x9QnGLacmOptI
	3a+PD9P/G01c9ptidRJTUw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3se6uhn8td-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 06:27:17 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 17 Aug
 2023 12:27:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 17 Aug 2023 12:27:15 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.68])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9CAB13575;
	Thu, 17 Aug 2023 11:27:15 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v2 2/2] ASoC: cs35l56: Add an ACPI match table
Date: Thu, 17 Aug 2023 12:27:12 +0100
Message-ID: <20230817112712.16637-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230817112712.16637-1-rf@opensource.cirrus.com>
References: <20230817112712.16637-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _I51-rMG48qDk6ZUrRr_szd0HuuMmdmb
X-Proofpoint-ORIG-GUID: _I51-rMG48qDk6ZUrRr_szd0HuuMmdmb
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HDQNQJDV6UWD5SFKJHIMEEEXG2JWULKA
X-Message-ID-Hash: HDQNQJDV6UWD5SFKJHIMEEEXG2JWULKA
X-MailFrom: prvs=3593b560b6=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDQNQJDV6UWD5SFKJHIMEEEXG2JWULKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

An ACPI ID has been allocated for CS35L56 ASoC devices so that they can
be instantiated from ACPI Device entries.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-i2c.c | 9 +++++++++
 sound/soc/codecs/cs35l56-spi.c | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index ed2a41943d97..40666e6698ba 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -62,10 +62,19 @@ static const struct i2c_device_id cs35l56_id_i2c[] = {
 };
 MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
+	{ "CSC355C", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
+#endif
+
 static struct i2c_driver cs35l56_i2c_driver = {
 	.driver = {
 		.name		= "cs35l56",
 		.pm = &cs35l56_pm_ops_i2c_spi,
+		.acpi_match_table = ACPI_PTR(cs35l56_asoc_acpi_match),
 	},
 	.id_table	= cs35l56_id_i2c,
 	.probe		= cs35l56_i2c_probe,
diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index 996aab10500e..302f9c47407a 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -59,10 +59,19 @@ static const struct spi_device_id cs35l56_id_spi[] = {
 };
 MODULE_DEVICE_TABLE(spi, cs35l56_id_spi);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
+	{ "CSC355C", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
+#endif
+
 static struct spi_driver cs35l56_spi_driver = {
 	.driver = {
 		.name		= "cs35l56",
 		.pm = &cs35l56_pm_ops_i2c_spi,
+		.acpi_match_table = ACPI_PTR(cs35l56_asoc_acpi_match),
 	},
 	.id_table	= cs35l56_id_spi,
 	.probe		= cs35l56_spi_probe,
-- 
2.30.2


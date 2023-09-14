Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A427A08B7
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 17:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 405D5E74;
	Thu, 14 Sep 2023 17:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 405D5E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694704292;
	bh=2BK0DwRAQoMrGUuE8cNk9buwMbEPyQkyWK1zggA5zJA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E20VTbtD2xqtIKN+R4PjgMoIlMiEZldK6Q9X3qcKaS7jXQEUMhO5bsxGphIPd49FH
	 AiKvFP0+bXRS0o4eLcoAMHdH34nWXd0jS2sBuVrBWfhgdGFKNZ75vQqwWThRNsc9b3
	 c9pHg0oJcWZR+SJk2E56QsWp2f1sA91kqOATg0EA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE80F8059F; Thu, 14 Sep 2023 17:09:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FADBF80580;
	Thu, 14 Sep 2023 17:09:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E275CF80246; Thu, 14 Sep 2023 17:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78A65F801F5
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 17:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A65F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=U2f2ycsZ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38ECunMI020490;
	Thu, 14 Sep 2023 10:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=WnCXK5CMo5WZNTakNp4qQKNK/w1RnuyYjuqgdkPghm0=; b=
	U2f2ycsZ9fKtWRz6kJpF1ySf9E3wBL2ZckyKtV50jVA4UAHgkpu/R4cAU5onjmL+
	F2KPoIeFD+rBCcblRNi+JHTCKuMc36lSiIwqwQiDOmbC7HvEC4aIqq0fnJV+TC9g
	r2GznfuN2X6BwzoK28toeTyTB7URldrvraGtqE7BFixX+yy0PxW3FTM4BLpf7oUp
	kamDiIuu6t9qH0uUmUCJ/OYg58J6J+2UcyPQ5pf7oYb9XILj57KrlryFtj51ek/H
	W5Dtrod8cfIR1GlHgpNGahlkXTHMJsq1A639DJJ7vqDtLrW/WEsnXvIcyTGMcU0O
	n01RNOnXr6dGGYFh+gvcQA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7sj90x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 10:09:22 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 14 Sep
 2023 16:09:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 14 Sep 2023 16:09:20 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.215])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4394F357D;
	Thu, 14 Sep 2023 15:09:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 1/3] ASoC: cs35l56: Use pm_ptr()
Date: Thu, 14 Sep 2023 16:09:16 +0100
Message-ID: <20230914150918.14505-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230914150918.14505-1-rf@opensource.cirrus.com>
References: <20230914150918.14505-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 967lDEXpuWNAHDyFXlSxrmMmlDwY7r5W
X-Proofpoint-ORIG-GUID: 967lDEXpuWNAHDyFXlSxrmMmlDwY7r5W
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QVAOCQDIIMUH6JKESQ2642R6CPQMRPMN
X-Message-ID-Hash: QVAOCQDIIMUH6JKESQ2642R6CPQMRPMN
X-MailFrom: prvs=46218c6399=rf@opensource.cirrus.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use pm_ptr() when setting the pointer to the dev_pm_ops so that it
will be NULL if CONFIG_PM is disabled. This allows the dev_pm_ops to be
compiled out in that case.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-i2c.c | 2 +-
 sound/soc/codecs/cs35l56-sdw.c | 2 +-
 sound/soc/codecs/cs35l56-spi.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index d10e0e2380e8..9e5670b09af6 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -72,7 +72,7 @@ MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
 static struct i2c_driver cs35l56_i2c_driver = {
 	.driver = {
 		.name		= "cs35l56",
-		.pm = &cs35l56_pm_ops_i2c_spi,
+		.pm = pm_ptr(&cs35l56_pm_ops_i2c_spi),
 		.acpi_match_table = ACPI_PTR(cs35l56_asoc_acpi_match),
 	},
 	.id_table	= cs35l56_id_i2c,
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index b433266b7844..ab960a1c171e 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -550,7 +550,7 @@ MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);
 static struct sdw_driver cs35l56_sdw_driver = {
 	.driver = {
 		.name = "cs35l56",
-		.pm = &cs35l56_sdw_pm,
+		.pm = pm_ptr(&cs35l56_sdw_pm),
 	},
 	.probe = cs35l56_sdw_probe,
 	.remove = cs35l56_sdw_remove,
diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index 9962703915e1..768ffe8213dc 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -70,7 +70,7 @@ MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
 static struct spi_driver cs35l56_spi_driver = {
 	.driver = {
 		.name		= "cs35l56",
-		.pm = &cs35l56_pm_ops_i2c_spi,
+		.pm = pm_ptr(&cs35l56_pm_ops_i2c_spi),
 		.acpi_match_table = ACPI_PTR(cs35l56_asoc_acpi_match),
 	},
 	.id_table	= cs35l56_id_spi,
-- 
2.30.2


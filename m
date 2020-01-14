Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 255F313AF6F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:32:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1E31888;
	Tue, 14 Jan 2020 17:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1E31888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579019522;
	bh=KMmrgLFp75ZQGxK4PV7I+XoChDFgzOEnC792bae0Dzc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6wrBHTvygKzepu7jEye3OnMfmB+DGT6DIKwjUo22b3W6g8rXbo7pxQ+CV936cY3K
	 RiziZpPgkAda0WDff6tnyaC2RRPB7zwfJTRMoiAqt70OOAvSyHaOyfldh4LNAJlUco
	 VmcxwSkDydkGYvV8a9nLnxY8qSG4YebyE4X8d0qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2648EF8029B;
	Tue, 14 Jan 2020 17:19:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6989F8022B; Tue, 14 Jan 2020 17:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B04B9F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B04B9F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TPzPQi3a"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EG83Op018646; Tue, 14 Jan 2020 10:18:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=/0EyhYUwrK1tyrWh5I0cDhLjW+CWpmR1o+Hel6XcHkw=;
 b=TPzPQi3aWBdYw/c+Cl9XpwjzTHRscNPDgVC7+pwkdpNWGe+JHQCAUXAb8VVzvUNkiw+l
 rnLrZKS+VV+k/o+OFo3u7p5b6wSmIkRBazzSuMK4+De5+qiZ3pQgH/2QZsoKqUJjImwL
 PXYMetIeJ8tK2ISbsSNdpCpqn5xTk6N7e6PEUznyiquXuhBfL99csXyqpWRLk0+UuBag
 ofRfpyCuktptx8Veaz9W81Z+4pUFEwf+72zVh8j+HXxVpeMgouM52Qcav2DOec5ny50O
 ZswchiJpJz+jEFVG+GA5m4X74Ve0+mJ9WcdDMUWdkPjmSHg0Q6OGRfLmilCu8HXd+hP8 bg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0a-001ae601.pphosted.com with ESMTP id 2xfcn7vrvp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Jan 2020 10:18:44 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 14 Jan
 2020 16:18:41 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 14 Jan 2020 16:18:41 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A9BB32DC;
 Tue, 14 Jan 2020 16:18:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Tue, 14 Jan 2020 16:18:39 +0000
Message-ID: <20200114161841.451-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200114161841.451-1-ckeepax@opensource.cirrus.com>
References: <20200114161841.451-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 mlxlogscore=762 priorityscore=1501 mlxscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001140137
Cc: li.xu@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, david.rhodes@cirrus.com
Subject: [alsa-devel] [PATCH 2/4] ASoC: madera: Correct DMIC only input hook
	ups
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Both the data and clock should be connected to both the left and right
inputs for DMIC only inputs, add the missing routes.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs47l85.c | 6 ++++++
 sound/soc/codecs/cs47l90.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index f85581a97bdc3..05445abcb470b 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2008,12 +2008,18 @@ static const struct snd_soc_dapm_route cs47l85_dapm_routes[] = {
 	{ "IN3R", NULL, "IN3R Mode" },
 
 	{ "IN4L", NULL, "DMICCLK4" },
+	{ "IN4L", NULL, "DMICDAT4" },
+	{ "IN4R", NULL, "DMICCLK4" },
 	{ "IN4R", NULL, "DMICDAT4" },
 
 	{ "IN5L", NULL, "DMICCLK5" },
+	{ "IN5L", NULL, "DMICDAT5" },
+	{ "IN5R", NULL, "DMICCLK5" },
 	{ "IN5R", NULL, "DMICDAT5" },
 
 	{ "IN6L", NULL, "DMICCLK6" },
+	{ "IN6L", NULL, "DMICDAT6" },
+	{ "IN6R", NULL, "DMICCLK6" },
 	{ "IN6R", NULL, "DMICDAT6" },
 
 	MADERA_MIXER_ROUTES("OUT1L", "HPOUT1L"),
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index c3b6f4d41005b..35ff5a923e282 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -1941,9 +1941,13 @@ static const struct snd_soc_dapm_route cs47l90_dapm_routes[] = {
 	{ "IN3R", NULL, "DMICDAT3" },
 
 	{ "IN4L", NULL, "DMICCLK4" },
+	{ "IN4L", NULL, "DMICDAT4" },
+	{ "IN4R", NULL, "DMICCLK4" },
 	{ "IN4R", NULL, "DMICDAT4" },
 
 	{ "IN5L", NULL, "DMICCLK5" },
+	{ "IN5L", NULL, "DMICDAT5" },
+	{ "IN5R", NULL, "DMICCLK5" },
 	{ "IN5R", NULL, "DMICDAT5" },
 
 	MADERA_MIXER_ROUTES("OUT1L", "HPOUT1L"),
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

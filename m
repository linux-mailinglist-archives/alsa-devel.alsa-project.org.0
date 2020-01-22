Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7521452CE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 11:43:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635741685;
	Wed, 22 Jan 2020 11:42:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635741685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579689818;
	bh=/XJGupLt8NoQsGySnww15dsS0SYF1zakuPiq7ZRwKGU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gqUGfIwPDCLRCNtzn6ULCb6cTE5RQlYSOGIH+jgZaahZt42zj4zSl3SqFMn5xZ/fL
	 T0GpIbdkUblDudrXYXwZpU8pHmqpkBtlDBsganyjj611iVl0kGQo2PSmgE31wY8Ag3
	 fzt/ARSHZ7Zz1Q9mVyJNy4ADXzWAwqWwYkbEom/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24B75F80217;
	Wed, 22 Jan 2020 11:41:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FDC6F8020C; Wed, 22 Jan 2020 11:41:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 752C1F8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 11:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 752C1F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qwNlWZdV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MAdYk8001300; Wed, 22 Jan 2020 04:41:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=HHfVt/3gw9Cfui0AJ5n7a1cTlXahnB9ZCuVjthOZJLc=;
 b=qwNlWZdVvigJz2qHGxR6nKIHsRPB5AJdkeUl+QREPkqCDJrpc/GRtXoY2yIwK7AM8cHa
 sf59wxsWA/0VrzHnIC8xC77p/beiTEVtYfYoIpfpUL70nHIjv3ivjvqW15WVgwjZA99k
 5uaiHSwFwyzKIiaMjpVLA4daK7Jcp9W84W8JmBy6T0vSAaiwHQfA4G4QIazeYPBTu4tF
 qDmG+FHIVsj+iekUhIgdLRPKdw6TeSyxBmDUeQBIurlcheFIq5rSlHAet9onIC3M+s7S
 avWZRSkWr/Ar67IxyWGxFfwMSlIg2n6LIGUmnbGpMZ/0HHUVD0Mq9eXN9omDub9Y0ps1 8A== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0a-001ae601.pphosted.com with ESMTP id 2xm0a8wc05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Jan 2020 04:41:45 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 22 Jan
 2020 10:41:44 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 22 Jan 2020 10:41:44 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D65BE2AB;
 Wed, 22 Jan 2020 10:41:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Wed, 22 Jan 2020 10:41:43 +0000
Message-ID: <20200122104143.16725-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=1
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=829
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001220097
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH v2] ASoC: madera: Correct DMIC only input hook
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

Changes since v1:
 - Add routes for DMIC3 on cs47l90 which was missed in v1

Thanks,
Charles

 sound/soc/codecs/cs47l85.c | 6 ++++++
 sound/soc/codecs/cs47l90.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index dac96bf0a2831..bef3471f482d4 100644
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
index d0e191be2c142..266eade827648 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -1938,12 +1938,18 @@ static const struct snd_soc_dapm_route cs47l90_dapm_routes[] = {
 	{ "IN2R", NULL, "IN2R Mode" },
 
 	{ "IN3L", NULL, "DMICCLK3" },
+	{ "IN3L", NULL, "DMICDAT3" },
+	{ "IN3R", NULL, "DMICCLK3" },
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

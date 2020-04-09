Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E2A1A39B2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 20:15:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20F4C16A4;
	Thu,  9 Apr 2020 20:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20F4C16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586456145;
	bh=UkNEFKWnn9l1FRBar1NYUbHRTXJdX2PaPI0MT7aePT4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SVo78yrHmfiq0UZVTpzU61TTIDhdGE9IDmWk9kyYtWO4k/wHQ3HRrETlOJW8r7DiF
	 3PIwlvP6+rp7GIbaXeDDSiCw5vzUM9hOCxn+1P5YKLCWZiOJ7kjj85lU6xNVghQvQ4
	 NLJ9paD5nsOqboLRDuluy0SCqb4B6eBvONPTqk1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD67AF8029B;
	Thu,  9 Apr 2020 20:13:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A33F8029B; Thu,  9 Apr 2020 20:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F10EF801D8
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F10EF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BIM7HSfq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039I8fvb023538; Thu, 9 Apr 2020 13:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=CyBPf/5pxEI0S5sYR1eZmn1Ws0Pp5pzjJSOL3EYR7yc=;
 b=BIM7HSfqV+SiUoyyw7ZHrtI9F5i3eR3QvbXfH1i/Lb7KTvqGqNYeFVr/DZlACdCyC1Ko
 WQjpmiGeKn+py6Qd82nRlotXYBLtjin9ykb6Z7bsOu8cZBVWHDpZiH4kADYV1ZMTyqf0
 GMP8hk1iVd1OXPRBh2qa8vIN7EYjnlft86o0RZl7Eb9KvQ+bzpiSIh3R+/GL/EbaDW3c
 w+I9yaDwiYd6XIDx3RmJ4DBcvZaxXRiAYxTunBF4Uu6WiAGYMsVfCF0A7tCsrKrRcX86
 DXBREuag4tUFzwc5jOSTFI7xsVTgBtRvUvru/pGBE4mbtNYyRdcQzRtT72t5p7cviABP 9Q== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3091q3413j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 09 Apr 2020 13:13:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 9 Apr
 2020 19:13:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 9 Apr 2020 19:13:11 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AEE662AB;
 Thu,  9 Apr 2020 18:13:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: madera: Remove a couple of stray blank lines
Date: Thu, 9 Apr 2020 19:13:11 +0100
Message-ID: <20200409181311.30247-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=1
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=860 spamscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004090131
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/madera.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 40de9d7811d1f..a448d2a2918a9 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -1903,7 +1903,6 @@ const struct soc_enum madera_isrc_fsh[] = {
 			      MADERA_ISRC4_FSH_SHIFT, 0xf,
 			      MADERA_RATE_ENUM_SIZE,
 			      madera_rate_text, madera_rate_val),
-
 };
 EXPORT_SYMBOL_GPL(madera_isrc_fsh);
 
@@ -1924,7 +1923,6 @@ const struct soc_enum madera_isrc_fsl[] = {
 			      MADERA_ISRC4_FSL_SHIFT, 0xf,
 			      MADERA_RATE_ENUM_SIZE,
 			      madera_rate_text, madera_rate_val),
-
 };
 EXPORT_SYMBOL_GPL(madera_isrc_fsl);
 
@@ -1938,7 +1936,6 @@ const struct soc_enum madera_asrc1_rate[] = {
 			      MADERA_ASYNC_RATE_ENUM_SIZE,
 			      madera_rate_text + MADERA_SYNC_RATE_ENUM_SIZE,
 			      madera_rate_val + MADERA_SYNC_RATE_ENUM_SIZE),
-
 };
 EXPORT_SYMBOL_GPL(madera_asrc1_rate);
 
@@ -1964,7 +1961,6 @@ const struct soc_enum madera_asrc2_rate[] = {
 			      MADERA_ASYNC_RATE_ENUM_SIZE,
 			      madera_rate_text + MADERA_SYNC_RATE_ENUM_SIZE,
 			      madera_rate_val + MADERA_SYNC_RATE_ENUM_SIZE),
-
 };
 EXPORT_SYMBOL_GPL(madera_asrc2_rate);
 
-- 
2.11.0


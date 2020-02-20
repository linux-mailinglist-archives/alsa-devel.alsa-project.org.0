Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4DA165DF2
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 13:58:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BCD016A9;
	Thu, 20 Feb 2020 13:57:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BCD016A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582203524;
	bh=TJayQYWZ7KC35aIZo8HXYH3xAsNqPCGnuSygqB8ujPQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IqBAKpi7bR8Eiy9FghLbsGRgg9CAE1iVJNfecHc2JrHOSd9MMfCO/ewpiW20NtnPr
	 Jo6MNltjsaer+NJAOOECYrz/JNbtuvSWRecNZL6z4tJe+ilo69UUnoo4W5rQrv79FZ
	 l5GRGdHGTnWWsmU0PZHk0Lc0SJ8Y/pcKVdHqEync=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87E35F80114;
	Thu, 20 Feb 2020 13:57:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01D93F80148; Thu, 20 Feb 2020 13:57:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ECF5F80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 13:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ECF5F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WTk7U7sg"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KCr8Io029073; Thu, 20 Feb 2020 06:56:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=EUZmQ5HqmNQC6EoWxxeGfXF81MosGr3sishTvEqK4ZQ=;
 b=WTk7U7sgbSCW4C0M42b+EQV/mIGCW9SAhk9ydzvLZmM7SJeD/9NYzm8Y2yMDIBOyk1Jt
 f8+8afbLNpvZiAoVwgwAEHrgyNBkQK0xmDpI/d9k22Dg472HS6vzDwSCEI4QuqDKiqlN
 2XLHdDoa0B2ygcxFHr9iFhr+iOPHIQkEiMVcTvML/+NwH+0qIwohgt27RMNHAWkG0/Vr
 gU0ZDoat7Bb2XG3LSY9BUNpBDGBYgHzxZ+prAqNuUsgrqXZrBOfAUEdP5vhA+ZHyvnAR
 usluodQfPSgo/X4tPKHGwjkd+sncrU04XVdl8H0zzavUzjUdRG3Nzjdoyi+fpYpV3WFD 3g== 
Authentication-Results: ppops.net;
 spf=pass smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
 by mx0b-001ae601.pphosted.com with ESMTP id 2y8uckad1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Feb 2020 06:56:55 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 20 Feb
 2020 12:56:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 20 Feb 2020 12:56:54 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 83C9B2AB;
 Thu, 20 Feb 2020 12:56:54 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: Update dependencies for Arizona machine drivers
Date: Thu, 20 Feb 2020 12:56:54 +0000
Message-ID: <20200220125654.7064-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 suspectscore=1
 clxscore=1011 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=992 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002200097
Cc: alsa-devel@alsa-project.org, sbkim73@samsung.com,
 patches@opensource.cirrus.com, rdunlap@infradead.org, lgirdwood@gmail.com,
 s.nawrocki@samsung.com
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

Currently it is possible to get the following bad config:

WARNING: unmet direct dependencies detected for SND_SOC_WM5110
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MFD_WM5110 [=n]

commit ea00d95200d0 ("ASoC: Use imply for SND_SOC_ALL_CODECS")
commit d8dd3f92a6ba ("ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout")

After these two patches the machine drivers still selects the
SND_SOC_WM5110 symbol which doesn't take account of the dependency
added on the MFD_WM5110 symbol, fix this by also adding a dependency on
MFD_WM5110 itself.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/samsung/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 1a0b163ca47b5..112911dc271ba 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -151,7 +151,7 @@ config SND_SOC_TOBERMORY
 
 config SND_SOC_BELLS
 	tristate "Audio support for Wolfson Bells"
-	depends on MFD_ARIZONA && I2C && SPI_MASTER
+	depends on MFD_ARIZONA && MFD_WM5102 && MFD_WM5110 && I2C && SPI_MASTER
 	depends on MACH_WLF_CRAGG_6410 || COMPILE_TEST
 	select SND_SAMSUNG_I2S
 	select SND_SOC_WM5102
@@ -204,7 +204,7 @@ config SND_SOC_ARNDALE
 
 config SND_SOC_SAMSUNG_TM2_WM5110
 	tristate "SoC I2S Audio support for WM5110 on TM2 board"
-	depends on SND_SOC_SAMSUNG && MFD_ARIZONA && I2C && SPI_MASTER
+	depends on SND_SOC_SAMSUNG && MFD_ARIZONA && MFD_WM5110 && I2C && SPI_MASTER
 	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_MAX98504
 	select SND_SOC_WM5110
-- 
2.11.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC92145318
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 11:47:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87D9C169A;
	Wed, 22 Jan 2020 11:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87D9C169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579690078;
	bh=hrxEtEZHvKf5YFKJNY3d8s37+Pp4Wjw6Hj8jfXu6jeM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ci2hRZ92QKJ+gObzvmXI6iS3Yi0bU5rimJ0mnCCofTTo5NZb91+cOD27dgKrT7fwN
	 dn+LhtThVd0n5ii10C+qeJqzDcZbEgVVFQSoY7txwgBgeGR7sNF38dMeg1mo+AmELs
	 dE0ubW0U0aOtDIOoNLZVusaog1qKGZyAigavvD3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EF53F8020C;
	Wed, 22 Jan 2020 11:46:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CAE5F8007E; Wed, 22 Jan 2020 11:46:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB538F8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 11:46:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB538F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LD9oyyVB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00MAbcca015451; Wed, 22 Jan 2020 04:46:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=dL78CdqvbsUFVP+qpHlnfj1YcYStWvcbQfeRMYIqIkU=;
 b=LD9oyyVBIVr3nmc1ShAlYY7khG4hSEqqCGIy8YkIT4OhN9ydYOcEgLwmOEHJfGH/oR/G
 /9qSbfbzM9j5iaOVSWjxHStdr0qy7/rbeLYzaqd0PRzTZvNe9bwJD8uydcJ1m7ICETpw
 kpUnlLBkpOqHfUOpmy40gMP4nZhIktZ2nyCLNFQA5gHBaqt2u69KdT+Iv0QAxQiYD7OF
 h5yrWtQ93tl/4twKKsyWFzouBHHsFXGeo+ykKHLlvdemIkpoEnzFiNLlx4M4U6PWNUEC
 EyJXjsQkUgU7DUlOn82QibFJX1bUG+taqIerV5cB5ffwXDRpYb+zdcvOKlUBIZqHKPdI gA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0b-001ae601.pphosted.com with ESMTP id 2xm00ed8r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Jan 2020 04:46:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 22 Jan
 2020 10:45:59 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 22 Jan 2020 10:45:59 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A05AF2C6;
 Wed, 22 Jan 2020 10:45:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Wed, 22 Jan 2020 10:45:59 +0000
Message-ID: <20200122104559.17043-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=622
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001220097
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: madera: Correct some kernel doc
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

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/madera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index f65d123929659..40de9d7811d1f 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -4714,7 +4714,7 @@ EXPORT_SYMBOL_GPL(madera_fllhj_set_refclk);
  *
  * @component: Device to configure
  * @output: Output number
- * @diff: True to set the output to differential mode
+ * @differential: True to set the output to differential mode
  *
  * Some systems use external analogue switches to connect more
  * analogue devices to the CODEC than are supported by the device.  In
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

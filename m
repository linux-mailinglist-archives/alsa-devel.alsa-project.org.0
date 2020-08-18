Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E6248AFA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 18:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CB3A1783;
	Tue, 18 Aug 2020 18:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CB3A1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597766607;
	bh=qNnl2i2xGfyoe/sFdAWZxNdmHyV7y0AQvavplMM6REw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SnPHtV9c6sV/jSkPRoyp9RT+OfqNUBjiLgv3wF440TZq+uDl1PgvBG+kjnM+/0OfM
	 jJO+EoN8dfPAGtoVDVVmA/kZQ0j8NURtCuHfEo3Y23tUeHmA77W452J65wN04yNXbS
	 Lfy00oSiECWe3msRDkdpqOyrPnbWiphcyAfJAf1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D9BF80114;
	Tue, 18 Aug 2020 18:01:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FB41F8023F; Tue, 18 Aug 2020 18:01:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25E0FF800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25E0FF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TIhB8cop"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07IFk5Ys022950; Tue, 18 Aug 2020 11:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=c5isEhpKnRkWddrpWqsd6fDarwTZbXwDH9aByIh4WGw=;
 b=TIhB8copgJyQ/fh6qqFmS5ilPE9JLhvpNRIsX9/xYCfsUTMBaau11sf2kEhdVrsEETkw
 YO8umm4N0UHjar7DFuM3Z7R85Qw+BacY2fQ6oA28KfD4YVF0Pvxtn9+cRV/YwMjRa+n5
 T/du9WHC/q6ko8dfvYh0/SrnXde6FfmpzqibI7WwiMM7B0cE6rZj9Qw2tATxepmmDVG0
 EUArDgipPwY5drLdaHBSDAqcetZWC2M76A4GSiPUR9pVIPKDflmBaWOeOQTcTUyuCBox
 aLj9XMkL5no+ssu8lZPaWQVg2BhUEHViZ/smuY5XgZB8aEVuaDVQyjWIPYGV+m2JHc4/ 4w== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3304m390mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Aug 2020 11:01:29 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 18 Aug
 2020 17:01:26 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 18 Aug 2020 17:01:26 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 780612C3;
 Tue, 18 Aug 2020 16:01:26 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: Update naming in error handling
Date: Tue, 18 Aug 2020 17:01:26 +0100
Message-ID: <20200818160126.4852-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 impostorscore=0
 priorityscore=1501 suspectscore=1 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180113
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

It seems the datasheet has never used the word slave for this error
status bit and has always used the term address error. So update the
driver to match the datasheets and also in the process align a bit
better with avoiding the use of such words where possible.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 410cca57da52d..4ff0c6cfa32de 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -199,7 +199,7 @@
 #define ADSP2_PMEM_ERR_ADDR_XMEM_ERR_ADDR    0x7C
 
 #define ADSP2_REGION_LOCK_ERR_MASK           0x8000
-#define ADSP2_SLAVE_ERR_MASK                 0x4000
+#define ADSP2_ADDR_ERR_MASK                  0x4000
 #define ADSP2_WDT_TIMEOUT_STS_MASK           0x2000
 #define ADSP2_CTRL_ERR_PAUSE_ENA             0x0002
 #define ADSP2_CTRL_ERR_EINT                  0x0001
@@ -4364,9 +4364,9 @@ irqreturn_t wm_adsp2_bus_error(int irq, void *data)
 		wm_adsp_fatal_error(dsp);
 	}
 
-	if (val & (ADSP2_SLAVE_ERR_MASK | ADSP2_REGION_LOCK_ERR_MASK)) {
-		if (val & ADSP2_SLAVE_ERR_MASK)
-			adsp_err(dsp, "bus error: slave error\n");
+	if (val & (ADSP2_ADDR_ERR_MASK | ADSP2_REGION_LOCK_ERR_MASK)) {
+		if (val & ADSP2_ADDR_ERR_MASK)
+			adsp_err(dsp, "bus error: address error\n");
 		else
 			adsp_err(dsp, "bus error: region lock error\n");
 
-- 
2.11.0


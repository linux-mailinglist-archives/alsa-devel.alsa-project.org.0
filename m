Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32852106DE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 12:15:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9514616CD;
	Wed,  1 May 2019 12:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9514616CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556705726;
	bh=JeheWKnzCACYKBjcAjNxDzWMNjyGFn66PJn0HPJdMKo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWZu7NGwvSKiAZdYWCfckkhk8XzWmH60hBfr2WFn4zJX9UBol2SLUPT+Vh90T22rC
	 e8HILDYvimG1Deffk91mWEIr98AEreFDLr/0xWL4bH2JPw4tdmwjoUSKhS2byRYCzB
	 pcIWU3xhjboUYHWKRNHZFlxwtSPMdp/UOWr09HDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C765F89693;
	Wed,  1 May 2019 12:13:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EC20F896B9; Wed,  1 May 2019 12:13:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=KHOP_DYNAMIC,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BD7DF8075A
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 12:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD7DF8075A
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x41A9e37026623; Wed, 1 May 2019 05:13:33 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2s6xhv0wcq-1;
 Wed, 01 May 2019 05:13:33 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail1.cirrus.com (Postfix) with ESMTP id ECEA2611E122;
 Wed,  1 May 2019 05:13:32 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 1 May
 2019 11:13:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 1 May 2019 11:13:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5FC062DA;
 Wed,  1 May 2019 11:13:32 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Wed, 1 May 2019 11:13:32 +0100
Message-ID: <20190501101332.31190-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501101332.31190-1-ckeepax@opensource.cirrus.com>
References: <20190501101332.31190-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=961 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905010068
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: wm_adsp: Use DSP ops pointers to
	stop watchdog in error handlers
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

Whilst this isn't strictly necessary as the code is already DSP specific
better to use the pointers to avoid potential issues in the future if
one core ends up having multiple methods of stopping the watchdog.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index f3c28e54d6d6e..b26e6b825a900 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -4285,7 +4285,7 @@ irqreturn_t wm_adsp2_bus_error(struct wm_adsp *dsp)
 
 	if (val & ADSP2_WDT_TIMEOUT_STS_MASK) {
 		adsp_err(dsp, "watchdog timeout error\n");
-		wm_adsp_stop_watchdog(dsp);
+		dsp->ops->stop_watchdog(dsp);
 		wm_adsp_fatal_error(dsp);
 	}
 
@@ -4396,7 +4396,7 @@ irqreturn_t wm_halo_wdt_expire(int irq, void *data)
 	mutex_lock(&dsp->pwr_lock);
 
 	adsp_warn(dsp, "WDT Expiry Fault\n");
-	wm_halo_stop_watchdog(dsp);
+	dsp->ops->stop_watchdog(dsp);
 	wm_adsp_fatal_error(dsp);
 
 	mutex_unlock(&dsp->pwr_lock);
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

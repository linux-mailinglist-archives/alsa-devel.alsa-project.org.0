Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFDA50AFA7
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 07:42:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7794164D;
	Fri, 22 Apr 2022 07:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7794164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650606133;
	bh=XmN2+7lvD8VPW/IQfGkVIUmZic3RjTclumrwX1JJq8Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BvreNTk7Ju8oXffbxdhQZ3zoPUxqodP3wWysLZcxIbIK7QcpEL7ytQBtLGbbXiVEg
	 X79RnLNV/fk+mOWOk5z3LvRnmEZmothaRa+xWXEAUFQQxsyN/wnwWSDZSGFs7kabrC
	 7BTrY9n9YXsytmyWHQdlq7YvaJ0QNq2mXDQabWmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 168A8F80125;
	Fri, 22 Apr 2022 07:41:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABBFFF80245; Fri, 22 Apr 2022 07:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58E5CF80134
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 07:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58E5CF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bquTg30F"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23M5eCc7042223;
 Fri, 22 Apr 2022 00:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650606012;
 bh=EP8k7XQCY/wqajI+hdZuojwN/DMymzB4exFYpj/ZWQQ=;
 h=From:To:CC:Subject:Date;
 b=bquTg30FzJCT6xrLP4MpXvCrzaAWtpFx+JG7TPJ8t+Hs5XTzcDCUNQuAAhRrpLQIw
 5TI6358UzNU29FZ3exUdt6tyTvBOgMk8Vqby/x0dbOd6F7ylKKBFcvR+INC0sjE7AG
 R6QN7zeuD1WYU8f4GPI7Q3B6ioqlgIeGHo6MHKx0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23M5eCWk002520
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Apr 2022 00:40:12 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Apr 2022 00:40:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Apr 2022 00:40:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23M5eB7P090103;
 Fri, 22 Apr 2022 00:40:11 -0500
From: Jai Luthra <j-luthra@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: [PATCH v2] ASoC: ti: davinci-mcasp: Add dma-type for bcdma
Date: Fri, 22 Apr 2022 11:10:01 +0530
Message-ID: <20220422054001.3738-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, Jayesh Choudhary <j-choudhary@ti.com>,
 Jai Luthra <j-luthra@ti.com>, linux-kernel@vger.kernel.org
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Set DMA type for ti-bcdma controller for AM62-SK.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 2c146b91fca3..377be2e2b6ee 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2047,6 +2047,8 @@ static int davinci_mcasp_get_dma_type(struct davinci_mcasp *mcasp)
 		return PCM_SDMA;
 	else if (strstr(tmp, "udmap"))
 		return PCM_UDMA;
+	else if (strstr(tmp, "bcdma"))
+		return PCM_UDMA;
 
 	return PCM_EDMA;
 }
-- 
2.17.1


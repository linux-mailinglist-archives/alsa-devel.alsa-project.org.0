Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9561503F9
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 11:13:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3F016A5;
	Mon,  3 Feb 2020 11:12:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3F016A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580724796;
	bh=v4ZLhNOcyUERDnKKPar+gSfRiVUmxOjfxgIGSAY2D90=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EaSCZj/zuOE/TFb9KfBZFHktTyn9bXfFXvZIHxyTE5NbBTSk0nQ9tG/+idOEZH8dm
	 MkumvBrDUs/UuqSttXaUOts5T7aZTOPRsi+rsFgleWyHf9QfkTjwy3bMVmTHNRAuow
	 stAyesz8ahUUIMohYCzHpRhgfi+PW3W4lfw6pTyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92B4F80291;
	Mon,  3 Feb 2020 11:09:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8337F80264; Mon,  3 Feb 2020 11:09:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3FEBF80264
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 11:09:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3FEBF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="pbA0KAqE"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0139vFa9024543; Mon, 3 Feb 2020 11:09:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vji+KdcJdxDbdE9XaBnUG+ZVhDLiDwWdOQKGdLRS7W8=;
 b=pbA0KAqEXx/u34WlBAk/EVk9G8+wGhxa22CdviUcaWFBEritcAD23pBtOK8ZFxZ0tYil
 HkOnUMgQD/0wtVp/GRj45eeyfw3NzOYMEPHRli0p5yhgurIbDpV6BHMhVK0iHV1Kxwz2
 MZoswBPy2equsQ7oy5wfzI+Mpx4Vmyn4Zs18dFhkzCmexX1vaIF454IgAOo2NUQlH7kS
 WFTCDrfcPhtFSNm944ntUzPlSeaquZpferhCUGncrkg4blBjGXjEKgpOgV1bHwCgXyA4
 SLlx6Y4ipgosQbZXSjrOrJBHuRbGPCYkcSg7PhgVegaagcR4WNcvItV0kOW0zIfbU6I5 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw13ngdpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 11:09:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F278100038;
 Mon,  3 Feb 2020 11:08:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E7262BE22D;
 Mon,  3 Feb 2020 11:08:58 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 3 Feb 2020 11:08:57 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:09 +0100
Message-ID: <20200203100814.22944-2-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200203100814.22944-1-olivier.moysan@st.com>
References: <20200203100814.22944-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_02:2020-02-02,
 2020-02-03 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>
Subject: [alsa-devel] [PATCH 1/6] ASoC: stm32: sai: manage error when
	getting reset controller
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

Return an error when the SAI driver fails to get a reset controller.
Also add an error trace, except on probe defer status.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_sai.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index e20267504b16..b824ba6cb028 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -197,12 +197,16 @@ static int stm32_sai_probe(struct platform_device *pdev)
 		return sai->irq;
 
 	/* reset */
-	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (!IS_ERR(rst)) {
-		reset_control_assert(rst);
-		udelay(2);
-		reset_control_deassert(rst);
+	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(rst)) {
+		if (PTR_ERR(rst) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Reset controller error %ld\n",
+				PTR_ERR(rst));
+		return PTR_ERR(rst);
 	}
+	reset_control_assert(rst);
+	udelay(2);
+	reset_control_deassert(rst);
 
 	/* Enable peripheral clock to allow register access */
 	ret = clk_prepare_enable(sai->pclk);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

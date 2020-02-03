Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D621503F7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 11:11:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B911677;
	Mon,  3 Feb 2020 11:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B911677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580724714;
	bh=uBFVonWOQKPwNXf6pN6xhhlArrDIVqqkK0DjKjVpcrc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jn2vWtGqKd1VBf8qUU3PT3kQdCJU878GMk5LGTrFtEgsBxnU0XvCwpDxPSpJw/+ZR
	 PgOEGAphwYUluc8G9E6/5fGrnuh7xdh3Nd9pHqJpsWJlmKHsQ2JSqprXVvI/PgXoyF
	 5nlX39JDKi6bysYnRABRTv3hzztPV3zVBLhqRl5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31990F8027B;
	Mon,  3 Feb 2020 11:09:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56D11F80150; Mon,  3 Feb 2020 11:09:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 058CFF80150
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 11:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 058CFF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="C0H/Zf+M"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0139vJGa024556; Mon, 3 Feb 2020 11:09:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Vr8426iZCU0ASV10nebyPRqDVcg2Jda5jd/ZrCISTcw=;
 b=C0H/Zf+Ma+QYM1rs8HULVKRJjT/r2KjfKeseIx6uTls8oIRpg7OTl+e/+98DJ1I32AhC
 yCBixEBGRi55ha1p5eM4rl3M+wOEzSYVuozWrMjbHJgRNzreB7K0+F2lWgl0AHzbY2/W
 0DtgCu1gA23QDuj1cPgpAF7wBOgATDbe51lba1oiQ5quxHH95zGCE3Cd++rN8uiWAem0
 nIzv09pjcYWgdcHLmxo6K6yP0NVWoxI7RmEmMqaRVeynAJu5orRGW0gVZW0e0y/73c7w
 l3PpSL49meDTkHFZ2MfzWpwVMa1RQvfYtPCQOfqYsFJKm1Spso6fc9M3U94ki9lee9lB /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw13ngdps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 11:09:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B88710003D;
 Mon,  3 Feb 2020 11:09:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 504342BE22D;
 Mon,  3 Feb 2020 11:09:03 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 3 Feb 2020 11:09:02 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:13 +0100
Message-ID: <20200203100814.22944-6-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200203100814.22944-1-olivier.moysan@st.com>
References: <20200203100814.22944-1-olivier.moysan@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_02:2020-02-02,
 2020-02-03 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>
Subject: [alsa-devel] [PATCH 5/6] ASoC: stm32: spdifrx: improve error
	management on probe deferral
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

Do not print an error trace when deferring probe for SPDIFRX driver.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_spdifrx.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 9f80ddf34443..49766afdae61 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -406,7 +406,9 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 
 	spdifrx->ctrl_chan = dma_request_chan(dev, "rx-ctrl");
 	if (IS_ERR(spdifrx->ctrl_chan)) {
-		dev_err(dev, "dma_request_slave_channel failed\n");
+		if (PTR_ERR(spdifrx->ctrl_chan) != -EPROBE_DEFER)
+			dev_err(dev, "dma_request_slave_channel error %ld\n",
+				PTR_ERR(spdifrx->ctrl_chan));
 		return PTR_ERR(spdifrx->ctrl_chan);
 	}
 
@@ -929,7 +931,9 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 
 	spdifrx->kclk = devm_clk_get(&pdev->dev, "kclk");
 	if (IS_ERR(spdifrx->kclk)) {
-		dev_err(&pdev->dev, "Could not get kclk\n");
+		if (PTR_ERR(spdifrx->kclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get kclk: %ld\n",
+				PTR_ERR(spdifrx->kclk));
 		return PTR_ERR(spdifrx->kclk);
 	}
 
@@ -967,7 +971,9 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 						    spdifrx->base,
 						    spdifrx->regmap_conf);
 	if (IS_ERR(spdifrx->regmap)) {
-		dev_err(&pdev->dev, "Regmap init failed\n");
+		if (PTR_ERR(spdifrx->regmap) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Regmap init error %ld\n",
+				PTR_ERR(spdifrx->regmap));
 		return PTR_ERR(spdifrx->regmap);
 	}
 
@@ -1003,7 +1009,8 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	pcm_config = &stm32_spdifrx_pcm_config;
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
 	if (ret) {
-		dev_err(&pdev->dev, "PCM DMA register returned %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
 		goto error;
 	}
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD0189E30
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 15:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CFAB1738;
	Wed, 18 Mar 2020 15:44:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CFAB1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584542695;
	bh=8r/i0NDgEffaOgvFMhHrVKlis1NRzHKSJT2q1TQNdwc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NL6JQnwT0v/4MUEmz4B6SGqtDVTvMYpSIPGCNpHXfkh872ouKB++QmjoAe0Qf82Q1
	 RQIuvKM+LrzD3eEDezgiqMWpieHGB8i1o0mWo8ikJXxVZdba+pe2G+i9e18Sk7EKe2
	 O7c4tGJyv0m0nNEdhu18iIy9rjkBVo+h5F+nw1RQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5FBBF8028C;
	Wed, 18 Mar 2020 15:42:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47E9EF8028B; Wed, 18 Mar 2020 15:42:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B0ECF80162
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 15:42:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B0ECF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="p++qzH/A"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IEcse1022637; Wed, 18 Mar 2020 15:42:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ZUMDY5kCYXtzYGSm/+LutBJw6hzcH2Vp5SzPvg2i0yM=;
 b=p++qzH/ASNPmlDB9eWwF/7rdeDwcwviTmvMpVvea8rc2oHDjtDAJImtf1iwOgVD8HqMe
 egaPnIcCgdvJJPR8ag8Nu6NYytPxJD0XXACyZB0B9KPDrq7QZ/ToXWSTJdevLPmVE+D+
 JClJMj9/wLtS6di76fTaf14MRfZqyXYlC3hnGXp9dLM1JPKZuTGbF/VharaDYLNHMQ3G
 au1lSg1B50B9IW6kZWLwXQpKujAKWr/robgsq4cE2pO5AiSoFQnt+wSrtNlPcJ6a/RqP
 JppR6WKI6blW5N538raDEXEgY66n/UB1HYJMjTnrnIbSO3l1QoP4pQK179FaZyZs+Iwb MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdckp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 15:42:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CC4310002A;
 Wed, 18 Mar 2020 15:42:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18C032AE6C9;
 Wed, 18 Mar 2020 15:42:18 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 18 Mar 2020 15:42:16 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>
Subject: [PATCH 2/3] ASoC: stm32: spdifrx: manage rebind issue
Date: Wed, 18 Mar 2020 15:41:24 +0100
Message-ID: <20200318144125.9163-3-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318144125.9163-1-olivier.moysan@st.com>
References: <20200318144125.9163-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_06:2020-03-18,
 2020-03-18 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The commit e894efef9ac7 ("ASoC: core: add support to card rebind")
allows to rebind the sound card after a rebind of one of its component.
With this commit, the sound card is actually rebound,
but may be no more functional.

Corrections:
- Call snd_dmaengine_pcm_register() before snd_soc_register_component().
- Call snd_dmaengine_pcm_unregister() and snd_soc_unregister_component()
explicitly from SPDFIRX driver.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_spdifrx.c | 62 ++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 301f8463390f..1bfa3b2ba974 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -944,6 +944,22 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 	return 0;
 }
 
+static int stm32_spdifrx_remove(struct platform_device *pdev)
+{
+	struct stm32_spdifrx_data *spdifrx = platform_get_drvdata(pdev);
+
+	if (spdifrx->ctrl_chan)
+		dma_release_channel(spdifrx->ctrl_chan);
+
+	if (spdifrx->dmab)
+		snd_dma_free_pages(spdifrx->dmab);
+
+	snd_dmaengine_pcm_unregister(&pdev->dev);
+	snd_soc_unregister_component(&pdev->dev);
+
+	return 0;
+}
+
 static int stm32_spdifrx_probe(struct platform_device *pdev)
 {
 	struct stm32_spdifrx_data *spdifrx;
@@ -995,25 +1011,27 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	udelay(2);
 	reset_control_deassert(rst);
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &stm32_spdifrx_component,
-					      stm32_spdifrx_dai,
-					      ARRAY_SIZE(stm32_spdifrx_dai));
-	if (ret)
-		return ret;
-
-	ret = stm32_spdifrx_dma_ctrl_register(&pdev->dev, spdifrx);
-	if (ret)
-		goto error;
-
 	pcm_config = &stm32_spdifrx_pcm_config;
-	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
+	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
-		goto error;
+		return ret;
 	}
 
+	ret = snd_soc_register_component(&pdev->dev,
+					 &stm32_spdifrx_component,
+					 stm32_spdifrx_dai,
+					 ARRAY_SIZE(stm32_spdifrx_dai));
+	if (ret) {
+		snd_dmaengine_pcm_unregister(&pdev->dev);
+		return ret;
+	}
+
+	ret = stm32_spdifrx_dma_ctrl_register(&pdev->dev, spdifrx);
+	if (ret)
+		goto error;
+
 	ret = regmap_read(spdifrx->regmap, STM32_SPDIFRX_IDR, &idr);
 	if (ret)
 		goto error;
@@ -1031,27 +1049,11 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 	return ret;
 
 error:
-	if (!IS_ERR(spdifrx->ctrl_chan))
-		dma_release_channel(spdifrx->ctrl_chan);
-	if (spdifrx->dmab)
-		snd_dma_free_pages(spdifrx->dmab);
+	stm32_spdifrx_remove(pdev);
 
 	return ret;
 }
 
-static int stm32_spdifrx_remove(struct platform_device *pdev)
-{
-	struct stm32_spdifrx_data *spdifrx = platform_get_drvdata(pdev);
-
-	if (spdifrx->ctrl_chan)
-		dma_release_channel(spdifrx->ctrl_chan);
-
-	if (spdifrx->dmab)
-		snd_dma_free_pages(spdifrx->dmab);
-
-	return 0;
-}
-
 MODULE_DEVICE_TABLE(of, stm32_spdifrx_ids);
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.17.1


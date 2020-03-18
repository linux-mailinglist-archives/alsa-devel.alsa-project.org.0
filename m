Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5C18A743
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 22:45:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42F65170D;
	Wed, 18 Mar 2020 22:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42F65170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584567910;
	bh=q1ZRi7IHIhtCRPdsKT19s0Mf+yBaQVRxm/aCkk3HWko=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=u7LLObE+FGV0nhg0LlErSDxbleR8BC0sabntoGE4GWkikCw47YEwq5Fc2DVEaSrCE
	 C0wTwUWncE9EFH49MGB5clRi+OLb2gPmbgRWkxXF5mMVkEKOzws5rn/fta5AO5ZL2l
	 DgyTnHAvoRfheOed0iocJSGhRgCOYbMQ641xWymc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87476F801DB;
	Wed, 18 Mar 2020 22:42:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33C01F80290; Wed, 18 Mar 2020 22:42:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 26056F8028B
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 22:41:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26056F8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E5AFFEC;
 Wed, 18 Mar 2020 14:41:57 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 965A73F67D;
 Wed, 18 Mar 2020 14:41:56 -0700 (PDT)
Date: Wed, 18 Mar 2020 21:41:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Subject: Applied "ASoC: stm32: spdifrx: manage rebind issue" to the asoc tree
In-Reply-To: <20200318144125.9163-3-olivier.moysan@st.com>
Message-Id: <applied-20200318144125.9163-3-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, olivier.moysan@st.com, alexandre.torgue@st.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

The patch

   ASoC: stm32: spdifrx: manage rebind issue

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 794df9448edb55978e50372f083aeedade1b2844 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Wed, 18 Mar 2020 15:41:24 +0100
Subject: [PATCH] ASoC: stm32: spdifrx: manage rebind issue

The commit e894efef9ac7 ("ASoC: core: add support to card rebind")
allows to rebind the sound card after a rebind of one of its component.
With this commit, the sound card is actually rebound,
but may be no more functional.

Corrections:
- Call snd_dmaengine_pcm_register() before snd_soc_register_component().
- Call snd_dmaengine_pcm_unregister() and snd_soc_unregister_component()
explicitly from SPDFIRX driver.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20200318144125.9163-3-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_spdifrx.c | 62 ++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 49766afdae61..ae7a0f46a6fb 100644
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
@@ -1029,27 +1047,11 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
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
2.20.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68042159467
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0575D16BC;
	Tue, 11 Feb 2020 17:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0575D16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581437257;
	bh=wuFLL6+oSMW4VXLI+T1p+0twTlLfQoGIO2aUtz0UjNM=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eVYHQsw5vIaaPplxf4yomBg7bsGP8bQNbcI0sFVONvmnqAMkZ/lW0E9QL6S01laHk
	 /mEoSdcFV7Npfs0gR4ftJB8XZIGT9TmTMSVMJ+4O9VtH8UajOlgkusuXT2i0j7PhYK
	 zlMP+LMP569FTOzDgtp9GRNuoMhPJuKZmndtR2oE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85E30F803BC;
	Tue, 11 Feb 2020 16:49:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42D49F80370; Tue, 11 Feb 2020 16:49:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6ADCEF80370
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:49:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ADCEF80370
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2D8712FC;
 Tue, 11 Feb 2020 07:49:31 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38E9F3F68E;
 Tue, 11 Feb 2020 07:49:31 -0800 (PST)
Date: Tue, 11 Feb 2020 15:49:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20200203100814.22944-7-olivier.moysan@st.com>
Message-Id: <applied-20200203100814.22944-7-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: Etienne Carriere <etienne.carriere@st.com>, alsa-devel@alsa-project.org,
 olivier.moysan@st.com, alexandre.torgue@st.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: stm32: i2s: improve error management on
	probe deferral" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: stm32: i2s: improve error management on probe deferral

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From 04dd656e8d506c12f5e97a24089b2991f5f00984 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:14 +0100
Subject: [PATCH] ASoC: stm32: i2s: improve error management on probe deferral

Do not print an error trace when deferring probe for I2S driver.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20200203100814.22944-7-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_i2s.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index cdcc00d9a67e..2478405727c3 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -831,25 +831,33 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	/* Get clocks */
 	i2s->pclk = devm_clk_get(&pdev->dev, "pclk");
 	if (IS_ERR(i2s->pclk)) {
-		dev_err(&pdev->dev, "Could not get pclk\n");
+		if (PTR_ERR(i2s->pclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get pclk: %ld\n",
+				PTR_ERR(i2s->pclk));
 		return PTR_ERR(i2s->pclk);
 	}
 
 	i2s->i2sclk = devm_clk_get(&pdev->dev, "i2sclk");
 	if (IS_ERR(i2s->i2sclk)) {
-		dev_err(&pdev->dev, "Could not get i2sclk\n");
+		if (PTR_ERR(i2s->i2sclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get i2sclk: %ld\n",
+				PTR_ERR(i2s->i2sclk));
 		return PTR_ERR(i2s->i2sclk);
 	}
 
 	i2s->x8kclk = devm_clk_get(&pdev->dev, "x8k");
 	if (IS_ERR(i2s->x8kclk)) {
-		dev_err(&pdev->dev, "missing x8k parent clock\n");
+		if (PTR_ERR(i2s->x8kclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get x8k parent clock: %ld\n",
+				PTR_ERR(i2s->x8kclk));
 		return PTR_ERR(i2s->x8kclk);
 	}
 
 	i2s->x11kclk = devm_clk_get(&pdev->dev, "x11k");
 	if (IS_ERR(i2s->x11kclk)) {
-		dev_err(&pdev->dev, "missing x11k parent clock\n");
+		if (PTR_ERR(i2s->x11kclk) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Could not get x11k parent clock: %ld\n",
+				PTR_ERR(i2s->x11kclk));
 		return PTR_ERR(i2s->x11kclk);
 	}
 
@@ -907,7 +915,9 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 	i2s->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "pclk",
 						i2s->base, i2s->regmap_conf);
 	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
+		if (PTR_ERR(i2s->regmap) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Regmap init error %ld\n",
+				PTR_ERR(i2s->regmap));
 		return PTR_ERR(i2s->regmap);
 	}
 
@@ -918,8 +928,11 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
 					      &stm32_i2s_pcm_config, 0);
-	if (ret)
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
 		return ret;
+	}
 
 	/* Set SPI/I2S in i2s mode */
 	ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

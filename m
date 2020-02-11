Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5F159471
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:08:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7D1416D0;
	Tue, 11 Feb 2020 17:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7D1416D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581437326;
	bh=eQQMm5EruqD7TqVzlAmUXZLWnVyz8b4QKgE6AEE2K1c=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JlRCSQhMBcIWMDzlJmVZPQ4ihXMXgJncr9mQIordz/94n/KhZQg6AS1JMBDJRF1b0
	 QXgKqsp8xY+bzvHQdDa2EoYmk3Rn0AtnFUapBSyUIXnhDVRJm93CEPERf3l57q6yRy
	 ehX6iyOkrr29uWWxmj9m12uc5ADnWRANbxHRcdW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9128F803D7;
	Tue, 11 Feb 2020 16:49:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EB01F803A6; Tue, 11 Feb 2020 16:49:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F05F5F8038D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:49:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F05F5F8038D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 695FB1396;
 Tue, 11 Feb 2020 07:49:36 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E23393F68E;
 Tue, 11 Feb 2020 07:49:35 -0800 (PST)
Date: Tue, 11 Feb 2020 15:49:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20200203100814.22944-5-olivier.moysan@st.com>
Message-Id: <applied-20200203100814.22944-5-olivier.moysan@st.com>
X-Patchwork-Hint: ignore
Cc: Etienne Carriere <etienne.carriere@st.com>, alsa-devel@alsa-project.org,
 olivier.moysan@st.com, alexandre.torgue@st.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: stm32: sai: improve error management on
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

   ASoC: stm32: sai: improve error management on probe deferral

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

From 5183e85423070d088aaf1ed07ab260e03d5a4e20 Mon Sep 17 00:00:00 2001
From: Olivier Moysan <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:12 +0100
Subject: [PATCH] ASoC: stm32: sai: improve error management on probe deferral

Do not print an error trace when deferring probe for SAI driver.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/20200203100814.22944-5-olivier.moysan@st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_sai.c     | 12 +++++++++---
 sound/soc/stm/stm32_sai_sub.c | 11 ++++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index b824ba6cb028..058757c721f0 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -174,20 +174,26 @@ static int stm32_sai_probe(struct platform_device *pdev)
 	if (!STM_SAI_IS_F4(sai)) {
 		sai->pclk = devm_clk_get(&pdev->dev, "pclk");
 		if (IS_ERR(sai->pclk)) {
-			dev_err(&pdev->dev, "missing bus clock pclk\n");
+			if (PTR_ERR(sai->pclk) != -EPROBE_DEFER)
+				dev_err(&pdev->dev, "missing bus clock pclk: %ld\n",
+					PTR_ERR(sai->pclk));
 			return PTR_ERR(sai->pclk);
 		}
 	}
 
 	sai->clk_x8k = devm_clk_get(&pdev->dev, "x8k");
 	if (IS_ERR(sai->clk_x8k)) {
-		dev_err(&pdev->dev, "missing x8k parent clock\n");
+		if (PTR_ERR(sai->clk_x8k) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "missing x8k parent clock: %ld\n",
+				PTR_ERR(sai->clk_x8k));
 		return PTR_ERR(sai->clk_x8k);
 	}
 
 	sai->clk_x11k = devm_clk_get(&pdev->dev, "x11k");
 	if (IS_ERR(sai->clk_x11k)) {
-		dev_err(&pdev->dev, "missing x11k parent clock\n");
+		if (PTR_ERR(sai->clk_x11k) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "missing x11k parent clock: %ld\n",
+				PTR_ERR(sai->clk_x11k));
 		return PTR_ERR(sai->clk_x11k);
 	}
 
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 30bcd5d3a32a..0bbf9ed5e48b 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1380,7 +1380,9 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 	sai->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					    sai->regmap_config);
 	if (IS_ERR(sai->regmap)) {
-		dev_err(&pdev->dev, "Failed to initialize MMIO\n");
+		if (PTR_ERR(sai->regmap) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Regmap init error %ld\n",
+				PTR_ERR(sai->regmap));
 		return PTR_ERR(sai->regmap);
 	}
 
@@ -1471,7 +1473,9 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 	of_node_put(args.np);
 	sai->sai_ck = devm_clk_get(&pdev->dev, "sai_ck");
 	if (IS_ERR(sai->sai_ck)) {
-		dev_err(&pdev->dev, "Missing kernel clock sai_ck\n");
+		if (PTR_ERR(sai->sai_ck) != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Missing kernel clock sai_ck: %ld\n",
+				PTR_ERR(sai->sai_ck));
 		return PTR_ERR(sai->sai_ck);
 	}
 
@@ -1553,7 +1557,8 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, conf, 0);
 	if (ret) {
-		dev_err(&pdev->dev, "Could not register pcm dma\n");
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
 		return ret;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

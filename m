Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2A1116F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:24:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A3E173C;
	Thu,  2 May 2019 04:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A3E173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556763842;
	bh=PQgdOtenShazLokSMO2U0AHtHzfBSk6djNRcLtUjUEU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aBMDDLnKrEUkwD42idtmdh1JzvbnxTyrz/tnR7Xe84DwYrNkhbzQPdqUWnfG0UgY4
	 y68FNbL0sBuXCZFwD6El6nvaaWTJxxMMNa+H95Lbw2JSx6UKyIQ8pz5IQjzeqrVqym
	 v6+u22X1VS8vCkFEpXCYzKUkmjdmpZa1fbV049g4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74791F8974A;
	Thu,  2 May 2019 04:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF86F89733; Thu,  2 May 2019 04:18:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 911C7F89724
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 911C7F89724
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="g7HBSZHx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=JSlPcUnFqX1tN5EF+WG+3VLibdvupztBzoEMjhd4pBY=; b=g7HBSZHxEi41
 FbJOFo6XXTQJJ4jd7ljgytbHAlajKmV+/HndsXkAQtOvo+vHj106e0vJhsG1vuijAWw29aiNl3EzG
 l/oQinOz18TveSp+rV+4A6u9ko4jCwW9hCw7RotfC5h/NLZMi2ntyWQSGKNgQlD9a849ZiCNpPHal
 mCKTk=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1IX-0005qB-G5; Thu, 02 May 2019 02:18:09 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 39C17441D3C; Thu,  2 May 2019 03:18:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Viorel Suman <viorel.suman@nxp.com>
In-Reply-To: <1554894380-25153-5-git-send-email-viorel.suman@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021806.39C17441D3C@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:06 +0100 (BST)
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Viorel Suman <viorel.suman@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Fabio Estevam <festevam@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [alsa-devel] Applied "ASoC: fsl_audmix: cache pdev->dev pointer" to
	the asoc tree
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

   ASoC: fsl_audmix: cache pdev->dev pointer

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

From 62be484f7ad8443c393293a415392fbf3190c864 Mon Sep 17 00:00:00 2001
From: Viorel Suman <viorel.suman@nxp.com>
Date: Wed, 10 Apr 2019 11:06:39 +0000
Subject: [PATCH] ASoC: fsl_audmix: cache pdev->dev pointer

There should be no trouble to understand dev = pdev->dev.
This can save some space to have more print info or save
some wrapped lines.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Suggested-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_audmix.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index dc802d5c4ccd..3897a54a11fe 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -456,6 +456,7 @@ MODULE_DEVICE_TABLE(of, fsl_audmix_ids);
 
 static int fsl_audmix_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct fsl_audmix *priv;
 	struct resource *res;
 	const char *mdrv;
@@ -463,52 +464,50 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 	void __iomem *regs;
 	int ret;
 
-	of_id = of_match_device(fsl_audmix_ids, &pdev->dev);
+	of_id = of_match_device(fsl_audmix_ids, dev);
 	if (!of_id || !of_id->data)
 		return -EINVAL;
 
 	mdrv = of_id->data;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	/* Get the addresses */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(&pdev->dev, res);
+	regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	priv->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "ipg", regs,
+	priv->regmap = devm_regmap_init_mmio_clk(dev, "ipg", regs,
 						 &fsl_audmix_regmap_config);
 	if (IS_ERR(priv->regmap)) {
-		dev_err(&pdev->dev, "failed to init regmap\n");
+		dev_err(dev, "failed to init regmap\n");
 		return PTR_ERR(priv->regmap);
 	}
 
-	priv->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
+	priv->ipg_clk = devm_clk_get(dev, "ipg");
 	if (IS_ERR(priv->ipg_clk)) {
-		dev_err(&pdev->dev, "failed to get ipg clock\n");
+		dev_err(dev, "failed to get ipg clock\n");
 		return PTR_ERR(priv->ipg_clk);
 	}
 
 	platform_set_drvdata(pdev, priv);
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_audmix_component,
+	ret = devm_snd_soc_register_component(dev, &fsl_audmix_component,
 					      fsl_audmix_dai,
 					      ARRAY_SIZE(fsl_audmix_dai));
 	if (ret) {
-		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
+		dev_err(dev, "failed to register ASoC DAI\n");
 		return ret;
 	}
 
-	priv->pdev = platform_device_register_data(&pdev->dev, mdrv, 0, NULL,
-						   0);
+	priv->pdev = platform_device_register_data(dev, mdrv, 0, NULL, 0);
 	if (IS_ERR(priv->pdev)) {
 		ret = PTR_ERR(priv->pdev);
-		dev_err(&pdev->dev, "failed to register platform %s: %d\n",
-			mdrv, ret);
+		dev_err(dev, "failed to register platform %s: %d\n", mdrv, ret);
 	}
 
 	return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

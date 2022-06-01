Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1432F53A046
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 11:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D841749;
	Wed,  1 Jun 2022 11:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D841749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654075548;
	bh=Dm/SG6mslO9OJCOaLyyqHHK6IrIcfq5mLox799Q6orU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JZorIBuiPAHbqgp/57UMQJAGaDT9yigEd/zwlzkyyJAJki68oh7idGnDubAHnBN00
	 VFBnPeqGq/xgPhn9lC8U+LN0alT2S8VneQFi46PT8tVUDHsItn2mGaN52tJ2E9oNKT
	 HC9MBBn2W226bqxnKmzkGQJw4MsQiVy4F9B9hLcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D94F8052F;
	Wed,  1 Jun 2022 11:24:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B734F80149; Wed,  1 Jun 2022 11:24:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07BA1F80149
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 11:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07BA1F80149
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1nwKZy-0006FD-OT; Wed, 01 Jun 2022 11:23:50 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nwKZx-005oH4-5Z; Wed, 01 Jun 2022 11:23:47 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nwKZu-00Dxwi-Us; Wed, 01 Jun 2022 11:23:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org
Subject: [PATCH 1/3] ASoC: fsl_sai: use local device pointer
Date: Wed,  1 Jun 2022 11:23:40 +0200
Message-Id: <20220601092342.3328644-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
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

Use a local variable to dereference the device pointer once and use the
local variable in further calls. No functional changes.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 53 +++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index fa950dde5310..a7637d602f3c 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1004,6 +1004,7 @@ static int fsl_sai_runtime_resume(struct device *dev);
 static int fsl_sai_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct fsl_sai *sai;
 	struct regmap *gpr;
 	struct resource *res;
@@ -1012,12 +1013,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	int irq, ret, i;
 	int index;
 
-	sai = devm_kzalloc(&pdev->dev, sizeof(*sai), GFP_KERNEL);
+	sai = devm_kzalloc(dev, sizeof(*sai), GFP_KERNEL);
 	if (!sai)
 		return -ENOMEM;
 
 	sai->pdev = pdev;
-	sai->soc_data = of_device_get_match_data(&pdev->dev);
+	sai->soc_data = of_device_get_match_data(dev);
 
 	sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
 
@@ -1032,18 +1033,18 @@ static int fsl_sai_probe(struct platform_device *pdev)
 			ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);
 	}
 
-	sai->regmap = devm_regmap_init_mmio(&pdev->dev, base, &fsl_sai_regmap_config);
+	sai->regmap = devm_regmap_init_mmio(dev, base, &fsl_sai_regmap_config);
 	if (IS_ERR(sai->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
+		dev_err(dev, "regmap init failed\n");
 		return PTR_ERR(sai->regmap);
 	}
 
-	sai->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	sai->bus_clk = devm_clk_get(dev, "bus");
 	/* Compatible with old DTB cases */
 	if (IS_ERR(sai->bus_clk) && PTR_ERR(sai->bus_clk) != -EPROBE_DEFER)
-		sai->bus_clk = devm_clk_get(&pdev->dev, "sai");
+		sai->bus_clk = devm_clk_get(dev, "sai");
 	if (IS_ERR(sai->bus_clk)) {
-		dev_err(&pdev->dev, "failed to get bus clock: %ld\n",
+		dev_err(dev, "failed to get bus clock: %ld\n",
 				PTR_ERR(sai->bus_clk));
 		/* -EPROBE_DEFER */
 		return PTR_ERR(sai->bus_clk);
@@ -1051,9 +1052,9 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
 		sprintf(tmp, "mclk%d", i);
-		sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
+		sai->mclk_clk[i] = devm_clk_get(dev, tmp);
 		if (IS_ERR(sai->mclk_clk[i])) {
-			dev_err(&pdev->dev, "failed to get mclk%d clock: %ld\n",
+			dev_err(dev, "failed to get mclk%d clock: %ld\n",
 					i + 1, PTR_ERR(sai->mclk_clk[i]));
 			sai->mclk_clk[i] = NULL;
 		}
@@ -1068,10 +1069,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, fsl_sai_isr, IRQF_SHARED,
+	ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
 			       np->name, sai);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to claim irq %u\n", irq);
+		dev_err(dev, "failed to claim irq %u\n", irq);
 		return ret;
 	}
 
@@ -1088,7 +1089,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (of_find_property(np, "fsl,sai-synchronous-rx", NULL) &&
 	    of_find_property(np, "fsl,sai-asynchronous", NULL)) {
 		/* error out if both synchronous and asynchronous are present */
-		dev_err(&pdev->dev, "invalid binding for synchronous mode\n");
+		dev_err(dev, "invalid binding for synchronous mode\n");
 		return -EINVAL;
 	}
 
@@ -1109,7 +1110,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "fsl,imx6ul-sai")) {
 		gpr = syscon_regmap_lookup_by_compatible("fsl,imx6ul-iomuxc-gpr");
 		if (IS_ERR(gpr)) {
-			dev_err(&pdev->dev, "cannot find iomuxc registers\n");
+			dev_err(dev, "cannot find iomuxc registers\n");
 			return PTR_ERR(gpr);
 		}
 
@@ -1127,23 +1128,23 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
 
 	platform_set_drvdata(pdev, sai);
-	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = fsl_sai_runtime_resume(&pdev->dev);
+	pm_runtime_enable(dev);
+	if (!pm_runtime_enabled(dev)) {
+		ret = fsl_sai_runtime_resume(dev);
 		if (ret)
 			goto err_pm_disable;
 	}
 
-	ret = pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+		pm_runtime_put_noidle(dev);
 		goto err_pm_get_sync;
 	}
 
 	/* Get sai version */
-	ret = fsl_sai_check_version(&pdev->dev);
+	ret = fsl_sai_check_version(dev);
 	if (ret < 0)
-		dev_warn(&pdev->dev, "Error reading SAI version: %d\n", ret);
+		dev_warn(dev, "Error reading SAI version: %d\n", ret);
 
 	/* Select MCLK direction */
 	if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
@@ -1152,7 +1153,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
 	}
 
-	ret = pm_runtime_put_sync(&pdev->dev);
+	ret = pm_runtime_put_sync(dev);
 	if (ret < 0)
 		goto err_pm_get_sync;
 
@@ -1165,12 +1166,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		if (ret)
 			goto err_pm_get_sync;
 	} else {
-		ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+		ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
 		if (ret)
 			goto err_pm_get_sync;
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
+	ret = devm_snd_soc_register_component(dev, &fsl_component,
 					      &sai->cpu_dai_drv, 1);
 	if (ret)
 		goto err_pm_get_sync;
@@ -1178,10 +1179,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	return ret;
 
 err_pm_get_sync:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		fsl_sai_runtime_suspend(&pdev->dev);
+	if (!pm_runtime_status_suspended(dev))
+		fsl_sai_runtime_suspend(dev);
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.30.2


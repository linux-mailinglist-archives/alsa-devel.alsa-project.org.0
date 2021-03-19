Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3A4341741
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 09:21:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC791168C;
	Fri, 19 Mar 2021 09:21:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC791168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616142118;
	bh=XkWWgXiMiynNN4ute6qsTX13DCeUe8cjP6UXWK64IDw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J3SGhjfI3K39LRSXjPANpNGOZo604JaaRhDe2r7T+XkZNMD9SR50DrE8ma4t+EQa8
	 TZwHzy4AEaP7T/ulpC6b6CfkDrZwpUkXaBsVfDjFUqgYofTW4Kr4o1huZsjqzqlCgj
	 eKZmQTg9DGnj+7p/hyUXZEx/AW9ud5OqkmCPA43E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D188BF800BB;
	Fri, 19 Mar 2021 09:20:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24FABF8021C; Fri, 19 Mar 2021 09:20:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1F25F80124
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 09:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1F25F80124
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 196401A27C4;
 Fri, 19 Mar 2021 09:20:16 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2787B1A27CD;
 Fri, 19 Mar 2021 09:20:10 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EDDF94024E;
 Fri, 19 Mar 2021 09:20:02 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk
Date: Fri, 19 Mar 2021 16:06:43 +0800
Message-Id: <1616141203-13344-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

When there is power domain bind with bus clock,

The call flow:
devm_regmap_init_mmio_clk
   - clk_prepare()
      - clk_pm_runtime_get()

cause the power domain of clock always be enabled after
regmap_init(). which impact the power consumption.

So use devm_regmap_init_mmio instead of
devm_regmap_init_mmio_clk, then explicitly enable clock when
using by pm_runtime_get(), if CONFIG_PM=n, then
fsl_sai_runtime_resume will be explicitly called.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 48 +++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 9e7893f91882..f2c70a31c7bb 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -987,6 +987,9 @@ static int fsl_sai_check_version(struct device *dev)
 	return 0;
 }
 
+static int fsl_sai_runtime_suspend(struct device *dev);
+static int fsl_sai_runtime_resume(struct device *dev);
+
 static int fsl_sai_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1019,24 +1022,21 @@ static int fsl_sai_probe(struct platform_device *pdev)
 			ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);
 	}
 
-	sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
-			"bus", base, &fsl_sai_regmap_config);
-
-	/* Compatible with old DTB cases */
-	if (IS_ERR(sai->regmap) && PTR_ERR(sai->regmap) != -EPROBE_DEFER)
-		sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
-				"sai", base, &fsl_sai_regmap_config);
+	sai->regmap = devm_regmap_init_mmio(&pdev->dev, base, &fsl_sai_regmap_config);
 	if (IS_ERR(sai->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
 		return PTR_ERR(sai->regmap);
 	}
 
-	/* No error out for old DTB cases but only mark the clock NULL */
 	sai->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	/* Compatible with old DTB cases */
+	if (IS_ERR(sai->bus_clk) && PTR_ERR(sai->bus_clk) != -EPROBE_DEFER)
+		sai->bus_clk = devm_clk_get(&pdev->dev, "sai");
 	if (IS_ERR(sai->bus_clk)) {
 		dev_err(&pdev->dev, "failed to get bus clock: %ld\n",
 				PTR_ERR(sai->bus_clk));
-		sai->bus_clk = NULL;
+		/* -EPROBE_DEFER */
+		return PTR_ERR(sai->bus_clk);
 	}
 
 	for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
@@ -1117,6 +1117,18 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
 
 	platform_set_drvdata(pdev, sai);
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		ret = fsl_sai_runtime_resume(&pdev->dev);
+		if (ret)
+			goto err_pm_disable;
+	}
+
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto err_pm_get_sync;
+	}
 
 	/* Get sai version */
 	ret = fsl_sai_check_version(&pdev->dev);
@@ -1130,26 +1142,30 @@ static int fsl_sai_probe(struct platform_device *pdev)
 				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	regcache_cache_only(sai->regmap, true);
+	ret = pm_runtime_put_sync(&pdev->dev);
+	if (ret < 0)
+		goto err_pm_get_sync;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
 					      &sai->cpu_dai_drv, 1);
 	if (ret)
-		goto err_pm_disable;
+		goto err_pm_get_sync;
 
 	if (sai->soc_data->use_imx_pcm) {
 		ret = imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
 		if (ret)
-			goto err_pm_disable;
+			goto err_pm_get_sync;
 	} else {
 		ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 		if (ret)
-			goto err_pm_disable;
+			goto err_pm_get_sync;
 	}
 
 	return ret;
 
+err_pm_get_sync:
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_sai_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
@@ -1159,6 +1175,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 static int fsl_sai_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_sai_runtime_suspend(&pdev->dev);
 
 	return 0;
 }
@@ -1219,7 +1237,6 @@ static const struct of_device_id fsl_sai_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
 
-#ifdef CONFIG_PM
 static int fsl_sai_runtime_suspend(struct device *dev)
 {
 	struct fsl_sai *sai = dev_get_drvdata(dev);
@@ -1292,7 +1309,6 @@ static int fsl_sai_runtime_resume(struct device *dev)
 
 	return ret;
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_sai_pm_ops = {
 	SET_RUNTIME_PM_OPS(fsl_sai_runtime_suspend,
-- 
2.27.0


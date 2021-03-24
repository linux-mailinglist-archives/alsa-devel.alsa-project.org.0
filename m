Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0224934759E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 11:14:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 804AE1678;
	Wed, 24 Mar 2021 11:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 804AE1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616580879;
	bh=VUvfQr5YDTKJ4ZK0gM1L/vV+Zl745EKeuxRJgCsH7Jk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ctSwt/3QP8e6BOEQwxzj03851aCqOdishnaNyPsbn8wEcorkFwC78i3ohKOohVHW8
	 zC1A1lAKj8CKwHtQHs8WiPIPjLnUL/H+WV436+1ap7V+t2p47o6qd2qKvWvcBScDnz
	 M/yqRPFRPr9JBN7E87kaKmIBvkx/5jrA3TJ7K24o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F243AF80240;
	Wed, 24 Mar 2021 11:13:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0302F8025D; Wed, 24 Mar 2021 11:13:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 665F4F80156
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 11:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 665F4F80156
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B1CC5202742;
 Wed, 24 Mar 2021 11:13:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6F108202739;
 Wed, 24 Mar 2021 11:12:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C910D40339;
 Wed, 24 Mar 2021 11:12:30 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 1/6] ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk
Date: Wed, 24 Mar 2021 17:58:43 +0800
Message-Id: <1616579928-22428-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
References: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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
devm_regmap_init_mmio_clk,but explicitly enable
clock when it is used.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 48 ++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 41b154417b92..c0d4f3c5dbb1 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -945,6 +945,9 @@ static const struct regmap_config fsl_esai_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static int fsl_esai_runtime_resume(struct device *dev);
+static int fsl_esai_runtime_suspend(struct device *dev);
+
 static int fsl_esai_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -969,8 +972,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	esai_priv->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
-			"core", regs, &fsl_esai_regmap_config);
+	esai_priv->regmap = devm_regmap_init_mmio(&pdev->dev, regs, &fsl_esai_regmap_config);
 	if (IS_ERR(esai_priv->regmap)) {
 		dev_err(&pdev->dev, "failed to init regmap: %ld\n",
 				PTR_ERR(esai_priv->regmap));
@@ -1039,11 +1041,23 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	}
 
 	dev_set_drvdata(&pdev->dev, esai_priv);
-
 	spin_lock_init(&esai_priv->lock);
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		ret = fsl_esai_runtime_resume(&pdev->dev);
+		if (ret)
+			goto err_pm_disable;
+	}
+
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto err_pm_get_sync;
+	}
+
 	ret = fsl_esai_hw_init(esai_priv);
 	if (ret)
-		return ret;
+		goto err_pm_get_sync;
 
 	esai_priv->tx_mask = 0xFFFFFFFF;
 	esai_priv->rx_mask = 0xFFFFFFFF;
@@ -1054,24 +1068,33 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	regmap_write(esai_priv->regmap, REG_ESAI_RSMA, 0);
 	regmap_write(esai_priv->regmap, REG_ESAI_RSMB, 0);
 
+	ret = pm_runtime_put_sync(&pdev->dev);
+	if (ret < 0)
+		goto err_pm_get_sync;
+
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_esai_component,
 					      &fsl_esai_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DAI: %d\n", ret);
-		return ret;
+		goto err_pm_get_sync;
 	}
 
 	INIT_WORK(&esai_priv->work, fsl_esai_hw_reset);
 
-	pm_runtime_enable(&pdev->dev);
-
-	regcache_cache_only(esai_priv->regmap, true);
-
 	ret = imx_pcm_dma_init(pdev, IMX_ESAI_DMABUF_SIZE);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev, "failed to init imx pcm dma: %d\n", ret);
+		goto err_pm_get_sync;
+	}
 
 	return ret;
+
+err_pm_get_sync:
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_esai_runtime_suspend(&pdev->dev);
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static int fsl_esai_remove(struct platform_device *pdev)
@@ -1079,6 +1102,9 @@ static int fsl_esai_remove(struct platform_device *pdev)
 	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_esai_runtime_suspend(&pdev->dev);
+
 	cancel_work_sync(&esai_priv->work);
 
 	return 0;
@@ -1092,7 +1118,6 @@ static const struct of_device_id fsl_esai_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
 
-#ifdef CONFIG_PM
 static int fsl_esai_runtime_resume(struct device *dev)
 {
 	struct fsl_esai *esai = dev_get_drvdata(dev);
@@ -1160,7 +1185,6 @@ static int fsl_esai_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_esai_pm_ops = {
 	SET_RUNTIME_PM_OPS(fsl_esai_runtime_suspend,
-- 
2.27.0


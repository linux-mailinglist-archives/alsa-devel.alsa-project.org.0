Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C1200345
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 10:07:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57056167E;
	Fri, 19 Jun 2020 10:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57056167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592554062;
	bh=4+jSU+oBfzLN8cEn2RNN6AwAIbMe2qbkGLK6nh2ym58=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OJMzVuuoL+XbdcCwWdJsVPe6IhBskjL7DOW5eC0JSNbYuKC8q2h4hyNxZuv1aB5Fx
	 S6Rm2vr5T26SJcTQc+KABACcO/9U4RFwslqVKpxKfPOlRcMU92aPDjfqb9+jVQ1sEB
	 iuiB4NksSn/L7hNlKx63iJt2RMe/wqe0sQDYZ+kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 748ACF800B5;
	Fri, 19 Jun 2020 10:06:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C278F80252; Fri, 19 Jun 2020 10:05:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73370F800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 10:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73370F800EF
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B62A9200FB1;
 Fri, 19 Jun 2020 10:05:50 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E779200FA6;
 Fri, 19 Jun 2020 10:05:46 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E2F67402B1;
 Fri, 19 Jun 2020 16:05:40 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: fsl_spdif: Add pm runtime function
Date: Fri, 19 Jun 2020 15:54:33 +0800
Message-Id: <579c0d71e976f34f23f40daa9f1aa06c4baca2f1.1592552389.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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

Add pm runtime support and move clock handling there.
Close the clocks at suspend to reduce the power consumption.

fsl_spdif_suspend is replaced by pm_runtime_force_suspend.
fsl_spdif_resume is replaced by pm_runtime_force_resume.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
changes in v2
- remove goto in startup()
- remove goto disable_spba_clk
- Add Acked-by: Nicolin Chen

 sound/soc/fsl/fsl_spdif.c | 117 ++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 50 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 5bc0e4729341..5b2689ae63d4 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -16,6 +16,7 @@
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/regmap.h>
+#include <linux/pm_runtime.h>
 
 #include <sound/asoundef.h>
 #include <sound/dmaengine_pcm.h>
@@ -495,29 +496,14 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,
 	struct platform_device *pdev = spdif_priv->pdev;
 	struct regmap *regmap = spdif_priv->regmap;
 	u32 scr, mask;
-	int i;
 	int ret;
 
 	/* Reset module and interrupts only for first initialization */
 	if (!snd_soc_dai_active(cpu_dai)) {
-		ret = clk_prepare_enable(spdif_priv->coreclk);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to enable core clock\n");
-			return ret;
-		}
-
-		if (!IS_ERR(spdif_priv->spbaclk)) {
-			ret = clk_prepare_enable(spdif_priv->spbaclk);
-			if (ret) {
-				dev_err(&pdev->dev, "failed to enable spba clock\n");
-				goto err_spbaclk;
-			}
-		}
-
 		ret = spdif_softreset(spdif_priv);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to soft reset\n");
-			goto err;
+			return ret;
 		}
 
 		/* Disable all the interrupts */
@@ -531,18 +517,10 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,
 		mask = SCR_TXFIFO_AUTOSYNC_MASK | SCR_TXFIFO_CTRL_MASK |
 			SCR_TXSEL_MASK | SCR_USRC_SEL_MASK |
 			SCR_TXFIFO_FSEL_MASK;
-		for (i = 0; i < SPDIF_TXRATE_MAX; i++) {
-			ret = clk_prepare_enable(spdif_priv->txclk[i]);
-			if (ret)
-				goto disable_txclk;
-		}
 	} else {
 		scr = SCR_RXFIFO_FSEL_IF8 | SCR_RXFIFO_AUTOSYNC;
 		mask = SCR_RXFIFO_FSEL_MASK | SCR_RXFIFO_AUTOSYNC_MASK|
 			SCR_RXFIFO_CTL_MASK | SCR_RXFIFO_OFF_MASK;
-		ret = clk_prepare_enable(spdif_priv->rxclk);
-		if (ret)
-			goto err;
 	}
 	regmap_update_bits(regmap, REG_SPDIF_SCR, mask, scr);
 
@@ -550,17 +528,6 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,
 	regmap_update_bits(regmap, REG_SPDIF_SCR, SCR_LOW_POWER, 0);
 
 	return 0;
-
-disable_txclk:
-	for (i--; i >= 0; i--)
-		clk_disable_unprepare(spdif_priv->txclk[i]);
-err:
-	if (!IS_ERR(spdif_priv->spbaclk))
-		clk_disable_unprepare(spdif_priv->spbaclk);
-err_spbaclk:
-	clk_disable_unprepare(spdif_priv->coreclk);
-
-	return ret;
 }
 
 static void fsl_spdif_shutdown(struct snd_pcm_substream *substream,
@@ -569,20 +536,17 @@ static void fsl_spdif_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct regmap *regmap = spdif_priv->regmap;
-	u32 scr, mask, i;
+	u32 scr, mask;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		scr = 0;
 		mask = SCR_TXFIFO_AUTOSYNC_MASK | SCR_TXFIFO_CTRL_MASK |
 			SCR_TXSEL_MASK | SCR_USRC_SEL_MASK |
 			SCR_TXFIFO_FSEL_MASK;
-		for (i = 0; i < SPDIF_TXRATE_MAX; i++)
-			clk_disable_unprepare(spdif_priv->txclk[i]);
 	} else {
 		scr = SCR_RXFIFO_OFF | SCR_RXFIFO_CTL_ZERO;
 		mask = SCR_RXFIFO_FSEL_MASK | SCR_RXFIFO_AUTOSYNC_MASK|
 			SCR_RXFIFO_CTL_MASK | SCR_RXFIFO_OFF_MASK;
-		clk_disable_unprepare(spdif_priv->rxclk);
 	}
 	regmap_update_bits(regmap, REG_SPDIF_SCR, mask, scr);
 
@@ -591,9 +555,6 @@ static void fsl_spdif_shutdown(struct snd_pcm_substream *substream,
 		spdif_intr_status_clear(spdif_priv);
 		regmap_update_bits(regmap, REG_SPDIF_SCR,
 				SCR_LOW_POWER, SCR_LOW_POWER);
-		if (!IS_ERR(spdif_priv->spbaclk))
-			clk_disable_unprepare(spdif_priv->spbaclk);
-		clk_disable_unprepare(spdif_priv->coreclk);
 	}
 }
 
@@ -1350,6 +1311,8 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 
 	/* Register with ASoC */
 	dev_set_drvdata(&pdev->dev, spdif_priv);
+	pm_runtime_enable(&pdev->dev);
+	regcache_cache_only(spdif_priv->regmap, true);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_spdif_component,
 					      &spdif_priv->cpu_dai_drv, 1);
@@ -1365,36 +1328,90 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	return ret;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int fsl_spdif_suspend(struct device *dev)
+#ifdef CONFIG_PM
+static int fsl_spdif_runtime_suspend(struct device *dev)
 {
 	struct fsl_spdif_priv *spdif_priv = dev_get_drvdata(dev);
+	int i;
 
 	regmap_read(spdif_priv->regmap, REG_SPDIF_SRPC,
 			&spdif_priv->regcache_srpc);
-
 	regcache_cache_only(spdif_priv->regmap, true);
-	regcache_mark_dirty(spdif_priv->regmap);
+
+	clk_disable_unprepare(spdif_priv->rxclk);
+
+	for (i = 0; i < SPDIF_TXRATE_MAX; i++)
+		clk_disable_unprepare(spdif_priv->txclk[i]);
+
+	if (!IS_ERR(spdif_priv->spbaclk))
+		clk_disable_unprepare(spdif_priv->spbaclk);
+	clk_disable_unprepare(spdif_priv->coreclk);
 
 	return 0;
 }
 
-static int fsl_spdif_resume(struct device *dev)
+static int fsl_spdif_runtime_resume(struct device *dev)
 {
 	struct fsl_spdif_priv *spdif_priv = dev_get_drvdata(dev);
+	int ret;
+	int i;
+
+	ret = clk_prepare_enable(spdif_priv->coreclk);
+	if (ret) {
+		dev_err(dev, "failed to enable core clock\n");
+		return ret;
+	}
+
+	if (!IS_ERR(spdif_priv->spbaclk)) {
+		ret = clk_prepare_enable(spdif_priv->spbaclk);
+		if (ret) {
+			dev_err(dev, "failed to enable spba clock\n");
+			goto disable_core_clk;
+		}
+	}
+
+	for (i = 0; i < SPDIF_TXRATE_MAX; i++) {
+		ret = clk_prepare_enable(spdif_priv->txclk[i]);
+		if (ret)
+			goto disable_tx_clk;
+	}
+
+	ret = clk_prepare_enable(spdif_priv->rxclk);
+	if (ret)
+		goto disable_tx_clk;
 
 	regcache_cache_only(spdif_priv->regmap, false);
+	regcache_mark_dirty(spdif_priv->regmap);
 
 	regmap_update_bits(spdif_priv->regmap, REG_SPDIF_SRPC,
 			SRPC_CLKSRC_SEL_MASK | SRPC_GAINSEL_MASK,
 			spdif_priv->regcache_srpc);
 
-	return regcache_sync(spdif_priv->regmap);
+	ret = regcache_sync(spdif_priv->regmap);
+	if (ret)
+		goto disable_rx_clk;
+
+	return 0;
+
+disable_rx_clk:
+	clk_disable_unprepare(spdif_priv->rxclk);
+disable_tx_clk:
+	for (i--; i >= 0; i--)
+		clk_disable_unprepare(spdif_priv->txclk[i]);
+	if (!IS_ERR(spdif_priv->spbaclk))
+		clk_disable_unprepare(spdif_priv->spbaclk);
+disable_core_clk:
+	clk_disable_unprepare(spdif_priv->coreclk);
+
+	return ret;
 }
-#endif /* CONFIG_PM_SLEEP */
+#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_spdif_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(fsl_spdif_suspend, fsl_spdif_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(fsl_spdif_runtime_suspend, fsl_spdif_runtime_resume,
+			   NULL)
 };
 
 static const struct of_device_id fsl_spdif_dt_ids[] = {
-- 
2.21.0


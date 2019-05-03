Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D51342D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 21:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 234231818;
	Fri,  3 May 2019 21:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 234231818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556913201;
	bh=T4TjRAbVItLctjsfiiIVPnu7AfzuVjvR09wC1rWoOFI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WBt4JjE2Pwh4dBAlk61UHH4FWq4dYWRXYIeYmt6SVyaQvQ9FF5MJb02N1s3oH4MiN
	 8k3uqT33A04RVbakjArjBXambmne/bQOMOOLjc1MCLKhkVxjqFCDkIcBLLp7XoisEP
	 YL9ketSpVcIeJ/cluKzC0u9MzAdDkeZBlEthbThw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83CE3F896B7;
	Fri,  3 May 2019 21:51:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80DCFF896B7; Fri,  3 May 2019 21:51:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A24CF8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 21:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A24CF8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GljJZ9N7"
Received: by mail-pl1-x642.google.com with SMTP id n8so3165741plp.10
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 12:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oURhlb5Aq9SaUVoif2dSxrv9s2KPP5nkbzDOYxcW5t4=;
 b=GljJZ9N7mNb0c6pode6JDkzgqypvgh7E2eWq7t+RiAmxBkikwIJwsGSF6C8yvK59qr
 DE8eoootNALUUCkGC+eQU11sUUgoNBlDOJmLJsncOhpaDDAJBTQofjbIirbBw4VDm1SQ
 gb2R+LGDzDqfmdq5i1TDW3KzL9JgGonAinjXqG+3VYmeHODFNxExO/c5WREVeCD3eFFj
 3HMo8xnKvV1owAymU15EzY4XLBsVPQJ3xVMkBOtBxZ8P6VdhQ7zei1RNFikwY2GcpuWU
 tIQHXIhSvwTgQXOr9dFSYMrSsQ3FVUM7yNHVvwKp65DdpHLNHaGT/WhnGGWmoRNnb7gP
 QJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oURhlb5Aq9SaUVoif2dSxrv9s2KPP5nkbzDOYxcW5t4=;
 b=cIy15NNR/7RXr1ywRokO36VyNpShe9A+uj5rnDJjTDFH0V6ZbLfv9pljOd3O+NvubJ
 kQOwUViqSJHeSWlhQT7sN8OaFKebWigU3HgX4avv8IAHkZqdnb2SEFLUQPk72ABOp+cM
 JBFxz8SvX8HhXm1yABauqKRSQwEijGgCo6J6mQagh1Pk64bJLXm9ULEZgIwJZtl4upf4
 rph5V5aDeVVTj81Gq0fWBk8ziHwu7rS3G3cy/ICn/oMhrMIr3BxZ/FOyvFN0Gp2DYNQb
 L2JbKM+X/S0vc+/EyqniPcDzqN4RF76gw2Mgz3kLV7L6BDpYOck3wFhOg9P0Gdlq78IB
 IP1Q==
X-Gm-Message-State: APjAAAVKDv92ruDp0HV/2kSvgoonmI80oTPsxrYmV76fxGIOYJaqltdP
 Vfotu/PiLdUzOJ+U9RQ9gsw=
X-Google-Smtp-Source: APXvYqwBxUSMKP2ysln1UGkYugPUj1P2Ive1cWLW6Xlf/e/kJ7WE0YBP+jPmBn4UBUEgjvAVosqoHQ==
X-Received: by 2002:a17:902:bf44:: with SMTP id
 u4mr12895446pls.171.1556913089078; 
 Fri, 03 May 2019 12:51:29 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id g24sm4911590pfi.126.2019.05.03.12.51.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 12:51:28 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: broonie@kernel.org,
	shengjiu.wang@nxp.com
Date: Fri,  3 May 2019 12:49:44 -0700
Message-Id: <20190503194944.30167-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, timur@kernel.org, lgirdwood@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, tiwai@suse.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v5] ASoC: fsl_esai: Add pm runtime function
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

From: "S.j. Wang" <shengjiu.wang@nxp.com>

Add pm runtime support and move clock handling there.
Close the clocks at suspend to reduce the power consumption.

fsl_esai_suspend is replaced by pm_runtime_force_suspend.
fsl_esai_resume is replaced by pm_runtime_force_resume.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changes in v5
-Replaced my Acked-by with Signed-off-by as a resend.

Changes in v4
-resend base on for-5.2

Changes in v3
-refine the commit comments.
-add acked-by

Changes in v2
-refine the commit comments.
-move regcache_mark_dirty to runtime suspend.

 sound/soc/fsl/fsl_esai.c | 141 +++++++++++++++++++++------------------
 1 file changed, 77 insertions(+), 64 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index c7410bbfd2af..022368c8a074 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 
@@ -466,30 +467,6 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
-	int ret;
-
-	/*
-	 * Some platforms might use the same bit to gate all three or two of
-	 * clocks, so keep all clocks open/close at the same time for safety
-	 */
-	ret = clk_prepare_enable(esai_priv->coreclk);
-	if (ret)
-		return ret;
-	if (!IS_ERR(esai_priv->spbaclk)) {
-		ret = clk_prepare_enable(esai_priv->spbaclk);
-		if (ret)
-			goto err_spbaclk;
-	}
-	if (!IS_ERR(esai_priv->extalclk)) {
-		ret = clk_prepare_enable(esai_priv->extalclk);
-		if (ret)
-			goto err_extalck;
-	}
-	if (!IS_ERR(esai_priv->fsysclk)) {
-		ret = clk_prepare_enable(esai_priv->fsysclk);
-		if (ret)
-			goto err_fsysclk;
-	}
 
 	if (!dai->active) {
 		/* Set synchronous mode */
@@ -506,16 +483,6 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 
 	return 0;
 
-err_fsysclk:
-	if (!IS_ERR(esai_priv->extalclk))
-		clk_disable_unprepare(esai_priv->extalclk);
-err_extalck:
-	if (!IS_ERR(esai_priv->spbaclk))
-		clk_disable_unprepare(esai_priv->spbaclk);
-err_spbaclk:
-	clk_disable_unprepare(esai_priv->coreclk);
-
-	return ret;
 }
 
 static int fsl_esai_hw_params(struct snd_pcm_substream *substream,
@@ -576,20 +543,6 @@ static int fsl_esai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static void fsl_esai_shutdown(struct snd_pcm_substream *substream,
-			      struct snd_soc_dai *dai)
-{
-	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
-
-	if (!IS_ERR(esai_priv->fsysclk))
-		clk_disable_unprepare(esai_priv->fsysclk);
-	if (!IS_ERR(esai_priv->extalclk))
-		clk_disable_unprepare(esai_priv->extalclk);
-	if (!IS_ERR(esai_priv->spbaclk))
-		clk_disable_unprepare(esai_priv->spbaclk);
-	clk_disable_unprepare(esai_priv->coreclk);
-}
-
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 			    struct snd_soc_dai *dai)
 {
@@ -658,7 +611,6 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.startup = fsl_esai_startup,
-	.shutdown = fsl_esai_shutdown,
 	.trigger = fsl_esai_trigger,
 	.hw_params = fsl_esai_hw_params,
 	.set_sysclk = fsl_esai_set_dai_sysclk,
@@ -947,6 +899,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pm_runtime_enable(&pdev->dev);
+
+	regcache_cache_only(esai_priv->regmap, true);
+
 	ret = imx_pcm_dma_init(pdev, IMX_ESAI_DMABUF_SIZE);
 	if (ret)
 		dev_err(&pdev->dev, "failed to init imx pcm dma: %d\n", ret);
@@ -954,6 +910,13 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int fsl_esai_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
 static const struct of_device_id fsl_esai_dt_ids[] = {
 	{ .compatible = "fsl,imx35-esai", },
 	{ .compatible = "fsl,vf610-esai", },
@@ -961,22 +924,35 @@ static const struct of_device_id fsl_esai_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
 
-#ifdef CONFIG_PM_SLEEP
-static int fsl_esai_suspend(struct device *dev)
-{
-	struct fsl_esai *esai = dev_get_drvdata(dev);
-
-	regcache_cache_only(esai->regmap, true);
-	regcache_mark_dirty(esai->regmap);
-
-	return 0;
-}
-
-static int fsl_esai_resume(struct device *dev)
+#ifdef CONFIG_PM
+static int fsl_esai_runtime_resume(struct device *dev)
 {
 	struct fsl_esai *esai = dev_get_drvdata(dev);
 	int ret;
 
+	/*
+	 * Some platforms might use the same bit to gate all three or two of
+	 * clocks, so keep all clocks open/close at the same time for safety
+	 */
+	ret = clk_prepare_enable(esai->coreclk);
+	if (ret)
+		return ret;
+	if (!IS_ERR(esai->spbaclk)) {
+		ret = clk_prepare_enable(esai->spbaclk);
+		if (ret)
+			goto err_spbaclk;
+	}
+	if (!IS_ERR(esai->extalclk)) {
+		ret = clk_prepare_enable(esai->extalclk);
+		if (ret)
+			goto err_extalclk;
+	}
+	if (!IS_ERR(esai->fsysclk)) {
+		ret = clk_prepare_enable(esai->fsysclk);
+		if (ret)
+			goto err_fsysclk;
+	}
+
 	regcache_cache_only(esai->regmap, false);
 
 	/* FIFO reset for safety */
@@ -987,22 +963,59 @@ static int fsl_esai_resume(struct device *dev)
 
 	ret = regcache_sync(esai->regmap);
 	if (ret)
-		return ret;
+		goto err_regcache_sync;
 
 	/* FIFO reset done */
 	regmap_update_bits(esai->regmap, REG_ESAI_TFCR, ESAI_xFCR_xFR, 0);
 	regmap_update_bits(esai->regmap, REG_ESAI_RFCR, ESAI_xFCR_xFR, 0);
 
+	return 0;
+
+err_regcache_sync:
+	if (!IS_ERR(esai->fsysclk))
+		clk_disable_unprepare(esai->fsysclk);
+err_fsysclk:
+	if (!IS_ERR(esai->extalclk))
+		clk_disable_unprepare(esai->extalclk);
+err_extalclk:
+	if (!IS_ERR(esai->spbaclk))
+		clk_disable_unprepare(esai->spbaclk);
+err_spbaclk:
+	clk_disable_unprepare(esai->coreclk);
+
+	return ret;
+}
+
+static int fsl_esai_runtime_suspend(struct device *dev)
+{
+	struct fsl_esai *esai = dev_get_drvdata(dev);
+
+	regcache_cache_only(esai->regmap, true);
+	regcache_mark_dirty(esai->regmap);
+
+	if (!IS_ERR(esai->fsysclk))
+		clk_disable_unprepare(esai->fsysclk);
+	if (!IS_ERR(esai->extalclk))
+		clk_disable_unprepare(esai->extalclk);
+	if (!IS_ERR(esai->spbaclk))
+		clk_disable_unprepare(esai->spbaclk);
+	clk_disable_unprepare(esai->coreclk);
+
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
+#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_esai_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(fsl_esai_suspend, fsl_esai_resume)
+	SET_RUNTIME_PM_OPS(fsl_esai_runtime_suspend,
+			   fsl_esai_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver fsl_esai_driver = {
 	.probe = fsl_esai_probe,
+	.remove = fsl_esai_remove,
 	.driver = {
 		.name = "fsl-esai-dai",
 		.pm = &fsl_esai_pm_ops,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

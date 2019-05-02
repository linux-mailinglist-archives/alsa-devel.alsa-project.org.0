Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0103211176
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:27:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83FD71740;
	Thu,  2 May 2019 04:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83FD71740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764044;
	bh=leEVeTK69jou9RoIoe5u+qtV1GhUnjgnsyOXxi45uVw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QNl/ef6oGsxZjTijp+1U36qo7VQ5UNA3pMVPGZ6HYm8bz5XCOY4sqPAPq4+xLLVGh
	 6PjjyBWut7rjQIBOYvTUkOqjbMg/aq62KFeAULo7zJ5KCqC5XEKxPn6KBY0ErufRwj
	 0KQlWGpI2vt3lBbtiy33Y6vglaIxraJnNP7ti7xE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF7B6F89727;
	Thu,  2 May 2019 04:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 648FFF89743; Thu,  2 May 2019 04:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64D8EF89728
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64D8EF89728
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ARaAlXFR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=s0xnioo6H/WpOu+7aw/19xor40aiR1IDnjjrVxF3jSQ=; b=ARaAlXFRiFSs
 cGcD6N/DIV1qNk7j8FThiRNStgE+hKX+yg266NVmQ4lWdbGl1cqelO94TVxA5Btx+pHJSL9QjhUMO
 o5gRvnxlHqVC3ILzuomO3vKrn2XsuXkDOcYrQS9st/HkbZ50/eNl9DZ+WtCFC28l42wG6ZantqZDJ
 MhkBg=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1If-0005r0-5D; Thu, 02 May 2019 02:18:17 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id D528D441D3E; Thu,  2 May 2019 03:18:13 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Viorel Suman <viorel.suman@nxp.com>
In-Reply-To: 
X-Patchwork-Hint: ignore
Message-Id: <20190502021813.D528D441D3E@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:13 +0100 (BST)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl_audmix: remove "model" attribute"
	to the asoc tree
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

   ASoC: fsl_audmix: remove "model" attribute

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

From f2a36a78423ee83b1aac79956891fcad0e833885 Mon Sep 17 00:00:00 2001
From: Viorel Suman <viorel.suman@nxp.com>
Date: Wed, 10 Apr 2019 11:06:36 +0000
Subject: [PATCH] ASoC: fsl_audmix: remove "model" attribute

Use "of_device_id.data" to specify the machine driver
instead of "model" DTS attribute.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_audmix.c | 43 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index dabde0342c95..dc802d5c4ccd 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -445,13 +445,29 @@ static const struct regmap_config fsl_audmix_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct of_device_id fsl_audmix_ids[] = {
+	{
+		.compatible = "fsl,imx8qm-audmix",
+		.data = "imx-audmix",
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, fsl_audmix_ids);
+
 static int fsl_audmix_probe(struct platform_device *pdev)
 {
 	struct fsl_audmix *priv;
 	struct resource *res;
+	const char *mdrv;
+	const struct of_device_id *of_id;
 	void __iomem *regs;
 	int ret;
-	const char *sprop;
+
+	of_id = of_match_device(fsl_audmix_ids, &pdev->dev);
+	if (!of_id || !of_id->data)
+		return -EINVAL;
+
+	mdrv = of_id->data;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -487,19 +503,12 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	sprop = of_get_property(pdev->dev.of_node, "model", NULL);
-	if (sprop) {
-		priv->pdev = platform_device_register_data(&pdev->dev, sprop, 0,
-							   NULL, 0);
-		if (IS_ERR(priv->pdev)) {
-			ret = PTR_ERR(priv->pdev);
-			dev_err(&pdev->dev,
-				"failed to register platform %s: %d\n", sprop,
-				 ret);
-		}
-	} else {
-		dev_err(&pdev->dev, "[model] attribute missing.\n");
-		ret = -EINVAL;
+	priv->pdev = platform_device_register_data(&pdev->dev, mdrv, 0, NULL,
+						   0);
+	if (IS_ERR(priv->pdev)) {
+		ret = PTR_ERR(priv->pdev);
+		dev_err(&pdev->dev, "failed to register platform %s: %d\n",
+			mdrv, ret);
 	}
 
 	return ret;
@@ -553,12 +562,6 @@ static const struct dev_pm_ops fsl_audmix_pm = {
 				pm_runtime_force_resume)
 };
 
-static const struct of_device_id fsl_audmix_ids[] = {
-	{ .compatible = "fsl,imx8qm-audmix", },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, fsl_audmix_ids);
-
 static struct platform_driver fsl_audmix_driver = {
 	.probe = fsl_audmix_probe,
 	.remove = fsl_audmix_remove,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

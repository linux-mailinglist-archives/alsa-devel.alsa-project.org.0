Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CD0B4C0
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 04:27:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8241F853;
	Sun, 28 Apr 2019 04:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8241F853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556418425;
	bh=Wo4v9LlmUaMvo7gFcAGoNHaR1SwXINOFJ2+2oddRo3U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cU00v8+RRtBJ/WdthSdYl2Up5o08VfEPMNfsQcGTKJ81BkFh7/8xRR/2o2jM99hcG
	 3CGYCbe1ONg83O0GWwNA8vPAx9TZgjkCg+tCmtO6e38d4Ql0P+KKGLFEkPVDHCSoV/
	 nW4tYaZoMxcnpVHxXMkEIgx9ZKWGGQEfNKPHQa/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1526F896F9;
	Sun, 28 Apr 2019 04:25:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 304D0F896F0; Sun, 28 Apr 2019 04:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140052.outbound.protection.outlook.com [40.107.14.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76742F80C0D
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 04:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76742F80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="J3XjuV1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ajg3y0U6774TmGJ5Tbqd6OtVbVgqMwZUNYvR+s1VHBw=;
 b=J3XjuV1MUaDSGfPtQuXgELeD2VlRAuRs9cXkmzgNQh1kXz/x6doHoXezUL3jIOponk3fQBSTCEU9DiBt6uMzQ4fse8aSikd5TlHQ/p1g0YVQwCHUrmf0L3wsXrIcL4QFfDeskCFvF2orwigObH47QPMcGGYA/zJLOiRHd+dtkZM=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6527.eurprd04.prod.outlook.com (20.179.233.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:24:54 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311%7]) with mapi id 15.20.1835.016; Sun, 28 Apr 2019
 02:24:54 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH V4] ASoC: fsl_esai: Add pm runtime function
Thread-Index: AQHU/WmQi9S3A4SFvU+3BSdrbwsfSA==
Date: Sun, 28 Apr 2019 02:24:54 +0000
Message-ID: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 1.9.1
x-clientproxiedby: HK2PR02CA0167.apcprd02.prod.outlook.com
 (2603:1096:201:1f::27) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cc79b67-dc05-474d-7d54-08d6cb80b2e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6527; 
x-ms-traffictypediagnostic: VE1PR04MB6527:
x-microsoft-antispam-prvs: <VE1PR04MB65275F429A9919F8E6337A31E3380@VE1PR04MB6527.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:305;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(366004)(376002)(39860400002)(189003)(199004)(7736002)(99286004)(71190400001)(86362001)(14454004)(68736007)(6486002)(118296001)(478600001)(110136005)(36756003)(486006)(81166006)(54906003)(8676002)(2201001)(71200400001)(476003)(3846002)(6116002)(2616005)(8936002)(81156014)(5660300002)(25786009)(4326008)(50226002)(102836004)(386003)(64756008)(186003)(14444005)(256004)(66476007)(6506007)(66446008)(73956011)(6512007)(66066001)(66556008)(66946007)(26005)(305945005)(2906002)(2501003)(53936002)(97736004)(52116002)(6436002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6527;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PK8+2jz+hd3iR7tu2+h4O48waeonntYliKsgNgh5hO3dtwIkjUwwdfh0N2d/AE0aF3Iq6c/w2LlksZLRrGE+Lj5c4fhZ3JDRz5CZbzzyuD5qh8BoVBJku7p8iGXB7HA4sSDBFc87aIN6Q2KGhh5JmCOhHANaPSpGL4pSjcV8/VPHM4ky9Y/GGuUFVHo+12fUORoPCd0JMCr93jTN6vJ4wQvATZE9gG4Rn+BGylcygIhySRpIapsduBkCkkOLndU7V5oO6ChfqK8h0KqGZgqxGHEsB/He9Vw00KvX3naqH03EEg7vP/TKOr1n0GD6CfKKVWnXmjGU+voPJHO6xCo2WjxlwdTpv9qprtnZAsi6i6K5XTCMRBT9hUHXU6LQ2AA7Kt3cNfvhR8DVc3/QyYlq+pTWjBdGpO2l61O5zLbPE+s=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc79b67-dc05-474d-7d54-08d6cb80b2e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:24:54.1686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6527
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH V4] ASoC: fsl_esai: Add pm runtime function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add pm runtime support and move clock handling there.
Close the clocks at suspend to reduce the power consumption.

fsl_esai_suspend is replaced by pm_runtime_force_suspend.
fsl_esai_resume is replaced by pm_runtime_force_resume.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changes in v4
-resend base on for-5.2

Changes in v3
-refine the commit comments.
-add acked-by

Changes in v2
-refine the commit comments.
-move regcache_mark_dirty to runtime suspend.

 sound/soc/fsl/fsl_esai.c | 141 ++++++++++++++++++++++++++---------------------
 1 file changed, 77 insertions(+), 64 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bad0dfed6b68..10d2210c91ef 100644
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
@@ -961,22 +924,35 @@ static int fsl_esai_probe(struct platform_device *pdev)
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
 
 	return 0;
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
 }
-#endif /* CONFIG_PM_SLEEP */
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
+	return 0;
+}
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
1.9.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

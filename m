Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D956BAD8
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 12:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 081801689;
	Wed, 17 Jul 2019 12:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 081801689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563361156;
	bh=JN9pMqDpukd81ZOtfhqQgkCMCD39CpDrubOwg/X3oro=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YuQJQFcHBG9zA8XhCmYfZo3O/jRlKnNvb2i242KH5e0V3gTQTjUqj+knAF7uZj3oD
	 Bfh18D99RNO93OqbaEFtiE612ViEMJrm0JnyupZKaMPMJsNVis9meTrKBBeT+zYBq4
	 imwNeV9hFN/Xc5Ydh8i0uPZu/yfTl6Ra1ftFFcUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94890F803CF;
	Wed, 17 Jul 2019 12:56:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CB62F8015B; Wed, 17 Jul 2019 12:56:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9ED9F800C4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 12:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9ED9F800C4
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hnhbx-0000LT-N6; Wed, 17 Jul 2019 12:56:37 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 17 Jul 2019 12:56:33 +0200
Message-Id: <20190717105635.18514-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717105635.18514-1-l.stach@pengutronix.de>
References: <20190717105635.18514-1-l.stach@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Angus Ainslie <angus@akkea.ca>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [alsa-devel] [PATCH 1/3] ASoC: fsl_sai: add of_match data
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

New revisions of the SAI IP block have even more differences that need
be taken into account by the driver. To avoid sprinking compatible
checks all over the driver move the current differences into of_match_data.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 22 ++++++++++++++--------
 sound/soc/fsl/fsl_sai.h |  6 +++++-
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 812c94fbb160..3a1ed8b857d6 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -9,6 +9,7 @@
 #include <linux/dmaengine.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -798,10 +799,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sai->pdev = pdev;
-
-	if (of_device_is_compatible(np, "fsl,imx6sx-sai") ||
-	    of_device_is_compatible(np, "fsl,imx6ul-sai"))
-		sai->sai_on_imx = true;
+	sai->soc_data = of_device_get_match_data(&pdev->dev);
 
 	sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
 
@@ -910,7 +908,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (sai->sai_on_imx)
+	if (sai->soc_data->use_imx_pcm)
 		return imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
 	else
 		return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
@@ -923,10 +921,18 @@ static int fsl_sai_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
+	.use_imx_pcm = false,
+};
+
+static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
+	.use_imx_pcm = true,
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
-	{ .compatible = "fsl,vf610-sai", },
-	{ .compatible = "fsl,imx6sx-sai", },
-	{ .compatible = "fsl,imx6ul-sai", },
+	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
+	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
+	{ .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 24cb156bf995..83e2bfe05b1b 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -126,6 +126,10 @@
 #define FSL_SAI_MAXBURST_TX 6
 #define FSL_SAI_MAXBURST_RX 6
 
+struct fsl_sai_soc_data {
+	bool use_imx_pcm;
+};
+
 struct fsl_sai {
 	struct platform_device *pdev;
 	struct regmap *regmap;
@@ -135,7 +139,6 @@ struct fsl_sai {
 	bool is_slave_mode;
 	bool is_lsb_first;
 	bool is_dsp_mode;
-	bool sai_on_imx;
 	bool synchronous[2];
 
 	unsigned int mclk_id[2];
@@ -143,6 +146,7 @@ struct fsl_sai {
 	unsigned int slots;
 	unsigned int slot_width;
 
+	const struct fsl_sai_soc_data *soc_data;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	struct snd_dmaengine_dai_dma_data dma_params_tx;
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

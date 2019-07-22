Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23970032
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:52:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0565117D6;
	Mon, 22 Jul 2019 14:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0565117D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563799964;
	bh=yhMzr01rU0yZ0koAj2pKflbulGa9jE4KjI1EzPhX0gk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xm8dZviYklIXBGFwgFf9+IhgVDzye78GytcS3g9eLhGf650C62qI/gUGoG8INR/6H
	 p1t7MJuuBIQtcXuM4nmQym0tj4Iyd2O+1jNO7vkNeKQtkyWVD2zKol9zmn0+FvNDRo
	 AIAwVn/843eXvemEX7DoC+t1vbQAjiO2Kl/YZ0ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1131F800E8;
	Mon, 22 Jul 2019 14:49:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EE4BF804CC; Mon, 22 Jul 2019 14:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0FFDF803D5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0FFDF803D5
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1E0291A00DB;
 Mon, 22 Jul 2019 14:48:49 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1058B1A00AA;
 Mon, 22 Jul 2019 14:48:49 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 60ADD205DB;
 Mon, 22 Jul 2019 14:48:48 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Mon, 22 Jul 2019 15:48:24 +0300
Message-Id: <20190722124833.28757-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722124833.28757-1-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Subject: [alsa-devel] [PATCH 01/10] ASoC: fsl_sai: add of_match data
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

From: Lucas Stach <l.stach@pengutronix.de>

New revisions of the SAI IP block have even more differences that need
be taken into account by the driver. To avoid sprinking compatible
checks all over the driver move the current differences into of_match_data.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 22 ++++++++++++++--------
 sound/soc/fsl/fsl_sai.h |  6 +++++-
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d58cc3ae90d8..ed0432e7327a 100644
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
@@ -788,10 +789,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sai->pdev = pdev;
-
-	if (of_device_is_compatible(np, "fsl,imx6sx-sai") ||
-	    of_device_is_compatible(np, "fsl,imx6ul-sai"))
-		sai->sai_on_imx = true;
+	sai->soc_data = of_device_get_match_data(&pdev->dev);
 
 	sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
 
@@ -900,7 +898,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (sai->sai_on_imx)
+	if (sai->soc_data->use_imx_pcm)
 		return imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
 	else
 		return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
@@ -913,10 +911,18 @@ static int fsl_sai_remove(struct platform_device *pdev)
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
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

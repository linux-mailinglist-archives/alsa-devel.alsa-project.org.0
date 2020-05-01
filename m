Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D87391C0F70
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 10:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB3216C2;
	Fri,  1 May 2020 10:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB3216C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588321476;
	bh=o7iKCjGwAncN2dazF+hofZSSYuVtSRU686gY6GJF9CY=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=O1Lj50nRX2cDiHWm+ZIF2CnOlTOfW9mnoqM95L8wKjrnbQB1lF4BGypOrKRvIjdGZ
	 E7do6RzFIkEpPDBkr2BJkM0IxR4PmggWeit9Ckx7vnLTDbrzJJzCzbDvezouj44d6j
	 jJNOd7TN0+rRcTghc1T4lb8GliCQHx5rHR674eoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9AC1F802A8;
	Fri,  1 May 2020 10:21:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C6F4F802A7; Fri,  1 May 2020 10:21:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD512F8022B
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 10:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD512F8022B
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A67F5200B30;
 Fri,  1 May 2020 10:21:06 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6C932200B47;
 Fri,  1 May 2020 10:21:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B2D69402DE;
 Fri,  1 May 2020 16:20:54 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/3] ASoC: fsl_esai: Add support for imx8qm
Date: Fri,  1 May 2020 16:12:05 +0800
Message-Id: <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1588320655.git.shengjiu.wang@nxp.com>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1588320655.git.shengjiu.wang@nxp.com>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
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

The difference for esai on imx8qm is that DMA device is EDMA.

EDMA requires the period size to be multiple of maxburst. Otherwise
the remaining bytes are not transferred and thus noise is produced.

We can handle this issue by adding a constraint on
SNDRV_PCM_HW_PARAM_PERIOD_SIZE to be multiple of tx/rx maxburst value.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bac65ba7fbad..61b5c0bde788 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -26,10 +26,12 @@
  *
  * @imx: for imx platform
  * @reset_at_xrun: flags for enable reset operaton
+ * @use_edma: edma is used.
  */
 struct fsl_esai_soc_data {
 	bool imx;
 	bool reset_at_xrun;
+	bool use_edma;
 };
 
 /**
@@ -88,16 +90,25 @@ struct fsl_esai {
 static struct fsl_esai_soc_data fsl_esai_vf610 = {
 	.imx = false,
 	.reset_at_xrun = true,
+	.use_edma = false,
 };
 
 static struct fsl_esai_soc_data fsl_esai_imx35 = {
 	.imx = true,
 	.reset_at_xrun = true,
+	.use_edma = false,
 };
 
 static struct fsl_esai_soc_data fsl_esai_imx6ull = {
 	.imx = true,
 	.reset_at_xrun = false,
+	.use_edma = false,
+};
+
+static struct fsl_esai_soc_data fsl_esai_imx8qm = {
+	.imx = true,
+	.reset_at_xrun = false,
+	.use_edma = true,
 };
 
 static irqreturn_t esai_isr(int irq, void *devid)
@@ -513,6 +524,7 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
 	if (!dai->active) {
 		/* Set synchronous mode */
@@ -527,6 +539,12 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 				   ESAI_xCCR_xDC_MASK, ESAI_xCCR_xDC(2));
 	}
 
+	if (esai_priv->soc->use_edma)
+		snd_pcm_hw_constraint_step(substream->runtime, 0,
+					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   tx ? esai_priv->dma_params_tx.maxburst :
+					   esai_priv->dma_params_rx.maxburst);
+
 	return 0;
 
 }
@@ -1094,6 +1112,7 @@ static const struct of_device_id fsl_esai_dt_ids[] = {
 	{ .compatible = "fsl,imx35-esai", .data = &fsl_esai_imx35 },
 	{ .compatible = "fsl,vf610-esai", .data = &fsl_esai_vf610 },
 	{ .compatible = "fsl,imx6ull-esai", .data = &fsl_esai_imx6ull },
+	{ .compatible = "fsl,imx8qm-esai", .data = &fsl_esai_imx8qm },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
-- 
2.21.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585DE561205
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 07:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0616A16C8;
	Thu, 30 Jun 2022 07:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0616A16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656568552;
	bh=tX3trNVR6aZg9Bl9GRfFviUrqEI5hbF74wHLpKRDoPk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o/Vf2Teyd0/tqDFQMtpV8Pq9SDcAq3yjei/71Za06+NzRUEzHO0gQ9I5C1whZctRw
	 PExrt9/hkm554+EJdHgaa7cjoLcuX59XGrvmNDP9R6HAkj4lLagrYH52ZLZu/mJzE0
	 ydyUV7NQ7xnwyF/Qx0wyEK7gAqP0z4YADwe4T+qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1744F8014E;
	Thu, 30 Jun 2022 07:54:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D113F80538; Thu, 30 Jun 2022 07:54:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6D93F804D2
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 07:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6D93F804D2
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 12F322009FB;
 Thu, 30 Jun 2022 07:54:15 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A776F2009FE;
 Thu, 30 Jun 2022 07:54:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5A21C180222C;
 Thu, 30 Jun 2022 13:54:13 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/6] ASoC: fsl_spdif: Add support for PLL switch at runtime.
Date: Thu, 30 Jun 2022 13:39:10 +0800
Message-Id: <1656567554-32122-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
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

i.MX8MQ/MN/MM/MP platforms typically have 2 AUDIO PLLs being
configured to handle 8kHz and 11kHz series audio rates.

The patch implements the functionality to select at runtime
the appropriate AUDIO PLL as function of audio file rate.
As the clock parent may be changed, need to probe txclk
according to sample rate again.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig     |  1 +
 sound/soc/fsl/fsl_spdif.c | 57 +++++++++++++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 10fa38753453..910b8747b6bd 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -59,6 +59,7 @@ config SND_SOC_FSL_SPDIF
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_IMX_PCM_FIQ if SND_IMX_SOC != n && (MXC_TZIC || MXC_AVIC)
 	select BITREVERSE
+	select SND_SOC_FSL_UTILS
 	help
 	  Say Y if you want to add Sony/Philips Digital Interface (SPDIF)
 	  support for the Freescale CPUs.
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 0504431792cf..886e8c77c7ad 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -23,6 +23,7 @@
 #include <sound/soc.h>
 
 #include "fsl_spdif.h"
+#include "fsl_utils.h"
 #include "imx-pcm.h"
 
 #define FSL_SPDIF_TXFIFO_WML	0x8
@@ -114,6 +115,8 @@ struct spdif_mixer_control {
  * @dma_params_rx: DMA parameters for receive channel
  * @regcache_srpc: regcache for SRPC
  * @bypass: status of bypass input to output
+ * @pll8k_clk: PLL clock for the rate of multiply of 8kHz
+ * @pll11k_clk: PLL clock for the rate of multiply of 11kHz
  */
 struct fsl_spdif_priv {
 	const struct fsl_spdif_soc_data *soc;
@@ -137,6 +140,8 @@ struct fsl_spdif_priv {
 	/* regcache for SRPC */
 	u32 regcache_srpc;
 	bool bypass;
+	struct clk *pll8k_clk;
+	struct clk *pll11k_clk;
 };
 
 static struct fsl_spdif_soc_data fsl_spdif_vf610 = {
@@ -480,6 +485,8 @@ static int spdif_set_rx_clksrc(struct fsl_spdif_priv *spdif_priv,
 	return 0;
 }
 
+static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv, enum spdif_txrate index);
+
 static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 				int sample_rate)
 {
@@ -528,6 +535,10 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	ret = fsl_spdif_probe_txclk(spdif_priv, rate);
+	if (ret)
+		return ret;
+
 	clk = spdif_priv->txclk_src[rate];
 	if (clk >= STC_TXCLK_SRC_MAX) {
 		dev_err(&pdev->dev, "tx clock source is out of range\n");
@@ -647,6 +658,38 @@ static void fsl_spdif_shutdown(struct snd_pcm_substream *substream,
 	}
 }
 
+static int spdif_reparent_rootclk(struct fsl_spdif_priv *spdif_priv, unsigned int sample_rate)
+{
+	struct platform_device *pdev = spdif_priv->pdev;
+	struct device *dev = &pdev->dev;
+	u64 ratio = sample_rate;
+	struct clk *clk;
+	int ret;
+
+	/* Reparent clock if required condition is true */
+	if (!spdif_priv->pll8k_clk || !spdif_priv->pll11k_clk ||
+	    !fsl_spdif_can_set_clk_rate(spdif_priv, STC_TXCLK_SPDIF_ROOT))
+		return 0;
+
+	ratio = do_div(ratio, 8000) ? CLK_11K_FREQ : CLK_8K_FREQ;
+
+	/* Get root clock */
+	clk = spdif_priv->txclk[STC_TXCLK_SPDIF_ROOT];
+	if (IS_ERR_OR_NULL(clk)) {
+		dev_err(dev, "no rxtx1 clock in devicetree\n");
+		return PTR_ERR(clk);
+	}
+
+	/* Disable clock first, for it was enabled by pm_runtime */
+	clk_disable_unprepare(clk);
+	fsl_asoc_reparent_pll_clocks(dev, clk, spdif_priv->pll8k_clk,
+				     spdif_priv->pll11k_clk, ratio);
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return ret;
+
+	return 0;
+}
 static int fsl_spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -659,6 +702,13 @@ static int fsl_spdif_hw_params(struct snd_pcm_substream *substream,
 	int ret = 0;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = spdif_reparent_rootclk(spdif_priv, sample_rate);
+		if (ret) {
+			dev_err(&pdev->dev, "%s: reparent root clk failed: %d\n",
+				__func__, sample_rate);
+			return ret;
+		}
+
 		ret  = spdif_set_sample_rate(substream, sample_rate);
 		if (ret) {
 			dev_err(&pdev->dev, "%s: set sample rate failed: %d\n",
@@ -1548,11 +1598,8 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	}
 	spdif_priv->rxclk_src = DEFAULT_RXCLK_SRC;
 
-	for (i = 0; i < SPDIF_TXRATE_MAX; i++) {
-		ret = fsl_spdif_probe_txclk(spdif_priv, i);
-		if (ret)
-			return ret;
-	}
+	fsl_asoc_get_pll_clocks(&pdev->dev, &spdif_priv->pll8k_clk,
+				&spdif_priv->pll11k_clk);
 
 	/* Initial spinlock for control data */
 	ctrl = &spdif_priv->fsl_spdif_control;
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C895630A2
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 11:49:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4899316E1;
	Fri,  1 Jul 2022 11:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4899316E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656668954;
	bh=YS3t6BKtGwamelp7cB9+whoMEn5SqDKKGC3tX2PuRvA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FP4z4NTPt1Yq1K5YgIbCyiqOGzl+MwMKe3hqmobBuj7gwmj2uyp8/ykhqCyKHuUPa
	 /JEqHzaF+KV4y9DHupFzQzYNGTcjDQuHFl8At1YxuaSKdP7uJRKopCXqP5HWNFtVLT
	 VpR/psa0V43jHPhbnjGr4EH7mXqoEZEe4FyIv48Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8902FF80155;
	Fri,  1 Jul 2022 11:47:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30863F8053A; Fri,  1 Jul 2022 11:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22E86F80155
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 11:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22E86F80155
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 611E11A13D6;
 Fri,  1 Jul 2022 11:47:29 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 290261A13C8;
 Fri,  1 Jul 2022 11:47:29 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D030C1802204;
 Fri,  1 Jul 2022 17:47:27 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] ASoC: fsl_micfil: Add support for PLL switch at runtime
Date: Fri,  1 Jul 2022 17:32:38 +0800
Message-Id: <1656667961-1799-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
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

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig      |  1 +
 sound/soc/fsl/fsl_micfil.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 910b8747b6bd..533937166b4a 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -81,6 +81,7 @@ config SND_SOC_FSL_MICFIL
 	select REGMAP_MMIO
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_SOC_FSL_UTILS
 	help
 	  Say Y if you want to add Pulse Density Modulation microphone
 	  interface (MICFIL) support for NXP.
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 18ab80b68752..431278bfbd7b 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -24,6 +24,7 @@
 #include <sound/core.h>
 
 #include "fsl_micfil.h"
+#include "fsl_utils.h"
 
 #define MICFIL_OSR_DEFAULT	16
 
@@ -42,6 +43,8 @@ struct fsl_micfil {
 	const struct fsl_micfil_soc_data *soc;
 	struct clk *busclk;
 	struct clk *mclk;
+	struct clk *pll8k_clk;
+	struct clk *pll11k_clk;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	struct sdma_peripheral_config sdmacfg;
 	unsigned int dataline;
@@ -283,6 +286,27 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil, unsigned int sample_rate)
+{
+	struct device *dev = &micfil->pdev->dev;
+	u64 ratio = sample_rate;
+	struct clk *clk;
+	int ret;
+
+	/* Get root clock */
+	clk = micfil->mclk;
+
+	/* Disable clock first, for it was enabled by pm_runtime */
+	clk_disable_unprepare(clk);
+	fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
+				     micfil->pll11k_clk, ratio);
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -306,6 +330,10 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
+	ret = fsl_micfil_reparent_rootclk(micfil, rate);
+	if (ret)
+		return ret;
+
 	ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
 	if (ret)
 		return ret;
@@ -610,6 +638,9 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 		return PTR_ERR(micfil->busclk);
 	}
 
+	fsl_asoc_get_pll_clocks(&pdev->dev, &micfil->pll8k_clk,
+				&micfil->pll11k_clk);
+
 	/* init regmap */
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(regs))
-- 
2.17.1


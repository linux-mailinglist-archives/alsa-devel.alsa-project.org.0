Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3FF5630B0
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 11:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C612016F1;
	Fri,  1 Jul 2022 11:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C612016F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656668985;
	bh=VLoYejxxp7To7ecSaRMtV+96cND5lTY8mp81DwSWu+4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MdGMen/PECN9Rk8CbyuXSjCYbQxTZ0VCr/Dq4WazqgG8VqSHFqlAzk8deMzrVKjuK
	 IhYLG64QWVfHaQT9qwFbs7VWcCRgi3V918Bev3giLbiUM+YmbOE7RMz/V6kU5tYfjH
	 WRctTZ8MEbQ/e8bmkcsis52uI7zcqaxFA/O/3LT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDBC9F80543;
	Fri,  1 Jul 2022 11:47:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A905EF80543; Fri,  1 Jul 2022 11:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FB0CF8052E
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 11:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FB0CF8052E
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1A3691A13D5;
 Fri,  1 Jul 2022 11:47:31 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ABC4C1A13CF;
 Fri,  1 Jul 2022 11:47:30 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 09172180222C;
 Fri,  1 Jul 2022 17:47:28 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] ASoC: fsl_sai: Add support for PLL switch at runtime
Date: Fri,  1 Jul 2022 17:32:39 +0800
Message-Id: <1656667961-1799-5-git-send-email-shengjiu.wang@nxp.com>
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
the appropriate AUDIO PLL as function of sysclk rate.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig   |  1 +
 sound/soc/fsl/fsl_sai.c | 38 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h |  2 ++
 3 files changed, 41 insertions(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 533937166b4a..614eceda6b9e 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -19,6 +19,7 @@ config SND_SOC_FSL_SAI
 	select REGMAP_MMIO
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_SOC_FSL_UTILS
 	help
 	  Say Y if you want to add Synchronous Audio Interface (SAI)
 	  support for the Freescale CPUs.
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index a0ddaf7e9f60..974ba0780b19 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -23,6 +23,7 @@
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 
 #include "fsl_sai.h"
+#include "fsl_utils.h"
 #include "imx-pcm.h"
 
 #define FSL_SAI_FLAGS (FSL_SAI_CSR_SEIE |\
@@ -220,14 +221,48 @@ static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
 	return 0;
 }
 
+static int fsl_sai_set_mclk_rate(struct snd_soc_dai *dai, int clk_id, unsigned int freq)
+{
+	struct fsl_sai *sai = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	fsl_asoc_reparent_pll_clocks(dai->dev, sai->mclk_clk[clk_id],
+				     sai->pll8k_clk, sai->pll11k_clk, freq);
+
+	ret = clk_set_rate(sai->mclk_clk[clk_id], freq);
+	if (ret < 0)
+		dev_err(dai->dev, "failed to set clock rate (%u): %d\n", freq, ret);
+
+	return ret;
+}
+
 static int fsl_sai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 		int clk_id, unsigned int freq, int dir)
 {
+	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret;
 
 	if (dir == SND_SOC_CLOCK_IN)
 		return 0;
 
+	if (freq > 0 && clk_id != FSL_SAI_CLK_BUS) {
+		if (clk_id < 0 || clk_id >= FSL_SAI_MCLK_MAX) {
+			dev_err(cpu_dai->dev, "Unknown clock id: %d\n", clk_id);
+			return -EINVAL;
+		}
+
+		if (IS_ERR_OR_NULL(sai->mclk_clk[clk_id])) {
+			dev_err(cpu_dai->dev, "Unassigned clock: %d\n", clk_id);
+			return -EINVAL;
+		}
+
+		if (sai->mclk_streams == 0) {
+			ret = fsl_sai_set_mclk_rate(cpu_dai, clk_id, freq);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq, true);
 	if (ret) {
 		dev_err(cpu_dai->dev, "Cannot set tx sysclk: %d\n", ret);
@@ -1281,6 +1316,9 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	else
 		sai->mclk_clk[0] = sai->bus_clk;
 
+	fsl_asoc_get_pll_clocks(&pdev->dev, &sai->pll8k_clk,
+				&sai->pll11k_clk);
+
 	/* read dataline mask for rx and tx*/
 	ret = fsl_sai_read_dlcfg(sai);
 	if (ret < 0) {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 9bb8ced520c8..17956b5731dc 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -273,6 +273,8 @@ struct fsl_sai {
 	struct regmap *regmap;
 	struct clk *bus_clk;
 	struct clk *mclk_clk[FSL_SAI_MCLK_MAX];
+	struct clk *pll8k_clk;
+	struct clk *pll11k_clk;
 	struct resource *res;
 
 	bool is_consumer_mode;
-- 
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C63BD170EBA
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2020 03:50:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67A6E74C;
	Thu, 27 Feb 2020 03:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67A6E74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582771857;
	bh=fvU/Elhl/57IOWniVeXItyu3WU9Iu8LbITAlWJ+UD1s=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=ECNL1KdM4NZV8r9qOgBNohpgAOvQ/GD7Y6irAU0eujrg2+uA8w8UZfOqJYRNpMxCh
	 VRlT9oUcbU1JSQfFpnpxpBnYtl3Df1w//A27SJpmkrTFDxmi3ZzQJYm8JurvgkBv1Z
	 NulBYnpGvfOcTNg0DJWfcfR3CpfeO6wVUXdJ5J+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC22EF8028B;
	Thu, 27 Feb 2020 03:48:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F474F8028B; Thu, 27 Feb 2020 03:48:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4613AF80089
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 03:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4613AF80089
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5556A208DC7;
 Thu, 27 Feb 2020 03:48:04 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BB54B208DC3;
 Thu, 27 Feb 2020 03:47:56 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9CC3C402E6;
 Thu, 27 Feb 2020 10:47:47 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
Date: Thu, 27 Feb 2020 10:41:56 +0800
Message-Id: <d9aebf5ef9a92623db10dc537161b3ecdb1d8b18.1582770784.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582770784.git.shengjiu.wang@nxp.com>
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1582770784.git.shengjiu.wang@nxp.com>
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
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

There is a new ASRC included in i.MX serial platform, there
are some common definition can be shared with each other.
So move the common definition to a separate header file.

And add fsl_asrc_pair_internal and fsl_asrc_internal for
the variable specific for the module, which can be used
internally.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c        |  81 +++++++++++++++---------
 sound/soc/fsl/fsl_asrc.h        |  74 ++--------------------
 sound/soc/fsl/fsl_asrc_common.h | 105 ++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc_dma.c    |  25 ++++----
 4 files changed, 176 insertions(+), 109 deletions(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_common.h

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 2b6a1643573c..7f862d220a8e 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -308,8 +308,10 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
  */
 static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 {
-	struct asrc_config *config = pair->config;
+	struct fsl_asrc_pair_internal *pair_internal = pair->private;
+	struct asrc_config *config = pair_internal->config;
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
+	struct fsl_asrc_internal *asrc_internal = asrc_priv->private;
 	enum asrc_pair_index index = pair->index;
 	enum asrc_word_width input_word_width;
 	enum asrc_word_width output_word_width;
@@ -392,11 +394,11 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	}
 
 	/* Validate input and output clock sources */
-	clk_index[IN] = asrc_priv->clk_map[IN][config->inclk];
-	clk_index[OUT] = asrc_priv->clk_map[OUT][config->outclk];
+	clk_index[IN] = asrc_internal->clk_map[IN][config->inclk];
+	clk_index[OUT] = asrc_internal->clk_map[OUT][config->outclk];
 
 	/* We only have output clock for ideal ratio mode */
-	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
+	clk = asrc_internal->asrck_clk[clk_index[ideal ? OUT : IN]];
 
 	clk_rate = clk_get_rate(clk);
 	rem[IN] = do_div(clk_rate, inrate);
@@ -417,7 +419,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 
 	div[IN] = min_t(u32, 1024, div[IN]);
 
-	clk = asrc_priv->asrck_clk[clk_index[OUT]];
+	clk = asrc_internal->asrck_clk[clk_index[OUT]];
 	clk_rate = clk_get_rate(clk);
 	if (ideal && use_ideal_rate)
 		rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
@@ -437,13 +439,13 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	/* Set the channel number */
 	channels = config->channel_num;
 
-	if (asrc_priv->soc->channel_bits < 4)
+	if (asrc_internal->soc->channel_bits < 4)
 		channels /= 2;
 
 	/* Update channels for current pair */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCNCR,
-			   ASRCNCR_ANCi_MASK(index, asrc_priv->soc->channel_bits),
-			   ASRCNCR_ANCi(index, channels, asrc_priv->soc->channel_bits));
+			   ASRCNCR_ANCi_MASK(index, asrc_internal->soc->channel_bits),
+			   ASRCNCR_ANCi(index, channels, asrc_internal->soc->channel_bits));
 
 	/* Default setting: Automatic selection for processing mode */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
@@ -568,9 +570,10 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
+	struct fsl_asrc_internal *asrc_internal = asrc_priv->private;
 
 	/* Odd channel number is not valid for older ASRC (channel_bits==3) */
-	if (asrc_priv->soc->channel_bits == 3)
+	if (asrc_internal->soc->channel_bits == 3)
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
@@ -586,6 +589,7 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct fsl_asrc_pair_internal *pair_internal = pair->private;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	struct asrc_config config;
@@ -597,7 +601,7 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	pair->config = &config;
+	pair_internal->config = &config;
 
 	config.pair = pair->index;
 	config.channel_num = channels;
@@ -931,10 +935,16 @@ static irqreturn_t fsl_asrc_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
+{
+	return REG_ASRDx(dir, index);
+}
+
 static int fsl_asrc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct fsl_asrc *asrc_priv;
+	struct fsl_asrc_internal *asrc_internal;
 	struct resource *res;
 	void __iomem *regs;
 	int irq, ret, i;
@@ -946,7 +956,12 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	if (!asrc_priv)
 		return -ENOMEM;
 
+	asrc_internal = devm_kzalloc(&pdev->dev, sizeof(*asrc_internal), GFP_KERNEL);
+	if (!asrc_internal)
+		return -ENOMEM;
+
 	asrc_priv->pdev = pdev;
+	asrc_priv->private = asrc_internal;
 
 	/* Get the addresses and IRQ */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -992,25 +1007,31 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
-		asrc_priv->asrck_clk[i] = devm_clk_get(&pdev->dev, tmp);
-		if (IS_ERR(asrc_priv->asrck_clk[i])) {
+		asrc_internal->asrck_clk[i] = devm_clk_get(&pdev->dev, tmp);
+		if (IS_ERR(asrc_internal->asrck_clk[i])) {
 			dev_err(&pdev->dev, "failed to get %s clock\n", tmp);
-			return PTR_ERR(asrc_priv->asrck_clk[i]);
+			return PTR_ERR(asrc_internal->asrck_clk[i]);
 		}
 	}
 
-	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
-	if (!asrc_priv->soc) {
+	asrc_internal->soc = of_device_get_match_data(&pdev->dev);
+	if (!asrc_internal->soc) {
 		dev_err(&pdev->dev, "failed to get soc data\n");
 		return -ENODEV;
 	}
 
+	asrc_priv->use_edma = asrc_internal->soc->use_edma;
+	asrc_priv->get_dma_channel = fsl_asrc_get_dma_channel;
+	asrc_priv->request_pair = fsl_asrc_request_pair;
+	asrc_priv->release_pair = fsl_asrc_release_pair;
+	asrc_priv->get_fifo_addr = fsl_asrc_get_fifo_addr;
+
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
-		asrc_priv->clk_map[IN] = input_clk_map_imx35;
-		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
+		asrc_internal->clk_map[IN] = input_clk_map_imx35;
+		asrc_internal->clk_map[OUT] = output_clk_map_imx35;
 	} else if (of_device_is_compatible(np, "fsl,imx53-asrc")) {
-		asrc_priv->clk_map[IN] = input_clk_map_imx53;
-		asrc_priv->clk_map[OUT] = output_clk_map_imx53;
+		asrc_internal->clk_map[IN] = input_clk_map_imx53;
+		asrc_internal->clk_map[OUT] = output_clk_map_imx53;
 	} else if (of_device_is_compatible(np, "fsl,imx8qm-asrc") ||
 		   of_device_is_compatible(np, "fsl,imx8qxp-asrc")) {
 		ret = of_property_read_u32(np, "fsl,asrc-clk-map", &map_idx);
@@ -1024,11 +1045,11 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 		if (of_device_is_compatible(np, "fsl,imx8qm-asrc")) {
-			asrc_priv->clk_map[IN] = clk_map_imx8qm[map_idx];
-			asrc_priv->clk_map[OUT] = clk_map_imx8qm[map_idx];
+			asrc_internal->clk_map[IN] = clk_map_imx8qm[map_idx];
+			asrc_internal->clk_map[OUT] = clk_map_imx8qm[map_idx];
 		} else {
-			asrc_priv->clk_map[IN] = clk_map_imx8qxp[map_idx];
-			asrc_priv->clk_map[OUT] = clk_map_imx8qxp[map_idx];
+			asrc_internal->clk_map[IN] = clk_map_imx8qxp[map_idx];
+			asrc_internal->clk_map[OUT] = clk_map_imx8qxp[map_idx];
 		}
 	}
 
@@ -1081,6 +1102,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 static int fsl_asrc_runtime_resume(struct device *dev)
 {
 	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
+	struct fsl_asrc_internal *asrc_internal = asrc_priv->private;
 	int i, ret;
 
 	ret = clk_prepare_enable(asrc_priv->mem_clk);
@@ -1095,7 +1117,7 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 			goto disable_ipg_clk;
 	}
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
-		ret = clk_prepare_enable(asrc_priv->asrck_clk[i]);
+		ret = clk_prepare_enable(asrc_internal->asrck_clk[i]);
 		if (ret)
 			goto disable_asrck_clk;
 	}
@@ -1104,7 +1126,7 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 
 disable_asrck_clk:
 	for (i--; i >= 0; i--)
-		clk_disable_unprepare(asrc_priv->asrck_clk[i]);
+		clk_disable_unprepare(asrc_internal->asrck_clk[i]);
 	if (!IS_ERR(asrc_priv->spba_clk))
 		clk_disable_unprepare(asrc_priv->spba_clk);
 disable_ipg_clk:
@@ -1117,10 +1139,11 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 static int fsl_asrc_runtime_suspend(struct device *dev)
 {
 	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
+	struct fsl_asrc_internal *asrc_internal = asrc_priv->private;
 	int i;
 
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++)
-		clk_disable_unprepare(asrc_priv->asrck_clk[i]);
+		clk_disable_unprepare(asrc_internal->asrck_clk[i]);
 	if (!IS_ERR(asrc_priv->spba_clk))
 		clk_disable_unprepare(asrc_priv->spba_clk);
 	clk_disable_unprepare(asrc_priv->ipg_clk);
@@ -1134,9 +1157,10 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 static int fsl_asrc_suspend(struct device *dev)
 {
 	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
+	struct fsl_asrc_internal *asrc_internal = asrc_priv->private;
 
 	regmap_read(asrc_priv->regmap, REG_ASRCFG,
-		    &asrc_priv->regcache_cfg);
+		    &asrc_internal->regcache_cfg);
 
 	regcache_cache_only(asrc_priv->regmap, true);
 	regcache_mark_dirty(asrc_priv->regmap);
@@ -1147,6 +1171,7 @@ static int fsl_asrc_suspend(struct device *dev)
 static int fsl_asrc_resume(struct device *dev)
 {
 	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
+	struct fsl_asrc_internal *asrc_internal = asrc_priv->private;
 	u32 asrctr;
 
 	/* Stop all pairs provisionally */
@@ -1160,7 +1185,7 @@ static int fsl_asrc_resume(struct device *dev)
 
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCFG,
 			   ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
-			   ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
+			   ASRCFG_PREMODi_ALL_MASK, asrc_internal->regcache_cfg);
 
 	/* Restart enabled pairs */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 4940fa0a7542..9d02bcab1a88 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -10,8 +10,7 @@
 #ifndef _FSL_ASRC_H
 #define _FSL_ASRC_H
 
-#define IN	0
-#define OUT	1
+#include  "fsl_asrc_common.h"
 
 #define ASRC_DMA_BUFFER_NUM		2
 #define ASRC_INPUTFIFO_THRESHOLD	32
@@ -283,14 +282,6 @@
 #define ASRMCR1i_OW16_MASK		(1 << ASRMCR1i_OW16_SHIFT)
 #define ASRMCR1i_OW16(v)		((v) << ASRMCR1i_OW16_SHIFT)
 
-
-enum asrc_pair_index {
-	ASRC_INVALID_PAIR = -1,
-	ASRC_PAIR_A = 0,
-	ASRC_PAIR_B = 1,
-	ASRC_PAIR_C = 2,
-};
-
 #define ASRC_PAIR_MAX_NUM	(ASRC_PAIR_C + 1)
 
 enum asrc_inclk {
@@ -446,83 +437,28 @@ struct fsl_asrc_soc_data {
 };
 
 /**
- * fsl_asrc_pair: ASRC Pair private data
+ * fsl_asrc_pair_internal: ASRC Pair private data
  *
- * @asrc_priv: pointer to its parent module
  * @config: configuration profile
- * @error: error record
- * @index: pair index (ASRC_PAIR_A, ASRC_PAIR_B, ASRC_PAIR_C)
- * @channels: occupied channel number
- * @desc: input and output dma descriptors
- * @dma_chan: inputer and output DMA channels
- * @dma_data: private dma data
- * @pos: hardware pointer position
- * @private: pair private area
  */
-struct fsl_asrc_pair {
-	struct fsl_asrc *asrc_priv;
+struct fsl_asrc_pair_internal {
 	struct asrc_config *config;
-	unsigned int error;
-
-	enum asrc_pair_index index;
-	unsigned int channels;
-
-	struct dma_async_tx_descriptor *desc[2];
-	struct dma_chan *dma_chan[2];
-	struct imx_dma_data dma_data;
-	unsigned int pos;
-
-	void *private;
 };
 
 /**
- * fsl_asrc_pair: ASRC private data
+ * fsl_asrc_internal: ASRC private data
  *
- * @dma_params_rx: DMA parameters for receive channel
- * @dma_params_tx: DMA parameters for transmit channel
- * @pdev: platform device pointer
- * @regmap: regmap handler
- * @paddr: physical address to the base address of registers
- * @mem_clk: clock source to access register
- * @ipg_clk: clock source to drive peripheral
- * @spba_clk: SPBA clock (optional, depending on SoC design)
  * @asrck_clk: clock sources to driver ASRC internal logic
- * @lock: spin lock for resource protection
- * @pair: pair pointers
  * @soc: soc specific data
- * @channel_avail: non-occupied channel numbers
  * @clk_map: clock map for input/output clock
- * @asrc_rate: default sample rate for ASoC Back-Ends
- * @asrc_format: default sample format for ASoC Back-Ends
  * @regcache_cfg: store register value of REG_ASRCFG
  */
-struct fsl_asrc {
-	struct snd_dmaengine_dai_dma_data dma_params_rx;
-	struct snd_dmaengine_dai_dma_data dma_params_tx;
-	struct platform_device *pdev;
-	struct regmap *regmap;
-	unsigned long paddr;
-	struct clk *mem_clk;
-	struct clk *ipg_clk;
-	struct clk *spba_clk;
+struct fsl_asrc_internal {
 	struct clk *asrck_clk[ASRC_CLK_MAX_NUM];
-	spinlock_t lock;
-
-	struct fsl_asrc_pair *pair[ASRC_PAIR_MAX_NUM];
 	const struct fsl_asrc_soc_data *soc;
-	unsigned int channel_avail;
 	unsigned char *clk_map[2];
 
-	int asrc_rate;
-	snd_pcm_format_t asrc_format;
-
 	u32 regcache_cfg;
 };
 
-#define DRV_NAME "fsl-asrc-dai"
-extern struct snd_soc_component_driver fsl_asrc_component;
-struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir);
-int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair);
-void fsl_asrc_release_pair(struct fsl_asrc_pair *pair);
-
 #endif /* _FSL_ASRC_H */
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
new file mode 100644
index 000000000000..737712e8ae76
--- /dev/null
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 NXP
+ *
+ */
+
+#ifndef _FSL_ASRC_COMMON_H
+#define _FSL_ASRC_COMMON_H
+
+/* directions */
+#define IN	0
+#define OUT	1
+
+enum asrc_pair_index {
+	ASRC_INVALID_PAIR = -1,
+	ASRC_PAIR_A = 0,
+	ASRC_PAIR_B = 1,
+	ASRC_PAIR_C = 2,
+	ASRC_PAIR_D = 3,
+};
+
+#define PAIR_CTX_NUM  0x4
+#define PAIR_PRIVAT_SIZE 0x400
+
+/**
+ * fsl_asrc_pair: ASRC Pair common data
+ *
+ * @asrc_priv: pointer to its parent module
+ * @error: error record
+ * @index: pair index (ASRC_PAIR_A, ASRC_PAIR_B, ASRC_PAIR_C)
+ * @channels: occupied channel number
+ * @desc: input and output dma descriptors
+ * @dma_chan: inputer and output DMA channels
+ * @dma_data: private dma data
+ * @pos: hardware pointer position
+ * @private: pair private area
+ */
+struct fsl_asrc_pair {
+	struct fsl_asrc *asrc_priv;
+	unsigned int error;
+
+	enum asrc_pair_index index;
+	unsigned int channels;
+
+	struct dma_async_tx_descriptor *desc[2];
+	struct dma_chan *dma_chan[2];
+	struct imx_dma_data dma_data;
+	unsigned int pos;
+
+	void *private;
+};
+
+/**
+ * fsl_asrc_pair: ASRC common data
+ *
+ * @dma_params_rx: DMA parameters for receive channel
+ * @dma_params_tx: DMA parameters for transmit channel
+ * @pdev: platform device pointer
+ * @regmap: regmap handler
+ * @paddr: physical address to the base address of registers
+ * @mem_clk: clock source to access register
+ * @ipg_clk: clock source to drive peripheral
+ * @spba_clk: SPBA clock (optional, depending on SoC design)
+ * @lock: spin lock for resource protection
+ * @pair: pair pointers
+ * @channel_avail: non-occupied channel numbers
+ * @asrc_rate: default sample rate for ASoC Back-Ends
+ * @asrc_format: default sample format for ASoC Back-Ends
+ * @use_edma: edma is used
+ * @get_dma_channel: function pointer
+ * @request_pair: function pointer
+ * @release_pair: function pointer
+ * @get_fifo_addr: function pointer
+ * @private: private data structure
+ */
+struct fsl_asrc {
+	struct snd_dmaengine_dai_dma_data dma_params_rx;
+	struct snd_dmaengine_dai_dma_data dma_params_tx;
+	struct platform_device *pdev;
+	struct regmap *regmap;
+	unsigned long paddr;
+	struct clk *mem_clk;
+	struct clk *ipg_clk;
+	struct clk *spba_clk;
+	spinlock_t lock;      /* spin lock for resource protection */
+
+	struct fsl_asrc_pair *pair[PAIR_CTX_NUM];
+	unsigned int channel_avail;
+
+	int asrc_rate;
+	snd_pcm_format_t asrc_format;
+	bool use_edma;
+
+	struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pair, bool dir);
+	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
+	void (*release_pair)(struct fsl_asrc_pair *pair);
+	int (*get_fifo_addr)(u8 dir, enum asrc_pair_index index);
+
+	void *private;
+};
+
+#define DRV_NAME "fsl-asrc-dai"
+extern struct snd_soc_component_driver fsl_asrc_component;
+
+#endif /* _FSL_ASRC_COMMON_H */
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index f344360dcd24..5f687a54993c 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -12,7 +12,7 @@
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 
-#include "fsl_asrc.h"
+#include "fsl_asrc_common.h"
 
 #define FSL_ASRC_DMABUF_SIZE	(256 * 1024)
 
@@ -170,10 +170,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 	/* Override dma_data of the Front-End and config its dmaengine */
 	dma_params_fe = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
-	dma_params_fe->addr = asrc_priv->paddr + REG_ASRDx(!dir, index);
+	dma_params_fe->addr = asrc_priv->paddr + asrc_priv->get_fifo_addr(!dir, index);
 	dma_params_fe->maxburst = dma_params_be->maxburst;
 
-	pair->dma_chan[!dir] = fsl_asrc_get_dma_channel(pair, !dir);
+	pair->dma_chan[!dir] = asrc_priv->get_dma_channel(pair, !dir);
 	if (!pair->dma_chan[!dir]) {
 		dev_err(dev, "failed to request DMA channel\n");
 		return -EINVAL;
@@ -203,7 +203,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	 * need to configure dma_request and dma_request2, but get dma_chan via
 	 * dma_request_slave_channel directly with dma name of Front-End device
 	 */
-	if (!asrc_priv->soc->use_edma) {
+	if (!asrc_priv->use_edma) {
 		/* Get DMA request of Back-End */
 		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
 		tmp_data = tmp_chan->private;
@@ -211,7 +211,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		dma_release_channel(tmp_chan);
 
 		/* Get DMA request of Front-End */
-		tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
+		tmp_chan = asrc_priv->get_dma_channel(pair, dir);
 		tmp_data = tmp_chan->private;
 		pair->dma_data.dma_request2 = tmp_data->dma_request;
 		pair->dma_data.peripheral_type = tmp_data->peripheral_type;
@@ -222,7 +222,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 			dma_request_channel(mask, filter, &pair->dma_data);
 	} else {
 		pair->dma_chan[dir] =
-			fsl_asrc_get_dma_channel(pair, dir);
+			asrc_priv->get_dma_channel(pair, dir);
 	}
 
 	if (!pair->dma_chan[dir]) {
@@ -242,10 +242,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	config_be.dst_maxburst = dma_params_be->maxburst;
 
 	if (tx) {
-		config_be.src_addr = asrc_priv->paddr + REG_ASRDO(index);
+		config_be.src_addr = asrc_priv->paddr + asrc_priv->get_fifo_addr(OUT, index);
 		config_be.dst_addr = dma_params_be->addr;
 	} else {
-		config_be.dst_addr = asrc_priv->paddr + REG_ASRDI(index);
+		config_be.dst_addr = asrc_priv->paddr + asrc_priv->get_fifo_addr(IN, index);
 		config_be.src_addr = dma_params_be->addr;
 	}
 
@@ -302,11 +302,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 		return ret;
 	}
 
-	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
+	pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
 	if (!pair)
 		return -ENOMEM;
 
 	pair->asrc_priv = asrc_priv;
+	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
 
 	runtime->private_data = pair;
 
@@ -314,14 +315,14 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 	 * Request pair function needs channel num as input, for this
 	 * dummy pair, we just request "1" channel temporarily.
 	 */
-	ret = fsl_asrc_request_pair(1, pair);
+	ret = asrc_priv->request_pair(1, pair);
 	if (ret < 0) {
 		dev_err(dev, "failed to request asrc pair\n");
 		goto req_pair_err;
 	}
 
 	/* Request a dummy dma channel, which will be released later. */
-	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
+	tmp_chan = asrc_priv->get_dma_channel(pair, dir);
 	if (!tmp_chan) {
 		dev_err(dev, "failed to get dma channel\n");
 		ret = -EINVAL;
@@ -347,7 +348,7 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 	dma_release_channel(tmp_chan);
 
 dma_chan_err:
-	fsl_asrc_release_pair(pair);
+	asrc_priv->release_pair(pair);
 
 req_pair_err:
 	if (release_pair)
-- 
2.21.0


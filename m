Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62B8E8451
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 10:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434512207;
	Tue, 29 Oct 2019 10:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434512207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572340999;
	bh=OrJnCjzikRnRDdJGI8R3pOHGEE1VaY/LqtH25WmuoM4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQIyKmPr7uxiHDY1+nabXrN7y7z3BUIHgOylKnt1c6F5/KFTdmodp3bplltgwOxrU
	 UEbUz7Gn6GWi67fM9PMHmnLqUtnn23iMzbg37e78xNDtqts4AwDgmiEf9ZDTOjHFwu
	 rEg5eH6QHrN+EFN7Q80QGsg69hnxd1xpOMtvU4aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55B5CF805AE;
	Tue, 29 Oct 2019 10:20:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25F76F80534; Tue, 29 Oct 2019 10:20:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB9BCF8044B
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 10:20:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB9BCF8044B
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7BEDD200851;
 Tue, 29 Oct 2019 10:20:48 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F1D60200847;
 Tue, 29 Oct 2019 10:20:41 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4D476402C4;
 Tue, 29 Oct 2019 17:20:34 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Date: Tue, 29 Oct 2019 17:17:09 +0800
Message-Id: <1572340629-20702-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572340629-20702-1-git-send-email-shengjiu.wang@nxp.com>
References: <1572340629-20702-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 2/2] ASoC: fsl_asrc: Add support for imx8qm
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

There are two asrc module in imx8qm, each module has different
clock configuration, and the DMA type is EDMA.

So in this patch, we define the new clocks, refine the clock map,
and include struct fsl_asrc_soc_data for different soc usage.

The EDMA channel is fixed with each dma request, one dma request
corresponding to one dma channel. So we need to request dma
channel with dma request of asrc module.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c     | 91 +++++++++++++++++++++++++++++-------
 sound/soc/fsl/fsl_asrc.h     | 65 +++++++++++++++++++++++++-
 sound/soc/fsl/fsl_asrc_dma.c | 39 ++++++++++++----
 3 files changed, 167 insertions(+), 28 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index a3cfceea7d2f..9dc5b5a93fb0 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -43,24 +43,55 @@ static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints = {
  */
 static unsigned char input_clk_map_imx35[] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
 };
 
 static unsigned char output_clk_map_imx35[] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
 };
 
 /* i.MX53 uses the same map for input and output */
 static unsigned char input_clk_map_imx53[] = {
 /*	0x0  0x1  0x2  0x3  0x4  0x5  0x6  0x7  0x8  0x9  0xa  0xb  0xc  0xd  0xe  0xf */
 	0x0, 0x1, 0x2, 0x7, 0x4, 0x5, 0x6, 0x3, 0x8, 0x9, 0xa, 0xb, 0xc, 0xf, 0xe, 0xd,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
 static unsigned char output_clk_map_imx53[] = {
 /*	0x0  0x1  0x2  0x3  0x4  0x5  0x6  0x7  0x8  0x9  0xa  0xb  0xc  0xd  0xe  0xf */
 	0x8, 0x9, 0xa, 0x7, 0xc, 0x5, 0x6, 0xb, 0x0, 0x1, 0x2, 0x3, 0x4, 0xf, 0xe, 0xd,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
-static unsigned char *clk_map[2];
+/* i.MX8QM uses the same map for input and output */
+static unsigned char input_clk_map_imx8_0[] = {
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+};
+
+static unsigned char output_clk_map_imx8_0[] = {
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+};
+
+static unsigned char input_clk_map_imx8_1[] = {
+	0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0xb, 0xc, 0xf, 0xf, 0xd, 0xe, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	0x4, 0x5, 0x6, 0xf, 0x8, 0x9, 0xa, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+};
+
+static unsigned char output_clk_map_imx8_1[] = {
+	0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0xb, 0xc, 0xf, 0xf, 0xd, 0xe, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	0x4, 0x5, 0x6, 0xf, 0x8, 0x9, 0xa, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+};
 
 /**
  * Select the pre-processing and post-processing options
@@ -353,8 +384,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	}
 
 	/* Validate input and output clock sources */
-	clk_index[IN] = clk_map[IN][config->inclk];
-	clk_index[OUT] = clk_map[OUT][config->outclk];
+	clk_index[IN] = asrc_priv->soc->inclk_map[config->inclk];
+	clk_index[OUT] = asrc_priv->soc->outclk_map[config->outclk];
 
 	/* We only have output clock for ideal ratio mode */
 	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
@@ -398,13 +429,13 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	/* Set the channel number */
 	channels = config->channel_num;
 
-	if (asrc_priv->channel_bits < 4)
+	if (asrc_priv->soc->channel_bits < 4)
 		channels /= 2;
 
 	/* Update channels for current pair */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCNCR,
-			   ASRCNCR_ANCi_MASK(index, asrc_priv->channel_bits),
-			   ASRCNCR_ANCi(index, channels, asrc_priv->channel_bits));
+			   ASRCNCR_ANCi_MASK(index, asrc_priv->soc->channel_bits),
+			   ASRCNCR_ANCi(index, channels, asrc_priv->soc->channel_bits));
 
 	/* Default setting: Automatic selection for processing mode */
 	regmap_update_bits(asrc_priv->regmap, REG_ASRCTR,
@@ -531,7 +562,7 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
 
 	/* Odd channel number is not valid for older ASRC (channel_bits==3) */
-	if (asrc_priv->channel_bits == 3)
+	if (asrc_priv->soc->channel_bits == 3)
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
@@ -964,14 +995,10 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
-		asrc_priv->channel_bits = 3;
-		clk_map[IN] = input_clk_map_imx35;
-		clk_map[OUT] = output_clk_map_imx35;
-	} else {
-		asrc_priv->channel_bits = 4;
-		clk_map[IN] = input_clk_map_imx53;
-		clk_map[OUT] = output_clk_map_imx53;
+	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
+	if (!asrc_priv->soc) {
+		dev_err(&pdev->dev, "failed to get soc data\n");
+		return -ENODEV;
 	}
 
 	ret = fsl_asrc_init(asrc_priv);
@@ -1113,9 +1140,39 @@ static const struct dev_pm_ops fsl_asrc_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
 };
 
+static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
+	.use_edma = false,
+	.channel_bits = 3,
+	.inclk_map = input_clk_map_imx35,
+	.outclk_map = output_clk_map_imx35,
+};
+
+static const struct fsl_asrc_soc_data fsl_asrc_imx53_data = {
+	.use_edma = false,
+	.channel_bits = 4,
+	.inclk_map = input_clk_map_imx53,
+	.outclk_map = output_clk_map_imx53,
+};
+
+static const struct fsl_asrc_soc_data fsl_asrc_imx8qm_0_data = {
+	.use_edma = true,
+	.channel_bits = 4,
+	.inclk_map = input_clk_map_imx8_0,
+	.outclk_map = output_clk_map_imx8_0,
+};
+
+static const struct fsl_asrc_soc_data fsl_asrc_imx8qm_1_data = {
+	.use_edma = true,
+	.channel_bits = 4,
+	.inclk_map = input_clk_map_imx8_1,
+	.outclk_map = output_clk_map_imx8_1,
+};
+
 static const struct of_device_id fsl_asrc_ids[] = {
-	{ .compatible = "fsl,imx35-asrc", },
-	{ .compatible = "fsl,imx53-asrc", },
+	{ .compatible = "fsl,imx35-asrc", .data = &fsl_asrc_imx35_data },
+	{ .compatible = "fsl,imx53-asrc", .data = &fsl_asrc_imx53_data },
+	{ .compatible = "fsl,imx8qm-asrc0", .data = &fsl_asrc_imx8qm_0_data },
+	{ .compatible = "fsl,imx8qm-asrc1", .data = &fsl_asrc_imx8qm_1_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 2b57e8c53728..8decbe670c3e 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -308,6 +308,29 @@ enum asrc_inclk {
 	INCLK_SSI3_TX = 0x0b,
 	INCLK_SPDIF_TX = 0x0c,
 	INCLK_ASRCK1_CLK = 0x0f,
+
+	/* clocks for imx8 */
+	INCLK_AUD_PLL_DIV_CLK0 = 0x10,
+	INCLK_AUD_PLL_DIV_CLK1 = 0x11,
+	INCLK_AUD_CLK0         = 0x12,
+	INCLK_AUD_CLK1         = 0x13,
+	INCLK_ESAI0_RX_CLK     = 0x14,
+	INCLK_ESAI0_TX_CLK     = 0x15,
+	INCLK_SPDIF0_RX        = 0x16,
+	INCLK_SPDIF1_RX        = 0x17,
+	INCLK_SAI0_RX_BCLK     = 0x18,
+	INCLK_SAI0_TX_BCLK     = 0x19,
+	INCLK_SAI1_RX_BCLK     = 0x1a,
+	INCLK_SAI1_TX_BCLK     = 0x1b,
+	INCLK_SAI2_RX_BCLK     = 0x1c,
+	INCLK_SAI3_RX_BCLK     = 0x1d,
+	INCLK_ASRC0_MUX_CLK    = 0x1e,
+
+	INCLK_ESAI1_RX_CLK     = 0x20,
+	INCLK_ESAI1_TX_CLK     = 0x21,
+	INCLK_SAI6_TX_BCLK     = 0x22,
+	INCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
+	INCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
 };
 
 enum asrc_outclk {
@@ -325,6 +348,29 @@ enum asrc_outclk {
 	OUTCLK_SSI3_RX = 0x0b,
 	OUTCLK_SPDIF_RX = 0x0c,
 	OUTCLK_ASRCK1_CLK = 0x0f,
+
+	/* clocks for imx8 */
+	OUTCLK_AUD_PLL_DIV_CLK0 = 0x10,
+	OUTCLK_AUD_PLL_DIV_CLK1 = 0x11,
+	OUTCLK_AUD_CLK0         = 0x12,
+	OUTCLK_AUD_CLK1         = 0x13,
+	OUTCLK_ESAI0_RX_CLK     = 0x14,
+	OUTCLK_ESAI0_TX_CLK     = 0x15,
+	OUTCLK_SPDIF0_RX        = 0x16,
+	OUTCLK_SPDIF1_RX        = 0x17,
+	OUTCLK_SAI0_RX_BCLK     = 0x18,
+	OUTCLK_SAI0_TX_BCLK     = 0x19,
+	OUTCLK_SAI1_RX_BCLK     = 0x1a,
+	OUTCLK_SAI1_TX_BCLK     = 0x1b,
+	OUTCLK_SAI2_RX_BCLK     = 0x1c,
+	OUTCLK_SAI3_RX_BCLK     = 0x1d,
+	OUTCLK_ASRCO_MUX_CLK    = 0x1e,
+
+	OUTCLK_ESAI1_RX_CLK     = 0x20,
+	OUTCLK_ESAI1_TX_CLK     = 0x21,
+	OUTCLK_SAI6_TX_BCLK     = 0x22,
+	OUTCLK_HDMI_RX_SAI0_RX_BCLK     = 0x24,
+	OUTCLK_HDMI_TX_SAI0_TX_BCLK     = 0x25,
 };
 
 #define ASRC_CLK_MAX_NUM	16
@@ -387,6 +433,21 @@ struct dma_block {
 	unsigned int length;
 };
 
+/**
+ * fsl_asrc_soc_data: soc specific data
+ *
+ * @use_edma: using edma as dma device or not
+ * @channel_bits: width of ASRCNCR register for each pair
+ * @inclk_map: clock map for input clock
+ * @outclk_map: clock map for output clock
+ */
+struct fsl_asrc_soc_data {
+	bool use_edma;
+	unsigned int channel_bits;
+	unsigned char *inclk_map;
+	unsigned char *outclk_map;
+};
+
 /**
  * fsl_asrc_pair: ASRC Pair private data
  *
@@ -431,7 +492,7 @@ struct fsl_asrc_pair {
  * @asrck_clk: clock sources to driver ASRC internal logic
  * @lock: spin lock for resource protection
  * @pair: pair pointers
- * @channel_bits: width of ASRCNCR register for each pair
+ * @soc: soc specific data
  * @channel_avail: non-occupied channel numbers
  * @asrc_rate: default sample rate for ASoC Back-Ends
  * @asrc_width: default sample width for ASoC Back-Ends
@@ -450,7 +511,7 @@ struct fsl_asrc {
 	spinlock_t lock;
 
 	struct fsl_asrc_pair *pair[ASRC_PAIR_MAX_NUM];
-	unsigned int channel_bits;
+	const struct fsl_asrc_soc_data *soc;
 	unsigned int channel_avail;
 
 	int asrc_rate;
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index d6146de9acd2..dbb07a486504 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -199,19 +199,40 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 	/* Get DMA request of Back-End */
 	tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
-	tmp_data = tmp_chan->private;
-	pair->dma_data.dma_request = tmp_data->dma_request;
-	dma_release_channel(tmp_chan);
+	/* tmp_chan may be NULL for it is already allocated by Back-End */
+	if (tmp_chan) {
+		tmp_data = tmp_chan->private;
+		if (tmp_data)
+			pair->dma_data.dma_request = tmp_data->dma_request;
+		dma_release_channel(tmp_chan);
+	}
 
 	/* Get DMA request of Front-End */
 	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
-	tmp_data = tmp_chan->private;
-	pair->dma_data.dma_request2 = tmp_data->dma_request;
-	pair->dma_data.peripheral_type = tmp_data->peripheral_type;
-	pair->dma_data.priority = tmp_data->priority;
-	dma_release_channel(tmp_chan);
+	if (tmp_chan) {
+		tmp_data = tmp_chan->private;
+		if (tmp_data) {
+			pair->dma_data.dma_request2 = tmp_data->dma_request;
+			pair->dma_data.peripheral_type =
+				 tmp_data->peripheral_type;
+			pair->dma_data.priority = tmp_data->priority;
+		}
+		dma_release_channel(tmp_chan);
+	}
 
-	pair->dma_chan[dir] = dma_request_channel(mask, filter, &pair->dma_data);
+	/*
+	 * For SDMA DEV_TO_DEV channel, we need to configure two dma requests,
+	 * one is from Front-End, another is from Back-End.
+	 * But for EDMA DEV_TO_DEV channel, only one dma request is needed.
+	 * The EDMA channel of Back-End is already allocated, we can only
+	 * get EDMA channel from Front-End.
+	 */
+	if (asrc_priv->soc->use_edma)
+		pair->dma_chan[dir] =
+			fsl_asrc_get_dma_channel(pair, dir);
+	else
+		pair->dma_chan[dir] =
+			dma_request_channel(mask, filter, &pair->dma_data);
 	if (!pair->dma_chan[dir]) {
 		dev_err(dev, "failed to request DMA channel for Back-End\n");
 		return -EINVAL;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

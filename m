Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7D13AEAC
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:11:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB32D1847;
	Tue, 14 Jan 2020 17:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB32D1847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579018307;
	bh=QW/b4NnAi6bDA0nfy5F6hwTtKBtkdKVHfuG6BOO9mGk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tnro1JoNNaW1qqZlvEeVV5PghjUZG8OOEpWCVCjTgSQM0YEyhPXYznMysqaAtvy5W
	 MFG1CybNnM7DGfObqxHCulYFgJ3aHHP/AF8/CjHjQvsBe299RYwoRL2FiHoHOVq3ez
	 RebgEGRocOkGvlpZxBk5SogV9yKNfInuzN0oE15o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D56CF802A1;
	Tue, 14 Jan 2020 17:09:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C06C8F80292; Tue, 14 Jan 2020 17:09:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AC24F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AC24F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Gp4KU0jk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QL8elIV7/kWFIzb2dMQMFGR8MhrEPyJ7y+Tb6idzyfQ=; b=Gp4KU0jkeTzU
 BM7rnbKTHdvzjqC36hYeLaNGvvSXV6G5fdhgsYSSlfIA1XbHLxgS72wUIP8Y+gj7ApLwK9dF/j5G6
 0P/AjQg1xF8VpdGCTJlOUZVf+pLWS/oFlwgbfGEK/TIqFn8V7mSl1vERdZjbr5zEh66PzB4wl+Ojb
 Ul9Cg=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOkb-0001Uk-Tv; Tue, 14 Jan 2020 16:09:05 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 1A265D02C77; Tue, 14 Jan 2020 16:09:05 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <f33dfe3157b5ab200e09ccbf9ab73d31fac6664b.1575452454.git.shengjiu.wang@nxp.com>
Message-Id: <applied-f33dfe3157b5ab200e09ccbf9ab73d31fac6664b.1575452454.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Date: Tue, 14 Jan 2020 16:09:05 +0000 (GMT)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: fsl_asrc: Add support for imx8qm &
	imx8qxp" to the asoc tree
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

   ASoC: fsl_asrc: Add support for imx8qm & imx8qxp

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From c05f10f28ef697aae8f1d82012d660af3cfc8cf9 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Wed, 4 Dec 2019 20:00:19 +0800
Subject: [PATCH] ASoC: fsl_asrc: Add support for imx8qm & imx8qxp

There are two asrc module in imx8qm & imx8qxp, each module has
different clock configuration, and the DMA type is EDMA.

So in this patch, we define the new clocks, refine the clock map,
and include struct fsl_asrc_soc_data for different soc usage.

The EDMA channel is fixed with each dma request, one dma request
corresponding to one dma channel. So we need to request dma
channel with dma request of asrc module.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/f33dfe3157b5ab200e09ccbf9ab73d31fac6664b.1575452454.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_asrc.c     | 125 +++++++++++++++++++++++++++++------
 sound/soc/fsl/fsl_asrc.h     |  64 +++++++++++++++++-
 sound/soc/fsl/fsl_asrc_dma.c |  41 ++++++++----
 3 files changed, 194 insertions(+), 36 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index a3cfceea7d2f..0dcebc24c312 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -41,26 +41,65 @@ static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints = {
  * The following tables map the relationship between asrc_inclk/asrc_outclk in
  * fsl_asrc.h and the registers of ASRCSR
  */
-static unsigned char input_clk_map_imx35[] = {
+static unsigned char input_clk_map_imx35[ASRC_CLK_MAP_LEN] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
 };
 
-static unsigned char output_clk_map_imx35[] = {
+static unsigned char output_clk_map_imx35[ASRC_CLK_MAP_LEN] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
+	3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
 };
 
 /* i.MX53 uses the same map for input and output */
-static unsigned char input_clk_map_imx53[] = {
+static unsigned char input_clk_map_imx53[ASRC_CLK_MAP_LEN] = {
 /*	0x0  0x1  0x2  0x3  0x4  0x5  0x6  0x7  0x8  0x9  0xa  0xb  0xc  0xd  0xe  0xf */
 	0x0, 0x1, 0x2, 0x7, 0x4, 0x5, 0x6, 0x3, 0x8, 0x9, 0xa, 0xb, 0xc, 0xf, 0xe, 0xd,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
-static unsigned char output_clk_map_imx53[] = {
+static unsigned char output_clk_map_imx53[ASRC_CLK_MAP_LEN] = {
 /*	0x0  0x1  0x2  0x3  0x4  0x5  0x6  0x7  0x8  0x9  0xa  0xb  0xc  0xd  0xe  0xf */
 	0x8, 0x9, 0xa, 0x7, 0xc, 0x5, 0x6, 0xb, 0x0, 0x1, 0x2, 0x3, 0x4, 0xf, 0xe, 0xd,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
+	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
-static unsigned char *clk_map[2];
+/**
+ * i.MX8QM/i.MX8QXP uses the same map for input and output.
+ * clk_map_imx8qm[0] is for i.MX8QM asrc0
+ * clk_map_imx8qm[1] is for i.MX8QM asrc1
+ * clk_map_imx8qxp[0] is for i.MX8QXP asrc0
+ * clk_map_imx8qxp[1] is for i.MX8QXP asrc1
+ */
+static unsigned char clk_map_imx8qm[2][ASRC_CLK_MAP_LEN] = {
+	{
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xa, 0xb, 0xc, 0xd, 0xe, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	},
+	{
+	0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0xb, 0xc, 0xf, 0xf, 0xd, 0xe, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	0x4, 0x5, 0x6, 0xf, 0x8, 0x9, 0xa, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	},
+};
+
+static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
+	{
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0xf, 0x7, 0x8, 0x9, 0xa, 0xb, 0xc, 0xf, 0xf,
+	0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	},
+	{
+	0xf, 0xf, 0xf, 0xf, 0xf, 0x7, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0x0,
+	0x0, 0x1, 0x2, 0x3, 0x7, 0x8, 0xf, 0xf, 0x9, 0xa, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	0xf, 0xf, 0x6, 0xf, 0xf, 0xf, 0xa, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf, 0xf,
+	},
+};
 
 /**
  * Select the pre-processing and post-processing options
@@ -353,8 +392,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	}
 
 	/* Validate input and output clock sources */
-	clk_index[IN] = clk_map[IN][config->inclk];
-	clk_index[OUT] = clk_map[OUT][config->outclk];
+	clk_index[IN] = asrc_priv->clk_map[IN][config->inclk];
+	clk_index[OUT] = asrc_priv->clk_map[OUT][config->outclk];
 
 	/* We only have output clock for ideal ratio mode */
 	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
@@ -398,13 +437,13 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
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
@@ -531,7 +570,7 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
 
 	/* Odd channel number is not valid for older ASRC (channel_bits==3) */
-	if (asrc_priv->channel_bits == 3)
+	if (asrc_priv->soc->channel_bits == 3)
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
@@ -905,6 +944,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *regs;
 	int irq, ret, i;
+	u32 map_idx;
 	char tmp[16];
 
 	asrc_priv = devm_kzalloc(&pdev->dev, sizeof(*asrc_priv), GFP_KERNEL);
@@ -964,14 +1004,37 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		}
 	}
 
+	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
+	if (!asrc_priv->soc) {
+		dev_err(&pdev->dev, "failed to get soc data\n");
+		return -ENODEV;
+	}
+
 	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
-		asrc_priv->channel_bits = 3;
-		clk_map[IN] = input_clk_map_imx35;
-		clk_map[OUT] = output_clk_map_imx35;
-	} else {
-		asrc_priv->channel_bits = 4;
-		clk_map[IN] = input_clk_map_imx53;
-		clk_map[OUT] = output_clk_map_imx53;
+		asrc_priv->clk_map[IN] = input_clk_map_imx35;
+		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
+	} else if (of_device_is_compatible(np, "fsl,imx53-asrc")) {
+		asrc_priv->clk_map[IN] = input_clk_map_imx53;
+		asrc_priv->clk_map[OUT] = output_clk_map_imx53;
+	} else if (of_device_is_compatible(np, "fsl,imx8qm-asrc") ||
+		   of_device_is_compatible(np, "fsl,imx8qxp-asrc")) {
+		ret = of_property_read_u32(np, "fsl,asrc-clk-map", &map_idx);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to get clk map index\n");
+			return ret;
+		}
+
+		if (map_idx > 1) {
+			dev_err(&pdev->dev, "unsupported clk map index\n");
+			return -EINVAL;
+		}
+		if (of_device_is_compatible(np, "fsl,imx8qm-asrc")) {
+			asrc_priv->clk_map[IN] = clk_map_imx8qm[map_idx];
+			asrc_priv->clk_map[OUT] = clk_map_imx8qm[map_idx];
+		} else {
+			asrc_priv->clk_map[IN] = clk_map_imx8qxp[map_idx];
+			asrc_priv->clk_map[OUT] = clk_map_imx8qxp[map_idx];
+		}
 	}
 
 	ret = fsl_asrc_init(asrc_priv);
@@ -1113,9 +1176,31 @@ static const struct dev_pm_ops fsl_asrc_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
 };
 
+static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
+	.use_edma = false,
+	.channel_bits = 3,
+};
+
+static const struct fsl_asrc_soc_data fsl_asrc_imx53_data = {
+	.use_edma = false,
+	.channel_bits = 4,
+};
+
+static const struct fsl_asrc_soc_data fsl_asrc_imx8qm_data = {
+	.use_edma = true,
+	.channel_bits = 4,
+};
+
+static const struct fsl_asrc_soc_data fsl_asrc_imx8qxp_data = {
+	.use_edma = true,
+	.channel_bits = 4,
+};
+
 static const struct of_device_id fsl_asrc_ids[] = {
-	{ .compatible = "fsl,imx35-asrc", },
-	{ .compatible = "fsl,imx53-asrc", },
+	{ .compatible = "fsl,imx35-asrc", .data = &fsl_asrc_imx35_data },
+	{ .compatible = "fsl,imx53-asrc", .data = &fsl_asrc_imx53_data },
+	{ .compatible = "fsl,imx8qm-asrc", .data = &fsl_asrc_imx8qm_data },
+	{ .compatible = "fsl,imx8qxp-asrc", .data = &fsl_asrc_imx8qxp_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 2b57e8c53728..8a821132d9d0 100644
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
@@ -325,9 +348,33 @@ enum asrc_outclk {
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
+#define ASRC_CLK_MAP_LEN	0x30
 
 enum asrc_word_width {
 	ASRC_WIDTH_24_BIT = 0,
@@ -387,6 +434,17 @@ struct dma_block {
 	unsigned int length;
 };
 
+/**
+ * fsl_asrc_soc_data: soc specific data
+ *
+ * @use_edma: using edma as dma device or not
+ * @channel_bits: width of ASRCNCR register for each pair
+ */
+struct fsl_asrc_soc_data {
+	bool use_edma;
+	unsigned int channel_bits;
+};
+
 /**
  * fsl_asrc_pair: ASRC Pair private data
  *
@@ -431,8 +489,9 @@ struct fsl_asrc_pair {
  * @asrck_clk: clock sources to driver ASRC internal logic
  * @lock: spin lock for resource protection
  * @pair: pair pointers
- * @channel_bits: width of ASRCNCR register for each pair
+ * @soc: soc specific data
  * @channel_avail: non-occupied channel numbers
+ * @clk_map: clock map for input/output clock
  * @asrc_rate: default sample rate for ASoC Back-Ends
  * @asrc_width: default sample width for ASoC Back-Ends
  * @regcache_cfg: store register value of REG_ASRCFG
@@ -450,8 +509,9 @@ struct fsl_asrc {
 	spinlock_t lock;
 
 	struct fsl_asrc_pair *pair[ASRC_PAIR_MAX_NUM];
-	unsigned int channel_bits;
+	const struct fsl_asrc_soc_data *soc;
 	unsigned int channel_avail;
+	unsigned char *clk_map[2];
 
 	int asrc_rate;
 	int asrc_width;
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 79d66224c0a8..ece130f59d15 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -197,21 +197,34 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	dma_cap_set(DMA_SLAVE, mask);
 	dma_cap_set(DMA_CYCLIC, mask);
 
-	/* Get DMA request of Back-End */
-	tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
-	tmp_data = tmp_chan->private;
-	pair->dma_data.dma_request = tmp_data->dma_request;
-	dma_release_channel(tmp_chan);
-
-	/* Get DMA request of Front-End */
-	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
-	tmp_data = tmp_chan->private;
-	pair->dma_data.dma_request2 = tmp_data->dma_request;
-	pair->dma_data.peripheral_type = tmp_data->peripheral_type;
-	pair->dma_data.priority = tmp_data->priority;
-	dma_release_channel(tmp_chan);
+	/*
+	 * An EDMA DEV_TO_DEV channel is fixed and bound with DMA event of each
+	 * peripheral, unlike SDMA channel that is allocated dynamically. So no
+	 * need to configure dma_request and dma_request2, but get dma_chan via
+	 * dma_request_slave_channel directly with dma name of Front-End device
+	 */
+	if (!asrc_priv->soc->use_edma) {
+		/* Get DMA request of Back-End */
+		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+		tmp_data = tmp_chan->private;
+		pair->dma_data.dma_request = tmp_data->dma_request;
+		dma_release_channel(tmp_chan);
+
+		/* Get DMA request of Front-End */
+		tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
+		tmp_data = tmp_chan->private;
+		pair->dma_data.dma_request2 = tmp_data->dma_request;
+		pair->dma_data.peripheral_type = tmp_data->peripheral_type;
+		pair->dma_data.priority = tmp_data->priority;
+		dma_release_channel(tmp_chan);
+
+		pair->dma_chan[dir] =
+			dma_request_channel(mask, filter, &pair->dma_data);
+	} else {
+		pair->dma_chan[dir] =
+			fsl_asrc_get_dma_channel(pair, dir);
+	}
 
-	pair->dma_chan[dir] = dma_request_channel(mask, filter, &pair->dma_data);
 	if (!pair->dma_chan[dir]) {
 		dev_err(dev, "failed to request DMA channel for Back-End\n");
 		return -EINVAL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

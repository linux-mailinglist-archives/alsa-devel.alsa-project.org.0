Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9733D413C1D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B5BF1661;
	Tue, 21 Sep 2021 23:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B5BF1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632258814;
	bh=evwtHaqewT61+NJNkmCXsCr8nBgCt9Hpo4tKkvvXJg8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qf9KK8D9pPgRGu82/VuYLUy2La4801i+G1In101qbPu0q1SoihFASr7TLgsNUJ4Bb
	 OvsSLPtYokAHmAjgmmPar0Q5cLW75v0SnNWTQD47Ot2jjoGkp2CK1Z/9M+dPSXUYnZ
	 njBN5nqPnYoB4/G40ApYtZgJYoeahNHQTygTubIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE6EEF804E2;
	Tue, 21 Sep 2021 23:11:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D588F802BE; Tue, 21 Sep 2021 23:11:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0ED9F8025F
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0ED9F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qmzHHsyv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67C6F61278;
 Tue, 21 Sep 2021 21:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258687;
 bh=evwtHaqewT61+NJNkmCXsCr8nBgCt9Hpo4tKkvvXJg8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qmzHHsyv8XOvJUKBC1nL8ctvrnpYNgqZ4vaQvIupUOgUupXpmbe0yFoc1EeM0Afil
 itvlOql5tZWuMfRZgxbuovMUgekIcGsZHbMARkn0lmLrSehytghhrXN1aFZ36RE3qh
 izmh9p+Z4V3h+FblKqrStpNdfAja/MdrfbYS6M/rUBHMHkJSxwbvSyAEHWA3gBxX1l
 rNPEMBsZj3rA1DboqvFYktcaFimcN5LNn6vSX/j5ll/g4jEDGzzi+qat6Ul0C8vPjp
 PEyIRp5E2FXxjcA5vUXj9dUvN1ATeRc6ugYIVXXG0dVtCDyrkGjag3Q7wg0CkJGTkF
 wckJPW7bRQNzQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 02/16] ASoC: fsl-asoc-card: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:10:26 +0100
Message-Id: <20210921211040.11624-2-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7627; h=from:subject;
 bh=evwtHaqewT61+NJNkmCXsCr8nBgCt9Hpo4tKkvvXJg8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSkncSuJHLkz99Z41ssGWE3jXs4XYevIFctTYUtoT
 8j8W9SSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ3AAKCRAk1otyXVSH0NUAB/
 4mTOjtLEzPUpmxwmBTAlMXXz9RWErbpQJ4oJSlReC+4mdN3+B1FvzlIZkHu1q7jhPZXOMoSP3D9ovo
 oSVXzXyXoMQbCixqvEcW944gL0RlTig0qLMJ92BJz5PRweZUy1HSuSppw0PBg2jK/KPeOsLy1YA9N6
 rt1/pbTV4Oj1cExMpTPxCJ07siRukGcpUnbd6Y3w6XS869XaziijuqM2yZ6ovaH4vrxqJ9gchQDVMo
 NanToXelrwNeHUGR6k6/VsI1N7zZUCGjT53EiskeuHQM5CmkdJb/4j1eEQZnElMqqm5XbIDWq3gMx3
 XVa4tuRQj8hWVsyuhuorxvnPxUGUOo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

As part of moving to remove the old style defines for the bus clocks update
the fsl-asoc-card driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 54 +++++++++++++++++------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 06107ae46e20..6e6494f9f399 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -356,8 +356,8 @@ static int fsl_asoc_card_audmux_init(struct device_node *np,
 	 * If only 4 wires are needed, just set SSI into
 	 * synchronous mode and enable 4 PADs in IOMUX.
 	 */
-	switch (priv->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (priv->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		int_ptcr = IMX_AUDMUX_V2_PTCR_RFSEL(8 | ext_port) |
 			   IMX_AUDMUX_V2_PTCR_RCSEL(8 | ext_port) |
 			   IMX_AUDMUX_V2_PTCR_TFSEL(ext_port) |
@@ -367,7 +367,7 @@ static int fsl_asoc_card_audmux_init(struct device_node *np,
 			   IMX_AUDMUX_V2_PTCR_TFSDIR |
 			   IMX_AUDMUX_V2_PTCR_TCLKDIR;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		int_ptcr = IMX_AUDMUX_V2_PTCR_RCSEL(8 | ext_port) |
 			   IMX_AUDMUX_V2_PTCR_TCSEL(ext_port) |
 			   IMX_AUDMUX_V2_PTCR_RCLKDIR |
@@ -377,7 +377,7 @@ static int fsl_asoc_card_audmux_init(struct device_node *np,
 			   IMX_AUDMUX_V2_PTCR_RFSDIR |
 			   IMX_AUDMUX_V2_PTCR_TFSDIR;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		int_ptcr = IMX_AUDMUX_V2_PTCR_RFSEL(8 | ext_port) |
 			   IMX_AUDMUX_V2_PTCR_TFSEL(ext_port) |
 			   IMX_AUDMUX_V2_PTCR_RFSDIR |
@@ -387,7 +387,7 @@ static int fsl_asoc_card_audmux_init(struct device_node *np,
 			   IMX_AUDMUX_V2_PTCR_RCLKDIR |
 			   IMX_AUDMUX_V2_PTCR_TCLKDIR;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		ext_ptcr = IMX_AUDMUX_V2_PTCR_RFSEL(8 | int_port) |
 			   IMX_AUDMUX_V2_PTCR_RCSEL(8 | int_port) |
 			   IMX_AUDMUX_V2_PTCR_TFSEL(int_port) |
@@ -533,8 +533,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	struct device_node *cpu_np, *codec_np, *asrc_np;
 	struct device_node *np = pdev->dev.of_node;
 	struct platform_device *asrc_pdev = NULL;
-	struct device_node *bitclkmaster = NULL;
-	struct device_node *framemaster = NULL;
+	struct device_node *bitclkprovider = NULL;
+	struct device_node *frameprovider = NULL;
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
 	struct device *codec_dev = NULL;
@@ -617,29 +617,29 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.slot_width = 32;
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-cs427x")) {
 		codec_dai_name = "cs4271-hifi";
 		priv->codec_priv.mclk_id = CS427x_SYSCLK_MCLK;
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-sgtl5000")) {
 		codec_dai_name = "sgtl5000";
 		priv->codec_priv.mclk_id = SGTL5000_SYSCLK;
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic32x4")) {
 		codec_dai_name = "tlv320aic32x4-hifi";
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8962")) {
 		codec_dai_name = "wm8962";
 		priv->codec_priv.mclk_id = WM8962_SYSCLK_MCLK;
 		priv->codec_priv.fll_id = WM8962_SYSCLK_FLL;
 		priv->codec_priv.pll_id = WM8962_FLL;
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8960")) {
 		codec_dai_name = "wm8960-hifi";
 		priv->codec_priv.fll_id = WM8960_SYSCLK_AUTO;
 		priv->codec_priv.pll_id = WM8960_SYSCLK_AUTO;
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-ac97")) {
 		codec_dai_name = "ac97-hifi";
 		priv->dai_fmt = SND_SOC_DAIFMT_AC97;
@@ -648,7 +648,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-mqs")) {
 		codec_dai_name = "fsl-mqs-dai";
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
-				SND_SOC_DAIFMT_CBS_CFS |
+				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
 		priv->dai_link[1].dpcm_capture = 0;
 		priv->dai_link[2].dpcm_capture = 0;
@@ -656,7 +656,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name = "wm8524-hifi";
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
 		priv->dai_link[1].dpcm_capture = 0;
 		priv->dai_link[2].dpcm_capture = 0;
 		priv->cpu_priv.slot_width = 32;
@@ -664,12 +664,12 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-si476x")) {
 		codec_dai_name = "si476x-codec";
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
 		priv->card.dapm_routes = audio_map_rx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_rx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8958")) {
 		codec_dai_name = "wm8994-aif1";
-		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 		priv->codec_priv.mclk_id = WM8994_FLL_SRC_MCLK1;
 		priv->codec_priv.fll_id = WM8994_SYSCLK_FLL1;
 		priv->codec_priv.pll_id = WM8994_FLL1;
@@ -683,29 +683,29 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	}
 
 	/* Format info from DT is optional. */
-	snd_soc_daifmt_parse_clock_provider_as_phandle(np, NULL, &bitclkmaster, &framemaster);
-	if (bitclkmaster || framemaster) {
+	snd_soc_daifmt_parse_clock_provider_as_phandle(np, NULL, &bitclkprovider, &frameprovider);
+	if (bitclkprovider || frameprovider) {
 		unsigned int daifmt = snd_soc_daifmt_parse_format(np, NULL);
 
-		if (codec_np == bitclkmaster)
-			daifmt |= (codec_np == framemaster) ?
-				SND_SOC_DAIFMT_CBM_CFM : SND_SOC_DAIFMT_CBM_CFS;
+		if (codec_np == bitclkprovider)
+			daifmt |= (codec_np == frameprovider) ?
+				SND_SOC_DAIFMT_CBP_CFP : SND_SOC_DAIFMT_CBP_CFC;
 		else
-			daifmt |= (codec_np == framemaster) ?
-				SND_SOC_DAIFMT_CBS_CFM : SND_SOC_DAIFMT_CBS_CFS;
+			daifmt |= (codec_np == frameprovider) ?
+				SND_SOC_DAIFMT_CBC_CFP : SND_SOC_DAIFMT_CBC_CFC;
 
 		/* Override dai_fmt with value from DT */
 		priv->dai_fmt = daifmt;
 	}
 
 	/* Change direction according to format */
-	if (priv->dai_fmt & SND_SOC_DAIFMT_CBM_CFM) {
+	if (priv->dai_fmt & SND_SOC_DAIFMT_CBP_CFP) {
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_IN;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_IN;
 	}
 
-	of_node_put(bitclkmaster);
-	of_node_put(framemaster);
+	of_node_put(bitclkprovider);
+	of_node_put(frameprovider);
 
 	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
 		dev_dbg(&pdev->dev, "failed to find codec device\n");
-- 
2.20.1


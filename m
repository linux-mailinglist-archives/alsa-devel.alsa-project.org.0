Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA64A1D78
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88AB816AD;
	Thu, 29 Aug 2019 16:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88AB816AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089913;
	bh=0J8OAg/0rQjlPbADXBxhhfr+55RaCJybLhNGw9dkLGk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bPW7/AJ05FtiOlUuG71zwyZO5ARAbonVVRkr8R6aaxHZulUCtKYOwTlsu3rrRKyWL
	 7ibWYCWgNkT/pIq//OeW5alxw8fOkJtxuTMLs7pKAU+YftMNWbu3c03F93D5o4U5Zo
	 0PQNOOVqRaCWKI/I7idRZZQjGH1orZRp28/CvKhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4DE6F897AA;
	Wed, 28 Aug 2019 15:13:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C01CF89796; Wed, 28 Aug 2019 15:13:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B190DF89791
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 15:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B190DF89791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="F24Nzq+J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=rUr9B1xxK7U8w0mrBdT07DfbnLIKHUZhzrg+7inhwn4=; b=F24Nzq+JtGq5
 M9QINSb8OGqT5OWqKoBp3eu7uUlS4vU9b8xGVLQZzN/EUiGpFxOEa5OLwv7sXv61Lr5m9Js/TZh0G
 tINsuC4sEXyetVVxa7fpcOoUwMsC1wDFRgTfsmVgXo/wyWS/E2FJgW2VDqBRG9A5Lbyc/vwPUU9Ys
 uuR2A=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i2xl6-0004Gn-HS; Wed, 28 Aug 2019 13:13:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 47A592742CA0; Wed, 28 Aug 2019 14:13:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <1566621445-26989-3-git-send-email-jiaxin.yu@mediatek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190828131307.47A592742CA0@ypsilon.sirena.org.uk>
Date: Wed, 28 Aug 2019 14:13:07 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183: tdm hw support tdm
	out and 8ch i2s out" to the asoc tree
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

   ASoC: mediatek: mt8183: tdm hw support tdm out and 8ch i2s out

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 8e58c521bcb823bfd6e81f4a85b76afdce098b1d Mon Sep 17 00:00:00 2001
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
Date: Sat, 24 Aug 2019 12:37:24 +0800
Subject: [PATCH] ASoC: mediatek: mt8183: tdm hw support tdm out and 8ch i2s
 out

This patch refined tdm driver code, and allow tdm hw to support two
configurations in machine driver to output tdm signal or i2s signal.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Link: https://lore.kernel.org/r/1566621445-26989-3-git-send-email-jiaxin.yu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c    | 175 ++++++++++++++----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |   3 +
 2 files changed, 144 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
index 8983d54a9b67..d34cabdbf889 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-tdm.c
@@ -15,13 +15,30 @@
 struct mtk_afe_tdm_priv {
 	int bck_id;
 	int bck_rate;
-
+	int tdm_out_mode;
+	int bck_invert;
+	int lck_invert;
 	int mclk_id;
 	int mclk_multiple; /* according to sample rate */
 	int mclk_rate;
 	int mclk_apll;
 };
 
+enum {
+	TDM_OUT_I2S = 0,
+	TDM_OUT_TDM = 1,
+};
+
+enum {
+	TDM_BCK_NON_INV = 0,
+	TDM_BCK_INV = 1,
+};
+
+enum {
+	TDM_LCK_NON_INV = 0,
+	TDM_LCK_INV = 1,
+};
+
 enum {
 	TDM_WLEN_16_BIT = 1,
 	TDM_WLEN_32_BIT = 2,
@@ -93,6 +110,25 @@ static unsigned int get_tdm_ch(unsigned int ch)
 	}
 }
 
+static unsigned int get_tdm_ch_fixup(unsigned int channels)
+{
+	if (channels > 4)
+		return 8;
+	else if (channels > 2)
+		return 4;
+	else
+		return 2;
+}
+
+static unsigned int get_tdm_ch_per_sdata(unsigned int mode,
+					 unsigned int channels)
+{
+	if (mode == TDM_OUT_TDM)
+		return get_tdm_ch_fixup(channels);
+	else
+		return 2;
+}
+
 /* interconnection */
 enum {
 	HDMI_CONN_CH0 = 0,
@@ -433,8 +469,11 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 	struct mt8183_afe_private *afe_priv = afe->platform_priv;
 	int tdm_id = dai->id;
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[tdm_id];
+	unsigned int tdm_out_mode = tdm_priv->tdm_out_mode;
 	unsigned int rate = params_rate(params);
 	unsigned int channels = params_channels(params);
+	unsigned int out_channels_per_sdata =
+		get_tdm_ch_per_sdata(tdm_out_mode, channels);
 	snd_pcm_format_t format = params_format(params);
 	unsigned int tdm_con = 0;
 
@@ -448,7 +487,7 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 
 	/* calculate bck */
 	tdm_priv->bck_rate = rate *
-			     channels *
+			     out_channels_per_sdata *
 			     snd_pcm_format_physical_width(format);
 
 	if (tdm_priv->bck_rate > tdm_priv->mclk_rate)
@@ -461,50 +500,70 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 		 __func__,
 		 tdm_id, rate, channels, format,
 		 tdm_priv->mclk_rate, tdm_priv->bck_rate);
+	dev_info(afe->dev, "%s(), out_channels_per_sdata = %d\n",
+		 __func__, out_channels_per_sdata);
 
 	/* set tdm */
-	tdm_con = 1 << BCK_INVERSE_SFT;
-	tdm_con |= 1 << LRCK_INVERSE_SFT;
-	tdm_con |= 1 << DELAY_DATA_SFT;
+	if (tdm_priv->bck_invert)
+		tdm_con |= 1 << BCK_INVERSE_SFT;
+
+	if (tdm_priv->lck_invert)
+		tdm_con |= 1 << LRCK_INVERSE_SFT;
+
+	if (tdm_priv->tdm_out_mode == TDM_OUT_I2S) {
+		tdm_con |= 1 << DELAY_DATA_SFT;
+		tdm_con |= get_tdm_lrck_width(format) << LRCK_TDM_WIDTH_SFT;
+	} else if (tdm_priv->tdm_out_mode == TDM_OUT_TDM) {
+		tdm_con |= 0 << DELAY_DATA_SFT;
+		tdm_con |= 0 << LRCK_TDM_WIDTH_SFT;
+	}
+
 	tdm_con |= 1 << LEFT_ALIGN_SFT;
 	tdm_con |= get_tdm_wlen(format) << WLEN_SFT;
-	tdm_con |= get_tdm_ch(channels) << CHANNEL_NUM_SFT;
+	tdm_con |= get_tdm_ch(out_channels_per_sdata) << CHANNEL_NUM_SFT;
 	tdm_con |= get_tdm_channel_bck(format) << CHANNEL_BCK_CYCLES_SFT;
-	tdm_con |= get_tdm_lrck_width(format) << LRCK_TDM_WIDTH_SFT;
 	regmap_write(afe->regmap, AFE_TDM_CON1, tdm_con);
 
-	switch (channels) {
-	case 1:
-	case 2:
+	if (out_channels_per_sdata == 2) {
+		switch (channels) {
+		case 1:
+		case 2:
+			tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT1_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
+			break;
+		case 3:
+		case 4:
+			tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+			tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
+			break;
+		case 5:
+		case 6:
+			tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+			tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
+			tdm_con |= TDM_CH_START_O34_O35 << ST_CH_PAIR_SOUT2_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
+			break;
+		case 7:
+		case 8:
+			tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+			tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
+			tdm_con |= TDM_CH_START_O34_O35 << ST_CH_PAIR_SOUT2_SFT;
+			tdm_con |= TDM_CH_START_O36_O37 << ST_CH_PAIR_SOUT3_SFT;
+			break;
+		default:
+			tdm_con = 0;
+		}
+	} else {
 		tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
 		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT1_SFT;
 		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
 		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
-		break;
-	case 3:
-	case 4:
-		tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
-		tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
-		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
-		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
-		break;
-	case 5:
-	case 6:
-		tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
-		tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
-		tdm_con |= TDM_CH_START_O34_O35 << ST_CH_PAIR_SOUT2_SFT;
-		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
-		break;
-	case 7:
-	case 8:
-		tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
-		tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
-		tdm_con |= TDM_CH_START_O34_O35 << ST_CH_PAIR_SOUT2_SFT;
-		tdm_con |= TDM_CH_START_O36_O37 << ST_CH_PAIR_SOUT3_SFT;
-		break;
-	default:
-		tdm_con = 0;
 	}
+
 	regmap_write(afe->regmap, AFE_TDM_CON2, tdm_con);
 
 	regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0,
@@ -573,10 +632,58 @@ static int mtk_dai_tdm_set_sysclk(struct snd_soc_dai *dai,
 	return mtk_dai_tdm_cal_mclk(afe, tdm_priv, freq);
 }
 
+static int mtk_dai_tdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
+	struct mt8183_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai->id];
+
+	if (!tdm_priv) {
+		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
+		return -EINVAL;
+	}
+
+	/* DAI mode*/
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		tdm_priv->tdm_out_mode = TDM_OUT_I2S;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		tdm_priv->tdm_out_mode = TDM_OUT_TDM;
+		break;
+	default:
+		tdm_priv->tdm_out_mode = TDM_OUT_I2S;
+	}
+
+	/* DAI clock inversion*/
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		tdm_priv->bck_invert = TDM_BCK_NON_INV;
+		tdm_priv->lck_invert = TDM_LCK_NON_INV;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		tdm_priv->bck_invert = TDM_BCK_NON_INV;
+		tdm_priv->lck_invert = TDM_LCK_INV;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		tdm_priv->bck_invert = TDM_BCK_INV;
+		tdm_priv->lck_invert = TDM_LCK_NON_INV;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+	default:
+		tdm_priv->bck_invert = TDM_BCK_INV;
+		tdm_priv->lck_invert = TDM_LCK_INV;
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops mtk_dai_tdm_ops = {
 	.hw_params = mtk_dai_tdm_hw_params,
 	.trigger = mtk_dai_tdm_trigger,
 	.set_sysclk = mtk_dai_tdm_set_sysclk,
+	.set_fmt = mtk_dai_tdm_set_fmt,
 };
 
 /* dai driver */
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 951706fa75fc..560fcc5923a4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -380,6 +380,9 @@ mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 	{
 		.name = "TDM",
 		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			   SND_SOC_DAIFMT_IB_IF |
+			   SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

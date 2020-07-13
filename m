Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F19C21957A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 03:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 739B01612;
	Thu,  9 Jul 2020 02:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 739B01612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594256423;
	bh=9pGEHC+W0kWUgpDr7BUZxA1GQr5JE0rIcb2rPYwk808=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=phU+BB+QMGmkn1uz2PSS4qX1OdWXUQs8SKJwJMBU96jvjY5moTNIqTqjOkk51rEp6
	 NPFp67PSpDDMgXi+52D6zU7HR19aI9aAi+sTUnG7xI58wdFcMcIdiXNDgdbE21qb9r
	 aKN7M14PhYAh3rI0QXxFmaoR2GKlqhWDraaVslbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D8CF8015C;
	Thu,  9 Jul 2020 02:58:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86078F8015A; Thu,  9 Jul 2020 02:58:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EF47F80115
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 02:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF47F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vzTvCcT0"
Received: from embeddedor (unknown [201.162.240.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C884020772;
 Thu,  9 Jul 2020 00:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594256311;
 bh=9pGEHC+W0kWUgpDr7BUZxA1GQr5JE0rIcb2rPYwk808=;
 h=Date:From:To:Cc:Subject:From;
 b=vzTvCcT0vxtv/bbknj5kvfiDSx9YpT1ct10A5E/DZXjkNOP52KNHvorxn0fO46O6Z
 yGY50sWr2gHwKoXe4n05UUdvb8xOfaBKABMhkTd90dlk8H/RokGiRX2QWb9ZwgRvAg
 Mmru6mxaT1Je2trBssr4tj1Ab9C3NaYFybhy24fQ=
Date: Wed, 8 Jul 2020 20:03:59 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Peter Rosin <peda@axentia.se>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH][next] ASoC: codecs: Use fallthrough pseudo-keyword
Message-ID: <20200709010359.GA18971@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1].

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/soc/codecs/ab8500-codec.c       | 2 +-
 sound/soc/codecs/adau1761.c           | 4 ++--
 sound/soc/codecs/adau17x1.c           | 4 ++--
 sound/soc/codecs/adav80x.c            | 2 +-
 sound/soc/codecs/ak4613.c             | 6 +++---
 sound/soc/codecs/es8328.c             | 4 ++--
 sound/soc/codecs/max9860.c            | 2 +-
 sound/soc/codecs/msm8916-wcd-analog.c | 2 +-
 sound/soc/codecs/rt274.c              | 4 ++--
 sound/soc/codecs/rt5640.c             | 4 ++--
 sound/soc/codecs/rt5677.c             | 2 +-
 sound/soc/codecs/sta32x.c             | 2 +-
 sound/soc/codecs/sta350.c             | 2 +-
 sound/soc/codecs/tas2552.c            | 2 +-
 sound/soc/codecs/tlv320aic23.c        | 2 +-
 sound/soc/codecs/tlv320aic31xx.c      | 3 ++-
 sound/soc/codecs/tpa6130a2.c          | 2 +-
 sound/soc/codecs/wm8753.c             | 6 ++++--
 sound/soc/codecs/wm8903.c             | 2 +-
 sound/soc/codecs/wm8904.c             | 4 ++--
 sound/soc/codecs/wm8955.c             | 2 +-
 sound/soc/codecs/wm8960.c             | 2 +-
 sound/soc/codecs/wm8961.c             | 2 +-
 sound/soc/codecs/wm8962.c             | 2 +-
 sound/soc/codecs/wm8993.c             | 4 ++--
 sound/soc/codecs/wm8994.c             | 4 ++--
 sound/soc/codecs/wm8995.c             | 2 +-
 sound/soc/codecs/wm8996.c             | 2 +-
 sound/soc/codecs/wm9081.c             | 2 +-
 29 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index ea92007d1ef5..31a8c4162d20 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -2126,7 +2126,7 @@ static int ab8500_codec_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		dev_err(dai->component->dev,
 			"%s: ERROR: The device is either a master or a slave.\n",
 			__func__);
-		/* fall through */
+		fallthrough;
 	default:
 		dev_err(dai->component->dev,
 			"%s: ERROR: Unsupporter master mask 0x%x\n",
diff --git a/sound/soc/codecs/adau1761.c b/sound/soc/codecs/adau1761.c
index 5ca9b744b7d8..fb006fc81653 100644
--- a/sound/soc/codecs/adau1761.c
+++ b/sound/soc/codecs/adau1761.c
@@ -642,7 +642,7 @@ static int adau1761_setup_digmic_jackdetect(struct snd_soc_component *component)
 			ARRAY_SIZE(adau1761_jack_detect_controls));
 		if (ret)
 			return ret;
-		/* fall through */
+		fallthrough;
 	case ADAU1761_DIGMIC_JACKDET_PIN_MODE_NONE:
 		ret = snd_soc_dapm_add_routes(dapm, adau1761_no_dmic_routes,
 			ARRAY_SIZE(adau1761_no_dmic_routes));
@@ -693,7 +693,7 @@ static int adau1761_setup_headphone_mode(struct snd_soc_component *component)
 			ADAU1761_PLAY_MONO_OUTPUT_VOL_UNMUTE,
 			ADAU1761_PLAY_MONO_OUTPUT_VOL_MODE_HP |
 			ADAU1761_PLAY_MONO_OUTPUT_VOL_UNMUTE);
-		/* fallthrough */
+		fallthrough;
 	case ADAU1761_OUTPUT_MODE_HEADPHONE:
 		regmap_update_bits(adau->regmap, ADAU1761_PLAY_HP_RIGHT_VOL,
 			ADAU1761_PLAY_HP_RIGHT_VOL_MODE_HP,
diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index b6352de077b5..30e072c80ac1 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -385,7 +385,7 @@ static int adau17x1_set_dai_sysclk(struct snd_soc_dai *dai,
 	case ADAU17X1_CLK_SRC_PLL_AUTO:
 		if (!adau->mclk)
 			return -EINVAL;
-		/* Fall-through */
+		fallthrough;
 	case ADAU17X1_CLK_SRC_PLL:
 		is_pll = true;
 		break;
@@ -469,7 +469,7 @@ static int adau17x1_hw_params(struct snd_pcm_substream *substream,
 		ret = adau17x1_auto_pll(dai, params);
 		if (ret)
 			return ret;
-		/* Fall-through */
+		fallthrough;
 	case ADAU17X1_CLK_SRC_PLL:
 		freq = adau->pll_freq;
 		break;
diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index c4b9722c3d8f..4fd99280d7db 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -647,7 +647,7 @@ static int adav80x_set_pll(struct snd_soc_component *component, int pll_id,
 			pll_ctrl1 |= ADAV80X_PLL_CTRL1_PLLDIV;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		return -EINVAL;
 	}
diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index d4d2f0d9231a..8d663e8d64c4 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -451,13 +451,13 @@ static int ak4613_set_bias_level(struct snd_soc_component *component,
 	switch (level) {
 	case SND_SOC_BIAS_ON:
 		mgmt1 |= RSTN;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_BIAS_PREPARE:
 		mgmt1 |= PMADC | PMDAC;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_BIAS_STANDBY:
 		mgmt1 |= PMVR;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_BIAS_OFF:
 	default:
 		break;
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index fdf64c29f563..757e740459fb 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -562,14 +562,14 @@ static int es8328_set_sysclk(struct snd_soc_dai *codec_dai,
 		break;
 	case 22579200:
 		mclkdiv2 = 1;
-		/* fall through */
+		fallthrough;
 	case 11289600:
 		es8328->sysclk_constraints = &constraints_11289;
 		es8328->mclk_ratios = ratios_11289;
 		break;
 	case 24576000:
 		mclkdiv2 = 1;
-		/* fall through */
+		fallthrough;
 	case 12288000:
 		es8328->sysclk_constraints = &constraints_12288;
 		es8328->mclk_ratios = ratios_12288;
diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 8be636fe6552..d5925c42b4b5 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -334,7 +334,7 @@ static int max9860_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 		ifc1a ^= MAX9860_WCI;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_IB_NF:
 		ifc1a ^= MAX9860_DBCI;
 		ifc1b ^= MAX9860_ABCI;
diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 30da00a3e789..4428c62e25cf 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -608,7 +608,7 @@ static int pm8916_wcd_analog_enable_adc(struct snd_soc_dapm_widget *w,
 		case CDC_A_TX_2_EN:
 			snd_soc_component_update_bits(component, CDC_A_MICB_1_CTL,
 					    MICB_1_CTL_CFILT_REF_SEL_MASK, 0);
-			/* fall through */
+			fallthrough;
 		case CDC_A_TX_3_EN:
 			snd_soc_component_update_bits(component, CDC_D_CDC_CONN_TX2_CTL,
 					    CONN_TX2_SERIAL_TX2_MUX,
diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index cbb5e176d11a..923b8f919189 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -760,7 +760,7 @@ static int rt274_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 		break;
 	default:
 		dev_warn(component->dev, "invalid pll source, use BCLK\n");
-		/* fall through */
+		fallthrough;
 	case RT274_PLL2_S_BCLK:
 		snd_soc_component_update_bits(component, RT274_PLL2_CTRL,
 				RT274_PLL2_SRC_MASK, RT274_PLL2_SRC_BCLK);
@@ -788,7 +788,7 @@ static int rt274_set_dai_pll(struct snd_soc_dai *dai, int pll_id, int source,
 			break;
 		default:
 			dev_warn(component->dev, "invalid freq_in, assume 4.8M\n");
-			/* fall through */
+			fallthrough;
 		case 100:
 			snd_soc_component_write(component, 0x7a, 0xaab6);
 			snd_soc_component_write(component, 0x7b, 0x0301);
diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 3b2bb62a2136..1414ad15d01c 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1662,7 +1662,7 @@ static int get_sdp_info(struct snd_soc_component *component, int dai_id)
 			break;
 		case RT5640_IF_113:
 			ret |= RT5640_U_IF1;
-			/* fall through */
+			fallthrough;
 		case RT5640_IF_312:
 		case RT5640_IF_213:
 			ret |= RT5640_U_IF2;
@@ -1678,7 +1678,7 @@ static int get_sdp_info(struct snd_soc_component *component, int dai_id)
 			break;
 		case RT5640_IF_223:
 			ret |= RT5640_U_IF1;
-			/* fall through */
+			fallthrough;
 		case RT5640_IF_123:
 		case RT5640_IF_321:
 			ret |= RT5640_U_IF2;
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index e9a051a50ab2..9e449d35fc28 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4609,7 +4609,7 @@ static int rt5677_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		break;
 	case 25:
 		slot_width_25 = 0x8080;
-		/* fall through */
+		fallthrough;
 	case 24:
 		val |= (2 << 8);
 		break;
diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index e8d2ca4b4603..86528b930de8 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -697,7 +697,7 @@ static int sta32x_hw_params(struct snd_pcm_substream *substream,
 	switch (params_width(params)) {
 	case 24:
 		dev_dbg(component->dev, "24bit\n");
-		/* fall through */
+		fallthrough;
 	case 32:
 		dev_dbg(component->dev, "24bit or 32bit\n");
 		switch (sta32x->format) {
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index ccb7100b6644..75d3b0618ab5 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -726,7 +726,7 @@ static int sta350_hw_params(struct snd_pcm_substream *substream,
 	switch (params_width(params)) {
 	case 24:
 		dev_dbg(component->dev, "24bit\n");
-		/* fall through */
+		fallthrough;
 	case 32:
 		dev_dbg(component->dev, "24bit or 32bit\n");
 		switch (sta350->format) {
diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 529c0fb93f9b..d9d239d4256e 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -407,7 +407,7 @@ static int tas2552_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 			clk_id = TAS2552_PLL_CLKIN_BCLK;
 			freq = 0;
 		}
-		/* fall through */
+		fallthrough;
 	case TAS2552_PLL_CLKIN_BCLK:
 	case TAS2552_PLL_CLKIN_1_8_FIXED:
 		mask = TAS2552_PLL_SRC_MASK;
diff --git a/sound/soc/codecs/tlv320aic23.c b/sound/soc/codecs/tlv320aic23.c
index d22f75e8fb6a..7d5b6dbf6273 100644
--- a/sound/soc/codecs/tlv320aic23.c
+++ b/sound/soc/codecs/tlv320aic23.c
@@ -449,7 +449,7 @@ static int tlv320aic23_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
 		iface_reg |= TLV320AIC23_LRP_ON;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_B:
 		iface_reg |= TLV320AIC23_FOR_DSP;
 		break;
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 31daa60695bd..6694e56cfe1f 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1080,7 +1080,8 @@ static int aic31xx_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	case SND_SOC_DAIFMT_I2S:
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-		dsp_a_val = 0x1; /* fall through */
+		dsp_a_val = 0x1;
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_B:
 		/*
 		 * NOTE: This CODEC samples on the falling edge of BCLK in
diff --git a/sound/soc/codecs/tpa6130a2.c b/sound/soc/codecs/tpa6130a2.c
index 0b1f1a5e2a2d..e2d7ae615c52 100644
--- a/sound/soc/codecs/tpa6130a2.c
+++ b/sound/soc/codecs/tpa6130a2.c
@@ -261,7 +261,7 @@ static int tpa6130a2_probe(struct i2c_client *client,
 	default:
 		dev_warn(dev, "Unknown TPA model (%d). Assuming 6130A2\n",
 			 data->id);
-		/* fall through */
+		fallthrough;
 	case TPA6130A2:
 		regulator = "Vdd";
 		break;
diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index a1b6765c8f23..f3c31121d100 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -966,7 +966,8 @@ static int wm8753_pcm_set_dai_fmt(struct snd_soc_component *component,
 	case SND_SOC_DAIFMT_CBS_CFS:
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM:
-		ioctl |= 0x2; /* fall through */
+		ioctl |= 0x2;
+		fallthrough;
 	case SND_SOC_DAIFMT_CBM_CFS:
 		voice |= 0x0040;
 		break;
@@ -1091,7 +1092,8 @@ static int wm8753_i2s_set_dai_fmt(struct snd_soc_component *component,
 	case SND_SOC_DAIFMT_CBS_CFS:
 		break;
 	case SND_SOC_DAIFMT_CBM_CFM:
-		ioctl |= 0x1; /* fall through */
+		ioctl |= 0x1;
+		fallthrough;
 	case SND_SOC_DAIFMT_CBM_CFS:
 		hifi |= 0x0040;
 		break;
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 5de663d61ba6..a52cb8fee82f 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1927,7 +1927,7 @@ static int wm8903_set_pdata_irq_trigger(struct i2c_client *i2c,
 		* We assume the controller imposes no restrictions,
 		* so we are able to select active-high
 		*/
-		/* Fall-through */
+		fallthrough;
 	case IRQ_TYPE_LEVEL_HIGH:
 		pdata->irq_active_low = false;
 		break;
diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 3f0e49c51fd5..d54257097d56 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1436,7 +1436,7 @@ static int wm8904_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_B:
 		aif1 |= 0x3 | WM8904_AIF_LRCLK_INV;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_A:
 		aif1 |= 0x3;
 		break;
@@ -1824,7 +1824,7 @@ static int wm8904_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 			break;
 		}
 		clk_id = WM8904_CLK_MCLK;
-		/* fallthrough */
+		fallthrough;
 
 	case WM8904_CLK_MCLK:
 		priv->sysclk_src = clk_id;
diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index 73c192f58382..0630dcb66c6f 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -683,7 +683,7 @@ static int wm8955_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_B:
 		aif |= WM8955_LRP;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_A:
 		aif |= 0x3;
 		break;
diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 9dca6e28032a..e1ab2be51ee7 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -836,7 +836,7 @@ static int wm8960_hw_params(struct snd_pcm_substream *substream,
 			iface |= 0x000c;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		dev_err(component->dev, "unsupported width %d\n",
 			params_width(params));
diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index d11a38a0b283..e62a0a8ac297 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -650,7 +650,7 @@ static int wm8961_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	case SND_SOC_DAIFMT_DSP_B:
 		aif |= WM8961_LRP;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_A:
 		aif |= 3;
 		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 6ef022295f55..df8cdc71357d 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2645,7 +2645,7 @@ static int wm8962_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_B:
 		aif0 |= WM8962_LRCLK_INV | 3;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_A:
 		aif0 |= 3;
 
diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index 207c0211caa9..8c9f82efcceb 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -1073,7 +1073,7 @@ static int wm8993_set_sysclk(struct snd_soc_dai *codec_dai,
 	switch (clk_id) {
 	case WM8993_SYSCLK_MCLK:
 		wm8993->mclk_rate = freq;
-		/* fall through */
+		fallthrough;
 	case WM8993_SYSCLK_FLL:
 		wm8993->sysclk_source = clk_id;
 		break;
@@ -1121,7 +1121,7 @@ static int wm8993_set_dai_fmt(struct snd_soc_dai *dai,
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_B:
 		aif1 |= WM8993_AIF_LRCLK_INV;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_A:
 		aif1 |= 0x18;
 		break;
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 75242ec47406..903f8e81cd89 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -853,7 +853,7 @@ static void vmid_reference(struct snd_soc_component *component)
 		switch (wm8994->vmid_mode) {
 		default:
 			WARN_ON(NULL == "Invalid VMID mode");
-			/* fall through */
+			fallthrough;
 		case WM8994_VMID_NORMAL:
 			/* Startup bias, VMID ramp & buffer */
 			snd_soc_component_update_bits(component, WM8994_ANTIPOP_2,
@@ -2776,7 +2776,7 @@ static int wm8994_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_DSP_B:
 		aif1 |= WM8994_AIF1_LRCLK_INV;
 		lrclk |= WM8958_AIF1_LRCLK_INV;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_A:
 		aif1 |= 0x18;
 		break;
diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 276ffa84cc31..ec752819cb2c 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -1462,7 +1462,7 @@ static int wm8995_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_B:
 		aif |= WM8995_AIF1_LRCLK_INV;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_A:
 		aif |= (0x3 << WM8995_AIF1_FMT_SHIFT);
 		break;
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index 1d3b3f4e66b3..d303ef7571e9 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -1854,7 +1854,7 @@ static int wm8996_set_sysclk(struct snd_soc_dai *dai,
 	case 24576000:
 		ratediv = WM8996_SYSCLK_DIV;
 		wm8996->sysclk /= 2;
-		/* fall through */
+		fallthrough;
 	case 11289600:
 	case 12288000:
 		snd_soc_component_update_bits(component, WM8996_AIF_RATE,
diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index be5c9c2b0162..b5465e486fb5 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -929,7 +929,7 @@ static int wm9081_set_dai_fmt(struct snd_soc_dai *dai,
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_B:
 		aif2 |= WM9081_AIF_LRCLK_INV;
-		/* fall through */
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_A:
 		aif2 |= 0x3;
 		break;
-- 
2.27.0


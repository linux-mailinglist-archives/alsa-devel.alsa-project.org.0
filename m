Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A8232FDC
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 11:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E25175A;
	Thu, 30 Jul 2020 11:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E25175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596102801;
	bh=q55ZW2K6iMjexP9iQeoUHvFwcRSgGBF5spkI75OMHPc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KgqOFYDIkF5d4N8ypSYM4iJ48wAYgaLmg8y1afyDegNb9ZLB1H04Fgk17l5wwlHX0
	 EI5n6Pc0Zgxd1bR9mzemDU+aO7IkSQIN5rHuJJ41wpfFgbyJEGS3chtocsUulEx2jZ
	 Hdf/Xok2iYjSvGNKwcqPvufPHJpIO33K11mTRaCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F9B3F80227;
	Thu, 30 Jul 2020 11:51:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FD81F8021E; Thu, 30 Jul 2020 11:51:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87D64F8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 11:51:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87D64F8012F
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F3FD01A03AA;
 Thu, 30 Jul 2020 11:51:26 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5BEF61A04C3;
 Thu, 30 Jul 2020 11:51:22 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8FD26402AA;
 Thu, 30 Jul 2020 11:51:16 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: fsl-asoc-card: Remove fsl_asoc_card_set_bias_level
 function
Date: Thu, 30 Jul 2020 17:47:02 +0800
Message-Id: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

With this case:
aplay -Dhw:x 16khz.wav 24khz.wav
There is sound distortion for 24khz.wav. The reason is that setting
PLL of WM8962 with set_bias_level function, the bias level is not
changed when 24khz.wav is played, then the PLL won't be reset, the
clock is not correct, so distortion happens.

The resolution of this issue is to remove fsl_asoc_card_set_bias_level.
Move PLL configuration to hw_params and hw_free.

After removing fsl_asoc_card_set_bias_level, also test WM8960 case,
it can work.

Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- replace is_stream_in_use with streams
- add "out" error handler in hw_params()

 sound/soc/fsl/fsl-asoc-card.c | 155 ++++++++++++++++------------------
 1 file changed, 71 insertions(+), 84 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 4848ba61d083..b6a2a527dc04 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -73,6 +73,7 @@ struct cpu_priv {
  * @codec_priv: CODEC private data
  * @cpu_priv: CPU private data
  * @card: ASoC card structure
+ * @streams: Mask of current active streams
  * @sample_rate: Current sample rate
  * @sample_format: Current sample format
  * @asrc_rate: ASRC sample rate used by Back-Ends
@@ -89,6 +90,7 @@ struct fsl_asoc_card_priv {
 	struct codec_priv codec_priv;
 	struct cpu_priv cpu_priv;
 	struct snd_soc_card card;
+	u8 streams;
 	u32 sample_rate;
 	snd_pcm_format_t sample_format;
 	u32 asrc_rate;
@@ -151,21 +153,17 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	struct codec_priv *codec_priv = &priv->codec_priv;
 	struct cpu_priv *cpu_priv = &priv->cpu_priv;
 	struct device *dev = rtd->card->dev;
+	unsigned int pll_out;
 	int ret;
 
 	priv->sample_rate = params_rate(params);
 	priv->sample_format = params_format(params);
+	priv->streams |= BIT(substream->stream);
 
-	/*
-	 * If codec-dai is DAI Master and all configurations are already in the
-	 * set_bias_level(), bypass the remaining settings in hw_params().
-	 * Note: (dai_fmt & CBM_CFM) includes CBM_CFM and CBM_CFS.
-	 */
-	if ((priv->card.set_bias_level &&
-	     priv->dai_fmt & SND_SOC_DAIFMT_CBM_CFM) ||
-	    fsl_asoc_card_is_ac97(priv))
+	if (fsl_asoc_card_is_ac97(priv))
 		return 0;
 
 	/* Specific configurations of DAIs starts from here */
@@ -174,7 +172,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 				     cpu_priv->sysclk_dir[tx]);
 	if (ret && ret != -ENOTSUPP) {
 		dev_err(dev, "failed to set sysclk for cpu dai\n");
-		return ret;
+		goto out;
 	}
 
 	if (cpu_priv->slot_width) {
@@ -182,6 +180,69 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 					       cpu_priv->slot_width);
 		if (ret && ret != -ENOTSUPP) {
 			dev_err(dev, "failed to set TDM slot for cpu dai\n");
+			goto out;
+		}
+	}
+
+	/* Specific configuration for PLL */
+	if (codec_priv->pll_id && codec_priv->fll_id) {
+		if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
+			pll_out = priv->sample_rate * 384;
+		else
+			pll_out = priv->sample_rate * 256;
+
+		ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
+					  codec_priv->pll_id,
+					  codec_priv->mclk_id,
+					  codec_priv->mclk_freq, pll_out);
+		if (ret) {
+			dev_err(dev, "failed to start FLL: %d\n", ret);
+			goto out;
+		}
+
+		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
+					     codec_priv->fll_id,
+					     pll_out, SND_SOC_CLOCK_IN);
+
+		if (ret && ret != -ENOTSUPP) {
+			dev_err(dev, "failed to set SYSCLK: %d\n", ret);
+			goto out;
+		}
+	}
+
+	return 0;
+
+out:
+	priv->streams &= ~BIT(substream->stream);
+	return ret;
+}
+
+static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct codec_priv *codec_priv = &priv->codec_priv;
+	struct device *dev = rtd->card->dev;
+	int ret;
+
+	priv->streams &= ~BIT(substream->stream);
+
+	if (!priv->streams && codec_priv->pll_id &&
+	    codec_priv->fll_id) {
+		/* Force freq to be 0 to avoid error message in codec */
+		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
+					     codec_priv->mclk_id,
+					     0,
+					     SND_SOC_CLOCK_IN);
+		if (ret) {
+			dev_err(dev, "failed to switch away from FLL: %d\n", ret);
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
+					  codec_priv->pll_id, 0, 0, 0);
+		if (ret && ret != -ENOTSUPP) {
+			dev_err(dev, "failed to stop FLL: %d\n", ret);
 			return ret;
 		}
 	}
@@ -191,6 +252,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 
 static const struct snd_soc_ops fsl_asoc_card_ops = {
 	.hw_params = fsl_asoc_card_hw_params,
+	.hw_free = fsl_asoc_card_hw_free,
 };
 
 static int be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -254,75 +316,6 @@ static struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	},
 };
 
-static int fsl_asoc_card_set_bias_level(struct snd_soc_card *card,
-					struct snd_soc_dapm_context *dapm,
-					enum snd_soc_bias_level level)
-{
-	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai *codec_dai;
-	struct codec_priv *codec_priv = &priv->codec_priv;
-	struct device *dev = card->dev;
-	unsigned int pll_out;
-	int ret;
-
-	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
-	if (dapm->dev != codec_dai->dev)
-		return 0;
-
-	switch (level) {
-	case SND_SOC_BIAS_PREPARE:
-		if (dapm->bias_level != SND_SOC_BIAS_STANDBY)
-			break;
-
-		if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
-			pll_out = priv->sample_rate * 384;
-		else
-			pll_out = priv->sample_rate * 256;
-
-		ret = snd_soc_dai_set_pll(codec_dai, codec_priv->pll_id,
-					  codec_priv->mclk_id,
-					  codec_priv->mclk_freq, pll_out);
-		if (ret) {
-			dev_err(dev, "failed to start FLL: %d\n", ret);
-			return ret;
-		}
-
-		ret = snd_soc_dai_set_sysclk(codec_dai, codec_priv->fll_id,
-					     pll_out, SND_SOC_CLOCK_IN);
-		if (ret && ret != -ENOTSUPP) {
-			dev_err(dev, "failed to set SYSCLK: %d\n", ret);
-			return ret;
-		}
-		break;
-
-	case SND_SOC_BIAS_STANDBY:
-		if (dapm->bias_level != SND_SOC_BIAS_PREPARE)
-			break;
-
-		ret = snd_soc_dai_set_sysclk(codec_dai, codec_priv->mclk_id,
-					     codec_priv->mclk_freq,
-					     SND_SOC_CLOCK_IN);
-		if (ret && ret != -ENOTSUPP) {
-			dev_err(dev, "failed to switch away from FLL: %d\n", ret);
-			return ret;
-		}
-
-		ret = snd_soc_dai_set_pll(codec_dai, codec_priv->pll_id, 0, 0, 0);
-		if (ret) {
-			dev_err(dev, "failed to stop FLL: %d\n", ret);
-			return ret;
-		}
-		break;
-
-	default:
-		break;
-	}
-
-	return 0;
-}
-
 static int fsl_asoc_card_audmux_init(struct device_node *np,
 				     struct fsl_asoc_card_priv *priv)
 {
@@ -611,7 +604,6 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	/* Diversify the card configurations */
 	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
 		codec_dai_name = "cs42888";
-		priv->card.set_bias_level = NULL;
 		priv->cpu_priv.sysclk_freq[TX] = priv->codec_priv.mclk_freq;
 		priv->cpu_priv.sysclk_freq[RX] = priv->codec_priv.mclk_freq;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
@@ -628,26 +620,22 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8962")) {
 		codec_dai_name = "wm8962";
-		priv->card.set_bias_level = fsl_asoc_card_set_bias_level;
 		priv->codec_priv.mclk_id = WM8962_SYSCLK_MCLK;
 		priv->codec_priv.fll_id = WM8962_SYSCLK_FLL;
 		priv->codec_priv.pll_id = WM8962_FLL;
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8960")) {
 		codec_dai_name = "wm8960-hifi";
-		priv->card.set_bias_level = fsl_asoc_card_set_bias_level;
 		priv->codec_priv.fll_id = WM8960_SYSCLK_AUTO;
 		priv->codec_priv.pll_id = WM8960_SYSCLK_AUTO;
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-ac97")) {
 		codec_dai_name = "ac97-hifi";
-		priv->card.set_bias_level = NULL;
 		priv->dai_fmt = SND_SOC_DAIFMT_AC97;
 		priv->card.dapm_routes = audio_map_ac97;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_ac97);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-mqs")) {
 		codec_dai_name = "fsl-mqs-dai";
-		priv->card.set_bias_level = NULL;
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBS_CFS |
 				SND_SOC_DAIFMT_NB_NF;
@@ -657,7 +645,6 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name = "wm8524-hifi";
-		priv->card.set_bias_level = NULL;
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
 		priv->dai_link[1].dpcm_capture = 0;
 		priv->dai_link[2].dpcm_capture = 0;
-- 
2.27.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DC174CC
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D9C1A97;
	Wed,  8 May 2019 11:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D9C1A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306876;
	bh=/QzzzTeM8DP65LZYEaq0kgCOAPwytvQPEl+sBj+clPs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hfn4JJ9OeRLlhQAd19yI97iNjZtyiXO2ZSnEgUYfo0TjIv7FFp75vWbR2OuvBxUp5
	 hA59Jn4VXwcLkP17brFTTWRSN+TLV9dA+C+a44DvxMRLwuNdSBaiXY+JE0kdbIwAer
	 YC2hGX/P3/wWABh4Z80+uPiU8OBKXJCOivJnAVHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64086F896E6;
	Wed,  8 May 2019 11:12:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B848F896FD; Wed,  8 May 2019 11:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB0E5F896E6
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB0E5F896E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="v5jnOGw3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ogddXFSZso4GSk0uUQ4JEECk2Q3KnghE6of2/9riZcQ=; b=v5jnOGw3qbmh
 p78ZTznaPa8cBgn4eJMPaR6TGQ4F9d/gNi5/oAN2rTz4U3mz+KyVOOYSLXpSDLQbRAV/JCubOw58h
 TSFfA+9SWvEmFW4u0E0ouL/lxLHkOMPZq6xKeZR0gwAnf8ONWMaYU/DTY7tl95KGTnWy587eKBKSe
 ghf1Q=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOIcq-0007hv-OS; Wed, 08 May 2019 09:12:44 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D2C36440033; Wed,  8 May 2019 10:01:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190506095815.24578-5-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508090127.D2C36440033@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:01:27 +0100 (BST)
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: hdmi-codec: remove ops dependency on
	the dai id" to the asoc tree
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

   ASoC: hdmi-codec: remove ops dependency on the dai id

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 0cf4610b9f297e570da4d98514b310f076ecc8ab Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 6 May 2019 11:58:15 +0200
Subject: [PATCH] ASoC: hdmi-codec: remove ops dependency on the dai id

The dependency on the dai_id can be removed by setting different ops
for the i2s and spdif dai and storing the dai format information in
each dai structure. It simplies the code a bit.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdmi-codec.c | 100 +++++++++++++++++++++++-----------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 9408e6bc4d3e..90a892766625 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -278,7 +278,6 @@ static const struct hdmi_codec_cea_spk_alloc hdmi_codec_channel_alloc[] = {
 
 struct hdmi_codec_priv {
 	struct hdmi_codec_pdata hcd;
-	struct hdmi_codec_daifmt daifmt[2];
 	uint8_t eld[MAX_ELD_BYTES];
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
@@ -445,6 +444,7 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
 	struct hdmi_codec_params hp = {
 		.iec = {
 			.status = { 0 },
@@ -489,28 +489,27 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 	hp.channels = params_channels(params);
 
 	return hcp->hcd.ops->hw_params(dai->dev->parent, hcp->hcd.data,
-				       &hcp->daifmt[dai->id], &hp);
+				       cf, &hp);
 }
 
-static int hdmi_codec_set_fmt(struct snd_soc_dai *dai,
-			      unsigned int fmt)
+static int hdmi_codec_i2s_set_fmt(struct snd_soc_dai *dai,
+				  unsigned int fmt)
 {
-	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	struct hdmi_codec_daifmt cf = { 0 };
+	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
 
-	if (dai->id == DAI_ID_SPDIF)
-		return 0;
+	/* Reset daifmt */
+	memset(cf, 0, sizeof(*cf));
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBM_CFM:
-		cf.bit_clk_master = 1;
-		cf.frame_clk_master = 1;
+		cf->bit_clk_master = 1;
+		cf->frame_clk_master = 1;
 		break;
 	case SND_SOC_DAIFMT_CBS_CFM:
-		cf.frame_clk_master = 1;
+		cf->frame_clk_master = 1;
 		break;
 	case SND_SOC_DAIFMT_CBM_CFS:
-		cf.bit_clk_master = 1;
+		cf->bit_clk_master = 1;
 		break;
 	case SND_SOC_DAIFMT_CBS_CFS:
 		break;
@@ -522,43 +521,41 @@ static int hdmi_codec_set_fmt(struct snd_soc_dai *dai,
 	case SND_SOC_DAIFMT_NB_NF:
 		break;
 	case SND_SOC_DAIFMT_NB_IF:
-		cf.frame_clk_inv = 1;
+		cf->frame_clk_inv = 1;
 		break;
 	case SND_SOC_DAIFMT_IB_NF:
-		cf.bit_clk_inv = 1;
+		cf->bit_clk_inv = 1;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
-		cf.frame_clk_inv = 1;
-		cf.bit_clk_inv = 1;
+		cf->frame_clk_inv = 1;
+		cf->bit_clk_inv = 1;
 		break;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
-		cf.fmt = HDMI_I2S;
+		cf->fmt = HDMI_I2S;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-		cf.fmt = HDMI_DSP_A;
+		cf->fmt = HDMI_DSP_A;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
-		cf.fmt = HDMI_DSP_B;
+		cf->fmt = HDMI_DSP_B;
 		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
-		cf.fmt = HDMI_RIGHT_J;
+		cf->fmt = HDMI_RIGHT_J;
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
-		cf.fmt = HDMI_LEFT_J;
+		cf->fmt = HDMI_LEFT_J;
 		break;
 	case SND_SOC_DAIFMT_AC97:
-		cf.fmt = HDMI_AC97;
+		cf->fmt = HDMI_AC97;
 		break;
 	default:
 		dev_err(dai->dev, "Invalid DAI interface format\n");
 		return -EINVAL;
 	}
 
-	hcp->daifmt[dai->id] = cf;
-
 	return 0;
 }
 
@@ -573,14 +570,20 @@ static int hdmi_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops hdmi_dai_ops = {
+static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
 	.startup	= hdmi_codec_startup,
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
-	.set_fmt	= hdmi_codec_set_fmt,
+	.set_fmt	= hdmi_codec_i2s_set_fmt,
 	.digital_mute	= hdmi_codec_digital_mute,
 };
 
+static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
+	.startup	= hdmi_codec_startup,
+	.shutdown	= hdmi_codec_shutdown,
+	.hw_params	= hdmi_codec_hw_params,
+	.digital_mute	= hdmi_codec_digital_mute,
+};
 
 #define HDMI_RATES	(SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
 			 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
@@ -648,20 +651,52 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
 static int hdmi_dai_probe(struct snd_soc_dai *dai)
 {
 	struct snd_soc_dapm_context *dapm;
+	struct hdmi_codec_daifmt *daifmt;
 	struct snd_soc_dapm_route route = {
 		.sink = "TX",
 		.source = dai->driver->playback.stream_name,
 	};
+	int ret;
 
 	dapm = snd_soc_component_get_dapm(dai->component);
+	ret = snd_soc_dapm_add_routes(dapm, &route, 1);
+	if (ret)
+		return ret;
+
+	daifmt = kzalloc(sizeof(*daifmt), GFP_KERNEL);
+	if (!daifmt)
+		return -ENOMEM;
 
-	return snd_soc_dapm_add_routes(dapm, &route, 1);
+	dai->playback_dma_data = daifmt;
+	return 0;
+}
+
+static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
+{
+	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	int ret;
+
+	ret = hdmi_dai_probe(dai);
+	if (ret)
+		return ret;
+
+	cf = dai->playback_dma_data;
+	cf->fmt = HDMI_SPDIF;
+
+	return 0;
+}
+
+static int hdmi_codec_dai_remove(struct snd_soc_dai *dai)
+{
+	kfree(dai->playback_dma_data);
+	return 0;
 }
 
 static const struct snd_soc_dai_driver hdmi_i2s_dai = {
 	.name = "i2s-hifi",
 	.id = DAI_ID_I2S,
 	.probe = hdmi_dai_probe,
+	.remove = hdmi_codec_dai_remove,
 	.playback = {
 		.stream_name = "I2S Playback",
 		.channels_min = 2,
@@ -670,14 +705,15 @@ static const struct snd_soc_dai_driver hdmi_i2s_dai = {
 		.formats = I2S_FORMATS,
 		.sig_bits = 24,
 	},
-	.ops = &hdmi_dai_ops,
+	.ops = &hdmi_codec_i2s_dai_ops,
 	.pcm_new = hdmi_codec_pcm_new,
 };
 
 static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 	.name = "spdif-hifi",
 	.id = DAI_ID_SPDIF,
-	.probe = hdmi_dai_probe,
+	.probe = hdmi_dai_spdif_probe,
+	.remove = hdmi_codec_dai_remove,
 	.playback = {
 		.stream_name = "SPDIF Playback",
 		.channels_min = 2,
@@ -685,7 +721,7 @@ static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 		.rates = HDMI_RATES,
 		.formats = SPDIF_FORMATS,
 	},
-	.ops = &hdmi_dai_ops,
+	.ops = &hdmi_codec_spdif_dai_ops,
 	.pcm_new = hdmi_codec_pcm_new,
 };
 
@@ -747,10 +783,8 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 		i++;
 	}
 
-	if (hcd->spdif) {
+	if (hcd->spdif)
 		daidrv[i] = hdmi_spdif_dai;
-		hcp->daifmt[DAI_ID_SPDIF].fmt = HDMI_SPDIF;
-	}
 
 	dev_set_drvdata(dev, hcp);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

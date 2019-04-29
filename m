Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA8E3D9
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 15:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB663166C;
	Mon, 29 Apr 2019 15:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB663166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556544946;
	bh=Ro8yadGAcXvHNkfg+vFSAFlKKfLB4D1DBs580Wwl6y0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vm3+4qCRHbfzc+gVSyzbgNI3QrTH7+GD6vjMOA8nScXyKR37NzMz7bkEReIGsYLeZ
	 1PRpnTIQQ5m1JtW3gDzQME0oPOgYZ7mUMtTM6WzOAE1I+vWmXpm1rQ99xCb3jhHIF/
	 m/ZdhBhjZAZmpWQu+f6999JRtihMKV2NO20jGnNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18656F8973D;
	Mon, 29 Apr 2019 15:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E65AF89725; Mon, 29 Apr 2019 15:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4363F80C41
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 15:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4363F80C41
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="a7wNSCFm"
Received: by mail-wm1-x342.google.com with SMTP id y197so15842197wmd.0
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CKsfp1x/LbsxbNcHvbSqLYmsrwzcbB2URURXREr5yxQ=;
 b=a7wNSCFml35ej21GIKLMIp1B8FJJD6WKn+HBxm7MnD0q03OqMi1T+ixkgRHxkJMvcz
 8OHqdXfzd4s6QyHxAZm0QonNqasgOMMjc469b3x7+R9UX4EeGwEgb70oOz2gQrmrgNvI
 qfgIq7RestSYIyCkpVAttt9NVhXdZDwjd/CFL8xwgZCFiNz3nK/HO6WeEnIbLLPbS5zG
 bYTm32Bv/lwGgZ6buYs3a5Adeo5TZIcLTk1SD7pYAwnexKvh1sBURl7g7d0KL3N8uQij
 5UGBAs0yAO5TYECwcHH2x05Ri/RrKY4W/rXX0MrV9w3xEJjYgYTcF/PefvxHz1Xn3xH0
 30+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CKsfp1x/LbsxbNcHvbSqLYmsrwzcbB2URURXREr5yxQ=;
 b=aRLIaWEPnoUbB6/jbj0y3AmHcv6cK7k2MacBMcmlSRMFBRPUL+uohzUuH9K1KvzxV+
 Ipinn1Kzq8YFAOk2HonfqWwLJMdKuTDTjVxCUKH970g8WbQkf0N8aWHKYnj9VizxgSNq
 bAQO9Q3D5J8pz9jaqQSV5tFvxcTGCbgcq+k4nBjph5B4I9inJdHphbNmZtWv08FU+pyN
 l7owMIMh4IO4sKZPpPlpjYlQEXDMTTEuZ+ExlZuNEcUaSGMpUFQeV1F35VDAJJDB0+Aa
 veaQvv+tsZ1803ZsBDop5isO9D5nlBBZ9vhWHbJej7bnK7BqXwiIe3sFgFA1QMu1ovkk
 UmFQ==
X-Gm-Message-State: APjAAAUsDEc/eCq4y8NEWtEPhl15wd8lvxJmYlp647H7GmBn9kAyX1rO
 K/y8gvEWAp7haTH80NeA69bETA==
X-Google-Smtp-Source: APXvYqwR6U+ckUpQSfw4rBQinHqbCKTFMkYGOMFQIam7EZM4On40jNGGpk0nOkTFLJXG1nS7Dy+ADA==
X-Received: by 2002:a1c:b782:: with SMTP id h124mr2298471wmf.5.1556544594954; 
 Mon, 29 Apr 2019 06:29:54 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s17sm2857593wra.94.2019.04.29.06.29.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 06:29:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 15:29:43 +0200
Message-Id: <20190429132943.16269-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429132943.16269-1-jbrunet@baylibre.com>
References: <20190429132943.16269-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 6/6] ASoC: hdmi-codec: remove ops dependency on
	the dai id
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The dependency on the dai_id can be removed by setting different ops
for the i2s and spdif dai and storing the dai format information in
each dai structure. It simplies the code a bit.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 173 ++++++++++++++++++++--------------
 1 file changed, 102 insertions(+), 71 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index bcc2e5c3bf43..4b56fc92a80d 100644
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
@@ -492,79 +492,85 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
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
-	int ret = 0;
-
-	if (dai->id == DAI_ID_SPDIF) {
-		cf.fmt = HDMI_SPDIF;
-	} else {
-		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBM_CFM:
-			cf.bit_clk_master = 1;
-			cf.frame_clk_master = 1;
-			break;
-		case SND_SOC_DAIFMT_CBS_CFM:
-			cf.frame_clk_master = 1;
-			break;
-		case SND_SOC_DAIFMT_CBM_CFS:
-			cf.bit_clk_master = 1;
-			break;
-		case SND_SOC_DAIFMT_CBS_CFS:
-			break;
-		default:
-			return -EINVAL;
-		}
+	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+
+	/* Reset daifmt */
+	memset(cf, 0, sizeof(*cf));
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		cf->bit_clk_master = 1;
+		cf->frame_clk_master = 1;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFM:
+		cf->frame_clk_master = 1;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFS:
+		cf->bit_clk_master = 1;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	default:
+		return -EINVAL;
+	}
 
-		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-		case SND_SOC_DAIFMT_NB_NF:
-			break;
-		case SND_SOC_DAIFMT_NB_IF:
-			cf.frame_clk_inv = 1;
-			break;
-		case SND_SOC_DAIFMT_IB_NF:
-			cf.bit_clk_inv = 1;
-			break;
-		case SND_SOC_DAIFMT_IB_IF:
-			cf.frame_clk_inv = 1;
-			cf.bit_clk_inv = 1;
-			break;
-		}
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		cf->frame_clk_inv = 1;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		cf->bit_clk_inv = 1;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		cf->frame_clk_inv = 1;
+		cf->bit_clk_inv = 1;
+		break;
+	}
 
-		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-		case SND_SOC_DAIFMT_I2S:
-			cf.fmt = HDMI_I2S;
-			break;
-		case SND_SOC_DAIFMT_DSP_A:
-			cf.fmt = HDMI_DSP_A;
-			break;
-		case SND_SOC_DAIFMT_DSP_B:
-			cf.fmt = HDMI_DSP_B;
-			break;
-		case SND_SOC_DAIFMT_RIGHT_J:
-			cf.fmt = HDMI_RIGHT_J;
-			break;
-		case SND_SOC_DAIFMT_LEFT_J:
-			cf.fmt = HDMI_LEFT_J;
-			break;
-		case SND_SOC_DAIFMT_AC97:
-			cf.fmt = HDMI_AC97;
-			break;
-		default:
-			dev_err(dai->dev, "Invalid DAI interface format\n");
-			return -EINVAL;
-		}
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		cf->fmt = HDMI_I2S;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		cf->fmt = HDMI_DSP_A;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		cf->fmt = HDMI_DSP_B;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		cf->fmt = HDMI_RIGHT_J;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		cf->fmt = HDMI_LEFT_J;
+		break;
+	case SND_SOC_DAIFMT_AC97:
+		cf->fmt = HDMI_AC97;
+		break;
+	default:
+		dev_err(dai->dev, "Invalid DAI interface format\n");
+		return -EINVAL;
 	}
 
-	hcp->daifmt[dai->id] = cf;
+	return 0;
+}
+
+static int hdmi_codec_spdif_set_fmt(struct snd_soc_dai *dai,
+				    unsigned int fmt)
+{
+	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+
+	/* No need to reset the format, it is always the same for spdif */
+	cf->fmt = HDMI_SPDIF;
 
-	return ret;
+	return 0;
 }
 
 static int hdmi_codec_digital_mute(struct snd_soc_dai *dai, int mute)
@@ -578,14 +584,21 @@ static int hdmi_codec_digital_mute(struct snd_soc_dai *dai, int mute)
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
+	.set_fmt	= hdmi_codec_spdif_set_fmt,
+	.digital_mute	= hdmi_codec_digital_mute,
+};
 
 #define HDMI_RATES	(SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
 			 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
@@ -653,20 +666,37 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
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
 
-	return snd_soc_dapm_add_routes(dapm, &route, 1);
+	daifmt = kzalloc(sizeof(*daifmt), GFP_KERNEL);
+	if (!daifmt)
+		return -ENOMEM;
+
+	dai->playback_dma_data = daifmt;
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
@@ -675,7 +705,7 @@ static const struct snd_soc_dai_driver hdmi_i2s_dai = {
 		.formats = I2S_FORMATS,
 		.sig_bits = 24,
 	},
-	.ops = &hdmi_dai_ops,
+	.ops = &hdmi_codec_i2s_dai_ops,
 	.pcm_new = hdmi_codec_pcm_new,
 };
 
@@ -683,6 +713,7 @@ static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 	.name = "spdif-hifi",
 	.id = DAI_ID_SPDIF,
 	.probe = hdmi_dai_probe,
+	.remove = hdmi_codec_dai_remove,
 	.playback = {
 		.stream_name = "SPDIF Playback",
 		.channels_min = 2,
@@ -690,7 +721,7 @@ static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 		.rates = HDMI_RATES,
 		.formats = SPDIF_FORMATS,
 	},
-	.ops = &hdmi_dai_ops,
+	.ops = &hdmi_codec_spdif_dai_ops,
 	.pcm_new = hdmi_codec_pcm_new,
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

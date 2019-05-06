Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08EF1480D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 12:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 780E71719;
	Mon,  6 May 2019 12:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 780E71719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557136971;
	bh=rdWBU4wQYBFRrHJJzImzozBon6TJKRw5FOaae9VRWYU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IsGCaBVhxnWXoJC4Q4ShbTnIXTcrFqUN51SnAVU3XSNrQwgRZ27qsy42VO6q9mZUd
	 Ql0QA3SJFs+nCHcpEE2/Y8PKhK8wgar1QCahk5XF+oHQjP+I6ReZrYf63CqhkynmRR
	 RD+LoUv6J5N0MJ4NrRe6RR7+xSqEkGRwHhZcQh2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7759F89734;
	Mon,  6 May 2019 11:58:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1978F8972B; Mon,  6 May 2019 11:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2B6BF8963C
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 11:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2B6BF8963C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="tcCdgTG8"
Received: by mail-wr1-x443.google.com with SMTP id a12so6322625wrn.4
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 02:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=spyvVZOA092Rq/pDhbTlA8tcvHt4DyPzwJ7M6MsQeGA=;
 b=tcCdgTG8H8MAKQGHBtyfaqhZgC9xPbMemqlo38nW50o2fdg9QUHXNAT05F4uz1pgJc
 g27KbxkrZLb3kgtKhQgpVmDkVX6BEU/+azucdZWPCLyIqEu8rt7mTwuKWkekCiUD0ED/
 P/RJu8RgYwvRkf2APWHfhpQOGR7yjvjvY3DTseJwtmVY96NxWYu22fLGqSWGTQcY3MeW
 Gd+KQkz69EtpMjAk9S69OuaY5tVbutsWwasUcqwjWM04T12h4yasr9m/1FVxUZZqJn+1
 MKzAqrgvTZpvR0csyALcM4iwqJ1spJwi1ENeVtpWdrFy6QLquyNyi1EsnxIFXyRB1ImH
 sdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=spyvVZOA092Rq/pDhbTlA8tcvHt4DyPzwJ7M6MsQeGA=;
 b=oQV16ktH9QfBucjXB4/pMguP6BBa9Q8uaMGC3mQZKVjVTnJIWi2iuP2ekDISs3KUEo
 w7nvXcPk0OZVupF8OqnqwaM3gqb4QF2d4AlfEhjrf+kc0zAcwziFiOBGJNRQMZ/o7ppv
 hKqtSmWoFqbws6Hf4tO/lhsNrG7/OObcKnoZ6UHYi4vbakNRcFZQ4i4XbdZjE6ppZ4Ux
 K6s+tMBXqeUJN3P24mfhGJK4rL+EvgSpvHC+y9SqyG4/OkA8KrydSC22qrWc++aJZO2p
 9tVayKZaejInwF2YI2AvgvdCdfIPmb0YCSq7q9r+jwg16ON39fgADwJ1IYswQIRUkV+8
 jQjQ==
X-Gm-Message-State: APjAAAWwpYUkVO7VDIfQ73V78H3kkzZJBUjGnxriefOej7jKraf1oUbP
 6DiBUq9g6DH7gM63iki+Bl0C7A==
X-Google-Smtp-Source: APXvYqx0DOK7WHFX9ytkejwPIliORawCMPCyR4HJ+H09HoIufnGhw37LS35rMEm75u7m8KRZrZHuMA==
X-Received: by 2002:a5d:5108:: with SMTP id s8mr115083wrt.99.1557136706779;
 Mon, 06 May 2019 02:58:26 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c10sm23409791wrd.69.2019.05.06.02.58.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 02:58:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon,  6 May 2019 11:58:15 +0200
Message-Id: <20190506095815.24578-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506095815.24578-1-jbrunet@baylibre.com>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 4/4] ASoC: hdmi-codec: remove ops dependency
	on the dai id
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

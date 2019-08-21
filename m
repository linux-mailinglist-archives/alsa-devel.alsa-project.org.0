Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9AA97914
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 14:18:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA7621666;
	Wed, 21 Aug 2019 14:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA7621666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566389910;
	bh=RJdW5O7oEHUDtro0vyFr8tOE5i6o54HLxIr/b3q2f8A=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=F9yMx1CrZE03oiQ2arnKD/oUoX9QYs45gzppIZQIsVLMjcTbZIGljQAqQA1ytzjxS
	 VerREqGORbwLFlcqsRef18C7O2oC68IIk/h36r7USSVW7VPHTaEMN3CsZebUQ48XMj
	 M3o+ekvauUuaN2GiJUhRRFJSfAQ7JrBvCvkaMvJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63934F805F6;
	Wed, 21 Aug 2019 14:15:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 477D1F805E0; Wed, 21 Aug 2019 14:15:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com
 [209.85.208.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49DB7F802E0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49DB7F802E0
Received: by mail-ed1-f99.google.com with SMTP id h8so2682873edv.7
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=k289+UQdb0wqQEwx6q0SK2SU4kG2QQx1UHCebGGvX40=;
 b=sdw2jhmpeqefSGJjHc6yi6N4Pct2Lls1dDRuS48++xOfxLlEb7DEWKTgyDqwpac2tS
 Kb6U+H5t2N9hZGNR0K2SnNNULOTuM/+fqPcnMm1InmLsxxegwMJsOVugWrfdBuUCydXw
 mFjHL408yjEPQzTY0HREfJxKUImt2iLrm7zI3Rzmq1H0i4mwBApC2iwvIPoMOROhNqGz
 GehkZPaObr1f8cwfXNLR36UkgOEx9rqsKBqs2OOTzyz6KEegnvBbPvTA7XKHcu8AOhnw
 K/WOt1dxI3B4JAZ8+mGGZtoi2LaKSxQTB1Fatvy4jOAY63VFeJSbLTRrFLXIatiqWcP+
 oxAQ==
X-Gm-Message-State: APjAAAUVKJ80J4o2uSJUxpjDuniz6P2lDNXLVt2q1okwiFPdUBHzyQ+4
 96w573at21d0SEqJYpUx6ncHxWlXjH107YF3Oh0yKJzxoe2nCMRm9wonFWhzLFtlUg==
X-Google-Smtp-Source: APXvYqxemBvnGhrYqvB0zgpm980Eih485gmWiHKCun5oIIJmdz0Fc3/+4ucl+1xOP2OLUQqKIf6a9df73Lv3
X-Received: by 2002:a17:906:f2d0:: with SMTP id
 gz16mr29860515ejb.21.1566389733011; 
 Wed, 21 Aug 2019 05:15:33 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id m12sm340610edq.41.2019.08.21.05.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:15:32 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0PWW-000774-IS; Wed, 21 Aug 2019 12:15:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0757D2742FCD; Wed, 21 Aug 2019 13:15:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <26392af30b3e7b31ee48d5b867d45be8675db046.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190821121532.0757D2742FCD@ypsilon.sirena.org.uk>
Date: Wed, 21 Aug 2019 13:15:31 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Add support for TDM slots"
	to the asoc tree
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

   ASoC: sun4i-i2s: Add support for TDM slots

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

From 137befe19f310400a8b20fd8a4ce8c4141aafde0 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:27 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Add support for TDM slots

The i2s controller supports TDM, for up to 8 slots. Let's support the TDM
API.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/26392af30b3e7b31ee48d5b867d45be8675db046.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 40 +++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 9e691baee1e8..8326b8cfa569 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -168,6 +168,8 @@ struct sun4i_i2s {
 	struct reset_control *rst;
 
 	unsigned int	mclk_freq;
+	unsigned int	slots;
+	unsigned int	slot_width;
 
 	struct snd_dmaengine_dai_dma_data	capture_dma_data;
 	struct snd_dmaengine_dai_dma_data	playback_dma_data;
@@ -287,7 +289,7 @@ static bool sun4i_i2s_oversample_is_valid(unsigned int oversample)
 
 static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 				  unsigned int rate,
-				  unsigned int channels,
+				  unsigned int slots,
 				  unsigned int word_size)
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -335,7 +337,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 
 	bclk_parent_rate = i2s->variant->get_bclk_parent_rate(i2s);
 	bclk_div = sun4i_i2s_get_bclk_div(i2s, bclk_parent_rate,
-					  rate, channels, word_size);
+					  rate, slots, word_size);
 	if (bclk_div < 0) {
 		dev_err(dai->dev, "Unsupported BCLK divider: %d\n", bclk_div);
 		return -EINVAL;
@@ -419,6 +421,10 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 				  const struct snd_pcm_hw_params *params)
 {
 	unsigned int channels = params_channels(params);
+	unsigned int slots = channels;
+
+	if (i2s->slots)
+		slots = i2s->slots;
 
 	/* Map the channels for playback and capture */
 	regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
@@ -428,7 +434,6 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
 			   SUN4I_I2S_CHAN_SEL_MASK,
 			   SUN4I_I2S_CHAN_SEL(channels));
-
 	regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
 			   SUN4I_I2S_CHAN_SEL_MASK,
 			   SUN4I_I2S_CHAN_SEL(channels));
@@ -452,10 +457,18 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	unsigned int word_size = params_width(params);
 	unsigned int channels = params_channels(params);
+	unsigned int slots = channels;
 	int ret, sr, wss;
 	u32 width;
 
+	if (i2s->slots)
+		slots = i2s->slots;
+
+	if (i2s->slot_width)
+		word_size = i2s->slot_width;
+
 	ret = i2s->variant->set_chan_cfg(i2s, params);
 	if (ret < 0) {
 		dev_err(dai->dev, "Invalid channel configuration\n");
@@ -477,15 +490,14 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (sr < 0)
 		return -EINVAL;
 
-	wss = i2s->variant->get_wss(i2s, params_width(params));
+	wss = i2s->variant->get_wss(i2s, word_size);
 	if (wss < 0)
 		return -EINVAL;
 
 	regmap_field_write(i2s->field_fmt_wss, wss);
 	regmap_field_write(i2s->field_fmt_sr, sr);
 
-	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
-				      channels, params_width(params));
+	return sun4i_i2s_set_clk_rate(dai, params_rate(params), slots, word_size);
 }
 
 static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
@@ -785,10 +797,26 @@ static int sun4i_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return 0;
 }
 
+static int sun4i_i2s_set_tdm_slot(struct snd_soc_dai *dai,
+				  unsigned int tx_mask, unsigned int rx_mask,
+				  int slots, int slot_width)
+{
+	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	if (slots > 8)
+		return -EINVAL;
+
+	i2s->slots = slots;
+	i2s->slot_width = slot_width;
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
 	.hw_params	= sun4i_i2s_hw_params,
 	.set_fmt	= sun4i_i2s_set_fmt,
 	.set_sysclk	= sun4i_i2s_set_sysclk,
+	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
 	.trigger	= sun4i_i2s_trigger,
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

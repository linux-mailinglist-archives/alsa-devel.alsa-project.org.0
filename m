Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE568958BE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 09:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75F8A168F;
	Tue, 20 Aug 2019 09:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75F8A168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566287168;
	bh=uVBVP52GBwUuGj5KqEjwHwofGEaLFn1ELoaD8giqXQw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jN8j78EXKAqBZRACPSObx77Bf/v2zwlHPWXTyBTYu9xWX7pXyh3Ibhiihf/Cu6jcA
	 ykeL4L8Ju8+mtJgCU3zLSE0XWdhoI+xvlnuuBnJDWtuCLFuxAQCgjH0aoe8/v+SnMG
	 vOIjgfsNcMH7U2fhGk/kfVBmrrPkW9838F93gBV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACEF0F89622;
	Tue, 20 Aug 2019 09:19:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D160F805A1; Mon, 19 Aug 2019 22:05:37 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4414DF8063A
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 21:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4414DF8063A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p6RdV/Ep"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FB3722CF4;
 Mon, 19 Aug 2019 19:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566242792;
 bh=VhgrAobupFnriBgAL6k/Hl/4bbBPIrD3sq1OXXE+ARA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p6RdV/Ep6Zv/LdJ6M63W54T7enRfvTzAFbFTpGD6mSPL6xECJZJtZgMIyJThLBUQE
 h8hfQANxa2XBhT49fZUNlmbNmMs6tSRA8KA/gyh+0tSsqtI/Fbm247keYgCwCuuJOJ
 kClyW1GK3ieNh3fbnQAI6YrtJpWlJ6xlbIERyND0=
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 lgirdwood@gmail.com, broonie@kernel.org
Date: Mon, 19 Aug 2019 21:25:27 +0200
Message-Id: <26392af30b3e7b31ee48d5b867d45be8675db046.1566242458.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 09:18:29 +0200
Cc: codekipper@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 20/21] ASoC: sun4i-i2s: Add support for TDM
	slots
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

From: Maxime Ripard <maxime.ripard@bootlin.com>

The i2s controller supports TDM, for up to 8 slots. Let's support the TDM
API.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 40 ++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 0dac09814b65..4f76daeaaed7 100644
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
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

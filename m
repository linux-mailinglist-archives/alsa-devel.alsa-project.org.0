Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F0958C5
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 09:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB520168A;
	Tue, 20 Aug 2019 09:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB520168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566287208;
	bh=Yh2e5jiHFuyOdrMvzxGvaEU0ZHvYVRcEOUeRm8pL2eA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJk7QCiRqQAu42flGZSwZKyKmOvbtLJpBUvAy3taq3Rvl2aPtwiNCdnyCj/0Jq8hF
	 RiluwDbsfclagusXYw6grcIY/AXSog2x7T4iFlK1CV1q3mu0clA5kbkCNzuSfCY5mA
	 6AYt+Vv59DLKxXk4N1TJYATEy5dJJwygvAmc5Iw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2086EF89626;
	Tue, 20 Aug 2019 09:19:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32CB6F80307; Mon, 19 Aug 2019 22:05:37 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8FFEF8063D
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 21:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8FFEF8063D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b+UpZ4Mj"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D967D22CEC;
 Mon, 19 Aug 2019 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566242795;
 bh=cj4R6p1TwnZUbmNQojsIlCMMsJUcZHjWCmxAfdU6wi8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b+UpZ4MjGH6pYnpbvs3A3YVv4L0Jt5W+rs3liCwCywVc3ga3OUlZQiI5YnHr4tVbH
 GsZJYFu5mbFZpEy9qsthvtCMf6SMxwpc1qpSpA7gEdhctBuzL85H458le1KwIvrqky
 uoNmgsSgydWMuVp8N30e4LTNXw2pt43NsY0JIDto=
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 lgirdwood@gmail.com, broonie@kernel.org
Date: Mon, 19 Aug 2019 21:25:28 +0200
Message-Id: <74cc9562e056627e14f186089d349022b65f59e7.1566242458.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 09:18:29 +0200
Cc: codekipper@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 21/21] ASoC: sun4i-i2s: Add support for DSP
	formats
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

In addition to the I2S format, the controller also supports the DSP_*
formats.

This requires some extra care on the LRCK period calculation, since the
controller, with the PCM formats, require that the value set is no longer
the periods of LRCK for a single channel, but for all of them.

Let's add the code to deal with this, and support the DSP_A and DSP_B
formats.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 44 ++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 4f76daeaaed7..198e3c580297 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -130,7 +130,6 @@ struct sun4i_i2s;
  * struct sun4i_i2s_quirks - Differences between SoC variants.
  *
  * @has_reset: SoC needs reset deasserted.
- * @has_fmt_set_lrck_period: SoC requires lrclk period to be set.
  * @reg_offset_txdata: offset of the tx fifo.
  * @sun4i_i2s_regmap: regmap config to use.
  * @field_clkdiv_mclk_en: regmap field to enable mclk output.
@@ -139,7 +138,6 @@ struct sun4i_i2s;
  */
 struct sun4i_i2s_quirks {
 	bool				has_reset;
-	bool				has_fmt_set_lrck_period;
 	unsigned int			reg_offset_txdata;	/* TX FIFO */
 	const struct regmap_config	*sun4i_i2s_regmap;
 
@@ -167,6 +165,7 @@ struct sun4i_i2s {
 	struct regmap	*regmap;
 	struct reset_control *rst;
 
+	unsigned int	format;
 	unsigned int	mclk_freq;
 	unsigned int	slots;
 	unsigned int	slot_width;
@@ -355,12 +354,6 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 
 	regmap_field_write(i2s->field_clkdiv_mclk_en, 1);
 
-	/* Set sync period */
-	if (i2s->variant->has_fmt_set_lrck_period)
-		regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
-				   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
-				   SUN8I_I2S_FMT0_LRCK_PERIOD(params_physical_width(params)));
-
 	return 0;
 }
 
@@ -422,6 +415,7 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 {
 	unsigned int channels = params_channels(params);
 	unsigned int slots = channels;
+	unsigned int lrck_period;
 
 	if (i2s->slots)
 		slots = i2s->slots;
@@ -445,6 +439,26 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM_MASK,
 			   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM(channels));
 
+	switch (i2s->format & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
+	case SND_SOC_DAIFMT_LEFT_J:
+	case SND_SOC_DAIFMT_RIGHT_J:
+		lrck_period = params_physical_width(params) * slots;
+		break;
+
+	case SND_SOC_DAIFMT_I2S:
+		lrck_period = params_physical_width(params);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
+			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
+			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
+
 	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
 			   SUN8I_I2S_TX_CHAN_EN_MASK,
 			   SUN8I_I2S_TX_CHAN_EN(channels));
@@ -614,6 +628,16 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 
 	/* DAI Mode */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_DSP_A:
+		mode = SUN8I_I2S_CTRL_MODE_PCM;
+		offset = 1;
+		break;
+
+	case SND_SOC_DAIFMT_DSP_B:
+		mode = SUN8I_I2S_CTRL_MODE_PCM;
+		offset = 0;
+		break;
+
 	case SND_SOC_DAIFMT_I2S:
 		mode = SUN8I_I2S_CTRL_MODE_LEFT;
 		offset = 1;
@@ -682,6 +706,9 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 			   SUN4I_I2S_FIFO_CTRL_RX_MODE_MASK,
 			   SUN4I_I2S_FIFO_CTRL_TX_MODE(1) |
 			   SUN4I_I2S_FIFO_CTRL_RX_MODE(1));
+
+	i2s->format = fmt;
+
 	return 0;
 }
 
@@ -1072,7 +1099,6 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.has_reset		= true,
 	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
 	.sun4i_i2s_regmap	= &sun4i_i2s_regmap_config,
-	.has_fmt_set_lrck_period = true,
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
-- 
git-series 0.9.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

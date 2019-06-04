Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D1E34268
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 10:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD45168D;
	Tue,  4 Jun 2019 10:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD45168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559638610;
	bh=GlA51/vQkT4eSUrxcBbThp56fp33y7kDu+OWCuNKIKs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FhB0d+7oh5HB/V01ICmrZMCjnxnojzahtEbMC89Y3pTkWmp023xqtKnInPC+ktgaN
	 miLtTPvS76CSpYHMKH5JkIMSEGfz31+kAFSYgQS4xtj1f6XqFZTO1GGbb84nFVzY7N
	 6ZaWWvr8F45u1ZJXViJwWbSV19w5jb4lG8QKirvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC0A0F896F7;
	Tue,  4 Jun 2019 10:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 422FDF896F7; Tue,  4 Jun 2019 10:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DBA3F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 10:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DBA3F89673
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr
 [90.88.144.139]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D371D1C0015;
 Tue,  4 Jun 2019 08:54:50 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Date: Tue,  4 Jun 2019 10:54:49 +0200
Message-Id: <20190604085449.13195-1-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: sun4i-i2s: Change SR and WSS computation
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

The current computation for the SR (sample resolution) and the WSS (word
slot size) register parameters is based on a switch returning the matching
parameters for a given params width.

Later SoCs (A83t, H3, A64) changed that calculation, which was loosely the
same with an offset. Therefore, an offset was added to adjust those
parameters.

However, the calculation is a bit less trivial than initially thought.
Indeed, while we assumed that SR and WSS were always the same, on older
SoCs, SR will max at 24 (since those SoCs do not support 32 bits formats),
but the word size can be 32.

Newer SoCs can also support a much larger range (8 bits to 32 bits, by
increments of 4) of size than the older SoCs could.

Finally, the A64 and A83t were never adjusted to have that offset in the
first place, and were therefore broken from that point of view.

In order to fix all those issues, let's introduce two functions, get_wss
and get_sr, with their respective implementations for all the SoCs
supported so far.

Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
Fixes: 66ecce332538 ("ASoC: sun4i-i2s: Add compatibility with A64 codec I2S")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 69 ++++++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index c53bfed8d4c2..f20f273cf5ac 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -127,7 +127,6 @@
  * @sun4i_i2s_regmap: regmap config to use.
  * @mclk_offset: Value by which mclkdiv needs to be adjusted.
  * @bclk_offset: Value by which bclkdiv needs to be adjusted.
- * @fmt_offset: Value by which wss and sr needs to be adjusted.
  * @field_clkdiv_mclk_en: regmap field to enable mclk output.
  * @field_fmt_wss: regmap field to set word select size.
  * @field_fmt_sr: regmap field to set sample resolution.
@@ -150,7 +149,6 @@ struct sun4i_i2s_quirks {
 	const struct regmap_config	*sun4i_i2s_regmap;
 	unsigned int			mclk_offset;
 	unsigned int			bclk_offset;
-	unsigned int			fmt_offset;
 
 	/* Register fields for i2s */
 	struct reg_field		field_clkdiv_mclk_en;
@@ -163,6 +161,9 @@ struct sun4i_i2s_quirks {
 	struct reg_field		field_rxchanmap;
 	struct reg_field		field_txchansel;
 	struct reg_field		field_rxchansel;
+
+	s8	(*get_sr)(const struct sun4i_i2s *, int);
+	s8	(*get_wss)(const struct sun4i_i2s *, int);
 };
 
 struct sun4i_i2s {
@@ -345,6 +346,39 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static s8 sun4i_i2s_get_sr(const struct sun4i_i2s *i2s, int width)
+{
+	if (width < 16 || width > 24)
+		return -EINVAL;
+
+	if (width % 4)
+		return -EINVAL;
+
+	return (width - 16) / 4;
+}
+
+static s8 sun4i_i2s_get_wss(const struct sun4i_i2s *i2s, int width)
+{
+	if (width < 16 || width > 32)
+		return -EINVAL;
+
+	if (width % 4)
+		return -EINVAL;
+
+	return (width - 16) / 4;
+}
+
+static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
+{
+	if (width % 4)
+		return -EINVAL;
+
+	if (width < 8 || width > 32)
+		return -EINVAL;
+
+	return (width - 8) / 4 + 1;
+}
+
 static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
@@ -396,22 +430,16 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 	i2s->playback_dma_data.addr_width = width;
 
-	switch (params_width(params)) {
-	case 16:
-		sr = 0;
-		wss = 0;
-		break;
+	sr = i2s->variant->get_sr(i2s, params_width(params));
+	if (sr < 0)
+		return -EINVAL;
 
-	default:
-		dev_err(dai->dev, "Unsupported sample width: %d\n",
-			params_width(params));
+	wss = i2s->variant->get_wss(i2s, params_width(params));
+	if (wss < 0)
 		return -EINVAL;
-	}
 
-	regmap_field_write(i2s->field_fmt_wss,
-			   wss + i2s->variant->fmt_offset);
-	regmap_field_write(i2s->field_fmt_sr,
-			   sr + i2s->variant->fmt_offset);
+	regmap_field_write(i2s->field_fmt_wss, wss);
+	regmap_field_write(i2s->field_fmt_sr, sr);
 
 	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
 				      params_width(params));
@@ -887,6 +915,8 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
 	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
 	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
+	.get_sr			= sun4i_i2s_get_sr,
+	.get_wss		= sun4i_i2s_get_wss,
 };
 
 static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
@@ -904,6 +934,8 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
 	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
 	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
+	.get_sr			= sun4i_i2s_get_sr,
+	.get_wss		= sun4i_i2s_get_wss,
 };
 
 static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
@@ -921,6 +953,8 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
 	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
 	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
+	.get_sr			= sun8i_i2s_get_sr_wss,
+	.get_wss		= sun8i_i2s_get_sr_wss,
 };
 
 static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
@@ -929,7 +963,6 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.sun4i_i2s_regmap	= &sun8i_i2s_regmap_config,
 	.mclk_offset		= 1,
 	.bclk_offset		= 2,
-	.fmt_offset		= 3,
 	.has_fmt_set_lrck_period = true,
 	.has_chcfg		= true,
 	.has_chsel_tx_chen	= true,
@@ -944,6 +977,8 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.field_rxchanmap	= REG_FIELD(SUN8I_I2S_RX_CHAN_MAP_REG, 0, 31),
 	.field_txchansel	= REG_FIELD(SUN8I_I2S_TX_CHAN_SEL_REG, 0, 2),
 	.field_rxchansel	= REG_FIELD(SUN8I_I2S_RX_CHAN_SEL_REG, 0, 2),
+	.get_sr			= sun8i_i2s_get_sr_wss,
+	.get_wss		= sun8i_i2s_get_sr_wss,
 };
 
 static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
@@ -961,6 +996,8 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
 	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
 	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
+	.get_sr			= sun8i_i2s_get_sr_wss,
+	.get_wss		= sun8i_i2s_get_sr_wss,
 };
 
 static int sun4i_i2s_init_regmap_fields(struct device *dev,
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

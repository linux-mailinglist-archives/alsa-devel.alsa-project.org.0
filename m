Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1479680F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D76D1167D;
	Tue, 20 Aug 2019 19:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D76D1167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323619;
	bh=Ig9146JXcefb8ci+ZuXY0fRNdeHNzVayLOqWH3V/+pE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=J6IOMfIUpXCt2toqSc4XY1uDudd4xCUJmh56EpXicVNE1muN3zHrLCjbX6OqKdJYf
	 iMMGoXQuSs6kyo9r5diJu01/4oaoATOBO6bKr7GaFWbZSoOStW3C0lSMvXaVVMztCP
	 S7zS1B1S1W3NNDp+ZirR5l+HZv2G6Tzql2ocMMV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15CD2F80539;
	Tue, 20 Aug 2019 19:41:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99505F8063B; Tue, 20 Aug 2019 19:41:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8BE0F805F9
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8BE0F805F9
Received: by mail-wm1-f97.google.com with SMTP id i63so3378173wmg.4
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=4KEDSqMrfto1Bnr/+6J8zxC3Yhv3Jrf5qHFIHdfMRpE=;
 b=bvhos1A0jg6UJd8AzDEiCxf9KGZ5ht9B5wA9XEGDhLdvcUov27cUroZwJMDZgLnzod
 M5gTUUckstoHczOqw27bQOsFB4MtVYalPq04CRP2ybndpe7P87YrgowTBPzfT26LveAO
 v+znH+wDSZCFk77yNKHN+LrZA28YisW0o8Y4mT6pC8hsPK4Z/bvtVnCauujAQHM+E3A/
 Bb0MIaSs7bvMtIG0hec6qo4wg7jPldNbrPZoFJU2Zu+6+UbCfjpNyqGq9/KBrlpife0L
 HrvJT/ychdo4WJiYlTwn6AbDNgkeQwD/98H27CYbs/CZmGUty74aDpSI5bCiea4aSTyc
 4zDA==
X-Gm-Message-State: APjAAAXw8vwEp4tCetX+DjFjPgj5SJ8nb2ogNyEO+d+5/SKsPiXX/W4q
 X4vr34mg1mpxhzcMxzH0CQea8hKvgYjO7qFEueAT1vMymH0YjZi3KvJ3DdIi92tbcA==
X-Google-Smtp-Source: APXvYqxk7L6oNu47pibQ6SHWV1tBM71NTJniRY0LK2KN9Ekh++COKqP/f9oNJ4TNkpuZPwM3gpYM1QYYHSFH
X-Received: by 2002:a1c:7619:: with SMTP id r25mr1232461wmc.153.1566322866845; 
 Tue, 20 Aug 2019 10:41:06 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id d26sm333440wrb.30.2019.08.20.10.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:06 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0882-00032z-GU; Tue, 20 Aug 2019 17:41:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 08800274314C; Tue, 20 Aug 2019 18:41:05 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <dc818644c3e40734e7a97247c994b1fca1c3c047.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174106.08800274314C@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:05 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Move the format
	configuration to a callback" to the asoc tree
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

   ASoC: sun4i-i2s: Move the format configuration to a callback

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

From 71137bcd0a9a778f9407a3bee46c62fcccee4f83 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:12 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Move the format configuration to a callback

The two main generations of our I2S controller require a slightly different
format configuration, mostly because of a quite different register layout
and some additional registers being needed on the newer generation.

This used to be controlled through a bunch of booleans, however this proved
to be quite impractical, especially since a bunch of SoCs forgot to set
those parameters and therefore were broken from that point of view.

Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/dc818644c3e40734e7a97247c994b1fca1c3c047.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 199 +++++++++++++++++++-----------------
 1 file changed, 106 insertions(+), 93 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 42e45c9a947a..93ea627e2f1f 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -93,6 +93,11 @@
 #define SUN8I_I2S_CTRL_BCLK_OUT			BIT(18)
 #define SUN8I_I2S_CTRL_LRCK_OUT			BIT(17)
 
+#define SUN8I_I2S_CTRL_MODE_MASK		GENMASK(5, 4)
+#define SUN8I_I2S_CTRL_MODE_RIGHT		(2 << 4)
+#define SUN8I_I2S_CTRL_MODE_LEFT		(1 << 4)
+#define SUN8I_I2S_CTRL_MODE_PCM			(0 << 4)
+
 #define SUN8I_I2S_FMT0_LRCK_PERIOD_MASK		GENMASK(17, 8)
 #define SUN8I_I2S_FMT0_LRCK_PERIOD(period)	((period - 1) << 8)
 
@@ -121,9 +126,7 @@ struct sun4i_i2s;
  * struct sun4i_i2s_quirks - Differences between SoC variants.
  *
  * @has_reset: SoC needs reset deasserted.
- * @has_slave_select_bit: SoC has a bit to enable slave mode.
  * @has_fmt_set_lrck_period: SoC requires lrclk period to be set.
- * @has_chsel_offset: SoC uses offset for selecting dai operational mode.
  * @reg_offset_txdata: offset of the tx fifo.
  * @sun4i_i2s_regmap: regmap config to use.
  * @mclk_offset: Value by which mclkdiv needs to be adjusted.
@@ -133,13 +136,10 @@ struct sun4i_i2s;
  * @field_fmt_sr: regmap field to set sample resolution.
  * @field_fmt_bclk: regmap field to set clk polarity.
  * @field_fmt_lrclk: regmap field to set frame polarity.
- * @field_fmt_mode: regmap field to set the operational mode.
  */
 struct sun4i_i2s_quirks {
 	bool				has_reset;
-	bool				has_slave_select_bit;
 	bool				has_fmt_set_lrck_period;
-	bool				has_chsel_offset;
 	unsigned int			reg_offset_txdata;	/* TX FIFO */
 	const struct regmap_config	*sun4i_i2s_regmap;
 	unsigned int			mclk_offset;
@@ -151,12 +151,12 @@ struct sun4i_i2s_quirks {
 	struct reg_field		field_fmt_sr;
 	struct reg_field		field_fmt_bclk;
 	struct reg_field		field_fmt_lrclk;
-	struct reg_field		field_fmt_mode;
 
 	s8	(*get_sr)(const struct sun4i_i2s *, int);
 	s8	(*get_wss)(const struct sun4i_i2s *, int);
 	int	(*set_chan_cfg)(const struct sun4i_i2s *,
 				const struct snd_pcm_hw_params *);
+	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
 };
 
 struct sun4i_i2s {
@@ -176,7 +176,6 @@ struct sun4i_i2s {
 	struct regmap_field	*field_fmt_sr;
 	struct regmap_field	*field_fmt_bclk;
 	struct regmap_field	*field_fmt_lrclk;
-	struct regmap_field	*field_fmt_mode;
 
 	const struct sun4i_i2s_quirks	*variant;
 };
@@ -465,52 +464,117 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 				      params_width(params));
 }
 
-static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
+				 unsigned int fmt)
 {
-	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	u32 val;
-	u32 offset = 0;
-	u32 bclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
-	u32 lrclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
 
 	/* DAI Mode */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		val = SUN4I_I2S_FMT0_FMT_I2S;
-		offset = 1;
 		break;
+
 	case SND_SOC_DAIFMT_LEFT_J:
 		val = SUN4I_I2S_FMT0_FMT_LEFT_J;
 		break;
+
 	case SND_SOC_DAIFMT_RIGHT_J:
 		val = SUN4I_I2S_FMT0_FMT_RIGHT_J;
 		break;
+
 	default:
-		dev_err(dai->dev, "Unsupported format: %d\n",
-			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
 		return -EINVAL;
 	}
 
-	if (i2s->variant->has_chsel_offset) {
-		/*
-		 * offset being set indicates that we're connected to an i2s
-		 * device, however offset is only used on the sun8i block and
-		 * i2s shares the same setting with the LJ format. Increment
-		 * val so that the bit to value to write is correct.
-		 */
-		if (offset > 0)
-			val++;
-		/* blck offset determines whether i2s or LJ */
-		regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
-				   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
-				   SUN8I_I2S_TX_CHAN_OFFSET(offset));
-
-		regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
-				   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
-				   SUN8I_I2S_TX_CHAN_OFFSET(offset));
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
+			   SUN4I_I2S_FMT0_FMT_MASK, val);
+
+	/* DAI clock master masks */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		/* BCLK and LRCLK master */
+		val = SUN4I_I2S_CTRL_MODE_MASTER;
+		break;
+
+	case SND_SOC_DAIFMT_CBM_CFM:
+		/* BCLK and LRCLK slave */
+		val = SUN4I_I2S_CTRL_MODE_SLAVE;
+		break;
+
+	default:
+		return -EINVAL;
 	}
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
+			   SUN4I_I2S_CTRL_MODE_MASK, val);
+	return 0;
+}
 
-	regmap_field_write(i2s->field_fmt_mode, val);
+static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
+				 unsigned int fmt)
+{
+	u32 mode, val;
+	u8 offset;
+
+	/* DAI Mode */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		mode = SUN8I_I2S_CTRL_MODE_LEFT;
+		offset = 1;
+		break;
+
+	case SND_SOC_DAIFMT_LEFT_J:
+		mode = SUN8I_I2S_CTRL_MODE_LEFT;
+		offset = 0;
+		break;
+
+	case SND_SOC_DAIFMT_RIGHT_J:
+		mode = SUN8I_I2S_CTRL_MODE_RIGHT;
+		offset = 0;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
+			   SUN8I_I2S_CTRL_MODE_MASK, mode);
+	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
+			   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
+			   SUN8I_I2S_TX_CHAN_OFFSET(offset));
+	regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
+			   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
+			   SUN8I_I2S_TX_CHAN_OFFSET(offset));
+
+	/* DAI clock master masks */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		/* BCLK and LRCLK master */
+		val = SUN8I_I2S_CTRL_BCLK_OUT |	SUN8I_I2S_CTRL_LRCK_OUT;
+		break;
+
+	case SND_SOC_DAIFMT_CBM_CFM:
+		/* BCLK and LRCLK slave */
+		val = 0;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
+			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
+			   val);
+
+	return 0;
+}
+
+static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	u32 bclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
+	u32 lrclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
+	int ret;
 
 	/* DAI clock polarity */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -538,50 +602,10 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	regmap_field_write(i2s->field_fmt_bclk, bclk_polarity);
 	regmap_field_write(i2s->field_fmt_lrclk, lrclk_polarity);
 
-	if (i2s->variant->has_slave_select_bit) {
-		/* DAI clock master masks */
-		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBS_CFS:
-			/* BCLK and LRCLK master */
-			val = SUN4I_I2S_CTRL_MODE_MASTER;
-			break;
-		case SND_SOC_DAIFMT_CBM_CFM:
-			/* BCLK and LRCLK slave */
-			val = SUN4I_I2S_CTRL_MODE_SLAVE;
-			break;
-		default:
-			dev_err(dai->dev, "Unsupported slave setting: %d\n",
-				fmt & SND_SOC_DAIFMT_MASTER_MASK);
-			return -EINVAL;
-		}
-		regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
-				   SUN4I_I2S_CTRL_MODE_MASK,
-				   val);
-	} else {
-		/*
-		 * The newer i2s block does not have a slave select bit,
-		 * instead the clk pins are configured as inputs.
-		 */
-		/* DAI clock master masks */
-		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBS_CFS:
-			/* BCLK and LRCLK master */
-			val = SUN8I_I2S_CTRL_BCLK_OUT |
-				SUN8I_I2S_CTRL_LRCK_OUT;
-			break;
-		case SND_SOC_DAIFMT_CBM_CFM:
-			/* BCLK and LRCLK slave */
-			val = 0;
-			break;
-		default:
-			dev_err(dai->dev, "Unsupported slave setting: %d\n",
-				fmt & SND_SOC_DAIFMT_MASTER_MASK);
-			return -EINVAL;
-		}
-		regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
-				   SUN8I_I2S_CTRL_BCLK_OUT |
-				   SUN8I_I2S_CTRL_LRCK_OUT,
-				   val);
+	ret = i2s->variant->set_fmt(i2s, fmt);
+	if (ret) {
+		dev_err(dai->dev, "Unsupported format configuration\n");
+		return ret;
 	}
 
 	/* Set significant bits in our FIFOs */
@@ -933,11 +957,10 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
 	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 6, 6),
 	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
-	.has_slave_select_bit	= true,
-	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
 	.set_chan_cfg		= sun4i_i2s_set_chan_cfg,
+	.set_fmt		= sun4i_i2s_set_soc_fmt,
 };
 
 static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
@@ -949,11 +972,10 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
 	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 6, 6),
 	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
-	.has_slave_select_bit	= true,
-	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
 	.set_chan_cfg		= sun4i_i2s_set_chan_cfg,
+	.set_fmt		= sun4i_i2s_set_soc_fmt,
 };
 
 static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
@@ -965,11 +987,10 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
 	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 6, 6),
 	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
-	.has_slave_select_bit	= true,
-	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
 	.get_sr			= sun8i_i2s_get_sr_wss,
 	.get_wss		= sun8i_i2s_get_sr_wss,
 	.set_chan_cfg		= sun8i_i2s_set_chan_cfg,
+	.set_fmt		= sun8i_i2s_set_soc_fmt,
 };
 
 static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
@@ -979,32 +1000,30 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.mclk_offset		= 1,
 	.bclk_offset		= 2,
 	.has_fmt_set_lrck_period = true,
-	.has_chsel_offset	= true,
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
 	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
 	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 19, 19),
-	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_CTRL_REG, 4, 5),
 	.get_sr			= sun8i_i2s_get_sr_wss,
 	.get_wss		= sun8i_i2s_get_sr_wss,
 	.set_chan_cfg		= sun8i_i2s_set_chan_cfg,
+	.set_fmt		= sun8i_i2s_set_soc_fmt,
 };
 
 static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.has_reset		= true,
 	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
 	.sun4i_i2s_regmap	= &sun4i_i2s_regmap_config,
-	.has_slave_select_bit	= true,
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 7, 7),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 2, 3),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
 	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 6, 6),
 	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
-	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
 	.set_chan_cfg		= sun4i_i2s_set_chan_cfg,
+	.set_fmt		= sun4i_i2s_set_soc_fmt,
 };
 
 static int sun4i_i2s_init_regmap_fields(struct device *dev,
@@ -1040,12 +1059,6 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
 	if (IS_ERR(i2s->field_fmt_lrclk))
 		return PTR_ERR(i2s->field_fmt_lrclk);
 
-	i2s->field_fmt_mode =
-			devm_regmap_field_alloc(dev, i2s->regmap,
-						i2s->variant->field_fmt_mode);
-	if (IS_ERR(i2s->field_fmt_mode))
-		return PTR_ERR(i2s->field_fmt_mode);
-
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

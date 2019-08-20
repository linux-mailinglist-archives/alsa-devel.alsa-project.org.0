Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2996807
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E54A1671;
	Tue, 20 Aug 2019 19:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E54A1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323420;
	bh=KtXRuJa4Vuo/nBJsgNc5q+sslD1SVEUDtAA2iduRnZY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TwH2zyk+ZEx+XRFDAQMmtg4pRxdWDG0p5V9Mj72olWZsP7lPLUs68b5k0kC3hlz48
	 eGJJPaPYoXX0pdKHn0l6fm3OoxWjq6lhqrIQN3CKDiuRypXDULqdbd/oab+CJpRoO2
	 wGF2hOkURlCBLyK/jyzvFxacCsj2vYG3dapDF1Qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7683DF8070C;
	Tue, 20 Aug 2019 19:41:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83897F80635; Tue, 20 Aug 2019 19:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f100.google.com (mail-ed1-f100.google.com
 [209.85.208.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A59DF805F7
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A59DF805F7
Received: by mail-ed1-f100.google.com with SMTP id h8so7276290edv.7
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=ijBvODsMnl6QkrSP5hYni3nXw5ctFV0IEowqc4OQmR0=;
 b=it6eJ7lR4cHIHpIK4yi3U+CzvMyurfuZYNi6SGqpvBHWSmiXPKENuHOJooK/orX4Gc
 9sUiQwna0nhSYrjpapHqC/jcoxMac+t1ynxkm9Rn9azCKCRoB+eyK6ikNqkN/pb+yU9T
 qVpiEn5QYIAwzn52As5AjNVoDx6biqshMVA4Hw6BTwbjTWaXd1Qoiyl5KHDnEzMSEnpn
 xJJMYGFbTvh00649InCpIsbVOQL8f0zF2ZsAX8G7p269Lb06V/Hh+NegAr7HuXqbtGoX
 U6yhi8iiwHNxW0TQLfBFfk4eNb3UeY9wAXZaB0rCfpP7kzN+S7IJ9hOnHpbJixjrkrf5
 G5Sw==
X-Gm-Message-State: APjAAAVGychwuzhBEeGbJQ7iPpttPi5bBOqzNF12UtLcN8Izvsbj2cd0
 qhJ7OBw1lDlVfL5bq4hy1Fhlhd+QsO/Y0toxxcrE1zZCz1QTd5nY9GevJ5mUovcW/w==
X-Google-Smtp-Source: APXvYqxaMgLQllmcGTjN5p/8iDzz9yuWVTlnosVpaFmbguognoCtGY95w14rOToRKWceznGhEwMp6NWXxoz0
X-Received: by 2002:a17:906:244c:: with SMTP id
 a12mr26757259ejb.288.1566322866265; 
 Tue, 20 Aug 2019 10:41:06 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id c66sm283196edf.12.2019.08.20.10.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:06 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0881-00032k-Pc; Tue, 20 Aug 2019 17:41:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2E69C274314C; Tue, 20 Aug 2019 18:41:05 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <9cbdde80a299288878e58225df4d7884e0301348.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174105.2E69C274314C@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:05 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Fix LRCK and BCLK polarity
	offsets on newer SoCs" to the asoc tree
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

   ASoC: sun4i-i2s: Fix LRCK and BCLK polarity offsets on newer SoCs

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

From 515fcfbc773632e160f4b94e8df8d278a8d704f7 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:19 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Fix LRCK and BCLK polarity offsets on newer
 SoCs

The LRCK and BCLK polarity offsets on newer SoCs has been
changed, yet the driver didn't take it into account for all of them.

This was taken into account for the H3, but not the A83t. This was handled
using a reg_field for the H3.

However, the value in that field will not be the same, so reg_field is not
adapted in that case. Let's change for proper calls with the regular
values.

Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/9cbdde80a299288878e58225df4d7884e0301348.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 118 ++++++++++++++++++------------------
 1 file changed, 60 insertions(+), 58 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 53c95e5289f5..e3eadfe38aaf 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -46,8 +46,6 @@
 #define SUN4I_I2S_FMT0_FMT_RIGHT_J			(2 << 0)
 #define SUN4I_I2S_FMT0_FMT_LEFT_J			(1 << 0)
 #define SUN4I_I2S_FMT0_FMT_I2S				(0 << 0)
-#define SUN4I_I2S_FMT0_POLARITY_INVERTED		(1)
-#define SUN4I_I2S_FMT0_POLARITY_NORMAL			(0)
 
 #define SUN4I_I2S_FMT1_REG		0x08
 #define SUN4I_I2S_FIFO_TX_REG		0x0c
@@ -98,8 +96,14 @@
 #define SUN8I_I2S_CTRL_MODE_LEFT		(1 << 4)
 #define SUN8I_I2S_CTRL_MODE_PCM			(0 << 4)
 
+#define SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK	BIT(19)
+#define SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED		(1 << 19)
+#define SUN8I_I2S_FMT0_LRCLK_POLARITY_NORMAL		(0 << 19)
 #define SUN8I_I2S_FMT0_LRCK_PERIOD_MASK		GENMASK(17, 8)
 #define SUN8I_I2S_FMT0_LRCK_PERIOD(period)	((period - 1) << 8)
+#define SUN8I_I2S_FMT0_BCLK_POLARITY_MASK	BIT(7)
+#define SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED		(1 << 7)
+#define SUN8I_I2S_FMT0_BCLK_POLARITY_NORMAL		(0 << 7)
 
 #define SUN8I_I2S_INT_STA_REG		0x0c
 #define SUN8I_I2S_FIFO_TX_REG		0x20
@@ -132,8 +136,6 @@ struct sun4i_i2s;
  * @field_clkdiv_mclk_en: regmap field to enable mclk output.
  * @field_fmt_wss: regmap field to set word select size.
  * @field_fmt_sr: regmap field to set sample resolution.
- * @field_fmt_bclk: regmap field to set clk polarity.
- * @field_fmt_lrclk: regmap field to set frame polarity.
  */
 struct sun4i_i2s_quirks {
 	bool				has_reset;
@@ -145,8 +147,6 @@ struct sun4i_i2s_quirks {
 	struct reg_field		field_clkdiv_mclk_en;
 	struct reg_field		field_fmt_wss;
 	struct reg_field		field_fmt_sr;
-	struct reg_field		field_fmt_bclk;
-	struct reg_field		field_fmt_lrclk;
 
 	const struct sun4i_i2s_clk_div	*bclk_dividers;
 	unsigned int			num_bclk_dividers;
@@ -176,8 +176,6 @@ struct sun4i_i2s {
 	struct regmap_field	*field_clkdiv_mclk_en;
 	struct regmap_field	*field_fmt_wss;
 	struct regmap_field	*field_fmt_sr;
-	struct regmap_field	*field_fmt_bclk;
-	struct regmap_field	*field_fmt_lrclk;
 
 	const struct sun4i_i2s_quirks	*variant;
 };
@@ -498,6 +496,33 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 {
 	u32 val;
 
+	/* DAI clock polarity */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_IF:
+		/* Invert both clocks */
+		val = SUN4I_I2S_FMT0_BCLK_POLARITY_INVERTED |
+		      SUN4I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		/* Invert bit clock */
+		val = SUN4I_I2S_FMT0_BCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		/* Invert frame clock */
+		val = SUN4I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
+			   SUN4I_I2S_FMT0_LRCLK_POLARITY_MASK |
+			   SUN4I_I2S_FMT0_BCLK_POLARITY_MASK,
+			   val);
+
 	/* DAI Mode */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -545,6 +570,33 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 	u32 mode, val;
 	u8 offset;
 
+	/* DAI clock polarity */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_IF:
+		/* Invert both clocks */
+		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED |
+		      SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		/* Invert bit clock */
+		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		/* Invert frame clock */
+		val = SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
+			   SUN8I_I2S_FMT0_LRCLK_POLARITY_MASK |
+			   SUN8I_I2S_FMT0_BCLK_POLARITY_MASK,
+			   val);
+
 	/* DAI Mode */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -601,36 +653,8 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
-	u32 bclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
-	u32 lrclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
 	int ret;
 
-	/* DAI clock polarity */
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_IB_IF:
-		/* Invert both clocks */
-		bclk_polarity = SUN4I_I2S_FMT0_POLARITY_INVERTED;
-		lrclk_polarity = SUN4I_I2S_FMT0_POLARITY_INVERTED;
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		/* Invert bit clock */
-		bclk_polarity = SUN4I_I2S_FMT0_POLARITY_INVERTED;
-		break;
-	case SND_SOC_DAIFMT_NB_IF:
-		/* Invert frame clock */
-		lrclk_polarity = SUN4I_I2S_FMT0_POLARITY_INVERTED;
-		break;
-	case SND_SOC_DAIFMT_NB_NF:
-		break;
-	default:
-		dev_err(dai->dev, "Unsupported clock polarity: %d\n",
-			fmt & SND_SOC_DAIFMT_INV_MASK);
-		return -EINVAL;
-	}
-
-	regmap_field_write(i2s->field_fmt_bclk, bclk_polarity);
-	regmap_field_write(i2s->field_fmt_lrclk, lrclk_polarity);
-
 	ret = i2s->variant->set_fmt(i2s, fmt);
 	if (ret) {
 		dev_err(dai->dev, "Unsupported format configuration\n");
@@ -984,8 +1008,6 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 7, 7),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 2, 3),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
-	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 6, 6),
-	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
 	.bclk_dividers		= sun4i_i2s_bclk_div,
 	.num_bclk_dividers	= ARRAY_SIZE(sun4i_i2s_bclk_div),
 	.mclk_dividers		= sun4i_i2s_mclk_div,
@@ -1004,8 +1026,6 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 7, 7),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 2, 3),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
-	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 6, 6),
-	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
 	.bclk_dividers		= sun4i_i2s_bclk_div,
 	.num_bclk_dividers	= ARRAY_SIZE(sun4i_i2s_bclk_div),
 	.mclk_dividers		= sun4i_i2s_mclk_div,
@@ -1024,8 +1044,6 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 7, 7),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 2, 3),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
-	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 6, 6),
-	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
 	.bclk_dividers		= sun8i_i2s_clk_div,
 	.num_bclk_dividers	= ARRAY_SIZE(sun8i_i2s_clk_div),
 	.mclk_dividers		= sun8i_i2s_clk_div,
@@ -1045,8 +1063,6 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
-	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
-	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 19, 19),
 	.bclk_dividers		= sun8i_i2s_clk_div,
 	.num_bclk_dividers	= ARRAY_SIZE(sun8i_i2s_clk_div),
 	.mclk_dividers		= sun8i_i2s_clk_div,
@@ -1065,8 +1081,6 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 7, 7),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 2, 3),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
-	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 6, 6),
-	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
 	.bclk_dividers		= sun4i_i2s_bclk_div,
 	.num_bclk_dividers	= ARRAY_SIZE(sun4i_i2s_bclk_div),
 	.mclk_dividers		= sun4i_i2s_mclk_div,
@@ -1099,18 +1113,6 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
 	if (IS_ERR(i2s->field_fmt_sr))
 		return PTR_ERR(i2s->field_fmt_sr);
 
-	i2s->field_fmt_bclk =
-			devm_regmap_field_alloc(dev, i2s->regmap,
-						i2s->variant->field_fmt_bclk);
-	if (IS_ERR(i2s->field_fmt_bclk))
-		return PTR_ERR(i2s->field_fmt_bclk);
-
-	i2s->field_fmt_lrclk =
-			devm_regmap_field_alloc(dev, i2s->regmap,
-						i2s->variant->field_fmt_lrclk);
-	if (IS_ERR(i2s->field_fmt_lrclk))
-		return PTR_ERR(i2s->field_fmt_lrclk);
-
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

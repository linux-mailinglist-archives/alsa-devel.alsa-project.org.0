Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D012A0864
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:49:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEBAC1676;
	Fri, 30 Oct 2020 15:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEBAC1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069380;
	bh=ZmCIvQIgNicpq6OiA0nXrHrvnLxFGNHkMbjqrnpZXzk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WW17WdWsTgpjJDexp49cOD/cjHw141+9yG7WF6PdA8k2Hmk2PR/sqS4J6aUFFVbiK
	 QG+sS2eohdfncv21EoCFMIsFrCZ+IKTTO+PUzdGU2D1cAlpnuBABs8GxRVqPleOhkN
	 Ji/siCslu+G+TR0pRbKI8bWQa66zJAvaE7jKJuMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B798F804D6;
	Fri, 30 Oct 2020 15:47:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 673A6F804CC; Fri, 30 Oct 2020 15:47:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98E6BF804BB
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98E6BF804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TpVxUerF"
Received: by mail-ot1-x343.google.com with SMTP id m26so5715369otk.11
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qV0D51RO9PLBSYYZ16HHBM2lrt27MpHOARuxM+Cckbs=;
 b=TpVxUerF3LZ6XZ9Sh8omwXvJX6N9XXpyTHqrSLo7TFsHWtFDG68w3FBMgYaiqFVtSy
 FT54olE/EmKRL1nfx0MoAXzQKNTwUYcNhc3GPlJDncmJcX9eLhHZqpmUDEDOzEIT7pZw
 i0d1nMfc/N53usdrmFe4wjiwPhmtfoOGlEGt3WH3GZfoAOPJKKdsIhU3UNcpgcB7SPu6
 zFBdh/Q0AMErh93c9akiA6i3Wn/wHiQlQ5p/iYgovT8CzzTrXpptgrSyhPsl/s10g+XO
 QxxyLdEA/K+ULeo48u+dk9YTWkaJww0j9Q1ctyn51HcEtRs7K7AVCOnA9JjngkvMxrcw
 d1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qV0D51RO9PLBSYYZ16HHBM2lrt27MpHOARuxM+Cckbs=;
 b=NHvOlex1f0MTv9Z2VmoJLiH8B1xit0tiWhY3qC3ZplR7w7w7KLaglmZNAHkOKHbnLi
 ndUZVWCCXXvDD62eotHIbl/QWM6HD8grZHUBeUNdXB0ih/WHdT+Ayn/bfT8clTEjHi7Z
 a0aix53hR+C9VFeDRyxddTgzBr48elLSoMvNW5kXyfjds+did1VJai76/QXpIlBkVy5w
 ARvDzxWOwljN2sDCtExAerJ8YksfW0Q+y/R97ZnsrGMG6WvkXOJKuUju4a8W2l2twa00
 b9hQbP9AAd6Yk/5T45fe07X6WJ4v3Djs4J/9HtpnM0lfv53bxILmNeV4fQZeM82ObgDh
 GbbA==
X-Gm-Message-State: AOAM531Kf/4uitc1dpkiXxl3dgo+FBOI25nWWGa2Wu2l1yYWoCHs9JNi
 jOwUU2+QsR78I1mqblBQtT8=
X-Google-Smtp-Source: ABdhPJypCsiZzSgDeHFQZCZAWlNhmyQv7NZTBNp+HPkA8gm3MK2jFdhHBkC4dzFWUdIMDjQnrb2J/A==
X-Received: by 2002:a9d:6c8d:: with SMTP id c13mr1943543otr.222.1604069225032; 
 Fri, 30 Oct 2020 07:47:05 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:47:04 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 03/15] ASoC: sun4i-i2s: Add support for H6 I2S
Date: Fri, 30 Oct 2020 15:46:36 +0100
Message-Id: <20201030144648.397824-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030144648.397824-1-peron.clem@gmail.com>
References: <20201030144648.397824-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

H6 I2S is very similar to that in H3, except it supports up to 16
channels.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 222 ++++++++++++++++++++++++++++++++++++
 1 file changed, 222 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 4ff2068779fd..24b3137afbc2 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -124,6 +124,21 @@
 #define SUN8I_I2S_RX_CHAN_SEL_REG	0x54
 #define SUN8I_I2S_RX_CHAN_MAP_REG	0x58
 
+/* Defines required for sun50i-h6 support */
+#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK	GENMASK(21, 20)
+#define SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset)	((offset) << 20)
+#define SUN50I_H6_I2S_TX_CHAN_SEL_MASK		GENMASK(19, 16)
+#define SUN50I_H6_I2S_TX_CHAN_SEL(chan)		((chan - 1) << 16)
+#define SUN50I_H6_I2S_TX_CHAN_EN_MASK		GENMASK(15, 0)
+#define SUN50I_H6_I2S_TX_CHAN_EN(num_chan)	(((1 << num_chan) - 1))
+
+#define SUN50I_H6_I2S_TX_CHAN_MAP0_REG	0x44
+#define SUN50I_H6_I2S_TX_CHAN_MAP1_REG	0x48
+
+#define SUN50I_H6_I2S_RX_CHAN_SEL_REG	0x64
+#define SUN50I_H6_I2S_RX_CHAN_MAP0_REG	0x68
+#define SUN50I_H6_I2S_RX_CHAN_MAP1_REG	0x6C
+
 struct sun4i_i2s;
 
 /**
@@ -476,6 +491,60 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	return 0;
 }
 
+static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
+				      unsigned int channels, unsigned int slots,
+				      unsigned int slot_width)
+{
+	unsigned int lrck_period;
+
+	/* Map the channels for playback and capture */
+	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFEDCBA98);
+	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210);
+	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP0_REG, 0xFEDCBA98);
+	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);
+
+	/* Configure the channels */
+	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
+			   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
+			   SUN50I_H6_I2S_TX_CHAN_SEL(channels));
+	regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_SEL_REG,
+			   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
+			   SUN50I_H6_I2S_TX_CHAN_SEL(channels));
+
+	regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
+			   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
+			   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM(channels));
+	regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
+			   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM_MASK,
+			   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM(channels));
+
+	switch (i2s->format & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
+		lrck_period = slot_width * slots;
+		break;
+
+	case SND_SOC_DAIFMT_LEFT_J:
+	case SND_SOC_DAIFMT_RIGHT_J:
+	case SND_SOC_DAIFMT_I2S:
+		lrck_period = slot_width;
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
+	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
+			   SUN50I_H6_I2S_TX_CHAN_EN_MASK,
+			   SUN50I_H6_I2S_TX_CHAN_EN(channels));
+
+	return 0;
+}
+
 static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
@@ -703,6 +772,108 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 	return 0;
 }
 
+static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
+				     unsigned int fmt)
+{
+	u32 mode, val;
+	u8 offset;
+
+	/*
+	 * DAI clock polarity
+	 *
+	 * The setup for LRCK contradicts the datasheet, but under a
+	 * scope it's clear that the LRCK polarity is reversed
+	 * compared to the expected polarity on the bus.
+	 */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_IF:
+		/* Invert both clocks */
+		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		/* Invert bit clock */
+		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED |
+		      SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		/* Invert frame clock */
+		val = 0;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		val = SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
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
+	/* DAI Mode */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
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
+			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
+			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset));
+	regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_SEL_REG,
+			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
+			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(offset));
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
 static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -983,6 +1154,22 @@ static const struct reg_default sun8i_i2s_reg_defaults[] = {
 	{ SUN8I_I2S_RX_CHAN_MAP_REG, 0x00000000 },
 };
 
+static const struct reg_default sun50i_h6_i2s_reg_defaults[] = {
+	{ SUN4I_I2S_CTRL_REG, 0x00060000 },
+	{ SUN4I_I2S_FMT0_REG, 0x00000033 },
+	{ SUN4I_I2S_FMT1_REG, 0x00000030 },
+	{ SUN4I_I2S_FIFO_CTRL_REG, 0x000400f0 },
+	{ SUN4I_I2S_DMA_INT_CTRL_REG, 0x00000000 },
+	{ SUN4I_I2S_CLK_DIV_REG, 0x00000000 },
+	{ SUN8I_I2S_CHAN_CFG_REG, 0x00000000 },
+	{ SUN8I_I2S_TX_CHAN_SEL_REG, 0x00000000 },
+	{ SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0x00000000 },
+	{ SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x00000000 },
+	{ SUN50I_H6_I2S_RX_CHAN_SEL_REG, 0x00000000 },
+	{ SUN50I_H6_I2S_RX_CHAN_MAP0_REG, 0x00000000 },
+	{ SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x00000000 },
+};
+
 static const struct regmap_config sun4i_i2s_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
@@ -1010,6 +1197,19 @@ static const struct regmap_config sun8i_i2s_regmap_config = {
 	.volatile_reg	= sun8i_i2s_volatile_reg,
 };
 
+static const struct regmap_config sun50i_h6_i2s_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= SUN50I_H6_I2S_RX_CHAN_MAP1_REG,
+	.cache_type	= REGCACHE_FLAT,
+	.reg_defaults	= sun50i_h6_i2s_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(sun50i_h6_i2s_reg_defaults),
+	.writeable_reg	= sun4i_i2s_wr_reg,
+	.readable_reg	= sun8i_i2s_rd_reg,
+	.volatile_reg	= sun8i_i2s_volatile_reg,
+};
+
 static int sun4i_i2s_runtime_resume(struct device *dev)
 {
 	struct sun4i_i2s *i2s = dev_get_drvdata(dev);
@@ -1168,6 +1368,24 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.set_fmt		= sun4i_i2s_set_soc_fmt,
 };
 
+static const struct sun4i_i2s_quirks sun50i_h6_i2s_quirks = {
+	.has_reset		= true,
+	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
+	.sun4i_i2s_regmap	= &sun50i_h6_i2s_regmap_config,
+	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
+	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
+	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
+	.bclk_dividers		= sun8i_i2s_clk_div,
+	.num_bclk_dividers	= ARRAY_SIZE(sun8i_i2s_clk_div),
+	.mclk_dividers		= sun8i_i2s_clk_div,
+	.num_mclk_dividers	= ARRAY_SIZE(sun8i_i2s_clk_div),
+	.get_bclk_parent_rate	= sun8i_i2s_get_bclk_parent_rate,
+	.get_sr			= sun8i_i2s_get_sr_wss,
+	.get_wss		= sun8i_i2s_get_sr_wss,
+	.set_chan_cfg		= sun50i_h6_i2s_set_chan_cfg,
+	.set_fmt		= sun50i_h6_i2s_set_soc_fmt,
+};
+
 static int sun4i_i2s_init_regmap_fields(struct device *dev,
 					struct sun4i_i2s *i2s)
 {
@@ -1337,6 +1555,10 @@ static const struct of_device_id sun4i_i2s_match[] = {
 		.compatible = "allwinner,sun50i-a64-codec-i2s",
 		.data = &sun50i_a64_codec_i2s_quirks,
 	},
+	{
+		.compatible = "allwinner,sun50i-h6-i2s",
+		.data = &sun50i_h6_i2s_quirks,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun4i_i2s_match);
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AE58CBC4
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:15:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3651662;
	Wed, 14 Aug 2019 08:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3651662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763319;
	bh=kHq3mZZ6LpBkNQzhOFO7pVMfAu+7pX8OETIxwmCbFoU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aiGcG01HYLmd10SiBNwKslufzvMAuz9YK53PtMjQtOh6Df67g9okM22i2V/j9rDid
	 oB9czQQGqTkHUb9VY8LZBdgcbDfshz19kI06VuY65ajXnp753LDsIXjc2imadNj6OX
	 R7Ln6kLqszZe0vrW4436J8+cIx+ISN2n1DA1Ykb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1007CF80673;
	Wed, 14 Aug 2019 08:09:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA520F80635; Wed, 14 Aug 2019 08:09:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E133FF80637
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E133FF80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NBv26dnd"
Received: by mail-lf1-x141.google.com with SMTP id h28so78398555lfj.5
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zp/v+XPoakv64rsBqvBGuIEtgA5Sr07uhpM4FUxkm0E=;
 b=NBv26dndxs9cji1ckOrrLw9r4eCTy627IatAHmthw0P10JNQy/fo4/Qsr0CZq3R2GA
 JFDIxO/FLHkLuJ6c2nN3ynNHGqDKRnqqvY4VxQ/9AsshGyZuSHFffen9s5Q2RhA6TdDS
 GA3unKrtvCGGq5WgGiOOL6HvpqoNQAgZeCn5LKm54cTu9eU1qYQjeyydNOstczE34Wa8
 PgiKR2PRzQEARvIWQscCMtOdWiGC1Gg20eVvKr/9zxR4dksm3Q53vZT0DsT2HVL230X/
 fnOmLKVDVsjfYJ2/mj9hCxNZ10gmcRDp+iHH7eFHXl1RZIsBM4DX8GMQcg3WsrFf1bf7
 soHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zp/v+XPoakv64rsBqvBGuIEtgA5Sr07uhpM4FUxkm0E=;
 b=Nr40+xMLzfVVASH1QYcBbZ1fx5cSf8vMbmmBParqAubkpKVFIeGoDGRTD4y2cPY5AY
 vRq2jZGiHztniHt3gokopL8tGW3PHC9RgVstXInaY1V7FhdOKKXjIT4hkIhk/LYvy+Hk
 A/IOtf3AGCxZdYQfWUGTn3g2QD1HEy+uomLogfm6nA9Kp+0p6sqcXWp2roVFgew0zTe8
 mlxc72jLfGvuEzuns+dJLTbH1t9ZdHZC1SdgjQO68RKxNYLMqIceKKb790PJrtMjZTI0
 5u+Mh4K2zf2w3brm2+1l/+gXVS7f+cOuc0JRA+B2i/P1msUVfq/Okc+83uGZIhZCZmsu
 zWIQ==
X-Gm-Message-State: APjAAAURIbkS98mFrr5P8b14ArhDGTZ2IQPFngyoNVlCeENdyPXBSJsQ
 www3Onzr7OwBR/Hz7b8Lnm0=
X-Google-Smtp-Source: APXvYqyefwP7/5DXwzqu3ScUtSJPu1sJZjbH/PhzSRoaWYRjfKhYTb3xwmY8hWHgFLZ9JmPJ59vJGw==
X-Received: by 2002:ac2:5094:: with SMTP id f20mr23616419lfm.53.1565762945896; 
 Tue, 13 Aug 2019 23:09:05 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:05 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:43 +0200
Message-Id: <20190814060854.26345-5-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 04/15] ASoC: sun4i-i2s: Support more formats
	on newer SoCs
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

From: Marcus Cooper <codekipper@gmail.com>

There is a need to support more formats on the newer SoCs(H3 and later).
Extend the formats supported to include DSP_A and DSP_B modes.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 87 +++++++++++++++++++++++++++----------
 1 file changed, 63 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 34f31439ae7b..3553c17318b0 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -27,6 +27,8 @@
 #define SUN4I_I2S_CTRL_MODE_MASK		BIT(5)
 #define SUN4I_I2S_CTRL_MODE_SLAVE			(1 << 5)
 #define SUN4I_I2S_CTRL_MODE_MASTER			(0 << 5)
+#define SUN4I_I2S_CTRL_PCM			BIT(4)
+#define SUN4I_I2S_CTRL_LOOP			BIT(3)
 #define SUN4I_I2S_CTRL_TX_EN			BIT(2)
 #define SUN4I_I2S_CTRL_RX_EN			BIT(1)
 #define SUN4I_I2S_CTRL_GL_EN			BIT(0)
@@ -91,6 +93,9 @@
 /* Defines required for sun8i-h3 support */
 #define SUN8I_I2S_CTRL_BCLK_OUT			BIT(18)
 #define SUN8I_I2S_CTRL_LRCK_OUT			BIT(17)
+#define SUN8I_I2S_CTRL_MODE_RIGHT_J			(2 << 0)
+#define SUN8I_I2S_CTRL_MODE_I2S_LEFT_J			(1 << 0)
+#define SUN8I_I2S_CTRL_MODE_PCM				(0 << 0)
 
 #define SUN8I_I2S_FMT0_LRCK_PERIOD_MASK		GENMASK(17, 8)
 #define SUN8I_I2S_FMT0_LRCK_PERIOD(period)	((period - 1) << 8)
@@ -164,6 +169,7 @@ struct sun4i_i2s_quirks {
 
 	s8	(*get_sr)(const struct sun4i_i2s *, int);
 	s8	(*get_wss)(const struct sun4i_i2s *, int);
+	int	(*set_format)(struct sun4i_i2s *, unsigned int);
 };
 
 struct sun4i_i2s {
@@ -194,6 +200,7 @@ struct sun4i_i2s {
 
 	unsigned int	tdm_slots;
 	unsigned int	slot_width;
+	unsigned int	offset;
 };
 
 struct sun4i_i2s_clk_div {
@@ -484,19 +491,14 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 				      i2s->slot_width : params_width(params));
 }
 
-static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+static int sun4i_i2s_set_format(struct sun4i_i2s *i2s, unsigned int fmt)
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
 	case SND_SOC_DAIFMT_LEFT_J:
 		val = SUN4I_I2S_FMT0_FMT_LEFT_J;
@@ -505,32 +507,64 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		val = SUN4I_I2S_FMT0_FMT_RIGHT_J;
 		break;
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
+	regmap_field_write(i2s->field_fmt_mode, val);
+
+	return 0;
+}
+
+static int sun8i_i2s_set_format(struct sun4i_i2s *i2s, unsigned int fmt)
+{
+	u32 val;
 
-		regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
-				   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
-				   SUN8I_I2S_TX_CHAN_OFFSET(offset));
+	/* DAI Mode */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		i2s->offset = 1;
+	case SND_SOC_DAIFMT_LEFT_J:
+		val = SUN8I_I2S_CTRL_MODE_I2S_LEFT_J;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		val = SUN8I_I2S_CTRL_MODE_RIGHT_J;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		i2s->offset = 1;
+	case SND_SOC_DAIFMT_DSP_B:
+		val = SUN8I_I2S_CTRL_MODE_PCM;
+		break;
+
+	default:
+		return -EINVAL;
 	}
 
+	/*
+	 * bclk offset determines whether i2s or LJ if in i2s mode and
+	 * DSP_A or DSP_B if in PCM mode.
+	 */
+	i2s->variant->set_txchanoffset(i2s, 0);
+	i2s->variant->set_rxchanoffset(i2s);
+
 	regmap_field_write(i2s->field_fmt_mode, val);
 
+	return 0;
+}
+
+static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	u32 val;
+	u32 bclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
+	u32 lrclk_polarity = SUN4I_I2S_FMT0_POLARITY_NORMAL;
+
+	/* Set DAI Mode */
+	if (i2s->variant->set_format(i2s, fmt) != 0) {
+		dev_err(dai->dev, "Unsupported format: %d\n",
+			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
+		return -EINVAL;
+	}
+
 	/* DAI clock polarity */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_IB_IF:
@@ -976,6 +1010,7 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
 	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
+	.set_format		= sun4i_i2s_set_format,
 };
 
 static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
@@ -996,6 +1031,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
 	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
+	.set_format		= sun4i_i2s_set_format,
 };
 
 static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
@@ -1015,6 +1051,7 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun8i_i2s_get_sr_wss,
 	.get_wss		= sun8i_i2s_get_sr_wss,
+	.set_format		= sun4i_i2s_set_format,
 };
 
 static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
@@ -1038,6 +1075,7 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.field_rxchansel	= REG_FIELD(SUN8I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun8i_i2s_get_sr_wss,
 	.get_wss		= sun8i_i2s_get_sr_wss,
+	.set_format		= sun8i_i2s_set_format,
 };
 
 static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
@@ -1058,6 +1096,7 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
+	.set_format		= sun4i_i2s_set_format,
 };
 
 static int sun4i_i2s_init_regmap_fields(struct device *dev,
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C108CBDA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:20:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD34C167B;
	Wed, 14 Aug 2019 08:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD34C167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763605;
	bh=9sBSUOqEvpXwKgwVyWXCS68NoE9TV8B4zF7zXwbLJMo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O3H8P1j8maE1LGR8xfaXOCVwJla8qeFs9WLcitmDCwpoQfXz7SuBCKgl4p26kiOIw
	 3U1uhVY+7brjDgsNlQMLcoo+x1sw9+PFHJZ/S3k5QI5Wi1XRzfMSYzVHvGXPT4dkQ7
	 31cLLGCo4fm1Hckh9x/t1PehsNJsE/Es9QP/Avp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46F90F80722;
	Wed, 14 Aug 2019 08:09:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3A75F80678; Wed, 14 Aug 2019 08:09:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C1EF80671
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C1EF80671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="taILUr5J"
Received: by mail-lf1-x144.google.com with SMTP id j17so24448722lfp.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgcC1ImRwMuk1Ia8dQlUqvp58gfMuRjlcUEPfcYXqQs=;
 b=taILUr5JiBBjJud4obIeP1LI0fSHn3/6iiD6jz7U98yrRZRB93rKsbSGMWHQgSO6Ym
 dwGY4mDzq1nNLXSr4LogvL9VTTkeY0AoRdb8+Zwdk8MbMpWFmU/Z1nLSlJqlGK+lIkNp
 RBVwEXHSwVH+9qDBVOadBbuVMYBoJ8SoD3AWyn13r4aK446weehUY9G6iTpp6/jwiFNj
 tp4JNXCh9OX6VyNALBe+hnRQUdpcJwtNhaugdwn7NJN0Z+zzxLgwuuDlVhHQWPjViX2R
 1xmL5sgIJ/slA5k81DEzC2NxKH1i5eXKj8NwOl9c6yyQwl3YetidumvT/0rwxJtYvVPz
 +EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgcC1ImRwMuk1Ia8dQlUqvp58gfMuRjlcUEPfcYXqQs=;
 b=LO5bWjSwd4c+/WXjLmmm/OxHUKwFo1TtfVH1iEFGcXQ7dZ6nPCCIQozta83gP6mo7c
 xiROLhPawBgcLWWTkNpYb2gKjdmuqK2omc2NczOT3SSi6f4rPIcZch+qua+VkiD9rl42
 Kytu42YqtFCKD7IYelWdMtQy2pZzLNCI5WAnjWbcFYnfEM+5Hl9IHyl4W8H9poZtI63/
 rRqYZdS7pju0XLcCp5MTkYdWEizJsgTPTOMrKeT3rY4akroeVF2Zz+y+10AjX/R8j8uc
 O+NallaJNxzphunOfVGaOAOiEMvmH7gxgrEAWQNCHzktAsWeGC1a+J26sE4LWkEiGcNL
 tdfA==
X-Gm-Message-State: APjAAAW0eW0XZirzcFkkKMmXfXpXYu/e54c1w+tTfP5MMdqwzSA2Aprt
 JxsCbQmJB1IVAyZuJivn1rs=
X-Google-Smtp-Source: APXvYqwjk4+ytqYxwdipLi25pMSNn65jT8RmVG6lMK9//BOWNcIgea7Fc9rYXQFUxqeQs2q9EnmiKA==
X-Received: by 2002:a19:5218:: with SMTP id m24mr25391865lfb.164.1565762955389; 
 Tue, 13 Aug 2019 23:09:15 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:14 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:50 +0200
Message-Id: <20190814060854.26345-12-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 11/15] ASoC: sun4i-i2s: Add support for H6
	I2S
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

H6 I2S is very similar to that in H3, except it supports up to 16
channels.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 sound/soc/sunxi/sun4i-i2s.c | 148 ++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 6de3cb41aaf6..a8d98696fe7c 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -121,6 +121,21 @@
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
@@ -440,6 +455,25 @@ static void sun8i_i2s_set_rxchanoffset(const struct sun4i_i2s *i2s)
 			   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
 }
 
+static void sun50i_h6_i2s_set_txchanoffset(const struct sun4i_i2s *i2s, int output)
+{
+	if (output >= 0 && output < 4) {
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
+				   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(i2s->offset));
+	}
+
+}
+
+static void sun50i_h6_i2s_set_rxchanoffset(const struct sun4i_i2s *i2s)
+{
+	regmap_update_bits(i2s->regmap,
+			   SUN50I_H6_I2S_RX_CHAN_SEL_REG,
+			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
+			   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(i2s->offset));
+}
+
 static void sun8i_i2s_set_txchanen(const struct sun4i_i2s *i2s, int output,
 				   int channel)
 {
@@ -459,6 +493,26 @@ static void sun8i_i2s_set_rxchanen(const struct sun4i_i2s *i2s, int channel)
 			   SUN8I_I2S_TX_CHAN_EN(channel));
 }
 
+
+static void sun50i_h6_i2s_set_txchanen(const struct sun4i_i2s *i2s, int output,
+				       int channel)
+{
+	if (output >= 0 && output < 4) {
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN50I_H6_I2S_TX_CHAN_EN_MASK,
+				   SUN50I_H6_I2S_TX_CHAN_EN(channel));
+	}
+}
+
+static void sun50i_h6_i2s_set_rxchanen(const struct sun4i_i2s *i2s, int channel)
+{
+	regmap_update_bits(i2s->regmap,
+			   SUN50I_H6_I2S_RX_CHAN_SEL_REG,
+			   SUN50I_H6_I2S_TX_CHAN_EN_MASK,
+			   SUN50I_H6_I2S_TX_CHAN_EN(channel));
+}
+
 static void sun4i_i2s_set_txchansel(const struct sun4i_i2s *i2s, int output,
 				    int channel)
 {
@@ -495,6 +549,25 @@ static void sun8i_i2s_set_rxchansel(const struct sun4i_i2s *i2s, int channel)
 				   SUN8I_I2S_TX_CHAN_SEL(channel));
 }
 
+static void sun50i_h6_i2s_set_txchansel(const struct sun4i_i2s *i2s, int output,
+				       int channel)
+{
+	if (output >= 0 && output < 4) {
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
+				   SUN50I_H6_I2S_TX_CHAN_SEL(channel));
+	}
+}
+
+static void sun50i_h6_i2s_set_rxchansel(const struct sun4i_i2s *i2s, int channel)
+{
+	regmap_update_bits(i2s->regmap,
+			   SUN50I_H6_I2S_RX_CHAN_SEL_REG,
+			   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
+			   SUN50I_H6_I2S_TX_CHAN_SEL(channel));
+}
+
 static void sun4i_i2s_set_txchanmap(const struct sun4i_i2s *i2s, int output,
 				    int channel)
 {
@@ -520,6 +593,20 @@ static void sun8i_i2s_set_rxchanmap(const struct sun4i_i2s *i2s, int channel)
 	regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, channel);
 }
 
+static void sun50i_h6_i2s_set_txchanmap(const struct sun4i_i2s *i2s, int output,
+				       int channel)
+{
+	if (output >= 0 && output < 4) {
+		regmap_write(i2s->regmap,
+			     SUN50I_H6_I2S_TX_CHAN_MAP1_REG + (output * 8), channel);
+	}
+}
+
+static void sun50i_h6_i2s_set_rxchanmap(const struct sun4i_i2s *i2s, int channel)
+{
+	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, channel);
+}
+
 static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
@@ -996,6 +1083,22 @@ static const struct reg_default sun8i_i2s_reg_defaults[] = {
 	{ SUN8I_I2S_RX_CHAN_MAP_REG, 0x00000000 },
 };
 
+static const struct reg_default sun50i_i2s_reg_defaults[] = {
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
@@ -1023,6 +1126,19 @@ static const struct regmap_config sun8i_i2s_regmap_config = {
 	.volatile_reg	= sun8i_i2s_volatile_reg,
 };
 
+static const struct regmap_config sun50i_i2s_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= SUN50I_H6_I2S_RX_CHAN_MAP1_REG,
+	.cache_type	= REGCACHE_FLAT,
+	.reg_defaults	= sun50i_i2s_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(sun50i_i2s_reg_defaults),
+	.writeable_reg	= sun4i_i2s_wr_reg,
+	.readable_reg	= sun8i_i2s_rd_reg,
+	.volatile_reg	= sun8i_i2s_volatile_reg,
+};
+
 static int sun4i_i2s_runtime_resume(struct device *dev)
 {
 	struct sun4i_i2s *i2s = dev_get_drvdata(dev);
@@ -1197,6 +1313,34 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.set_rxchanmap		= sun4i_i2s_set_rxchanmap,
 };
 
+static const struct sun4i_i2s_quirks sun50i_h6_i2s_quirks = {
+	.has_reset		= true,
+	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
+	.sun4i_i2s_regmap	= &sun50i_i2s_regmap_config,
+	.has_fmt_set_lrck_period = true,
+	.has_chcfg		= true,
+	.has_chsel_tx_chen	= true,
+	.has_chsel_offset	= true,
+	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
+	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
+	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
+	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
+	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 19, 19),
+	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_CTRL_REG, 4, 5),
+	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 4, 5),
+	.get_sr			= sun8i_i2s_get_sr_wss,
+	.get_wss		= sun8i_i2s_get_sr_wss,
+	.set_format		= sun8i_i2s_set_format,
+	.set_txchanoffset	= sun50i_h6_i2s_set_txchanoffset,
+	.set_rxchanoffset	= sun50i_h6_i2s_set_rxchanoffset,
+	.set_txchanen		= sun50i_h6_i2s_set_txchanen,
+	.set_rxchanen		= sun50i_h6_i2s_set_rxchanen,
+	.set_txchansel		= sun50i_h6_i2s_set_txchansel,
+	.set_rxchansel		= sun50i_h6_i2s_set_rxchansel,
+	.set_txchanmap		= sun50i_h6_i2s_set_txchanmap,
+	.set_rxchanmap		= sun50i_h6_i2s_set_rxchanmap,
+};
+
 static int sun4i_i2s_init_regmap_fields(struct device *dev,
 					struct sun4i_i2s *i2s)
 {
@@ -1389,6 +1533,10 @@ static const struct of_device_id sun4i_i2s_match[] = {
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
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

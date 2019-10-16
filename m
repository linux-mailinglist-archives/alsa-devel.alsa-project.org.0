Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8D8D8927
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 09:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5125D1654;
	Wed, 16 Oct 2019 09:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5125D1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571210058;
	bh=ElLx2xqSM2NtwdbBzZaRfecFM3HA0W1s7O549n3MaQM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akEWRSZ4V/1wMSzfxszHLDCgxmdRiyaDyhIR+A1QhadFwGYU6XjGxkBnhvUVdD+lF
	 KXRAiGbAmz5Uc9zLrNEkflUDC7jh0Vk7fyDpsrQUbiqt7MCR6uI8GH8DkXMCMjF7s6
	 eGLkMXghpJQBky7brhpz5YKkuGLRayjPozODxK9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2AD0F80673;
	Wed, 16 Oct 2019 09:08:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FBA4F80445; Wed, 16 Oct 2019 09:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFAA8F80369
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 09:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFAA8F80369
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ikO4Nfey"
Received: by mail-lf1-x142.google.com with SMTP id f23so1009997lfk.7
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gNHRYR580X8x1bE0nzjD1LYtjZv2eba+ww3yQC9CKKc=;
 b=ikO4NfeyeXrymHF438enHazKmZZZPYbwm6I0qSBXsa9riO9NnbGai0KEZrUmSUkNg4
 119kh6MVaNNT5ouEu3lH2n3WmYUt0u/29F/bftN6QfYukFMN4ZZS2COCTX7RT6Ikm0ga
 ME9aZ2drClIHPcUbfvavkZwMco8ld4KB32V4uX7JHPYAVwihRGHKlN6EL5CO/UA+wFct
 2TExnxRZF5usoAczylEYWs7pLFnlKX+6P9IpPmz9tH/DQARFftKrgmzBrNsSCjL70Ft1
 1Yahh/F36xCzCjC6y3hDZDLtM4gf29NEVP/2TK1lt/G+NIB2MXhCXigsgF1sYJFG1/rG
 vpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gNHRYR580X8x1bE0nzjD1LYtjZv2eba+ww3yQC9CKKc=;
 b=Ng9IjA2wkP9jOYXlr40brUUZ+Bpd+rWn0QJp++t4QkWBr+w13lB2V8uC/geGWcHoPV
 VxlfQi8j/mmfWxMSxrSILqD2TMZO5FXnpv8ZyQ0KpQF6mNK4Jf4lotB2qd8K3oXcWfhM
 DaBAzQSl0maHr4lHXOQaPsN+/+hYZrYYXCTqjoUJRzEckA+xthJbgIWTqCcoY31keuhW
 jv0oWX49afc2YDoRSvKXTaJ1MwVOuGqT2WTYqX7CdtwgRNbSWJZuGw6H6aL6EgqzTdFb
 bE60I/+hj8egod8eN2Xc/MFxnxrH/jWubzSIIpnTdiZmNpbCVax6pgkMDUEF3wvUyFh8
 Nkhg==
X-Gm-Message-State: APjAAAUtkZZxQ1VMbC7ZEYYBooSSgp2CjQTnsUbxjiHKRk759a2vTnxW
 L4nPRUWZjchAe2fW58fdibE=
X-Google-Smtp-Source: APXvYqwvS4oTHLlcSCrSyE3GLnjqhb/Ba3AQr1ESYOQy3s1O/N0QXKPawAaVOtKRAEgz+4RKfDFLgg==
X-Received: by 2002:ac2:4c99:: with SMTP id d25mr24948360lfl.112.1571209671855; 
 Wed, 16 Oct 2019 00:07:51 -0700 (PDT)
Received: from localhost.localdomain (c213-102-65-51.bredband.comhem.se.
 [213.102.65.51])
 by smtp.gmail.com with ESMTPSA id j191sm1361493lfj.49.2019.10.16.00.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 00:07:51 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Wed, 16 Oct 2019 09:07:40 +0200
Message-Id: <20191016070740.121435-8-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016070740.121435-1-codekipper@gmail.com>
References: <20191016070740.121435-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 Marcus Cooper <codekipper@gmail.com>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, be17068@iperbole.bo.it, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 7/7] ASoC: sun4i-i2s: Add support for H6 I2S
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
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 143 ++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 63ae9da180f2..564b31788f29 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -126,6 +126,21 @@
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
@@ -484,6 +499,24 @@ static void sun8i_i2s_set_rxchanoffset(const struct sun4i_i2s *i2s)
 			   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
 }
 
+static void sun50i_h6_i2s_set_txchanoffset(const struct sun4i_i2s *i2s, int output)
+{
+	if (output >= 0 && output < 4)
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET_MASK,
+				   SUN50I_H6_I2S_TX_CHAN_SEL_OFFSET(i2s->offset));
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
@@ -502,6 +535,25 @@ static void sun8i_i2s_set_rxchanen(const struct sun4i_i2s *i2s, int channel)
 			   SUN8I_I2S_TX_CHAN_EN(channel));
 }
 
+
+static void sun50i_h6_i2s_set_txchanen(const struct sun4i_i2s *i2s, int output,
+				       int channel)
+{
+	if (output >= 0 && output < 4)
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN50I_H6_I2S_TX_CHAN_EN_MASK,
+				   SUN50I_H6_I2S_TX_CHAN_EN(channel));
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
@@ -536,6 +588,24 @@ static void sun8i_i2s_set_rxchansel(const struct sun4i_i2s *i2s, int channel)
 			   SUN8I_I2S_TX_CHAN_SEL(channel));
 }
 
+static void sun50i_h6_i2s_set_txchansel(const struct sun4i_i2s *i2s, int output,
+				       int channel)
+{
+	if (output >= 0 && output < 4)
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN50I_H6_I2S_TX_CHAN_SEL_MASK,
+				   SUN50I_H6_I2S_TX_CHAN_SEL(channel));
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
@@ -561,6 +631,20 @@ static void sun8i_i2s_set_rxchanmap(const struct sun4i_i2s *i2s, int channel)
 	regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, channel);
 }
 
+static void sun50i_h6_i2s_set_txchanmap(const struct sun4i_i2s *i2s, int output,
+				       int channel)
+{
+	if (output >= 0 && output < 4)
+		regmap_write(i2s->regmap,
+			     SUN50I_H6_I2S_TX_CHAN_MAP1_REG + (output * 8),
+			     channel);
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
@@ -1073,6 +1157,22 @@ static const struct reg_default sun8i_i2s_reg_defaults[] = {
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
@@ -1100,6 +1200,19 @@ static const struct regmap_config sun8i_i2s_regmap_config = {
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
@@ -1282,6 +1395,32 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.set_rxchanmap		= sun4i_i2s_set_rxchanmap,
 };
 
+static const struct sun4i_i2s_quirks sun50i_h6_i2s_quirks = {
+	.has_reset		= true,
+	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
+	.sun4i_i2s_regmap	= &sun50i_i2s_regmap_config,
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
+	.set_chan_cfg		= sun8i_i2s_set_chan_cfg,
+	.set_fmt		= sun8i_i2s_set_soc_fmt,
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
@@ -1451,6 +1590,10 @@ static const struct of_device_id sun4i_i2s_match[] = {
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
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

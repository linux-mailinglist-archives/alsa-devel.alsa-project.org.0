Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E14A7DAB
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 03:03:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42BBB1765;
	Thu,  3 Feb 2022 03:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42BBB1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643853817;
	bh=1nYFEN1/4erDVLTe/B8bIFjYlBm3AWb9NrlvinkC2dI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WSO/JPzgpPYJcTmYPNs/jcP57cKvcMWwmwD3wq67SwOcMbb54NBUOxa1j4GPKhYsG
	 SDl0W17y2kADBXmZDB7JAMCQggqzDuMHclhrEGtPA0que5HKFWymN2K0vtFS4VIcnM
	 1/djLwP0p/c5dCjy8aDcb6sVZaKPvmNcy40zy/z4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8484AF8051D;
	Thu,  3 Feb 2022 03:01:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FAD7F8051C; Thu,  3 Feb 2022 03:01:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75206F804FF
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 03:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75206F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Y5LZzRN/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IWMZ7Q+H"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 3592A2B000AA;
 Wed,  2 Feb 2022 21:01:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Feb 2022 21:01:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=y8j2YqOeUt9CFvCY/A5IZkTtZPlYGO
 6i7wZOgPBfdkw=; b=Y5LZzRN/nDON16ylBr2rbS0I4v1pj46REeMdg1LhPj/nNW
 96M6kY6fVEB9jceNFNE9EmXDwJDxIp26k//f9fupVzeWVon09P18pSQFbxho0qDF
 vENawG8kNKl1qwn3kYJSXB7zTLCcXMZs/quzpoOg/rl+1iA0e0xZjWTACMIFZDEG
 t8QgEBE+ybIZCAuKTzvSwDweaS12s0TLfjT5FmBsKAciVcB17+z2ltdcYPHjjbEW
 10CA3vgjT+qOVcp+OJ//qGqXWQixoMjyYCVWQhFxWRV1putXB8V1lgugh3BMbkyU
 qWx28EMLiIw9JI6A9NTxJnGCSO/H4U/gU+HRs6eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=y8j2Yq
 OeUt9CFvCY/A5IZkTtZPlYGO6i7wZOgPBfdkw=; b=IWMZ7Q+Hd8dW65iZnfs8Gq
 ZdeGuKs8a6OlLw2Eyc1oXLM8q8g6QaUbDnl+eldVZLLWSHpmiVZsG0TxDPD1s1nS
 UbRNcyPqdgAZKBlEEYsv6gVZlQg8+IZhPXCoMGPKaNFiFN6QSBlgElsNWjFOO6KZ
 QPJtsOYJRPyf/Jex//EmKsTNbuAQU2EZ0QU6pn7abO8Gul5m42hkX2gvo4KQLdPp
 LghUdBrjMudN6/v6W7QV0ullmPH1+JpZNbxNE37R+n8ZcpwUXVa/CwH/KVni6J9b
 B3KoY9TCVRoo/v53Ev4lMXALnpOUNCsOGc1ucMVPXj0u4RW7ZnBJIjm0TuOGFN2g
 ==
X-ME-Sender: <xms:eTf7YTWMJv5fmNBS7RsP3I014Z4tAt2Ohnz3hUlrmGxTjiaBkKn3wA>
 <xme:eTf7YblsM1d25P97a4aZDUO--M0XyHRoEthcIqrnuBjxklkXsuzZTv_kQfvcoSuYs
 B0w3njNxUHq7gHCoA>
X-ME-Received: <xmr:eTf7YfbYf_RwHpC3H1w57Fn_XCUJ79eCZtTpqfBnlz2NCGzF9J-akNm-VI2pB1jO_Y6-OP0jxsBcbASo_HkollrjF4o3ebBGRomQJQSibrzgvREQZ9N0JRafAvE7aBVZ1TfTzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:eTf7YeXQB5OuhnTSYGGiPCyO5tktXz6lU9tGLgSkhFUbKCqrxvwsQw>
 <xmx:eTf7YdlzYQXPVsv7LP3Fc7uZNWQgrSLDGTLaBR3SXYAj3vrgiOnrUA>
 <xmx:eTf7YbflhVOq4YOYs7zkblAxRSUll-9oDtj1SZ_VVQeo3cok1gdDGw>
 <xmx:eTf7YfkQfpRzojAkcGq7CPRCki_PB9VuzbnimxAQlRpVYE-ZPdStdRk-Gvw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 21:01:28 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: sun4i-i2s: Add support for the R329/D1 variant
Date: Wed,  2 Feb 2022 20:01:15 -0600
Message-Id: <20220203020116.12279-4-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220203020116.12279-1-samuel@sholland.org>
References: <20220203020116.12279-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

This adds a new set of quirks to set the right RX channel map. Since
that is the only change to the register layout, reuse the H6 regmap
config by extending its last register. R329 support is added by its
compatible string. D1 uses R329 as its fallback compatible, so no
additional code change is needed for it.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 sound/soc/sunxi/sun4i-i2s.c | 40 ++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 7da8a16955a1..7047f71629ab 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -181,6 +181,9 @@ struct sun4i_i2s_quirks {
 	struct reg_field		field_fmt_wss;
 	struct reg_field		field_fmt_sr;
 
+	unsigned int			num_din_pins;
+	unsigned int			num_dout_pins;
+
 	const struct sun4i_i2s_clk_div	*bclk_dividers;
 	unsigned int			num_bclk_dividers;
 	const struct sun4i_i2s_clk_div	*mclk_dividers;
@@ -531,8 +534,15 @@ static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	/* Map the channels for playback and capture */
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG(0), 0xFEDCBA98);
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG(0), 0x76543210);
-	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP0_REG, 0xFEDCBA98);
-	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);
+	if (i2s->variant->num_din_pins > 1) {
+		regmap_write(i2s->regmap, SUN50I_R329_I2S_RX_CHAN_MAP0_REG, 0x0F0E0D0C);
+		regmap_write(i2s->regmap, SUN50I_R329_I2S_RX_CHAN_MAP1_REG, 0x0B0A0908);
+		regmap_write(i2s->regmap, SUN50I_R329_I2S_RX_CHAN_MAP2_REG, 0x07060504);
+		regmap_write(i2s->regmap, SUN50I_R329_I2S_RX_CHAN_MAP3_REG, 0x03020100);
+	} else {
+		regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP0_REG, 0xFEDCBA98);
+		regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);
+	}
 
 	/* Configure the channels */
 	regmap_update_bits(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_SEL_REG(0),
@@ -1255,7 +1265,7 @@ static const struct regmap_config sun50i_h6_i2s_regmap_config = {
 	.reg_bits	= 32,
 	.reg_stride	= 4,
 	.val_bits	= 32,
-	.max_register	= SUN50I_H6_I2S_RX_CHAN_MAP1_REG,
+	.max_register	= SUN50I_R329_I2S_RX_CHAN_MAP3_REG,
 	.cache_type	= REGCACHE_FLAT,
 	.reg_defaults	= sun50i_h6_i2s_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(sun50i_h6_i2s_reg_defaults),
@@ -1440,6 +1450,26 @@ static const struct sun4i_i2s_quirks sun50i_h6_i2s_quirks = {
 	.set_fmt		= sun50i_h6_i2s_set_soc_fmt,
 };
 
+static const struct sun4i_i2s_quirks sun50i_r329_i2s_quirks = {
+	.has_reset		= true,
+	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
+	.sun4i_i2s_regmap	= &sun50i_h6_i2s_regmap_config,
+	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
+	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
+	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
+	.num_din_pins		= 4,
+	.num_dout_pins		= 4,
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
@@ -1612,6 +1642,10 @@ static const struct of_device_id sun4i_i2s_match[] = {
 		.compatible = "allwinner,sun50i-h6-i2s",
 		.data = &sun50i_h6_i2s_quirks,
 	},
+	{
+		.compatible = "allwinner,sun50i-r329-i2s",
+		.data = &sun50i_r329_i2s_quirks,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun4i_i2s_match);
-- 
2.33.1


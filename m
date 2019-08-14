Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCB8CBD0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E13984F;
	Wed, 14 Aug 2019 08:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E13984F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763440;
	bh=TWvUe3tggCShZAo0l8ff3R34WT/DOyzFM2YkJXBQswE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pd5j8fMCE09FxcYedZyVJnEyF/x5fy/jdNN1Lc6WNsumZad3z/Joey15rG2KQjNdy
	 k8g3l4bFRbV/eCaecOxXOgWivC1aNYu+hPtnRMZsFJJu761ZpyiuObaciVuCqtl4zV
	 GTA7nudxD9Y18S3KKxlFsQ9d0WTHLcnB2oCOBsvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FFD2F80671;
	Wed, 14 Aug 2019 08:09:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E62AF80649; Wed, 14 Aug 2019 08:09:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D92FAF80635
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D92FAF80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tQfqyRvT"
Received: by mail-lf1-x141.google.com with SMTP id c19so78488420lfm.10
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hQI2wB1ddyifNXdhbtWpyOmR4Q6LJuhJNbSf0B0Jvx0=;
 b=tQfqyRvTOqN3BPllHfoaHK31M0DRGttsP6gCGd/3dt4ZbyEQ/ssbO/gSCpecTOAqCY
 q1VjJaciyAmxO+EWp+FzJwFw9Mrqgqw8YhX9zpcUY4yS2WQSPmIyAWAI90BbTFsOXNqf
 DqAlXB1hUAUhzIUWwab0o9GaibZ6y2WzrBf9PLYXpXFEipTjGAjXVLMf0ZDsoQtiO+hR
 iVbPX/TMFjsA36FLXoMIIP3IXutbboO2DY3WC9CTYY4MNtfTZ3R6OXFUBbuePyeYTjaq
 1P8ynMCsrnh90LeIBSjbpU14LIosMmfGKqMn2UGnsiQwgdz89FUebw53tHhCqQ5V0EBc
 aFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hQI2wB1ddyifNXdhbtWpyOmR4Q6LJuhJNbSf0B0Jvx0=;
 b=Dc0bG9JAe47yQX9JpeKwZAfrG0l96fZ7wY4Xbs4FsRxctWMs4EYVJekt+FSgYNbgWk
 SB3UOiwiR2yxejcbAIA90MzRb4CZm3vx6ZZc+Cl9Ly8sXrKzFeLe40TBribilzw4jZem
 EqRWPZgzyejp18kGPD+HCY/S+XpO+0W9+BDppymYzbRo3GofBcLIeYh7ousWQ+SbpeMu
 cecmcOS4407Z+QlK3yswE7Ip3hzWJRXQyo7NxZPkcqQ/ApDtrLsa1Cy0LjmWVkbZoAHH
 jjFk+X3c7dY8+SAgnhU1dNgBiPHMH4r7oByMwtu/zYGEY1RG/10eFdWBxUOlvAgMJt03
 ZOtw==
X-Gm-Message-State: APjAAAWb30nfFRPNJDUkEQekJkw/YWV+MRSndK8dyaoumlYdd6U30R7R
 wS0eeMSZJN3L/lGCPKzJxio=
X-Google-Smtp-Source: APXvYqwIL5h8Tw6O84IroBFXAmJf8gwUp6ra8pjybOnE/iyy5hXNljBh3DZgvm8hBW3SqnbdKveNIw==
X-Received: by 2002:a19:750b:: with SMTP id y11mr22463929lfe.99.1565762949820; 
 Tue, 13 Aug 2019 23:09:09 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:09 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:46 +0200
Message-Id: <20190814060854.26345-8-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 07/15] ASoC: sun4i-i2s: Add functions for RX
	and TX channel selects
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

Newer SoCs like the H6 have the channel select bits in a different
positions than what is on the H3. As we will eventually add multi-
channel support then create function calls as opposed to regmap
fields to add support for different devices.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 87 ++++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index ad2ff83deeb7..0b98adde0717 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -115,6 +115,8 @@
 #define SUN8I_I2S_TX_CHAN_OFFSET(offset)	((offset) << 12)
 #define SUN8I_I2S_TX_CHAN_EN_MASK		GENMASK(11, 4)
 #define SUN8I_I2S_TX_CHAN_EN(num_chan)		(((1 << num_chan) - 1) << 4)
+#define SUN8I_I2S_TX_CHAN_SEL_MASK		GENMASK(2, 0)
+#define SUN8I_I2S_TX_CHAN_SEL(chan)		(chan - 1)
 
 #define SUN8I_I2S_RX_CHAN_SEL_REG	0x54
 #define SUN8I_I2S_RX_CHAN_MAP_REG	0x58
@@ -141,8 +143,6 @@ struct sun4i_i2s;
  * @field_fmt_sext: regmap field to set the sign extension.
  * @field_txchanmap: location of the tx channel mapping register.
  * @field_rxchanmap: location of the rx channel mapping register.
- * @field_txchansel: location of the tx channel select bit fields.
- * @field_rxchansel: location of the rx channel select bit fields.
  */
 struct sun4i_i2s_quirks {
 	bool				has_reset;
@@ -164,8 +164,6 @@ struct sun4i_i2s_quirks {
 	struct reg_field		field_fmt_sext;
 	struct reg_field		field_txchanmap;
 	struct reg_field		field_rxchanmap;
-	struct reg_field		field_txchansel;
-	struct reg_field		field_rxchansel;
 
 	s8	(*get_sr)(const struct sun4i_i2s *, int);
 	s8	(*get_wss)(const struct sun4i_i2s *, int);
@@ -174,6 +172,8 @@ struct sun4i_i2s_quirks {
 	void	(*set_rxchanoffset)(const struct sun4i_i2s *);
 	void	(*set_txchanen)(const struct sun4i_i2s *, int, int);
 	void	(*set_rxchanen)(const struct sun4i_i2s *, int);
+	void	(*set_txchansel)(const struct sun4i_i2s *, int, int);
+	void	(*set_rxchansel)(const struct sun4i_i2s *, int);
 };
 
 struct sun4i_i2s {
@@ -197,8 +197,6 @@ struct sun4i_i2s {
 	struct regmap_field	*field_fmt_sext;
 	struct regmap_field	*field_txchanmap;
 	struct regmap_field	*field_rxchanmap;
-	struct regmap_field	*field_txchansel;
-	struct regmap_field	*field_rxchansel;
 
 	const struct sun4i_i2s_quirks	*variant;
 
@@ -465,6 +463,42 @@ static void sun8i_i2s_set_rxchanen(const struct sun4i_i2s *i2s, int channel)
 			   SUN8I_I2S_TX_CHAN_EN(channel));
 }
 
+static void sun4i_i2s_set_txchansel(const struct sun4i_i2s *i2s, int output,
+				    int channel)
+{
+	/* Configure the channels */
+	regmap_write(i2s->regmap,
+		     SUN4I_I2S_TX_CHAN_SEL_REG,
+		     SUN4I_I2S_CHAN_SEL(channel));
+}
+
+static void sun8i_i2s_set_txchansel(const struct sun4i_i2s *i2s, int output,
+				    int channel)
+{
+	if (output >= 0 && output < 4) {
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN8I_I2S_TX_CHAN_SEL_MASK,
+				   SUN8I_I2S_TX_CHAN_SEL(channel));
+	}
+}
+
+static void sun4i_i2s_set_rxchansel(const struct sun4i_i2s *i2s, int channel)
+{
+	/* Configure the channels */
+	regmap_write(i2s->regmap,
+		     SUN4I_I2S_RX_CHAN_SEL_REG,
+		     SUN4I_I2S_CHAN_SEL(channel));
+}
+
+static void sun8i_i2s_set_rxchansel(const struct sun4i_i2s *i2s, int channel)
+{
+	regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_RX_CHAN_SEL_REG,
+				   SUN8I_I2S_TX_CHAN_SEL_MASK,
+				   SUN8I_I2S_TX_CHAN_SEL(channel));
+}
+
 static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
@@ -494,11 +528,8 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	regmap_field_write(i2s->field_rxchanmap, 0x00003210);
 
 	/* Configure the channels */
-	regmap_field_write(i2s->field_txchansel,
-			   SUN4I_I2S_CHAN_SEL(params_channels(params)));
-
-	regmap_field_write(i2s->field_rxchansel,
-			   SUN4I_I2S_CHAN_SEL(params_channels(params)));
+	i2s->variant->set_txchansel(i2s, 0, channels);
+	i2s->variant->set_rxchansel(i2s, channels);
 
 	if (i2s->variant->set_txchanen)
 		i2s->variant->set_txchanen(i2s, 0, channels);
@@ -1048,11 +1079,11 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
 	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
 	.field_txchanmap	= REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
-	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
-	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
 	.set_format		= sun4i_i2s_set_format,
+	.set_txchansel		= sun4i_i2s_set_txchansel,
+	.set_rxchansel		= sun4i_i2s_set_rxchansel,
 };
 
 static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
@@ -1069,11 +1100,11 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
 	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
 	.field_txchanmap	= REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
-	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
-	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
 	.set_format		= sun4i_i2s_set_format,
+	.set_txchansel		= sun4i_i2s_set_txchansel,
+	.set_rxchansel		= sun4i_i2s_set_rxchansel,
 };
 
 static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
@@ -1089,11 +1120,11 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
 	.field_txchanmap	= REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
-	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
-	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun8i_i2s_get_sr_wss,
 	.get_wss		= sun8i_i2s_get_sr_wss,
 	.set_format		= sun4i_i2s_set_format,
+	.set_txchansel		= sun4i_i2s_set_txchansel,
+	.set_rxchansel		= sun4i_i2s_set_rxchansel,
 };
 
 static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
@@ -1113,8 +1144,6 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 4, 5),
 	.field_txchanmap	= REG_FIELD(SUN8I_I2S_TX_CHAN_MAP_REG, 0, 31),
 	.field_rxchanmap	= REG_FIELD(SUN8I_I2S_RX_CHAN_MAP_REG, 0, 31),
-	.field_txchansel	= REG_FIELD(SUN8I_I2S_TX_CHAN_SEL_REG, 0, 2),
-	.field_rxchansel	= REG_FIELD(SUN8I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun8i_i2s_get_sr_wss,
 	.get_wss		= sun8i_i2s_get_sr_wss,
 	.set_format		= sun8i_i2s_set_format,
@@ -1122,6 +1151,8 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.set_rxchanoffset	= sun8i_i2s_set_rxchanoffset,
 	.set_txchanen		= sun8i_i2s_set_txchanen,
 	.set_rxchanen		= sun8i_i2s_set_rxchanen,
+	.set_txchansel		= sun8i_i2s_set_txchansel,
+	.set_rxchansel		= sun8i_i2s_set_rxchansel,
 };
 
 static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
@@ -1138,11 +1169,11 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
 	.field_txchanmap	= REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
-	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
-	.field_rxchansel	= REG_FIELD(SUN4I_I2S_RX_CHAN_SEL_REG, 0, 2),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
 	.set_format		= sun4i_i2s_set_format,
+	.set_txchansel		= sun4i_i2s_set_txchansel,
+	.set_rxchansel		= sun4i_i2s_set_rxchansel,
 };
 
 static int sun4i_i2s_init_regmap_fields(struct device *dev,
@@ -1199,19 +1230,7 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
 	i2s->field_rxchanmap =
 			devm_regmap_field_alloc(dev, i2s->regmap,
 						i2s->variant->field_rxchanmap);
-	if (IS_ERR(i2s->field_rxchanmap))
-		return PTR_ERR(i2s->field_rxchanmap);
-
-	i2s->field_txchansel =
-			devm_regmap_field_alloc(dev, i2s->regmap,
-						i2s->variant->field_txchansel);
-	if (IS_ERR(i2s->field_txchansel))
-		return PTR_ERR(i2s->field_txchansel);
-
-	i2s->field_rxchansel =
-			devm_regmap_field_alloc(dev, i2s->regmap,
-						i2s->variant->field_rxchansel);
-	return PTR_ERR_OR_ZERO(i2s->field_rxchansel);
+	return PTR_ERR_OR_ZERO(i2s->field_rxchanmap);
 }
 
 static int sun4i_i2s_probe(struct platform_device *pdev)
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

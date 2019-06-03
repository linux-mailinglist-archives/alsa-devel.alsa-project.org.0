Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B8F33746
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 19:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 730481654;
	Mon,  3 Jun 2019 19:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 730481654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559584274;
	bh=vKg+FysSZ0WkOJfmMaSVNzeqo1YFYzo5yWOjjG+J3PM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o/MGt1E/PAoAAVkfoRNl+qa9mSQR0uoAdyvT3vegRepRejFGvwitp04vnzJqzpBBr
	 aFmatSD2Ftc6+UqNr900OYKk1BKaBMMgbiygOySKRj3UWs9zJiW4JEBI085jF1CAqK
	 oRwXom3Vd5eg+t6Ege4mafpm/ZwDSW+ncdoebjkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B3A7F89732;
	Mon,  3 Jun 2019 19:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CBD1F8971F; Mon,  3 Jun 2019 19:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E102F80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E102F80774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AdhORNEG"
Received: by mail-lf1-x142.google.com with SMTP id q26so14291344lfc.3
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTpr5vmYx+4PQoKXbPkvuxXzIJqpQ3J3+BEDcR37i9o=;
 b=AdhORNEGJyXa28hjmgyo+I46Wacno8kLfpt5N581IFLrUXkcGYATKdc9DktXkTSftY
 5fF/V8rwGZYcsdkLst4jq1jCHNY8gcFoUIU3j/DloS+iritZfrBnZSJhDnzOWvYroBR4
 ZQ5VkrfHTCc3CJLwKlxjyT6qOCGMmd+prkSjvi+jjeyjNNsBtt8VY57ecOL1pkUhFD3u
 S+EJH458MjZqPDGIj5/wvIAg5RIR1HywmNaGoZCD6ocmoYSD9mzODxr7G0QAXMCh6Mf6
 ILspvhgjwtR6Ix7P1h6OMQrNN57x6pVeU1MCLYqVrY/xNRnTN3X8Y4V9v5ax0pNByujl
 Ncqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTpr5vmYx+4PQoKXbPkvuxXzIJqpQ3J3+BEDcR37i9o=;
 b=kjI8T2mE6eVhoUerdG62MS6jnDfhpy9xHGoe5JRsavyodXaEW9oGsIWb4/Ucqc9GYG
 RbUabpt+0KDSVjndykPbrkcPd5SmwDssPajgWueJwxP8SATNzRi5KI0fjSrBZ7GWoiD8
 +D0WG3se+Kdt/Akuu7pLqcYri8nc9GWMEqkMjWN5+UvVfxvCrOHYDASttqY1dKn/Ulc9
 T7BGCjZZLdJE4aXpN/uIEVDKwQ6vdql7ioOeJvXEvcoNXs7Gq5Ii6eR/NIj7Fidi76Yu
 qjpAW+/W1DuGIU8OG9l+Yw9hUyYQ/XjooV/cPdNmQT3dK6CjTv6jg5rT1VDUmOllrIEH
 qJIw==
X-Gm-Message-State: APjAAAW6ViTN9n/IQuF0916LOvT+c4ub+5KogC52gl6QsJ93HVG/wxeD
 Hgflt5UiQCjbYUh46TQ9oQI=
X-Google-Smtp-Source: APXvYqylFVoVP9qdtJwm5SQFqUJALd4A978lZUNaHF+gTwQHftzFhZJcrtyfVrv2UH2MEPy5myCQvg==
X-Received: by 2002:a19:9e53:: with SMTP id h80mr14028072lfe.77.1559584060567; 
 Mon, 03 Jun 2019 10:47:40 -0700 (PDT)
Received: from localhost.localdomain ([188.150.253.81])
 by smtp.gmail.com with ESMTPSA id n7sm2803532lfi.68.2019.06.03.10.47.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:47:40 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Mon,  3 Jun 2019 19:47:29 +0200
Message-Id: <20190603174735.21002-4-codekipper@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603174735.21002-1-codekipper@gmail.com>
References: <20190603174735.21002-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 3/9] ASoC: sun4i-i2s: Add regmap field to
	sign extend sample
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

On the newer SoCs this is set by default to transfer a 0 after
each sample in each slot. However the platform that this driver
was developed on had the default setting where it padded the
audio gain with zeros. This isn't a problem whilst we have only
support for 16bit audio but with larger sample resolution rates
in the pipeline then it should be fixed to also pad. Without this
the audio gets distorted.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index fd7c37596f21..e2961d8f6e8c 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -134,6 +134,7 @@
  * @field_fmt_bclk: regmap field to set clk polarity.
  * @field_fmt_lrclk: regmap field to set frame polarity.
  * @field_fmt_mode: regmap field to set the operational mode.
+ * @field_fmt_sext: regmap field to set the sign extension.
  * @field_txchanmap: location of the tx channel mapping register.
  * @field_rxchanmap: location of the rx channel mapping register.
  * @field_txchansel: location of the tx channel select bit fields.
@@ -159,6 +160,7 @@ struct sun4i_i2s_quirks {
 	struct reg_field		field_fmt_bclk;
 	struct reg_field		field_fmt_lrclk;
 	struct reg_field		field_fmt_mode;
+	struct reg_field		field_fmt_sext;
 	struct reg_field		field_txchanmap;
 	struct reg_field		field_rxchanmap;
 	struct reg_field		field_txchansel;
@@ -183,6 +185,7 @@ struct sun4i_i2s {
 	struct regmap_field	*field_fmt_bclk;
 	struct regmap_field	*field_fmt_lrclk;
 	struct regmap_field	*field_fmt_mode;
+	struct regmap_field	*field_fmt_sext;
 	struct regmap_field	*field_txchanmap;
 	struct regmap_field	*field_rxchanmap;
 	struct regmap_field	*field_txchansel;
@@ -342,6 +345,9 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 				   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
 				   SUN8I_I2S_FMT0_LRCK_PERIOD(32));
 
+	/* Set sign extension to pad out LSB with 0 */
+	regmap_field_write(i2s->field_fmt_sext, 0);
+
 	return 0;
 }
 
@@ -887,6 +893,7 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
 	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
 	.has_slave_select_bit	= true,
 	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
+	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
 	.field_txchanmap	= REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
 	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
@@ -904,6 +911,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
 	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
 	.has_slave_select_bit	= true,
 	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 1),
+	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
 	.field_txchanmap	= REG_FIELD(SUN4I_I2S_TX_CHAN_MAP_REG, 0, 31),
 	.field_rxchanmap	= REG_FIELD(SUN4I_I2S_RX_CHAN_MAP_REG, 0, 31),
 	.field_txchansel	= REG_FIELD(SUN4I_I2S_TX_CHAN_SEL_REG, 0, 2),
@@ -944,6 +952,7 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.field_fmt_bclk		= REG_FIELD(SUN4I_I2S_FMT0_REG, 7, 7),
 	.field_fmt_lrclk	= REG_FIELD(SUN4I_I2S_FMT0_REG, 19, 19),
 	.field_fmt_mode		= REG_FIELD(SUN4I_I2S_CTRL_REG, 4, 5),
+	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 4, 5),
 	.field_txchanmap	= REG_FIELD(SUN8I_I2S_TX_CHAN_MAP_REG, 0, 31),
 	.field_rxchanmap	= REG_FIELD(SUN8I_I2S_RX_CHAN_MAP_REG, 0, 31),
 	.field_txchansel	= REG_FIELD(SUN8I_I2S_TX_CHAN_SEL_REG, 0, 2),
@@ -1006,6 +1015,12 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
 	if (IS_ERR(i2s->field_fmt_mode))
 		return PTR_ERR(i2s->field_fmt_mode);
 
+	i2s->field_fmt_sext =
+			devm_regmap_field_alloc(dev, i2s->regmap,
+						i2s->variant->field_fmt_sext);
+	if (IS_ERR(i2s->field_fmt_sext))
+		return PTR_ERR(i2s->field_fmt_sext);
+
 	i2s->field_txchanmap =
 			devm_regmap_field_alloc(dev, i2s->regmap,
 						i2s->variant->field_txchanmap);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

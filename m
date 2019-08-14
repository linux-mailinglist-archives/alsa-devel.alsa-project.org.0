Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA728CBE0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:22:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186031693;
	Wed, 14 Aug 2019 08:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186031693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763762;
	bh=dSlYAaWMQ8PQ0pqcR309GlUx50Iq+UiXOH948Fc1Zmo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFMvphz5muFXMxFSS287QD6FepK2MaugCamwkH+LiyIXtfEffQkc5uIE/sp1H2ZRd
	 6+ZS+5xJYNb52DOSKGP5jWOCf85gq6SUyhvlTsmlP5FSaZhrTrMDKeHBjAl4urI32F
	 F6GBR6IJUK0t/izpz2mEhXV2MW08RfLtUkkEiOgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ABC9F8076C;
	Wed, 14 Aug 2019 08:09:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E759CF806F0; Wed, 14 Aug 2019 08:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ADEDF806E7
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ADEDF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qk+jM+K0"
Received: by mail-lf1-x141.google.com with SMTP id 62so73580121lfa.8
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qPLudcRzbh9pt0l2M8FXktJHz701GH+KgTT8RYkVGIs=;
 b=qk+jM+K0vI/LKsh5ysFVuy2eVbnhZh8xo0AFbgGyCvu5Xc/NA4Hpl40Uwcfrp4Ohp2
 TxV8F3KzKhzeX25+H/nbGQk6DE0+v2VzuX20o/1bgVpSNxxsCpbxO3K12YDMOfy85xDa
 duhNak/9LjNvbT/2PBW01pJMACr4/YNmEX9eOTRV9oRiNU5uZYE2d3O4X7TxnDZfaZgf
 UeIH8aprHzhS9vmLr09ukcg2Ywj5qoUkQ9ej7/UKqkHmem4CM85wzd7XgBIQT3OE3DFH
 GiE37u6sRwPldWf9CA41lNlZao+Pryj3hMOjpm+EXdsZlMGJULIo8i6K9lLPwzoIU5A0
 ebVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPLudcRzbh9pt0l2M8FXktJHz701GH+KgTT8RYkVGIs=;
 b=mnEt0m7sW17aL9rJgdl8o+owHPa8Z9+1qIpZQcvWsIRYE5QUWYrnw6PNbn/Cm9Ol83
 6Vptd9gIFlWhisf2b/DukPh7VGDnJZrQE0XOSRPO9YruZNpyI9AKGTGkK8VLJilNSJny
 DvvdrZ20zUaBStoiymTlTF4pdH9HD/oCF7Fzt5TuafgjuKFejfjeE8QXqQ4hrKdxKuH4
 C/FeHOCjPkTuOYgpQE3+Yb+nSo3YCIob+e20rpjNuZY1KkjX9j1Y8DJ0cB/h6M9DL81e
 bAwSdXe756awvUuu/PAM4Aszjnpw3RSa3Ar5717GhNMh4AydGqNkfaD7GZJO5fqpaeDO
 6i2Q==
X-Gm-Message-State: APjAAAW7ZJizqiRzoT/GaHeXYpiiG6YZ4mJ05b3zkiHI10ytDt8V//yT
 VNw1oBw4iDXuR8zE3rv0CFqS3HIc
X-Google-Smtp-Source: APXvYqzJ0E9KwCK29s7CtES+3tatrdemY5NfMpbpcc5gvJ1CGx2srYIvgpPLkkGZa3nJq1u4h/lLPA==
X-Received: by 2002:a05:6512:4c8:: with SMTP id
 w8mr15647941lfq.98.1565762960478; 
 Tue, 13 Aug 2019 23:09:20 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:19 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:54 +0200
Message-Id: <20190814060854.26345-16-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 15/15] ASoC: sun4i-i2s: Adjust regmap
	settings
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

Bypass the regmap cache when flushing the i2s FIFOs and modify the tables
to reflect this.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d3c8789f70bb..ecfc1ed79379 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -876,9 +876,11 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static void sun4i_i2s_start_capture(struct sun4i_i2s *i2s)
 {
 	/* Flush RX FIFO */
+	regcache_cache_bypass(i2s->regmap, true);
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
 			   SUN4I_I2S_FIFO_CTRL_FLUSH_RX,
 			   SUN4I_I2S_FIFO_CTRL_FLUSH_RX);
+	regcache_cache_bypass(i2s->regmap, false);
 
 	/* Clear RX counter */
 	regmap_write(i2s->regmap, SUN4I_I2S_RX_CNT_REG, 0);
@@ -897,9 +899,11 @@ static void sun4i_i2s_start_capture(struct sun4i_i2s *i2s)
 static void sun4i_i2s_start_playback(struct sun4i_i2s *i2s)
 {
 	/* Flush TX FIFO */
+	regcache_cache_bypass(i2s->regmap, true);
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
 			   SUN4I_I2S_FIFO_CTRL_FLUSH_TX,
 			   SUN4I_I2S_FIFO_CTRL_FLUSH_TX);
+	regcache_cache_bypass(i2s->regmap, false);
 
 	/* Clear TX counter */
 	regmap_write(i2s->regmap, SUN4I_I2S_TX_CNT_REG, 0);
@@ -1053,13 +1057,7 @@ static const struct snd_soc_component_driver sun4i_i2s_component = {
 
 static bool sun4i_i2s_rd_reg(struct device *dev, unsigned int reg)
 {
-	switch (reg) {
-	case SUN4I_I2S_FIFO_TX_REG:
-		return false;
-
-	default:
-		return true;
-	}
+	return true;
 }
 
 static bool sun4i_i2s_wr_reg(struct device *dev, unsigned int reg)
@@ -1078,6 +1076,8 @@ static bool sun4i_i2s_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case SUN4I_I2S_FIFO_RX_REG:
+	case SUN4I_I2S_FIFO_TX_REG:
+	case SUN4I_I2S_FIFO_STA_REG:
 	case SUN4I_I2S_INT_STA_REG:
 	case SUN4I_I2S_RX_CNT_REG:
 	case SUN4I_I2S_TX_CNT_REG:
@@ -1088,23 +1088,12 @@ static bool sun4i_i2s_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
-{
-	switch (reg) {
-	case SUN8I_I2S_FIFO_TX_REG:
-		return false;
-
-	default:
-		return true;
-	}
-}
-
 static bool sun8i_i2s_volatile_reg(struct device *dev, unsigned int reg)
 {
 	if (reg == SUN8I_I2S_INT_STA_REG)
 		return true;
 	if (reg == SUN8I_I2S_FIFO_TX_REG)
-		return false;
+		return true;
 
 	return sun4i_i2s_volatile_reg(dev, reg);
 }
@@ -1175,7 +1164,7 @@ static const struct regmap_config sun8i_i2s_regmap_config = {
 	.reg_defaults	= sun8i_i2s_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(sun8i_i2s_reg_defaults),
 	.writeable_reg	= sun4i_i2s_wr_reg,
-	.readable_reg	= sun8i_i2s_rd_reg,
+	.readable_reg	= sun4i_i2s_rd_reg,
 	.volatile_reg	= sun8i_i2s_volatile_reg,
 };
 
@@ -1188,7 +1177,7 @@ static const struct regmap_config sun50i_i2s_regmap_config = {
 	.reg_defaults	= sun50i_i2s_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(sun50i_i2s_reg_defaults),
 	.writeable_reg	= sun4i_i2s_wr_reg,
-	.readable_reg	= sun8i_i2s_rd_reg,
+	.readable_reg	= sun4i_i2s_rd_reg,
 	.volatile_reg	= sun8i_i2s_volatile_reg,
 };
 
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

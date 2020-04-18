Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7901AEF7B
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:44:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 914031665;
	Sat, 18 Apr 2020 16:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 914031665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587221061;
	bh=vYOunaz5GTdJ62mzdR+/qlLbAemD9RsmxpdmYrA5NUw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SUvQPS2QpGkWKDVODvzzLDwP1wvoiIr+bJvqKp80p9LpqjpoCI0sipoSGXBbaJlaT
	 Yfwp8/bgHzoi2NeGStTo5leX9be4C4KgWfaXbF/koAhbnEE2XQx40JsFxuP6fCuyYz
	 ZJv8tXWoF74/D6MgbbBweZB2LmnQ0r/SOFqOZ5/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE509F802C2;
	Sat, 18 Apr 2020 16:39:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D66CCF8029B; Sat, 18 Apr 2020 16:39:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3453CF8028B
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3453CF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cI6UDO1M"
Received: by mail-wr1-x442.google.com with SMTP id f13so6327502wrm.13
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bzZ2ejZgMrp9qSzKScPDLHvA9whDt7t6MNt6a7IlToQ=;
 b=cI6UDO1M/fR/roDDI6qMsouMe6JbHJBYnQs9EoCtQDDtv2znvA5BM9YvN97bqGCOP/
 Y4qXtb/kEoO5JSZJmt/CeoEJRPyM7/plMDN+SAab1VvhHKt7aDU75dzTGArjGxWQoQw2
 h6wTkpR/DnBg0fEMf8ZE8d5IcBr2D/IYnwAXErkysm+xtUxXBF+w+43V+Er4mZY078Wa
 v2C1ibP0l6t0elTHHbm/CKWI6sSfA5THhWYHS/y8SVyUgXioXuxESYl/ZdQ8hNLiB7w5
 xRepYU7gGGDsFM1rmQi3vx7PZjgmCnjNI/fYgfkdMsyQbpEf+8hWMDIbR494Sdx1+cZC
 fqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bzZ2ejZgMrp9qSzKScPDLHvA9whDt7t6MNt6a7IlToQ=;
 b=aPREMK846HFbzdbkvlK1pSaVhZ6Qu8NLZUFBeBZXOultEyvOH/hat2zMZgwVItntge
 RE6eiVSy3CbwNoU/aHz+9KF+AOlxUZVpUbuOGf2h52XNyO4XYF1OAHyfzoZ4fuxpTyEj
 ObBMGf6pW1J1IF8eEPaXD/LeOBNA2LX0zMp6VdCeH9UfC9UKFVmj38WtRD21ghhdd89o
 /voBDd4hHttsOHRyVFu5nYFW7XVWjONEuaHjwKG+bf5Cq/s3L4K1EIPYKF0FavuH4MfL
 XVrXpBgaLkI7h12YoIQEPZVBKzpiWw7JpO34Eg2HinvDPQGTm4/lQP66xGsLfOzpQLlL
 SW7w==
X-Gm-Message-State: AGi0PuY+axMYXwDTZmbub23xUVCifelJb8IdhJKqrcDzzArVVLqxNuBw
 Kv5vtQmwhYoSZsSrT5U+PfA=
X-Google-Smtp-Source: APiQypKZgy8wJ443/iUUZWQa1cF/leTyHVsQdI4htce2qt+C0SxlkbSanLppFf4VsKV6sv4sH5ZljA==
X-Received: by 2002:adf:aac5:: with SMTP id i5mr8611561wrc.285.1587220773700; 
 Sat, 18 Apr 2020 07:39:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:4e7:1fdd:b7c2:b3ab])
 by smtp.gmail.com with ESMTPSA id
 s9sm25375322wrg.27.2020.04.18.07.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 07:39:32 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 6/7] ASoC: sun4i-i2s: Adjust regmap settings
Date: Sat, 18 Apr 2020 16:39:22 +0200
Message-Id: <20200418143923.19608-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418143923.19608-1-peron.clem@gmail.com>
References: <20200418143923.19608-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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

From: Marcus Cooper <codekipper@gmail.com>

Bypass the regmap cache when flushing the i2s FIFOs and modify the tables
to reflect this.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index a0090b5ced83..2e1b65bf4bd3 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -915,7 +915,7 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static void sun4i_i2s_start_capture(struct sun4i_i2s *i2s)
 {
 	/* Flush RX FIFO */
-	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
+	regmap_write_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
 			   SUN4I_I2S_FIFO_CTRL_FLUSH_RX,
 			   SUN4I_I2S_FIFO_CTRL_FLUSH_RX);
 
@@ -936,7 +936,7 @@ static void sun4i_i2s_start_capture(struct sun4i_i2s *i2s)
 static void sun4i_i2s_start_playback(struct sun4i_i2s *i2s)
 {
 	/* Flush TX FIFO */
-	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
+	regmap_write_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
 			   SUN4I_I2S_FIFO_CTRL_FLUSH_TX,
 			   SUN4I_I2S_FIFO_CTRL_FLUSH_TX);
 
@@ -1090,13 +1090,7 @@ static const struct snd_soc_component_driver sun4i_i2s_component = {
 
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
@@ -1115,6 +1109,8 @@ static bool sun4i_i2s_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case SUN4I_I2S_FIFO_RX_REG:
+	case SUN4I_I2S_FIFO_TX_REG:
+	case SUN4I_I2S_FIFO_STA_REG:
 	case SUN4I_I2S_INT_STA_REG:
 	case SUN4I_I2S_RX_CNT_REG:
 	case SUN4I_I2S_TX_CNT_REG:
@@ -1125,23 +1121,12 @@ static bool sun4i_i2s_volatile_reg(struct device *dev, unsigned int reg)
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
@@ -1212,7 +1197,7 @@ static const struct regmap_config sun8i_i2s_regmap_config = {
 	.reg_defaults	= sun8i_i2s_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(sun8i_i2s_reg_defaults),
 	.writeable_reg	= sun4i_i2s_wr_reg,
-	.readable_reg	= sun8i_i2s_rd_reg,
+	.readable_reg	= sun4i_i2s_rd_reg,
 	.volatile_reg	= sun8i_i2s_volatile_reg,
 };
 
@@ -1225,7 +1210,7 @@ static const struct regmap_config sun50i_i2s_regmap_config = {
 	.reg_defaults	= sun50i_i2s_reg_defaults,
 	.num_reg_defaults	= ARRAY_SIZE(sun50i_i2s_reg_defaults),
 	.writeable_reg	= sun4i_i2s_wr_reg,
-	.readable_reg	= sun8i_i2s_rd_reg,
+	.readable_reg	= sun4i_i2s_rd_reg,
 	.volatile_reg	= sun8i_i2s_volatile_reg,
 };
 
-- 
2.20.1


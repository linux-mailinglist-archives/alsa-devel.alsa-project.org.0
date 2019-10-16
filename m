Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38006D891B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 09:13:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C432D1673;
	Wed, 16 Oct 2019 09:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C432D1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571209981;
	bh=np78wAlHMlXJBeWOjgvTctZtubkzsRULPA0cN8L0B/0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lircxOdrjDEUxL5TKm0IRiwqJBxHm6TSmRBBdvKclgone9L1ysCTprMi9yWiVj8Y7
	 GofWQ44eSM6zViRGmvr/NTFEyvmw/0y0xXiwR3H/x1SHv7VgVgyTVQLOthSznMN6H5
	 Bppck7NhWuAJDswaY/ImA/bSSeATrPWFhe9Tt+4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CFAEF80649;
	Wed, 16 Oct 2019 09:08:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D38B8F80369; Wed, 16 Oct 2019 09:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32099F80276
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 09:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32099F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P7jKcqJW"
Received: by mail-lf1-x141.google.com with SMTP id u28so16510498lfc.5
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 00:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FfnwO8vvijCwZxuUL06QD5Tx1fxFqAFTG2kXsJEWJMY=;
 b=P7jKcqJWpHrW1gaub0fSy2vbAtI/feqgoOpswUlXO9Je+VTo59n3zc/RFhfKNPOHYo
 X5RCZt1cS1NVGjTKtTS5zTsXPdX2MFhM5jti2LrRKX0HtZjSy6X89TEvTCgHOH6dZApV
 JhSyjrS8Jv3ik/H7deMyV9fRxuNoNZdx8yPbx2I5BvIs5Y1NXhK115S8cbJvzlW7wgwr
 m7YhX1l8TsMUm9UfJOnlonv/WJ92jOmqjnwJc2+N757v9eYaQ0dXoLImO+zfrilQHiuR
 3zAm4rCjVZcgWEW0V4HPRLXhOKetlFT2zdktVefFU2P696B8kikobkWenLpt4C8fmDap
 BJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FfnwO8vvijCwZxuUL06QD5Tx1fxFqAFTG2kXsJEWJMY=;
 b=nXKQiY5vMGsOsdjdKfZ2zc5j78ifAlyJagVppQ5cNeWdQbbtZeo+OOXFAzYdsJTpaw
 2cWHVd7SW47lSoeSOn9jiP95nGn6BRnRRfc4mhkDk0a74HDoiLHDHoDPBe/QJLgpenIS
 R80DhoCmoBrW6l8QghoHcdqEGwk+6ZVb2MhSWtCioJt2NunyfuX0fuTRTjU5n2ylgdO2
 k6R2Tb5ckkXQ5TjjmeI8q2fEi/rkGGsT3Deu1TezmkqSGzcrnbJhwfwREvswbRY7A9it
 bPcm0FZVsPVtqG1q1mtz+b+BIwTGTHOrBTubldn+waN+eesMhSHK2viCZ4zVqqgYcneZ
 io1w==
X-Gm-Message-State: APjAAAWxfl7PVo36cgT8BircdxD8MabjZkzce3UROS44I1AwP1VZm0Ec
 0lwAI/S0KiFG5dCoP5/tx2k=
X-Google-Smtp-Source: APXvYqz5kC5mHtEuZCkmB220wctQYP7NsY41HDsa9pdKX2nuuRVHlx3tF9FC50FqXmDOK4Pu2/vSxg==
X-Received: by 2002:a05:6512:403:: with SMTP id
 u3mr11797775lfk.135.1571209669188; 
 Wed, 16 Oct 2019 00:07:49 -0700 (PDT)
Received: from localhost.localdomain (c213-102-65-51.bredband.comhem.se.
 [213.102.65.51])
 by smtp.gmail.com with ESMTPSA id j191sm1361493lfj.49.2019.10.16.00.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 00:07:48 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Wed, 16 Oct 2019 09:07:38 +0200
Message-Id: <20191016070740.121435-6-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016070740.121435-1-codekipper@gmail.com>
References: <20191016070740.121435-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 5/7] ASoC: sun4i-i2s: Add functions for RX
	and TX channel mapping
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

As we will eventually add multi-channel audio support to the i2s
then create function calls as opposed to regmap fields to add
support for different devices.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 45 +++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 19988d61a085..63ae9da180f2 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -165,6 +165,8 @@ struct sun4i_i2s_quirks {
 	void	(*set_rxchanen)(const struct sun4i_i2s *, int);
 	void	(*set_txchansel)(const struct sun4i_i2s *, int, int);
 	void	(*set_rxchansel)(const struct sun4i_i2s *, int);
+	void	(*set_txchanmap)(const struct sun4i_i2s *, int, int);
+	void	(*set_rxchanmap)(const struct sun4i_i2s *, int);
 };
 
 struct sun4i_i2s {
@@ -405,8 +407,8 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	unsigned int channels = params_channels(params);
 
 	/* Map the channels for playback and capture */
-	regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210);
-	regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210);
+	i2s->variant->set_txchanmap(i2s, 0, 0x76543210);
+	i2s->variant->set_rxchanmap(i2s, 0x00003210);
 
 	/* Configure the channels */
 	i2s->variant->set_txchansel(i2s, 0, channels);
@@ -426,8 +428,8 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 		slots = i2s->slots;
 
 	/* Map the channels for playback and capture */
-	regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
-	regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210);
+	i2s->variant->set_txchanmap(i2s, 0, 0x76543210);
+	i2s->variant->set_rxchanmap(i2s, 0x00003210);
 
 	/* Configure the channels */
 	i2s->variant->set_txchansel(i2s, 0, channels);
@@ -534,6 +536,31 @@ static void sun8i_i2s_set_rxchansel(const struct sun4i_i2s *i2s, int channel)
 			   SUN8I_I2S_TX_CHAN_SEL(channel));
 }
 
+static void sun4i_i2s_set_txchanmap(const struct sun4i_i2s *i2s, int output,
+				    int channel)
+{
+	if (output == 0)
+		regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, channel);
+}
+
+static void sun8i_i2s_set_txchanmap(const struct sun4i_i2s *i2s, int output,
+				    int channel)
+{
+	if (output >= 0 && output < 4)
+		regmap_write(i2s->regmap,
+			     SUN8I_I2S_TX_CHAN_MAP_REG + (output * 4), channel);
+}
+
+static void sun4i_i2s_set_rxchanmap(const struct sun4i_i2s *i2s, int channel)
+{
+	regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, channel);
+}
+
+static void sun8i_i2s_set_rxchanmap(const struct sun4i_i2s *i2s, int channel)
+{
+	regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, channel);
+}
+
 static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
@@ -1154,6 +1181,8 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
 	.set_fmt		= sun4i_i2s_set_soc_fmt,
 	.set_txchansel		= sun4i_i2s_set_txchansel,
 	.set_rxchansel		= sun4i_i2s_set_rxchansel,
+	.set_txchanmap		= sun4i_i2s_set_txchanmap,
+	.set_rxchanmap		= sun4i_i2s_set_rxchanmap,
 };
 
 static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
@@ -1174,6 +1203,8 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
 	.set_fmt		= sun4i_i2s_set_soc_fmt,
 	.set_txchansel		= sun4i_i2s_set_txchansel,
 	.set_rxchansel		= sun4i_i2s_set_rxchansel,
+	.set_txchanmap		= sun4i_i2s_set_txchanmap,
+	.set_rxchanmap		= sun4i_i2s_set_rxchanmap,
 };
 
 /*
@@ -1199,6 +1230,8 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.set_fmt		= sun4i_i2s_set_soc_fmt,
 	.set_txchansel		= sun4i_i2s_set_txchansel,
 	.set_rxchansel		= sun4i_i2s_set_rxchansel,
+	.set_txchanmap		= sun4i_i2s_set_txchanmap,
+	.set_rxchanmap		= sun4i_i2s_set_rxchanmap,
 };
 
 static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
@@ -1223,6 +1256,8 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.set_rxchanen		= sun8i_i2s_set_rxchanen,
 	.set_txchansel		= sun8i_i2s_set_txchansel,
 	.set_rxchansel		= sun8i_i2s_set_rxchansel,
+	.set_txchanmap		= sun8i_i2s_set_txchanmap,
+	.set_rxchanmap		= sun8i_i2s_set_rxchanmap,
 };
 
 static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
@@ -1243,6 +1278,8 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.set_fmt		= sun4i_i2s_set_soc_fmt,
 	.set_txchansel		= sun4i_i2s_set_txchansel,
 	.set_rxchansel		= sun4i_i2s_set_rxchansel,
+	.set_txchanmap		= sun4i_i2s_set_txchanmap,
+	.set_rxchanmap		= sun4i_i2s_set_rxchanmap,
 };
 
 static int sun4i_i2s_init_regmap_fields(struct device *dev,
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

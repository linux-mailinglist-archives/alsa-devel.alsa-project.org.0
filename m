Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95266D8911
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 09:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1956782B;
	Wed, 16 Oct 2019 09:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1956782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571209885;
	bh=XOv4jxBbS2tbRtsnmIJ//GimBvDeVRjLULdIu/VqdYM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iXVXzfLGaOpEvALPz+q5WP1aQI5dLgzD1fdgfbyVJKW9T65kXg3T9McIA98kq24Il
	 OoD77LIuALJKR5u75w8tkzlqou5iXr8Kag5Hc2Vjylrz4HlyMds3mL4seOfw0gLXEw
	 6a0SVZbLFIa+Fms5+4jsNB7fjVGPvaUusFmPUEm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15316F80610;
	Wed, 16 Oct 2019 09:08:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2250F80369; Wed, 16 Oct 2019 09:07:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D63CF80323
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 09:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D63CF80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TuNdLmYa"
Received: by mail-lj1-x244.google.com with SMTP id m13so22764900ljj.11
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 00:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHYtIhe59LgkE0iURxc0+3vHk4byPJGL3D4yPD8SiX4=;
 b=TuNdLmYaPeWTQwLP1dnD3cA7caOQ67xFZrQFsZOLSt6chsyvzGxpyctNGBFc3HHnPt
 FUlUM20/hHnzwyJw1bMzCmRrrK8Sjv5iQIIlyPwssziKMiasOEltnGhPOkpZlMgDhjFa
 XunsJX+zwo9+tJKqQE9mTQ+EqoJzlZkoXY+JX+5zGhdExn4lDX7WykCX1S2baxF2F75u
 gxXf1d1e1ZbeYH1kShWAxlUgGx2Dk+RlQQIbhogCr6KuA3rUMcpTfbmHLQAt4Q2xoXKG
 vNSL9X1pRU4/tWNL1mc0hgXSGvVlAPXk0zYYju5gQTVrDWc1Ks6ehfw+TRqI+hN4S0iW
 p4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHYtIhe59LgkE0iURxc0+3vHk4byPJGL3D4yPD8SiX4=;
 b=F8/jE2d51Dpd6Kmlg+NgBURNgJqDjoQ5zaS8h9cQcEFncXxXtLuvuyM3WsVRBqV+jX
 u/FTQyB6o0/03Vq1FlIsLgSzHkNFIEcrMVJ2mC2rINWLwD5JD7TzmvWlT7SFxPLDUQYb
 bbzU5/rCR7hSIwZBIaE1aAzW7zycXF3IPh4DUbaiUL2al+z0paPCcRGpQb/JPO6k1ZV5
 0e2cXL1Cs9N/xGO+yPcbY0at6tfuLr3Vz6MAEYm88b+egdzD2INt7Q44pSp+mp5A9Fzj
 mrVBgbQ5BT42ThbHF/btxR8MC7mELOqpUfeO05srC5FpMY7KfUmd7S6wtHz3i4Y/3Zwx
 yBsQ==
X-Gm-Message-State: APjAAAVnscWHNMpiCPDksiGsexMOtjknIo4YPe6uKWPq7HwQ5/6Snehr
 JilAdFnaMHa6Hzelyn0jw1w=
X-Google-Smtp-Source: APXvYqwfZtptI3V5Zo3A4sicYjMnE/4Cg4n106UWQ8VH2oVQUkqbEnH1ctIdHJb69OGR6hPK07D5yA==
X-Received: by 2002:a2e:8417:: with SMTP id z23mr24777343ljg.46.1571209666572; 
 Wed, 16 Oct 2019 00:07:46 -0700 (PDT)
Received: from localhost.localdomain (c213-102-65-51.bredband.comhem.se.
 [213.102.65.51])
 by smtp.gmail.com with ESMTPSA id j191sm1361493lfj.49.2019.10.16.00.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 00:07:45 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Wed, 16 Oct 2019 09:07:36 +0200
Message-Id: <20191016070740.121435-4-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016070740.121435-1-codekipper@gmail.com>
References: <20191016070740.121435-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 3/7] ASoC: sun4i-i2s: Add functions for RX
	and TX channel enables
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

Newer SoCs like the H6 have the channel enable bits in a different
position to what is on the H3. As we will eventually add multi-
channel support then create function calls as opposed to regmap
fields to add support for different devices.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 875567881f30..8d28a386872f 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -159,6 +159,8 @@ struct sun4i_i2s_quirks {
 	int	(*set_fmt)(struct sun4i_i2s *, unsigned int);
 	void	(*set_txchanoffset)(const struct sun4i_i2s *, int);
 	void	(*set_rxchanoffset)(const struct sun4i_i2s *);
+	void	(*set_txchanen)(const struct sun4i_i2s *, int, int);
+	void	(*set_rxchanen)(const struct sun4i_i2s *, int);
 };
 
 struct sun4i_i2s {
@@ -462,9 +464,7 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
 
-	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
-			   SUN8I_I2S_TX_CHAN_EN_MASK,
-			   SUN8I_I2S_TX_CHAN_EN(channels));
+	i2s->variant->set_txchanen(i2s, 0, channels);
 
 	return 0;
 }
@@ -486,6 +486,24 @@ static void sun8i_i2s_set_rxchanoffset(const struct sun4i_i2s *i2s)
 			   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
 }
 
+static void sun8i_i2s_set_txchanen(const struct sun4i_i2s *i2s, int output,
+				   int channel)
+{
+	if (output >= 0 && output < 4)
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN8I_I2S_TX_CHAN_EN_MASK,
+				   SUN8I_I2S_TX_CHAN_EN(channel));
+}
+
+static void sun8i_i2s_set_rxchanen(const struct sun4i_i2s *i2s, int channel)
+{
+	regmap_update_bits(i2s->regmap,
+			   SUN8I_I2S_RX_CHAN_SEL_REG,
+			   SUN8I_I2S_TX_CHAN_EN_MASK,
+			   SUN8I_I2S_TX_CHAN_EN(channel));
+}
+
 static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
@@ -510,6 +528,12 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	if (i2s->variant->set_txchanen)
+		i2s->variant->set_txchanen(i2s, 0, channels);
+
+	if (i2s->variant->set_rxchanen)
+		i2s->variant->set_rxchanen(i2s, channels);
+
 	switch (params_physical_width(params)) {
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -1155,6 +1179,8 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.set_fmt		= sun8i_i2s_set_soc_fmt,
 	.set_txchanoffset	= sun8i_i2s_set_txchanoffset,
 	.set_rxchanoffset	= sun8i_i2s_set_rxchanoffset,
+	.set_txchanen		= sun8i_i2s_set_txchanen,
+	.set_rxchanen		= sun8i_i2s_set_rxchanen,
 };
 
 static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

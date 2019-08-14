Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E048CBC9
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:15:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D3B1678;
	Wed, 14 Aug 2019 08:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D3B1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763359;
	bh=XIT0W3ROKxW/chYxdUiyzCu/EOMeZTqf2YO4wPm2rbU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OQ22VKwq0e7cX1Uzn1BbnzQ/w6BBaDSE9eXIVcnkyP9895tWOm22BbdJsB555mgfa
	 pgOUpJ/YtIr4JE/CbtjzZxIei83E+aW2PZmjR/qtqhekNzzGM0SJVC/KhNYWUZHw9O
	 tNHv9AgUfdIw5u3TodOzmLLE7fqRoMXvnl4qWMZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 159DCF80672;
	Wed, 14 Aug 2019 08:09:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B0DBF8063B; Wed, 14 Aug 2019 08:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E47C1F80612
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E47C1F80612
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A+zuhJDG"
Received: by mail-lj1-x242.google.com with SMTP id z17so15274423ljz.0
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=05luO0el08+ksQzcW4RTEqUT7Ds3M01UtKJnSKZS1CI=;
 b=A+zuhJDGf+WT+Ot0CNMAkUD7+SOWysTa2Ly11PvI1hlDTVlD1HpP8d3h6wTV9G3bE8
 FLhZBNYQxeXa1j0KgS0UXPKTFBH53afq422IOj6cub+vwQBiz5FsfczsQXawQ0r4mOyn
 Da4X1NxE5bspTPUucZ5xMxUwcvvKQFi6BtGW5mDtLV91qNyZz/4yTbcdy4MpKHCXfLdZ
 Q3qldDXLiie62cym73HYA0wwyWg93sUxLaNcGumZgKqxkdj0KkIaG+uA5jgUnICzLcnV
 8GLxI+v1pSxXIGQz9ztRhoKsIOYw91FZYoXHR6F9GaiGvRAgh3U/N7VsRqti+cS904gq
 Htkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05luO0el08+ksQzcW4RTEqUT7Ds3M01UtKJnSKZS1CI=;
 b=MYCar+jtFSAeBLnWODZYhMlNlyi/82g7shVlN1AgaeJGYTbRFpA+JpFgZNuvyMneMi
 jPjKWzbjcWWjHMZTxm0qfnnPq8ALHjIvO8BP62vT0uofxq4TLm+mxdT1j1p3VszMtAqc
 ge555ztHtzruE2pr5RV1hXMBokPbRkJoU7WT8bWCD2gCkoSehSvxOMrTRVQ8rdsh7BIt
 nXCyA9Hi4FuIqgeOAMHE9e78AS5Ppdmaa9ZVpdsbl80n/8utsVMW5HZFBqNkrh0pfYbX
 eH0OB72/8Qhlfnx0zNKHwblSYQHN6L2wwkts905okBhwkekc/IXq1NY//osPR8ruH5yL
 6e0A==
X-Gm-Message-State: APjAAAW111ppRAqXUNmto83Eq16CT1g7tU9BIC9aezNkhDSD2qu0wJIS
 fFffdpaYPWAkrtcgIYPuSJE=
X-Google-Smtp-Source: APXvYqwa2QE/MzggVT+SxSReZtwaVjTUt6MgdTVwN4bjTZtThH/Dm274tKDTRtDX5F1nP2l0VTh3jQ==
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr24254402lji.64.1565762947367; 
 Tue, 13 Aug 2019 23:09:07 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:06 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:44 +0200
Message-Id: <20190814060854.26345-6-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 05/15] ASoC: sun4i-i2s: Add functions for RX
	and TX channel offsets
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

Newer SoCs like the H6 have the channel offset bits in a different
position to what is on the H3. As we will eventually add multi-
channel support then create function calls as opposed to regmap
fields to add support for different devices.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 3553c17318b0..4a748747ccd7 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -112,7 +112,7 @@
 #define SUN8I_I2S_TX_CHAN_MAP_REG	0x44
 #define SUN8I_I2S_TX_CHAN_SEL_REG	0x34
 #define SUN8I_I2S_TX_CHAN_OFFSET_MASK		GENMASK(13, 12)
-#define SUN8I_I2S_TX_CHAN_OFFSET(offset)	(offset << 12)
+#define SUN8I_I2S_TX_CHAN_OFFSET(offset)	((offset) << 12)
 #define SUN8I_I2S_TX_CHAN_EN_MASK		GENMASK(11, 4)
 #define SUN8I_I2S_TX_CHAN_EN(num_chan)		(((1 << num_chan) - 1) << 4)
 
@@ -170,6 +170,8 @@ struct sun4i_i2s_quirks {
 	s8	(*get_sr)(const struct sun4i_i2s *, int);
 	s8	(*get_wss)(const struct sun4i_i2s *, int);
 	int	(*set_format)(struct sun4i_i2s *, unsigned int);
+	void	(*set_txchanoffset)(const struct sun4i_i2s *, int);
+	void	(*set_rxchanoffset)(const struct sun4i_i2s *);
 };
 
 struct sun4i_i2s {
@@ -424,6 +426,24 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
 	return (width - 8) / 4 + 1;
 }
 
+static void sun8i_i2s_set_txchanoffset(const struct sun4i_i2s *i2s, int output)
+{
+	if (output >= 0 && output < 4) {
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
+				   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
+	}
+}
+
+static void sun8i_i2s_set_rxchanoffset(const struct sun4i_i2s *i2s)
+{
+	regmap_update_bits(i2s->regmap,
+			   SUN8I_I2S_RX_CHAN_SEL_REG,
+			   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
+			   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
+}
+
 static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
@@ -1076,6 +1096,8 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.get_sr			= sun8i_i2s_get_sr_wss,
 	.get_wss		= sun8i_i2s_get_sr_wss,
 	.set_format		= sun8i_i2s_set_format,
+	.set_txchanoffset	= sun8i_i2s_set_txchanoffset,
+	.set_rxchanoffset	= sun8i_i2s_set_rxchanoffset,
 };
 
 static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

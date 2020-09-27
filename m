Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D939027A2C3
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:32:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E59B1AA4;
	Sun, 27 Sep 2020 21:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E59B1AA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235129;
	bh=r6ixIKqEBUo6bDIn666BSbftaJK5hFJcf8ahEaUG60g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u4Gy9Z6UYfnAh2tK5MtVGp40JqPATkibKQHwJyPwQ/xsEW4JK7WY+prBZw7q57Vbq
	 Xo5AyfCHShLu4LllVv0ANoG+UFGD0tgZiPBZ9ybxP3llQpWQOyTsLA7AuSq4MozscH
	 3Uj8GnnjpP0u51JjdRsoK/+ndg73EqGD2635V3Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84969F802E8;
	Sun, 27 Sep 2020 21:29:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F95CF802D2; Sun, 27 Sep 2020 21:29:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8531F801F5
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8531F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="caGfsQcu"
Received: by mail-wm1-x341.google.com with SMTP id l15so3034585wmh.1
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4lePnbJsWezK8RnHwYEENqDk89LB4Q2STBonc48dD/w=;
 b=caGfsQcujd7FlPqbJt4KLcdRSp2tfHMQOyRlbULHBb4IECIHT6LRTzTAZjWR3eqO+H
 EjdQc4CKML7/fvpql72/dMfSFEZ459//bmwVseDuwcXQWE6Yd1c9mJNY1vL01X8BSQXf
 y+mk0DTRKV07F/aCevv0lc9vyk9Tt7iH9egmvYKOyAfhRzgxM2oENK+51mhwUrjvD3by
 hIaoPc/ClE+lpVVJRgNm0YVaSyq8GGQ3Y0h2Qpu5Te4EcURwfTct+ICtG60BSShMSqCx
 rg2BIzO3Z4UFFQhFaZCzZV9S4HhVniIzow84IVYX8cqyMxLqnuY2pm8unIC/bidfeRJa
 9bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4lePnbJsWezK8RnHwYEENqDk89LB4Q2STBonc48dD/w=;
 b=teGq/9XU+facVGTxwopucBPWn9O4DFwXPEbVWeIZXUHVxmsRPpAtR15Z+VwQp7VUQI
 cgio3awZhStR/tYmfA3VtLGSRAPgD593XClIqqt6xVhDLbTzfzWd5yf9+a0HUoAB/hKE
 0COI0EIYpUSBN7LhoS3jW21hwEejqr0f5mA/fZ3yBpsCsUgybTzr1KPsYQ8xp1r9NLVo
 xLAn4GTooE+kioE9Jm3/PuZRI+vPOhOADHVHDt9Kn7Yy/g6WvssqlHMgljfRmRmRo1Nj
 aM+SJ7y+FVBYaIsYUrH8eV/mIbNrnKmuHdQXcCpG70XeXjOz50MuAuexU5c1PHgWU428
 xoUQ==
X-Gm-Message-State: AOAM530nAvK0ltGrMKHRjgkOwTjrhJmsa5JFfloermTEZulgFkbEwWqB
 tniLV8O3lNKyJhxH+Mpl/KA=
X-Google-Smtp-Source: ABdhPJxyWdxzWOe5nyLzsGgdejVxb9LmqmzUTe9sWMAvfaL/PoX5b/HoKKR2IYXVdjuKPCWM8HIptA==
X-Received: by 2002:a1c:9ad0:: with SMTP id c199mr8101749wme.54.1601234959961; 
 Sun, 27 Sep 2020 12:29:19 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:19 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 02/20] ASoC: sun4i-i2s: Change set_chan_cfg() params
Date: Sun, 27 Sep 2020 21:28:54 +0200
Message-Id: <20200927192912.46323-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

As slots and slot_width can be overwritter in case set_tdm() is
called. Avoid to have this logic in set_chan_cfg().

Instead pass the required values as params to set_chan_cfg().

This will also avoid a bug when we will enable 20/24bits support,
i2s->slot_width is not actually used in the lrck_period computation.

Suggested-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 2baf6c276280..0633b9fba3d7 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
 	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
 	s8	(*get_sr)(const struct sun4i_i2s *, int);
 	s8	(*get_wss)(const struct sun4i_i2s *, int);
-	int	(*set_chan_cfg)(const struct sun4i_i2s *,
-				const struct snd_pcm_hw_params *);
+	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
+				unsigned int channels,	unsigned int slots,
+				unsigned int slot_width);
 	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
 };
 
@@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
 }
 
 static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
-				  const struct snd_pcm_hw_params *params)
+				  unsigned int channels, unsigned int slots,
+				  unsigned int slot_width)
 {
-	unsigned int channels = params_channels(params);
-
 	/* Map the channels for playback and capture */
 	regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210);
 	regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210);
@@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 }
 
 static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
-				  const struct snd_pcm_hw_params *params)
+				  unsigned int channels, unsigned int slots,
+				  unsigned int slot_width)
 {
-	unsigned int channels = params_channels(params);
-	unsigned int slots = channels;
 	unsigned int lrck_period;
 
-	if (i2s->slots)
-		slots = i2s->slots;
-
 	/* Map the channels for playback and capture */
 	regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
 	regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210);
@@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	case SND_SOC_DAIFMT_DSP_B:
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_RIGHT_J:
-		lrck_period = params_physical_width(params) * slots;
+		lrck_period = slot_width * slots;
 		break;
 
 	case SND_SOC_DAIFMT_I2S:
-		lrck_period = params_physical_width(params);
+		lrck_period = slot_width;
 		break;
 
 	default:
@@ -490,15 +486,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 }
 
 static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
-				      const struct snd_pcm_hw_params *params)
+				      unsigned int channels, unsigned int slots,
+				      unsigned int slot_width)
 {
-	unsigned int channels = params_channels(params);
-	unsigned int slots = channels;
 	unsigned int lrck_period;
 
-	if (i2s->slots)
-		slots = i2s->slots;
-
 	/* Map the channels for playback and capture */
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210);
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);
@@ -523,11 +515,11 @@ static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	case SND_SOC_DAIFMT_DSP_B:
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_RIGHT_J:
-		lrck_period = params_physical_width(params) * slots;
+		lrck_period = slot_width * slots;
 		break;
 
 	case SND_SOC_DAIFMT_I2S:
-		lrck_period = params_physical_width(params);
+		lrck_period = slot_width;
 		break;
 
 	default:
@@ -563,7 +555,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2s->slot_width)
 		slot_width = i2s->slot_width;
 
-	ret = i2s->variant->set_chan_cfg(i2s, params);
+	ret = i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
 	if (ret < 0) {
 		dev_err(dai->dev, "Invalid channel configuration\n");
 		return ret;
-- 
2.25.1


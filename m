Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE20929C74A
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:35:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 441DB16BD;
	Tue, 27 Oct 2020 19:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 441DB16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823714;
	bh=OjaANNkL37VQb2Bt/YTBcMfjEpLjvwltZ3tSbx3Hz04=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKHjcItplzLW8+6k71Q/R2xx9EQMLChzSRtJqBH9KMLBVGUUoDvKsKw91DvLzSUiK
	 q9V54+2LHPir2rvJJPjT6PUFTNqVbR037tOb8tsKGMX7epltoG/iuGzHGQObdKiwq3
	 v9S7lOLsBwGn+JPYAd1+N3Vwr6uqzdXEtl1BkHOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5331F804E6;
	Tue, 27 Oct 2020 19:32:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA73FF804D6; Tue, 27 Oct 2020 19:32:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1274BF80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1274BF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xa3aRlWC"
Received: by mail-wm1-x342.google.com with SMTP id e2so2472310wme.1
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HWW+ZfyCHyBaIjHVek844VU+H74q8wumivr8pDBz3+c=;
 b=Xa3aRlWC9ljsRrq+ZxZgYJULHxsgPA0ckHAQ19+tNrf10j+9QY8DA/WYBZS1fMKzl5
 8GYE10EvUT32mxJHeLCKJ/Mcqp6ZYITrS/Lw6JWjGM0JoUXfwC0OZCPBrbXH4lYllfHL
 7Nsu8vWTkAFdyvMqwm7YbggvoUv+zhP08zPknzg/lVE+UkS5kOPLMSWdsJaaN8rVqPi/
 hJPJyDbwvwA6ZzCHRnjE1TpbnXlFcdUJDy5IsJd0h4KZ5bcDHZ0fZZ97gbUuCkvsIaym
 gI+NtTldqxulAoFlhrBoVALDkSpwyrdNhozI7M8Cq7gEpbZZPrBVwjNcTQDmY1ao8fQS
 +JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HWW+ZfyCHyBaIjHVek844VU+H74q8wumivr8pDBz3+c=;
 b=p76let4vrW/NqfZQEWaYCbLaPP5UDdeYtMMvIF2ZvXhazXKgm74D16hdzQ0MO2Z+C9
 Yhrdp1vqz1By3cRJpPKpevgl11uKHBCEUr04xxvHxgXKBuEHNjbLZ2KSJceBgMF3Y7am
 tiuwEOjjilGpJWOxGCujYqDQKgPhhrBzZQ4WVPQsnVmgSf9axEipjg8n4u51Gu7SavWJ
 GjPX8ah6URstfJ9oMBjC1A3H9Tcs5We6ObOouGl0r7Jsyt5Rly2JW+3SrRa4viveD19+
 Qkq68HsIWWD9lmGCUx2OkbPxUeoLTbJss8YhmDkYsvgkW2Yd/oDPu5vxCKiesnU9SV5t
 g8mw==
X-Gm-Message-State: AOAM532y3anstdFKFX4awxzWDaPMG8zDTctnE9pmspIx+OrZ0FkXacoH
 uSIMov1EmUtPdEUfcOzlIaE=
X-Google-Smtp-Source: ABdhPJw5odAjh3G76+qql0JT4kD/cXQYlrTOXEYaGxulwmcWowGzECtkFMHPjpCXF16eHf3suW/ukQ==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr4002368wmh.94.1603823513610;
 Tue, 27 Oct 2020 11:31:53 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:31:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 01/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
Date: Tue, 27 Oct 2020 19:31:36 +0100
Message-Id: <20201027183149.145165-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027183149.145165-1-peron.clem@gmail.com>
References: <20201027183149.145165-1-peron.clem@gmail.com>
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

As slots and slot_width can be set manually using set_tdm().
These values are then kept in sun4i_i2s struct.
So we need to check if these values are set or not.

This is not done actually and will trigger a bug.
For example, if we set to the simple soundcard in the device-tree
dai-tdm-slot-width = <32> and then start a stream using S16_LE,
currently we would calculate BCLK for 32-bit slots, but program
lrck_period for 16-bit slots, making the sample rate double what we
expected.

To fix this, we need to check if these values are set or not but as
this logic is already done by the caller. Avoid duplicating this
logic and just pass the required values as params to set_chan_cfg().

Suggested-by: Samuel Holland <samuel@sholland.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index f23ff29e7c1d..7c1f57eb2462 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -162,8 +162,15 @@ struct sun4i_i2s_quirks {
 	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
 	s8	(*get_sr)(const struct sun4i_i2s *, int);
 	s8	(*get_wss)(const struct sun4i_i2s *, int);
-	int	(*set_chan_cfg)(const struct sun4i_i2s *,
-				const struct snd_pcm_hw_params *);
+
+	/*
+	 * In the set_chan_cfg() function pointer:
+	 * @slots: channels per frame + padding slots, regardless of format
+	 * @slot_width: bits per sample + padding bits, regardless of format
+	 */
+	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
+				unsigned int channels,	unsigned int slots,
+				unsigned int slot_width);
 	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
 };
 
@@ -399,10 +406,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
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
@@ -419,15 +425,11 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
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
@@ -452,11 +454,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
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
@@ -482,7 +484,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int word_size = params_width(params);
 	unsigned int slot_width = params_physical_width(params);
 	unsigned int channels = params_channels(params);
+
 	unsigned int slots = channels;
+
 	int ret, sr, wss;
 	u32 width;
 
@@ -492,7 +496,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2s->slot_width)
 		slot_width = i2s->slot_width;
 
-	ret = i2s->variant->set_chan_cfg(i2s, params);
+	ret = i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
 	if (ret < 0) {
 		dev_err(dai->dev, "Invalid channel configuration\n");
 		return ret;
-- 
2.25.1


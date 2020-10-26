Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75E82995F8
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9786C16B8;
	Mon, 26 Oct 2020 19:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9786C16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738474;
	bh=hNOV1OSEkb8me45e2FLjnygalS+b1DBuUITpH0q++00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nodBQl/p4SWK+YlpOB5+1xPrgt0D89525wOPbOgWQYT6hVESmfz4SJO32kz9ZxNyD
	 viaL0zk/kZ4n25f9sE4PCP0f3F2RsJulMukccAkZCJ9h7XJxTEJVywK1blarrZ/Zji
	 OQoyMprPghEcHbj9OLtjwrmfHC6N8psHerT8/wPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C7B1F801D5;
	Mon, 26 Oct 2020 19:52:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FB98F804B4; Mon, 26 Oct 2020 19:52:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30E0CF80086
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:52:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E0CF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WJ0Xq134"
Received: by mail-wr1-x442.google.com with SMTP id s9so13865678wro.8
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOkLUnzWl9ZzJaEpvY0BQeyF9Xi02JdDTj+Ipv+HbgQ=;
 b=WJ0Xq1340TIzloUUZHjNZaU/k2V+gFbVMFABmIc+Xj3BmGU+QZctUBokbHDUcHveRi
 txZMnKkF/pozpG4sGojq16zFGrjSWD1Y9JIwYW3puV+JrtOtl9U1O+t9ftqMx+Yi3d2s
 PFK0wD9AQRnnkMHnLGQAq2GAj6I0hVlIm7ka6pI7k2pRoHzgyekhOZ/Ie5a+Ga2IgjXi
 t5kAtJ7Na0PoC87EbAW/2VljxGCC0hSoyZM72e7A84biDS80xvqk0vm7fGA6YgzQlH1+
 SzbzB9fEEgMEH6M+cwcPE2WuIIzeSHuB4IdVEIvJkzKauK6cFHWmL4IlnKHTROOXl3Wa
 40sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOkLUnzWl9ZzJaEpvY0BQeyF9Xi02JdDTj+Ipv+HbgQ=;
 b=GwXyY5CCJSNyBoMhKbslt2qPNEXDtxvUrMuFhNNRYTHggglcUBny9lDLJk5+nt3VIu
 d/7l/UXHH8lXJuWlww/5Zc0uClu3e/POSifZPS51YTLNN4WyPM39GHBeSmMOAwNcvCEp
 9O8Llra4i3QLT6hdnuynzcLR4k35y5wpE5quzV2dZdAg/nb2iSxWJbARLGOH6dW3+3Q3
 nrpSEHsKlSMzU8dGKdZFl4IgqRtszQovzD+GUaW+6rLIgl/tABptDLd9CsRFH3Gvz/pA
 VsElin4zfyzKsF7wPLabIt1RFrFbdkjdEMWgmWVp5I6hNDorjpdspi9aPDZi2j4RepnX
 zecg==
X-Gm-Message-State: AOAM532B5O89Qn8U/7xfwaBMMblt8FKNShOaVhEGgdv4RtDWeTyOdDV8
 KvDiBblUgbqJojO4BzNm6nE=
X-Google-Smtp-Source: ABdhPJz3QiBhHJxavCSNhviQE5xuIrFVUUOvGqbGZ8O6tOJdFQ/qG6f90Md4pX8KCTOu3UT9B1SgnA==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr20281915wra.313.1603738364241; 
 Mon, 26 Oct 2020 11:52:44 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 01/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
Date: Mon, 26 Oct 2020 19:52:26 +0100
Message-Id: <20201026185239.379417-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026185239.379417-1-peron.clem@gmail.com>
References: <20201026185239.379417-1-peron.clem@gmail.com>
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
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index f23ff29e7c1d..6c10f810b114 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -162,8 +162,9 @@ struct sun4i_i2s_quirks {
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
 
@@ -399,10 +400,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
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
@@ -419,15 +419,11 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
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
@@ -452,11 +448,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
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
@@ -480,9 +476,16 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int word_size = params_width(params);
-	unsigned int slot_width = params_physical_width(params);
 	unsigned int channels = params_channels(params);
+
+	/*
+	 * Here and in set_chan_cfg(), "slots" means channels per frame +
+	 * padding slots, regardless of format. "slot_width" means bits
+	 * per sample + padding bits, regardless of format.
+	 */
 	unsigned int slots = channels;
+	unsigned int slot_width = params_physical_width(params);
+
 	int ret, sr, wss;
 	u32 width;
 
@@ -492,7 +495,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2s->slot_width)
 		slot_width = i2s->slot_width;
 
-	ret = i2s->variant->set_chan_cfg(i2s, params);
+	ret = i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
 	if (ret < 0) {
 		dev_err(dai->dev, "Invalid channel configuration\n");
 		return ret;
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EB12A0862
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:49:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B70C1658;
	Fri, 30 Oct 2020 15:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B70C1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069368;
	bh=eb2dXZj6XA2qRWZDkyntzp+Xe4VhwLv9ecIkkg81QkY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rnzUyyrNmJrDkGOL2L3NQr7+vxF9R4jFow+X+Pvbb+GdieU0cIpy1eNs+HV84deOq
	 ZRGPhdTE3Rj0z10fafBC6BBBIRgHmqUVmX9AKsnNM6WxRApRoFDmVrixNTnWK3+NFg
	 GtM1+msOOaIAmTdiFomSiT10MNdeUl1wh1uY+650=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA61BF804C3;
	Fri, 30 Oct 2020 15:47:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 832FBF804C2; Fri, 30 Oct 2020 15:47:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02F2FF8025E
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02F2FF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AYTrqqkC"
Received: by mail-oi1-x244.google.com with SMTP id d9so888902oib.3
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WLJXPtjTNSugnrrI4n/vT0cn/oCNnN/c4HbxdKvwJMI=;
 b=AYTrqqkCTFZ13V0uwZeUgAsQFWspiIzE2Teact5kpugvXy5SI1L6T+/iRuTjN7bO5y
 Kwqy+Px9klnbI3jvNzDn21DBz2L46Nt0GIRyuKk3Jy1sTiQneK/DlCeuPza3hEmJWyId
 e1MrLpq+Vn9ysEGn1Q67oMLw5HsnFA/w5ZmoNZDF6YMKz7GmYbyWKcyS+AMztGQ/Rq3I
 pX3ZjrkC9bxNzvtViIWBWn9nNDYfcQUyGVXVb8SVJWYESaE8cKUxEyoVFaBXGsU0Nh+c
 4zebUkfhlby2BFOpqOdComH389TABZEmr1ZUwHA58a5dkL355t+bA65K+P3LSj+mN+uE
 6W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLJXPtjTNSugnrrI4n/vT0cn/oCNnN/c4HbxdKvwJMI=;
 b=j23u2SddEkMzwD0JyUk3VJuJhy5aYPtz84E6k2qvzqqhYHtOpo5oHr08JUWYjjzN3y
 2K/ouwfh0Q/G72Ew+sDuBgriXCLPXPBS4LPYHvpqE5atQVJphQihJ8RDuGZP/3Sq/X63
 J9xoyP5DZAWDKzIpv1ejOBRt8dSDZjTQ2xdxSz2n9B6o3J/TXnb3ciQtQJbVvwGB/1n+
 8vig9oWa6lRck13JycvPNz89dec2LpD8rbcxF0iL5/xH4p5tZ1ej0Udxx/fIFixQ0ggB
 VNptxetxKaNy4YbeVzTjVNzAZ8uG5tvTRzWsJgpEQn6WkDjdayBIoJex9MNuibJX6wxh
 75VA==
X-Gm-Message-State: AOAM530MaYjFDtZWOZOsY+ySILmQBuMQY1AjGEO7BWzzzjKY+ATb6iG5
 OtyqKraXDLmL9MxLSa5qfV4=
X-Google-Smtp-Source: ABdhPJzb2QcoBWs+YPaug81YlGbLCnvHC+1aQngHoxi68YJ1C7dZrfC6XcD2h36AG4aG6tAvSpBKEA==
X-Received: by 2002:aca:7210:: with SMTP id p16mr1934022oic.77.1604069222095; 
 Fri, 30 Oct 2020 07:47:02 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:47:01 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 02/15] ASoC: sun4i-i2s: Change set_chan_cfg() params
Date: Fri, 30 Oct 2020 15:46:35 +0100
Message-Id: <20201030144648.397824-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030144648.397824-1-peron.clem@gmail.com>
References: <20201030144648.397824-1-peron.clem@gmail.com>
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
index a994b5cf87b3..4ff2068779fd 100644
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
@@ -450,13 +452,13 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	switch (i2s->format & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
 	case SND_SOC_DAIFMT_DSP_B:
-		lrck_period = params_physical_width(params) * slots;
+		lrck_period = slot_width * slots;
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_RIGHT_J:
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


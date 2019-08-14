Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA0D8CBDE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:21:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 871CB1616;
	Wed, 14 Aug 2019 08:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 871CB1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763677;
	bh=Sky75S67UcicWAgeQgIr9qtoxjpxYDBEmikzBYZx4Gk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GHCBXTFv0irmXdAe3JoDTSFz81rFdQxRrNm/zXI2RL4resNJeUNBzbVLmSv0Ns/qY
	 NT0NbPv1AiOIsGg9cg+AWCy0aF3CW7g/g1g8XrKLzAqcFjKn49YrZhDv24VJY4m892
	 ZkWJP1Urb1IsALv4jUqeXISvhFKqMldyORm+VSGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D78F80752;
	Wed, 14 Aug 2019 08:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F6E9F806EF; Wed, 14 Aug 2019 08:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3522EF80671
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3522EF80671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="f/JFLeR3"
Received: by mail-lf1-x143.google.com with SMTP id c19so78488610lfm.10
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cgF+iQ71N63fzGiwQW4cF1hqYUHS6u6C/HWG5UzaxPs=;
 b=f/JFLeR3DcJywbYWdN8lm2tKUulDCXEf9JpBXBUBrF041WiZSdgsyB4Wi9PMvDUjX6
 NEPWQAkrBgCH90ub/1Mq2e289lSfxj7EOu17iL2kahf/PiRsQPsVM5gkxIpVBDEQIt8Z
 R7BEWYAvbPXnsFE6DHJsyjllky7PZdgjgY6oRelW3PBGn3sKabNjeUcz94fyytsnpsPW
 Dl5tIZhp9o1FklMyxbSIjSW88Cykrke7ZVbuTA7xmUhG6qOcd72iBleye8UmxutefK+d
 Y36C0TGhkoL6fBBuo2nhUma62HQR2ZZnet7xOtunYR7qALgXG1Xm8ApQYJC/bMVrPXAn
 Bhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cgF+iQ71N63fzGiwQW4cF1hqYUHS6u6C/HWG5UzaxPs=;
 b=SeoVqnlczH1p4lI4TE89o3vM6T/LZq/U2ICF/y0z2dWZo8MHmLyk+ChyPZmdyLcCSW
 shovbCtTKse9K60rkuctmOJYMmBpSZ44+ohhWry3Pc99h9btnCmlxMnu1LeAbyYhn9ZC
 xVDdQ5DWFl1jywtykHzsN8SNEjxVsdoTWrqs6KWLT8fv35V/tbIhhZnPIGM4Thv+XWUU
 uxFAAdFpVYwF8HJ1pRPWq52bmjG15iZVrzB/v7oD5PXpBrDY1UqRl5GrdZ2uroSTWTAo
 5fI3LqKPvhiNJoVZfp5UTKgfDaNWRtLx81SwAz/+7v7w7SOw2aARidjdGKfHpuEsEMvH
 Nskw==
X-Gm-Message-State: APjAAAW3RUoJOBpSse3ABLAupxaJyBPmh8YnIwZzqpO4ZO2xjm1cBTVV
 7IZbxqEQKC7+T/YbqnTFURE=
X-Google-Smtp-Source: APXvYqxhYYTBqUuseJDWWUez3HqTi8OLsZ2iGsFp5mSkUmqRbkZx3k0KgGcdCy65dv073qcEdG4Bpw==
X-Received: by 2002:a19:5217:: with SMTP id m23mr24260832lfb.124.1565762957909; 
 Tue, 13 Aug 2019 23:09:17 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:17 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:52 +0200
Message-Id: <20190814060854.26345-14-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 13/15] ASoC: sun4i-i2s: Add multichannel
	functionality
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

The i2s block can be used to pass PCM data over multiple channels
and is sometimes used for the audio side of an HDMI connection.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 93 +++++++++++++++++++++++++------------
 1 file changed, 63 insertions(+), 30 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index a020c3b372a8..a71969167053 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -617,41 +617,74 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	int lines;
 
 	channels = params_channels(params);
-	if (channels != 2) {
-		dev_err(dai->dev, "Unsupported number of channels: %d\n",
-			channels);
-		return -EINVAL;
-	}
-
-	lines = (channels + 1) / 2;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if ((channels > dai->driver->playback.channels_max) ||
+			(channels < dai->driver->playback.channels_min)) {
+			dev_err(dai->dev, "Unsupported number of channels: %d\n",
+				channels);
+			return -EINVAL;
+		}
 
-	/* Enable the required output lines */
-	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
-			   SUN4I_I2S_CTRL_SDO_EN_MASK,
-			   SUN4I_I2S_CTRL_SDO_EN(lines));
-
-	if (i2s->variant->has_chcfg) {
-		regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
-				   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
-				   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM(channels));
-		regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
-				   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM_MASK,
-				   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM(channels));
-	}
+		lines = (channels + 1) / 2;
 
-	/* Map the channels for playback and capture */
-	i2s->variant->set_txchanmap(i2s, 0, 0x76543210);
-	i2s->variant->set_rxchanmap(i2s, 0x00003210);
+		/* Enable the required output lines */
+		regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
+				   SUN4I_I2S_CTRL_SDO_EN_MASK,
+				   SUN4I_I2S_CTRL_SDO_EN(lines));
+
+		i2s->variant->set_txchanmap(i2s, 0, 0x10);
+		i2s->variant->set_txchansel(i2s, 0, channels > 1 ? 2:1);
+
+		if (i2s->variant->set_txchanen)
+			i2s->variant->set_txchanen(i2s, 0, 2);
+
+		if (i2s->variant->has_chcfg) {
+			regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
+					   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
+					   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM(channels));
+
+			if (channels > 2) {
+				i2s->variant->set_txchanmap(i2s, 1, 0x32);
+				i2s->variant->set_txchanoffset(i2s, 1);
+				i2s->variant->set_txchansel(i2s, 1,
+							    channels > 3 ? 2:1);
+				i2s->variant->set_txchanen(i2s, 1, 2);
+			}
+			if (channels > 4) {
+				i2s->variant->set_txchanmap(i2s, 2, 0x54);
+				i2s->variant->set_txchanoffset(i2s, 2);
+				i2s->variant->set_txchansel(i2s, 2,
+							    channels > 5 ? 2:1);
+				i2s->variant->set_txchanen(i2s, 2, 2);
+			}
+			if (channels > 6) {
+				i2s->variant->set_txchanmap(i2s, 3, 0x76);
+				i2s->variant->set_txchanoffset(i2s, 3);
+				i2s->variant->set_txchansel(i2s, 3,
+							    channels > 6 ? 2:1);
+				i2s->variant->set_txchanen(i2s, 3, 2);
+			}
+		}
+	} else {
+		if ((channels > dai->driver->capture.channels_max) ||
+			(channels < dai->driver->capture.channels_min)) {
+			dev_err(dai->dev, "Unsupported number of channels: %d\n",
+				channels);
+			return -EINVAL;
+		}
 
-	/* Configure the channels */
-	i2s->variant->set_txchansel(i2s, 0, channels);
-	i2s->variant->set_rxchansel(i2s, channels);
+		/* Map the channels for capture */
+		i2s->variant->set_rxchanmap(i2s, 0x10);
+		i2s->variant->set_rxchansel(i2s, channels);
 
-	if (i2s->variant->set_txchanen)
-		i2s->variant->set_txchanen(i2s, 0, channels);
+		if (i2s->variant->set_rxchanen)
+			i2s->variant->set_rxchanen(i2s, channels);
 
-	if (i2s->variant->set_rxchanen)
-		i2s->variant->set_rxchanen(i2s, channels);
+		if (i2s->variant->has_chcfg)
+			regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
+					   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM_MASK,
+					   SUN8I_I2S_CHAN_CFG_RX_SLOT_NUM(channels));
+	}
 
 	switch (params_physical_width(params)) {
 	case 16:
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

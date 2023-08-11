Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE41779864
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 22:16:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A173382A;
	Fri, 11 Aug 2023 22:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A173382A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691784974;
	bh=+ikxxxBrtOIscAn6X3WvP38OjXEPcCycQ8XlzG8y5WU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R5CoIgDVLWr1jnljUx3lZx5lS/Q0PBe6VnvYTG63TPW7HFPXFeEtECpxE0WfXERWG
	 NNCpyeq7yUcoolXFj0X/JU8q3pHoEcwOzKJq/J7/80NqpCKyM0QYX1M4Av3O5JYiLw
	 OWwxLoIAaYx+SXLyxloY//SWSLnmcYWPboJg3PHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A210AF80557; Fri, 11 Aug 2023 22:14:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA37BF80557;
	Fri, 11 Aug 2023 22:14:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D973FF80166; Fri, 11 Aug 2023 22:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-74.mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E3A7F800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 22:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E3A7F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=fOEGh3YG
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gXxLpbwnK2iER9aMBTnDKfRuAwj+8nGNCQhtYFkwJrs=;
	b=fOEGh3YG4Ed6CywSJa3zIzGH2UVPJ+thdSdatxaiyOcU9nDq8LREc/TvthapaRnzpBYlnG
	FkZ+uW225LdaA9JsXIeD5pOY9Rx70nNzbDvQkHyx4EZkch9XQTJ+q+Trt3jDSQ0HaXCLWM
	4TNb6SgeURSj5+UtJy+h5JVwtLu9vuMthKYiutq26Ba0xvfEQSeWgHXfXoIXu0HtFLiMf9
	kKijtcXvYSnpNQ/MVYktvL6GvO1DSGUTJWvhaVC7DleXPcqp14j6KzM9nheB19wcrGJnhQ
	M6Y7kj7j4/qNa4Mbt+bxVFjD7KRyMATH5Ja2J+Lsga4DJsrlT78qDjwMeGd7LA==
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Watts <contact@jookia.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/7] ASoC: sunxi: sun4i-i2s: Prepare for runtime DIN pin
 selection
Date: Sat, 12 Aug 2023 06:14:00 +1000
Message-ID: <20230811201406.4096210-2-contact@jookia.org>
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
References: <20230811201406.4096210-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: I3ONR2BSDGVSL5VDNAO6UQBY66KOY2BE
X-Message-ID-Hash: I3ONR2BSDGVSL5VDNAO6UQBY66KOY2BE
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3ONR2BSDGVSL5VDNAO6UQBY66KOY2BE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The R329 and D1 support multiple I2S data input pins, but to use these
they require explicit mapping to channels.

Add a mapping of DIN pins to the 16 channels in the sun4i_i2s struct
then use that to write the channel mapping register.

For now the mapping is always to DIN0, identical to the previous
behaviour.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 40 +++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 669d712bbe9f..d8f999ecaf05 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -216,6 +216,7 @@ struct sun4i_i2s {
 	unsigned int	mclk_freq;
 	unsigned int	slots;
 	unsigned int	slot_width;
+	u8	channel_dins[16];
 
 	struct snd_dmaengine_dai_dma_data	capture_dma_data;
 	struct snd_dmaengine_dai_dma_data	playback_dma_data;
@@ -233,6 +234,13 @@ struct sun4i_i2s_clk_div {
 	u8	val;
 };
 
+static int sun4i_i2s_read_channel_dins(struct device *dev, struct sun4i_i2s *i2s)
+{
+	/* Use DIN pin 0 by default */
+	memset(i2s->channel_dins, 0, sizeof(i2s->channel_dins));
+	return 0;
+}
+
 static const struct sun4i_i2s_clk_div sun4i_i2s_bclk_div[] = {
 	{ .div = 2, .val = 0 },
 	{ .div = 4, .val = 1 },
@@ -527,6 +535,25 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	return 0;
 }
 
+static void sun50i_h6_write_channel_map(const struct sun4i_i2s *i2s,
+					unsigned int reg,
+					unsigned int channel_start)
+{
+	unsigned int reg_value = 0;
+
+	/* Loop backwards so we can shift values in */
+	for (int i = 3; i >= 0; i--) {
+		int channel = channel_start + i;
+		u8 din = i2s->channel_dins[channel];
+		u8 slot = channel; /* Map slot to channel */
+
+		reg_value <<= 8;
+		reg_value |= (din << 4) | slot;
+	}
+
+	regmap_write(i2s->regmap, reg, reg_value);
+}
+
 static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 				      unsigned int channels, unsigned int slots,
 				      unsigned int slot_width)
@@ -537,10 +564,10 @@ static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG(0), 0xFEDCBA98);
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG(0), 0x76543210);
 	if (i2s->variant->num_din_pins > 1) {
-		regmap_write(i2s->regmap, SUN50I_R329_I2S_RX_CHAN_MAP0_REG, 0x0F0E0D0C);
-		regmap_write(i2s->regmap, SUN50I_R329_I2S_RX_CHAN_MAP1_REG, 0x0B0A0908);
-		regmap_write(i2s->regmap, SUN50I_R329_I2S_RX_CHAN_MAP2_REG, 0x07060504);
-		regmap_write(i2s->regmap, SUN50I_R329_I2S_RX_CHAN_MAP3_REG, 0x03020100);
+		sun50i_h6_write_channel_map(i2s, SUN50I_R329_I2S_RX_CHAN_MAP0_REG, 12);
+		sun50i_h6_write_channel_map(i2s, SUN50I_R329_I2S_RX_CHAN_MAP1_REG, 8);
+		sun50i_h6_write_channel_map(i2s, SUN50I_R329_I2S_RX_CHAN_MAP2_REG, 4);
+		sun50i_h6_write_channel_map(i2s, SUN50I_R329_I2S_RX_CHAN_MAP3_REG, 0);
 	} else {
 		regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP0_REG, 0xFEDCBA98);
 		regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);
@@ -1559,6 +1586,11 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (sun4i_i2s_read_channel_dins(&pdev->dev, i2s)) {
+		dev_err(&pdev->dev, "Invalid channel DINs\n");
+		return -EINVAL;
+	}
+
 	i2s->playback_dma_data.addr = res->start +
 					i2s->variant->reg_offset_txdata;
 	i2s->playback_dma_data.maxburst = 8;
-- 
2.41.0


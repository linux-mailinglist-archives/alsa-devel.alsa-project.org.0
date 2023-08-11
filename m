Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD637779866
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 22:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D14084B;
	Fri, 11 Aug 2023 22:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D14084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691784991;
	bh=ysp5gU6h3jAj+JUX9RAzuvheYouVZnnYpv0v9EEUWAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=spKgXjaNhJlGeR6EOAR3rQmI9ELFMVRq/JjTm2mtHzLtoXJevaYnt+lxwks5oP1vU
	 AYX0hsqJVxEZjG8b8tvsKCT8kcUEx/9V+qKFo9k62i5EkzIwqNDleduhSkccxQVojr
	 zsGADsF0TI8xIJ0Hv/Nn3IaaEqdtb591zxjRT+pA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E3A1F8059F; Fri, 11 Aug 2023 22:14:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F37EBF8057D;
	Fri, 11 Aug 2023 22:14:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72D43F8057E; Fri, 11 Aug 2023 22:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-110.mta1.migadu.com (out-110.mta1.migadu.com
 [95.215.58.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BA1FF80568
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 22:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BA1FF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=b+X1lQvd
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KohIP0ksHXxdx+GVUlJOfMvQCC6gcPhr/Z2zQUgwBik=;
	b=b+X1lQvdVhoQYU2XhhOyNGjflc23TRX6lpdQ4j3TVZPlsuUKRMU+OpZQaiDS13YPvo+Gag
	srOdPv0LV4WyVDiGbaOwKk/3WyOs2rlMkTR0lV3mh4EVr0rPjdTAgIvJxr6aaOPBWEh2/X
	nqesEmlNJGzzk6D9VQaz2yT3iRwRBq4rS9h58rGcfz/05bwCfeuo8YweYJqoScg0fw0DDe
	ZqaXU+vo2rLuDoUP1fOskzn8svSeJFPncg0PpgpBHvIpnIihbYRYERlAU8sL1dRIh3pTHO
	HWQ0HeRwYvp3S7Lcge1dubVrRGxaDvUpc6XOqdcdZXu6kYIPajrkAEiFFJXifQ==
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
Subject: [RFC PATCH 3/7] ASoC: sunxi: sun4i-i2s: Prepare for runtime channel
 slot selection
Date: Sat, 12 Aug 2023 06:14:02 +1000
Message-ID: <20230811201406.4096210-4-contact@jookia.org>
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
References: <20230811201406.4096210-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: UQO75D5IETOK6KIVHCQMWX3HOA4GRCMG
X-Message-ID-Hash: UQO75D5IETOK6KIVHCQMWX3HOA4GRCMG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQO75D5IETOK6KIVHCQMWX3HOA4GRCMG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sun4i I2S controller supports mapping channels to specific TDM
slots. This is usually done in a 1:1 mapping because there's not
really a reason to re-order the TDM slots in software.

On the R329 and D1 multiplexing can be done using pins as well as
TDM. Here's an example of using 3 pins and 2 slots (left and right):

Channel 0 -> DIN0 -> ADC0, TDM slot 0
Channel 1 -> DIN0 -> ADC0, TDM slot 1
Channel 2 -> DIN1 -> ADC1, TDM slot 0
Channel 3 -> DIN1 -> ADC1, TDM slot 1
Channel 4 -> DIN2 -> ADC2, TDM slot 0
Channel 5 -> DIN2 -> ADC2, TDM slot 1

This connects 3 separate TDM-unaware ADCs to the I2S controller.
Likewise, multiple TDM slots could be used to run two sets of
TDM-aware ADCs on one I2S controller.

Prepare for configurable slot selection by adding a channel to slot
mapping array and using that in the R329 code if we multiple DIN pins.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index cf66f21646a4..627bf319e1cc 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -217,6 +217,7 @@ struct sun4i_i2s {
 	unsigned int	slots;
 	unsigned int	slot_width;
 	u8	channel_dins[16];
+	u8	channel_slots[16];
 
 	struct snd_dmaengine_dai_dma_data	capture_dma_data;
 	struct snd_dmaengine_dai_dma_data	playback_dma_data;
@@ -266,6 +267,17 @@ static int sun4i_i2s_read_channel_dins(struct device *dev, struct sun4i_i2s *i2s
 	return 0;
 }
 
+static int sun4i_i2s_read_channel_slots(struct device *dev, struct sun4i_i2s *i2s)
+{
+	int max_channels = ARRAY_SIZE(i2s->channel_dins);
+
+	/* Use a 1:1 mapping by default */
+	for (int i = 0; i < max_channels; ++i)
+		i2s->channel_slots[i] = i;
+
+	return 0;
+}
+
 static const struct sun4i_i2s_clk_div sun4i_i2s_bclk_div[] = {
 	{ .div = 2, .val = 0 },
 	{ .div = 4, .val = 1 },
@@ -570,7 +582,7 @@ static void sun50i_h6_write_channel_map(const struct sun4i_i2s *i2s,
 	for (int i = 3; i >= 0; i--) {
 		int channel = channel_start + i;
 		u8 din = i2s->channel_dins[channel];
-		u8 slot = channel; /* Map slot to channel */
+		u8 slot = i2s->channel_slots[channel];
 
 		reg_value <<= 8;
 		reg_value |= (din << 4) | slot;
@@ -1616,6 +1628,11 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	if (sun4i_i2s_read_channel_slots(&pdev->dev, i2s)) {
+		dev_err(&pdev->dev, "Invalid channel slots\n");
+		return -EINVAL;
+	}
+
 	i2s->playback_dma_data.addr = res->start +
 					i2s->variant->reg_offset_txdata;
 	i2s->playback_dma_data.maxburst = 8;
-- 
2.41.0


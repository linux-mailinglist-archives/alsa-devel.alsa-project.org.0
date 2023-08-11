Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A80B6779865
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 22:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8179E846;
	Fri, 11 Aug 2023 22:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8179E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691784976;
	bh=bp1uhKiN2iX+iNkgzk+NUQQsCKc99cuDK9aP8t52O5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KwVn4Q2YP1Z9yA4QgfkkojTryzdc9ajCcgPxsavqEf2cYwdcGTiYsEQ5qqeZUcZ1c
	 gFXqHkd/eekpB23RuBsF1q+Q3hd6P7SJkVpgJTEaMqZSaYpqPoTLnOGAdFlHantOFL
	 3pscYOkVc+MG4bkKY9NWgrXnEYHaa9oQHYTDxIxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1CA7F8016E; Fri, 11 Aug 2023 22:14:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F8DAF80568;
	Fri, 11 Aug 2023 22:14:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 334EEF8056F; Fri, 11 Aug 2023 22:14:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-102.mta1.migadu.com (out-102.mta1.migadu.com
 [IPv6:2001:41d0:203:375::66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73672F8016E
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 22:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73672F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=G3FR1BhY
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhYtgX26LvJBhk6rq6uv3xTzs4w5PTKDtDH5ARnA/4A=;
	b=G3FR1BhYf+QYeepS8uWwGULIaRbKottmRdYsDjusazmWtWiDg8fF5tcuc4FuZXcRMNF2Mo
	ieoy9oUrsQeJSeROCAv/695QGWwCOuZAuV7fs5AWXgdfEsc6UgpJpBjuPRS2Hofz0af/VT
	tmBpbOYnVZpR6BIbJBm8dYGC0gUvtemdTvaRXMkVzbJLGzE4MTaO1SXq/PmfzOvOwrqO9H
	tXOGIlA2GciINGlf4QK/fJ4JFnwS/FO+t48g2Sg9qwwBMjwkhOkNqm5iTPO+TSAU4Rx84E
	dVyExjbZ389fkoZxoqmDquJNbI2ASpqJqqKj3A1P+Sy1ou5RNvSxx8guWMrfog==
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
Subject: [RFC PATCH 2/7] ASoC: sunxi: sun4i-i2s: Use channel-dins device tree
 property
Date: Sat, 12 Aug 2023 06:14:01 +1000
Message-ID: <20230811201406.4096210-3-contact@jookia.org>
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
References: <20230811201406.4096210-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: HDXFNBBND4IN3XOFUTYSEM7QF7CZLDT5
X-Message-ID-Hash: HDXFNBBND4IN3XOFUTYSEM7QF7CZLDT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDXFNBBND4IN3XOFUTYSEM7QF7CZLDT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using DIN pin 0 for all pins, allow changing this using
the device tree property.

As an example:

&i2s2 {
	channel-dins = /bits/ 8 <0 0 1 1 2 2>;
};

This sets channels 0 and 1 to DIN pin 0, channels 1 and 2 to DIN pin 1,
and channels 3 and 4 to DIN pin 3 respectively.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d8f999ecaf05..cf66f21646a4 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -236,8 +236,33 @@ struct sun4i_i2s_clk_div {
 
 static int sun4i_i2s_read_channel_dins(struct device *dev, struct sun4i_i2s *i2s)
 {
+	struct device_node *np = dev->of_node;
+	int max_channels = ARRAY_SIZE(i2s->channel_dins);
+	int ret;
+
 	/* Use DIN pin 0 by default */
 	memset(i2s->channel_dins, 0, sizeof(i2s->channel_dins));
+
+	if (!np)
+		return 0;
+
+	ret = of_property_read_variable_u8_array(np, "channel-dins",
+						 i2s->channel_dins,
+						 1, max_channels);
+
+	if (ret == -EINVAL)
+		return 0;
+
+	if (ret < 0)
+		return ret;
+
+	for (int i = 0; i < ret; ++i) {
+		u8 din = i2s->channel_dins[i];
+
+		if (din >= i2s->variant->num_din_pins)
+			return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.41.0


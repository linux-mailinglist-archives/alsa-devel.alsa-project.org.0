Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229CF779869
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 22:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C339868;
	Fri, 11 Aug 2023 22:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C339868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691785012;
	bh=SNYGVN58R1htz8XAP/Ki30YWSq5luVzCpIBPqVinuws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=istVeICBZXWrf9/WFYbpDIC/OaLr/+WIomNhQQKN1iwvqj93oWs2hOYwJS5XUoZnP
	 3lcVTVpBFfg55vpgjctuR0hItwkZNxqFvNMsmW+F+qJI9NtCDb2c2mgsh7a3LzU89q
	 ebo5PRz2ySTeGHDRefL4QbnRe315/oZ7MuJ6AYpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 068BFF80589; Fri, 11 Aug 2023 22:14:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9572F805A9;
	Fri, 11 Aug 2023 22:14:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D369FF805AB; Fri, 11 Aug 2023 22:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-95.mta0.migadu.com (out-95.mta0.migadu.com [91.218.175.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D95DF8058C
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 22:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D95DF8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=SF7GQFQI
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c760wkxPLczuI7tECzLOiGz+mznMFHiURmBp9IfloLs=;
	b=SF7GQFQIMbGSIRIbDdfcfm1/Ln1i/WscUwrTn0q7g9Z2FxkvffM46DLW+yosRia5C+01hO
	nSO9wHJ/nCkY+BuHCKtIPRhAvlQ26+RjFiLI3/9+ZRCUZU2QEYAs9tMPvWJLEALKgYLQcr
	DXWIy6JF3NZOOctaC6Rs+MK3rVAx64b2TffmFFG3FEaGNLX9rj59OoEnqqcuvwluBe52LX
	YHzSeZ9+eDwjs+4n980y4xyfurS640oORu3/5Co+ieSypxHceQZLOxxpOShOjqpjQSaoD1
	TkEoo/NHBMJqeVdbqUaF3VscGKV8A8XKNogDdt3TwOKPlMVigfFEWFhfkC/d5Q==
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
Subject: [RFC PATCH 4/7] ASoC: sunxi: sun4i-i2s: Use channel-slots device tree
 property
Date: Sat, 12 Aug 2023 06:14:03 +1000
Message-ID: <20230811201406.4096210-5-contact@jookia.org>
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
References: <20230811201406.4096210-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: SG3GYFEYRGQFNNAKVAQSSWUENQQDKWKJ
X-Message-ID-Hash: SG3GYFEYRGQFNNAKVAQSSWUENQQDKWKJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SG3GYFEYRGQFNNAKVAQSSWUENQQDKWKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On R329 I2S variants with multiple pins it's useful to read from
multiple devices within a single TDM slot. Allow changing the
assignment of slots through a device tree property.

As an example:

&i2s2 {
        channel-dins = /bits/ 8 <0 0 1 1 2 2>;
        channel-slots = /bits/ 8 <0 1 0 1 0 1>;
};

In addition to configuring the first 6 channels to use different
DIN pins for three separate ADCs, the addition of channel-slots allows
all three ADCs to be sampled within the first two TDM slots.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 627bf319e1cc..019a4856c90b 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -269,12 +269,27 @@ static int sun4i_i2s_read_channel_dins(struct device *dev, struct sun4i_i2s *i2s
 
 static int sun4i_i2s_read_channel_slots(struct device *dev, struct sun4i_i2s *i2s)
 {
+	struct device_node *np = dev->of_node;
 	int max_channels = ARRAY_SIZE(i2s->channel_dins);
+	int ret;
 
 	/* Use a 1:1 mapping by default */
 	for (int i = 0; i < max_channels; ++i)
 		i2s->channel_slots[i] = i;
 
+	if (!np)
+		return 0;
+
+	ret = of_property_read_variable_u8_array(np, "channel-slots",
+						 i2s->channel_slots,
+						 1, max_channels);
+
+	if (ret == -EINVAL)
+		return 0;
+
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
-- 
2.41.0


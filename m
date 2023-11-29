Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DAC7FE1FB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:32:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E676F84A;
	Wed, 29 Nov 2023 22:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E676F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293521;
	bh=p7OgoyRtcwYF2aovGgzjdn3WOBNxzxmrE8N7rbGS4Ok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EiSsoQJBGkfzovsbVU4qJxCGFjiiaxN7/QRLiil/jtiknJRNgo57U6TAZawQDWJ60
	 rfvSAFU4eetTVS+SyTO1NSJXy+65K0OXIeIySGthO3cQkc4adh+VIodJwfvxqzrvB7
	 tsyyItRkwXlajglWI+3Jzykvq4s5J/0u9HAxs5B0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77900F806CD; Wed, 29 Nov 2023 22:29:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E4CF805C1;
	Wed, 29 Nov 2023 22:29:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63CB3F80570; Wed, 29 Nov 2023 22:29:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF913F801D5
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF913F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=k501R2Gs
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c9b7bd6fffso3725451fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 13:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293324; x=1701898124;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxA1zyyyxC7/6y6RpRxRpLmaP1pTY49ZhzDzMcyXsOY=;
        b=k501R2GsK2iOPcAsjXhIkWSmoLzNSNlhmaTt6ouxWofPzpN9Znr2KlNO9/LKeLSczx
         94aBL2JS6x/+j2J7Y4a16nwuj4olVds1sGOG90u0iRC+db/9X46JwwKnHnAbUs2/yQCM
         KM7348xw4Ohjkixa1Vh+9W2oCK3LR2hgGGVlU/5XBAvysTo/auHshwc3bMtO/y31x9mT
         GAcv2XRdH8/yYkpZnKz66oCCwyhhblz3ou33TgXLksb9lTwERJsWTMKfP57YFbrznJNz
         CNd+RpCMwpDFlwYc+pGUhYuERlosbgxj93YrenBNU9DFCNDE3OobttbnWol0asCNAMUA
         mysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293324; x=1701898124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxA1zyyyxC7/6y6RpRxRpLmaP1pTY49ZhzDzMcyXsOY=;
        b=ClSMb2+8SFXgMUgOjzRpqfGOh4L/ZVZ3JKIH1W/ma0HpsvQjcG/mMFB0bM/kCJj6ne
         OZXrI3Zrc9psVQrUBnuXhWNckw5AAniCoYGLrMqbqaRLNlSjIBHUizNFbiOTT2/3eIZh
         jyTjVbeW3Gq1OtcfVYazPqxpet55BYYNW2pS98qMV5VV13s95RsHY2WbdxPkplNfpGUP
         jvVn25lA35HtxOJAjsjtRLWh6kZFRHSHSeDico/mUJC91PrN5IysYRL0uodIMN9k6gk2
         k4ZCmio7WHqJF43mox5ZqHOjIC11bPqjNsIhRyibqdeFT15hbfTxfDULfYIC9Kom9qJR
         YqMg==
X-Gm-Message-State: AOJu0Yxg2NTB2GZptPGdoEjGyWAr/0Rw9JLM/sEjK7qGvUQ1k8YVF+hu
	LQvzdbPlraTKygIUOdHakGiI4w==
X-Google-Smtp-Source: 
 AGHT+IH2XK3VmzyApGKH2dJRP5mNU0HGdkujQYH19VxvKR71Nk9rdeM2oIikSY71v9WV2Mt3FvghIA==
X-Received: by 2002:a2e:8709:0:b0:2c9:c192:42a8 with SMTP id
 m9-20020a2e8709000000b002c9c19242a8mr1654073lji.38.1701293324577;
        Wed, 29 Nov 2023 13:28:44 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:44 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:39 +0100
Subject: [PATCH 03/10] ASoC: cs35l34: Fix GPIO name and drop legacy include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-3-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: IHAO4VVFLJR752A54HOIY2JZPP3JFVVT
X-Message-ID-Hash: IHAO4VVFLJR752A54HOIY2JZPP3JFVVT
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHAO4VVFLJR752A54HOIY2JZPP3JFVVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO APIs <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from any of
them.

Drop the includes.

Further the driver is requesting "reset-gpios" rather than
just "gpios" from the GPIO framework. This is wrong because
the gpiolib core will add "-gpios" before processing the
request from e.g. device tree. Drop the suffix.

The last problem means that the optional RESET GPIO has
never been properly retrieved and used even if it existed,
but nobody noticed.

Fixes: c1124c09e103 ("ASoC: cs35l34: Initial commit of the cs35l34 CODEC driver.")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l34.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index e5871736fa29..cca59de66b73 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -20,14 +20,12 @@
 #include <linux/regulator/machine.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
@@ -1061,7 +1059,7 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c_client)
 		dev_err(&i2c_client->dev, "Failed to request IRQ: %d\n", ret);
 
 	cs35l34->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-				"reset-gpios", GPIOD_OUT_LOW);
+				"reset", GPIOD_OUT_LOW);
 	if (IS_ERR(cs35l34->reset_gpio)) {
 		ret = PTR_ERR(cs35l34->reset_gpio);
 		goto err_regulator;

-- 
2.34.1


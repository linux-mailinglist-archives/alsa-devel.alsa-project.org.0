Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 895407FE1F4
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:30:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED1EDF5;
	Wed, 29 Nov 2023 22:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED1EDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293402;
	bh=sv7wIqGoko8jDyDNalpgXrfOYBuhs77xTTqM6kb7mvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RN/YrEF314fw6m/wPeVZalEzNq8enli+MzHmKIhP4qaF3eiUN/T/6SHKQ2JOtCaXW
	 IQ1Cp5/KqhApcUkH1A+DkH73oo3231J6xQFmnSo1NPAxAX/XQuACmzphfl+hSmvR1n
	 ble5MHabmFhdu+r697v7HbXqIET2YCW77NOepuYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0C00F805E5; Wed, 29 Nov 2023 22:29:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E93FEF805EF;
	Wed, 29 Nov 2023 22:29:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA932F805D8; Wed, 29 Nov 2023 22:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42246F8016E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42246F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y42SlOJJ
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c9b5e50c1fso4100561fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 13:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293323; x=1701898123;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w98h2S9ziwqYlZ5eRbk63Kp1zoQv2lCTleH6DrVq65w=;
        b=Y42SlOJJWGP3xnpOGAVwIICosB4oWK1xlUmEjZYlgdx2O8I5QA0hBxRm8JIeOvVM/H
         tat1R3HQeO/Qc2tAfynxpwBnDHjAkHiYe4mtGcLVteUHCLBRqSnQhvq4IuzBjc7mkK5x
         tRwF2KYxxXY5WkDzaE8hRrhafVyRYSasNXS9lxAC+v3dxkUoXkT0SB6DfdSAEfVjXl0d
         9FVVg6K4jPEO5+Ic5ejFR4jmTspwcDa8b7g3jrM+Hs1iMDnCa93N0lBCYHRSL40+FBFh
         kgmQiWqCHN5PjsiOxB4YEZZj2kTUmVTefRiOP0ODTq/9CEyozfAwGmQ7Fixj+YAbXl3Q
         3N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293323; x=1701898123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w98h2S9ziwqYlZ5eRbk63Kp1zoQv2lCTleH6DrVq65w=;
        b=A7Qn6pAzJterBe9SlTuw94tIqeDseFPpm1L0xGvSMLxGvWZIYXInekgpUQO8/ezZaM
         N0Pu5IxiT2wl2blM/lkqhru5SJIBVVK2PT5iA/5eW+SFvg6zqZmWGKM9wbzSSgQFVG+w
         oGZbfxymNhrbJ/Nt/zPiVXzGTXTQu7bl/f7McsKcS/ZTS98EUUFm7UNlczoQrB1QF44B
         VP8Y4l/Z2lvjBXbHhUb20rMKZCg6FSGYbg3kmCpKHF8WdNVQIe8NAo8aTSKlQqJWCbaR
         whkREWGnbk6rDyNRbtiMBXNQDo3aH0QKAfM6MqrvPeSWfO/ySvSbbM4eq14fAUuWVNrO
         QbGg==
X-Gm-Message-State: AOJu0YwD0UAy2NOc4UqqTq+bn+j9AMB2zwfLiEHbyA296BMQOagSALuW
	CjBwkCYywzIKsVFiU40cQD2jPg==
X-Google-Smtp-Source: 
 AGHT+IEC56sw8UX2ii4LX1W7ed8InaZsSu/jcEIqr13PU5ZEBtax1tJX/hGuJk6YOIA9moirDg3WrA==
X-Received: by 2002:a2e:874b:0:b0:2c9:c58a:b2f4 with SMTP id
 q11-20020a2e874b000000b002c9c58ab2f4mr1049900ljj.41.1701293323490;
        Wed, 29 Nov 2023 13:28:43 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:43 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:38 +0100
Subject: [PATCH 02/10] ASoC: cs35l33: Fix GPIO name and drop legacy include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-2-31aa74425ff8@linaro.org>
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
Message-ID-Hash: TKMBMR7D5CDB6G2MY6V72BZBLJOTBYFZ
X-Message-ID-Hash: TKMBMR7D5CDB6G2MY6V72BZBLJOTBYFZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKMBMR7D5CDB6G2MY6V72BZBLJOTBYFZ/>
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

Fixes: 3333cb7187b9 ("ASoC: cs35l33: Initial commit of the cs35l33 CODEC driver.")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l33.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 4010a2d33a33..a19a2bafb37c 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -22,13 +22,11 @@
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <sound/cs35l33.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
 
 #include "cs35l33.h"
@@ -1165,7 +1163,7 @@ static int cs35l33_i2c_probe(struct i2c_client *i2c_client)
 
 	/* We could issue !RST or skip it based on AMP topology */
 	cs35l33->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-			"reset-gpios", GPIOD_OUT_HIGH);
+			"reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(cs35l33->reset_gpio)) {
 		dev_err(&i2c_client->dev, "%s ERROR: Can't get reset GPIO\n",
 			__func__);

-- 
2.34.1


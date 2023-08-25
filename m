Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052A97881D9
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 10:15:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D03950;
	Fri, 25 Aug 2023 10:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D03950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692951319;
	bh=hqqvnfLqs7/1M4mT2xT+hGNk+Y0q7axiK7nmjfTmXZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QV7QwHVuhxkkvHggGDplfALLn1S30KgRJHkOQvvfg0gLJu2FnzWYC7Df+bjkcu0uL
	 oV5DJPRtNalkKAvHEjGZftRVpfVZ0zPXl5pM+3MjDy8HAEdZP13hDsmkWentKNDu03
	 96+xQuvWhBG0Vb6yRR+tyjfm9q475mDR0bBo0m/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6646F805C2; Fri, 25 Aug 2023 10:12:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 046FCF805BE;
	Fri, 25 Aug 2023 10:12:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A504F80563; Fri, 25 Aug 2023 10:12:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6E86F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 10:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6E86F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eFQD4cq8
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-500a8b2b73eso467659e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692951138; x=1693555938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44JIVg8xfT/EISToMUTEvN6PJWh2bmWBrdxrTpht5uo=;
        b=eFQD4cq8n2Fct8am3VeuEldkXRZ1tKBntwqnqD83Ex1Nr4ejqLxsjn7wE4+qyoKqKQ
         sVq0njntmTxoUdnoBWXC/4s+dCmMoE1cBOKu3QouzqfEJhaXa8ZCcBjYXWYI395Oor7R
         +hfvzByRJWEJGlkHOCaPtGggPLdnU2tvqLZS6fkeuOV4Kvc8Co+GB1fqqfydPWBYsfNC
         FEZZvAkN4PHfmxWWRgWzbEo0pHyn1XHZDXeTUSyHlUNBAn88ysXgTs32FDJEqsGRJAO7
         kUMjWAkuXkUXM9Xcaz31hMYrJD/BMgNLztCapcSVPnuWja8QEQ8oDy1UzjIJmF+lu3xV
         kZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951138; x=1693555938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44JIVg8xfT/EISToMUTEvN6PJWh2bmWBrdxrTpht5uo=;
        b=hQLLYsxSKetgBn8o8CArPmg3LFSllUfcWpAW40QZwwAR3KH8C11Jj+y0Rb7r59Orlc
         G8LJx2ZgrnWTfIKW3VgoJozBp4xwXPGUSa9MGaI/5mAPYnkq1tsZnKpP2nSexwlsb78/
         cmwdL6OBjP7dpKbNFn/AoXexKaB3urtPlpPjsgHPM2ALQ0FtqvZm8CozfB+QKKDdtnur
         tpCsEbD2C+oFI60etgDmOk0zOvsG8m6aNGZUbtAlmmPSP59bn+B6iwKJb1NYTUtuFuAm
         CPX9hhe7ZvTYWb7u1a28kceAo8KHzpbsigUwaCJVHjHjZiQYZxOgJXAPhQ5TmYpCTZQl
         s25Q==
X-Gm-Message-State: AOJu0YxBsScPUT1avTnZIpq8BEMkIGAZt3zAOAKwhNWp0j/4yjv5dluS
	tuUm0uOWhoQhMe3/r+D4TdkpKg==
X-Google-Smtp-Source: 
 AGHT+IEodFZz3bqeeFdOiK7hMl+uUlbSgt9vuSKj8ccHrNjvWe6heS8Ntxi3tANPFEcCQKm5bqj6mw==
X-Received: by 2002:a05:6512:e99:b0:500:7de4:300e with SMTP id
 bi25-20020a0565120e9900b005007de4300emr13571895lfb.58.1692951138141;
        Fri, 25 Aug 2023 01:12:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 q28-20020ac2511c000000b004fe1a35fd15sm195559lfb.140.2023.08.25.01.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:12:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Aug 2023 10:12:16 +0200
Subject: [PATCH 6/7] ASoC: max98520: Drop pointless includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-descriptors-asoc-max-v1-6-b212292b2f08@linaro.org>
References: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
In-Reply-To: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: Q7V5YEVT2XDQGBULZKRQBULUFYUNTJMW
X-Message-ID-Hash: Q7V5YEVT2XDQGBULZKRQBULUFYUNTJMW
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7V5YEVT2XDQGBULZKRQBULUFYUNTJMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver is already using solely GPIO descriptors and
do not need to include the legacy headers <linux/gpio.h>
or <linux/of_gpio.h>. Drop them.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/max98520.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 8637fff307ad..edd05253d37c 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -11,10 +11,8 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98520.h"
 

-- 
2.34.1


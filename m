Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D41F877A22A
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE5984D;
	Sat, 12 Aug 2023 22:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE5984D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870550;
	bh=zSH43z9geE4qudCZxUaBew4oERYt1HsWtoEnxYoQ05w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DxfY5p+Diwbp0FEDNPCsgeCuGqTh+uRKvwVCl93eYFYCtIKfRAEqZNdN4vQSZ08FO
	 CJslNxY/xgS+bA+XvDYfZxZDScNHlKwypK+ODHZruYyyAKi3HbqLLlWQXihy1IbSjZ
	 lZJK/QCKLQeoeivqbvCJyEcf85VIvcVc2xwSUw2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89F1DF805D2; Sat, 12 Aug 2023 22:00:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4E52F805C3;
	Sat, 12 Aug 2023 21:59:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18205F80166; Sat, 12 Aug 2023 21:57:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DAAFF80557
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DAAFF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=z7WObcqh
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe11652b64so4779251e87.0
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870221; x=1692475021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXJricpF9lgZYw/3PpheO5mxmeogEd16fIt7MiNI/NQ=;
        b=z7WObcqhaUUYnsE8xahVgD98J2aj80IxasZ3ztQhTJDPQ8cwcDRx6MBjNddj20RH+N
         M2mjJm+lPvW5V7n0BmVI2gDyTIenZ7eYIXV3CWLAblyAKs8EUbIsVoZvil0SdZ99tYto
         f9kzQqfb/zwtoE7KxsqeIzjN1WcYoI4+6/CL5mI6jrySGpXO3hZdA1fjbr4hF9pHwyrY
         DsDdKTHcmIcx0CwhFV6281I6vzQbzWIpWnlDy3i3mwbPBN4yD5mTY6o3cJBKgJL4LoJ6
         +o1vVSJGRD0f7PqAvtrY9f7bT7bP8pM/lUlT8s4eSenBOf202zFbU3jK9xPiCC/ty9Kq
         Vc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870221; x=1692475021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXJricpF9lgZYw/3PpheO5mxmeogEd16fIt7MiNI/NQ=;
        b=ddVCZK2mOsGFQGAib9RiJ1t55EDYL2MKRCGv5gSthARXRrpdPvoR11vJDRe2H52eFG
         DnEOltpQwVSlPvxAOulIwHZOQ5bD42T86OiqdkYxdYfk2SAs4AYGJIfQODU+eA/0uSie
         iXFxXqExp7GSL2SGQM5TzzlBO3m77uCKyEAwQP7Fx4yIzJyzyd5+jV18YFeSU92lNTBp
         9ZPTn7H4RYvWA3oij4TlmK7sNjyCOs6YB9BDsj9jT6Z4GGtbdXRlmYlID6zqj2FyKPtU
         R4tHUp/UOZiiJrThdoUiPmzAdnPgww4c00xT2yQ0CrM1iUPR4KXpOhfJyfc8S5ZECz8G
         drEA==
X-Gm-Message-State: AOJu0YyNsWDmX3+5T5xWrokKjrKgoWXqxYHwxesE1kmqRXimqDnBUVlP
	kCp6StCTowTgnutZ8r2Gd9HHqg==
X-Google-Smtp-Source: 
 AGHT+IFscEEhpL8UYOTZOQUNTJ8UbRNpv1oL7Zrr5J2dIsX9lXyKoBIqNP2YwNFObaLML+VxpDPLrQ==
X-Received: by 2002:a05:6512:10d5:b0:4f8:6dfd:faa0 with SMTP id
 k21-20020a05651210d500b004f86dfdfaa0mr4323785lfg.2.1691870221177;
        Sat, 12 Aug 2023 12:57:01 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:57:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:50 +0200
Subject: [PATCH 12/14] ASoC: rt5660: Drop GPIO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-12-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: UIVYDXQHXOABGNIJFSYLMCRL6LWU3IBA
X-Message-ID-Hash: UIVYDXQHXOABGNIJFSYLMCRL6LWU3IBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UIVYDXQHXOABGNIJFSYLMCRL6LWU3IBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver include two GPIO legacy headers yet doesn't use
symbols from any of them. Drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt5660.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index eade087b2d8b..0cecfd602415 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -11,11 +11,9 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/acpi.h>

-- 
2.34.1


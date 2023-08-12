Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF71277A22B
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:02:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 051D686E;
	Sat, 12 Aug 2023 22:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 051D686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870568;
	bh=MClJb1o/W6E9q+JFRfGfdJ7WMaiArNFXWTt8Xzhy1GY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=teSBE3+POP57rP9ofJV9tNAwBJVxi0bm6Iadr9JLlW5nkkeVZ7is1wKfwqfuKxfHt
	 nY0lxRt54USpmimligp8X18JBmJAGgs2B+uuD8PKvqNPRn/VGhzDT3kzQAQ+rl1IHe
	 Q/BUsQPADSr0U/UkSu10Qpu0eK8Pm9KaZFUsAKIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35BDBF805E6; Sat, 12 Aug 2023 22:00:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93BFEF805D6;
	Sat, 12 Aug 2023 22:00:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF553F80166; Sat, 12 Aug 2023 21:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BCB1F800EE
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BCB1F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CAjovOC9
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9e6cc93c6so46613611fa.2
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870208; x=1692475008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcTJEbiNL31Kvz83mrddFrf0wFvjK1FO1pL9qlAeK+U=;
        b=CAjovOC9bYNxcVXg6vLLlP9DnYLniTfkOSqcP4cRfXl8tILamlaYAZxscJYs8xDQyx
         EQ+FojQBauAr6ZN/0uOr5KyL3yp8dekipMn0uhaG9SEnfW9Zl6FvF86g01Lntil+SDmD
         ppwupHENJdqCyMx6E2sONuiXp3GIJhSB0OQYtw9T4Ua6IS+kNU6clvK0LnZMEZ1fHU/u
         W5rxWkKGl+o+u7zqz2WppiMr8CxXvuWHvbFCF/DKTV7dXvryVdSB/VSesHRuO7m3TTsO
         OcuZbbALB4GHGIfgxkrDjGP4Jd2EUKJY7yyaFh2TYX1vUeCq/VEOA5Qp2+4JgnmM/AjF
         t+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870208; x=1692475008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcTJEbiNL31Kvz83mrddFrf0wFvjK1FO1pL9qlAeK+U=;
        b=TGQY3Qh0baWYuTP+/3HTjWN4b7l4EYREo2XJm3KF1OQqlNtw0qykAuZIdIHLpSb6r8
         Kih1Veffgf1J+Be34vN4KmRP/s3MNkoyoW5+R4fHT4A7n93ecWCHpU5S0DOgXRaV1Q+x
         3jOOxKqENkNg8naTkT0p6csqx3zN95+AYEHrslbihdaJE/hCE8KS1i34FaQwc0WxahjW
         UkdwIdiLvAe53vNcOqaaMzloBN5XitzCuozvquutQhlLLtdy7iB+1s/PlMNJhX6UoCcy
         D86jX4pmmpHF6y3CBmJDFb6p1237Y8AXraMuXdc5JPDBZ490+Ue8zrj5HVaFkqc9WDRB
         ePlQ==
X-Gm-Message-State: AOJu0YwtfQNr89y/xvYicwCQllFvTbXjGWkCeSqcWidv8z9m+HFFlMRd
	Vzh3FJ/CQsdoRz2pSQjMjYNiEQ==
X-Google-Smtp-Source: 
 AGHT+IG8zbXQcaUnsdPhVNyOvip0dIQcP4gsychvQyNQbwHdKdXk+CZ0L2sStXi89aGEVcFe8d3Ylw==
X-Received: by 2002:a05:6512:3246:b0:4fd:cc8c:54e5 with SMTP id
 c6-20020a056512324600b004fdcc8c54e5mr3202419lfr.41.1691870208282;
        Sat, 12 Aug 2023 12:56:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:39 +0200
Subject: [PATCH 01/14] ASoC: rt1011: Drop GPIO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-1-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 6EULSI5AR27ROZWJLIWAPSNHER45N3ZO
X-Message-ID-Hash: 6EULSI5AR27ROZWJLIWAPSNHER45N3ZO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6EULSI5AR27ROZWJLIWAPSNHER45N3ZO/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver include two GPIO legacy headers yet doesn't use
symbols from any of them. Drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt1011.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 42bac8150f62..d5285baad53a 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -13,11 +13,9 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/regmap.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/firmware.h>
 #include <sound/core.h>

-- 
2.34.1


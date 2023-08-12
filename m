Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42C77A223
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F03485D;
	Sat, 12 Aug 2023 21:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F03485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870442;
	bh=02MonCRCedJ6JwURBSpc4o1EcxSm1YaZ4GAIrVG7X3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dIkGm9jyGwM1W1G26wDv1K+TqTTWwd+PSV0ADHvQ92zafFKmJ8Kgiz5LvWbNelT8o
	 oZuJMrXo7kJB9zHe7cqmO6Jp0dP7DjF0ozCdZQO4q7bygSn46+h1H3dE5SVyAe25gU
	 /G7B2l9v0X1xWSeqLLjV9QVNlsqJz6UxtVkv7R/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32D52F8057C; Sat, 12 Aug 2023 21:59:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADF6EF801EB;
	Sat, 12 Aug 2023 21:59:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AC53F800F4; Sat, 12 Aug 2023 21:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68C00F800F4
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68C00F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NuDbDoFG
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe8c3b5ca0so4920455e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870215; x=1692475015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLDeZOsLJKjn9AG9yyMWHhzn7rsfeUIcb3x8lRgRJjg=;
        b=NuDbDoFGMwAupOzzOwDSE7XO6MV5ks7/jJmz03kLwZKJvxZTHbOE2kv7ttukvup37C
         j5boTJDScuyTSSNb2eAbjXZ7zbHBpsdBy8p6vyBT5KXaHOoqb1CmOaRD7cc2Z7oqwfJh
         mMsVk3DePxb5995uIdoqWG2v+BBYMMwR3cDELqulJAUGSp1GkzkTEWZ/gwIqsPiB0b6g
         U/fUQcWy0JDmY790Rilr+JI8vvKJkxpGh65EZdSEWd4sCiNYbcNBbebT6zi+0VX1/Ugb
         RCbwwNW4PPpGP4v8Xrf3IoK3lARQiTRWNf96iz2UOqm5s4iIF+2Pe7MuOuScjHy38tH0
         wwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870215; x=1692475015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLDeZOsLJKjn9AG9yyMWHhzn7rsfeUIcb3x8lRgRJjg=;
        b=O1+cx9XN7mIXBB18x/jauUMQ5JE+zujTWihBOeUUSWsQuvgPbWiPkaHwhkfvb5dq08
         BEmnjiyjF7wW9snXVduoO/EBT8s2nkpgi8HiPVK+Qs+wz7FcVrmIAZP7wpBQHQSF/BHf
         MjX9EoO05tZZLtgpuEC8niV1g+2iDh0ZgAcL8gpjIs3BeClCVjhYjRveB4jVcDkob0Ju
         y7m0i+hYFq0oVhjWPT5QvAbo2FB2iyie2A3a31K3xoJYw0bUVEC0LBFMIt0tOMyQkosE
         tyZPYAOiD+v223J8wjKyQ1TWpjWLkJ1K0Z9fUEZzz/eWXs/m+qykoZ0i0xOSD8hZ1M6m
         r8vg==
X-Gm-Message-State: AOJu0YxHBwd7Ymb3hYNj/1/SGOzfaTOVczTaw2OoNvFknnFUi2YrBKqQ
	fs1r7cM5onT6RuuyxsDqsMX/2Q==
X-Google-Smtp-Source: 
 AGHT+IG0gOadfyEHAHfLkjda7UNNoPUl5kjpZWfu4gyX0g5WIbk0RROX7Qqgidf6FZtyFsvoylECgA==
X-Received: by 2002:ac2:5e2f:0:b0:4fb:8bfd:32e4 with SMTP id
 o15-20020ac25e2f000000b004fb8bfd32e4mr3099876lfg.13.1691870215470;
        Sat, 12 Aug 2023 12:56:55 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:54 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:45 +0200
Subject: [PATCH 07/14] ASoC: rt1308: Drop GPIO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-7-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: VUPSRC5JFHAN6HW7AEUBPQSYK233UGQB
X-Message-ID-Hash: VUPSRC5JFHAN6HW7AEUBPQSYK233UGQB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUPSRC5JFHAN6HW7AEUBPQSYK233UGQB/>
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
 sound/soc/codecs/rt1308.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index 9d07756cda40..86afb429d423 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -11,10 +11,8 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
-#include <linux/of_gpio.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/firmware.h>

-- 
2.34.1


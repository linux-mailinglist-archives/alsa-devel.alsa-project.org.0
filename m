Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B336177A21B
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 406F184C;
	Sat, 12 Aug 2023 21:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 406F184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870439;
	bh=bDAsUgOAzO7rPPQ0He1q23/uoTAIQT6kPNF87aJ5PMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YhijtN1UhfgS9EY4kHVvT/7NTWQUG+9UjtaeUR+dFMGNFM8ltSNpI7DLMzzsQQchL
	 r1oHj+CBfwiMsAQIrA5+9CKubNU8SNpLV0Cbg2I0EMd0NQJJYQgj7HTJD4PokyDwcD
	 Ne2mo38qE8ZLji9lgcxYz3YuBp1HJ5uwkhY8YMUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39B59F8055A; Sat, 12 Aug 2023 21:59:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E12CF80510;
	Sat, 12 Aug 2023 21:59:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11BE5F80558; Sat, 12 Aug 2023 21:57:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C61CF80166
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C61CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yyIRu+Vl
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe2de785e7so4901659e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870214; x=1692475014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljcwz63QBt82/HDrqpWWycZs9ottLR07mV0FHtlMMVU=;
        b=yyIRu+VluWw+d+IfRjGZ2vbpWCWnk8dfq+mtcZfA3kUAoTul9P4sO4N1fe3lUhVTl4
         k5I6E5fiGEaLgL6KljX6uIDsI6w+qkvsqHZ19pimJOMHB8T1AbhnrPkzSQTuncp6kZUL
         SnHe0s+5wh/cqecUG57KDXmxZe80alNjmEsBW75vzDK/6q+2BWpUoL9wPX6RjtYhI/ud
         XUa2t8acOP+0Lj02e+DpRPy1gRuAZqF9Ufy48qUaIMUhX9rz9aispjyDi91ivp9fiDlN
         M4CWpXmhCpOrJ2bIOY9wYBKeg9G7pC8vrDto4PVDkSkKIoRixbmecYUxgW7vGsXViPtO
         VyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870214; x=1692475014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljcwz63QBt82/HDrqpWWycZs9ottLR07mV0FHtlMMVU=;
        b=N7LVmHt94VGFI7OAxhDi6jWqAQCOyyRbmkEepQrXcpturNCdLpd2s3PX8UOnBTmtpT
         DYjfWjQsPd2Tiimv0/+THtHhO+ACseJCpq9MlKSr4zJM7utcg+hmGjEXuFmQguuG1U+H
         wbx7DWIHpkYm8S9ljYxDL5zOibjEQqINLnVUYLG16fsTPuRs1QWjjIIfBu5MkTADRQCy
         pJJ295M1SQnVczkW2xCrHaVimFO0Yu2YQywwTVGWfUBBFPi/fhu5UfSGYevjlSlMdlyP
         pO4ozcmlrhwieFLqUka5TU9ZVB9g/TFmyZjpqiaYr6V+WTY2hAOOm+YjQiRQNMAlpCEV
         fCjQ==
X-Gm-Message-State: AOJu0YwFFoU95G/5BTbAmBdbyIH5Z9VFHrMW0UmBE5bHScBIxeNh5FBj
	AGd584L60qw+mmhZo0AWIwGM/w==
X-Google-Smtp-Source: 
 AGHT+IE/oG/6CUyoTG47PFAP+Byygh/pQjt6QyQqGvxBE5CNJa7bSz6ljzf9J1J21Us2eh6Bzq3XDA==
X-Received: by 2002:a05:6512:360a:b0:4f8:8be4:8a82 with SMTP id
 f10-20020a056512360a00b004f88be48a82mr3224264lfs.22.1691870214420;
        Sat, 12 Aug 2023 12:56:54 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:44 +0200
Subject: [PATCH 06/14] ASoC: rt1305: Drop GPIO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-6-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: IRD7CVNOGM4Y2MA3NXMTGRIDODUHWG6Z
X-Message-ID-Hash: IRD7CVNOGM4Y2MA3NXMTGRIDODUHWG6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRD7CVNOGM4Y2MA3NXMTGRIDODUHWG6Z/>
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
 sound/soc/codecs/rt1305.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 59895131e6e0..80888cbcf49c 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -12,10 +12,8 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/acpi.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/firmware.h>
 #include <sound/core.h>

-- 
2.34.1


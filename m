Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D74327881DB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 10:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04FCCAEA;
	Fri, 25 Aug 2023 10:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04FCCAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692951341;
	bh=FSlYlj1KG0nji8kkC1b1nGClknPc1v0yc/Fc3a1Sl20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Oory0GH2qrHb2HIlPrPnYmboQCHLl6RsVteRCZpbS8xXkl+VKQMlNAGBgyfdtxhyi
	 R4H3xIoWhCUnmSHqIoY4s8Ia19+SlbnOjI8tCitOoFnLrQgz0WhYk89vN8XN0gfP7F
	 Dua4YL3AdxEx8zQcVFoxpluL1Qa8wF+l7WySNQPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1640F805BF; Fri, 25 Aug 2023 10:12:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A67D8F805C8;
	Fri, 25 Aug 2023 10:12:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFDE2F8023B; Fri, 25 Aug 2023 10:12:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 72B32F80158
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 10:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72B32F80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=N8tOQE1+
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so959043e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692951139; x=1693555939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoFqFLIfT/Pj/zYgo2TV8TIm3I2iaBuNZRSIlIfashI=;
        b=N8tOQE1+ggrtynhDr3biXEZNw1zz5cY70hzKKCVyFf+IMR1yXAXthVrO/VesE5LNY6
         ZFTe+aebePO3TMPyUdOZVEzyfSEQc3DteeWzMyV2gwsGhB8kOMWjjZYb6Wf5JEfx1+lz
         8TsDpUMI2g2nGjoUR29rC0agQh6w0db6a1QcHGvJg887QaBWx2t8czqalAywY0CXoOwg
         40YCYGtu37bDDcAr4YtLIVR4Jy5MjaA0st0MTxF+h46IeoWNobjmX37+IvsTNDHZ9mjk
         M9aHhdvbtyHYBSZ+6mVz7bXGNAl4LlIbJ/3sigo6Emyc+iCyMEDtEpqqG2rHBisr8V3F
         5fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951139; x=1693555939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoFqFLIfT/Pj/zYgo2TV8TIm3I2iaBuNZRSIlIfashI=;
        b=Z/ItYUnlPwczz2dFk4+3RCEXIb8zVhZzxex1XDT826W8UJ87DO2pzIvSbX7QfO+UBc
         enGm60MBnN3hRZU5Vpw955OSLLfuuMI1AkIU/l/49Co1YvIHVaNB0cwbo0e2w0xx4+ck
         suSgHn+iaRDy46fMwNyvH4cmk/a946Brlm5NJ6FjKqPNV3J093S6BrV5J+8xUUwnNLr2
         bH6S4VRLjudwUFMvVK/K7UtIC1tklk3ygc3Y/d70UOHdntwhJWbbFWc7tcOYG8XHcuXs
         zqwTv3OB3gf7Tr2llbmakm9i5VN5+Btq654fKQF3fcQL16s1FjjyjD671dTksb3FRQuQ
         KabQ==
X-Gm-Message-State: AOJu0YyKk1C7uPJJmNpyYuEBzCHiXTZhydhV2lRdh1VpWyskmqpcGQ8q
	iqIpWsOiW8WC6swgHfW1vGCnQg==
X-Google-Smtp-Source: 
 AGHT+IEjrTALuwMVuRJO/f49NCeBOByJE1JiQEqP9VZfv9t+k1WQ0Gs+avCqvnzSr9p3zL8bSAc/pA==
X-Received: by 2002:a05:6512:3450:b0:4fb:99d9:6ba2 with SMTP id
 j16-20020a056512345000b004fb99d96ba2mr10022257lfr.24.1692951139010;
        Fri, 25 Aug 2023 01:12:19 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 q28-20020ac2511c000000b004fe1a35fd15sm195559lfb.140.2023.08.25.01.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:12:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Aug 2023 10:12:17 +0200
Subject: [PATCH 7/7] ASoC: max98927: Drop pointless includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-descriptors-asoc-max-v1-7-b212292b2f08@linaro.org>
References: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
In-Reply-To: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: K6NI3PNSBJCIRUH7J5YK7CTRA2PEBPXI
X-Message-ID-Hash: K6NI3PNSBJCIRUH7J5YK7CTRA2PEBPXI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6NI3PNSBJCIRUH7J5YK7CTRA2PEBPXI/>
List-Archive: <>
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
 sound/soc/codecs/max98927.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 776f23d38ac5..70db9d3ff5a5 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -15,9 +15,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98927.h"
 

-- 
2.34.1


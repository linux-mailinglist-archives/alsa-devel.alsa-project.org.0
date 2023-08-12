Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0077A21A
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:00:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1675208;
	Sat, 12 Aug 2023 21:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1675208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870435;
	bh=mgIIfTSklzzf8nF+zaunb2qVUGeQiDclfxHsfshWz0M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WhypiXkvSof5K6tUmNkKiWeB1W9jcZKYfPcADmtBxFEPM4WA5eThi2HOQdMjhCVAV
	 hcaz05Gig+9dNG0M89s8ohT/HYf9HdMznWMDRxa+3iksOe50Zg6aTm2JuCMFIC//zz
	 IcDm7d5V2V2kLAZ5uAzCsRhXK66G2OFk1YQErunI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86C65F80134; Sat, 12 Aug 2023 21:59:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB80AF80134;
	Sat, 12 Aug 2023 21:59:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53744F80553; Sat, 12 Aug 2023 21:57:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C32F5F8016E
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C32F5F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fnUqqzpS
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe4f5290daso4799406e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870210; x=1692475010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiL5v7jj8mIZHkZU95wy2FCQioY2BGnV8JkGSJ5FZHY=;
        b=fnUqqzpSgxz2XvCuCH7qhwxuGA5n8G3u2XVHZyQX03Ulyn4REbrnYu/nPq9Z7ZjoLV
         bNw86NL8b3HdkVsYAKtnomXE/oHfRclFkzkEeioLLn+kCab7eV0ehN7FuL37S3bGsOVx
         Q3GxuaLpSNXAe9HyBwLUClsyHGK67MLec4STexyWy2qiC6gfp87ZekTDG/Z9aT7jrzxm
         +iJxo4ykG1mCOn8O3g9eTGk4t9aOZNnMqOnF3rQXWDUg+W9SWyyqZZ6PnnciTy4Jle7S
         FO5kovtS2sykrGmEsArfleBFQo2Zo+zo7U//npth3aeqoPH4mTd/0+6PinONYCzwWudT
         3FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870210; x=1692475010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiL5v7jj8mIZHkZU95wy2FCQioY2BGnV8JkGSJ5FZHY=;
        b=EwtURZwt4B1slXCYnGLMgyYUh3P2Vr8U1+J93iKePRem+aUVJ25quov++GBIyD28it
         hl1fF8W79WgFp51gJP74XxaSQR6hn2MiPXEKAdjtCYRlgbvlvCNs+GDyX3is6djNnfuz
         ByP9iIYrROfyYRbYREjFbUOOFOub9uX/HhYk7A3rjMk3YH69B6BSigQoh6/BBSRVqMM6
         pzN3BaVPzzSjGnFx57Z/vIKWRDEB14F4y5uQotMixFCr/+inkPNFtkum/RUDjuxTNdOA
         1lFTdb9Lccm8UtQZzXpNl30pnTIF+sbMZYCIQRofZ9sXVlfMDYjtDXF717AwhRHk8Th1
         734A==
X-Gm-Message-State: AOJu0Yxvza0OkLc//8SFzIo7VXiaFrfkzHigPprUlfzrxw1DXyw1umZd
	IXw0uBa8twI2gu5UP0ZyyJMiow==
X-Google-Smtp-Source: 
 AGHT+IHzE5b7z+cG6l3X4BVKnk4QzhVZesjM+1wIJSE+4AXnSwDN4H4WxEVfqruYL3qx4o6sKdybxA==
X-Received: by 2002:a05:6512:20c5:b0:4fe:ef9:c8d0 with SMTP id
 u5-20020a05651220c500b004fe0ef9c8d0mr3559460lfr.35.1691870210722;
        Sat, 12 Aug 2023 12:56:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:41 +0200
Subject: [PATCH 03/14] ASoC: rt1015p: Drop legacy GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-3-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: KLLYG5BBJ2SA653ABSO4RW6M4MQNPHQO
X-Message-ID-Hash: KLLYG5BBJ2SA653ABSO4RW6M4MQNPHQO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLLYG5BBJ2SA653ABSO4RW6M4MQNPHQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver include the GPIO legacy header <linux/gpio.h> yet
doesn't use symbols from it. It is using the new consumer
include <linux/gpio/consumer.h> already. Drop the surplus
include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt1015p.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
index 06800dad8798..44e7fe3c32da 100644
--- a/sound/soc/codecs/rt1015p.c
+++ b/sound/soc/codecs/rt1015p.c
@@ -8,7 +8,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/module.h>

-- 
2.34.1


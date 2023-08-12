Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7DB77A234
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D96DB847;
	Sat, 12 Aug 2023 22:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D96DB847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870619;
	bh=KEz1GyS46IXCMORHjTec/BPNBeBgYaYLwrefT4w20h0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UcJmMUJ9l4BeO20Jv+kVUoOyW8d/0eG/GeJxJr1c8sydq+W16B38bTojf/TjiiNTJ
	 nlrbhXDRawVF0o3d5CxtEsPrRiifSzlLzl9pKaTT+6GulX9YG9qh10gvLIG0hkTqHi
	 S7MJli1mFnZUhe2NahoZgTHqPJ5xcrWJH2jmahk0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B298F805FD; Sat, 12 Aug 2023 22:00:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30049F805EF;
	Sat, 12 Aug 2023 22:00:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A15BF80510; Sat, 12 Aug 2023 21:59:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B16AEF80552
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B16AEF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y6B04XcW
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe58faa5cfso4806071e87.3
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870220; x=1692475020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vz4oZLX7aphcgmxSItSZXEOAiLbMHclJfp0/mh5VAk=;
        b=Y6B04XcWZaqYabmSmq2xh2EYwqjQkG/gc5IcFlRrNqjbSYtqaOkF3pdmJLjqIDq7qr
         XcN/LvAY85IekgHH9xgHj3oJc6fOnwkxRdGtC/joDct1j24UiocfkJIwI2+He6xbtg6f
         J7+re20ypMF+erb/4oi0VT3h3G0PD7HbCb4Aq3df+I7JqGnUO45k7HoP/lK8ymLSMjah
         7HXXGj+kwb2Nyy1uMhlgCB0QJ8reADEm3I8jPIghqvCQw8ToD+d5Ny9jui0/QoQ6i2Cn
         giX7vG4fcDXENsuHbUY3jwjO8FCqLgYIfy4YSrsoyR2/dphxmJTjI6GrcYPtHM2Zj39S
         B53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870220; x=1692475020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vz4oZLX7aphcgmxSItSZXEOAiLbMHclJfp0/mh5VAk=;
        b=T2dGC2OYmHJbmdO+B0g8p2Md8OnwRYXXRbLQZM0RMMN1XjJTDpUAvc9B0PRbTgCPEC
         DpaT6E9yeG4nwRXqTpR0NqQCfLQDvP7r6DTNa05kx6XApp3gg+t2FvDaWz17HqP//Rj0
         Udq+bCbqfrGicVyBSRg1w7Vf3i7WKCEJxjS5v/cDR1ICJ0aqEcAB0kZmJx3Amfv92t0q
         AYol+mPfiNR1j4w8xQcg7pIz2EH7/c3R8OG98cZcnS0tjPL/liBTGPaA18QB/hQ8VH5B
         v+HG5YqqE05BWo4TNyqKYlaBxwMVkG6CZ3HXjpwdI1A735CrO5PTjFa8kHDFrdUIdRsv
         nD9w==
X-Gm-Message-State: AOJu0YymzOwML/tjtrajNXQypoir/ten+d5L52ra77CTSE1JLb8fR9QH
	oMuj196vuIklnW+ndbu0h4irmg==
X-Google-Smtp-Source: 
 AGHT+IG3pLCSb6mncPYmIU/Atnw7rF/zG/h9pPTjY7T/XsmK4zV9HC7UoEK92XLXTIQU7FoMmFVCcw==
X-Received: by 2002:ac2:4e08:0:b0:4fe:551:3d3c with SMTP id
 e8-20020ac24e08000000b004fe05513d3cmr5161643lfr.36.1691870220053;
        Sat, 12 Aug 2023 12:57:00 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:49 +0200
Subject: [PATCH 11/14] ASoC: rt5659: Drop legacy GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-11-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: EISWBBJ7DRKGINC4JJVFDQHS7THY4ZUA
X-Message-ID-Hash: EISWBBJ7DRKGINC4JJVFDQHS7THY4ZUA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EISWBBJ7DRKGINC4JJVFDQHS7THY4ZUA/>
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
 sound/soc/codecs/rt5659.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index df6f0d769bbd..a061028a16d8 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -16,7 +16,6 @@
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/acpi.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <sound/core.h>
 #include <sound/pcm.h>

-- 
2.34.1


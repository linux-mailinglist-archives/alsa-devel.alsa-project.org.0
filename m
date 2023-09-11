Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EC079A5FC
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872B5AE8;
	Mon, 11 Sep 2023 10:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872B5AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420769;
	bh=ajLjAoKS5LYhzLyFaGqTcrQB5QlpO9TiPVOmXYFaxHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FMI3bXLyDKYIR1AaGNNIyxphY85P8tac2Vcm3FFIlxxzKwg1wzM3HUQOGGVOvGU4r
	 LsDAtPeOFatocJlEpxjaHvgL4qwHPKOq7e7kBBugSuSuDymAVExcmQY5Rs0GLdpkqz
	 IBMXLARWifJBOKHh4pcSbDSyhDpswYTw1P5LhLHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A4C8F8058C; Mon, 11 Sep 2023 10:24:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAFFCF80587;
	Mon, 11 Sep 2023 10:24:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91442F8047D; Mon, 11 Sep 2023 10:24:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 47DAEF8047D
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:23:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47DAEF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iconYEok
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-501bef6e0d3so6836928e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420633; x=1695025433;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZvQIqiJILx7Vu44bdAP6xXOlwSKHGpCyi7z1wxsqaw=;
        b=iconYEokDaHrwToh3SfEOtxLgSf2JHKfPRzXH/wU8D+GpUbNkSmEIxhNzT4y+RQS1N
         YFaJBmFYvqQPbioHFF+EbcjwsV89J5zDETxiqp42aOZ+9Us8ZVgH/cC8vS9t+4YdC4Na
         isgARE0JprDA+9cpaaXzRACr5R++pHLIo7xjCVhaUWK0zr5cyQQhKzOwxG3Miamt7vwu
         Fo3PPdiirI48DSvkfhoMKZyP1uij4AyeDL9xpYTEPpQqvWelqYPZoV9Y1WI2+dzdVpZF
         Rb4+FInBDHpgFe2TObgJgbr21s0+yuz/aEIPcMvnNbQe+AAIut4JWGhQUisDLYYbyBSt
         LWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420633; x=1695025433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZvQIqiJILx7Vu44bdAP6xXOlwSKHGpCyi7z1wxsqaw=;
        b=KKeQ88xk3AKi58Aef4JfJ6KXGlCIp1Heemu96cj4dGDzKQ7o5y1r+jvxib3entc5gQ
         fEgxppfcCXeQ9wyUJfsY9YNMgxcAGQhEazj7QPteOfb5JWms0CNhyR7YWPsrvAgdMr53
         kpcTydKkitB0dvmRXQ2f3R9jdWZWNzkAAwbsGp8noxxcwnub9U+uJ9d52XLm+iQiLz8S
         GSYAOFos44uhj90J7afUrv0NJeCHSKhTx6h14eLMJmYI+5lffheVGYQek+/nFk2Vw+Ll
         erQ2iFrhwEX0AnMDkr6RfDgOy5A0xyYDstMoUN3lXqcBDMogZyOaz74zsDknad63BgK+
         sGTg==
X-Gm-Message-State: AOJu0YzllSTM5+qAv4tjSqan9howOFbu8ID2Rfc0MjSLWAwK/EEOwPNP
	r6wYB2Cvv3VGUlrxUkypw2QWsw==
X-Google-Smtp-Source: 
 AGHT+IHLa00uwx18Fzy5EPh4buiYBYfThSk+G9oIq720hxnYrYyiXAOCwPIUdXV/kNi+50d/4ljcyw==
X-Received: by 2002:a19:c505:0:b0:500:b302:3281 with SMTP id
 w5-20020a19c505000000b00500b3023281mr6564384lfe.27.1694420633260;
        Mon, 11 Sep 2023 01:23:53 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a19f808000000b00500968ddca9sm1247712lff.136.2023.09.11.01.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:23:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 10:23:51 +0200
Subject: [PATCH v2 4/7] ASoC: max98388: Correct the includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-descriptors-asoc-max-v2-4-b9d793fb768e@linaro.org>
References: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
In-Reply-To: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 4PZYIOJWK5NMTLZECEKESD656AJSZB4U
X-Message-ID-Hash: 4PZYIOJWK5NMTLZECEKESD656AJSZB4U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PZYIOJWK5NMTLZECEKESD656AJSZB4U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The MAX98388 driver is using the modern GPIO descriptor API
but uses legacy includes. Include the proper <linux/consumer.h>
header instead.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/max98388.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index cde5e85946cb..078adec29312 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -3,12 +3,11 @@
 
 #include <linux/acpi.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>

-- 
2.34.1


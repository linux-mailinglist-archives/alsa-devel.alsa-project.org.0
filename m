Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58607881D2
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 10:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020D0857;
	Fri, 25 Aug 2023 10:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020D0857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692951307;
	bh=ajLjAoKS5LYhzLyFaGqTcrQB5QlpO9TiPVOmXYFaxHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=csLNw3UB2VSzoiJiU2rKNehPtgEM3cATDE+eXGGgzyXDndY5HZT9f5oWAoFVe8eeH
	 e5Uq0a79fXpbutzTNhZ/kGJsKdaCq7kFv0WqWbdGEZ2j6o07AMukpp8KpQYoGMgBxk
	 4VPyG+3mDQZIR+hpM3/vjdI6fU6OSQry6ZKKftJ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 799C5F805B1; Fri, 25 Aug 2023 10:12:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 877C3F805B1;
	Fri, 25 Aug 2023 10:12:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B74DF80567; Fri, 25 Aug 2023 10:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D850AF8022B
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 10:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D850AF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YYmfBumd
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe27849e6aso927773e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 01:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692951136; x=1693555936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZvQIqiJILx7Vu44bdAP6xXOlwSKHGpCyi7z1wxsqaw=;
        b=YYmfBumd1OqmN1kcJfKuQGJb+t6phEs/bHy0wzfEWEPqcBhHzQFEh7HWO5r7zI3KzK
         rlE/o9gkuU4tb4GOeW4HKbUsN4tkJmcv9YMo41BmkTy+9R1GtaXSAsW3wVlwpfWsEaQj
         8pklm/io7r+91riwH1xb5DOgZnUTBIZ0vR8JR1x2dqCZS97VqmBV8Ur1otWfoIshvjrz
         LkVGMccfYQkq52qo+UQfxt4+1PtThFLeIEJhJmU3qzaD2IjQ7a7EB360vPqny0hrF3W0
         /mVzGnGBe1gq8JM9tvtCVn/0J5kT2aFW1S95QT0J17Uq8WsOaG7xNMP2r1qD5UbtS/5r
         Sk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951136; x=1693555936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZvQIqiJILx7Vu44bdAP6xXOlwSKHGpCyi7z1wxsqaw=;
        b=NVBOFJGUcV1wgybNHmJzO2mfrywTFGyYGy1uKaJOvtBKayZV+aCWpaZdqqkEN6RXj5
         QKSZr7dVY76X61o0a5+qFEAosrmcIemiFMMJKpTOrUr3i24qelI15Kkae5FG59TnjAJU
         tlde51wukwJC9WbDVZGKpWX2piBnEdDZ3YAHUPUyITckZPk3xkjsmD32iIzw3NGMvy+I
         4fUQ3yFO1pXtBwgdUKb4OKjJhyDDUSG1J80qihQ2UxPhD+lGWwk7vM77xHuJ2rbHPOQH
         /4ljwpjHrFORngZxsPxOcxzCkelEs1gAW5GJ8aZQJ3zybDAkW6zPNMrOVqUhKGWKfbfG
         DiDw==
X-Gm-Message-State: AOJu0YxA568r88s3ffgkQpc12HDZy7ZN5Fn3mPh46CVAOXxNS58UGJ3i
	hwMSlRHi9c6zaJdraPF5WiUpjg==
X-Google-Smtp-Source: 
 AGHT+IG2PpNK4ugGGs+dTr6KbXE8uHau4dcclyQjik08hXAm1AW/KDfAXQLnuJhnsM+8CSpY83s9Ig==
X-Received: by 2002:a05:6512:32a9:b0:500:a6c1:36f7 with SMTP id
 q9-20020a05651232a900b00500a6c136f7mr1030311lfe.3.1692951136501;
        Fri, 25 Aug 2023 01:12:16 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 q28-20020ac2511c000000b004fe1a35fd15sm195559lfb.140.2023.08.25.01.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:12:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Aug 2023 10:12:14 +0200
Subject: [PATCH 4/7] ASoC: max98388: Correct the includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-descriptors-asoc-max-v1-4-b212292b2f08@linaro.org>
References: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
In-Reply-To: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: M6BL52M4TPIXKHWVAFQYYJZRFBM2BAZK
X-Message-ID-Hash: M6BL52M4TPIXKHWVAFQYYJZRFBM2BAZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6BL52M4TPIXKHWVAFQYYJZRFBM2BAZK/>
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


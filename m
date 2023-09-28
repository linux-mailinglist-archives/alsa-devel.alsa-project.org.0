Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C0D7B2844
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 00:14:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71C2CE0F;
	Fri, 29 Sep 2023 00:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71C2CE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695939296;
	bh=D8YsIbvwKFaGFU37tFCU3Xa5vmJQnpOrgCzxwQMTrDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a4+XKjRjFYc3lgryeR2A+Vkvuq91Gcw8owUSm8fS7CHoMjJeznkYFFSqTURJcOJmP
	 SiadbSXa6ErS3bVx6mzGJ5d6NVvh7/KOJsI3/SXOMeb+gwpaKc5cNOuk/ruayt6VTX
	 5vwkAGj/yC9QiOKolrm+NHTmZU95P1gsCho64TWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E5D0F80587; Fri, 29 Sep 2023 00:13:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E115F80580;
	Fri, 29 Sep 2023 00:13:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EAE1F80549; Fri, 29 Sep 2023 00:13:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8A89F8016A
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 00:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A89F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CpY4mv8b
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50435a9f800so20538692e87.2
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Sep 2023 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939179; x=1696543979;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY0vsjcVCBgE58w9UR6SBm++3xKyQBSwPNYicIzid6s=;
        b=CpY4mv8bMLm+c4C3+JqYn6/oE1/wQ9hbv/J25qFmvXMT1Bay0i6NJ/1Oi7qpPbf3Jw
         WxgBiZEP1xD/6Gd2xaUZ2B6OHRjuWc/fbIRMfsmyJ6L/rctszeE4jA+qf7/Xqle1A2b3
         PXi6i8vxEcEaHYDfkb3QrDNSP/UjWINHvD3RpQ3e+k3GPjLltFH4vz7zXpPGmUSmafUr
         1Fa03V+6qpWbSpgxjOI89JMg1LNYs1RzX2bdDZqukexEgEwAo7cR0HCJOUTmQFmejBYZ
         ZiXo4TOSnMHI9VdYuE5T1gnqpAELbr2YYyS+aYA0iXEe5oGqul9gFPnI9fN29j0c15+Q
         fveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939179; x=1696543979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CY0vsjcVCBgE58w9UR6SBm++3xKyQBSwPNYicIzid6s=;
        b=GplX7RjV7uqh4uF7SXQeuBTgPYiDJa7YrhVuetIu+aNdsrZGyhIPxEDu6ZJnfF/ydb
         xKuNVVRXmq7ZjPIvijr8CMv+Hg1nxBPQ1xbRrI/7LNw7i6sge8uOChkpgUZkbvYT6rXP
         iYHDkeUKt+xxSP46t4pBg29Afli50m4td2Bq/eTHfSocLkvYKCKrLVOn0cN94qtGJEGN
         3TBFBgRDY7+BSYvIbYF+88MXGYOaMZDDKkwzkvdaAz9WcLxuqFK6CJT1ANXhqJ6AjCe/
         djlm7k05D1vl7SL80yDuYeIGreR3OdY9qM4Zdem4pLVWARRlauUx5icOIyIutB60oL5c
         xXBQ==
X-Gm-Message-State: AOJu0Yy59LDh/R2ueNjIaJn7Flq0H03OJ6H9qrYPBQwn9jjDyQdf/Q4b
	qnZ06Oizwwn9+X039m1lqkihxWaTXRqOL4lc/2I=
X-Google-Smtp-Source: 
 AGHT+IH+8EEAM93O9nlO+qtWwhEoVV89Rw7mcTI5Ss+i9HtYU7SmmUhL1U+18gaNy0wOYFIltW+FjA==
X-Received: by 2002:a05:6512:2825:b0:503:257a:7f5d with SMTP id
 cf37-20020a056512282500b00503257a7f5dmr2553724lfb.31.1695939179359;
        Thu, 28 Sep 2023 15:12:59 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Sep 2023 00:12:56 +0200
Subject: [PATCH v2 3/4] ASoC: rockchip: Drop includes from Rockchip
 MAX98090
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-descriptors-asoc-rockchip-v2-3-2d2c0e043aab@linaro.org>
References: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
In-Reply-To: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 3OR5M5225U3UK2ZQA5Z6UPG73R4G3YXP
X-Message-ID-Hash: 3OR5M5225U3UK2ZQA5Z6UPG73R4G3YXP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3OR5M5225U3UK2ZQA5Z6UPG73R4G3YXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Rockchip MAX98090 ASoC driver includes two legacy GPIO
headers but doesn't use symbols from any of them. Delete
the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 150ac524a590..8e48eb8aa7ad 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -9,8 +9,6 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>

-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FDD7B0F10
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 00:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 487BF1F4;
	Thu, 28 Sep 2023 00:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 487BF1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695854897;
	bh=PyIpiS+t/JGgv4/HGgIXgl6b/+DBYteIegChizwRRs0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GR3O1yyKeyohq2v4GqTcE8DZWu3Wt/K5hP1TLfEkgy/7dBVkTcrS9l081MRggxpRJ
	 EcMWoDN5IdwocNgoJiZNqPLV/eqWh7KH7mlnfT+hWjWbs7zH5XXAJJvotPTj13H2XU
	 JHwhf0t8NYDPLp8iz1A/tB/F13PyZEwaLUZ4zYTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A549FF80290; Thu, 28 Sep 2023 00:47:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41AA9F8047D;
	Thu, 28 Sep 2023 00:47:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 475FEF80549; Thu, 28 Sep 2023 00:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10B9CF800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 00:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B9CF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DMU1cjNJ
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50307759b65so19902105e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854837; x=1696459637;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq20wAX7KyYyuxOCj/4NvQoVluqusmWSS2hLsMjGcCE=;
        b=DMU1cjNJzrFwI+h94eR5MhF4t/vymHB9Ajm7xJRD0IrsVDlTAK106dyNhf8UVoG+M8
         5GXGx3fuswusnX96uXNP6gv+BBL1DKFtNqw9h4x1hI69ipDqZbCGmx9zikV8dSaZLUHV
         JTErZnthpY/+ByKGPTo4tkDrHkso+pEiuPqJsXfEkCPtivqo5KsVe5SfPb6rod1G8bDW
         kkJw2fxgkEqf7PtQQLWG0oX2kUnXU9q9FreBK7/cEUBT/5kvPkxGr5hh8U0Zw1p81FRm
         bMD6bHONX7zolVddk+LqDutuIhhCmnh707Tv8ltTu6iGngBFtRWPvTyrTq3pX8XK5IXA
         gUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854837; x=1696459637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq20wAX7KyYyuxOCj/4NvQoVluqusmWSS2hLsMjGcCE=;
        b=g7TC+W37JikDF7+XhjkxsQ341wRr00LnBd2dS4XbsSCXunsnda9IjMp0wg+umF2Xhi
         kfkH4t7qWDcaXlaXuwaXxiKW7gwH2zL0XXnhCk9/OC4YCTYC/do4beJTu7CzYpJqr71p
         9+XqJudwX/lTYzt0amrFKO5MZ9d4QPvUd56XxwZ5/aFs4r4Z8oHXwywPkDidQPsj8L03
         8eGvuxAgCxJWxwoHeXjIqSDygH+FrsorGKykjjvUOlDn5kQogOg1b1Y6uJTXzQwq7ZM6
         3uO2VtSqJJI2EdqYXE9N8ZfOS9+KWkt8/ruLWyjDwNyjD8DWNssmFS2mGBbE7JlZ8cd0
         qSyg==
X-Gm-Message-State: AOJu0YyOzb59bk/wqgjJ0Cx4SigDJSUjCoO9khyeWtdxlFDbISgoKhuN
	hTPMyj1XGTv2RX/qlZRwG5s0Xw==
X-Google-Smtp-Source: 
 AGHT+IEfC0+hlBUj1Yf/W2nh73lfyeNcEfUcYf/ZYF/GatTdBOlrH90LckfUV5sGFYU2vNlRmcj12Q==
X-Received: by 2002:a05:6512:324e:b0:503:264b:efc9 with SMTP id
 c14-20020a056512324e00b00503264befc9mr2509397lfr.18.1695854836814;
        Wed, 27 Sep 2023 15:47:16 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Sep 2023 00:47:15 +0200
Subject: [PATCH 2/4] ASoC: rockchip: Drop includes from RK3399
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-descriptors-asoc-rockchip-v1-2-a142a42d4787@linaro.org>
References: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
In-Reply-To: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: ZPXV5GJ4Y3A5J6MYYQC2PWEZACX7UQFH
X-Message-ID-Hash: ZPXV5GJ4Y3A5J6MYYQC2PWEZACX7UQFH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPXV5GJ4Y3A5J6MYYQC2PWEZACX7UQFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The RK3399 ASoC driver includes two legacy GPIO headers but
doesn't use symbols from any of them. Delete the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 0f704d22d21b..a178fcd94d88 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -8,8 +8,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/delay.h>
 #include <linux/spi/spi.h>
 #include <linux/i2c.h>

-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E21087B2842
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 00:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28D81DF2;
	Fri, 29 Sep 2023 00:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28D81DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695939285;
	bh=PyIpiS+t/JGgv4/HGgIXgl6b/+DBYteIegChizwRRs0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m3tDenV2R6sZ/vL1KCXjnDHbzhVsLW4K5Lkc8wChwNbUZZFgP4wjhrdU3wgVA4J6h
	 4Y23mOCIu9+4zemlOiuVdTEJZClM7uDJA8Lkc+RQJaNA+pEPsxhBAETrJfwKhsj8So
	 XGsjxt7n6UJ/7Xl7SLSctIq1meYTPoU++uGxMt2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CFA3F8056F; Fri, 29 Sep 2023 00:13:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40546F80549;
	Fri, 29 Sep 2023 00:13:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B20F8047D; Fri, 29 Sep 2023 00:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23972F8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 00:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23972F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=j5Mic5Ac
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-504a7f9204eso3243621e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Sep 2023 15:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939178; x=1696543978;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq20wAX7KyYyuxOCj/4NvQoVluqusmWSS2hLsMjGcCE=;
        b=j5Mic5AcYZQIvA9dKgXwnfT1QbNUdOwLqBXL4kW6zHU+TKrlYtZ6plkUXJjQeJyuJg
         Fcpsuk9SZHuhOVpxrsfujrolUmE72eVRsnu/+gPzJUinlxxuIKFY61FW8kHtLdeEpxPh
         EQRa6bDIO/hHLkSAGR8KkW701MdcEOluTDu5jPDG+SNrnZ2ePImOLDVQEeKpykCKLCmp
         t4XaOJ8aIsg6l8XSAQ1O/SBnxnFo9Li6GIQxfgRkpqdEYK07MqEdRknT3tidcYh7hAZV
         qXm08bKbU2ldtKAgd2shLxU+jB26H8gnEp+8snt+fkPCZmH9FBBe22QR8MJ24K/lZ+NL
         h1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939178; x=1696543978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq20wAX7KyYyuxOCj/4NvQoVluqusmWSS2hLsMjGcCE=;
        b=k63wTsOR9j5y+ZcLZHSELWWjj35mySnjIzzccR/NzuX/01n8PF2/Kx5UsHGcyA7WGh
         uyJw7vA3hzmy4DWfau6X8B8d6R0IT0LvFohwU4y3umJUD2nDOmy1TKannDpNngaNhaX0
         Qz86KrSezcPgnyUWai9wiSvMSMulQURPbdW7eXIJUxVX8hNHuya3aGgB/0zBDErx11DY
         HjTxix8ejxXSjCkhvkLVgX0b8cax579AHGz9tTgmwkIq6VqBzdgAF6uyjV8dX1oda0xZ
         2/xVC8UKxtyTwW+9LOS6j66s010l8cg3XKNAaOYvoe+cGatTNzMzaiMLK0ZADbzk2pBI
         wBxw==
X-Gm-Message-State: AOJu0YzTjJU99p7fZ0WT9k+gdS+Ix4ZrnROJOSD7HtzzrvZh/I4lfpgI
	cASBgHzBUl5QS0zRXbbf8VMqRndaPjoIiHWqBkg=
X-Google-Smtp-Source: 
 AGHT+IH/mmM0nd0grFY56HkYk7pYC0txYkyCfW1BZfmsMKcj26i8WAbOvsdeSjB0ZgiMBG2REuwJsA==
X-Received: by 2002:a05:6512:4011:b0:500:9d6c:913e with SMTP id
 br17-20020a056512401100b005009d6c913emr2625253lfb.52.1695939178506;
        Thu, 28 Sep 2023 15:12:58 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Sep 2023 00:12:55 +0200
Subject: [PATCH v2 2/4] ASoC: rockchip: Drop includes from RK3399
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-descriptors-asoc-rockchip-v2-2-2d2c0e043aab@linaro.org>
References: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
In-Reply-To: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: VJS7ED4NQSBWEIGDF4MVAJ5YKFBE3OH7
X-Message-ID-Hash: VJS7ED4NQSBWEIGDF4MVAJ5YKFBE3OH7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJS7ED4NQSBWEIGDF4MVAJ5YKFBE3OH7/>
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


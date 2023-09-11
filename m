Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8C79A5FD
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABC9B93A;
	Mon, 11 Sep 2023 10:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABC9B93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420790;
	bh=DaVdZlNoV3LCB5Kisv0pjeG9l55LN3YUTaDA9GCuIHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZZlUwJUEgWklH+RftIdicLK4yopmQPmlvPlBchuXNEGt5fD8n/UB31UvM7DPR2Zfv
	 MtdNLF+p30EkOU95de5koJqMzy+TIa9Awm7YHVzraQdxQXyxOHo9CG2Zsy2vH/Xj30
	 APYgSYcOUscTmQIpPO9YumfAy5fwmZALmrdO0bAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE270F805B4; Mon, 11 Sep 2023 10:24:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0D07F805AA;
	Mon, 11 Sep 2023 10:24:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7123F8057B; Mon, 11 Sep 2023 10:24:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B438F80246
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B438F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eGbum3XY
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bcc14ea414so67292621fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420631; x=1695025431;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dl5LD8wtUJwzoyPBhKwaRw4zVOgRkHeCisg4Hejkfc8=;
        b=eGbum3XYxGhQsGwGtGn2rZ8wyybL8wJ8zcxRr7Pz/DVL2+B6LznVNKByelwBmiAAPf
         6jOZ1DGVp4BKClpzPB1CZySpIwccpeq+TxL0j6vaxEIF3/McBr1PXq+9AxND60iqXoQ3
         4PVAfPwEs44U1z+Zs3rpTaLaYa+UpETeWNCHG3B1a5tj/Oa+cuxMc2cWWcJsHkZ0rYS2
         ZqW4Fkf44HLK/QPS7/xNFLvK3gQ/L3BPelH10BGCXRzi89dMB5sJiGj1a9nQ27vpyBnz
         o8yWwU7N7HHtcs4Zdpe+Ty9GqHDe9n3GSrQAlgpuPM3A71lyQs/knGzdfFoUU9wtvigY
         obIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420631; x=1695025431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl5LD8wtUJwzoyPBhKwaRw4zVOgRkHeCisg4Hejkfc8=;
        b=tTSFHqAlctPP4Smh/4o7EuawwttaDpIPRING20IAsYh8IyG9f8xT1WIm8oLrTP8UlV
         M3uhK+r4Q8C+iAM3CEICsQepAfS6hsGmkH5jY9QASAvbeicwYJ0RO5pN0jtSFh0cd+7n
         9s4fe7bmorSvzwHRrX7UA5ne7Md/g4IhrnhFSuhAAbigvMEIRi56R0im031zC1C8wcAN
         8Aq0Vj3A033+l8H7yy+Z4/tnF1dRHQrD0O3tR2L4rGmNqBBVPg0yy8C8oPdU8d1MCC8Q
         3CLjrLqVnfKAEl9I0Yf6LmG47YqprsKQN71xVqkismwgTUMVB/g4Nl18CLZ9A4HvSnGp
         NOeg==
X-Gm-Message-State: AOJu0YwFW85Jh9UePofi6c/z3ttahzdqX4sMUwSuwF+il67rd1dXrkrk
	+WOTOocNop9PpPS29cWZjXSTJQ==
X-Google-Smtp-Source: 
 AGHT+IFktZEGzVQ79iSZyPcJk9XOSRsrzr5WoeyEli+ACNX43xpOf0axceLlu9TSC+4tN8O7hIKwQw==
X-Received: by 2002:a05:6512:6ca:b0:4f6:3677:54e with SMTP id
 u10-20020a05651206ca00b004f63677054emr8794627lff.36.1694420631650;
        Mon, 11 Sep 2023 01:23:51 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a19f808000000b00500968ddca9sm1247712lff.136.2023.09.11.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:23:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 10:23:49 +0200
Subject: [PATCH v2 2/7] ASoC: max98357a: Drop pointless include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-descriptors-asoc-max-v2-2-b9d793fb768e@linaro.org>
References: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
In-Reply-To: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: DLSQ4ACBIZOF3BLIOW6YCISOZ3NGFYFQ
X-Message-ID-Hash: DLSQ4ACBIZOF3BLIOW6YCISOZ3NGFYFQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLSQ4ACBIZOF3BLIOW6YCISOZ3NGFYFQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver is already using solely GPIO descriptors and
do not need to include the legacy header <linux/gpio.h>.
Drop it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/max98357a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 2a2b286f1747..cc811f58c9d2 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -8,7 +8,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>

-- 
2.34.1


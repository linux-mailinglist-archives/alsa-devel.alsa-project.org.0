Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C417FE1F7
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:30:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73024A4E;
	Wed, 29 Nov 2023 22:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73024A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293451;
	bh=bR6hKL6gHbWy1REZ902Fz2AlO7Vf+5eh4uQQITYI+hQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kHD/iHc8dKEfyyYKvISpzzRodcWfhHnFYuq9z+IRGxBiEwu8ytHS99KWEkrAJn2vo
	 +Tz9vl8A3p3ZB1ZklkkHTZpyH2kc7m5yT0hWKTHVlvfcbhWRP0uf+P4NFe/00fB+bf
	 yHzpOZYbTYw/YBMqM7wCY52KUFaO1muLudl8uGxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C96BF80659; Wed, 29 Nov 2023 22:29:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7556FF8064F;
	Wed, 29 Nov 2023 22:29:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 620DBF80254; Wed, 29 Nov 2023 22:29:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E031CF800F5
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:28:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E031CF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gG3hxiTz
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9b5e50c1fso4101801fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 13:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293330; x=1701898130;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5TZCHl5JrsKzVzdedTBOjjaGJPtqogPOahlRjnAK3I=;
        b=gG3hxiTzP6ZT+P/Dh81wFI6oKts22JFTtxnKgAj7fpmlQ0Q+BDs406i11ACrpl6E9V
         84Wqz1qRdnDbnRgI/X+CMA6d0mzQMT65NEzeGzf/+TJecTBqLR9c55i6CLGY2hUqov5D
         oFlRIJDIjMxGIiOz+u0WJNc1Z6nfTS5IJjLp38ZyMVH5MURlLUpIG4RdIINXXUeyaXjL
         ozNDn8W1hqAjjAXelKz4b8odY5yL0qW2ZTxzxa0Bo2zcmPok1vU3pq0hYq/zaE2gdAnZ
         7X/ETnrSz87ZCivdUEiNDucGF0HCoozCBhA5RzPD0UaorbiyMQLUbMby5xi68uphKtRn
         dGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293330; x=1701898130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5TZCHl5JrsKzVzdedTBOjjaGJPtqogPOahlRjnAK3I=;
        b=mF729QSQRqQ5ASTkTd2OtbkwZ4BFsUmcrSXQqZRJkEi7mYunVv8C3EHqZTJTd7iJz1
         bQWXTYf0Nkyp8JVoyOTfegJGX9UdY8g+tA1eSuqgE5v28TQsSxXTdidnK7UOd2CdtLgI
         3bMTIThHmfAIkCNav+I6+wQ6sFQU0PZgrJu4lrcbpfiwZGvTZqnaWqyWANmGLG/xi+Qh
         uE+7rT6fztEr+bjVyq5i7144qZUQ+adQsPtnzcqrjsB+IuHohLUbk8ULE9vJzLPDqUTb
         FODVmHkK6OFfC1lpbdILsAiR1f7zG67+4ziTRV7aluy2MpGFQhBfJx6e7yoKGj2sHloc
         t0eg==
X-Gm-Message-State: AOJu0YzzTP1nIVBCCwFU5mBDZ9qMNYfihJ9gE+BEeDMv6V09W+4j1gSo
	x+uaq9O+J8W3+IGWgzS7zgd1aA==
X-Google-Smtp-Source: 
 AGHT+IG2iJRuG1eHTWV98yu7FrzVbLk4F45mt7qi99SvzYEoV5Esdv1xtlzmQWw30MGgDqcTjnHMVA==
X-Received: by 2002:a2e:9b4d:0:b0:2c9:b4c6:a7ff with SMTP id
 o13-20020a2e9b4d000000b002c9b4c6a7ffmr3942168ljj.40.1701293329961;
        Wed, 29 Nov 2023 13:28:49 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:49 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:43 +0100
Subject: [PATCH 07/10] ASoC: cirrus: edb93xx: Drop legacy include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-7-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: LQLY7FKG34U772RLY7VRMLKCWAFK7QV2
X-Message-ID-Hash: LQLY7FKG34U772RLY7VRMLKCWAFK7QV2
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQLY7FKG34U772RLY7VRMLKCWAFK7QV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO API <linux/gpio.h> but
does not use any symbols from it.

Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/cirrus/edb93xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index 6b6817256331..8bb67d7d2b4b 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -11,7 +11,6 @@
  */
 
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/soc/cirrus/ep93xx.h>
 #include <sound/core.h>

-- 
2.34.1


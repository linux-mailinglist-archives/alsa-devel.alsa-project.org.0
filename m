Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D479979A5F8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4ECF846;
	Mon, 11 Sep 2023 10:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4ECF846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420690;
	bh=LfTPHks6lpg6vGBs3BtBDCczjGMywXn7H94HT42ReHU=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=W08sl7OePyPCg3amUJ2wylpM90ieQfKedSMNTtB6+1L/BoCc6zZGB6kYg7CMcd8e7
	 6EktLSnB+8q0CPW7VVoaYTXrGTlLSZJdjF/iZ7t+0Qh8R1oRu7FYnZbTJoHc7DxYjU
	 V/Uzsn0dz6gONzgCvmZrrZxQijouSC8DjHXKVf1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0CBFF80563; Mon, 11 Sep 2023 10:24:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F1B9F80558;
	Mon, 11 Sep 2023 10:24:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CE9FF80552; Mon, 11 Sep 2023 10:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BB86F800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BB86F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RYTQrHRs
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-501bd6f7d11so6717232e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 01:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420630; x=1695025430;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VtgG1x2m9o0IpTfX6UiCcH6ibg9JS/Bhrsg9Q6riVRs=;
        b=RYTQrHRse8d4wU/ZgANev4sc6uLDYA57uaZLkfqfYPEabHE2b0JeBBa57jodyX8YvM
         n4YSbhg1o82/G1/kWpPGJOxPrCS2y3AQwDShLZ13sAQo10EhIFw8TqLCPwx3QLXzfSE0
         QvTdR3itYOcJIxHgWoJr2vGojyCRewKum+CMg61i2zvgvM0zU8dgW4UIRSSa6morCecu
         nV7SBY0BAky3SqhI/w3AO4NyiSa2TSwduE+xXE7pAfrBr/KxS095BMMhZpeOeTuOQkt/
         894qO7KE9yOalz1/Q500BMeNMJ+A3s0xQQmhuC4sSAWrWdcEWqk/FIKBF7kuE90YQrdC
         c7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420630; x=1695025430;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtgG1x2m9o0IpTfX6UiCcH6ibg9JS/Bhrsg9Q6riVRs=;
        b=tR1OPletqoRjyYcRUo4mSSs43IoyrfBM0N4vN62TS4iS4PLSKOhcfcchCyATWmLUsk
         xbgotJ17Fk+RL15KMSZGmd3Sdb+Todf7QHgfQRRJmgCiI5xSNLncZUzWhU9tD4Jpron+
         yoa1r1sGYskskGwcB5NWERMFRkrL+nLmn1ga1sy+e7KYBiGuMCtPEeyVr0wJ6E+Nw67C
         TsylNzE2iwifKm9IZbM9PovQz/axQhcg5pnRKaA3wg0EjG31j8/GK3N89zuC72devOx1
         k72Y8arE+Jc1WQ1i80Oq7/0YRKq02S4TyQMdwjBYWe4jttp836+GKoriaG7KC4AZLsMp
         aZnA==
X-Gm-Message-State: AOJu0YwsBFbDCAwtddk59WEwPuUmXj4XBa5OuZlmQU/9iWMo2ldAIGXg
	c5DaW+WL/0wMG6SW2a7O9M7MHg==
X-Google-Smtp-Source: 
 AGHT+IHvxuOb7yl617d/Y4wRW8ul/lbBFb1Q/5NZpMJf/su50wFhg505mK8F5xCB60reJfxe9dnBfw==
X-Received: by 2002:a19:5058:0:b0:4fe:1c40:9266 with SMTP id
 z24-20020a195058000000b004fe1c409266mr7039614lfj.17.1694420629766;
        Mon, 11 Sep 2023 01:23:49 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a19f808000000b00500968ddca9sm1247712lff.136.2023.09.11.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:23:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/7] ASoC: Convert some Maxim codecs to use GPIO
 descriptors
Date: Mon, 11 Sep 2023 10:23:47 +0200
Message-Id: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJPO/mQC/42NywrCMBBFf6Vk7UgyYh+u/A/pYvJqB7QpiZRK6
 b+bFhcuXLg8F865i0guskviUiwiuokThyEDHgpheho6B2wzC5R4krWqwLpkIo/PEBNQCgYeNIO
 uFBmJ2ivvRVbH6DzPe/bWZu45ZeG1v0xqWz9BPP8OTgokWCqrWpeS0DbXOw8UwzHEbjv4w9aoE
 BvU6GX9bbfrur4BDr0A7vcAAAA=
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: TSZ3VHRWG3GO5QV7CRLPXJLRGFAUERB7
X-Message-ID-Hash: TSZ3VHRWG3GO5QV7CRLPXJLRGFAUERB7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSZ3VHRWG3GO5QV7CRLPXJLRGFAUERB7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Maxim devices are pretty straight-forward to convert
over to use GPIO descriptors, so let's do it.

Tested with some x86_64 allmodconfig and aarch64 allmodconfig
to smoke out the worst bugs this time.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Rebased on v6.6-rc1
- Link to v1: https://lore.kernel.org/r/20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org

---
Linus Walleij (7):
      ASoC: max9768: Convert to use GPIO descriptors
      ASoC: max98357a: Drop pointless include
      ASoC: max98373: Convert to use GPIO descriptors
      ASoC: max98388: Correct the includes
      ASoC: max98396: Drop pointless include
      ASoC: max98520: Drop pointless includes
      ASoC: max98927: Drop pointless includes

 include/sound/max9768.h         |  4 ----
 sound/soc/codecs/max9768.c      | 45 +++++++++++++++++++++--------------------
 sound/soc/codecs/max98357a.c    |  1 -
 sound/soc/codecs/max98373-i2c.c | 17 ----------------
 sound/soc/codecs/max98373.c     | 35 +++++++++++++++++---------------
 sound/soc/codecs/max98373.h     |  2 +-
 sound/soc/codecs/max98388.c     |  3 +--
 sound/soc/codecs/max98396.c     |  1 -
 sound/soc/codecs/max98520.c     |  2 --
 sound/soc/codecs/max98927.c     |  2 --
 10 files changed, 44 insertions(+), 68 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230817-descriptors-asoc-max-b71ac02bf1ff

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


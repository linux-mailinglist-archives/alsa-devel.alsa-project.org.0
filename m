Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC177BB9B1
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 15:47:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B694810E;
	Fri,  6 Oct 2023 15:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B694810E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696600051;
	bh=1hpn3nP6r3zSnkayS0z7he39YlD32r29evSoMMc3ya8=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JQRAyU9RHoN4UxK9fRScCmN1EMqdmdndRKvu6MML7/3HEz9bih/3ZvZxbDbUcQLHr
	 6Vg/7dV+GQRJ4WkvyN6GdacAHJ7PY1vESytnQ3RWkn+Z4oiGarjJQHbO5g397uWhpF
	 gyHLW27NF0m4DHEQqZ5yFaZmiSceN6dNDm3uHvV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D33DF8047D; Fri,  6 Oct 2023 15:46:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BBADF801EB;
	Fri,  6 Oct 2023 15:46:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 991E4F80557; Fri,  6 Oct 2023 15:46:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E4E6F80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 15:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E4E6F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LSYhMSlK
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bff936e10fso38982261fa.1
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 06:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599987; x=1697204787;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iyIWSI35ioF9P5y4BP7rlGwfh5ltYmHyWesLeZ41VQA=;
        b=LSYhMSlKDexknXfgc39EsV1QVl474tsWTtE9ksX9p19MZ5RG72x7jky/O6VuamlcZ9
         OZKFlZWk0KwYU05EVKOPchztAX7HypU7ImHWPgT5DTvfB/NeMd1z5wMACKCrHJ1wIeA4
         XWilqI3LLn2g7nJ4l7nyJTSQluFHynAO+w9q/V7/LKddt3VSfpeFRDm5S7vlavhPuRwh
         L4Uf3CImKcsY9FyXjwmuRqw3PuTrV/3oyTaccRC0mHdkuvTcwBNDXun3zGiJFtI4k+s3
         AWuWaGjNmFZOdqGzwqKdnrILEhYf5COFQVhyGXzmXloEJiMEz7SG4TPNUlWn/yauCz0L
         FAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599987; x=1697204787;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyIWSI35ioF9P5y4BP7rlGwfh5ltYmHyWesLeZ41VQA=;
        b=Wb5/KJa946wuUp9fo3y+fpVKyPZcWP6D4xTBpN6IdXzENTvPhYKtU8QgD5yjx6zBzt
         iieKknEqSfTRjcs3s/xRrDMPI3Umk1koEfpwforCvgWWHHPo9/fqNV3Fd8k3VAXH8oRY
         w1bd24NoNn0blizav5NY4Aan3DHVQ9YmQEuZCBXjJ+FWUN01gXhAwgXYIQ3dbXJg0hzx
         cjwvuhiCb9cbiTdejmPalEwCNG5b+0nWo/a1gG+xcvyud99zlMKcBFxrwiHRZvmGYO6A
         c+DD/mTarW8Vf00HOnw3r10V/oiUxzWMQQsW6n6NQod1pg1s/Zgp30c1J3ggVvZp4/UE
         tfrQ==
X-Gm-Message-State: AOJu0YwCEkrBFC4XFMvpUkm5bvR1eIIRIqvGKDQ/0OmXB9BkGW+mMYrc
	bqGhHImJab9N+5pyOb0ItBk8mw==
X-Google-Smtp-Source: 
 AGHT+IHGZbYm5OyG87d6TAKeG9ICFcG1L5jBwIGzi+m4DbZK7DRyNC9xmJcbHkphJg8oT5Yn4KFEDw==
X-Received: by 2002:a05:6512:313c:b0:500:96dd:f95a with SMTP id
 p28-20020a056512313c00b0050096ddf95amr4307682lfd.24.1696599987078;
        Fri, 06 Oct 2023 06:46:27 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:26 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/8] Convert Mediatek ASoC codecs to use GPIO descriptors
Date: Fri, 06 Oct 2023 15:46:23 +0200
Message-Id: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8PIGUC/x3MTQqEMAxA4atI1gZS/xZzlcFFbVMNopVEhgHx7
 haX3+K9C4xV2OBTXaD8E5O8F7i6grD4fWaUWAwNNa0jGjCyBZXjzGroLQfcOIo/eUVyoU2pI+r
 jBKU/lJP83/d3vO8Hdr86wWsAAAA=
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: PPI3MPHBTODFMTWSUZ4TJLCUNK2MUZOR
X-Message-ID-Hash: PPI3MPHBTODFMTWSUZ4TJLCUNK2MUZOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPI3MPHBTODFMTWSUZ4TJLCUNK2MUZOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert over the Mediatek codecs to use GPIO descriptors.

One few-liner affects gpiolib-of.h, I don't think there
will be conflicts so I suggest that all of this can be
merged through ASoC after review.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (8):
      gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
      ASoC: mediatek: mt2701-cs42448: Convert to GPIO descriptors
      ASoC: mt8173-max98090: Drop unused include
      ASoC: mt8173-rt5650-rt5514: Drop unused includes
      ASoC: mt8173-rt5650-rt5676: Drop unused includes
      ASoC: mt8173-rt5650: Drop unused includes
      ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused include
      ASoC: mt8192-afe-gpio: Drop unused include

 drivers/gpio/gpiolib-of.c                          |  4 ++
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         | 54 +++++++++-------------
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |  1 -
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |  2 -
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |  2 -
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |  2 -
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c        |  1 -
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  1 -
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c        |  1 -
 9 files changed, 26 insertions(+), 42 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20231006-descriptors-asoc-mediatek-01c3ff4005db

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


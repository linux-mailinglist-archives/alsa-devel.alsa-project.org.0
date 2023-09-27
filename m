Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7347B0F1D
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 00:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D2F0AEA;
	Thu, 28 Sep 2023 00:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D2F0AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695855074;
	bh=D8YsIbvwKFaGFU37tFCU3Xa5vmJQnpOrgCzxwQMTrDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sw5AT5yk89ck2S4aRwYH2rF1okNaSMO3bcQALOc9nHvqEut/D2EpC+Vti5i16L4aB
	 qSWt0cyQMhQ5cRCo60zXZUDAHfkjGguGwaQ/qMKO68OX54DG98LzkObuZ4aPeurAbC
	 Tf89sHVDPN1TwfqSySxtj36PCvnAjVsgzpHrdWYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6166CF80567; Thu, 28 Sep 2023 00:49:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB95FF8055B;
	Thu, 28 Sep 2023 00:49:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D8CCF8047D; Thu, 28 Sep 2023 00:49:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D221AF801D5
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 00:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D221AF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IwAM7jwt
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50481a0eee7so2545096e87.0
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854838; x=1696459638;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY0vsjcVCBgE58w9UR6SBm++3xKyQBSwPNYicIzid6s=;
        b=IwAM7jwtqRiv9p7Z9xcGHYm31dZD19Li13aLG/kL9Or1rB2FttlYq2wnWj8ipTth2Y
         EEM010vrv0GzGKdf5SakPlxZoNy6CsTIGlL4f2A3U38J4kwCtF5P0ep1hBm02TEfdu6D
         vGMpTGvPdSG+ssYLRGwYCKAn4+nRGYvRP7NFp9sBELBHagwjkBeK1jqvQ6zKIMw65Yjk
         uMrykVJJVnFLRmSXoZE+bMwuBk/73xloZtjDXRzpcqYHgVInTVWSsY7FXQoJpll888+q
         rp2s7H1HF8+o/q2+4legma0Y0Vw7gUgPIuCd9ORaajPHz5XzX4fuRUs29YuahQ1pOC/c
         95nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854838; x=1696459638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CY0vsjcVCBgE58w9UR6SBm++3xKyQBSwPNYicIzid6s=;
        b=ryMl9S6ZSuM5HbbJM5Y1bYhpuvBzjRI+PM/bv90MPfq5wJ37sYCFvh9CiCvz2MUxCt
         SLy5TBHWO2l9n8Jndzcaj5e5cdIopqHG7i9irI2U5GcmY916Yri5z6zwyl6bvu191smy
         38c88zRT2VC2JLrOledKIR/PAKmyDmPLnwd6RNoA1+8JaIuhvTVYZwm3A/aw1m5FndrI
         fGGQePFAHrJAqGYLKyzLd2PaLpHpI7TKLziy+xQ5vyWsT4f+zMLDk5QFqHrWahLSIx7t
         bClYXNeYXvakWUcAGgAOM193UOs+DpS8wQIWvc9GXbegH4SNTcunVEUBvZivrMW1GlAc
         3Tiw==
X-Gm-Message-State: AOJu0Yy+3bQPQbYVd7IOSi8ZEfNKr7bY9aNfCzVhNBT/CVQ9/oRSKFRY
	PGA8Dc/OLXXW0eYgcy7lTCdwfA==
X-Google-Smtp-Source: 
 AGHT+IEX4yAeJVMQ9xLxRU+QUVQR8aPJSks9x5s8hY6YWkQ+B5BI90m9BXzskEw8JTnRLhnt+p9GEg==
X-Received: by 2002:a05:6512:110d:b0:501:bf37:1fb3 with SMTP id
 l13-20020a056512110d00b00501bf371fb3mr2796624lfg.24.1695854837664;
        Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Sep 2023 00:47:16 +0200
Subject: [PATCH 3/4] ASoC: rockchip: Drop includes from Rockchip MAX98090
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-descriptors-asoc-rockchip-v1-3-a142a42d4787@linaro.org>
References: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
In-Reply-To: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: UQL3JNAZJNBAS52GE2T5NZOHKXW4PQWA
X-Message-ID-Hash: UQL3JNAZJNBAS52GE2T5NZOHKXW4PQWA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQL3JNAZJNBAS52GE2T5NZOHKXW4PQWA/>
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


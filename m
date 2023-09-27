Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D388D7B0F16
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 00:49:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10BFFDE5;
	Thu, 28 Sep 2023 00:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10BFFDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695854948;
	bh=Q7iUCdUvNfTEfCOqAcI17p9d1/Rti3AJYWiZ3sN7n+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MUy5nWiVLcPUuQWH4Es2/R/4A39+TlQMbwuwEMZmOc6ZOUEm7p/72c/ofPJyJiP22
	 DhZyslyv0OFwMSKzZIH5fzPBhwz/3TeiDwA2PLoqZL2E1CfM9b3BnjT7JHW4nyPeS8
	 S0++C5fTasAbT3UDdo8kJP/IfVT5rhp21DVtgZqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F7B6F80564; Thu, 28 Sep 2023 00:47:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2505F80563;
	Thu, 28 Sep 2023 00:47:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 256BCF80549; Thu, 28 Sep 2023 00:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F024CF8016A
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 00:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F024CF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JHV0Y3hR
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5044dd5b561so14470136e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 15:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854838; x=1696459638;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hm24NpX94JBemDRTScZMK9z0G78Go8UKUQZ7xueoWyk=;
        b=JHV0Y3hRXu7YZk5M7SOvXsfP1R/ErQrc/8iXXc250utfJjJpzQHEOSP1SrYltE3cF1
         lmnzY0e+Ve9fRRHYWgVQzjL7LkN2YIbFVB0QeQEs3ddpZrsW1aZYTZ4CHKug/qqOxbT/
         FxolLbafrkJsWwUlCS4V3uYGm+Tw11tervaj3WPXV7wmZAY5Riq60HELM0KC8ChYKDFg
         NcZo9gCXoaf4fDV7qu0PndZ6GX1Lmj5xuZI7ttUNMHciFoLB7fYzeOf6t3Pr7g0vVpuv
         YE93QPNOZdOrY1IDCjThZ7eSuKqtxv9WtHqmzTxmfwpZ0nzStepSN0ucKypD0J3hC2/t
         3umA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854838; x=1696459638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hm24NpX94JBemDRTScZMK9z0G78Go8UKUQZ7xueoWyk=;
        b=iaDi0PXz9NI8FtuLXZrfN6k+IbYX+YlyvCAXtijpeusZnRFvxzJiwVsz0VWxlHcX5J
         j4orPNLeiPBpQntxngtwImwtfNR7WG2gQqI+5yplfp77rjg0jHDqt6fzF4aMI8En3e7Q
         G5sAQSx0l4hpS+BJ6tiAbsfiYWw7zLpOh+LWgF+cJRPC19AcEB9nCF+MDUf2YzLoh23y
         Hs6LMfofL5UH2ooNyjZJy/YObnYukXzm475yuFejNCoVFoOxYVHIHLYcsFDLtjuqw9gh
         kKY3wZhqMBF0KJVEgqOKEg7Mvyfeokjp/sDBfSHQCfnDNqLFb6UzJDtBuuG8kdptZHyw
         LtZg==
X-Gm-Message-State: AOJu0YzDbkBx7mxsPOydRTaPD+O8QE/npiHqTWstU1zXOZ6N+GfNmfGs
	f6RnIkQqBLt5d5mcmfSogWjpPw==
X-Google-Smtp-Source: 
 AGHT+IHIPAOySo0YwjWaGIBqSx3zAKxnJQ1KilKVhhF1C+VnLfsmaRRx1osw7z8l9ymMS10PvpQvMg==
X-Received: by 2002:a05:6512:3b06:b0:503:364d:b93d with SMTP id
 f6-20020a0565123b0600b00503364db93dmr3348450lfv.20.1695854838581;
        Wed, 27 Sep 2023 15:47:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Sep 2023 00:47:17 +0200
Subject: [PATCH 4/4] ASoC: rockchip: Drop includes from Rockchip RT5645
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-descriptors-asoc-rockchip-v1-4-a142a42d4787@linaro.org>
References: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
In-Reply-To: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: KT5JNCFDMKDZIGP2E6O2FKHWIQKT4LDF
X-Message-ID-Hash: KT5JNCFDMKDZIGP2E6O2FKHWIQKT4LDF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KT5JNCFDMKDZIGP2E6O2FKHWIQKT4LDF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Rockchip RT5645 ASoC driver includes two legacy GPIO
headers but doesn't use symbols from any of them. Delete
the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rockchip_rt5645.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index ef9fdf0386cb..7d4d3a0ac5fd 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -8,8 +8,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/jack.h>

-- 
2.34.1


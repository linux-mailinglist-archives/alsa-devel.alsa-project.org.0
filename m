Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59AF7BB9C3
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 15:49:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D646191;
	Fri,  6 Oct 2023 15:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D646191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696600152;
	bh=Rapf7G2GGMS6FT9ZDrWPAIHqnVm5fen9QWYbaauW6Cg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aAIB6V4VTgMxYhwluW5ciyfUjincj7ENIADNX80tTxiaNztU8Cgfr+Acw6CSyI36F
	 PBO0MmPRshPUX/zEwascY8R9AwyDyHMNNPCj8YXDodey8kn5QgwZqE8GMtmCHw8sOl
	 s31xRnPK6e5vxSEbw/jqwSw4u6Cv5dUO75yF1nFc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C188F805B3; Fri,  6 Oct 2023 15:46:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A78E6F805B2;
	Fri,  6 Oct 2023 15:46:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F018F80568; Fri,  6 Oct 2023 15:46:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C474DF80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 15:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C474DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lXyZK8rp
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50337b43ee6so2777236e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599994; x=1697204794;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Asgb8OAKdQDCRC4VclzbwAu62WhyUIsTAbJjeqQexwE=;
        b=lXyZK8rp/REX/Vg1lRecvV/I2qUcLnjO79CRH3q/tCzj4aaHAeBysfa6MO5DodrH1k
         r34rf7BR0fzLbWNm4mglmpQbgWKP98h4Cka60cqnaMrz+DGATcxeLrIyyHUPpr3va7T+
         lhlbKAyUurWyd8VXZUtYF4WLWMirnWmxPB0xPW2pwn3ceRwDhHzgaSqLwQ8zx72hmAvq
         ReiilGk2TOZOpathIui0Oz1VMrnANojdSFaWt5tcknxFPetkZJkNa9DfmUdYpnQQBz65
         qlMAao0qYwBPL92z1vrIAeS4dAULuwFcecR4qwqt8HLjLaS0XiS83X/Vy71l0/ABdwEB
         2KHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599994; x=1697204794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Asgb8OAKdQDCRC4VclzbwAu62WhyUIsTAbJjeqQexwE=;
        b=bgba7Q96T0xgH8GlT+yp8F7pk4/s3tUMhzwxxVsOeTuoVrNu9GhGaqCIeeaqAQS9/+
         vSqP+MZW5dtxCpR5cywPRSN04Rq8IU8C4FU5j92Wd4bf/68f3Nlzn64c68m6Sce8zdmh
         CShCo2Ql2TBQi8A76nLMgvYsm9uGCifCDUPYfrHbomnIj3jCdNZk1ipXt8ptWRY/bsBq
         tRlWkz2z/4RF8Le7mFVEI+lPzbDN1P36gB5LpM/3o2YGdv/R3zxifB1CqRWcdXLDEhd5
         nReCs1+RZMpwQI1BfxtcdzXpI1Xu0tEw4oJtIYCRaQNIAAAN8QxHLyoaC1DCKEvtaqer
         yUdA==
X-Gm-Message-State: AOJu0YwEPKa5OQXhi9AOW9MoSbA0xieomZ9MSbv4Wqk8CEaMbEmO3ydU
	YUd9zXHipHcuPT6n+C0kVI0FWw==
X-Google-Smtp-Source: 
 AGHT+IGQ+oeljBRtveNq+5wlJ3DdWNUKKe6FvbxRXepDt1efr2ZvhVToivpHhLNanf/lPPVIIHZ25g==
X-Received: by 2002:ac2:5b02:0:b0:500:bb99:69a7 with SMTP id
 v2-20020ac25b02000000b00500bb9969a7mr6257290lfn.14.1696599994019;
        Fri, 06 Oct 2023 06:46:34 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 06 Oct 2023 15:46:30 +0200
Subject: [PATCH 7/8] ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused
 include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-7-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: QABSSSV4SFEOOT5EJIPCEFN7F53CJWEB
X-Message-ID-Hash: QABSSSV4SFEOOT5EJIPCEFN7F53CJWEB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QABSSSV4SFEOOT5EJIPCEFN7F53CJWEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO header <linux/gpio.h> but
is not using any symbols from it. AFE has a custom GPIO
implementation that is not using the kernel GPIO framework,
so it need not include it either.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c              | 1 -
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index f12e91cc4fcf..9e86e7079718 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -5,7 +5,6 @@
 // Copyright (c) 2022 MediaTek Inc.
 // Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
 
-#include <linux/gpio.h>
 #include <linux/pinctrl/consumer.h>
 
 #include "mt8186-afe-common.h"
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 9c11016f032c..87ec39a5e1f4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -7,7 +7,6 @@
 // Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
 //
 
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/module.h>

-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E810813123
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 14:17:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C7ADF6;
	Thu, 14 Dec 2023 14:16:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C7ADF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702559827;
	bh=hmjNbFQy/MFZ32TwtvEddH6Mn4umEwoA5x6YUMSk+Pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r7nweyslgqnMZUoK1ci2bqdkmX9Eg7lCkAz1OF2d4w90LNiwK1mfCql/eyKw+mFqH
	 MG/gbKV72LA53BjAmQTi5bufJT0TjWxWXey7u2A5dozUhPMK4hQm7NleKkZpetjuk5
	 J/nf13rdVkUwLHYrPmdv7lPQDX4/CiDPsf5eqycA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B58EF805F1; Thu, 14 Dec 2023 14:16:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B64B2F805EA;
	Thu, 14 Dec 2023 14:16:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1632DF8019B; Thu, 14 Dec 2023 14:15:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47C33F80114
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 14:15:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47C33F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=seumnG9z
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9fdf53abcso5934831fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 14 Dec 2023 05:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702559746; x=1703164546;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaGgexboX4k3Qc2D4NNTwm8nzl2s41MzL85I6McymUo=;
        b=seumnG9zFq8OJjpD3douPIgKDYl6c5jpq06u275i8WXIpN0d6xyIdaS+d3yl5aNUz+
         AXf6HihwkfBQc7yPxvEoj4R2H/dzlLDvUkxHA2b6k8i+yR76eOvYV4noshkiDg+dsqDg
         Z59GFVV7bLgtHy+CMpAcBYGcvjsGUAQT08YCGG4oa9NqauAWcE6Kh5t/co+m5qbE8Tvf
         woii56+EqO3ZzpXFqAWpUNsJ8dW0kQevhhMJENPDOwZHMFHKvjVrRaV7u038W4ZRWGpH
         8a4Ztr9d4BojhMWOrZJiKefZVdl2i2nxMs2dPKluuSzwPoPn3UAJHiIdBMhepKf/muxs
         kSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702559746; x=1703164546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaGgexboX4k3Qc2D4NNTwm8nzl2s41MzL85I6McymUo=;
        b=dZ6rPIPRtPYoQQ021M3j2kA4Ucsri1uMXJ9HXW6i0SSM2WfFrvuFnE70/KluICsXQG
         J5OZoQKseeZYoZ6OyUsorm9ZUfpaZUG+q5fBagv6qY4lKchfHVuQsERwOVgVq7DDqjjI
         COEPnMAHMmkFppj1T+SaOAojj3D4TgzR4Tp2tiVITdDjEEBrPTYn6U9FY+2StHkO2dqA
         JZrgjOLTD2/Tbb3y1wsTUcY8tI6dSD2hWWpOiTVYlT4ndSzKsQFY5tDbuK0zebeelO53
         l6jazNVCe/Oq+ZRLS4SyzZHwRJVbS7TvlCp1iuiXsKi5s5UIF1dXzgmLg/eckqbRJ0Br
         spvA==
X-Gm-Message-State: AOJu0YwIMNCdlHPHgpFFBOiuFGzmLcuItqjXSiqUMZSTr/u8ECFZrR6E
	EIOLrt31ZnUqqM4junnQkrmM4Q==
X-Google-Smtp-Source: 
 AGHT+IGYhdO0R6QYJVwI+mlxYKJRdlAEgaRgJbuekhSlydk1uvqpHt6BYffRJ/9o8BrX6Te5MxGJTQ==
X-Received: by 2002:a2e:6e13:0:b0:2ca:207:d214 with SMTP id
 j19-20020a2e6e13000000b002ca0207d214mr5679117ljc.12.1702559746426;
        Thu, 14 Dec 2023 05:15:46 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 p23-20020a2e93d7000000b002ca02ceae84sm2080478ljh.83.2023.12.14.05.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:15:45 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Dec 2023 14:15:44 +0100
Subject: [PATCH 3/4] ASoC: simple-card-utils: Drop GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20231214-gpio-descriptors-sound-misc-v1-3-e3004176bd8b@linaro.org>
References: 
 <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
In-Reply-To: 
 <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: 3N6BP5NWJWUWXEXQKTORK4IZ34DMDOSR
X-Message-ID-Hash: 3N6BP5NWJWUWXEXQKTORK4IZ34DMDOSR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3N6BP5NWJWUWXEXQKTORK4IZ34DMDOSR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The generic card utilities are including the legacy GPIO header
<linux/gpio.h> but not using any symbols from it. Drop the
include from all files.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/generic/audio-graph-card.c  | 1 -
 sound/soc/generic/audio-graph-card2.c | 1 -
 sound/soc/generic/simple-card-utils.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 76a9f1e8cdd5..83e3ba773fbd 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -9,7 +9,6 @@
 
 #include <linux/clk.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 7146611df730..b0a5a9357c76 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -8,7 +8,6 @@
 // based on ${LINUX}/sound/soc/generic/audio-graph-card.c
 #include <linux/clk.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index cfa70a56ff0f..2f2280342e2a 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -5,7 +5,6 @@
 // Copyright (c) 2016 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.34.1


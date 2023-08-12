Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B1577A229
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB60D827;
	Sat, 12 Aug 2023 22:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB60D827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870538;
	bh=lp0G+l5JKMR4Ce3+777SCdGm12D4fq4bz1zTEwm7K+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DBSxhCN/f4G1Vi5h01U5WKfvfk/RBcLNQMCE8qnmIQHnGYRq5Is63mWByrQPgxBra
	 wZyvnFEmTb3y7Xh61dvM84RiU3JwR05ML98wg3SM9Vw+DMgvTo+WplnOCq02l1P9SB
	 3Z2UtCu7DY/4Y4Ikoj3K4iLZJd4CKyzymkyff/bU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1D85F805B4; Sat, 12 Aug 2023 21:59:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4147AF805C2;
	Sat, 12 Aug 2023 21:59:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DA76F801EB; Sat, 12 Aug 2023 21:57:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BDDDF80134
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BDDDF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Dk9KtfKH
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso45466921fa.3
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870223; x=1692475023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joD4NVoVgEzLCIT5I6+1AqpToQVxZ3o18MkipM6/yQo=;
        b=Dk9KtfKHAHrYY2ZvfAdrjNlrRWb22Nk7SFgmVsi1mqCtV2S4NZFFC5Uy4EKP3dCVml
         S/CR9c53B+PKb3FNykeXUlepMzZUQIz+Qr8IYnxEBM1WH+0DKrPKoi7teCAM6sCHvI0n
         8lqWenFlY5ku9A9kmZi/v6Wfr8H0Vk5APg00rPQLVuh7AUh0iusFWeMoYP5tBqo6BsaY
         HCF0kIbJ5BE2zdV0UudBskVjM+n6CpbOag3ZyVeV0afBvv5xpMAbZdtcS1F8BKoQTJBk
         oQ0biUZsHzlyB2fnapqG9VsqIpLox6GIqPjJvKcvNWH5uMcJVllC/GgQsxY5X27ZcqZH
         t2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870223; x=1692475023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joD4NVoVgEzLCIT5I6+1AqpToQVxZ3o18MkipM6/yQo=;
        b=JzyHQmAJOZX7Rix1qsZBLPQLZoE1vq13X/tQN2YnM6inQ9GLbwViZmdDg2f71lHLlU
         hmUpLHsvbVS3mJSTQATSMfupW1kEYvDaZw0kWKRgKY4somnOr1vF6l5AaYObyxwHWLg7
         Y4Rhn3eoH1wNX+ffa5RwYO0pnG79A4+uk6ihliOYhdV8HiDas+8UD4+rIqHZ+nPhPauw
         dN4suKNw4sSF3DBHzVYMXdzbPpXYQRXsAXKcmkuBLiOmSnxLcWu0CM2v1upysI4cLZi4
         AgzCJUGqeL4ntT398SB9NlDsbqiGDCb5nweRZ61tPh3VmFlw8UIfpVwXglwB0mIfqLoh
         GsZQ==
X-Gm-Message-State: AOJu0YwVS6h/8yoqywrSf3ha0OskvJzz6gDeb3HbpWOoCFgQEfsgv/0B
	5dTrUWk/RD/geZa2dEVEkOi9eg==
X-Google-Smtp-Source: 
 AGHT+IHC5BwFPYA1EOllat0Kiu/RrZXnK7ZiXqungICDni44A0LCY//IzybKAlaqRoXDyWV4gc37Rw==
X-Received: by 2002:ac2:447a:0:b0:4fd:fac4:2016 with SMTP id
 y26-20020ac2447a000000b004fdfac42016mr3459696lfl.31.1691870223346;
        Sat, 12 Aug 2023 12:57:03 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:57:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:52 +0200
Subject: [PATCH 14/14] ASoC: rt715: Drop GPIO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-14-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: HZ3SZF6VJRVISAL3Q6FUJXB6HQNBTMDJ
X-Message-ID-Hash: HZ3SZF6VJRVISAL3Q6FUJXB6HQNBTMDJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZ3SZF6VJRVISAL3Q6FUJXB6HQNBTMDJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver include two GPIO legacy headers and one contemporary,
yet doesn't use symbols from any of them. Drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt715.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 6c2e165dd621..1c70fa2d3e5b 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -16,14 +16,11 @@
 #include <linux/pm_runtime.h>
 #include <linux/pm.h>
 #include <linux/soundwire/sdw.h>
-#include <linux/gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-#include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>

-- 
2.34.1


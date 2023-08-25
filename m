Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC82A7881C6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 10:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D2DA4E;
	Fri, 25 Aug 2023 10:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D2DA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692951256;
	bh=DaVdZlNoV3LCB5Kisv0pjeG9l55LN3YUTaDA9GCuIHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sQiHIjoGjCti+HsZ1T7FnULWY9m+nX0EJkxRQlsTQvD9uiP+5maR/rPmdxcuXa9r6
	 TrO3ok1nht7tMPsQXeiTRKxbuWt3T3kaz2ASSbIIyRZpBhnfpLFLAEOvKsgeeQ2j69
	 A0O+cIB9gGoC34aByzJN0MOm8zQYTPjHg7GcY9cE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CC36F80571; Fri, 25 Aug 2023 10:12:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56FF3F8022B;
	Fri, 25 Aug 2023 10:12:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5629BF80558; Fri, 25 Aug 2023 10:12:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A13D1F80074
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 10:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A13D1F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UE6boKGP
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe1b00fce2so940476e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 01:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692951135; x=1693555935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dl5LD8wtUJwzoyPBhKwaRw4zVOgRkHeCisg4Hejkfc8=;
        b=UE6boKGPVqfXjOj6kezrHZuNuqoenlcbBk1UNq75Dzm0g2Pi9P0X9/2H+ehfTwgThp
         VeDtlpy3T7kyjtfxQ49VGYrCVg1ZGDaZYxuP7AY8TpexJxy7Bux81QenPI11jgpmOQQB
         JVxSqxJJEjUe8HksIlDdkS5iLxHuE6B7tLGJJomdLR82bq0GVOGDYZHgkUOArZcfkJqQ
         1Wuo8wyJvkN/8Wj4DI+iLmCefZmkJSf2KrxDV3tY21KQxQkKDsCm3+SDcZv4Ax2HN2rW
         LwST9/gqyG3fK33e++9Rc6bfQWz+d4ZzvsxL3QMoUnToF6BIENTY6o0X1JPUvmD4y5sO
         UR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951135; x=1693555935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl5LD8wtUJwzoyPBhKwaRw4zVOgRkHeCisg4Hejkfc8=;
        b=RYL3O03dfA4Mqt0gdLjbUC1D8qBdNqq7LMkOGZFxNxDsVJ6DL1i601tVYPXma1Rn7G
         mumCHqIemL7KBd+KiCPN44LCmmJESEydAQf0ayvatY7kGQxgct1bZcMlPTH9riQBQZuj
         T8ClQIAVIz949qau63pWI4JBEixUP+Yl6HtQhkJz66leOIuimUTfQ3/2c51yuO2dwfYr
         OLRSghvQtNYLMCLiY21E0Vs/acNe6nXGKj26Id4FWxKUOjvVsKavs3AhIRSdXm1xPT4X
         YspMhBp7aN6XTfX35lxHzpeidGl2W7DgQHQ50Vf6ES/FsE+5au6rOkXVbKh1730IK2k2
         Qsww==
X-Gm-Message-State: AOJu0YyhSus4n4EItGePJYJc6s8fdZDLDXSWFbdonaYefzRFByyLJ6e2
	Cnk0YM3mOc9+aByK/vUSD1sk6g==
X-Google-Smtp-Source: 
 AGHT+IGxHJkRNODVm8P/TbKsQyAV+vSBwvi23v8AHQLwDxjxd7+pzwYP7Kx6g7WRigVcKLEdglU1zg==
X-Received: by 2002:a19:6451:0:b0:4fb:893e:8ffc with SMTP id
 b17-20020a196451000000b004fb893e8ffcmr11486265lfj.17.1692951134839;
        Fri, 25 Aug 2023 01:12:14 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 q28-20020ac2511c000000b004fe1a35fd15sm195559lfb.140.2023.08.25.01.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:12:14 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Aug 2023 10:12:12 +0200
Subject: [PATCH 2/7] ASoC: max98357a: Drop pointless include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-descriptors-asoc-max-v1-2-b212292b2f08@linaro.org>
References: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
In-Reply-To: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 2F3WKWHSXGTSNBNXNBXK7XJUSFSF2TF2
X-Message-ID-Hash: 2F3WKWHSXGTSNBNXNBXK7XJUSFSF2TF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2F3WKWHSXGTSNBNXNBXK7XJUSFSF2TF2/>
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D177A232
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD13E73;
	Sat, 12 Aug 2023 22:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD13E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870588;
	bh=AHs0TBS534VDpZ4o1BLANUBD8Z0PdqOT+Is7pv02zUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nuXNYgrVMKWP4RYmwAfn3KovYc5pTNHTYbgGJ8ZeTXQ8YhEnSMhGctqTUjD7ZR1Z9
	 o4Ljdevo4INVLVAg8hnegJm3QPiebIYodYecL/pHfbEl7DmmiHHKNaWE93N8FndgYd
	 taqaC77gTzS3/ktQGVcVa3BJR3XtH1tREJFOuZZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4877AF805DA; Sat, 12 Aug 2023 22:00:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32349F805E1;
	Sat, 12 Aug 2023 22:00:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 101F4F8055A; Sat, 12 Aug 2023 21:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA144F80510
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA144F80510
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g7opv1tD
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe2d152f62so5024052e87.0
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870222; x=1692475022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZOLhHjKuDBfZLCcqXla+H1wF0I6i75in4cCXdLBit0=;
        b=g7opv1tDms3O6d0z8wjPzhnJWiuJRIYWwrt4iw6UcYJsFZ6iWBDmYKsvr6Wz+O43WI
         qDiytfrd2PAZDmGjuICIPUhkBDa+5PJwMVMYyr5nXdZn+dNZWT9VHfj2yTwNV6u8AhpZ
         Hjv/oldOs3zs2CclIK5VUe5XfY2lcD19eQXJpL7n9VfmOc1Rc+qJU4/z7V0pVcc59vFT
         W9GKYcPYYEqSimXzxoi2l9XFcfL/Q44VkKkjt/6fPWCLAW9jXdGoe2hXiyGSPoRftKFa
         Jv3xfcS6uaHryMdUxzZLWasyAcIK4Lxsq9djYxgVMVUWoSkN45NKEDK4egC0JyAsZ7iI
         nofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870222; x=1692475022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZOLhHjKuDBfZLCcqXla+H1wF0I6i75in4cCXdLBit0=;
        b=X2PLvGAQoey5N6v2nD0QtLv4UVUBqP6hzO1KeHCGH3YyZADVmW2PfMGSDGValUWBHS
         rV2ICy9DPB3rO9XGlRCxcxlpvpKhjce36Oricu9I+19R0pJStb800Dee5NPZxn8frxWc
         wB2AOSt18Nn/g3ICSzzoRdr2DruWXGYd4v65MDV0tzs/mg9CCrtzG9nMAjBEK8BIboUN
         qVS0Kv0JAnSI+5tn5U6ubojdJihC9DmxYn0pteI51081X9rVeJaFBTg2rhYOHTA8psDr
         Xbc9amxAvdJAXadh8qIR+YrnSelBcA4Zac0Vwdr59PPqDeY3M/+XGUqIoKv4vHHwdcGp
         rnTw==
X-Gm-Message-State: AOJu0YxWG+hTWr+bU8oqfJQGEfWJmz57cBisBMFVDKKEqz5GVLJxCJnZ
	k1t3qjhHW4pWfml7ptqoNwyEoA==
X-Google-Smtp-Source: 
 AGHT+IEu19QYx0jZ96LEO51YJ8uVpT9B2qofHJqWU2xiDe2qu1kqFFU+8ncZ8MPdCJecMD3WQ7lrBQ==
X-Received: by 2002:ac2:5452:0:b0:4f8:4216:e91f with SMTP id
 d18-20020ac25452000000b004f84216e91fmr3153918lfn.63.1691870222301;
        Sat, 12 Aug 2023 12:57:02 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:57:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:51 +0200
Subject: [PATCH 13/14] ASoC: rt5682-sdw: Drop GPIO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-13-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: PWRG57EXGSEJIAECQSU5W2D65G5V32HK
X-Message-ID-Hash: PWRG57EXGSEJIAECQSU5W2D65G5V32HK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWRG57EXGSEJIAECQSU5W2D65G5V32HK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver include two GPIO legacy headers yet doesn't use
symbols from any of them. Drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt5682-sdw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 67404f45389f..3d13ea74b074 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -12,8 +12,6 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/acpi.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mutex.h>

-- 
2.34.1


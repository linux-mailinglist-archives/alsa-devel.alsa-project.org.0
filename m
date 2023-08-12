Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC37377A224
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:01:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43D8193A;
	Sat, 12 Aug 2023 22:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43D8193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870478;
	bh=xi+1/QrwszevcbFq/0LZTLxWYoZ02VmNNMxeG1rKRQE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oBXyEoinbmUnqH1WXDmok6PH3+mcMrNCPG3YSkhQeJZ+4f/enjJLxUNGZJszsWQhN
	 XGaAHzBNfTBDAuhX9fmEaGZ5uiRIkpV3DadoNNLF/uul9mzJTj3Ey3FlbyRYtKrJdL
	 O4EB+rZcEcJxHCwRrkN9D7tSZlhwM00XfgyqeIwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD762F80580; Sat, 12 Aug 2023 21:59:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8880F8057D;
	Sat, 12 Aug 2023 21:59:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7D9DF80553; Sat, 12 Aug 2023 21:57:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E16CDF801EB
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E16CDF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HLKuxxsL
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe934c4decso3806638e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870216; x=1692475016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFp6ohpQAy0qgaCQvNHy6wTpHUejID3heF/y5EZlwqA=;
        b=HLKuxxsLNzG+9fBXfLsTJ4lMg7pp/9ZhiWQgY9OEeoUrUfqA/Vkom9akvWYupYDHmH
         0CQ1EdqEbYAJwIWfbMhNZPcA6QEDsgA38oE6rfmKNWTHuZQPinRveq41bnd6M2WeFe/M
         PeSrEBFd81Pk4IMSuAr5XHvWrVkAYD4ypLmaurupYOVqTavkIjii1Kbxow+ZQlCn3SIC
         mQu8WE+ZspJaTcdyYw7ZwoC1Hoo7ZnMapNas2CkeP6ihDUWOPRcoZzvlGOaHYeWHAx2G
         rDUnynscxVzejn2DEeI3EvT/U3WsBKB4EztJQjltDbaKe4C5fo3W8/kRZ1O0sOyfvuHA
         o3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870216; x=1692475016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFp6ohpQAy0qgaCQvNHy6wTpHUejID3heF/y5EZlwqA=;
        b=G4Zbu2wPwfPtr2lO60S/3SUsM/D7flOfdUq8uhWqYzLLi2dMEg3mVRCVNdz3Ad4zp8
         mLFVgsl8DZJqCp4PHn79/BaNj8iMGdZqn40r5nadWPNp8LbIiDEoENwJlacID3+iiwHL
         YcSTcKYiIVWUAPhw0vJ/IqKvnEm28NcTFzGvKckZVQjqysr88+V0lqFSxhr4PQevdFBk
         jCrYldmkM21ncJvOnd/TXGQ4th7bOz9IkBl5aVQyBLHx/dz3DSqYe+RHSAJtshBwlXmH
         u8t7FQcEl6+LfmXg78DGEE7MxfFLHoKPX5bbZP7c/hDMqLvl1koX0zCu5cWAgWOUTiXI
         1nBQ==
X-Gm-Message-State: AOJu0YwNOtAVFFci71mY24cuWRtmc5ZNmI4gPVPvsch5uGWedcYApXYh
	oFXVih/iQgRwPdborv/ASSJang==
X-Google-Smtp-Source: 
 AGHT+IFrad42poYZJOADdCM0/Oz/0ggXBbC/pjnaPvLhErWVxCZGe0TZApZuU9e5lsjZlwsM4qJDSw==
X-Received: by 2002:a05:6512:159e:b0:4f8:7772:3dfd with SMTP id
 bp30-20020a056512159e00b004f877723dfdmr4735246lfb.11.1691870216748;
        Sat, 12 Aug 2023 12:56:56 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:46 +0200
Subject: [PATCH 08/14] ASoC: rt5514-spi: Drop GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-8-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: TQXGCIOUPPNKD3JLUHFMDBSLXBG6NKQS
X-Message-ID-Hash: TQXGCIOUPPNKD3JLUHFMDBSLXBG6NKQS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQXGCIOUPPNKD3JLUHFMDBSLXBG6NKQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver include the GPIO legacy header <linux/gpio.h> yet
doesn't use symbols from it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt5514-spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 362663abcb89..3ee6d85268ba 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -15,7 +15,6 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/sched.h>
 #include <linux/uaccess.h>
 #include <linux/regulator/consumer.h>

-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CDC77A218
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 21:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 979FA829;
	Sat, 12 Aug 2023 21:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 979FA829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870389;
	bh=dO8wahu2ggv6eChMgYQeugMFnn2MUUTZ+SdHqDlKHnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fdxyCAQEeVaTQsGp6tE/jLq64FQwdxyB5ObuQeYc4VJReTcxFXGIJFYSt/2QT2EQN
	 zmsEnb8rQntONUvv57V4J4mDtCANz2h/WljAUmRuJw5rwsI7/LewMM+cj5UpPzuQYa
	 Xv6JyPCAhAb3SnwBf4IMz03GyBVCXYdh/uA4a9vE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 997B5F80563; Sat, 12 Aug 2023 21:58:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A69F80551;
	Sat, 12 Aug 2023 21:58:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 703ACF80553; Sat, 12 Aug 2023 21:57:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 80C5EF80134
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80C5EF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NAhMbM59
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fe28f92d8eso4869769e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870209; x=1692475009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWfVbPxe6pLHw0PJClWoga5Ee9u2ZK8xEvPaP3dj5KU=;
        b=NAhMbM59ePSVz+eoff551Rlvf3tX4RlJL08m5mVpwQUMmROS/sYMJM5p3YfccCiOmG
         JnhC7hL+dV9VCRdBW+zbJf10ATUmsl7VQ6oRXstrabUvsSeZvHY3DX2sug7PKlCFAGoQ
         gw4/+cMnm7Qig1npfb8ciBCC0Hkzf/ccdcOBwsvzuWZviowUE10Wu+ti3VZ9giRFyDn/
         rccttZcQ6xNjwWBV8uc/7FLr3pBLpjItC+rvXI7mzraDlu7K/fAkpBne1IzeXQwFTQtA
         7o43dDlW2J+UKDyJ5GHZnwyiBHocYgBlyT9l7cEGphfdfpnd2taidfbsW4RzTVnLPLi5
         kpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870209; x=1692475009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWfVbPxe6pLHw0PJClWoga5Ee9u2ZK8xEvPaP3dj5KU=;
        b=QY/Pxj/dPEEetltbjDbpTSaMuiN8NoZYBxt54jf9RKwoTAKsAMTRkiqelV0ICexWFK
         HjAmbUy4/ui1u9E+NbUSJCBmlT8HplP5OVrwdmr14DE23glv9HtD+ybdusp4Cs4FePQ5
         CjcVlAUhpsTHizCvPvAczRON4AhmzXnkUvyrY4E8JhiP0imE+ABPMN6ej0MR32ZiEGeE
         rzuTyWrhFIKWOxq0a/Ry7PZ/ZIeTbR1cWSHfpFZeXTEqYLAT835DfUn/Yaoy9/bd1DeA
         BdLmIQ31GlUuNBCkocoz1X5Aua1NRci6FxJ/KSUA11fmrvFga2kBs6n1+hJFDUxD0wkE
         GQ8A==
X-Gm-Message-State: AOJu0Yz6AoixhmwAg+qPapKLNduirinVCgRfhNCgP5k1RcGOsjfLqw6a
	ZO1D1aKqmxgbeSClC1sS1ZoYIg==
X-Google-Smtp-Source: 
 AGHT+IEsvenVnsCRuiXEU5fmXIPlw4xiavXtVVagdK1ZX2jt5Q2SVY4vSn8JIpplF6KPPKyIQqsWnQ==
X-Received: by 2002:a05:6512:2212:b0:4f9:5781:8628 with SMTP id
 h18-20020a056512221200b004f957818628mr4788088lfu.24.1691870209471;
        Sat, 12 Aug 2023 12:56:49 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:40 +0200
Subject: [PATCH 02/14] ASoC: rt1015: Drop GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-2-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 2GBP2A4FOF2XZ5ILNKG7GDBPUEUIPRKU
X-Message-ID-Hash: 2GBP2A4FOF2XZ5ILNKG7GDBPUEUIPRKU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GBP2A4FOF2XZ5ILNKG7GDBPUEUIPRKU/>
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
 sound/soc/codecs/rt1015.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 38d9f69b08d6..99ec0f9a8362 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>

-- 
2.34.1


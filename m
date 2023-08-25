Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0968E7881D1
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 10:14:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A64CAE9;
	Fri, 25 Aug 2023 10:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A64CAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692951285;
	bh=Uz6E8HLxWI35ovCMD+J5so9kCTh/4AIEHtwt/doxIgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BZVRvbnSHl5mRJwqkAdqnmuA9MgdrrZwvMX71M65rbKnPTl0vW8SRZo6fOQTHNlTE
	 PMsD1hduRFe7EXK8tO6AOm8A/4c8vVvqHZJPm+Q8obpZ0ET9Bhx5ohyH6+GQKOmf5U
	 t5ppw6rS+vbvWdB/cZtr3ijZ7/Xlc5BpAnxP0T8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10F02F805A0; Fri, 25 Aug 2023 10:12:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B37F80587;
	Fri, 25 Aug 2023 10:12:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14D37F80568; Fri, 25 Aug 2023 10:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E341F8023B
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 10:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E341F8023B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bPi55yZm
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe8c16c1b4so916199e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Aug 2023 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692951137; x=1693555937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/HhJkYfqyaXs9yIGYFPPzlpsmAC+qKTgrrYF36b8es=;
        b=bPi55yZm+3mup9ggSLUCjMWmRb49okeCF+W/OznEmbeZRtK02YnHTszrQ5+Yy1lVJE
         FtbEsbpuiImJA7hZOJNZCCRgfo0YFxdKzRiKy5UEzNhL+4M53w7sMmYRHZOG7ewHXJF1
         BGPt8tIiHS34hZgZkYVGV0pg3iYwr9/LpwQwMeStJUz3XwO4kMfB6XH/0W6V2Bmphf5o
         O3mmgi3GY25eEL+fFun4wUcaJCesVXoeNpS/trH8TQeIMS38WSV4b0MMNYAWKb0boreu
         7cW/63vZlUtX245mPHNpyw782/X9SAa/rAKyRgmXzZkGLLnXiCqFdpQDiQmQsAIYCPVD
         +hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951137; x=1693555937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/HhJkYfqyaXs9yIGYFPPzlpsmAC+qKTgrrYF36b8es=;
        b=isO4taExrQfJfEiudChzTlg9BpApn6QvjbHuF6icFAcz0tV1O0O6qUx/kJWCPnZna1
         n3evsIUEIh02QcCgZ634aI94cQUQi1dWL8ZPFGKLuWkzosOTK2JdM7DeqWA8MfWyRVrK
         cF+EzThHfG0oqimGPB81+PSbOK5oTUuoqBc94LCmo/hig7eRDHDQlR0BwI4pC7oRkutP
         b8hCw6qS+ypO9g2dtkfGoNH77KDkXKRzd4WdDFEJcZItXVqB0s9AuIrZ391Syv0VbkP7
         2UYz9QXIQpVZkeGYv8FP05zwnVJ0YcSqIAEJXH9Eh3M6opiWHT5p6Q8FSMSYu5+MeozD
         O85w==
X-Gm-Message-State: AOJu0YyMzU1qDjELqrcwOdLjrdEhm9SNC85IieL7bKfl7UktBqKV75uC
	b+lXqNU+uBQrUNOKKE2qjdocSg==
X-Google-Smtp-Source: 
 AGHT+IEyHJmheRscOX7UBeg6Z7DcJVfwt0W14guOb3+tSfGq9EVhRyrhY8ha1hu6hxSTW7rsulAyig==
X-Received: by 2002:a05:6512:32cc:b0:4fd:fabf:b6ee with SMTP id
 f12-20020a05651232cc00b004fdfabfb6eemr14730764lfg.9.1692951137399;
        Fri, 25 Aug 2023 01:12:17 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 q28-20020ac2511c000000b004fe1a35fd15sm195559lfb.140.2023.08.25.01.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:12:16 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Aug 2023 10:12:15 +0200
Subject: [PATCH 5/7] ASoC: max98396: Drop pointless include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-descriptors-asoc-max-v1-5-b212292b2f08@linaro.org>
References: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
In-Reply-To: <20230825-descriptors-asoc-max-v1-0-b212292b2f08@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: AMYJZNLUPDTYHBAY4XM72GKR6S7Z7ODI
X-Message-ID-Hash: AMYJZNLUPDTYHBAY4XM72GKR6S7Z7ODI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AMYJZNLUPDTYHBAY4XM72GKR6S7Z7ODI/>
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
 sound/soc/codecs/max98396.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 3a1d8c211f3c..e52bb2266fa1 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -7,7 +7,6 @@
 #include <sound/pcm_params.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
 #include <sound/tlv.h>
 #include "max98396.h"
 

-- 
2.34.1


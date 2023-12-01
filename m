Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE90800BB6
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:22:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE2489F6;
	Fri,  1 Dec 2023 14:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE2489F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701436930;
	bh=WI/twEGHsi9gKS/venwQAPiDjbuLKdvLJUifKTl1C7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bFIke3HmIbYWE6x6GqYa67C6dgEQAtzOao7Usn3Lf9j5/usAaGLMgLkLiCcsVnkMX
	 tZifKwGfh5qXO0llbw3uhO34zHjX35hA61vzlWMPbHVPp3AaTbxvbfRK/MKOu8ELM3
	 RytWVcrQJxVeDH71llA6Vwd2xl7Pit4Xi+cXeDJk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEAB0F80604; Fri,  1 Dec 2023 14:20:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7422BF80609;
	Fri,  1 Dec 2023 14:20:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F15E8F8016E; Fri,  1 Dec 2023 14:20:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C3FDF80114
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C3FDF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HSuRDzgc
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50aab20e828so2879212e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436839; x=1702041639;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1YwCm+XH2HIMFvp7NT2GALpzlzAqPDpRrGRX4ZS3D8=;
        b=HSuRDzgcD/jJMtQi1krU3xgs7xIM9mybAy3DmdRS6I9O40xQZq27LLdB8iwQ4QWV33
         rIonyrAR9rqT4Pa5kzvH7gWDswpopEh33cUpZiePtPUxzmSfntZ3gRSP1g8yIZwZkqEJ
         jkcD7oe3W4uv0jbsN2cyyj6wPFsMcFdbgYztuP7b1uaTZVqWG/vjURp3uPWPFlfAGumC
         rFZBKbbNW5Ml3N1Nv2cydpMUq6/6tKEbltMs6a8prnqvxDYNNAbuAQSP3PNIxgX/uz6v
         LUVWFW9jpH6CxgAvo3MAWqHb7VNEemJSMYK5Ci2FPT2rdP1fECdtmh1W9I4BguCCMKcR
         9WPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436839; x=1702041639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1YwCm+XH2HIMFvp7NT2GALpzlzAqPDpRrGRX4ZS3D8=;
        b=GMIdb2cCDECiNemPt0fUx6Oug4pcOTQKcKk0oW00u3djRvlCOEUjCfJH1+SJZ10eq8
         emmCiV1frguZbWOTS0RV5JHWtJGc46wJp8h27ZGR6gmDTDgXyuJzk9AxIf+XkUMmPrRK
         hqdVS3pnua6CnqQJ9xzIy3IgdP9FRG2m5qocSMJ5pr/bCprYnuUpgCXPvZz1uKoiGfMw
         5J54cms1ZVLaZMA8gG081ZatUsX5EPYpOcgmiFMP4NqRI8ugTFDATEcgMFM2p1V9LwZr
         jOTeJTeN6d1j6zxTtSuspBLzhlfAgJR2askYXvgGR3YrYHP7xK264Gvr/keYz+mQdnqh
         Ol9w==
X-Gm-Message-State: AOJu0YyoZo2rhzjnd5nyd3SeN43qAFDJD2o3qp8sFhsMCEeGhnn0JuJP
	TKrq3a1QZXuMTGsSbVcR+BOCIjx1aVrANI5GKfA=
X-Google-Smtp-Source: 
 AGHT+IHz0vX9CqCj+qD3UQTWnTMff91+vQiG2xdvgEoaXCXAVJNAM8ut2DNGIFy42sB0tfaYdArJbQ==
X-Received: by 2002:a05:6512:1597:b0:50b:c9c1:19ba with SMTP id
 bp23-20020a056512159700b0050bc9c119bamr868333lfb.63.1701436839678;
        Fri, 01 Dec 2023 05:20:39 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:39 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:36 +0100
Subject: [PATCH v2 07/10] ASoC: cirrus: edb93xx: Drop legacy include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-7-ee9f9d4655eb@linaro.org>
References: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
In-Reply-To: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.12.4
Message-ID-Hash: HKDZIMCRAIOG5YCLPBJQ566KVE4ZEY2N
X-Message-ID-Hash: HKDZIMCRAIOG5YCLPBJQ566KVE4ZEY2N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKDZIMCRAIOG5YCLPBJQ566KVE4ZEY2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO API <linux/gpio.h> but
does not use any symbols from it.

Drop the include.

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20231122-ep93xx-v5-38-d59a76d5df29@maquefel.me/
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/cirrus/edb93xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index 6b6817256331..8bb67d7d2b4b 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -11,7 +11,6 @@
  */
 
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/soc/cirrus/ep93xx.h>
 #include <sound/core.h>

-- 
2.34.1


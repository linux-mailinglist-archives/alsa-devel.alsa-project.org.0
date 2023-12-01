Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A3800BBE
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:23:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E59C9DF1;
	Fri,  1 Dec 2023 14:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E59C9DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701436985;
	bh=qpWJYdxwgKfY8zfX1GAh9v+YiF3ud8r07y0eRkDcrnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eTZABg7BADYuG9KUNiodEKiXYrLv1W8R0fswo/K6t4Q7BUF5v5oEjW8iqYqB+cC2X
	 e0FAUiQMyiG871DqNlJUvY2RuT6AOiveyFK3BseX8w2mSb0k6gDHTXKrfx9h8jsj8s
	 EYzeDsaezK9TqNn9lqRh4ffLkAEUTpSPkJaTs5mM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 987E5F8069D; Fri,  1 Dec 2023 14:21:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CA3F806B5;
	Fri,  1 Dec 2023 14:21:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A6EBF80612; Fri,  1 Dec 2023 14:21:00 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 781FCF802BE
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 781FCF802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=leq9V58c
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bba1dd05fso2952790e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436842; x=1702041642;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2Zjl+ghnoX/3uQpkhvwTgBBfYBwCJ4hUzQ4RLGrPPQ=;
        b=leq9V58c5qwINpsYiiqU0JSUtSGZzubavrfpk7ndBfBxIMgsAgaRwyV/+E1lSLKt9s
         BCFipqWsyX7m6N/00tXmv2KTcf/5HFlLnK5aP4QV22uAZFuCsz1b9traHjMOhsQ950j4
         Bop3c54kgl8/6UllCjSrP1McXhYPTvlvXj8kRmvzed2f5UxMzPLl7jIwI8DPdMnmKh8l
         1ZNpOejbooqfW1g9NCZ0eXUaIvvdCGMQR4FOB0bMm8Ip8VQycFUgJD20tmmRgJeOZmy8
         exdAtCZjqyDrNlGVMw1iYYT/Idpfx/0h9b6OQYK+wxpzRW69Xlz15RorG2+YQHMQ+J1M
         5pZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436842; x=1702041642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2Zjl+ghnoX/3uQpkhvwTgBBfYBwCJ4hUzQ4RLGrPPQ=;
        b=ROdVAGTsQKBhWdIqPcvD4u39/YsIyaz+7t16q7TLjQCuXAr0Fc7Fydf6GhgvWo65hA
         UHLIGEUhSo2C/J1JFzn2KQ0AJZSXg4uxgpUjAknrfIVXVZLg+EkIiLEG1QOldeO2sUNH
         Bx4FQ1t+IW6JfCOSRq4n1FXxxnHLo1lhfNob1BT5ydTblIU2AyTR5fqh1Ln3IdmJa4b6
         5H1x7ZYF8b6bZzfqWYPC+rOMxbb6EQgE7brqaqTzLDjO2ZAMAwQsy7qsBQy1rgdtna21
         VdSoS/pbmKta4TEXRV7qOWol4l8mtcgrFJ/CFgER9cQgf6dEhR1VoHaMBJGIuxYlmrJR
         921A==
X-Gm-Message-State: AOJu0YyfIIhCaHQthO7fxJdLS7cokPy2wDE6tVsHyNBbRTei20CJVuKL
	KU0UBrojiUk4PQwo76ewbRqTE26KXAUuqJMjwcY=
X-Google-Smtp-Source: 
 AGHT+IEP9YooEM6UIg2kUPyWgnGCZVy2TmLr2VGSLb6afACF8IimZsUAaROd3HdHHX8+hnBq6Qopkw==
X-Received: by 2002:a05:6512:118f:b0:50b:c7b0:ecaf with SMTP id
 g15-20020a056512118f00b0050bc7b0ecafmr892089lfr.49.1701436842052;
        Fri, 01 Dec 2023 05:20:42 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:38 +0100
Subject: [PATCH v2 09/10] ASoC: cs43130: Drop legacy includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-9-ee9f9d4655eb@linaro.org>
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
Message-ID-Hash: 2DGAX7XH6LPI76CAGA7RQDHGKPZG3YUA
X-Message-ID-Hash: 2DGAX7XH6LPI76CAGA7RQDHGKPZG3YUA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DGAX7XH6LPI76CAGA7RQDHGKPZG3YUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO APIs <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from any of
them.

Drop the includes.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs43130.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 0b40fdfb1825..18933bf04684 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -11,7 +11,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -26,7 +25,6 @@
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/completion.h>

-- 
2.34.1


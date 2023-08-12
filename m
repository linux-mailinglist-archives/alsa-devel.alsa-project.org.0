Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF8377A227
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B5F8DF0;
	Sat, 12 Aug 2023 22:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B5F8DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870523;
	bh=LI+P0GKk7A1bQ3AEFJVMrp0176SOOFFEJNknKLecB3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B/S5xMAMUDMf/m8nlM/J+y8HI4sA/CJcoub6FJZag+uktWvsU1AJmKmQGm1lnaIz0
	 rOqyYgZhBLBFQnnGSb1JtUHoVxqq9uuXJ4vSPgdDIxmdqesLpHMEEr/LtexjzUUeIk
	 9RtvV1sz8rTHV2Rs/2JufMYlCsRzf5i+jBTr9nO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92F9AF805B5; Sat, 12 Aug 2023 21:59:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAED5F805B4;
	Sat, 12 Aug 2023 21:59:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61957F801EB; Sat, 12 Aug 2023 21:57:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 79D89F80551
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D89F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=V4RrNVkm
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe934c4decso3806587e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870213; x=1692475013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+jObdMKSESaARWvH4sYIIFj0cX3x7m2NcZ1VMPhPPg=;
        b=V4RrNVkmVM0ijTjz6pIpW/B+eNcie2OgbbUYMjk1rrgyD5OutTMoV+1r7a0C/Aap4J
         NR9SZO6fsn2ck9fkktZXZbNmmxJGtIyFBpThrAHtfafAztlxhwI2aYclAkXyBcGm9b3o
         fJyLetwaqKZBUaT+VXAJeAwtoRTOLc+zpPu7BFh9Dq5Fv/BcrY/OsXDjMQSRjlZF7wEz
         85j3KHd274cWLXS2af+2bptb0CAWriyd0ou0MCbtX2/PsO3hE2xXT61Y/m69exYA5vku
         aEDJ+pM0xbPXYDNNFE9oNXIQDR3Ta9ufT3F2ccQlVbKovcsY2X10WslqKaeS3PUR+cY4
         lB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870213; x=1692475013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+jObdMKSESaARWvH4sYIIFj0cX3x7m2NcZ1VMPhPPg=;
        b=LJl+ZlqVtj9lmLIDewy1WP+5LTPDnzQqBzV52ShUtpQbREolWAAXSOTn7DcK6ezr+T
         10vKobzMkcotGv5RuJhH+DLDI+rajMiOI2u065ZRTA8O6kAXhumw/0QfasuZzKPKts/C
         +OtcP2oBNf0GGvoVp7NXaZ6zb0tz/uRLoz553BZJQ7yaeTk6HcCaMmCkjs0/yRfqeQyI
         +FZGMMvJRYlFlItRqyJi4bMFV79OGsee7qSlHMoPrCV+2pqT15zVnlapBy2I1gLFvxeR
         W0Pbjj6qCBDb+Rc5NnsWJMmQVtLDe8CuWoTVEpHqX0ZV+Symot4DMuYtycPOC3LBUFPt
         A7bQ==
X-Gm-Message-State: AOJu0YzYYlzu0cSI4lPZAX1COla3/DNPSJOjqQfGn5KsYc5E95mVP6BZ
	greazfTJDf+IaOWd/I8ZNtvBAQ==
X-Google-Smtp-Source: 
 AGHT+IHyb1vwhHnjuIMbdJ3qHM7wISjVjYq785y8Quj3jbA+tvB4M41iQkGH+FKy9lUay4wPGtMwCA==
X-Received: by 2002:a05:6512:1048:b0:4fb:8585:eefe with SMTP id
 c8-20020a056512104800b004fb8585eefemr4852964lfb.57.1691870213302;
        Sat, 12 Aug 2023 12:56:53 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:43 +0200
Subject: [PATCH 05/14] ASoC: rt1019: Drop GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-5-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 4R5N2YNSPSCWUNUDMX33AQ6LP4XDOWWM
X-Message-ID-Hash: 4R5N2YNSPSCWUNUDMX33AQ6LP4XDOWWM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4R5N2YNSPSCWUNUDMX33AQ6LP4XDOWWM/>
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
 sound/soc/codecs/rt1019.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index fd55049920c1..ceb8baa6a20d 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -18,7 +18,6 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>

-- 
2.34.1


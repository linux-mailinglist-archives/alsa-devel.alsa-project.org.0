Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BCC77A233
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 931BBDF9;
	Sat, 12 Aug 2023 22:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 931BBDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870617;
	bh=3hJkTSgjdvIto70MIzUD6+7osHRCC4L3Bdrhw70bpIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nAvk4fOynHz+mQWedMBcmOgtHatk0ERvD34PzGhDD+TKJ4VGsAYr7mvZ6+p5XyFpU
	 8XlMZtz3nXltW/AbUQv5TdghNd/to0vpsnI+m5Jc6EDjMEeQv9TclE3VXuv/Cw/GKz
	 D434JGAVX3f7QlopGa6jWkn5VBpj5MZOGmk9MQa8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FC0DF805FC; Sat, 12 Aug 2023 22:00:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB3C3F805E4;
	Sat, 12 Aug 2023 22:00:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86366F80510; Sat, 12 Aug 2023 21:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6542F8016E
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6542F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=H2CIsnu+
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe44955decso3540701e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870219; x=1692475019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0crdb9cw+jjwI8pN3ZhoF0R0PN/j+2M0tGVn01qC/g=;
        b=H2CIsnu+od6hFKeqI7TH7aKGc9aH0I/R++IS+uEzgdApJKzed7JZuynfLxkUcHUdWM
         poe/X6r4Hhpt9NqG2eb0Y09wXb0QFefDr1OyWIb8uYMTp5bkwt3XkIc/qvmFup47hjDL
         eDw0iLqBZV+S/WDoQCee7J1Y9a/mLdFbaV9hgKkUK0jAidOOT7ehKqQOZKbQK5LQQ5a8
         dCZqLS+bbMyiPHCXfmpoDkfx8y6YR3H1PDWUKkUz5at6gq5zmyC+eO9q56hZVd3hDBLl
         Ry5MRqnRP51vlboOPj+DZL+NYG1eDAv7SRBpdRIHdPD5ynCXb8bVUfIVg6+pnzlnUeJv
         z1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870219; x=1692475019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0crdb9cw+jjwI8pN3ZhoF0R0PN/j+2M0tGVn01qC/g=;
        b=BcS1ajyaWaWHv+YB7+z6hClpe4OTTxWSFjGeGQKGnOCceBvqMXVquIceT/vRGpBXAW
         2sdrKq489ga8FVn+LRfw/4nIxKHy2K1VBvjjFmSco+8SfZPIKN4HdyoORrco24M9TUpN
         DvEZgwJDtrR8E0bPN/+2EsLPJFkwTKMgaNRZ2F0x2w43OON86DWsQcNoRkYiaVZJLWa6
         N26h41c9bxkYFZ0tt6n4GlYUi7IsD2nd63jgtNfnYyrK7zyES0dTku2eIwQ7scwlyvCw
         5AmH00VcWKf/heAiJbfj9zcDj9SJClaY+oFEBSaKIbB6WMGQoH6511Xs7PI8tvH7tSej
         OcHg==
X-Gm-Message-State: AOJu0Yz6zRUTDerXWanm5huj6TX6aOVDU35UH315Pi9uRTlGwljUAPRk
	533luakXsVvNyQhDuzXxx2F83A==
X-Google-Smtp-Source: 
 AGHT+IE8gCqiErMbQX4Flaf4yvnwSMdbXgZwdnOvhLRn1rUy6fgQkLn7KEb/MbhUTFZESt3ZGs4Z3g==
X-Received: by 2002:a05:6512:3111:b0:4fb:8938:48ab with SMTP id
 n17-20020a056512311100b004fb893848abmr1537577lfb.16.1691870218857;
        Sat, 12 Aug 2023 12:56:58 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:48 +0200
Subject: [PATCH 10/14] ASoC: rt5645: Drop legacy GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-10-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 5LNOR6AKHAQ7WGHLBUCLDODGYQ74CNDN
X-Message-ID-Hash: 5LNOR6AKHAQ7WGHLBUCLDODGYQ74CNDN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LNOR6AKHAQ7WGHLBUCLDODGYQ74CNDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver include the GPIO legacy header <linux/gpio.h> yet
doesn't use symbols from it. It is using the new consumer
include <linux/gpio/consumer.h> already. Drop the surplus
include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt5645.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index acc7fb1581b2..1a28fb541255 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -14,7 +14,6 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>

-- 
2.34.1


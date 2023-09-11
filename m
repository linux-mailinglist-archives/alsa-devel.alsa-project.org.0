Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34979A600
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5155FE76;
	Mon, 11 Sep 2023 10:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5155FE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420829;
	bh=hqqvnfLqs7/1M4mT2xT+hGNk+Y0q7axiK7nmjfTmXZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bieXXx8wNwX7ARjasugVdMGnCIf+0YS4vszM2V1srQaIePd7kIjVhZ4H60/dhdmb1
	 ZM4DnU/9kyJ+RE2+z1TEdV3TwFRGBTnlNkuvf4XKY9PWEQQpt1/WPdwfnJ0GCtdR7L
	 nvV+J+0HgejSRs3PpuHiZ6/UjO+1QfvgLxCQSvBk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42805F805DF; Mon, 11 Sep 2023 10:24:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9629F805D4;
	Mon, 11 Sep 2023 10:24:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 588F5F80425; Mon, 11 Sep 2023 10:24:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF28DF80537
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF28DF80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NiofoqTa
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50078eba7afso7160145e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 01:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420635; x=1695025435;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44JIVg8xfT/EISToMUTEvN6PJWh2bmWBrdxrTpht5uo=;
        b=NiofoqTan7C7uNUK8Weqamug19/qrZ4a1z2Cx3sezFbMBKpXyKTFjV7j1ZSs0DgJ9M
         cOvgtXkkISJX4U/pm1z7pEOY0/TNc0EFm/IdDDwrFF4v43pAQ3UOfupzhh7BpJUTJ/OL
         N9ljduIxZimhaIYaSFd1bZ9gR2PqbmO/HBaGTS5kUvBW63FycpP3Uf2d/+71U44GxpRu
         t3uFw5ekE5rkCFyl6968rDpYCsCpZi/JpijUR7zTbMus41ZkT8wz48nyHz/wNehOPup3
         9XtVsv7boUQHKBv5+cDfYYkBgzMsuOfQYwocC1X5+vmmdXvT3oP1X801ZT69azrLu8VS
         iKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420635; x=1695025435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44JIVg8xfT/EISToMUTEvN6PJWh2bmWBrdxrTpht5uo=;
        b=ug0OT/dG5nkc5n/hYFkUgO5xxCpDSflOo/FwGXh9hR0DN/+s8YAnhiTzplHiEtuuM0
         7k3GUEByImqvavUD1XYvm7oao+4QWs9cm7G66GcaV7keff0lJaSD7mdcpgaGeKaqnH7q
         CtQ/GeuygnAMtO4QF34rjjqe/FATv+Ay60VmzwXSu5jcaSGY2Dd7uwToXzt8O+Sl5u7l
         RDoW7VAJh23PJTcQ8HLpJ79q9B/jEaly//0vJIy43JyyB6gaNgRJxQwtLXyG/OuBDIwk
         S2aN7JnuqAJPWkggTy1T2dTBIkLgqgOfOjUFgG+RsnZFoyCQJ90G3LCaXtTJPoPYHh9O
         Fy9g==
X-Gm-Message-State: AOJu0YycV4iCqCx4+hyrNtMoBcucUO8D5Lm6gljf8F50nf86bhv6U0qj
	nx8KggDURLcG6IdeB1BdXDYEDw==
X-Google-Smtp-Source: 
 AGHT+IEQ4w417/0zEAT3z1jUW5wv9C0zAydtmQXHmAkRjf5g/xJFpgA6Pz1UnIvmT0XiSUbE22ZM/Q==
X-Received: by 2002:a05:6512:2211:b0:4fb:8939:d95c with SMTP id
 h17-20020a056512221100b004fb8939d95cmr9556754lfu.30.1694420635138;
        Mon, 11 Sep 2023 01:23:55 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a19f808000000b00500968ddca9sm1247712lff.136.2023.09.11.01.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:23:54 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 10:23:53 +0200
Subject: [PATCH v2 6/7] ASoC: max98520: Drop pointless includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-descriptors-asoc-max-v2-6-b9d793fb768e@linaro.org>
References: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
In-Reply-To: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: T5GRAKABPN4HVBBZ5RM5WGV3GV7VIGUK
X-Message-ID-Hash: T5GRAKABPN4HVBBZ5RM5WGV3GV7VIGUK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5GRAKABPN4HVBBZ5RM5WGV3GV7VIGUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver is already using solely GPIO descriptors and
do not need to include the legacy headers <linux/gpio.h>
or <linux/of_gpio.h>. Drop them.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/max98520.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 8637fff307ad..edd05253d37c 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -11,10 +11,8 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98520.h"
 

-- 
2.34.1


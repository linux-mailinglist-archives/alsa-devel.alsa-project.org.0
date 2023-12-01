Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C6800BB5
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:21:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9567ADF2;
	Fri,  1 Dec 2023 14:21:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9567ADF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701436916;
	bh=j5nXZOiJ3idBLVoIhOYwhLKDUXVq35cNaJxQGx+hM7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nChTjc2kkUDc8Fou52Hbqqrd0glE0WogfsSH8+P+PPybVkCWdMqtkWqDqAaFCoH3/
	 TjIyAXwtoo0jtTjUGs+Cdwa8ywCqJMduvXU9AZlQoxUygj5uk7hTD5wwKLQgwo2ve6
	 wzOc8m7H21JKxyraawx+4hqP5tAB3jpUb13DjbH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5D84F805E5; Fri,  1 Dec 2023 14:20:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05B15F805E7;
	Fri,  1 Dec 2023 14:20:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6067FF805C4; Fri,  1 Dec 2023 14:20:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13725F8016E
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13725F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VWQ5OTLP
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bd8efb765so997739e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436835; x=1702041635;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDKFgSOaPuVFur80bPhP3dFYnn3zUMFtVllkw5He9o4=;
        b=VWQ5OTLPEpeSoGDQaMyBJ2PVERWrxdCL6YHpROFj6+NDWep9Sjs5BylRTZSHgOTRIm
         2wH6Zu0ZzXbq1t5s1LaCyLb7VpL0JkWei3EdGrhQVdLPLtsu2wHhMxHSF42kp7ovYMNX
         onXM6kUGZPJIii3eegLmWgqzKjmyGlqTMzCjnMFhJFs0YwbkxwQ5IsRAZX2kCTON63F+
         0BQmSii9RTuaIbGjYkANrUsNb5llsYOrAUe6tuS+Aov5hvQ5QXPv8eFkwCAJ/L2OCCmz
         L+554ZGh15NVsoImFN6mVmUK7zm/1pV1RPxfgEDZAzyn3dzE6tH7FL7FWvXgf+ffzZI7
         dtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436835; x=1702041635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDKFgSOaPuVFur80bPhP3dFYnn3zUMFtVllkw5He9o4=;
        b=TRqxCTizWRnW/7Xf/P1fHU1CDByfaWvzzUDwCDDS4OQDPt8V0w/rgOCQOKkMt0cejn
         5o4M57bZkMfX9yDeuwXaIgVU0LqgnsQdD4C+98eDR7obnNtFr6mw+Hp8StloEUkejjgi
         5JszGNuP84FMieWiqBAX+2sR1yimsokTQgkBzp/2QI8KwCmHF4OyFRiRE/2pv5fAIrGa
         4umsvO9trPwvot0tZbjxZB1apxbvLwGaLScc+QC8PjO0gV2p9Akv/rXNsH/1/oGJiz5A
         ANF6LAVytmkhqmhoHxABHc5LJJIZBPE8TQ65leEf9nYp+VimtnOtXxIrGdSjItPJnp/9
         Kbaw==
X-Gm-Message-State: AOJu0YwKFTEYusIGodOZWTHeSxD5k9Krf18mM4ZdBJfC52GSiuc5n3Us
	W/b6NqJkLllaxE4oqZjw7zX9PbWz/uIsEh+yKSo=
X-Google-Smtp-Source: 
 AGHT+IHPhwhCcZemWJXPkwH3F0g8I2ogdr+dlRUEBR2WBwxAYjUakxV0jDfSRYYeCIC7/cyqXFUOUQ==
X-Received: by 2002:a05:6512:615:b0:50b:d764:9683 with SMTP id
 b21-20020a056512061500b0050bd7649683mr765669lfe.103.1701436835426;
        Fri, 01 Dec 2023 05:20:35 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:32 +0100
Subject: [PATCH v2 03/10] ASoC: cs35l34: Fix GPIO name and drop legacy
 include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-3-ee9f9d4655eb@linaro.org>
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
Message-ID-Hash: JH6SFEZQWKZKNAPOU4CKISEYI5GZHSKM
X-Message-ID-Hash: JH6SFEZQWKZKNAPOU4CKISEYI5GZHSKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JH6SFEZQWKZKNAPOU4CKISEYI5GZHSKM/>
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

Further the driver is requesting "reset-gpios" rather than
just "reset" from the GPIO framework. This is wrong because
the gpiolib core will add "-gpios" before processing the
request from e.g. device tree. Drop the suffix.

The last problem means that the optional RESET GPIO has
never been properly retrieved and used even if it existed,
but nobody noticed.

Fixes: c1124c09e103 ("ASoC: cs35l34: Initial commit of the cs35l34 CODEC driver.")
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l34.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index e5871736fa29..cca59de66b73 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -20,14 +20,12 @@
 #include <linux/regulator/machine.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
@@ -1061,7 +1059,7 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c_client)
 		dev_err(&i2c_client->dev, "Failed to request IRQ: %d\n", ret);
 
 	cs35l34->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-				"reset-gpios", GPIOD_OUT_LOW);
+				"reset", GPIOD_OUT_LOW);
 	if (IS_ERR(cs35l34->reset_gpio)) {
 		ret = PTR_ERR(cs35l34->reset_gpio);
 		goto err_regulator;

-- 
2.34.1


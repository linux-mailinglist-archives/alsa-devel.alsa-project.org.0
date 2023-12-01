Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BAA800BB7
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:22:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE7A9DF0;
	Fri,  1 Dec 2023 14:22:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE7A9DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701436947;
	bh=fLv8aJmxl0SpeItNrMv3KkugxslAk4nYcFru7ztDXXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rRM8iVYL58OGr65aGIvL/zxLMNeYWvtPgwCV7+Un51Brgysii5/v9kIaEyJhaSDIs
	 KvN3+woS6rgq58rj1B23OqDP69thxeCmsNtlr3VMuEexcRHVqh/HDJ+5NCnOh0Hvq5
	 c7upYW9z7xWHWTQHxVkqkNair76uBl58VfFaaEq8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 655CFF80672; Fri,  1 Dec 2023 14:21:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4758F80614;
	Fri,  1 Dec 2023 14:21:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3227F805C3; Fri,  1 Dec 2023 14:20:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C27C0F80166
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C27C0F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lsS4oB3I
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50bd928b13cso974195e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436834; x=1702041634;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvwEnfEWC7X3PkrakUYA7rH73mlgP4mcx3Rphz/0vOk=;
        b=lsS4oB3IfkQ7c0JraFUYkqalkQLRJLiX0SqTYjpCRuNUlhu4f/06l/xdeRzxoHhNBw
         RhEdkk17nOerCHXXzxCyiIzwOyZP4F1nct1SlaKvVvrWUJ97XAy2Lm9bmYo0sjCy0tV/
         gZ78qT8GC8bVMhE05r7/xQ72xQmS0U4NrMLUmRt4NgQerm3ro3MUsuQN2ZUFnaUW9umc
         WoouOX7tWG3kndYZligEhs+Z0SdeLBt/tWdKekvfdGoDKMtupMp0k2Cnd6NlB9Zs9U3Q
         zWTlMlAgJFdCymVcR8epb6TDcaB0d2nkX1J3iRWiUA8O8aG5Zrd+cfSVy7bzRCUwQda4
         c3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436834; x=1702041634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvwEnfEWC7X3PkrakUYA7rH73mlgP4mcx3Rphz/0vOk=;
        b=pyYQ4nv1ywSMEw04V/32xvTbCg230F+n2YN8bc3Gtr24/3uBSGv8ZiQvOiOl/Nujo7
         495e+q81qNmpYvrl8b5NyfrOWRikURQphOQqgVpzRTbJpn+5tL/MWirVHa4N1wVlBwN5
         clLhRfL0tQwNoQ6gjRi4N9NUVvriqmDSUArRAKcy/rc7lGQAg2Ml+fp4nnwU7wq4EPJg
         px5opBLgj9Ku05fW1JI9M9OCqpAY2KfgCova6XbS+78LwbAB/EnTtLUX9SCwOpySjx0H
         LPlwly1bzExdcCjyKHOjFvUE9pWONGteCosxOW3iBDM0DhJ9kR6IIU6qeWX/HeMC9heV
         2xDA==
X-Gm-Message-State: AOJu0YyKqJ6offlvOcfLCgwTMTN7D7FVkrKtL6bYhqzPZ6LZcFRoEy8G
	Zlgu+oR+u7soKkdDoQQyAsXqW6ZZlhEfiZhJE48=
X-Google-Smtp-Source: 
 AGHT+IHy8r+VGJLhcKYulz95n0Llz8QkGNwo3fVIlOQzYeCx6OX80VUxPFF/MbvUz9dVuCcnHSKjPw==
X-Received: by 2002:a05:6512:36d2:b0:50b:d764:6ec8 with SMTP id
 e18-20020a05651236d200b0050bd7646ec8mr745977lfs.120.1701436834148;
        Fri, 01 Dec 2023 05:20:34 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:33 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:31 +0100
Subject: [PATCH v2 02/10] ASoC: cs35l33: Fix GPIO name and drop legacy
 include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-2-ee9f9d4655eb@linaro.org>
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
Message-ID-Hash: TLJKNNDHCEFHFLHAYEI5TS3DINZKY5D6
X-Message-ID-Hash: TLJKNNDHCEFHFLHAYEI5TS3DINZKY5D6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLJKNNDHCEFHFLHAYEI5TS3DINZKY5D6/>
List-Archive: <>
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

Fixes: 3333cb7187b9 ("ASoC: cs35l33: Initial commit of the cs35l33 CODEC driver.")
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l33.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 4010a2d33a33..a19a2bafb37c 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -22,13 +22,11 @@
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <sound/cs35l33.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
 
 #include "cs35l33.h"
@@ -1165,7 +1163,7 @@ static int cs35l33_i2c_probe(struct i2c_client *i2c_client)
 
 	/* We could issue !RST or skip it based on AMP topology */
 	cs35l33->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-			"reset-gpios", GPIOD_OUT_HIGH);
+			"reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(cs35l33->reset_gpio)) {
 		dev_err(&i2c_client->dev, "%s ERROR: Can't get reset GPIO\n",
 			__func__);

-- 
2.34.1


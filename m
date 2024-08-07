Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F080294AC57
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 17:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06A3114DC;
	Wed,  7 Aug 2024 17:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06A3114DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723043655;
	bh=Y7W8wbrOkuNmZ8CQ0WcwZSJsXls2By5/tn0Y2KGbT34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gqa3wwzaZ2dMadq8tbGJEwMnYz4633fHti85MCaxhUaRHf8sg/WrKwIjjeVdsNOUX
	 bRX5/pKc4jXBEVPIUGYP1he99+8VVsewY2ax3ov8sLh98vVTVvXM91sDUCx4LAf1no
	 Z3yfZ2l8oBtOs/UiH4VeuBcIMWbtg6hOYvb2fpX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C904EF805E0; Wed,  7 Aug 2024 17:13:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41633F805E2;
	Wed,  7 Aug 2024 17:13:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E58D2F80448; Wed,  7 Aug 2024 17:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C9EAF80236
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 17:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C9EAF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=c4c5lNhq
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5a1c49632deso2279885a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Aug 2024 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723042962; x=1723647762;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPaeIu/7/ToaPftt+nmZwaEM7lBvNV082estk80tIAQ=;
        b=c4c5lNhqCjXcByG3maa1o6N1ppq+RHST1ww4/W1kxThVY1NHTDn/LEDMjvB+zHZ77q
         8KCMrI2yd0tj2Jy82HMbsQcsitEYuwq4mS+yu4wwKsPEBczkJrLLnuw3G+xzKGqUqzV3
         ZI8uah9T5R/wrC31LqmDKmZDXQaX01EecShYunML18y8Us1HCrJJWDw0BYjNDe2Z8xkZ
         EmTt+sUnESaojRmBTsAUTraosw1Trxf2ksAB1/sRRrc8yN1tQ+G/f0J2CoCAHITX9wO0
         mlGM42vpGO2sUnSqgDwTKnXDQKpDlUq/fvEbWCAbmW3mbHhRZeiFffUHJk/BR4kR5+if
         EJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042962; x=1723647762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPaeIu/7/ToaPftt+nmZwaEM7lBvNV082estk80tIAQ=;
        b=iorKj8VVwDhGEpj/mNIFfAPyFDRP1mXm2k5tx20sJ8g8mKIVXskTZz+VJ8jh2RE4Zw
         Y2k3yvvcIQxM/J7/+E1m3NT01It2fz/anQep6/iNqALF/yixAe+Vl1OlPDQ19pLG181x
         0k9WZf7tLvelV1eQx/svp9jIaZAwrxG20/divpdVHqFp7pl1NiSQoF4OQF91aTM/ImIW
         SI0Z99f+vCbVVbj71ji3bvD5cawQMGvv+8DVXD9qX5BMvchAp7PpZABtsgZui1F17zFR
         QbO+qRmVi/GzmLhc3rEIHrrKFu7uFEiouuvv8yQG40chTVuX2IE2x2ozmZDbuArVuPFP
         opwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxznUTU6TKLrFx1ut6lLjGahl4ALjUsiXa86baFQmsEbgcrsLh5ieezeB06jJBMauJGlO2t/ucikfgiPIi/8IkNEOhZ4sdLcpza8U=
X-Gm-Message-State: AOJu0Yzwjqtkcbb+IbVj9V34yLoyREPwh+339Af62C7AvExrC4WyzApd
	CFzHQbU2hzqpuXckhJ2m1TCu/EtQx4sHfwa2JLT84rVt2oHKUerHq4NSletVZZEvb3uQZ+Xwd42
	1
X-Google-Smtp-Source: 
 AGHT+IEYpjjpJDMbHBEqI4Rw2M2UUag+5UjvthzgGzzeXam2hAGeCohE28/rAsaJU5XDD5v2iV+kRw==
X-Received: by 2002:a05:6402:331:b0:5a2:2654:7fd1 with SMTP id
 4fb4d7f45d1cf-5b7f59e04d9mr11178515a12.36.1723042961586;
        Wed, 07 Aug 2024 08:02:41 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bb90be3a91sm2583047a12.65.2024.08.07.08.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:02:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 07 Aug 2024 17:02:33 +0200
Subject: [PATCH v2 2/3] ASoC: tas2781-i2c: Get the right GPIO line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-asoc-tas-gpios-v2-2-bd0f2705d58b@linaro.org>
References: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
In-Reply-To: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
Message-ID-Hash: APW5T35D2UG2Y326ZW6EXYHTYTW5TVTD
X-Message-ID-Hash: APW5T35D2UG2Y326ZW6EXYHTYTW5TVTD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APW5T35D2UG2Y326ZW6EXYHTYTW5TVTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The code is obtaining a GPIO reset using the reset GPIO
name "reset-gpios", but the gpiolib is already adding the
suffix "-gpios" to anything passed to this function and
will be looking for "reset-gpios-gpios" which is most
certainly not what the author desired.

Fix it up.

Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/tas2781-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index fdf0840ac6c7..bac5ea6d99b9 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -793,7 +793,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 		tas_priv->tasdevice[i].dev_addr = dev_addrs[i];
 
 	tas_priv->reset = devm_gpiod_get_optional(&client->dev,
-			"reset-gpios", GPIOD_OUT_HIGH);
+			"reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(tas_priv->reset))
 		dev_err(tas_priv->dev, "%s Can't get reset GPIO\n",
 			__func__);

-- 
2.45.2


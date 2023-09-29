Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8177B3F1C
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:15:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23FA2EB5;
	Sat, 30 Sep 2023 10:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23FA2EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061749;
	bh=MLM/o2Vq2p1u5oomblCx24mXo9Qp03GQvSIAxfPiuqU=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bVYRg6agiHHeV25vGrzZs4h9KTAGCWC/vJhl887iVCwfUEBXzdNA0fFaqn1/ta17q
	 fsxnUrE618oyeJ0NbKJ6qKUd1AwliKSQ5Q028dO4L1VtldH052A2dLTzxERFzy6r+K
	 UYQeyBNv+swkSJ45C5UWW/fl97Dh/VHNVtag7F1E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4367F80611; Sat, 30 Sep 2023 10:12:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44671F80553;
	Sat, 30 Sep 2023 10:12:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B627F801D5; Fri, 29 Sep 2023 12:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63AB7F8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 12:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63AB7F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=b+9EK2uU
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso229427171fa.1
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Sep 2023 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695983297; x=1696588097;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGIn5BggoZuhwKSBFZqt6i9KKk/NG6ZBgEVljtS3j30=;
        b=b+9EK2uUyE92DW9/p/yJvgEEg+Jk3KJiS6QPwtTra4d0qoyHxsGL4TZrtqyjmsurAp
         3Gi0xpA3VBNT3h2zBMq9+uL/IgK5X8wJw2it5RelqoMfACkANhirGuIYiKg6NQZH3Rr1
         ggqsJydwxD5b/cOG/cT7t8tgLjBiDg6hiUiV/XIro9lEqiKS13as6gngg0i8f0EhGSRr
         MYYTJD4LjE0rG36YzOma1/DuIXjyh5jKoSzF9y4TeP0ez63QHQj6guLCbeLBmW3n+FVx
         zvN4YObelpaylMiK7n1fJaVbMCw8xUbifuOP31r0AiN9hKg0F1z5Xk1AWMQBZ4UG2HrZ
         0TvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695983297; x=1696588097;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGIn5BggoZuhwKSBFZqt6i9KKk/NG6ZBgEVljtS3j30=;
        b=uxKLH/yrZ9qQoHU1d537ajW1LP7lbr8GQ8o+KkJ6phs8T56auwpSfNFNzW4O6c6mlC
         Fo+kP0vWPpJkEnTeAQCl+9bcIYvKNTYqy3qZafwGzJIotsTh0OQquoXuIsJUIKSd6G7W
         6WkjwzBhDNjLBAZPLp0X+XyEhXwyXLncTIpmkK6K78gDTiSAe1gQRuw/nNlaq5/sBi4c
         E/4L1OlLl5Z4tpjtOEhR5vy3GFrnK2YVBCm7CLIzZhS3xDGEB+GnlsRpM3I6bkrJa/TD
         iA6optRpgOIVJE4xlYJW8iCoZxhCkdgIYWIQxrfDhebJ/4WC9E5LEerCUZl7hhmS6lR4
         8Beg==
X-Gm-Message-State: AOJu0YxEzZ8bHA4M19KBqD0a/e/gnl2f90n7GW2ppx+sbZwlVLqjEIpR
	BNdpLWlrgurhUOtR1+7rV7CHXQ==
X-Google-Smtp-Source: 
 AGHT+IGGXxf9ux7KQnNBlakripYyXZ+c1ONN4+HqyLiaISzUtZ6brXVPSw8OOLHUQ0z7W6r5ecGl+g==
X-Received: by 2002:a2e:6a02:0:b0:2c0:122a:322b with SMTP id
 f2-20020a2e6a02000000b002c0122a322bmr3220061ljc.48.1695983297307;
        Fri, 29 Sep 2023 03:28:17 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a170906584d00b00992b8d56f3asm12165628ejs.105.2023.09.29.03.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 03:28:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 29 Sep 2023 12:28:10 +0200
Subject: [PATCH RFC] ASoC: codecs: aw88261: Remove non-existing reset gpio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-aw88261-reset-v1-1-fcbce194a823@fairphone.com>
X-B4-Tracking: v=1; b=H4sIALmmFmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDSyNL3cRyCwsjM0PdotTi1BJd81QDgxTLVCNTS1MjJaCegqLUtMwKsHn
 RSkFuzkqxtbUA0iLZj2QAAAA=
To: Weidong Wang <wangweidong.a@awinic.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NTIBRHLUNNEJ5IIVH33K22GBV25UMMPA
X-Message-ID-Hash: NTIBRHLUNNEJ5IIVH33K22GBV25UMMPA
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:11:56 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

According to the AW88261 datasheet (V1.1) and device schematics I have
access to, there is no reset gpio present on the AW88261. Remove it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
In case this looks okay, also to the driver author at Awinic, the
binding doc also needs to be updated to include this change and not
require (or even allow) the reset-gpios anymore.

Therefore this is marked RFC for now.
---
 sound/soc/codecs/aw88261.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 45eaf931a69c..e7683f70c2ef 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -10,7 +10,6 @@
 
 #include <linux/i2c.h>
 #include <linux/firmware.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "aw88261.h"
@@ -1175,14 +1174,6 @@ static const struct snd_soc_component_driver soc_codec_dev_aw88261 = {
 	.remove = aw88261_codec_remove,
 };
 
-static void aw88261_hw_reset(struct aw88261 *aw88261)
-{
-	gpiod_set_value_cansleep(aw88261->reset_gpio, 0);
-	usleep_range(AW88261_1000_US, AW88261_1000_US + 10);
-	gpiod_set_value_cansleep(aw88261->reset_gpio, 1);
-	usleep_range(AW88261_1000_US, AW88261_1000_US + 10);
-}
-
 static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
 {
 	struct aw_device *aw_dev = aw88261->aw_pa;
@@ -1254,12 +1245,6 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, aw88261);
 
-	aw88261->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(aw88261->reset_gpio))
-		dev_info(&i2c->dev, "reset gpio not defined\n");
-	else
-		aw88261_hw_reset(aw88261);
-
 	aw88261->regmap = devm_regmap_init_i2c(i2c, &aw88261_remap_config);
 	if (IS_ERR(aw88261->regmap)) {
 		ret = PTR_ERR(aw88261->regmap);

---
base-commit: b216fb8946f819cf1b63dc12c7867cc501bda57e
change-id: 20230929-aw88261-reset-7e00d9e25952

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


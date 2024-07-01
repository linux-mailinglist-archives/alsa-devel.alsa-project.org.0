Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1818891D892
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:07:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9840621A3;
	Mon,  1 Jul 2024 09:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9840621A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719817659;
	bh=pcOvFSy9mqnG9tdnejsIswIHJuVcxQ0Q95HAQWqfY2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ik3N9vsHPkw6heR8cP1gF1WlnoeRmnBhYSgBJLWL9U93gbN3c2bwSpnt+nTuOJWvF
	 lsv7s6mQOncYVcNHYCCyt3RrfEqVbZMdD4hjyHp/0oQ+Oslh0VmuRpFbn9PnXgwlLJ
	 fRuu+jlyJUxMjMGPR58oUn4icxRXjubufM/SWiMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5682AF805F8; Mon,  1 Jul 2024 09:06:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EE08F805FE;
	Mon,  1 Jul 2024 09:06:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3898AF80238; Mon,  1 Jul 2024 09:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AED55F8028B
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AED55F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MxUytyHG
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so27940071fa.2
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719817361; x=1720422161;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWt7xul9gaEWvRdXPJZ452zrHt44xP6eq1TOlG30kGE=;
        b=MxUytyHGHv0RK7Mfu2S9n47+nKeiCeB6jztdtPmCuYOvXDqVOG/TUBt5UadeU4Qrlz
         XdImNchuwaSc5ahrZiZ1f5x48eay04wbUohYi2msA3srEFERP8VkXrE0IhbXgPHGSCO2
         uc//gzXNrFDW1+We8aBsgUazaO0zVdjRpxWiX4cOLIY2D4pW69m8MR24OIjiDDr/NulC
         wXdN3r28mEDF47leadtDgBp4I7Yol2PhSLsuccTaxCQtfQI5Ymu6QyoLEHrD2HK9b0NQ
         QQk3Mb056k4QZnEfL2au+FDSYtOoAtDiZ92uJZK9pl0qeo494ukxJ6V4mUD5mtezDQDR
         Y/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719817361; x=1720422161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWt7xul9gaEWvRdXPJZ452zrHt44xP6eq1TOlG30kGE=;
        b=qfdrL5jmOqsj/lbm71CHKpp0ESMYuVM+K1NPqA13yeUPVmwou8ALDdD8FU2WY7hpRb
         XiH9o4Q+7mhxlaLVntr/4CDbab3fD4Sq40JdbYwR0VgOyiBRpajqYFukd6vnT1SMqsAa
         hnmlB6Tk+vcKvioyQcKco18kdBEyykLCLQpTTrr3lXNHNyJh+9Sztk2GPZdmjt9zBt2W
         grn/IFTnZ5VLw0BNyh5B6Mg0IioBnb23e9oT9SRG7azIhpd9ROYzrgfzi8v23WaFqYW7
         P/FLwnoREOV8fLIFHMa/U50xgA2FPVHLlb2ZvK82r2eNbOk8J/TMlsza324LwSCiysty
         2sjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB6mhXBhCdZE0XPJcY60CcSSRxcUJtrrV1Hx6firjCk41a2CbFi4AYFHCpRzZNh89em0hHCNOAZaQTcZR3LL94L8E/kk0xV9wVZZ8=
X-Gm-Message-State: AOJu0YwWtdLMdq2L4k396w4gGm9RuaqAKn2EBhhwifCH7SmPyQUNFHaO
	dXwqQl+AuqfqTTxT5PwhGUcG+M6oyvz6YoMD2ulP6Tcr3yx3Z7hcgkmOmzF8s8g=
X-Google-Smtp-Source: 
 AGHT+IGPE6k3N5wdR11ZQ2KZFoj1Q7gGsWsY0UPRVz0U0AfRSYWIhLPL3AI9jKB/vygyWqnZmYfNvQ==
X-Received: by 2002:a2e:a801:0:b0:2ee:4c2e:3d3b with SMTP id
 38308e7fff4ca-2ee5e390286mr44525361fa.4.1719817361254;
        Mon, 01 Jul 2024 00:02:41 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm4034383a12.34.2024.07.01.00.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:02:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Jul 2024 09:02:14 +0200
Subject: [PATCH 3/4] ASoC: tas2781-i2c: Get the right GPIO line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-asoc-tas-gpios-v1-3-d69ec5d79939@linaro.org>
References: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
In-Reply-To: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
Message-ID-Hash: HZLPA3BCFR6JXFXSH7LQUXU2HITYG662
X-Message-ID-Hash: HZLPA3BCFR6JXFXSH7LQUXU2HITYG662
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZLPA3BCFR6JXFXSH7LQUXU2HITYG662/>
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
index 1542915b83a2..256f2e8f1ba9 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -654,7 +654,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 		tas_priv->tasdevice[i].dev_addr = dev_addrs[i];
 
 	tas_priv->reset = devm_gpiod_get_optional(&client->dev,
-			"reset-gpios", GPIOD_OUT_HIGH);
+			"reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(tas_priv->reset))
 		dev_err(tas_priv->dev, "%s Can't get reset GPIO\n",
 			__func__);

-- 
2.45.2


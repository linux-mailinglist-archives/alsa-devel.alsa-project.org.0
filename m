Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A778CB00B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 16:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989EE741;
	Tue, 21 May 2024 16:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989EE741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716300467;
	bh=zl7AH36vmygEV4JVzP5ZRpRVT0yrltHsi0L0sBPvpeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hQXyModPR9J9dvdnvF6RLcOo4wldjmxs4a2o3RfIFPELBK4F5QmHouFKUX5PjX/Jh
	 B6Vb+yFF+iQicyLNwmO+FhrHn8T4qLFrkWfYqGP41t1QceA3LIRm8qU3XcBLaiLtu5
	 BCcg7GcfIZyXxsIooHeD6ObfLp4I1i99n1n8VEbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A21F7F8060B; Tue, 21 May 2024 16:06:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D2BF805E4;
	Tue, 21 May 2024 16:06:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7339F8026A; Mon, 20 May 2024 17:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9BA1F800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 17:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9BA1F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EVMcULvo
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-572669fd9f9so7688912a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 08:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716218067; x=1716822867;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh0hh6ynZxtBGDzmGDI5+hS0xKp2HfOEvcy4GZsRfWo=;
        b=EVMcULvo8bShVfJdZRHxGEo/afkR8CWtkfV1bh8K3PEQ7iIdiuHgy/YriS2npMS4Eb
         5tAf8q2pt5sDjshaBsS4DoY7+l6tNM0Iz7xwD3lDkrmL2egfxTFVl89Y7x4k5mQsLpjx
         Cj3b2lKWkHZFucTY6j8fDO6AeSuDuUqwMuxeC0OuP6PdJAnF87Umxhgl2IrJrODIRPDQ
         thnhK3ScBisrxdX+CBkvUEj1Ci5OxznEvCUmerFRq/UYyQFP5zsU+VHYT7/hvda/m6so
         NU2pZv0cHLeG+Q88zfdq3UQDDN5O5qd2dwLXSS5I1EWcmLAue8ZYNZgKlx/HYmlGVAgx
         oF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716218067; x=1716822867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh0hh6ynZxtBGDzmGDI5+hS0xKp2HfOEvcy4GZsRfWo=;
        b=RjYNUDbzgR2bxrxRVSfCI39hNdsGY2Fqj8NjOMPjnCD1SwryAn4qRBUFt/4ByRL72N
         i/zbhJ8oG6biuWzHJJZyK5QC7OCvgqdX2AkkN5NpHXoleYQrMCBQQSoRg1B7YSGPDbg4
         4UavRrqUBgSBuU4n0tuGpVyRLPb+ukzrrpOZGgfSgVbn7TrI/zjCwh2DPH0cHbwgrFxA
         btJRQYz/3pvXFROFqIeY3Zx/xp/VzyHcrhE+MSudh6/H8mx/4mRk1HMAcODzhsKM+LZU
         vpahLcAHIqOeJna9gROUa238aDzx+g5D+5ODBhxZdyfFMOiyrin5jkm9Ej+K76Us4ETv
         0r9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7lrWs6UofxLSTOAtxuAT+xeQPt+DxyEnMB0EVsdyZs43xSflLDm1h4qrWf/9tgNM9qDzTWQnz3Pi1/ks/AO03sCbC/BQc0xN5yGw=
X-Gm-Message-State: AOJu0YyZxmDcJJyC/O9YetklSaECltS3RitfXB32LU1Bpe6QH8fc8zol
	mw+1FTs+q9AiRu6u3FlhyAuyPHobXZ4varTYvIjGqYRPpHeWwRTxo1LdJA==
X-Google-Smtp-Source: 
 AGHT+IH1S6MZdqZnOCp1XHy0DROY6BRx/iUuxG5zGDEFD1Db54zL75jJp9OmheUmNZVBtKA5DxdCVw==
X-Received: by 2002:ac2:4c4e:0:b0:523:6a08:1c91 with SMTP id
 2adb3069b0e04-5236a081d53mr12374237e87.26.1716106695408;
        Sun, 19 May 2024 01:18:15 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl.
 [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:15 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:51 +0200
Subject: [PATCH v3 5/8] ASoC: samsung: midas_wm1811: Use dev_err_probe
 where appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-5-0c1736144c0e@gmail.com>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=2433;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=zl7AH36vmygEV4JVzP5ZRpRVT0yrltHsi0L0sBPvpeI=;
 b=jKKalLVKlQAPEmhIQI2igaYxc0WtyONvcwLUzap5etYn+mJu5GSY7yIvEUJ6368P+Mmy+lX56
 VqeGNgA6LPfDMjvQfhUv+tlIihN+MvC3f/eFreYYxCb0L35bl6GBcXg
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OBXPZBUPTEXTXYJ5PNMGJGDMIVOTKIXV
X-Message-ID-Hash: OBXPZBUPTEXTXYJ5PNMGJGDMIVOTKIXV
X-Mailman-Approved-At: Tue, 21 May 2024 14:06:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBXPZBUPTEXTXYJ5PNMGJGDMIVOTKIXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since we're already using it in the newly-added GPIO requests for
jack detection, extend it to the previous checks as well.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Added this commit
---
 sound/soc/samsung/midas_wm1811.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index ce94550ee32e..91f4be98723c 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -646,16 +646,14 @@ static int midas_probe(struct platform_device *pdev)
 	card->dev = dev;
 
 	priv->reg_mic_bias = devm_regulator_get(dev, "mic-bias");
-	if (IS_ERR(priv->reg_mic_bias)) {
-		dev_err(dev, "Failed to get mic bias regulator\n");
-		return PTR_ERR(priv->reg_mic_bias);
-	}
+	if (IS_ERR(priv->reg_mic_bias))
+		return dev_err_probe(dev, PTR_ERR(priv->reg_mic_bias),
+				     "Failed to get mic bias regulator\n");
 
 	priv->reg_submic_bias = devm_regulator_get(dev, "submic-bias");
-	if (IS_ERR(priv->reg_submic_bias)) {
-		dev_err(dev, "Failed to get submic bias regulator\n");
-		return PTR_ERR(priv->reg_submic_bias);
-	}
+	if (IS_ERR(priv->reg_submic_bias))
+		return dev_err_probe(dev, PTR_ERR(priv->reg_submic_bias),
+				     "Failed to get submic bias regulator\n");
 
 	priv->reg_headset_mic_bias = devm_regulator_get_optional(dev,
 							    "headset-mic-bias");
@@ -669,17 +667,15 @@ static int midas_probe(struct platform_device *pdev)
 	}
 
 	priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpio_fm_sel)) {
-		dev_err(dev, "Failed to get FM selection GPIO\n");
-		return PTR_ERR(priv->gpio_fm_sel);
-	}
+	if (IS_ERR(priv->gpio_fm_sel))
+		return dev_err_probe(dev, PTR_ERR(priv->gpio_fm_sel),
+				     "Failed to get FM selection GPIO\n");
 
 	priv->gpio_lineout_sel = devm_gpiod_get_optional(dev, "lineout-sel",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(priv->gpio_lineout_sel)) {
-		dev_err(dev, "Failed to get line out selection GPIO\n");
-		return PTR_ERR(priv->gpio_lineout_sel);
-	}
+	if (IS_ERR(priv->gpio_lineout_sel))
+		return dev_err_probe(dev, PTR_ERR(priv->gpio_lineout_sel),
+				     "Failed to get line out selection GPIO\n");
 
 	priv->gpio_headset_detect = devm_gpiod_get_optional(dev,
 				"headset-detect", GPIOD_IN);

-- 
2.45.0


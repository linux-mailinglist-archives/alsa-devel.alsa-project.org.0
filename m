Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DAE8BFDCA
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F829B6A;
	Wed,  8 May 2024 14:55:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F829B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172928;
	bh=zl7AH36vmygEV4JVzP5ZRpRVT0yrltHsi0L0sBPvpeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EO3HsEtdGCpxExjYrr2vZpEh0zLrslu3OM9N9YPWb4Wm7C204vxyanVunkwo6YKj7
	 FcRaeANv+40eZPZuHoY/pQk44jXJuAqL2Oo4SWdsEggRMerZ9yoPj0cIOMyHSH+PWQ
	 UDgPA5sh8YMnmPEe4IyqtKWJ2edya9swJFSauJJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74295F80845; Wed,  8 May 2024 14:52:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9FDCF80844;
	Wed,  8 May 2024 14:52:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0272CF80423; Wed,  8 May 2024 13:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA248F8049C
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 13:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA248F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KNoJALnz
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so916014566b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166085; x=1715770885;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eh0hh6ynZxtBGDzmGDI5+hS0xKp2HfOEvcy4GZsRfWo=;
        b=KNoJALnz+jY4du3Zz67/RJ0tl8K5dIJ/hOJmKrL3ekqSlsQJxh3oL+JuiOl9Qj+bEX
         B4/csVZRUS9m4VZLnKMB5xPsOM4XAruiDiO5rAt7T8wrOOuONsLrhcrb9ZXQQExplTpQ
         q1ANL3NQZL+kAqv1cLZUMjFn72FBOzqA2KfhCNDpKA0NJU6oqijXnTL77quoOQklRklq
         rPKHZr13wCZQpt85oS8utmWHrfwaLNtaFg+FvrNIY9lq/VYUiwQs9sYhK0LGbNP8mi3S
         syzfAh9rFKXqLuETAFRWhtQqejvE81lqmuF2mZghDp3dxriEKrUBmULnqCL8F1MrMjOq
         cE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166085; x=1715770885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh0hh6ynZxtBGDzmGDI5+hS0xKp2HfOEvcy4GZsRfWo=;
        b=rSGfsUhGFowFfed6UFsoUIOL73bWlSLOIr22QFf/ZfeDdfuthqWqYLLV3XRS8dguXI
         39GYKPO3WQxAioKU3x3HZJ7x07qdkbluaW45uuiebdxSDlwei9jaaxtURU/qU0vCNpTI
         UQT2/L3pwy3g7phuU+2fBvuK+uvrRqtwQc4q81eRqLmMsHoMKLhU+7D7z0Yf63Ktw001
         lTKWUIfh/TamJ/v+qB8cg7cs8bi9Vl0/IUzgZmG9XamRr/hWOhyyPDclnQFQpxW67MBC
         szX/RUIbhCnq22oUvpS5nwYz7T70+5bHsRvlcntLcl4wEukf6jM3mDnZBLCCrr+vhH4h
         aUnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeDRq7dO9I6kCkIoJaL7Bb5G22txTzYQ56ONSq1X24sm7jiH3y48rnFEC6NVQqNEGLjMbTpZbr9B3Z4m7H3O3rLmKxbf1w+ysylsA=
X-Gm-Message-State: AOJu0Yycc6mpE5A1fywx2YcGTOiX1ixc0B3B6nNgUYd+Ixdvioxc5wVy
	GuG7vNdazS0NiPsG+FGD9Qu0j6CSmZbr9YecrE4IiryQJ+WfpxJr
X-Google-Smtp-Source: 
 AGHT+IEBwQsbB5ly9Co7wAOpW5LM6EH159oeIG9hfELSBdMplK0VTNfidDLRoB93iPYNNHuID+ms/g==
X-Received: by 2002:a50:d7db:0:b0:56e:7722:553 with SMTP id
 4fb4d7f45d1cf-5731d9d9ecbmr1973462a12.24.1715166084426;
        Wed, 08 May 2024 04:01:24 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl.
 [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:24 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:53 +0200
Subject: [PATCH v2 5/7] ASoC: samsung: midas_wm1811: Use dev_err_probe
 where appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-5-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=2433;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=zl7AH36vmygEV4JVzP5ZRpRVT0yrltHsi0L0sBPvpeI=;
 b=fe+pSCvp0hASloJ0sPUz+l38OVaL8jW3+JqL69/Fa0Vyl+oCbv43o8wgqeZZwlLvsGsOL8qOh
 to+MdKSo025DMN6qoynkF5EzPkUi5GX8nq5bbd2hLMj8pAZXpr+03D7
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PNWFJNRGSCHHOZSLZEXZMYP3I34UJX72
X-Message-ID-Hash: PNWFJNRGSCHHOZSLZEXZMYP3I34UJX72
X-Mailman-Approved-At: Wed, 08 May 2024 12:51:39 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNWFJNRGSCHHOZSLZEXZMYP3I34UJX72/>
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


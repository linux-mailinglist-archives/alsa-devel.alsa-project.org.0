Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A290778A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E87F2DE5;
	Thu, 13 Jun 2024 17:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E87F2DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718293941;
	bh=7q1elFo7CAxZkZBweHbgmjBT8X4yHLYsePVZJR8HO/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xg/UOqpvo87BDSWZC6UWHxVV71jFjo1ctqawr7cV9rnvDQvUki/SAsjtd5iWc+ejD
	 dbUV0vUqtJVy962nu0JQG24+Xn90f1sMb8IBRslHqc9Od9SIba22hqsAfsDm5bNBZV
	 0vv9lLMZgOZV/bA7JxNpjDQEgqsTI8ZVaVQsc3+c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EF4DF8058C; Thu, 13 Jun 2024 17:50:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6F3AF8063E;
	Thu, 13 Jun 2024 17:50:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC2A9F8026A; Sat, 25 May 2024 15:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF4BDF804B2
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 15:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF4BDF804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hmjo+xdJ
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a5a7d28555bso1420551566b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 25 May 2024 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643695; x=1717248495;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYm1aEjf0Zap75LycmMoJDPmBXZE+yZRaT5MJKObyzU=;
        b=Hmjo+xdJAdn2yM3lTlKJDaJTC7GwHYQI1NEJPUuPLFkqaAyFpLMqKShnb7sF17tbxn
         zYNQ0NOYqrvlp4tbJX9M31OZmYTdoje+avareSV6zTX5RfiIBi0dwGQYAa8G1xU0gTVq
         HUqIUZFmiop86/Y8WSDDBuU/VVF4n5ojjQKJMot1lJ9cL2tjm4lukM/fQAHfOollPpBB
         AVUcSLJHbTXliAlj6ojHUmGrUTRZJGtzV7GBlIQHx5lUg0INZLf9rdFl9gIlhDeLmMHa
         2XEV0V3YhFud0gaZpXm1Js5jeO2H22O3FDiuNVuz1UkeSFgDlOQBAjEHZg9+YSZ+2Ahe
         EFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643695; x=1717248495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYm1aEjf0Zap75LycmMoJDPmBXZE+yZRaT5MJKObyzU=;
        b=gKe4h2ciZ/HXNhqaHno2FokOD3/bWieYHSPxY4QEu22LCVXmjCKMHqB6zZ0gmc2WQU
         GIdnPts2/N+wRNwHZmOu3dwG240HH4xihWNU0hDpaVsMKitRnKJ6vBUWKyNGHTf6GafE
         I2jRIPat3ftJDtaHlN+KVKm1XqFDBvyM5PfCpiKHyk9wB4m8wD2e58lnN5j5djvvvPMv
         oZyIAnx2uyT/0i3ZEQhLi6H17PlKqkBr4Ly4/DMWUM+Z9Y4AVzVcCrmYT+U24Ht5/T1i
         bln1V6HaJ2S9Y4E9pvPjWaMY1mqne6cDKBEFbulQjTYD7z1GOQkARSD5FfgPArpApB3Y
         CnNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2GZLF53mUhrARCx7q27PntCIU+f8s6hGPq7Gz0BCyUna+0SeZ07wcBAO8aB9YeFE/GpXkWBqLXbAPyQLi6j+nnrxL8fjlNpsvKbU=
X-Gm-Message-State: AOJu0YxfTqUa+rPlQFBkIwvnssRC05ftYa+X0wI+tZuOdN+i3hX36ZIE
	vU83dTAyoDNInCBwFbbqRB67LTtzkhnFzI5HcPjGUumqfUzoEHW+
X-Google-Smtp-Source: 
 AGHT+IHdx/tw9IhnGg8vGuaesdmmsPdkFnOGx7QFZnPi31e5dF3k4vigUZYqt0/oZwQjTd+tJOtmbQ==
X-Received: by 2002:a17:906:1117:b0:a55:a895:46ae with SMTP id
 a640c23a62f3a-a6265259847mr314823766b.63.1716643694468;
        Sat, 25 May 2024 06:28:14 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl.
 [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:14 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:10 +0200
Subject: [PATCH v4 6/9] ASoC: samsung: midas_wm1811: Use dev_err_probe
 where appropriate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-6-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=1631;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7q1elFo7CAxZkZBweHbgmjBT8X4yHLYsePVZJR8HO/Y=;
 b=awYAMRq5ulLIglF1H1Y0PzqOS1+tuiQldsorqr7g2v3Tj2K+KBY61oddW8/uQHpyx94/xqJYL
 nI8BlGptFftDtpMEsYUXRbgdBe19G8yVyT0v6GPBo4T6+cC5eZMmRmk
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AWTKOPJBCMKUJPV7EN7ACMYLQOEQSFP2
X-Message-ID-Hash: AWTKOPJBCMKUJPV7EN7ACMYLQOEQSFP2
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:50:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWTKOPJBCMKUJPV7EN7ACMYLQOEQSFP2/>
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
Changes in v4:
- Adapted to regulator get functions being dropped in favor of
  SND_SOC_DAPM_REGULATOR_SUPPLY
Changes in v2:
- Added this commit
---
 sound/soc/samsung/midas_wm1811.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 88fa9e5bc093..ad0283364081 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -590,17 +590,15 @@ static int midas_probe(struct platform_device *pdev)
 	card->dev = dev;
 
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
2.45.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B47D8C9E75
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:57:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEAA6826;
	Mon, 20 May 2024 15:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEAA6826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716213450;
	bh=oxZAMqMqlKlTjZ/d/nZ7mM8CRcGM1aALJhSvZTlSCIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vuYR5eRfNeuNGGIAbtYNvF/0dleAvDDUQ4md4+EZ2GrauFMPbjbLvDo9b0p0qTNyR
	 d7XundMJYfMbj6rKQ/n+75O/D1bPH8Fa1TQ0MkqVoXi8vJk5b+kITWYqEiQT3OhPbm
	 bKVMPs72tdogGChGuAGjPdDMlUisKNpIUHGw4f7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5F1FF80642; Mon, 20 May 2024 15:56:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06C22F8062E;
	Mon, 20 May 2024 15:56:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3F8AF805A9; Mon, 20 May 2024 14:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EEB1F8020D
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EEB1F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KHhsrSRR
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-420180b58c5so17741745e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 05:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716209005; x=1716813805;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBQXsZU35VYhqiFUuzQSMRWlgIZsYX5osBGZyaRNZAc=;
        b=KHhsrSRRHlHVBCiwe6FMMrP9kRR8n2LH1l1K/f2kILeB23d7t7WzswxIBiK7EQodD3
         ujBlyJk6NwpQHoqiTU4VRpLThkfVoBM3F4tKE1lGK+iMM1vOZ8QC2JuDXuGZ29iIBlMk
         0IAw6Jg6NqLrvuKDFknPqhvFFqZj4s5ys+QVSRnbUzpYTfSto+WhjUgreQ7C/mBN452D
         w+RXspyU7UN6Z5ez673RWGpcrOqlYHOsZY/JPSQpUiYrqtG6J+sGoSiBsNmPrYD+vkNI
         Uw6AW56WuHYz15b9jLsTQjTHQBTxpOkwz/rh0DqSPRZW12GJ0f6PCWjSyIPSpVxD4TvH
         8SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716209005; x=1716813805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBQXsZU35VYhqiFUuzQSMRWlgIZsYX5osBGZyaRNZAc=;
        b=uYGYksUNhVH3YFbBmBrOfTp7nkGWdrauJ0/8ekS3x7+sncl3pjwpHUUd5vNcTKOWPt
         CCeUxBXtG4ZGLveUayP7UILvEOIFm8QpwWIZOd57q/YhXguEluSEVHLoJEoJPaMOQFU4
         mq4etQhloTTJUY2bR0wNMQ7ftdyNWbY+8dxXzYTR7ZbHpBpbdsQxpBEeJI5m2fRSk/Kf
         Y2rC0VanJ9O3uMgt6NnfGIk8S1sX+lokO9LqnLppCTwGHcBdQf037lShCLpOPljyeApP
         W14SQnliNzZOaQVHmWpe71MubOSI1mWxBbej96N/2c0so7mF69YQ/BBgC2aRXvLTgXDV
         JsnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtDZj15reKGyc1qzCQySQr1oxFE6p9hgtPLoHUjOBnnhybNg639bEZ0kKobgCRHqvgE6gdq7ZnPkhmQeCBqaKXfTLIEL4xKXTjNIw=
X-Gm-Message-State: AOJu0Yxh+x90kC7QIidcMZxgThy5/CXFGEu+KeCzU2/kNHNkZs7Edtq2
	sdbzRK45YTkhyZGLDlhqXO+mPYp9fPUJF3GMUad4nyEdJNUwLKNdBMFqbA==
X-Google-Smtp-Source: 
 AGHT+IEilfnVxtejbu/ht9RsEU/PAmph0nDxRzwauS2k1nuOc2xrr0wwjEZekDl9AfdgWnlGYcB5Eg==
X-Received: by 2002:a05:6512:b15:b0:51a:ca75:9ffe with SMTP id
 2adb3069b0e04-5221057b50bmr23433137e87.42.1716106689783;
        Sun, 19 May 2024 01:18:09 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl.
 [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:09 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:47 +0200
Subject: [PATCH v3 1/8] ASoC: dt-bindings: samsung,midas-audio: Add headset
 mic bias supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-1-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=1024;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oxZAMqMqlKlTjZ/d/nZ7mM8CRcGM1aALJhSvZTlSCIE=;
 b=BhIKKL+8RIOGcP4bUlY911QYk1W9Fy3JXaNFWUp3TXITqmXYjEBxWsyPihAzfzCdyP0qEcTeV
 ow6N+zBCrMNAp4ThqQJrxiywHiLgDSQJXmY+JaRKZwzCc+BvJiEYIum
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CWQCR55DVTWXCZD7SK3WCHYLRRY3TQVL
X-Message-ID-Hash: CWQCR55DVTWXCZD7SK3WCHYLRRY3TQVL
X-Mailman-Approved-At: Mon, 20 May 2024 13:56:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWQCR55DVTWXCZD7SK3WCHYLRRY3TQVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some devices use a separate mic bias supply (also referred to as
"ear mic bias") to enable/disable the headset mic.

Add the DT property headset-mic-bias-supply to allow for specifying
this supply.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ec80f529d84..6ed53dd0bb53 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -53,6 +53,9 @@ properties:
   submic-bias-supply:
     description: Supply for the micbias on the Sub microphone
 
+  headset-mic-bias-supply:
+    description: Supply for the micbias on the Headset microphone
+
   fm-sel-gpios:
     maxItems: 1
     description: GPIO pin for FM selection

-- 
2.45.0


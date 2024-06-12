Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4EF905858
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AC41A4B;
	Wed, 12 Jun 2024 18:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AC41A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209060;
	bh=0x271Ao5g1756MkJM0YnZ2eY6hyaiNB56Snmlinm2o0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WIybrMT4iJYNgTT7D/W3TuyJJHgOwK/iWyOKFVs6222YjJzoW4lY+NGH/PHVFCXf+
	 EOppx/lh7Q7hjZBq7pOGr4yyODxP/ZISDTSvuI6/HQE6Tbiu7YOHDTWFJXhMMQTFI9
	 x9iQAnR9tbXFPYzpekQ+01ohm+GYxrBFIx8IQlys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB267F80699; Wed, 12 Jun 2024 18:16:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF7EF80691;
	Wed, 12 Jun 2024 18:16:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8DE8F805FB; Wed, 12 Jun 2024 18:15:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CC82F805B2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CC82F805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pK+9vh2a
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6ef8bf500dso8460966b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208951; x=1718813751;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSj1wRbpqkX+8+PyNrcUZX8/G9u8adS5MtyYj32OWN4=;
        b=pK+9vh2a3DoNycZ7u/50Q5MxlwphGoEcZPjTI6XWn2e7J2AXil3fs41mqLlZ8iMsnN
         qWhNhz+KBpeH9kVkHRyhWxqyhmQeaLMW9x5f/uuX+MVQrxf1vp0Uc5ysudCG2yctng1e
         z+o5/I8aPgDZSFNFlQeGwbr/SYQgr2sUzabsiCSv7fNwM9HCeOeeuOeemjpNzZa3lIcE
         UWBC1NBDx8fiTIhH225y/AdEKMHsTD2u8oRnTHt88YxSvXUNEGeTWC0VhAT/sHA2j+ig
         TnK2d9amRyCCDsufTKg/UBGEc9U1XT4VvYVYW2ZU59wCFijQ1rveguGQEZUhVlb5jFr1
         KAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208951; x=1718813751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSj1wRbpqkX+8+PyNrcUZX8/G9u8adS5MtyYj32OWN4=;
        b=P83eJ0zORqzPWVKD4ix+2hYRtJ5bkiPKXDZyNltg8FHu5hWF34LQ1mr+q7kDi4iBWt
         JqFg+TO06kY5STIyStqigTwFiG3qiIQBWFipfaFuyqk6s4DvGeI9q8drfoPfxrpM+yif
         /i1/GUgRqWfJx6B8UzxKdD3kaQGl741znVaaNkuYh6ZWJWI2Td+2OJMG/v4trcJ/83Fj
         wG7a8Cq58+OLmeme1k+eOWRgha4Ux0kEL46PwzVZ/KfWRzyRkUpHy/38NF60mxwaE1ET
         xalM8OB+bEe6u0GqPRrBsdseYMrJoPvBwzDKp4Kdf6r86OYsPqXBZphqT+kqNSDrJys5
         /Gig==
X-Gm-Message-State: AOJu0YwhSNAwP0XxYmlHLZ6m5kgPFS2j7S2CEtAxl7AH0PoU6ZjmZ9SC
	HtadQO4ZQ7RKfjw8EtWP8ZRYFwOgnwGGM2/QWORWHyuhJT5BYgDyjmhe5ZGEbcY=
X-Google-Smtp-Source: 
 AGHT+IEV+h2vbFgATGGL7Df9HCn4pV0I/mu2nGi8vVCTHaKKyDaxGp2hEWUoko7ZRX+TvbTeiXVv0w==
X-Received: by 2002:a17:907:7208:b0:a6f:51d5:ef0d with SMTP id
 a640c23a62f3a-a6f51d5efb7mr24161066b.60.1718208951530;
        Wed, 12 Jun 2024 09:15:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:20 +0200
Subject: [PATCH 07/23] ASoC: codecs: wcd934x: Drop unused interp path enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-7-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=574;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0x271Ao5g1756MkJM0YnZ2eY6hyaiNB56Snmlinm2o0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmdGHA1Mc5AxCcNSVn2jKSCaXp7KokuKm2d+
 NCQKnMfgTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJnQAKCRDBN2bmhouD
 1+lTD/9nG9SnZKzUodnBZ9jKxGLqAYbuAcS95yXfKwvzL7gcFcHTqWYYRmWfOkUvUdXI0oY0gsm
 f2e1nkk0kmT0EkLmhc3iqNtQyJJoyUIPl39A/Hb+F1xHJxJEKwD8ClpD04ZOk9ttcSFpL0Rp4My
 xMc6F76okJKgmFYQEkjA+076pxMninW9PZsJ/7+4pfSHl53ZvN7OOVTnV8o+zztUXXh4ENPaRK6
 NT0hxYfYW87xM8IDjxSoZ/gfah56JrgpkuJsLcuqnyOUax151rXLuTUSkMy229tfBykSVlnEOeh
 COZ6QUszw1/K+kOiHIuCvmIDqxbm/AQzJ/F8Db+NLmZq70RX7Q34KQlL4EUCUVyZNTjLxv4tCWx
 yPMnljYyvrsk0+Qt6t0BgyBpHsok0j2BNV12pheUwwHxfU4yQ9DYPDTRvgIPokPcGj3ouo8zL31
 Voqe+7/fffZVwBdpxp7wSgQCYoipHd9JLt3a8i2dne2u2J00Dd6TvCEP3EAzZ8nz6fsuOrlgvkf
 +tuImGM4u7PgBskHjQAsbryVbBayat5FJ9aHg4H2nc0Qd57pkZa7VXPubWcDPwVaX6/IoADkNYi
 aUHwj8pgZ4b+vIJnI2FJyeg+Uz9KkrJMvaYbQySUq6Xr1DWkeXOSHpE2uYQD6NleQs078936UEP
 p6r2LGdNa4noAmQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: NEH3EZZKYICU2Y7JUBNJTGQ3S76TSTGV
X-Message-ID-Hash: NEH3EZZKYICU2Y7JUBNJTGQ3S76TSTGV
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NEH3EZZKYICU2Y7JUBNJTGQ3S76TSTGV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The enum with inter path is not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index fcad2c9fba55..cdb68f34e55a 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -475,11 +475,6 @@ enum {
 	INTn_2_INP_SEL_PROXIMITY,
 };
 
-enum {
-	INTERP_MAIN_PATH,
-	INTERP_MIX_PATH,
-};
-
 struct interp_sample_rate {
 	int sample_rate;
 	int rate_val;

-- 
2.43.0


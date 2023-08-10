Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE5777642
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 12:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30CB782B;
	Thu, 10 Aug 2023 12:49:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30CB782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691664599;
	bh=1NMdXUOC58+tcXZ9Q7r2MNWfwM6LYQNW8X+6AqBoqyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N1KbjgquHeWY80nyQAAOdnmOLohmHvKePe1QxsFINvwS/j3nDvI/3uhb5lVVLqk3c
	 W3VBZoySRWXhwMRknblszi99mPcUmJ8EC1YaDKNl1VfUfWSVAcvegYZGDzchRRhIUq
	 KGtaObnB0QXUaZhKf6PvoukUR4jQbf8g30wicsIk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35875F805B5; Thu, 10 Aug 2023 12:48:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6379CF805AE;
	Thu, 10 Aug 2023 12:48:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EB4DF801EB; Thu, 10 Aug 2023 12:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B33AF8055B
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 12:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B33AF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KMQ/zCzP
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52256241c66so1575990a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664480; x=1692269280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=KMQ/zCzP8/TnQe3Wo6hhI2Ivi3DhHc4D2lLfGnt9ciA00FsL4hsZH4u87Vx04WxQ3x
         RRedSie2gJxhgIafqOtTPolui5SRF7Ic4Vh/1ssUoRFIsFqtay8eJwiP2rP/GE3d5CyF
         1U8Y8epFOGqz1GAfIaPLFw4D8jQ7FzptURDIlo29y/NLoTttT7zN4Y6JjqzQPpmgZ3DI
         qkoSxsWbdO4WWARabNALqhZfBleorwPNeLZ6txLHzT3GrZ2hyPwlbJS1fKPvwSxXIh1h
         MoL9oTYywO4hnzh8dJ90rVwUuNJGIvdY3mBw5BAQWHGNEzJ2+JwSpH+gwOi61e2xzoIM
         byWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664480; x=1692269280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=awhy7m7stzp2b4t1gbEck/phyJM2A0irmengJm2DqgoqSNswkDs/tvKpivUdRjuglu
         lPx69NC2sRa4xRyFnXAgHyLhbdAh71LBnGT14SUuvY2zcrAcNn/F59yhg1H+R4an7Irl
         n302V32PNf39Ej017iCbgKQleCNXtp0Uj5ydjga/vw6Gjcp7OsLcnOfpKYpgV6G5oUNk
         MYbi1KlSAHRfHlK5Me3T94hID04SfEVXE+dd3qXQkBzzHk+9LZ0/o7unYZttIJnoZf1K
         BNKm+WklwVgjAmsHFDfNoot42oO9B+UyOq7zFZv3pqeK3Y7dg6UNcwXZOOMqSbLThWWS
         /2Sg==
X-Gm-Message-State: AOJu0Yy0rwt7t7rOBvvg8rh5aXIxVZKflwgvXNDUGghqPbku1heqEZL3
	PNpnWcpO/X8Bm8hO6iK8Z8wAJQ==
X-Google-Smtp-Source: 
 AGHT+IFqyvPfsZCXo/1EPc3mjODI47QAw0qLpl21vWUgc1bNs1yO0pXM9KolaKHhD7miC+E9pkUSwg==
X-Received: by 2002:aa7:d343:0:b0:522:2add:5841 with SMTP id
 m3-20020aa7d343000000b005222add5841mr2074582edr.7.1691664479840;
        Thu, 10 Aug 2023 03:47:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:47:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ASoC: codecs: wm8904: Fix Wvoid-pointer-to-enum-cast
 warning
Date: Thu, 10 Aug 2023 12:47:47 +0200
Message-Id: <20230810104749.164827-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CYCPB5WUR3G4EI6NZ7WJUWHFT43UACZ2
X-Message-ID-Hash: CYCPB5WUR3G4EI6NZ7WJUWHFT43UACZ2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYCPB5WUR3G4EI6NZ7WJUWHFT43UACZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'devtype' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  wm8904.c:2205:21: error: cast to smaller integer type 'enum wm8904_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wm8904.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 60319b468fb2..829bf055622a 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2202,7 +2202,7 @@ static int wm8904_i2c_probe(struct i2c_client *i2c)
 		match = of_match_node(wm8904_of_match, i2c->dev.of_node);
 		if (match == NULL)
 			return -EINVAL;
-		wm8904->devtype = (enum wm8904_type)match->data;
+		wm8904->devtype = (uintptr_t)match->data;
 	} else {
 		const struct i2c_device_id *id =
 			i2c_match_id(wm8904_i2c_id, i2c);
-- 
2.34.1


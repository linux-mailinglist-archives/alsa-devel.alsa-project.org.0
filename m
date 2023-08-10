Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C85BA77763D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 12:49:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A204C846;
	Thu, 10 Aug 2023 12:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A204C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691664584;
	bh=ScGk93Y2dNlMmrR0MgykPBeTqSPNMT7za/shT+UCoxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uSU9SbIjJhmkQT0e25rGuxX35PZlzFDUHGwZKZe01S+wLfMwRCc0dznQLgLASRM3T
	 crCW9Mw3HK412hGUQDkEU3i3NLVuqBh5NYFQkIuzfW0HUMy74RtchyhcJ2LHl4TwHp
	 fccBbXp2Hk0y518GXjkOOJ8L8GIXNN1mGPOOgNww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12B31F80588; Thu, 10 Aug 2023 12:48:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FE8FF8059F;
	Thu, 10 Aug 2023 12:48:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F94FF8016E; Thu, 10 Aug 2023 12:48:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A790F800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 12:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A790F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zfeXdylh
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe7e67cc77so1125355e87.2
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664476; x=1692269276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdCk7OUtlyVla0geNv76Vk4CNU64Mjej9PSyuuwP9Mg=;
        b=zfeXdylhcEBVDrqAny1SLIvN9Crr5v54nzF3ZLf3W/Eif1dNWT9wNlCKgPCQL/o0/E
         iYzjBPH3863DIk4aENP9BsmFOE0Y+EpLU2SlozYtRxJb4GQaDpNAA33nYUQsy3M2dVsT
         OpxZyOWl5CCCLP6aJa0vYV6RmTQxA+wi4TcMmhitHOdEobpn5o5vLFCXEirr7/Qm+DMr
         G5Rpk7tIg24B9EHXKP/uHgwg1ZuSYKfYQmoOFP6aLTRJty/VCoAZStEIc29/gNuUHg5E
         VwUyx6TO9alL/BcefRo7HnARKktyocMZXCzb007Et2yQXMf/XrlEBt21mzzwDFc17QPK
         ar7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664476; x=1692269276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdCk7OUtlyVla0geNv76Vk4CNU64Mjej9PSyuuwP9Mg=;
        b=gwF4KhfP/EnE0nydBUz2cODbRmOLoTH1TTWiOoJM3S8Owk9P7X+uB3DsOiggihCHb9
         3XcoGMWqT9dig7tdkS05BOprNRnWRb+zcQdWIDdmSduss8JtrL/sbgUpVw07up2BRdr5
         aXfb1J5LxDBqkwtx8v3SWrl1auNm9XeAmtZ3TCk1WVgiQS0A53VcnC7Tv+ewOlpzh5ke
         xxF2RDrhjBNLfhH4VxVdYCVJ6LtqO5YFn0dBDIxu8BuhafJT8moZZm29nq9ySQdvheY2
         v5xTmGpmHRZTcgtngQmBXWjSikkQrmE1bbK5pePt1kUj5gqpt/zoT6rCUek7lyIU922Q
         w27g==
X-Gm-Message-State: AOJu0YyXNA3i6pOfYlbLMQsLuab66NX0sVg4MhT7RQFbYjZ9DQwmQA/+
	cofXaLPAV4ugxdYz1a/g3qlkdg==
X-Google-Smtp-Source: 
 AGHT+IER0Z61HNUztY8QpmTryefpq33DBRiWMkpaT+UcHCgK4QowLfvk76l0MXCWns6xcZPsgfbbnw==
X-Received: by 2002:a05:6512:4013:b0:4fe:c6c:ac95 with SMTP id
 br19-20020a056512401300b004fe0c6cac95mr1693259lfb.35.1691664476514;
        Thu, 10 Aug 2023 03:47:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:47:56 -0700 (PDT)
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
Subject: [PATCH 2/4] ASoC: codecs: tlv320aic32x4: Fix
 Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 12:47:45 +0200
Message-Id: <20230810104749.164827-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3QTTNUCVWW6N6SKNJCUX5FT4AVUTYOSL
X-Message-ID-Hash: 3QTTNUCVWW6N6SKNJCUX5FT4AVUTYOSL
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'type' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  tlv320aic32x4.c:1352:18: error: cast to smaller integer type 'enum aic32x4_type' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/tlv320aic32x4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index ffe1828a4b7e..6829834a412f 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1349,7 +1349,7 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		return -ENOMEM;
 
 	aic32x4->dev = dev;
-	aic32x4->type = (enum aic32x4_type)dev_get_drvdata(dev);
+	aic32x4->type = (uintptr_t)dev_get_drvdata(dev);
 
 	dev_set_drvdata(dev, aic32x4);
 
-- 
2.34.1


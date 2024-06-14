Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F7908A5D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 12:44:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD956B60;
	Fri, 14 Jun 2024 12:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD956B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718361873;
	bh=z+21OcPJAjV6D/4J7/6zO4ml+szueCiKIz5ZtXCez20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U3bieIfyg0uJ0KAWEjd0khiuJxAsgFy1XcSIt7GX7vE/fMAp/qvtv1WXsYoLur0MG
	 OssOmpfFmufo+TLA3aaPsYpOcbqHc272pvA+yLbHFxJVX8M+G7TRm8USrHiFUlXsbx
	 /VLEszESXIpIL/X5Lvzmx6ppZd2c+ZoJMpQ+ZqQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01CC8F805B0; Fri, 14 Jun 2024 12:43:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDEBFF805AE;
	Fri, 14 Jun 2024 12:43:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 813AEF80496; Fri, 14 Jun 2024 12:39:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2B2CF800FA
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 12:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B2CF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LvswDzw3
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6f253a06caso251461166b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361584; x=1718966384;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v046Ynuau3r+2icIo4svtRx0/kg7YGr+WrTgAD4SYDM=;
        b=LvswDzw3p9BwykzzY9HjfoHHjWG89CDtdqkZ4Xe3OZDeAiA5ixeIOXzfrC7oj4rPHY
         owpUjqZmjVCgifXTYzAvf6/wpqliLyGesmP0TRtdxfK3tHWh3H14e6FVw6KPWZBAkOyD
         wqgitJFSOvq17tw+EFlbKegg2P1A+zHSJwnTR8OFQbQc/bI5mUq61rzy57h4afbF/Dd7
         WeUAhVSMB8ipaiUn4vkeeEVWihVI06UYrCSaI+7ASbMGbAs0y8XjqC7WBGosEYtJRsyW
         2B0kybcU4av6oPbZ6vgjaP9bjKq6tn3Cf+1y6pccoE4RtkxNCzz6HB5/IRsWPXNnfJwv
         8txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361584; x=1718966384;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v046Ynuau3r+2icIo4svtRx0/kg7YGr+WrTgAD4SYDM=;
        b=bggKPaJoquJkKQFWzWRVBOr0aGLuJi0IMlRUrJ7q9RNAHvfuflYib+DaDpclD5PGjD
         WgWTbwaXZ4ZjCSLNuX+Ghj2+VTYgaWEMuSgiuTuWfnstqlqIEJ2HUDNCA/yD71GiZhFp
         tA2dOLD9g5cqXxiWR5c6a7RWTZuBRXKVsj22fDOm04D2terlz5dJ8EIfx6eouwjN0ZbM
         8OPaVXA5EGoZaE2lUmbppspDmkP8GFtKd/j5sMZF3pR6zCx882A/dEPlU8WOqUhSr3ud
         9VN5s8dM8+0gMBPMpZXoS9bunF/SqyuUcK4btRjTTEuxAcnP0Mj4fcEI7dhxfE7k0Lzw
         GfUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2O4kU0myBtSR/G1vV1WvcanB/79hfbqM7AAxVbVLkQJWb0CxFd7n7eUOcwjSrHfaMQ2RVfrGY4MIQeh0vzN+0WJnyS76ntwmT+/U=
X-Gm-Message-State: AOJu0YxRYKg2+EgOAwVT2DgLznJTTouTIlBY9wHObcNxYqA+MiA46Dni
	6P8eYWxxk2Fm+itkkSYX96xQCbT9eIVNzFdUagsrO3akdtQA9PnamCUrWkFdSmU=
X-Google-Smtp-Source: 
 AGHT+IEx+k+d6jmLnxxySTuX+K3zHE/R51D+3f9To16Y8uYNB0SKgQpBH0n6JwaZnMUULpDr3sMbZA==
X-Received: by 2002:a17:906:3c56:b0:a6f:12:8c48 with SMTP id
 a640c23a62f3a-a6f60d5f66bmr174412966b.39.1718361584558;
        Fri, 14 Jun 2024 03:39:44 -0700 (PDT)
Received: from [192.168.0.18] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdd2asm175134166b.141.2024.06.14.03.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 03:39:44 -0700 (PDT)
Message-ID: <7b9c8a44-d0cd-4689-986c-f16d1239c91b@linaro.org>
Date: Fri, 14 Jun 2024 12:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
 <20240612-lpass-codec-v25-v4-3-f63d3676dbc4@linaro.org>
 <a6793126-ba1c-4679-a2c2-eabad4f5a506@linaro.org>
 <93b2de4e-dc2d-4781-9c1b-d6ad6d888eb2@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <93b2de4e-dc2d-4781-9c1b-d6ad6d888eb2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: L5F722F32C5M66BJ4FB5ZL2XCKBWTOPK
X-Message-ID-Hash: L5F722F32C5M66BJ4FB5ZL2XCKBWTOPK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L5F722F32C5M66BJ4FB5ZL2XCKBWTOPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/06/2024 13:04, Srinivas Kandagatla wrote:
> 
> 
> On 13/06/2024 12:00, Krzysztof Kozlowski wrote:
>> On 13/06/2024 12:49, Srinivas Kandagatla wrote:
>>> LPASS Codec v2.5 has significant changes in the rx register strides.
>>> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
>>> after SM8450 have only Left working.
>>>
>>> This patch adjusts the registers to accomdate 2.5 changes. With this
>>> fixed now L and R are functional on Headset playback.
>>
>> I was just about to respond, are you sure this is suitable for sm8450? I
>> looked now at registers and sm8450 (which should have codec v2.5) has
>> old style register layout.
>>
> from 2.5 the layout has changed, I have verified it on SM8450, with and 
> without this patch, This fixes the issue one speaker issue.

I tested it now on SM8450 and indeed it fixes missing channel playback
via headphones.

Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


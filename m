Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8C648196
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 12:26:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F0F621E9;
	Fri,  9 Dec 2022 12:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F0F621E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670585183;
	bh=h0F0ECbgu9UjPgQ1su1RR1vAjGvH/t7wpuDyq0wvdRg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lKj1+EzDIqCNEnlw4M9qYPzWyxZ5LHo4qO7+JBtmJh4dBnxDc+k6Gc0GhuUuJu+XL
	 6pzxo0kEJ2mKCy9bP9f8X9WvW0/5kzZUhiWdJiJ2Qu1PYTZ66mDLc5WtfdDZ1q9zwF
	 UydxM/ctMYXmQPc0atb3exnUYrswYpqEZC4REF+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B46C3F80007;
	Fri,  9 Dec 2022 12:25:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8760FF800F8; Fri,  9 Dec 2022 12:25:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9EA6F800F8
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 12:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9EA6F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=v8O3Iind
Received: by mail-lf1-x12d.google.com with SMTP id d6so6522714lfs.10
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0K7eVJj4k3cMvSUFweS+f/J9GwqB4FTC28EsgFNd3e4=;
 b=v8O3IindDPA/6bCVNb+vJbPGFFquksYTufkIL+Vc7fLkAd/9VzB6hOH2SxGv89qjVJ
 cNK9uYg8Oy/rJtYZ/8G8LMuzRhp3Gid70zHybmHW1tZxmRozMR0cJNglctyaw17vBDgZ
 +fzwQWVeI/oQsKm7SMm1faRESIHEDNiLz86aDkwC53wksXi4ccm+VpJJsbzCNj1fZ4iD
 tjwfA1zH3m3vTQH0URH6ln7ISWtYQR2uIGmDXytFFNw0KOwKuHfI45v68zdyc4VpD9jB
 2pNx580WFgQsamVQLtnQA3INsyxfKp5Es7Yezkp5xBefQc8FjwI9VJhqJWhzi5YXrMY2
 hBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0K7eVJj4k3cMvSUFweS+f/J9GwqB4FTC28EsgFNd3e4=;
 b=XIIV6ue56dZ6YuiQ/WkKUR7R5hToBg7LjhfsDsjtN1fjhUsUFvFqetBca5OQ6TYNEm
 SGKp7LMW0tQE0Qlc1SfpCBnkmyE8eYtH8jlWpbRWQSRv8c7ybkFIf8LK2bR16VGKVUTX
 8kgb4bdy28J8W7/JZ7Rk2qVPbcO220ReCuyChDy3M1/40OgvaFGNuaFAHIkxnYrqgoqs
 BVJG/N86YiJB/2wc5a4Yxfn1xNLUrrz9mV2w76db+wfJ7xTZS1pHKLN1yUk4v4ZtNdu4
 2SRKjveo1XoXijX6S9hBRxmUQjMsz4uCpnZcADxZmsCqtX+5w/mbjvr7Z/NKmwNZShgR
 hPIQ==
X-Gm-Message-State: ANoB5pl/eKinRJCQS2Jmbt2ya5/ObmrmDjUJAsySrkVQywY0a66Aycjb
 Sooia9I6ItfKKUhijuGkAHfxkA==
X-Google-Smtp-Source: AA0mqf6LfW07j/W9B4V1vwkpcNXcjozq6HyoRYstlaUqh4lqn4eUXH8+9Cn1fFTwacZZFVk5UNKMVQ==
X-Received: by 2002:a05:6512:150:b0:4b4:f212:617c with SMTP id
 m16-20020a056512015000b004b4f212617cmr1274955lfo.1.1670585119603; 
 Fri, 09 Dec 2022 03:25:19 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 e12-20020ac2546c000000b00497a0ea92desm218963lfn.135.2022.12.09.03.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 03:25:19 -0800 (PST)
Message-ID: <79d72425-2188-0a87-4ad3-a334df081005@linaro.org>
Date: Fri, 9 Dec 2022 12:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] dt-bindings: sound: rt5640: Allow to describe how
 LOUT is wired
Content-Language: en-US
To: Jarrah Gosbell <kernel@undef.tools>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221209105621.39237-1-kernel@undef.tools>
 <20221209105621.39237-2-kernel@undef.tools>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209105621.39237-2-kernel@undef.tools>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: phone-devel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09/12/2022 11:56, Jarrah Gosbell wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> Depending on HW design, som boards may expect mono differential output
> on LOUT. Describe a property that enables it.
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Jarrah Gosbell <kernel@undef.tools>
> ---
>  Documentation/devicetree/bindings/sound/rt5640.txt | 3 +++
>  1 file changed, 3 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


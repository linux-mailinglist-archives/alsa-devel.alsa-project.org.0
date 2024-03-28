Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1A188FA8A
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 09:59:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F4D2C7D;
	Thu, 28 Mar 2024 09:59:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F4D2C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711616384;
	bh=ooRUq2ddQ1vPC7829e2Ird4axfo+2+6ZaBjqXrgySis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aJx5jA/KgPjzhZIgJmFuCDI8Pfrsi4tErA+zAP55cXZEiDm/9JnMvr0JSVlnqZuB7
	 hNeP6sZvcw+wSkUH/R87F55vnFZ2lSHMhwpccgu0Asnox4+WXjQLOYytXRV4K+qabz
	 KWtXPs3ZlJeE6tSzuZN7ytjijuskap9jEMW/0Qjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF7CAF805A1; Thu, 28 Mar 2024 09:59:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99FF1F8057B;
	Thu, 28 Mar 2024 09:59:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C8E2F80093; Thu, 28 Mar 2024 09:58:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73BB8F80093
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 09:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73BB8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a7TVntK2
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4154471fb59so2755205e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Mar 2024 01:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711616277; x=1712221077;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NRShXC1zO3OpW0uGpvJKq5K43bHvLfKJ1qejl8dVl2Q=;
        b=a7TVntK2qWcvWk0XS0iqWedJuHXSQ23h3DBVfeRoWT7AuNctBxkox6y1+HHI23Nzkb
         0gb41nIev3+zBqFUCFtITQ1yvsF2xblfp1aZzhO8yhkHC/9B7lKOyF3CRaqsV+PCKQCX
         WA5EvqeaWKQfuFtDRUqW1k6i4l+hI1HZorZLsMcogTVJPLiBgWM6Ug5RuMtf8+hOmChm
         fPao86qkTj9uqT6TVkjSB93dp5BnO/Ka4PuqMGVIr8s884H4ktmqLPe/Ib9Xpgw7lKyc
         6fyvJ9mWnwa9VAOZ0mh+qsZPAb1E/v/7DIhZZIs596HBxoFQq8+C26WSNRKfYg3nq/r1
         i7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711616277; x=1712221077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRShXC1zO3OpW0uGpvJKq5K43bHvLfKJ1qejl8dVl2Q=;
        b=gQDymCqX/+g61WkswF0030gfImz3mz3+T4EHM7cdLLLn6658Kx5MvoVcZ6FyhbhmSI
         3KwiEfrH16YUW5Kb+DyvVS3L2W6FpGNIRepBsypw9+KzJMfAUKPPOl/GxjqMMEvxgKy/
         7Re1Q8iOL2eXUk8Jq14vIfh8V3zzdHStTPN8CtItOiyprE6ntxY/Tne0CMZx+azgXXQr
         QapWI+kp24ZiH1P5aGsgQq4LujbC+ZKgZTlRP6/8Jxz8lH6Ax6cIHnBcsJm894NItGvV
         lVVaUpDDdoVXoeT8oAF3EBAEa4mGHU/9+o3IfTpJWQLeZ9kfsxYZjkdPDXLBvCRl9yu1
         DLug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG0AHjM/OJVxKsGuQe6iSzEV+BiKuNWVqPyh1sImuTEwePudcHShE8LyNLV6QPO0IjTCuLYXFvdU+0G4F+gjCF5nN+VOr0cZ+jsrM=
X-Gm-Message-State: AOJu0Yy4tt8GpYWgrMMtmI1pcXv7HrGmNshznmBCciFx32M9LpDW2jwD
	QI9jhh4XZwkM0Ul1keNuFPjl35Afja6AILjC03UugB69Vzgr/t0v8A7abOVv9/c=
X-Google-Smtp-Source: 
 AGHT+IGClEr9Xl46lzchyoUADhh1NeJly47SViYywtFBwPicFQjYByaG0eB1JYYqM2Y+qq5k+R9jQw==
X-Received: by 2002:a05:600c:154a:b0:414:71d8:9c87 with SMTP id
 f10-20020a05600c154a00b0041471d89c87mr1668021wmg.19.1711616276716;
        Thu, 28 Mar 2024 01:57:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.148])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0041469869d11sm4703990wmq.47.2024.03.28.01.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 01:57:56 -0700 (PDT)
Message-ID: <5b917ec7-f8f8-489c-a804-70ea603262dd@linaro.org>
Date: Thu, 28 Mar 2024 09:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: ti,pcm1681: Convert to dtschema
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240328014029.9710-1-animeshagarwal28@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240328014029.9710-1-animeshagarwal28@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MNMEI4LYLMPWFNC7B4DKOUJYXMMH5NOR
X-Message-ID-Hash: MNMEI4LYLMPWFNC7B4DKOUJYXMMH5NOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNMEI4LYLMPWFNC7B4DKOUJYXMMH5NOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/03/2024 02:40, Animesh Agarwal wrote:
> Convert the Texas Instruments PCM1681 bindings to DT schema.
> 
> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> ---
>  .../devicetree/bindings/sound/ti,pcm1681.txt  | 15 --------
>  .../devicetree/bindings/sound/ti,pcm1681.yaml | 35 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm1681.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.txt b/Documentation/devicetree/bindings/sound/ti,pcm1681.txt
> deleted file mode 100644
> index 4df17185ab80..000000000000
> --- a/Documentation/devicetree/bindings/sound/ti,pcm1681.txt
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Texas Instruments PCM1681 8-channel PWM Processor
> -
> -Required properties:
> -
> - - compatible:		Should contain "ti,pcm1681".
> - - reg:			The i2c address. Should contain <0x4c>.
> -
> -Examples:
> -
> -	i2c_bus {
> -		pcm1681@4c {
> -			compatible = "ti,pcm1681";
> -			reg = <0x4c>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
> new file mode 100644
> index 000000000000..4093d0ff654d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,pcm1681.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments PCM1681 8-channel PWM Processor
> +
> +maintainers:
> +  - Animesh Agarwal <animeshagarwal28@gmail.com>

Why not existing driver maintainers? Do you have this device? Or use it,
or care in terms of your projects?

> +
> +properties:
> +  compatible:
> +    const: ti,pcm1681
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +

Missing dai-cells, $ref to dai-common and unevaluatedProperties: false,
just like in other simple DAI devices. Mention briefly in the commit msg
adding these ("Make bindings complete by adding #sound-dai-cells").

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pcm1681@4c {

Datasheet says it is dac, but we usually call it "audio-codec".

> +            compatible = "ti,pcm1681";
> +            reg = <0x4c>;
> +        };
> +    };

Best regards,
Krzysztof


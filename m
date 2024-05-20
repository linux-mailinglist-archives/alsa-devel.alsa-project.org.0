Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 993928C9E5B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:48:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27006B60;
	Mon, 20 May 2024 15:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27006B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716212931;
	bh=tL1bHXt9/YAqmnqPjn/s8RxMKcWc/S/C/wlJtqQ+WVI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=U7QuCO8DZedT9sotQxSkAa02oEBqB/H3qVw+tgeLQbqTSPhJhTtqOVnxQuBcoUOuO
	 JWdA5h46uLSzTdsODnikSCENpFCSAOdDgwinADBJDOnri26EfR07HNvCsZlPsdcDn8
	 2WRaJGU2Xa7dFURCQWHXlr9WtI4lQO/an9tant0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF6AAF806DF; Mon, 20 May 2024 15:46:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06BCCF805A9;
	Mon, 20 May 2024 15:46:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A71EAF805A8; Mon, 20 May 2024 14:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03177F80579
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03177F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rFINDfci
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59cdd185b9so1078485266b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716208937; x=1716813737;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/prEkk7NlB/e4K/D05nDd1aUEil2ACTKtIqCg4p2NQ=;
        b=rFINDfciGdd6Hw3LZw7BFI/O8CwTCOe4ZD2rPStdr2DPxEpoomJ21JOvmXnIN3lC+o
         7pE+itDCU/M/ItmDkGA2I2YwPOY6VAM+LfnvaFjqEXsPTVUJRdn6Ckq24x5Tt/bNTnJN
         udySoBxM1LbZI9rshSUMm7FyudY0uf0N1kYiUrFAeoqTwB6MOMIlkQYOMNOrIwAZQnpm
         FYyVP70oz96oKdEofGSHoBkmuFW6b8100EARw6evTxZ3lIXW9dlzxuOP8xowLwbBYKY9
         MoCH7IpiIDbEN2QKB+bJ6NtOrd4D6Fq3sRP749di49seaRdoYftXg470DeG5L7+vLrbo
         mgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716208937; x=1716813737;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/prEkk7NlB/e4K/D05nDd1aUEil2ACTKtIqCg4p2NQ=;
        b=udJgBP3w3mge22XleXgwQkprxExo3Fdd9fUcSf7W/NH1A5A5AJ5/5qaLRPIC5BHEA3
         CKbHxoGN0Ov6AGJywRUdwkNu2ylCr1KMyhutxCcfjPLkMF8jANBdhOdC9niX2L2icujV
         uSbLaH0FVCA6tj+VoXZhMMmzrIxR8daPYFNTvtLVZEIk94jJO2k0gpyZqRf+yc0t/Lfl
         PMYFBw2rj1FVJf3vjRrPQwxYtWQ1buBx3CY1+9+EIfxloiUlmQ4Rq4trROT8FSOn71cU
         3YeAFtFOQQev/ugEDowqxm8O2/hgtFZiA24lpqbnQnpG+9lOsK5x6htLDZQoRSH7tk5K
         GjUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfLHNCndnl4kD8PbbjwN1Y2qJE4Dy/8fXLABVH69/jNidAlVsf19RWUtGeNGpliUU0aTuwjmfofuO8kTrLJ0YAt9poTpKiXkbnpvM=
X-Gm-Message-State: AOJu0YzrtA4YPHhmc/bJUK5adKBlbiG5p0ZqkLs4WrQsPmGibufkQm3c
	X4xd4KGNZKubH2f1Bml8ljtPwSngnPHI58lSK/SLC8BqhjImZNl9eG6mEGYAV1yrTwCacIYiyPR
	8
X-Google-Smtp-Source: 
 AGHT+IF8d/xOk/RNnnP7/4WfSzB76iIM3cflEPGPzlqVTR7AQEzeW1/6VwsH+L7iXQzc7YUlsDhB5A==
X-Received: by 2002:a05:600c:4f49:b0:420:12df:1f7e with SMTP id
 5b1f17b1804b1-420e19e46d4mr48893585e9.9.1716202057408;
        Mon, 20 May 2024 03:47:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccfe1277sm405621845e9.42.2024.05.20.03.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 03:47:36 -0700 (PDT)
Message-ID: <4727a091-bc64-46ea-8652-db6797dd93d2@linaro.org>
Date: Mon, 20 May 2024 12:47:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform
 support
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1715939146-13031-1-git-send-email-shengjiu.wang@nxp.com>
 <1715939146-13031-2-git-send-email-shengjiu.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1715939146-13031-2-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ASVJLGSQTIO2FKTDF7LJGL36PYJL3IBJ
X-Message-ID-Hash: ASVJLGSQTIO2FKTDF7LJGL36PYJL3IBJ
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/05/2024 11:45, Shengjiu Wang wrote:
> In order to support the MQS module on i.MX95, a new property
> "fsl,mqs-ctrl" needs to be added, as there are two MQS instances
> on the i.MX95 platform, the definition of bit positions in the
> control register is different. This new property is to distinguish
> these two instances.
> 
> Without this property, the difference of platforms except the
> i.MX95 was handled by the driver itself. But this new property can
> also be used for previous platforms.
> 
> The MQS only has one control register, the register may be
> in General Purpose Register memory space, or MQS its own
> memory space, or controlled by System Manager.
> The bit position in the register may be different for each
> platform, there are four parts (bits for module enablement,
> bits for reset, bits for oversampling ratio, bits for divider ratio).
> This new property includes all these things.

...

>  
>    clocks:
>      minItems: 1
> @@ -45,6 +46,22 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  fsl,mqs-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 6
> +    maxItems: 6
> +    description: |
> +      Contains the control register information, defined as,
> +      Cell #1: register type
> +               0 - the register in owned register map
> +               1 - the register in general purpose register map
> +               2 - the register in control of system manager
> +      Cell #2: offset of the control register from the syscon
> +      Cell #3: shift bits for module enable bit
> +      Cell #4: shift bits for reset bit
> +      Cell #5: shift bits for oversampling ratio bit
> +      Cell #6: shift bits for divider ratio control bit

Thanks for detailed explanation in commit msg, but no, please do not
describe layout of registers in DTS. For the syscon phandles, you can
pass an argument (although not 6 arguments...). Usually this is enough.
For some cases, like you have differences in capabilities of this device
or its programming model, maybe you need different compatible.

If these are different capabilities, sometimes new properties are
applicable (describing hardware, not register bits...).

Best regards,
Krzysztof


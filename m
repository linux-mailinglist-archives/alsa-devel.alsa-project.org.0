Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E116701946
	for <lists+alsa-devel@lfdr.de>; Sat, 13 May 2023 20:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9925AE97;
	Sat, 13 May 2023 20:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9925AE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684003173;
	bh=aVGa0cp4no2C6TpyXM/Z5Bb7McBhk22NagG3MmBM26o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GAvpDWUn4WJxyuiOt5gAXAOlR9Wg5Z6iDFUORs8OCDAFtEUpxQ56HzLIDEZ5PTKQh
	 /1XzUsWx/CmLYfZMu7CXEn6G0zsestCwZY1OEcdrnjsLhEHHxFtnE5x4cIHZbiLSJS
	 imo+se0feoBGXnJw+CwGN9HvILmxNo5HGqGATHKQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B706FF80534; Sat, 13 May 2023 20:38:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F251F8032D;
	Sat, 13 May 2023 20:38:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 183CBF8052E; Sat, 13 May 2023 20:38:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E94FF802E8
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 20:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E94FF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DtRnRg/A
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso2020377966b.0
        for <alsa-devel@alsa-project.org>;
 Sat, 13 May 2023 11:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684003085; x=1686595085;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVgFhwHOytyuvlsolpGzS2P+RyNCIsvWoWjH/sbEmtE=;
        b=DtRnRg/A4eLKBxwIOINV8zrS4xA4IQslQOM1D8WygiSvDUYpfbyveH+tFEjP8rN/jZ
         Cex33mfHaOurVgiHOf87d6mvaI2G4kpeIGagrUkv+SDgE/+VpwSOSBbPbZvvV64SQ5FJ
         tAetgjBOLVz5i8zr3Tsixz2jeXiso0uhVGUQlbhvoYvYIZUO5LkGscLoRGY9a8KjTCMM
         SX0Q/gSF0sGtohfiDEYjb+dPZbGuveenifM68sn+HzP+GdV9GFAwWAbYg7JueOwpaLr8
         jraazG3zD6Leiw+GGzqiSQnUV2Qpe/5g0Rgyy5vuYvofldDRqqCG9qlccj+cR+8ed2HZ
         QEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684003085; x=1686595085;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVgFhwHOytyuvlsolpGzS2P+RyNCIsvWoWjH/sbEmtE=;
        b=G7fTBjzzT91E/Vbwo8o2cO4o6VcFByVw5JGm8aqsNOezS6GDfKmM+pEYCoHphKtgtb
         xBrQlyVm6Knj3Q5rmFQfzFvWn1bcMCFUfQvAd+xbPhdTK+GflREliMaWRDGVqBPe8FKl
         Sb8dm1zOfr+rW7DE5RrpP8P3EgOOh/grS3a6sP1gURPjUGBuJP6jw7KTmovGLann0mem
         05RgAoIVIUOgixnGJWV3wknF14rD3IbMcnRxe/yPi9TTYUnBMsg+OiqxnRdMsdramj5V
         tkkI1T3/fTf9i/F235mregZdzcfRXzXExmTK3cDumralE0W3lCQgDhNNz2XilDAb14o+
         rdqg==
X-Gm-Message-State: AC+VfDwdXj9b6BayAjooX8yqQQ6vG9T/tFQSwSVnHfg9W9qrL8alHVzR
	hUH85fU3iPJ1nVTm5hoj7RuseQ==
X-Google-Smtp-Source: 
 ACHHUZ79slRCtETc6zkU7ZGXxCapCDmP+cFVxtmTL5H2S439sNsRE0njq6hk/Vnruf0psMaMCUB7+g==
X-Received: by 2002:a17:907:360c:b0:961:800b:3f1e with SMTP id
 bk12-20020a170907360c00b00961800b3f1emr27294480ejc.73.1684003085137;
        Sat, 13 May 2023 11:38:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4?
 ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id
 hu7-20020a170907a08700b00969fa8a3533sm6254835ejc.165.2023.05.13.11.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 11:38:04 -0700 (PDT)
Message-ID: <877338f8-d157-0f91-33a3-fdb03566aa57@linaro.org>
Date: Sat, 13 May 2023 20:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: nau8824: Convert to dtschema
Content-Language: en-US
To: David Lin <CTLIN0@nuvoton.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230512120146.600128-1-CTLIN0@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512120146.600128-1-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VQY7MXEI2IFFUM3KUFBND6BP6ANN2KN2
X-Message-ID-Hash: VQY7MXEI2IFFUM3KUFBND6BP6ANN2KN2
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

On 12/05/2023 14:01, David Lin wrote:
> Convert the NAU8824 audio CODEC bindings to DT schema.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> +
> +  nuvoton,sar-threshold-num:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Number of buttons supported.
> +    minimum: 1
> +    maximum: 4
> +    default: 4
> +
> +  nuvoton,sar-threshold:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Impedance threshold for each button. Array that contains up to 8 buttons
> +      configuration. SAR value is calculated as
> +      SAR = 255 * MICBIAS / SAR_VOLTAGE * R / (2000 + R) where MICBIAS is
> +      configured by 'nuvoton,micbias-voltage', SAR_VOLTAGE is configured by
> +      'nuvoton,sar-voltage', R - button impedance.
> +      Refer datasheet section 10.2 for more information about threshold
> +      calculation.
> +    minItems: 1
> +    maxItems: 4

Your description mentions 8 buttons, so maybe it should be 8 here? Or
description needs a fix?

> +    items:
> +      minimum: 0
> +      maximum: 255
> +
> +  nuvoton,sar-hysteresis:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Button impedance measurement hysteresis.
> +    default: 0



Best regards,
Krzysztof


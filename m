Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6BD6CBA01
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 11:04:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D16B1F6;
	Tue, 28 Mar 2023 11:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D16B1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679994258;
	bh=A+5qU0hnHKLisD+5hOSexEiECdKdSapHnVFaxQbwhsU=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A74WcQ01yRIL7tAPThbRVxILpw8cC/nepusVgFjYT4JoUcEPHW8A0baPmMDa7CK3z
	 jI2kFi1agJ6n+c5zBuHyyWa4Wkq3rxr5q0yUe/8rFRozw+F/G9d7RMpAuq71ctMst4
	 FsT1tVxqpWkCuA2Rg7HhE/jTem4ZNUKiB5V0ZVSg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A3A9F8024E;
	Tue, 28 Mar 2023 11:03:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84391F80272; Tue, 28 Mar 2023 11:03:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90C7DF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 11:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C7DF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fVq/jk9C
Received: by mail-ed1-x531.google.com with SMTP id r11so46608772edd.5
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679994193;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfMOEaRMfB0CkwnzwtCztEWzGStOffJ3pjNN6FrOs04=;
        b=fVq/jk9CPHN2TZ9GLq/iFgE1d+5kXscbLsN+JfDzDoUbp/95oWZQLWnsb/6nmOVrF8
         26CX9jUnM6CS5QaUQiIFQm/MUuaFUUhLCLSRQPLVk7xZh2lgTsEnujq88I3m4UyaYacv
         1kZsp/WMQEzJQvtm0Sg2U8f/IiEy0qkk738Z55Ov7vZe9sovIytvHpxr9PSc1j7Rckxu
         JzKRTM9uvJXBaaS6XGxXp2NcvBmE+zLmiH3F06Dz98j/UVIz+UAYfJzr+5yH2hu8zci0
         CUX3HmQS2ahC9k8M0dsOZPIsZnd2nBeLzWAyP6dxBcly6d3kU6HqaXCAJMAEJMObufFT
         o8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679994193;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfMOEaRMfB0CkwnzwtCztEWzGStOffJ3pjNN6FrOs04=;
        b=11cRBqGO06koiNWMIzQ+KurAkfsRWxulS1oxU+zPqgudaujrb6T2FUIewMi/8bdxhR
         uF+rcpbX59+NWB1zDsX/myK/bbr3IvdP+uLrlKbsYiseGA/yYkyimPBJIGfaZ/r8venW
         j1SBdyP/SxLyKhZBMGtIoWifWC7QoLOrxcDb98YoqNFiY5rD57SK2CljcvdVmSuV2psy
         j+kI8sudSi29Vsm3dzv+TbXFiSGr8HupBQR6dDU2j5IdAiYh9+7h/OrFDVLOFmXkezRe
         q2+hBuFbfVPeMuZw6eFqE3aCLvo8oCqsnDGYIlwkPdbP3OQiFsM9v1ymoySiUFozGZCm
         435A==
X-Gm-Message-State: AAQBX9cdSFsTvWYqR5M6Dt914B1XrgPa2ykV1+Nl2wKtW0U7ksBL4Xho
	IzzFc4vJAALC/R5d58bCr/yvog==
X-Google-Smtp-Source: 
 AKy350al+r6wRfNsIEvo9SsoXyJYhtOAMam/bUH+WmK7eupq1spp+97C+1AZzxYOdKNWwQRHwHUZZw==
X-Received: by 2002:a17:906:f294:b0:933:9918:665d with SMTP id
 gu20-20020a170906f29400b009339918665dmr14977857ejb.11.1679994192998;
        Tue, 28 Mar 2023 02:03:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id
 bv1-20020a170906b1c100b00939e76a0cabsm10092601ejb.111.2023.03.28.02.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 02:03:12 -0700 (PDT)
Message-ID: <992c64c5-48f8-e267-283d-51a57f238433@linaro.org>
Date: Tue, 28 Mar 2023 11:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] ASoC: dt-bindings: ak4458: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, broonie@kernel.org,
 daniel.baluta@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, shengjiu.wang@nxp.com
References: <20230328084753.55200-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328084753.55200-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4E3BFHEYQVBLIGXSXQZSOH6ZUKRP4TMQ
X-Message-ID-Hash: 4E3BFHEYQVBLIGXSXQZSOH6ZUKRP4TMQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4E3BFHEYQVBLIGXSXQZSOH6ZUKRP4TMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/03/2023 10:47, Saalim Quadri wrote:
> Convert the AK4458 audio DAC bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>

(...)

> +  dvdd-supply:
> +    description: Digital power supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  mute-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO used to mute all the outputs
> +
> +  dsd-path:
> +    description: Select DSD input pins for ak4497
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - const: 0
> +        description: select #16, #17, #19 pins
> +      - const: 1
> +        description: select #3, #4, #5 pins
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: asahi-kasei,ak4458
> +
> +    then:
> +      properties:
> +        dsd-path: false

When I commented on adding allOf, I did it in specific place - after
required before additionalProperties. You decided to put it in different
place, not the one I asked. Also not the place example-schema is
suggesting. The placement of people comments in emails is important. We
answer here always inline, thus comments apply in the place they are given.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E8705345
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 18:11:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA8BD8;
	Tue, 16 May 2023 18:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA8BD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684253463;
	bh=RmtrBftA6Jii02U1bLnNPPw7WL9QhyOM6HwfikBjMZs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tFvXeYoCHqDKQbPpBd/A+kvoyV8B2m0E+5z1o9VABbWzzJFUS++gFgwgwFaGy80g7
	 gI2sfagjVKy3oL2XQwkjm+hsjMhcvqJWRrwXQ5FW5PWhOkv2kuskW8pKS+e6F1zd/K
	 ZhrJbYjHk+GT4paoLiFH36N/e15UnroAtoRGgkeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 982D1F80272; Tue, 16 May 2023 18:10:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ADB1F8025A;
	Tue, 16 May 2023 18:10:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02373F80272; Tue, 16 May 2023 18:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11987F8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 18:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11987F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jqfmezc+
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-965e93f915aso2572627966b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 16 May 2023 09:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684253402; x=1686845402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXN9fC68+0wOwoUgN35mdkv/ToBeX0eP1GANhqJ616g=;
        b=jqfmezc+iDuiL4+8rcw0FLasJ7cFfDAZwrNmiOdNKwXYGyN4f3pviQBrfwZ6n8w1os
         eAgW61Oetq+gQnl+qln0X+SZvogfP/Gwnp3ygALuRXi6KiJK5rtdlPU8xVetofXKhYHz
         8G0jg/9LvWFNuiXY2SFqWJHoG+S3ZWmIZ6UdQXiC4rif8xvI6/LwwLhLkDkL68cXIiIs
         JedLKOK4v0JhelSF9VIYo20VOiLpUkSeH/cmgpjSktR6xg/VZQc9ExcMnzLPJiYDi6DY
         yFrX+ouiUcFnzcl8iAmZEzfT7SWAGLnh8ewQjVbpMIUkzDjTvZ7fxlPVK4nLMWp6zzVM
         xKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684253402; x=1686845402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXN9fC68+0wOwoUgN35mdkv/ToBeX0eP1GANhqJ616g=;
        b=R7fp939QoxvmEWppO2updLDAHjGdfCWO78OoB870UGe/PwOSSdpHqisB0QcFWEA6HB
         hvnl5sm9UY8jwQVVVaHAZH8u+FFF+L26yG7NI7gPj0k5CuaVy9TTSR6NUGFRMeDQ1tA3
         CC79AYYMloOxU78C7/1zZhnt9x7V+buUWaYAsEeU4AlNsQZDUo/syUGswJou1WXecBTr
         EzCcfoZndHY29c53KWNmcf1gIq7VDf4smhWimd72crQVA7FWrzNks+qcETkHksNrhk0V
         c9xt1QuuR2YbV7S0FKa8dcQQMTB3Q2mARR7WBe3uiCyvXW1tvBhhTO4PBbHYd9+BkxJ2
         +r2w==
X-Gm-Message-State: AC+VfDxNrysxPCa2m8DpITHae9sl93exJIXz85nw1tr6D1zssiZ3Vw04
	TZlB9tufiNLmHJ6zJv5uTp2M5A==
X-Google-Smtp-Source: 
 ACHHUZ6bPH/QwuPvuWQmbb+0AoyFih81eO5OGQQ8+edrJxwWAeWmGVztoB1iBsg6nVRrxFd1f16Qwg==
X-Received: by 2002:a17:907:94c3:b0:969:e7da:fca0 with SMTP id
 dn3-20020a17090794c300b00969e7dafca0mr26907708ejc.8.1684253402008;
        Tue, 16 May 2023 09:10:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc?
 ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id
 hz20-20020a1709072cf400b0094f4d2d81d9sm11021871ejc.94.2023.05.16.09.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 09:10:01 -0700 (PDT)
Message-ID: <e2819075-c41f-716b-023f-fb1ad13a3466@linaro.org>
Date: Tue, 16 May 2023 18:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: nau8315: Convert to dtschema
Content-Language: en-US
To: David Lin <CTLIN0@nuvoton.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230516054944.1081808-1-CTLIN0@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516054944.1081808-1-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LP6CC4V6I3HOBMQVPYECIH6S7OAZ6J46
X-Message-ID-Hash: LP6CC4V6I3HOBMQVPYECIH6S7OAZ6J46
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LP6CC4V6I3HOBMQVPYECIH6S7OAZ6J46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/05/2023 07:49, David Lin wrote:
> Convert the NAU8315 audio CODEC bindings to DT schema.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> ---


> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,nau8315
> +      - nuvoton,nau8318
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO specifier for the chip's device enable input(EN) pin.
> +      If this option is not specified then driver does not manage
> +      the pin state (e.g. chip is always on).

The only thing driver is doing is to toggle this pin. If it is missing
the entire driver is noop, thus above comment is a bit funny. It
probably should be mandatory pin. But I see it was there since beginning
so ok.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


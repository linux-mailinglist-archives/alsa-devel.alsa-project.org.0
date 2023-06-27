Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBA473F48E
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jun 2023 08:33:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39169822;
	Tue, 27 Jun 2023 08:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39169822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687847594;
	bh=oyKP1lRVrL0SMOgq6ZNfe7yyxp0Ez5HWLCP2BgBU/iE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QwvlvkUWbjY2k1QfQkI3lViWpT2ohGMHG1aLf3i/d/SORbi9EOhGKbBn4JyKXj3a1
	 E3jFS+cALBQskezHE2x93QEbwqq+gtUcHBAFdlVr7BRjGCw/yPlJhFCCTW0QwpRWYc
	 B9bNLXD7/ZZnoW5ZmYnPCOy6PhzdrHrwXtn9FkQs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F3CEF80544; Tue, 27 Jun 2023 08:32:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF33F80212;
	Tue, 27 Jun 2023 08:32:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A458F80246; Tue, 27 Jun 2023 08:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 165DDF80093
	for <alsa-devel@alsa-project.org>; Tue, 27 Jun 2023 08:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 165DDF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eG5lY8yi
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fba66f3b14so1932175e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Jun 2023 23:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687847510; x=1690439510;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Si6Ds0vIKrIAT8qa+H99PovIF2KoNnQmkzHNG/XuQM=;
        b=eG5lY8yijNXzzf3FRRqqA8mkVVZD/ep6BhD3iqM++Qe5YM7Jw3V8PHtl+B79iaRgrq
         xuURBt6ROXEgdl871/hStZQAwLbpZ3p/VWFKxXwrN7Z/WHM4+yBr/qpGm/nargXSyzgz
         uH+yq4fyGkBZSDWqEsGNFtKbIrlWQnZ6wgnwKHZQQ1+/V5eOYlV0/fcc/saWotFFDjkz
         e3uwwnC8dRp8r745K1pPOuLXLAu9oH2ViJv1Q5ISsX9UP/mV6Fuj4w2TzkpEnrOBkgS3
         9sViazOiUny/Gz4XrvmOAKRx2k3heN+BlbowsWHasHTgO5SJnZKfAJuF8NwsXOIXXaUg
         CH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687847510; x=1690439510;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Si6Ds0vIKrIAT8qa+H99PovIF2KoNnQmkzHNG/XuQM=;
        b=JbkLUAAQaglfCER07UyVQF/nrTpfLFuWHcA6QBha2+z0xovwJk5Fgfrn5dY7xYPe5i
         Xc6XukF0zAwXh3VFQvruBFJlqoULs6KihmBZNudCT+CNKGanvk4cCHbvVktopnZBNCGt
         jLLo65osLjq/pLFyWRCrxsSeOCZkK6dMYQ9Y4x9xS74BgThdRpc07VdrCM9Q75g3Q7Pu
         TuQnknLhV1xW5UqmqmqR+MSBb1x0YXYpBK7cJFzCXqt1jrNuJ6ShUH1slsoG3BVfSsZi
         LAwMrg8DrHuN90b8zuuG3hJghuabgBo74WhbTLMMoUCXmnMekMa8j9FwNWsTmENJDjHq
         mI8A==
X-Gm-Message-State: AC+VfDxcywovEISJyYdCaoDb0GVG7P+/80FONNOAIvyRulsZv6xtt5w/
	Uvsdcsf23t9c4E/ww9+TyDHgqg==
X-Google-Smtp-Source: 
 ACHHUZ53P6WSxwvCC9/82qPryhwIdfcc93magNjJodg3igFyBNXpveK+rrY1ms23FTFs/2K5WkZXzg==
X-Received: by 2002:a5d:5307:0:b0:313:f60d:4958 with SMTP id
 e7-20020a5d5307000000b00313f60d4958mr2687932wrv.53.1687847510435;
        Mon, 26 Jun 2023 23:31:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 j9-20020a5d4649000000b0030aefa3a957sm9349967wrs.28.2023.06.26.23.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 23:31:49 -0700 (PDT)
Message-ID: <1ed60d4d-8e94-78b1-17ad-4305cadf867c@linaro.org>
Date: Tue, 27 Jun 2023 08:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] ASoC: dt-bindings: nau8821: Convert to dtschema
Content-Language: en-US
To: Seven Lee <wtli@nuvoton.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
 supercraig0719@gmail.com, dardar923@gmail.com
References: <20230626104619.1112588-1-wtli@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626104619.1112588-1-wtli@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BKYOV7F3ADG7LPPMXOLRZFMCWYNXJGRK
X-Message-ID-Hash: BKYOV7F3ADG7LPPMXOLRZFMCWYNXJGRK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKYOV7F3ADG7LPPMXOLRZFMCWYNXJGRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/06/2023 12:46, Seven Lee wrote:
> Convert the NAU8821 audio CODEC bindings to DT schema.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> +
> +  nuvoton,jkdet-pull-up:
> +    description: Pull-up JKDET pin. If set then JKDET pin is pull up,
> +      otherwise pull down.
> +    type: boolean
> +
> +  nuvoton,jkdet-polarity:
> +    description: JKDET pin polarity.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # active high
> +      - 1 # active low
> +    default: 1
> +
> +  nuvoton,micbias-voltage:
> +    description: MICBIAS output level select.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # VDDA
> +      - 1 # VDDA * 1
> +      - 2 # VDDA * 1.1
> +      - 3 # VDDA * 1.2
> +      - 4 # VDDA * 1.3
> +      - 5 # VDDA * 1.4
> +      - 6 # VDDA * 1.53
> +      - 7 # VDDA * 1.53
> +    default: 6
> +
> +  nuvoton,vref-impedance:
> +    description: VMID Tie-off impedance select.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # open(default)

Drop "(default)"

> +      - 1 # 25KOhms
> +      - 2 # 125KOhms
> +      - 3 # 2.5KOhms
> +    default: 2

You wrote that default is 0

> +
> +  nuvoton,jack-insert-debounce:
> +    description: number from 0 to 7 that sets debounce time to 2^(n+2)ms.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 7
> +    default: 7
> +
> +  nuvoton,jack-eject-debounce:
> +    description: number from 0 to 7 that sets debounce time to 2^(n+2)ms.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 7
> +    default: 0
> +
> +  nuvoton,dmic-clk-threshold:
> +    description: DMIC clock speed expected value. Unit is Hz.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 3072000
> +

You miss nuvoton,key_enable. If this is intentional, mention and shortly
explain deviations from pure conversion in the commit msg.

> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        codec@1b {
> +            #sound-dai-cells = <0>;
> +            compatible = "nuvoton,nau8821";
> +            reg = <0x1b>;

compatible is first property, reg is second. Therefore put
sound-dai-cells somewhere further.



Best regards,
Krzysztof


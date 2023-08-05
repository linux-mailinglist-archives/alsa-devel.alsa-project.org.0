Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C3577123D
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Aug 2023 23:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3B8C7F8;
	Sat,  5 Aug 2023 23:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3B8C7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691269391;
	bh=BDN1Ptniz7G435daZehPh95AGBf+welEO1gnCKuU8cE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CQ85W16fQF0LFtnEsdHaf+tF4XG88Vv4ZP8JN8WU0xaG1cVPTIJUYvrz8Uzg3qjEF
	 s7oTyNGNUDZ9cik/bmbhqF0bzGY736VtDqaXlocPQ+xMRR5EfrdvrAy99wDkVj0W2V
	 FvKAwDP5VeJvUJ19Iup1/JQVU58ORdxK/3fSKEXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00E9AF8053B; Sat,  5 Aug 2023 23:02:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93DB4F801D5;
	Sat,  5 Aug 2023 23:02:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7696FF8025A; Sat,  5 Aug 2023 23:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4279F80087
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 23:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4279F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LOtzuv3S
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe2048c910so28755175e9.1
        for <alsa-devel@alsa-project.org>;
 Sat, 05 Aug 2023 14:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691269325; x=1691874125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbvfI0fLsFlB/xRYqDFhF1GRIPCNZdIym6zPJmUh4vQ=;
        b=LOtzuv3SuN0B4PkixubrxbsOeLlUbqyMJc3yJCvIpzuydQG9bdGn7jY3D32/rIXdmt
         ztkBsdLiqkz6W5SZfAf6c3heNK87LTPVi9E/tMyaO+iEPYSYOblRVDac0jDsxpvTo4WG
         URfWY0b/QgIIIEyMzFXV763mY5KgOfmRLIdkn444n2dZGt0IklB3OpeyHjNV719v4szo
         IWNIDTd9PW6+fymfIIBrF+FM3IZ0UtvivblDOSX28RvlBhzVokwT/lf+ME+lb/2fYpRr
         fe7iG1zrIdUm2uCIvFXA8yjqAuifuZ0I0gJddzRZUOiSeWS4snSu3QmyWI4nzwG3KHsV
         RGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691269325; x=1691874125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbvfI0fLsFlB/xRYqDFhF1GRIPCNZdIym6zPJmUh4vQ=;
        b=R0d0JGX7KjSyo2W6rtnCPQpThoEoSWL12+//r3uK4tVzWZ4dYcNIZ9FhZ8426+Jefv
         ZdBjAXu+G9OUFzPw8GveBriiM8/F19t2Iuet/l6qlaqiO4tsniIzofiYK7TtF4dQ1i01
         5tY5zBhL/b6h2khEn3Hwm52D/818idvuPpbdWq/41Gz6PtxVuGmHQ/sQxDuB27/4gBrS
         hAdxi54d4o/zXPbGrzIJyVkcVDB/nUGJia0d0zR+SYTOIHXBBVFjXcv95vOPCfSfEW/G
         Yen9icpl/wCWhHDvMOVHdIzM6nk6to4NT1Hit7jAMpByuejj6nyaUR2a9p3QD3a2X69Z
         dOhw==
X-Gm-Message-State: AOJu0YzvqNnSKlsKVWFuQ/NQk1k3o/Dl+uoXzaO0E6sma0UiWllPnsQd
	6F0ER6t6QY9WsH5CoI8sUBJYnQ==
X-Google-Smtp-Source: 
 AGHT+IE63dFNf2CGjHbciT/HZuHu+h2YzjvFPIM0aIWKNMwJ2fvnAGhmQ7btvX284ZjXv1M6dmsSQQ==
X-Received: by 2002:a05:600c:364f:b0:3fe:4900:db95 with SMTP id
 y15-20020a05600c364f00b003fe4900db95mr3609592wmq.37.1691269325144;
        Sat, 05 Aug 2023 14:02:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id
 z10-20020a5d640a000000b003178dc2371bsm5503421wru.7.2023.08.05.14.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 14:02:04 -0700 (PDT)
Message-ID: <37a636dd-fbd8-d475-8814-e0cc6d5cc812@linaro.org>
Date: Sat, 5 Aug 2023 23:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: snps,designware-i2s: Add
 StarFive JH7110 SoC support
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-3-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230802084301.134122-3-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VAWLHRJUCOLMNTOILOFIMCZASQYDJKHG
X-Message-ID-Hash: VAWLHRJUCOLMNTOILOFIMCZASQYDJKHG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAWLHRJUCOLMNTOILOFIMCZASQYDJKHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02/08/2023 10:42, Xingyu Wu wrote:
> Add the StarFive JH7110 (TX0/TX1/RX channel) SoC support in the bindings
> of Designware I2S controller. The I2S controller needs two reset items''

Thank you for your patch. There is something to discuss/improve.

>  
>    resets:
>      items:
>        - description: Optional controller resets
> +      - description: controller reset of Sampling rate
> +    minItems: 1
>  
>    dmas:
>      items:
> @@ -51,6 +75,17 @@ properties:
>        - const: rx
>      minItems: 1
>  
> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to System Register Controller sys_syscon node.
> +          - description: I2S-rx enabled control offset of SYS_SYSCONSAIF__SYSCFG register.
> +          - description: I2S-rx enabled control mask
> +    description:
> +      The phandle to System Register Controller syscon node and the I2S-rx(ADC)
> +      enabled control offset and mask of SYS_SYSCONSAIF__SYSCFG register.
> +
>  allOf:
>    - $ref: dai-common.yaml#
>    - if:
> @@ -66,6 +101,66 @@ allOf:
>        properties:
>          "#sound-dai-cells":
>            const: 0

You need to constrain clocks and resets also for all other existing
variants.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: snps,designware-i2s
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +        resets:
> +          maxItems: 1
> +    else:
> +      properties:
> +        resets:
> +          minItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-i2stx0
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5

Also maxItems

> +        clock-names:
> +          minItems: 5

Also maxItems

What about resets? 1 or 2 items?

> +      required:
> +        - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-i2stx1
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 9
> +        clock-names:
> +          minItems: 9

resets?

> +      required:
> +        - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-i2srx
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 9
> +        clock-names:
> +          minItems: 9

resets?

> +      required:
> +        - resets
> +        - starfive,syscon
> +    else:
> +      properties:
> +        starfive,syscon: false
>  
>  required:
>    - compatible

Best regards,
Krzysztof


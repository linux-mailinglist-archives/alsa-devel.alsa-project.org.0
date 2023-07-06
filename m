Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC4E74959E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 08:30:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CBA8820;
	Thu,  6 Jul 2023 08:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CBA8820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688625008;
	bh=wOE75sK9tJRanjk5pn4QGQYXikK1OCP8T02rPOqUz+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kr/mR7iJ3T0BwEHt77W9S6YWTWKj49VbXYen5moAb+r6u90V9MwmCdr4P55yFkc87
	 EbbwbB3UPz51dSv23UDcVPgLpCkg8G95pXYX4NWyL7i50Hp6A/TVt8Ma/ThO6u6W/k
	 X39mWLoeuO/s0RfB7oI+nzmZ8ahyBAoTaHzvpYPE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 188BAF80535; Thu,  6 Jul 2023 08:28:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CE8F80124;
	Thu,  6 Jul 2023 08:28:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B412F80125; Thu,  6 Jul 2023 08:28:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9A21F80100
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 08:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A21F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IMm0i5vs
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98e011f45ffso30961866b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 23:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688624910; x=1691216910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pqu4vTxoeW2yTwRCEetSQZvh47NKMtjn0RrXMB1JAGg=;
        b=IMm0i5vst50fxhAZuaHOTFSeWrHCZJmzOQXq5fOhXu+9uQCvIB9O7TT34TXrIdSe3Y
         cnP9xeFqhrL8cIlCb42uuzkarigw/qjWBTcPQ3/VxZUa8JeYXFP/AQgK0HryW/h65huJ
         DqaJOkv9C4Y9VEbUxH/JiwjH8iwIGllme0bQTt1rJgive4qogrJHvgYlMGy/VN4PmUOO
         pHiwJtL+3nTeZfTEpyZLrLS4DN0XG8RwL6pGKp+Tw1PcFI0GQcD+cuqEMZGZwQu2N5va
         ODXvyEUV63nanS3AeixIksRLBwWHN2OvMN9Mk6q264SOOa6D5p8+HUXIKEAOjNXLyjhp
         rYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688624910; x=1691216910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pqu4vTxoeW2yTwRCEetSQZvh47NKMtjn0RrXMB1JAGg=;
        b=K41a72DdSItlJkJZUCvrMo4D65pFEwnQBVjOsq7wVb0c4zHCbrOc7sFPDGcb2cJolD
         1j4Pvrdp/j/601R1itE7VjW+GqZhxtALCUnD1QXgCYjEtEB7qHd84OywkQPNK8/WaeL/
         UmF0mwz7gKpvc3bDtH/CwcF9ricCTg3u6yGfb5iRL8EwMvLyTU4hUcf+e20gUWGiGTs+
         PzKid1BMy9f9F1b7nLMYu9vWcf1jWp8A1CeAXS2tzB11WSCQqfQ7b1WiRIx+dYsWRGmB
         XGBdd4uTa1hWbnSknTcOUqizCB1gQwWqy3IU7arVB5z8RcDUIky7Lu6B33RyHsfug74+
         yg5A==
X-Gm-Message-State: ABy/qLZp577qw79jNivlNnHI1zFASzDacC4xKIXVX5BYv0LmrF9M9bB5
	5m1CvYEEoz1GgGbponl5rno4xw==
X-Google-Smtp-Source: 
 APBJJlEu2RGF4uBuUPfkX4wlSxPa3Cu2L5C0YRWwOysyPz8/vFYVscoSMwhTBIDQpkpak+dxq034Sw==
X-Received: by 2002:a17:906:10cf:b0:991:8328:50e3 with SMTP id
 v15-20020a17090610cf00b00991832850e3mr696668ejv.9.1688624910680;
        Wed, 05 Jul 2023 23:28:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 lf20-20020a170906ae5400b009920e9a3a73sm372590ejb.115.2023.07.05.23.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 23:28:30 -0700 (PDT)
Message-ID: <e871ad32-dfa4-067d-4f2c-207ffd42aafd@linaro.org>
Date: Thu, 6 Jul 2023 08:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/10] dt-bindings: bus: add device tree bindings for
 RIFSC
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
 olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
 mchehab@kernel.org, fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
 ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
 richardcochran@gmail.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-3-gatien.chevallier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230705172759.1610753-3-gatien.chevallier@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KRILIKRKMLRQMWKFJ2G4IGNPV4WL3IGK
X-Message-ID-Hash: KRILIKRKMLRQMWKFJ2G4IGNPV4WL3IGK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRILIKRKMLRQMWKFJ2G4IGNPV4WL3IGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/07/2023 19:27, Gatien Chevallier wrote:
> Document RIFSC (RIF security controller). RIFSC is a firewall controller
> composed of different kinds of hardware resources.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

A nit, subject: drop second/last, redundant "device tree bindings for".
The "dt-bindings" prefix is already stating that these are bindings. 4
words of your 6 word subject is meaningless...

> ---
>  .../bindings/bus/st,stm32-rifsc.yaml          | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml
> new file mode 100644
> index 000000000000..68d585ed369c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml

Filename like compatible, unless you know list of compatibles will
grow... but then add them.

> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32-rifsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Resource isolation framework security controller bindings

Drop bindings

> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description: |
> +  Resource isolation framework (RIF) is a comprehensive set of hardware blocks
> +  designed to enforce and manage isolation of STM32 hardware resources like
> +  memory and peripherals.
> +
> +  The RIFSC (RIF security controller) is composed of three sets of registers,
> +  each managing a specific set of hardware resources:
> +    - RISC registers associated with RISUP logic (resource isolation device unit
> +      for peripherals), assign all non-RIF aware peripherals to zero, one or
> +      any security domains (secure, privilege, compartment).
> +    - RIMC registers: associated with RIMU logic (resource isolation master
> +      unit), assign all non RIF-aware bus master to one security domain by
> +      setting secure, privileged and compartment information on the system bus.
> +      Alternatively, the RISUP logic controlling the device port access to a
> +      peripheral can assign target bus attributes to this peripheral master port
> +      (supported attribute: CID).
> +    - RISC registers associated with RISAL logic (resource isolation device unit
> +      for address space - Lite version), assign address space subregions to one
> +      security domains (secure, privilege, compartment).
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-rifsc
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  "#feature-domain-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  feature-domain-controller: true
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Peripherals
> +    type: object
> +    properties:
> +      feature-domains:
> +        minItems: 1
> +        maxItems: 2
> +        description:
> +          The first argument must always be a phandle that references to the
> +          firewall controller of the peripheral. The second can contain the
> +          platform specific firewall ID of the peripheral.

It does not make much sense to me to have hierarchy parent-child and via
phandle at the same time. You express the similar relationship twice.

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - feature-domain-controller
> +  - "#feature-domain-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // In this example, the usart2 device refers to rifsc as its domain
> +    // controller.
> +    // Access rights are verified before creating devices.
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    rifsc: rifsc-bus@42080000 {
> +        compatible = "st,stm32mp25-rifsc";
> +        reg = <0x42080000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        feature-domain-controller;
> +        #feature-domain-cells = <1>;
> +
> +        usart2: serial@400e0000 {
> +            compatible = "st,stm32h7-uart";
> +            reg = <0x400e0000 0x400>;
> +            interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&ck_flexgen_08>;
> +            feature-domains = <&rifsc 32>;
> +            status = "disabled";

No status in the examples.

> +        };
> +    };

Best regards,
Krzysztof


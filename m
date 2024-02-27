Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466B18691CA
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 14:29:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E489D82C;
	Tue, 27 Feb 2024 14:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E489D82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709040575;
	bh=o2MMtZcg1nPCrRMjPopfyLkNADiPf6kDlW84jMrpkvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MDSY7WlMbyyOSFdlnsrG3zTkOp+URZtr/F6c+TmDyinfDO6PymT34kIXx2BARdqT7
	 WTz9nk2DQ4m+ojiCe58+Tij+jWNIvsZNwCLgufhLjDWORiiqC/Eo4xqkhkY5DZFvgU
	 DGVS0nVXsmYYCsWQzLczjb9fPPaqZGGLygLRNgUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9E8EF805AC; Tue, 27 Feb 2024 14:29:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D776AF805A0;
	Tue, 27 Feb 2024 14:29:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46EBDF801C0; Tue, 27 Feb 2024 14:28:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07B7BF80087
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 14:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07B7BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NrsHlP09
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so653930566b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 05:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709040516; x=1709645316;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEHlAA7YKh1er5ipxQxY0qStrUJA7nuiDKK6J0iKTnQ=;
        b=NrsHlP09STABP8IrrbUFh1GTJMC8YWrU9H8/EesM/Xo7UToLmEZm9I9JBoIN6eSSjC
         U4+x7Ds4+d3NrUU347kQz+ENTG56fJZmWFYXFfbi5xr28I8sfZKkNiZmbb4ywxFGjTM3
         CaZ9ur2+a4zRxsFExPR+8FIOPur7PjGGS3xx2AUvVvgYoZRzboqpCJWl8+Fnw2SH3ROY
         WJsTnUiMpkk2sxYZK5tq8K428PDT8pdmm5XbWA76KQuPGHh8DiM1AaPv4TdJhs5PMY2l
         vXvUQRC7JZgb6pzGlqDRqRqnV4qUeZt9b24tf1q+1BZ1UKO3VyUW7wx2687KNQZJaml8
         N/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709040516; x=1709645316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEHlAA7YKh1er5ipxQxY0qStrUJA7nuiDKK6J0iKTnQ=;
        b=U4+br/F2UgP0yDLcZEm9jjt1L2ATczxPhij04KlxxyG5knFvNokUIao92I3qPDMiZ+
         6SC4lLtNmOlobiKcu+PJatCYKiqBOAO5+Oyfs0SjHP7/P8Nh7qiisP58U033kqB5P8xd
         bYYGTIL5PCBNY1zVfhDD/sNXIvvZjzF6t+O8fFWYdB5acJNjn9ZaxRPlBb0lg3o6cx6u
         t787NHtJhKHPfZCaO70FR2CdtOCIgMwLyS0L3esQDqx2BBazdPXyec2BCunhyX8ibETP
         8r8h+RKXm0WlH5VbyhWaEhV+BOrECCxjkHwFvsWz3u9rFCKFd2XO/ceCDwG2cB30Q8Fd
         4pJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpvaJO1W4H7EOmaoyo8spNV+p1C3gPmZVKSto4j4JiGvDFAM7brO0ztYz1WmRQ6OVgjl1a4LLhiJESJivdk0eCdSB3+E1F6YcOVOA=
X-Gm-Message-State: AOJu0YxTt5OUu0Bjc79jCIgNBB6QK8TvPzV32ZVMKGTeLPMSjQmZ6Kmq
	0orvJvZ0SAyvsYM8f7qVDTJYcUpwhqz5yWe8YFfg9lJcEcUaA0I99JyRTKn+d9c=
X-Google-Smtp-Source: 
 AGHT+IEQSaUkvKdywYgvDY1uVyrYp7GK0Y3ZU+MxIq70rL2kRL46wtA1NilCuTEjvTxI0baN6YTPWg==
X-Received: by 2002:a17:906:750:b0:a3f:7fac:6cd2 with SMTP id
 z16-20020a170906075000b00a3f7fac6cd2mr7064248ejb.43.1709040516287;
        Tue, 27 Feb 2024 05:28:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id
 n3-20020a170906118300b00a412d3d506esm784393eja.17.2024.02.27.05.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 05:28:35 -0800 (PST)
Message-ID: <d611eccd-58be-43a9-aca7-81fda4114cbc@linaro.org>
Date: Tue, 27 Feb 2024 14:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Convert the Imagination Technologies SPDIF Input
 Controllerto DT schema.
Content-Language: en-US
To: =?UTF-8?Q?Javier_Garc=C3=ADa?= <javier.garcia.ta@udima.es>
Cc: daniel.baluta@nxp.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240227123602.258190-1-javier.garcia.ta@udima.es>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240227123602.258190-1-javier.garcia.ta@udima.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CXII23M5ZSYUEBLDI7CV5Q3353STOOLY
X-Message-ID-Hash: CXII23M5ZSYUEBLDI7CV5Q3353STOOLY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXII23M5ZSYUEBLDI7CV5Q3353STOOLY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/02/2024 13:35, Javier García wrote:
> Convert the Imagination Technologies SPDIF Input Controllerto DT schema.
> 
> Signed-off-by: Javier García <javier.garcia.ta@udima.es>
> ---
>  .../bindings/sound/img,spdif-in.txt           | 41 ----------
>  .../bindings/sound/img,spdif-in.yaml          | 80 +++++++++++++++++++

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

Also no need for full stop in subject.

>  2 files changed, 80 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/img,spdif-in.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/img,spdif-in.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/img,spdif-in.txt b/Documentation/devicetree/bindings/sound/img,spdif-in.txt
> deleted file mode 100644
> index f7ea8c87bf34..000000000000
> --- a/Documentation/devicetree/bindings/sound/img,spdif-in.txt
> +++ /dev/null
> @@ -1,41 +0,0 @@

...

> diff --git a/Documentation/devicetree/bindings/sound/img,spdif-in.yaml b/Documentation/devicetree/bindings/sound/img,spdif-in.yaml
> new file mode 100644
> index 000000000000..d201293d63c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/img,spdif-in.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/img,spdif-in.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination Technologies SPDIF Input Controller
> +
> +maintainers:
> +  - Rob Herring <robh+dt@kernel.org>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

No, unfortunately this cannot be us. Choose someone responsible for
hardware or Linux drivers at least.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - img,spdif-in
> +
> +  reg:
> +    description:
> +      Offset and length of the register set for the device.

Drop description

> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +
> +  clocks:
> +    items:
> +      - description: The system clock
> +
> +  clock-names:
> +    items:
> +      - const: sys
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  resets:
> +    items:
> +      - description: Should contain a phandle to the spdif in reset signal, if any

Drop description, it's useless. You don't say anything valuable here.
Just maxItems: 1


> +
> +  reset-names:
> +    items:
> +      - const: rst
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +  - clocks
> +  - clock-names
> +  - '#sound-dai-cells'
> +
> +unevaluatedProperties: false

This alone does not make sense... so it is pointing you to missing $ref
for dai-common.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/pistachio-clk.h>
> +    #include <dt-bindings/gpio/gpio.h>

What for?

> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/reset/pistachio-resets.h>

That's not used, so just add resets and reset-names.

> +    spdif_in: spdif-in@18100e00 {
> +        compatible = "img,spdif-in";
> +        reg = <0x18100E00 0x100>;

Lowercase hex

> +        interrupts = <GIC_SHARED 20 IRQ_TYPE_LEVEL_HIGH>;
> +        dmas = <&mdc 15 0xffffffff 0>;
> +        dma-names = "rx";
> +        clocks = <&cr_periph SYS_CLK_SPDIF_IN>;
> +        clock-names = "sys";
> +
> +        #sound-dai-cells = <0>;
> +    };

Best regards,
Krzysztof


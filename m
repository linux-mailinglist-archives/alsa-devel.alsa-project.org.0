Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A676FEF87
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 11:59:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927A01EF;
	Thu, 11 May 2023 11:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927A01EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683799162;
	bh=DnQTCihVcDEVYe5iX3n7EJa2y10Yf0J+BhpJy+8y8lM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=stK+l1gbVhBSt++xMq4mzy21Fm0xaQrjKEF/JXbTopprOq9aWW077wG+J4Z1Re2AS
	 1YCbTEvJR3TOXTBTgF4g5UwFLRdYTD1MTSYByYQnKj/WlyIbIZxSX9kfZBYJIId8VV
	 QjMROrp8ioWleVJqL5v4QQesvUFKYM5qfaFHa3gI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B81EF80310;
	Thu, 11 May 2023 11:58:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 136E7F8032D; Thu, 11 May 2023 11:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30C98F800BF
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 11:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C98F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wLUiy/sK
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-96649b412easo865193266b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683799102; x=1686391102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flwRxznwuAYel95+sMOhYZaxHDjgAMi12wSldhudZkk=;
        b=wLUiy/sKdDyW2vYY1KUBQMZM2bNv7qMq5opS7jaQ39UXL7gYULX908NBz3Hssa3xZF
         6ct6KCJ6yomPIW6+oJhk6JvsHZAn2zKNPXHjFdtu8+CCyymdKdpgyrUSRfzbJgAasTn/
         aIhMxdO8fCEFyFg0SIfZBeeZ9iJ6NebnfRppUNhE/E1zek0CZyLBKyMbfQRRHhiwBkgr
         +LtRfn6rUetGYiJR6QOvyVd+qHMhJhpHuLDPj7qOb/WB55KEDAWK0+s7AeuxNTuk04GU
         b6Mxk58Z4nld3bpw4UYSjjQ1fzllwXfmroMbUxtaVfAmD6N87EvB89E4/RON0D6UyKrz
         /3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683799102; x=1686391102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flwRxznwuAYel95+sMOhYZaxHDjgAMi12wSldhudZkk=;
        b=dXsl+5MWNrKKbLmWGk0Ou2j57PqIDkXdFNOeQK1+Y45fWXsdOOx5FOXt5PtcODnySO
         YM6BAiW1b4kGiwJga9mfAnSa8DGYyE0pYA7CPVBcacAcCBK4ljHrTW3IU2KkJCqD0Saq
         0z+ofOx0J6WQO0EEN26fSgzdeMjeNSC3UiqexFjC2ooUiJO8ybmSmOwriXpo42L2jaXO
         l/iROMYRXZdxvCEQn7cPucMPrzltY/p8zaUtHBbJY7HtSE7XxbnC2hF3rS6IdBYI8ICQ
         Csr0AGD4ipTcUZT5mm/n6UW7CuxoCzr0mRAYSb6YzsRbxYl9K/Oh4/8O0nS2ClEU40GI
         8pSQ==
X-Gm-Message-State: AC+VfDxYYh1sX6jUbDp+Mz3ld25OURk0semVMI9FO1zNrd54zqV5UBDK
	zKn/UbP5rjrM2wuNe/PGowxY8A==
X-Google-Smtp-Source: 
 ACHHUZ5wJWqqCfcn013dbmOg6eTV075b5HIvRHopoYyZNADruM2+gIsxKZuktXAltFCkeuOiblIu8Q==
X-Received: by 2002:a17:907:6eaa:b0:94a:9ae2:1642 with SMTP id
 sh42-20020a1709076eaa00b0094a9ae21642mr21040424ejc.46.1683799102132;
        Thu, 11 May 2023 02:58:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e?
 ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id
 13-20020a170906300d00b009659cdb2f98sm3739111ejz.23.2023.05.11.02.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:58:21 -0700 (PDT)
Message-ID: <7b3a37e8-0210-c539-5b5b-bf8e587707ea@linaro.org>
Date: Thu, 11 May 2023 11:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 3/3] dt-bindings: ASoC: Add ESS ES9218P codec bindings
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
 <20230510112349.939991-3-aidanmacdonald.0x0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510112349.939991-3-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RTVBEK6E5BSKLFLBDCPQFZVU2K65AZQS
X-Message-ID-Hash: RTVBEK6E5BSKLFLBDCPQFZVU2K65AZQS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTVBEK6E5BSKLFLBDCPQFZVU2K65AZQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 13:23, Aidan MacDonald wrote:
> Device tree bindings for the ESS ES9218P codec, which uses an
> I2C control interface.
> 

Thank you for your patch. There is something to discuss/improve.

Subject: reverse dt-bindings and ASoC.

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  .../bindings/sound/ess,es9218p.yaml           | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ess,es9218p.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ess,es9218p.yaml b/Documentation/devicetree/bindings/sound/ess,es9218p.yaml
> new file mode 100644
> index 000000000000..d205b6a8bbb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ess,es9218p.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ess,es9218p.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ESS ES9218P audio codec
> +
> +maintainers:
> +  - Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> +

allOf with ref to dai-common.

> +properties:
> +  compatible:
> +    const: ess,es9218p
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used for digital core power supply.

Drop "Definition of the regulator used for"

> +
> +  vcca-supply:
> +    description:
> +      Definition of the regulator used for oscillator and DAC power supply.
> +

Ditto

> +  avcc3v3-supply:
> +    description:
> +      Definition of the 3.3V regulator for amplifier, switch, and charge pumps.

Drop "Definition of"


> +
> +  avcc1v8-supply:
> +    description:
> +      Definition of the 1.8V regulator for amplifier, switch, and charge pumps.

Ditto

> +
> +  clocks:
> +    items:
> +      - description: clock for master clock (MCLK)
> +
> +  clock-names:
> +    items:
> +      - const: mclk

Drop entire names, not really useful.

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Pin used for codec hardware reset, corresponds to the RESETB pin.
> +
> +  ess,max-clock-div:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Sets the maximum MCLK divider for generating the internal CLK.
> +      CLK must be at least 20x the I2C bus speed or I2C transactions
> +      will fail. The maximum divider should be chosen to ensure that
> +      CLK will not fall below the limit.
> +    enum:
> +      - 1
> +      - 2
> +      - 4
> +      - 8
> +    default: 1

Why do you need to customize it per board?

> +
> +  ess,oscillator-pad-bias:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Sets the oscillator pad drive bias. 0 - full bias, 15 - disabled.
> +    minimum: 0
> +    maximum: 15
> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +  - avdd-supply
> +  - vcca-supply
> +  - avcc3v3-supply
> +  - avcc1v8-supply
> +  - clocks
> +  - clock-names
> +  - reset-gpios
> +
> +additionalProperties: false

Instead: unevaluatedProperties: false


> +
> +examples:

Best regards,
Krzysztof


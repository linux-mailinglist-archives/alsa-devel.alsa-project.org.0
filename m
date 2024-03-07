Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C07387492D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 09:00:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2401844;
	Thu,  7 Mar 2024 09:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2401844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709798424;
	bh=oJYwvebPSxy6YxXO/DvKCCgPQHIT9wOAIrN7jlew0mM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gmU/78T6gYZVWo15s+CBgf3irTCBqnjeIYGgWqmC9eqavHrI+CZxvJGcIL0/CQjsq
	 dELYl5y3saHmjRpBls4g0J0Enbx/rz96N3JNRHQTWjzbq3y5VaLm3zODBqdI1J1Lwz
	 SpoS/aiRx4JYKN6m5sCV20eefnfH9YnKSxJkwMek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE203F80571; Thu,  7 Mar 2024 08:59:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE3CFF805A8;
	Thu,  7 Mar 2024 08:59:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDC1AF8024E; Thu,  7 Mar 2024 08:59:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E507F80088
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 08:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E507F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qZvPiSxl
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a45c006ab82so76575066b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Mar 2024 23:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709798374; x=1710403174;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msrSbyxYEEwE738VHVTMGn05YADYFgEKkR5Gx/mGJkQ=;
        b=qZvPiSxlFRl0KiAHsUZ70fQ+cuLsGl2S5HeV5Yoi36gWFqiSk5nDCqZghKQWdNojMo
         P0w9aJ33gFVTN0WiiLuwZsIc2TaowzVmo9bLucKlXEjVr7isEBjHR2ZnKlbVCIR0NVcc
         Gtt7PDCNFNe8OuCK7F9HFAVGiL0OxXtQxGxRJyd2Lb8SZxMunbSnbxyvLUZs0OuTZobS
         F74+7OqfY5jltcThZbkymGUJ2yMCY+qgIRBF5TEHCVhWjLY7vJ1VIqSOto6K+XptfQDS
         xt7/1DNzFNLYQecn2+9rG9FbTv3jYn7evq1RlDd6aNWqybXXUpZ778nEf2VvjM6slXl+
         wpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709798374; x=1710403174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msrSbyxYEEwE738VHVTMGn05YADYFgEKkR5Gx/mGJkQ=;
        b=IvX8dgfOOnzGINYXwzU3x5X9eo240gnvflH4hKCdQPsnty0UBia3NwAvr5/RLeblti
         5FPMr1XhbBbtxRWA7NLPmYaYH1UDAHp8bBJa0v2j5W9C3yPqRjf9Jlq46iM0kj3QuwjZ
         5fjb6VSO3Tv1nvIrK4zYFeg+Ofzsw0TR6C7H6+TQahPWiUcjyMtaED0C28svqFHdmJBw
         bb1ZC4HGEZjiEywikI43B7kauPj3Xi1UZ/v2vM2O9ghgXqey7XVXP7TegRyxu7HEOkqL
         wTGkgdRwmmTLFrKVugdcrMP03bL20/r3OjTbaMet9PxDK1iO88fmVrOSYyuPKB80fMZt
         B2Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO7WMc3M7RagVSPViFbTRXlFnVtep4UObMre1IZ9vkwm/8L7GxKzWCNLZWX1GLyzwZ49GcUZHpNmWQY5+ufWA19GMKPG05ntlbKqQ=
X-Gm-Message-State: AOJu0Yz7kgcGY5g+7zbqFk5W8nb2PtLpKYxweWMRVAuNQ6G574dEaaGO
	yYNpDZLd8kpSGrO6vvctC0FlJn2kLJOC8T81Ki3z4VTUUGZkl0DLMRMZpsMzQ/w=
X-Google-Smtp-Source: 
 AGHT+IHmAuMmL8+JDhVaYmwIN0yPYo2zccHsl0AqXOJzba3Y+FejC+8+XdTU05lulAfln4DYxlD4ww==
X-Received: by 2002:a17:906:a3cf:b0:a45:16af:bda1 with SMTP id
 ca15-20020a170906a3cf00b00a4516afbda1mr8310947ejb.12.1709798373914;
        Wed, 06 Mar 2024 23:59:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id
 j22-20020a170906475600b00a449d6184dasm6663851ejs.6.2024.03.06.23.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 23:59:33 -0800 (PST)
Message-ID: <0b92700a-cf79-4f1c-986a-d18fe0151bb8@linaro.org>
Date: Thu, 7 Mar 2024 08:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: ASoC: Add PDM controller for the
 StarFive JH8100 SoC
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
References: <20240307033708.139535-1-xingyu.wu@starfivetech.com>
 <20240307033708.139535-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240307033708.139535-2-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IO5B26YGSFHOOEPSOIZQIQEXX5I6AJKA
X-Message-ID-Hash: IO5B26YGSFHOOEPSOIZQIQEXX5I6AJKA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IO5B26YGSFHOOEPSOIZQIQEXX5I6AJKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/03/2024 04:37, Xingyu Wu wrote:
> Add bindings for the PDM controller for the StarFive JH8100 SoC.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../bindings/sound/starfive,jh8100-pdm.yaml   | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml b/Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml
> new file mode 100644
> index 000000000000..a91b47d39ad3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/starfive,jh8100-pdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH8100 PDM controller
> +
> +description: |
> +  The Pulse Density Modulation (PDM) controller is a digital PDM out
> +  microphone interface controller and decoder that supports both
> +  mono/stereo PDM format, and an Inter-IC Sound (I2S) transmitter that
> +  outputs standard stereo audio data to another device. The I2S transmitter
> +  can be configured to operate either a master or a slave (default mode).
> +  The PDM controller includes two PDM modules, each PDM module can drive
> +  one bitstream sampling clock and two bitstream coming data with sampling
> +  clock rising and falling edge.
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +  - Walker Chen <walker.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh8100-pdm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DMIC output clock
> +      - description: Main ICG clock
> +
> +  clock-names:
> +    items:
> +      - const: dmic
> +      - const: icg
> +
> +  resets:
> +    maxItems: 1
> +
> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to System Register Controller sys_syscon_ne node.
> +          - description: PDM source enabled control offset of SYS_SYSCON_NE register.
> +          - description: PDM source enabled control mask
> +    description:
> +      The phandle to System Register Controller syscon node and the PDM source
> +      from I2S enabled control offset and mask of SYS_SYSCON_NE register.
> +
> +  starfive,pdm-modulex:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description:
> +      The module x will be using in PDM controller. Default use module 0.

This is an index of the block instance? If so, then it's not allowed.
Otherwise I don't understand the description.

Anyway, don't repeat constraints in free form text. default: 0, if this
is going to stay.

> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - starfive,syscon
> +
> +unevaluatedProperties: false

This is wrong without $ref, which points you to missing $ref to dai-common.

> +
> +examples:
> +  - |
> +    pdm@12250000 {
> +      compatible = "starfive,jh8100-pdm";
> +      reg = <0x12250000 0x1000>;
> +      clocks = <&syscrg_ne 142>,
> +               <&syscrg_ne 171>;
> +      clock-names = "dmic", "icg";
> +      resets = <&syscrg_ne 44>;
> +      starfive,syscon = <&sys_syscon_ne 0xC 0xFF>;

Lowercase hex only.

> +      #sound-dai-cells = <0>;
> +    };

Best regards,
Krzysztof


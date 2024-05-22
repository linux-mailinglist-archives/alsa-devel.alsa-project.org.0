Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2852B8CBC1C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 09:33:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B5B8829;
	Wed, 22 May 2024 09:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B5B8829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716363207;
	bh=oFnQJmkxU6zrXZGMN96C8wGpspBAUkA02uGJ/ASV8ys=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KwUmYKSrDBwHQ1Nj/4k/Ry0kQLf6e6SUT92MMVpy0WgrVKvjIk1hspmozrsiw5hD2
	 qqCL5Yo5QjIp9bgPFWVztZehUbA1PtYqoEYBZhtBeSoRBuv8DCNbEyRwr3YdIR0Y9u
	 7DwfxpTCBcH5eUnuvuTnfV+XJT8VyewBjPIZgE5Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B53B1F805C4; Wed, 22 May 2024 09:32:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E081F805D2;
	Wed, 22 May 2024 09:32:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D403F8026A; Wed, 22 May 2024 09:30:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3C9EF80051
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 09:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C9EF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Z8jtbkbF
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e719bab882so42392771fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 22 May 2024 00:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716363024; x=1716967824;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tkJXObuZ8bzKgibWqMu1hFns0+SNQYqR2IAV8YRh+qw=;
        b=Z8jtbkbFq4aNEJphwt/GrAQd6NDtny3JF3m0Uhw4G24mMcvOKzuC3oyRVfaQIm+aFX
         Jnhj0uABSD60Zn1Iuii58UWqH/oO5VLxLu1IdqHon7R09npDYcP7XqoJaULJVqpPARhE
         wk/FqTpwPLjjBGVDvsGuVzDVbbKMrh2Tbp/8qzQL8TC32zpfb41c8PQIlUycwNcRYRr7
         ZlhrD7FUSQ18vlMC7d1TFh2/s3DpTL0+eNLCVKT3Gy7/R+IF8XbBLkxJvyo+hwIdXHMt
         LwRg+ih9xc1w1vGZ95W8cCEaEpmJ8AhGjffXe85cb31c4d2B1+0doXwYff/m1kzqPG2g
         5nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716363024; x=1716967824;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkJXObuZ8bzKgibWqMu1hFns0+SNQYqR2IAV8YRh+qw=;
        b=YRAY8/8uEktZk1F7hWsOqeAXVQBVXpv0uwaA/zOnzX9wPDwRJH15Wp+rHT9TPrw1AZ
         cve8PTRjWP/KueRFmXcvWwL1MHMdOOmJT1X9mte4OYQ2ZhkzeuCllQkN5sYYP02njpSQ
         zqHRYgmHojD8VwwsCzDiaBwyASiI8kUizlu9JMCSAwyGeMTtxx0uKWZ9vxiRTSUCGstA
         UHXMDD81HUQKgiVtml/puim9Z3wkij0hE+tw+/mhR5zoIAnaNPlpHkroaslzHVpKZl3u
         2Drree2mAjU0+knjlWh1dZgNckEPiAyV+jNM2hQhSEkbuxdnVJ4HK7ty9eshJ9Ji7LX1
         fQCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWN3b9DnUGmDGmP6vWJsSnTEkkUkvsP7nzDb3xS6DetH1khlvkH6+ydlvEvyCsmKk+rS5i87uI5A8Igf1Zoo7cPIvQTHqWo3drJFY=
X-Gm-Message-State: AOJu0Yy4TLFTLxKnrwVUSXaO1apRMPOCyjJns0AXjeO3dYH+7/Wj7h9n
	A07JkkbeJdzHxs+yO0iZGOKLe6M289h653iwhmhmdqM0/4QNV70q50zINY2Rg5M=
X-Google-Smtp-Source: 
 AGHT+IEReon7mu9xNEVqRMovOLZvHsE91aYxCpyK1LIlKQyVpM36zPsDzSEdKkDkYxk3XU1KDKKERg==
X-Received: by 2002:a2e:9858:0:b0:2e9:4c17:9c8e with SMTP id
 38308e7fff4ca-2e94c17a021mr3286451fa.44.1716363023678;
        Wed, 22 May 2024 00:30:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce25d5sm491678985e9.14.2024.05.22.00.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 00:30:23 -0700 (PDT)
Message-ID: <af72c0c1-144d-4f04-86ba-d85e5125d261@linaro.org>
Date: Wed, 22 May 2024 09:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: Add bindings for Cadence I2S-MC
 controller
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240508070406.286159-1-xingyu.wu@starfivetech.com>
 <20240508070406.286159-2-xingyu.wu@starfivetech.com>
 <0e7496c4-7dfc-404d-944c-a1869389722b@linaro.org>
Content-Language: en-US
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
In-Reply-To: <0e7496c4-7dfc-404d-944c-a1869389722b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WHIQE677FBCXCEI5T77PLUW6HU22GX5E
X-Message-ID-Hash: WHIQE677FBCXCEI5T77PLUW6HU22GX5E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHIQE677FBCXCEI5T77PLUW6HU22GX5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/05/2024 10:03, Krzysztof Kozlowski wrote:
> On 08/05/2024 09:04, Xingyu Wu wrote:
>> Add bindings for the Multi-Channel I2S controller of Cadence.
>>
>> The Multi-Channel I2S (I2S-MC) implements a function of the
>> 8-channel I2S bus interfasce. Each channel can become receiver
>> or transmitter. Four I2S instances are used on the StarFive
>> JH8100 SoC. One instance of them is limited to 2 channels, two
>> instance are limited to 4 channels, and the other one can use
>> most 8 channels. Add a unique property about
>> 'starfive,i2s-max-channels' to distinguish each instance.
>>
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> 
> 
>> +
>> +  starfive,i2s-max-channels:
>> +    description:
>> +      Number of I2S max stereo channels supported on the StarFive
>> +      JH8100 SoC.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [2, 4, 8]
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: starfive,jh8100-i2s
>> +    then:
>> +      required:
>> +        - starfive,i2s-max-channels
>> +    else:
>> +      properties:
>> +        starfive,i2s-max-channels: false
>> +
>> +required:
> 
> I asked to put it after properties: block, not after allOf:. See
> example-schema for preferred order. Why? Because we are used to it and
> it makes reading the schema easier for us.
> 
> Rest looks good, so with the re-order:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Since you do not plan to fix it and already started pinging mark, I
retract my review.

Unreviewed-by.

Implement the feedback I already asked you BEFORE.

Best regards,
Krzysztof


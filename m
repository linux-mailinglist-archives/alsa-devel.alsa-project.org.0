Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D45718363EE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 14:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA0729F6;
	Mon, 22 Jan 2024 14:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA0729F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705928640;
	bh=xmAzmwtsz1HRk80aYsft+aaG6rAVmlDuN9frR0Y4G4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hDYRWL/7TkDpQ4giQhEjMz5gugyV70dTB9ig5BZMeE0MTlhnHrK8ShxpUl6H7iSNo
	 B49w5uHvu1S03dJTKX/VixwPGtIT/fAjP2ot+Q3YdB/JwNXqmjbwR/knwG0VA6yLZq
	 f1UVe/CyrBQwycyfy0MdvDFpl4T2zdUG24x1og9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B95BF80580; Mon, 22 Jan 2024 14:03:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D607F802BE;
	Mon, 22 Jan 2024 14:03:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FD76F8022B; Mon, 22 Jan 2024 14:03:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2149F8020D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 14:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2149F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KaRHhRus
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e7065b692so34703585e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Jan 2024 05:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705928576; x=1706533376;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETHK121tTwhB53jLp6JK8rotxF5sZ3uZp3Qk/Z/yNDc=;
        b=KaRHhRus3V3kMcy9zmv/6/diEQF6hZ6eCCfOErWAXU01+3JHc//09hnygCQa3yP4jK
         zWHa+GoY4FJE8JBdM5gDYslP+UXtrHcEErYYmUWbiVewL++5YMFayyOTzy/ZOAS1TKcz
         EIgELq67AtBpXDddlEscNWbNcgPIZTR9my64XFA0ZYnxxmFb2X6FhAMkmxgU+rbSaJCU
         Iagm5A/AO9unFydIBbnM043SlUOLZNvRpsz1FbpJwcrdnX73nUiDv/sXyzwYum53vwQL
         qfXjjdwqQzI2qWSB5MWWTueJiM8dzCXtFtbyxA3PPcNqiUCkh89nf9kcIFJOs4EzzjR4
         i/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705928576; x=1706533376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ETHK121tTwhB53jLp6JK8rotxF5sZ3uZp3Qk/Z/yNDc=;
        b=KK51g9Y5XeY6kiXiz+yJp36WcdwHVRETdz4h1XKXJOs279wqk05NEYDU7y+XtmrUtY
         9TXihhPy1KtHcuGlbEhTGSriVx6sbPsyj/X/vhh2FMPNcsK9rseeaJyqBX2ayQSpy41F
         zvsUvK15Fz132Nt58ILhwY9Ci6A7YpI6glZKofc6Q+zShDKqjsTXSFhC4+mbsmLjOOME
         rh3z//jgsCJsg/a5qnql8TvJwKQF5ZpYsnXIkY9x9enEXprTh/a3Ou2YlZHWSWMtoSUh
         JoxG02b73SvA1CLPrAX8+hgAHnbeEAWheAMTw97EaeMS8WjjPjjrOFSu+M9EpZe5Ktdt
         YCNg==
X-Gm-Message-State: AOJu0Ywz8vnko1pPtUsiJAYXPWsQc5aOm+hHe+krbsCKJA5JseWR8buP
	drt257HvDp9beApshYFv6Lnz4VQQ0GYL0t46WWMxorMrx0W0utWBSfdPwI5Zw14=
X-Google-Smtp-Source: 
 AGHT+IHjhga5STJbV02oRXI/BNBMQmIKHn8X83W6HyeUu7gqwO1G1fKcH4rG2AkPIAz6O+Cp3CySmA==
X-Received: by 2002:a7b:c41a:0:b0:40e:83a0:63a0 with SMTP id
 k26-20020a7bc41a000000b0040e83a063a0mr2328940wmi.58.1705928576507;
        Mon, 22 Jan 2024 05:02:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 fl21-20020a05600c0b9500b0040e9d507424sm12698275wmb.5.2024.01.22.05.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 05:02:56 -0800 (PST)
Message-ID: <64f125e8-53c9-4a2d-9629-cb2011443d58@linaro.org>
Date: Mon, 22 Jan 2024 14:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
 <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
 <CAMRc=MdcCZP5kgv7JBdy2m_naNbTSeq4MDE_3mk+1-5UD4ntwQ@mail.gmail.com>
 <7f311659-9f49-44dc-ad40-977d34066d98@linaro.org>
 <289c4af00bcc46e83555dacbc76f56477126d645.camel@pengutronix.de>
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
In-Reply-To: <289c4af00bcc46e83555dacbc76f56477126d645.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 54NF3NJWDIW6DP3QZKHGARHRDD4LWF6C
X-Message-ID-Hash: 54NF3NJWDIW6DP3QZKHGARHRDD4LWF6C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54NF3NJWDIW6DP3QZKHGARHRDD4LWF6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/01/2024 18:32, Philipp Zabel wrote:
> On Mo, 2024-01-15 at 17:13 +0100, Krzysztof Kozlowski wrote:
>> On 15/01/2024 17:06, Bartosz Golaszewski wrote:
>>>> +
>>>> +static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
>>>> +                                        unsigned int gpio,
>>>> +                                        unsigned int of_flags)
>>>> +{
>>>> +       struct gpiod_lookup_table *lookup __free(kfree) = NULL;
>>>> +       struct gpio_device *gdev __free(gpio_device_put) = NULL;
>>>> +       char *label __free(kfree) = NULL;
>>>
>>> I got yelled at by Linus Torvalds personally for doing it like this. I
>>> know this is a common pattern in code using GLib but Linus wants auto
>>> variables to be initialized where they're declared...
>>
>> Declaration is here. Initialization is here. Therefore this is
>> initialized where it is declared. What's more it is initialized to a
>> valid value, because __free() accepts NULLs.
> [...]
>>> ... so this should become:
>>>
>>>   struct gpio_device *gdev __free(gpio_device_put) = gpio_device_find(...)
>>>
>>> and same for the rest.
>>>
>>> Don't get me wrong, I love cleanup.h but there's a (unofficial for
>>> now) coding style.
>>
>> So you just want to declare it not in top-part of the function but just
>> before first use?
> 
> IIUC, Linus wants exactly this:
> 
> https://lore.kernel.org/all/CAHk-=wgRHiV5VSxtfXA4S6aLUmcQYEuB67u3BJPJPtuESs1JyA@mail.gmail.com/

Sure.



Best regards,
Krzysztof


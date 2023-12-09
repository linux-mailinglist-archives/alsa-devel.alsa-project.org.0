Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F680B39B
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Dec 2023 11:31:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B98850;
	Sat,  9 Dec 2023 11:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B98850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702117873;
	bh=6UmzIhD80mN5BWjtAvhy49UD3zj8EJMiSV62wNYkSqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BFXpEYUvlSrNuVfX2lFZjnzNtoA6N8/0dCaNbmF0ARegRDjypvRwBUyCOqTUEl7OB
	 SXUmSrH+WNM7vh5bhHJiC4Q8T7wiope1us4K1n7gPtKzA6Bme3NBZF0rYEGh/ikDKW
	 gFcSZEuS2m3VQvbleiGkAwFuDAtIl1YKRkEuGrzg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26262F8057C; Sat,  9 Dec 2023 11:30:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 336EBF80570;
	Sat,  9 Dec 2023 11:30:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EABBBF8024E; Sat,  9 Dec 2023 11:30:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A70DFF800D2
	for <alsa-devel@alsa-project.org>; Sat,  9 Dec 2023 11:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A70DFF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oiZwZTdg
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a1da1017a09so344448866b.3
        for <alsa-devel@alsa-project.org>;
 Sat, 09 Dec 2023 02:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702117819; x=1702722619;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oWZg6IrutrQDb7GbSgL9Fp8aVBaQ53TwZCgYgj51t+w=;
        b=oiZwZTdgdPjH5PYysZDAO3/TRqsZeOEWyQabSYmS5qns2cKq1plLSUqdtoKRc5zOJp
         CrJj++8yGd+iRMI4F3JP5yz5j5dwG5oFIFZL6SKqlonqIy40cJkkFi/crfBLzYwXb2i0
         249J0bHSdc1PtIeB9D07E7FRy2qHgyjq+hoCez8Ofsz2uMaq8wJd2uIXqGyWF6yZrjJZ
         jZ7wTAFNYkEazve7lhPuQdLqN4lK7PZIj33+gNbromhxf+dwupkqCR9FkXt/Ilw+fgUb
         r2vQQejAHTxNOV1BhmdWfIi5mDRWBlI8K+WuI2Bt+YYOcd8ys3mVHuaQx6hbYtAfPLqM
         /4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702117819; x=1702722619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWZg6IrutrQDb7GbSgL9Fp8aVBaQ53TwZCgYgj51t+w=;
        b=XRFOpRnw56BtsPzBS3sVz5FYAf1LZ+bE1b3+l0JXLLBjuJQqdfHnipSMCcgvZM/MEX
         fgZKW5g1wOWPxpN52VwqCUHVASXEMtlhdAdaR2ndT4a8RCSiXIIg/58UOvkxix8u9KLR
         9pfO+E+mFwX+Y5czQZFDxvBq1VC7YziNcLc1UjDQZbPfnfDIF2Y1wa7M5CmZcbcORrRy
         mQUerjxa2swUNaZgO5STupR4iukl2HW45ITW85KPXoryQ4jKsHhzy+ddxSv3/LazDY5m
         9bqry9gp5lLRb3dWmlNFc0r5Hd6CjbkBwEgHugyLEFJn0afK+6YSuNEXX4ZjEqdHPrgP
         U74g==
X-Gm-Message-State: AOJu0Yz4iRBJwONAt+14IVfZMm+QjqO1ADYUWjX8Shmwsk7h9DQrDuQ3
	ar0cDujQs6RykxYkZPabQR5Dwg==
X-Google-Smtp-Source: 
 AGHT+IEVwRFh/FlBquOikUzOdtDd55jKrrWgfUEMHnoovXFHbML5K7qKkmbBUrzitWhuirwJ3vRDIw==
X-Received: by 2002:a17:907:6d29:b0:9e5:cef:6ff with SMTP id
 sa41-20020a1709076d2900b009e50cef06ffmr882883ejc.33.1702117819116;
        Sat, 09 Dec 2023 02:30:19 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id
 vs5-20020a170907a58500b00a0a8b2b74ddsm2062780ejc.154.2023.12.09.02.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 02:30:18 -0800 (PST)
Message-ID: <4229ab0a-e94d-48ea-8bdb-b82c38431ebe@linaro.org>
Date: Sat, 9 Dec 2023 11:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v1 3/3] ASoC: dt-bindings: Add tas2563 into
 yaml
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "13916275206@139.com" <13916275206@139.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
 "soyer@irl.hu" <soyer@irl.hu>, "tiwai@suse.de" <tiwai@suse.de>
References: <20231209080742.1290-1-shenghao-ding@ti.com>
 <20231209080742.1290-3-shenghao-ding@ti.com>
 <9dc6ff91-d28c-4e94-9ec7-f39aa1555bda@linaro.org>
 <5cbb8824b4d443e898b23c3d08b8a4ea@ti.com>
Content-Language: en-US
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
In-Reply-To: <5cbb8824b4d443e898b23c3d08b8a4ea@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LZV4UJD5WNWROBAYZ4HD4D7D4BISKU4R
X-Message-ID-Hash: LZV4UJD5WNWROBAYZ4HD4D7D4BISKU4R
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/12/2023 09:30, Ding, Shenghao wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Saturday, December 9, 2023 4:13 PM
>> To: Ding, Shenghao <shenghao-ding@ti.com>; broonie@kernel.org
>> Cc: robh+dt@kernel.org; andriy.shevchenko@linux.intel.com;
>> lgirdwood@gmail.com; perex@perex.cz; pierre-louis.bossart@linux.intel.com;
>> 13916275206@139.com; alsa-devel@alsa-project.org; linux-
>> kernel@vger.kernel.org; liam.r.girdwood@intel.com; soyer@irl.hu;
>> tiwai@suse.de
>> Subject: [EXTERNAL] Re: [PATCH v1 3/3] ASoC: dt-bindings: Add tas2563 into
>> yaml
>>
>> On 09/12/2023 09:07, Shenghao Ding wrote:
>>> Support tas2563.
>>>
>>> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
>>> ---
>>>  .../devicetree/bindings/sound/ti,tas2781.yaml   | 17 ++++++++++-------
>>>  1 file changed, 10 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
>>> b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
>>> index a69e6c223308..84e197e15df4 100644
>>> --- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
>>> @@ -11,11 +11,11 @@ maintainers:
>>>    - Shenghao Ding <shenghao-ding@ti.com>
>>>
>>>  description:
>>> -  The TAS2781 is a mono, digital input Class-D audio amplifier
>>> -  optimized for efficiently driving high peak power into small
>>> -  loudspeakers. An integrated on-chip DSP supports Texas Instruments
>>> -  Smart Amp speaker protection algorithm. The integrated speaker
>>> -  voltage and current sense provides for real time
>>> +  The TAS2781/TAS2563 is a mono, digital input Class-D audio
>>> + amplifier optimized for efficiently driving high peak power into
>>> + small loudspeakers. An integrated on-chip DSP supports Texas
>>> + Instruments Smart Amp speaker protection algorithm. The  integrated
>>> + speaker voltage and current sense provides for real time
>>>    monitoring of loudspeaker behavior.
>>>
>>>  allOf:
>>> @@ -25,16 +25,19 @@ properties:
>>>    compatible:
>>>      enum:
>>>        - ti,tas2781
>>> +      - ti,tas2563
>>
>> Looks like devices are compatible, so express it in the bindings with a fallback
>> and drop driver patches.
> Exactly. Do you mean combine the three patches into one patch?

No, driver changes should be dropped - I do not see their value.
Compatibility should be expressed in the bindings. Look at
example-schema (and hundreds of other bindings).

Best regards,
Krzysztof


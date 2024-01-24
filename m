Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA483A2DF
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 08:26:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C693884C;
	Wed, 24 Jan 2024 08:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C693884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706081173;
	bh=AIukQQBJ/4XCF8WoHZk5ydLR6nAbk7M0ObWxjTdjOes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U1grc00yWssLK89kkZMI8fyGhkeiJWwfY7dFQ9TJd+kFJEBHbo9ObNELF4cRDfhV4
	 nKBpk1Hrd/3FfJ759B4+Kv4n8boLALY7nM637ld1NLmSmSjlsH1Mog9XINla336ZRO
	 wz12OzJ81/FFOVDnwF5bYOxzGezcgsjMFPyp3Z+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE49FF8057D; Wed, 24 Jan 2024 08:25:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5260DF802E8;
	Wed, 24 Jan 2024 08:25:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF402F8028D; Wed, 24 Jan 2024 08:25:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 273CBF80149
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 08:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 273CBF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YF3R8zA+
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-559cef15db5so10858593a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 23:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706081120; x=1706685920;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8jrcqPgI/3vhSKgHemTJgRZzsqVydzJRui6v8D9poY=;
        b=YF3R8zA+FMRr8v/NmCS0nN9Ronhw5hgJHaCRByYY3NQLkGVIUOjowmh3Pcv0HB9tqs
         ceoQbmLQ0KchyGAAjJx6OoVOG7aiUBtrMFR4TzQGSieipukHnelciawvHrRDJ5FlhL3s
         zzDdG8fXmDSEHJW4PYHZegZxCuKaPqEt8U3FxL/P9TJ3mwrwYsj/8TijY6mZ2Ebg7pki
         1zbBA8Up3wW/tRCTlTO+ylSYEli+1UWo5WNb/Ca8I0Vw+hOBtLt7Q1jstmhetrtG0Pxz
         msk9oTIdS0/Plb03RhiBitfXrYcCkpdf0Oeiw+6mofmQAIn5k7Lyy/eDQNv27/JI8hs4
         3Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706081120; x=1706685920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8jrcqPgI/3vhSKgHemTJgRZzsqVydzJRui6v8D9poY=;
        b=IAohKX/0czf68E45tXBs96kV+i8zGPt/cyFAfUS4zGv/Isotm5dFexV70m5xDyb1nq
         XAgq3uim5RAQ15cDGsARm9ossTfzFPqXxroD9+L2iB9AUq8oeEA5wab336N43Xwvwb9d
         oEK6AKq3z+Lwt9+zFpCxIGzHY/rbUznZCDmgoLggSQqI1tG5Up1CZr3w7iE4z6BjQHX2
         FDOPZLJhcZhEAimsNXk/VursqbMIAqNbPJbSt7BcQGiytkvj5Nqy+AXK3gMUjh7gDORK
         fHEtEFISaT+SZ6r8cPyUiRE1sQFNWrNfQfkKqOYwlVojcXqE8R53Lw6oxNDcTVSPu82F
         sgHQ==
X-Gm-Message-State: AOJu0YwoXImiUd8qjUJMrbnoKqJSC/JxvJa9o1WSXlAM4g2x4xupVLIp
	k3nJhtSpUA+gDtkbLzZXOW2s9nYEt2M/0Mevmtbwx0CM9zEHtwYWCnQ8UKyt2AM=
X-Google-Smtp-Source: 
 AGHT+IF2w0IOR+JXC8jt+izTDTWD09ku7STu4bgoty/Dh+g0U34bBf+smbNWdjyx6BtSeavBr7MNzw==
X-Received: by 2002:a17:906:251b:b0:a30:dd59:858e with SMTP id
 i27-20020a170906251b00b00a30dd59858emr680795ejb.60.1706081119968;
        Tue, 23 Jan 2024 23:25:19 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 e4-20020a170906c00400b00a298adde5a1sm15092803ejz.189.2024.01.23.23.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 23:25:18 -0800 (PST)
Message-ID: <71290f34-f3e6-4190-af8a-5fea61faedda@linaro.org>
Date: Wed, 24 Jan 2024 08:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] reset: gpio: ASoC: shared GPIO resets
Content-Language: en-US
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
 <6c3e4b71-c92f-4f1e-8435-b5cfb7f47117@alliedtelesis.co.nz>
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
In-Reply-To: <6c3e4b71-c92f-4f1e-8435-b5cfb7f47117@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FJKLQNRGSLUVM7O3IYHGSTR3ROHIT4KS
X-Message-ID-Hash: FJKLQNRGSLUVM7O3IYHGSTR3ROHIT4KS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJKLQNRGSLUVM7O3IYHGSTR3ROHIT4KS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/01/2024 20:28, Chris Packham wrote:
> 
> On 24/01/24 03:13, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Patch #2 (cpufreq: do not open-code of_phandle_args_equal()) and patch #4
>> (reset: Instantiate reset GPIO controller for shared reset-gpios) depend on OF
>> change (patch #1).
>>
>> Changes in v4
>> =============
>> 1. New patches:
>>     of: add of_phandle_args_equal() helper
>>     cpufreq: do not open-code of_phandle_args_equal()
>>
>> 2. reset-gpio.c:
>>     - Drop unneeded comment (Bartosz), add Rb tag.
>>     - Do not assign of_node.
>>
>> 3. reset/core.c:
>>     - Implement most of Bartosz feedback (I responded to one which I did not
>>       implement) and comments from Philipp.
>>     - Expect either rcdev->of_args or rcdev->of_node.
>>     - Drop __reset_gpios_args_match() and use common helper (Philipp).
>>     - Move declarations of automatic-cleanup variables in
>>       __reset_add_reset_gpio_lookup() to place of use (Bartosz).
>>     - Separate gpio_device_get_label() and kstrdup() (Philipp).
>>     - Correct doc for __reset_add_reset_gpio_device(), rewrite few comments.
>>     - Drop unneeded "r" variable in __reset_find_rcdev() (Philipp).
>>     - Drop of_phandle_args initialization in __of_reset_control_get (Philipp).
>>     - Check if CONFIG_RESET_GPIO is enabled before trying to look up reset-gpios.
>>
>> 4. Drop Chris' patch: "i2c: muxes: pca954x: Allow sharing reset GPIO", because
>>     discussion is on going.
> 
> I actually think it would have been OK as-is with your latest change to 
> return NULL when CONFIG_RESET_GPIO is not enabled. But I'm happy to 
> submit it independently after this series lands. It'll give me a chance 
> to do a bit more testing.

Yeah, I wasn't sure if the concerns are really resolved. I think you can
send your patch separately because there is no clear dependency, so also
no clear benefits of me taking your patch into this patchset.

Best regards,
Krzysztof


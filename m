Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7320828467
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 12:00:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49CAE741;
	Tue,  9 Jan 2024 11:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49CAE741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704798007;
	bh=oPrL/swTURao4b/3U51eJWr1oXg5Alebgwm6BO6+mHw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eJdAAN+LEojiO7WqvfFtAR9i6Us+0OGsSd0IuWoiqyaSNooYg+PxxHbkya7QTZ9w3
	 Edhvq4+OIAfr1LBJ8SUrcsY5mzd6ZjhyKqWOvXL3swC/JQaBHGmLIOBUDrjLbhnS/J
	 Y3nvxhhTfJq0aoZCEkdjD87YpNu+UJkdlRtkvCZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF9DDF805A1; Tue,  9 Jan 2024 11:59:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3152BF80570;
	Tue,  9 Jan 2024 11:59:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D68F2F80254; Tue,  9 Jan 2024 11:59:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC75EF800F5
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 11:59:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC75EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rjKpfT2n
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so314192966b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Jan 2024 02:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704797957; x=1705402757;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZD8BJ+52q0rFPbMqYUgabHlbkDv0ZmsXi/Y7tv+U8k=;
        b=rjKpfT2nbjq3taCD2GPJYFGoVFmmMYTacYG6dYPsZMMwCnSykFuGEPBlliTfyL0J0E
         5vzSlXPne5iMq1I1GZN3V08EOVMk1F8KA4es41aInHc/X541gR+y0iB16wNRBJQep630
         4nnLdiuQs/Z22q5M4KE7Dp6qqYbhD6DyXFc7KGmrQ3wmobfvHq0lQn1Dzm6Te5rPfPeh
         ZlkSfF7rOcJPgICxcRBX9+0Bfek+dET70y54rTqryesiL8Xu79+zwCIZ1O3LakB14pvD
         EIw24OS8YzNPEJc9pKxVK38ooBfJj1Z5UUo2B2WeJrUXoMnRN6yodEnVoEJhYYXZnfen
         4Z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704797957; x=1705402757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZD8BJ+52q0rFPbMqYUgabHlbkDv0ZmsXi/Y7tv+U8k=;
        b=evLBC7GcMeobTK8/7tiWKzf/A4OQ0EdnzVViU0ofbj/8/WTgrEXXqWAK7iwt86jJeM
         ekF7n8GQ7KN9j31CYnK9ZsgBdBBkwsLPp7z/wlSwPFRkMnRWmHtj33GzP4RWhYA5p2PE
         xkRThlh8oQa1ULUZOBsOe7QO/FNp381Zrb8HsBKdkGVgaF0CKeJNcIh7CVnsBqvs2nxW
         eh04aCAlK+qpo+IQXOKAkDWScG1HmP2JxoNIU0gNQEBhJEo+/ubM08Hhs4AlMZNPgIs+
         s8GkmMMNQwZGZc5T5/eQ3V9i7nerVkO6HIslvItX0KPb9mWLm5DyrkT5/++or7+bv/F3
         1xfw==
X-Gm-Message-State: AOJu0YyQZg84TgVldMryRz4NQFVqsLiHWVgXulmhDv9B2czTRJYLoYqB
	pDBLqinJVP0uLK/ComDS7NpDIDZfVV4DPg==
X-Google-Smtp-Source: 
 AGHT+IF40VQgiNm/Z1dY8NEHP87/eGsau8gyTw659COl3gdXVt13AyTR3/nkwTC2UarJc5/rkeClNw==
X-Received: by 2002:a17:907:1b16:b0:a23:3b67:a14d with SMTP id
 mp22-20020a1709071b1600b00a233b67a14dmr267694ejc.189.1704797956975;
        Tue, 09 Jan 2024 02:59:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a170906344b00b00a26a061ae1esm908636ejb.97.2024.01.09.02.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 02:59:16 -0800 (PST)
Message-ID: <767645a7-835d-4ac8-ac70-a701cea6df30@linaro.org>
Date: Tue, 9 Jan 2024 11:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
 <20240105155918.279657-3-krzysztof.kozlowski@linaro.org>
 <c2abc08d1b442fdcba7c41e2e1cc1617516441b2.camel@pengutronix.de>
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
In-Reply-To: <c2abc08d1b442fdcba7c41e2e1cc1617516441b2.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KPI4OFF5VDKDSWIK7VYWOI3BXZYDW2TG
X-Message-ID-Hash: KPI4OFF5VDKDSWIK7VYWOI3BXZYDW2TG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPI4OFF5VDKDSWIK7VYWOI3BXZYDW2TG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/01/2024 13:17, Philipp Zabel wrote:
> On Fr, 2024-01-05 at 16:59 +0100, Krzysztof Kozlowski wrote:
>> Devices sharing a reset GPIO could use the reset framework for
>> coordinated handling of that shared GPIO line.  We have several cases of
>> such needs, at least for Devicetree-based platforms.
>>
>> If Devicetree-based device requests a reset line, which is missing but
>                                                     ^^^^^^^^^^^^^^^^
> Nitpick: the "resets" property is missing, not the reset line.
> 
> "If Devicetree-based device requests a reset line, but there only is a
>  reset-gpios property instead of a "resets" property, ..." maybe?

Ack

> 
>> there is a reset-gpios property, instantiate a new "reset-gpio" platform
>> device which will handle such reset line.  This allows seamless handling
>> of such shared reset-gpios without need of changing Devicetree binding [1].
>>
>> All newly registered "reset-gpio" platform devices will be stored on
>> their own list to avoid any duplicated devices.
> 
> That's not strictly true. The reset_gpio_device_list only contains the
> of_phandle_args for lookup.

Ack, I will re-phrase it.

> 
>> The key to find each of
>> such platform device is the entire Devicetree GPIO specifier: phandle to
>> GPIO controller, GPIO number and GPIO flags.  If two devices have
>> conflicting "reset-gpios" property, e.g. with different ACTIVE_xxx
>> flags, this would spawn two separate "reset-gpio" devices, where the
>> second would fail probing on busy GPIO reques
> 
> request.

Ack

> 
> Is that true? 

It should be true and my tests confirmed it.

The code below looks like overwrites of_phandle_args so
> that only one reset-gpio device is spawned for each gpio node.

The code will iterate over list of of_node and of_phandle_args and
compare them with __reset_gpios_args_match(). If all match: do not
create new platform device.

If they do not match, e.g. ACTIVE_LOW -> ACTIVE_HIGH, create new
platform device. This will be the second device for the same GPIO.
Probing of that device in reset-gpio driver will fail:

[   19.198775] reset-gpio reset-gpio.2.auto: error -EBUSY: Could not get
reset gpios

because GPIO is used by reset-gpio.1.auto already.

> 
>> Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1]
>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>> Cc: Sean Anderson <sean.anderson@seco.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/reset/core.c             | 176 ++++++++++++++++++++++++++++---
>>  include/linux/reset-controller.h |   4 +
>>  2 files changed, 167 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
>> index 4d5a78d3c085..ec9b3ff419cf 100644
>> --- a/drivers/reset/core.c
>> +++ b/drivers/reset/core.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/acpi.h>
>> +#include <linux/platform_device.h>
>>  #include <linux/reset.h>
>>  #include <linux/reset-controller.h>
>>  #include <linux/slab.h>
>> @@ -23,6 +24,10 @@ static LIST_HEAD(reset_controller_list);
>>  static DEFINE_MUTEX(reset_lookup_mutex);
>>  static LIST_HEAD(reset_lookup_list);
>>  
>> +/* Protects reset_gpio_device_list */
>> +static DEFINE_MUTEX(reset_gpio_device_mutex);
>> +static LIST_HEAD(reset_gpio_device_list);
> 
> I would call this reset_gpio_lookup_list or
> reset_gpio_phandle_args_list.

Ack

> 
>> +
>>  /**
>>   * struct reset_control - a reset control
>>   * @rcdev: a pointer to the reset controller device
>> @@ -63,6 +68,16 @@ struct reset_control_array {
>>  	struct reset_control *rstc[] __counted_by(num_rstcs);
>>  };
>>  
>> +/**
>> + * struct reset_gpio_device - ad-hoc created reset-gpio device
>> + * @of_args: phandle to the reset controller with all the args like GPIO number
>> + * @list: list entry for the reset_lookup_list
>> + */
>> +struct reset_gpio_device {
> 
> Similarly, I would call this reset_gpio_lookup or
> reset_gpio_phandle_args.

Ack

> 
>> +	struct of_phandle_args of_args;
>> +	struct list_head list;
>> +};
>> +
>>  static const char *rcdev_name(struct reset_controller_dev *rcdev)
>>  {
>>  	if (rcdev->dev)
>> @@ -813,13 +828,119 @@ static void __reset_control_put_internal(struct reset_control *rstc)
>>  	kref_put(&rstc->refcnt, __reset_control_release);
>>  }
>>  
>> +static bool __reset_gpios_args_match(const struct of_phandle_args *a1,
>> +				     const struct of_phandle_args *a2)
>> +{
>> +	unsigned int i;
>> +
>> +	if (!a2)
>> +		return false;
>> +
>> +	if (a1->args_count != a2->args_count)
>> +		return false;
>> +
>> +	for (i = 0; i < a1->args_count; i++)
>> +		if (a1->args[i] != a2->args[i])
>> +			break;
> 
> Just return false in the loop and simplify the following to return
> true.

Ack
> 
>> +
>> +	/* All args matched? */
>> +	if (i == a1->args_count)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +/*
>> + * @node:	node of the device requesting reset
>> + * @reset_args:	phandle to the reset controller with all the args like GPIO number
>> + */
>> +static int __reset_add_reset_gpio_device(struct device_node *node,
>> +					 struct of_phandle_args *args)
>> +{
>> +	struct reset_gpio_device *rgpio_dev;
>> +	struct platform_device *pdev;
>> +	int ret;
>> +
>> +	lockdep_assert_not_held(&reset_list_mutex);
>> +
>> +	mutex_lock(&reset_gpio_device_mutex);
>> +
>> +	list_for_each_entry(rgpio_dev, &reset_gpio_device_list, list) {
>> +		if (args->np == rgpio_dev->of_args.np) {
>> +			if (__reset_gpios_args_match(args,
>> +						     &rgpio_dev->of_args)) {
>> +				ret = 0;
>> +				goto out_unlock;
>> +			}
>> +		}
>> +	}
>> +
>> +	/* Not freed in normal path, persisent subsyst data */
>> +	rgpio_dev = kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
> 
> Since this is persistent, instead of letting the reset-gpio driver call
> of_parse_phandle_with_args() again, this could be passed in via
> platform data. Is there a reason not to do that instead?

We can pass it as read only platform data, but we cannot pass the
ownership. This is associated with registered platform device, not with
bound one device->driver.

Imagine case:
1. modprobe reset-gpio,
2. Driver is bound to the device,
3. unbind  (echo > unbind)
4. rmmod
5. goto 1

> 
>> +	if (!rgpio_dev) {
>> +		ret = -ENOMEM;
>> +		goto out_unlock;
>> +	}
>> +
>> +	rgpio_dev->of_args = *args;
>> +	pdev = platform_device_register_data(NULL, "reset-gpio",
>> +					     PLATFORM_DEVID_AUTO, &node,
>> +					     sizeof(node));
>> +	ret = PTR_ERR_OR_ZERO(pdev);
>> +	if (!ret)
>> +		list_add(&rgpio_dev->list, &reset_gpio_device_list);
>> +	else
>> +		kfree(rgpio_dev);
>> +
>> +out_unlock:
>> +	mutex_unlock(&reset_gpio_device_mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct reset_controller_dev *__reset_find_rcdev(struct of_phandle_args *args,
>> +						       bool gpio_fallback,
>> +						       const void *cookie)
> 
> Unused cookie.

Ack
> 
>> +{
>> +	struct reset_controller_dev *r, *rcdev;
>> +
>> +	lockdep_assert_held(&reset_list_mutex);
>> +
>> +	rcdev = NULL;
>> +	list_for_each_entry(r, &reset_controller_list, list) {
>> +		if (args->np == r->of_node) {
>> +			if (gpio_fallback) {
>> +				if (__reset_gpios_args_match(args, r->of_args)) {
>> +					/*
>> +					 * Fake args (take first reset) and
>> +					 * args_count (to matcg reset-gpio
> 
> match

Ack
> 
>> +					 * of_reset_n_cells) because reset-gpio
>> +					 * has only one reset and does not care
>> +					 * about reset of GPIO specifier.
>> +					 */
>> +					args->args[0] = 0;
>> +					args->args_count = 1;
> 
> I'd expect args to be an input-only argument, but here its contents are
> overwritten after a match. Why?
> 
> This has an effect in __of_reset_control_get(), that I find hard to
> follow. See below.
> 
>> +					rcdev = r;
>> +					break;
>> +				}
>> +			} else {
>> +				rcdev = r;
>> +				break;
>> +			}
>> +		}
>> +	}
>> +
>> +	return rcdev;
>> +}
>> +
>>  struct reset_control *
>>  __of_reset_control_get(struct device_node *node, const char *id, int index,
>>  		       bool shared, bool optional, bool acquired)
>>  {
>> +	struct of_phandle_args args = {0};
>> +	bool gpio_fallback = false;
>>  	struct reset_control *rstc;
>> -	struct reset_controller_dev *r, *rcdev;
>> -	struct of_phandle_args args;
>> +	struct reset_controller_dev *rcdev;
>>  	int rstc_id;
>>  	int ret;
>>  
>> @@ -839,21 +960,50 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
>>  					 index, &args);
>>  	if (ret == -EINVAL)
>>  		return ERR_PTR(ret);
>> -	if (ret)
>> -		return optional ? NULL : ERR_PTR(ret);
>> +	if (ret) {
>> +		/*
>> +		 * There can be only one reset-gpio for regular devices, so
>> +		 * don't bother with GPIO index.
>> +		 */
> 
> I don't understand this comment. The GPIO index should be checked as
> part of __reset_gpios_args_match(), or should it not?

This and earlier comment are result of a bit hacky approach to the
problem: how to find reset controllers for that GPIO?

The point is that our reset gpio controller has only 1 reset, thus
of_reset_n_cells=1. However args_count from of_parse_handle is >0, which
later is compared in reset core:

https://elixir.bootlin.com/linux/latest/source/drivers/reset/core.c#L859

That part we need to match.

I could make the reset-gpio driver to have of_reset_n_cells=2, but what
would be the point? The rest of the cells are not really relevant,
because you cannot refer to this reset gpio controller with any other
arguments.

To remind: my solution spawns one reset-gpio controller for one GPIO.

> 
>> +		ret = of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
>> +						 0, &args);
>> +		if (ret)
>> +			return optional ? NULL : ERR_PTR(ret);
>>  
>> -	mutex_lock(&reset_list_mutex);
>> -	rcdev = NULL;
>> -	list_for_each_entry(r, &reset_controller_list, list) {
>> -		if (args.np == r->of_node) {
>> -			rcdev = r;
>> -			break;
>> -		}
>> +		gpio_fallback = true;
> 
> Is there a reason not just call __reset_add_reset_gpio_device() here?
> With that, there should be no need to call __reset_find_rcdev() twice.

Hm, could be, although not sure if code would be simpler.

This entire function handles two cases:
1. Get normal reset controller ("resets" OF property),
2. If above fails, get reset-gpio controller ("reset-gpios" OF property)

Therefore the entire solution is following approach:
1. of_parse_phandle(resets)
1b. error? Then of_parse_phandle(reset-gpios)
2. Find reset-controller based on any of above phandles.
3. error? Check if we created reset-gpios platform device. If not:
create new reset-gpios platform device/
3b. Platform device could probe, so lookup again for reset controller or
defer probe.

What type of flow do you propose?

> 
>>  	}
>>  
>> +	mutex_lock(&reset_list_mutex);
>> +	rcdev = __reset_find_rcdev(&args, gpio_fallback, NULL);
> 
> This gets called with args as parsed. If there is a match, this will 
> overwrite args (in the gpio_fallback case) and return NULL.

Overwrite not complete. It will only overwrite args_count and return a
valid rcdev.
I do not see overwriting in case of returning NULL.

> 
>> +
>>  	if (!rcdev) {
>> -		rstc = ERR_PTR(-EPROBE_DEFER);
>> -		goto out;
>> +		if (gpio_fallback) {
>> +			/*
>> +			 * Registering reset-gpio device might cause immediate
>> +			 * bind, thus taking reset_list_mutex lock via
>> +			 * reset_controller_register().
>> +			 */
>> +			mutex_unlock(&reset_list_mutex);
>> +			ret = __reset_add_reset_gpio_device(node, &args);
> 
> So this will also be called with args as parsed.
> 
>> +			mutex_lock(&reset_list_mutex);
>> +			if (ret) {
>> +				rstc = ERR_PTR(ret);
>> +				goto out;
>> +			}
>> +			/*
>> +			 * Success: reset-gpio could probe immediately, so
>> +			 * re-check the lookup.
>> +			 */
>> +			rcdev = __reset_find_rcdev(&args, gpio_fallback, NULL);
> 
> And this will again be called with args as parsed and overwrite args
> again.>
>> +			if (!rcdev) {
>> +				rstc = ERR_PTR(-EPROBE_DEFER);
>> +				goto out;
>> +			}
>> +			/* Success, rcdev is valid thus do not bail out */
>> +		} else {
>> +			rstc = ERR_PTR(-EPROBE_DEFER);
>> +			goto out;
>> +		}
>>  	}
> 
> So at this point args is overwritten in the gpio_fallback case. I would
> find it much clearer to just overwrite args here and make the first
> parameter to __reset_find_rcdev() const.

I think I get your point. Overwriting happens after we store the
original of_args, but the code is indeed not intuitive. I think I can
move it further, as you suggested.


Best regards,
Krzysztof


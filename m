Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D67826028
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jan 2024 16:31:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4296BEA1;
	Sat,  6 Jan 2024 16:31:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4296BEA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704555075;
	bh=+NvqQpd3sjDMAjlf+7vMrFGbH9YEwZESB83Zc8n5eL4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WGclOyrt6JIWMJ/9ICX66iepIMEeBHKF616WqlN+F9zHlc5cdOmPh34f7TOmnqXdf
	 Vs/yPahRcHf45Tk3DkTqbICXnN61xx2TcOfmmXbkEHURKqZpZjMOgViI+70sx2SF98
	 VeNXbGwL40ENni4a6WEbB02R1RzomyE9emXHDY2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C066F80589; Sat,  6 Jan 2024 16:30:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E59F8055B;
	Sat,  6 Jan 2024 16:30:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 576D9F804B0; Sat,  6 Jan 2024 16:29:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF653F8011B
	for <alsa-devel@alsa-project.org>; Sat,  6 Jan 2024 16:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF653F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hPWHMvbt
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a29c4bbb2f4so46233766b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 06 Jan 2024 07:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704554927; x=1705159727;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JqQSYLD6Y1gr/LDRvUK1g3O32845VQpwLDm/7pkTGqc=;
        b=hPWHMvbtlvePNEIu5cBBH/8hohgGe/l/okDzaKi6YnD+4KSS3akgPUnHN0KBPiIJnP
         PSU3iFutrGfjqA1IyQSr/N46dcALDdOMup/1LodA+W7KkFgSGaqZrGQ8N6Myhw3aIyQp
         8P6oKXzhFgDiA9Otey/VPJFi9wBdkZjmFGG71nLDqVOrbQ9zd5yeoTruwMvfQrmy1/hh
         Ju2h46ByHAiD7g8ph4rbslpNfNh+lxmk+sXdPi9Ec4ZzcrgqLEPn6jIU5zn7ByhJidTP
         I2jpXc/Q+qXbBlRKNmb5oONzG6LxhQ/pffbM5MJE+CkPy9adcPZPELGiGfKPxtLc6PG4
         7LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704554927; x=1705159727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JqQSYLD6Y1gr/LDRvUK1g3O32845VQpwLDm/7pkTGqc=;
        b=oYLb5nslsuCsfYfdWmqrmcKfaphggXzcjze6YsnceKe/ahCx4hcSBpKmSEGlhL4EFD
         AEwrBss9Xc+13y9JbLsdHnDXeyYR0F4zlhB3ddDkF4vaTJG3BWdTdvTrNtsaXwypFg2O
         I14suiMJtgBDAOwOtvdNwcmWpYHKbvsEKGhqdH8hX5px+Hbys5O9sGVgs1mkocttWOJ6
         bdWRh1bdHJvdMuXq/Joo8S4QlI1DpM3PPyEO8P6IPEwBkv04eL2yhpHDLDHqVgSd3Uuk
         K8BVVN94Q+8lpagB6IdmAoY18PbWsRLL/LwwVBJ8LWAqHPDB6WrnpfSGvw2hqRS1NN5Q
         Llcw==
X-Gm-Message-State: AOJu0YxKELmIhXFd0BDyYfQLjI+MUd+rCB6EmzOtOROV1E5yu4xNFtrs
	mVpIlCnvZBEVOhJO/zdG+fk2C2B4k+1PSg==
X-Google-Smtp-Source: 
 AGHT+IGsjSq59vSgfMblBL5/zjbLkXeESIfE0JYSbwYvKQ4C5Xqepl3SPwcwDY4p/oZsX7cU4fe2oQ==
X-Received: by 2002:a17:906:fc0d:b0:a28:afd9:8576 with SMTP id
 ov13-20020a170906fc0d00b00a28afd98576mr396374ejb.109.1704554926840;
        Sat, 06 Jan 2024 07:28:46 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 dq16-20020a170907735000b00a269357c2e7sm2068038ejc.36.2024.01.06.07.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jan 2024 07:28:46 -0800 (PST)
Message-ID: <40b4d29e-fa5c-43d5-8ccb-4a5a41150546@linaro.org>
Date: Sat, 6 Jan 2024 16:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] reset: gpio: Add GPIO-based reset controller
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
 <20240105155918.279657-2-krzysztof.kozlowski@linaro.org>
 <TYCPR01MB11269ABEDCD115064D449267486662@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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
In-Reply-To: 
 <TYCPR01MB11269ABEDCD115064D449267486662@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 46MMJUAKHMUGMOO5QE4YK23C6BIEKO7O
X-Message-ID-Hash: 46MMJUAKHMUGMOO5QE4YK23C6BIEKO7O
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

On 05/01/2024 17:39, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, January 5, 2024 3:59 PM
>> Subject: [PATCH v2 1/4] reset: gpio: Add GPIO-based reset controller
>>
>> Add a simple driver to control GPIO-based resets using the reset
>> controller API for the cases when the GPIOs are shared and reset should be
>> coordinated.  The driver is expected to be used by reset core framework
>> for ad-hoc reset controllers.
>>
>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>> Cc: Sean Anderson <sean.anderson@seco.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  MAINTAINERS                |   5 ++
>>  drivers/reset/Kconfig      |   9 +++
>>  drivers/reset/Makefile     |   1 +
>>  drivers/reset/reset-gpio.c | 121 +++++++++++++++++++++++++++++++++++++
>>  4 files changed, 136 insertions(+)
>>  create mode 100644 drivers/reset/reset-gpio.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7fe27cd60e1b..a0fbd4814bc7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8866,6 +8866,11 @@ F:	Documentation/i2c/muxes/i2c-mux-gpio.rst
>>  F:	drivers/i2c/muxes/i2c-mux-gpio.c
>>  F:	include/linux/platform_data/i2c-mux-gpio.h
>>
>> +GENERIC GPIO RESET DRIVER
>> +M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> +S:	Maintained
>> +F:	drivers/reset/reset-gpio.c
>> +
>>  GENERIC HDLC (WAN) DRIVERS
>>  M:	Krzysztof Halasa <khc@pm.waw.pl>
>>  S:	Maintained
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig index
>> ccd59ddd7610..bb1b5a326eb7 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -66,6 +66,15 @@ config RESET_BRCMSTB_RESCAL
>>  	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1
>> on
>>  	  BCM7216.
>>
>> +config RESET_GPIO
>> +	tristate "GPIO reset controller"
>> +	help
>> +	  This enables a generic reset controller for resets attached via
>> +	  GPIOs.  Typically for OF platforms this driver expects "reset-
>> gpios"
>> +	  property.
>> +
>> +	  If compiled as module, it will be called reset-gpio.
>> +
>>  config RESET_HSDK
>>  	bool "Synopsys HSDK Reset Driver"
>>  	depends on HAS_IOMEM
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile index
>> 8270da8a4baa..fd8b49fa46fc 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -11,6 +11,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
>>  obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
>>  obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
>>  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
>> +obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
>>  obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
>>  obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>>  obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o diff --git
>> a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c new file mode
>> 100644 index 000000000000..cf0a867cbc5f
>> --- /dev/null
>> +++ b/drivers/reset/reset-gpio.c
>> @@ -0,0 +1,121 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +
>> +struct reset_gpio_priv {
>> +	struct reset_controller_dev rc;
>> +	struct gpio_desc *reset;
>> +};
>> +
>> +static inline struct reset_gpio_priv
>> +*rc_to_reset_gpio(struct reset_controller_dev *rc) {
>> +	return container_of(rc, struct reset_gpio_priv, rc); }
>> +
>> +static int reset_gpio_assert(struct reset_controller_dev *rc, unsigned
>> +long id) {
>> +	struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
>> +
>> +	gpiod_set_value_cansleep(priv->reset, 1);
>> +
>> +	return 0;
>> +}
>> +
>> +static int reset_gpio_deassert(struct reset_controller_dev *rc,
>> +			       unsigned long id)
>> +{
>> +	struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
>> +
>> +	gpiod_set_value_cansleep(priv->reset, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static int reset_gpio_status(struct reset_controller_dev *rc, unsigned
>> +long id) {
>> +	struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
>> +
>> +	return gpiod_get_value_cansleep(priv->reset);
>> +}
>> +
>> +static const struct reset_control_ops reset_gpio_ops = {
>> +	.assert = reset_gpio_assert,
>> +	.deassert = reset_gpio_deassert,
>> +	.status = reset_gpio_status,
>> +};
>> +
>> +static void reset_gpio_of_args_put(void *data) {
>> +	of_node_put(data);
>> +}
>> +
>> +static int reset_gpio_probe(struct platform_device *pdev) {
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node **platdata = dev_get_platdata(dev);
>> +	struct of_phandle_args gpio_args;
>> +	struct reset_gpio_priv *priv;
>> +	int ret;
>> +
>> +	if (!platdata || !*platdata)
> 
> Maybe, if (!(platdata && *platdata)) which reduces 1 inversion operation.

I would not call it easier to understand... To me !A and !*A are quite
obvious and easy to read instantly because !A is obvious: check if it is
not NULL. Therefore original check is obvious: is NULL or points to
NULL? Then exit.

Now your check is a bit more complicated. It is not even frequent code
pattern which my brain used to see. You want to check if both are not
NULL and then negate it, wait, no, opposite, check if they are something
and then negate? To me it is really opposite of readable code.

Best regards,
Krzysztof


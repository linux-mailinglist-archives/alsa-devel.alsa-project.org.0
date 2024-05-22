Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC68CBC18
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 09:33:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1EEA822;
	Wed, 22 May 2024 09:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1EEA822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716363185;
	bh=ujtplpDHHre57IF59IvqEB2Kw8dcbdxqOMgfH/r499o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BAbVw94UXlfWAlRH3xu5DGoLXnCHTpDVmx/MZWczKdXjnzgt2vu7ucF1Gr/+wg6Et
	 a8Zs7eYRVTb+9QYMLo77vCCfh+svqJ/kxy+oHU7DIcWPxil0m5ETSU8dr/1o/CmmoC
	 5vaaUMv+WeU2eW76wBV3T1iPCOTaCmtT+2DqiTBQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29B27F80051; Wed, 22 May 2024 09:32:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DE77F80051;
	Wed, 22 May 2024 09:32:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ACCEF8026A; Wed, 22 May 2024 09:30:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7A0AF80051
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 09:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7A0AF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XpFKv/D5
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41fe54cb0e3so35326545e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 22 May 2024 00:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716362979; x=1716967779;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2U3y/E4W+g6WHZWhWDHN2owdKPMa1Ox2KTg8IP+L8r4=;
        b=XpFKv/D5v2mgGdYihNYCWCSg1dZVZbW4uJ6ZGEFBjY3ynli3mQHWtBPWE9KBUuIN1H
         6+JR8vkzs+iwqrBwPQ+pIKbZgg1WK1SqQKQPo4YyrH2jHHnQZTkqRwCUQNItZu9Etiso
         I7rkapSqMwbW3l66WBn1zNQFjA3JYIyjEnRXRn1+0hCXg77Bh0WN76AyjkKqaLB9RADd
         opqf2zKEwD6RfXeo8qSdUCT0vgHti0JkD0HkBjY0TaREExjNNRUVEYuscqEYurtwxHFe
         53/gsv9HGIY0FSFEVE8HbheMp4WDxy1AgNIAlsMf369udZ4Za1yMVD82sXgOznBz/6SC
         hVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716362979; x=1716967779;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2U3y/E4W+g6WHZWhWDHN2owdKPMa1Ox2KTg8IP+L8r4=;
        b=YujAe5v+OHdEx0xhQQnnwKYrtvqXmZzpML1T64Bwxildf7HO+Hkze5qlys8CaxPy6Q
         UZiP6hlCmQL6YjX+Wplj4B2sYQ6M5DYEw3qHMbOG+LWHuvtW+0eVd3hYvmBG+Dzb2esz
         bj/kZ/oIfOaUF0Mndp75XNeS9E8VQPqzyXPNmpBcWoH2Ucep0mRr/QiNa0XCu1LEg4Yh
         DFSI6UAosK/CIkqzG/hzfn615kok/dlBnJlsmeJ6zDdZ+yPzJorW7p2q00GbdE+Z19hQ
         VdBqiRhkU4C2Z/EkYgeD9ywScgWmENXS/SZvMzGh0+AabtQpFAjCggv6RircRcVKjun7
         A7gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJrs078m/tC3L4rfj94ud++S1XhFqEeu5HV5Nn+1BVFT45kubLTtv8kM4ZqqNUACI36feKRwPh4DCWmKIJjGw0WfwLbwIYWcTARhY=
X-Gm-Message-State: AOJu0YyAIBqU4m/fFmQL09KYXuFpyR+toUID8+89vA/8eoj3XtwbWvL8
	7HrSxE7dLbqopu5Lv9DvSuwuT3WCE53CVGxUFALPewE3eBzFuAzVZ10h/g0okFI=
X-Google-Smtp-Source: 
 AGHT+IHZr6SGdmsYq7oNUSaghJWy+96UkRVzcYcM6OS/e/jllLwc1HzE5OHDTuC/E4zIrh+PfTxRWw==
X-Received: by 2002:a05:600c:5613:b0:420:1853:68c3 with SMTP id
 5b1f17b1804b1-420fd3282ddmr6928015e9.20.1716362979042;
        Wed, 22 May 2024 00:29:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccbe8fa6sm489538445e9.2.2024.05.22.00.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 00:29:38 -0700 (PDT)
Message-ID: <262fa428-70e9-48d8-b89a-65225c0c7d15@linaro.org>
Date: Wed, 22 May 2024 09:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ASoC: cdns: Add drivers of Cadence Multi-Channel
 I2S Controller
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240508070406.286159-1-xingyu.wu@starfivetech.com>
 <20240508070406.286159-3-xingyu.wu@starfivetech.com>
 <NTZPR01MB0956937A2D3D8B97DB1C8E079FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: 
 <NTZPR01MB0956937A2D3D8B97DB1C8E079FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XFYNWALSONUUVGFRO2AXEBN2XMXQ5EHM
X-Message-ID-Hash: XFYNWALSONUUVGFRO2AXEBN2XMXQ5EHM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFYNWALSONUUVGFRO2AXEBN2XMXQ5EHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/05/2024 04:33, Xingyu Wu wrote:
>> Subject: [PATCH v3 2/2] ASoC: cdns: Add drivers of Cadence Multi-Channel I2S
>> Controller
>>
>> Add the drivers of Cadence Multi-Channel I2S Controller.
>>
>> The Cadence I2S Controller implements a function of the multi-channel (up to 8-
>> channel) bus. Each stereo channel combines functions of a transmitter and a
>> receiver. Each channel has independent and internal gating, clock and
>> interruption control. It alos support some of these channels are used as playback
>> and others can also be used as record in the same time.
>>
>> The I2S-MC is used on the StarFive JH8100 SoC and add the compatible for this.
>>
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  MAINTAINERS                      |   6 +
>>  sound/soc/Kconfig                |   1 +
>>  sound/soc/Makefile               |   1 +
>>  sound/soc/cdns/Kconfig           |  18 +
>>  sound/soc/cdns/Makefile          |   3 +
>>  sound/soc/cdns/cdns-i2s-mc-pcm.c | 285 +++++++++++++
>>  sound/soc/cdns/cdns-i2s-mc.c     | 704 +++++++++++++++++++++++++++++++
>>  sound/soc/cdns/cdns-i2s-mc.h     | 151 +++++++
>>  8 files changed, 1169 insertions(+)
>>  create mode 100644 sound/soc/cdns/Kconfig  create mode 100644
>> sound/soc/cdns/Makefile  create mode 100644 sound/soc/cdns/cdns-i2s-mc-
>> pcm.c  create mode 100644 sound/soc/cdns/cdns-i2s-mc.c  create mode 100644
>> sound/soc/cdns/cdns-i2s-mc.h
>>
> 
> Hi Mark,
> 
> Could you please help to review and give your comment about this I2S driver?
> Thank you very much!
> 

So you are not going to implement my feedback? Then Review tag does not
stand.

Also, please avoid pings for non-fixes during merge window. It's
pointless now.

Best regards,
Krzysztof


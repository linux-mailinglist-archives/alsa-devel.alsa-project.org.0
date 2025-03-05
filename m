Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70DCA4F85F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 09:00:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B927B602FF;
	Wed,  5 Mar 2025 09:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B927B602FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741161650;
	bh=y25J/hIP5cQuDdNvQ+VTPz5TWiB+VYXGxfCZmMMxxi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T0SXW7unjmD4QhGGmVMlStmA4x0DrnAs2uEWgXMaXefXuNWF3rQ9duXhPiMdRNK9i
	 Lk/d32ulGzppl12/i8X6y8xLag7QDGSNYZuIJqoWBDBXVAcT6nWvA/2u02PUYGAr8M
	 AJWLADQgadKDQREusCWx97mrlOTgzHSRZemr8FZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17657F805BA; Wed,  5 Mar 2025 09:00:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 969AEF805BB;
	Wed,  5 Mar 2025 09:00:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7617CF802BE; Wed,  5 Mar 2025 09:00:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA1C1F8011B
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 09:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA1C1F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vW5TLI2x
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43bd750d27dso62455e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Mar 2025 00:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741161599; x=1741766399;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=88zJPeEM6Ees5O8b20N8jdD2aVPaYoBTwcvx+zuqOE4=;
        b=vW5TLI2xLq9XKnH1TECrA1KkzC4hqznS/FLxzV2c+Q30dDpArzgtJ1ViFMgpVUX1XS
         6YBYAJhhowRdtt97TDdmxgeAt5C71s/ZnKb4vPoJP/8SEknqiJBCCH5OWULGf3+W5DCf
         XpwiD/90JBxWJ0G4mhAnJIUVthCZYa9AarJS246ryl7sqDiJbqYVIUjp9/I4u4DOL5PQ
         GGzRpZ42eG5XWirTLfVqNls0EPjeqJc2+hrYS8BMU47tiH52GZIhqFMABAbFFSByS99+
         IJaxAKDWEzFcpL2fQHAQPSfKbtLnZQhcENaCkrzk1GPfS/uId3sG1Dl1/9BOmiP03JlX
         vK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741161599; x=1741766399;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88zJPeEM6Ees5O8b20N8jdD2aVPaYoBTwcvx+zuqOE4=;
        b=MVvbJYq0ao9k47TQQy1lArDeMV7FX8gy9aajua2Uqbt+1bYJ7pPksd6XnMawhXBy+e
         UPfTUADyu68R5r3Xx81sCfMYCWmuZEtoY9ECj6s5qKH7CC3NfDEN4RMH2LgJDWunHpXP
         He07RCfCS2jEkOAWTBKR8iMxumAnPsMXg2i3HSPBErqrJleWQCkxf3Rgy+Itxv/bhF/v
         sfYpw1tAgv9j8rCq8FX5nbfKDLQDHw8Sc9sVOpQLtJ8Lz89CLnV7eI7Xkh5Qyf4EF7+B
         qgi8svEFgJfumsFZTFI85oDFEHwW3a6XCs1l9nFfnc5V+my10j9eNcZbC5mAUiZsHXcy
         UaRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQf8pM9RuwKzIWVLbPY6QBVak1WUTlfrMrdhCCefEfJQQ3cvf/rilctSPxVuWZoyDE4mNQFpcpJxN0@alsa-project.org
X-Gm-Message-State: AOJu0YwHh2AVR+374qCpRaNTiBucgVtpGy/LaBkS6TNuDZRHg9bQdXnD
	UFBBFeKsQl9/YPfTRTKxlyuG/vqwEaY+4Ec40rpRIdVA20HxWk/nUUnRYRqqcZg=
X-Gm-Gg: ASbGnctV48fEVAG9YCAyFOIpZezOTT4uy/ivj138+DU61xlAbXbkTCjG6Sq4oXo7waG
	y/JTo6FcBu3zcvtJwMk6f+8bvxuGFrK5Y4FhJB/VEDeI/jNQVquVYiAxNszWEjlrdlOueWeOoEI
	E5whXGBOJO9/yFNEmFLJCKf8JT5xT3CPGY+e4kyg51Af5F+0EQBatioZk7Gd6qnQR8Hw2cdiM5d
	jCoJB0bRLnE2Vp51YtjPR4EYM8DNm9RGDz0uOFRSWXUmJbW7d0QH6DCMG3HaS5QPVYb/1VNM5cx
	TUnHdVVQHhQMRewp64u1CQVGt9gzIrhx6xsF0csKwechbxpOzswMzeRN/MR4aQbJ
X-Google-Smtp-Source: 
 AGHT+IGR+fRTadOEWXBUD9X5CMFMEpgOuQoFFOazelTvrWLHVz4Mpbanh32Q0mDZ2cFWEr1glhNXNA==
X-Received: by 2002:a05:6000:1561:b0:38a:8784:9137 with SMTP id
 ffacd0b85a97d-3911f7b2b32mr598515f8f.9.1741161598873;
        Tue, 04 Mar 2025 23:59:58 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7b6asm20606967f8f.51.2025.03.04.23.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 23:59:58 -0800 (PST)
Message-ID: <7b1bb8ae-14aa-476b-b34c-9cb7aeaf0105@linaro.org>
Date: Wed, 5 Mar 2025 08:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
To: Zhang Yi <zhangyi@everest-semi.com>, krzysztof.kozlowski+dt@linaro.org
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com, robh+dt@kernel.org,
 conor+dt@kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 devicetree@vger.kernel.org
References: <20250305071050.113541-1-zhangyi@everest-semi.com>
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
In-Reply-To: <20250305071050.113541-1-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QDQNTBXYV2IHKFVJ7OKE4SI3HPYMCADI
X-Message-ID-Hash: QDQNTBXYV2IHKFVJ7OKE4SI3HPYMCADI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDQNTBXYV2IHKFVJ7OKE4SI3HPYMCADI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/03/2025 08:10, Zhang Yi wrote:
> 
>>> +
>>> +  prefix_name:
>>
>> No underscores in node names, missing vendor prefix... but more
>> important:  I don't understand the need for this property. Description copies property name so it is not useful.

And these comments as well.

>>
>> Drop. You maybe wanted dai prefix, but this is already in dai-common.
> 
> I will update description at v4 PATCH


> 
>>> +  everest,dmic-enabled:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +    description:
>>> +      The property is a choice between PDM and AMIC
>>> +
>>
>> No supplies?
> 
> I will drop the property

I did not comment about dmic, but meant missing power supplies, which
usually are placed here.

> 
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "#sound-dai-cells"


Best regards,
Krzysztof

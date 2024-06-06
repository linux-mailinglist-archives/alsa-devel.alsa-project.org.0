Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06EE8FE064
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 10:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2A2846;
	Thu,  6 Jun 2024 10:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2A2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717660849;
	bh=M4YbMnyA7wPbzKBrsOBsBA0mojZytlGPqCREAmq0jgY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sXZ2EYcTiuDl0BEmddq5kg6Kpi3D1qnc6AJDD59nq4eKiRM8JhXZHE2KowTpz4YgS
	 qdcXCBP7FI8fFU3KPEDgrx5ne1inDyBbs+PChtbrTpyRoZjIKDtYiNI52pW7PfTVE8
	 3begchEBbv7XTlWmSRX7c2mxMQE4NcXpFKD4K9Ig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9BBBF8025A; Thu,  6 Jun 2024 10:00:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 691DBF8025A;
	Thu,  6 Jun 2024 10:00:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FCB2F8025A; Thu,  6 Jun 2024 09:59:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B552F80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 09:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B552F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cRXqUP/S
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52b9d062526so748568e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 00:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717660743; x=1718265543;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnS+4Nw3mmnCgHlcq3mDgyzxrHoTkQuygatDQQZy8y8=;
        b=cRXqUP/SEJpeOwRgMWN+SIXEKb+vUaUxYPRkZES+kqF10Ot2D8MLDv/8hpjH2JoRWD
         iRFtJBKXT0B9vniY7b/YeUjk0N4wX9yCGWDU6XLD5cJiZeFAaLMIdUTQTGEhpu1AomwB
         6ltyX2Fh9EVOixISomylysRUaeK+Stfg43kU+BgIer01TV63RezQ5AkRHL04QfdsiBZM
         w3x7tyret4C30UDw2z+j8y0MJoo6Zmnyk8twUYbUgd6OCMkWZ3PwV/RNtKtdnE32YoDd
         cAJni5/vrGbrgkVUSlm3VJpz+Cey3KEuAR37EPcI9D3V87o6FecEGoxiGDEta+S5F2/5
         H0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717660743; x=1718265543;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gnS+4Nw3mmnCgHlcq3mDgyzxrHoTkQuygatDQQZy8y8=;
        b=o796Y95AsaWamtrj6gHfSTyeK/sUzIJ5uz6WYe67VhQFffe+s4m9i8V17Bn+DDb61Z
         PB6apefU4U2il2hbbrv9IB7zOGQMDnVkg1lOsG/bzJB1ugGslX2aRNy7CdSc0Mefg4rV
         wqL7D8q1NSjXT1CRDkRafrL0dy+KnGkDDIbyRaC4AYJnrCEgXEgYdWcoL81EtY8k9qn1
         O4tigzaocogdR0Jk5o0Y9X4/k2L0jb8d3ZUKsQjIqzWAJ7uSBqkmHmuwHwBD1j8RM1Hf
         BFni9pwrH6EbhtYGi0XQU8aKgsYDsv55Iebc2vgGx4re2fAUl1nvWVpAtPVk7IbfSWXH
         4rCA==
X-Gm-Message-State: AOJu0YylCLXq8y/0lpsMFZrLq8DBm9I79j4pQTn3VDNgWbz5gRjfaozj
	ZKcuRXjXf0artItTHVDiLPGMx7E8PeU7hc6JSxLb/YQYjjrhWm5b/uaQvBT5ges=
X-Google-Smtp-Source: 
 AGHT+IHYwQVGy5dggvj+xREw0PMv6gW7XtD9G6UpJEyN+UKn9U1OFTscrpuHK+PvsB0Onhm5ujkKAA==
X-Received: by 2002:a05:6512:114a:b0:52b:9f37:3ec2 with SMTP id
 2adb3069b0e04-52bab4c93e5mr2874304e87.11.1717660742962;
        Thu, 06 Jun 2024 00:59:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2?
 ([2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215810242fsm45618635e9.12.2024.06.06.00.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 00:59:02 -0700 (PDT)
Message-ID: <92f96ac7-d36b-4c3c-862e-90e939c367a4@linaro.org>
Date: Thu, 6 Jun 2024 09:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] ASoC: dt-binding: convert amlogic,g12a-tohdmitx to
 dt-schema
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: 
 <20240605-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-v1-1-b851c195e241@linaro.org>
 <05454339-9f83-4101-ac55-0dc7b5a8d45e@kernel.org>
 <4d9d7cff-1a00-459d-8ccf-d30ec2cdcaad@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <4d9d7cff-1a00-459d-8ccf-d30ec2cdcaad@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5H7DAIAB7BM67S7X2GDV5URJ2H4UT535
X-Message-ID-Hash: 5H7DAIAB7BM67S7X2GDV5URJ2H4UT535
X-MailFrom: neil.armstrong@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: neil.armstrong@linaro.org
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5H7DAIAB7BM67S7X2GDV5URJ2H4UT535/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/06/2024 09:45, Krzysztof Kozlowski wrote:
> On 06/06/2024 09:45, Krzysztof Kozlowski wrote:
>> On 05/06/2024 18:23, Neil Armstrong wrote:
>>> Convert text bindings to dt-schema format for the Amlogic TX HDMI
>>> control glue.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> subject: dt-bindings (missing 's')
>>
>>> ---
>>>   .../bindings/sound/amlogic,g12a-tohdmitx.txt       | 58 ----------------------
>>>   .../bindings/sound/amlogic,g12a-tohdmitx.yaml      | 56 +++++++++++++++++++++
>>>   2 files changed, 56 insertions(+), 58 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
>>> deleted file mode 100644
>>> index 4e8cd7eb7cec..000000000000
>>> --- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
>>> +++ /dev/null
>>> @@ -1,58 +0,0 @@
>>> -* Amlogic HDMI Tx control glue
>>> -
>>
>>> +
>>> +title: Amlogic G12a HDMI TX Control Glue
>>> +
>>> +maintainers:
>>> +  - Jerome Brunet <jbrunet@baylibre.com>
>>> +
>>> +allOf:
>>> +  - $ref: dai-common.yaml#
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^audio-controller@.*"
>>> +
>>> +  "#sound-dai-cells":
>>> +    const: 1
>>> +
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +          - const: amlogic,g12a-tohdmitx
>>> +      - items:
>>> +          - enum:
>>> +              - amlogic,sm1-tohdmitx
>>> +          - const: amlogic,g12a-tohdmitx
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>> +  sound-name-prefix: true
>>
>> Drop
>>
>>> +
>>> +required:
>>> +  - "#sound-dai-cells"
>>> +  - compatible
>>> +  - reg
>>> +  - resets
>>
>> Please keep the same order as in "properties:" block.
>>
>>> +
>>> +additionalProperties: false
>>
>> and here instead:
>> unevaluatedProperties: false
>>
> 
> and with above changes:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Ack,

Thanks,
Neil

> 
> Best regards,
> Krzysztof
> 


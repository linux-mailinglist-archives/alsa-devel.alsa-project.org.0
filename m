Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E865B7FB515
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:00:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25DBF836;
	Tue, 28 Nov 2023 09:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25DBF836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701162005;
	bh=Lz+25Bf/VNJ396UmpATBaE4U9/o++7GPwFhyVOUjBc0=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tndgJzKvuNSTv+9B1T2O1rmIXIqO0xByEAEINtEODsoqD6OC8vbdYEhh9qw/O1/1r
	 Zwdu/GcGmt5KBESLVQDSsz3Ty9YbU9UCbnoZNXjz6b/FfZgHdm0JP1eoLCfPayYU0k
	 A07WNquA0XhfgMJvTmi7oETI1HpCzUWdOuuOD5m0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09DAAF8057C; Tue, 28 Nov 2023 09:59:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52981F8055B;
	Tue, 28 Nov 2023 09:59:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6447F8016E; Tue, 28 Nov 2023 09:59:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CFFAF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 09:59:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CFFAF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HJaQcAUS
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50abbb23122so6724082e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 00:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701161967; x=1701766767;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YB9eXhdsuOiakznd6Lf5LJTFRBO3IbemXq2apHB2Dk=;
        b=HJaQcAUSAR6m6pG2TFl0gsPtEmLaQf/sAeHT7hPnvsPo66Yf0WhNQBKkBWzNZxmr3W
         copdz8lGq84+OGTayxc7wuBdcBCsAnl8O/zsaexSzF/OZ5caERVHXUHVo3bZS+ny46l6
         bIikIaehwt3U3F2CrDsQ9MRGqmo0XyBzTS3GDuEfdFOlATteSSFNGyy9gRJX9qHu9pX1
         cRuZqNfCJe7cJr0IqyOF9k/LD7Wi700yUnB6u6yH6BjGS0AuKWV+mJasS4c03dqweCCs
         xz6gw8WWHH+cwE0jBdqt8Lhw6wYSDmf6bw/o7fU3N2KR/2qObU/hcKy3HY+UCvY2755I
         JAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161967; x=1701766767;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8YB9eXhdsuOiakznd6Lf5LJTFRBO3IbemXq2apHB2Dk=;
        b=hffRXNNn7bNODftAy1VXMZyuVR40OyaBq3d8W2N5UUvHD1agTqSg1U5DDBe1AeEjfb
         ctjZwS8J43TMbZnZHszXt9J6JShtzL2ipMROma+kX3cd3gjysCwLRTm2cJog7wv+1hPJ
         Q/NFr6hVm5YtKUSxsqU2kwbqhIVMsyMxRfhbQhPEAbBJf7yMJiZ8D89VUhvGzlisrfHg
         NOiJiujXW58IPntemWpBHrWW8sTRYQTVwyeqkjIHjFrTj3OjAtgy6mSCQ+62Db25aUU2
         qnzCn+a42RbvuzKBVwVQE9Jee71Ym+AxrFspzSFoJ4Vr9yGhM3S+nv01RyjfI9LvBfWe
         16YQ==
X-Gm-Message-State: AOJu0Yyr/rz1+bYb39GTxnNMQCqxDWqAMJZn0Oipm6Ind8zrHVmmgG5C
	NPzVtaKny2kU+uQAyc7dKq4xNw==
X-Google-Smtp-Source: 
 AGHT+IFgtUElt6TEeq8N26GDHSRNCReIbvlh2U0u1SFwedLd+MAzHzMA+4u/+j6DCDvWt86KScuDBQ==
X-Received: by 2002:a05:6512:3a90:b0:50a:a242:b614 with SMTP id
 q16-20020a0565123a9000b0050aa242b614mr8577055lfu.2.1701161966447;
        Tue, 28 Nov 2023 00:59:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id
 o10-20020adfcf0a000000b00332cb5185edsm14233807wrj.14.2023.11.28.00.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:59:25 -0800 (PST)
Message-ID: <b637c287-93e5-4214-9275-80fac3c6181b@linaro.org>
Date: Tue, 28 Nov 2023 09:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: document WCD939x Audio Codec
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-2-21d4ad9276de@linaro.org>
 <160fc6c4-b07d-49c5-976b-aa0fa35e4f0f@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <160fc6c4-b07d-49c5-976b-aa0fa35e4f0f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HO3LWNQD4A5WDPWFTSHTVZEYXXQNQQBI
X-Message-ID-Hash: HO3LWNQD4A5WDPWFTSHTVZEYXXQNQQBI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HO3LWNQD4A5WDPWFTSHTVZEYXXQNQQBI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/11/2023 09:33, Krzysztof Kozlowski wrote:
> On 23/11/2023 15:49, Neil Armstrong wrote:
> 
>> +  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
>> +  It has RX and TX Soundwire slave devices.
>> +  The WCD9390/WCD9395 IC has a functionally separate USB-C Mux subsystem
>> +  accessible over an I2C interface.
>> +  The Audio Headphone and Microphone data path between the Codec and the USB-C Mux
>> +  subsystems are external to the IC, thus requiring DT port-endpoint graph description
>> +  to handle USB-C altmode & orientation switching for Audio Accessory Mode.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +  - $ref: qcom,wcd93xx-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,wcd9390-codec
>> +      - qcom,wcd9395-codec
> 
> 9395 should be compatible with 9390, so please express it with a list
> using fallback. I know that earlier wcd93xx do not follow that concept,
> but maybe we will fix them some point as well.

I don't get why this would be needed, yes their are compatible but still
two separate ICs with different internal capabilities.

It the first time I get such request for new documentation

> 
>> +
>> +  mode-switch:
>> +    description: Flag the port as possible handle of altmode switching
>> +    type: boolean
>> +
>> +  orientation-switch:
>> +    description: Flag the port as possible handler of orientation switching
>> +    type: boolean
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description:
>> +      A port node to link the WCD939x Codec node to USB MUX subsystems for the
>> +      purpose of handling altmode muxing and orientation switching to detecte and
>> +      enable Audio Accessory Mode.
>> +
>> +required:
>> +  - compatible
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    codec {
>> +        compatible = "qcom,wcd9390-codec";
>> +        reset-gpios = <&tlmm 32 0>;
> 
> Please define for the GPIO flag.

Ack

> 
>> +        #sound-dai-cells = <1>;
>> +        qcom,tx-device = <&wcd939x_tx>;
>> +        qcom,rx-device = <&wcd939x_rx>;
>> +        qcom,micbias1-microvolt = <1800000>;
>> +        qcom,micbias2-microvolt = <1800000>;
>> +        qcom,micbias3-microvolt = <1800000>;
>> +        qcom,micbias4-microvolt = <1800000>;
>> +        qcom,hphl-jack-type-normally-closed;
>> +        qcom,ground-jack-type-normally-closed;
>> +        qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
>> +        qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
>> +    };
>> +
>> +    /* ... */
>> +
>> +    soundwire@3210000 {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        reg = <0x03210000 0x2000>;
>> +        wcd939x_rx: codec@0,4 {
>> +            compatible = "sdw20217010e00";
>> +            reg  = <0 4>;
> 
> Just one space before '='

Ack

> 
>> +            qcom,rx-port-mapping = <1 2 3 4 5 6>;
>> +        };
>> +    };
>> +
>> +    soundwire@3230000 {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        reg = <0x03230000 0x2000>;
>> +        wcd938x_tx: codec@0,3 {
>> +            compatible = "sdw20217010e00";
>> +            reg  = <0 3>;
> 
> Ditto

Ack

Thanks,
Neil

> 
> 
> Best regards,
> Krzysztof
> 


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0817FB55D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:15:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7FAA84A;
	Tue, 28 Nov 2023 10:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7FAA84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701162910;
	bh=Ly8ibmF3JWVUPnLDlDiYBrh96c1WqBKlTXh1duiyW/s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FS7By/mMZmttRdwchKpGq0OvsMg5qe5bTObxd+ywOH3UIPJtUw3yBBdXwpny/FG9Z
	 IgpBfhG44DyqeWBw+tjZQBUGmoTE1ZjAz6u9+IlsPUt1F03mfcTQYmtFmzNkClGmam
	 KIVZbHlMgH8PC3H//xjcWcElUvtxUlwcVoAplXvM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF8FDF80567; Tue, 28 Nov 2023 10:14:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AEE7F80579;
	Tue, 28 Nov 2023 10:14:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1D73F8016E; Tue, 28 Nov 2023 10:14:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1112F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 10:14:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1112F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gz2tfRUL
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-332ed1bd4cbso2242813f8f.2
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 01:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701162871; x=1701767671;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Kjtii/FN0kaVr+RySKyiRhJOaMJhIbqBNo40CkvcnQ=;
        b=gz2tfRULxr2XpIR1Q6C+slhtO6JZ4wY3HjVvTIowCG/V2beoeNbiv5jHfMabWk7EoY
         Djhwz4c3WlKLbLJzSUgUEGxhTnvdd6KF0tixtdYHJdd+7O/E/MqPQ+VD+n9zfuM8vzYY
         PUmP3iQUZb1UurAHs2+qrtSSKaMzvqo7RTtN09BiE1xiroJY9lXIfc1Odvou7tWd1aQX
         NZf+vGDdyiuYGWz8puT4vGkAnCU5/hNv2GPvZUBWBjl6PGB3R9Sn1Ibnl3XePEvMFMdl
         ++YfSG5P8nrr8O0nFXL2OBRfWlGLfGnDm71ywxUiyP8mU4WQP0Gx4Gk7lrsUikUnkJjo
         nkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701162871; x=1701767671;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Kjtii/FN0kaVr+RySKyiRhJOaMJhIbqBNo40CkvcnQ=;
        b=m++IbIdR3fqvSxdkudaT3ldcX9GLtA1ro5++v60cqFM/cyv/AINB5Dnbf3q7IjcTHm
         MqQex/UFrRybhN5/5S55bFctLp4DiQ0WbBD8Y8x8cQKZ/xPnpwv0CwIZCs42alheZ416
         61bkPS4u1w8HZR2GGnVdDqMRknJ67/+xkPuTykVT1dyA8dnOpN468Laq0f0DcOSkpCwo
         j7j+SRjW614QrhbpMTWZb71nm6xDxkKKR2vPewr9uzbtKCaz8ffBFtL1xlIVj/YwwzIq
         7ELeb6J3CgI6w92H2Q7dc4+JkSH8VeEnj3ALRMylQyySYRaf90Aw6B2JjVhIKLU7z3gN
         Qepg==
X-Gm-Message-State: AOJu0Yynntv4cmtR/5JsorpA7fgKJlfhUwhRVAcd55ZLdfTOWAqDaKds
	GIVfvV1RMbLz6Ozr0bnrtveMQw==
X-Google-Smtp-Source: 
 AGHT+IEQUMczIYX8hA+zLKx022wQyd14G8CqIVm0T/Hdr+d/ZVMnwjy4MFWloEOBHn7FeV7wpwnPnA==
X-Received: by 2002:a5d:49d1:0:b0:32d:9d99:d0a5 with SMTP id
 t17-20020a5d49d1000000b0032d9d99d0a5mr9526680wrs.5.1701162870857;
        Tue, 28 Nov 2023 01:14:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id
 l15-20020a5d560f000000b00332f8f4960fsm7891464wrv.0.2023.11.28.01.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:14:30 -0800 (PST)
Message-ID: <752f5347-703a-4b38-b2b1-3493d270389c@linaro.org>
Date: Tue, 28 Nov 2023 10:14:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
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
 <b637c287-93e5-4214-9275-80fac3c6181b@linaro.org>
 <60c9ba5d-a2b8-43cd-8b8d-2c709b8e5d04@linaro.org>
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
In-Reply-To: <60c9ba5d-a2b8-43cd-8b8d-2c709b8e5d04@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2Y3TVKOIISGGBJXNDEQS2W4WB3AINWKT
X-Message-ID-Hash: 2Y3TVKOIISGGBJXNDEQS2W4WB3AINWKT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2Y3TVKOIISGGBJXNDEQS2W4WB3AINWKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/11/2023 10:04, Krzysztof Kozlowski wrote:
> On 28/11/2023 09:59, Neil Armstrong wrote:
>> On 24/11/2023 09:33, Krzysztof Kozlowski wrote:
>>> On 23/11/2023 15:49, Neil Armstrong wrote:
>>>
>>>> +  Qualcomm WCD9390/WCD9395 Codec is a standalone Hi-Fi audio codec IC.
>>>> +  It has RX and TX Soundwire slave devices.
>>>> +  The WCD9390/WCD9395 IC has a functionally separate USB-C Mux subsystem
>>>> +  accessible over an I2C interface.
>>>> +  The Audio Headphone and Microphone data path between the Codec and the USB-C Mux
>>>> +  subsystems are external to the IC, thus requiring DT port-endpoint graph description
>>>> +  to handle USB-C altmode & orientation switching for Audio Accessory Mode.
>>>> +
>>>> +allOf:
>>>> +  - $ref: dai-common.yaml#
>>>> +  - $ref: qcom,wcd93xx-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - qcom,wcd9390-codec
>>>> +      - qcom,wcd9395-codec
>>>
>>> 9395 should be compatible with 9390, so please express it with a list
>>> using fallback. I know that earlier wcd93xx do not follow that concept,
>>> but maybe we will fix them some point as well.
>>
>> I don't get why this would be needed, yes their are compatible but still
>> two separate ICs with different internal capabilities.
>>
>> It the first time I get such request for new documentation
> 
> Maybe it is first time for you, but I ask about this all the time. What
> is important is whether the programming model or how the OS uses the
> device is the same.

I agree for new version of HW, anyway..

> 
> Here the device exposes its version in registers, so you can easily rely
> on the compatibility. That's also the case multiple times talked on the
> mailing lists.

... you're right here version can be determined at runtime.

But, since both are compatible, there's no primary part number, right?

so why use "qcom,wcd9395-codec", "qcom,wcd9390-codec"
when "qcom,wcd9390-codec", "qcom,wcd9395-codec" should
also be valid, so in this can why not use :
"qcom,wcd9390-codec", "qcom,wcd939x-codec"
or
"qcom,wcd9395-codec", "qcom,wcd939x-codec"

?

> 
> Best regards,
> Krzysztof
> 


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14197FDAE1
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 16:13:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1413D847;
	Wed, 29 Nov 2023 16:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1413D847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701270783;
	bh=+9x5aF6Ek6IHja+xCrQihX7qrHFnaQh5OuMRPpmhaFo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fcVLxN+LWNPFXaA2Ilm+nIx/mnDN7uMHZHdTza+NfNF5E5UqGL3ooWkwsbg641YCW
	 Xg2JbrWl+qUkCOs3YoZykKrjnVgA0M0Z1qazTyxPOtRjQc850BMu3NXT8hSNBbNwrF
	 W+eCSG2HJDjxym9CZBBYrGERQRCj0upamVQ4Za7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DDBBF802BE; Wed, 29 Nov 2023 16:12:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E296F80571;
	Wed, 29 Nov 2023 16:12:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EE3CF8016E; Wed, 29 Nov 2023 16:12:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96F73F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 16:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96F73F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ezPZDwB8
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so55348005e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701270740; x=1701875540;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Hdd64HNUK0tSK3Da+oWNy4zZpaQIUo/ssbLKmavYcU=;
        b=ezPZDwB8/i94fVApqk49Q8mSecR1O+8KccyN3OchiFdEbnX89WfwDSkhLKSJOgy3Fi
         fBCO6NfPE0bXPn5Gd0yiO4a+6COZ0n2lnNc9peZoYN8sayT1cYiCQzCVlGJAqwDWGI4b
         eNW5WmOgE3AyoTnESFukH7v7EYAqrh1bDGPFKHomtjU7o9B6o5GPM1y5NVBVqKUJZbQm
         tPLMdG+hPS181R6P4vaSDTBETtLRgU0TvDWrwMi8mp5GTZ62WWoOpfLw9JaUABIsPXhu
         GpN91vKq3GD6kAz7bY/kjwfCmVhnt0BnVes2Kbd9Yr3VS+BpwbPUH8Nh7nnJ0PBSqVY7
         +h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701270740; x=1701875540;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Hdd64HNUK0tSK3Da+oWNy4zZpaQIUo/ssbLKmavYcU=;
        b=Q8Egl52gf0OaAjmF61KhH9zu609wp2DUf8OKwPiXzH2cHsoc/z7nBICMwmOlQ+Iil3
         VhNOs9dPIWwZC0jh0PZjuI5HZbHVTWI5kPvj5XW5I8vnIpsvFW/58KR0pbhynSDCRjSJ
         5EOq6tLH/eRmKFcSgrULJY4rEZTn1L4UNlzi0VtvGNGsMhOvP/kzSxNDbQy4CBQS+zCl
         g5nsglcvFO4LjkD3gvjkFDLHD7KxoDcFRFbe4Ly6a4KYSHjMKW7uhz8Hrv9K9Xw3K2i7
         ugWuJlWIca9jEs2yf8wRsZH94ceJt5Kz7qMM9+tiaGvm0kuOzWMP4vjJQ7fSGX/eLQr3
         VF6A==
X-Gm-Message-State: AOJu0YxtLmUY4/GthPJRglNAM/5Cb8AkRJP6hFbZkzJSIk/iS0CbSswp
	7r4/RA+Rk3/i/i8N2Ts7QAcE0Q==
X-Google-Smtp-Source: 
 AGHT+IF6BSoAaomITr4Z8xFOaHR6UtekVxTvNoVtk5sxQ+zoAVT/1BIogKnQKPJoVioojJENj2zBmQ==
X-Received: by 2002:a05:600c:4f42:b0:40a:28b1:70f8 with SMTP id
 m2-20020a05600c4f4200b0040a28b170f8mr14698978wmq.21.1701270740436;
        Wed, 29 Nov 2023 07:12:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c?
 ([2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b0040b47c69d08sm2531225wmq.18.2023.11.29.07.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 07:12:20 -0800 (PST)
Message-ID: <0140f49d-c463-4011-8159-f4e56466e6bd@linaro.org>
Date: Wed, 29 Nov 2023 16:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/5] ASoC: codecs: Add WCD939x Codec driver
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
 <ad9a7c4b-82f4-4347-b4dd-a394e4ba95f0@linaro.org>
 <42a6f6e0-2846-4cdc-8702-493fadbafb98@linaro.org>
 <eaa034cb-06e8-4204-befa-4389bcb7d9e8@linaro.org>
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
In-Reply-To: <eaa034cb-06e8-4204-befa-4389bcb7d9e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OY7IHNOJT7ZRMYBCLI7FHJCM27BDBIFM
X-Message-ID-Hash: OY7IHNOJT7ZRMYBCLI7FHJCM27BDBIFM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OY7IHNOJT7ZRMYBCLI7FHJCM27BDBIFM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/11/2023 14:46, Konrad Dybcio wrote:
> On 28.11.2023 16:01, Neil Armstrong wrote:
>> On 25/11/2023 13:07, Konrad Dybcio wrote:
>>
>> <snip>
>>
>>>> +
>>>> +static int wcd939x_io_init(struct snd_soc_component *component)
>>>> +{
>>>> +    snd_soc_component_write_field(component, WCD939X_ANA_BIAS,
>>>> +                      WCD939X_BIAS_ANALOG_BIAS_EN, 1);
>>> All of these values are BIT()s or 2-4 ORed BIT()s, can you check what they
>>> mean?
>>>
>>> Same for almost all other snd_soc_component_ write/modify functions
>>
>> It uses snd_soc_component_write_field() with is the same as
>> regmap_write_bits(REGISTER, REGISTER_MASK,
>>                    FIELD_PREP(REGISTER_MASK, value);
>>
>> So the 1 mean write in enable mask in this case, and mask is single bit,
>> read it exactly like if it was using FIELD_PREP(), but even for BITs.
>>
>> I did check every single snd_soc_component_write_field() so far to check
>> it matches.
>>
>> Or it's another question ?
> What I wanted to ask is whether it's possible to #define these magic
> values within these fields

OK, so most of writes are to boolean enable bits, I can use true/false
instead of 0 & 1 for those, would it be more readable ?

For the rest, those a integer values to a field, those are not bitmasks
and I do not have the definition of the values.

I did a full cleanup and tried to define as much as possible,
there were still lot of places where not defined bitmasks we used,
but there's still some integer values, but I think it's acceptable.

Neil

> 
> Konrad


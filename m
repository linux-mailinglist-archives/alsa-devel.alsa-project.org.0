Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F78899723
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 09:57:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1DBB2CDD;
	Fri,  5 Apr 2024 09:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1DBB2CDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712303837;
	bh=oMZnFnjAx4DFtc8QSzozkHjcSyZizqklmKEOQxaJMSU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SOeBBZKEKVYZkZf/lDHpBYbWqJPXif9gJNGiOiSea+6bA9A28InLnTaPWs6i8qs0S
	 qdFJhiu5eT/3pI8Vs7SEwty/8udipzLotOgEqlLOntLLX0w9bNWMwCRuV/jswQhj/5
	 oTpYewj5q768OLeKVakpziRylL6xXVqxWNjOyFWI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1142F805A8; Fri,  5 Apr 2024 09:56:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71A69F80571;
	Fri,  5 Apr 2024 09:56:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 843A1F8020D; Fri,  5 Apr 2024 09:54:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E1EBF8015B
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 09:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E1EBF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CHjk/ph1
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-34005b5927eso1206274f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 00:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712303681; x=1712908481;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPTsDTaZWEDZD5eXOx+IgyDot64aAbYjUOhbFNZJJt8=;
        b=CHjk/ph1pMdX0pNnToFq0L660sR03asadQRJfEVj+gaXoj9q8SLvCv3O+YR5ijXx/y
         6jjX59cbKeouFRtGqEWXPSDNYiB00gsYuvkpnC91qXKdUGxBY92k6jWbjYtHlax+OeaM
         DCqlTpdl9elDOnohSj+fgCfZYy6zYSW/P0+qhipSJGINs9dX4qQ/YVaBg7CFQCCQRQBU
         4683/oVw8XZGXdjpqfsgIAA7aixgNxC59pbwbk/p6JDjDA5CxXR7vLnZd3OFw7qoKpOM
         FehY5bUSXY+yqTYbTznIg2R8Hu5t4+FT2g1OXmF2cX/qUg6ql2Ugl08F2A665Dw8qHC4
         B/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712303681; x=1712908481;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GPTsDTaZWEDZD5eXOx+IgyDot64aAbYjUOhbFNZJJt8=;
        b=Gozij7ncBtRk96eO2LYy6YP9p/xvLihBJ92xObJeGuo0aRcxBHa+ZS0xkqlprpL8uR
         9NS93NTnBrx88sjZOdJ4CofXWbqks0zc8fVmZ7jd+05RP62iPZWhA9pjlsguOAeRke1M
         D0hDRIttHiY5VnjDQ6Hk7MDHcqH/bg3yGW7VN3kNjqrzFtV55Y1nN/kw8Sdb5rEFuyNz
         KsZXW9hc0ync5qyEy1TZdhpfKlw58rjsBOLTYMVDjnG3AM9cXGNM7rtQ67DCVutDheXv
         JjfMpDT7Xh9uM+9lUlsdIZHjGIsD4NuE52Gx0Xp0EKYgDa26PI6nn8/ZhomP6b+Ie4Dl
         x+jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX05ryFpCpnXD/bOULbl4RQ5/HXFzOUMXRrunSbN3tBQTERweXub17gAmfvv3K8DV1+Ut9jDXe+nq1T4uXXc/9Se+cabb4F8O2Xvgk=
X-Gm-Message-State: AOJu0YzHxZcUJTX4+soZd45fd6ZpEQ5oAnxgwbBL++3V31ZLdb8T6JtO
	kK5L7K/d+NvBUlhpIUSV9DHA1u0sVUp9STPC+PxVaic+llnLMp6efEhOywdRnwc=
X-Google-Smtp-Source: 
 AGHT+IE8OwWcCvoSNoRbTbgfpm6Z2mGwUHjAwWZsIEDD4PBil+AaWyEv7bLgb2wawJDMc2KNFFUC3A==
X-Received: by 2002:adf:f592:0:b0:33e:d448:e48c with SMTP id
 f18-20020adff592000000b0033ed448e48cmr475898wro.15.1712303681268;
        Fri, 05 Apr 2024 00:54:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8e64:fc77:aa3a:87a?
 ([2a01:e0a:982:cbb0:8e64:fc77:aa3a:87a])
        by smtp.gmail.com with ESMTPSA id
 p1-20020a5d59a1000000b00341e24a586fsm1362739wrr.93.2024.04.05.00.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 00:54:40 -0700 (PDT)
Message-ID: <15a31bf1-e0be-45e0-897b-d29a1af6d357@linaro.org>
Date: Fri, 5 Apr 2024 09:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add SM8550 Xperia 1 V
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
 <20240210-topic-1v-v1-7-fda0db38e29b@linaro.org>
 <05e6f92c-388c-4bc6-a4cd-e9d981166d1c@linaro.org>
 <8f6236db-0692-44c9-b136-8e0dff714c55@linaro.org>
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
In-Reply-To: <8f6236db-0692-44c9-b136-8e0dff714c55@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WKGFAQD7LW67K5FEKGAIT5ZOYILNDS6L
X-Message-ID-Hash: WKGFAQD7LW67K5FEKGAIT5ZOYILNDS6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKGFAQD7LW67K5FEKGAIT5ZOYILNDS6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/04/2024 21:41, Konrad Dybcio wrote:
> 
> 
> On 2/12/24 18:26, Neil Armstrong wrote:
>> On 12/02/2024 14:10, Konrad Dybcio wrote:
>>> Add support for Sony Xperia 1 V, a.k.a PDX234. This device is a part
>>> of the SoMC SM8550 Yodo platform.
>>>
> 
> [...]
> 
>>> +/* TODO: Only one SID of PMR735D seems accessible? */
>>
>>
>> What's reported by the cpuinfo pmic array  ?
> 
> PMK8550 2.1
> PM8550 2.0
> PM8550VS 2.0
> PM8550VS 2.0
> PM8550VS 2.0
> PM8550VE 2.0
> PM8550VS 2.0
> PM8550B 2.0
> PMR735D 2.0
> PM8010 1.1
> PM8010 1.1
> 
> Not sure if there's only one or the other one is secure?
> 
>>
>> <snip>
>>
>> With the pcie thing fixed:
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> It's gonna be fine with the recent aux clock additions. If you
> have no further comments, I'll happily ask for this to be merged ;)

Sure LGTM

> 
> Konrad


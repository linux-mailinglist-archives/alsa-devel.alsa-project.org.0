Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CDD7FB583
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:19:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE08C84D;
	Tue, 28 Nov 2023 10:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE08C84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701163193;
	bh=860osC/5JMx4qkhmUiiTvyoNYTFLFL+jsP0VjjCa29s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AHavD+XYo80xQRgLCjeMn/Lv4e9JAkb6rzqioleqs4J6wM0u2WkJkT9U2an7cRXgo
	 8eFq4K1iOliqyAsoGXL8FwgjaJPrFgiIZYGKyqhLBWb5GjlC6//sWRxxHGdyV4d4io
	 LrL5gOciu/OPm7iY484T/klTsC/heySsoC2vphOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD34F80588; Tue, 28 Nov 2023 10:19:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56085F80557;
	Tue, 28 Nov 2023 10:19:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1CB6F8016E; Tue, 28 Nov 2023 10:19:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AFC1F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 10:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AFC1F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=X0sH6uxo
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b4a8db314so5956785e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 01:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701163154; x=1701767954;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJ3V0q0kN4dcJ19Ow1ceuBEQfKiUYtgJ8KZQRLu90zA=;
        b=X0sH6uxobpPDPgv/3wPcdmPCDE86lbYjEEe+hvGzURH7Drh0RcASFursgPrjlYB1Qu
         HB6dyJLGuxfxc1YMs1gKJCS0X1EPxV0rCAV7Xnb32hEj7MNLtfw/DG42VlLD/nDrSB4+
         gAk9K3XAyfcIXet/L8jrx0a7FinQVmr/+kOv741DMH0m7k0s+A59OaWDPkey4eTXRmkj
         2co563cF87s+gYWmwY0YdzzkpzAsRUmvKUkjhNY13f0GvBdiGuOCIQ+wB7yznwixFYGF
         3jZmHii0XgIPZLDzjbZTdR2EHpboQsgpaWD6w/BcAz3g4RFy42DV3WWj1eNJA/n3MU0s
         oX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163154; x=1701767954;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BJ3V0q0kN4dcJ19Ow1ceuBEQfKiUYtgJ8KZQRLu90zA=;
        b=eIrOLqyXknNtzc9ffxg7ObJL7dGgbVVkQ+JLPsbYyG2ZlvkyDeFlMcG41wfuFgiR24
         BuCxAvAEBnHPl3IZrYOwDbXEv6AAafn7GBvyai8Tjt8G+XAM9eLGmoQY8eFE4AIgtI1Z
         8wsfKhCSEB40wmQAqP11GgmCvFvorSydZDSUFK89+oxlAPgrb5hDwc8Vm4tPDdOzjpZA
         B2ZS/zLHg2QbJ26Mr6c3D6dlAnDOAQTzdTYIcHj4f7bCI8LFWF820yveSbg5dpxQe8uR
         n9P+2f8uM2wqvpINR3ZnoHNUe/0Ruy5cH2iA0+xfwS9paiNnLwaES62vmonXzubA9q0J
         aK2A==
X-Gm-Message-State: AOJu0YxcxvSKwkkQD3gDGf2LAORThbqnxSNQK6XcNGI7tbx6GR5un5nV
	RPWIA4lAocEdK7lywSFeH28bWg==
X-Google-Smtp-Source: 
 AGHT+IHOfqxAei4iLmLAMcsBFKePLmqMHOvd2JuyfofyNDEoVDltsc/kP1OjmEoERRPKcIoS7BlNaQ==
X-Received: by 2002:adf:f387:0:b0:332:e61d:4b84 with SMTP id
 m7-20020adff387000000b00332e61d4b84mr7953763wro.21.1701163153992;
        Tue, 28 Nov 2023 01:19:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id
 d15-20020adff84f000000b00333097fc050sm1872064wrq.1.2023.11.28.01.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:19:13 -0800 (PST)
Message-ID: <4729f36a-2cf8-423d-87e1-1733a9062bd4@linaro.org>
Date: Tue, 28 Nov 2023 10:19:12 +0100
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
 <752f5347-703a-4b38-b2b1-3493d270389c@linaro.org>
 <91528bf4-c971-415e-afb4-51791c6dfc91@linaro.org>
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
In-Reply-To: <91528bf4-c971-415e-afb4-51791c6dfc91@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5ZSF564IQR4LKY4GFST7CSBMBF45UFAK
X-Message-ID-Hash: 5ZSF564IQR4LKY4GFST7CSBMBF45UFAK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZSF564IQR4LKY4GFST7CSBMBF45UFAK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/11/2023 10:17, Krzysztof Kozlowski wrote:
> On 28/11/2023 10:14, neil.armstrong@linaro.org wrote:
>>>
>>> Here the device exposes its version in registers, so you can easily rely
>>> on the compatibility. That's also the case multiple times talked on the
>>> mailing lists.
>>
>> ... you're right here version can be determined at runtime.
>>
>> But, since both are compatible, there's no primary part number, right?
>>
>> so why use "qcom,wcd9395-codec", "qcom,wcd9390-codec"
> 
> This one, please.

Ok

> 
>> when "qcom,wcd9390-codec", "qcom,wcd9395-codec" should
>> also be valid, so in this can why not use :
> 
> Could be valid, sure, but we are humans and we treat higher number as
> something newer or bigger, thus previous one feels more natural. There
> are examples of this way, though.
> 
> 
>> "qcom,wcd9390-codec", "qcom,wcd939x-codec"
>> or
>> "qcom,wcd9395-codec", "qcom,wcd939x-codec"
> 
> This not, because wildcards are not allowed in the compatibles. In the
> past there were examples how a wildcard stopped being wild, so guideline
> is: just don't use them.
> 
> Best regards,
> Krzysztof
> 

Thanks,
Neil

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A739D9069D3
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 12:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299D3E66;
	Thu, 13 Jun 2024 12:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299D3E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718273976;
	bh=YUvQFJH1xmyseUhBIv/gGjLJET5MmLDldQznxc2OK4o=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LGCZIZdXW5YSkBtpi19VArWgYCULgYqfo0wTmYOe3EPpeO81ARNeATHDcSvz13caI
	 Rzu31myhi+K1+uZDS+1BIx8WDMRwxEoYB+AQnU11KIt4wx1ZQ/gCTsLC53E04txS+t
	 h0APQU20qUfTe+HBg+bCwXWJqbxx7CJc14rRP9JM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ABAFF805B3; Thu, 13 Jun 2024 12:19:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5665F805B3;
	Thu, 13 Jun 2024 12:19:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDFC9F8057A; Thu, 13 Jun 2024 12:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E494F80578
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 12:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E494F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DDbORvcN
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52ca342d6f3so366083e87.2
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718273921; x=1718878721;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz8Jr9tAelbj0mz7l81bvUL2cfeH6O4EAvWrEVqr2pk=;
        b=DDbORvcNG9Vyo5YvMMpv8AbEnjJ3DZ/ljRKR+5JxNONWcl5egrlIXVchPfblwMI6Ju
         CpA7M1NgoN2708jHkzCiRXCoKZ1nTN6dsZkwxwFptyjr/raEMsFZPibReSDWhVgfZ363
         /AxHfk0rUEj8iG7ti6d2ipnt4Z9tr+jt4pioYKc4Jli6Li0jEFyZGq+bcR+6QnKVWV6I
         QID5jgHs7cN1s9+YjmweOk2TnmMnqldETXX9quF0+tj9h1xhOsciyfKone8z97FWehC9
         Mew8jM1DwNb+Gbr/LrtNgUnjColvNt4XI6tbWRwJJWKMBG4BWaxwA0q6ivgHoxedw8Wm
         WTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718273921; x=1718878721;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gz8Jr9tAelbj0mz7l81bvUL2cfeH6O4EAvWrEVqr2pk=;
        b=XxfU2GQyGIayIXAFifpFPvfSyOowKrNeI73QwI0GEIKIJmc6MCxSfGUp0eGeVadVBF
         lHuA5AoBf+6Exw0eq4KrJkqDm7Uo1PApsLQGDMn2hWn1ZkOeefyrMaj+xLk3mqP3E8w3
         zYXSaqwQaZdyVJbgIPx/hf4vSq3ANtBCDJujHPYGVotbFQJynTmR6iofrQ2WKKFC+2rt
         oYflhiSLJsHc9Lb/6e34f3X/5OWe972DUDorzRv8ED/gOVau28s5SVZccVA4aponuf7z
         9oNhyG7Y0nC5Dz6dSHqEIRiEdAh+O4kIR7BO8bP2U2qLa1OGYT6kIua8bYL0U/Mad8ZE
         qHiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7dLo5gMnZOqvyRdQ4gALl2QC4hZrdEVmQp/RziYj2zeFFGbRDcwW3gbzX2WOEz6mOaOzpBqrp98xfZpewjEq1s/Rpy3uRwMg/evM=
X-Gm-Message-State: AOJu0YzHUjlj0hLvINQocgmqSI9n0/R4hkHb4NVNcLm42hD044JOonuq
	D6J4w74+YLolfPsW33MJXYSeV9pe+KHsk7Jb7/Mvw9qjJqV2Iu82QoJXat5UMr0=
X-Google-Smtp-Source: 
 AGHT+IEbD7oLf2BGEVhBB1lM7YbvXMhQDVXURKeZcbq+vbGXByyf1yn3I2TC3HslUJg3wVBZrQ9hmA==
X-Received: by 2002:ac2:518c:0:b0:52c:247d:2cfa with SMTP id
 2adb3069b0e04-52c9a3b8da6mr2924093e87.13.1718273921419;
        Thu, 13 Jun 2024 03:18:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7d7b:a9a3:893:f3c7?
 ([2a01:e0a:982:cbb0:7d7b:a9a3:893:f3c7])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874e73b1sm57037815e9.45.2024.06.13.03.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 03:18:41 -0700 (PDT)
Message-ID: <9d7285d2-0dec-4d6f-a3f2-1490261c7206@linaro.org>
Date: Thu, 13 Jun 2024 12:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/2] ASoC: codecs: lpass: add support for v2.5 rx macro
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: perex@perex.cz, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 krzk+dt@kernel.org, krzysztof.kozlowski@linaro.org
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
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
In-Reply-To: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OL64TW4SP4UDUZ3PBCX4JRSUGZIUEGVL
X-Message-ID-Hash: OL64TW4SP4UDUZ3PBCX4JRSUGZIUEGVL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OL64TW4SP4UDUZ3PBCX4JRSUGZIUEGVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/06/2024 14:25, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patchset adds support to reading codec version and also adds
> support for v2.5 codec version in rx macro.
> 
> LPASS 2.5 and up versions have changes in some of the rx blocks which
> are required to get headset functional correctly.
> 
> Tested this on SM8450, X13s and x1e80100 crd.
> 
> This changes also fixes issue with sm8450, sm8550, sm8660 and x1e80100.
> 
> @Neil Armstrong  can you pl test it on sm8650
> 
> @Krzysztof Kozlowski can you pl test it on sm8550
> 
> Thanks,
> Srini
> 
> Changes since v1:
>   - renamed all 2_6 variables with 2.5
>   - expanded checks for versions from 2.5 till 2.8
> 
> Srinivas Kandagatla (2):
>    ASoC: codecs: lpass-macro: add helpers to get codec version
>    ASoC: codec: lpass-rx-macro: add suppor for 2.5 codec version
> 
>   sound/soc/codecs/lpass-macro-common.c |  14 +
>   sound/soc/codecs/lpass-macro-common.h |  35 ++
>   sound/soc/codecs/lpass-rx-macro.c     | 565 +++++++++++++++++++-------
>   sound/soc/codecs/lpass-va-macro.c     |  29 ++
>   4 files changed, 488 insertions(+), 155 deletions(-)
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Successfully fixes dual channel output on headset, previously I would only hear
sound on a single channel.

Thanks,
Neil

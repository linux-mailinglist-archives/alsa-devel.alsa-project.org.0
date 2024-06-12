Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CCE9058BF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D472EB1;
	Wed, 12 Jun 2024 18:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D472EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209608;
	bh=OUH8r7nm7X4nzLEM+Gx/H8Ae5zfR46RGnrG2zg0KtaA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rda6qWPyFGXPzjQa/SctOBL4cglaDkrZ+1MpKrHJh9SgdzQ6mW/Dk3MlQIAvnMTgj
	 i+zAkZKf5Ps2ykIlEJT11VN6Bjc5+9BTV9EIu2yQ5nRoPQTQaJ01HDW2Zj5fFjINfR
	 m3/GNItIVAf8snwjDYQiI3jwHnMOfWm/qg4/AWCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41E1AF805F0; Wed, 12 Jun 2024 18:26:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFBD6F80608;
	Wed, 12 Jun 2024 18:26:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C23ACF805F2; Wed, 12 Jun 2024 18:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA6D9F805EA
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA6D9F805EA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=R58n4r8Q
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42281d8cd2dso465355e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718209557; x=1718814357;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qs3pRP5kMn8rl5PB08ax90BdQl8ujqUfgl1Yv7Tm4AU=;
        b=R58n4r8QJWkmH5ZMT8wY7tvl9SjkbFPrzvAmMGdP8pctTbZd55zGaCjib34LLD0AGR
         VK2gm6cT48nw104RtBsNIFrHWSbVu9TkbjCTR0J7vQJwtiCsWfar7HC0ldG+fnKTsb1R
         9l+Ct/gWUh8EJ1swSmLD+ZwrbKCm+bwpRyd2rNZFVOxePBVbFfyx3HRJ3Pl0AKerBnhD
         b/3yiWLeukZImBIP/b9QjVlhPQKRB2g4xUWaGaGW1Hm1zEWuglX59VIIZDDKffpyBYd5
         1FhOUQ+ahEoDQNYnCg3N4C5eRzj8jK0u+aiiX103CH5sTHUqZEqH0xaGOMBu9Uc1mtal
         zd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718209557; x=1718814357;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qs3pRP5kMn8rl5PB08ax90BdQl8ujqUfgl1Yv7Tm4AU=;
        b=Sxo6S5C5qlyqQs2FT1p815Y8aTjuowmqxMb7aJmvYXR0QDSwvwVgqLcfdOCnet9lHi
         FCO2GLWxWYsOxlr8PHl35JFfIjsSbEsdGurnMHBS7tksTNSncHpFGUqXQEyxD5zVhCl9
         JsngmcW5hEE2NMAdhnSXHDdhh/ozb65helVCYSLq8Pteld8oren1O3Dgh54SE6Z4qTLD
         pBWMnuSIET6eOF8EluO6Wd6gWglY9WlGjjT+5yaUPIK+CzChyp0S0bEEhmgGqPng4XE+
         O0nV24e9bEC6i7BEn/Tl5EWxh+bG3eKs4V8c9ch1pWLffB0nosS0hZZ5/Tb2j0zhr1Xq
         vSGw==
X-Gm-Message-State: AOJu0YwMoV6QQtO2jSsm2t9CaPYE3erCrADb++gZhrSmMfOi9ab+WL3F
	LPAMsWlKAQsNeJq2e7McgZoSzFFoCPS2dBBSz562TpUaLy+c5J5O1fATNtAcT1M=
X-Google-Smtp-Source: 
 AGHT+IE7UzmRmGpStIY9W0Tm1pW+g8Hn+VED4MtUAMIa4Y8YYdZAVgW7/F0NlfTjwqNHthlaxXQQ3A==
X-Received: by 2002:a05:600c:3d94:b0:421:819c:5d76 with SMTP id
 5b1f17b1804b1-422862a77a1mr18654405e9.9.1718209557332;
        Wed, 12 Jun 2024 09:25:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb?
 ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870f0c65sm32402695e9.27.2024.06.12.09.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 09:25:56 -0700 (PDT)
Message-ID: <ba14fae0-a0d3-41cb-b24b-0ad8cdbb1e5c@linaro.org>
Date: Wed, 12 Jun 2024 18:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 22/23] ASoC: codecs: wcd939x: Drop unused RX/TX direction
 enum
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-22-0d15885b2a06@linaro.org>
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
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-22-0d15885b2a06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 465OPN2X2VX74EZYN5WDIO5ZDAHK6HKK
X-Message-ID-Hash: 465OPN2X2VX74EZYN5WDIO5ZDAHK6HKK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/465OPN2X2VX74EZYN5WDIO5ZDAHK6HKK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2024 18:15, Krzysztof Kozlowski wrote:
> The enum with RX/TX soundwire direction is not used.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   sound/soc/codecs/wcd939x.h | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
> index a6c9c6cee056..0aa4d9d542c6 100644
> --- a/sound/soc/codecs/wcd939x.h
> +++ b/sound/soc/codecs/wcd939x.h
> @@ -903,11 +903,6 @@ enum wcd939x_rx_sdw_channels {
>   	WCD939X_HIFI_PCM_R,
>   };
>   
> -enum {
> -	WCD939X_SDW_DIR_RX,
> -	WCD939X_SDW_DIR_TX,
> -};
> -
>   struct wcd939x_priv;
>   struct wcd939x_sdw_priv {
>   	struct sdw_slave *sdev;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

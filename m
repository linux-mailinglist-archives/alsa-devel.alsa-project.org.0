Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A34449145FD
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 11:14:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C12E84C;
	Mon, 24 Jun 2024 11:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C12E84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719220469;
	bh=ufsRwuU40L7G2oCl+wF6UjtXIgQPePYuv6wBpl0bUqc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q2jJbzuONpIKF3KbQ526+rsBAYy8XpT/bxa2h3VowVuOXi1yFLJOKkujDPb5eFLcL
	 74XSDuf9FeuVrCP6xahdxffhzQhi0jBQfMq2vyKT30qW02u/YbrM1cFqdNyHqIpuqY
	 ctO0Sw9rAYQhdJGDs+eXfy0AzqiHKIG6q1ykBsmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE11AF805BE; Mon, 24 Jun 2024 11:13:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B35F8059F;
	Mon, 24 Jun 2024 11:13:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAADBF80423; Mon, 24 Jun 2024 11:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E68F5F800ED
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 11:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E68F5F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KV/+NSJ9
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52cd87277d8so2440916e87.2
        for <alsa-devel@alsa-project.org>;
 Mon, 24 Jun 2024 02:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719220426; x=1719825226;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOevBNkVhYIcr8pbBqOPvOA/lrQWJ845j8cyO+bYz2I=;
        b=KV/+NSJ9zX3xbW/8jTB9DWEZZBVJp2zgFE2j+yeEFbZWnoxzOXSka37Bghwe1iEuDp
         5EhrZ5S00go2eB8LPsVimEjd0mI+V+idt29h/ldslEBzdpxZneuNuz+zB7+++T2q4vRe
         QRNbMCRNGLgibfNV1N9qSWkFjZ86afijyyr8qrI0qJVW4mvrz29k6grIit26QxwVE4Aq
         I8waFEO0gVZvbEs8+QbFfcTV//TzsyuMugC/Z7JeWnEWqEffF2DUrMfUx5ZlKzYaiofu
         XdrvyvGPAHgGn8HAKJQZFh+6Ujd03sbevIiQdab1ilxdlHi4UX+KBCoDzWbwDQG6FWDf
         TQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719220426; x=1719825226;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oOevBNkVhYIcr8pbBqOPvOA/lrQWJ845j8cyO+bYz2I=;
        b=KyYKb1DXgXK9wPml9P0d9QQuPgt6hsfXvBUACJbsRC9XPvO54AUPiLaEfY6V/CcLCf
         +pidSBWEfFhutEOOzXmlJz0HbyNrT8UUqoU0RhbCkifER5eHOF9Cj5Qrf8piSLbsTxGM
         GbtnQPLWK5nt/OFMDEsSXmACE5cetAtiOZGXuBrob+V0LNO/Vkfc7J6Fhqqk/yG/7N2t
         izOWzOJTynRxM04F8XrjBhbQzrPpMmD4a0sj6rphrnqIiy3N4SAQprjT87j98knciYBC
         b4NRgSHyajxwaElKmqV4SCACgtFK214c1bo7EhSv9BWktFXmQDTuD4kYY3ZV7pyCF0yD
         rQIg==
X-Gm-Message-State: AOJu0Yyv8TLgzydlAheqE9JYMVI5fuaA62uRzf1LbFnv51xcT9L8thT1
	mskVNGhng3afYzIFozpT+J44J5BSJPNzXl2H3G9okj04Q/KD9HHYtNYpugcZc/s=
X-Google-Smtp-Source: 
 AGHT+IFT6E3/HxWZCXNTGcsaZvG14/jf6JozIKOheCtzxeEIMVBx7L3FWBo7hjcvHrXO1eRjGh6JeQ==
X-Received: by 2002:ac2:5633:0:b0:52c:d753:2829 with SMTP id
 2adb3069b0e04-52ce1835212mr2238989e87.19.1719220425922;
        Mon, 24 Jun 2024 02:13:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74?
 ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424817a8ec8sm127741265e9.11.2024.06.24.02.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 02:13:45 -0700 (PDT)
Message-ID: <5318f6e2-7bb2-4ed5-b0aa-585a6a2d8a5d@linaro.org>
Date: Mon, 24 Jun 2024 11:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: amlogic,gx-sound-card: drop minItems
 for audio-widgets
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: 
 <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
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
 <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LPUKTTFHB25G4D6C4QBRDWY7GU7QGVRH
X-Message-ID-Hash: LPUKTTFHB25G4D6C4QBRDWY7GU7QGVRH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPUKTTFHB25G4D6C4QBRDWY7GU7QGVRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On 05/06/2024 11:40, Neil Armstrong wrote:
> Like "audio-routing" drop the minItems: 2 from the "audio-widgets", because
> any limit here - lower or upper- is rather meaningless.
> 
> This will also fix `dtbs_check` warnings like:
> sound: audio-widgets: ['Speaker', '7J4-14 LEFT', 'Speaker', '7J4-11 RIGHT'] is too long
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> index d4277d342e69..0ecdaf7190e9 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> @@ -23,7 +23,6 @@ properties:
>   
>     audio-widgets:
>       $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> -    minItems: 2
>       description: |-
>         A list off component DAPM widget. Each entry is a pair of strings,
>         the first being the widget type, the second being the widget name
> 
> ---
> base-commit: c3f38fa61af77b49866b006939479069cd451173
> change-id: 20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-00e1afcda10b
> 
> Best regards,

Gentle ping !

Thanks,
Neil

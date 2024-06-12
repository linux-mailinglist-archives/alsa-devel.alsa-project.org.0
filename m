Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D479058C3
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3639814EB;
	Wed, 12 Jun 2024 18:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3639814EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209623;
	bh=KRtJmgKGaGlE/Ies5zn5gjl/1GbwNz2EzvchmHQy87c=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SPfQQ+sVlNFzlI08b1RayS588cxX+RLa7YCFahCrlHQJBbAezdbcJ6eMUShvBcOFR
	 ++uhlQyMd2SvP8B4ypPvbsJ+AMoO8gWhSfQ4LTcDFWcCwPak6SceX8F1PJO6KP59/P
	 XluVk4nTe+VqtdC7OC3hw5HQE62h4XFq1PoX3A3c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BA6BF80613; Wed, 12 Jun 2024 18:26:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD26EF80617;
	Wed, 12 Jun 2024 18:26:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F59BF80606; Wed, 12 Jun 2024 18:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E2D0F805BA
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E2D0F805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=E8w3rQRo
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eabd22d441so112688241fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718209564; x=1718814364;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4CzpWsbxSKz1roonYzk0gRK2GwO4Ov8gCgr8aeKewE=;
        b=E8w3rQRoSfWbUn1Wap4vKvIRYma28sqVTJW2zbXLUxGpph+ivKirX4HlJ8bZmm3qQy
         XGZUbTzbJ8V2gMxiMEVB/+KTnP7X5ekDIbR2wBwz7UNeX7xWMzDvIfBLn3yOB85C6Ykq
         MDYtqnAOE+0Dtyw4PCd3YECJheIXDSWYH8MLKjD6rmzBMo8uzWV6PiLnBkPPtNZBNLNZ
         UmHJP7X+LBsJFqF6eEHzTjRaM3Uqm9nLT04JJGqd46G1yMY/6+c8AyGlmVOzDemRCT8c
         0vseHb4wOeKIMZMoxXn0Z5OlddFWRbJqemSDWnX6nJVlKoE7OZsdbcgcrik1VjIG2SYP
         T3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718209564; x=1718814364;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B4CzpWsbxSKz1roonYzk0gRK2GwO4Ov8gCgr8aeKewE=;
        b=jmTrNzyNtRKQz2NKJC+dhblStj3dm7OM5peMqSEeZa75Ix7CXgcYhFyuE8dowfrUye
         nWv60fif0ZYWWjC+EkRdkcY/Tcc/Wr+lIg8uPzkeyi5BuT3dDZAxCG2/aRE+dIbdNBnr
         o0Myrz96bhYycXveJ0KFZoczt5iC/5XrVC7sJoeGUjRnbIxpOMKaR0LRU1TFyZJxtJ0i
         nH4xun0YHxHGvWR4Hn6D5vpLI8fPOJ44VH3Tdcby+8NALfLU2No9PUm96JkekggG214q
         LUnXNlTALK9JQoyrMoHgSRxBHfuaCZVFZozlS1I7Xm4aTwMYcGssOsXPnnUhV37mMLtT
         w85w==
X-Gm-Message-State: AOJu0Yx3XbVuasLkbi85CJAke1G1rEh+qtspadXiJ4SNW0VgUYUy0Yvo
	WRya3LbbHq1hlHzTdWnsCgApcY9aPmcCjULJZhgeXVObB5S2lu633S5NcPnZQ9g=
X-Google-Smtp-Source: 
 AGHT+IGlKKg9fhb0xZHGfo3tji+wvOb/OIXqd/ZTK5BzeZKQNp3X5O5tIeFGZyOPNdpWG+Yi3le/Ig==
X-Received: by 2002:a2e:9449:0:b0:2eb:fccd:fc12 with SMTP id
 38308e7fff4ca-2ebfccdfd24mr17385251fa.2.1718209563913;
        Wed, 12 Jun 2024 09:26:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb?
 ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870f0c65sm32402695e9.27.2024.06.12.09.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 09:26:03 -0700 (PDT)
Message-ID: <828ff7cc-462d-4433-ab68-ce139a31fa24@linaro.org>
Date: Wed, 12 Jun 2024 18:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 23/23] ASoC: codecs: wcd939x: Drop unused num_ports field
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-23-0d15885b2a06@linaro.org>
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
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-23-0d15885b2a06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WYIICKPOXMYXFMO6GZIXPTK4WJI4OZUD
X-Message-ID-Hash: WYIICKPOXMYXFMO6GZIXPTK4WJI4OZUD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYIICKPOXMYXFMO6GZIXPTK4WJI4OZUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2024 18:15, Krzysztof Kozlowski wrote:
> The driver does not use few 'num_ports' in 'struct wcd939x_sdw_priv'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   sound/soc/codecs/wcd939x.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
> index 0aa4d9d542c6..1571c2120cfc 100644
> --- a/sound/soc/codecs/wcd939x.h
> +++ b/sound/soc/codecs/wcd939x.h
> @@ -912,7 +912,6 @@ struct wcd939x_sdw_priv {
>   	const struct wcd939x_sdw_ch_info *ch_info;
>   	bool port_enable[WCD939X_MAX_SWR_CH_IDS];
>   	int active_ports;
> -	int num_ports;
>   	bool is_tx;
>   	struct wcd939x_priv *wcd939x;
>   	struct irq_domain *slave_irq;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

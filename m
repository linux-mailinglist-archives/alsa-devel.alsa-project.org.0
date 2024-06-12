Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07A9058BC
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:26:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E519DF8;
	Wed, 12 Jun 2024 18:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E519DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209597;
	bh=kazjMwMPM7+BaE98JZalJ0lO49ZQxBkOr/z5sxs65no=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WGZxPfW19gV0DPjGoWBr6AXed7LHXYsjwFZIK0RCOibQ/0FaFjYbru6mSIolJtii2
	 +tyfI0qqLre1D3whc/t+tgfkwXLGZ2V+FAxs3UYHzFTiTP82evgkmCutgVIqo9O0tz
	 l2tlUUgNGU4KnNu35p6Q3VeA8c3qx+LdYeE4CM2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A627F8059F; Wed, 12 Jun 2024 18:25:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 902CDF805E4;
	Wed, 12 Jun 2024 18:25:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D700F805D3; Wed, 12 Jun 2024 18:25:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 445CBF80580
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 445CBF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xY+BMpOH
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42179dafd6bso7619885e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718209550; x=1718814350;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2np9w3QHSPJqnM8MM0Xd2cDLW2LnmlXwKByUrOyRVR8=;
        b=xY+BMpOHdRCWjU+be1IG+cne2jbk/tOqw5sBslqHICqhjey3YlusahaX5zw19ZZ9DW
         oTza9yusWVwFKe4cwqx5WNWIw1nvujZasZXF4bQkllcINmxOaYrZKRkIeFjGp4xJ+mlZ
         NOEaCbGehSt9dLP4QWwfoAn9PwgIASYxODYUmpsucZld0izRiliV1NOgTtpEcAvMCMQn
         C7Aod6QsPP/RKEKPyE/Lay8XJLY1jo5a1/H6mukTxG292ViJCFUvKF8W8eopwoENACh0
         PfOhegDAUT+lvnd7BLGbPMPouBQ10bFmIZTx8nj9AspwLFt2P12HASdDViev0Wm5Id+C
         gNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718209550; x=1718814350;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2np9w3QHSPJqnM8MM0Xd2cDLW2LnmlXwKByUrOyRVR8=;
        b=uRUKzPYVhaJZbUjPj4BYjC7GMhHxs81fEphzCEfW1BNMrxT4M0+O8PLd4v74rt36R5
         ZPpzvpro2bIP0geU0Wh07/nKqQT2F2q+8nlBFCZNccAXq/rreQNHMQcCpZCQ/hYRLHcz
         dfrvZCFjJTqKDY01d6utN1dExnjzYU3f0CVqWLnV7WzdpXEw9Oq6lRvXAFiKh5w2d48E
         28nxcy0NPVWZzyEOWMuUL+nGc7nIibKhJhC979xoe5Hpla0kILL0ofmu4Kac/kU6a9z3
         GmKe4xs+7VVY630m+rkLHqS50eu7A92APUiagSAkzjcYaeT4qxDircr9l5XHR5GyTb81
         fxpg==
X-Gm-Message-State: AOJu0Yz0ujKMXO+VGOdMQDbNQV1mnCa2GkutrXc4Hugg9EG9HU0nDeY6
	gzU5n64W344PtFyYfWGyjgbzH84V/335UPQoShn8HyE0ehOxkcnmyQ6qntV2/OM=
X-Google-Smtp-Source: 
 AGHT+IEoQt3WNR7/jM2T/i1+onUQqJAvvVpdcAZwjdoKF5deS673rFKH/q2DZsR29dudBOG0pHLyAg==
X-Received: by 2002:a05:600c:46cd:b0:422:291:6b3e with SMTP id
 5b1f17b1804b1-422b6dc8178mr1963445e9.1.1718209550085;
        Wed, 12 Jun 2024 09:25:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb?
 ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422871f8eb4sm30654665e9.39.2024.06.12.09.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 09:25:49 -0700 (PDT)
Message-ID: <441e083f-6565-4b75-bb45-a153d2ba439e@linaro.org>
Date: Wed, 12 Jun 2024 18:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 21/23] ASoC: codecs: wcd939x: Constify wcd939x_sdw_ch_info
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-21-0d15885b2a06@linaro.org>
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
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-21-0d15885b2a06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TR35LWXBGH7RAUCHYWSWG43ILCZOKTVI
X-Message-ID-Hash: TR35LWXBGH7RAUCHYWSWG43ILCZOKTVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TR35LWXBGH7RAUCHYWSWG43ILCZOKTVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2024 18:15, Krzysztof Kozlowski wrote:
> Driver does not modify static wcd939x_sdw_ch_info array, so it can be
> made const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   sound/soc/codecs/wcd939x-sdw.c | 4 ++--
>   sound/soc/codecs/wcd939x.c     | 2 +-
>   sound/soc/codecs/wcd939x.h     | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
> index 8acb5651c5bc..94b1e99a3ca0 100644
> --- a/sound/soc/codecs/wcd939x-sdw.c
> +++ b/sound/soc/codecs/wcd939x-sdw.c
> @@ -23,7 +23,7 @@
>   
>   #define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
>   
> -static struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
> +static const struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
>   	WCD_SDW_CH(WCD939X_HPH_L, WCD939X_HPH_PORT, BIT(0)),
>   	WCD_SDW_CH(WCD939X_HPH_R, WCD939X_HPH_PORT, BIT(1)),
>   	WCD_SDW_CH(WCD939X_CLSH, WCD939X_CLSH_PORT, BIT(0)),
> @@ -36,7 +36,7 @@ static struct wcd939x_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
>   	WCD_SDW_CH(WCD939X_HIFI_PCM_R, WCD939X_HIFI_PCM_PORT, BIT(1)),
>   };
>   
> -static struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
> +static const struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
>   	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
>   	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
>   	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 1f94f49f9829..66af035bd0e5 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -414,7 +414,7 @@ static int wcd939x_io_init(struct snd_soc_component *component)
>   	return 0;
>   }
>   
> -static int wcd939x_sdw_connect_port(struct wcd939x_sdw_ch_info *ch_info,
> +static int wcd939x_sdw_connect_port(const struct wcd939x_sdw_ch_info *ch_info,
>   				    struct sdw_port_config *port_config,
>   				    u8 enable)
>   {
> diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
> index 756f497a337c..a6c9c6cee056 100644
> --- a/sound/soc/codecs/wcd939x.h
> +++ b/sound/soc/codecs/wcd939x.h
> @@ -914,7 +914,7 @@ struct wcd939x_sdw_priv {
>   	struct sdw_stream_config sconfig;
>   	struct sdw_stream_runtime *sruntime;
>   	struct sdw_port_config port_config[WCD939X_MAX_SWR_PORTS];
> -	struct wcd939x_sdw_ch_info *ch_info;
> +	const struct wcd939x_sdw_ch_info *ch_info;
>   	bool port_enable[WCD939X_MAX_SWR_CH_IDS];
>   	int active_ports;
>   	int num_ports;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64C91A722
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 14:59:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31210211C;
	Thu, 27 Jun 2024 14:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31210211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719493168;
	bh=BFJqvvwzgXTKnp7wUm5ylIIF+ac6I/VvpFUBscUMLaQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nyfeZr7+KtEshk2o/3+mN2aEmvzBc+bY5EhZfXWS86ktD0UBF/AaWri4cVZC05WwO
	 81kDCBBXIPLxkp9We6naTtz1UQokH9nHVMsmeAKTlba/Y5Gs7JsN3Ai2phcc9r0M4v
	 o1AkctenW2dPAzbhQ6//qwdbRhrk1jLUvnOH61nk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AD82F805AB; Thu, 27 Jun 2024 14:58:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E66D5F805A8;
	Thu, 27 Jun 2024 14:58:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75709F80423; Thu, 27 Jun 2024 14:58:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36F90F800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 14:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36F90F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S0PYM4/S
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52e764bb3fbso237413e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719493128; x=1720097928;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggWXmRs7jIjON8UjWfc25bUS0kEkQZXlxcRlo0AHzgg=;
        b=S0PYM4/S1mqN/SNtZh6G3/KVJb3Ksjg68QoUj9TlXJ/GPNbMgkWJBcNudDXkW9u0kB
         RO9kJpTM6cOZ+o0GXRwBArWDoSEhEzVD3Lbiwk1HrDqnxwseFcfZxo1UHrZRM73K/VkZ
         D8vA19t8JFAx8tMSjOpz/q6PiJA87zPHeZnKnSP3IOzXDEVJ8V5eRhoIL0aQGzm7QD2I
         yLpzi+Kim/GL+MbxzZcjzj7+/50ySR15z+FN2NVDIneFkeRSW6Xh6PHh9L0gWsBzJbLf
         zYvZaRoMnmoTL+TQRpAJ69tio6SUEz0icpk7um1Q9hB1tMRByKrNe2IIyNOIpaGGjjC+
         EKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719493128; x=1720097928;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ggWXmRs7jIjON8UjWfc25bUS0kEkQZXlxcRlo0AHzgg=;
        b=CC3SdjLWlrIbzFljkmfhMrmEvXkI9gNLxaIZXwbQJkviaoNaiGegm52QwZrOcUciFs
         sCJR/x7OfMUq19wXP+Cb9t83c5+to1tMYJFBi+c6dqvvE/SnXVsztGbxdZEXfPNsGYzP
         lWhq7N/NiyhM9J9zn276knOOLo3V9i4BkGwuwv0Cm6yyV9qIXTWbY2xYyRgeOIcReViG
         JpuTWdASEDF6/33fwl8p1HuuGTvUS71bCKk41Qq5kYkkYV1WgMZQnM5190POTbynhzSz
         sgLgxPNM4RuujkhsUrj0XnJQWbLxxT8tKMLBWXgdEuDUeCJUgUlJOEnQoa09BVBhhPYf
         iH6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkZ37QqACBWVLAPxbs0aKsQpTEnqYvxPaCUlmyTpsszhY5hDrArMcL40ClUgP50a877wpkYH4wBMahtRs3g++IUkRoT2T0OfsQUkg=
X-Gm-Message-State: AOJu0Yzx6dv3byDUC8sAtDhV+niqu5kCVqggU4pgAy1uLoBJzILzihCL
	W/LZrjg6VS+Jb5rQ/X7B2KUc8PpGIvTzeDkln+uhitOBHId5p/viJTzxAoB06sk=
X-Google-Smtp-Source: 
 AGHT+IEiqcyM7j5d8vMA37q8FTy4bbA4eRCNMZ56T3o6exzKO9FDtm3+D1xRJ3+j2E0oItZOMaGibw==
X-Received: by 2002:a19:e043:0:b0:52c:e121:c927 with SMTP id
 2adb3069b0e04-52ce18647f7mr8070668e87.62.1719493127407;
        Thu, 27 Jun 2024 05:58:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a?
 ([2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564bc59f5sm26436015e9.42.2024.06.27.05.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 05:58:47 -0700 (PDT)
Message-ID: <bfc333a1-52da-4e4e-9917-09840ac5ebea@linaro.org>
Date: Thu, 27 Jun 2024 14:58:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
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
In-Reply-To: <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4D3YSPJT5K4L3JVDPXSLKZAWHIOB5IHP
X-Message-ID-Hash: 4D3YSPJT5K4L3JVDPXSLKZAWHIOB5IHP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4D3YSPJT5K4L3JVDPXSLKZAWHIOB5IHP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/06/2024 13:55, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> This is required for correct port mapping between soundwire device and
> master ports.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/codecs/wsa884x.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index a9767ef0e39d..72ff71bfb827 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>   	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
>   	wsa884x->sconfig.type = SDW_STREAM_PDM;
>   
> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> +					WSA884X_MAX_SWR_PORTS))
> +		dev_info(dev, "Static Port mapping not specified\n");
> +
>   	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
>   	pdev->prop.simple_clk_stop_capable = true;
>   	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

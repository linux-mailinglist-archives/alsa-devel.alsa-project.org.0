Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7AD9058B8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:26:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8438F52;
	Wed, 12 Jun 2024 18:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8438F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209576;
	bh=FT83dq8fnS6WPxhKs0Oumh8BckGwGE03RYf9ON83b5A=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vuFhpXr9I9cGZqpk4yfrhnrHfXyyQp72jbUL22g78IqVb46bUdrWqHMHaKMVnjwCQ
	 xn3fyMjyBD6tjGtfNMjFvFfOB0UNqRMU0wQcPloY7Vid2H9YEg7wqy0tNbC04yiP9A
	 uUgeC2QsqhpzolsXzoShlgDvirqLeqMWLDqZNdeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CDB8F805AC; Wed, 12 Jun 2024 18:25:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB40F805B3;
	Wed, 12 Jun 2024 18:25:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39DF1F8057A; Wed, 12 Jun 2024 18:25:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F2CEF80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F2CEF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NAPuFJ64
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35f1bc2ab37so69400f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718209535; x=1718814335;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1ANCcJt2zk9p6VuqBRwi7LO5EhRrUpz8kaigFnpgMY=;
        b=NAPuFJ642rS4tSUz/gk0L0232atlU4+AmtgZU+vvZI3KsN38IDV7kG2TJGmSJNO8CV
         plS7lFFWWrqhUpp0ldBwpqSQ3mPKKccYFZf43c3YyTQUMhOrexi+fK/0j+b9hL/5KCrW
         2820Y4CjrzMptQRha7PRAVOxVr/7JI5+efse6vK080ZuzuRYyhNA/HyUmHHtKjsr5Ml9
         RL1+cRXfjA3kCkB75yIlqSMuBj0Lz4vQDhqTCvLVgFg0x4L0N43ndh75LzBvOc1UWlxv
         /Mix19c0p+hxi2BZ2gDsCB5T8Qdo2/dhjOCE8YoWnT50Lzx+UQe+JTmTRBq06Oq2wmj4
         YYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718209535; x=1718814335;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m1ANCcJt2zk9p6VuqBRwi7LO5EhRrUpz8kaigFnpgMY=;
        b=hu1KeoU3EVIfPzyOh/u4hARycbVCYQYOyACB38jeYZJjxIqjZtCyEor9+oNABbQ3eW
         ZwnEzMH1U2hLt9UrMkGIeo4qN42Rfs/K/CnYZ0pr2xslBLqM4rPyZ7BU4fsibMEvM98+
         m1kfZegaWn4xId8WOvT/M4dVO/uqf9pyWgj6hfb7Nlt6SWeuJ2Lgq66tuFI5zg1Hq7rk
         sh4vUpEblYxXIzTPo3m6uUZa+MtBG//Kw0inwBMiqRlfrZolWH/fW7b75I+jSaffn9n9
         /eW7qcwVg5peTIqmDU6s1+538t43hKMmRlTupMZKmfW9ZmkVhlTa4ICajw5/+6y3zvXx
         CzGA==
X-Gm-Message-State: AOJu0YzDYDKuR6Y9RgyuWXRvKY7WNbitKmafpeJtxslomX/B6kK1gDWo
	6H3p2FTggvCXgbYkCqDJpkF4KUpuJnTELOBeDjZSvb7JD6fwhqY2WGW8FWPK9axjuCE/8R0XTiT
	Xdkg=
X-Google-Smtp-Source: 
 AGHT+IGBp5CXxO1Cz/MWXSVihQ78PUCPNkBdTASWvuzcisu42OYSf9+4lRH/N7xuULPL4aQq+w95aQ==
X-Received: by 2002:a5d:6982:0:b0:35f:159e:5ec2 with SMTP id
 ffacd0b85a97d-35fe1c0a096mr1403952f8f.39.1718209535199;
        Wed, 12 Jun 2024 09:25:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb?
 ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f2a73fb13sm5968484f8f.105.2024.06.12.09.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 09:25:34 -0700 (PDT)
Message-ID: <ce7eaacc-c5f8-479a-b4f5-9f83515e47d1@linaro.org>
Date: Wed, 12 Jun 2024 18:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 20/23] ASoC: codecs: wcd939x: Constify static data
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-20-0d15885b2a06@linaro.org>
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
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-20-0d15885b2a06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UGWTMSICBKQBR5BJCYIIOD7OUBOIPNNY
X-Message-ID-Hash: UGWTMSICBKQBR5BJCYIIOD7OUBOIPNNY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UGWTMSICBKQBR5BJCYIIOD7OUBOIPNNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2024 18:15, Krzysztof Kozlowski wrote:
> Driver does not modify few static data (MBHC reg fields, IRQ chip), so
> make them const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   sound/soc/codecs/wcd939x.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 72d8a6a35052..1f94f49f9829 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -220,7 +220,7 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
>   static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
>   static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
>   
> -static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
> +static const struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
>   	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD939X_ANA_MBHC_MECH, 0x80),
>   	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD939X_ANA_MBHC_MECH, 0x40),
>   	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD939X_ANA_MBHC_MECH, 0x20),
> @@ -291,7 +291,7 @@ static const struct regmap_irq wcd939x_irqs[WCD939X_NUM_IRQS] = {
>   	REGMAP_IRQ_REG(WCD939X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
>   };
>   
> -static struct regmap_irq_chip wcd939x_regmap_irq_chip = {
> +static const struct regmap_irq_chip wcd939x_regmap_irq_chip = {
>   	.name = "wcd939x",
>   	.irqs = wcd939x_irqs,
>   	.num_irqs = ARRAY_SIZE(wcd939x_irqs),
> @@ -2957,7 +2957,7 @@ static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
>    *     \- regmap_irq_thread()
>    *         \- handle_nested_irq(i)
>    */
> -static struct irq_chip wcd_irq_chip = {
> +static const struct irq_chip wcd_irq_chip = {
>   	.name = "WCD939x",
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235067FB579
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:18:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623941F7;
	Tue, 28 Nov 2023 10:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623941F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701163133;
	bh=VWnRJot2Q3fWtbOF3IWBUZKqS5IDL3ziiN3qHhvZ4co=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b9Bo+ptgRShVMxMHSXPf/4LV64Zjhka7zQrAiuTwLPSAvY4zFgQo9vc0qZeuxjIMw
	 Z7nXORhOm78fDaJabRoFwjKCCyq8TlCjnOtps40S3oG2DX7viHtJjhlWGCVGvfqMGG
	 gMzbVDzSAD0Dxpf0oUdGnPHespudIK4GUf4azRKY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E0DAF8056F; Tue, 28 Nov 2023 10:18:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E4DF8057D;
	Tue, 28 Nov 2023 10:18:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 910F3F8016E; Tue, 28 Nov 2023 10:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77349F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 10:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77349F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XDUU6b3w
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-332ff20ec45so1203806f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701163102; x=1701767902;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alIZsk9jaoixi8xI6abFdPfSRb4k/VWokZ7yMhSkXhg=;
        b=XDUU6b3wec4il1L2XRNjkucMFxN5kuZdH5BYILgR6wfV/8NEwlkdt7UfLYGOQzV4Rz
         ptA3HDIfOCbRjRyVABhZkBa+YiR15KHgD1gfokBKlRF17YitcEhoiwCBojmsJtUwB5Zl
         fsW52nZ4+QVW5wIHragCokGmKRH97JvCuRJsKlGwoZM9O1jpHbdMn/px+THpuAfgKx3F
         2nOwhz7nVYf5su42qEkoM826ejUnlnsckTVkTZ3QsWoUUORN2XnpB10loYoWp8TDJpW8
         93DphRMdAKMXELMoJbc+FKkaTNm+++5CenBAHlJIOJHQlsCtu4P5AlKP4yIc78DEM4wc
         QVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701163102; x=1701767902;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=alIZsk9jaoixi8xI6abFdPfSRb4k/VWokZ7yMhSkXhg=;
        b=Y5TqCFa1m7e5OWGdHswP0OWksQ6/IWxijJMTM1amCpwZGw0bzUaBAoMIg9hDC3m7v8
         yzvwJ1wW2u/dGeJlKYvHmZThDDjPd72i5WME0EWNd1F1Zts7xHGYFW8OhtqEQhWGdb+b
         ZrIc8eGZn4qGvNmb79aNg2iKc9UwGzuNCCF7G292QVErwmE3St9fSfOm9vXdX6Lm8Vu6
         9g/BkMuB+QlyALQ1UWfCqy7VpiKns716HZp0PCf255U/BmQRELx+atvYBQ9+02K0Js0q
         HEhOFdREMEEvlsavYQXBrn/TgunhdEAC6nvRZgBhzyRJQCod2gHn3ySm+7VDxvYE3nr8
         Tc8Q==
X-Gm-Message-State: AOJu0YwhxWt2/T+YNfvDGZLmZ83MZfGvErNX0YZwJaYimp/zDX+Hn4Gm
	e7jRnoJvbxydNmaj2CykVdfxnQ==
X-Google-Smtp-Source: 
 AGHT+IHkb5X1Xurk4Pn9b4ECw8tM2B+jV7V3FODalzw3NAPPM68Wjv1hOdA4wYyt9pnPEtXBgf5GyA==
X-Received: by 2002:adf:fe47:0:b0:332:ca1e:711c with SMTP id
 m7-20020adffe47000000b00332ca1e711cmr11805354wrs.21.1701163101912;
        Tue, 28 Nov 2023 01:18:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id
 d15-20020adff84f000000b00333097fc050sm1872064wrq.1.2023.11.28.01.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:18:21 -0800 (PST)
Message-ID: <df3da44d-3181-43a9-9552-ba7e41c05db8@linaro.org>
Date: Tue, 28 Nov 2023 10:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] ASoC: codecs: Add WCD939x Codec driver
Content-Language: en-US, fr
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
 <ZWB4myckLrpBYLm+@finisterre.sirena.org.uk>
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
In-Reply-To: <ZWB4myckLrpBYLm+@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FRK2JWPFJDWD2UWB7ZROKH3S3QFHTVTL
X-Message-ID-Hash: FRK2JWPFJDWD2UWB7ZROKH3S3QFHTVTL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRK2JWPFJDWD2UWB7ZROKH3S3QFHTVTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 24/11/2023 11:19, Mark Brown wrote:
> On Thu, Nov 23, 2023 at 03:49:15PM +0100, Neil Armstrong wrote:
> 
>> +	if (wcd939x->variant == WCD9390) {
>> +		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
>> +			dev_info(component->dev, "%s: Invalid HPH Mode, default to CLS_H_ULP\n",
>> +				 __func__);
>> +			mode_val = CLS_H_ULP;
>> +		}
>> +	}
>> +	if (mode_val == CLS_H_NORMAL) {
>> +		dev_info(component->dev, "%s: Invalid HPH Mode, default to class_AB\n",
>> +			 __func__);
>> +		mode_val = CLS_H_ULP;
>> +	}
> 
> This lets people spam the logs from userspace, why not just return an
> error?

Indeed, will switch to an error, seems safer

> 
>> +	if (hphr)
>> +		wcd939x->comp2_enable = value;
>> +	else
>> +		wcd939x->comp1_enable = value;
> 
> Are there really no constraints on the values for these things?

Nop, it's basically boolean, so any value > 0 is true.

> 
>> +static const struct snd_kcontrol_new wcd9390_snd_controls[] = {
>> +	SOC_ENUM_EXT("EAR PA GAIN", wcd939x_ear_pa_gain_enum,
>> +		     wcd939x_ear_pa_gain_get, wcd939x_ear_pa_gain_put),
> 
> Gains should be be named Volume.  Is there no TLV information?

Let me check that, I maybe forgot to add it.

> 
>> +static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
>> +{
>> +	return IRQ_HANDLED;
>> +}
> 
> Why even request the interrupt if it's just going to be ignored?

Good question! I'll check this

Thanks,
Neil


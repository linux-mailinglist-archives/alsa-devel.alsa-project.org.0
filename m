Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF97FBDA0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 16:02:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99BDCA4B;
	Tue, 28 Nov 2023 16:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99BDCA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701183768;
	bh=IE/G/i8CckA+o5C3t8ktTV64aQ6Bs1E5ScF/hYmWFBg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UDppSWZXkdieVmDQu2DVtwGhzbkKB3o+CUYM5lUYga2OLab9SK8jcoBmeRHQ5xxrP
	 yJUcHLBjs+TyxkCe1Q56kvpWqh2PW7CDs7x84nQ0Z7aVYBpDIDCHMbqpngKWZ4gIuc
	 iMMqr3239xA43j3s5JG6nes8jmR4Wv61r5nCR+8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D37DEF80564; Tue, 28 Nov 2023 16:02:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D862DF80579;
	Tue, 28 Nov 2023 16:02:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1185BF80114; Tue, 28 Nov 2023 16:02:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C171FF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 16:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C171FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ek8GcEsJ
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-409299277bbso41644535e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 07:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701183722; x=1701788522;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkWu2ySemNB+dH9OL9BeVvXo61wInQDnE0WqBxTBfkI=;
        b=Ek8GcEsJasZUNEEzkDPPJmwJgp7sbwNtA7py5WzElBM0XaRWoAXTi5xA3YZR02fz1v
         gXZAIgakLYMZUj+hgglB8hUKeYwdBG/CoOsMkScaFvKQ7cn11nfJgY97l6s14W0cRvph
         q0ylSqLYif1TnN5KMBQD9EyAjt7QSZ6OAo770ohoes67/pvQpBosqpcJy2ofk1LuQfb4
         5h3+yMB+ak3OXfys7ipEHeeekDq1wqF1GNQLqExIk98o5s2Y1IKuegcggCqvPSEPjMLV
         sR4vfQ/PWGqrGtXecOJfbO6BS2r+7pLcYARIxPGgPb2XuxAlcwsSte6B0Jrx5+JocbDy
         qjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183722; x=1701788522;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZkWu2ySemNB+dH9OL9BeVvXo61wInQDnE0WqBxTBfkI=;
        b=qPKbZA3F2jegVZsr5+GD6lBwl/X0g3QsMx0kAAOcTX4x2t0G8DMXNu0k3aKMfNOFsM
         V/6qcXyUdx/lrQ9bjOKLLLcTUC6NQoXFHvmsJ9nl3Kn2PeYDjLCtkitAxtiPWTI2d+8Q
         uzN65lzLknPZrNtjHwEnS7BY1n9R6XvETjzCSP40lZuY6XqIboxSbMg0ftXrkvVqvzZ6
         6qiohuIiga1CN1LrrWqKDfEqWfV25fL7gnUE2iEt5rpb61wQlGQ95UoI99FnC7OzBuLO
         6xW1FdaVBbzFLcaoqg18TrBf6/AWX3Egmu8GntZmJ2dfYfrLa9vv4INunaV/RYlzhLR+
         pk8g==
X-Gm-Message-State: AOJu0YyNdRe7gY47PA1kvuqYwapeMDHRKxmIAHqG91OGb8llMuQh/TZW
	hWDxi4eAwnoPt74yqaJh52d2OA==
X-Google-Smtp-Source: 
 AGHT+IGVOUpmvb94Jr5diQ87yRJsgTUXl7a1KEj86KCsuk0xkpDAakMyWxHFifx04mdoT3ggOA6w5Q==
X-Received: by 2002:a05:600c:1d17:b0:401:eb0:a974 with SMTP id
 l23-20020a05600c1d1700b004010eb0a974mr12639457wms.3.1701183721458;
        Tue, 28 Nov 2023 07:02:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id
 fa20-20020a05600c519400b0040b3e26872dsm12773310wmb.8.2023.11.28.07.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 07:02:00 -0800 (PST)
Message-ID: <42a6f6e0-2846-4cdc-8702-493fadbafb98@linaro.org>
Date: Tue, 28 Nov 2023 16:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] ASoC: codecs: Add WCD939x Codec driver
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-5-21d4ad9276de@linaro.org>
 <ad9a7c4b-82f4-4347-b4dd-a394e4ba95f0@linaro.org>
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
In-Reply-To: <ad9a7c4b-82f4-4347-b4dd-a394e4ba95f0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BB5GJNAJM7U3EQOBXSQMUGONMKTWU7M7
X-Message-ID-Hash: BB5GJNAJM7U3EQOBXSQMUGONMKTWU7M7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BB5GJNAJM7U3EQOBXSQMUGONMKTWU7M7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/11/2023 13:07, Konrad Dybcio wrote:

<snip>

>> +
>> +static int wcd939x_io_init(struct snd_soc_component *component)
>> +{
>> +	snd_soc_component_write_field(component, WCD939X_ANA_BIAS,
>> +				      WCD939X_BIAS_ANALOG_BIAS_EN, 1);
> All of these values are BIT()s or 2-4 ORed BIT()s, can you check what they
> mean?
> 
> Same for almost all other snd_soc_component_ write/modify functions

It uses snd_soc_component_write_field() with is the same as
regmap_write_bits(REGISTER, REGISTER_MASK,
                   FIELD_PREP(REGISTER_MASK, value);

So the 1 mean write in enable mask in this case, and mask is single bit,
read it exactly like if it was using FIELD_PREP(), but even for BITs.

I did check every single snd_soc_component_write_field() so far to check
it matches.

Or it's another question ?

Neil

> 
> [...]
> 

<snip>

> 
> 
> Konrad


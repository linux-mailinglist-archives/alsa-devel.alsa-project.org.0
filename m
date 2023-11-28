Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1457FB517
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 10:00:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49BF0DE5;
	Tue, 28 Nov 2023 10:00:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49BF0DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701162027;
	bh=0DfzS7DHgA9SsIUBmO3aqEvbvYroyQbB7jJaAFryUSU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XmY8mKDtiWDwFaCF+3zbtm5dm/sErhLCBav+6q+Dp85hYy83PJkDz+vo0SijsXB6s
	 XiM+7WSB+7KLbAMlNmXb1fQl1jMlmp8pXUORD1hNb6ZYfUN0OHltw4aCJtAvys0485
	 K2OOvxpGFhobN1W9g2FGD6OCF5v5t+IuZi63JUpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5250F805B4; Tue, 28 Nov 2023 09:59:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5558FF805A9;
	Tue, 28 Nov 2023 09:59:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A63F8025A; Tue, 28 Nov 2023 09:59:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A0A4F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 09:59:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A0A4F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QE2v0rrg
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50aabfa1b75so7328061e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 00:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701161991; x=1701766791;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2BakYcGgqp0kJB3n7H4gdGk25DfuvAIGclFF4AFOAo=;
        b=QE2v0rrgcC+tEdFzpeLUQW9xwvK7GfUwM5IbB4rLgSRdCMIeaOeVTLweiSLxeEtTkd
         VLvqbXJ8YCqfVstmX10Y237g10Lua74x1pd0zIsrR+FIy3zRv3OZ+c5hk4SggbC/3ZSM
         A6uxGxx6NRdA2ZJj/Jydl3Gmt+V63lpj6DDpNHXwDYNZAvlEgaW+7xuKyjmbK0DpbBdc
         cN9S+eEsIPz/WCOqNtXdF+5py66dHTtyKkrkrGz4EiCYJwKVML11/995WOT0eRiUoNR/
         jVMBoWnhVbEhESIlYMHZa13ky2gkisCKkPo2bF61X+BgIuUzH1iuO3dJwQObGgIYtKQw
         /0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161991; x=1701766791;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c2BakYcGgqp0kJB3n7H4gdGk25DfuvAIGclFF4AFOAo=;
        b=PZeaEsUxT9q6Xzz8eZdzXT/Im+S8oC5UMMg746MhQ69OfmhZqSdyvRzToI8qhCNpHL
         VgCKe+Il6bVNCYOhjSiSobnMg2IWdpfP/CLacf0Z11njFngUNBPkTu3fLYeicalX7c+6
         RdgG7F2RIIrnhjvBBjZEu5IMVCYFdKun96sGAoP5b1VKRvtr1cshBNP3I/m+hJjSZLE7
         U3Y6r2KJd4eVLNtI4mqrx3DRoW6aC0l22hN3N2Ha9N47no/zofpQADHp/kE1I6GmVO+8
         JeIRnoxU34OQFSTj1MNIQiA/wlZSzset65I5TokCQnrpM8ZQAxOZaZowvqOAFSvO/egD
         KYOw==
X-Gm-Message-State: AOJu0Yx5cXZ/EmyOamJ7e4QVvQuS/KcZm1ovf2WPYI6wsDC4RvyXCGF6
	G73uie+ymScqcTIBO3VZhWh7Nw==
X-Google-Smtp-Source: 
 AGHT+IFZSdmEUPX7kD3W5d3ANhGnQGfBaHbtzMGU1EThgWvD5DR/EiGeJwfk7caA9pwSTLM1fV0waw==
X-Received: by 2002:a19:7901:0:b0:507:a650:991d with SMTP id
 u1-20020a197901000000b00507a650991dmr8345854lfc.58.1701161991449;
        Tue, 28 Nov 2023 00:59:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe?
 ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id
 o10-20020adfcf0a000000b00332cb5185edsm14233807wrj.14.2023.11.28.00.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:59:50 -0800 (PST)
Message-ID: <d9dcaa1c-1f4b-4425-ada4-de4197c22bcd@linaro.org>
Date: Tue, 28 Nov 2023 09:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/5] ASoC: codec: wcd-mbhc-v2: add support when connected
 behind an USB-C audio mux
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
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-3-21d4ad9276de@linaro.org>
 <ZV+ODbskjFe5louc@finisterre.sirena.org.uk>
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
In-Reply-To: <ZV+ODbskjFe5louc@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VGPD3KJRI5S6SK7HZES4PRQZ4UWGYRYP
X-Message-ID-Hash: VGPD3KJRI5S6SK7HZES4PRQZ4UWGYRYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGPD3KJRI5S6SK7HZES4PRQZ4UWGYRYP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/11/2023 18:38, Mark Brown wrote:
> On Thu, Nov 23, 2023 at 03:49:13PM +0100, Neil Armstrong wrote:
> 
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(wcd_mbhc_typec_report_unplug);
> 
> ASoC is generally EXPORT_SYMBOL_GPL.

Bad copy paste from rest of the code... will fix

Thanks,
Neil

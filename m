Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 341F19069DB
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 12:21:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721CADFA;
	Thu, 13 Jun 2024 12:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721CADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718274078;
	bh=QNkIEu51DQcZ/rYzs3XDlNauHS42tIn5fBb8WrbdE9I=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LatmbYmdzV1kyzj5b4cCtS+wLxjL/CeGzJAbRj0cDWRC9VqcJTQa9OE/zSaFWl9j/
	 lrbevzBBxWExm8s69MjBL39La0d9ckLz1rOsew6939J16ek4o7AjfAN5cI3LHUn3yg
	 vhzcQpCu1u0ZlU5OLQYAN/vt2lSIdKZ0Ezs4Ylkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 363E7F805AC; Thu, 13 Jun 2024 12:20:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0E21F805AC;
	Thu, 13 Jun 2024 12:20:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62C2CF8057A; Thu, 13 Jun 2024 12:20:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B46A4F80448
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 12:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B46A4F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KaQ6z74T
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6f13dddf7eso110651866b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718274034; x=1718878834;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QZ+NCLQgLbaVK6YbbCv1p2KuIYd+8NexPeaQHEj57A=;
        b=KaQ6z74TYpt3sRyKpZFsusEOl6MYjiKJiNBaXjYkVlhSe1Afg2Mb+JzijOq72RIsHP
         XeUdGxcY5YwxnD/6LbS2U0/0Borgla0eBx7Bs3Rq+mKKdrakK9+ZDrPP0bAT1LP6I6P0
         huIJ+gcI88fOKHBOdWGBLBGCxkIYHNYkQAESoVQZx18eX4NfKPABKshQIckh6kW5C4Gz
         M5HlzoyTXqsIm6ixhBLmrmFnN0XfUYN/bEJT4aPeA4mDrv8oBeUwgQu34FoRl5dBQ5Dd
         +a6JeEDCFm8xI9bL3bR2T3Gyq5DUtNVRkzQNnN0GfZyMhZq6NNriLSLYse2dDSU9E1VS
         3/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718274034; x=1718878834;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8QZ+NCLQgLbaVK6YbbCv1p2KuIYd+8NexPeaQHEj57A=;
        b=BO/JE8Hi5PTyZ0b5QGfLX9kLhOfa53TUVG0OmxE3aWCVmL6Du2UQlXdX9f0jOHPzab
         NujMulXiw1fy950f6oBPrO8JxR/UdRFXqrfrTb9qj/lsqDvszY/rGFNHbi9bnEDvGlLg
         BsklGIkYk2mgMbc//MIi56DJ0wc6IPGCw1XIjx+kEbwP/5G4xbC5kXJbBwxnowakm5eX
         xNlWfhph55BQBbsFEMxKD8e+gz8VG3LcBSbN/pSGS8fVuofYvw0POpZqAg8mvI2Q4Q74
         qIcGQMEd2ckifSupoKalZhbxnseJaYI8+frIM0Dt7szy7mtoiCycvm2mpKOeBdyjjnbF
         7W3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/o6+8Khr6OZcT1CBwvMRGIlKPo7BWUnjjctJ+fwcAnRfSwFFmfFCJTVfE777Gp1gb/7NlFclHbPZjOyIVo45xz7PkHx7JJo+480Y=
X-Gm-Message-State: AOJu0YzH86iwvwDBxNj7WDvBkru+ws2puhHy3t+ALLN8iGMUMKWErOiK
	gQsxHwUw2R3lGk18ORz45ZqFS1W8aQ8yYMWktQkGvBK7DKZTfkPaSX15htgeCzs=
X-Google-Smtp-Source: 
 AGHT+IHhLuwN6s2pgs2GbMvTpm2SCanz1Hu7FntRJZJCf6/a3NbHRkedsMTRJiQMmKNGepEbJ6+n2Q==
X-Received: by 2002:a17:906:7f94:b0:a6f:277c:d890 with SMTP id
 a640c23a62f3a-a6f4801378bmr263358366b.56.1718274034038;
        Thu, 13 Jun 2024 03:20:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7d7b:a9a3:893:f3c7?
 ([2a01:e0a:982:cbb0:7d7b:a9a3:893:f3c7])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f5952f85fsm42543366b.11.2024.06.13.03.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 03:20:33 -0700 (PDT)
Message-ID: <b0670c4a-9663-4ed9-8eac-45efce5527f4@linaro.org>
Date: Thu, 13 Jun 2024 12:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/3] ASoC: codecs: lpass: add support for v2.5 rx macro
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
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
In-Reply-To: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KIP3OTAW5WC4FYYHDMTGOKU2XGOIBBSU
X-Message-ID-Hash: KIP3OTAW5WC4FYYHDMTGOKU2XGOIBBSU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KIP3OTAW5WC4FYYHDMTGOKU2XGOIBBSU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2024 18:57, Srinivas Kandagatla wrote:
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
> Changes since v2:
> 	- added some locking around version variable.
> 	- split 2.5 changes to a new patch.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Srinivas Kandagatla (3):
>        ASoC: codecs: lpass-macro: add helpers to get codec version
>        ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions
>        ASoC: codec: lpass-rx-macro: add support for 2.5 codec version
> 
>   sound/soc/codecs/lpass-macro-common.c |  23 ++
>   sound/soc/codecs/lpass-macro-common.h |  35 +++
>   sound/soc/codecs/lpass-rx-macro.c     | 555 ++++++++++++++++++++++++----------
>   sound/soc/codecs/lpass-va-macro.c     |  29 ++
>   4 files changed, 490 insertions(+), 152 deletions(-)
> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> change-id: 20240612-lpass-codec-v25-4e960abd661f
> 
> Best regards,

[replied to the wrong version, tested v3]

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Successfully fixes dual channel output on headset, previously I would only hear
sound on a single channel.

Thanks,
Neil

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C185158D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:42:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02CF2868;
	Mon, 12 Feb 2024 14:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02CF2868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707745366;
	bh=dWBpDuEOTKutbVODo5O8JgmUh/BDERlL4YllkvQWSXc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LEbcjM1xYnRQIkq4IJKyjg5DhBmiy0WlmtiuR2zfx6YTThUP459CujyvCshSeFrNS
	 ursRmvjszAz6gfUV28pO5hk5nGpZGFXm8fc4e1ebG8i0+rjKrZcb6vAJs0rGKdGfJu
	 eu3u8ngAZ0W/nf/42LCab3EH4dOn58UsqtIzo3eA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAEE8F805AD; Mon, 12 Feb 2024 14:42:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 476A1F8057F;
	Mon, 12 Feb 2024 14:42:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 636EAF80238; Mon, 12 Feb 2024 14:42:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D533BF800BF
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:42:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D533BF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SU222yfU
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5116b540163so4487571e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707745325; x=1708350125;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dE2Uu2uCSHa14SdY6tBLgLnoKp7H4jLEiI18y+He1o=;
        b=SU222yfUCrwuBKFkG8NA6fQOATRp3S5piQXOOZjc+IenGc86Kn+tOnSvvaQI5l7sk6
         0/L5QvBVNqxQX93NvfE58AHtLlqSYXzLf87tCn0UiQmdcWEY5FIH9MZNU8fHbCADfj3l
         cvd3bQ7poDqCtTzzkMMoQ3L7XRRC9/4mXcvY4plexLnISSn0KIzhpFmy5YepOD3igDrn
         qKjdDYpbUDn/KnefRvt+CmJsqZgnG7L2rhKfC14tAyv/S8dCcKTo4XCvqXmLPLS367CO
         5jfiSTPGwS6HvoZV1K1yQBHLeRqkmHJjVShJ/8Qn0ZOlyaRFILNnv/pcvCWVRCnf3e/W
         ByOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707745325; x=1708350125;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0dE2Uu2uCSHa14SdY6tBLgLnoKp7H4jLEiI18y+He1o=;
        b=OIKezs3yYf8TfcoYAgAPbcu/e0ovgGgo4LftuCoWNPVSW5fbl/w/Mq/mH1ToeSz6uK
         f+h/1waQSMIeVi94C8ZoDfrlfCZ+hmi8vAUjoL1/RDsThUuFqfYYz2lx7pXWASu46me9
         yXsWI0lU5Hpb+WToqsuZ9sMtCW4cSOhf2nkbkrX1dgCH+tYqRERHkil+4KQUtUm/8JD0
         55cbgZJzsEQDggr+arVXD2XowX5sDh+ttavgYGuAO98WCcxz3We7X3B6vTg9bgVa1dee
         JCfbV1y9O13aqcYGQTg/OucWb5/4RG7OckLRhS0s/j7oRY4Uo/Pa2aYww4Fi+LWcwkjH
         W9Tg==
X-Gm-Message-State: AOJu0YwglcfPKUygEml5WWbrx4vGv+o8Kct2IaBLrS4GAim5oGQyHyh8
	99P1aFgQKNLFYiqkCoHjgLAxSan1HJB+kWIVB745ein4KMt23YUAXpHZbHhJ4ho=
X-Google-Smtp-Source: 
 AGHT+IFC5y9HwH857WCaVUaBtTyClAsbj4tu6E7IXIMqaLfUCEunlC+uc12C7TefW6aIn61+SjuuZA==
X-Received: by 2002:a05:6512:6cd:b0:511:7fb2:3f7b with SMTP id
 u13-20020a05651206cd00b005117fb23f7bmr5753221lff.17.1707745324626;
        Mon, 12 Feb 2024 05:42:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSCDI13qgx99gAbVFEn8ESfRFYG3keqn6rI28ZLBCkIqMNqoaabEiI3cBGM7O9tlzvU02SKyewJkZORCNvRQZY665r0+D0P7R2GFyUbf3qmniApbAZlbpNWKyyckPQpM3mgDIMqLc59vsRRdlNdf3jOYaQ7k1eKC2OR/7qDgstSNkqzPr9PB+EL3ov9ICT5d7bC68uXbx5eN9dqIaWYDgtc+A8xK5k6vybqX1wLKbKV14Jt4S4L+qZm5NKfoGfrd3aLCgjayTLixopVDfTH9V4MX0GGtgebtL/7BjppbJhZ3uYbP8SXNPej08+YmdA3NOrS0IZVfVj8Y9IX4Gm8+zX2S+g+R2v4QJkk2V+zUqoSLmgvXMeg4IBs5yesC99XrrVI0I+k/YSvvicxICZir3PcWNLQyVuYHr4fGgriS5VTID4fIMMu/kz8G8rkkGPbWtvoYRdTGIOfj/zmPNj+Z+0Tuqo0EQqhfI6LuMKzAfcjR1zPO0VUjWpN+X6Pt6aOTtwZznLF6p9OmL5Nalg9xtYA2Vn40A95/E7MoLcGjnMTsEixnGoHXlfDS+dXW93MXVNqHXU6vWqcLJZuEkvTPMBcMvbK1EDrYTKrvscw9M4K1m8HzOwG8xvUb+sJ5zjM7L1fn9kgcFVMwFgkeySR+lqKFdxehdGJ4GfAsng8REtuSPf/B8FPnG6NUT1V6j1YqZjDrn5/3ACmwBj7HKcjHFhL4nnZSFF91u17Uc72V9DulKVMEbmuHxap0225/4iaayl7kR8hjDpzYapURif95IGkRU0mpcKQnXvgHD2exJWE6X1wo2DUTZB7Q==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f?
 ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c224400b00410ebcf8180sm1605785wmm.43.2024.02.12.05.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:42:04 -0800 (PST)
Message-ID: <8ffe81a6-e609-4ca7-8075-2d630dc7c378@linaro.org>
Date: Mon, 12 Feb 2024 14:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8550: Add missing DWC3 quirks
Content-Language: en-US, fr
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240210-topic-1v-v1-0-fda0db38e29b@linaro.org>
 <20240210-topic-1v-v1-5-fda0db38e29b@linaro.org>
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
In-Reply-To: <20240210-topic-1v-v1-5-fda0db38e29b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GQDWQHERX3SUC6UVHLTS3MSJSUHCSFDA
X-Message-ID-Hash: GQDWQHERX3SUC6UVHLTS3MSJSUHCSFDA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQDWQHERX3SUC6UVHLTS3MSJSUHCSFDA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/02/2024 14:10, Konrad Dybcio wrote:
> As expected, Qualcomm DWC3 implementation come with a sizable number
> of quirks. Make sure to account for all of them.
> 
> Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 868d48b85555..925e56317fb0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3193,12 +3193,20 @@ usb_1_dwc3: usb@a600000 {
>   				reg = <0x0 0x0a600000 0x0 0xcd00>;
>   				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>   				iommus = <&apps_smmu 0x40 0x0>;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_enblslpm_quirk;
> -				snps,usb3_lpm_capable;
>   				phys = <&usb_1_hsphy>,
>   				       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
>   				phy-names = "usb2-phy", "usb3-phy";
> +				snps,hird-threshold = /bits/ 8 <0x0>;
> +				snps,usb2-gadget-lpm-disable;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
> +				snps,dis-u1-entry-quirk;
> +				snps,dis-u2-entry-quirk;
> +				snps,is-utmi-l1-suspend;
> +				snps,usb3_lpm_capable;
> +				snps,usb2-lpm-disable;
> +				snps,has-lpm-erratum;
> +				tx-fifo-resize;
>   
>   				ports {
>   					#address-cells = <1>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC96851541
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:34:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ECD8829;
	Mon, 12 Feb 2024 14:33:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ECD8829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707744839;
	bh=CHeDkbS84QCjf0RypUKMIayqdgs04cSEZaM+mqI7P6o=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YJ2v2L3au9G1Fgmw/SQXjdHEvCx+KwKupWmZx+QQX3vOQ8MSXeeAWSL15was+BxKO
	 gYOc+QK3aJzC8HsXTN6dOSNFaxuOm0C+Bq+S3Sv/NtYE5u1ncl3d7gbBNo/y8O+kPz
	 uayLZONfBEdbxY80b9XxCc8dO924TgNEaKIwOjUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3B5EF805A8; Mon, 12 Feb 2024 14:33:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69FB3F8057D;
	Mon, 12 Feb 2024 14:33:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 052B8F80238; Mon, 12 Feb 2024 14:33:21 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 92C9EF800BF
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:33:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C9EF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=o9yJTsvA
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-410e7b08252so4511355e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707744792; x=1708349592;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5HiYFS7Fie3ZVA9jhxns8zucVahNQ/OMoleXMPcDlk=;
        b=o9yJTsvA7hUv6N7V6d8Sy0vMKvphS8XI0/KM/g1mJs8HJB8x3/VGrf9LWFAjnV5TOo
         C2DL27hKvIEdyOzhlLGxVVmNlExKvRlCWcGlQ1xpW2ao6NfV2ZCtewBj7F5iea0AH3j8
         nFs5W8b5sBAMXDG4jEk2CN9BoAFh0b71o9Ki2Lk4qCHnOnp0RUH5ZbVQlYucTiBwBMLR
         UIIdzl5ZTqp8KEHjqFhWHQ9+LsGmVgBdk5crJni75rWoKJjMpku3pHMdUVTC4R32iKWj
         CYGXg5k1SSMrYNumEBufhcbiUNf8i/TKHa5Cqcjg2KKaWg4XEykQgVs9CECpBq6clJZX
         SrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707744792; x=1708349592;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m5HiYFS7Fie3ZVA9jhxns8zucVahNQ/OMoleXMPcDlk=;
        b=eyhhD0KlNybJkmN974C3g96R29EDjFI2V4+8ExA3mUFOTzrPJxlvFi0ASg78/TDMIA
         E7dXQaUEBSpIfP2D7X3OKVix4CiPYBULxWKfiFa9ksR7EnKlr4AOvr5Itwu58qY4g/fq
         kMpRWvteYKe9TCfikE6bcCVi7EofRktEUK6FKXM/Nq2+bv6v0AS1lve1RTXYA7rOzgt3
         mhLL5fHth+mfh5WchbNWDd1sjbYU3DzXGwJOQU5WX10PqMYzpKBCiqUDlrbjiihBb344
         6FxV8r6gTv8DDTxE8BAYElhSmoxfPi5lisQoZklijVRemBhnx8JXSrXCZnMk9cgGS5Ke
         uDAg==
X-Gm-Message-State: AOJu0Yxj2jxD9DraQ0rSK7fnTyvoVzqCM+fECnGVATCKFKsceZSj3fwn
	78FEkFCQGUfIczs8wV5Bj3sZWiCh3hp6v5S9GvUQdBS6+fFO1+uhINRlSUjwkHs=
X-Google-Smtp-Source: 
 AGHT+IFYGprEV+d3HErwdfFC+XsS1hAk+2VcTVikqmf7dkgqRpqzbuTqmS04BGjfOp/aCycFL4/rSw==
X-Received: by 2002:a05:600c:16c9:b0:40e:f154:752 with SMTP id
 l9-20020a05600c16c900b0040ef1540752mr5624818wmn.20.1707744792312;
        Mon, 12 Feb 2024 05:33:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUBDnbJcJOZ6hIKEZs01LtAKrab+vPQvJNU4Y6ATcknkRokAP2xxQDPT3pkxpFaGNzBU8XT7uAo0cCtmNnqTkM8HX5PNH3wVVEXzT+2Tnc8Ii6zmctvBQJOfjqD/CSJCuc16821W2NnoS/v5jkzCS7v0I/3WBOZRSgVykNBLNVzv53Jz+uzLJk9ro+vivCVPaZP1As8VfO6EmCI4PMsuX7WF+DbZUAuNUleb9pnohSOaY87uJwuJXZfh31zQHmrrs8KCBrkV4RQEBoXkFMNB3sfbd6IhktPfEezyiO89GDJA+8pgT/l62PcRl24MrY3h0Zr4+0KkSSruUowNyk9F2rFSQf0UZR+pHdz4tCLb17s3NA0qWPfLSFkN6uuCBArMzpeqMcwaw+zLIHyPwVuVTqp4aXGU312aw6P7nZqd11CRwUpF9A4pEKnoDWpyFsOc+SDLeVGT/MUqH/jwWVPWJtaNykD/2PJK2qUGZdmxMcVijs1CIWeh65TLGK+0u/YAuAirqQd2TOmrkmKgDaKMR49q4+UYOEvvvnVa/0LjKbxBjFOvhoRpca0zrvsJ+whO0nDwdy0LsQ5Ik+W2nKySdAMU0WNxwGNpZp3sEjwtqYNnr8Un1x9VgmnzJqYeCTC9vi73xp1NPJXN6aws1abbxBZRMmOQvAcjdMgGd4qY6dyECmSii5BnPCJfipvujhi7oRtCFOeF/wteBn2VBVUJ2UiZof18KYDjcTAZOAUqCmYxBZzG8iBD5fMtLSKK2D4kvy3dOJbQoMihh7BS2MgCuw3z4pggLWU741nppW18j9YCuTr6XC9aQiLUA==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f?
 ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id
 a14-20020adff7ce000000b0033b2276e71csm6843987wrq.62.2024.02.12.05.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:33:11 -0800 (PST)
Message-ID: <36869f81-fa1e-4938-a664-d8ce9afb63c6@linaro.org>
Date: Mon, 12 Feb 2024 14:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sm8550: Mark QUPs and GPI
 dma-coherent
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
 <20240210-topic-1v-v1-3-fda0db38e29b@linaro.org>
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
In-Reply-To: <20240210-topic-1v-v1-3-fda0db38e29b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OP73TH55KOPVM4VKS66GCKCEVRS37I27
X-Message-ID-Hash: OP73TH55KOPVM4VKS66GCKCEVRS37I27
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OP73TH55KOPVM4VKS66GCKCEVRS37I27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/02/2024 14:10, Konrad Dybcio wrote:
> These peripherals are DMA-coherent on 8550. Mark them as such.
> 
> Interestingly enough, the I2C master hubs are not.

Yeah they are not DMA capable at all

> 
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index b8f1c7f97e48..d696ec6c6850 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -812,6 +812,7 @@ gpi_dma2: dma-controller@800000 {
>   			dma-channels = <12>;
>   			dma-channel-mask = <0x3e>;
>   			iommus = <&apps_smmu 0x436 0>;
> +			dma-coherent;
>   			status = "disabled";
>   		};
>   
> @@ -823,6 +824,7 @@ qupv3_id_1: geniqup@8c0000 {
>   			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
>   				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
>   			iommus = <&apps_smmu 0x423 0>;
> +			dma-coherent;
>   			#address-cells = <2>;
>   			#size-cells = <2>;
>   			status = "disabled";
> @@ -1322,6 +1324,7 @@ gpi_dma1: dma-controller@a00000 {
>   			dma-channels = <12>;
>   			dma-channel-mask = <0x1e>;
>   			iommus = <&apps_smmu 0xb6 0>;
> +			dma-coherent;
>   			status = "disabled";
>   		};
>   
> @@ -1335,6 +1338,7 @@ qupv3_id_0: geniqup@ac0000 {
>   			iommus = <&apps_smmu 0xa3 0>;
>   			interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>;
>   			interconnect-names = "qup-core";
> +			dma-coherent;
>   			#address-cells = <2>;
>   			#size-cells = <2>;
>   			status = "disabled";
>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


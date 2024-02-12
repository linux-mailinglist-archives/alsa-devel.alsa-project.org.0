Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A264B851546
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:34:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB15AB60;
	Mon, 12 Feb 2024 14:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB15AB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707744861;
	bh=yqe1MeisjVqaVRo2Qv+sv7kOGkc0J0u1l2qx4nTmQKw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HqdW4X6tkyyYUh8wEE7y2P2/YOZp/rGfKP1dJ05M1I+uWhTnzJvXT7Zde+Po+y7eR
	 noStRwPKLIo4klB01/BqtC/kqTHGDOy2IAvLnu0UFjHquzvzIGDSHPx5lJdfPaKEcO
	 DqA3yKRVAwK4g1RSr4va5JCe986PrjBAgrMFONi4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63EB7F805BA; Mon, 12 Feb 2024 14:33:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A6FF805DA;
	Mon, 12 Feb 2024 14:33:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 946DCF805BA; Mon, 12 Feb 2024 14:33:33 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C95B3F805B5
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:33:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C95B3F805B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=A77YVTys
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5114cd44f6aso4277687e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707744807; x=1708349607;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/kgZxDLzPkX2dj4HID8iXh6TZbRWb3hqOS01jZ2wfU=;
        b=A77YVTys5/XUX424Q1RrmPQhZxFRXIudle2Swy623Pd6hVbEY1VLEm6SkAWEN5Ntkb
         f4mKfGa/Y27yOED5Nq26dx20U5fX64Tg3DFKdZMlzc1EK/SNTyJZ879wyv8ccmHzjSJD
         CqfWvQKnjxiIbvTeLvBzgeBNZdMP1xfuHKp1tOdlonYrJj/rIrc2yBwsK5H2gqvCprzr
         0bXnVNXCwoQrrNG4Klub4BtKIartR+MQAnZPeIURSjGaBlklR5gRBZiAED//r/izRjaW
         uJ41LHwkMrwAfyYzYmA+jalah5Ap0N01WmwO7G2NfRdZoSUiQtzMCvDo7w4M6hrg5kNo
         0BJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707744807; x=1708349607;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k/kgZxDLzPkX2dj4HID8iXh6TZbRWb3hqOS01jZ2wfU=;
        b=eDDVgoNNkeUfZf10p/oV2FQSKASfTfi/RJenl5q6Bj3gVNAsZoBZRUeqbLtO9mGAW0
         cqfbOTd0ig05+qyF9F8p0JNoByFVTT7lz+Zmxh38JW81raPcwNZlSIDkNNV95544mpHf
         d2nUnHXnIDfgPTdVG1BsNXBa/MD0Ld/wiJ4QwHSnSXQUD8oeBBRth913huWuRVgcjKdp
         IhWbhqCKCvnkTUFhe9C/4//NTSTTh1YElPF4dWeJ7KqFZVWuk8iFiqJzwz7ST32eXEe8
         rqqQ5YRyIJHi0Gii00tiPYALZAY9XHw/+Ej0/wIcOSo09S9jt2DGtUbmHLl2oXm2e2KH
         vMlQ==
X-Gm-Message-State: AOJu0Yzdqe/e6n6dUfPqjD/6u8RidEShtBvPXKdbYqYgYJ6BLZLExUFv
	N8wbVOPxMT940X1sue91fAPn4jE+xeHgobPDMarWFybE2QgeidJJ2u+DlGumnfQ=
X-Google-Smtp-Source: 
 AGHT+IHvH2XPj/SKjsWNl6ukO9j8WqLT8nmaHmw9ySTfeVRbApaTcy5hQgOBLWN+LkgF+BRL/7moPA==
X-Received: by 2002:a19:5504:0:b0:511:5b50:4d11 with SMTP id
 n4-20020a195504000000b005115b504d11mr3845473lfe.32.1707744806973;
        Mon, 12 Feb 2024 05:33:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCGMzyx+4oXasQf3W7HybFcgfseIwO4/jC4gSzO4p48bQdilaW6B1K3pt/hc2MLQU1nobxdETArybnt4pkerxBlURo1wdjEGI7nPe6Lwhr9dKRjCJ4G18+voDa4dvMfMUi/J+QH/wSPgfED8pYVirq9FKp6To21DoTdY3gddNaktq2E99kfOoI30jgYlQ0WHVVXKxMPimZU2VkEr2qEtXxjGKYaZi2+PyBuyh/72ryPd6/GZGIxrGpN3op/OgGTOb4ekZFglpECLYrzKH2uw3hC4enx8NQ28PwFAti+S32LkjGpDCSVC67kl4W0v4naVD9TlPXDjHSQnepCS8xSJPOz5GSFJLqIsmKNcWTDuYd2KmrkC5MvMsTnWD5xF8Y/8iBCDnO8E09iYbv90zWwYUAJMbwt7DVD5CIts9FDQoNm07n7MXq7UfaQFvCSglEanx2FxEJV3kfwt1FnuP/an0lCpS/DVT1RMEnGTu0M1GYRiGgUjkISNpgyZo6Gf69uIm+hMv8O67R+VcUJpXh5MAZSnEF3rJ75oeqwc0NiCR6T0GNzQ8hw7sA2xV7yo+Mr/H7aMjrMhjfo2FtJffMQixoIfiB168Ysy0m1Ln1rzsgMrKlokNttUES+dGS5W4uwBL/tWcBF10EL/ZbklY+wiSdYeVWifGNv09sEIdP6AF/P7UMEmXwp8MoTof2u0egDfwqVuKYd/OOnODfLGDkJBU5aIa3ah+sTukfEhEvJTr3D8tTILB+Fz2uUhCTN3Wq/Sg0d0JlwaLEq14ttulK0tGb1jKF3+f7RiDcUs8Viq64GdRZZJMHKP6tzw==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f?
 ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id
 a14-20020adff7ce000000b0033b2276e71csm6843987wrq.62.2024.02.12.05.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:33:26 -0800 (PST)
Message-ID: <42d4a413-a4a5-42c3-bcfd-db3485fdbae3@linaro.org>
Date: Mon, 12 Feb 2024 14:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8550: Mark APPS SMMU as
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
 <20240210-topic-1v-v1-4-fda0db38e29b@linaro.org>
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
In-Reply-To: <20240210-topic-1v-v1-4-fda0db38e29b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SZSSC67TIWQO5MBLUYOIJR3GWK7LVYQ2
X-Message-ID-Hash: SZSSC67TIWQO5MBLUYOIJR3GWK7LVYQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZSSC67TIWQO5MBLUYOIJR3GWK7LVYQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/02/2024 14:10, Konrad Dybcio wrote:
> Like on earlier flagship Qualcomm SoCs, the SMMU is dma-coherent.
> Mark it as such.
> 
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index d696ec6c6850..868d48b85555 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3934,6 +3934,7 @@ apps_smmu: iommu@15000000 {
>   				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-coherent;
>   		};
>   
>   		intc: interrupt-controller@17100000 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

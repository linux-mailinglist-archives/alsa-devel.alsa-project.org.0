Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368B7851591
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 14:43:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7F1A4D;
	Mon, 12 Feb 2024 14:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7F1A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707745387;
	bh=rqH8V6xbdfF0F13rCGzXMzpp7vuMjDdnewyWWsEO/78=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=COyp5pWJUJXBkMtgEnh5xoURbA1e/JVy5aE2aZj+ih8f7ds3+v0zrdQM9aWFOa05M
	 PqlRsvxcIYhhLRTJvF2OiOp5sZ9sUHVCm5zuISZxxsAz5ezLLNyTQC+gbALAFZhgs5
	 sVkUFw6CzB+PbpNU+qXjm3IbTUnML9EY3/sGHaqg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03C07F805C8; Mon, 12 Feb 2024 14:42:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57B1CF805D2;
	Mon, 12 Feb 2024 14:42:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36293F805B0; Mon, 12 Feb 2024 14:42:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB749F80589
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 14:42:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB749F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qTH3HybB
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-511821e60c2so2068446e87.2
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 05:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707745333; x=1708350133;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1egguljA3sQnHDnPRPPbcueWjcXgdGipGLJzM0d48g=;
        b=qTH3HybBGRHF1idtB+uTDnopndoUndF7KOIePmxwUz4bpoTs+PP5sg21PotkNWyA5t
         NKC/McnmDa/zHpLR0SD8xFxDqGOBt3Vp6WYaejNWHoluOUCpG4kT5Dy1PLKr1/gCSl//
         aVh+0bDr2TLNvlzsAvwuZOV0Kva48g11hm746Sigkt53kAq2t3YgJAefSoRg6ZPQtTn7
         ORykAY0wiSrPe8W+/BguFT2hKZ7UmcHJv7CiKB/CIW2wwkC3QjAB4o/Cv6+2d4BgfMpI
         sdvGlpAk9vpkN6oCsw8IH6nWUrdvBhKZQPe0IBIqjW3INO2eA9yl7VzriTSu5XM2DME+
         Ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707745333; x=1708350133;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i1egguljA3sQnHDnPRPPbcueWjcXgdGipGLJzM0d48g=;
        b=QsL/ESH+QZ53QU0jPeMmmbl7oOpFcpwH86Fj6ED9iHOZdxmUi/sVn9OBr+Pn5/115c
         8a3IxaSG7WGAur8+B9sizmees37zkjPpIv8mGKh8ikBQyVGMJcUYLtLcGiWr1cTphxi9
         6Ky2nbYaIzOh16jyJVN5GDSDslq55o3Wl4DdOA2Yf8N4RuXiK+BajVas75EBHx4oTdWh
         WaV/4UkspJO3+iKIrsfdo9KPUletqcCFx/ho1eF6GfyhIuAegcK/BSm4BKsBQIiuynLk
         g/qpa1nRsRDO9L56VsGDhDQhx9XMtII2GCOdDZzzGWGHe1sywb2mxYU/kABOAY6FcCs1
         qocw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmLmA4ZNY/e03Y0eymvdqWL7UXzShA0je+hhlltH9SKcTRLOtOQNiVeKTMKWJYDDTeVpljKOXHjBAl1mZBXC1Tb4mFaVbqUL90IVg=
X-Gm-Message-State: AOJu0YyKr2c+mMr+0MUD7pSQylcH4/RZKbAdgStPkusE+EIuK5iaZK/O
	jSdNFJ8TfWYnv1+GhymPXwB50gOeDTNCX7wUsHgZukt0k4mTRf8z9+MQ778HXRg=
X-Google-Smtp-Source: 
 AGHT+IE7YwnAR/t5AkP6YIn0uMqvFArgd0ofli+tExgAVx4Cgyw/iRwBsY/FeDi710tbkExSXCIOYg==
X-Received: by 2002:ac2:518d:0:b0:511:694b:245a with SMTP id
 u13-20020ac2518d000000b00511694b245amr3909298lfi.58.1707745333527;
        Mon, 12 Feb 2024 05:42:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSGZEBeKuVwG5VasUk/o18BoRvc4R9Q7F5J+Lo/pwWIDyLBSFsdfdBW+Ug5S6sQEiESgazczGJNgzEtXSH7KCgyll9dF+BWTwx+GtoKN60WaP1mxhCL4fl78Ibxa6BuZedFAfxdWRl2QOtzLs0YMxAs0Qy8TDWgDGiw9R1AqO+qTDUa0mwR4/2z3eG/guHgkoYL6e0nyD08WAnBw8PwCSv0Sl++XmwvsvGrrH/VM5BB7mwS1DXZ0iQ11/yQ961yzkSNNY9qK4D/RWvzpoY5X2nHz7Vsmr7SiAi0TC2exwwFDgLeSk3xfUUQ4KFZpcY4ThLjhiprCW28zdR71SZdwDlRutKrgd+4g9zoCTFNP3CvfYn9ClQMO5rOiBN3qFFzBXa4Q82On/G6BD6B8AODSS5zfJNW2epYPclYs/rLndb6hRhzcCIDm3pQSywA5BNb3I+oppsOAKPZn8O3WF+qwQ5vL7coeQHKSzbuUO/3Y84WACJl9TaEmvEQQmdS0ssukbSHkkXAZ6Db5IpdejXVN4mPWGFz1wp6vxEY4LY/0XAGDvChusbP8yxm5I8zHD4CfIaQczmcu4jqrdx5d3qj4Ol77vshh2JZvZv8wS4nZ7mE99gvyqJXpISln4wJwVMSE/nyqlTziVSBurxnlZqQfqY9R3y2jJetsmfBlJynt1IHJystVq3bbo/JtqB6syONugrNRLdDT7wSMx008w61EgjwECmQpV43svrG2LnFwQI3osPkWrp6uWIuQ5jcvdoob/B3d6WGfNbfSgKptcxPPDHh8+ZXdZWV8c/ZHD1+zRZU5XHhPoG+s3Bjw==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f?
 ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c224400b00410ebcf8180sm1605785wmm.43.2024.02.12.05.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 05:42:13 -0800 (PST)
Message-ID: <3b31a7da-1ac4-471c-827b-1d9782c9d9d8@linaro.org>
Date: Mon, 12 Feb 2024 14:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm8550: Mark DWC3 as dma-coherent
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
 <20240210-topic-1v-v1-6-fda0db38e29b@linaro.org>
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
In-Reply-To: <20240210-topic-1v-v1-6-fda0db38e29b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DPHUVBKHNX53PQGTPOK4WQOS6PCH4PQQ
X-Message-ID-Hash: DPHUVBKHNX53PQGTPOK4WQOS6PCH4PQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPHUVBKHNX53PQGTPOK4WQOS6PCH4PQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/02/2024 14:10, Konrad Dybcio wrote:
> In a fairly new development, Qualcomm somehow made the DWC3 block
> cache-coherent. Annotate that.
> 
> Fixes: 7f7e5c1b037f ("arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 925e56317fb0..e845c8814fb9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3207,6 +3207,7 @@ usb_1_dwc3: usb@a600000 {
>   				snps,usb2-lpm-disable;
>   				snps,has-lpm-erratum;
>   				tx-fifo-resize;
> +				dma-coherent;
>   
>   				ports {
>   					#address-cells = <1>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

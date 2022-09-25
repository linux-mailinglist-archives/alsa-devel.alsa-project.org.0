Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 319705E958D
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Sep 2022 20:58:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779441E9;
	Sun, 25 Sep 2022 20:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779441E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664132311;
	bh=gY20b7PKAU8F7JfXCURv33y4p3BS+2iIpP7tMmtkktU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tEzuGAIQZZnbITm407iwNOwYcOXnpn6+koLatFcgDVxwLtsjaD0YLdFYOLIKkmEia
	 6hl068Lp/pBIbtgSbUo+O69kqQ4NwfNLU/EK1fBl02eHd9iAb4hrl9EQ1CETX9vcPQ
	 zIlujzr+EtwzMxRoChDa/RyyWxIBSK7wWFZ23cek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEF98F80115;
	Sun, 25 Sep 2022 20:57:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB940F801F7; Sun, 25 Sep 2022 20:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16D3FF80115
 for <alsa-devel@alsa-project.org>; Sun, 25 Sep 2022 20:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16D3FF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org
 header.b="ZPGr5rAU"
Received: by mail-oi1-x229.google.com with SMTP id m130so5988965oif.6
 for <alsa-devel@alsa-project.org>; Sun, 25 Sep 2022 11:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=bu2u6MTlzgmQ7/o236tbswT/S+hmMK8el6BxRtvYroA=;
 b=ZPGr5rAUGy2KV5aNoCc1rEnrPZ5mlb3mZ4682X1UEgSiigC+ZOMQDxD55z5zwcrq+m
 zwchswryQxF3uSB1Xr1n9xhGqquBG6g+VaT9fvGF6XG7REzpWe2PMOWlYTuvrGtzXEdC
 iM0PY5oXGRVYzizvUIxz/qiGexXmtg1xBWwWUJaSAyarFshUIHiI+fVW3l2um8iySLtk
 bjABQXxWYjGIKvv9gpmm1KniuGyseQASgxn6knaXSWHytYf7ZluDQzpaNEixdZYZ02mt
 jpyceI63g3Fy0qOLrswv1EPOue6vAZ/4hxcZLazZF6Ad6Z0IuYW74BXz2YoDLJ+T+3TJ
 4Cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bu2u6MTlzgmQ7/o236tbswT/S+hmMK8el6BxRtvYroA=;
 b=q7LRTUeTEjNEb98/RJbF9FOQ1ZL92u16/gwnO+0T5TbIWguwhxHgLxaeQsiJnE1Yg8
 8R7BoXN/y2n/gBMRFKkUdGDZdMyT9dySa3Nl7eZg4ixaMlZ6HJMPIUhe7SKZcHAA3d4H
 CDbCp5u8qhm5GlhYOz7GlxnZ99g2weCCfT77I/kDUjfD0b9P9pjNs57L5LrG7E7J49IP
 FdA37kIrPsr+lreMMc63p0ENMf8jX8I1erDUyI+jHv6pbOOqsMemtt3IQD8nw5gOgISd
 5TNd9zqKVYoPmvIGfyTu+hyNMjgSl3j+fllbuWkefizcyZNfmPc7Z0g423lKqSlqwxlr
 xbOg==
X-Gm-Message-State: ACrzQf1qSSWnEJtzxQqwAYP2xf3NodO5KlmzcphYisqtPXxTXJ/3k2iK
 ZlrboN1YtvEpsNFwhjtwK/tX0g==
X-Google-Smtp-Source: AMsMyM4UbbkRyY+RbHC7z2TBwmCMfRBg4MPdTzWV9KKqCchzzAATPseVdg5Jh0p3R4rxCcErrgKoFg==
X-Received: by 2002:aca:2b08:0:b0:350:6fde:bb88 with SMTP id
 i8-20020aca2b08000000b003506fdebb88mr8242649oik.31.1664132243417; 
 Sun, 25 Sep 2022 11:57:23 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 by5-20020a056830608500b0063b2251a78asm6786808otb.12.2022.09.25.11.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 11:57:22 -0700 (PDT)
Message-ID: <687b5cf5-313c-c5ca-a96e-eeb4442fde18@kali.org>
Date: Sun, 25 Sep 2022 13:57:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 01/11] arm64: dts: qcom: sdm845: drop unused slimbus
 properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
 <20220923161453.469179-2-krzysztof.kozlowski@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220923161453.469179-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 9/23/22 11:14 AM, Krzysztof Kozlowski wrote:
> Drop properties from slimbus node: unneeded status and
> downstream-related qcom,apps-ch-pipes/qcom,ea-pc (not documented, not
> used).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index d761da47220d..9db1fce6b198 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3828,9 +3828,6 @@ slim: slim@171c0000 {
>   			reg = <0 0x171c0000 0 0x2c000>;
>   			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
>   
> -			qcom,apps-ch-pipes = <0x780000>;
> -			qcom,ea-pc = <0x270>;
> -			status = "okay";
>   			dmas = <&slimbam 3>, <&slimbam 4>,
>   				<&slimbam 5>, <&slimbam 6>;
>   			dma-names = "rx", "tx", "tx2", "rx2";

Tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>


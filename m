Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CCA5E9594
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Sep 2022 20:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518D7826;
	Sun, 25 Sep 2022 20:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518D7826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664132382;
	bh=BZLxuHxton1J29SKS+drk1iasYK5UqUCMLxUF6/eJO0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IOZ7Wrg0okKz5jRRMooj5caz7OxlOLr8wPw3XXV0lWW2NvYqckfiOsZw12lCpDqqp
	 blqpfDNSADuHENZfMjey63lf0i4mS1xOBgA4F1OxDvY4bDp50LCw1ZNaXr/fC/esQG
	 IkDDJEFZTYHCGzUxpPTbKqpYtuL2D0abE6r/nRv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF1DF802DF;
	Sun, 25 Sep 2022 20:58:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAD19F801F7; Sun, 25 Sep 2022 20:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0E7BF80137
 for <alsa-devel@alsa-project.org>; Sun, 25 Sep 2022 20:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0E7BF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org
 header.b="KU9NTpKa"
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1279948d93dso6771521fac.10
 for <alsa-devel@alsa-project.org>; Sun, 25 Sep 2022 11:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=M3tmqKTq30hnagEOzKLlmynUjQTBZCoWj+kBx7NUQOc=;
 b=KU9NTpKaj9sX6HbIO7VUMhid7Iu14PvSEZSCrkBPcJN7A0Z/b4jHSzehqFPFJ+q3hA
 Y291vI139cdUevC+1kubb6EY4ozQ50v5OezE4h2R5XkF8GP7dYPIzBXwFr/FXbHuqIKd
 u2u/LvvBDPulfI9fAyNFfxPt6J2lKH24R5mud3Yp3zk+QjqEGzO/GJiDmu9NW6kJ22kt
 X2TKZjJ9vvvCTXnpg/WVrXp7Di8ce36ceyVkGJ1dK6u9Wtm654vMKBMPNkX6ulRQ3hHl
 AbJSr5L6drEJ7Te17lbIGxVXo1iq5xmtCvkLAmOcyHVnKrqj/sM1TqaxFS5T2vKY4K3z
 LlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=M3tmqKTq30hnagEOzKLlmynUjQTBZCoWj+kBx7NUQOc=;
 b=nJY4vm7oi/EN8lpoWKlzX7+TJDKDyLVMYrhgmhqQ9l0nn2wE4zvFrUsrgLJ+R6Y4Hq
 fNZ7Iiy8HUk+rY/hAUX6Jn5R3/qIn6HUcgvan2ewCIq2efDKANtjrGfkzC0zB31xz0Cu
 j6OHYpmBDNdUD2UTYjQH1PpKkWB8y1WEDHcoTXfmANp3DN9oybApSZIMpYOkzbieGWYR
 MKEnaz0RvzOqJt/CCcV6MzQ2qKicIMr3VBHV1vnK1GJa3SXjPSSblHjdQd2A4bOZeTgC
 ewD1wfBKKVB6ZGljQg+hSHQft14/N7kiKlVnAmsv7BPJ87w/556uoFK0QNmpXFdHFF9k
 jz5w==
X-Gm-Message-State: ACrzQf3QKeR7flIokH9H4Bb6aV8jNtWY6sERmUfDo1GbMEVP7Edx8PTn
 YkxSSbxl1Ssg4o8zQoTs7DD6DA==
X-Google-Smtp-Source: AMsMyM6dfh0CcbJflisdwaZ+hNfWoQV1N1y0eqrFuZDEIicfSlJbuuNrqKvXCOmWVQCqQN9VTUWAmQ==
X-Received: by 2002:a05:6870:1694:b0:127:8d30:5afc with SMTP id
 j20-20020a056870169400b001278d305afcmr10882036oae.26.1664132322423; 
 Sun, 25 Sep 2022 11:58:42 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 u8-20020a0568301f4800b0065126423321sm6946171oth.76.2022.09.25.11.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 11:58:41 -0700 (PDT)
Message-ID: <d3218018-45c4-4777-77a7-91947ad48666@kali.org>
Date: Sun, 25 Sep 2022 13:58:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sdm8458: align node names with DT
 schema
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
 <20220923161453.469179-8-krzysztof.kozlowski@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220923161453.469179-8-krzysztof.kozlowski@linaro.org>
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

Hi Krztof

On 9/23/22 11:14 AM, Krzysztof Kozlowski wrote:
> New slimbus DT schema expect only SLIMbus bus nodes to be named
> "slimbus".  In case of Qualcomm SLIMbus NGD, the bus node is what was
> called "ngd".
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 1213f78a8b7a..7b62efb180d5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3823,7 +3823,7 @@ qspi: spi@88df000 {
>   			status = "disabled";
>   		};
>   
> -		slim: slim@171c0000 {
> +		slim: slim-ngd@171c0000 {
>   			compatible = "qcom,slim-ngd-v2.1.0";
>   			reg = <0 0x171c0000 0 0x2c000>;
>   			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> @@ -3835,7 +3835,7 @@ slim: slim@171c0000 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   
> -			ngd@1 {
> +			slim@1 {
>   				reg = <1>;
>   				#address-cells = <2>;
>   				#size-cells = <0>;

Subject has a typo - sdm8458 -> sdm845

Tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 738775E9592
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Sep 2022 20:59:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EC2D846;
	Sun, 25 Sep 2022 20:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EC2D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664132340;
	bh=yJDAl91PvGuKCMyVGWX9jGbUjE4EKfGjWCaL9cvWJa0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qRBlts/HZ+g2sHKRpI9ONcFzBdmQZ2e+jLDizvRA2+cZJ2eSAI+31CbTilk1IoGL2
	 MGpVbpQ+G+qT42be9RaBDtmJS7sm9fmY5hzWUVWFb8VC07Wwyi+UQnpLzN+2j33Fo/
	 NzQZAf3cExuCmRJ55LJOPcEouIL8nb30sMAN83uY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFFABF8053B;
	Sun, 25 Sep 2022 20:57:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B07F80539; Sun, 25 Sep 2022 20:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9874F80495
 for <alsa-devel@alsa-project.org>; Sun, 25 Sep 2022 20:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9874F80495
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org
 header.b="AfC0cdfp"
Received: by mail-oi1-x22c.google.com with SMTP id r125so5971693oia.8
 for <alsa-devel@alsa-project.org>; Sun, 25 Sep 2022 11:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=bqqG78pR7ezwwLzn7M7n9VDWc9F+Ofv/1iAE/Bm/ftU=;
 b=AfC0cdfpVaBwj3CcA7oeO0Q6l8KZlfJtTPZr9qhYm1k6IJlENkYSYRdyLKw37AU9vE
 k785gFHvSCRHViBJRXRg5X6uNVUm1cU3g6foHOFS/3dBHhx3ruuWbxlZKr2WhBo1Rh5c
 AqWLdWZ42KhVFL01dJrDVy2h7hVwmu0JTmiOqm3c+XiU4UIsuSDDYUugvQp7gSUi/tVA
 ZFh1CE0dyEZEAzQABEia1uLwT7sF4l8walPohpRjE2Pk3p01EcnkVxN+Yz90fQd6fcc/
 7ID2V4sRFT9sJD28PhFXyVe4Y5Q859zWeCOKDr3fLKJHATNlAMnD/Fnv4F419h74v762
 UYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bqqG78pR7ezwwLzn7M7n9VDWc9F+Ofv/1iAE/Bm/ftU=;
 b=QgoAX8j2fKqRRBFLsTi4ThXWZxSHnucd2xEDuEdbQxDw6KVZhtClthj2Ul4am1G/qW
 GmEEtLYHv+Q0TjVRSzlsY9oR1elI+jSlqHClOkwsRC+AnAShwi60BeWsqcgJkmfW9krX
 QY/v6Y4/40HNWsC7JuHW6dylyiI/a06HdGY3uLG8Ad1++Yb8+8OGN+K92Wp/PboNdHlN
 QhHiatw4gmO/cNJ52Vj2WODBHdHDVUhVKK8PNspHBW+Ha0zCB+TfZkpNde9OjX4lH0gG
 /o7tMVIKc0ecqjhlBzCuFi5n2jElugWriyhBT78EWPBr1MZ+SSXZcduf/toJkGsNY3oc
 /owA==
X-Gm-Message-State: ACrzQf0BeKf729Rso+o1IIvNiqNHESGr7T6l0KedaCwlcDByUEL89OXs
 DLDnlrFQKF7MmB8IUzCqMTZFmg==
X-Google-Smtp-Source: AMsMyM6PPcl7/+jBEtRKosva+dM1Z8fxPO/owiGiHAPokcfw8mny0h3O3HTdso08LYBH2GJglszuKQ==
X-Received: by 2002:a05:6808:188e:b0:350:6212:4f34 with SMTP id
 bi14-20020a056808188e00b0035062124f34mr13147961oib.144.1664132258120; 
 Sun, 25 Sep 2022 11:57:38 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 a184-20020acab1c1000000b003436fa2c23bsm6281560oif.7.2022.09.25.11.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 11:57:37 -0700 (PDT)
Message-ID: <d337655c-dd86-2c99-fd26-5a4a44ea98fa@kali.org>
Date: Sun, 25 Sep 2022 13:57:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sdm845: correct slimbus children
 unit addresses
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
 <20220923161453.469179-4-krzysztof.kozlowski@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220923161453.469179-4-krzysztof.kozlowski@linaro.org>
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
> slimbus uses address-cells=2, so correct children unit addresses.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 9db1fce6b198..2264bba69f84 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3841,12 +3841,12 @@ ngd@1 {
>   				#address-cells = <2>;
>   				#size-cells = <0>;
>   
> -				wcd9340_ifd: ifd@0{
> +				wcd9340_ifd: ifd@0,0 {
>   					compatible = "slim217,250";
>   					reg = <0 0>;
>   				};
>   
> -				wcd9340: codec@1{
> +				wcd9340: codec@1,0 {
>   					compatible = "slim217,250";
>   					reg = <1 0>;
>   					slim-ifc-dev = <&wcd9340_ifd>;

Tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>


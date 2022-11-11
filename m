Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EEC625FBF
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 17:43:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED7361689;
	Fri, 11 Nov 2022 17:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED7361689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668185014;
	bh=w7raLjr857M2d95XTLznxSIkAdf4yS+Ewi2v8cI5tRI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZcBHX7bUBuqJoQWBz0NgDd2Gk0FT5eLzHNEqq0K/7yThPul2U+8+Sk8PRqjotXx6
	 RCfow689SAR6zC2n0wBhXyr/V3wIliBfGQRhrRlKcY1P3d95xdDjQl5KS0UjN5Mrey
	 hrlNrQTOKyx8ChIcFMk/rVbADR9TMZZX7NZOE3e8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E54A9F80162;
	Fri, 11 Nov 2022 17:42:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D431F80519; Fri, 11 Nov 2022 17:42:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 732EFF804AB
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 17:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 732EFF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oy6gPYB5"
Received: by mail-wr1-x433.google.com with SMTP id a14so7161831wru.5
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 08:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jLuR2VWvIX9pMUk66TarZozpZh1wCQd9RADTJwmvxkM=;
 b=oy6gPYB5GEObYkXtO86u2ukNIhs4ZE4MkQHohRL1Io8Jsuv79Qxy2NhphVAKjSiURu
 bbL11/gsu2Iix8RrqLDXHp7poDVunxH1jd0u3PFZaclwSXmZwnOGp552IwB04brJSLPU
 8A+aRMjSvDmuFsueyrhC/y8nNACHPFu1pAKNe5ez5BYcBeTFeUTxQ4X12VmgxnLWe6jz
 X4FrfkEvdR+efUCUNi2fYFD4ZaWAL2rralFmzBf+tGIA5xh1NC/hI5RV7ZuV9RsRFaJq
 YZ75CZJku5nVXKsRSrfxOLz64XeuO/nwXYLwaVK6n/xddJv46PZVYiwp6Riez2iw1mEc
 q4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jLuR2VWvIX9pMUk66TarZozpZh1wCQd9RADTJwmvxkM=;
 b=mdM3o64okPW5nWnWOMrE8c1MxmQdYp2jNRgfaUzWbGdM4alPrLI2eHrU3IvNw04ceJ
 N5A+rqcd3oVR6wruZP2VprpnAcE2DY4QYwaD+NWCZxDB3rK3nAGYk1Hk58mO+XbtgBrX
 srhXAKxknPEVJrhTbzCzPjdXPWP7pesfuUv1VnskS7l6fdQSAJCSr67Djq7VSUUI5O/e
 lRVEC5CGTAwSFfQauECXyFtwPeo9MFUl6E4xGErVrkOALjFlO2G9s/ihTOQhtWM7MS0v
 oDCgv37KeSWNlmAi+9YsOORuulnRtUX/DL84tmlqJ/5DOp+46O3vQHbd3CdKhecEQ5xJ
 XE0A==
X-Gm-Message-State: ANoB5pmwq4fphGGVB/Wfc4v2muTZDAvo/Dqu5tmE6n3CRh5my8YMzySk
 pBZkIF6Oasos0rqdL/QL6rc7Pw==
X-Google-Smtp-Source: AA0mqf5Hhw3d5lwAqvy2lPvMVZhb9BL560UK90bhcGji4XJfrDGDLN1s2XcJv0l2tnXnm++pw4DYSg==
X-Received: by 2002:a5d:4cd0:0:b0:236:757c:54a1 with SMTP id
 c16-20020a5d4cd0000000b00236757c54a1mr1791120wrt.106.1668184934550; 
 Fri, 11 Nov 2022 08:42:14 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 j5-20020a05600c1c0500b003cfbbd54178sm14270442wms.2.2022.11.11.08.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 08:42:13 -0800 (PST)
Message-ID: <c227c62e-4906-698c-fc27-11d17d6b0817@linaro.org>
Date: Fri, 11 Nov 2022 16:42:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom, wsa883x: Use correct SD_N
 polarity
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
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



On 10/11/2022 13:35, Krzysztof Kozlowski wrote:
> Use correct polarity in example and powerdown-gpios description.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> 
> Changes since v1:
> 1. New patch.
> ---
>   Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> index 6113f65f2990..99f9c10bbc83 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
> @@ -23,7 +23,7 @@ properties:
>       maxItems: 1
>   
>     powerdown-gpios:
> -    description: GPIO spec for Powerdown/Shutdown line to use
> +    description: GPIO spec for Powerdown/Shutdown line to use (pin SD_N)
>       maxItems: 1
>   
>     vdd-supply:
> @@ -47,6 +47,8 @@ additionalProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
>       soundwire-controller@3250000 {
>           #address-cells = <2>;
>           #size-cells = <0>;
> @@ -55,7 +57,7 @@ examples:
>           speaker@0,1 {
>               compatible = "sdw10217020200";
>               reg = <0 1>;
> -            powerdown-gpios = <&tlmm 1 0>;
> +            powerdown-gpios = <&tlmm 1 GPIO_ACTIVE_LOW>;
>               vdd-supply = <&vreg_s10b_1p8>;
>               #thermal-sensor-cells = <0>;
>               #sound-dai-cells = <0>;
> @@ -64,7 +66,7 @@ examples:
>           speaker@0,2 {
>               compatible = "sdw10217020200";
>               reg = <0 2>;
> -            powerdown-gpios = <&tlmm 89 0>;
> +            powerdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
>               vdd-supply = <&vreg_s10b_1p8>;
>               #thermal-sensor-cells = <0>;
>               #sound-dai-cells = <0>;

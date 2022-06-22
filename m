Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D387A554D87
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 16:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E73511F19;
	Wed, 22 Jun 2022 16:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E73511F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655908644;
	bh=Mfp2BeBVq6bV/1ErCGPphipCkjcpTn9qNf72+MXtk1U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W5PQ8fVkWnA/I5CYSLm/Nb1Aj/4b6f/qdojQNZtWMjb8Iq8/0iTQVTE2jm1tdbpvo
	 gmTksVdg78qwFBgt1VEtigowM16jEQbHeQ9hW/eOV7UUuMGGM40wAD4ir+cq2MXsga
	 /+rhbdPVTpttowJZo+pgWpm1hjgcegg8yb/9gLEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F1E2F802D2;
	Wed, 22 Jun 2022 16:36:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8F73F8032D; Wed, 22 Jun 2022 16:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE890F80100
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 16:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE890F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kCCLYtTs"
Received: by mail-ej1-x636.google.com with SMTP id pk21so11580486ejb.2
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 07:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sVFftXXsJ84XlZCYREHvxrVknOai2VbLYQhFhTdEQV8=;
 b=kCCLYtTs6BdRbsM5Q0vOu3Q+GqBQSSoCoxrkNY67vt5/v8Y+FLPyAPWL+60+TTrauL
 zh5iWxu+fyZUHdhWURnBLMd7LkBWf2KzQAcjeg0q1qq5bsV9ILBN2yrHkmml9aT9YybS
 0eZbAGbasOOHwg4W6SglS3Zc4JF7FjvtuJoZ/DjKzytVWkUKPfalnmuL2QrF6xdJaJw1
 laFmIKzsamSlwgXdme0Sjl9bURcXDVshCrAO7XuWFFCFrZbaumW4qassy2Up6uQrQejT
 p6FtvyA5Ql304V19AtHWsaJbdVL2KWqwKwkDtWPXdzDCGWQa9lXCDyz3zFm+l9RcE5dK
 8Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sVFftXXsJ84XlZCYREHvxrVknOai2VbLYQhFhTdEQV8=;
 b=FMFH+9HYCK5RQ8oLwMW8Syjv8kNZqyhKBLmuCPqXquWC7yG7Y8ABKx2/csE/IiE+5r
 yCGoZM5YNoUVrgdbjQcazS/WFfpF8n9/UUakiiGn2SgNEkvBq7IWmIJd0UsNjvkID4ka
 +Pl0O+EKURW2tE94MApn7+G2/2VfVrFAFZuoMCzwBLhIANFBgj0Mau2Fzc/OnZP0uF8+
 nXIKSFcl38T6yfqZsbmPupBGBqI7xGpPxrCDDXwU9XGl5Aq2n+DAKW5Y/zZqLLsSuVsp
 WgXAA9pKXauFSnjovxI47fMmRd0c+mMu5QPl05TJj3b1Gee1md1OCoi4tME6JUfP/6b2
 jDFw==
X-Gm-Message-State: AJIora9zronkbpw32gNXCRLYmek3HsGgY70WTAtGwDDdDLNMvZKi6iPb
 wt7iBotSUvCJ/20GhUqJmLIQHA==
X-Google-Smtp-Source: AGRyM1uwFC++Lw8p9dKz+mshKztzdMs8eIfV+UxHrUOLIytswwE0ZWXzW6oujtExt49x6Sg3trORlQ==
X-Received: by 2002:a17:906:1109:b0:711:da3b:bdcb with SMTP id
 h9-20020a170906110900b00711da3bbdcbmr3257318eja.210.1655908583962; 
 Wed, 22 Jun 2022 07:36:23 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 c5-20020a056402158500b004356b8ad003sm11041051edv.60.2022.06.22.07.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:36:23 -0700 (PDT)
Message-ID: <60b0074f-f29b-da1f-d6d0-0085e17e5dcb@linaro.org>
Date: Wed, 22 Jun 2022 16:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Use WCD9335 DT bindings
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20220622064758.40543-1-y.oudjana@protonmail.com>
 <20220622064758.40543-4-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622064758.40543-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
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

On 22/06/2022 08:47, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Replace DAI indices in codec nodes with definitions from the WCD9335
> DT bindings for devices that use WCD9335.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dts         | 5 +++--
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts  | 5 +++--
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts | 5 +++--
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> index 49afbb1a066a..ff915cd8e5a6 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/sound/qcom,wcd9335.h>
>  
>  /*
>   * GPIO name legend: proper name = the GPIO line is used as GPIO
> @@ -1009,7 +1010,7 @@ platform {
>  	};
>  
>  		codec {
> -			sound-dai = <&wcd9335 6>;
> +			sound-dai = <&wcd9335 AIF4_PB>;
>  		};
>  	};
>  
> @@ -1024,7 +1025,7 @@ platform {
>  		};
>  
>  		codec {
> -			sound-dai = <&wcd9335 1>;
> +			sound-dai = <&wcd9335 AIF1_CAP>;
>  		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
> index 22978d06f85b..261f2ea7def0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
>  #include <dt-bindings/input/ti-drv260x.h>
> +#include <dt-bindings/sound/qcom,wcd9335.h>

Keep the order, so this goes before input (even though it is not really
alphabetical, but that's life...).

>  
>  / {
>  	model = "Xiaomi Mi 5";
> @@ -193,7 +194,7 @@ platform {
>  		};
>  
>  		codec {
> -			sound-dai = <&wcd9335 6>;
> +			sound-dai = <&wcd9335 AIF4_PB>;
>  		};
>  	};
>  
> @@ -208,7 +209,7 @@ platform {
>  		};
>  
>  		codec {
> -			sound-dai = <&wcd9335 1>;
> +			sound-dai = <&wcd9335 AIF1_CAP>;
>  		};
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
> index 1e2dd6763ad1..c9f935cfb587 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
> @@ -9,6 +9,7 @@
>  #include "pmi8996.dtsi"
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/sound/qcom,wcd9335.h>
>  
>  / {
>  	model = "Xiaomi Mi Note 2";
> @@ -171,7 +172,7 @@ platform {
>  		};
>  
>  		codec {
> -			sound-dai = <&wcd9335 6>;
> +			sound-dai = <&wcd9335 AIF4_PB>;
>  		};
>  	};
>  
> @@ -186,7 +187,7 @@ platform {
>  		};
>  
>  		codec {
> -			sound-dai = <&wcd9335 1>;
> +			sound-dai = <&wcd9335 AIF1_CAP>;
>  		};
>  	};
>  };


Best regards,
Krzysztof

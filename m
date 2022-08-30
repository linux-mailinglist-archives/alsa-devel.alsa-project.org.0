Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A35A5F6E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 11:29:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23371169D;
	Tue, 30 Aug 2022 11:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23371169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661851787;
	bh=t2sXGhTn/ac48yQ9/u5cyaBUT2jGdyly46ervd1eQA8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qcUj1UHac/P19/g9LdN7mWWNfF7xDcM5EciAIBVkWfogvlNfy8/7s5768ZE6sOfDl
	 MAUgtJiGsWzi3aZ+RWbTD7n3r1L/N4T61c83rc9BXRgxCBlbt6+fBE8Iief3DM+Z37
	 Zk/yWq5LgMryXzD2hkz3ugLwZs+yGI2GvIz8kkbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A538F8032B;
	Tue, 30 Aug 2022 11:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78855F8023A; Tue, 30 Aug 2022 11:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E31EEF800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 11:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E31EEF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="l/RBizF6"
Received: by mail-lf1-x133.google.com with SMTP id p5so11550405lfc.6
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 02:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=FmzIDD4Pa7+MmcfVJAwljvGaSQDMssbd6GqQpiHG2xs=;
 b=l/RBizF6kzePEfcYyZqRb6nMeIozE3Plc6MK0BE1z9FSW6eEoTADB7lH50rjVtKVQq
 aTqmCKBtnm6wV5Kxht5W+Ewwq+uFCzHlcHlgGiTPkWOJdSETsWYLh61oYlnGg5owVOt4
 gTgRcao62+Di9UQGpr8ywKs/U7T16LOlJPS3gfiRUCGgQ1t+mGhWOrabo3LCkRdrlRhV
 LGOm4OsQsPsCD1yoyrc1650LghtiO8wVRy/t2PRKP/bbZ8GUCFO4sCcWknY7m03qo9ei
 zhMZEP9GT1iqij0GtA82IvCC+xLVClsJgUcZzL92rTS+HteejrYHKWXXwNnafYTLpewu
 Yppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FmzIDD4Pa7+MmcfVJAwljvGaSQDMssbd6GqQpiHG2xs=;
 b=PuW1vNHiXKKhv5T7TS6mqQOGWLtnG+qYoOg9kHzHog+HmaXo9vb+uj9vSffVr/JEHI
 vbtvH29LRyVxFd+Xdn590aoXmiY4T3f75+ECPJRRyonJ9a1tauakZ1pE+tjjMpKxHLNq
 63lJcMpb684/gf/9jfa7uWxhChC51oKS0RA4TPbeHdieuKlIXn+K4Up3gToNS0vCgd18
 QR/vBnAT1EoBKe0w4LeSmNZHiz1rkB2kbV26n/zkZV3F5vN0EdNTwJRKz5EeSqDUVt3B
 tr5uRlD2yT5C4Kj9z2MWlmKox040dldjhj8sIJrLrBb8zTaY1k+5KyD/jLHEyc8b6I59
 d8qA==
X-Gm-Message-State: ACgBeo0hX7Nc/06SKqEW0Yzc5peHw0IcOAlslwDnoZ/2IHoyDkQ4kjFC
 KObJ+YrYlyLyAMOkado+BPlbRQ==
X-Google-Smtp-Source: AA6agR4+KSqYDLnziLnnQeT1r6I0LXNAxazi5IGv/j87wuVt+YLGrV9a67iwU0YcX+hsxrZFnxmBBw==
X-Received: by 2002:a05:6512:10d4:b0:492:ede1:ec75 with SMTP id
 k20-20020a05651210d400b00492ede1ec75mr7014503lfg.146.1661851713946; 
 Tue, 30 Aug 2022 02:28:33 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 t28-20020a056512031c00b00492e4c97ca3sm85446lfp.246.2022.08.30.02.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 02:28:33 -0700 (PDT)
Message-ID: <f614f968-baf4-6b4d-507e-29221e1469bc@linaro.org>
Date: Tue, 30 Aug 2022 12:28:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/5] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign platform driver name
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@nxp.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
References: <20220829075144.2405000-1-chancel.liu@nxp.com>
 <20220829075144.2405000-2-chancel.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829075144.2405000-2-chancel.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
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

On 29/08/2022 10:51, Chancel Liu wrote:
> Add a string property to assign ASoC platform driver name. It also
> represents the rpmsg channel this sound card sits on. This property
> can be omitted if there is only one sound card and it sits on
> "rpmsg-audio-channel".
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 34 +++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> index d370c98a62c7..35e3cb9f768b 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
> @@ -11,8 +11,11 @@ maintainers:
>  
>  description: |
>    fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
> -  are SAI, DMA controlled by Cortex M core. What we see from Linux
> -  side is a device which provides audio service by rpmsg channel.
> +  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
> +  Linux side is a device which provides audio service by rpmsg channel.
> +  We can create different sound cards which access different hardwares
> +  such as SAI, MICFIL, .etc through building rpmsg channels between
> +  Cortex-A and Cortex-M.
>  
>  properties:
>    compatible:
> @@ -85,6 +88,14 @@ properties:
>        This is a boolean property. If present, the receiving function
>        will be enabled.
>  
> +  fsl,platform:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: |
> +      A string property to assign ASoC platform driver name. 

No, this is not a property of hardware. Naming of some drivers in some
systems does not fit DTS and bindings.

> It also
> +      represents the rpmsg channel this sound card sits on. This property
> +      can be omitted if there is only one sound card and it sits on
> +      "rpmsg-audio-channel".
> +
>  required:
>    - compatible
>    - model
> @@ -107,3 +118,22 @@ examples:
>                   <&clk IMX8MN_AUDIO_PLL2_OUT>;
>          clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +
> +    rpmsg_micfil: rpmsg_micfil {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Also: no underscores in node names.

Best regards,
Krzysztof

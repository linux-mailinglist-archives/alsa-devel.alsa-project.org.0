Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B00F5E7865
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 12:31:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6228210;
	Fri, 23 Sep 2022 12:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6228210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663929098;
	bh=0Q1Know/giD6NWxPT+u2mk1ZhkyH0ELGJzdnG7xznTs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIi/PraC/p6RMSN6fIaCU391ZcgqqpNre666RU2czvAntzAbYbPRkZOJPCkgkR1w4
	 YbVnB7xKUf4i9WAAP5yXZMmGZDxU7mJoAErfHLg8yl0EPCTN22jVCbmWFMCNzkMDln
	 jm5m3Cs/DFt0g9fxy0ENTJOhkCEu8zGCxwhgNsuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B07F80431;
	Fri, 23 Sep 2022 12:30:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7943F80269; Fri, 23 Sep 2022 12:30:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD95FF80107
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 12:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD95FF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PiyEHGgC"
Received: by mail-lj1-x235.google.com with SMTP id q17so14097478lji.11
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=I7e7inRGZJBBrCxWPf4VaG+f6kEpOQsdfxaR6MXxAk4=;
 b=PiyEHGgCKoygApaBJYQHYg/kBKkhs9/+zycl/WsVJbpxF9ZqAtwPwgNbbc8rir7qvc
 S2EQXUP0LwJVFyS/1ewNiUVYBwQJPeNlmWq7XUp74KDxEiJ3ZMqUciOiFX4dqVFPjvPZ
 0kPJnpgaECDcVhKiRpzU2qcIan4qzQ8a/cUdm5m2mGzvungWfpPllAtMfQ8fgKUeyVj0
 OU0rpxHHtmuUfMqvx/C1mJ2vZz4+nEzDKXFx9G9TqfZVoP4ZdZoiGHPq2VTpgrIIdhV0
 gB8LUCZlYZIBQxyOi2dYxTx96QfoVomXj6Ul83rLvBCCBiyaDss3j3GmVRguX68z+By5
 RvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=I7e7inRGZJBBrCxWPf4VaG+f6kEpOQsdfxaR6MXxAk4=;
 b=cyqUI5qa4Dm3hsw2aSqlX7uzz0OHwLE9MXkaqP1SzGGfymwBW6Xt1NiTn7H/eeAvXW
 l0SRZ9E9Th8latcrubALeTEbWIHNRYuDYjE4erobpTg/A8a6aZW1OxZCH7X6f+Mn0xxh
 MutRyM/rXvC0yGICmCGT3n/OZPuAMUebkbH72egHfy0Ia31UV7fX9Mjv6SkMe60oe/+/
 Z9W8mjEUTt4Fp9sZkliUa1LDMPWR+HVVAoIHgi0dSRi8n0ZsDePsySpxO8YuSx496San
 llvPNMrdc8rdiM+FP1kDYLXPHFNPWMiQKNAireOE5d15lDH+TsDMjg+V5i45Qi0O2U2L
 UGYA==
X-Gm-Message-State: ACrzQf0BmfB2ATswOmcXdAyPaBJOzuQLgyCv4RUvEOpl9RfO/M4Hy+Nn
 RaHeqOrHqFMXKSW9ezN9VXk6Ew==
X-Google-Smtp-Source: AMsMyM4qX9eM1McoAFz/vkeBKtYPlXtNk3BWIHaS4QHrJQN/+tsnpIR0MUKpVPKb4Wfv3WTnHNtCjQ==
X-Received: by 2002:a05:651c:a05:b0:26c:5010:39d1 with SMTP id
 k5-20020a05651c0a0500b0026c501039d1mr2768953ljq.115.1663929029776; 
 Fri, 23 Sep 2022 03:30:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 f16-20020a2ea0d0000000b00268335eaa8asm1317133ljm.51.2022.09.23.03.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 03:30:29 -0700 (PDT)
Message-ID: <eba9df27-cf91-b20d-bdc1-5acc5f02753a@linaro.org>
Date: Fri, 23 Sep 2022 12:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign the rpmsg channel
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, Rob Herring <robh@kernel.org>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
 <20220914105145.2543646-2-chancel.liu@nxp.com>
 <20220916185048.GA1061412-robh@kernel.org>
 <VI1PR04MB4222BDB1378A01E99DFC6211E3519@VI1PR04MB4222.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VI1PR04MB4222BDB1378A01E99DFC6211E3519@VI1PR04MB4222.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.J. Wang" <shengjiu.wang@nxp.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>
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

On 23/09/2022 11:56, Chancel Liu wrote:
>>> Add a string property to assign the rpmsg channel this sound card sits
>>> on. It also represents the name of ASoC platform driver. This property
>>> can be omitted if there is only one sound card and it sits on
>>> "rpmsg-audio-channel".
>>>
>>> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>>> ---
>>>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 37 ++++++++++++++++++-
>>>  1 file changed, 35 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>> b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>>> index d370c98a62c7..3744ae794c00 100644
>>> --- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>>> @@ -11,8 +11,11 @@ maintainers:
>>>
>>>  description: |
>>>    fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
>>> -  are SAI, DMA controlled by Cortex M core. What we see from Linux
>>> -  side is a device which provides audio service by rpmsg channel.
>>> +  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
>>> +  Linux side is a device which provides audio service by rpmsg channel.
>>> +  We can create different sound cards which access different hardwares
>>> +  such as SAI, MICFIL, .etc through building rpmsg channels between
>>> +  Cortex-A and Cortex-M.
>>>
>>>  properties:
>>>    compatible:
>>> @@ -85,6 +88,17 @@ properties:
>>>        This is a boolean property. If present, the receiving function
>>>        will be enabled.
>>>
>>> +  fsl,rpmsg-channel-name:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description: |
>>> +      A string property to assign rpmsg channel this sound card sits on.
>>> +      It also represents the name of ASoC platform driver. This property
>>
>> That's a Linux detail which doesn't belong in DT.
>>
> 
> We pass hardware parameters in dts node to set up clocks or other
> configurations. These configurations are finally sent to Cortex-M by
> rpmsg channel because Cortex-M actually controls real hardware devices.
> If there's only one sound card sits on one rpmsg channel we will not
> need this property. But if there are several sound cards we need to
> specify correct rpmsg channel. Thus hardware configurations can be
> properly sent to Cortex-M. From this level to speak, this property is
> hardware-related since rpmsg channel represents the real hardware audio
> controller.
> 
> Here I attach the discussion in version 1 patches for your information:
> ---
> This property aims to tell the ASoC driver which rpmsg channel the
> sound card depends on. If there are several sound cards sit on rpmsg,
> we should pass correct information in dts node to specify the name of
> rpmsg channel. That is why I meant to add this property. 
> 
> Actually this property is hardware-related. As we discussed before,
> this kind of sound card based on rpmsg works under this mechanism
> Cortex-A core tells the Cortex-M core configuration of the PCM
> parameters then Cortex-M controls real hardware devices. This property
> specifying rpmsg channel represents the real hardware audio controller.
> ---
> 
> That's my idea adding this property. Do you have any suggstion?

I think you misunderstood the comment. Rob's comment was directly below
a line which he referred to. That line contained a statement referring
to Linux drivers. Anything related to Linux drivers does not belong to DT.


Best regards,
Krzysztof


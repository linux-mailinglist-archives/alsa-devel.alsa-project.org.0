Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF55B69BC
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 10:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC7F5174F;
	Tue, 13 Sep 2022 10:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC7F5174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663058444;
	bh=m3d6S486SVKKIqpW604KWm0xL1C98oEX5KXtTG0aYhg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ChtS3/zO/YnW1SJoSIQQx/h6oiW8UPJi8Y3KymfVbmYnyYkd5rvbR19OekuumNU3e
	 gRPt3b0xE/mVq+f8hzjO11RHNsNU1IG5pfDSDbWQhBhWk+HAlKaCA3mObZvB1G8ipo
	 yaY/fTKRgrNUOin3rmaH9b8bWJwaeSAmIK8Ys1/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 010AEF8025D;
	Tue, 13 Sep 2022 10:39:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A509F80154; Tue, 13 Sep 2022 10:39:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9350F80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 10:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9350F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IqhQhQ7V"
Received: by mail-wr1-x42a.google.com with SMTP id e20so19524140wri.13
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=uXn2kJmSnOy/skqD13Z6q/Bm/edUDnU+xZ+VxBn/tq8=;
 b=IqhQhQ7VlpeOfvp3Gjx1Jcswtb9IN9La2TCB/B6Ps/qALDH7gISIMKnvskAfLI6vKi
 LazyuZYo/rapSrf/MnH4Y69v24Q/3UV0iGMxpkZ/l3zAk/93Z+yzUXuuAfW5M49dLXzy
 d1mGbjxif3uXKOQHxc/+jzCkFYEyHe+NZzH4QkloJgVHyLM4FKs509jw+v+ZMQCWUQ+h
 5w5RGsYJ1FQZVJN8aQ294C4SafBWv037zj2MISDbzb27woZbF8Cv9Q24HHFWL+HW3HHf
 uIIThnOhiNcpve3kl0zOCN41VN386ct5qS1YBOg1y//Jr+C0JfQvcft31yY29yGv/9LG
 tOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=uXn2kJmSnOy/skqD13Z6q/Bm/edUDnU+xZ+VxBn/tq8=;
 b=UieoO98cy2gbhXAj7mIgkp+HHdYf5nfakiiuKGGp7Sw59tdxPeCYGX0aZGSO/Zw3kC
 MwIbdubqc00lP0TjD6jckqWHqtb6gR/f7T+cikc+qpHqxH2fVUmNxerkb7xtqMx9zDyd
 TPsJTawO6YebUYGgHVBcuK1VM+u9vAQHrfC94x7VEzbUpkKGMtOE8iTcpB9S2uUmexC+
 8TghjLMyPRvMmZUpz8dml6WmBf+Qm8YFuaBCh2yJei/PjCBwEcudepC/1nAxxLwH7sSN
 wiID759N16Axvljjyi05gZcVK+fSwMEhb63a8ZpMIQt9ynFvgsX82R9Bu948KXqdp+av
 pUlw==
X-Gm-Message-State: ACgBeo1NHGLBXxRkze8etdVtBeL1gf+n1MEP1730+je0tSwPSsrJNYSz
 90Q42k8xJK9YtvjIymLWK8MH5w==
X-Google-Smtp-Source: AA6agR6xDP8YhUAqPRV2B1RS5sMRp8HTP1cLkkOYlHerD1lbSH3yDIQOMd8tXRMgT1B4nqloLOQuGw==
X-Received: by 2002:a05:6000:2a6:b0:22a:baa9:3103 with SMTP id
 l6-20020a05600002a600b0022abaa93103mr2430328wry.376.1663058375003; 
 Tue, 13 Sep 2022 01:39:35 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a5d5085000000b002253d865715sm9870008wrt.87.2022.09.13.01.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:39:34 -0700 (PDT)
Message-ID: <e160baf1-cca9-46b6-eaf7-129b1b1eb9c3@linaro.org>
Date: Tue, 13 Sep 2022 10:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/5] ASoC: dt-bindings: fsl_rpmsg: Add a property to
 assign platform driver name
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "S.J. Wang" <shengjiu.wang@nxp.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <VI1PR04MB4222EAA244F7A7F179E85500E3479@VI1PR04MB4222.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VI1PR04MB4222EAA244F7A7F179E85500E3479@VI1PR04MB4222.eurprd04.prod.outlook.com>
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

On 13/09/2022 09:14, Chancel Liu wrote:
>>> Add a string property to assign ASoC platform driver name. It also
>>> represents the rpmsg channel this sound card sits on. This property
>>> can be omitted if there is only one sound card and it sits on
>>> "rpmsg-audio-channel".
>>>
>>> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>>> ---
>>>  .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 34 +++++++++++++++++--
>>>  1 file changed, 32 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>> b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
>>> index d370c98a62c7..35e3cb9f768b 100644
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
>>> @@ -85,6 +88,14 @@ properties:
>>>        This is a boolean property. If present, the receiving function
>>>        will be enabled.
>>>
>>> +  fsl,platform:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description: |
>>> +      A string property to assign ASoC platform driver name.
>>
>> No, this is not a property of hardware. Naming of some drivers in some
>> systems does not fit DTS and bindings.
>>
> 
> This property aims to tell the ASoC driver which rpmsg channel the
> sound card depends on. If there are several sound cards sit on rpmsg,
> we should pass correct information in dts node to specify the name of
> rpmsg channel. That is why I meant to add this property. I just want to
> use a string property to distinguish different names of rpmsg channel.
> 
> Actually this property is hardware-related. As we discussed before,
> this kind of sound card based on rpmsg works under this mechanism
> Cortex-A core tells the Cortex-M core configuration of the PCM
> parameters then Cortex-M controls real hardware devices. This property
> specifying rpmsg channel represents the real hardware audio controller.
> 
> That's my idea adding this property. Do you have any better suggestion?

Any reason why not using phandle to sound card node? If your property is
about rpmsg channel name, use something like that, e.g.
"fsl,rpmsg-channel-name" or What you wrote in property description and
here are quite different things...

Best regards,
Krzysztof

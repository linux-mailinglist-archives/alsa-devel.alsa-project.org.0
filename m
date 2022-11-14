Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E0627694
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 08:46:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9FA71620;
	Mon, 14 Nov 2022 08:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9FA71620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668411975;
	bh=/ty9siJAgNDhydtrLcyc+v365/d0kM858La0JmigJfA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2q1oTLxWALrIJsTyC64xNAnLB+qog4CHD8MqK3ZsASfx+4Dv6KntnR6vs05k8DJd
	 PzzUzzE4w1pFzLBgxnk52ImMaRGr9rguUeLnI9aX56XxP5IlLvff0z0bIAPCO2HBMk
	 oS8VikoHwuRiN4v2ZnJ/75YPod1t05ZfaEVM5eOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 565CEF800AA;
	Mon, 14 Nov 2022 08:45:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38EB2F80431; Mon, 14 Nov 2022 08:45:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODYSUB_1,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80460F800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 08:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80460F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CoOlY/Jy"
Received: by mail-lj1-x234.google.com with SMTP id d3so12082959ljl.1
 for <alsa-devel@alsa-project.org>; Sun, 13 Nov 2022 23:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RThUDKfaIW0h3m+CPW+odfwhZdY9NoazLhG6pvsOy0A=;
 b=CoOlY/JyiNs3rBh4briKTbLMg62G/yRn3DUkMDJzget5JbFD8S18U9q/bf7kLwdCgA
 H3WNJ8E68XjGyJt6t/VX9NRljtJ/StNuprqE8a+BwtF+G5u+qwj02RRjSu7dyKQA3qPp
 zO6eg8WjvAkD5HHTbYyjnYAL0M+YeYyobzzX6BqqVdCZD5Qkwotvga0tUWQGssdtOaYL
 GHL97W+2ldZtctrLynDhXX4MiYSYtXgORw8klZwSedUBxZzwifo/qk4IkbwZbUxMQCCe
 V3smUKYYzFPsX1I8CJCdOuBMLOdXt0LHAgEhcpvx6YsaXCanmx6EuwYd5xit9wZR+8yN
 Ktew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RThUDKfaIW0h3m+CPW+odfwhZdY9NoazLhG6pvsOy0A=;
 b=BLmDrilMqtM+r6jQxJk0u9lsgPTWN636ssCj78o4ooRWsk0+pyNjn9zMPr7/2d6TeI
 i59XNrckxcnDn8un90GTiJ2+M1cURGQqfu3+ZPnmE06VcTRgjzEeVHH3KWkH3PumEg1J
 gG6TrDgpY3WIL9gGRXokqBjLGdetnyawsa9eKupIFNsDGMpA2XZHyL63MxsUbK+Wp3up
 LyV+lrEl5Ab8m9mivBj+fxZUskGJ8faG9vrp/t+0E0QoRoteurDQIK82qLMV3kgMvbTQ
 dGnPSqTB0KkdPKLt6EmYlUtrvRDXQF0W1Pphn9VBeZExz+g/deTuTdlMp4h9C0ZccNO1
 zo7g==
X-Gm-Message-State: ANoB5pm+qS8FPf0O64M71VvgO8F1crdgzv8bBUnVsPOZvtcDyYhRrmwP
 KuWUSA5RpZcD3CIOsahN+j2Fng==
X-Google-Smtp-Source: AA0mqf6Je7SzJ0/6XL2Blpt4CrFzA9c9QJH8q3G+IlddOO2mBMpg0spYsMrpNNrOy4sFVty13KIf3Q==
X-Received: by 2002:a05:651c:12c9:b0:26f:c03d:f99b with SMTP id
 9-20020a05651c12c900b0026fc03df99bmr3814983lje.190.1668411912583; 
 Sun, 13 Nov 2022 23:45:12 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 cf30-20020a056512281e00b00492ca820e15sm1711964lfb.270.2022.11.13.23.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 23:45:12 -0800 (PST)
Message-ID: <6df681b1-318c-ea0a-8add-e0a18302eaf7@linaro.org>
Date: Mon, 14 Nov 2022 08:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/10] ASoC: dt-bindings: qcom,apr: Split services to
 shared schema
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <20221111113547.100442-3-krzysztof.kozlowski@linaro.org>
 <5207a28b-9c8c-5014-28c1-15635ad30143@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5207a28b-9c8c-5014-28c1-15635ad30143@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
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

On 11/11/2022 17:35, Srinivas Kandagatla wrote:
> 
> 
> On 11/11/2022 11:35, Krzysztof Kozlowski wrote:
>> The APR/GPR nodes are organized like:
>>
>>    apr-or-gpr-device-node <- qcom,apr.yaml
>>      apr-gpr-service@[0-9] <- qcom,apr.yaml
>>        service-specific-components <- /schemas/sound/qcom,q6*.yaml
>>
>> The schema for services (apr-gpr-service@[0-9]) already grows
> 
> I have not seen these grow or change alteast in the past 9 years.

You added GPR to services in 2021, so it grew past 9 years. Then it grew
in 2022 when I started adding missing pieces - missing compatibles and
properties.

> 
> Old APR (Elite f/w) and new GPR (AudioReach) interface provides access 
> to static services on the DSP.
> 
>> considerably and is still quite not specific.  It allows several
>> incorrect combinations, like adding a clock-controller to a APM device.
> 
> This should be fixed for sure for validation.

This cannot be fixed without making schema over-complicated. It includes
six different compatibles. Except few of them - these compatibles
represent different devices.

> 
> We had dedicated bindings per service before.

Where?

> 
> As the service has changed as part of new AudioReach Firmware, we could 
> have added new bindings for these services again. But as we are dealing 
> with the same audio hardware and clock resources a new bindings per 
> service did not make sense. Since then we moved all the lpass audio 
> ports and clocks related bindings to qcom,q6dsp-lpass-clocks.yaml and 
> qcom,q6dsp-lpass-ports.yaml.

These are not bindings for services but bindings for their devices.

Best regards,
Krzysztof


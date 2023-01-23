Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A1677703
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 10:06:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 841B840EE;
	Mon, 23 Jan 2023 10:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 841B840EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674464781;
	bh=PjYJ7M1unZEw1VX8KJR9sSklOOreeiT5TqN50as4MQg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ltcMCyziYjmpa6hXCvF6gfZDVWRxtWKOORcHW9IQ9jwwbam6ZWsIhP+o7j+k7u8ww
	 /6GSepU8gNo3+ZLlaheFAgHq49im7Qz1TG3vyCbS3viq6TKK1kJdmCTNNJ4wOght1w
	 pYc70C4gw1Im4xwxE0Nb8j2Taoj4BkdoTsYAARuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF56F804FC;
	Mon, 23 Jan 2023 10:05:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0021F804F3; Mon, 23 Jan 2023 10:05:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7DFDF801D5
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 10:05:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7DFDF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ruhLYAnW
Received: by mail-wm1-x332.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so10089929wmb.0
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 01:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oS+QWfp3BJjZmstAo6/SyLcAAsRePrkk9Wn91q5sync=;
 b=ruhLYAnWhcJjwAr7+Y5mqFP0EHOa1LACnjVbqMO8RKIK9MyF10T8UYQXaLO3VIcsxZ
 FcQh6qrbEEs6KIrxHVEmOsOpO3rxvMbnmJGtf8qBXmg5nYi53L0IhidAYtGMv7ZyFzwz
 ArsaFRgp1OF514NSGbzx1OivfnQybUIoBydcxuEl6BMfLr+2qRxVxZQ0Zhe7XtqEU56B
 f4fQNCIFALcUgN8ps7rFbsX0Vw2SFB90uFMfpO07Yvh4v4yrHUEBJwNBVaFn8O0mUvuz
 rJTaJS/MIipfdGirESoVqTbXhEnyKBIfs3h/OfEpUEIvcJi6uiuU2uKBOebuO/nReDGY
 oHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oS+QWfp3BJjZmstAo6/SyLcAAsRePrkk9Wn91q5sync=;
 b=V2RZCChNAkehMeidXNFvZcSrG3sNO/+gfBnNvuUXgCCxoGFRDiTiTAq4kaTVLtZUUb
 514NN39vBkWuKlaZxBenuZ9poe3TtQOzjgZgDP28fXMi3bfpDAuuOiOI4ybVGyxrR23B
 ZA3FJEZYOoy76jYfUvaRAGhFyElIlpF0JSWJ6/tir2JC23HFMsVa+f6MrvlzAnZQUpGs
 IjOWcXIKp+Zbt2BI4hlAhHryGIYCVdErXidaiqYq6HvMxdsNEVVhsH90VcxWl0ComUOC
 ezF9BxFZCj3UtYH3EPLyJWfYG18t5F7F7UelPF/0qbEukdEactzfLFxAq2TibQK0epsM
 wGCQ==
X-Gm-Message-State: AFqh2krfG+gMOtusw0uTP0njVmp1qBEZs0N7aeY6gCebLLWN3APSByX7
 xPBwJjzqcVdwaOthG5dGQG2gmYFlAWPmD7YW
X-Google-Smtp-Source: AMrXdXvRDqDdYwOHNXOOo8g1OWFCe7j9cuIEARBMVi7yJFZEF0/n0LpZJuTVRkvWPjLj6mUzTuJItQ==
X-Received: by 2002:a05:600c:1d8e:b0:3d9:f9ef:3d23 with SMTP id
 p14-20020a05600c1d8e00b003d9f9ef3d23mr23398735wms.23.1674464716684; 
 Mon, 23 Jan 2023 01:05:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b003db315d4d02sm10430487wmq.33.2023.01.23.01.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 01:05:16 -0800 (PST)
Message-ID: <21ea0402-c4f3-1344-d084-9f3138713abb@linaro.org>
Date: Mon, 23 Jan 2023 10:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 4/4] ASoC: dt-bindings: ti, ts3a227e.yaml: add jack-type
Content-Language: en-US
To: Astrid Rost <astridr@axis.com>, Astrid Rost <astrid.rost@axis.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Dylan Reid <dgreid@chromium.org>
References: <20230120102555.1523394-1-astrid.rost@axis.com>
 <20230120102555.1523394-5-astrid.rost@axis.com>
 <2d05a943-3510-5ee9-9906-247a6344190a@linaro.org>
 <0b0c0030-3587-5501-c7b2-eccbbe4551e0@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0b0c0030-3587-5501-c7b2-eccbbe4551e0@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 23/01/2023 09:39, Astrid Rost wrote:
> Hello Krzysztof,
> 
> On 1/22/23 15:16, Krzysztof Kozlowski wrote:
>> On 20/01/2023 11:25, Astrid Rost wrote:
>>> Add jack-type: Bitmap value of snd_jack_type to allow combining
>>> card drivers to create a jack for it.
>>
>> Subject: drop "yaml". We do not filename extensions to subject prefix.
>> Nowhere.
>>
> 
> yes, true.
> 
>>>
>>> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
>>> ---
>>>   Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
>>> index 785930658029..1d949b805f98 100644
>>> --- a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
>>> @@ -27,6 +27,14 @@ properties:
>>>     interrupts:
>>>       maxItems: 1
>>>   
>>> +  jack-type:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: Bitmap value of snd_jack_type to allow combining
>>> +      card drivers to create a jack for it. Supported is
>>
>> Why the device would once support (allow) headphone and once not? Device
>> either always supports them or never...
>>
> 
> If a device has two connectors (pink and green), one for the microphone 
> and one for the headset. 

We talk about "ts3a227" here, which has always two connectors (pins)...
unless you refer to the case when these are e.g. grounded?


> It would be easier to see from the available 
> events, which is which. But of course it is possible to give it good names.
> My first approach was, that it returned all supported types, so no 
> devicetree change needed. But by colleges agreed that it would be nice
> to remove unused flags. I am happy to remove it and someone who requires 
> it can add it.
> 
>>> +        1 SND_JACK_HEADPHONE
>>> +        2 SND_JACK_MICROPHONE
>>
>> minimum and maximum
> 
> I do not understand this? It is a bitmap. I can put it as an
> enum:
>   - 1 # SND_JACK_HEADPHONE
>   - 2 # SND_JACK_MICROPHONE
>   - 3 # SND_JACK_HEADPHONE | SND_JACK_MICROPHONE


Then maximum is OR of them, isn't it?

Best regards,
Krzysztof


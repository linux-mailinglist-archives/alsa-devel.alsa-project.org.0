Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 925C0608EAB
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 18:50:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23095A3BB;
	Sat, 22 Oct 2022 18:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23095A3BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666457404;
	bh=1GvOBQ04+043A7Texu4lpwQiotLsdrqcNwnkpK3x0Iw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLQHaZM8ppTXX+S8bXFh1mgdecgLvZ7mCVpFd04uRRF7BpGuxFuGD3Kg4dw1J32rq
	 +5BAwXDIju/4nm90FPcprVl/3+oxLKVU1MbzCCgnkkx3keDR8fh1ZAyu5c+ID3BMYx
	 wQPEr77xYQ933jfVeUDaiqu0ki8ijS7WG0bOT9bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9477CF8013D;
	Sat, 22 Oct 2022 18:49:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A402F80246; Sat, 22 Oct 2022 18:49:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBFFAF80134
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 18:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBFFAF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ogCxataz"
Received: by mail-qt1-x832.google.com with SMTP id a24so3443397qto.10
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 09:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MWHwWqM3BXKlqAbT6QrzFF/UUpibvbLYi2O5amk60U4=;
 b=ogCxatazZKWZRhhAUwP+5F6AJ8YlAWU+ohtbMidz6OXm1yNePCRATsxZp5oRVpW+A0
 p9NYEDjH83TE8PMVPOfIkhT6CS6HDkxOGBdeUU/Sl4GpxX/p+bOp+TQ2TviTAGPYfEN7
 Fg5gOOGp+oH8bXUlwYJ6688yOFmDGYpQbO3wjVusgiWYagHvCkKeywXEojgiHQ3WH0k4
 mEi9Y0KzuyjiANtaGM2LmBWL4021SGDvEyZdzGZS/3PWXsSDtZFm0KM8apP73oACp0Nf
 QN1tePmnF5nWKZJUcm8X0JoAeAJOKcdwwdlMY7prETHOllDQoTyKZ9YmXZRR0F2eQm+3
 f6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MWHwWqM3BXKlqAbT6QrzFF/UUpibvbLYi2O5amk60U4=;
 b=gSbpHHZep5oXsaVLQM098QjdGVm2nTi4nnLOWfzjPLQ5GdD7wwv3Hlk0SQdJm5QQgD
 kPELcfh6Zl+hxPDJKKfIW+iX2Gp/w4+YToeZ0PA5YMjbS9rZjQ9W5EqEUicu5z+QwZ0A
 RULLQj1XahfhpYrRCRsnn65ZKXvcz1jgiNnmcqfMUoePwIl+HnXl3cks9bzHrjGdy0wl
 9BoSu/LEc3D4J8LMPUZ0/UVycpQXmXVgNr5Y6JoPwGRMeaFAp2latnlguPPNpIxjwec0
 VqXUJokOYc8yKW5ZyOB8jzJY/zPzFgnKysQEDsjhOXC8YJUP3pQfgxHN9/ZGI2me6eV4
 4rnw==
X-Gm-Message-State: ACrzQf3DzSF8KAocYNHUVxXxp3cKnpIRHDOj2l5p+2k/10GZzJ5X6jMk
 WHCLq6bQs4lItpHazQMxqO30zQ==
X-Google-Smtp-Source: AMsMyM7MX1BEUs2JSI2Qn3PmiNnVDugW3rD+1D64oX5nMvP/6Fj64lJHcVW1yUkBKT8ar+TIesapXw==
X-Received: by 2002:ac8:5b10:0:b0:39c:d63a:d88 with SMTP id
 m16-20020ac85b10000000b0039cd63a0d88mr20932702qtw.682.1666457339565; 
 Sat, 22 Oct 2022 09:48:59 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
 by smtp.gmail.com with ESMTPSA id
 c25-20020ac81119000000b003996aa171b9sm9752605qtj.97.2022.10.22.09.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 09:48:58 -0700 (PDT)
Message-ID: <253fc459-c3dc-7710-6f34-0466d5301482@linaro.org>
Date: Sat, 22 Oct 2022 12:48:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/6] dt-bindings: sound: Add sound card bindings for Tesla
 FSD
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
 'Rob Herring' <robh@kernel.org>
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104901epcas5p1a61ea81c3b1640bd8a064633c0b1e40d@epcas5p1.samsung.com>
 <20221014102151.108539-4-p.rajanbabu@samsung.com>
 <20221014151325.GA1940481-robh@kernel.org>
 <04b901d8e529$573b17e0$05b147a0$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04b901d8e529$573b17e0$05b147a0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
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

On 21/10/2022 04:44, Padmanabhan Rajanbabu wrote:
>> On Fri, Oct 14, 2022 at 03:51:48PM +0530, Padmanabhan Rajanbabu wrote:
>>> Add dt-binding reference document to configure the DAI link for Tesla
>>> FSD sound card driver.
>>
>> The simple-card or graph-card bindings don't work for you?
> Thank you for reviewing the patch.
> 
> The actual reason for having a custom sound card driver lies in the fact
> that the Samsung i2s cpu dai requires configuration of some Samsung
> specific properties like rfs, bfs, codec clock direction and root clock
> source. We do not have flexibility of configuring the same in simple card
> driver (sound/soc/generic/simple-card.c) or audio graph card driver 
> (sound/soc/generic/audio-graph-card.c). The binding has been added to
> support the custom sound card driver.
> 
> I understand from your query that the newly added card has device tree
> nodes and properties which are used in simple card as well, but having a
> different or new prefixes. I believe to address that, we can restructure
> the string names to generic ones. 

You must use generic, existing properties where applicable.

> But I would like to understand, to reuse
> the simple card or audio graph card bindings, can we add secondary
> compatible strings in the simple card dt-binding for the custom sound card
> to probe ?

If you see other vendor compatibles there, then yes... But there aren't
any, right?

>>
>>>
>>> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
>>> ---
>>>  .../bindings/sound/tesla,fsd-card.yaml        | 158 ++++++++++++++++++
>>>  1 file changed, 158 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml
>>> b/Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml
>>> new file mode 100644
>>> index 000000000000..4bd590f4ee27
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml
>>> @@ -0,0 +1,158 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright
>>> +2022 Samsung Electronics Co. Ltd.
>>> +%YAML 1.2
>>> +---
>>> +$id:
>>> +https://protect2.fireeye.com/v1/url?k=4ae54403-157e7d1c-4ae4cf4c-
>> 000b
>>> +abdfecba-9eb398ea304f8ae8&q=1&e=4935bed0-ce62-47dd-8faf-
>> 4750b01e22d3&
>>>
>> +u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fsound%2Ftesla%2Cfsd-
>> card.ya
>>> +ml%23
>>> +$schema:
>>> +https://protect2.fireeye.com/v1/url?k=8c72226e-d3e91b71-8c73a921-
>> 000b
>>> +abdfecba-3ce999f6c052255b&q=1&e=4935bed0-ce62-47dd-8faf-
>> 4750b01e22d3&
>>> +u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>>> +
>>> +title: Tesla FSD ASoC sound card driver
>>> +
>>> +maintainers:
>>> +  - Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
>>> +
>>> +description: |
>>> +  This binding describes the node properties and essential DT entries
>>> +of FSD
>>> +  SoC sound card node
>>> +
>>> +select: false
>>
>> Never apply this schema. Why?
> Sorry about it, let me change the select property to true in the next
> patchset

No, just drop it. Look at other bindings or at example-schema

>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - tesla,fsd-sndcard
>>> +
>>> +  model:
>>> +    description: Describes the Name of the sound card
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +
>>> +  widgets:
>>> +    description: A list of DAPM widgets in the sound card. Each entry
> is a pair
>>> +      of strings, the first being the widget name and the second being
> the
>>> +      widget alias
>>> +    $ref: /schemas/types.yaml#/definitions/string-array
>>> +
>>> +  audio-routing:
>>> +    description: A list of the connections between audio components.
> Each entry
>>> +      is a pair of strings, the first being the connection's sink, the
> second
>>> +      being the connection's source
>>> +    $ref: /schemas/types.yaml#/definitions/string-array
>>> +
>>> +  dai-tdm-slot-num:
>>> +    description: Enables TDM mode and specifies the number of TDM slots
> to be
>>> +      enabled
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [0, 1, 2, 3, 4, 5, 6, 7, 8]
>>
>> maximum: 8
> Okay
>>
>>> +    default: 2
>>> +
>>> +  dai-tdm-slot-width:
>>> +    description: Specifies the slot width of each TDm slot enabled
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [8, 16, 24]
>>> +    default: 16
>>
>> All the above have types defined. You should not be redefining the types.
> Okay
>>
>>> +
>>> +  dai-link:
>>> +    description: Holds the DAI link data between CPU, Codec and
> Platform
>>> +    type: object
>>
>>        additionalProperties: false
> okay
>>
>>> +    properties:
>>> +      link-name:
>>> +        description: Specifies the name of the DAI link
>>> +        $ref: /schemas/types.yaml#/definitions/string
>>> +
>>> +      dai-format:
>>> +        description: Specifies the serial data format of CPU DAI
>>> +        $ref: /schemas/types.yaml#/definitions/string
>>> +
>>> +      tesla,bitclock-master:
>>> +        description: Specifies the phandle of bitclock master DAI
>>> +        $ref: /schemas/types.yaml#/definitions/phandle
>>> +
>>> +      tesla,frame-master:
>>> +        description: Specifies the phandle of frameclock master DAI
>>> +        $ref: /schemas/types.yaml#/definitions/phandle
>>
>> These are common properties. Drop 'tesla'.
> Okay
>>
>>> +
>>> +      cpu:
>>> +        description: Holds the CPU DAI node and instance
>>> +        type: object
>>
>>            additionalProperties: false
> Okay
>>
>>> +        properties:
>>> +          sound-dai:
>>> +            description: Specifies the phandle of CPU DAI node
>>> +            $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +
>>> +        required:
>>> +          - sound-dai
>>> +
>>> +      codec:
>>> +        description: Holds the Codec DAI node and instance
>>> +        type: object
>>
>>            additionalProperties: false
> Okay
>>
>>> +        properties:
>>> +          sound-dai:
>>> +            description: Specifies the phandle of Codec DAI node
>>> +            $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Already has a type. Need to define how many entries (maxItems: 1 ?).
> Okay. I'll update in the upcoming patch set
>>
>>> +
>>> +        required:
>>> +          - sound-dai
>>> +
>>> +    required:
>>> +      - link-name
>>> +      - dai-format
>>> +      - tesla,bitclock-master
>>> +      - tesla,frame-master
>>> +      - cpu
>>> +
>>> +dependencies:
>>> +  dai-tdm-slot-width: [ 'dai-tdm-slot-num' ]
>>
>> This should be captured with tdm-slot.txt converted to schema.
> Okay
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - model
>>> +  - dai-link
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    sound {
>>> +        compatible = "tesla,fsd-sndcard";
>>> +        status = "disabled";
>>
>> Why have a disabled example? Other than your example won't pass your
>> schema.
> Thanks for noticing, I'll double check and change the example keeping the
> status 
> as enabled

No, just drop. Start with example-schema instead.

Best regards,
Krzysztof


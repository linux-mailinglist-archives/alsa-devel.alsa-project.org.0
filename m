Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5E44E9832
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 15:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCC918B6;
	Mon, 28 Mar 2022 15:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCC918B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648474218;
	bh=zRJzWAxW3r05RxdHeisY95nx7zb5TwBuEEzl4tpDwOY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PHdcckECRbMO0wvDUGl2orgidgHbRTomYBeJDAqO64OcwMh2uz8Ig1zl6UYdcFSkh
	 +kmd/RuG50g5KL7tCT8pHSbJNTsVwtvtlCySFh76uJQI5JPrQGVGl3SHfWJXuT3sNr
	 Cow2069GJUijnjX4dpSzJPM79EfZpkGHdbpfEmHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF45F800CB;
	Mon, 28 Mar 2022 15:29:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE746F8024C; Mon, 28 Mar 2022 15:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC408F800CB
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 15:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC408F800CB
Received: by mail-wm1-f50.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so8566036wmb.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 06:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uLvcnNGD7orwMt3H7FvAzNbV1+jVVtO3wV/gzqZo0EQ=;
 b=TrBwN5yHLsdC3z6APVxzOAmU0tqTc9w6t16qu6fdpqPC7ZMU9HBE3IKnBqjr9I9sk0
 I5xeUrIOqPEVlaZqDAdgbnvxxf057rWkzQsuGXz8wPgLmZxgVzKoxORpb/5M3p9+G1nh
 4Wcsyw8/9LKPncteV9yn1K2Fv+gKKK3suMtfo3JZbwIP/ArOG5g2ngNqnQNxnHLCEQ4X
 GTLXglG4DU8A/DpOJljo4jlTRaltx/zM/MGQFkarTb0GaafedHcq9zR39VNlKmxChwiT
 XccqsAEX1ftCwhdh0QxpfELectD7gdme7WQsXNXA2QSgUjF0DVDdcpWSwtFcdWNZwKrB
 lFDQ==
X-Gm-Message-State: AOAM533Aap3uip3bAgk+cshqjCBtDkpHodRs2y1lzhQwjncCL4/HbJs2
 0zp77VTpdD/Uc0mRJJ3DS00=
X-Google-Smtp-Source: ABdhPJzvXxx8G3oSboQduPDY5peChv4cOygHj3HSI2yRRkfQTz9OKVkIUO7HO/NYVQC/sQZwMl+zbQ==
X-Received: by 2002:a05:600c:2e02:b0:38c:8390:d8ca with SMTP id
 o2-20020a05600c2e0200b0038c8390d8camr26669786wmf.15.1648474141242; 
 Mon, 28 Mar 2022 06:29:01 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 l9-20020a5d6d89000000b00203d62072c4sm13608526wrs.43.2022.03.28.06.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 06:29:00 -0700 (PDT)
Message-ID: <a06f24af-ea9a-c787-ed09-438c019c63ca@kernel.org>
Date: Mon, 28 Mar 2022 15:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 3/6] ASoC: dt-bindings: Extend clock bindings of
 rt5659
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzk+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
 <1648448050-15237-4-git-send-email-spujar@nvidia.com>
 <da414b44-1bec-5918-84f5-9dfff2009f41@kernel.org>
 <53d77f33-27e8-3446-d758-3e545eea2db4@nvidia.com>
 <5e4e11b5-02b8-e03e-2924-c9f2882921be@kernel.org>
 <fbd9cbfe-d653-d6d2-e55c-fb80527bea13@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <fbd9cbfe-d653-d6d2-e55c-fb80527bea13@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

On 28/03/2022 15:19, Sameer Pujar wrote:
> 
> On 28-03-2022 13:37, Krzysztof Kozlowski wrote:
>> On 28/03/2022 09:58, Sameer Pujar wrote:
>>> On 28-03-2022 12:36, Krzysztof Kozlowski wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 28/03/2022 08:14, Sameer Pujar wrote:
>>>>> The rt5658 or rt5659 CODEC system clock (SYSCLK) can be derived from
>>>>> various clock sources. For example it can be derived either from master
>>>>> clock (MCLK) or by internal PLL. The internal PLL again can take input
>>>>> clock references from bit clocks (BCLKs) and MCLK. To enable a flexible
>>>>> clocking configuration the DT binding is extended here.
>>>>>
>>>>> It makes use of standard clock bindings and sets up the clock relation
>>>>> via DT.
>>>>>
>>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>>> Cc: Oder Chiou <oder_chiou@realtek.com>
>>>>> ---
>>>>>    .../devicetree/bindings/sound/realtek,rt5659.yaml  | 53 ++++++++++++++++++++--
>>>>>    1 file changed, 49 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>>>> index b0485b8..0c2f3cb 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>>>> @@ -29,12 +29,28 @@ properties:
>>>>>        maxItems: 1
>>>>>
>>>>>      clocks:
>>>>> -    items:
>>>>> -      - description: Master clock (MCLK) to the CODEC
>>>>> +    description: |
>>>>> +      CODEC can receive multiple clock inputs like Master
>>>>> +      clock (MCLK), I2S bit clocks (BCLK1, BCLK2, BCLK3,
>>>>> +      BCLK4). The CODEC SYSCLK can be generated from MCLK
>>>>> +      or internal PLL. In turn PLL can reference from MCLK
>>>>> +      and BCLKs.
>>>>>
>>>>>      clock-names:
>>>>> -    items:
>>>>> -      - const: mclk
>>>>> +    description: |
>>>>> +      The clock names can be combination of following:
>>>>> +        "mclk"        : Master clock
>>>>> +        "pll_ref"     : Reference to CODEC PLL clock
>>>>> +        "sysclk"      : CODEC SYSCLK
>>>>> +        "^bclk[1-4]$" : Bit clocks to CODEC
>>>> No, that does not look correct. You allow anything as clock input (even
>>>> 20 clocks, different names, any order). That's not how DT schema should
>>>> work and that's not how hardware looks like.
>>>> Usually the clock inputs are always there which also you mentioned in
>>>> description - "multiple clock inputs". All these clocks should be
>>>> expected, unless really the wires (physical wires) can be left disconnected.
>>> The CODEC can receive multiple clocks but all the input clocks need not
>>> be present or connected always. If a specific configuration is needed
>>> and platform supports such an input, then all these inputs can be added.
>>> I don't know how to define this detail in the schema. If I make all of
>>> them expected, then binding check throws errors. If I were to list all
>>> the possible combinations, the list is going to be big (not sure if this
>>> would be OK?).
>> Thanks for explanation. Please differentiate between these two:
>> 1. clock inputs connected, but unused (not needed for driver or for
>> particular use case),
>> 2. clock inputs really not connected.
>>
>> For the 1. above, such clock inputs should still be listed in the
>> bindings and DTS. For the 2. above, such clocks should actually not be
>> there.
> 
> Thank you for the suggestion.
> 
>> How to achieve this depends on number of your combinations. IOW,
>> how many clocks are physically optional.
> 
>  From CODEC point of view all these clock inputs are possible and a 
> platform may choose to connect a subset of it depending on the 
> application. The binding is expected to support all such cases. To 
> support all possibilities, the total combinations can be very big (100+).
> 
>> For some small number of
>> variations this can be:
>> oneOf:
>>   - const: mclk
>>   - items:
>>     - const: mclk
>>     - enum:
>>         - bclk1
>>         - bclk2
>>         - bclk3
>>         - bclk4
>>   - items:
>>     - const: mclk
>>     - const: pll_ref
>>     - enum:
>>         - bclk1
>>         - bclk2
>>         - bclk3
>>         - bclk4
>>
>> For a total flexibility that any clock input can be disconnected, this
>> should be a list of enums I guess (with minItems). However please find
>> the clocks always connected and include them if possible in a fixed way
>> (like this oneOf above).
> 
> May be I can list the most commonly required combinations like below and 
> extend it whenever there is a need for specific combination?

Yes, this would work. Relaxing such constraints is possible.


Best regards,
Krzysztof

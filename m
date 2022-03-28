Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AA24E8FC7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 10:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB7EB1724;
	Mon, 28 Mar 2022 10:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB7EB1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648454944;
	bh=83cgUTIzDdTxGyXlDwRxLfMhoTupGlQqjzE0q4juqUc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rgtVHfE2QjayFs1YoTaoZzOhmygMda2ijLUgwxojwYy6yl06ab+YSpYwym3rcAqrh
	 4ktBJsVBQXoWYncXskfbh9IBPy2/XaFHbblK9nF/ItDAZa56E2RAemhrUL7NoqlMRf
	 JxVb641ET7Tk8q+qxjso3csJE6+LiivoxUyJjFK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 525CCF8026A;
	Mon, 28 Mar 2022 10:07:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47960F8024C; Mon, 28 Mar 2022 10:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A2F2F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 10:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A2F2F800FA
Received: by mail-wm1-f45.google.com with SMTP id q20so7883303wmq.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 01:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aqhIXOehpG2sn3GYsWc941YXJLzzHilfcGYNNCqo6QM=;
 b=Cdu7iAx6BE5RfrxLT7WDX3w0Ku8RwxAgwHECGKxnb+tNk1BDrHUEz6ks3qDqsZnyWb
 gWZdeNtyfnERjQfAEoaXpjiyj3WLNa8ZMQo8mYeR3716+hE/slrVdWTAhiVsc8wADucg
 993/4BEnT1sUHMmDe9M7cqgWyEfQH1Jd3HGAbRMFLsCMf9W3HZyXRdOzytKjX2/iz6mQ
 LzYLswdL/dbCOmYhQ7MOsDy+KvxI+e8l20SiHeypi1mj3kZARfXvcYWLZ2fs1iazAMdA
 UPSYqxXogUP5rMgWc6/BW3bkuqjP/ALM7AhRhCOIaUrAc+97i1YLbc2NbX4F7CFOMtlj
 K2rw==
X-Gm-Message-State: AOAM533chBmg56QqyMY1A4myxTU6WNRrYqnt3JoBRxja3tX506cRpB1N
 kRNLnOPhnxPXx8iAaYDNJZs=
X-Google-Smtp-Source: ABdhPJwKQEhNvAqduG5eNAfs0wurvmYokocu7FgFYMj6haT87acsa3lSCjzm5F29F803nAII8IyeoQ==
X-Received: by 2002:a1c:e915:0:b0:37b:d847:e127 with SMTP id
 q21-20020a1ce915000000b0037bd847e127mr24995447wmc.180.1648454869508; 
 Mon, 28 Mar 2022 01:07:49 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 z18-20020a5d6412000000b0020400dde72esm11530807wru.37.2022.03.28.01.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 01:07:48 -0700 (PDT)
Message-ID: <5e4e11b5-02b8-e03e-2924-c9f2882921be@kernel.org>
Date: Mon, 28 Mar 2022 10:07:47 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <53d77f33-27e8-3446-d758-3e545eea2db4@nvidia.com>
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

On 28/03/2022 09:58, Sameer Pujar wrote:
> 
> On 28-03-2022 12:36, Krzysztof Kozlowski wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 28/03/2022 08:14, Sameer Pujar wrote:
>>> The rt5658 or rt5659 CODEC system clock (SYSCLK) can be derived from
>>> various clock sources. For example it can be derived either from master
>>> clock (MCLK) or by internal PLL. The internal PLL again can take input
>>> clock references from bit clocks (BCLKs) and MCLK. To enable a flexible
>>> clocking configuration the DT binding is extended here.
>>>
>>> It makes use of standard clock bindings and sets up the clock relation
>>> via DT.
>>>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>> Cc: Oder Chiou <oder_chiou@realtek.com>
>>> ---
>>>   .../devicetree/bindings/sound/realtek,rt5659.yaml  | 53 ++++++++++++++++++++--
>>>   1 file changed, 49 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>> index b0485b8..0c2f3cb 100644
>>> --- a/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>> @@ -29,12 +29,28 @@ properties:
>>>       maxItems: 1
>>>
>>>     clocks:
>>> -    items:
>>> -      - description: Master clock (MCLK) to the CODEC
>>> +    description: |
>>> +      CODEC can receive multiple clock inputs like Master
>>> +      clock (MCLK), I2S bit clocks (BCLK1, BCLK2, BCLK3,
>>> +      BCLK4). The CODEC SYSCLK can be generated from MCLK
>>> +      or internal PLL. In turn PLL can reference from MCLK
>>> +      and BCLKs.
>>>
>>>     clock-names:
>>> -    items:
>>> -      - const: mclk
>>> +    description: |
>>> +      The clock names can be combination of following:
>>> +        "mclk"        : Master clock
>>> +        "pll_ref"     : Reference to CODEC PLL clock
>>> +        "sysclk"      : CODEC SYSCLK
>>> +        "^bclk[1-4]$" : Bit clocks to CODEC
>> No, that does not look correct. You allow anything as clock input (even
>> 20 clocks, different names, any order). That's not how DT schema should
>> work and that's not how hardware looks like.
> 
>>
>> Usually the clock inputs are always there which also you mentioned in
>> description - "multiple clock inputs". All these clocks should be
>> expected, unless really the wires (physical wires) can be left disconnected.
> 
> The CODEC can receive multiple clocks but all the input clocks need not 
> be present or connected always. If a specific configuration is needed 
> and platform supports such an input, then all these inputs can be added. 
> I don't know how to define this detail in the schema. If I make all of 
> them expected, then binding check throws errors. If I were to list all 
> the possible combinations, the list is going to be big (not sure if this 
> would be OK?).

Thanks for explanation. Please differentiate between these two:
1. clock inputs connected, but unused (not needed for driver or for
particular use case),
2. clock inputs really not connected.

For the 1. above, such clock inputs should still be listed in the
bindings and DTS. For the 2. above, such clocks should actually not be
there. How to achieve this depends on number of your combinations. IOW,
how many clocks are physically optional. For some small number of
variations this can be:
oneOf:
 - const: mclk
 - items:
   - const: mclk
   - enum:
       - bclk1
       - bclk2
       - bclk3
       - bclk4
 - items:
   - const: mclk
   - const: pll_ref
   - enum:
       - bclk1
       - bclk2
       - bclk3
       - bclk4

For a total flexibility that any clock input can be disconnected, this
should be a list of enums I guess (with minItems). However please find
the clocks always connected and include them if possible in a fixed way
(like this oneOf above).


Best regards,
Krzysztof

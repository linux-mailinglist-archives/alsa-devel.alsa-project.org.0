Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5D60C7B9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 11:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB62D57B7;
	Tue, 25 Oct 2022 11:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB62D57B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666689364;
	bh=kDmwKjkZJFWDWKKDMV3ltamayHJewCZgKU+ny4c4/bA=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ueCz+xEpbJukNXLszI5Q0T0WsPyaFpuoMootjEOvw1VWE3ZeUE7eFtWN+lngFYunz
	 WUg70fuqeQV+0XIvNmOIBefnyCOOc6ehSqw1YNP1XFhm/jNBxviALuOeN4ujpkGd5x
	 08KBeJIa5ndLohLwa/yghjXo9vTXxGOnp5KDa1gU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3391EF80448;
	Tue, 25 Oct 2022 11:15:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 950E0F80100; Tue, 25 Oct 2022 11:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AB93F80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 11:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AB93F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ApoeYpc3"
Received: by mail-wm1-x332.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso8004191wmb.5
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=L3cL9hwVxxgYxbdvufURLKd+4fQ6tHsN/7T//5flfK4=;
 b=ApoeYpc3MysTAdWPnaqpsoMjEaLM61adiuDH3vZ7v42DONj59KZ6P8takrH2S98ccp
 Fcjzz4saLkRk/3y6KpSWVmyL4HnQreYHj6M8mSn8lfo59EQMhFxBiRyShW21mYb/dbDL
 ZoLQhsvqbnkekkmsug6El//bmytnJlnE53ltFWurA2ftntoYNVLlHufKeYoq4SZ+2nCv
 BpuCXswqUAcOB4CO5r6GPRoG26+r/O/MhhzM5UMx437Z9YNYXVzf175s/4TEkaLUCk6b
 l/GdsD+VZGhT8wGuHoRn/qKdv9cnWyaAjr5r9II3boaXzXNGq4tA9YGCQ6DnafuIpeAQ
 r9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L3cL9hwVxxgYxbdvufURLKd+4fQ6tHsN/7T//5flfK4=;
 b=gTIcpLXxhMyl322iiR0ywW/6QjqCAVFhyG6LtTNi62Dk1tnQzqKDpld8KKjSIn9VJQ
 fGi/ol7MPc37iK1kYqnVC/sO9kdKeETbN84xDAKsSpZKOtOgx5Q8CSFLyIvEkL3KKprU
 3aGercrKr7Y95wp1ZQTaqvtPNCApUgQGfAL4sjLxVvmoxn13ISCLWQW6FGh5MmK+qraj
 q5eyTFKePkwH0OSGUOR3SmwX0aOTdg3HuLzzJJDo8cXOWLsXS231Ql0DIv1d9MyJyWMr
 +0VBykUPcrAYuv1TKJef8Wj+KX68XpNM/KLgqhXF6dCadBoIOuS8y4Pj4hGUrk/B8arg
 CMGQ==
X-Gm-Message-State: ACrzQf2Y4rGugIv4yc3xFJ4bLt0Wikvh+GrhQNomrqn0Yv4C7vW4SXpE
 dsWWmCPlT8cyx2efdhr0p9k=
X-Google-Smtp-Source: AMsMyM6+HxgSs8qN0tuLYvmcnvB8cVpip/9nCa1nA2ZJc3CfAuicjU8aMKdwWBbMyPQeFCRdA7Ob/Q==
X-Received: by 2002:a05:600c:4e45:b0:3cd:f141:b7d8 with SMTP id
 e5-20020a05600c4e4500b003cdf141b7d8mr7755802wmq.196.1666689300075; 
 Tue, 25 Oct 2022 02:15:00 -0700 (PDT)
Received: from localhost (188.29.212.253.threembb.co.uk. [188.29.212.253])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c314800b003c6cd82596esm10907736wmo.43.2022.10.25.02.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 02:14:59 -0700 (PDT)
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
 <ef6a326b-5c61-988b-2ec2-cd8e233e5d28@linaro.org>
 <GMvEU8xVTkjIoQ518XWAaLkhldSZHlk7@localhost>
 <4ef59d94-d045-55fc-d531-c84e7edb8333@linaro.org>
 <hXRpArckbrXUelDdaJ3Y2SErmKiuycXt@localhost>
 <66c1a100-922e-4a33-e80c-fc80866acf03@linaro.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 2/2] dt-bindings: ASoC: simple-card: Add
 system-clock-id property
In-reply-to: <66c1a100-922e-4a33-e80c-fc80866acf03@linaro.org>
Date: Tue, 25 Oct 2022 10:14:59 +0100
Message-ID: <jZCUALhj8PoqVkuWdtLf8LnPAj1wDakF@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
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


Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 24/10/2022 19:38, Aidan MacDonald wrote:
>>
>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
>>
>>> On 23/10/2022 09:47, Aidan MacDonald wrote:
>>>>
>>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
>>>>
>>>>> On 22/10/2022 12:27, Aidan MacDonald wrote:
>>>>>> This is a new per-DAI property used to specify the clock ID argument
>>>>>> to snd_soc_dai_set_sysclk().
>>>>>
>>>>> You did no show the use of this property and here you refer to some
>>>>> specific Linux driver implementation, so in total this does no look like
>>>>>  a hardware property.
>>>>>
>>>>> You also did not explain why do you need it (the most important piece of
>>>>> commit msg).
>>>>>
>>>>>>
>>>>>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/sound/simple-card.yaml | 8 ++++++++
>>>>>>  1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
>>>>>> index ed19899bc94b..cb7774e235d0 100644
>>>>>> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
>>>>>> @@ -57,6 +57,12 @@ definitions:
>>>>>>        single fixed sampling rate.
>>>>>>      $ref: /schemas/types.yaml#/definitions/flag
>>>>>>
>>>>>> +  system-clock-id:
>>>>>> +    description: |
>>>>>> +      Specify the clock ID used for setting the DAI system clock.
>>>>>
>>>>>
>>>>> With lack of explanation above, I would say - use common clock framework
>>>>> to choose a clock...
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> Sorry, I didn't explain things very well. The system clock ID is indeed
>>>> a property of the DAI hardware. The ID is not specific to Linux in any
>>>> way, and really it's an enumeration that requires a dt-binding.
>>>>
>>>> A DAI may support multiple system clock inputs or outputs identified by
>>>> the clock ID. In the case of outputs, these could be distinct clocks
>>>> that have their own I/O pins, or the clock ID could select the internal
>>>> source clock used for a clock generator. For inputs, the system clock ID
>>>> may inform the DAI how or where the system clock is being provided so
>>>> hardware registers can be configured appropriately.
>>>>
>>>> Really the details do not matter, except that in a particular DAI link
>>>> configuration a specific clock ID must be used. This is determined by
>>>> the actual hardware connection between the DAIs; if the wrong clock is
>>>> used, the DAI may not function correctly.
>>>>
>>>> Currently the device tree is ambiguous as to which system clock should
>>>> be used when the DAI supports more than one, because there is no way to
>>>> specify which clock was intended. Linux just treats the ID as zero, but
>>>> that's currently a Linux-specific numbering so there's guarantee that
>>>> another OS would choose the same clock as Linux.
>>>>
>>>> The system-clock-id property is therefore necessary to fully describe
>>>> the hardware connection between DAIs in a DAI link when a DAI offers
>>>> more than one choice of system clock.
>>>>
>>>> I will resend the patch with the above in the commit message.
>>>
>>> For example if you want to define which input pin to use (so you have
>>> internal mux), it's quite unspecific to give them some indexes. What is
>>> 0? What is 1? Number of pin? Number of pin counting from where?
>>>
>>> Since this is unanswered, the IDs are also driver and implementation
>>> dependent, thus you still have the same problem - another OS can choose
>>> different clock. That's not then a hardware description, but software
>>> configuration.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> I answered this already. The enumeration is arbitrary. Create some
>> dt-bindings and voila, it becomes standardized and OS-independent.
>
> Hm, then I missed something. Can you point me to DTS and bindings
> (patches or in-tree) which show this standardized indices of clock inputs?
>
> Best regards,
> Krzysztof

Device trees already use standardized enumerations in other areas so it
isn't a new idea. Look under include/dt-bindings/clock. Every header
there contains an arbitrary enumeration of a device's clocks. In fact
most of include/dt-bindings is exactly for this purpose, to define
standard values that are not "just numbers" but an enum, a flag, etc,
with a special meaning. It is not specific to clocks.

There is no dt-binding for system clock ID, because prior to this patch
they were not exposed to DT in any way. But the enumerations themselves
already exist, eg. the IDs for nau8821 codec:

    /* System Clock Source */
    enum {
        NAU8821_CLK_DIS,
        NAU8821_CLK_MCLK,
        NAU8821_CLK_INTERNAL,
        NAU8821_CLK_FLL_MCLK,
        NAU8821_CLK_FLL_BLK,
        NAU8821_CLK_FLL_FS,
    };

We would just be moving these into dt-bindings if somebody wants to
use a codec with simple-card. Future drivers would add the enum into
dt-bindings from the start because that's where it belongs.

Regards,
Aidan

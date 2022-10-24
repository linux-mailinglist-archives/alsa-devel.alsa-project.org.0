Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5A60BB21
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 22:47:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DABA6727;
	Mon, 24 Oct 2022 22:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DABA6727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666644444;
	bh=ok2YYZQlSZ9z9IWcEdSAM5dPSgkXWQ1qmkLIvONs8nA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BmU4iRksJKTVROCaQnQ+gJUArGAVaDFEJUusVPBF5ZpfFia/x/OhFxRaKJklE8cr6
	 itZwu5lAOICYI79JRfrJ505o3ClZ6gTrLmQz38djksryCz3uARcBaaSwIQkWx3Q4wy
	 1bOtp+VQXGCnj0cHTFJ24zcGo8kydp5l9KGDWCC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B8A5F80542;
	Mon, 24 Oct 2022 22:46:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A826EF80506; Mon, 24 Oct 2022 22:46:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED110F80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 22:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED110F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VNAub8ly"
Received: by mail-qk1-x72d.google.com with SMTP id d13so6849560qko.5
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 13:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XVN5s6sMhOFIPJeqtsM76g2DVj2bXeI3EB/RIEcARr8=;
 b=VNAub8lyONhGwszi1PHPFm4UVcV1BpMoEh6ZrJ4NmdcK5Rb0fqBgEHUSYlPyjIwh+u
 giEwCe1z+SmP2gXbFNVip0BYrdK7pJgjScIdQm/FnX78KPwwlp5IBlzYVCtdxiSKuEzt
 MAXBsPhf43H89HAI6Q43OGFcWm4wQ8s5nUAPUYE9YxAdGBu8WN7/uAu8YywodbWXcFrv
 cMl3IOqyQmVYbBa+9kxqdMESxruB6CVF+K9Xsx3Zy7kY0OnBKbCYu9Yubc+k5YghLhHm
 LOE0Mo/rRGePTRUiZcct/cmD3phe9MyRrjmBb7LDftsMyD3g6gjd6RTZ7gycxWeOIguT
 dUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XVN5s6sMhOFIPJeqtsM76g2DVj2bXeI3EB/RIEcARr8=;
 b=QSqQ6VNlPPQjF9PU/xzlu7F0FRH6FH18MXuVNA7jQePhdrwdksy8RS4avfT8qBS0c6
 h1rqLE0LjzeoOJCoFVt3vmoLadSLkcJHBOyRsF4K5QnSLmjFbqaR/n3pd/9k3XlnPHEB
 aHBWLJfFfLe1bbPKU2B7cEEFO9j6r4sZ+xbHL9a8cBwA7f/+JfS5oyand1TF0jqtG5UO
 1E3aa33mPGlkYGV0JnDCJEyHsBNELPq+xv4jjQ6LU4Fvn2R96Sg0dmP1u+oAb7uk1n7n
 wujf0nlxSy7rvm1EzQjUhhgUIqQ1LKoieLRQbi6ccfDltJQxkjF6DP/lQX40q9Kqe7i2
 vK6A==
X-Gm-Message-State: ACrzQf2VdJceO+ycJGXVbxMm7M4hYNqtpiNXHh0iTidAGTapV3D9rJAe
 A7e7JjxukqGgfz8bvokcftpWUg==
X-Google-Smtp-Source: AMsMyM4q3eydvQ5uJfp4IjWRHW1sy5SS0YVO3IL9Z3efyCBZI2HfdJMTWhC3BhepW6tv1XQZfNJIDg==
X-Received: by 2002:a37:5d2:0:b0:6ee:7931:825a with SMTP id
 201-20020a3705d2000000b006ee7931825amr23907302qkf.591.1666644382181; 
 Mon, 24 Oct 2022 13:46:22 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93]) by smtp.gmail.com with ESMTPSA id
 hh5-20020a05622a618500b0039cb8cdaa6bsm479599qtb.63.2022.10.24.13.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 13:46:21 -0700 (PDT)
Message-ID: <4ef59d94-d045-55fc-d531-c84e7edb8333@linaro.org>
Date: Mon, 24 Oct 2022 16:46:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 2/2] dt-bindings: ASoC: simple-card: Add
 system-clock-id property
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
 <ef6a326b-5c61-988b-2ec2-cd8e233e5d28@linaro.org>
 <GMvEU8xVTkjIoQ518XWAaLkhldSZHlk7@localhost>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <GMvEU8xVTkjIoQ518XWAaLkhldSZHlk7@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 23/10/2022 09:47, Aidan MacDonald wrote:
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
> 
>> On 22/10/2022 12:27, Aidan MacDonald wrote:
>>> This is a new per-DAI property used to specify the clock ID argument
>>> to snd_soc_dai_set_sysclk().
>>
>> You did no show the use of this property and here you refer to some
>> specific Linux driver implementation, so in total this does no look like
>>  a hardware property.
>>
>> You also did not explain why do you need it (the most important piece of
>> commit msg).
>>
>>>
>>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/sound/simple-card.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
>>> index ed19899bc94b..cb7774e235d0 100644
>>> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
>>> @@ -57,6 +57,12 @@ definitions:
>>>        single fixed sampling rate.
>>>      $ref: /schemas/types.yaml#/definitions/flag
>>>
>>> +  system-clock-id:
>>> +    description: |
>>> +      Specify the clock ID used for setting the DAI system clock.
>>
>>
>> With lack of explanation above, I would say - use common clock framework
>> to choose a clock...
>>
>>
>> Best regards,
>> Krzysztof
> 
> Sorry, I didn't explain things very well. The system clock ID is indeed
> a property of the DAI hardware. The ID is not specific to Linux in any
> way, and really it's an enumeration that requires a dt-binding.
> 
> A DAI may support multiple system clock inputs or outputs identified by
> the clock ID. In the case of outputs, these could be distinct clocks
> that have their own I/O pins, or the clock ID could select the internal
> source clock used for a clock generator. For inputs, the system clock ID
> may inform the DAI how or where the system clock is being provided so
> hardware registers can be configured appropriately.
> 
> Really the details do not matter, except that in a particular DAI link
> configuration a specific clock ID must be used. This is determined by
> the actual hardware connection between the DAIs; if the wrong clock is
> used, the DAI may not function correctly.
> 
> Currently the device tree is ambiguous as to which system clock should
> be used when the DAI supports more than one, because there is no way to
> specify which clock was intended. Linux just treats the ID as zero, but
> that's currently a Linux-specific numbering so there's guarantee that
> another OS would choose the same clock as Linux.
> 
> The system-clock-id property is therefore necessary to fully describe
> the hardware connection between DAIs in a DAI link when a DAI offers
> more than one choice of system clock.
> 
> I will resend the patch with the above in the commit message.

For example if you want to define which input pin to use (so you have
internal mux), it's quite unspecific to give them some indexes. What is
0? What is 1? Number of pin? Number of pin counting from where?

Since this is unanswered, the IDs are also driver and implementation
dependent, thus you still have the same problem - another OS can choose
different clock. That's not then a hardware description, but software
configuration.

Best regards,
Krzysztof


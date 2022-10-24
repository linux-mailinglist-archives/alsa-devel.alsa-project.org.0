Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7715A60BEBE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 01:40:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6113F48;
	Tue, 25 Oct 2022 01:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6113F48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666654803;
	bh=2SUHMY5EWPF6LjkzKTLHdMx7Wz+DiUMtVGlRkkkCyYg=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KJF93Gd1adxB7izegz6qywsxMLsYq2D2Z2yB2i5ibSFB6Z8cyTiXDVIoJe/lrXVJA
	 IlhzHGbF649DVG927BNrGL6M5Lt8gVyQMODOK0UPuJdSt6QS4WRkArnsDp2OdOvpXa
	 IJjRCKF5k0o4lBwFwHaG9vZdAohC4jV8Z2i8nZqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69A5EF80240;
	Tue, 25 Oct 2022 01:39:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E685F80240; Tue, 25 Oct 2022 01:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02369F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 01:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02369F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AdE3d4TO"
Received: by mail-wr1-x432.google.com with SMTP id o4so10134143wrq.6
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 16:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=uINnN2GHQROVBHy0xs24WDA9fdZGIwwuHPSB6D8DuTs=;
 b=AdE3d4TO018237MR782/QXsf+J0r9dEceAgrDW1PFNxiBs+UkjSYSQOlK+Av988gSq
 pC2fBlVd6LZgxxl8Q6D4ub06f1IYV7gP1B1R5CbqQw6ZM2B+pXt10cHUfTIbZah7QKC4
 NYNiLAWhZjKkaDkMX6Sv4LBkW1w4/IQxp232LUnXgIP/dQ7QyJCChjXYXMRBlj5VQ9SH
 bsvuexK4/+bwRB9U8gpCZ+8eNiHWRu+iAj9pmbdOxx7DsbybOLo6l1N03F/lpL8lzXXb
 A0FyXPeseFkeuRzvAXjAPJAIl6rszM0fV9SOE/q5NUbnZu2qIsMoGj+z10fJG5zj+9Go
 P2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uINnN2GHQROVBHy0xs24WDA9fdZGIwwuHPSB6D8DuTs=;
 b=QnJc7yxOXQpC/hh14GT1+NEN/BtKKvOnX9BE15Uq3REgShRF81WqeNjZUAhGVqKITs
 jRJ3VMZmEK2OG7TdzSVVe7nGvVMkdosTWkm+JCMVVWRrVHeMo+Lshc73TjNEpoV7BAx0
 FwdKml6pgktLHve6hYiLfvFa1PMteAqQjKK6c5ShgZ9D+/ZgX3zi5E9mLKHxl9al+25a
 wVLi0vQ8Fp6JU8oVUMQgN8JZJvqOO2lqdE/6B5eL1qhWS5OBq15h5ZzWjkbOQrsLBqZ7
 60imFLoYwzUZaRjEzlOE/9NypQ8NvQnHJxW09jDNRnBygsM15cgLHfHp6T0B+d735aRw
 fO3Q==
X-Gm-Message-State: ACrzQf3Tf3HEAYt7Z22/BS/6m0qoKdrB+g7fzlTu/NHusHNfnYCw/GnZ
 JdWhM1BdWKWkFzUvVxR2u2M=
X-Google-Smtp-Source: AMsMyM5u2rmG+7GZxp9w2eyvFqjRuht6OLVy3tzVXAe4A+h8TiDnquvfZC2i4xAvYj1QXrV/4tQLwA==
X-Received: by 2002:a05:6000:184:b0:236:7685:7e6d with SMTP id
 p4-20020a056000018400b0023676857e6dmr3918668wrx.305.1666654738132; 
 Mon, 24 Oct 2022 16:38:58 -0700 (PDT)
Received: from localhost (94.197.2.59.threembb.co.uk. [94.197.2.59])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adffacf000000b002366e3f1497sm916284wrs.6.2022.10.24.16.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 16:38:57 -0700 (PDT)
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
 <ef6a326b-5c61-988b-2ec2-cd8e233e5d28@linaro.org>
 <GMvEU8xVTkjIoQ518XWAaLkhldSZHlk7@localhost>
 <4ef59d94-d045-55fc-d531-c84e7edb8333@linaro.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 2/2] dt-bindings: ASoC: simple-card: Add
 system-clock-id property
In-reply-to: <4ef59d94-d045-55fc-d531-c84e7edb8333@linaro.org>
Date: Tue, 25 Oct 2022 00:38:56 +0100
Message-ID: <hXRpArckbrXUelDdaJ3Y2SErmKiuycXt@localhost>
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

> On 23/10/2022 09:47, Aidan MacDonald wrote:
>>
>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
>>
>>> On 22/10/2022 12:27, Aidan MacDonald wrote:
>>>> This is a new per-DAI property used to specify the clock ID argument
>>>> to snd_soc_dai_set_sysclk().
>>>
>>> You did no show the use of this property and here you refer to some
>>> specific Linux driver implementation, so in total this does no look like
>>>  a hardware property.
>>>
>>> You also did not explain why do you need it (the most important piece of
>>> commit msg).
>>>
>>>>
>>>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/sound/simple-card.yaml | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
>>>> index ed19899bc94b..cb7774e235d0 100644
>>>> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
>>>> @@ -57,6 +57,12 @@ definitions:
>>>>        single fixed sampling rate.
>>>>      $ref: /schemas/types.yaml#/definitions/flag
>>>>
>>>> +  system-clock-id:
>>>> +    description: |
>>>> +      Specify the clock ID used for setting the DAI system clock.
>>>
>>>
>>> With lack of explanation above, I would say - use common clock framework
>>> to choose a clock...
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Sorry, I didn't explain things very well. The system clock ID is indeed
>> a property of the DAI hardware. The ID is not specific to Linux in any
>> way, and really it's an enumeration that requires a dt-binding.
>>
>> A DAI may support multiple system clock inputs or outputs identified by
>> the clock ID. In the case of outputs, these could be distinct clocks
>> that have their own I/O pins, or the clock ID could select the internal
>> source clock used for a clock generator. For inputs, the system clock ID
>> may inform the DAI how or where the system clock is being provided so
>> hardware registers can be configured appropriately.
>>
>> Really the details do not matter, except that in a particular DAI link
>> configuration a specific clock ID must be used. This is determined by
>> the actual hardware connection between the DAIs; if the wrong clock is
>> used, the DAI may not function correctly.
>>
>> Currently the device tree is ambiguous as to which system clock should
>> be used when the DAI supports more than one, because there is no way to
>> specify which clock was intended. Linux just treats the ID as zero, but
>> that's currently a Linux-specific numbering so there's guarantee that
>> another OS would choose the same clock as Linux.
>>
>> The system-clock-id property is therefore necessary to fully describe
>> the hardware connection between DAIs in a DAI link when a DAI offers
>> more than one choice of system clock.
>>
>> I will resend the patch with the above in the commit message.
>
> For example if you want to define which input pin to use (so you have
> internal mux), it's quite unspecific to give them some indexes. What is
> 0? What is 1? Number of pin? Number of pin counting from where?
>
> Since this is unanswered, the IDs are also driver and implementation
> dependent, thus you still have the same problem - another OS can choose
> different clock. That's not then a hardware description, but software
> configuration.
>
> Best regards,
> Krzysztof

I answered this already. The enumeration is arbitrary. Create some
dt-bindings and voila, it becomes standardized and OS-independent.

Regards,
Aidan

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0EB6093E0
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 16:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307289D98;
	Sun, 23 Oct 2022 16:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307289D98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666535186;
	bh=sUmesgAHawY2ycxZo1Zhtkpp4TgEsArloZ6kLqLvYFo=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqOeVczpMDhk0bCmCIceunv076EWe/qLXZZIgDdMgbC5T2g7e+WRACyNOPC62QZHU
	 x6605BeK7cAjQ2rNbifWuTx6H/+tV/9NQcdxf8y4EMhDKg7IlT+XHGz45hR2GaCPR7
	 yGbUpu4mdfygqY4NhiBReqkZhBD1HOGEfyaPQoyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B1CF8012A;
	Sun, 23 Oct 2022 16:25:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B18FF803DB; Sun, 23 Oct 2022 16:25:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF27AF801D5
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 16:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF27AF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="md9aWeGH"
Received: by mail-wr1-x436.google.com with SMTP id bu30so11830095wrb.8
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2TGd84mJNKYZWaNw9rSgpYeoRxeJqWopIs81mFX9hM=;
 b=md9aWeGHxax0KdKn3KCysdQBGl/kgf6cCwPGXFAwEDVusPNgVYoIOYrc+MANyQomck
 QJCNOIjpkV7EPUZMYkUSQZpobtjjbvR4TCmixsN5QfyMLpelvx6fFj1Np7ZwAOYyYE0b
 x+23tvXUbnxXMThWdDn5LwrgO6lvL6Q3SYSpLbv8Vl0gPCPFPyDY4Q2JHtze4zUBZiFJ
 83i+fh+JPsN1CCQm6AXcxC7CKKYyvhLMfEI3RIsH4kzxblzv1Tk2xHEu/m2gucZgxatv
 7IJZOB2tPQUt3vYk6HVBrb1Kk9uBODXS8h0os7LhLbGjzh3fUJZacGq1y5O67dlkNfhH
 yeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z2TGd84mJNKYZWaNw9rSgpYeoRxeJqWopIs81mFX9hM=;
 b=q7cvm9DIOTVC7v7pRhcJ4gGWF3QlpQbgTsKXi9Xeg/VUIK8MdnOL+NOh+k7FsRX8Sb
 pinODhoXZ09iJaFKaB158O1dFuBZzc/OqGeogmKg319dKTbbgoJuWEx7BcprJ9R+q3kQ
 qippWVPP1LD3NtiqMo9GBLq5Uc6zwb/F7QdDucwUSTGlmvvdUwH1JtVDlIv+HwiYw7Vd
 yd59FZf15omWcmzSNF2W10OltkHKmd8SGbDzwfvjhkxR20A7o5+n9PAN+oKokSNZtSwh
 cIOR0Gm+LDSeVh90zGA0/EQBWgspEL4n4mHLuHhKCRSm5WeDhbq2EYKS+1f8uXy2Wh8b
 yZkQ==
X-Gm-Message-State: ACrzQf3f6eTdp5lgNlUvP3G7e34RtcsUnFD6qRKE7MN8JY5RYFbk2wI6
 d+HC33yXFE0FE3TVjeY9Sn4=
X-Google-Smtp-Source: AMsMyM5cZ5qYaANvFQtaG8aUeJsUZ/WHs1fwM6KOyo6s+qe6/NWU9ItTeFLX0RH78JM9rSxl4uYKQA==
X-Received: by 2002:adf:f491:0:b0:235:894e:8d6c with SMTP id
 l17-20020adff491000000b00235894e8d6cmr12064536wro.209.1666535120231; 
 Sun, 23 Oct 2022 07:25:20 -0700 (PDT)
Received: from localhost (94.197.10.75.threembb.co.uk. [94.197.10.75])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a05600c0a4500b003b5054c6f87sm9205046wmq.21.2022.10.23.07.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 07:25:19 -0700 (PDT)
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
 <ef6a326b-5c61-988b-2ec2-cd8e233e5d28@linaro.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 2/2] dt-bindings: ASoC: simple-card: Add
 system-clock-id property
Date: Sun, 23 Oct 2022 14:47:56 +0100
In-reply-to: <ef6a326b-5c61-988b-2ec2-cd8e233e5d28@linaro.org>
Message-ID: <GMvEU8xVTkjIoQ518XWAaLkhldSZHlk7@localhost>
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

> On 22/10/2022 12:27, Aidan MacDonald wrote:
>> This is a new per-DAI property used to specify the clock ID argument
>> to snd_soc_dai_set_sysclk().
>
> You did no show the use of this property and here you refer to some
> specific Linux driver implementation, so in total this does no look like
>  a hardware property.
>
> You also did not explain why do you need it (the most important piece of
> commit msg).
>
>>
>> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/sound/simple-card.yaml | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
>> index ed19899bc94b..cb7774e235d0 100644
>> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
>> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
>> @@ -57,6 +57,12 @@ definitions:
>>        single fixed sampling rate.
>>      $ref: /schemas/types.yaml#/definitions/flag
>>
>> +  system-clock-id:
>> +    description: |
>> +      Specify the clock ID used for setting the DAI system clock.
>
>
> With lack of explanation above, I would say - use common clock framework
> to choose a clock...
>
>
> Best regards,
> Krzysztof

Sorry, I didn't explain things very well. The system clock ID is indeed
a property of the DAI hardware. The ID is not specific to Linux in any
way, and really it's an enumeration that requires a dt-binding.

A DAI may support multiple system clock inputs or outputs identified by
the clock ID. In the case of outputs, these could be distinct clocks
that have their own I/O pins, or the clock ID could select the internal
source clock used for a clock generator. For inputs, the system clock ID
may inform the DAI how or where the system clock is being provided so
hardware registers can be configured appropriately.

Really the details do not matter, except that in a particular DAI link
configuration a specific clock ID must be used. This is determined by
the actual hardware connection between the DAIs; if the wrong clock is
used, the DAI may not function correctly.

Currently the device tree is ambiguous as to which system clock should
be used when the DAI supports more than one, because there is no way to
specify which clock was intended. Linux just treats the ID as zero, but
that's currently a Linux-specific numbering so there's guarantee that
another OS would choose the same clock as Linux.

The system-clock-id property is therefore necessary to fully describe
the hardware connection between DAIs in a DAI link when a DAI offers
more than one choice of system clock.

I will resend the patch with the above in the commit message.

Regards,
Aidan

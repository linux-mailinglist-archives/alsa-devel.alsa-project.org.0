Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F026FF09F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 13:39:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07C5483E;
	Thu, 11 May 2023 13:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07C5483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683805198;
	bh=ZVUreU01QijXSA5x0APOp4F7dbtSzxwwMtDNgwbDJGY=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dq0A3Dx7LYrgERwhmGJ76oj2QwLsd0v5ChR6faQs3e4vfhFqvBDvyTuZ/RnEz/Diw
	 tRNDJUu82NkyfSFt+wIVtS0OCiV09rpfFDD7Ll7XuN+Xz39t3sC5DgQicqV4S2GXmY
	 T71zh8+Z699PFGmgXyGbWObXaU1Gd7bRkVD+HNmw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE9FBF80310;
	Thu, 11 May 2023 13:39:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA1A6F8032D; Thu, 11 May 2023 13:39:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9129AF80217
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 13:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9129AF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=InPcQKUG
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3063208beedso8081178f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683805136; x=1686397136;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=p45w9+K64gpNMy6Q3znGQ9JCiUpUiXYonTkSG5/zr20=;
        b=InPcQKUGjQHsBRVp/7giCggU6RSKuzvc2C3cXQgqa/8PmjCKYOT1bNSC9NINdC15TM
         ytaow8a7uhKQ8N4jUYwhV7/oyiG948UtOJOxVGDdmaRzRiEBSSRsIhGWghJQ0MxZBqpE
         j/HRVLotCdj3Ds5Wuqj1K63ScoOJ3weY6TEdCodSnvGtWkZy2QQF+Ez5PhKEcIIpFCTn
         PcwqIicFOqmN4xqcZpPnr3ByZ6QthKRnxTgfKaMKeWfNOrs6A4R2X+X6WOjfUZUg+pT9
         bnzaIa3Uiq/rQkAXuUDxj9uKvf47xiNVTRyDiL4P1GugZFsOddxlj5rMu45+JURP3P4D
         RqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683805136; x=1686397136;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p45w9+K64gpNMy6Q3znGQ9JCiUpUiXYonTkSG5/zr20=;
        b=TIBnW+afYhNPr8Id3gAkvGWUnY2aTfxxuKl7AYb4qMWCmJmBmB8hxtifl31i0+nZio
         aE1uzeJR1Rw21xXHKlJcl2SjVawjXmZRJDDP5KAq13hLJeV60TEamfB7EcropFvFPHGB
         5iFWnZsxeEXR/oJds/BiaYhc+/4rj4qdJt8RNNAJywdViPBbwe653z+wS2/YL+3tV4fI
         fDIXVguEUpCZMGAsElPUXjvJrFHMv6mRfiGmTACciSiVsW2mC9nc5zvTnmKXLQ8u4doz
         TAFq0NfPTto09agrbl3Zxoc9hLeFsA6IN+bK50lQVnvUCPQwNhZgjIuEft9HfSRuHFvI
         Y0Xg==
X-Gm-Message-State: AC+VfDxX4XDzn1uVkmjlW2IIYBva9JQL18okJuPpYRUd3CGVWez2zRg4
	/xPg+v+EDUuFI4Efz+uHDHA=
X-Google-Smtp-Source: 
 ACHHUZ7wz2P1jH0noS5uAZTq0Fl1VyPVKdrtjH1Tz/xH8FTGxx+9bFnOhBTQyg+tuGFgEzkvGaXfTg==
X-Received: by 2002:a5d:44cd:0:b0:2f6:208d:2234 with SMTP id
 z13-20020a5d44cd000000b002f6208d2234mr16092492wrr.2.1683805136129;
        Thu, 11 May 2023 04:38:56 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a5d5109000000b002ffbf2213d4sm20056411wrt.75.2023.05.11.04.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:38:55 -0700 (PDT)
References: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
 <20230510112349.939991-3-aidanmacdonald.0x0@gmail.com>
 <7b3a37e8-0210-c539-5b5b-bf8e587707ea@linaro.org>
 <7Zga7RBqLNcaG5ylTIY4Qn7CUdE1IJsW@localhost>
 <8e98b31a-ef4d-a8bd-32f3-e6f496f2b138@linaro.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: ASoC: Add ESS ES9218P codec bindings
Date: Thu, 11 May 2023 12:26:50 +0100
In-reply-to: <8e98b31a-ef4d-a8bd-32f3-e6f496f2b138@linaro.org>
Message-ID: <zfuvar6MiqIaW9nvjgvUIhA1t3DkZ9tE@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: HS2SBXAHOHQJFYNNB7XOIZVA5RBTCECK
X-Message-ID-Hash: HS2SBXAHOHQJFYNNB7XOIZVA5RBTCECK
X-MailFrom: aidanmacdonald.0x0@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HS2SBXAHOHQJFYNNB7XOIZVA5RBTCECK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 11/05/2023 12:15, Aidan MacDonald wrote:
>>
>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
>>
>>> On 10/05/2023 13:23, Aidan MacDonald wrote:
>>>> ...
>>>> +  ess,max-clock-div:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      Sets the maximum MCLK divider for generating the internal CLK.
>>>> +      CLK must be at least 20x the I2C bus speed or I2C transactions
>>>> +      will fail. The maximum divider should be chosen to ensure that
>>>> +      CLK will not fall below the limit.
>>>> +    enum:
>>>> +      - 1
>>>> +      - 2
>>>> +      - 4
>>>> +      - 8
>>>> +    default: 1
>>>
>>> Why do you need to customize it per board?
>>>
>>
>> There's no generic API to read or change the bus speed (SCL frequency)
>> for I2C adapters, so it's impossible to calculate a limit on the MCLK
>> divider automatically.
>>
>> Defaulting to 1 is always safe, but means wasting power at lower sample
>> rates. If you know what the bus speed is you can use a higher divider
>> limit to save power, and it has to be done at the board/firmware level
>> because that's the only place where the bus speed is known.
>
> If I understand correctly, you only miss a way to get bus_freq_hz from
> i2c_timings to calculate the divider by yourself? This looks like Linux
> limitation, so we shouldn't push it into DT, but rather fix Linux. The
> I2C bus rate is known, the MCLK rate as well, so divider is possible to
> deduce.
>
> I am actually surprised that I2C core does not store the timings
> anywhere and each bus host has to deal with it on its own.
>
> Best regards,
> Krzysztof

I agree it'd be better if Linux provided access the bus frequency, but
even if that API was added it will take time for every I2C adapter to
support it. So in that case we would still need a DT property to provide
a safe limit or use a safe default, and miss potential power savings.

I'd prefer to add the DT property to allow power savings to be had now,
and drop it if/when the kernel gets an API for bus frequency. That will
be safe from a compatibility point of view -- the property won't be
providing any useful information so it won't matter if old DTs have it.

Regards,
Aidan

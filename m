Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A7E6C0EA3
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 11:21:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B2121EF;
	Mon, 20 Mar 2023 11:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B2121EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679307697;
	bh=7Ekhr+Bgrk2zZPq0jS4YiFJhUDR/LxnnP4C56s8lNM0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TRtWQL20BBnLgplQpGsda5CJ3Dtv8GS4U3bIxeP5G4EIpFWlPdJJiAQYd0KYysh9O
	 nxTW4oe3hMwMFQKPJpv8O3EjAfnBDjh2RIx2aSZAT1xP6hRETfjgFRmUE9+L+50l9A
	 IpKxESI+OgCdPweSJDyDSH6qYHo73O5OC+MvBAYE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C083F80254;
	Mon, 20 Mar 2023 11:20:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A4A5F8027B; Mon, 20 Mar 2023 11:20:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AC24F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 11:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AC24F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ju6zmO0M
Received: by mail-ed1-x52a.google.com with SMTP id t5so7752062edd.7
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679307634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2kK6ZKQu/hSTehLzcd0ok1R36H64mU2xn5KpGhq6J1w=;
        b=Ju6zmO0MlfizGGz7Jd7gcva/CJl93kFD7GL9WBLqwSkQXbm5diuXdjj66wL4FqPd0o
         vDDspm4OpDKzQCvZjrw48YkcjilgM2DN0tTww/RgQ+zeLRf3ab6kDouqkBfp3Fs/lf5P
         IiCthWkEFSAhHxMOTZONAInrmRc7bSZ4ytEHlYF1DSeNT71Oss6698O9b6VI3HSPWO51
         7kV19EcKUprriQNj8EZkOrzRmEvpiM6MDK4EDxxcuULZyLikbgPLwLGGaw9jHZlad1/4
         WY7GSPPz82nh7+5l+vQjbk23/B0uB2FuuZFy1+G0GmqeAjGX09lCzcMaPqIW7mn+QDVa
         XPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kK6ZKQu/hSTehLzcd0ok1R36H64mU2xn5KpGhq6J1w=;
        b=MFkPjfcMhpsr5eEUlLNuHQAL9nRehla7D4+R2BALDY2GYtUL9k/yPiSazug7KrHXDT
         /O2bROXD8P+AebI/RvMIDyECoJlgtXT6zvhR/QM8LFdk2IOliPX9cw8cgfDBlzIlA7s3
         EVHSZ2n+SPoSJJg7f6NfawzwejqmciMyY8tehzjPJex/4Q/yi+X2QM8B6F72MMa8+fec
         qX0dD9BR0cffIIyeUVtdz0AJpDzgzESEQQrpb7uzEn1WLnvhtXRXmdmD4njUlUHPHChv
         WXRAIPxYU1a0O6slQFsC9kWt31k1p3+wMY5bw1OkEB3PZhIkOUhULzZ3Rjd1wo4aQLnX
         c/Vw==
X-Gm-Message-State: AO0yUKV20i+qIWfX8F/1/39ngiEiCQiJco3gaxRSpr6tPQzRfLc/RPNK
	f6dIiVeztECCuJpgTQxyL/fuuQ==
X-Google-Smtp-Source: 
 AK7set9UbCg3tUOgT6QPPPtQgc+SuVDmWxP5HoFhnXgAOMYpzcIlAvQy0NuhQuV0XfPLvoiivhc3GQ==
X-Received: by 2002:aa7:db52:0:b0:4fa:ba60:8188 with SMTP id
 n18-20020aa7db52000000b004faba608188mr12697594edt.8.1679307633952;
        Mon, 20 Mar 2023 03:20:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992?
 ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id
 y70-20020a50bb4c000000b004fa380a14e7sm4663350ede.77.2023.03.20.03.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:20:33 -0700 (PDT)
Message-ID: <f13b06e3-1947-b0f3-6523-d2986f085898@linaro.org>
Date: Mon, 20 Mar 2023 11:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/7] dt-bindings: misc: Add the Lantiq PEF2466 E1/T1/J1
 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-2-herve.codina@bootlin.com>
 <96b01241-d57d-a460-4a8b-9e83eaab24ae@linaro.org>
 <20230320104619.468a304b@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320104619.468a304b@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NRRDVTPZQ3WNOPM4353WCS73GVHFVPBR
X-Message-ID-Hash: NRRDVTPZQ3WNOPM4353WCS73GVHFVPBR
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRRDVTPZQ3WNOPM4353WCS73GVHFVPBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/03/2023 10:46, Herve Codina wrote:
>>
>>> +
>>> +  lantiq,data-rate-bps:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [2048000, 4096000, 8192000, 16384000]
>>> +    default: 2048000
>>> +    description:
>>> +      Data rate (bit per seconds) on the system highway.  
>>
>> Why do you need it? How is it different from clock? Do you expect some
>> DDR here?
> 
> This is needed to set the data position on the data line.
> If the data line clock (sysclk-rate-hz) is greater than 'data-rate-bps',
> the device interleaves some holes between data in the full frame.
> 
> The exact position of the data and the holes is defined by 'channel-phase'
> 
> So, two information are needed:
> - The number of slots available (deduced from 'lantiq,data-rate-bps')
> - The slot to use in the available slots ('lantiq,channel-phase" property
> 
> lantiq,data-rate-bps is not a clock but a property used to set the frame
> physical setting. ie the correct data position in the frame. 

OK

(...)

>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    pef2256@2000000 {  
>>
>> Figure out some generic node name.
> 
> What do you think about 'framer' ?

Sure, I don't have particular proposal.


Best regards,
Krzysztof


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588189A337
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 19:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDB9A2D45;
	Fri,  5 Apr 2024 19:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDB9A2D45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712336967;
	bh=CobwK63RZ9ptNhPDMbt5FlrIbX/MuaZA+FSUD0WxozM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TVOxOzBsgfJB8OHxpYPj67L7qzrFjtqALR59m7VP0Kn5m1aoXHntgE/19ppcEyLiB
	 RpPInopXpeh192wFKSlfAKUpwu0ArXrugTyNqsFoV5/lyVWViZrUpZpNmS4MLPMwwH
	 aAy7/OgJl2Uz7a88CZn0FItHEl3rtyYiiz5uVSjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56499F805A8; Fri,  5 Apr 2024 19:08:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5F2DF805A0;
	Fri,  5 Apr 2024 19:08:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7309CF8020D; Fri,  5 Apr 2024 19:08:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7ED72F8015B
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 19:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ED72F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PDgMHi5b
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51381021af1so3943571e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 10:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712336920; x=1712941720;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O1239gaDaNPAZ78s52My0FQ3D4e5jyDecSmiKN1Mr34=;
        b=PDgMHi5b8DPFvaXzl7jfalrFel8TQu0kyQE5aLEj7s391PH7ciQIwMGTs4aoLfEJd0
         bIlWRPoLaPb4yAHYVGBqf/HMrs793+SjIAScKoOSWSODrxBXc1C77UVzZa2zuY6+WOwk
         DLr8bvum0Rtj12AbpbPLo0n+/4u4NTly0B9+RKPbDPE1ig0IpDRyQDRHOlsCm05slD2o
         4saXZ1QE74TVccq4kN0/x1sBdvGSIoEwHSg4MqVL2A3fL+RKmKP3G/seN1jDauvoPuvp
         LKcZsfsPIqpx4vEg/aozzL+3nacwJ/3RNsDcFxExyylhJar7CbVu9AchWh11c1wBZJkT
         G+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712336920; x=1712941720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1239gaDaNPAZ78s52My0FQ3D4e5jyDecSmiKN1Mr34=;
        b=S1FvodfGHE4iAgjpfz+rVEZ77Ro4q5Z2OyUoCDmt6tGUpAs6+6xGag0WE0BPE79CR0
         8d9VXKwpbobChjg1mFZR4Av6TSoP82jksC7+vhvvvEEZ2q/9aj4aKYLCHQoapm2Pl2Wi
         tjy9hcq0XjAokDy4R3y4pXxs3UTyyimAGPkZJzNWbxco87P2diqzRTjmWWTtmdePk1/8
         /kb8ry7AsB7Tp1mCXovGsP3XWkpccTBgS4osLghhIEMtNZZX7phbMWWamIZvZzjpoFwY
         HEd32E8QWvs4jV1miO0EwWVzZR/Fb+/mM5CJWLMbvlzeBQ4U/FTbzipNmiz8oRpzpDIB
         aTvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyFzIVjCJNFM3ws6DUsbwKRfvFTVTKTJr9C90on+QXYIWHTcNpoQWVxQyobzaZcXaXIC/BAsZu11h0wVlrj1X52WCfW8ZgFICrg/E=
X-Gm-Message-State: AOJu0YyQDXYv6qQFGOF9D9xDUxi+nWx/gHzx2aZzDkECkkE53guTKWAs
	W5JIFEoDARAUCLlpfTRCodGPwDknzH1pdFB84IEQeqTA/ugUIR7j86zc3oEs2uA=
X-Google-Smtp-Source: 
 AGHT+IGY4kKeeAa9smwjpXKXta8xbo85lY3pQgqZGZ6IZybGQysWmXT9jzeGlz0WT8xxVIthnKpzMA==
X-Received: by 2002:ac2:554e:0:b0:516:d09b:cbe4 with SMTP id
 l14-20020ac2554e000000b00516d09bcbe4mr1756971lfk.53.1712336919717;
        Fri, 05 Apr 2024 10:08:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 ne6-20020a1709077b8600b00a4e5a6b57a2sm1030254ejc.163.2024.04.05.10.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 10:08:38 -0700 (PDT)
Message-ID: <c9084453-65f1-43b0-88df-5b73052ccb72@linaro.org>
Date: Fri, 5 Apr 2024 19:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: omap-mcpdm: Convert to DT schema
To: Mithil <bavishimithil@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240404160649.967-1-bavishimithil@gmail.com>
 <78091796-fd0a-42dd-a4da-f7bed3025bf9@linaro.org>
 <CAGzNGRnuG_gLUrH1N57WvpKbpiNtFrcsG6nJcacQNJB_yMYNrA@mail.gmail.com>
 <ec7f77a7-2cf1-4ea6-b9c4-d4fe8a1673ab@linaro.org>
 <CAGzNGRktm5gMj=bhtX2RAzcn1v5ref+nV-HV3Fct56FzAzxjWA@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <CAGzNGRktm5gMj=bhtX2RAzcn1v5ref+nV-HV3Fct56FzAzxjWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HCTMBFL3PK5USQKSP6GDBITVQQ67XBHC
X-Message-ID-Hash: HCTMBFL3PK5USQKSP6GDBITVQQ67XBHC
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HCTMBFL3PK5USQKSP6GDBITVQQ67XBHC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/04/2024 18:29, Mithil wrote:
> On Fri, Apr 5, 2024 at 9:27 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 05/04/2024 16:48, Mithil wrote:
>>> So sorry about the 2nd patch being sent as a new mail, here is a new
>>> patch with the changes as suggested
>>>
>>>> Please use subject prefixes matching the subsystem
>>> Changed the patch name to match the folder history.
>>
>> Nothing improved. What the history tells you?
>>
> 
> Referred to "ASoC: dt-bindings: rt1015: Convert to dtschema"
> Not really sure what else I should change.

But the subject you wrote here is "dt-bindings: omap-mcpdm: Convert to
DT schema"?

Where is the ASoC?

> 
>>>
>>>> Is it your full name?
>>> Fixed it, my apologies.
>>>
>>>> Filename like compatible.
>>> Fixed.
>>
>> Still not, compatible is omap4.
>>
> 
> Sorry, seems like I was sending the old file again.
> Will fix this.
> 
>>>
>>>> Please open existing bindings and look how it is done there.
>>> Changed it, is it fine now?
>>
>> You mean v2? I have no clue to what you are responding here, but no, v2
>> did not improve much.
>>
> 
> Again, could you guide me to what needs to be done?
> Description for reg should be fine as this is how it is done in other
> files as well.

reg is not correct. Please point me to files doing that way, so I can
fix them.

You need items with description.

> Interrupts and hwmods use maxItems now.

hwmods lost description, why?

> Changed nodename to be generic in example as well.

"mcpdm" does not feel generic. What is mcpdm? Google finds nothing.
Maybe just "pdm"?

Anyway, this patch has exactly the same name as v1, so what did you
improve? Your v2 is almost the same as v1.


> Those were the suggested changes previously.

Best regards,
Krzysztof


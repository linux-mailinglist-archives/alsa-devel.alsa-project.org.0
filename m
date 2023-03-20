Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C58B6C1F7E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:22:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDCA241;
	Mon, 20 Mar 2023 19:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDCA241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679336559;
	bh=8HnhdZj1QlKk9kL5vflsHeGXYm+t7gL/Kn7/379cxpw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=toavVBYpiupXUbl7ZIaXyQ08WNHPMqoHnuOT9hjv/FLCGW1PtGr8jt8rAsSpsTfeo
	 eOqHigQa6Cjx9GNaoBfnsfAoEe9MTZqT7AD20m+IWL5p+EKAoWJ7r0eLX0hz6VmRP0
	 ePKKatNgPjdfwdHjW/d92DUO6XcEabfm0E51l4X4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0243BF80254;
	Mon, 20 Mar 2023 19:21:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9F17F8027B; Mon, 20 Mar 2023 19:21:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0200F80105
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 19:21:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0200F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FRrtmnC2
Received: by mail-ed1-x534.google.com with SMTP id y4so50469654edo.2
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Mar 2023 11:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679336501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/X9WXUcUsiurfEv5uSz+kyXpuEydk+JbwaKqCGJ/9xc=;
        b=FRrtmnC2erBBSvcnfzAxZ0K+BNPrRJi9gvV+Y0DLpIQtW9/q8vTte52DHucVARi5H/
         iclHcJca1gpjlufGutbrbuwc00BP02ijcdvHXFUkU25oUNNbWEEKyoQvEZDbdZtn8t1h
         98euk1Ifedp56RVTl6lrri/uS/bNgxHQKaeinYrOOHIO3N9/vUDJ1EqYl5aEbE1iGOOR
         IUR3ZXzHvz1cNRsN/VPaWWMvImetsMXlGM8sS6wmyZAF3qOADyXPbR2B8aBL+nYhZ0UQ
         TTKzSsx2aI4XnTJWxlbglCJ+4TdHPspN3cb4xSfJze97oV18jxT1eC5k5ZXCzqeT4UIH
         34Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679336501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/X9WXUcUsiurfEv5uSz+kyXpuEydk+JbwaKqCGJ/9xc=;
        b=e182ULbO0t8Wqytf8tLDw64NqJFBwKA3nboDhiIAaR3sxojeUW+AWS7nPByptig38a
         4GKQC2ohkL8e6A4PRao+uByZW7s3goPMvOhh0JW5jIv471ct3lKSux43XGJzMRFZDYER
         LC2HxrIN/noGuNjMdPwQfS8Ob3iObCag6pgYrs38ZyAxm+R5I3Rj5L5DKW6ztWwW/K5g
         eyg28o9Yfd5xDSUZp1HbWHUt+wyQFtjOfR4rlwh+duR/TvKVy6FXkiBY+tPzZDBiwVlX
         gGeRg/2Lk27JZUHruQFCRQRSEyeXk0JD7YTdZc+SG0pu39MgQVGz+cPWSrGLk/DSAmcX
         ML6w==
X-Gm-Message-State: AO0yUKVfPZ5AOp+vwHDQNkqzTJd4evaqlCesxY0n9XPTkiAPcnC7dL/U
	86a/uTmBvj27TkgCUW4WZJPoRQ==
X-Google-Smtp-Source: 
 AK7set/TzLbyJz/SUqgVkIflRB13JN7Q1OB7bH1C/bWuRTHbXNImEIuhuCpFYE0Hfc2BS6vLAusRJw==
X-Received: by 2002:a17:906:7fcb:b0:930:6ead:f81 with SMTP id
 r11-20020a1709067fcb00b009306ead0f81mr9440396ejs.71.1679336500884;
        Mon, 20 Mar 2023 11:21:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0?
 ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
        by smtp.gmail.com with ESMTPSA id
 i27-20020a170906251b00b0093128426980sm4743489ejb.48.2023.03.20.11.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:21:40 -0700 (PDT)
Message-ID: <f8227202-95ba-7dae-8f41-2023d7a08691@linaro.org>
Date: Mon, 20 Mar 2023 19:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: Add support for the Lantiq
 PEF2256 codec
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-6-herve.codina@bootlin.com>
 <2d4dae57-e46d-7e81-9b56-2148074c8406@linaro.org>
 <20230320191700.3d48e264@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320191700.3d48e264@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XX2IO56YNPK3QFSBQA55RLESPENIYFQU
X-Message-ID-Hash: XX2IO56YNPK3QFSBQA55RLESPENIYFQU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XX2IO56YNPK3QFSBQA55RLESPENIYFQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/03/2023 19:17, Herve Codina wrote:
> Hi Krzysztof
> 
> On Fri, 17 Mar 2023 09:57:11 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 16/03/2023 13:27, Herve Codina wrote:
>>> The Lantiq PEF2256, also known as Infineon PEF2256 or FALC256, is a
>>> framer and line interface component designed to fulfill all required
>>> interfacing between an analog E1/T1/J1 line and the digital PCM system
>>> highway/H.100 bus.
>>>
>>> The codec support allows to use some of the PCM system highway
>>> time-slots as audio channels to transport audio data over the E1/T1/J1
>>> lines.
>>>   
>>
>> Your other file should also have specific compatible, unless this codec
>> is actually part of the framer. Did not look like this in the binding -
>> not $ref.
> 
> No sure to understand what you mean.

Compatible "lantiq,pef2256" in the context of this file is confusing.
Two devices without parent-child having similar but different
compatibles, of which one is generic (covers entire device) and one is
function (codec) specific.


> 
> Anyway, I plan to use a MFD device for pef2256 and reference this yaml
> from the lantiq,pef2256.yaml in the node related to the codec.

It should be part of these series. Submit complete bindings.

> 
> One question related to bindings and related checks:
> Is there a way to check the compatible property of the parent node.
> I mean, here is the binding of a child node of a MFD node.
> From this binding, I would like to be sure that the parent is really a
> pef2256 MFD node.

You cannot and you shouldn't. Parent checks children, not vice-versa.

> 
> May be something like:
>   parent-properties:
>     allOf:
>       compatible:
>         contains:
>           const: lantiq,pef2256
> 
> The idea is to have dtbs_check raise an error if the parent's compatible
> property is not 'lantiq,pef2256'.

But it does not matter. Why your device cannot be used in
lantiq,foobar-9999?


Best regards,
Krzysztof


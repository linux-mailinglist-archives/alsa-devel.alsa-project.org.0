Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 057618814C5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 16:41:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1098C2369;
	Wed, 20 Mar 2024 16:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1098C2369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710949277;
	bh=yBSdj607UAc5s+hvP7CPVuKFZYFu/uVZGG+qtqxl8+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N+X8cKRlrgo73WvRf97/moRVeUMCiulI8p/K3sxEmIDGT3AKoGhkBjxRLRRpfO2A9
	 CRXGo2kjCk9MTlfeQJxpsT7/3GkGtfc6ipQVbYRzNM2S7tk/b/tMMrZ2OU1rhHsE/R
	 KREEW8N5F0w2DCSSCJmb5NGjSroJ7QXJGtcgrRCM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 594A7F80580; Wed, 20 Mar 2024 16:40:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DB8F8057E;
	Wed, 20 Mar 2024 16:40:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 428C0F804E7; Wed, 20 Mar 2024 16:40:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36C07F8010B
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 16:40:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36C07F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UlrRmUNH
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d28051376eso248411fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Mar 2024 08:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710949224; x=1711554024;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxYGnvFML+VTUWkD++QvXGadpkGwkGYbiArVcV37wmI=;
        b=UlrRmUNHqimCFuA1rAtWdAoYoDU9Di+OG6O/U/ue4AEjoQNVjAHEzMv8V/O44MdTBI
         ZlDdXFk2JIUSEZCRaF6ijAY/LJ+aNXJg+wqpxXseo2kfA+E2IBYBujO4Vp9s82+FlNKi
         HedqJNgbY6kgcjvMx88wBRQamBuvFRbbGw0Xrqqt0DtV0NoD4HjgVe92NLqxcHal+d5E
         Cw1bCZ0ljlp5F4ZgVNo94JkMMxSWLZar7LkeJKkWdLWW6rt9JLdp7mO1+KTaM+insqCW
         07fbwpMOS/NCCvagKIT80FeoIV1LBLI0nabjzgFe1btlMisuMNlQWiM4MjGhjpJFFHIq
         +dNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710949224; x=1711554024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxYGnvFML+VTUWkD++QvXGadpkGwkGYbiArVcV37wmI=;
        b=wyPKvrmsx5Lg8DXAtYUv+b6FpBJF5Uis2GKr0SYRMg0uQuXLYHxymm72no6BCA00OG
         fFGW3S4e6M/Kxkm975Izw+gggSyYQd3K0RrBjuIx4odriDbRIP4vJXNmBUTwB28fuei8
         DCMJj4s7t4IeQgpUzIQRmG7U2sbQxZ09TK2NXjI7UQ8XsGNHPjx7QPeLGvfu4BLYJJXL
         riVYKzy2dLbuNKWvqpWkioRBZStZwCmzoZ/pI+hc8DxGL/JpxnovGCLp0pMVDoSZmUs3
         CSk0KrCfVZMMnFZVor1a8kenK5vsojnvsv4EwDAvtdtqDNXLU5MyGlhzxDpbhmRJUhhU
         mdtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4hbwPU2Q7ZEklHj9TfuBGzOq3DjlDgqED3pa5/7HRlnIyaZxdukiTKKMFY4vzWOCny+2EuGM4fp3nuDmFdp60WKoF9f1C09lYpQo=
X-Gm-Message-State: AOJu0YyNo+2g3y7a5GAlKyDlrWgwfaYCv7XP44tTWZirNg58CxfoEOwt
	wXU0sHcbvxXVVtGrCVc7Y7BNE623iRlmeYOG4dXT0a6y5s3beu9x
X-Google-Smtp-Source: 
 AGHT+IFkjCDnIG+obH3vpqIoZtlRGajoCZ7GqSL0r6s79HfobNhYOMoOfjpHT3b/0GeCUbIua5NJmg==
X-Received: by 2002:a05:651c:388:b0:2d4:707d:8b3c with SMTP id
 e8-20020a05651c038800b002d4707d8b3cmr10212936ljp.18.1710949223984;
        Wed, 20 Mar 2024 08:40:23 -0700 (PDT)
Received: from ?IPV6:2001:999:708:5b57:30d6:2195:bb7b:bb94?
 ([2001:999:708:5b57:30d6:2195:bb7b:bb94])
        by smtp.gmail.com with ESMTPSA id
 v23-20020a2e87d7000000b002d2b76dd76esm2196040ljj.57.2024.03.20.08.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 08:40:23 -0700 (PDT)
Message-ID: <7925bbe5-17e8-42cb-a5f0-4f3e06810a90@gmail.com>
Date: Wed, 20 Mar 2024 17:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] ASoC: ti: davinci-i2s: Opitonally drive DX pin
 during capture streams
Content-Language: en-US
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-14-bastien.curutchet@bootlin.com>
 <00182d1d-ef29-457f-9e3e-6e9b57592118@gmail.com>
 <0bb26153-8bcb-475f-8892-5eb925fec538@bootlin.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <0bb26153-8bcb-475f-8892-5eb925fec538@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UQEX5U46B3YAC6VPZTJ662SJWRNTM2Q2
X-Message-ID-Hash: UQEX5U46B3YAC6VPZTJ662SJWRNTM2Q2
X-MailFrom: peter.ujfalusi@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQEX5U46B3YAC6VPZTJ662SJWRNTM2Q2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Bastien,

On 20/03/2024 10:52, Bastien Curutchet wrote:
> Hi Péter,
> 
> On 3/19/24 19:29, Péter Ujfalusi wrote:
>>
>>
>> On 15/03/2024 13:27, Bastien Curutchet wrote:
>>> The McBSP's DX pin that outputs serial data during playback streams can
>>> be used during capture streams to repeatedly output a chosen pattern.
>>> For instance, this can be useful to drive an active-low signal during
>>> captures (by choosing <0> as output pattern).
>>
>> Are there really any other use of this than to pull down or up the DX
>> pin (0 or 0xffff)
>
> I don't know, indeed today I can only think about these two patterns.
> I tried to do something in a 'generic' way so it can evolve if needed.

I think the definition of the 'ti,drive-dx' is somehow odd. It allows
you to set it to 0x1234 and the DX pin will show 0x1234 when you capture
32bit. If you capture 16bit then it will transmit 0x12 (or 0x34?), no?
If you have 4 channel capture then I won't speculate what will be on the
DX pin ;)

Would not be better to say that the DX pin will be driven low or high
during capture _and_ disable the playback support?

> 
>> If you just use the pin as GPIO then you don't need to change anything
>> in the driver, The playback would not erach the pin, so no need to
>> block it.
>>
>>> Enable this behaviour when the device-tree property 'ti,drive-dx' is
>>> present. DX pin is driven with the provided pattern every time a
>>> capture stream is launched.
>>
>> It is an interesting use of the hardware... You are controlling an
>> external device (light an LED when capture is on)?
> 
> Yes I control the chip select pin of the ADC that is sending data to DR
> pin, that's why I need the DX pin to be synchronized with capture
> streams.

I see. Still a a novel use of a feature ;)

> 
>>> This property is not compatible with classic playback stream so
>>> davinci_i2s_trigger() returns an error if a playback stream is started
>>> while 'ti,drive-dx' flag is present.
>>
>> Propbaly add the .startup() callback and block the playback right there?
>>
> 
> Ok, TBH my mastery of the sound subsystem is not high enough to have an
> opinion of where this should go so I'll trust you on this.

It would be more elegant to only create PCM for the capture in this
case, but I would not bother with it.
Stopping user right at startup time is second better.

>>>
>>> This has been tested on a board designed of a DAVINCI/OMAP-L138 where
>>> the DX pin is linked to the chip select pin of the converters of the
>>> capture side.
>>
>> Isn't the DX will be pulled down as soon as the McBSP is enabled?
>> Can you just re-configure the PUPD_SEL for the pin group to make the pin
>> to be pulled the other way?
>>
> 
> Well, the acquisition chain in my use case is a bit convoluted. The DX
> pin's main purpose is to drive ADC chip select but it is also connected
> to other components and all this needs synchronization upon captures.

OK, thanks for the explanation.

-- 
Péter

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFE6D219F
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 15:45:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0091F0;
	Fri, 31 Mar 2023 15:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0091F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680270328;
	bh=ylqturG7s813EZT1M1gLNYJpdbQYoTjEXc9WC7w/Qg8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pSfaFF37LMXgpiE/jvJrVvAoB61Ka4iSa568R7p6R2q1o42e0N7+4plCxRvSix2zd
	 HxSPZ+GryGNOjoz8qErhn1XLhg+evpEizO9bsHnj+UlDWLva2IczcNOoswVdS+fk6o
	 tGt+2eFT9rHC212kWnxAtvmCJ259D3v5y3vDvT0s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 339B7F8021D;
	Fri, 31 Mar 2023 15:44:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7CB6F8024E; Fri, 31 Mar 2023 15:44:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A18FF80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 15:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A18FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yuV7kREd
Received: by mail-lj1-x236.google.com with SMTP id o20so20132521ljp.3
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680270261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IheJlONFtPM7ki6UXfuwGq3nIRoSOV5Cdp2p/ZTSFZo=;
        b=yuV7kREdfx12xlHlYMiKVwLBvhg9ce9BHX/pm1IYHQ7flFlOituOxMiiwEgvKXv5Gi
         uIQIZSyKQwJe9LJc6mDvuPa1cDJq4e/PRPDA5LdGzB58rKGgaqIJPw7labdgwzN/4sQN
         ujmI/7mRkneoxZcpP7Mzm3gvRYMpxqajsMLT98KeA4RPgs+lvqvSUyb5fQpxYPhW7dBG
         6A5DluTaNY5WCEfKPO+71ISjx5Q/CCsEc+bziiPn5SYxoePG/FtSdmuv5BquUbtfnXEm
         gl8CDSC6tBNbsPomzgOyR6CLHAWX7CrMWMYmuwtL1EHl9Lm+AV6JxvFyr2BiglUF890k
         c6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680270261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IheJlONFtPM7ki6UXfuwGq3nIRoSOV5Cdp2p/ZTSFZo=;
        b=gYtzv+J++IM5kGfJHWRVdjERogL4VKpgh9kd81wuw8JGN1oFbSchIU/4CIsezqoUEj
         fvkUmr+wBPOmIrXtIwNYQq++1jNNHLiD/uTDgrGejiGORFEfYhvE/qIlnrXnIyiryx1D
         z/SMF6j9F2oSby0wsV1RATHyhXWktGr/7GTL2w+Wqa60JpjyblY3ATcePNpg6Qix7mCO
         b+7gdHxnpXCCIPDtqzlEQYNKeKkgsSEAkMyKAkUnZ8Vps1KpN+64fa6MVuWetDVLj8l1
         GCTqqY4mbm6Z9O+Z3E981jhr2ybQvz9sIxj4FXgRBRJ/di6Juus9Gx3Ng2WGys25eOzT
         jflg==
X-Gm-Message-State: AAQBX9fUttaHeSFI13xSzZaV/pVYJRchmY79W5FAZsAtUdxOskzWwvGt
	knvnvGLpL6MW9q1JiYZnxX+Xog==
X-Google-Smtp-Source: 
 AKy350bWsdGPWV3KvW7SvF4FPvx7B6jlnZVlmd+/Z5hjH7yj0LVm6SlY8eEM0JoLpn55NYjAj88UEw==
X-Received: by 2002:a2e:6a0f:0:b0:295:a458:e2ce with SMTP id
 f15-20020a2e6a0f000000b00295a458e2cemr2810764ljc.6.1680270260918;
        Fri, 31 Mar 2023 06:44:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 j15-20020a2e3c0f000000b0029d45b15338sm365817lja.42.2023.03.31.06.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 06:44:20 -0700 (PDT)
Message-ID: <a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
Date: Fri, 31 Mar 2023 15:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
 <20230328092645.634375-3-herve.codina@bootlin.com>
 <20230330160510.GB489249@google.com> <20230331094208.41ab4420@bootlin.com>
 <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
 <20230331141104.42445da9@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331141104.42445da9@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CM5CFKWVA4AFB353LW2CELS5YPA74EZM
X-Message-ID-Hash: CM5CFKWVA4AFB353LW2CELS5YPA74EZM
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CM5CFKWVA4AFB353LW2CELS5YPA74EZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/03/2023 14:11, Herve Codina wrote:
> Hi Krzysztof, Lee
> 
> On Fri, 31 Mar 2023 11:13:30 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 31/03/2023 09:42, Herve Codina wrote:
>>> Hi Lee,
>>>
>>> On Thu, 30 Mar 2023 17:05:10 +0100
>>> Lee Jones <lee@kernel.org> wrote:
>>>   
>>>> On Tue, 28 Mar 2023, Herve Codina wrote:
>>>>  
>>>>> The Lantiq PEF2256 is a framer and line interface component designed to
>>>>> fulfill all required interfacing between an analog E1/T1/J1 line and the
>>>>> digital PCM system highway/H.100 bus.    
>>>>
>>>> My goodness!
>>>>
>>>> It's been a long time since I've seen anything quite like this.  
>>>
>>> Yes, old things but working on recent kernel.
>>>   
>>>>
>>>> My suggestion to you:
>>>>
>>>> * Split this up into components that fit functional subsystems  
>>>
>>> It is done. The audio part is present in ASoC subsystem (path 5 in this
>>> series). pinctrl function is implemented in this driver and, as I don't
>>> want to share registers, I would prefer to keep this function inside this
>>> driver.  
>>
>> The amount of defines and huge functions like pef2256_setup_e1()
>> contradict it.
>>
>> Even the pef2256_setup_e1() really does not follow Linux coding style -
>> you know the size requirement, right?
> 
> I know that pef2256_setup_e1() is quite big and I will look at a way
> to split it in a consistent way.
> 
>>
>> pef2256_get_groups_count, struct pinmux_ops and others - this is
>> pinctrl, not MFD! They cannot be in MFD driver.
> 
> Maybe the issue is that MFD was not a good choice.
> The "function" provided are not independent of each other.
> The "main" driver (pef2256.c) needs to do the setup and handle the interrupt.

Just like all PMICs...

> The "function" provided are some glues in order to be used in some sub-systems
> such as audio. Indeed, ASoC needs a codec DAI to be connected to a CPU DAI.

Just like in all other cases...

> These "functions" need to be started (ie probe()) after the pef2256 setup was
> done. So a start (probe()) order relationship is needed.

Just like in all other cases, so I really do not see here anything special.

> 
> If a MFD driver needs independent children to handle independent functions,
> the pef2256 does not fit well as a MFD driver.

Why? So far everything is exactly the same.

> 
> I switched from misc to MFD just to handle child DT nodes instead of having
> phandles. Using child DT nodes instead of phandles is really a good thing and
> need to be kept.

Your DT bindings and nodes are not related to driver design. It does not
matter for Devicetree if you put it to misc or MFD.

It does not matter for driver whether you call it in Devicetree foo or bar.

> The switch to MFD was probably not the best thing to do.

Maybe, but your existing arguments are not really related...

> 
> What do you think if I switched back the pef2256 "main" driver (pef2256.c) to
> misc ?

Why? What would it solve? You want to stuff pinctrl driver to misc, to
avoid Lee's review? No. Pinctrl goes to pinctrl. Not to misc. Not to MFD.

> 
> 
>>
>>>
>>> Also, I sent a RFC related to HDLC and PHY. In this RFC, the pef2256 is
>>> considered as a PHY and handled in the PHY subsystem.
>>>   https://lore.kernel.org/linux-kernel/20230323103154.264546-1-herve.codina@bootlin.com/
>>>   
>>>> * Run checkpatch.pl  
>>>
>>> I did.  
>>
>> There are tons of weird indentation,e.g.:
>> +#define     PEF2256_2X_PC_XPC_XLT	(0x8 << 0)
>>         ^^^^ there is only one space after #define
> 
> I ran checkpatch.pl, not checkpatch.pl --strict.
> 
> The spaces related the #define can be seen on many other drivers.
> 
> #define FOO_REG_BAR	0x10
> #define   FOO_REG_BAR_BIT0	BIT(0)
> #define   FOO_REG_BAR_BIT4	BIT(4)
> 
> The first line is the register offset and the other lines (indented) are
> the bits description related to this register.

I don't think we have such convention in general and argument that some
drivers do it in some subsystems is never a good argument. If they also
misspell things or use Hungarian notation, shall we do the same?

Although maybe it is fine for Lee. I find it unreadable.

git grep '#define  \+[A-Z]' | wc -l
73889
git grep '#define [A-Z]' | wc -l
3996054

In MFD there is only one driver doing this.

Most of other cases are net and gpu.


Best regards,
Krzysztof


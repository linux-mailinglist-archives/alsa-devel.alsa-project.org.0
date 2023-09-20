Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 996A07A8A8E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 19:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0517B9F6;
	Wed, 20 Sep 2023 19:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0517B9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695230731;
	bh=+K6oOPHk2SIJ64PnkNwuZ7ZlpHYw/J0PLeSao8obTE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=psXSrl5iYuNEg+E6z/aQt0Xlahfkl+e8hmz0RuJtPiZdlFinzsxvmscHRve/65Dzx
	 JfVQ3Hx1EoDg3hA2jlbiSzgdH7ZxiIdW45GjmKqDV/eQJLUY8OMaphmJBG5H92kQ9A
	 z1ytzHQ2qqK4T1GhtN+KDeNolOmBHDGydBv9smdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57824F8047D; Wed, 20 Sep 2023 19:24:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3049F801F5;
	Wed, 20 Sep 2023 19:24:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 037DBF8025A; Wed, 20 Sep 2023 19:24:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33175F80125
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 19:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33175F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R6Ag0qrq
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c038a1e2e6so229201fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Sep 2023 10:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695230647; x=1695835447;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AfiikMIrYn39kPmf1XpzwzyflnoDFSxd0c5KM6+tLH4=;
        b=R6Ag0qrqJeeSSk+wFzNsCvJgJVpnCh9OxonEwe7xe7qPK5DqDbYaQixpvZ0AFj2Oty
         HXsZi1OzAA0QCNnV39qnzHmdIs+8pPVqDmT5w+b6o8XMrdACXHSs3UOUkzAIIE5Y7Hrc
         kksV/vnBrdr4OE8LK7Ja+jXvc7wvhmorOr/wQrZAA9gayaTre8BvcGIpvCEgwGwAJ1NH
         chs6JxGq3tYXiKwZNKsq7LVHZOj22o21Gr8W4Dpkb40JBEMId9s7wZFPr28oloPV52W9
         9W4df3MU6e8d5M9rxX9Njk6ZZ4Z7GSGvn5l+7bOU+BYwEdKrGZIuO7qW9ayYagGrRLgg
         8YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695230647; x=1695835447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AfiikMIrYn39kPmf1XpzwzyflnoDFSxd0c5KM6+tLH4=;
        b=GaIGeP/hXPP3CsNXDvEjuyMMjKXw34UnJsNbpWMtET3ePvT5r8f2vUzJxWHIATs3nJ
         IsQdHDzmeRfEvfv5S9pa/Zk5s+VziY4KH2UJk5yzAm2+6KDqsQG2DXU15kJ6Y4SH6OOh
         Et3lDGhBVNXqkIqVl4speeOGrDZYV7R9c6VBF1novr3Y8GmZhduIccZW5PDYJAa62vHG
         uvZLGABca3+a/8vXuhaaxnTSa4rF0gd8JMCYfd9eg2JH27UJBlTs8PmjtQmLZb+Zu7xx
         SXJliizb37dtSRNWtXhRgeC/OhkJjHQt6u3JkBDCcTgLU2wBhfKfsPLhno+c+zLUZSSk
         yThw==
X-Gm-Message-State: AOJu0Yxp8unmsU8wAWpRC1EUrtBh0yUB8EYMmceXG1uh/KhYm/bjsylL
	LaZxH00+VlxfFNQ2IZM1l0I=
X-Google-Smtp-Source: 
 AGHT+IECCauuhP3vTBGBf/lQVx6tED+vbCi8sf5TYDpauGNNEOX3HDVGDsKjG3Bi3kURlLtbgevGPA==
X-Received: by 2002:a05:651c:235:b0:2b9:b27c:f727 with SMTP id
 z21-20020a05651c023500b002b9b27cf727mr2797044ljn.8.1695230646850;
        Wed, 20 Sep 2023 10:24:06 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a2ea448000000b002c128e45245sm107170ljn.23.2023.09.20.10.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 10:24:06 -0700 (PDT)
Message-ID: <68b74422-d53e-4147-bbb5-ffc04443f969@gmail.com>
Date: Wed, 20 Sep 2023 20:24:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
To: Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>
Cc: bcousson@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 jarkko.nikula@bitmer.com, dmitry.torokhov@gmail.com,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-2-andreas@kemnade.info>
 <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
 <20230920063353.GQ5285@atomide.com> <20230920165204.0fbc0ff3@aktux>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230920165204.0fbc0ff3@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KNQZJC5L3LJWCZ6BLVAOSSD6LWUHGL6U
X-Message-ID-Hash: KNQZJC5L3LJWCZ6BLVAOSSD6LWUHGL6U
X-MailFrom: peter.ujfalusi@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNQZJC5L3LJWCZ6BLVAOSSD6LWUHGL6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 9/20/23 17:52, Andreas Kemnade wrote:
> Hi,
> 
> On Wed, 20 Sep 2023 09:33:53 +0300
> Tony Lindgren <tony@atomide.com> wrote:
> 
>> Hi,
>>
>> * Péter Ujfalusi <peter.ujfalusi@gmail.com> [230919 18:25]:
>>>
>>>
>>> On 7/5/23 22:03, Andreas Kemnade wrote:  
>>>> Commit 349355ce3a05 ("ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp")
>>>> dropped prcm_fck for omap4,  
>>
>> The prcm_fck should be there in the dts for each mcbsp interconnect targe
>> module as "fck" alias and get's enabled/disabled when the mcbsp driver
>> calls runtime PM.
>>
>> So maybe the description should explain that things broke as the aliases
>> for prcm_fck and pad_ck no longer get added.
>>
>>> it also dropped the pad_fck for that matter.  
>>
>> OK so an alias is needed for that too.
>>
>> That's the MCPDM_CLKCTRL pad_clks_ck alias, right? Seems like the
>> pad_clks_ck should be claimed by the mcpdm and mcbsp drivers if they are
>> used? I guess it would be for some external device use case?
>>
>>>> so the clk_src might not be >available making the
>>>> clk_get(src) fail.  
>>>
>>> Wow, so OMAP4 audio is pretty broken if would ever need to select FCLK?
>>> By default we don't on OMAP4, but this is astonishing.  
>>
>> So sounds like we just got lucky because of -ENOSUCHUSERS? The mcbsp works
>> for me, not sure how come I'm not seeing this issue, does it now only work
>> for the default clock source?
>>
> Well, I did not run into any problems (besides of no sound output)
> as long as I tried to use the codec side as bitclock/frameclock-master and
> that is what droid4 does...

Looks like only omap3 pandora is using external clock source for McBSP,
most OMAP4/5 devices tend to use McPDM and in most cases the McBSP is
not the clock provider, so the clocking does not matter.

It is going to cause issues on new boards, but those are unlikely to
surface.

-- 
Péter

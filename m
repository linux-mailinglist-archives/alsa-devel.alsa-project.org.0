Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D939E52B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 19:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 792541671;
	Mon,  7 Jun 2021 19:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 792541671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623086388;
	bh=7nQeOl2+i4kU+J361Cqxflj62OuuJMdKi+6RoNyFUDc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ENBEfrufZ/tiSyNuMO6y01wU8t2sRswnaebljpIEms5RtFAe1l6HHsm9Cq9VBGzGC
	 5QxNrNMVI2H5FeLGKPbKGRDBWZ1DRtd0tuFCahqxnBEW5KLSPzzhq197Z25fCksXuL
	 x8CIdG18Pw/U6o6gxTCi+nGHkmSwbguN+4ubkYFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE759F800DF;
	Mon,  7 Jun 2021 19:18:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17276F80212; Mon,  7 Jun 2021 19:18:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E276F800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 19:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E276F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pgvxRH0f"
Received: by mail-wr1-x42a.google.com with SMTP id l2so18529881wrw.6
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ja5aOGaJbvE7Mbmm4R1CDyv9TPCoYULj7ZXvfzW3O3w=;
 b=pgvxRH0fHC3KFNZyjQLpxx+o4EIb1KoLzuI+sDSfcE04bSUnLkgoRO6H82/psjTFih
 6tltKAOi03KBioimEaKs4RYBNMwKq9zKYzoKtUTOshvDAI+pem/mvCrMkY2vy+GPzT16
 KFuNnFubjv2nOpOHIuWTwg3zSH65lBBEatXBXfPnPVrHxP+C6Gc99gxXTAFLNxSYvdoA
 17xfUYjTd0T7d9dGJdxsvPgELykOLLvYVSS8IUaTQ9L/oX+HciZdT9PoZTYLwYwHVxqv
 a9c4xtW+U1jxdJw85asJhOCKsa5pq9mxNpM1a3WlUYhJwqvQ+VyjiaMunePWPQjNrA+9
 EyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ja5aOGaJbvE7Mbmm4R1CDyv9TPCoYULj7ZXvfzW3O3w=;
 b=RFcrm2H4rzBd6LS+nURgGeh222s7CC6BHaaXUuUaSS/g5/8SZ5FybNWBJvWGZhvFaV
 id4j7v50M1+XWFB1DYyA32F9wuJIoyURUZX+cH2cX/cGRkKkwDU5XL7zG2PUWEhIKnhY
 q27LnCk2ffTZlNsCR6IYrKfM3hd0/vRuQI2HXdCsAofTsNF8g75bzAx6IkLr+Kc30oFQ
 /Han76D3hNJyLZVT7u1UBTjMVebRa9QRNRVHuwCSVbz23KmdBpKKgCYgwEBfObEC8zei
 CZJAjXSCSq7WfvZQvWJZcFjv48slRROVGJC2dRmoLmqoubmjU2QcLCyfvG7fmedlF6WQ
 7bcg==
X-Gm-Message-State: AOAM531crGMuvmx4tOolS2pL8M/9gv5vkkfaOLGbsxcB4ZBWAk/7vlcO
 ikGP4o1mL6hblaPCOd9yB6w=
X-Google-Smtp-Source: ABdhPJxPHT2/pxSC00TKR0gA+eP6lreEXAGK1Kao8dPbFz3g+0XpTcgoo/ghZnxITSA4NLmgyKFefw==
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr18869107wrs.361.1623086292009; 
 Mon, 07 Jun 2021 10:18:12 -0700 (PDT)
Received: from ?IPv6:2003:e1:271a:5a00:d006:4279:74c1:a93e?
 (p200300e1271a5a00d006427974c1a93e.dip0.t-ipconnect.de.
 [2003:e1:271a:5a00:d006:4279:74c1:a93e])
 by smtp.gmail.com with ESMTPSA id b188sm168071wmh.18.2021.06.07.10.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 10:18:11 -0700 (PDT)
Subject: Re: [PATCH 0/2] ALSA: usb-audio: scarlett2: Read all configuration at
 init time
To: Takashi Iwai <tiwai@suse.de>, Vladimir Sadovnikov <sadko4u@gmail.com>
References: <cover.1622974661.git.g@b4.vu> <s5h1r9ef895.wl-tiwai@suse.de>
 <3c7a458a-a5cd-08e4-a462-293c5bf633ec@gmail.com>
 <s5hfsxtemjd.wl-tiwai@suse.de>
From: Markus Schroetter <project.m.schroetter@gmail.com>
Message-ID: <78b4dc1e-05ca-3ee1-62aa-737a636b63e3@gmail.com>
Date: Mon, 7 Jun 2021 19:18:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5hfsxtemjd.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: Daniel Sales <daniel.sales.z@gmail.com>, alsa-devel@alsa-project.org,
 "Geoffrey D. Bennett" <g@b4.vu>, Alex Fellows <alex.fellows@gmail.com>
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

Hello all,

if I may add to this; I agree with Daniel here. Geoffreys proposed
changes are already a big improvement to the usability. They avoid a lot
of confusion, especially for new users, caused by the hardware being out
of sync with alsamixer; and also helping with identifying the changes
that Windows did to the configuration from what I can tell.
Additionally, it makes it easier to just adjust the current
configuration after a reboot. Rather than having to either start from
scratch or work from restoring an already stored configuration.

Since I think it'd be an improvement for most users, I'd appreciate it
if these changes could be integrated until a better solution is available.

Best Regards,
Markus

On 07.06.21 17:12, Takashi Iwai wrote:
> On Mon, 07 Jun 2021 17:00:10 +0200,
> Vladimir Sadovnikov wrote:
>> Hello!
>>
>> I would like to say some words from my side.
>>
>> The Scarlett device (especially 18i20) is pretty complicated device
>> and holds a lot of settings in it's internal
>> configuration area (hardware and software).
>>
>> So this is not the only patch which will configure the driver in proper way.
>> Since the device stores it's internal state (and that's good for power
>> safety and mobility), ideally, we should get
>> the almost fully compatible mixer settings with the original Focusrite
>> Control Software.
>>
>> The huge amount of job I've already done i my fork of Geoffrey's driver:
>> https://github.com/sadko4u/focusrite-scarlett-backports/blob/master/prod-drv/mixer_scarlett_gen2.c
>>
>> So we're planning to work on integrating our changes into the common
>> patch sets and will submit changes here.
> Sure, I don't mean against the patches, this looks like an acceptable
> approach.  So don't worry, I'd take the patches once when the fixed
> version is submitted.
>
> However, from the system design POV, all those configurations should
> be a software issue, and ideally we shouldn't  rely on the hardware
> preset state which has been done *somehow* -- it may allow malfunction
> easily.  One thing I've learned over years is that you can never trust
> hardware :)
>
>
> Takashi
>
>> Best,
>> Vladimir
>>
>> 07.06.2021 10:23, Takashi Iwai пишет:
>>> On Sun, 06 Jun 2021 16:16:44 +0200,
>>> Geoffrey D. Bennett wrote:
>>>> These two patches add support for reading the mixer volumes and mux
>>>> configuration from the hardware when the driver is initialising.
>>>>
>>>> Previously the ALSA volume controls were initialised to zero and the
>>>> mux configuration set to a fixed default instead of being initialised
>>>> to match the hardware state.
>>>>
>>>> The ALSA controls for the Scarlett Gen 2 interfaces should now always
>>>> be in sync with the hardware. Thanks to Vladimir Sadovnikov for
>>>> figuring out how to do this.
>>>>
>>>> Takashi, if these pass your review, I believe that they are
>>>> appropriate for:
>>>> #Cc: stable@vger.kernel.org
>>> Well, in general, having a proper fixed value for the initial mixer
>>> value is the right thing, which is a part of the driver's role.
>>> Though, in snd-usb-audio, we don't set up the initial values just
>>> because of laziness; since the topology in USB audio is variable per
>>> device and often hard to parse correctly, it's difficult to determine
>>> the suitable initial values, hence we leave untouched.  So, in that
>>> sense, setting the zero isn't wrong, rather safer, per se.
>>>
>>> However, Scarlett 2 seems to want to be different; it has already some
>>> initialization code to read the existing configs.  So this change
>>> sounds more or less acceptable.  But it's questionable whether it's
>>> really for stable as a "fix".
>>>
>>> In anyway, please fix the bug ktest bot spotted, the missing endian
>>> conversions and resubmit.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>

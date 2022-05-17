Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F057529B30
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 09:42:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B862A1633;
	Tue, 17 May 2022 09:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B862A1633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652773354;
	bh=PuJqOurz5hrSuoNEOoUO0F2ogrxoaYHx+sk1SudhI3o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOEgBl5/flCFqoHMY94998VNRx8BBuGXOBu5nRgEGBlQS+8er6dt16pJDIJHG+p/6
	 3SUVcEeNJXPV1kWPU4PeNBEb4m1CFlucAHoPlDdo05BC1aZJnciQwQRv5DWm7GzyIB
	 Mh34URUy5BQannN8lNlgu59jkMlpaiERv/PW1XKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DAB1F80310;
	Tue, 17 May 2022 09:41:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C37CF800F5; Tue, 17 May 2022 09:41:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 937D6F800F5
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 09:41:27 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B02C8A003F;
 Tue, 17 May 2022 09:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B02C8A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1652773286; bh=8BDSbljIsZ9thCXEy4b7+166NItSjkNOdmC+qLyQ9Ts=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mkMxrzVH3wAq8ac4ZIj3pYPnFrh1exSBfJ2PTkvpPGGkRDxXd89PAyioJLhaggkV2
 vT23T1xxnCElmeI3sPMyuCXYuwt0svNdfQQdqJ+6pfI2orA/UWslvfw5U1HRzyP5dS
 DX/4zTibfVhUxN27sF1ivTjLhvmGe0XC9ujwhR1M=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 17 May 2022 09:41:24 +0200 (CEST)
Message-ID: <e506c2a4-f761-9dec-32fd-1fc38b75f81a@perex.cz>
Date: Tue, 17 May 2022 09:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: UCM2 configuration guide
Content-Language: en-US
To: Peter Wedder <pwedder@protonmail.com>
References: <VwoP3j4nu98HV-5itWgDOdFuspSQQHQI_W_SS_WSy25y82ZLj0VupitgOTUv0AmrvI1q7Xx6gJHtm-g68W8QJWgpndDFrd_f-SA8pNp0qp0=@protonmail.com>
 <7d2feff6-e84f-3512-0bcf-f331b5a807a9@perex.cz>
 <xQsDJDUXWHuq4il0ax5D8UaE0mQXEutgvMK72KFbIx0JnNAFd07UonE_LLnyFHn2m5DsqzFWDjxjUEK_CzioRfcd72Maf2J3GuQyYvDHWfs=@protonmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <xQsDJDUXWHuq4il0ax5D8UaE0mQXEutgvMK72KFbIx0JnNAFd07UonE_LLnyFHn2m5DsqzFWDjxjUEK_CzioRfcd72Maf2J3GuQyYvDHWfs=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 17. 05. 22 5:07, Peter Wedder wrote:
> Sounds good!
> 
> I am also open to reworking the guide into a part of ALSA documentation, if that suits you better.

It sounds good. I started to document UCM here:

https://www.alsa-project.org/alsa-doc/alsa-lib/group__ucm__conf.html

But it may be good to add another pages as examples. The doxygen accepts 
markup texts, so a markup document will be fine. Or it may be better to add 
examples to the alsa-ucm-conf package.

> I must confess I don't exactly understand what you mean by splitting channels "inside app" (what app?), though. Do you mean some kind of tool to avoid having to write configuration by hand? In any case, I will update the guide accordingly if changes are made to the process.

I meant an app which is using UCM configuration. There are two ways to 
describe the channel split:

First - hidden - alsa-lib configuration - application sees stereo/mono PCM 
devices.

Second - UCM values - application will get the shared (one) PCM device and 
information which channels will be used per UCM devices. The channel splitting 
will be handled inside application (pulseaudio / pipewire etc.).

					Jaroslav

> 
> - Peter
> 
> 
> 
> ------- Original Message -------
> On Monday, May 16th, 2022 at 19:31, Jaroslav Kysela <perex@perex.cz> wrote:
> 
> 
>>
>>
>> On 14. 05. 22 19:43, Peter Wedder wrote:
>>
>>> Hello,
>>>
>>> I have been working on an article to describe the process of writing UCM2 configuration to split multi-channel devices into smaller devices, particularly in the context of USB audio interfaces. This is a common problem with enthusiast/studio USB audio interfaces and it happens to be a pet peeve of mine.
>>>
>>> I recently contributed a profile for the Behringer UMC204HD (https://github.com/alsa-project/alsa-ucm-conf/pull/128) and found the process to be a little intimidating, but with a lot of help from Perexg I managed to get it working. I would like to help other potential contributors out by explaining the process step by step.
>>
>>
>> It's because many things are work-in-progress and there's a tight relation
>> between UCM and the alsa-lib's configuration.
>>
>>> I was considering posting the article to the Fedora Magazine (https://fedoramagazine.org/), since that's the distro I use. However, I wanted to check with you, the ALSA maintainers, first, because the intent of the article is to encourage readers to contribute UCM configurations for their own cards, and I thought perhaps a potential surge of contributions is not something you want at the moment.
>>
>>
>> At the time there's a lot of USB cards configs waiting for the merge, but I'd
>> like to clean the configs at first. The per card configurations should not
>> bother so much with the alsa-lib configurations. Also, I'd like to support the
>> channel management (split) by the applications. The implementation may be
>> completely hidden in the included common blocks.
>>
>>> Let me know what you think -- is this a welcome idea or should I forget it? I have a draft of the article available here: https://gist.github.com/brndd/ccec98a575f7c0422d50402937439227
>>
>>
>> Thank you for this work. The document looks nice for users dealing with the
>> support for this type of hardware. Please, wait a moment to complete this
>> support. I will be happy to co-operate with you to finish this.
>>
>> I created an issue #154
>> (https://github.com/alsa-project/alsa-ucm-conf/issues/154) and I'll try to
>> update it until this is finished.
>>
>> Jaroslav
>>
>> BTW: perexg = me
>>
>> --
>> Jaroslav Kysela perex@perex.cz
>>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

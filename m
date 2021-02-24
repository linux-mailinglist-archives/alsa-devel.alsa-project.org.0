Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D5F32386C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 09:16:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFEE3167B;
	Wed, 24 Feb 2021 09:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFEE3167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614154590;
	bh=R55FVcAThFFh5VrLZSfp5l0IGhr5LvKO+/ee77qO32M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Czbu1Wis53MS0xdsOqSLeLl99HKUIwZF4n5KPDLlWX83tO7MRILZhzzpARPH+Osco
	 lNfgKZTvxkkb5bog9RFo69vRP6ns3etrOfgYZRv/W3VTHdjuMxcLZshbMsWgjNLcNP
	 ZO39HjqBcMd1kUbsBDLGFOBzoiHindIwJ6kH8aJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34DEDF8022B;
	Wed, 24 Feb 2021 09:15:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96950F8016C; Wed, 24 Feb 2021 09:14:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A8E8F80129
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 09:14:49 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 26599A003F;
 Wed, 24 Feb 2021 09:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 26599A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614154489; bh=ACfrrQqwGg4Rcp6iIqqs882SWIlrqfEdtJ/EB3+QEw8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=prwq8GX2q2maGAsMstqq6ul+7Vjp1Fvm842nsFLXLmn29BYQEuc25BPLjzEpF3w5H
 qLQ2pSRO/wa4/0BzjPH7pQg2Y1dgYyvKQWnAZXrmuuPDIORKXLWy+AZ2RXPTB44Kgc
 gwdUH78E0uc5UXuxPgf76neFtypDD/vY3VcfdrFo=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 24 Feb 2021 09:14:42 +0100 (CET)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Takashi Iwai <tiwai@suse.de>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <s5hv9aiu55y.wl-tiwai@suse.de>
 <5c6a21c1-7107-3351-25be-c007b0b946d3@perex.cz>
 <s5hh7m2szwb.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <776b4ad9-2612-b08a-cb76-c3e1ce02388a@perex.cz>
Date: Wed, 24 Feb 2021 09:14:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5hh7m2szwb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
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

Dne 24. 02. 21 v 8:12 Takashi Iwai napsal(a):
> On Tue, 23 Feb 2021 21:56:16 +0100,
> Jaroslav Kysela wrote:
>>
>> Dne 23. 02. 21 v 17:20 Takashi Iwai napsal(a):
>>>>> Of course, this implementation would make the integration much easier,
>>>>> and that's a big benefit.  So I have a mixed feeling and not decided
>>>>> yet whether we should go for it right now...
>>>>
>>>> I think that we can reconsider the LED handling implementation later, when
>>>> someone brings something better on the table.
>>>
>>> What worried me is the plan to expose this capability to user-space.
>>> If it's only a kernel-internal, we can fix it in the kernel and
>>> nothing else broken, but if it's a part of API, that's not easy.
>>>
>>> So, if any, I'd like to avoid exposing to the user-space at first.
>>> (But then it comes to the question how to deal with a case like AMD
>>> ACP...)
>>
>> I tried to propose a complete solution and the ACP was one strong reason for
>> this kernel / user space API. So without the user space support, it's just
>> a half solution for known issues.
>>
>> Frankly, I don't see any drawback or a problem even if we remove this API
>> later.
> 
> Removing the user-space API is absolutely no-go.  The only exception
> would be either the case really no one uses it or it's too buggy and
> unfixable.

This is a special case. Even if those LED bits are ignored by kernel in
future, we expect to be replaced with another layer. Thus the functionality
must be retained.

>> The LED group bits are just informal for the user space and it's
>> expected to create the user controls tied to this LED functionality only in
>> alsa-lib/plugins at the moment. The kernel may return an error when the user
>> space tries to set those new bits when the API is deprecated and I believe
>> that the hardware design faults like AMD ACP (without the hardware mute) are rare.
> 
> The experience tells us that users are creative enough to (ab)use a
> new ABI in any unexpected ways, and we have no control for it.  So
> it's not about how alsa-lib is implemented but rather how ABI could be
> abused :)

Ok, I don't have other ideas. I don't agree with your argumentation for this
particular case, where the functionality is marginal. Ideally, the AMD driver
may be recoded to use double-buffering and software mute switch, so we should
handle everything in the kernel space.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

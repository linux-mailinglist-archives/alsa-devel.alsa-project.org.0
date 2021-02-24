Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 061D532396D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 10:29:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BE69167B;
	Wed, 24 Feb 2021 10:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BE69167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614158946;
	bh=WPfKadHsMlkr/BSgGtKQCNYHJt/tH8c5MFf4YxlI9mI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S/4UknjxJ0zLTRXFJJmubdvDcIG4cxYkKQX2NFyO9lgl0khCwAnIcDWXI+mFi5oRL
	 hsNbc2XKV33/djgV4ne04L8zB1o6PyWhqWvrc/yRYCk5WuHmw47aIhcZmEsISYvbhj
	 KQzfJRZdbkk0ho97cKdmc7cDJ/iWiOTu2GAL4buM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6764F80129;
	Wed, 24 Feb 2021 10:27:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD524F8016C; Wed, 24 Feb 2021 10:27:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A772EF80129
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 10:27:26 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A8E7DA003F;
 Wed, 24 Feb 2021 10:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A8E7DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614158840; bh=WbjqLIUjReYmhR//GcAnZlXTWSgh8JTUwJ4qdNLe1oU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=5Ik5PGwTBPFRU3T1mzUyi7ndJnA52gYu0cJtjHJuFDJDSTzruJSN5vYvwp/B2Wf7L
 cx26z27z7fXtYuxsPn9nwSBV/Zaf/d36sC4A3Ki55sMNd8tNSpWKpUXBwg9iH2MMkY
 0zgmKSK0tCNY3sgoVvpucXfh5EZ6HV+yQJoqYwzk=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 24 Feb 2021 10:27:13 +0100 (CET)
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
 <776b4ad9-2612-b08a-cb76-c3e1ce02388a@perex.cz>
 <s5h8s7du9tn.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4574088a-4676-131a-0065-499a516f80ae@perex.cz>
Date: Wed, 24 Feb 2021 10:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5h8s7du9tn.wl-tiwai@suse.de>
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

Dne 24. 02. 21 v 9:52 Takashi Iwai napsal(a):
> On Wed, 24 Feb 2021 09:14:41 +0100,
> Jaroslav Kysela wrote:
>>
>> Dne 24. 02. 21 v 8:12 Takashi Iwai napsal(a):
>>> On Tue, 23 Feb 2021 21:56:16 +0100,
>>> Jaroslav Kysela wrote:
>>>>
>>>> Dne 23. 02. 21 v 17:20 Takashi Iwai napsal(a):
>>>>>>> Of course, this implementation would make the integration much easier,
>>>>>>> and that's a big benefit.  So I have a mixed feeling and not decided
>>>>>>> yet whether we should go for it right now...
>>>>>>
>>>>>> I think that we can reconsider the LED handling implementation later, when
>>>>>> someone brings something better on the table.
>>>>>
>>>>> What worried me is the plan to expose this capability to user-space.
>>>>> If it's only a kernel-internal, we can fix it in the kernel and
>>>>> nothing else broken, but if it's a part of API, that's not easy.
>>>>>
>>>>> So, if any, I'd like to avoid exposing to the user-space at first.
>>>>> (But then it comes to the question how to deal with a case like AMD
>>>>> ACP...)
>>>>
>>>> I tried to propose a complete solution and the ACP was one strong reason for
>>>> this kernel / user space API. So without the user space support, it's just
>>>> a half solution for known issues.
>>>>
>>>> Frankly, I don't see any drawback or a problem even if we remove this API
>>>> later.
>>>
>>> Removing the user-space API is absolutely no-go.  The only exception
>>> would be either the case really no one uses it or it's too buggy and
>>> unfixable.
>>
>> This is a special case. Even if those LED bits are ignored by kernel in
>> future, we expect to be replaced with another layer. Thus the functionality
>> must be retained.
> 
> Well, we cannot know whether the replacement really happens or
> happened, and hence we never kill the old one.  That's the problem.
> 
>>>> The LED group bits are just informal for the user space and it's
>>>> expected to create the user controls tied to this LED functionality only in
>>>> alsa-lib/plugins at the moment. The kernel may return an error when the user
>>>> space tries to set those new bits when the API is deprecated and I believe
>>>> that the hardware design faults like AMD ACP (without the hardware mute) are rare.
>>>
>>> The experience tells us that users are creative enough to (ab)use a
>>> new ABI in any unexpected ways, and we have no control for it.  So
>>> it's not about how alsa-lib is implemented but rather how ABI could be
>>> abused :)
>>
>> Ok, I don't have other ideas. I don't agree with your argumentation for this
>> particular case, where the functionality is marginal. Ideally, the AMD driver
>> may be recoded to use double-buffering and software mute switch, so we should
>> handle everything in the kernel space.
> 
> My argument is that we're trying to add too much freedom just for this
> "marginal" problem.  Honestly speaking, I would feel rather more
> comfortable if it were a kernel control element that just does trigger
> the LED like the original patch from AMD guys.  Then you cannot do
> much wrong.  OTOH, creating a virtual capture switch and let alsa-lib
> handling the software mute, while PA should ignores the soft-mute but

We can force the softvol even if PA set the skip flag for this particular PCM
stream.

> dealing only with the assigned mute LED...  Sounds too complex to me.

It seems that you misunderstood the number of issues which my code is trying
to resolve:

1) set LED based on state from multiple cards (so you cannot trigger LED
inside single driver / single control element); we need one arbiter; this is
the main argument
2) unifies the audio LED interface
3) reduce the hardware driver code

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

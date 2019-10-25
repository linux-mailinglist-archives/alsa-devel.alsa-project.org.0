Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDAE51EA
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 19:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2C641863;
	Fri, 25 Oct 2019 19:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2C641863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572023174;
	bh=sVewlWyvEt+5no446NCmzh0g3lIf8n3PG7cCBzKb4bw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=inj1+mZS1aPqYwWdTLoYGbyY4Ix2aAiKFkQAOwxmcXijvs/5CtpoQkgVzzHQTTH7J
	 0SxccY3dBjrBCwsXLzD+Hfu6vTpEYPwY8d9DLl0NQJOPgkhz1XpyRrn1FjdGJp4gmZ
	 CUvanvD0JGmOgKxrqY78N8D3AgpS7EBwyQEk+Stc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE9DCF80368;
	Fri, 25 Oct 2019 19:04:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC176F8036F; Fri, 25 Oct 2019 19:04:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB111F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 19:04:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2C9A5A003F;
 Fri, 25 Oct 2019 19:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2C9A5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572023065; bh=XjIaiXLgdmGOYn1bdNVtEwahSUeAduIVjqvurmD7Miw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UOfeZlxkCsHacAqpRLw4Hjzc1Uq7iXpjwQR43FLUkS6/XEh1FGz0ttGM1pl+enSzK
 EAxtYJa82ZpiFBZEbUKmH/GhkAB+0WvxW0W1dvbq1RqcSIquDR2x7nEKq/S1qG2fQV
 Azkfogi+rtD/O51/nqc2UQuo3On4Z1PsnE+/0bHw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 25 Oct 2019 19:04:21 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>
References: <20191025123038.19728-1-perex@perex.cz>
 <s5hk18tuhio.wl-tiwai@suse.de>
 <bce57a56-99d0-62d7-1d53-099a75349341@perex.cz>
 <s5h36fgvs0m.wl-tiwai@suse.de>
 <9403a6a7-9b7e-c2a4-5acf-50d6cbaea7c7@perex.cz>
 <s5hwocsucfp.wl-tiwai@suse.de>
 <83e4dc16-07e7-aafb-db43-01a89e31270b@perex.cz>
 <s5heez0oleh.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <12c5e861-dd78-99cc-b16f-5ddc2ad0e33b@perex.cz>
Date: Fri, 25 Oct 2019 19:04:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <s5heez0oleh.wl-tiwai@suse.de>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: change 'HDMI/DP, pcm=' to 'HDMI/DP,
 pcm=' Jack control names
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 25. 10. 19 v 18:11 Takashi Iwai napsal(a):
> On Fri, 25 Oct 2019 16:39:44 +0200,
> Jaroslav Kysela wrote:
>>
>> Dne 25. 10. 19 v 16:28 Takashi Iwai napsal(a):
>>> On Fri, 25 Oct 2019 16:18:20 +0200,
>>> Jaroslav Kysela wrote:
>>>>
>>>> Dne 25. 10. 19 v 16:06 Takashi Iwai napsal(a):
>>>>> On Fri, 25 Oct 2019 15:57:50 +0200,
>>>>> Jaroslav Kysela wrote:
>>>>>>
>>>>>> Dne 25. 10. 19 v 14:38 Takashi Iwai napsal(a):
>>>>>>> On Fri, 25 Oct 2019 14:30:38 +0200,
>>>>>>> Jaroslav Kysela wrote:
>>>>>>>>
>>>>>>>> There is an inconsistency in the names for the HDMI/DP Jack control
>>>>>>>> names between some ASoC drivers and the HDA HDMI driver which
>>>>>>>> introduced this naming in 2011.
>>>>>>>>
>>>>>>>> There might be an impact for the user space (UCM). I will fix
>>>>>>>> the UCM configurations when this patch is applied.
>>>>>>>>
>>>>>>>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>>>>>>> Cc: Mark Brown <broonie@kernel.org>
>>>>>>>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>>>>>
>>>>>>> Yes, that's a known problem, and I left them so far just for keeping
>>>>>>> the already existing stuff working.
>>>>>>>
>>>>>>> Won't this break the current Chromebooks user-space?
>>>>>>
>>>>>> I would really expect to upgrade UCM configs for the recent kernels in
>>>>>> this case. I believe, those sort of issues are better to fix early
>>>>>> than lately. I know, the transition might cause a little issues, but
>>>>>> usually "do upgrade answer" will help. I don't think that we speak
>>>>>> about a large group of users here.
>>>>>
>>>>> Well, that's obviously against our dont-breaking-user-space rule.
>>>>> The UCM profiles have been widely used on Chromebooks, and they can't
>>>>> upgrade easily.
>>>>>
>>>>> So, I believe this is a case where we have to live with messes.
>>>>
>>>> If we speak about Google's kernels, they can apply a revert (depends
>>>> on their upgrade/maintenance policy). If users use the standard Linux
>>>> distributions, then we are fine, don't we?
>>>
>>> No, we can't break the already existing user-space.  That's what Linus
>>> suggested repeatedly over years, too.
>>>
>>>> I would make an exception for the dont-breaking-user-space policy in
>>>> this case. I am sure that the UCM configs will stabilize quickly. And
>>>> this bad jack name is against our control name policy. It's just a
>>>> bug.
>>>
>>> There is no exception for that, it's a so simple rule.  If something
>>> gets *practically* broken by the kernel, it's no-go.  User-space is
>>> user-space, and it doesn't matter whether it's upstream or not.
>>>
>>> And, even if everything is upstream, imagine that user installs two
>>> different kernels, and switches with each other occasionally for
>>> whatever reason.  The UCM upgrade solution won't work, either.
>>
>> It's the corner case with the really low impact. Users do not do this
>> usually. Ok, I will be silent again. It seems that we cannot get an
>> agreement on this simple thing. I just prefer the fix rather than
>> nothing.
> 
> I'd love to fix things, too, of course.  But we need changing our
> mindset: what we - the kernel devs - can control is only inside the
> kernel.  Even the upstream alsa-lib and UCM profiles are merely
> reference implementations.

You speak about ChromeOS not Linux here.. Anyway, I wanted to cleanup the 
driver names like 'sof-skl_hda_card' (mixed - and _). It seems that it's just 
waste of time, because you'll argue that the user-space is incompatible, too.

So every time when we have wrong string in the kernel, we cannot change it, 
because the user-space. Okay, that's imperfect world. We're being driven with 
the single user. Another problem is that we are not able to review all those 
mistakes at the merge time. It is not a complain but a true fact.

I would be really curious what will happen when we change those strings ;-)

		Nice weekend to all,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

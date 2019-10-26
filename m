Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCFBE5E26
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 19:13:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95BAB18DB;
	Sat, 26 Oct 2019 19:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95BAB18DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572110004;
	bh=Wf6BG+LQ4hxMv+I8egO9lG3Tx5P6l0bnF3606eSBWBM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WuaiW8b+4zUXRZXxfWr215K4EqBkCnBZukIXQAaucYyRxaajyUqeDcxXqEzWj3d27
	 Mhf0E9BsQotlf3JklZi1C2MP8OuwLz7tbI2hlqakgxuAqq7bJQAudfic+3ZAAhshhU
	 8ccpHpC6V1sieM25x2dRxK3PolmXqwAKtHj1ngj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6498F80274;
	Sat, 26 Oct 2019 19:11:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4900FF8036B; Sat, 26 Oct 2019 19:11:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3584AF80274
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 19:11:33 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 29AC6A003F;
 Sat, 26 Oct 2019 19:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 29AC6A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572109893; bh=a9cqoO9UhCnCk3OYOI/zX+miIgBeBSaKiNZZZjHeL68=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OaU21uPCr/CUlkui+vXQ8Cm1QMbJ8PdnQD8f5ZS2RxAMtfxrRN2/fWstRFzsQatpL
 Wt3SJXM7tFviVpUeFtoWaq9ptbmd1hlddiBwPHdspp2TDUqAfA1E/UnOoFYSnFtJNc
 wzHGERqSnQpPDQechIrngv5H6KL1/D4TwArzfdhQ=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 26 Oct 2019 19:11:28 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>
References: <20191025123038.19728-1-perex@perex.cz>
 <s5hk18tuhio.wl-tiwai@suse.de>
 <bce57a56-99d0-62d7-1d53-099a75349341@perex.cz>
 <s5h36fgvs0m.wl-tiwai@suse.de>
 <9403a6a7-9b7e-c2a4-5acf-50d6cbaea7c7@perex.cz>
 <s5hwocsucfp.wl-tiwai@suse.de>
 <83e4dc16-07e7-aafb-db43-01a89e31270b@perex.cz>
 <s5heez0oleh.wl-tiwai@suse.de>
 <12c5e861-dd78-99cc-b16f-5ddc2ad0e33b@perex.cz>
 <alpine.DEB.2.21.1910252050230.16459@zeliteleevi>
 <ed87baf1-1f2e-22d6-2bd7-267b209310d4@perex.cz>
 <s5h7e4sneiw.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <149b2b82-f204-00ac-b3e4-6a1dd7de07ee@perex.cz>
Date: Sat, 26 Oct 2019 19:11:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <s5h7e4sneiw.wl-tiwai@suse.de>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Dne 26. 10. 19 v 9:37 Takashi Iwai napsal(a):
> On Fri, 25 Oct 2019 23:03:26 +0200,
> Jaroslav Kysela wrote:
>>
>> Dne 25. 10. 19 v 20:02 Kai Vehmanen napsal(a):
>>> Hi Jaroslav and all,
>>>
>>> On Fri, 25 Oct 2019, Jaroslav Kysela wrote:
>>>
>>>> the single user. Another problem is that we are not able to review all those
>>>> mistakes at the merge time. It is not a complain but a true fact.
>>>
>>> but the strings are in kernel patches, so even if all UCM files don't
>>> go through the list, we can always review when the strings are added
>>> in kernel, right?
>>
>> My point is that we already did this incomplete review (the wrong
>> strings are in the current kernel). We cannot prevent to avoid those
>> code merges, we are just human. I just don't think that the driver /
>> control names should be part of the don't-break-the-userspace policy.
> 
> It's a similar situation like the long-time discussion of tracing:
> when the kernel broke latencytop by changing the tracing format, we
> had to revert it in the end although the tracing format itself isn't
> strictly a "standard kernel ABI".  The consensus is: if upgrading the
> kernel breaks anything *significant*, it's a regression and no-go.
> It's not about whether it's a part of ABI or not.
> 
> In our particular case, the strings you wanted to fix are the ones
> that are actually hard-coded by the UCM profiles that are known to be
> really used on major systems.  That's the only reason of NAK.  If it
> were for some other minor kcontrol elements, it would have been OK.
> 
> Kai's work to integrate SOF to the legacy HDMI driver would be also OK
> because it provides the compatibility mode.  That is, we have some
> excuse that it's not us but users (distros) who actually breaks by
> choosing the kernel configuration explicitly (and even there can be a
> workaround with a module option).

We can add another kernel option for this fix, too. If you like to move
in this direction, I'll modify my patch.

The question is, if the kernel should provide a hint to the user space (UCM), 
that something *significant* changed. Perhaps, the component field in the 
control API might be used for this purpose as I already proposed. In this way, 
we can support both kernels (with old and new control names).

> Or, in general, if a fix is mandatory due to any critical problem
> (leading to a system crash or such) and there is no other way, we'll
> have to adapt it.  But our case is, again, not that category.  It was
> merely a cleanup work.
> 
>>>> I would be really curious what will happen when we change those strings ;-)
>>>
>>> I can share some experiences that happen on Linux distros with Pulseaudio:
>>>
>>> - if mixer control name is changed/missing that us used in
>>>     a UCM enable sequence, the enable sequence will fail and PA will
>>>     not choose that device
>>> 	-> e.g. when wrong HDMI control names are in the UCM file, HDMI
>>> 	output stops working
>>> - if mixer control for a Jack is changed, PA will not listen
>>>     for ALSA kctl events
>>> 	-> HDMI connection is silently missed and HDMI is not listed
>>> 	as a possible output
>>>
>>> .. i.e. in both cases HDMI is essentially broken if you update to
>>> a kernel that updates the strings but don't update user-space in sync.
>>
>> Yes, it's true. But usually, users do only upgrade. If we resolve the
>> UCM configs before the kernel change, the impact is just very low.
> 
> Well, we can't define users' behavior at all.  Upgrading only the
> kernel while keeping the old user-space is a very common practice on
> openSUSE Leap systems, for example.  (Or imagine centos user who wants
> to try a newer kernel.)
> 
>>> I wonder if one option would be to expose "legacy string" aliases,
>>> allowing to make changes but keep existing user-space happy. With my HDMI
>>> codec change, the controls are simply different, so this was not an
>>> option and I had to opt for keeping the whole driver around.
>>
>> It seems that we may need to add conditions to the UCM syntax. There
>> are several ways to do it. For your specific purpose it may look like
>> "if the control exist, use this config" or so.
>>
>> Another approach might be to add something to the decision code which
>> top UCM config file should be loaded. Actually, we rely on the card
>> name / long_name only. It seems that the probe might be extended here.
> 
> Yes, currently a UCM profile is very hard-coded, hence it's quite
> tightly coupled with the kernel driver implementation details.  It
> makes the UCM parser code implementation easier, while it induces this
> kind of incompatibility if we want to change something in the kernel
> side...
> 
> Another (rather tangential) improvement would be to introduce some
> validator in the kernel or in the UCM side to check whether the given
> string names are OK or not.  A generic kcontrol element validator
> might be worth not only for UCM but in general, because lots of ASoC
> drivers tend to use any funky string names, and currently we accept
> them without strict checks.

Yes, we need another conformance tool for the control interface and do more 
checking when the patches are accepted. I agree that the ASoC tree is too much 
benevolent in this area.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

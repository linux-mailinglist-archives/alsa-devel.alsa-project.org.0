Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4444F32553E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 19:10:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 837CD167B;
	Thu, 25 Feb 2021 19:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 837CD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614276658;
	bh=sZ2EQxgAzjr97v71N5aJ7+pn/JTuV+63yT0+6GA+iyg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7RBEehCi5YZeDidwAdIfz+cGwfgAKrRTcRmc+W4MwFL+M0j/lnaNg+1Lth9jbXlA
	 5AjsAJIlllPVbJ3dY2F4g/k4YkoTx298IxrV5yMibO0meDLyRb7l6TCjgqJsoX/99n
	 8gzafdkN9hcuSJs6T0lZuFFarKcl0+miCoVN8FBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B04BEF80245;
	Thu, 25 Feb 2021 19:10:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36A36F80245; Thu, 25 Feb 2021 19:10:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FDC2F80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 19:09:53 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C49B9A003F;
 Thu, 25 Feb 2021 19:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C49B9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1614276591; bh=RKp9CL1SYF4oG4qc18DJYZMP/hxAxmnN2l3dqHkfpK4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ejyd7JiI4lEwcA133kZypPP3BF0cVTSPko+OQu+68nNcUVhF8FUJ7Me55egiCRzK8
 zv1pFNRcXqNFksE2E1HY85SwsdRnrEUHxC3VmUVv7nLH8fv6u0YuP/1GHEJS1k4GAk
 bFix8RUEd0dpP/fPHio0MZdNjjvtat9l2epwWPhU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 25 Feb 2021 19:09:44 +0100 (CET)
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
 <4574088a-4676-131a-0065-499a516f80ae@perex.cz>
 <s5h1rd5u7p4.wl-tiwai@suse.de>
 <03068e15-2157-3ae6-ffd6-7ec315bb49a3@perex.cz>
 <s5hv9ahsqkj.wl-tiwai@suse.de>
 <e7de1dd2-199e-9e07-65a4-2a2eb2b46b49@perex.cz>
 <s5hsg5lsnbu.wl-tiwai@suse.de>
 <9c74e8de-769c-cd98-3944-85bd75bc840b@perex.cz>
 <s5hlfbdskmc.wl-tiwai@suse.de>
 <3c262ea6-2313-3af8-60ae-d59ae8be262d@perex.cz>
 <s5hzgzspg2i.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <254af1a7-6ed4-60be-01b5-76cf08b7f8da@perex.cz>
Date: Thu, 25 Feb 2021 19:09:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5hzgzspg2i.wl-tiwai@suse.de>
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

Dne 25. 02. 21 v 12:00 Takashi Iwai napsal(a):
> On Wed, 24 Feb 2021 18:57:42 +0100,
> Jaroslav Kysela wrote:
>>
>> Dne 24. 02. 21 v 13:42 Takashi Iwai napsal(a):
>>> On Wed, 24 Feb 2021 13:08:55 +0100,
>>> Jaroslav Kysela wrote:
>>>>
>>>> Dne 24. 02. 21 v 12:43 Takashi Iwai napsal(a):
>>>>
>>>>>>> So far, a user control is merely storing the value, let read/write via
>>>>>>> the control API.  That's all, and nothing wrong can happen just by
>>>>>>> that.  Now if it interacts with other subsystem...
>>>>>>>
>>>>>>> A more serious concern is rather the fragility of the setup; for
>>>>>>> enabling the mute LED control, you'd have to create a new user-space
>>>>>>> control, the function of the control has to be ignored by some
>>>>>>> application and some not, etc.  This has to be done on each machine
>>>>>>
>>>>>> You're using "ignore", but as I explained before, the user space switch will
>>>>>> be used in the whole chain:
>>>>>>
>>>>>> capture stream ->
>>>>>>   alsa-lib mute switch / silence PCM stream ->
>>>>>>   PA mute switch / silence PCM stream
>>>>>>
>>>>>> So PA can use this switch like the traditional hardware mute switch.
>>>>>
>>>>> Does it mean PA would work as of now without any change?  Or does it
>>>>> need patching?
>>>>
>>>> Yes, no PA modifications are required with my mechanism. The PA will just see
>>>> the new user space control - mute switch - created in alsa-lib - which will be
>>>> synced the internal PA path mute state like for the hardware mute
>>>> switch.
>>>
>>> OK, but how would we create and manage the user control element?  And
>>> why it has to be user control?
>>
>> The softvol or alsactl can create the user control element. The alsa-lib
>> softvol plugin and PA can silence stream according the state.
> 
> And that's tricky if it's only with PA, as PA won't open a softvol PCM
> stream...

The protection is in alsa-lib, so we can skip to check this hint flag for this
particular case like:

https://github.com/alsa-project/alsa-lib/pull/121/commits/1acc1c7eccab0359996b25de54a6b6e0aa1e0c17

So it may depend on the softvol config not PA itself.

Even for the solution bellow, we need to modify softvol to handle the kernel
control elements, too. Actually softvol is not active, when the specified
control element is found and this element is not from the user space.

>> I see your point to create this control in the kernel space, but any other
>> name than "Mic Capture Switch" (in the ACP case) will be misleading for users,
>> because the user-space does the appropriate real silencing job instead of hw.
>>
>> And if we create "Mic Capture Switch" in the kernel space, it may be
>> misleading for applications (they can think that there's hardware mute control).
>>
>> Perhaps, we can create "Mic Phantom Capture Switch" in kernel which may
>> resolve both problems (no hw mute information + no user confusion).
> 
> Yes, something like that would work.
> The advantage of in-kernel implementation is that it's self-contained,
> so just deploying the new kernel makes everything working.

Ok, so let settle the naming for those controls which depends on the user
space code which does the real work (silencing). Is "Phantom" prefix good -
we're using it for jacks, or someone has a better idea?

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

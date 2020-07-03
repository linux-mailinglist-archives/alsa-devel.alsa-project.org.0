Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF170213C27
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 16:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2877C16C9;
	Fri,  3 Jul 2020 16:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2877C16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593788090;
	bh=zTD49OBk0IafcQkG0ISglUL6kz0Y/NtbpOnRcM3Me7I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iKsU6BZTUbzSopigI0n9mF2u2s1rlBJsOJK4J+SFDS+ogRD7iG6x/NKnUpsSHlxkL
	 htdCjnkilSPYOoz9iY0r69a5rWGFq7ze50CkkpRLGPdW9CZC29i8x2zYU0lJTiZyJS
	 jWeEizD+1M/MmfG5UgaD4S2u6VCIo97nBJgw2+mU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CB5AF8020C;
	Fri,  3 Jul 2020 16:53:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7493F80217; Fri,  3 Jul 2020 16:53:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56DF8F800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 16:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DF8F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="GlhZpdEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593787978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJgezpr7rYnZ0JRMOat5RvSqUuCsmGy/l5PKyjVUnoE=;
 b=GlhZpdEIU1bwUYM7+ROu/YsZFLjDHsQdRmErtKB/3UKvqlS9jtkXc1KGKOM1YsOURTzhRO
 TZGOqHgXwu5eFSftT5S1XoLZGjO9H9H/CT5QfkJfb1a1xmWV3ZaHx7RMQxv0R+6dKpV42h
 Ub9M+FsUL8yrSWLLI6y4R3/bzpWDHsQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-AiTl9N4DPvqRrHx-mILpKw-1; Fri, 03 Jul 2020 10:52:52 -0400
X-MC-Unique: AiTl9N4DPvqRrHx-mILpKw-1
Received: by mail-wm1-f70.google.com with SMTP id b13so33220336wme.9
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 07:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MJgezpr7rYnZ0JRMOat5RvSqUuCsmGy/l5PKyjVUnoE=;
 b=CGbOz8xwcF6sqCjyrPkkScMHME0m0tErJVyZqokzyz/Q0E89/L3XEuK95NvYLKjBrz
 tXRhLUx+vpaKGvId8/z9w8cU6tNRtyAxDA4xvRQieDHWOqHUI0f43O74LD4+fEFMjQtu
 q9Dubsjl2S4/fSBa0fqsSbCRDdYpXJ7Bztb4V2X76GTh/InoSX1anKzPSmAZn4UC6n5d
 kxsJ/d/HF2ayno2wGk93jC05TdxGn0pmvTEENjj6Ovh0biChZbhIkI9X48mON/Py0fUe
 OK9/Bj0/wDti2pNuNXXw4r1/YizQ1TLx1zqI6PtykGivwCofA989JwotFzrHTTe43S4O
 91ag==
X-Gm-Message-State: AOAM530eFaIrVppgNbxSN++aKn5rNT9+EyYWRWXm/3s5RL9rxktwuowT
 IKRqrGeaIhvTm4QH3sxLA4vssg4RcGjoSZ5W2HwYo3GdB+bgXJab8zisVKWycBs2VOYT+VRB2+f
 G4gUIIV273gR6VReEAUjdsWo=
X-Received: by 2002:a5d:404e:: with SMTP id w14mr36515721wrp.268.1593787971368; 
 Fri, 03 Jul 2020 07:52:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykr2VXmm41bwICOVeWBEbu3kH4PW4qNFZu7Yw4MsPKfCEBiiZWPTolf7Oiae6HtFe7nch2jQ==
X-Received: by 2002:a5d:404e:: with SMTP id w14mr36515705wrp.268.1593787971151; 
 Fri, 03 Jul 2020 07:52:51 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id c25sm13301162wml.46.2020.07.03.07.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 07:52:50 -0700 (PDT)
Subject: Re: Fixing sound on Asus UX534F / some UX533 models
To: Kailang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
References: <808c7b46-c86f-a3de-b645-c47e658e8abb@redhat.com>
 <s5hr1uxhc6k.wl-tiwai@suse.de> <b647b169111f4c46a7c81ec80c551498@realtek.com>
 <1a98fc46-b22a-cc2d-8de9-c2e703b2206b@redhat.com>
 <f254a433-63b3-1322-1a85-9b1bdaa04c5b@redhat.com>
 <531e01c492be4534bf1d98e32f4ddf4b@realtek.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <19136909-7041-46ff-9033-82e3619792bc@redhat.com>
Date: Fri, 3 Jul 2020 16:52:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <531e01c492be4534bf1d98e32f4ddf4b@realtek.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 c <kai.heng.feng@canonical.com>,
 =?UTF-8?B?TWF4Y1vpjKbmpq5d?= <maxc@realtek.com>,
 "nuno.dias@gmail.com" <nuno.dias@gmail.com>
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

Hi,

On 6/29/20 7:54 AM, Kailang wrote:
> Hi Hans,
> 
> The bellowing was Gediminas Aleknavicius (lektuv) mention. (Launchpad #173)
> ==>After running the above commands sound and mic works on both built-in and headset with 2.5mm connector. The model is UX533FTC.
> 
> Internal Mic was worked.

I see and in (Launchpad #174) there is another confirmation that everything
works, this time with an UX534FTC.

I also got a report from a user in the Red Hat bugzilla about this:

On an UX534F just these 2 commands are enough to make everything work:

hda-verb /dev/snd/hwC0D0 0x20 0x500 0xf
hda-verb /dev/snd/hwC0D0 0x20 0x400 0x7774

I'm not entirely sure if using the other 2 commands you gave me
are actively causing problems there, or if they just are not
necessary. I've asked the reporter about this.

So it looks like some models need just:

hda-verb /dev/snd/hwC0D0 0x20 0x500 0xf
hda-verb /dev/snd/hwC0D0 0x20 0x400 0x7774

While others need all 4 commands:

hda-verb /dev/snd/hwC1D0 0x20 0x500 0xf
hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7774
hda-verb /dev/snd/hwC1D0 0x20 0x500 0x45
hda-verb /dev/snd/hwC1D0 0x20 0x400 0x5289

Kailang, is that enough to write a kernel patch for this? If not
what other info do you need ?

Regards,

Hans



>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Wednesday, June 24, 2020 9:19 PM
>> To: Kailang <kailang@realtek.com>; Takashi Iwai <tiwai@suse.de>
>> Cc: c <kai.heng.feng@canonical.com>; alsa-devel@alsa-project.org;
>> nuno.dias@gmail.com
>> Subject: Re: Fixing sound on Asus UX534F / some UX533 models
>>
>> Hi,
>>
>> On 6/23/20 12:02 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 6/4/20 8:49 AM, Kailang wrote:
>>>> Hi Hans de Goede,
>>>>
>>>> Please test below.
>>>>
>>>> hda-verb /dev/snd/hwC0D0 0x20 0x500 0xf hda-verb /dev/snd/hwC0D0
>> 0x20
>>>> 0x400 0x7774 hda-verb /dev/snd/hwC0D0 0x20 0x500 0x45 hda-verb
>>>> /dev/snd/hwC0D0 0x20 0x400 0x5289
>>>>
>>>> I think Headset Mic will work.
>>>
>>> Thank you, and sorry for being somewhat slow to respond.
>>>
>>> I do not have access to the affected hardware myself.
>>>
>>> I've asked users who have reported bugs about this to test these
>>> setting and report back in the following bug-reports:
>>>
>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439
>>> https://bugzilla.kernel.org/show_bug.cgi?id=206289
>>> https://bugzilla.redhat.com/show_bug.cgi?id=1834751
>>>
>>> I will follow-up when I have heard back from the bug-reporters.
>>
>> Ok, I've gotten the first feedback. I ve asked the users to test the following
>> after running the 4 suggested hda-verb commands:
>>
>> 1. Speakers
>> 2. Headphones output
>> 3. Internal mic.
>> 4. Headset mic. (using a phone headset with builtin mic with a single T-R-R-S
>> connector)
>>
>> I've got feedback from a user with a UX533FTC-A8221R laptop:
>>
>> 1. Speakers: works
>> 2. Headphones output: works
>> 3. Internal mic: doesn't work
>> 4. Headset mic: works
>>
>> So things are looking ok, but we still have some work to do to get the internal
>> mic to work.
>>
>> Kailang do you have any suggestions for getting the internal mic to work?
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>
>>>>> -----Original Message-----
>>>>> From: Takashi Iwai <tiwai@suse.de>
>>>>> Sent: Tuesday, June 2, 2020 8:42 PM
>>>>> To: Hans de Goede <hdegoede@redhat.com>
>>>>> Cc: Kailang <kailang@realtek.com>; c <kai.heng.feng@canonical.com>;
>>>>> alsa-devel@alsa-project.org; nuno.dias@gmail.com
>>>>> Subject: Re: Fixing sound on Asus UX534F / some UX533 models
>>>>>
>>>>> On Tue, 02 Jun 2020 11:51:49 +0200,
>>>>> Hans de Goede wrote:
>>>>>>
>>>>>> Hi Kai-Heng Feng, Takashi,
>>>>>>
>>>>>> I see that you are on the notification list for this bug:
>>>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439
>>>>>>
>>>>>> So you may have already seen this. Some owners of affected laptops
>>>>>> (which have non working speakers / headphone output atm), have done
>>>>>> some heroic debugging work and come up with a set of
>>>>>> 2 hda-verb commands which fix this.
>>>>>>
>>>>>> I'm not all that familiar with writing hda quirks, so I was hoping
>>>>>> that one of you 2 can come up with a patch to fix this at the
>>>>>> kernel level.
>>>>>>
>>>>>> This would also resolve these 2 bugs, which I believe are the same
>>>>>> bug
>>>>>> really:
>>>>>>
>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=206289
>>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1834751
>>>>>
>>>>> Adding verbs are trivial and it can be done even without patching
>>>>> kernel but providing by a patch via patch module option of snd-hda-intel
>> driver.
>>>>>
>>>>> But, before moving forward, I'd like to confirm about the
>>>>> correctness (and the
>>>>> safeness) of those verbs.
>>>>>
>>>>> Kailang, could you check the COEF verbs mentioned in the bug entry
>> above?
>>>>>
>>>>>
>>>>> thanks,
>>>>>
>>>>> Takashi
>>>>>
>>>>> ------Please consider the environment before printing this e-mail.
>>>>
> 


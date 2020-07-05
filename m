Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A6F214CC0
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jul 2020 15:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F4D816B0;
	Sun,  5 Jul 2020 15:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F4D816B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593955663;
	bh=n5/7CKfYUdn5Z3PQwfpTL+sNs/VKoNbUUH+6E0qF/FI=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vsywyhok06KAGcAs87XpktaZZxGKnJHRpzYJsDl0oPeESYI+QP4Q+vS8N0fvCgOqR
	 RjTR4BnhFSIuqxXTRGQuL/UbqfysQBpQH+m0Kf94wdS3Sai5R2XSwIvqncKq0Sn0gS
	 /U0Ws3RASjRbZyU3DQZxrEfAhvXpFvSK4DSyaKT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28989F80257;
	Sun,  5 Jul 2020 15:26:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D673FF80216; Sun,  5 Jul 2020 15:25:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 535C1F800DA
 for <alsa-devel@alsa-project.org>; Sun,  5 Jul 2020 15:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 535C1F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FgSDdgFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593955535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHNrZjmTTtwCfB/jYNy049Co3PkbgzdVr8LP5FcHr/8=;
 b=FgSDdgFPbDu3Lg0mHXem/VBGgES8PMhRNH+1MHPfslu873Z7ujGZ1LDGNOF3peh//JfWOq
 qgb9Mk7cvO+yL9yfLcyjdP33j+lkpV/RpRfD0w0lHqNB934LRLoI2IuRMo0za1nP3ifpDN
 s3MoBnvmy2NeKumAxUscA7CZXTJeu9I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-W64DzrxWOm-N2iOYIT70WQ-1; Sun, 05 Jul 2020 09:25:30 -0400
X-MC-Unique: W64DzrxWOm-N2iOYIT70WQ-1
Received: by mail-ed1-f70.google.com with SMTP id 92so42431365edl.8
 for <alsa-devel@alsa-project.org>; Sun, 05 Jul 2020 06:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oHNrZjmTTtwCfB/jYNy049Co3PkbgzdVr8LP5FcHr/8=;
 b=pQP+5ydYPKKnku8fZqtt/YVMUoFVvmnDabBHyYkiCtK3dJp7G1OMzozvNVWgtmACL6
 MPa+vuzXFdyEWc0qHtcSy8jTcrzsjZef5Ur7KwxAPmVdNlQW58xcoxHRMLRlAkKtyMLZ
 Zsc0tChXFFtuDI1QD5u2CXHK4GbCYjo9G278rUlLS+ZSy5Wl/RCMzvnE2uQqpB2dwrbC
 H6j3rm3Sykju7hhDLjw8zizHpqPNq7QWfXG/mGvVPnCeC9Zz12vAl5KNWH0aG8e+hOQR
 EDbGC2WAvRj+BNFi8L1oAh60ReszlQ/O9J1pW3Ugi+5xfBjTgAH+6UFMWoa/MQG2go7C
 ScCA==
X-Gm-Message-State: AOAM531TVU/3ZxmO5HmEvzDciIy13sU/msblGoM13oYlLRdjM+vtlgTJ
 0b3VqT/hKaTCtHI9E4R13s0wT3ifIBodsiktmfEOQIc6iINycaWmbHdCQekOF24Syd7n6IJ6e3l
 d/CFNfE6hxH9tiHYmaOdqgwg=
X-Received: by 2002:a17:906:1102:: with SMTP id
 h2mr38625746eja.356.1593955529187; 
 Sun, 05 Jul 2020 06:25:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfhS546c//kNYwT69nPfF80UqwuxwbSGYfnn80HVG6L78HecDAuHFQYgLlUwxIvMLH7E3CgQ==
X-Received: by 2002:a17:906:1102:: with SMTP id
 h2mr38625731eja.356.1593955528945; 
 Sun, 05 Jul 2020 06:25:28 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id z1sm14334760ejb.41.2020.07.05.06.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jul 2020 06:25:28 -0700 (PDT)
Subject: Re: Fixing sound on Asus UX534F / some UX533 models
From: Hans de Goede <hdegoede@redhat.com>
To: Kailang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
References: <808c7b46-c86f-a3de-b645-c47e658e8abb@redhat.com>
 <s5hr1uxhc6k.wl-tiwai@suse.de> <b647b169111f4c46a7c81ec80c551498@realtek.com>
 <1a98fc46-b22a-cc2d-8de9-c2e703b2206b@redhat.com>
 <f254a433-63b3-1322-1a85-9b1bdaa04c5b@redhat.com>
 <531e01c492be4534bf1d98e32f4ddf4b@realtek.com>
 <19136909-7041-46ff-9033-82e3619792bc@redhat.com>
Message-ID: <fad71bc2-9b3d-196c-270f-8d078fef6b37@redhat.com>
Date: Sun, 5 Jul 2020 15:25:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <19136909-7041-46ff-9033-82e3619792bc@redhat.com>
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

On 7/3/20 4:52 PM, Hans de Goede wrote:
> Hi,
> 
> On 6/29/20 7:54 AM, Kailang wrote:
>> Hi Hans,
>>
>> The bellowing was Gediminas Aleknavicius (lektuv) mention. (Launchpad #173)
>> ==>After running the above commands sound and mic works on both built-in and headset with 2.5mm connector. The model is UX533FTC.
>>
>> Internal Mic was worked.
> 
> I see and in (Launchpad #174) there is another confirmation that everything
> works, this time with an UX534FTC.
> 
> I also got a report from a user in the Red Hat bugzilla about this:
> 
> On an UX534F just these 2 commands are enough to make everything work:
> 
> hda-verb /dev/snd/hwC0D0 0x20 0x500 0xf
> hda-verb /dev/snd/hwC0D0 0x20 0x400 0x7774
> 
> I'm not entirely sure if using the other 2 commands you gave me
> are actively causing problems there, or if they just are not
> necessary. I've asked the reporter about this.
> 
> So it looks like some models need just:
> 
> hda-verb /dev/snd/hwC0D0 0x20 0x500 0xf
> hda-verb /dev/snd/hwC0D0 0x20 0x400 0x7774
> 
> While others need all 4 commands:
> 
> hda-verb /dev/snd/hwC1D0 0x20 0x500 0xf
> hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7774
> hda-verb /dev/snd/hwC1D0 0x20 0x500 0x45
> hda-verb /dev/snd/hwC1D0 0x20 0x400 0x5289
> 
> Kailang, is that enough to write a kernel patch for this? If not
> what other info do you need ?

A quick follow-up on this, one of the reporters of:
https://bugzilla.kernel.org/show_bug.cgi?id=206289

Still has a problem with the internal mic not working.

He has tried both using all 4 of these:

hda-verb /dev/snd/hwC1D0 0x20 0x500 0xf
hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7774
hda-verb /dev/snd/hwC1D0 0x20 0x500 0x45
hda-verb /dev/snd/hwC1D0 0x20 0x400 0x5289

As well as just using:

hda-verb /dev/snd/hwC1D0 0x20 0x500 0xf
hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7774

Which some users report is enough for them.
His exact modelis "UX533FTC-A8221R"

Still the 2 / 4 commands (depending on the
exact model) do help for various other users/models
so it would be good to get these added as fixups to
the kernel.

The specific model with the internal-mic issue
will need further examination.

Regards,

Hans



>>> -----Original Message-----
>>> From: Hans de Goede <hdegoede@redhat.com>
>>> Sent: Wednesday, June 24, 2020 9:19 PM
>>> To: Kailang <kailang@realtek.com>; Takashi Iwai <tiwai@suse.de>
>>> Cc: c <kai.heng.feng@canonical.com>; alsa-devel@alsa-project.org;
>>> nuno.dias@gmail.com
>>> Subject: Re: Fixing sound on Asus UX534F / some UX533 models
>>>
>>> Hi,
>>>
>>> On 6/23/20 12:02 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 6/4/20 8:49 AM, Kailang wrote:
>>>>> Hi Hans de Goede,
>>>>>
>>>>> Please test below.
>>>>>
>>>>> hda-verb /dev/snd/hwC0D0 0x20 0x500 0xf hda-verb /dev/snd/hwC0D0
>>> 0x20
>>>>> 0x400 0x7774 hda-verb /dev/snd/hwC0D0 0x20 0x500 0x45 hda-verb
>>>>> /dev/snd/hwC0D0 0x20 0x400 0x5289
>>>>>
>>>>> I think Headset Mic will work.
>>>>
>>>> Thank you, and sorry for being somewhat slow to respond.
>>>>
>>>> I do not have access to the affected hardware myself.
>>>>
>>>> I've asked users who have reported bugs about this to test these
>>>> setting and report back in the following bug-reports:
>>>>
>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=206289
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1834751
>>>>
>>>> I will follow-up when I have heard back from the bug-reporters.
>>>
>>> Ok, I've gotten the first feedback. I ve asked the users to test the following
>>> after running the 4 suggested hda-verb commands:
>>>
>>> 1. Speakers
>>> 2. Headphones output
>>> 3. Internal mic.
>>> 4. Headset mic. (using a phone headset with builtin mic with a single T-R-R-S
>>> connector)
>>>
>>> I've got feedback from a user with a UX533FTC-A8221R laptop:
>>>
>>> 1. Speakers: works
>>> 2. Headphones output: works
>>> 3. Internal mic: doesn't work
>>> 4. Headset mic: works
>>>
>>> So things are looking ok, but we still have some work to do to get the internal
>>> mic to work.
>>>
>>> Kailang do you have any suggestions for getting the internal mic to work?
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>
>>>
>>>
>>>
>>>>>> -----Original Message-----
>>>>>> From: Takashi Iwai <tiwai@suse.de>
>>>>>> Sent: Tuesday, June 2, 2020 8:42 PM
>>>>>> To: Hans de Goede <hdegoede@redhat.com>
>>>>>> Cc: Kailang <kailang@realtek.com>; c <kai.heng.feng@canonical.com>;
>>>>>> alsa-devel@alsa-project.org; nuno.dias@gmail.com
>>>>>> Subject: Re: Fixing sound on Asus UX534F / some UX533 models
>>>>>>
>>>>>> On Tue, 02 Jun 2020 11:51:49 +0200,
>>>>>> Hans de Goede wrote:
>>>>>>>
>>>>>>> Hi Kai-Heng Feng, Takashi,
>>>>>>>
>>>>>>> I see that you are on the notification list for this bug:
>>>>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439
>>>>>>>
>>>>>>> So you may have already seen this. Some owners of affected laptops
>>>>>>> (which have non working speakers / headphone output atm), have done
>>>>>>> some heroic debugging work and come up with a set of
>>>>>>> 2 hda-verb commands which fix this.
>>>>>>>
>>>>>>> I'm not all that familiar with writing hda quirks, so I was hoping
>>>>>>> that one of you 2 can come up with a patch to fix this at the
>>>>>>> kernel level.
>>>>>>>
>>>>>>> This would also resolve these 2 bugs, which I believe are the same
>>>>>>> bug
>>>>>>> really:
>>>>>>>
>>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=206289
>>>>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1834751
>>>>>>
>>>>>> Adding verbs are trivial and it can be done even without patching
>>>>>> kernel but providing by a patch via patch module option of snd-hda-intel
>>> driver.
>>>>>>
>>>>>> But, before moving forward, I'd like to confirm about the
>>>>>> correctness (and the
>>>>>> safeness) of those verbs.
>>>>>>
>>>>>> Kailang, could you check the COEF verbs mentioned in the bug entry
>>> above?
>>>>>>
>>>>>>
>>>>>> thanks,
>>>>>>
>>>>>> Takashi
>>>>>>
>>>>>> ------Please consider the environment before printing this e-mail.
>>>>>
>>


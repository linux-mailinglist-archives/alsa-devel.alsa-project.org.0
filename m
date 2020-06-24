Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7E207457
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 15:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE1C21858;
	Wed, 24 Jun 2020 15:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE1C21858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593004857;
	bh=xNO5yDvWg96Frhzte0rPCTf9LLPb4+8ON6fZccIR5A4=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a5ZdHGJdTAQvC9MwpUT1vZx7vz6/KHemw+1z3+e0o/QomibY+pPhC2wctbq2ffSWL
	 nEIK4ip9nlC5meFej7dOZ5ENy8lkzkZqH63EDdTw+Pi4NOsv/WRfWpcKKFIGiySw1F
	 yW+PvyTYhvncdGVWJvmAUWWPlGKCjdCMUshOjaRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3146F800B2;
	Wed, 24 Jun 2020 15:19:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D688AF8015B; Wed, 24 Jun 2020 15:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E70CF8012F
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 15:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E70CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="G8jYOutf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593004745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sqFL+0VVQXFIPkWDerFgsTMbHwb4u1v2M3CtbM9Ol0s=;
 b=G8jYOutf2oGKixR0Ok8Jren8V7Lt2QWv0SNm6pVpayROEypTtEfGcykx8KwtzeYlhZ6FPr
 k261QsgrD6mJEP/2bNr52wCAMFzpitGo6fiWvU1xKu6uXCrNmrO5SvXdQHRfHvrNQsqa2a
 96TnRanEOSSN6F9l0G+OYuWx1JdZWNk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-BZWlzPHvMrmbukCONOsyaQ-1; Wed, 24 Jun 2020 09:18:58 -0400
X-MC-Unique: BZWlzPHvMrmbukCONOsyaQ-1
Received: by mail-ej1-f70.google.com with SMTP id m21so1750578eji.19
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 06:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sqFL+0VVQXFIPkWDerFgsTMbHwb4u1v2M3CtbM9Ol0s=;
 b=hG+TZAQQzHQwrmpCrSSgz9Lfow1D0rSiofl2RZUjHrVqyTrh5su0SnRURjnNWcsT+b
 2FOBrX4//9lYkGb+k7PyLQcUMzjZpZCy6KQgii1GHkNTTdGQydKJZfEO1O6BSARJTwVt
 YOpjyOOhN4fWk/tRWmNCTKhczjNEHgpi9mRZUFGX5BqKsT7HS+CF2UY3ONKJMo9zPK0d
 BUKr1cshCPCPyIte9sqp+thVKaeO4obV+ySZw5FKG3jUh2DX6Rb2AhpIyBy0H7PTyyuL
 jBzXIOkzLh84GVBlJroJzPT6rTYWAIvoIEed5PAmQ9zYiL7n2J2IT9mfIbZBccQILFOF
 YmWg==
X-Gm-Message-State: AOAM532q+Ih0jrAMKTsz+3E6C3He2CN7B3QXYE++k4p/TcXSVuVVmJvw
 pNP4dKGpC76IgZgfuNjhyOO1zX2O75KsTuW6/upWggj7FlHQ8GF/GLsgveqnUND3jOI8HX4abk/
 OyWnPTkrSvCzmFB234tAZmMo=
X-Received: by 2002:a50:b0a1:: with SMTP id j30mr27020672edd.387.1593004737691; 
 Wed, 24 Jun 2020 06:18:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQJQmqEkL+KHd7t/DDJpav3jDwlMndknnAi8vZGgLuqO/PJXsGcjbp0sM178BZVlweJRmSaQ==
X-Received: by 2002:a50:b0a1:: with SMTP id j30mr27020658edd.387.1593004737459; 
 Wed, 24 Jun 2020 06:18:57 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id cx13sm16239000edb.20.2020.06.24.06.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 06:18:56 -0700 (PDT)
Subject: Re: Fixing sound on Asus UX534F / some UX533 models
From: Hans de Goede <hdegoede@redhat.com>
To: Kailang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
References: <808c7b46-c86f-a3de-b645-c47e658e8abb@redhat.com>
 <s5hr1uxhc6k.wl-tiwai@suse.de> <b647b169111f4c46a7c81ec80c551498@realtek.com>
 <1a98fc46-b22a-cc2d-8de9-c2e703b2206b@redhat.com>
Message-ID: <f254a433-63b3-1322-1a85-9b1bdaa04c5b@redhat.com>
Date: Wed, 24 Jun 2020 15:18:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1a98fc46-b22a-cc2d-8de9-c2e703b2206b@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 c <kai.heng.feng@canonical.com>, "nuno.dias@gmail.com" <nuno.dias@gmail.com>
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

On 6/23/20 12:02 PM, Hans de Goede wrote:
> Hi,
> 
> On 6/4/20 8:49 AM, Kailang wrote:
>> Hi Hans de Goede,
>>
>> Please test below.
>>
>> hda-verb /dev/snd/hwC0D0 0x20 0x500 0xf
>> hda-verb /dev/snd/hwC0D0 0x20 0x400 0x7774
>> hda-verb /dev/snd/hwC0D0 0x20 0x500 0x45
>> hda-verb /dev/snd/hwC0D0 0x20 0x400 0x5289
>>
>> I think Headset Mic will work.
> 
> Thank you, and sorry for being somewhat slow to respond.
> 
> I do not have access to the affected hardware myself.
> 
> I've asked users who have reported bugs about this to test these setting
> and report back in the following bug-reports:
> 
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439
> https://bugzilla.kernel.org/show_bug.cgi?id=206289
> https://bugzilla.redhat.com/show_bug.cgi?id=1834751
> 
> I will follow-up when I have heard back from the
> bug-reporters.

Ok, I've gotten the first feedback. I ve asked the
users to test the following after running the 4 suggested
hda-verb commands:

1. Speakers
2. Headphones output
3. Internal mic.
4. Headset mic. (using a phone headset with builtin mic with a single T-R-R-S connector)

I've got feedback from a user with a UX533FTC-A8221R laptop:

1. Speakers: works
2. Headphones output: works
3. Internal mic: doesn't work
4. Headset mic: works

So things are looking ok, but we still have some
work to do to get the internal mic to work.

Kailang do you have any suggestions for getting the
internal mic to work?

Regards,

Hans






>>> -----Original Message-----
>>> From: Takashi Iwai <tiwai@suse.de>
>>> Sent: Tuesday, June 2, 2020 8:42 PM
>>> To: Hans de Goede <hdegoede@redhat.com>
>>> Cc: Kailang <kailang@realtek.com>; c <kai.heng.feng@canonical.com>;
>>> alsa-devel@alsa-project.org; nuno.dias@gmail.com
>>> Subject: Re: Fixing sound on Asus UX534F / some UX533 models
>>>
>>> On Tue, 02 Jun 2020 11:51:49 +0200,
>>> Hans de Goede wrote:
>>>>
>>>> Hi Kai-Heng Feng, Takashi,
>>>>
>>>> I see that you are on the notification list for this bug:
>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439
>>>>
>>>> So you may have already seen this. Some owners of affected laptops
>>>> (which have non working speakers / headphone output atm), have done
>>>> some heroic debugging work and come up with a set of
>>>> 2 hda-verb commands which fix this.
>>>>
>>>> I'm not all that familiar with writing hda quirks, so I was hoping
>>>> that one of you 2 can come up with a patch to fix this at the kernel
>>>> level.
>>>>
>>>> This would also resolve these 2 bugs, which I believe are the same bug
>>>> really:
>>>>
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=206289
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1834751
>>>
>>> Adding verbs are trivial and it can be done even without patching kernel but
>>> providing by a patch via patch module option of snd-hda-intel driver.
>>>
>>> But, before moving forward, I'd like to confirm about the correctness (and the
>>> safeness) of those verbs.
>>>
>>> Kailang, could you check the COEF verbs mentioned in the bug entry above?
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>> ------Please consider the environment before printing this e-mail.
>>


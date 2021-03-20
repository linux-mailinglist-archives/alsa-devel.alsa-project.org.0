Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E5342B67
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Mar 2021 10:19:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8E30850;
	Sat, 20 Mar 2021 10:18:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8E30850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616231980;
	bh=YMERVZLEmPw0QhT/SwKoWMez7YQAyA2LM7sdlkMGI0A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VUsqDdJwv93mZMITONPvgMlcMRpz+xynDzQdZx4SOK+4JT4RdVcxQHEFFOkaE/dkS
	 lG38Srm/7y/4kjb59tHClFPn1aHYke7AkbdHXVzyUZmGhQX7hnRZBVHsz6ogF88jaK
	 eoBC3hY4WsqESXJPf2t5VUIx41gU7jg+C2l37qc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38E18F80224;
	Sat, 20 Mar 2021 10:18:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EED30F80171; Sat, 20 Mar 2021 10:18:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DFE5F80118
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 10:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DFE5F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Fypc35K8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616231881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOIWfjjpKa1ELfnMz6DI7c8sVCmcfZ6qquxku+gkBvQ=;
 b=Fypc35K848uz6+hDhyoeFDhxw7jfHHnkZr1KYAHKNU1lDDTuPydddWY1AvGPIRBI2QCJYs
 yG8dPJYHcOpZniJ9VjkZkWXkIG/Lds6k7Amps5e8ACQoFriWYwVp0FM14AKqFYi6XSIHlf
 YwMc3EwFoZs8s/mPQ+8KpWzRI/Acmoc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-rbp3YvGjOA2imzKdwZIKuA-1; Sat, 20 Mar 2021 05:17:59 -0400
X-MC-Unique: rbp3YvGjOA2imzKdwZIKuA-1
Received: by mail-ed1-f72.google.com with SMTP id i19so24346212edy.18
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 02:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IOIWfjjpKa1ELfnMz6DI7c8sVCmcfZ6qquxku+gkBvQ=;
 b=icU/Sb1/6Sc1tu4hHi8fR6WeH9dBVn5BJkeEoUoycC30RmEoRPhr1nhg6fhfXZvD2l
 K9Nn6SopF0KQVbAroe/x5QRwJJOCWTmrYvCsICnsrpLktJl3z7EXquJFkoBA69Y7y+07
 dOZtTVtxqjKDYYP3oVQctjIiDQbHDquqiUphQ2WZiqU6si/ejwyAF0xCwyNf4JPVQ5XL
 byh14HxOMngBkJix6GBMkiY06E5ZedWpCjSXuUDelXuTXZl+rHVaaVUjmQGAQCI30KrP
 OVQeYl0wYknLhJvBOHOyzoNO5+FKutYu+7i/s2C0o4IkNGae1URyWvAcMUpstyuKPWmC
 MlsQ==
X-Gm-Message-State: AOAM533d6vpPSHr6pdZ8By/xfqt/Z6jiX12XfY7byULLRxvnX/phV/oC
 Tgeor79qDaIpThRp/gcOHBbxIJicM5FjtgHSusEhW9U/CPWbZKok95LfnDJ0X3gTdbkN59qGPvh
 dPCi5evSexkksIMzaO3MrzdmATL/A6kvfi0QTQH1uWJAOEYb+4NHOTmVvE9ahOF2STFiTXT2v54
 g=
X-Received: by 2002:a17:906:73cd:: with SMTP id
 n13mr8661376ejl.535.1616231878442; 
 Sat, 20 Mar 2021 02:17:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5Uf1FHGpBRjhXWWQ9X2NeI5T7tHCE2PxvN8xRdu0nkksmVhYWI+OmLxgxp5RRcdHe7SmXsg==
X-Received: by 2002:a17:906:73cd:: with SMTP id
 n13mr8661360ejl.535.1616231878234; 
 Sat, 20 Mar 2021 02:17:58 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id p27sm4798414eja.79.2021.03.20.02.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 02:17:57 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] ALSA: led control - add sysfs kcontrol LED marking
 layer
To: Takashi Iwai <tiwai@suse.de>
References: <20210317172945.842280-1-perex@perex.cz>
 <20210317172945.842280-7-perex@perex.cz>
 <a3ddb881-6580-cd25-ef3c-734e686e6942@redhat.com>
 <s5h5z1nf47r.wl-tiwai@suse.de>
 <3820909c-29ce-9f3f-d1e6-c4611e06abe4@redhat.com>
 <s5h35wqff1m.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a2018c94-8731-de29-e447-92457176a1b4@redhat.com>
Date: Sat, 20 Mar 2021 10:17:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <s5h35wqff1m.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi,

On 3/20/21 8:41 AM, Takashi Iwai wrote:
> On Fri, 19 Mar 2021 23:08:33 +0100,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 3/19/21 6:22 PM, Takashi Iwai wrote:
>>> On Fri, 19 Mar 2021 17:34:39 +0100,
>>> Hans de Goede wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 3/17/21 6:29 PM, Jaroslav Kysela wrote:
>>>>> We need to manage the kcontrol entries association for the LED trigger
>>>>> from the user space. This patch adds a layer to the sysfs tree like:
>>>>>
>>>>> /sys/devices/virtual/sound/ctl-led/mic
>>>>>    + card0
>>>>>    |  + attach
>>>>>    |  + detach
>>>>>    |  ...
>>>>>    + card1
>>>>>       + attach
>>>>>       ...
>>>>>
>>>>> Operations:
>>>>>
>>>>>   attach and detach
>>>>>     - amixer style ID is accepted and easy strings for numid and
>>>>>       simple names
>>>>>   reset
>>>>>     - reset all associated kcontrol entries
>>>>>   list
>>>>>     - list associated kcontrol entries (numid values only)
>>>>>
>>>>> Additional symlinks:
>>>>>
>>>>> /sys/devices/virtual/sound/ctl-led/mic/card0/card ->
>>>>>   /sys/class/sound/card0
>>>>>
>>>>> /sys/class/sound/card0/controlC0/led-mic ->
>>>>>   /sys/devices/virtual/sound/ctl-led/mic/card0
>>>>>
>>>>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>>>
>>>> Thank you so much for this patch.
>>>>
>>>> I've given this new version a try, dropping my sound/soc/codecs/rt56??.c patches to set the access-flags directly.
>>>>
>>>> And with these 3 lines in /etc/rc.d/rc.local I get nicely working control of the mute
>>>> LED build into the (detachable) USB-keyboard's mute hot-key:
>>>>
>>>> modprobe snd_ctl_led
>>>> echo -n name="Speaker Channel Switch" > /sys/class/sound/card1/controlC1/led-speaker/attach
>>>> echo -n name="HP Channel Switch" > /sys/class/sound/card1/controlC1/led-speaker/attach
>>>>
>>>> This needs to be replaced by some UCM profile code doing the equivalent of course,
>>>> but for a proof-of-concept test of the kernel API this introduces the above will do.
>>>
>>> IMO, that's the question: how we'll enable this in future.  If the
>>> binding of the control/mute mapping is provided via UCM, it's supposed
>>> to be changeable by each user.  Then the current sysfs permission
>>> doesn't fit.  OTOH, if it's 0666, it's accessible to all users even
>>> remotely, which is worse than the access with the normal sound device
>>> file.  Or if it's supposed to be changed via udev stuff or systemd?
>>> Or is it just for debugging?
>>>
>>> Through a quick glance over the series, I'm fine to take those
>>> patches, but the only concern is the sysfs entries.  Basically, once
>>> when we use sysfs entries, it's set in stone.  So we should be very
>>> clear about our strategy how to deploy the control/mute mapping
>>> regarding using those sysfs entries.
>>>
>>> OTOH, if the interface is thought for debugging or development
>>> purpose, it could be done in debugfs, which we can keep playing in
>>> further development, too.
>>>
>>> And, BTW, the mute LED mode setup doesn't have to be sysfs entries;
>>> we'd need primarily only the flags for inverted LED behavior, and
>>> those are only two, so it could be simply module options.  Then it's
>>> even easier for users to set up than tweaking sysfs entries.
>>
>> The flexibility offered by this new sysfs API is necessary for the ASoC
>> codec drivers, because Mark does not want to have which controls are
>> tied to the LED triggers hard-coded inside the codec drivers.
> 
> The hard-coded mapping itself isn't always bad things, IMO.  Of
> course, it's a question whether to be done in the codec driver in a
> fixed routing.  A machine driver would fit well, instead; i.e. instead
> of the control-access bit flag, just bind statically from the machine
> driver after instantiating the kctl objects like sysfs does.

Yes setting the new LED-access flags from the machine driver(s) would
work too for the 3 devices (spanning 2 machine drivers) on which
I'm trying to get the mute-LED to work, assuming Mark is going to be
ok with that approach. But those are pretty simple devices.

There also is the recently posted Dell privacy stuff which is
also using LED-triggers on a "full-blown" Intel core series laptop,
which use codecs in much more varied ways. And I've the feeling that
we will see more of this stuff coming up and in those cases the extra
flexibility which going through UCM gives us would be good I think.

I believe that that Dell privacy stuff is actually the reason why
Jaroslav started this whole series, right Jaroslav ?

I'm just piggy backing along with my own use-cases which I had
on my wishlist / itches-list for a while now :)

>> So as Jaroslav mentions in his reply, the plan is to have the UCM
>> profiles contain commands to setup the LED triggers to this new
>> sysfs API.
> 
> IIUC, this won't be only UCM but also the combination of udev +
> alsactl + UCM, right?

Right.

> Would other OS can follow a similar pattern?  Let's check that first
> (although I myself think this should be feasible).

With other OS you mean e.g. Android?  Android has device-specific
init-scripts which can either call alsactl or directly do the
echo-s.

Regards,

Hans


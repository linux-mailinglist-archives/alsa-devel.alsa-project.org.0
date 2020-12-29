Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BED2E71D7
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 16:35:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 730E2180B;
	Tue, 29 Dec 2020 16:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 730E2180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609256104;
	bh=eOku8sJRNHeWCDznxMv4pOM0ndDoXxhdj0CijoiFRWg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7tDf5uqsHycTkqmyW2+Mqn2fn1OPpu5FH/HyU7MagCUPcR3VbHwliA/osOgdN4kD
	 7UAscFFRDl4y2fdT/VJl5hzTJF+0CbbeEoeZ+spr0Z4xjgtgY2rQILgk2QMG+bMEH/
	 nrhc7Ueu8BMxLNCnIwrTgg1KCb0vPSXRIH5i3ytg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEC3AF8022D;
	Tue, 29 Dec 2020 16:33:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9711DF8022B; Tue, 29 Dec 2020 16:33:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_72,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 286D5F80162
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 16:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 286D5F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DBLp0R1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609255997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4hYxmWXFLqRsNKCCDIdCSseF7DeHYXGsRUfos6n9nI=;
 b=DBLp0R1MEtvIq8HWLFnbl6UJGltj3HvdbQHI5LXznDzADy6ji2XOig7IhSIuecxLDTiF9l
 FrgQjGbdr6eX2Kp+RpQ59WsyM8Pt2d9vXMf+VcBxeZhIjqcjOeO8AQPUhBg/fCBhjc9gjb
 oDXeblbgPITIyaqpS4FVDpz1XO5aT6Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-b7sscG2zOaujOVt9eW5q7Q-1; Tue, 29 Dec 2020 10:33:13 -0500
X-MC-Unique: b7sscG2zOaujOVt9eW5q7Q-1
Received: by mail-ed1-f71.google.com with SMTP id dh21so4587505edb.6
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 07:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d4hYxmWXFLqRsNKCCDIdCSseF7DeHYXGsRUfos6n9nI=;
 b=XvDaaUqJjrv8jjy+5IBJYI6ue5wyPsAbkRuoARXvk18yc8Qj4CgbIrsW3AVD7afC2L
 pJzXsWO8uHQf6fQSv3MCnhhJZ0F3g6IGa5e2H5iaCzjwg2Llruon5LF4Bgump1wNCu0G
 4j2nsT8Xcgxl/4LDo1Vn7wODRR+9bn82kbAX8ofYJXQEdWC6gne2a0ZOEmQkITtOgAxI
 M/A3IPeEREhuuJf8+ILJN3Ax4uQq8hnVmYXkOk6bHS6jLdxN3Ds1glODqv3Eh6BqWr3Y
 FRgvsYWW4GACrJ6vsV9kx95uw58ig/qRBL9v/fznLXnegtZRI7ZWErX7aRkky0Amwajl
 2sJA==
X-Gm-Message-State: AOAM531Qw/jAWcJBpoB0zF03l7n42e78pc446sXXBMlx1q7nHZZVSSne
 WAZAlzS4kzz/j6yeg294r8oQDUFhAE7UJtAwuP6+g4Jr/dippji0p6SGKRMJdnaqlCyrhD0uDS4
 brNxC7DjzLHsDTND0urec3xGwhlU4P1jHHPxBkpyJuR2iDMPh8jNUbOj686CNO/M9s82DnUc17d
 4=
X-Received: by 2002:a17:906:4985:: with SMTP id
 p5mr37127788eju.513.1609255991638; 
 Tue, 29 Dec 2020 07:33:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKxcH845nNIoxsGmLG1x4zlokoTq77Ua/fV90dRjPHlA4JOaE7xI/WNtG6hQZ+JGxw4VmuBQ==
X-Received: by 2002:a17:906:4985:: with SMTP id
 p5mr37127759eju.513.1609255991420; 
 Tue, 29 Dec 2020 07:33:11 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d6sm18078369ejy.114.2020.12.29.07.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 07:33:10 -0800 (PST)
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
To: Mark Brown <broonie@kernel.org>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
 <20201229150807.GF4786@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <07037a8a-1d35-362e-1b82-b73b81f7c6ac@redhat.com>
Date: Tue, 29 Dec 2020 16:33:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201229150807.GF4786@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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

On 12/29/20 4:08 PM, Mark Brown wrote:
> On Tue, Dec 29, 2020 at 02:57:38PM +0100, Hans de Goede wrote:
>> On 12/29/20 2:06 PM, Charles Keepax wrote:
> 
>>> I would agree with Mark though that if extcon exists for external
>>> connectors it seems odd that audio jacks would have their own
>>> special way rather than just using the connector stuff.
> 
>> Well as I said above in me experience the extcon code is (was) mostly
>> meant for kernel internal use. The sysfs API is more of a debugging
>> tool then anything else (IMHO).
> 
> No, that's not the case.  extcon is a port of an Android custom API that
> looks very similar to what ended up in mainline, it was also a
> combination of sysfs and uevents but a bit less generic.  It mainly
> existed to provide information to userspace about what was plugged into
> the various ports on devices, things like headphone jacks and the
> pre-USB C multifunction connectors you used to get on phones.

Interesting, I have close to 0 experience with Android userspace
(something which I would like to change one of these days). But I have
encountered a bunch of in-kernel use of extcon on Intel's Android X86
port for Bay and Cherry Trail devices (which I've ported to the mainline)
where extcon was e.g. used with a generic extcon-gpio like driver monitoring
the ID pin and then used by the USB code to detect (through monitoring the
extcon) if the USB port was in host or device/gadget mode.

So it seems that extcon has many different uses by different people...


> In kernel
> use wasn't really a thing for that as far as I can remember.  It's
> become a bit less of a pressing concern for Android with the move to USB
> C and the deprecation of headphone jacks in favour of a combination of
> USB C and Bluetooth but the use case is still there and it's clear that
> none of the audio stuff is currently exactly designed.
> 
> The issues I'm seeing are more to do with nobody working on things, I
> guess mainly due to the change in priorities for Android systems and in
> my case a job change.

Yes extcon definitely could use some TLC, although I do honestly wonder
if just deprecating it would not be better...

>> Also the kernel has support for a lot of sound devices, including
>> many with jack-detection support. Yet a grep for EXTCON_JACK_HEADPHONE
>> over the entire mainline kernel tree shows that only extcon-arizona.c
>> is using it. So given that we have dozens of drivers providing jack
>> functionality through the sound/core/jack.c core and only 1 driver
>> using the extcon interface I believe that the ship on how to export
>> this to userspace has long sailed, since most userspace code will
>> clearly expect the sound/core/jack.c way of doing things to be used.
> 
> The whole purpose of creating sound/core/jack.c is to abstract away the
> userspace interfaces from the drivers, most audio devices shouldn't be
> working with extcon directly just as they shouldn't be creating input
> devices or ALSA controls directly.  The missing bit there is to add
> extcon into jack.c.

So what you are suggesting is making sound/core/jack.c register the
extcon device and then have arizona-extcon.c talk to sound/core/jack.c
and no longer do any extcon stuff itself.

That would make the userspace API experience offered by arizona-extcon
consistent with other drivers with jack-detect capability.

But I do honestly wonder if we really want to use extcon for jack-detect
information reporting. At least in the mainline tree there is only 1
driver supporting this ATM and we are pretty much stuck with 1.
ALSA controls for jack detection as well as 2. input_device which
we already export, there is enough of a userspace dependency on
those that we cannot get rid of those.

So we already export 2 userspace-APIs for this IMHO adding a 3th one is not
really a good idea unless it offers significant benifits which I don't
really see. The input_dev API is simple enough to use that extcon does
not really offer any significant benefits.

But this has turned into a very generic discussion, while all I was
trying to do is make arizona-extcon export the jack-detect info through
the ALSA controls for jack detection.

My current solution to have the machine-driver register a jack and
then share that with the extcon-arizona.c code still seems like the
best/simplest solution to me here.

Unless we go with your plan to make sound/core/jack.c export
an extcon device for all sound-devs registering a jack, and then move
extcon-arizona.c over to using sound/core/jack.c without it doing any
extcon stuff itself. But as discussed I'm really not a fan of exporting
a 3th uAPI for jack-detection for all sound-cards with jack-detect
capability.

> BTW note that the existing arizona extcon driver does provide an input
> device so I'm guesing that whatever userspace you're concerned about is
> one that uses only the ALSA controls for jack detection.

The current extcon-arizona.c code only reports button presses to the
input-device, but I did try also making it report SW_HEADPHONE_INSERT /
SW_MICROPHONE_INSERT / SW_LINEOUT_INSERT too. That patch did work,
but pulseaudio did not respond to this, so it seems that pulse indeed
is reliant on the ALSA controls for jack detection (I did not debug
this further, instead I went with the route of registering a jack
from the machinedriver).

I've tested with
>> Arguably we should/could maybe even drop the extcon part of extcon-arizona.c
>> but I did not do that as I did not want to regress existing userspace
>> code which may depend on this (on specific embedded/android devices).
> 
> I do think pushing things over to extcon is a useful goal, the existing
> interfaces have fairly clear issues that it does actually address.

I don't really see any "fairly clear issues" with the input-device uAPI,
I agree that the ALSA controls can be hard to use, but that is not the
case for the input-device uAPI (*). What are your objections against using
the input-device uAPI ?

Regards,

Hans



*) I agree that it is a bit weird to use the input_device API for this,
but that ship has sailed. We will need to support the input_device API
going forward anyways and given that I see little advantage in adding
the extcon API *on top* of that.


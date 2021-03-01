Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6A328E01
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 20:23:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76B411672;
	Mon,  1 Mar 2021 20:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76B411672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614626626;
	bh=sa3gateQ3xbA5E2hPh3y8jRg9QdKfI8YgFIbqIf0JJY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=inzMs5x9G0PkdQSpFmZJuvbGBx8JJNhg/iUqFAbubrWIwgImzHKjFUQzj09MNyZP3
	 C4t1KnrPbk/J1c248enTpyXMAf0ebYPz70OInCL4/rPtENy5ycwVl+/K769rpAy49X
	 tcpvo7Wiu3/XRLCS8IFAHPycu3RE59aSHzZWatP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9964F8026A;
	Mon,  1 Mar 2021 20:22:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3CC6F80150; Mon,  1 Mar 2021 20:22:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10AA7F80150
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 20:22:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10AA7F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ObOathdi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614626529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6HDjDupMyBH3ekbQAgGUD3zMtmHgZK9zA/sGN5Fcwc=;
 b=ObOathdi/SEyjZTlxA2XIeLv4p8Byzlgm/iF9yGbhyPbw4OqGWpeAj1C0IOmlaUjQE7XLY
 dtA5ZujSlYucjO54BHoh1sAz44A4nigb82wlRF2Qtyc0UzHqEWo2q1knHJfUGdv0C/lVbz
 tf7buYmsd1v/iq0dgH4Tj49Ia4jE62Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491--9RJwhx-PK6KrrOTVBByvw-1; Mon, 01 Mar 2021 14:22:00 -0500
X-MC-Unique: -9RJwhx-PK6KrrOTVBByvw-1
Received: by mail-ej1-f72.google.com with SMTP id rl7so1833985ejb.16
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 11:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b6HDjDupMyBH3ekbQAgGUD3zMtmHgZK9zA/sGN5Fcwc=;
 b=kxvcdMIu6J4qLR5htUuBK4f3qzup3G2LHcOF+EhZUyTIQZDmoFUKIDDDsgnuFX4PSW
 ufxzThdV2F8EOu1z25hxDmITYxKNsrOp7visb652dUBGGenYyFtC6cIKwE2hVVpe5vzO
 Em7y5QagpaUgmifybhyhhWha3pce7pcZmCdQipfBUEjNzO7KvS3X1twRulmmH83yjC5s
 gesGpxYsSPSCd0Orc2fNCd86xx4j/rgs2WOOfGB0tpvwKW7EhSDGG1ZUC5yL0M7LCEvX
 7/+V7lL4qT0ZFIiEyeQjsEXpWInfPFhF57nl8W56Q8L3sDZ46yqsOXy6T9+BykqONFZs
 ussg==
X-Gm-Message-State: AOAM5329Of13wVnAQwFjQxv5gAWeu/1MwhL1UMVJpgXUiw4fnXAZZe7j
 /tx6g+UXVC41jfVg4g37pF9V92hMk+hvOEWwXkgO4vOWPo5nvzGpqNSNsb8/RExU7GD0m0G0yJO
 NIv8wmtICt4tH4eNjWP/bvC6M+kwyE6RsO+Vv1ufhVNFk/qMYhtRea/qZgChPpfGnNoPMiQOlP2
 A=
X-Received: by 2002:a17:906:b316:: with SMTP id
 n22mr2717824ejz.249.1614626517531; 
 Mon, 01 Mar 2021 11:21:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS1/dbSEx4mh8XMdbAUERhqY1qj/l5SmMN3n5IjvR28DbTIjrlNvWPdE2/zYiQztMooq560A==
X-Received: by 2002:a17:906:b316:: with SMTP id
 n22mr2717810ejz.249.1614626517292; 
 Mon, 01 Mar 2021 11:21:57 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id g3sm14689861ejz.91.2021.03.01.11.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 11:21:56 -0800 (PST)
Subject: Re: [PATCH 3/5] ASoC: rt5640: Add emulated 'DAC1 Playback Switch'
 control
To: Mark Brown <broonie@kernel.org>
References: <20210226143817.84287-1-hdegoede@redhat.com>
 <20210226143817.84287-4-hdegoede@redhat.com>
 <20210301185557.GG4628@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <23ef6073-ffeb-c7ea-1365-63f3e78f241d@redhat.com>
Date: Mon, 1 Mar 2021 20:21:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301185557.GG4628@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On 3/1/21 7:55 PM, Mark Brown wrote:
> On Fri, Feb 26, 2021 at 03:38:15PM +0100, Hans de Goede wrote:
>> When using AIF1 the 'DAC1 Playback Volume' control will be used as the
>> PlaybackMasterElem in UCM.
>>
>> We need a matching 'DAC1 Playback Switch' for 2 reasons:
>>
>> 1. To be able to truely fully mute the output (the softest volume setting
>>    is not fully muted).
>> 2. For reliable output-mute LED control.
>>
>> The path from the IF1_DAC data input to the 'Stereo DAC MIXL' /
>> 'Stereo DAC MIXR' digital mixer has a 'DAC MIXL' / 'DAC MIXR' digital
>> mixer with IF1_DAC data as one of its inputs direclty after the
>> 'DAC1 Playback Volume' control.
>>
>> This commit adds an emulated "DAC1 Playback Switch" control by:
> 
> This feels icky, it seems like if userspace needs to stitch together a
> stereo mute control that doesn't already exist in the hardware

But it does exist in the hardware the digital mixer bits around DAC1
have some more functionality then those around DAc2, including a mixer
directly behind the DAC1 volume-control which allows digital loopback.

The inputs to those mixer are all 4 (2 pairs of l/r) controlled by
mute bits. The codec designer has left out the mute switches normally
directly following the volume control since then there would be 2 mute
switches in series, one as part of the volume-control/mute combo which
is usually used and 1 directly behind that to mute/unmute the mixer
input.

This is a nice hw optimization, but annoying to deal with in software,
esp. since userspace generally expects a "Foo Playback Volume",
"Foo Playback Switch" pair. By for the easiest way to deal with this
is to undo the hw optimization in software and add the expected
"Foo Playback Switch"

> from
> existing mono controls then UCM ought to have support for figuring that
> out anyway or if we *must* bodge this in the kernel there should be some
> generic way of doing it rather than open coding in drivers.

This is highly codec specific. So far this has not really been an
issue because so far on asoc based systems regular Linux userspace has
always been using software volume-control. But now that we are starting
to use hardware volume-control it really is desirable to also have
a hardware mute switch available.

Also problematic here is that things like volume-controls and their
accompanying mute switches (often bit 15 + 8 of the same register)
are modules as "normal" mixer elements which are not seen as part of
the DAPM graph, where as the mixer in this case is part of the DAPM graph.

> It also makes the whole mute LED thing feel a lot messier even for
> existing systems than you seemed to be suggesting in the other thread.
> This device has two I2S interfaces, two DACs (only one of which seems to
> be affected by this control), and it appears that there's bypass path
> from the ADC to DAC1 which won't be muted by the newly added mute switch
> here so this reliable mute control won't be entirely reliable.  There
> look to also be some analogue bypass paths, I didn't fully check.

I don't believe that it is necessary to take bypass / loopback paths into
account for the playback mute LED. These are normally always off and they
don't involve the normal playback paths. So even if they are on any
audio played from within the OS is still muted.

> One
> could equally argue that a software defined mute control should be
> muting all the analogue outputs, it'd certainly seem more robust.

The mute switches in the analog output paths are part of the DAPM
graph, which means that they will get turned off automatically to
save power when the audio device is not playing audio (is not kept
open by userspace). AFAIK this makes them unsuitable to be used as a
source for the mute-led trigger, we want the mute LED to turn on
when the volume control is set to mute, not when the last app
closes the audio device.

I honestly don't understand your objections against the current
set of patches for dealing with the mute-led trigger. Your main
worry seems to be that this is not flexible enough, but it currently
is all handled inside the kernel. So if more complex cases come up
then we can easily adjust the code to deal with this, since there
is no userspace API part to worry about. And if these more complex
cases do require more userspace involvement then we can worry about
that then (and not now) when we actually have a concrete example of
what such a more complex setup could look like and thus also have
something to actually design any userspace api for this around.

Regards,

Hans


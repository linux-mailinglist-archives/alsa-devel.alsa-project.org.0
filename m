Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885B347D29
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 16:59:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DA46169F;
	Wed, 24 Mar 2021 16:58:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DA46169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616601553;
	bh=rDiZnqFfMG54jCj3PhDkn0nH6HBbb0B9jsMHHWq9I+4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l+ZfQSX73BluyBMSSAKfwsnGhtnXsmtl+V4+IEMVaMI4H4IH8vsASDGPyryrwZWTs
	 xris8tHjBj2D31V0Xbq7eYf6HBTjhuBMzPOMSMKvHmSp6xVBMZ3qY/vFbl3Jn0/YXw
	 gDAaYeRNXqDJIrYS/PAhI/lzSdETKZBxVyuJnX5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E89FF801D5;
	Wed, 24 Mar 2021 16:57:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6A76F8016B; Wed, 24 Mar 2021 16:57:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 376C6F80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 16:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 376C6F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="P8Yc3kea"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=URqzddksPK0d3/8L2FvgtboWbK+ENphuA8uc4T7HJxs=; b=P8Yc3keafr8bTOf2xFaBLv63/9
 WwVIIvuhgGWkMjDLveFM7MHJfaYa/Klm5MbvvhGkrDWZu5ojMgmPfG90XhyN9R2F3zDbQM99+e3Ax
 t5Y0cDWmTwFhdxOOVsMcXMts3V+rIv3YGpv5YzSR2ANROF8AraNXLCfxehtqbnZC6JaCeI3sDKeU4
 W9K+wpkN1RuRJx9Owzi22Mb3hxfGtMflhVk7mR0kWV2xCmlNY/nH4ROTfPayJi606otwTiSPV2zq/
 aUW0lwCQbqceMzpbj8t00Bm1+GbuU4IJcRpZlKkrzloK6uRHGsZMQOW9kBPMuYfq4uiqkzDXtMU8j
 EXtVDI1A==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lP5t4-009XfA-5T; Wed, 24 Mar 2021 16:57:38 +0100
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
To: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz
References: <20210324054253.34642-1-coding@diwic.se>
 <20210324124430.GA3711@workstation>
From: David Henningsson <coding@diwic.se>
Message-ID: <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
Date: Wed, 24 Mar 2021 16:57:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324124430.GA3711@workstation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Id: coding@diwic.se
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


On 2021-03-24 13:44, Takashi Sakamoto wrote:
> Hi,
>
> On Wed, Mar 24, 2021 at 06:42:53AM +0100, David Henningsson wrote:
>> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
>> index 535a7229e1d9..f33076755025 100644
>> --- a/include/uapi/sound/asound.h
>> +++ b/include/uapi/sound/asound.h
>> @@ -736,12 +736,28 @@ struct snd_rawmidi_info {
>>   	unsigned char reserved[64];	/* reserved for future use */
>>   };
>>   
>> +enum {
>> +	SNDRV_RAWMIDI_FRAMING_NONE = 0,
>> +	SNDRV_RAWMIDI_FRAMING_TSTAMP_MONOTONIC_RAW,
>> +	SNDRV_RAWMIDI_FRAMING_LAST = SNDRV_RAWMIDI_FRAMING_TSTAMP_MONOTONIC_RAW,
>> +};

Hi and thanks for the review!

> In C language specification, enumeration is for value of int storage. In
> my opinion, int type should be used for the framing member, perhaps.
In this case, I was following how the rest of the enum declarations were 
in the same header. In addition, the only place it is used, is as an 
unsigned char. So I'm not sure defining it as an int here would make sense.
>
> (I think you can easily understand my insistent since you're Rust
> programmer.)

I am, and as a side point: for those who don't know, I've written (and 
maintaining) alsa-lib bindings for Rust in

https://github.com/diwic/alsa-rs

>
> I note that in UAPI of Linux kernel, we have some macros to represent
> system clocks; e.g. CLOCK_REALTIME, CLOCK_MONOTONIC:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/time.h#n46
>
> We can use the series of macro, instead of defining the specific
> enumerations. However I have one concern that the 'None' value cannot be
> zero in the case since CLOCK_REALTIME is zero. This is a bit inconvenient
> since we need initializer function in both of kernel space and user
> space...

Interesting point. So I guess we could add a bit in the existing 
bitfield that says on/off, and then have an unsigned char that decides 
the clock type. But as you point out in your other reply, if we can get 
a timestamp from closer to the source somehow, that would be even 
better, and then that would be a clock that is something different from 
the existing clock defines in time.h.

[snip from your other reply]

> However, the timing jitter of IRQ handler invocation is issued in this
> case, as well as PCM interface, even if the data rate of MIDI physical
> layer is quite low nowadays (31.25 Kbit / sec ~= 3906.25 byte / sec).
> As long as I experienced, in actual running Linux system, the invocation
> of IRQ handler has no guarantee for timing jitter, mainly due to CPU level
> IRQ mask (like spin_lock). Therefore the interval of each invocation is not
> so precise to decide event timestamp, at least for time slot comes from
> MIDI physical layer.
>
> Nevertheless, I think your idea is enough interesting, with conditions to
> deliver information from driver (or driver developer) to applications
> (ALSA Sequencer or userspace applications). Even if we have some
> limitation and restriction to precise timestamp, it's worth to work for
> it. It seems to be required that improvements at interface level and
> documentation about how to use the frame timestamp you implemented.

Right, so first, I believe the most common way to transport midi these 
days is through USB, where the 31.25 Kbit/sec limit does not apply: 
instead we have a granularity of 1/8 ms but many messages can fit in 
each one. So that limit is - for many if not most cases - gone.

Second; you're probably right in that there is still some jitter w r t 
when the IRQ fires. That is regrettable, but the earlier we get that 
timestamp the better, so a timestamp in IRQ context would at least be 
better than in a workqueue that fires after the IRQ, or in userspace 
that possibly has scheduling delays.

Btw, I checked the "struct urb" and there was no timestamp in there, so 
I don't know how to get a better timestamp than in snd_rawmidi_receive. 
But maybe other interfaces (PCI, Firewire etc) offers something better.

// David


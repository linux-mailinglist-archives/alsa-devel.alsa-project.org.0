Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA6034F1B0
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 21:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 894711682;
	Tue, 30 Mar 2021 21:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 894711682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617133012;
	bh=Zxjj2OoK7kssQntYjyavg9W3WbbNZrmHFPTefPXGkjA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oGsXzUr528Fd38EKLOtjL32tVgrv2Ib21NCX1ZU1kNEWTD4nVd8U5z6fQlVxWEWAK
	 /GMP5wMQOqxRjqH31Z68Ri+C8PaPyeQt7Z36S82fB1MKzoSCl+Y4dIR7xXKlMOqXUh
	 CNKgBXFyr0zqAbFceyDGY8rR9GqT/ZEA4Wcw2h70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0DD0F80141;
	Tue, 30 Mar 2021 21:35:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B5AEF80240; Tue, 30 Mar 2021 21:35:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODYSUB_17,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D019F80141
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 21:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D019F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="RixOiqey"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6lSuPQ6ldW5XdD5ZD7M2tZKzlB3dbxhC/5+3F7RZV5s=; b=RixOiqeytnmFLqHPTLFysQQMU0
 ELXHMAVoFhsJDG+oOBV11JHAqolWzL0yc5neEiFohLHbKxfTH00yAFGPVEsdPonur8v20edtmAji8
 GwUnmA0XMr56CLqiQUbNsnZy/htlp1HBtc7Ce7o+wDEf0Ik5mMVbGdUcenVZ5r3EKUlGsGo1U+ypx
 svjZ62hJx6kRdaL+FqLXZN371wnA1CgXubfZCsFQbvdF4RJigxHCy1EPF+ab6r29xOw+ptCZZNl1y
 5aYe27DV0+GoGpbosQgvz+kecsR/N103k6JdI4IYYyPz/MXemqfsTnbt7Vx/bgpcBUamorw5VNEmZ
 7CBXnbkQ==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lRK93-009zxB-6F; Tue, 30 Mar 2021 21:35:21 +0200
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>
References: <20210324054253.34642-1-coding@diwic.se>
 <20210324124430.GA3711@workstation>
 <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
 <20210326044615.GA51246@workstation> <s5hr1k2l56t.wl-tiwai@suse.de>
 <2ca71809-9872-bfee-c19d-76b6ce143212@diwic.se>
 <s5h1rc1lva7.wl-tiwai@suse.de>
 <fbd3fc88-7a25-27fb-90ae-b4664f71d952@diwic.se>
 <s5hk0prk9p9.wl-tiwai@suse.de>
From: David Henningsson <coding@diwic.se>
Message-ID: <b2bf72a0-4f6b-7349-0666-c75826457718@diwic.se>
Date: Tue, 30 Mar 2021 21:35:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5hk0prk9p9.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Id: coding@diwic.se
Cc: alsa-devel@alsa-project.org
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


On 2021-03-28 09:40, Takashi Iwai wrote:
> On Sun, 28 Mar 2021 08:39:46 +0200,
> David Henningsson wrote:
>> Hi Takashi and Takashi,
>>
>> You both question the usability of the patch, so let's take a step back.
>>
>> Suppose you're writing the next JACK, or a DAW, or something like that.
>> When writing a DAW, you need to support the users who need ultra-low
>> latency for live playing of an instrument. These users (unfortunately)
>> need to reconfigure their Linux installation, have special kernels,
>> buy expensive sound cards etc, in order to get the best possible
>> latency.
>> You also should give the best possible experience for people who don't
>> have the time to do that. Just recording a simple MIDI file should not
>> require any extra kernel options, RT_PRIO privileges or anything like
>> that. (And then there are people in between, who try to get the best
>> possible latency given their limited time, money and skills.)
>>
>> Now you're asking yourself whether to use rawmidi or seq API. It seems
>> silly to have to support both.
>> The seq interface is suboptimal for the first use case, due to the
>> latency introduced by the workqueue. But rawmidi is entirely
>> impossible for the second use case, due to the lack of timestamping.
>> (From a quick look at Ardour's sources, it does support both rawmidi
>> and seq. The rawmidi code mostly timestamps the message and sends it
>> to another thread. [1] I e, essentially what I believe the kernel
>> should do, because that timestamp is better.)
>>
>> What you don't need is exact measurements of burst interval or even
>> timestamp accuracy. All you have use for is the best possible
>> timestamp, because that's what's going to be written into the MIDI
>> file. There might be other use cases for burst intervals etc, but I
>> don't see them helping here.
>>
>> On 2021-03-26 17:44, Takashi Iwai wrote:
>>> On Fri, 26 Mar 2021 17:29:04 +0100,
>>> David Henningsson wrote:
>>>>> But actually I'd like to see some measurement how much we can improve
>>>>> the timestamp accuracy by shifting the post office.  This may show
>>>>> interesting numbers.
>>>> Sorry, I don't know the idiom "shifting the post office" and neither
>>>> does the urban dictionary, so I have no idea what this means. :-)
>>> It was just joking; you basically moved the place to stamp the
>>> incoming data from one place (at the delivery center of a sequencer
>>> event) to another earlier place (at the irq handler).
>>>
>>> The question is: how much time difference have you measured by this
>>> move?
>> Ok, thanks for the explanation. I have not done any measurements
>> because it would be quite time consuming to do so, across different
>> hardware, kernel configurations, and so on. I don't have that time
>> right now, sorry. But the claim that workqueues can be delayed up to a
>> second (!) from just adding a few RT_PRIO tasks [2] is enough to scare
>> me from using the seq interface for accurate timestamping.
>>
>>
>>>>> Also, one thing to be more considered is the support for MIDI v2 in
>>>>> future.  I haven't seen any development so far (and no device
>>>>> available around), so I cannot comment on this much more, but it'd be
>>>>> worth to take a quick look before defining the solid API/ABI.
>>>> I had a quick look at MIDI 2.0. It offers something called "Jitter
>>>> reduction timestamps". After some searching I found that its
>>>> resolution is 16 bit, and in units of 1/31250 seconds [1]. So the
>>>> suggested timestamp format of secs + nsecs would suit us well for that
>>>> case, I believe. When implemented, MIDI 2.0 jitter reduction
>>>> timestamps would be another clock ID on top of the existing frame
>>>> format (or a new frame format, if we prefer).
>>>>
>>>> A midi 2.0 UMP (Universal Midi Packet) seems to be 4, 8, 12 or 16
>>>> bytes, excluding the timestamp. If we want to fit that format with the
>>>> existing patch, we could increase the frame to 32 bytes so we can fit
>>>> more data per packet. Do you think we should do that? Otherwise I
>>>> think Patch v3 is ready for merging.
>>> Let's evaluate a bit what would be the best fit.  I see no big reason
>>> to rush the merge right now.
>> Does this mean "evaluate for a week or two because of kernel cadence,
>> merge windows etc" or does this mean "evaluate for months or years
>> until someone does a full MIDI 2.0 kernel implementation"?
> Well, without the actual measurement, it's purely a theoretical
> problem, and it implies that we haven't seen any real improvement by
> that, too.  So, the first priority is to measure and prove the need of
> the changes.

Well, I believe that rawmidi provides less jitter than seq is not a 
theoretical problem but a known fact (see e g [1]), so I haven't tried 
to "prove" it myself. And I cannot read your mind well enough to know 
what you would consider a sufficient proof - are you expecting to see 
differences on a default or RT kernel, on a Threadripper or a 
Beaglebone, idle system or while running RT torture tests? Etc.

That said; there are certainly people who run the seq interface 
succesfully as well. It depends on both hardware, drivers, system load, 
kernel configuration etc (and perhaps also the timing skill of the 
musician!) if that work in the workqueue will be delayed often enough to 
not go unnoticed.

Let me ask a counter question. Suppose you were to write the next JACK, 
DAW as I wrote about above, where you need both the best possible 
latency and best possible timestamps. Would you as a maintainer 
recommend seq or rawmidi (the latter with timestamps taken from userspace)?

>
> Then the next thing is to determine the exact format for the new API
> in a solid form.  It's still not fully agreed which frame size fits at
> best, for example.  Also, we may have two individual frame types,
> e.g. a timestamp frame and a data frame, too, depending on the frame
> size and the implementation.  And, it might be handy if the ioctl
> returns the frame size to user-space, too.
>
> And, of course, thinking on MIDI 2.0 wouldn't be bad.  Though I don't
> think tying with MIDI 2.0 is needed right now; instead, we should
> assure only that the new timestamp would be accurate enough for new
> extensions like MIDI 2.0.

Okay; I think we should then go for a frame size of 32 bytes with 16 
byte header/timestamp and 16 byte data. One type of frame only, no frame 
size ioctl will be needed because any changes to the frame format would 
need a new framing type. I envision the application reading this struct 
directly without "encapsulation" with accessors in alsa-lib.
This is for MIDI 2.0 compatibility: from what I can read, MIDI 2.0 
messages can be up to 16 bytes. Its "Jitter Reduction Timestamps" are 2 
bytes.

// David


[1] https://github.com/williamweston/jamrouter - "Timing using the ALSA 
Sequencer interface is not as accurate as timing
   using any of the raw drivers /.../ Avoid use of the ALSA Sequencer 
driver when used in conjunction real MIDI hardware at buffer periods 
below 4-5 milliseconds"



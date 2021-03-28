Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BEB34BB6F
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Mar 2021 08:41:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B7615E2;
	Sun, 28 Mar 2021 08:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B7615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616913701;
	bh=CMuJyz7hw8797E957dQlGZrlFtrd1PUWXuTeJEwWIb4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uTRxCcoh27dcCMvVzgApuYVPXTX64FfcnPU0C7R1iAbeuG+WHg+2bPMH7eP9p8xbC
	 QkfqzM0cu1dvuYq3YU1zC77OyuBpPVTfaitNhXaqQ43aA+IahpLMjp3t8bzQ/ijvJs
	 nfoP1LwPDj0TZKCedbNRMBd6hlyP1qHeKhWVjpq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC30DF8026B;
	Sun, 28 Mar 2021 08:40:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 448CFF80240; Sun, 28 Mar 2021 08:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODYSUB_17,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B402FF80141
 for <alsa-devel@alsa-project.org>; Sun, 28 Mar 2021 08:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B402FF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="SpFRdleI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hCnckJWDEvRwuwUcyw2eq/CuoVm9+glbvvwisEB04mQ=; b=SpFRdleID641yZ2xEsvoU+4zfQ
 5X/pahHIJgBeu2QpPMhjfIBvl27IEeTqwC0M1tPCmcuOFCdwMtDdHQKYBX4Ib2OOoijS8kx2gkqAB
 c+Y5QZjF7Epk/r6VW9ThNPob6C1JMVUzHO5hANcEaAAzApZrEZHNHFsF7xQxdM7B2SnOZYnUVbGQ1
 v4iTwa9+Ih8gelelV9haa4fPOKasOqKZWsuArhENrgTOjRsnYtfm1ngeZvJAYeKmn9Zt38cNe3mOr
 s4/7iVpP+vDhGiwYjLABu7xbkWCORBy0jhQlmX6MfLHCWyZoIVCBVjtUBw2liVlBONIPfF4bhebH7
 5RIgKQxQ==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lQP5g-005Xjj-4u; Sun, 28 Mar 2021 08:40:04 +0200
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20210324054253.34642-1-coding@diwic.se>
 <20210324124430.GA3711@workstation>
 <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
 <20210326044615.GA51246@workstation> <s5hr1k2l56t.wl-tiwai@suse.de>
 <2ca71809-9872-bfee-c19d-76b6ce143212@diwic.se>
 <s5h1rc1lva7.wl-tiwai@suse.de>
From: David Henningsson <coding@diwic.se>
Message-ID: <fbd3fc88-7a25-27fb-90ae-b4664f71d952@diwic.se>
Date: Sun, 28 Mar 2021 08:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5h1rc1lva7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Takashi and Takashi,

You both question the usability of the patch, so let's take a step back.

Suppose you're writing the next JACK, or a DAW, or something like that.
When writing a DAW, you need to support the users who need ultra-low 
latency for live playing of an instrument. These users (unfortunately) 
need to reconfigure their Linux installation, have special kernels, buy 
expensive sound cards etc, in order to get the best possible latency.
You also should give the best possible experience for people who don't 
have the time to do that. Just recording a simple MIDI file should not 
require any extra kernel options, RT_PRIO privileges or anything like 
that. (And then there are people in between, who try to get the best 
possible latency given their limited time, money and skills.)

Now you're asking yourself whether to use rawmidi or seq API. It seems 
silly to have to support both.
The seq interface is suboptimal for the first use case, due to the 
latency introduced by the workqueue. But rawmidi is entirely impossible 
for the second use case, due to the lack of timestamping.
(From a quick look at Ardour's sources, it does support both rawmidi and 
seq. The rawmidi code mostly timestamps the message and sends it to 
another thread. [1] I e, essentially what I believe the kernel should 
do, because that timestamp is better.)

What you don't need is exact measurements of burst interval or even 
timestamp accuracy. All you have use for is the best possible timestamp, 
because that's what's going to be written into the MIDI file. There 
might be other use cases for burst intervals etc, but I don't see them 
helping here.

On 2021-03-26 17:44, Takashi Iwai wrote:
> On Fri, 26 Mar 2021 17:29:04 +0100,
> David Henningsson wrote:
>>> But actually I'd like to see some measurement how much we can improve
>>> the timestamp accuracy by shifting the post office.  This may show
>>> interesting numbers.
>> Sorry, I don't know the idiom "shifting the post office" and neither
>> does the urban dictionary, so I have no idea what this means. :-)
> It was just joking; you basically moved the place to stamp the
> incoming data from one place (at the delivery center of a sequencer
> event) to another earlier place (at the irq handler).
>
> The question is: how much time difference have you measured by this
> move?

Ok, thanks for the explanation. I have not done any measurements because 
it would be quite time consuming to do so, across different hardware, 
kernel configurations, and so on. I don't have that time right now, 
sorry. But the claim that workqueues can be delayed up to a second (!) 
from just adding a few RT_PRIO tasks [2] is enough to scare me from 
using the seq interface for accurate timestamping.


>>> Also, one thing to be more considered is the support for MIDI v2 in
>>> future.  I haven't seen any development so far (and no device
>>> available around), so I cannot comment on this much more, but it'd be
>>> worth to take a quick look before defining the solid API/ABI.
>> I had a quick look at MIDI 2.0. It offers something called "Jitter
>> reduction timestamps". After some searching I found that its
>> resolution is 16 bit, and in units of 1/31250 seconds [1]. So the
>> suggested timestamp format of secs + nsecs would suit us well for that
>> case, I believe. When implemented, MIDI 2.0 jitter reduction
>> timestamps would be another clock ID on top of the existing frame
>> format (or a new frame format, if we prefer).
>>
>> A midi 2.0 UMP (Universal Midi Packet) seems to be 4, 8, 12 or 16
>> bytes, excluding the timestamp. If we want to fit that format with the
>> existing patch, we could increase the frame to 32 bytes so we can fit
>> more data per packet. Do you think we should do that? Otherwise I
>> think Patch v3 is ready for merging.
> Let's evaluate a bit what would be the best fit.  I see no big reason
> to rush the merge right now.

Does this mean "evaluate for a week or two because of kernel cadence, 
merge windows etc" or does this mean "evaluate for months or years until 
someone does a full MIDI 2.0 kernel implementation"?

// David

[1] 
https://github.com/Ardour/ardour/blob/master/libs/backends/alsa/alsa_rawmidi.cc
[2] http://bootloader.wikidot.com/linux:android:latency

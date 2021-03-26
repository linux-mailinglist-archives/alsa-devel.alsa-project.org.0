Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1C34AC86
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 17:30:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32DCA165E;
	Fri, 26 Mar 2021 17:30:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32DCA165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616776257;
	bh=gH70cjLGUC1q11CyzMy79Ndo99QbRAYSQZ7/0n9IXl4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GZtU6aQvLTdbG96vdq07W4NCW8M3VYyDgxGe1q/yabM2pWzjy17doLIeKx6qyPJ1F
	 Rv0OkFz6pVV3alb9QwxEplfv34G0+ERhtck7713G3Jy39zf+5B0Shs9jwMuGS3X2OE
	 M5Xz4S5uuimJU/dk1deEOtz7JyLcQAYxKs/LVJEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED70F801D5;
	Fri, 26 Mar 2021 17:29:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFA26F801D5; Fri, 26 Mar 2021 17:29:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F38F80104
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 17:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F38F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="CYCSPesa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=URVgvNxmipf97JmXlN5qB5H/JZ4t4kcUc0U6R9JOgKA=; b=CYCSPesarN60cQN0dUuXjaQBNe
 GYa4KUHmPGUM5E+hT+i+udqlCOr9PvF4NRt27AcVsehU2ajdpQ0sgIUMP68DtrHamzrnD6l8XlcF4
 CAmzOU8eQrkVuy3XuRdqsKpCd/wOvDWvFWK+Ee4PW96nLL9KckgS6CQoabQkrf1XcyqZa+AqBaBk0
 Yag3th8ayzz7f/z3HXF5+56sdxqNaJVH6wsBXjqs9W6ERsRfGM5HcZleShXdQzpGv2dDw0mM/bJr0
 uR5WpkY/rJGLcNnrG8MV80XydjH5+dockxZqjV0qJMQSYU4wfkXCh24SCD/Q8adUlRLrDSV8C7OWt
 QC9cpDAw==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lPpKl-009z8i-IW; Fri, 26 Mar 2021 17:29:15 +0100
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20210324054253.34642-1-coding@diwic.se>
 <20210324124430.GA3711@workstation>
 <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
 <20210326044615.GA51246@workstation> <s5hr1k2l56t.wl-tiwai@suse.de>
From: David Henningsson <coding@diwic.se>
Message-ID: <2ca71809-9872-bfee-c19d-76b6ce143212@diwic.se>
Date: Fri, 26 Mar 2021 17:29:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5hr1k2l56t.wl-tiwai@suse.de>
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

Hi Takashi and Takashi,

On 2021-03-26 08:55, Takashi Iwai wrote:
> On Fri, 26 Mar 2021 05:46:15 +0100,
> Takashi Sakamoto wrote:
>> Hi David,
>>
>> On Wed, Mar 24, 2021 at 04:57:31PM +0100, David Henningsson wrote:
>>>> However, the timing jitter of IRQ handler invocation is issued in this
>>>> case, as well as PCM interface, even if the data rate of MIDI physical
>>>> layer is quite low nowadays (31.25 Kbit / sec ~= 3906.25 byte / sec).
>>>> As long as I experienced, in actual running Linux system, the invocation
>>>> of IRQ handler has no guarantee for timing jitter, mainly due to CPU level
>>>> IRQ mask (like spin_lock). Therefore the interval of each invocation is not
>>>> so precise to decide event timestamp, at least for time slot comes from
>>>> MIDI physical layer.
>>>>
>>>> Nevertheless, I think your idea is enough interesting, with conditions to
>>>> deliver information from driver (or driver developer) to applications
>>>> (ALSA Sequencer or userspace applications). Even if we have some
>>>> limitation and restriction to precise timestamp, it's worth to work for
>>>> it. It seems to be required that improvements at interface level and
>>>> documentation about how to use the frame timestamp you implemented.
>>> Right, so first, I believe the most common way to transport midi these days
>>> is through USB, where the 31.25 Kbit/sec limit does not apply: instead we
>>> have a granularity of 1/8 ms but many messages can fit in each one. So that
>>> limit is - for many if not most cases - gone.
>>>
>>> Second; you're probably right in that there is still some jitter w r t when
>>> the IRQ fires. That is regrettable, but the earlier we get that timestamp
>>> the better, so a timestamp in IRQ context would at least be better than in a
>>> workqueue that fires after the IRQ, or in userspace that possibly has
>>> scheduling delays.
>>>
>>> Btw, I checked the "struct urb" and there was no timestamp in there, so I
>>> don't know how to get a better timestamp than in snd_rawmidi_receive. But
>>> maybe other interfaces (PCI, Firewire etc) offers something better.
>> Hm. Regardless of type of hardware; e.g. OHCI/EHCI/xHCI, 1394 OHCI, or
>> PCI-e extension card, for software to process sampled data, it's always
>> issue that the jitter between triggering IRQ (hardware side) and invoking
>> IRQ handler (processor side). As an actual example, let me share my
>> experience in 1394 OHCI.
>>
>>
>> 1394 OHCI controller is governed by 24.576 Mhz clock (or double depending
>> on vendors). In IEEE 1394, ishcornous service is 8,000 times per second.
>> 1394 OHCI specification allows software to schedule hardware IRQ per
>> isochronous cycle.
>>
>> Once ALSA firewire stack is programmed to schedule the hardwar IRQ evenry
>> 16 isochronous cycle. The corresponding IRQ handler is expected to invoke
>> every 2 milli second. As long as I tested in usual desktop environment[2],
>> the jitter is between 150 micro second and 4.7 milli second. In the worst
>> case, it's 6.0 milli seconds. The above is also the same wnen using
>> 'threadirqs'.
>>
>> When using 'isolcpus' and arranging 'smp_affinity' to reduce load from one
>> of processor core to invoke the IRQ handler, the interval is 2 milli
>> second with +- several nano seconds, therefore the 1394 OHCI controller
>> can trigger hardware IRQ so precise. The jitter comes from processor side.
>> I think many running contexts on the same processor core masks IRQ so
>> often and the jitter is not deterministic.
>>
>> Here, what I'd like to tell you is that we can not handle the system time
>> as is as timestamp of received MIDI messages, as long as relying on IRQ
>> context. We need some arrangements to construct better timestamp with some
>> compensations. In this point, the 3rd version of patch is not enough[3],
>> in my opinion.

Interesting measurements. While several ms of jitter is not ideal, I 
have a few counter arguments why I still believe we should merge this patch:

  1) I don't think we should let the perfect be the enemy of the good 
here, just because we cannot eliminate *all* jitter does not mean we 
should not try to eliminate as much jitter as we can.

  2) an unprivileged process (that cannot get RT_PRIO scheduling) might 
have a wakeup jitter of a lot more than a few ms, so for that type of 
process it would be a big improvement. And sometimes even RT_PRIO 
processes have big delays due to preempt_disable etc.

  3) The jitter will depend on the hardware, and other hardware might 
have better (or worse) IRQ jitter.

  4) If this patch gets accepted, it might show other kernel developers 
that IRQ jitter matters to us, and that in turn might improve the 
chances of getting IRQ jitter improvement patches in, in case someone 
else wants to help solving that problem.


>>
>> My intension is not to discourage you, but it's better to have more care.
>> As one of the care, I think we can use extension of
>> 'struct snd_rawmidi_status' to deliver some useful information to ALSA
>> rawmidi applications, or including other parameters to the frame structure.
>> But I don't have ideas about what information should be delivered,
>> sorry...
> Well, the question is how much accuracy is wanted, and it's relatively
> low for MIDI -- at least v1, which was defined many decades ago for a
> slow serial line.
>
> That said, the patch set was designed for providing the best-effort
> timestamping in software, and that's supposed to be enough for normal
> use cases.  If there is any device that is with the hardware
> timestamping, in theory, we could provide the similar data stream in
> the same format but maybe with a different timestamp type.
>
> But actually I'd like to see some measurement how much we can improve
> the timestamp accuracy by shifting the post office.  This may show
> interesting numbers.

Sorry, I don't know the idiom "shifting the post office" and neither 
does the urban dictionary, so I have no idea what this means. :-)

>
> Also, one thing to be more considered is the support for MIDI v2 in
> future.  I haven't seen any development so far (and no device
> available around), so I cannot comment on this much more, but it'd be
> worth to take a quick look before defining the solid API/ABI.

I had a quick look at MIDI 2.0. It offers something called "Jitter 
reduction timestamps". After some searching I found that its resolution 
is 16 bit, and in units of 1/31250 seconds [1]. So the suggested 
timestamp format of secs + nsecs would suit us well for that case, I 
believe. When implemented, MIDI 2.0 jitter reduction timestamps would be 
another clock ID on top of the existing frame format (or a new frame 
format, if we prefer).

A midi 2.0 UMP (Universal Midi Packet) seems to be 4, 8, 12 or 16 bytes, 
excluding the timestamp. If we want to fit that format with the existing 
patch, we could increase the frame to 32 bytes so we can fit more data 
per packet. Do you think we should do that? Otherwise I think Patch v3 
is ready for merging.

// David

[1] https://imitone.com/discover-midi/


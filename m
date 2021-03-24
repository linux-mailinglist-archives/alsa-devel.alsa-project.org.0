Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A23479A3
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 14:31:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A0E2167E;
	Wed, 24 Mar 2021 14:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A0E2167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616592711;
	bh=LVj45rpOo9E08vtEf1Gf3EVmNglg8Ktycw1V3WJmQbw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqlmBBKrzSJClAMl8WL3Qa1w0Fuavmyh8UlvyeGr0Y92wifB4cTvk0n+Jw4whwjhh
	 4yVJ5fuiiI6BHxC4j/k1lN2ao9ocd3dqE72bdjpgPa8ALLzH/Luq6BB5yu9ntQaIRS
	 FijHG47+XP1oPFT+qMYvIrUMgir6ABVamA0t7Rnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A73C3F801D5;
	Wed, 24 Mar 2021 14:30:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4AC2F8016B; Wed, 24 Mar 2021 14:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6D84F80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 14:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D84F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="KtWwYQoB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Y3trydMG"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E2775C00C9;
 Wed, 24 Mar 2021 09:29:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 24 Mar 2021 09:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=gY6Ne2+NZLetnhCPyMVnh9/93+1
 Nm3jy88PL+ORTdVI=; b=KtWwYQoBNc0EZN/V3In+dc+N4V6N7cGMeyAkuI+KNnk
 S8bM0AgMRQI7894uB++NByXPRSg9Mw2uaoZMMb/a54/doXzmB6xj/AXARfC1bnGc
 gh+fAeyvHQgcMO484gIyzQyXkdfRR4GQE0jzqU8NRr2ereocJOkgb5YBqynNkK/C
 oZuD9LCTYahNFQ/nPoyWFE9t9HfseMkiu89upXY2zAqPDkfTJ+PowzXalgN5BxCv
 r1sPncq6npabaNdzV1fXEmLF5BXEZondKVML6QAxrT8T73+jt069J1Nx/ym5Y6O3
 QB/cUtoXynoqKS4DBjljR4nkJGTl3TIGhjzN0uchKAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gY6Ne2
 +NZLetnhCPyMVnh9/93+1Nm3jy88PL+ORTdVI=; b=Y3trydMGvxN+sLvN1bR4fK
 g/E122/QeqCjKXapo34QwGxkmHdMZ5kKurSxwXRyfZXvpREgrJnNNSnupdFmcfOy
 8sGaN+73WdzGnizxGAi1g/kWFNFLXyr7yy3gSBbTePPGvqtixZvsopXk0zLGbn24
 IlfKJNsRBG+a/55xWJ+RKUK8Kng9F5SdZvAHTo7qrj5detEU0hstYNaC7t0Q+QE8
 WpbaxNaGqBQin7ZAnZ3Up1Oq4J1mQ3PrNOMxiVNnJtLMG+f//FYScAZ3lduL/fXX
 hPBPat6t789ObK5HP957GOAq09UejQJZX8IgRVn14V4qag2D0e4JYrzBS67iBQzg
 ==
X-ME-Sender: <xms:zD5bYEggVmtMj3b_IdtthVML3xAXSETNpgYN1I2g9utF2Kt0D2u7hQ>
 <xme:zD5bYNCKAo9wOZOkWkLokb6AX1xLRtX3-vQFd8204yU7vfkniOHs8OBWJdqGOThn5
 VvFR4-6cK4OZ7mqrMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeehueeuiefhveefheehudekfeffueevheelueduiefh
 ffejieffieduffejieevffenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorh
 hgnecukfhppedugedrfedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjph
X-ME-Proxy: <xmx:zD5bYMFS7HuBBxtxAwLgfdRlyYTs1g0XnU7kAyEBUjl898CLbs3Vgg>
 <xmx:zD5bYFQOyAJxweDxiXkf9bxOJX9fTneRDVu8IlJ8IRi79X4lX7qRog>
 <xmx:zD5bYBxWwTXD7XRhhrBzm7G-5YnnPXYpGQooueU_-IvULqnb909ZzA>
 <xmx:zT5bYPamDr57cu3IPUK-AOn6cVYDhVX0pSiHHvJicn4L9M-LbNUbLQ>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 462F31080054;
 Wed, 24 Mar 2021 09:29:47 -0400 (EDT)
Date: Wed, 24 Mar 2021 22:29:44 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: David Henningsson <coding@diwic.se>
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
Message-ID: <20210324132944.GB3711@workstation>
Mail-Followup-To: David Henningsson <coding@diwic.se>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210324054253.34642-1-coding@diwic.se>
 <s5htup0amwk.wl-tiwai@suse.de>
 <cab75b18-37ca-eacb-deff-b25900b169ba@diwic.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cab75b18-37ca-eacb-deff-b25900b169ba@diwic.se>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Wed, Mar 24, 2021 at 12:18:59PM +0100, David Henningsson wrote:
> On 2021-03-24 11:03, Takashi Iwai wrote:
> > This looks like a good middle ground solution, while we still need to
> > address the sequencer timestamp (basically we should be able to send
> > an event with the timestamp prepared from the rawmidi side).
> 
> I believe the new framing mode would be useful both for readers of rawmidi
> devices, and the seq kernel module.
> 
> I have also been thinking of doing something in usb-midi (because I assume
> that's the most common way to do midi input these days), to improve
> performance for packets with more than three bytes in them. Right now a
> sysex would be cut off in chunks of three bytes, each one with its own
> timestamp. If so, that would be a later patch.

I've been investigated with some old documentations since David posted his
initial idea[1]. However, I always have concern that we can really find
timestamp for incoming data for MIDI message in hardware/software IRQ
contexts.

As you know, in the specification, MIDI message has no timestamp. Even
if MIDI Time Code (MTC) is included in the specification, it's the role
for hardware MIDI sequencer to decide actual presentation time for
received MIDI messages. In this meaning, your patch is reasonable to
process the received MIDI messages.

However, the timing jitter of IRQ handler invocation is issued in this
case, as well as PCM interface, even if the data rate of MIDI physical
layer is quite low nowadays (31.25 Kbit / sec ~= 3906.25 byte / sec).
As long as I experienced, in actual running Linux system, the invocation
of IRQ handler has no guarantee for timing jitter, mainly due to CPU level
IRQ mask (like spin_lock). Therefore the interval of each invocation is not
so precise to decide event timestamp, at least for time slot comes from
MIDI physical layer.

Nevertheless, I think your idea is enough interesting, with conditions to
deliver information from driver (or driver developer) to applications
(ALSA Sequencer or userspace applications). Even if we have some
limitation and restriction to precise timestamp, it's worth to work for
it. It seems to be required that improvements at interface level and
documentation about how to use the frame timestamp you implemented.


P.S. As long as referring old resources relevant to the design of
hardware MIDI sequencer in late 1990's, the above concern seems to be real
to engineers. They are always requested to process MIDI message in real
time somehow beyond buffering and timing jitter.

[1] Midi timestamps
https://mailman.alsa-project.org/pipermail/alsa-devel/2021-March/182175.html


Regards

Takashi Sakamoto

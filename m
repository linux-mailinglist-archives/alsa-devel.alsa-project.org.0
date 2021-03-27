Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA6334B415
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 04:46:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42DDA167B;
	Sat, 27 Mar 2021 04:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42DDA167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616816774;
	bh=6MansCR4yMmpWvJ1gQdJZAfkDHyMLCcfNI/6f3Afx0o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pzuyXczpc8TVViQgwzJOHJreuKpReUt9b2yyO7JA9Qt8aAtvwraTZk+dfNThaU1R7
	 fneXbLitUeo9bIdNWm1luXbMpzkR0mOe4DFiwhGj6O9ruqfSmQ4jm5HgSpVIFgG+R5
	 8EQH/k5gTgcvLjaAKVUSSZMktxDCYrPc8vuUM/U4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33A5CF80257;
	Sat, 27 Mar 2021 04:44:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82F1FF8025F; Sat, 27 Mar 2021 04:44:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2F4FF80104
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 04:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2F4FF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="wcLcQGNP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sTUnjrbb"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id EC1821BE4;
 Fri, 26 Mar 2021 23:44:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 26 Mar 2021 23:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=d
 ajl3IddWIwYzXL5YJTwHbVpO3gethM5s8ZnggJzdKQ=; b=wcLcQGNPLd2gi3nRm
 y2Z/Ic3ZKFKrWQzXI2SKmicl15Kf8Yd+SXloZ2PPV9HNg/so3OJomFAOA5jkiWKR
 Hr8rP4o09qZ8netc4adMMOMeAQPDbkeE/XLQZcYagQakCQVZobBJpp778J78ca7O
 RH3eZTKFj3OlyXB0UQAWN9LypLxCEFyn24aKwMO+KX63Va2QU23+AHFyiwt5w2ny
 9WIdsaurrutlGxdMloX5zm3JaE8kNc3/VQ1zL9OafsRQ1FLqFz2E3eHioPPKOJUU
 PuWy5uCv28Jx8ovtxurh1WaKi3/RvkX991ocwPTOoL5Ca/0wqAk3WAHmUj2d8vaw
 C8GkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=dajl3IddWIwYzXL5YJTwHbVpO3gethM5s8ZnggJzd
 KQ=; b=sTUnjrbbwRcSOjHKkNiMbPrkvnmEdkrCg983i2b37Son+J9cEvY9Sfwjq
 M13QSjb6cFnN0XxLJ9Q8I4IQNy2HrX1ZtuHC92db4d4nWRqLYmIctJWOIvo+MgJr
 +dvrc4Y8YZfQi5avIbjdh93hGvQnYyQIcN1zAIVDfD1FrXQ3uLNgIucABBjZggYr
 7gDWaiQUb09YtSsjgE8S+udByFIZbuITU9NaLqDaPIutzVOUcQL3Qbvk7k7L0DPh
 BJqZ8YTEY2vUmYM1GimipPUhSM1H1RxTRQt1nwC2phN6kCnKEnoTgMczEL7WsV7+
 BKOl4TENUQuZ52iOGNBe3T5UfM+3Q==
X-ME-Sender: <xms:I6peYNrUgP-VfSejinwFLsBM0CSW46C9X-lp4IcMikvHVochSbFZHA>
 <xme:I6peYPqYBBbDxItxiORURNYrMDbF8DttYc9EFvpFqGXjIxBSHQ0dQKR2cFVxal3bk
 5Aa-mvf1diXktk5H9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehfedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepfedtkedvhfdtlefgtdffheekjeejtddvteegkeev
 ffdvhffhudevleetudeiheetnecukfhppedugedrfedrieehrddujeehnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:I6peYKMWPksXJdr8fAB-fY7Udz-L8FykgPAcKJcyK3Jo1liq8NVmiQ>
 <xmx:I6peYI6B7U4EfLPnSXtJwIyA5xr2zfQmOE9GqDyKJ-i3ifi03grwMg>
 <xmx:I6peYM6BscxxUOLWlKtAaRdtD2XFgS15Ny9wUYguubADebNf4XAJBA>
 <xmx:JKpeYKTw8bYdE-PQRo2fzgWrOFxcFQAohNdjXWBC9dZAYQMKokKGEw>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0C19A240057;
 Fri, 26 Mar 2021 23:44:33 -0400 (EDT)
Date: Sat, 27 Mar 2021 12:44:31 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: David Henningsson <coding@diwic.se>
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
Message-ID: <20210327034431.GB10225@workstation>
Mail-Followup-To: David Henningsson <coding@diwic.se>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 perex@perex.cz
References: <20210324054253.34642-1-coding@diwic.se>
 <20210324124430.GA3711@workstation>
 <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
 <20210326044615.GA51246@workstation> <s5hr1k2l56t.wl-tiwai@suse.de>
 <2ca71809-9872-bfee-c19d-76b6ce143212@diwic.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ca71809-9872-bfee-c19d-76b6ce143212@diwic.se>
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

From Takashi (not maintainer),

On Fri, Mar 26, 2021 at 05:29:04PM +0100, David Henningsson wrote:
> On 2021-03-26 08:55, Takashi Iwai wrote:
> > On Fri, 26 Mar 2021 05:46:15 +0100, Takashi Sakamoto wrote:
> > > On Wed, Mar 24, 2021 at 04:57:31PM +0100, David Henningsson wrote:
> > > > > However, the timing jitter of IRQ handler invocation is issued in this
> > > > > case, as well as PCM interface, even if the data rate of MIDI physical
> > > > > layer is quite low nowadays (31.25 Kbit / sec ~= 3906.25 byte / sec).
> > > > > As long as I experienced, in actual running Linux system, the invocation
> > > > > of IRQ handler has no guarantee for timing jitter, mainly due to CPU level
> > > > > IRQ mask (like spin_lock). Therefore the interval of each invocation is not
> > > > > so precise to decide event timestamp, at least for time slot comes from
> > > > > MIDI physical layer.
> > > > > 
> > > > > Nevertheless, I think your idea is enough interesting, with conditions to
> > > > > deliver information from driver (or driver developer) to applications
> > > > > (ALSA Sequencer or userspace applications). Even if we have some
> > > > > limitation and restriction to precise timestamp, it's worth to work for
> > > > > it. It seems to be required that improvements at interface level and
> > > > > documentation about how to use the frame timestamp you implemented.
> > > > Right, so first, I believe the most common way to transport midi these days
> > > > is through USB, where the 31.25 Kbit/sec limit does not apply: instead we
> > > > have a granularity of 1/8 ms but many messages can fit in each one. So that
> > > > limit is - for many if not most cases - gone.
> > > > 
> > > > Second; you're probably right in that there is still some jitter w r t when
> > > > the IRQ fires. That is regrettable, but the earlier we get that timestamp
> > > > the better, so a timestamp in IRQ context would at least be better than in a
> > > > workqueue that fires after the IRQ, or in userspace that possibly has
> > > > scheduling delays.
> > > > 
> > > > Btw, I checked the "struct urb" and there was no timestamp in there, so I
> > > > don't know how to get a better timestamp than in snd_rawmidi_receive. But
> > > > maybe other interfaces (PCI, Firewire etc) offers something better.
> > > Hm. Regardless of type of hardware; e.g. OHCI/EHCI/xHCI, 1394 OHCI, or
> > > PCI-e extension card, for software to process sampled data, it's always
> > > issue that the jitter between triggering IRQ (hardware side) and invoking
> > > IRQ handler (processor side). As an actual example, let me share my
> > > experience in 1394 OHCI.
> > > 
> > > 
> > > 1394 OHCI controller is governed by 24.576 Mhz clock (or double depending
> > > on vendors). In IEEE 1394, ishcornous service is 8,000 times per second.
> > > 1394 OHCI specification allows software to schedule hardware IRQ per
> > > isochronous cycle.
> > > 
> > > Once ALSA firewire stack is programmed to schedule the hardwar IRQ evenry
> > > 16 isochronous cycle. The corresponding IRQ handler is expected to invoke
> > > every 2 milli second. As long as I tested in usual desktop environment[2],
> > > the jitter is between 150 micro second and 4.7 milli second. In the worst
> > > case, it's 6.0 milli seconds. The above is also the same wnen using
> > > 'threadirqs'.
> > > 
> > > When using 'isolcpus' and arranging 'smp_affinity' to reduce load from one
> > > of processor core to invoke the IRQ handler, the interval is 2 milli
> > > second with +- several nano seconds, therefore the 1394 OHCI controller
> > > can trigger hardware IRQ so precise. The jitter comes from processor side.
> > > I think many running contexts on the same processor core masks IRQ so
> > > often and the jitter is not deterministic.
> > > 
> > > Here, what I'd like to tell you is that we can not handle the system time
> > > as is as timestamp of received MIDI messages, as long as relying on IRQ
> > > context. We need some arrangements to construct better timestamp with some
> > > compensations. In this point, the 3rd version of patch is not enough[3],
> > > in my opinion.
> 
> Interesting measurements. While several ms of jitter is not ideal, I have a
> few counter arguments why I still believe we should merge this patch:
> 
>  1) I don't think we should let the perfect be the enemy of the good here,
> just because we cannot eliminate *all* jitter does not mean we should not
> try to eliminate as much jitter as we can.
 
Exposing something to userspace is easy engineering, but find appropriate
role to it is not as easy for userspace applications.

>  2) an unprivileged process (that cannot get RT_PRIO scheduling) might have
> a wakeup jitter of a lot more than a few ms, so for that type of process it
> would be a big improvement. And sometimes even RT_PRIO processes have big
> delays due to preempt_disable etc.

I agree with the point. When comparing to current implementation of ALSA
rawmidi stack, the patch makes it near true time somwhow to estimate read
MIDI messages since task scheduling includes larger resolution and jitter
than the ones of invocation of IRQ handler.

I reported some issues as a next step. At least, the system time to
invoke IRQ handler needs to be compensated with supplemental
information. Current patch forces the task to userspace applications
silently without any information from kernel space. This results in failure
to set incentive for userspace developers to use the new functionality, in
my opinion.

I guess it better to deliver below information:

 * interval of burstness
  * drivers for packet-based protocol handles several packets at once
 * minimal timestamp gap between successive frames
  * however actually fuzzed by the jitter of invocation of IRQ handler
 * maximum size of frame
  * the target hardware transfer batch of MIDI messages or single midi
    byte at once

The above items is an idea from my side. I need more time and discussion
for better set.

Again, I have no opposition to the idea itself. However in a view of
application developer, it's not necessarily useful against timeslot of
3906.25 bytes/sec.

>  3) The jitter will depend on the hardware, and other hardware might have
> better (or worse) IRQ jitter.
> 
>  4) If this patch gets accepted, it might show other kernel developers that
> IRQ jitter matters to us, and that in turn might improve the chances of
> getting IRQ jitter improvement patches in, in case someone else wants to
> help solving that problem.


Thanks

Takashi Sakamoto

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B544034B3F8
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 04:12:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37345166A;
	Sat, 27 Mar 2021 04:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37345166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616814745;
	bh=U8tXDKxLdvNuTEY5qBU6dZvXuOGpkLkFfXitB6xCzow=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPM7MdtfXdCCwfAVsK8QOXnlgPkW0QV+PXZaecmwPqIvc4BKw92i9ceEg6lgou9UF
	 0tJI8hT0CRnT2evsoDIGzuTonwnReBHBPCiYOYCcMwl0zI+gR5iroAwW4yg1XFAU40
	 kdjrNjU8l0mkJ4GOxJrg+VAcQzLorTBY/NmpFIEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE48F800B9;
	Sat, 27 Mar 2021 04:10:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96164F8025F; Sat, 27 Mar 2021 04:10:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA43DF80109
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 04:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA43DF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="e/oePjLA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fi+UagLW"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6A7001FC9;
 Fri, 26 Mar 2021 23:10:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Mar 2021 23:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=eCi7MrrT3B7DFV7E5FHD/6SrvZ4
 yKO3RxfoB5u07ETs=; b=e/oePjLAMbk/vnq2a4wgdn8vZtBYoPbF9Nk4HMvL6Ee
 XQRucWPKmSo+N8D7/1cXHU763w5vhYnR8GcoMOPGOj66BhZdjRGg4GJwTrSAcEVE
 SsaF5iDLRetWz2Ej1Eegx07NmDf2oOuI5atHVSkvT8cvsnZI34YEt3KNvUAkbkiC
 FeZgqj7DJrkZVtzueLBnIcP4w0ldDrIuUh3jfxTkC+lxQoz2YA6G1GsBhoQoCgup
 Ae1FNczAlUI1hiPv0i7HLwYesQpXdFaw8NCMnyEml/n3lYdLtyVtba6esDxBE+gn
 7CIcjpH+uh7wuski2lBt38XHR64vbqw/kjf/R95ghgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eCi7Mr
 rT3B7DFV7E5FHD/6SrvZ4yKO3RxfoB5u07ETs=; b=fi+UagLWRSTGbgV/bnJOwe
 lX6aabiWqNfSo9bOXRZ51406caKbfIeevd6Cmx9bQ4wdyQjvh4uxrJ3IwYqo2XY0
 qf8UU7WGqbcPm2+n2EOugOHdApFFo8AOI5mPaS/yhz5Bns4XMFIGDUIV+Fw6xg8S
 dAVdfS2APZtmM/LLcERip7UMSwiJ6FXqhrRffQtuniPggsfaayMvlQ1RSyT7H8vZ
 LDvTddSBvTv2ve5LSfHqKS8C24YHgru7HQw6JJtAXmFb3uDolqeTWTU/sbhkU1PU
 9R//GEvapp/TR+iuXU6euioY7OFVVZ84MXh65wdIX8PHzxNugxUyfjS23WzU+lMw
 ==
X-ME-Sender: <xms:MqJeYF_7KrWz4h4XyeCjg3wzF5UodpuUCcLU2Xrpn8eBsFF7bnTgFg>
 <xme:MqJeYJt9riZGWzd8Oew7RIOiSbn85LWJUFJTyXUVmLNeKhteFtfWd_POsNNc8dNBP
 bMjr-m3vMgQygAJdVc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehfedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:MqJeYDAVaWk-tIFdIaq2KmOLThAVxO5eCJm-Ca89QkfN7cBaxlAzgg>
 <xmx:MqJeYJeR6rdNcu24zZrinz68K1RGFH_mxqNfG6fai37p1VMANmCKzA>
 <xmx:MqJeYKNrJXNN62INAdvocmjcew1uLpsLeQfHCZ8NC4hZN0RJOel0vQ>
 <xmx:NKJeYM2Y01TBnXnsniQ-_NnYNsbmQwSsWlX1xjU6Te9vHG0kGBr_og>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9C14A1080057;
 Fri, 26 Mar 2021 23:10:41 -0400 (EDT)
Date: Sat, 27 Mar 2021 12:10:39 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
Message-ID: <20210327031039.GA10225@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 David Henningsson <coding@diwic.se>, alsa-devel@alsa-project.org,
 perex@perex.cz
References: <20210324054253.34642-1-coding@diwic.se>
 <20210324124430.GA3711@workstation>
 <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
 <20210326044615.GA51246@workstation> <s5hr1k2l56t.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hr1k2l56t.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, David Henningsson <coding@diwic.se>
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

On Fri, Mar 26, 2021 at 08:55:38AM +0100, Takashi Iwai wrote:
> On Fri, 26 Mar 2021 05:46:15 +0100, Takashi Sakamoto wrote:
> > On Wed, Mar 24, 2021 at 04:57:31PM +0100, David Henningsson wrote:
> > > > However, the timing jitter of IRQ handler invocation is issued in this
> > > > case, as well as PCM interface, even if the data rate of MIDI physical
> > > > layer is quite low nowadays (31.25 Kbit / sec ~= 3906.25 byte / sec).
> > > > As long as I experienced, in actual running Linux system, the invocation
> > > > of IRQ handler has no guarantee for timing jitter, mainly due to CPU level
> > > > IRQ mask (like spin_lock). Therefore the interval of each invocation is not
> > > > so precise to decide event timestamp, at least for time slot comes from
> > > > MIDI physical layer.
> > > > 
> > > > Nevertheless, I think your idea is enough interesting, with conditions to
> > > > deliver information from driver (or driver developer) to applications
> > > > (ALSA Sequencer or userspace applications). Even if we have some
> > > > limitation and restriction to precise timestamp, it's worth to work for
> > > > it. It seems to be required that improvements at interface level and
> > > > documentation about how to use the frame timestamp you implemented.
> > > 
> > > Right, so first, I believe the most common way to transport midi these days
> > > is through USB, where the 31.25 Kbit/sec limit does not apply: instead we
> > > have a granularity of 1/8 ms but many messages can fit in each one. So that
> > > limit is - for many if not most cases - gone.
> > > 
> > > Second; you're probably right in that there is still some jitter w r t when
> > > the IRQ fires. That is regrettable, but the earlier we get that timestamp
> > > the better, so a timestamp in IRQ context would at least be better than in a
> > > workqueue that fires after the IRQ, or in userspace that possibly has
> > > scheduling delays.
> > > 
> > > Btw, I checked the "struct urb" and there was no timestamp in there, so I
> > > don't know how to get a better timestamp than in snd_rawmidi_receive. But
> > > maybe other interfaces (PCI, Firewire etc) offers something better.
> > 
> > Hm. Regardless of type of hardware; e.g. OHCI/EHCI/xHCI, 1394 OHCI, or
> > PCI-e extension card, for software to process sampled data, it's always
> > issue that the jitter between triggering IRQ (hardware side) and invoking
> > IRQ handler (processor side). As an actual example, let me share my
> > experience in 1394 OHCI.
> > 
> > 
> > 1394 OHCI controller is governed by 24.576 Mhz clock (or double depending
> > on vendors). In IEEE 1394, ishcornous service is 8,000 times per second.
> > 1394 OHCI specification allows software to schedule hardware IRQ per
> > isochronous cycle.
> > 
> > Once ALSA firewire stack is programmed to schedule the hardwar IRQ evenry
> > 16 isochronous cycle. The corresponding IRQ handler is expected to invoke
> > every 2 milli second. As long as I tested in usual desktop environment[2],
> > the jitter is between 150 micro second and 4.7 milli second. In the worst
> > case, it's 6.0 milli seconds. The above is also the same wnen using
> > 'threadirqs'.
> > 
> > When using 'isolcpus' and arranging 'smp_affinity' to reduce load from one
> > of processor core to invoke the IRQ handler, the interval is 2 milli
> > second with +- several nano seconds, therefore the 1394 OHCI controller
> > can trigger hardware IRQ so precise. The jitter comes from processor side.
> > I think many running contexts on the same processor core masks IRQ so
> > often and the jitter is not deterministic.
> > 
> > Here, what I'd like to tell you is that we can not handle the system time
> > as is as timestamp of received MIDI messages, as long as relying on IRQ
> > context. We need some arrangements to construct better timestamp with some
> > compensations. In this point, the 3rd version of patch is not enough[3],
> > in my opinion.
> > 
> > My intension is not to discourage you, but it's better to have more care.
> > As one of the care, I think we can use extension of
> > 'struct snd_rawmidi_status' to deliver some useful information to ALSA
> > rawmidi applications, or including other parameters to the frame structure.
> > But I don't have ideas about what information should be delivered,
> > sorry...
> 
> Well, the question is how much accuracy is wanted, and it's relatively
> low for MIDI -- at least v1, which was defined many decades ago for a
> slow serial line.
> 
> That said, the patch set was designed for providing the best-effort
> timestamping in software, and that's supposed to be enough for normal
> use cases.

Indeed. I think it the best-effort in software side, but with less care of
hardware matters. Although I have no strong objection to the idea of the
patch itself, the point of my insistent is _not_ how much accuracy is
preferable.

When I imagine to write actual program as an application of rawmidi with
the frame structure, I have a concern about how to use the timestamp. At
present, it's just a record of invocation of any IRQ context. When using it
for timestamp of MIDI message, the application needs supplement information
for compensation for any jitter and delay, however nothing is provided.

At present, we seem to fail setting any incentive for users to use the new
functionality, in my opinion. Such functionality is going to be obsoleted
sooner or later, like 'struct snd_rawmidi_status.tstamp' (I guess no one
could have implemented it for the original purpose, then no one is going to
use it). That's my concern.

> If there is any device that is with the hardware  timestamping, in
> theory, we could provide the similar data stream in  the same format
> but maybe with a different timestamp type.

I seem to fail getting what you mean, but if I'm allowed to mention
about legacy devices, I'll report the case of IEC 61883-1/6 in IEEE 1394
with 1394 OHCI. 1394 OHCI allows software to handle isochronous packet
payload with cycle time. We can compute the timestamp independent on
current system time in IRQ handler with resolution by 125 micro second.
Below drivers can adapt to it:

 * snd-bebob
 * snd-fireworks
 * snd-oxfw
 * snd-dice
 * snd-firewire-digi00x (mutated version of protocol)
 * snd-firewire-motu (mutated version of protocol)

But for the case below MIDI messages are on asynchronous packet and
need to current system time in invoked IRQ handler:
 * snd-tascam
 * snd-fireface

> But actually I'd like to see some measurement how much we can improve
> the timestamp accuracy by shifting the post office.  This may show
> interesting numbers.
> 
> Also, one thing to be more considered is the support for MIDI v2 in
> future.  I haven't seen any development so far (and no device
> available around), so I cannot comment on this much more, but it'd be
> worth to take a quick look before defining the solid API/ABI.


Regards

Takashi Sakamoto

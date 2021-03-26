Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1F34A0AE
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 05:48:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD8961663;
	Fri, 26 Mar 2021 05:47:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD8961663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616734082;
	bh=6YBuuPcuoRIz9PRU0hkgVP3LQBxTat7MhPkmSLfWa9g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T5OZGoMldM7OBUHL/59pU6nEERouw2eOEtoD2TxOo4JG5KxhKjAbH2anaFX+KT7zc
	 19ck7AbIikxQ2qKK9YkDY6DPRjvbtHWeF0c1q5nsjqyY9zWq4qyS6o8ZHw1o18IDm2
	 Uye1zLVp8u2Zkkl/uG45U0OBo0S+ocwCaRawMP1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24769F800D0;
	Fri, 26 Mar 2021 05:46:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC2A3F8016B; Fri, 26 Mar 2021 05:46:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCEBCF800D0
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 05:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCEBCF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vFekTA2R"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GVM+AP3q"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2B88D1FEF;
 Fri, 26 Mar 2021 00:46:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 26 Mar 2021 00:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=FVpuFxZm6hFPZ49ujgZDg91AUTQ
 +wd6mWf9AEuax3yg=; b=vFekTA2RRobjPaCsaqkGBeAzjN8OFg0479/4Cv5f//D
 5fsyK8uig8suxf9+2cp3rJLD37XPNuKSuugYFIO7cVgr0IsquwXyqNYd4pRdxXAY
 QhIAcrkgTP42CDgJCThttEDj88Ehsl/ysnsLD5fNXD85DTOJjAfQbFwr1QU+h+xU
 W0VlFUNnGwvmAXwxcDZlmjecbEKqBr47mazwgnMFhg63UjpKeFpskbWQ1L2o0t/q
 vZgg4WvoYcG98aAjaaIFIiotAXQxiFaOlhuUBF6DaVHsIrS4dsyIdtqGPhHT6/d9
 7sBH/nxXR3PCRV2mPf8MuGEdKEbEQuRTV+K7gGAq1Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FVpuFx
 Zm6hFPZ49ujgZDg91AUTQ+wd6mWf9AEuax3yg=; b=GVM+AP3qiTyGvHuj648qIi
 9ViU6IjhIufneHmPO+oRs8DZWuMCgXcEUOj+7DyGQd2LPu++Kd5EgXlPfLMN9Mak
 VH1kHT/E6PI3vN3PCgrKz40N/PEiOHHS66sO94B9U5rYgrP5oiAvhHVTn/Bp8RNe
 1Z68RIMj76Ewucyt2LDnrjwtx7Fcp9CNGunkgQkQBdywNfc/yxxqWx2i0n2PAv6T
 w7GIk60ygd8pRq5H2y/aihBZyFE7Q8Mop0k/Evh6WGSHbr9lUVaqqy5ax9XPNiVr
 iXSc76dQJ+dAH4kRpS/2j3xKGUR+IDd04K7jMxZ4SrjZ6+ZI0fkyMdna6aKDYbBA
 ==
X-ME-Sender: <xms:G2ddYLww_UoQVw10-3GiVIa4Cx_u1jhTRAB2bECJPblfDkMFm8I0xw>
 <xme:G2ddYDTE3KRjaDXzs89D_zOYY2zPpeVPkOr13CpZLoOZdwB9QfjuRntFp2Cf6mO5J
 EEZT99QbS3-3WQ6_8M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhephfefleekfe
 evgffhhfehudetkeeivdeuvdelgeejjefhffegkeffffdugfevudetnecuffhomhgrihhn
 pehgihhthhhusgdrtghomhdprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppeduge
 drfedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:G2ddYFWalnm_M6y6wsDwec1U2TwTozokU9-3wfvMPDEWhKfAGTjeGw>
 <xmx:G2ddYFiAB1VTTeCcN6P0Z-C-Hj-LID-shNZ1YIusKCWDZHqZBz9L-A>
 <xmx:G2ddYNB55M6741dgdMuTfumH8jGQ9gi4sztqNPqqtrBRZBZb7cgReQ>
 <xmx:HGddYK4-ve58_wiQK1eKM4_51KAbzoO4lFbIxJ3PYAELKEa8MWHIyQ>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 979D024005A;
 Fri, 26 Mar 2021 00:46:18 -0400 (EDT)
Date: Fri, 26 Mar 2021 13:46:15 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: David Henningsson <coding@diwic.se>
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
Message-ID: <20210326044615.GA51246@workstation>
Mail-Followup-To: David Henningsson <coding@diwic.se>,
 alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz
References: <20210324054253.34642-1-coding@diwic.se>
 <20210324124430.GA3711@workstation>
 <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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

Hi David,

On Wed, Mar 24, 2021 at 04:57:31PM +0100, David Henningsson wrote:
> > However, the timing jitter of IRQ handler invocation is issued in this
> > case, as well as PCM interface, even if the data rate of MIDI physical
> > layer is quite low nowadays (31.25 Kbit / sec ~= 3906.25 byte / sec).
> > As long as I experienced, in actual running Linux system, the invocation
> > of IRQ handler has no guarantee for timing jitter, mainly due to CPU level
> > IRQ mask (like spin_lock). Therefore the interval of each invocation is not
> > so precise to decide event timestamp, at least for time slot comes from
> > MIDI physical layer.
> > 
> > Nevertheless, I think your idea is enough interesting, with conditions to
> > deliver information from driver (or driver developer) to applications
> > (ALSA Sequencer or userspace applications). Even if we have some
> > limitation and restriction to precise timestamp, it's worth to work for
> > it. It seems to be required that improvements at interface level and
> > documentation about how to use the frame timestamp you implemented.
> 
> Right, so first, I believe the most common way to transport midi these days
> is through USB, where the 31.25 Kbit/sec limit does not apply: instead we
> have a granularity of 1/8 ms but many messages can fit in each one. So that
> limit is - for many if not most cases - gone.
> 
> Second; you're probably right in that there is still some jitter w r t when
> the IRQ fires. That is regrettable, but the earlier we get that timestamp
> the better, so a timestamp in IRQ context would at least be better than in a
> workqueue that fires after the IRQ, or in userspace that possibly has
> scheduling delays.
> 
> Btw, I checked the "struct urb" and there was no timestamp in there, so I
> don't know how to get a better timestamp than in snd_rawmidi_receive. But
> maybe other interfaces (PCI, Firewire etc) offers something better.

Hm. Regardless of type of hardware; e.g. OHCI/EHCI/xHCI, 1394 OHCI, or
PCI-e extension card, for software to process sampled data, it's always
issue that the jitter between triggering IRQ (hardware side) and invoking
IRQ handler (processor side). As an actual example, let me share my
experience in 1394 OHCI.


1394 OHCI controller is governed by 24.576 Mhz clock (or double depending
on vendors). In IEEE 1394, ishcornous service is 8,000 times per second.
1394 OHCI specification allows software to schedule hardware IRQ per
isochronous cycle.

Once ALSA firewire stack is programmed to schedule the hardwar IRQ evenry
16 isochronous cycle. The corresponding IRQ handler is expected to invoke
every 2 milli second. As long as I tested in usual desktop environment[2],
the jitter is between 150 micro second and 4.7 milli second. In the worst
case, it's 6.0 milli seconds. The above is also the same wnen using
'threadirqs'.

When using 'isolcpus' and arranging 'smp_affinity' to reduce load from one
of processor core to invoke the IRQ handler, the interval is 2 milli
second with +- several nano seconds, therefore the 1394 OHCI controller
can trigger hardware IRQ so precise. The jitter comes from processor side.
I think many running contexts on the same processor core masks IRQ so
often and the jitter is not deterministic.

Here, what I'd like to tell you is that we can not handle the system time
as is as timestamp of received MIDI messages, as long as relying on IRQ
context. We need some arrangements to construct better timestamp with some
compensations. In this point, the 3rd version of patch is not enough[3],
in my opinion.

My intension is not to discourage you, but it's better to have more care.
As one of the care, I think we can use extension of
'struct snd_rawmidi_status' to deliver some useful information to ALSA
rawmidi applications, or including other parameters to the frame structure.
But I don't have ideas about what information should be delivered,
sorry...

[1] https://github.com/systemd/systemd/pull/19124
[2] I used stock image of Ubuntu 19.10 desktop for the trial.
[3] https://mailman.alsa-project.org/pipermail/alsa-devel/2021-March/182842.html

Thanks

Takashi Sakamoto

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CB9E9B26
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 12:51:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8937F230E;
	Wed, 30 Oct 2019 12:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8937F230E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572436318;
	bh=92Mf/QyVNYYQddQl4VgqE/s+qblldsBq/taa05XuVKs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BLA0fxE+KWw3HIcxJeAPVD2GP7iIZzxRxx+Yt9iYc5kExsyvZmzEl3CrNGr7YluMO
	 s1ybiRk5a5W0sHSj5aBXDeaHAEGjeHi3z1q6U5E235txmQzA/mV9lDbGgRq+xDqw48
	 w/HNwBh4ohnaQoZo4BNPBoWJQ7cwy0XTzirKNxjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 641F0F802BD;
	Wed, 30 Oct 2019 12:50:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A704BF80361; Wed, 30 Oct 2019 12:50:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18B65F802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 12:50:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18B65F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="qDCwJLU3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="V0K18gC8"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4642321E6A;
 Wed, 30 Oct 2019 07:50:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 30 Oct 2019 07:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=HMFfDDceu4KUPGn7J++VuNhscGA
 lz6Rm4rvKSvxRu7s=; b=qDCwJLU3goBmXP/tCS3WMIoFcYAALJbe0qwWkV84AZF
 +/o4s0hL2JENAb63lhP/HcSnBRu0PjufIEtsROqOmO+DwoftNXTj6l1JLYBtapdj
 VUOQ2a8hEhDDn+o3guq4G8LU+fXSL6c4+T4HTRc+tXty9Qot/f05OTiXQXHPWp1w
 ARSg7yIDdXzmgYF3TxMWEooBUcaxHa6hEFQB9QmZVusxjM0wpr1jH/8vtSPsdQiY
 MvEimEQdfhAGg7TsukkrrJ/IfZvYeeTX88SyS3yHWl10PpPY/EBeWCOF8rwDZvg/
 rX6IfoeWniWUCJnm4YWAQQPAw+L7Z++FxANQCTd0ecw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HMFfDD
 ceu4KUPGn7J++VuNhscGAlz6Rm4rvKSvxRu7s=; b=V0K18gC8a9zSvBZoQqlxqs
 et7jAthPWnts5tFEsdV4XRm87GPhd5L68uapzV/ZlUpBHyxNSnr82eRyy1rsLvNt
 Xx8l6TB33x4lelibJQ8ZbAovthqBdXV7ml6H0dZ+r00lOjuu1DVUP1LK1r5i1POy
 641Ar1moNmV8BK7ghkVbAbIiqopMylDjUOhdpQ7dykockqOKUXT7tNUPr2RMBZp0
 +lGKZYGs+A7cmb+np6gTjESTBjOHzSJSg0wRRg9EDNtS31Nwbn8bFYyDydvIQ5Py
 3kXLJkjJH40+fZzY01dCaxG1mwoQzG+QsZUvTfLREOPGVKD3lso7lwsggem5wAGw
 ==
X-ME-Sender: <xms:7ni5XUpCuXJfMHMKQok854Z6rgRRY4Fx_ZOcYfFJvVr4vXrqwBiKww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtfedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudegrdefrdejhedr
 udekudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmh
 hotggthhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:7ni5Xe6qzDMDwHeD_m73qGLLDLrtmsxtFC3dVlTNLniQeUKIdbs5nw>
 <xmx:7ni5XUOIyajoNzoyoa5QD6RiuzQi8OXUOJjLpSMB8JHb7lJHtyeGyA>
 <xmx:7ni5XQNA_rRWphQGHT-qSjpZy3KxNpVRPxEJxPX6G4Z4c5xRSTRlmw>
 <xmx:73i5XV2fZEbeeh_54EhMb0XDrAjjJW3iiCQlM7Z1U6zzwXlvZVU55g>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7DF3C8005A;
 Wed, 30 Oct 2019 07:50:05 -0400 (EDT)
Date: Wed, 30 Oct 2019 20:50:02 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jean-Paul Argudo <jpa@argudo.org>
Message-ID: <20191030115001.GB6313@workstation>
Mail-Followup-To: Jean-Paul Argudo <jpa@argudo.org>,
 alsa-devel@alsa-project.org
References: <769b9f5dae864cf1eb433ab84eed385a161931c8.camel@argudo.org>
 <20191030091540.GA1856@workstation>
 <ad6f8c036538aa755017efe976ac223bb7c90be3.camel@argudo.org>
 <c4b792255de178094fd53d80a25fc75b795e3acb.camel@argudo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4b792255de178094fd53d80a25fc75b795e3acb.camel@argudo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] snd-bebob : from kernel 4.13 to 5.3.19 and .20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Wed, Oct 30, 2019 at 10:40:18AM +0100, Jean-Paul Argudo wrote:
> > I'll install Eoan kernel and test my devices.
> > (but I don't have Saffire and Saffire LE...) I'd like you to wait
> > for my test report.
> 
> What I can say is that with kernel 4.13 under Ubunto Disco everything
> was fine :-(

I install Eoan (linux-image-5.3.0-19-generic:5.3.0-19.20) and test ALSA
bebob driver with my test devices:
 - Yamaha GO46 (DM1000 ASIC)
 - M-Audio FireWire Solo (DM1000 ASIC)
 - Behringer FCA610 (DM1500 ASIC)
 - Focusrite SaffirePro 26 I/O (DM1000E)

However I don't find similar discontinuities. This means that you
encounter model-specific issue as regression I didn't realized.

For my information, would you please get output from nodes on procfs?
 * /proc/asound/cardX/firewire/clock
 * /proc/asound/cardX/firewire/firmware
 * /proc/asound/cardX/firewire/formation

Additionally, please install 'gir1.2-hinawa-2.0' package, then clone
below remote repository:
 * https://github.com/takaswie/hinawa-utils

This repository includes two scripts to get information from the device:
 * hinawa-bebob-parser
 * hinawa-bebob-connection-cui

When your device is detected as sound card '2' and your device is also
detected as '/dev/fw1', execute below:

$ ./hinawa-bebob-connection-cui 2 graph-connections
$ ./hinawa-bebob-parser 1 2

> At startup it lights green ok, but no sound is playable, then the
> lights turn orange (like it is when it's not working), I hear a
> "relay sound" (a electric clic of a relay), then, the Saffire LE
> disapears from the sound menu in Ubuntu sound menu.

Once your device is detected and ALSA bebob driver bound to it,
pulseaudio detects it and start PCM substream to get capabilities
of the device.

In your case, the PCM substream is corrupted by the discontinuity.
Then pulseaudio give up to use the device. As a result, sound menu
drops entry of the device.

I guess that the color of LED corresponds to the packet streaming.

On Wed, Oct 30, 2019 at 11:12:01AM +0100, Jean-Paul Argudo wrote:
> But something new and maybe interesting for you : 
> 
> Oct 30 09:25:25 deiphobe pulseaudio[2589]: E: [alsa-sink-BeBoB] alsa-sink.c: ALSA woke us up to write new data to the device, but there was actually nothing to write.
> Oct 30 09:25:25 deiphobe pulseaudio[2589]: E: [alsa-sink-BeBoB] alsa- sink.c: Most likely this is a bug in the ALSA driver 'snd_bebob'.  Please report this issue to the ALSA developers.
> Oct 30 09:25:25 deiphobe pulseaudio[2589]: E: [alsa-sink-BeBoB] alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
 
Practically these logs can be ignored. (I work to suppress the above
lines in development period for Linux kernel v5.5.)
 
> **And in kern.log** : at the beggining in the boot sequence (?),
> between FS-cache lines and usb ones: 
> 
> Oct 27 21:54:36 deiphobe kernel: [    8.742105] FS-Cache: N-key=[8] '020001bdc0a800fe'
> 
> Oct 27 21:54:40 deiphobe kernel: [   12.768168] usb 3-4.1: reset high- speed USB device number 5 using xhci_hcd
> Oct 27 21:54:45 deiphobe kernel: [   18.294126] snd-bebob fw1.0: transaction failed: no ack
> Oct 27 21:54:45 deiphobe kernel: [   18.294167] snd-bebob fw1.0: fail to get section type for isoc out plug 0: -5
> Oct 27 21:54:45 deiphobe kernel: [   18.294172] snd-bebob fw1.0: fail to run AMDTP slave stream:-5
> Oct 27 21:54:45 deiphobe kernel: [   18.306399] firewire_ohci 0000:05:01.0: DMA context still active (0x00000411)
> Oct 27 21:54:45 deiphobe kernel: [   18.318425] firewire_ohci 0000:05:01.0: DMA context still active (0x00000411)
> Oct 27 21:54:47 deiphobe kernel: [   20.311440] irq_handler: 20 callbacks suppressed
> Oct 27 21:54:47 deiphobe kernel: [   20.311441] firewire_ohci 0000:05:01.0: isochronous cycle inconsistent
> Oct 27 21:54:48 deiphobe kernel: [   21.322730] firewire_core 0000:05:01.0: phy config: new root=ffc1, gap_count=5
> 
> Oct 27 21:54:50 deiphobe kernel: [   22.970251] rfkill: input handler disabled
> Oct 27 20:55:10 deiphobe kernel: [   42.697284] usb 3-4.1: reset high- speed USB device number 5 using xhci_hcd

IEEE 1394 bus 'bus-reset' state. Just before/after the bus-reset, any
functionality easily fails. It's better to plug-in the device enough
after bootup.


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

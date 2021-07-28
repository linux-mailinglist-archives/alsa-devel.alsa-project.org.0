Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D993D965A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 22:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 498641F70;
	Wed, 28 Jul 2021 22:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 498641F70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627502728;
	bh=cvg6iF0ciHn4ceflNy/SW3Ujw8uBFV1qqmlzCW0GonI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nDcINXRZdFbuIaBJv1W+8uxTswl23s0dbwNM/4K37mhTjBjP9NFGKUcKbAGEqqD05
	 eboBybh7x3hL1h85MLuuyOnwO1Y4v/OJd9cD0gyyKffXXE7KfJUZvmc6Mpy1qauk4D
	 fORkju0fuwTt7v0hhJVrZ8ugAkS3G13KvLoIsC/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88B55F8025E;
	Wed, 28 Jul 2021 22:04:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28567F8025A; Wed, 28 Jul 2021 22:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA3D3F8020D
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 22:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA3D3F8020D
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id 6F2F340755F2;
 Wed, 28 Jul 2021 20:03:45 +0000 (UTC)
Date: Wed, 28 Jul 2021 23:03:45 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda/realtek: add mic quirk for Acer SF314-42
In-Reply-To: <s5h7dhabcck.wl-tiwai@suse.de>
Message-ID: <alpine.LNX.2.20.13.2107282230090.20403@monopod.intra.ispras.ru>
References: <20210721170141.24807-1-amonakov@ispras.ru>
 <s5h7dhabcck.wl-tiwai@suse.de>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Chris Chiu <chris.chiu@canonical.com>, Jian-Hong Pan <jhp@endlessos.org>,
 Kailang Yang <kailang@realtek.com>, alsa-devel@alsa-project.org,
 Jeremy Szu <jeremy.szu@canonical.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>
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

On Wed, 28 Jul 2021, Takashi Iwai wrote:

> > 1) at high enough gain, recording the microphone is picking up what is
> > being played via the headphones; maybe it's supposed to be like that,
> > but it surprised me;
> 
> Hrm, that doesn't sound right.  Some internal loopback in the codec?
> Dunno.  It doesn't pick up the sound physically, right?

How can I tell? If I don't have anything plugged into the jack, playback
uses the built-in speakers. In that case there's no feedback. And if I
plug in a headset or common headphones, then built-in speakers are automatically
muted, and recording the mic can pick up the output signal.

Is there a way to forcefully direct output to the jack instead of built-in
speakers even when there isn't anything plugged in?

I am sure it is not picking the sound over the air, but I'm considering it's
picking it up electrically near the jack somehow.

> > 2) there is a very noticeable "pop" when plugging the headset in/out,
> > accompanied by
> > 
> > pcieport 0000:00:08.1: PME: Spurious native interrupt!
> > pcieport 0000:00:08.1: PME: Spurious native interrupt!
> > 
> > in dmesg. I'd appreciate info and any help about this issue.
> 
> The pop noise is often a thing with the codec and there are a bunch of
> different workarounds found in the driver.  But the spurious interrupt
> is more worrisome.  Is the PCI slot corresponding to the HD-audio
> controller?

No, it's actually the PCI bridge under which the HDA core resides:

00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal PCIe GPP Bridge to Bus
00:08.1/03:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) HD Audio Controller

Note that I have autosuspend enabled for PCI devices. If I disable PCI
autosuspend for the 03:00.6 HDA device, there's no "pop" and no spurious
interrupt. My understanding that the chip generates a power management event
when it senses a jack plug/unplug event while suspended. Apparently something
about the PME interrupt is not fully in order?

> As of now, I'm inclined to take your patch as is, at least as a
> first-aid workaround.  Let's see whether we get a better development
> soonish.

*nod*, I will appreciate it!

Thank you.
Alexander

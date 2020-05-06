Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB49D1C758F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 17:58:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39E9916C0;
	Wed,  6 May 2020 17:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39E9916C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588780711;
	bh=b9d1J/Z04fO1DuHviDd0mCvQLX7g4TZqGjaznF1ojwE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=QDIFPD0EnfGvLACFlfpUn/MVFfVe5HxuSwAg8KUnx0V9NzylQdaVz4SU03uWA7VyC
	 dwOBSTaNPa/1d36FjCXMQzfwAlRKztiA2q2wYLU82WLTqJ4wGR13ud6oWnl8t+IRI5
	 XqBba7hS9KOnmQ0RjfzALszdkL5zhq9lZ7TpK93o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 577A8F80253;
	Wed,  6 May 2020 17:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 127A8F80249; Wed,  6 May 2020 17:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47929F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 17:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47929F800DF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6765ABB2;
 Wed,  6 May 2020 15:56:40 +0000 (UTC)
Message-ID: <28e3762c1a5bc5959d90e1c34d281eeac1dce528.camel@suse.com>
Subject: Re: snd_dice: Clicking artifacts with TC StudioKonnekt 48
From: Scott Bahling <sbahling@suse.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Wed, 06 May 2020 17:56:37 +0200
In-Reply-To: <20200222012510.GA4883@laptop>
References: <921a3b13-b44e-3300-bb72-84cbc9e3dd88@apparatus.de>
 <20200222012510.GA4883@laptop>
Organization: SUSE Software Solutions Germany GmbH
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "\(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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
Reply-To: sbahling@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Takashi,

On Sat, 2020-02-22 at 10:25 +0900, Takashi Sakamoto wrote:
> Hi,
> 
> On Thu, Feb 20, 2020 at 09:34:02PM +0100, Mathias Buhr wrote:
> > Hi,
> > 
> > thanks to this group, both of my firewire interfaces are (almost)
> > working! Big thank you!
> > 
> > While the TC Konnekt 24D works fine (playback and recording), the
> > StudioKonnekt 48 produces clicking artifacts during playback when using
> > snd_dice. This interface is working flawless on Windows and on a
> > Jack/FFADO combination. This artifact occurs in all use cases (alsa via
> > aplay, pulseaudio and jack) and does not seem to be in recorded streams.
> > After recording the playback with another device, it looks like the
> > level of the artifact is scaling with the signal and its interval is
> > interestingly 256ms. Is there anything I can do to further debug this
> > issue? Capture firewire packets? I would love to get this device fully
> > working.
> > 
> > I'm using kernel version 5.5.4 but this issue has been there for a long
> > time.
> > 
> > Thanks,
> > 
> > Mathias
> 
> Yes. ALSA dice driver brings the issue to your unit regardless of XRUNs.
> I can see this issue for recent 5 years (so long time).
> 
> At present, ALSA dice driver is designed with the expectation that the
> devices performs 'clock-recovery' with timestamp in isochronous packets
> transmitted by the driver. The driver transfers PCM frames with
> timestamps as exactly the same number as configured sampling rate; e.g.
> 48,000 frames/sec or 44,096/44,104 frames/sec.
> 
> However, many devices including yours don't perform it actually. For
> example, all of devices from TC Electronics don't perform it:
> 
>  - Konnekt 24D (Dice II STD ASIC)
>  - Konnekt 8 (Dice II STD ASIC)
>  - Konnkt Live (Dice II STD ASIC)
>  - Studio Konnekt 48 (DICE II STD and DICE Mini ASICs)
>  - Impact Twin (DICE II STD ASIC)
>  - Desktop Konnekt 6 (DICE Mini ASIC)
>  - Digital Konnekt 32 (DICE II STD)
> 
> 
> They work with sampling clock independent of the timestamp from driver.
> Thus it's not possible to synchronize multiple devices on the same
> IEEE 1394 bus (this is against the 'myth' that the devices can be
> synchronized for its internal sampling, but it's the fact).
> 
> Instead, the device expects the driver to perform the 'clock-recovery'
> and transfer PCM frames as mostly the same as the calculated sampling
> rate. Even if the device is configured to handle 48,000 PCM frames per
> second, the device actually handles less or more PCM frames; e.g.
> 47,988, 47,992 or 48,008, 48,016. Unfortunately, current ALSA dice
> driver is not designed to work for it. In device internal, it handles
> surplus PCM frames or the lack of PCM frames for several seconds, then
> causes noisy sound I guess.

I was just about to start a thread related to a very similar issue I'm
seeing with my Tascam FW-1884. But in my case I'm only running one
device/clock source. Could the clock-recovery issue also be affecting a
single FW-1884 device?

In my case I'm witnessing exactly one frame being dropped at a consistent
interval of about 240ms at 96000 frames per second and 480ms at 48000 frames
per second.

> The libffado2 is programmed for the 'clock-recovery'. On the other hand,
> it includes design mistake to aggregate several types of devices and give
> abstracted device to applications such as jackd. When considering the
> above design of actual hardware, the design is not good since each actual
> hardware works independent sampling clocks.

I have not tried FFADO yet. I will see if the issue goes away with FFADO.

Best Regards,

Scott


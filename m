Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5641C902E
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 16:43:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC68182D;
	Thu,  7 May 2020 16:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC68182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588862599;
	bh=NZJvvJbqmX6wLG3Giqwr70z/QoJektnTGk4keRPeGL8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=B0ucVYkKBPzjcjEcFEJcmzZj+Ktgd48q6RhVh4crhru/4cY+RGKyaTYKj8XzFN8hH
	 3uA5MnX7yFf2HjHnfwRyFKlCynbcMW57C2/cO5083duFd4QmthhEwkk0nNOuDscaNy
	 sJIn+Ey+/fHDoT5AUoElsIKaG5I9Gp0Z3TEGZ9+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 622EFF80162;
	Thu,  7 May 2020 16:41:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 594BAF8015F; Thu,  7 May 2020 16:41:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B91BF800F6
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 16:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B91BF800F6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6B2B6AD6B;
 Thu,  7 May 2020 14:41:34 +0000 (UTC)
Message-ID: <de6f9ed5150553954bbb2deab4d0ddb9406c01a4.camel@suse.com>
Subject: Re: Missing frames on Tascam FW-1884 (was Re: snd_dice: Clicking
 artifacts with TC StudioKonnekt 48)
From: Scott Bahling <sbahling@suse.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Thu, 07 May 2020 16:41:30 +0200
In-Reply-To: <20200507133847.GA310153@workstation>
References: <921a3b13-b44e-3300-bb72-84cbc9e3dd88@apparatus.de>
 <20200222012510.GA4883@laptop>
 <28e3762c1a5bc5959d90e1c34d281eeac1dce528.camel@suse.com>
 <20200507133847.GA310153@workstation>
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

On Thu, 2020-05-07 at 22:38 +0900, Takashi Sakamoto wrote:
> Hi Scott,
> 
> On Wed, May 06, 2020 at 05:56:37PM +0200, Scott Bahling wrote:
> > Hi Takashi,
> > 
> > On Sat, 2020-02-22 at 10:25 +0900, Takashi Sakamoto wrote:
> > > Hi,
> > > 
> > > On Thu, Feb 20, 2020 at 09:34:02PM +0100, Mathias Buhr wrote:
> > > > Hi,
> > > > 
> > > > thanks to this group, both of my firewire interfaces are (almost)
> > > > working! Big thank you!
> > > > 
> > > > While the TC Konnekt 24D works fine (playback and recording), the
> > > > StudioKonnekt 48 produces clicking artifacts during playback when using
> > > > snd_dice. This interface is working flawless on Windows and on a
> > > > Jack/FFADO combination. This artifact occurs in all use cases (alsa via
> > > > aplay, pulseaudio and jack) and does not seem to be in recorded streams.
> > > > After recording the playback with another device, it looks like the
> > > > level of the artifact is scaling with the signal and its interval is
> > > > interestingly 256ms. Is there anything I can do to further debug this
> > > > issue? Capture firewire packets? I would love to get this device fully
> > > > working.
> > > > 
> > > > I'm using kernel version 5.5.4 but this issue has been there for a long
> > > > time.
> > > > 
> > > > Thanks,
> > > > 
> > > > Mathias
> > > 
> > > Yes. ALSA dice driver brings the issue to your unit regardless of XRUNs.
> > > I can see this issue for recent 5 years (so long time).
> > > 
> > > At present, ALSA dice driver is designed with the expectation that the
> > > devices performs 'clock-recovery' with timestamp in isochronous packets
> > > transmitted by the driver. The driver transfers PCM frames with
> > > timestamps as exactly the same number as configured sampling rate; e.g.
> > > 48,000 frames/sec or 44,096/44,104 frames/sec.
> > > 
> > > However, many devices including yours don't perform it actually. For
> > > example, all of devices from TC Electronics don't perform it:
> > > 
> > >  - Konnekt 24D (Dice II STD ASIC)
> > >  - Konnekt 8 (Dice II STD ASIC)
> > >  - Konnkt Live (Dice II STD ASIC)
> > >  - Studio Konnekt 48 (DICE II STD and DICE Mini ASICs)
> > >  - Impact Twin (DICE II STD ASIC)
> > >  - Desktop Konnekt 6 (DICE Mini ASIC)
> > >  - Digital Konnekt 32 (DICE II STD)
> > > 
> > > 
> > > They work with sampling clock independent of the timestamp from driver.
> > > Thus it's not possible to synchronize multiple devices on the same
> > > IEEE 1394 bus (this is against the 'myth' that the devices can be
> > > synchronized for its internal sampling, but it's the fact).
> > > 
> > > Instead, the device expects the driver to perform the 'clock-recovery'
> > > and transfer PCM frames as mostly the same as the calculated sampling
> > > rate. Even if the device is configured to handle 48,000 PCM frames per
> > > second, the device actually handles less or more PCM frames; e.g.
> > > 47,988, 47,992 or 48,008, 48,016. Unfortunately, current ALSA dice
> > > driver is not designed to work for it. In device internal, it handles
> > > surplus PCM frames or the lack of PCM frames for several seconds, then
> > > causes noisy sound I guess.
> > 
> > I was just about to start a thread related to a very similar issue I'm
> > seeing with my Tascam FW-1884. But in my case I'm only running one
> > device/clock source. Could the clock-recovery issue also be affecting a
> > single FW-1884 device?
> > 
> > In my case I'm witnessing exactly one frame being dropped at a consistent
> > interval of about 240ms at 96000 frames per second and 480ms at 48000 frames
> > per second.
> 
> Yes. Below table is the result to parse log of packet streaming from
> FW-1884 in 48.0 kHz sampling transfer frequency. The left most column is
> the total number of events (=PCM samples) in second, and the middle and
> right most are sec and cycle on IEEE 1394 isochronous communication.
> You can see the device doesn't transfers as the same packets as the
> sampling transfer frequency.
> 
> events | sec | cycle
> ====================
>  47998 |  0  | 2817
>  47999 |  1  | 2817
>  47998 |  2  | 2817
>  47999 |  3  | 2817
>  47999 |  4  | 2817
>  47998 |  5  | 2817
>  47999 |  6  | 2817
>  47999 |  7  | 2817

Very interesting. How are you collecting that data? And is this just the
result of the computer clock and the FW-1884 internal clock not being in
sync?

> It's likely that the gap between 48000 and 47998-47999 causes the drop
> frame, because current implementation of ALSA IEC 61883-1/6 packet
> streaming engine transfers isochronous packets which includes exactly
> the same events as configured sampling transfer frequency.
> 
> But here I have a question about your way to confirm the drop. Do you
> use any way to loopback analog/digital audio output to input or
> something else?

I was running a square wave signal from Audacity to the outputs of the FW-
1884 and was interested in the bandwidth and slew rates of the analog chain
by viewing the resulting wave form of the analog out on an oscilloscope. It
was during that testing when I noticed the wave form jumping to the left
periodically. Narrowing in on the distance in time of the waveform shift, it
turned out to be the time of one frame. I also looped the signal back into
an input of the device and recorded the audio in which I then visually
counted samples to verified what I was seeing on the oscilloscope. Also
running that input through the baudline spectrum analyzer it is easy to see
the glitches reliably every ~240ms.

I verified that capture is not affected - I only see the missing sample on
playback.

I tested on another computer and the effect was also there, but the interval
between dropped frames was 100ms longer (~340ms) than on the first computer.

> > > The libffado2 is programmed for the 'clock-recovery'. On the other hand,
> > > it includes design mistake to aggregate several types of devices and give
> > > abstracted device to applications such as jackd. When considering the
> > > above design of actual hardware, the design is not good since each actual
> > > hardware works independent sampling clocks.
> > 
> > I have not tried FFADO yet. I will see if the issue goes away with FFADO.
> 
> TASCAM FireWire series is not supported by libffado2.

Yes, I noticed that right after I sent my email.

Best Regards,

Scott


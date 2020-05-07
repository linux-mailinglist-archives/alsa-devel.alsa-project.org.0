Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D20D1C8CA2
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 15:40:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCFFE1817;
	Thu,  7 May 2020 15:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCFFE1817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588858842;
	bh=iKRZQnA533brtZRLUw54/TS2LcnD4krtI4KTro++i6s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojd23YJtkmaxvGCUvp5Gs5SI+c4YaP4zrz3Tj/s9x5NX4e62D/BYRGSSyXofl+X9/
	 wJfWHCBtD5wErKECVHyPExQiun7yoc/OT/TsM16iyuuPPc7OXIPyftelXkNGtDkEyc
	 7gVYp9WG3Ly1diz8guRPpV8K5/uoLkYI7xcRKtWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87BDAF80162;
	Thu,  7 May 2020 15:39:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA55FF8015F; Thu,  7 May 2020 15:38:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3D85F800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 15:38:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3D85F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ULqE5Zvq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fpbgtasu"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 72BD15C0183;
 Thu,  7 May 2020 09:38:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 07 May 2020 09:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=AHHhvifD/GSPWS/GtBZoXg8zmD8
 PdxKlzV1xm/9zF0Y=; b=ULqE5ZvqUVkxO5VkYRS/YFlErngm5Q8KC52nxIrXBuG
 hzXmpcoH9sDaK2fHsk8SE2IpPbjxHo6pffzL8Ys1bJaYZ/WSbcwX6aM8NZeriEIQ
 TDMOvMtCgKaW+goxnjdvEBiDFlcga6hevv0s/+k9/jr0+9rkPz9o37AzznEXTbdq
 SzdD4kh5d9L05OkolEz4dP8zb5wDpOSGvFweX0xnxLeF1Q07g90eopk0jEFwEjGM
 3XDM4L2hFivu/QnKG5P5+yMy8UsccsO26qDE8rxxcjqQCKRqqgjQyINirGij3HhO
 Ofui44uxi5WqyuiBL+EZ5UfTa3JOXfxl/ftdL8oorSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AHHhvi
 fD/GSPWS/GtBZoXg8zmD8PdxKlzV1xm/9zF0Y=; b=fpbgtasuZPB6281v2lRhU3
 EBRAeTmbrAjDBsQyGnFnrXXTp7yk7DZPq6/0/pzEDdK+h4iVIfxj/jSvS9tHNcpW
 64+PcFuqb+S5LESpf6s6H925AwPNzbrs5SSGePbdbQPFYxh7lQ6IyQWFYEg6RYKF
 a5AT5fSBwtanRnrqfQoyghcAaP1k/1zTWwaS0fCBywOuDbhA3IZqx0A+biujw9Dr
 XrAsSs869sAyn8NiA8JmYt/5sbtmsAZwBD83QWHr3NeWXzeovTES5goWQmohSF+e
 YZdnF2wE/K8T7EyonBsW/KgwbtAXGN0VNWsVSKvyRctNExnHVnnWQDsbzedKPaug
 ==
X-ME-Sender: <xms:aw-0Xkj4EELvBkkrWnDCjT-88bQh3dK8v55h5-riF3yW792gYEDohg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedtgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
 tdegteejkedvfeegfefhnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:aw-0XngOZl2gc80wqNGv0R-ueSvfY-HyAtQzhUvLABSEe6n1EBa4tw>
 <xmx:aw-0XpCWOSIiQ6dqkQW_TO-MTfGjEDdbv2S43YBkR41DOlTmdbFpVA>
 <xmx:aw-0Xn9C9xfBt6jZK_fwgaw2GTvCcB-ifTLF2jKj3iQ_R_r9gt76yg>
 <xmx:aw-0XgOq6mm8EWznLFpZjGwyJMUYkmGHCA9hhn5vmYwhQzEAsiVA9A>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 300513280063;
 Thu,  7 May 2020 09:38:49 -0400 (EDT)
Date: Thu, 7 May 2020 22:38:47 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Scott Bahling <sbahling@suse.com>
Subject: Re: snd_dice: Clicking artifacts with TC StudioKonnekt 48
Message-ID: <20200507133847.GA310153@workstation>
Mail-Followup-To: Scott Bahling <sbahling@suse.com>,
 "(alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
References: <921a3b13-b44e-3300-bb72-84cbc9e3dd88@apparatus.de>
 <20200222012510.GA4883@laptop>
 <28e3762c1a5bc5959d90e1c34d281eeac1dce528.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28e3762c1a5bc5959d90e1c34d281eeac1dce528.camel@suse.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Scott,

On Wed, May 06, 2020 at 05:56:37PM +0200, Scott Bahling wrote:
> Hi Takashi,
> 
> On Sat, 2020-02-22 at 10:25 +0900, Takashi Sakamoto wrote:
> > Hi,
> > 
> > On Thu, Feb 20, 2020 at 09:34:02PM +0100, Mathias Buhr wrote:
> > > Hi,
> > > 
> > > thanks to this group, both of my firewire interfaces are (almost)
> > > working! Big thank you!
> > > 
> > > While the TC Konnekt 24D works fine (playback and recording), the
> > > StudioKonnekt 48 produces clicking artifacts during playback when using
> > > snd_dice. This interface is working flawless on Windows and on a
> > > Jack/FFADO combination. This artifact occurs in all use cases (alsa via
> > > aplay, pulseaudio and jack) and does not seem to be in recorded streams.
> > > After recording the playback with another device, it looks like the
> > > level of the artifact is scaling with the signal and its interval is
> > > interestingly 256ms. Is there anything I can do to further debug this
> > > issue? Capture firewire packets? I would love to get this device fully
> > > working.
> > > 
> > > I'm using kernel version 5.5.4 but this issue has been there for a long
> > > time.
> > > 
> > > Thanks,
> > > 
> > > Mathias
> > 
> > Yes. ALSA dice driver brings the issue to your unit regardless of XRUNs.
> > I can see this issue for recent 5 years (so long time).
> > 
> > At present, ALSA dice driver is designed with the expectation that the
> > devices performs 'clock-recovery' with timestamp in isochronous packets
> > transmitted by the driver. The driver transfers PCM frames with
> > timestamps as exactly the same number as configured sampling rate; e.g.
> > 48,000 frames/sec or 44,096/44,104 frames/sec.
> > 
> > However, many devices including yours don't perform it actually. For
> > example, all of devices from TC Electronics don't perform it:
> > 
> >  - Konnekt 24D (Dice II STD ASIC)
> >  - Konnekt 8 (Dice II STD ASIC)
> >  - Konnkt Live (Dice II STD ASIC)
> >  - Studio Konnekt 48 (DICE II STD and DICE Mini ASICs)
> >  - Impact Twin (DICE II STD ASIC)
> >  - Desktop Konnekt 6 (DICE Mini ASIC)
> >  - Digital Konnekt 32 (DICE II STD)
> > 
> > 
> > They work with sampling clock independent of the timestamp from driver.
> > Thus it's not possible to synchronize multiple devices on the same
> > IEEE 1394 bus (this is against the 'myth' that the devices can be
> > synchronized for its internal sampling, but it's the fact).
> > 
> > Instead, the device expects the driver to perform the 'clock-recovery'
> > and transfer PCM frames as mostly the same as the calculated sampling
> > rate. Even if the device is configured to handle 48,000 PCM frames per
> > second, the device actually handles less or more PCM frames; e.g.
> > 47,988, 47,992 or 48,008, 48,016. Unfortunately, current ALSA dice
> > driver is not designed to work for it. In device internal, it handles
> > surplus PCM frames or the lack of PCM frames for several seconds, then
> > causes noisy sound I guess.
> 
> I was just about to start a thread related to a very similar issue I'm
> seeing with my Tascam FW-1884. But in my case I'm only running one
> device/clock source. Could the clock-recovery issue also be affecting a
> single FW-1884 device?
>
> In my case I'm witnessing exactly one frame being dropped at a consistent
> interval of about 240ms at 96000 frames per second and 480ms at 48000 frames
> per second.

Yes. Below table is the result to parse log of packet streaming from
FW-1884 in 48.0 kHz sampling transfer frequency. The left most column is
the total number of events (=PCM samples) in second, and the middle and
right most are sec and cycle on IEEE 1394 isochronous communication.
You can see the device doesn't transfers as the same packets as the
sampling transfer frequency.

events | sec | cycle
====================
 47998 |  0  | 2817
 47999 |  1  | 2817
 47998 |  2  | 2817
 47999 |  3  | 2817
 47999 |  4  | 2817
 47998 |  5  | 2817
 47999 |  6  | 2817
 47999 |  7  | 2817

It's likely that the gap between 48000 and 47998-47999 causes the drop
frame, because current implementation of ALSA IEC 61883-1/6 packet
streaming engine transfers isochronous packets which includes exactly
the same events as configured sampling transfer frequency.

But here I have a question about your way to confirm the drop. Do you
use any way to loopback analog/digital audio output to input or
something else?

> > The libffado2 is programmed for the 'clock-recovery'. On the other hand,
> > it includes design mistake to aggregate several types of devices and give
> > abstracted device to applications such as jackd. When considering the
> > above design of actual hardware, the design is not good since each actual
> > hardware works independent sampling clocks.
> 
> I have not tried FFADO yet. I will see if the issue goes away with FFADO.

TASCAM FireWire series is not supported by libffado2.


Regards

Takashi Sakamoto

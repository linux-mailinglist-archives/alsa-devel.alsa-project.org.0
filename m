Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798B1CCB75
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 16:04:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C4F315E5;
	Sun, 10 May 2020 16:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C4F315E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589119444;
	bh=M8DzQRpE4zt8hbxZnFmCziRkGC2cQkygf+odaXl4hsQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JCd+Po1T3GweNG1n595dF94Oex5sG2eTqUJv/vtIynTLhGlfNSQ4goi2HTbMlA3nS
	 cuXrzPyuzPX98mcrX76ZtK1xsKDdG1GNQ+4APK+OzigETBs23GwBQwJWyt/WBCDFN5
	 +JtEM/jx+tF8dJLxuB0FS4jpR2Nz8V0vsbQ8UOCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16C69F80158;
	Sun, 10 May 2020 16:02:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC9B0F80158; Sun, 10 May 2020 15:59:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74352F800BF
 for <alsa-devel@alsa-project.org>; Sun, 10 May 2020 15:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74352F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QlZDYeqw"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="u1HnhHsd"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 7E262386;
 Sun, 10 May 2020 09:58:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 10 May 2020 09:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=9WTWn5llmg2VDmcv0hBuGvKXm5m
 H/uf7hQz6SPB4Qw0=; b=QlZDYeqwPkJM7z35CrRe8PXwxvX+/BFUGjWxRNhV/aj
 WFdHR/ApeAO7GU5SmBVow6Vq3dYjdSQR/u51eTjY4yHNjay8UOyPK2W9jHAdOaqx
 upS36uqy0jF0wdQtBxDLOinnsIamc3njxbcCipgrT23bgEK5qA8OBp+uR8vUP+uh
 uQGUvtquSHC0phKadj0oFyrB6w0wbG3Kb2v7UJGlN9rEDlHygpsKexgSw3wihv55
 y+ooX/IXJ40omjXsxC+MLfhjCAeUcQX5JNOpR4Lc7wcq4rqBzn0J7B/ZsEVkPsOR
 zqdqDX3jnFz4ITm+sXWGpi171F+saHT/w0dU4KTQkXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9WTWn5
 llmg2VDmcv0hBuGvKXm5mH/uf7hQz6SPB4Qw0=; b=u1HnhHsdzHTv3GunDYWShX
 HAhwHrCVfC3eTY2gOeGGbAwV1Fv67VcJFnFYUMAvS691bxKTpECGN1sYJ/miFphf
 qNG9kt+UMB2AxGthg+xSSj4eCAFzkB3LpEKrJylSOKm+e5PHMmBK1CeswapKBEr0
 N+obDLaP26gR9a/n7HigPPqsM2WG7d4q0t/p+YEZjdVM+UgJZGqjfZ+Ie4b7dgoF
 tb+3lQTSHI1DGirhdzIo/t3aTTOzeyXp2t6Q8L0E5FIok0xA0oOSs/cgUPb2edla
 50QKGqeSZLnfIsFkzCyel7qbVcktsYEa5M7a76U1NrdoNjlmrxXzhQAiyfQEqoVA
 ==
X-ME-Sender: <xms:jQi4XtlOTvEOoV7TErY1WMGUqNSuJE1Nh-KqjAi4WVsYpb1ga_BHbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepgffhfeevffdtveffveehvdejjeevueeiffdvtdeftedt
 keegkefhgeekjeejvdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuh
 gsrdgtohhmpddufeelgehtrgdrohhrghdpuhhssgdrohhrghenucfkphepudektddrvdef
 hedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:jQi4XvzlHQzIhjxafryLsM1LD8fCuT8kPdZuD2Km8Okx0B3CCu2Xxw>
 <xmx:jQi4XoummkPiqrDeYgxJmvPcCtg11XcSP9g_eujUbh0xKe5-Wz1_Xw>
 <xmx:jQi4XksDVPFfgLIILLvu69bBO23yLc51nak9GzsZ2Lbourx4t18Q9Q>
 <xmx:jgi4XnxCZZvJPc1Fis4HSSWWJQPhjkp905XNl10wFBz3qofej3LyMg>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 117C83066260;
 Sun, 10 May 2020 09:58:36 -0400 (EDT)
Date: Sun, 10 May 2020 22:58:34 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Scott Bahling <sbahling@suse.com>
Subject: Re: Missing frames on Tascam FW-1884 (was Re: snd_dice: Clicking
 artifacts with TC StudioKonnekt 48)
Message-ID: <20200510135834.GA140026@workstation>
Mail-Followup-To: Scott Bahling <sbahling@suse.com>,
 "(alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
References: <921a3b13-b44e-3300-bb72-84cbc9e3dd88@apparatus.de>
 <20200222012510.GA4883@laptop>
 <28e3762c1a5bc5959d90e1c34d281eeac1dce528.camel@suse.com>
 <20200507133847.GA310153@workstation>
 <de6f9ed5150553954bbb2deab4d0ddb9406c01a4.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de6f9ed5150553954bbb2deab4d0ddb9406c01a4.camel@suse.com>
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

Sorry to be late.

On Thu, May 07, 2020 at 04:41:30PM +0200, Scott Bahling wrote:
> > > I was just about to start a thread related to a very similar issue I'm
> > > seeing with my Tascam FW-1884. But in my case I'm only running one
> > > device/clock source. Could the clock-recovery issue also be affecting a
> > > single FW-1884 device?
> > > 
> > > In my case I'm witnessing exactly one frame being dropped at a consistent
> > > interval of about 240ms at 96000 frames per second and 480ms at 48000 frames
> > > per second.
> > 
> > Yes. Below table is the result to parse log of packet streaming from
> > FW-1884 in 48.0 kHz sampling transfer frequency. The left most column is
> > the total number of events (=PCM samples) in second, and the middle and
> > right most are sec and cycle on IEEE 1394 isochronous communication.
> > You can see the device doesn't transfers as the same packets as the
> > sampling transfer frequency.
> > 
> > events | sec | cycle
> > ====================
> >  47998 |  0  | 2817
> >  47999 |  1  | 2817
> >  47998 |  2  | 2817
> >  47999 |  3  | 2817
> >  47999 |  4  | 2817
> >  47998 |  5  | 2817
> >  47999 |  6  | 2817
> >  47999 |  7  | 2817
> 
> Very interesting. How are you collecting that data? And is this just the
> result of the computer clock and the FW-1884 internal clock not being in
> sync?
 
ALSA IEC 61883-1/6 packet streaming engine have a tracepoints event;
snd_firewire_lib:amdtp_packet. You can get the event log by perf tools
which is a part of Linux kernel source[1] and uses perf_event_open(2)
system call, by trace-cmd tools[2] which uses tracefs, or by operate
nodes on debugfs directly. Then you can calculate with the log for the
above table.

The log looks like:

$ perf record -e snd_firewire_lib:amdtp_packet
(ctl + C)
$ perf report -s time,trace --stdio
...
01 3629 ffc1 ffc0 00 014 06 000 00 1 00 1 2 0 0 144 2 250 0
01 3630 ffc1 ffc0 00 014 06 006 01 1 01 1 2 0 6 144 2 18 0
01 3631 ffc1 ffc0 00 014 06 012 02 1 02 1 2 0 12 144 2 38 0
01 3632 ffc1 ffc0 00 014 06 018 03 1 03 1 2 0 18 144 2 255 255
01 3633 ffc1 ffc0 00 014 06 024 04 1 04 1 2 0 24 144 2 58 0
01 3634 ffc1 ffc0 00 014 06 030 05 1 05 1 2 0 30 144 2 82 0
01 3635 ffc1 ffc0 00 014 06 036 06 1 06 1 2 0 36 144 2 102 0
01 3636 ffc1 ffc0 00 014 06 042 07 1 07 1 2 0 42 144 2 255 255

The legend of each column:

0 (decimal): second part of isoc cycle
1 (decimal): cycle part of isoc cycle
2 (hexadecimal): transmitter node ID
3 (hexadecimal): receiver node ID
4 (decimal): isoc channel
5 (decimal): the number of quadlets in payload
6 (decimal): the number of data blocks in payload
7 (decimal): the total number of data blocks rounded by 0xff
8.. : (omit)

When accumulating the number of data blocks every 8,000 cycles, it
represents the number of data blocks transmitted per second.
'lsfirewirephy' utility in linux-firewire-utils[3] helps you to
distinguish the node ID (0xffcX):

$ lsfirewirephy
bus 0, node 0: 080028:424296  Texas Instruments TSB41AB1/2
bus 0, node 1: 080028:831307  Texas Instruments TSB81BA3E/XIO2213

The accumulated number is effective sampling rate in a view of bus
clock on IEEE 1394, and ALSA IEC 61883-1/6 packet streaming engine
is designed to packetize according to the clock. The engine also
manages ALSA PCM applications for how much PCM frames should be
handled in process time.

Ideally, the effective sampling rate is the same as configured sampling
rate; e.g. 48,000. For playback direction, ALSA IEC 61883-1/6 engine
packetizes with PCM frames as the ideal sampling rate. (If you're
interested in implementation, please see 'calculate_syt_offset()' and
'calculate_data_blocks()' in 'sound/firewire/amdtp-stream.c'[1])

On the other hand, for capture direction, the device doesn't transmit
packets with PCM frames as the ideal sampling rate. The effective
sampling rate is slightly different from the ideal one.

> > It's likely that the gap between 48000 and 47998-47999 causes the drop
> > frame, because current implementation of ALSA IEC 61883-1/6 packet
> > streaming engine transfers isochronous packets which includes exactly
> > the same events as configured sampling transfer frequency.
> > 
> > But here I have a question about your way to confirm the drop. Do you
> > use any way to loopback analog/digital audio output to input or
> > something else?
> 
> I was running a square wave signal from Audacity to the outputs of the FW-
> 1884 and was interested in the bandwidth and slew rates of the analog chain
> by viewing the resulting wave form of the analog out on an oscilloscope. It
> was during that testing when I noticed the wave form jumping to the left
> periodically. Narrowing in on the distance in time of the waveform shift, it
> turned out to be the time of one frame. I also looped the signal back into
> an input of the device and recorded the audio in which I then visually
> counted samples to verified what I was seeing on the oscilloscope. Also
> running that input through the baudline spectrum analyzer it is easy to see
> the glitches reliably every ~240ms.
> 
> I verified that capture is not affected - I only see the missing sample on
> playback.
> 
> I tested on another computer and the effect was also there, but the interval
> between dropped frames was 100ms longer (~340ms) than on the first computer.

Thanks for the great investigation. Roughly calculation, 240msec for
96.0 kHz equals to 1,920 isoc cycles and 480msec for 48.0 kHz equalds to
3,840 isoc cycles. I need a bit time to consider about the mechanism
(it's blackbox to me).

By the way, in my opinion, ALSA IEC 61883-1/6 packet streaming engine is
need to be enhanced to run according to the effective sampling rate
instead of the ideal one for playback direction if capture direction is
available.

For your information, specification for basic protocol of the packet
streaming is public and available in 1394TA website[5]. In clause
'7.3 Time stamp processing' of the specification, we can see "If a
function block receives a CIP, processes it and subsequently
re-transmits it, then the SYT of the outgoing CIP shall be the sum of
the incoming SYT and the processing delay."

Although the protocol is designed to transfer event data with presentation
timestamp, Tascam FireWire series doesn't use the timestamp synchronization
as well as Fireworks, Digi00x, Fireface. In the cases, I think the sequence
of data blocks per packet is important to synchronization too.

(I note that in a case of USB Audio, the similar way to synchronize
device and host driver is described as 'asynchronous' audio synchronous
type, in clause '3.11.4.3 SOURCE AND SINK ENDPOINTS' of
'USB Audio Device Class Rev.3.0'[6]. The description is easier to
understand.)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf
[2] https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
[3] https://github.com/cladisch/linux-firewire-utils
[4] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/amdtp-stream.c
[5] Audio and Music Data Transmission Protocol 2.2 Revision 1.1
    http://1394ta.org/wp-content/uploads/2015/07/2009013.pdf
[6] Let you search 'USB Audio Devices Rev. 3.0 and Adopters Agreement' in
    document library in usb.org.
    https://usb.org/documents


Regards

Takashi Sakamoto

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D9345626
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 04:18:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B63EE15E5;
	Tue, 23 Mar 2021 04:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B63EE15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616469494;
	bh=bXoyzijgBoPo8rt+PF+2QGmbi1QK8KIoHkZojlNkh14=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=caRkCZ7vnB/zBoqPpB/xn/kh9l2hYqwSTbpwY+08qwG/F8EMLT50IPG3K3LSQp1vq
	 jz+esgguDbHe4kzkid+mqeqriu9Ja/xCjq6AVRq8kmVtkmTdRZ6hmqfybqaeqGolId
	 G9q3HM9v1ejc9GxzfTqcjBq8wqTwBeGFGYAJnvv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A589F80268;
	Tue, 23 Mar 2021 04:16:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C343F8025F; Tue, 23 Mar 2021 04:16:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A834BF800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 04:16:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A834BF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Io59H/sn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AfpqJSAS"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2D63814C9;
 Mon, 22 Mar 2021 23:16:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 23:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=blU33Wl7AJMYuyse0dNuz72vTXi
 K1Gn/HhOE+tF+Exo=; b=Io59H/snkrH/WFxY3nyU6t2rS/zTj6TClC/GMgSUybG
 y3OJYYDAZWW22lc/BuTii9vfHwIPI2GTAPeMKfcBJXQrpc0pavVvhwKCXeF7GvIW
 nx6gXQvAvjMIax0kQNGBXyQZJeX0qJzNz4F1k6tQ9DYB4OX6ENKRVyAEshKr0bTd
 XBqHA4HEdTI3t7qR1DoaFQNNSROP7ivlZgAF8+jlpyH2VVBuBlmqp7aa+Gw4X6o9
 ZyLHID+LCvNypkJJBYJ1AKOvs12MyqruUIWw9i3gJN0WSCLJT4HuJdoFwUbErcac
 zAjcdtVJXhUtFMHBeheQwAxfFGdETAMiDvRdoNopVDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=blU33W
 l7AJMYuyse0dNuz72vTXiK1Gn/HhOE+tF+Exo=; b=AfpqJSASyD4RkZMbhVUm5L
 C0pFWZmXOEiGOKzL5YmlDQe14fxfGLaznZQOYzu3vVV603lPd+I/OTJaaI7rG6m9
 A/s5yMSf/qrWP3A7HbAIzNUG6KlHPgfG603TayuE1Ap/9FxNw1rrOYBdiQ4rweIW
 IGAkVKoLyLOkA6oNkwST5gHXVvh+T1hBe4CGgsqzq7mjdS8ujaftbLSLzdL27a1A
 Fmic25kjtySM/e2t1Xfq+1uL7ioJK/O8Rda5teMozcIUZ+k7ryA0J8tIm4ZXbc1C
 vtZ0ns4BMdZVEKH6cpMW/wTxR/uAaPAIcyUFnh/9nXQyfRLwL5GlYTOFYQQ+GBdg
 ==
X-ME-Sender: <xms:kl1ZYPpYiuPhdkmstsOf1Jamtu6PDRIAhJIyHc9GCr51-YvrOuqWoA>
 <xme:kl1ZYJqaRkg6ArVu9oNgaA4a82lQX_tK6z-M3ke4XhT3UObE7dI0atnIb6VNCrNvV
 FJLfbp5ZZ0lffMXWYU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeghedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepkeettdehgf
 eikeefvdehveeltdevtdejgfethfdvfeegueeiudfhgfehhfeftdfgnecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghdpudefleegthgrrdhorhhgpdhgihhthhhusgdrtghomhdpgh
 grrhgvuhhsrdhorhhgpdgurghpthgvtghhnhholhhoghihrdgtohhmpdgrlhhsrgdqphhr
 ohhjvggtthdrohhrghenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghk
 rghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:kl1ZYMOHTj7Ag3OHc4iXKp6RI307rZnWqd3hg-6t7HHxqWZT_3pGbA>
 <xmx:kl1ZYC5sEJyZut-wGrNHVjDopx37mvIR93JulCzFiGuTaFnmXXe0ZQ>
 <xmx:kl1ZYO4n2w7RWVcS1uvlRxTPb6yLcHmhgsllgwOuHe1nVvG_N-kaZg>
 <xmx:kl1ZYLXGJZmgJEeFKOeCrpWixYAzHRntTIc6shYY7nFNoUrwPweQWQ>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C348108005F;
 Mon, 22 Mar 2021 23:16:33 -0400 (EDT)
Date: Tue, 23 Mar 2021 12:16:30 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: paul@neyrinck.com
Subject: Re: 003 Firewire Isoch Rate Matching
Message-ID: <20210323031630.GA4901@workstation>
Mail-Followup-To: paul@neyrinck.com, alsa-devel@alsa-project.org
References: <20210320081623.GA319337@workstation>
 <1C889443-2977-4ABA-ABA5-A45D1024A50D@neyrinck.com>
 <20210321020454.GA330036@workstation>
 <1616397057.672725255@apps.rackspace.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616397057.672725255@apps.rackspace.com>
Cc: alsa-devel@alsa-project.org
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
(C.C. to alsa-devel, for someone interested in the topic)

On Mon, Mar 22, 2021 at 03:10:57AM -0400, paul@neyrinck.com wrote:
> Hi Takashi. It is nice to hear back from you.
> 
> > The specific point of payload in isochronous packet from the model is that
> > audio data frame is encoded by specific way. We call it as
> > 'double-oh-three' algorithm and your can see its detail in Robin Gareus's
> > documentation[4], who worked for reverse-engineering. You can see current
> > implementation in 'sound/firewire/digi00x/amdtp-dot.c'.
> 
> Yes, I see the middle byte encryption. But I am ignoring it for now while
> I try to trying to get streaming to operate. I assume that I should be
> able to first implement audio streaming and then implement the encryption
> later.
> 
> > Another point is that the sequence of number of data blocks per packet does
> > not follow to IEC 61883-1/6. In this point, it's a mutation.
> 
> Can you point me to the code that manages this? This is not something I
> understand yet and I think I need more information.
>
> > The way to start/keep/stop a pair of isochronous communication is not so
> > complicated and you can see it in `sound/firewire/digi00x/digi00x-stream.c`.
> 
> I have the "start/keep" part working. My code streams talker packets of 19
> channels (1 MIDI + 18 24-bit audio). The 003 1394 LED changes from
> flashing to constantly ON, but the audio output of the 003 is very
> bad...just audio glitches. I looked at the FireWire analyzer image on
> Robin Gareus' web page. But it shows a small sample.
> 
> Are there any FireWire analyzer data files available to look at to help
> me understand the protocols?
 
On Mon, Mar 22, 2021 at 20:07:50PM -0400, paul@neyrinck.com wrote:
> I have a question about something I do not understand. Does the 003
> require configuration of PCR (Plug Control Registers)? I am ignoring
> this (because I don't understand it yet).

At first, I describe the way to management a pair of isochronous packet
streaming for the target device.

Any registers of PCR is not used by 002/003. Instead, quadlet write
operation to registers of target device is used for the equivalent
operations:

 * 0x'ffff'e000'0110: sampling transfer frequency
 * 0x'ffff'e000'0100: registration for a pair of isochronous channels
 * 0x'ffff'e000'0004: start/stop packet streaming (The LED turns on/off).
 * 0x'ffff'e000'0000: current status of packet streaming

Then the target device starts to transfer isochronous packet to IEEE
1394 bus, and listen to isochronous packet from IEEE 1394 bus, according
to registered isochronous channels. You can see current implementation
in begin_session() helper function in
'sound/firewire/digi00x/digi00x-stream.c'[1].

Of course, you need to keep isochronous bandwidth and channels in
advance of packet streaming. Lock operations are used according to
specification of IEEE 1394. You need to communicate to 'isochronous
resource manager' node at current bus generation (it can differ each
generation):

 * 0x'ffff'f000'0220: bandwidth
 * 0x'ffff'f000'0224: channel 31-18
 * 0x'ffff'f000'0228: channel 17-0

I guess firewire stack on OS X has API for the above operations.

The target device has service for applications to get current sampling
rate from external inputs; e.g. S/PDIF:

 * 0x'ffff'e000'0114: rate of external clock source
 * 0x'ffff'e000'012c: detection of external clock input

The target device can also switch source of sampling clock:

 * 0x'ffff'e000'0118: source of sampling clock

The target device can switch mode of optical interface between ADAT and
S/PDIF:

 * 0x'ffff'e000'011c: optical interface mode


Next, I describe the way to process audio data frame in the isochronous
packet. One isochronous packet consists of Common Isochronous Packet
(CIP) header and payload. For example:

CIP     | quadlet
------- | ----------
header  | 0x00130032
        | 0x90020000
payload | ...
        | ...

For the fields in CIP header, please refer to IEC 61883-1/6 which came
from specification in vendor association (1394TA). Fortunately, the
updated version of ancestor specification is freely available, 'Audio and
Music Data Transmission Protocol 2.3' (1394 Trade Association, April 24,
2012, Document 2009013)[2]. The remarkable point of 002/003 case is that
SYT field is not used, thus media clock recovery is done just by the
number of data blocks in sequence of packet for base cycle time (not
cleared yet).

CIP payload consists of several number of 'data blocks' according to
current sampling transfer frequency (STF). The first quadlet of each data
block is for MIDI conformant data channel, which has sequence
multiplexing. Some multi bit linear audio data channels follows. In
detail, please refer to the above specification. The point is that
one data block has one audio data frame. In the case of 002/003,
the size of data block is:

STF      | data channel count
-------- | ------------------
44.1 kHz | 1 + 8 + 8 + 2 (MIDI/Analog/ADAT/SPDIF)
48.0 kHz | 1 + 8 + 8 + 2 (MIDI/Analog/ADAT/SPDIF)
88.2 kHz | 1 + 8 + 2 (MIDI/Analog/SPDIF)
96.0 kHz | 1 + 8 + 2 (MIDI/Analog/SPDIF)

Well, we need to adjust the number of data blocks in sequence of packet
to keep effective sampling rate (='media clock' in IEEE 1722). For this
purpose, IEC 61883-1/6 defines two ways; blocking and non-blocking. In
blocking way, an packet has fixed number of data blocks or empty packet.
An example at 44.1 STF:

isoc  | the number of data
cycle | blocks per packet
----- | -------------------
0     |  8
1     |  8
2     |  0
3     |  8
4     |  8
5     |  8
6     |  0
...   | ...

In non-blocking way, the number data blocks per packet is variable
according to sampling timing each isochronous cycle. An example at
44.1 STF:

isoc  | the number of data
cycle | blocks per packet
----- | -------------------
0     |  6
1     |  6
2     |  5
3     |  6
4     |  5
5     |  6
6     |  5
...   | ...

The above is basics of adjustment for media clock. You can see current
implementation of ALSA firewire stack in 'calculate_data_blocks()'
helper function in 'sound/firewire/amdtp-stream.c'[3]. In the
implementation, the sequence of packet to the target device is adjusted
independent of the sequence of packet from the target device. As you
issued, the lack of adjustment is the cause of pop-noise in generated
sound. We need the way to recover media clock in the sequence of packet
from the target device. But as long as I know, the way is different
between device types and models. For example, the sequence of packet
from Windows driver to 002 is different from the one to 003 in the point.
It's the reason that the issue is long standing.

Additionally, Digi 002 and 003 uses protocol mutated from the above
mechanism in the point of media clock. For example, we can see the
actual sequence of packet to the target device at 48.0 kHz STF in Robin
Gareus' post[5]. By calculating the number of data blocks according to
data block counter field in CIP header:

number of   | data
data blocks | block
            | counter
----------- | -------
-           | 0x32
7           | 0x39
7           | 0x40
5           | 0x45
5           | 0x4a
5           | 0x4f
5           | 0x54
5           | 0x59
5           | 0x5e
5           | 0x63
5           | 0x68
7           | 0x6f
7           | 0x76
7           | 0x7d
7           | 0x84
7           | 0x8b
7           | 0x92
7           | 0x99
7           | 0xa0
5           | 0xa5
5           | 0xaa
5           | 0xaf
5           | 0xb4
5           | 0xb9
5           | 0xbe
5           | 0xc3
5           | 0xc8
7           | 0xcf
7           | 0xd6
7           | 0xdd

It's neither blocking nor non-blocking. The sequence is relevant to both
of packet buffering and audio data frame buffering, thus the above
sequence the size of buffering is not something I know.

I use DAP Technology FireSpy 810[5] for packet analyzing (fortunately I
found it at bargain price in used market). The libhinoko[6] can make
your Linux box as packet analyzer and might be useful. Enough later, I'll
send you log of packet sequence for long duration (1 min or so) for 003
console and rack.

> I have a Pro Tools license on Mac and PC. I think I have an Mbox 2 Pro
> available to me. Please let me know how I can help you solve Mbox 2.

Ok, thanks. I'll post some questions about control application for
M-Box 2 Pro enough later.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/digi00x/digi00x-stream.c?h=for-next#n145
[2] http://1394ta.org/developers/publicspecs/2009013.pdf
[3] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/amdtp-stream.c?h=for-next#n342
[4] https://github.com/takaswie/snd-firewire-improve/issues/26#issuecomment-803066317
[5] https://gareus.org/wiki/digi003
[6] https://www.daptechnology.com/products/bus-analyzer/single-bus/single-bus-gen2/firespy410bt810/
[7] https://mailman.alsa-project.org/pipermail/alsa-devel/2019-April/147862.html


Regards

Takashi Sakamoto

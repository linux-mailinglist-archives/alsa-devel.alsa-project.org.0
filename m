Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F033F3FD548
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 10:21:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D8D176A;
	Wed,  1 Sep 2021 10:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D8D176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630484507;
	bh=4nS9T9VOl2v4wscOGyZ3G6JtJk+ht1le/Kz0EV0Z5EY=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LCACvzTHt2Bea/czwIQqS6sxWHrEz/qJrP6hQkyn3wqwpS/SUPjR/J3uga+zrwHAA
	 1kqsDguO3vTy6mb7SA5WT8gnJMa0hhnBEZmq8g65HDA7WP851sjNCo8H9xxYpxB092
	 XcWKnVHMbqaQ12EtusL9eNB9KmXmtkkJHp/VhrK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0AB0F80256;
	Wed,  1 Sep 2021 10:20:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75D41F80218; Wed,  1 Sep 2021 10:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0BE2F80218
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 10:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0BE2F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VxcgqsK5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Nq3j5WhH"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B4235C00F3;
 Wed,  1 Sep 2021 04:20:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 01 Sep 2021 04:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm2; bh=BrbfjQyP7t783BxWMIqg3x2C6Am2vCUDuIst+Gq9iE0=; b=Vxcgq
 sK5SDqtWRews1W/JcEkCgKlQokFE64QQ2K6BS3C5xxJ4yZpL3AOhlAUvGxeB0u5t
 sZLqE0inNixN85fhap4WCA8xIgHfbIJ3cRqbpihtSeJ8HGsWewOaXpvRHczPP2+m
 6W4nCtULn36RsQw3q/251RZ05gbNPWGgpnDWDL3oUX6CVI9CjwD3zThrIBD3kn5b
 mRW1+2h1BENOEWzPVhTKdDJV7t1cSHaM1oLXou5P5bnFmBlnZdRI8t3mT1OnlhCb
 cWRgMDR1ypyIWRDmOKeAsiT3XW5ZYM8USyBEu+4WbTibUyg+6vTLhMGZkUFKu5ha
 jTJRubM3p+4wSCc8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=BrbfjQyP7t783BxWMIqg3x2C6Am2v
 CUDuIst+Gq9iE0=; b=Nq3j5WhHroSaDiRfM7vrwtyDhEayYBfHIYWo1ssih7rch
 Xegh2waV2P/qtFZSqI2HUBfvaMAE0qPZbUPe7+A/HiitUV6e3G12u4HU1KNIdFvs
 nBa8T5ODCuJnLUBzJN5Ihc0+aArIrIM3TE36CKHxD2QwYtz03SSv5VMhdR/Cv8yZ
 F1cufsQdjwK7RBJxWEd1qKiX+aYrfM6MF2CqFd4vOV8Ccbgy+fHZVhYmsQptiHpM
 00ijsIFD2CHxf6ZAfFJI+nw1EOcLiIjSs2E6NYatkv7j0+xgiPsYpTUEPJHxb76k
 wlLXXZjs7xLG5RDEyFQwMpOsfs3OlbVJb++wwjnLA==
X-ME-Sender: <xms:tTcvYZS2V5fzxp68VwwJaluN9XlQbl-C60_cj3CBLtyN53YIN4qfoQ>
 <xme:tTcvYSzRxy6uwWSZJp2_5t5JIfpQfGkce4kolgim51VQ4LdcFmD2pGlDXWJzD7WKf
 xUFbTUTTZKGV_CzOcY>
X-ME-Received: <xmr:tTcvYe3v8WRK7XPlHWsY69Fvl0bqxN1wYT16JpasamfzRELOj8Plmj77ViXBlfXcYllWA4F13wt-aQOF8aDoBvs0H_ZOK7wb3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtuggfsehttdertd
 dtredvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvheehleffud
 efkeetvddtfeduffevudeigeduiefhfeeuvdevveehvdefffetkeenucffohhmrghinhep
 khgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdprghrtghhihhvvgdrohhrghdpud
 efleegthgrrdhorhhgpdhffhgrughordhorhhgnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjph
X-ME-Proxy: <xmx:tTcvYRCC8VGKNQfPORFdL1mD7Wfq6n1FdbcUkvXHXwq4hWnHTbPBiQ>
 <xmx:tTcvYSiFsuGOGlQhuuRlvFn_MMohZ-1cuPRUnnyQfEeuLUpxg2fPwQ>
 <xmx:tTcvYVo-a26SRYL4ChQr4IElRwEyZqi5sYpqQB_FcmtKPBb3tD4OpQ>
 <xmx:uTcvYafrGRFVReNiyV19TwJSZUAq0oHueTd8FXdi2-6BfiqiFfxGIw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 04:20:04 -0400 (EDT)
Date: Wed, 1 Sep 2021 17:20:01 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net,
 linux-audio-dev@lists.linuxaudio.org
Subject: Changes in ALSA firewire stack at Linux kernel v5.14 release
Message-ID: <f8c93441-2f24-48d3-b6e8-76dac7441b41@sloti41n14>
Mail-Followup-To: alsa-devel@alsa-project.org,
 ffado-devel@lists.sourceforge.net,
 linux-audio-dev@lists.linuxaudio.org, marcan@marcan.st,
 wagi@monom.org, stefanr@s5r6.in-berlin.de
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1126-g6962059b07-fm-20210901.001-g6962059b
Cc: marcan@marcan.st, wagi@monom.org, stefanr@s5r6.in-berlin.de
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

Dear all,

I'm a maintainer of ALSA firewire stack. Linux kernel v5.14 was out a few
days ago[1], including some changes in ALSA firewire stack. The changes
bring improvement for usage of including drivers by solving some issues.
I appreciate the users cooperating for it[2].


This message includes two topics about solved issues in the release:

1. get rid of playback noise by recovering media clock
2. allow some applications to run without periodical hardware interrupts

and another topic:

3. device aggregation


Let me describe the two topics first.

1. get rid of playback noise by recovering media clock

Many users had been reporting playback noise since the initial version of
each driver in ALSA firewire stack. The cause of the issue is complicated
to explain, but let me roughly summarize it to a point below:

 * mismatch between audio sample count in playback stream and the one
   expected by hardware

Since the initial stage of ALSA firewire stack, included drivers transfer
audio data frames per second the exact count as sampling frequency,
which is configured via ALSA PCM interface; e.g. 44.1 kHz.

But it is figured out that it is not suitable for many models. For recent
years, I've measured actual packets from/to various models with Windows
and OS X drivers[3], and realized the below phenomena. Here, the configured
frequency is called 'nominal', and the measured frequency is called
'effective'.

 * the effective frequency is not the same as the nominal frequency, less
   or greater by several audio data frames (<= 10 frames)
 * the effective frequency is not even in successive seconds for some
   models

The phenomena mean that it is not achieved to transfer samples for playback
sound by nominal frequency, and computation for even number of samples per
second for some models.

Additionally, in isochronous communication of IEEE 1394, part of models
support time stamp per isochronous packet[4]. When parsing the sequence of
time stamp and compare it to frequency of samples included in the packets,
I realize the phenomena below:

 * the phase of sample based on computed time stamp shifts during long
   packet streaming
 * before and after configuring source of sampling clock to external
   signal input such as S/PDIF, neither the effective frequency of samples
   in packets nor the sequence of time stamp in packets have difference.

The phenomena give us some insights. At least, the phase of samples is
not deterministic somehow in driver side. It is required to recover the
timing to put audio data frame into packet according to packets
transferred by the hardware. This is called 'media clock recovery'[5].

In engineering field, many method of media clock recovery has been
invented for each type of media. The way which ALSA firewire stack in
v5.14 uses is the simplest one. It is to replay the sequence in
transferred packets[6][7][8]. The result looks better. As long as I
tested, it can cover all of models supported by ALSA firewire stack.


2. allow applications to run independently of periodical hardware interrupts

ALSA PCM interface has hardware parameter for runtime of PCM substream to
process audio data frame without scheduling periodical hardware
interrupts[9]. PulseAudio and PipeWire use the function.

All of drivers[10] in ALSA firewire stack now support it. Linux FireWire
subsystem has function to flush queued packet till the most recent
isochronous cycle. The function is available in process context without
waiting for scheduled hardware interrupts, and allows drivers to achieve
the topic. In most cases, it's done by calling ioctl(2) with
SNDRV_PCM_IOCTL_HWSYNC. The call is the part of routine in usual ALSA
PCM application, thus users do not need to take extra care of it.

I think these improvements and configurable size of PCM buffer added in
Linux kernel v5.5 brings better experience to users.


The rest of topic comes from comparison to what existent userspace driver,
libffado2[11], does.


3. device aggregation

Some user pointed that it is not available with drivers in ALSA firewire
stack to aggregate several audio data stream into one stream. It is what
libffado2 does. Let me describe my opinion about it.

At first, let me start with fundamental attribute of audio data frame. In
my understanding about ALSA PCM interface, audio data frame is a unit for
audio data transmission. The audio data frame includes the specific number
of audio data depending on hardware; e.g. 2 samples for usual sound device.
The fundamental attribute of audio data frame is to include the set of
audio data sampled at the same time.

The goal of aggregating audio data stream is to construct an audio data
frame from some audio data frames for several devices. It means that one
audio data frame consists of audio data sampled at different time.

As I describe the phenomena about nominal and effective frequency, each
hardware seems to run own unique effective frequency time to time[12], at
least over IEEE 1394 bus. Additionally, we have the experience that the
hardware is not aware of sequence of packet with nominal frequency for sample
synchronization. It might be legitimate that we can not pick up audio data
frame which consists of audio data sampled at the same time even if they
are transferred at the same isochronous cycle[13].

When achieving the aggregation, we would need to loosen up the fundamental
attribute of audio data frame, by accepting the range of sampling time for
audio data in the frame, or need to implement one of resampling methods
to adjust phase of audio data to the frame.

Although the aggregation is itself superficially useful, it seems not to
be a requirement to device driver in hardware abstraction layer of general
purpose operating system. It may be over engineering.


[1] Linux 5.14
https://lore.kernel.org/lkml/CAHk-=wh75ELUu99yPkPNt+R166CK=-M4eoV+F62tW3TVgB7=4g@mail.gmail.com/

[2] The cooperation is done in my public repository in github.com:
https://github.com/takaswie/snd-firewire-improve

[3] The method is described in the message:
[alsa-devel] IEEE 1394 isoc library, libhinoko v0.1.0 release
https://lore.kernel.org/alsa-devel/20190415153053.GA32090@workstation/

[4] The resolution of time stamp is 24.576 MHz, which is the same as
specification of cycle time in IEEE 1394. The method to compute time
stamp of packet for samples in the packet is defined by IEC 61883-6.
We can see integrated document for it published by industry group:
https://web.archive.org/web/20210216003054/http://1394ta.org/wp-content/uploads/2015/07/2009013.pdf

[5] I borrow the expression from IEEE 1722. We can see specific term,
sampling transmission frequency (STF) in IEC 61883-6 to express similar idea
of the media clock.

[6] [PATCH 0/3] ALSA: firewire: media clock recovery for syt-aware devices
https://lore.kernel.org/alsa-devel/20210601081753.9191-1-o-takashi@sakamocchi.jp/

[7] [PATCH 0/6] ALSA: firewire: media clock recovery for syt-unaware devices
https://lore.kernel.org/alsa-devel/20210531025103.17880-1-o-takashi@sakamocchi.jp/

[8] [PATCH 0/3] ALSA: firewire-motu: media clock recovery for sph-aware devices
https://lore.kernel.org/alsa-devel/20210602013406.26442-1-o-takashi@sakamocchi.jp/

[9] SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP. When the PCM substream has a
flag of SNDRV_PCM_INFO_NO_PERIOD_WAKEUP, it's available.

[10] Precisely except for snd-isight.

[11] http://www.ffado.org/

[12] Precisely the hardware looks to run own unique media clock over
IEEE 1394 bus.

[13] For precise discussion, the knowledge about IEC 61883-6 and vendor
specific method for packetization is required.


Regards

Takashi Sakamoto

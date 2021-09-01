Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D80013FDE61
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 17:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C6981790;
	Wed,  1 Sep 2021 17:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C6981790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630509410;
	bh=tRNbYCTTUL/FJ1Y1maAHNZGuiIsS6TxTPzRyrdAtb/g=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MW/1q7zt+FbbaH261hnP7vTIfaVujdb7dpkTRR6pZoSR7F/OeLHddJr50jyOA+NbR
	 o2aSJLGk3nmuIZv+wPPAtqneQS3aAcHS46IFj+saf7ryO1uPaWnTly0baosyW/EhVV
	 JRV0kw8x5YA+khP33ppyNOhetk3MPNJELDfb3GgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 827E9F8051A;
	Wed,  1 Sep 2021 17:12:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 640D6F80254; Wed,  1 Sep 2021 10:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from devianza.investici.org (devianza.investici.org
 [198.167.222.108])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 080D8F80218
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 10:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 080D8F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=paranoici.org header.i=@paranoici.org
 header.b="goFnA1Yf"
Received: from mx2.investici.org (unknown [127.0.0.1])
 by devianza.investici.org (Postfix) with ESMTP id 4GzyPg1dzHz6vFQ;
 Wed,  1 Sep 2021 08:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paranoici.org;
 s=stigmate; t=1630486087;
 bh=awAzCP1LVACuf7YZJLKYEPl7EyG4ZhaMEwxWROdUWL4=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=goFnA1Yfrhq8KJD/qk17wxnxI5VT6dZbyWCmV/aA6FmWAn5S3UAm/LoRXM/UBtsim
 hhhLut1sk73qY1Mq0a089VVqnIq0Kn0gEpPkxXXSCPFuymmuK7MCc0HRFLk+PyWR8T
 RL/XbKl8bQQ36LoyfRxONhcz0rk45mCIZZajjAyo=
Received: from [198.167.222.108] (mx2.investici.org [198.167.222.108])
 (Authenticated sender: orest@paranoici.org) by localhost (Postfix) with
 ESMTPSA id 4GzyPf6QMgz6v63; Wed,  1 Sep 2021 08:48:06 +0000 (UTC)
Date: Wed, 01 Sep 2021 08:48:01 +0000
From: AreYouLoco? <areyouloco@paranoici.org>
To: ffado-devel@lists.sourceforge.net,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 alsa-devel@alsa-project.org, linux-audio-dev@lists.linuxaudio.org
Subject: =?US-ASCII?Q?Re=3A_=5BFFADO-devel=5D_Changes_in_ALSA_firew?=
 =?US-ASCII?Q?ire_stack_at_Linux_kernel_v5=2E14_release?=
In-Reply-To: <f8c93441-2f24-48d3-b6e8-76dac7441b41@sloti41n14>
References: <f8c93441-2f24-48d3-b6e8-76dac7441b41@sloti41n14>
Message-ID: <777F73EE-D50D-4EF3-A18C-046AAE69A0CB@paranoici.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 01 Sep 2021 17:12:34 +0200
Cc: wagi@monom.org
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

Is your new work going to fix: http://subversion=2Effado=2Eorg/ticket/388
Mentioned also here https://sourceforge=2Enet/p/ffado/mailman/ffado-devel/=
thread/058=2E9cabbaf88a47e6e14e3ff13d8ec61adf%40ffado=2Eorg/#msg26964819
?

I could help out testing on Mackie Onyx 1640i platform with oxford chip=2E

On September 1, 2021 8:20:01 AM UTC, Takashi Sakamoto <o-takashi@sakamocch=
i=2Ejp> wrote:
>Dear all,
>
>I'm a maintainer of ALSA firewire stack=2E Linux kernel v5=2E14 was out a=
 few
>days ago[1], including some changes in ALSA firewire stack=2E The changes
>bring improvement for usage of including drivers by solving some issues=
=2E
>I appreciate the users cooperating for it[2]=2E
>
>
>This message includes two topics about solved issues in the release:
>
>1=2E get rid of playback noise by recovering media clock
>2=2E allow some applications to run without periodical hardware interrupt=
s
>
>and another topic:
>
>3=2E device aggregation
>
>
>Let me describe the two topics first=2E
>
>1=2E get rid of playback noise by recovering media clock
>
>Many users had been reporting playback noise since the initial version of
>each driver in ALSA firewire stack=2E The cause of the issue is complicat=
ed
>to explain, but let me roughly summarize it to a point below:
>
> * mismatch between audio sample count in playback stream and the one
>   expected by hardware
>
>Since the initial stage of ALSA firewire stack, included drivers transfer
>audio data frames per second the exact count as sampling frequency,
>which is configured via ALSA PCM interface; e=2Eg=2E 44=2E1 kHz=2E
>
>But it is figured out that it is not suitable for many models=2E For rece=
nt
>years, I've measured actual packets from/to various models with Windows
>and OS X drivers[3], and realized the below phenomena=2E Here, the config=
ured
>frequency is called 'nominal', and the measured frequency is called
>'effective'=2E
>
> * the effective frequency is not the same as the nominal frequency, less
>   or greater by several audio data frames (<=3D 10 frames)
> * the effective frequency is not even in successive seconds for some
>   models
>
>The phenomena mean that it is not achieved to transfer samples for playba=
ck
>sound by nominal frequency, and computation for even number of samples pe=
r
>second for some models=2E
>
>Additionally, in isochronous communication of IEEE 1394, part of models
>support time stamp per isochronous packet[4]=2E When parsing the sequence=
 of
>time stamp and compare it to frequency of samples included in the packets=
,
>I realize the phenomena below:
>
> * the phase of sample based on computed time stamp shifts during long
>   packet streaming
> * before and after configuring source of sampling clock to external
>   signal input such as S/PDIF, neither the effective frequency of sample=
s
>   in packets nor the sequence of time stamp in packets have difference=
=2E
>
>The phenomena give us some insights=2E At least, the phase of samples is
>not deterministic somehow in driver side=2E It is required to recover the
>timing to put audio data frame into packet according to packets
>transferred by the hardware=2E This is called 'media clock recovery'[5]=
=2E
>
>In engineering field, many method of media clock recovery has been
>invented for each type of media=2E The way which ALSA firewire stack in
>v5=2E14 uses is the simplest one=2E It is to replay the sequence in
>transferred packets[6][7][8]=2E The result looks better=2E As long as I
>tested, it can cover all of models supported by ALSA firewire stack=2E
>
>
>2=2E allow applications to run independently of periodical hardware inter=
rupts
>
>ALSA PCM interface has hardware parameter for runtime of PCM substream to
>process audio data frame without scheduling periodical hardware
>interrupts[9]=2E PulseAudio and PipeWire use the function=2E
>
>All of drivers[10] in ALSA firewire stack now support it=2E Linux FireWir=
e
>subsystem has function to flush queued packet till the most recent
>isochronous cycle=2E The function is available in process context without
>waiting for scheduled hardware interrupts, and allows drivers to achieve
>the topic=2E In most cases, it's done by calling ioctl(2) with
>SNDRV_PCM_IOCTL_HWSYNC=2E The call is the part of routine in usual ALSA
>PCM application, thus users do not need to take extra care of it=2E
>
>I think these improvements and configurable size of PCM buffer added in
>Linux kernel v5=2E5 brings better experience to users=2E
>
>
>The rest of topic comes from comparison to what existent userspace driver=
,
>libffado2[11], does=2E
>
>
>3=2E device aggregation
>
>Some user pointed that it is not available with drivers in ALSA firewire
>stack to aggregate several audio data stream into one stream=2E It is wha=
t
>libffado2 does=2E Let me describe my opinion about it=2E
>
>At first, let me start with fundamental attribute of audio data frame=2E =
In
>my understanding about ALSA PCM interface, audio data frame is a unit for
>audio data transmission=2E The audio data frame includes the specific num=
ber
>of audio data depending on hardware; e=2Eg=2E 2 samples for usual sound d=
evice=2E
>The fundamental attribute of audio data frame is to include the set of
>audio data sampled at the same time=2E
>
>The goal of aggregating audio data stream is to construct an audio data
>frame from some audio data frames for several devices=2E It means that on=
e
>audio data frame consists of audio data sampled at different time=2E
>
>As I describe the phenomena about nominal and effective frequency, each
>hardware seems to run own unique effective frequency time to time[12], at
>least over IEEE 1394 bus=2E Additionally, we have the experience that the
>hardware is not aware of sequence of packet with nominal frequency for sa=
mple
>synchronization=2E It might be legitimate that we can not pick up audio d=
ata
>frame which consists of audio data sampled at the same time even if they
>are transferred at the same isochronous cycle[13]=2E
>
>When achieving the aggregation, we would need to loosen up the fundamenta=
l
>attribute of audio data frame, by accepting the range of sampling time fo=
r
>audio data in the frame, or need to implement one of resampling methods
>to adjust phase of audio data to the frame=2E
>
>Although the aggregation is itself superficially useful, it seems not to
>be a requirement to device driver in hardware abstraction layer of genera=
l
>purpose operating system=2E It may be over engineering=2E
>
>
>[1] Linux 5=2E14
>https://lore=2Ekernel=2Eorg/lkml/CAHk-=3Dwh75ELUu99yPkPNt+R166CK=3D-M4eoV=
+F62tW3TVgB7=3D4g@mail=2Egmail=2Ecom/
>
>[2] The cooperation is done in my public repository in github=2Ecom:
>https://github=2Ecom/takaswie/snd-firewire-improve
>
>[3] The method is described in the message:
>[alsa-devel] IEEE 1394 isoc library, libhinoko v0=2E1=2E0 release
>https://lore=2Ekernel=2Eorg/alsa-devel/20190415153053=2EGA32090@workstati=
on/
>
>[4] The resolution of time stamp is 24=2E576 MHz, which is the same as
>specification of cycle time in IEEE 1394=2E The method to compute time
>stamp of packet for samples in the packet is defined by IEC 61883-6=2E
>We can see integrated document for it published by industry group:
>https://web=2Earchive=2Eorg/web/20210216003054/http://1394ta=2Eorg/wp-con=
tent/uploads/2015/07/2009013=2Epdf
>
>[5] I borrow the expression from IEEE 1722=2E We can see specific term,
>sampling transmission frequency (STF) in IEC 61883-6 to express similar i=
dea
>of the media clock=2E
>
>[6] [PATCH 0/3] ALSA: firewire: media clock recovery for syt-aware device=
s
>https://lore=2Ekernel=2Eorg/alsa-devel/20210601081753=2E9191-1-o-takashi@=
sakamocchi=2Ejp/
>
>[7] [PATCH 0/6] ALSA: firewire: media clock recovery for syt-unaware devi=
ces
>https://lore=2Ekernel=2Eorg/alsa-devel/20210531025103=2E17880-1-o-takashi=
@sakamocchi=2Ejp/
>
>[8] [PATCH 0/3] ALSA: firewire-motu: media clock recovery for sph-aware d=
evices
>https://lore=2Ekernel=2Eorg/alsa-devel/20210602013406=2E26442-1-o-takashi=
@sakamocchi=2Ejp/
>
>[9] SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP=2E When the PCM substream has a
>flag of SNDRV_PCM_INFO_NO_PERIOD_WAKEUP, it's available=2E
>
>[10] Precisely except for snd-isight=2E
>
>[11] http://www=2Effado=2Eorg/
>
>[12] Precisely the hardware looks to run own unique media clock over
>IEEE 1394 bus=2E
>
>[13] For precise discussion, the knowledge about IEC 61883-6 and vendor
>specific method for packetization is required=2E
>
>
>Regards
>
>Takashi Sakamoto
>
>
>_______________________________________________
>FFADO-devel mailing list
>FFADO-devel@lists=2Esourceforge=2Enet
>https://lists=2Esourceforge=2Enet/lists/listinfo/ffado-devel

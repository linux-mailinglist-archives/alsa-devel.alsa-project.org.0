Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A36933FDE5C
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 17:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E910176B;
	Wed,  1 Sep 2021 17:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E910176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630509372;
	bh=9yf7scWnpizY8kumDneqnkujEbbxoSKcHeg7PoHtZgs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tla2L+21b4zWCU3BJcpT6qwWX2YMbtvbJyw/nW9QUEzSbjKC5OPf0Y3fKAGLq8a6g
	 8voe2CM3p4xuOwWqwS8WfOB/6OZ2XHTQ50w7eT306ReaYECNjDOUpyu7+KreeUkOF/
	 IFaPo78CTooYRKp71K3w8Mg0qM4ANZ9w4vFuXS3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B67B8F8050F;
	Wed,  1 Sep 2021 17:12:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89BC6F80254; Wed,  1 Sep 2021 14:41:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03E99F80171
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 14:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E99F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tfOyLKW0"
Received: by mail-ej1-x634.google.com with SMTP id me10so6265284ejb.11
 for <alsa-devel@alsa-project.org>; Wed, 01 Sep 2021 05:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zwYrlhHlu5W3FbB9uwDIHo2e+VUW8/ctMS3Mr8qnPP8=;
 b=tfOyLKW0zudoLwbpOjYosXVllC8+R9DHwlRl0UE5akHR6IY/Y72sjZDyisodzrZqEW
 WjWy05JJ4f/ltTbVnpmeyr37v8nxGw78/BVLeBHSJIVkkInNx4i8e5mKLSrBP6Ju1hoO
 xS5pMMX3V+CgwPMmFtcNiQrY0wkU43tT5TfEOvX+DJBk0Mxn4Q2dbxoLa1ReOxqD8Lhn
 kAoa5ApLDH5+YtiVV+n6fJSvBiHlJjbnXAfv91qNdXKT9rDBYaD3FfOJdvBdcw24bpDq
 cZYU3eKaIiadQ9gvtSRm19kHrFOBXkZBDcN0HCVH3+dmKo6Atad6yGUnTf22PiK02ZI/
 auLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zwYrlhHlu5W3FbB9uwDIHo2e+VUW8/ctMS3Mr8qnPP8=;
 b=BrMPO6dPT27ZplhsCAjOAm8NNuDag4jagw9ohuG2fbpjF1OzDJ9gcPQOPOGXS57td7
 Ym4J3jVwfZ3gytmOsCdcGdDrrvYtrg+MLuHOccUqqYuz5Ns+5qTLQ2y2EYGnQos5sNVk
 EXdeQ3Pe7pK5nDZHNSlY6gAuG9v7Kb8fzdUA+8j6U6RNvzp16+3Jbt9z4tDvsHhh+WnR
 maorUA0IsxG1Yc8Ts5pUNZXT+8sFMsF+OcOmTXfOfUfzLrYamJamjaQEh4fQTQmlsl4H
 ATBhk4eM9GLyWBSfrDE2SO73+RHgyMVO5MLHVEqWjOrFyrJzhnuO0Eqotaf7XwDqCeQW
 ERnA==
X-Gm-Message-State: AOAM531q5Zf8nHOoRyOttOWGCuu2S5kUvSIH1GH86zMbzgAmfNF+RqoX
 U+FAWulee88lAz/Ai/+dK2011cs7DaxrMP+eroDwOetA3SA=
X-Google-Smtp-Source: ABdhPJzeRICmezGv0MvLYde7AU1OVINvAv4mRRFpQ7vnwSrh9QxE4H6acMPUu5BY05/kc3vhE+WTi5nfGBOsRD8+PV0=
X-Received: by 2002:a17:907:212e:: with SMTP id
 qo14mr35721146ejb.501.1630500069464; 
 Wed, 01 Sep 2021 05:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <f8c93441-2f24-48d3-b6e8-76dac7441b41@sloti41n14>
In-Reply-To: <f8c93441-2f24-48d3-b6e8-76dac7441b41@sloti41n14>
From: =?UTF-8?Q?F=C3=A1bio_Wolarski?= <fabiowolarski@gmail.com>
Date: Wed, 1 Sep 2021 09:40:57 -0300
Message-ID: <CAGgA3gWqS6RNstXLcrdajAudQuuqgFiMiO7ye0sGwCv_RwtjGg@mail.gmail.com>
Subject: Re: [FFADO-devel] Changes in ALSA firewire stack at Linux kernel
 v5.14 release
To: alsa-devel@alsa-project.org, ffado-devel@lists.sourceforge.net, 
 linux-audio-dev@lists.linuxaudio.org, marcan@marcan.st, wagi@monom.org, 
 stefanr@s5r6.in-berlin.de
X-Mailman-Approved-At: Wed, 01 Sep 2021 17:12:32 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello Takashi,
I was the one creating the issue topic about the Dice/TC-Electronss device.
when you request "user's cooperation", do you mean testing/feedback?

Em qua., 1 de set. de 2021 =C3=A0s 05:36, Takashi Sakamoto <
o-takashi@sakamocchi.jp> escreveu:

> Dear all,
>
> I'm a maintainer of ALSA firewire stack. Linux kernel v5.14 was out a few
> days ago[1], including some changes in ALSA firewire stack. The changes
> bring improvement for usage of including drivers by solving some issues.
> I appreciate the users cooperating for it[2].
>
>
> This message includes two topics about solved issues in the release:
>
> 1. get rid of playback noise by recovering media clock
> 2. allow some applications to run without periodical hardware interrupts
>
> and another topic:
>
> 3. device aggregation
>
>
> Let me describe the two topics first.
>
> 1. get rid of playback noise by recovering media clock
>
> Many users had been reporting playback noise since the initial version of
> each driver in ALSA firewire stack. The cause of the issue is complicated
> to explain, but let me roughly summarize it to a point below:
>
>  * mismatch between audio sample count in playback stream and the one
>    expected by hardware
>
> Since the initial stage of ALSA firewire stack, included drivers transfer
> audio data frames per second the exact count as sampling frequency,
> which is configured via ALSA PCM interface; e.g. 44.1 kHz.
>
> But it is figured out that it is not suitable for many models. For recent
> years, I've measured actual packets from/to various models with Windows
> and OS X drivers[3], and realized the below phenomena. Here, the configur=
ed
> frequency is called 'nominal', and the measured frequency is called
> 'effective'.
>
>  * the effective frequency is not the same as the nominal frequency, less
>    or greater by several audio data frames (<=3D 10 frames)
>  * the effective frequency is not even in successive seconds for some
>    models
>
> The phenomena mean that it is not achieved to transfer samples for playba=
ck
> sound by nominal frequency, and computation for even number of samples pe=
r
> second for some models.
>
> Additionally, in isochronous communication of IEEE 1394, part of models
> support time stamp per isochronous packet[4]. When parsing the sequence o=
f
> time stamp and compare it to frequency of samples included in the packets=
,
> I realize the phenomena below:
>
>  * the phase of sample based on computed time stamp shifts during long
>    packet streaming
>  * before and after configuring source of sampling clock to external
>    signal input such as S/PDIF, neither the effective frequency of sample=
s
>    in packets nor the sequence of time stamp in packets have difference.
>
> The phenomena give us some insights. At least, the phase of samples is
> not deterministic somehow in driver side. It is required to recover the
> timing to put audio data frame into packet according to packets
> transferred by the hardware. This is called 'media clock recovery'[5].
>
> In engineering field, many method of media clock recovery has been
> invented for each type of media. The way which ALSA firewire stack in
> v5.14 uses is the simplest one. It is to replay the sequence in
> transferred packets[6][7][8]. The result looks better. As long as I
> tested, it can cover all of models supported by ALSA firewire stack.
>
>
> 2. allow applications to run independently of periodical hardware
> interrupts
>
> ALSA PCM interface has hardware parameter for runtime of PCM substream to
> process audio data frame without scheduling periodical hardware
> interrupts[9]. PulseAudio and PipeWire use the function.
>
> All of drivers[10] in ALSA firewire stack now support it. Linux FireWire
> subsystem has function to flush queued packet till the most recent
> isochronous cycle. The function is available in process context without
> waiting for scheduled hardware interrupts, and allows drivers to achieve
> the topic. In most cases, it's done by calling ioctl(2) with
> SNDRV_PCM_IOCTL_HWSYNC. The call is the part of routine in usual ALSA
> PCM application, thus users do not need to take extra care of it.
>
> I think these improvements and configurable size of PCM buffer added in
> Linux kernel v5.5 brings better experience to users.
>
>
> The rest of topic comes from comparison to what existent userspace driver=
,
> libffado2[11], does.
>
>
> 3. device aggregation
>
> Some user pointed that it is not available with drivers in ALSA firewire
> stack to aggregate several audio data stream into one stream. It is what
> libffado2 does. Let me describe my opinion about it.
>
> At first, let me start with fundamental attribute of audio data frame. In
> my understanding about ALSA PCM interface, audio data frame is a unit for
> audio data transmission. The audio data frame includes the specific numbe=
r
> of audio data depending on hardware; e.g. 2 samples for usual sound devic=
e.
> The fundamental attribute of audio data frame is to include the set of
> audio data sampled at the same time.
>
> The goal of aggregating audio data stream is to construct an audio data
> frame from some audio data frames for several devices. It means that one
> audio data frame consists of audio data sampled at different time.
>
> As I describe the phenomena about nominal and effective frequency, each
> hardware seems to run own unique effective frequency time to time[12], at
> least over IEEE 1394 bus. Additionally, we have the experience that the
> hardware is not aware of sequence of packet with nominal frequency for
> sample
> synchronization. It might be legitimate that we can not pick up audio dat=
a
> frame which consists of audio data sampled at the same time even if they
> are transferred at the same isochronous cycle[13].
>
> When achieving the aggregation, we would need to loosen up the fundamenta=
l
> attribute of audio data frame, by accepting the range of sampling time fo=
r
> audio data in the frame, or need to implement one of resampling methods
> to adjust phase of audio data to the frame.
>
> Although the aggregation is itself superficially useful, it seems not to
> be a requirement to device driver in hardware abstraction layer of genera=
l
> purpose operating system. It may be over engineering.
>
>
> [1] Linux 5.14
>
> https://lore.kernel.org/lkml/CAHk-=3Dwh75ELUu99yPkPNt+R166CK=3D-M4eoV+F62=
tW3TVgB7=3D4g@mail.gmail.com/
>
> [2] The cooperation is done in my public repository in github.com:
> https://github.com/takaswie/snd-firewire-improve
>
> [3] The method is described in the message:
> [alsa-devel] IEEE 1394 isoc library, libhinoko v0.1.0 release
> https://lore.kernel.org/alsa-devel/20190415153053.GA32090@workstation/
>
> [4] The resolution of time stamp is 24.576 MHz, which is the same as
> specification of cycle time in IEEE 1394. The method to compute time
> stamp of packet for samples in the packet is defined by IEC 61883-6.
> We can see integrated document for it published by industry group:
>
> https://web.archive.org/web/20210216003054/http://1394ta.org/wp-content/u=
ploads/2015/07/2009013.pdf
>
> [5] I borrow the expression from IEEE 1722. We can see specific term,
> sampling transmission frequency (STF) in IEC 61883-6 to express similar
> idea
> of the media clock.
>
> [6] [PATCH 0/3] ALSA: firewire: media clock recovery for syt-aware device=
s
>
> https://lore.kernel.org/alsa-devel/20210601081753.9191-1-o-takashi@sakamo=
cchi.jp/
>
> [7] [PATCH 0/6] ALSA: firewire: media clock recovery for syt-unaware
> devices
>
> https://lore.kernel.org/alsa-devel/20210531025103.17880-1-o-takashi@sakam=
occhi.jp/
>
> [8] [PATCH 0/3] ALSA: firewire-motu: media clock recovery for sph-aware
> devices
>
> https://lore.kernel.org/alsa-devel/20210602013406.26442-1-o-takashi@sakam=
occhi.jp/
>
> [9] SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP. When the PCM substream has a
> flag of SNDRV_PCM_INFO_NO_PERIOD_WAKEUP, it's available.
>
> [10] Precisely except for snd-isight.
>
> [11] http://www.ffado.org/
>
> [12] Precisely the hardware looks to run own unique media clock over
> IEEE 1394 bus.
>
> [13] For precise discussion, the knowledge about IEC 61883-6 and vendor
> specific method for packetization is required.
>
>
> Regards
>
> Takashi Sakamoto
>
>
> _______________________________________________
> FFADO-devel mailing list
> FFADO-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/ffado-devel
>

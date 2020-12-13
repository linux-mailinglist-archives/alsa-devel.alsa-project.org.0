Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC092DB260
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 18:20:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A113E17FF;
	Tue, 15 Dec 2020 18:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A113E17FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608052817;
	bh=WcAOKAJ7dXEpuaA9zLwBVsojVg8NC30Ugbg4J+GASDw=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OxHAJX9OXrTe6utuCTXYYmTr7RbuG83SVAtBT5W12IeKla+Tfnesu0DLGzL8xkLYO
	 xrwPhSrZNGay2TMSqbTivj62kb7CUeC6Pwq1DleGds3SeOXlrtoUGDHHgSZ24TepM/
	 JzIfkzEjv+MZV9kuN6JC8IbLJybNzaLHCCDkTNlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B20F8014B;
	Tue, 15 Dec 2020 18:18:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8116BF80278; Sun, 13 Dec 2020 15:11:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, PRX_BODYSUB_1, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21065F80121
 for <alsa-devel@alsa-project.org>; Sun, 13 Dec 2020 15:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21065F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Os7ol5nG"
Received: by mail-yb1-xb2b.google.com with SMTP id 82so6051331yby.6
 for <alsa-devel@alsa-project.org>; Sun, 13 Dec 2020 06:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tmKXaVVRnS5gOW3nTyBcgeNdBgDEEqQnQ3hyrw17vss=;
 b=Os7ol5nGuaTq9p07wZ2Bp3J33pPnzRiFV2ZUADJcdHqXqPHN70jO4GHDIuAZKD/04Y
 WNbE6fsEKNnrhZMUV8RVcksr9BkIk5exwSIdC3Mx0hOQHTVb7Fvc+B4KY0B/BeDrFohn
 s3gN2OcskGrndHc4bx23MYWDv7N46CQ1WhdLQKDbOWXkJ5uwJzIRFj/BayuZTMtfT/f5
 A98Ll9T5tiw7CPk3XwatBcWSQAiScc6/ciyM0ss8fnJ+TftiGl/NCtm5svJtNlURqAah
 SXjwJgPzPengRuMI1bRtP+y+G+esNPLk/zsBHRpldS/YiUxq4dudgkthqexzuINk6tJA
 ZIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tmKXaVVRnS5gOW3nTyBcgeNdBgDEEqQnQ3hyrw17vss=;
 b=uiMY+YOyteXBfi/GvNIzSfOfQMa+b3H2+5oz7xlsTLLa+Zmo5HDao6J4X2uP4nOwEL
 ybjN2P9iea69P6OtExsodSCQ11YN3UpaZDcWqmKUGdbSlpmi4Of0ClAvWa+8/amrPhsm
 JdKwcfFfWe+ONuDzppzQCyLwd1C2vOY4HdKyZefdn3yOEOr5Nsua7rQJKqCRE88LDM+T
 ojqNwjzNm8jHHX2aGHgt0zJoiDv3q7bH2JvSYUoMzyMQZEU+rwPdbztCxKt5TkUykhDo
 M6pXwJHHSsHZ2z/+n1LQ8PEkqwMWlTyfaa3Bd1ZN7XVV3kc9H5fw7bY99Vc39wS9xc2k
 j/yQ==
X-Gm-Message-State: AOAM533DuPp2KNkLp/oba2yUKdq4tChVM+Mp5uds86s6bRbzDp/r6UsU
 DaIFNKSIR2XzsQNe9FGC479Nuxl7Hlr0UD1sFtbZxkNwVb+vMA==
X-Google-Smtp-Source: ABdhPJwu4ZLC7kzYE+gA1k+U8shLe7yVLpFAQ0Cjl0Aaw51kPiK6gYJgD58so/tgAp8k/D8UA/MCWEYnN+dtw+ktGH8=
X-Received: by 2002:a5b:b0b:: with SMTP id z11mr29203276ybp.164.1607868686903; 
 Sun, 13 Dec 2020 06:11:26 -0800 (PST)
MIME-Version: 1.0
From: Spencer Kohan <spencerkohan@gmail.com>
Date: Sun, 13 Dec 2020 15:11:15 +0100
Message-ID: <CALy0E7Wqonzy4h0x5U4NycPe6oUMqohtHYJmLk4fhA12QrtH0g@mail.gmail.com>
Subject: Problem with synthesized output
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Tue, 15 Dec 2020 18:18:40 +0100
Content-Type: text/plain; charset="UTF-8"
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

Hello,

I hope I am posting this to the correct place.

I'm trying to use a Raspberry Pi as a wifi speaker, and as a first step I'm
trying to just play some sound out of a buffer through the attached amp.

I'm using an AMP2 with a RPi 4, and I'm getting some strange behavior when
I try to play any "sine" output.

So for instance, if I use `speaker-test`, I am able to play the wav test
and the pink-noise test just fine, but when I try to play the sine test, it
plays for like one quick instant, and then the program blocks.

What's strange is I get the exact same behavior when I use other methods to
try to play a sine output over ASLA.  For instance, if I use sox:

    play -n synth sine 1000

I get the same output: one quick blip of the tone, and then the program
blocks.  The output to the console looks like this:

    play WARN alsa: can't encode 0-bit Unknown or not applicable

    File Size: 0
    Encoding: n/a
    Channels: 1 @ 32-bit
    Samplerate: 48000Hz
    Replaygain: off
    Duration: unknown

    In:0.00% 00:00:00.00 [00:00:00.00] Out:0 [ | ] Clip:0

And then I get the exact same behavior when I try to do the `sio_sine`
example from [libsoundio](https://github.com/andrewrk/libsoundio), with
this output:

    Backend: ALSA
    ALSA lib pcm_dsnoop.c:575:(snd_pcm_dsnoop_open) The dsnoop plugin
supports only capture stream
    Output device: snd_rpi_hifiberry_dacplus, HiFiBerry DAC+ HiFi
pcm512x-hifi-0: Default Audio Device
    Software latency: 0.008000
    'p\n' - pause
    'u\n' - unpause
    'P\n' - pause from within callback
    'c\n' - clear buffer
    'q\n' - quit
    unable to set channel layout: incompatible device

Also interesting, when I try the [rsoundio](
https://github.com/klingtnet/rsoundio) sine example, it reports an
underflow.

My output for aplay looks like this:

    $ aplay -L

null
Discard all samples (playback) or generate zero samples (capture)
default:CARD=sndrpihifiberry
snd_rpi_hifiberry_dacplus, HiFiBerry DAC+ HiFi pcm512x-hifi-0
Default Audio Device
sysdefault:CARD=sndrpihifiberry
snd_rpi_hifiberry_dacplus, HiFiBerry DAC+ HiFi pcm512x-hifi-0
Default Audio Device
dmix:CARD=sndrpihifiberry,DEV=0
snd_rpi_hifiberry_dacplus, HiFiBerry DAC+ HiFi pcm512x-hifi-0
Direct sample mixing device
dsnoop:CARD=sndrpihifiberry,DEV=0
snd_rpi_hifiberry_dacplus, HiFiBerry DAC+ HiFi pcm512x-hifi-0
Direct sample snooping device
hw:CARD=sndrpihifiberry,DEV=0
snd_rpi_hifiberry_dacplus, HiFiBerry DAC+ HiFi pcm512x-hifi-0
Direct hardware device without any conversions
plughw:CARD=sndrpihifiberry,DEV=0
snd_rpi_hifiberry_dacplus, HiFiBerry DAC+ HiFi pcm512x-hifi-0
Hardware device with all software conversions



It's just strange because the pre-recorded sample and the pink noise
version work just fine.  How would I even go about trying to debug this?

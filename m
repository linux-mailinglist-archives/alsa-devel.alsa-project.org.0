Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C943664A9
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 07:01:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A03061688;
	Wed, 21 Apr 2021 07:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A03061688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618981302;
	bh=cQIysgBqgNbF9YctQ+xKULnSt2QcXjAZ7RkkHkhjNM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bHp3fsr3N3vfOlyxXKAyoVdMJ0edCsi/kZOQsN+dSMLFvnsEUsaP0VVSe/J1/d341
	 Qyu2o2Lrtnw2Y0Vjj+ZgRjjh08qmb7h2T0M88b+vFzvotga9yVbhB2dZ1XVK6++4EV
	 9FXX8UQXlQETSs/T+73Q+IGu4+vqoIYi/NE7APKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D452F80256;
	Wed, 21 Apr 2021 07:00:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FE62F80227; Wed, 21 Apr 2021 07:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8071EF800FE
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 07:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8071EF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fdOIbMZR"
Received: by mail-ej1-x635.google.com with SMTP id r9so61560359ejj.3
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 22:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HmjG8xZly/fjKh31foNBbCPQYbt3NP7IpE7nfLxZDo0=;
 b=fdOIbMZRC+2iDxKgc3rNoZ8snbtj21/I3s0OFsx3L+5PSa16e5BWrH6U1BMmiKyn7B
 HqLfHlgdsv+ekXPo+LwzdYu1R/MPLgHsNPARSTKKTC1X3U4OhVjVuBUeSMgSlidmALM4
 1XSFEsreRMb6XFIuXu+caVW5qvHwGzjwB97S7g4YOhKF75DfqgWRo4vcNbY3oVAowhpv
 sCgJ8QyuQwcmghNo91Z7U/vNnLdc5GTPKY2BzghZG4jvIjEuYg/M4XCBf2+3Rr84w1ot
 TA6F0UsNshdiR1k0ubXOJ5skjIgxGtynt4ehtTsGn0UDvHA8x/KJcEVHmdATViUdhZTK
 Lxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HmjG8xZly/fjKh31foNBbCPQYbt3NP7IpE7nfLxZDo0=;
 b=jKILOtV4kQdvS6s5asT5ENQq5rxYTDYdaUeJyfLwGVWkbcwyvHidZWPiDNWPqnTwx/
 aens/zwCjya03Fm2cMVWwLlZTLikM/l0jLRjTg179/1zdht9aLz37QDTOr94m93qfbsH
 NSoF+Y0HcNzGXUZLA8zJGfwtG44TfqMRPVrtL08Y9/V0+EKyQyckM3apAtJw2+/apWE2
 RrvaY7oVkwFPoO3LIv4VL2D3r07QJeFxUKkxvSCfhFosjTPrp5ddcP0WyLw93mm5eBWV
 fW200DaHEYDyo7YOMFSNMX+iWwLYlhDgk6SsUkIm+AKsAhuvWA84De5OmYamakcO/7rY
 ZljQ==
X-Gm-Message-State: AOAM533K0b9fyp138sjNraMs1h1gx5AO/XeA4GOw5cAabrqCOIwe7wq6
 pInQ8/r1b8zhg+HEWtb86YPVq0AS8w1jT33etGs=
X-Google-Smtp-Source: ABdhPJz1sw33ws8HQ69db3ieeKfHukmFchPrvetervtddwpxL3+cIThFmfAHrsR6BnvxfbxgMn5C/Btx7gvqdDWyAZc=
X-Received: by 2002:a17:907:20f0:: with SMTP id
 rh16mr32452578ejb.320.1618981202100; 
 Tue, 20 Apr 2021 22:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210414083255.9527-1-tiwai@suse.de>
 <CAHXb3beNczUn-KWfO9P1Pa5+3piR8fDYHvoH5G08GmcvgR4Lxw@mail.gmail.com>
 <5949663.lOV4Wx5bFT@kam-desktop>
 <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
 <CAOsVg8pY80Vgi1XhzzFmQ4bBxK+1boksw7RM7_avMd4hqE0ERQ@mail.gmail.com>
 <s5h7dkwdib8.wl-tiwai@suse.de>
In-Reply-To: <s5h7dkwdib8.wl-tiwai@suse.de>
From: Lucas <jaffa225man@gmail.com>
Date: Tue, 20 Apr 2021 23:59:51 -0500
Message-ID: <CAOsVg8qs+UZ2+G_0Pq=Vm87E+75jYg4Fg4eAaNTJzs=wFE5WAw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS
 devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, "Keith A. Milner" <maillist@superlative.org>
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

First, thanks very much for trying to cover all devices through detection!
I had hoped something like this could be done, but sadly, it has created a
mixed result:

Roland VG-99 Perfect!:
arecord -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
44100 Hz, Stereo
^CAborted by signal Interrupt...

aplay -D hw:VG99 -f S24_3LE -r 44100 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
44100 Hz, Stereo


Roland INTEGRA-7 doesn't capture, but plays perfectly (only 96 kHz mode
tested):
arecord -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo
arecord: pcm_read:2153: read error: Input/output error

aplay -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./other-file.wav
Playing WAVE './other-file.wav' : Signed 32 bit Little Endian, Rate 96000
Hz, Stereo


Roland R-26 doesn't capture, but plays perfectly (only 96 kHz mode tested):
arecord -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo
arecord: pcm_read:2153: read error: Input/output error

aplay -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./other-file.wav
Playing WAVE './other-file.wav' : Signed 32 bit Little Endian, Rate 96000
Hz, Stereo


Roland Boutique D-05 doesn't capture, but plays perfectly:
arecord -D hw:Boutique -f S32_LE -r 96000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 32 bit Little Endian, Rate 96000 Hz,
Stereo
arecord: pcm_read:2153: read error: Input/output error

aplay -D hw:Boutique -f S32_LE -r 96000 -c 2 ./other-file.wav
Playing WAVE './other-file.wav' : Signed 32 bit Little Endian, Rate 96000
Hz, Stereo


EDIROL UA-4FX Perfect! (only tested 48 kHz mode):
arecord -D hw:UA4FX -f S24_3LE -r 48000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo
^CAborted by signal Interrupt...

aplay -D hw:UA4FX -f S24_3LE -r 48000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo


EDIROL UA-25EX Perfect! (only tested 48 kHz mode):
arecord -D hw:UA25EX -f S24_3LE -r 48000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo
^CAborted by signal Interrupt...

aplay -D hw:UA25EX -f S24_3LE -r 48000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo


EDIROL UA-101 full-speed (USB 1.1) and high-speed (USB 2.0) not detected
for capture or playback (only 48 kHz mode tested):
arecord -D hw:UA101 -f S32_LE -r 48000 -c 2 ./file.wav
ALSA lib pcm_hw.c:1829:(_snd_pcm_hw_open) Invalid value for card
arecord: main:830: audio open error: No such device

aplay -D hw:UA101 -f S32_LE -r 48000 -c 2 ./other-file.wav
ALSA lib pcm_hw.c:1829:(_snd_pcm_hw_open) Invalid value for card
aplay: main:830: audio open error: No such device

I'm guessing another look at "lsusb -v" would help, but don't know what to
look for and have run out of time tonight.

Thanks again Takashi,

  Lucas

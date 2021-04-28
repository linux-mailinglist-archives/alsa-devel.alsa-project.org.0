Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1896336E11D
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 23:45:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8648316B2;
	Wed, 28 Apr 2021 23:44:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8648316B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619646321;
	bh=97cVVlWM1ewadURofT74If3r6KHLoHtql1IWWaSu/kk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LG6SZyvT9/xBONotDHosPjciHUmRs8kEI3caWKYtumVdTUtObPQ//sjgAoZ7UfvQv
	 rwFW4r0LSD7z6yd5I9CX6jbZbmtm0Epmf/csFO+DCJy53sApoxdnYVnCtGcfaTcCgE
	 k0rC9QaRuI3MVhI6Udip1TXXXFZUfj1zVBxcdnjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D94FCF80171;
	Wed, 28 Apr 2021 23:43:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F6F1F8016C; Wed, 28 Apr 2021 23:43:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2362F80130
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 23:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2362F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DLgSKTF5"
Received: by mail-ed1-x534.google.com with SMTP id i24so16489991edy.8
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 14:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dOJv2+dLIHoEvSfwtvn1+qWBmVZKA4/J2ApjGygoaRM=;
 b=DLgSKTF5vTapgPO5cjA/CRFJfhxPZPYCFTqtlXrersKX9YnC6DtkuS/4s3wm/QCySt
 HeCKH9Ozj1hqQbAj4cM66+PqkOiymE8JLS2CPGDdF4mgBof/9aP8VOEFUrS8pNyGSpWT
 p/kRHjfTV+eVp8JBmVkF3ayuXYRERVO0EwuYo5Tivts4zbRs8vlKTxqeZSE7I/onx2o/
 vYM4HlSBLorq6bWSuuyq4boYoXe8Dd2YxzhZHn5Fb9sp4zptyL39H0VFr65pmNAKqccU
 r4+ryZgSXQ+728Q2E7ZpbJvrQJik94ESw3H1Gp/CJIpZGZF92wslLrRuE7gBSkwMu643
 6CmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dOJv2+dLIHoEvSfwtvn1+qWBmVZKA4/J2ApjGygoaRM=;
 b=b+3+jMXYS+2nougACbaxnCQE1AM+eCjo26yUi2dqh5R9HCTH50bDnfcjPNEc0u8k4l
 +dOPK4PXy6jP/wAJb8h6MaRlZS8/5tEVAy8xahCN4zgx2pG9JcnH/kZSILqBzovGS9p7
 M3/J3C75ddX11ttcsPZ3U07arqo2MIWN0a4WFn28rYTUn6vvrX7ila5u5ENr+p/X3WTD
 1rwcepPlW1NerbuUO4EyVJ2XXfmt63XwpaMrbRbviaBIQESxxlEE+3hfqYl8q+mfV0se
 Lzg/68BmX+W7R6ScrZ0zlX6cOiYnQ1r+MYPsHb2CLKCphAgSVWCylyBxxMdtbpsNZyrk
 d60A==
X-Gm-Message-State: AOAM532M2ql/iTmtq29VZktMGZHRWyJwGlrmaxFSJQbSIHhGOZatTb6f
 bOglpNjBFwerYfZPDhKi0JpS3bIVShBc8XRvKHA=
X-Google-Smtp-Source: ABdhPJw7NMpW6c85FCipWcHoBxJAq4OcpqTBHA+ypOuCIAMihsqwQCuFrP2ZbHqP9g9RevaV56nNfW1ca429LhehehM=
X-Received: by 2002:aa7:c7c5:: with SMTP id o5mr14122680eds.31.1619646222419; 
 Wed, 28 Apr 2021 14:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210422120413.457-1-tiwai@suse.de>
 <20210422120413.457-2-tiwai@suse.de>
 <CAHXb3bcKvPSceMuvrq-X8dUyxdrH6iAHTHq_RgTXoAAiXygwUQ@mail.gmail.com>
 <CAOsVg8rAkwLgLP_LSj6CfYG+1R2oB5-sV4KQhLJMqCEqL2wDQA@mail.gmail.com>
 <s5hlf99788o.wl-tiwai@suse.de>
 <CAOsVg8rPfh-scSmmJSVASPTw7o3vw_zZ05YzVZ_JYFJHbcOcyg@mail.gmail.com>
 <s5hlf964td3.wl-tiwai@suse.de>
 <CAOsVg8okhRKPSnSOOCjMMD4wBxFB=E1i7JaQQY0T+CfCa_Jz1g@mail.gmail.com>
 <s5him494kqr.wl-tiwai@suse.de>
In-Reply-To: <s5him494kqr.wl-tiwai@suse.de>
From: Lucas <jaffa225man@gmail.com>
Date: Wed, 28 Apr 2021 16:43:30 -0500
Message-ID: <CAOsVg8o2Ad0pZK2qrLq8=NfJYd-1swveyhrmtPN8995m-dBoKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Generic application of implicit fb
 to Roland/BOSS devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, "Keith A . Milner" <maillist@superlative.org>,
 Mike Oliphant <oliphant@nostatic.org>
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

On Mon, Apr 26, 2021 at 1:34 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Sun, 25 Apr 2021 21:23:31 +0200,
> Lucas wrote:
> >
> > That patch worked perfectly for both devices I noticed the issue on (the
> > Roland INTEGRA-7 and R-26).
>
> Great, I submitted the proper patch now.
>

Thanks for everything!  This is highly appreciated by me, and probably will
be by many others and those who won't even realize they hadn't been
supported until now.  Although it's been fun feeling useful, It'll be quite
nice to go back to a packaged kernel and save some storage space too.


> > Although unrelated, I think the other issue with the EIDROL UA-101 in
> full
> > speed mode (USB 1.1) is new since trying the 5.12.0-rc8-next-20210422
> kernel
> > branch.  Prior to that, I'd been continually patching updates to the
> mainline
> > 5.11.9 source.
>
> Hm, let me know if you find more details.
>

The kernel option "snd_ua101.dyndbg=+p" debugging details seem lacking
here, so this is the little I was able to gather:

The Edirol UA-101's full speed (USB 1.1) mode is affected, but not its high
speed (USB 2) mode, which works under these same conditions.

It only misbehaves on my USB2 ports, not my other availability of USB3.
On a working older kernel 5.9.0-1-rt-amd64 with the dyndbg above enabled, I
got a very sparse debugging log:
3:43:00 turned it on (already switched to full speed mode-USB 1.1, &
already connected to a USB2 port)

[  185.018174] usb 3-1.5: new full-speed USB device number 3 using ehci-pci
[  185.129040] usb 3-1.5: New USB device found, idVendor=0582,
idProduct=008d, bcdDevice= 1.03
[  185.129046] usb 3-1.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  185.129048] usb 3-1.5: Product: UA-101 USB1
[  185.129050] usb 3-1.5: Manufacturer: EDIROL
[  185.129052] usb 3-1.5: SerialNumber: AX85615

3:45:00 arecord -D plughw:USB1 -f S24_3LE -r 48000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo

3:47:20 ended with ctrl-c
^CAborted by signal Interrupt...

3:50:00 aplay -D plughw:USB1 -f S24_3LE -r 48000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo

3:52:03 playback ended normally

3:54:30 disconnected the USB cable

[  872.498057] usb 3-1.5: USB disconnect, device number 3



Now here's the same tests with kernel 5.12.0-rc8-next-20210422, still with
boot option "snd_ua101.dyndbg=+p".  Note the alsa device name changed from
"USB1" on the old kernel to UA101" here, but I doubt that makes the
difference:

2:12:30 turned it on (already connected to a USB2 port, probably the same
port, though its designation changed)

[  163.133264] usb 4-1.5: new full-speed USB device number 3 using ehci-pci
[  163.244115] usb 4-1.5: New USB device found, idVendor=0582,
idProduct=008d, bcdDevice= 1.03
[  163.244126] usb 4-1.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  163.244130] usb 4-1.5: Product: UA-101 USB1
[  163.244133] usb 4-1.5: Manufacturer: EDIROL
[  163.244135] usb 4-1.5: SerialNumber: AX85615
[  163.263127] usbcore: registered new interface driver snd-ua101
[  168.476496] usb 4-1.5: cannot initialize interface; error -110: unknown
error
[  173.596462] usb 4-1.5: cannot initialize interface; error -110: unknown
error
[  178.716557] usb 4-1.5: cannot initialize interface; error -110: unknown
error
[  183.836518] usb 4-1.5: cannot initialize interface; error -110: unknown
error

2:13:00 arecord -D plughw:UA101 -f S24_3LE -r 48000 -c 2 ./file.wav
arecord: main:830: audio open error: Connection timed out

[  188.956481] usb 4-1.5: cannot initialize interface; error -110: unknown
error
[  194.076450] usb 4-1.5: cannot initialize interface; error -110: unknown
error
[  199.196407] usb 4-1.5: cannot initialize interface; error -110: unknown
error

2:14:30 aplay -D plughw:UA101 -f S24_3LE -r 48000 -c 2
./Music/test-kernel-5.11.9-patched-integra-7-usb-digital-audio-all-6-demos.wav


[  285.979938] usb 4-1.5: cannot initialize interface; error -110: unknown
error

after a few seconds:
aplay: main:830: audio open error: Connection timed out

2:17:19 turned it off

[  447.489736] usb 4-1.5: USB disconnect, device number 3



Then, here, I connected it to a USB3 port (which works):

2:21:00 turned it on

[  671.310730] usb 1-1.2: new full-speed USB device number 5 using xhci_hcd
[  671.413736] usb 1-1.2: New USB device found, idVendor=0582,
idProduct=008d, bcdDevice= 1.03
[  671.413747] usb 1-1.2: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  671.413751] usb 1-1.2: Product: UA-101 USB1
[  671.413754] usb 1-1.2: Manufacturer: EDIROL
[  671.413757] usb 1-1.2: SerialNumber: AX85615

2:22:00 arecord -D plughw:UA101 -f S24_3LE -r 48000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo

2:26:09 ended it with ctrl-c
^CAborted by signal Interrupt...

2:27:30 aplay -D plughw:UA101 -f S24_3LE -r 48000 -c 2 ./file.wav
Playing WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo

2:31:40 playback ended normally

2:33:00 disconnected it

[ 1390.570021] usb 1-1.2: USB disconnect, device number 5



Later, I turned it off, changed switch to high speed (USB 2) mode (which
works), and plugged it back in to that same USB2 port with the trouble
earlier:

2:47:00 turned it on

[ 2231.706964] usb 4-1.5: new high-speed USB device number 8 using ehci-pci
[ 2231.817266] usb 4-1.5: New USB device found, idVendor=0582,
idProduct=007d, bcdDevice= 1.03
[ 2231.817277] usb 4-1.5: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[ 2231.817281] usb 4-1.5: Product: UA-101
[ 2231.817284] usb 4-1.5: Manufacturer: EDIROL
[ 2231.817287] usb 4-1.5: SerialNumber: AX85615

2:47:30 arecord -D plughw:UA101 -f S24_3LE -r 48000 -c 2 ./file.wav
Recording WAVE './file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
48000 Hz, Stereo

2:48:30 ended recording with ctl-c
^CAborted by signal Interrupt...

2:50:00 turned it off

[ 2412.517175] usb 4-1.5: USB disconnect, device number 8


Sorry if that's not enough information; it certainly seems bare to me.  I'd
be happy if you have other suggestions that could lead to better diagnosis,
though.

Thanks,

  Lucas

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 465BF28FC36
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 03:23:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6B881793;
	Fri, 16 Oct 2020 03:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6B881793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602811409;
	bh=6Yfxjm6tzBZZQbT3ZfZFDbrftzrxp0nP2WIC4ReJkTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rge9m94XpiOqQvm9CWJuXNCRUL9kwglc6Vu3O7P97Phi9bOOwc6IGozYuujci0I2l
	 Cxgrp3VPWFz2mAiQYyG9ipVXc385EbysqCL/KHNxu5bHpb83YaiBi1m5gR+Q39Efth
	 zAhLJ9SZAOQE/Omx2W+KxaxlciyjCrXwG5njhJh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B97DF80247;
	Fri, 16 Oct 2020 03:21:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B48B9F80268; Fri, 16 Oct 2020 03:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25178F8012B
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 03:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25178F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="ivOscylw"
Received: by mail-yb1-xb44.google.com with SMTP id c3so599473ybl.0
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 18:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqvVcmho31CTBOYTrbrGtWy16JAAGRsp2oA5jDN4684=;
 b=ivOscylwbi5fd8MuzJclBiYCm/kaU30Pie1RZmu2ZdnV+vnUSubleIrScQFUN1hAMn
 Qbb7wKtFeBKktx4ZbAttVp9avQ3a0O0JC0KH5Ad5dNviL6oWsAmItmBxO0aj/a4jEJ7B
 tcH8JiENLFtBogwj7waOWfksdR+ST/OCoQ6+9/zEdOX6SmyPPUbG3v+exHB4tXDIJ0+1
 k5V+Hy+3CNtwwLKCT9YrPSRWO8ulRv0ih4Q43veS1DHT5QpUs3U4GLJ+RDG0eVfYiFYc
 FjLQZa2PSV1CKnldcw4QimDjjTPYrTk0ApC4Li4zcTL2QuO6wTi55KFObr4jEeXYrxI/
 /dGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqvVcmho31CTBOYTrbrGtWy16JAAGRsp2oA5jDN4684=;
 b=DHo1v+hYvhKpqAWOEVHq5+8zdRTe56nFaivqaJYJ06vYwdEpIN7eDzU+GFHCSLTbxI
 l4opZ9aob5ERFvW2dGPs5vZGeCQyZdm+PTEfKlHl3dVO9dqcT8RpuV7Ne86lIrhMgfpb
 PLECyef+BzPUbQJHBQoPT/T7RKCRidaE1CyhvZ1TukGxcMxmAkVH93iTZyiEOd7vJJf1
 VhWJuGrX2MNgVVUb0PHV9hDaGlhqB8Wjui++hF44gsqtVgAggbgPGOMH0Qdie63t1Zo7
 Ew8DqYGAn/aaD2J3aY7tTns+Y0HnKMCILLMyLlItQUHgCQl23WYpiHkWrQvys/rSKm7u
 56kw==
X-Gm-Message-State: AOAM533Qfpf4c8kJW+QL0xf9vTGsN7m6BY44VlUMhWgkDQsBa1dVp2Vt
 rsbIOfwlkJ5Mf3WU7X2rqaH+rubkHkwujmZN0whk+w==
X-Google-Smtp-Source: ABdhPJxvCx+CcEGQSGfGpHip0R+s+guLXVMLMyO6U6nDM5ULY/JFQK9b099CtpyewTWMtjeg9i7NqUGXXsOdKw8AoAM=
X-Received: by 2002:a25:2310:: with SMTP id j16mr1739160ybj.410.1602811295137; 
 Thu, 15 Oct 2020 18:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
 <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
 <CAHXb3bf+0uKS-+aEVsgebUbYPt1wCBZ7GLAjF57BrPDHcveuQQ@mail.gmail.com>
 <CAPMdQDmE3cgu2whqTxf7pFUoQusUYJKK7xLASev8JdWD-9oypQ@mail.gmail.com>
 <CAHXb3bdrPC_v0oAEkWDR-VH7NZ3uoFdSw-dzNo_Fwy8HzeTopA@mail.gmail.com>
 <CAPMdQDmiCDWTdfpbAwM7tJL+KiPApjd0jd46yPemw04-6CQWjg@mail.gmail.com>
 <CAHXb3bfgfHDYfkYEZOKttvNkpe+frBeeogzcoA7UBT+=3wqy1g@mail.gmail.com>
 <CAPMdQDmDzisnh1dqoE-Po4ALRRDwN1dxjQXYXeBuG+fN_gctzA@mail.gmail.com>
 <CAHXb3bdHc35WcC_4=wv_zRR_r-w4=boT1vbW0tZpYpn=Kb2-KA@mail.gmail.com>
 <CAPMdQD=08UxAO2RCVContMH5wLnqhXyNDoWqwPMQS420h=EA3w@mail.gmail.com>
 <CAHXb3bceYjc95NOuhqp58OdvrpbbFD=E8FTC00ikqU4d4z-=0g@mail.gmail.com>
 <s5hk0vrpsvl.wl-tiwai@suse.de>
In-Reply-To: <s5hk0vrpsvl.wl-tiwai@suse.de>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Thu, 15 Oct 2020 18:21:24 -0700
Message-ID: <CAHXb3beS71uetxqS7DjjfKmHjrUaca_GOKO6QQyKZyGTyry4Mw@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Disable quirks for BOSS
 Katana amplifiers
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Keith Milner <maillist@superlative.org>
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

Thanks for the input, Takashi - and I completely understand the difficulty
in resolving problems for specific hardware that you don't have available.

Mike

On Thu, Oct 15, 2020 at 5:37 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 14 Oct 2020 23:49:25 +0200,
> Mike Oliphant wrote:
> >
> > Yeah, I think the work-around I found is just that - a solution that
> works
> > in my particular situation, but does not resolve what seems to be a
> deeper
> > issue with implicit feedback on these devices.
> >
> > I'd love to see a real fix, but I haven't had the time to dig more into
> the
> > code. It would be great to get some input from whoever wrote the implicit
> > feedback system in the first place.
>
> The already-in-use error is a long-standing problem of implicit fb
> implementations.  Recently the support for full duplex was introduced
> and should work in some level, but I'm afraid that it's not perfect.
> In particular, it may still depend on the order of the device opens.
>
> Unfortunately I have no hardware to test that shows the behavior, so
> it's a bit tough to debug from my side.
>
>
> thanks,
>
> Takashi
>
>
> >
> > Mike
> >
> > On Wed, Oct 14, 2020 at 1:57 PM Keith Milner <maillist@superlative.org>
> > wrote:
> >
> > > I thought I would re-try the change you made. When I tried this last
> year
> > > on my old laptop, I recall I couldn't get it working properly.
> > >
> > > This time around it works... sort of, but isn't without some
> significant
> > > issues for me. For a start, it only works in Jack. If I try to access
> the
> > > alsa device directly (for instance, using ALSA mode in Ardour or using
> > > Audacity) it doesn't work. It also fills my dmesg with error messages:
> > >
> > > [  184.089158] usb 1-4: Unable to change format on ep #8e: already in
> use
> > > [  184.089232] usb 1-4: Unable to change format on ep #8e: already in
> use
> > > [  184.089401] usb 1-4: Unable to change format on ep #8e: already in
> use
> > > [  184.089619] usb 1-4: Unable to change format on ep #8e: already in
> use
> > >
> > > So, unfortunately, whilst it seems like it's a tactical fix for some
> > > situations, it seems to be broken in other ways.
> > >
> > > When I tried it on my GT-001 I got similar results, although only one
> > > "Unable to change format on ep #8e: already in use" message this time
> > > rather than the logs getting spammed. Interestingly, I got more xruns
> with
> > > this as well.
> > >
> > > Personally I'll be going back to how I had it before with the implicit
> > > feedback disabled, as it's more reliable and functional for me, but
> it's
> > > clear this one isn't solved yet.
> > >
> > > Cheers,
> > >
> > > Keith
> > >
> > > On Wed, 14 Oct 2020 at 19:17, Mike Oliphant <oliphant@nostatic.org>
> wrote:
> > >
> > >> That's also what I see from dmesg when I use the quirk device ID
> patch.
> > >> I'm pretty sure it means that implicit feedback is not being enabled
> for
> > >> your device.
> > >>
> > >> Since these devices are designed to work with implicit feedback, the
> > >> ideal solution would be to have them work by using it, rather than
> > >> disabling it.
> > >>
> > >> That said, patching the quirk code with the extra device IDs would
> > >> make it so they at least produce output...
> > >>
> > >> The "fix" I'm currently using (linked to in my first response) makes
> the
> > >> implicit feedback code not wait to send data until it has received
> some. It
> > >> works perfectly for me, but success has been mixed for others so I
> didn't
> > >> feel comfortable submitting it as a patch.
> > >>
> > >> FYI, I did a little write-up here:
> > >>
> > >>
> > >>
> http://blog.nostatic.org/2020/01/getting-boss-gt-1-effects-processor-to.html
> > >>
> > >> It outlines my struggle with this issue - from trying the quirk ID
> patch,
> > >> to messing with the sample rate, and finally to modifying the implicit
> > >> feedback behavior.
> > >>
> > >> Mike
> > >>
> > >> On Wed, Oct 14, 2020 at 10:23 AM Mailing Lists <
> maillist@superlative.org>
> > >> wrote:
> > >>
> > >>> Hi Mike,
> > >>> I'm getting this:
> > >>>
> > >>> [Oct14 18:21] snd_usb_audio:set_format: usb 1-4: setting usb
> interface
> > >>> 1:1
> > >>> [  +0.000003] snd_usb_audio:snd_usb_add_endpoint: usb 1-4: Re-using
> EP d
> > >>> in iface 1,1 @00000000d0aa6911
> > >>> [  +0.000018] snd_usb_audio:snd_usb_endpoint_set_params: usb 1-4:
> > >>> Setting params for ep #d (type 0, 3 urbs), ret=0
> > >>> [  +0.000002] snd_usb_audio:start_endpoints: usb 1-4: Starting data
> EP
> > >>> @00000000d0aa6911
> > >>>
> > >>> Cheers,
> > >>>
> > >>> Keith
> > >>>
> > >>> On Wed, 14 Oct 2020 at 17:46, Mike Oliphant <oliphant@nostatic.org>
> > >>> wrote:
> > >>>
> > >>>> Hi Keith,
> > >>>>
> > >>>> The lsusb output just shows that the endpoint is there, but not
> that it
> > >>>> is getting connected when the device is initialized. Can you check
> dmesg
> > >>>> output when you use the device for playback?
> > >>>>
> > >>>> This is what I see from dmesg when the implicit feedback endpoint is
> > >>>> being used:
> > >>>>
> > >>>> [   26.787360] usb 1-1.1: setting usb interface 1:1
> > >>>> [   26.787367] Creating new playback data endpoint #d
> > >>>> [   26.787375] Creating new capture data endpoint #8e
> > >>>> [   26.787678] usb 1-1.1: Setting params for ep #d (type 0, 12
> urbs),
> > >>>> ret=0
> > >>>> [   26.787685] usb 1-1.1: match_endpoint_audioformats: (fmt
> @6bc43c84)
> > >>>> score 2
> > >>>> [   26.787745] usb 1-1.1: Setting params for ep #8e (type 0, 12
> urbs),
> > >>>> ret=0
> > >>>> [   26.787751] usb 1-1.1: Starting data EP @a14130b5
> > >>>> [   26.788420] usb 1-1.1: Starting sync EP @720fb7cf
> > >>>>
> > >>>> Note the "Starting sync EP".
> > >>>>
> > >>>> Mike
> > >>>>
> > >>>> On Wed, Oct 14, 2020 at 9:35 AM Mailing Lists <
> maillist@superlative.org>
> > >>>> wrote:
> > >>>>
> > >>>>> On Wed, 14 Oct 2020 at 17:12, Mike Oliphant <oliphant@nostatic.org
> >
> > >>>>> wrote:
> > >>>>>
> > >>>>>> Keith - are you getting an implicit feedback endpoint created when
> > >>>>>> you run with the patch?
> > >>>>>>
> > >>>>>
> > >>>>> Hi Mike,
> > >>>>>
> > >>>>> It appears that I do. For reference I'm on kernel 5.4.0-51:
> > >>>>>
> > >>>>> Bus 001 Device 007: ID 0582:01d6 Roland Corp. GT-1
> > >>>>> Device Descriptor:
> > >>>>>  bLength                18
> > >>>>>  bDescriptorType         1
> > >>>>>  bcdUSB               2.00
> > >>>>>  bDeviceClass          255 Vendor Specific Class
> > >>>>>  bDeviceSubClass         0
> > >>>>>  bDeviceProtocol       255
> > >>>>>  bMaxPacketSize0        64
> > >>>>>  idVendor           0x0582 Roland Corp.
> > >>>>>  idProduct          0x01d6
> > >>>>>  bcdDevice            0.00
> > >>>>>  iManufacturer           1 BOSS
> > >>>>>  iProduct                2 GT-1
> > >>>>>  iSerial                 0
> > >>>>>  bNumConfigurations      1
> > >>>>>  Configuration Descriptor:
> > >>>>>    bLength                 9
> > >>>>>    bDescriptorType         2
> > >>>>>    wTotalLength       0x00bc
> > >>>>>    bNumInterfaces          4
> > >>>>>    bConfigurationValue     1
> > >>>>>    iConfiguration          0
> > >>>>>    bmAttributes         0xc0
> > >>>>>      Self Powered
> > >>>>>    MaxPower                0mA
> > >>>>>    Interface Descriptor:
> > >>>>>      bLength                 9
> > >>>>>      bDescriptorType         4
> > >>>>>      bInterfaceNumber        0
> > >>>>>      bAlternateSetting       0
> > >>>>>      bNumEndpoints           0
> > >>>>>      bInterfaceClass       255 Vendor Specific Class
> > >>>>>      bInterfaceSubClass    255 Vendor Specific Subclass
> > >>>>>      bInterfaceProtocol      0
> > >>>>>      iInterface              0
> > >>>>>    Interface Descriptor:
> > >>>>>      bLength                 9
> > >>>>>      bDescriptorType         4
> > >>>>>      bInterfaceNumber        1
> > >>>>>      bAlternateSetting       0
> > >>>>>      bNumEndpoints           0
> > >>>>>      bInterfaceClass       255 Vendor Specific Class
> > >>>>>      bInterfaceSubClass      2
> > >>>>>      bInterfaceProtocol      2
> > >>>>>      iInterface              0
> > >>>>>      ** UNRECOGNIZED:  06 24 f1 01 00 00
> > >>>>>    Interface Descriptor:
> > >>>>>      bLength                 9
> > >>>>>      bDescriptorType         4
> > >>>>>      bInterfaceNumber        1
> > >>>>>      bAlternateSetting       1
> > >>>>>      bNumEndpoints           1
> > >>>>>      bInterfaceClass       255 Vendor Specific Class
> > >>>>>      bInterfaceSubClass      2
> > >>>>>      bInterfaceProtocol      2
> > >>>>>      iInterface              0
> > >>>>>      ** UNRECOGNIZED:  07 24 01 01 00 01 00
> > >>>>>      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
> > >>>>>      ** UNRECOGNIZED:  06 24 f1 04 16 00
> > >>>>>      Endpoint Descriptor:
> > >>>>>        bLength                 7
> > >>>>>        bDescriptorType         5
> > >>>>>        bEndpointAddress     0x0d  EP 13 OUT
> > >>>>>        bmAttributes            5
> > >>>>>          Transfer Type            Isochronous
> > >>>>>          Synch Type               Asynchronous
> > >>>>>          Usage Type               Data
> > >>>>>        wMaxPacketSize     0x0038  1x 56 bytes
> > >>>>>        bInterval               1
> > >>>>>    Interface Descriptor:
> > >>>>>      bLength                 9
> > >>>>>      bDescriptorType         4
> > >>>>>      bInterfaceNumber        2
> > >>>>>      bAlternateSetting       0
> > >>>>>      bNumEndpoints           0
> > >>>>>      bInterfaceClass       255 Vendor Specific Class
> > >>>>>      bInterfaceSubClass      2
> > >>>>>      bInterfaceProtocol      1
> > >>>>>      iInterface              0
> > >>>>>    Interface Descriptor:
> > >>>>>      bLength                 9
> > >>>>>      bDescriptorType         4
> > >>>>>      bInterfaceNumber        2
> > >>>>>      bAlternateSetting       1
> > >>>>>      bNumEndpoints           1
> > >>>>>      bInterfaceClass       255 Vendor Specific Class
> > >>>>>      bInterfaceSubClass      2
> > >>>>>      bInterfaceProtocol      1
> > >>>>>      iInterface              0
> > >>>>>      ** UNRECOGNIZED:  07 24 01 07 00 01 00
> > >>>>>      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
> > >>>>>      ** UNRECOGNIZED:  06 24 f1 04 16 00
> > >>>>>      Endpoint Descriptor:
> > >>>>>        bLength                 7
> > >>>>>        bDescriptorType         5
> > >>>>>        bEndpointAddress     0x8e  EP 14 IN
> > >>>>>        bmAttributes           37
> > >>>>>          Transfer Type            Isochronous
> > >>>>>          Synch Type               Asynchronous
> > >>>>>          Usage Type               Implicit feedback Data
> > >>>>>        wMaxPacketSize     0x0038  1x 56 bytes
> > >>>>>        bInterval               1
> > >>>>>    Interface Descriptor:
> > >>>>>      bLength                 9
> > >>>>>      bDescriptorType         4
> > >>>>>      bInterfaceNumber        3
> > >>>>>      bAlternateSetting       0
> > >>>>>      bNumEndpoints           2
> > >>>>>      bInterfaceClass       255 Vendor Specific Class
> > >>>>>      bInterfaceSubClass      3
> > >>>>>      bInterfaceProtocol      0
> > >>>>>      iInterface              0
> > >>>>>      ** UNRECOGNIZED:  06 24 f1 02 01 01
> > >>>>>      Endpoint Descriptor:
> > >>>>>        bLength                 7
> > >>>>>        bDescriptorType         5
> > >>>>>        bEndpointAddress     0x03  EP 3 OUT
> > >>>>>        bmAttributes            2
> > >>>>>          Transfer Type            Bulk
> > >>>>>          Synch Type               None
> > >>>>>          Usage Type               Data
> > >>>>>        wMaxPacketSize     0x0200  1x 512 bytes
> > >>>>>        bInterval               1
> > >>>>>      Endpoint Descriptor:
> > >>>>>        bLength                 7
> > >>>>>        bDescriptorType         5
> > >>>>>        bEndpointAddress     0x84  EP 4 IN
> > >>>>>        bmAttributes            2
> > >>>>>          Transfer Type            Bulk
> > >>>>>          Synch Type               None
> > >>>>>          Usage Type               Data
> > >>>>>        wMaxPacketSize     0x0200  1x 512 bytes
> > >>>>>        bInterval               0
> > >>>>>    Interface Descriptor:
> > >>>>>      bLength                 9
> > >>>>>      bDescriptorType         4
> > >>>>>      bInterfaceNumber        3
> > >>>>>      bAlternateSetting       1
> > >>>>>      bNumEndpoints           2
> > >>>>>      bInterfaceClass       255 Vendor Specific Class
> > >>>>>      bInterfaceSubClass      3
> > >>>>>      bInterfaceProtocol      0
> > >>>>>      iInterface              0
> > >>>>>      Endpoint Descriptor:
> > >>>>>        bLength                 7
> > >>>>>        bDescriptorType         5
> > >>>>>        bEndpointAddress     0x03  EP 3 OUT
> > >>>>>        bmAttributes            3
> > >>>>>          Transfer Type            Interrupt
> > >>>>>          Synch Type               None
> > >>>>>          Usage Type               Data
> > >>>>>        wMaxPacketSize     0x0200  1x 512 bytes
> > >>>>>        bInterval               4
> > >>>>>      Endpoint Descriptor:
> > >>>>>        bLength                 7
> > >>>>>        bDescriptorType         5
> > >>>>>        bEndpointAddress     0x85  EP 5 IN
> > >>>>>        bmAttributes            3
> > >>>>>          Transfer Type            Interrupt
> > >>>>>          Synch Type               None
> > >>>>>          Usage Type               Data
> > >>>>>        wMaxPacketSize     0x0200  1x 512 bytes
> > >>>>>        bInterval               4
> > >>>>> Device Qualifier (for other device speed):
> > >>>>>  bLength                10
> > >>>>>  bDescriptorType         6
> > >>>>>  bcdUSB               2.00
> > >>>>>  bDeviceClass          255 Vendor Specific Class
> > >>>>>  bDeviceSubClass         0
> > >>>>>  bDeviceProtocol       255
> > >>>>>  bMaxPacketSize0        64
> > >>>>>  bNumConfigurations      1
> > >>>>> can't get debug descriptor: Resource temporarily unavailable
> > >>>>> Device Status:     0x0001
> > >>>>>  Self Powered
> > >>>>>
> > >>>>>
> > >>>>> --
> > >>>>> Keith A Milner
> > >>>>>
> > >>>>
> > >>>
> > >>> --
> > >>> --
> > >>> Keith A Milner
> > >>>
> > >>
> > >
> > > --
> > > --
> > > Keith A Milner
> > >
> >
>
